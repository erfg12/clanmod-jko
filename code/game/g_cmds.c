// Copyright (C) 1999-2000 Id Software, Inc.
//
#include "g_local.h"

#include "../../ui/menudef.h"			// for the voice chats

//rww - for getting bot commands...
int AcceptBotCommand(char *cmd, gentity_t *pl);
//end rww

void BG_CycleInven(playerState_t *ps, int direction);
void BG_CycleForce(playerState_t *ps, int direction);
extern int G_ClientNumberFromArg( char *str);
extern void AddIP( char *str );

//cm Admin Control
typedef enum
{
	A_ADMINTELE = 0,
	A_SILENCE,
	A_PROTECT,
	A_ADMINBAN,
	A_ADMINKICK,
	A_G2ANIMENT,
	A_TERMINATOR,
	A_SLAY,
	A_CHANGEMAP,
	A_EMPOWER,
	A_RENAME,
	A_FORCETEAM,
	A_PUNISH,
	A_SLEEP,
	A_SLAP,
	A_LOCKTEAM,
	A_CSPRINT,
	A_MODE
} admin_type_t;

//cm Vote Control
typedef enum
{
	V_MAP_RESTART = 0,
	V_NEXTMAP,
	V_MAP,
	V_G_GAMETYPE,
	V_KICK,
	V_CLIENTKICK,
	V_G_DOWARMUP,
	V_TIMELIMIT,
	V_FRAGLIMIT
} vote_type_t;

//cm Emote Control
typedef enum
{
	E_SIT = 0,
	E_BEG,
	E_FLIP,
	E_COCKY,
	E_BOUNCE,
	E_BREAKDANCE,
	E_KNEEL,
	E_KISS,
	E_SCRATCH,
	E_DUNNO,
	E_POWER,
	E_LOL,
	E_THROW,
	E_THROW2,
	E_THROW3,
	E_SHRUG,
	E_SUPER,
	E_THUMBSDOWN,
	E_DRAW,
	E_DANCE,
	E_DANCE2,
	E_NOD,
	E_SHAKE
} emote_type_t;

#ifdef _WIN32
#include "windows.h"
#endif
#ifdef __linux__
#include <pthread.h>
#endif

//cm /rename admin command function
void uwRename(gentity_t *player, const char *newname) 
{ 
   char userinfo[MAX_INFO_STRING]; 
   int clientNum = player-g_entities;
   trap_GetUserinfo(clientNum, userinfo, sizeof(userinfo)); 
   Info_SetValueForKey(userinfo, "name", newname);
   trap_SetUserinfo(clientNum, userinfo); 
   ClientUserinfoChanged(clientNum);
}

void sendExtensionCmd(char *command, char *text, char *pipename) {
	char discordMsg[999];
	unsigned long dwWritten;
	_snprintf_s(discordMsg, sizeof(discordMsg), _TRUNCATE, "%s|%s", command, text);
	//G_Printf("[DEBUG] sending:%s connections:%i\n", discordMsg, pConnections);
	for (int i = 0; i < pConnections; i++)
	{
		if (pipename != 0 && Q_stricmp(pipename, pipeNames[i]) != 0) return;
		//G_Printf("[DEBUG] SENDING: %s TO PIPE: %s\n", discordMsg, pipeNames[i]);
#ifdef WIN32
		if (pipeHandles[i] == INVALID_HANDLE_VALUE) {
			G_Printf("%s (#%i) handle is invalid", pipeNames[i], i);
		}
		else {
			ConnectNamedPipe(pipeHandles[i], NULL);
			WriteFile(pipeHandles[i], discordMsg, 999, &dwWritten, NULL);
			//G_Printf("%s (#%i) handle is valid", pipeNames[i], i);
		}
			
#endif
#ifdef __linux__
		fd = open(fifoNames[i], O_WRONLY);
		fgets(discordMsg, 999, stdin);
		write(fifoNames[i], discordMsg, strlen(discordMsg) + 1);
		close(fifoNames[i]);
#endif
	}
}

/*
===========
G_IgnoreClientChat

Instructs all chat to be ignored by the given 
============
*/
void G_IgnoreClientChat ( int ignorer, int ignoree, qboolean ignore )
{
	// Cant ignore yourself
	if ( ignorer == ignoree )
	{
		return;
	}

	// If there is no client connected then dont bother
	if ( g_entities[ignoree].client->pers.connected != CON_CONNECTED )
	{
		return;
	}

	if ( ignore )
	{
		g_entities[ignoree].client->sess.chatIgnoreClients[ignorer/32] |= (1<<(ignorer%32));
	}
	else
	{
		g_entities[ignoree].client->sess.chatIgnoreClients[ignorer/32] &= ~(1<<(ignorer%32));
	}
}
/*
===========
G_IsClientChatIgnored

Checks to see if the given client is being ignored by a specific client
============
*/
qboolean G_IsClientChatIgnored ( int ignorer, int ignoree )
{
	if ( g_entities[ignoree].client->sess.chatIgnoreClients[ignorer/32] & (1<<(ignorer%32)) )
	{
		return qtrue;
	}

	return qfalse;
}
/*
===========
G_RemoveFromAllIgnoreLists

Clears any possible ignore flags that were set and not reset.
============
*/
void G_RemoveFromAllIgnoreLists( int ignorer ) 
{
	int i;

	for( i = 0; i < level.maxclients; i++) {
		g_entities[i].client->sess.chatIgnoreClients[ignorer/32] &= ~(1 << ( ignorer%32 ));
	}
}

void Admin_Teleport( gentity_t *ent ) {
	vec3_t		origin;
	char		buffer[MAX_TOKEN_CHARS];
	int			i;

	if ( trap_Argc() != 4 ) {
		trap_SendServerCommand( ent-g_entities, va("print \"usage: tele (X) (Y) (Z)\ntype in /origin OR /origin (name) to find out (X) (Y) (Z)\n\""));
		return;
	}

	for ( i = 0 ; i < 3 ; i++ ) {
		trap_Argv( i + 1, buffer, sizeof( buffer ) );
		origin[i] = atof( buffer );
	}

	TeleportPlayer( ent, origin, ent->client->ps.viewangles );
}

/*
==================
DeathmatchScoreboardMessage

==================
*/
void DeathmatchScoreboardMessage( gentity_t *ent ) {
	char		entry[1024];
	char		string[1400];
	int			stringlength;
	int			i, j;
	gclient_t	*cl;
	int			numSorted, scoreFlags, accuracy, perfect;

	// send the latest information on all clients
	string[0] = 0;
	stringlength = 0;
	scoreFlags = 0;

	numSorted = level.numConnectedClients;
	
	if (numSorted > MAX_CLIENT_SCORE_SEND)
	{
		numSorted = MAX_CLIENT_SCORE_SEND;
	}

	for (i=0 ; i < numSorted ; i++) {
		int		ping;

		cl = &level.clients[level.sortedClients[i]];

		if ( cl->pers.connected == CON_CONNECTING ) {
			ping = -1;
		} else {
			ping = cl->ps.ping < 999 ? cl->ps.ping : 999;
		}

		if( cl->accuracy_shots ) {
			accuracy = cl->accuracy_hits * 100 / cl->accuracy_shots;
		}
		else {
			accuracy = 0;
		}
		perfect = ( cl->ps.persistant[PERS_RANK] == 0 && cl->ps.persistant[PERS_KILLED] == 0 ) ? 1 : 0;

		Com_sprintf (entry, sizeof(entry),
			" %i %i %i %i %i %i %i %i %i %i %i %i %i %i", level.sortedClients[i],
			cl->ps.persistant[PERS_SCORE], ping, (level.time - cl->pers.enterTime)/60000,
			scoreFlags, g_entities[level.sortedClients[i]].s.powerups, accuracy, 
			cl->ps.persistant[PERS_IMPRESSIVE_COUNT],
			cl->ps.persistant[PERS_EXCELLENT_COUNT],
			cl->ps.persistant[PERS_GAUNTLET_FRAG_COUNT], 
			cl->ps.persistant[PERS_DEFEND_COUNT], 
			cl->ps.persistant[PERS_ASSIST_COUNT], 
			perfect,
			cl->ps.persistant[PERS_CAPTURES]);
		j = strlen(entry);
		if (stringlength + j > 1022)
			break;
		strcpy (string + stringlength, entry);
		stringlength += j;
	}

	//still want to know the total # of clients
	i = level.numConnectedClients;

	trap_SendServerCommand( ent-g_entities, va("scores %i %i %i%s", i, 
		level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE],
		string ) );
}


/*
==================
Cmd_Score_f

Request current scoreboard information
==================
*/
void Cmd_Score_f( gentity_t *ent ) {
	DeathmatchScoreboardMessage( ent );
}



/*
==================
CheatsOk
==================
*/
qboolean	CheatsOk( gentity_t *ent ) {
	if ( !g_cheats.integer ) {
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOCHEATS")));
		return qfalse;
	}
	if ( ent->health <= 0 ) {
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "MUSTBEALIVE")));
		return qfalse;
	}
	return qtrue;
}


/*
==================
ConcatArgs
==================
*/
char	*ConcatArgs( int start ) {
	int		i, c, tlen;
	static char	line[MAX_STRING_CHARS];
	int		len;
	char	arg[MAX_STRING_CHARS];

	len = 0;
	c = trap_Argc();
	for ( i = start ; i < c ; i++ ) {
		trap_Argv( i, arg, sizeof( arg ) );
		tlen = strlen( arg );
		if ( len + tlen >= MAX_STRING_CHARS - 1 ) {
			break;
		}
		memcpy( line + len, arg, tlen );
		len += tlen;
		if ( i != c - 1 ) {
			line[len] = ' ';
			len++;
		}
	}

	line[len] = 0;

	return line;
}

/*
==================
SanitizeString

Remove case and control characters
==================
*/
void SanitizeString( char *in, char *out ) {
	while ( *in ) {
		if ( *in == 27 ) {
			in += 2;		// skip color code
			continue;
		}
		if ( *in < 32 ) {
			in++;
			continue;
		}
		*out++ = tolower( *in++ );
	}

	*out = 0;
}

/*
==================
ClientNumberFromString

Returns a player number for either a number or name string
Returns -1 if invalid
==================
*/
int ClientNumberFromString( gentity_t *to, char *s ) {
	gclient_t	*cl;
	int			idnum;
	char		s2[MAX_STRING_CHARS];
	char		n2[MAX_STRING_CHARS];

	// numeric values are just slot numbers
	if (s[0] >= '0' && s[0] <= '9') {
		idnum = atoi( s );
		if ( idnum < 0 || idnum >= level.maxclients ) {
			trap_SendServerCommand( to-g_entities, va("print \"Bad client slot: %i\n\"", idnum));
			return -1;
		}

		cl = &level.clients[idnum];
		if ( cl->pers.connected != CON_CONNECTED ) {
			trap_SendServerCommand( to-g_entities, va("print \"Client %i is not active\n\"", idnum));
			return -1;
		}
		return idnum;
	}

	// check for a name match
	SanitizeString( s, s2 );
	for ( idnum=0,cl=level.clients ; idnum < level.maxclients ; idnum++,cl++ ) {
		if ( cl->pers.connected != CON_CONNECTED ) {
			continue;
		}
		SanitizeString( cl->pers.netname, n2 );
		if ( !strcmp( n2, s2 ) ) {
			return idnum;
		}
	}

	trap_SendServerCommand( to-g_entities, va("print \"User %s is not on the server\n\"", s));
	return -1;
}

/*
==================
Cmd_Give_f

Give items to a client
==================
*/
void Cmd_Give_f (gentity_t *ent)
{
	char		name[MAX_TOKEN_CHARS];
	gitem_t		*it;
	int			i;
	qboolean	give_all;
	gentity_t		*it_ent;
	trace_t		trace;
	char		arg[MAX_TOKEN_CHARS];

	if ( !CheatsOk( ent ) ) {
		return;
	}

	trap_Argv( 1, name, sizeof( name ) );

	if (Q_stricmp(name, "all") == 0)
		give_all = qtrue;
	else
		give_all = qfalse;

	if (give_all)
	{
		i = 0;
		while (i < HI_NUM_HOLDABLE)
		{
			ent->client->ps.stats[STAT_HOLDABLE_ITEMS] |= (1 << i);
			i++;
		}
		i = 0;
	}

	if (give_all || Q_stricmp( name, "health") == 0)
	{
		if (trap_Argc() == 3) {
			trap_Argv( 2, arg, sizeof( arg ) );
			ent->health = atoi(arg);
			if (ent->health > ent->client->ps.stats[STAT_MAX_HEALTH]) {
				ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
			}
		}
		else {
			ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
		}
		if (!give_all)
			return;
	}

	if (give_all || Q_stricmp(name, "weapons") == 0)
	{
		ent->client->ps.stats[STAT_WEAPONS] = (1 << (WP_DET_PACK+1))  - ( 1 << WP_NONE );
		if (!give_all)
			return;
	}
	
	if ( !give_all && Q_stricmp(name, "weaponnum") == 0 )
	{
		trap_Argv( 2, arg, sizeof( arg ) );
		ent->client->ps.stats[STAT_WEAPONS] |= (1 << atoi(arg));
		return;
	}

	if (give_all || Q_stricmp(name, "ammo") == 0)
	{
		int num = 999;
		if (trap_Argc() == 3) {
			trap_Argv( 2, arg, sizeof( arg ) );
			num = atoi(arg);
		}
		for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
			ent->client->ps.ammo[i] = num;
		}
		if (!give_all)
			return;
	}

	if (give_all || Q_stricmp(name, "armor") == 0)
	{
		if (trap_Argc() == 3) {
			trap_Argv( 2, arg, sizeof( arg ) );
			ent->client->ps.stats[STAT_ARMOR] = atoi(arg);
		} else {
			ent->client->ps.stats[STAT_ARMOR] = ent->client->ps.stats[STAT_MAX_HEALTH];
		}

		if (!give_all)
			return;
	}

	if (Q_stricmp(name, "excellent") == 0) {
		ent->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
		return;
	}
	if (Q_stricmp(name, "impressive") == 0) {
		ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
		return;
	}
	if (Q_stricmp(name, "gauntletaward") == 0) {
		ent->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
		return;
	}
	if (Q_stricmp(name, "defend") == 0) {
		ent->client->ps.persistant[PERS_DEFEND_COUNT]++;
		return;
	}
	if (Q_stricmp(name, "assist") == 0) {
		ent->client->ps.persistant[PERS_ASSIST_COUNT]++;
		return;
	}

	// spawn a specific item right on the player
	if ( !give_all ) {
		it = BG_FindItem (name);
		if (!it) {
			return;
		}

		it_ent = G_Spawn();
		VectorCopy( ent->r.currentOrigin, it_ent->s.origin );
		it_ent->classname = it->classname;
		G_SpawnItem (it_ent, it);
		FinishSpawningItem(it_ent );
		memset( &trace, 0, sizeof( trace ) );
		Touch_Item (it_ent, ent, &trace);
		if (it_ent->inuse) {
			G_FreeEntity( it_ent );
		}
	}
}


/*
==================
Cmd_God_f

Sets client to godmode

argv(0) god
==================
*/
void Cmd_God_f (gentity_t *ent)
{
	char	*msg;

	if ( !CheatsOk( ent ) ) {
		return;
	}

	ent->flags ^= FL_GODMODE;
	if (!(ent->flags & FL_GODMODE) )
		msg = "godmode OFF\n";
	else
		msg = "godmode ON\n";

	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
}


/*
==================
Cmd_Notarget_f

Sets client to notarget

argv(0) notarget
==================
*/
void Cmd_Notarget_f( gentity_t *ent ) {
	char	*msg;

	if ( !CheatsOk( ent ) ) {
		return;
	}

	ent->flags ^= FL_NOTARGET;
	if (!(ent->flags & FL_NOTARGET) )
		msg = "notarget OFF\n";
	else
		msg = "notarget ON\n";

	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
}


/*
==================
Cmd_Noclip_f

argv(0) noclip
==================
*/
void Cmd_Noclip_f( gentity_t *ent ) {
	char	*msg;

	if ( !CheatsOk( ent ) ) {
		return;
	}

	if ( ent->client->noclip ) {
		msg = "noclip OFF\n";
	} else {
		msg = "noclip ON\n";
	}
	ent->client->noclip = !ent->client->noclip;

	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
}


/*
==================
Cmd_LevelShot_f

This is just to help generate the level pictures
for the menus.  It goes to the intermission immediately
and sends over a command to the client to resize the view,
hide the scoreboard, and take a special screenshot
==================
*/
void Cmd_LevelShot_f( gentity_t *ent ) {
	if ( !CheatsOk( ent ) ) {
		return;
	}

	// doesn't work in single player
	if ( g_gametype.integer != 0 ) {
		trap_SendServerCommand( ent-g_entities, 
			"print \"Must be in g_gametype 0 for levelshot\n\"" );
		return;
	}

	BeginIntermission();
	trap_SendServerCommand( ent-g_entities, "clientLevelShot" );
}


/*
==================
Cmd_LevelShot_f

This is just to help generate the level pictures
for the menus.  It goes to the intermission immediately
and sends over a command to the client to resize the view,
hide the scoreboard, and take a special screenshot
==================
*/
void Cmd_TeamTask_f( gentity_t *ent ) {
	char userinfo[MAX_INFO_STRING];
	char		arg[MAX_TOKEN_CHARS];
	int task;
	int client = ent->client - level.clients;

	if ( trap_Argc() != 2 ) {
		return;
	}
	trap_Argv( 1, arg, sizeof( arg ) );
	task = atoi( arg );

	trap_GetUserinfo(client, userinfo, sizeof(userinfo));
	Info_SetValueForKey(userinfo, "teamtask", va("%d", task));
	trap_SetUserinfo(client, userinfo);
	ClientUserinfoChanged(client);
}



/*
=================
Cmd_Kill_f
=================
*/
void Cmd_Kill_f( gentity_t *ent ) {
	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
		return;
	}
	if (ent->health <= 0) {
		return;
	}
	//cm NOTE: Punished ppl cant kill themselves
	if (ent->client->pers.ampunish == qtrue || ent->client->pers.amsleep == qtrue) {
		return;
	}

	if (g_gametype.integer == GT_TOURNAMENT && level.numPlayingClients > 1 && !level.warmupTime)
	{
		if (!g_allowDuelSuicide.integer)
		{
			trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "ATTEMPTDUELKILL")) );
			return;
		}
	}

	ent->flags &= ~FL_GODMODE;
	ent->client->ps.stats[STAT_HEALTH] = ent->health = -999;
	player_die (ent, ent, ent, 100000, MOD_SUICIDE);
}

gentity_t *G_GetDuelWinner(gclient_t *client)
{
	gclient_t *wCl;
	int i;

	for ( i = 0 ; i < level.maxclients ; i++ ) {
		wCl = &level.clients[i];
		
		if (wCl && wCl != client && /*wCl->ps.clientNum != client->ps.clientNum &&*/
			wCl->pers.connected == CON_CONNECTED && wCl->sess.sessionTeam != TEAM_SPECTATOR)
		{
			return &g_entities[wCl->ps.clientNum];
		}
	}

	return NULL;
}

/*
=================
BroadCastTeamChange

Let everyone know about a team change
=================
*/
void BroadcastTeamChange( gclient_t *client, int oldTeam )
{
	client->ps.fd.forceDoInit = 1; //every time we change teams make sure our force powers are set right

	if ( client->sess.sessionTeam == TEAM_RED ) {
		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " %s\n\"",
			client->pers.netname, G_GetStripEdString("SVINGAME", "JOINEDTHEREDTEAM")) );
	} else if ( client->sess.sessionTeam == TEAM_BLUE ) {
		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " %s\n\"",
		client->pers.netname, G_GetStripEdString("SVINGAME", "JOINEDTHEBLUETEAM")));
	} else if ( client->sess.sessionTeam == TEAM_SPECTATOR && oldTeam != TEAM_SPECTATOR ) {
		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " %s\n\"",
		client->pers.netname, G_GetStripEdString("SVINGAME", "JOINEDTHESPECTATORS")));
	} else if ( client->sess.sessionTeam == TEAM_FREE ) {
		if (g_gametype.integer == GT_TOURNAMENT)
		{
			/*
			gentity_t *currentWinner = G_GetDuelWinner(client);

			if (currentWinner && currentWinner->client)
			{
				trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " %s %s\n\"",
				currentWinner->client->pers.netname, G_GetStripEdString("SVINGAME", "VERSUS"), client->pers.netname));
			}
			else
			{
				trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " %s\n\"",
				client->pers.netname, G_GetStripEdString("SVINGAME", "JOINEDTHEBATTLE")));
			}
			*/
			//NOTE: Just doing a vs. once it counts two players up
		}
		else
		{
			trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " %s\n\"",
			client->pers.netname, G_GetStripEdString("SVINGAME", "JOINEDTHEBATTLE")));
		}
	}

	G_LogPrintf ( "setteam:  %i %s %s\n",
				  client - &level.clients[0],
				  TeamName ( oldTeam ),
				  TeamName ( client->sess.sessionTeam ) );
}

/*
=================
SetTeam
=================
*/
void SetTeam( gentity_t *ent, char *s ) {
	int					team, oldTeam;
	gclient_t			*client;
	int					clientNum;
	spectatorState_t	specState;
	int					specClient;
	int					teamLeader;

	//
	// see what change is requested
	//
	client = ent->client;

	clientNum = client - level.clients;
	specClient = 0;
	specState = SPECTATOR_NOT;
	if ( !Q_stricmp( s, "scoreboard" ) || !Q_stricmp( s, "score" )  ) {
		team = TEAM_SPECTATOR;
		specState = SPECTATOR_SCOREBOARD;
	} else if ( !Q_stricmp( s, "follow1" ) ) {
		team = TEAM_SPECTATOR;
		specState = SPECTATOR_FOLLOW;
		specClient = -1;
	} else if ( !Q_stricmp( s, "follow2" ) ) {
		team = TEAM_SPECTATOR;
		specState = SPECTATOR_FOLLOW;
		specClient = -2;
	} else if ( !Q_stricmp( s, "spectator" ) || !Q_stricmp( s, "s" ) ) {
			if(level.isLockedspec ){
				trap_SendServerCommand( ent->client->ps.clientNum, va("print \"^7The ^3Spectator ^7Access has been locked!\n\""));
				trap_SendServerCommand( ent->client->ps.clientNum, va("cp \"^7Sorry, the ^3Spectator ^7Access is locked.\""));
				return;
			}
			else{
			team = TEAM_SPECTATOR;
			specState = SPECTATOR_FREE;
			}
	} else if ( g_gametype.integer >= GT_TEAM ) {
		// if running a team game, assign player to one of the teams
		specState = SPECTATOR_NOT;
		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
			if(level.isLockedred){
				trap_SendServerCommand( ent->client->ps.clientNum, va("print \"^7The ^1Red ^7team is locked!\n\""));
				trap_SendServerCommand( ent->client->ps.clientNum, va("cp \"^7Sorry, the ^1Red ^7Team has been locked.\""));
				return;
			}
			else{
				team = TEAM_RED;
			}
		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
			if(level.isLockedblue){
				trap_SendServerCommand( ent->client->ps.clientNum, va("print \"^7The ^4Blue ^7team is locked!\n\""));
				trap_SendServerCommand( ent->client->ps.clientNum, va("cp \"^7Sorry, the ^4Blue ^7Team has been locked.\""));
				return;
			}
			else{
				team = TEAM_BLUE;
			}
		} else {
			// pick the team with the least number of players
			//For now, don't do this. The legalize function will set powers properly now.
			/*
			if (g_forceBasedTeams.integer)
			{
				if (ent->client->ps.fd.forceSide == FORCE_LIGHTSIDE)
				{
					team = TEAM_BLUE;
				}
				else
				{
					team = TEAM_RED;
				}
			}
			else
			{
			*/
				team = PickTeam( clientNum );
			//}
		}

		if ( g_teamForceBalance.integer && !g_trueJedi.integer ) {
			int		counts[TEAM_NUM_TEAMS];

			counts[TEAM_BLUE] = TeamCount( ent->client->ps.clientNum, TEAM_BLUE );
			counts[TEAM_RED] = TeamCount( ent->client->ps.clientNum, TEAM_RED );

			// We allow a spread of two
			if ( team == TEAM_RED && counts[TEAM_RED] - counts[TEAM_BLUE] > 1 ) {
				//For now, don't do this. The legalize function will set powers properly now.
				/*
				if (g_forceBasedTeams.integer && ent->client->ps.fd.forceSide == FORCE_DARKSIDE)
				{
					trap_SendServerCommand( ent->client->ps.clientNum, 
						va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TOOMANYRED_SWITCH")) );
				}
				else
				*/
				{
					trap_SendServerCommand( ent->client->ps.clientNum, 
						va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TOOMANYRED")) );
				}
				return; // ignore the request
			}
			if ( team == TEAM_BLUE && counts[TEAM_BLUE] - counts[TEAM_RED] > 1 ) {
				//For now, don't do this. The legalize function will set powers properly now.
				/*
				if (g_forceBasedTeams.integer && ent->client->ps.fd.forceSide == FORCE_LIGHTSIDE)
				{
					trap_SendServerCommand( ent->client->ps.clientNum, 
						va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TOOMANYBLUE_SWITCH")) );
				}
				else
				*/
				{
					trap_SendServerCommand( ent->client->ps.clientNum, 
						va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TOOMANYBLUE")) );
				}
				return; // ignore the request
			}

			// It's ok, the team we are switching to has less or same number of players
		}

		//For now, don't do this. The legalize function will set powers properly now.
		/*
		if (g_forceBasedTeams.integer)
		{
			if (team == TEAM_BLUE && ent->client->ps.fd.forceSide != FORCE_LIGHTSIDE)
			{
				trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "MUSTBELIGHT")) );
				return;
			}
			if (team == TEAM_RED && ent->client->ps.fd.forceSide != FORCE_DARKSIDE)
			{
				trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "MUSTBEDARK")) );
				return;
			}
		}
		*/

	} else {
		// force them to spectators if there aren't any spots free
		if(level.isLockedjoin){
				trap_SendServerCommand( ent->client->ps.clientNum, va("print \"^7The ^2Join ^7team is locked!\n\""));
				trap_SendServerCommand( ent->client->ps.clientNum, va("cp \"^7Sorry, the ^2Join ^7Team has been locked.\""));
				return;
			}
			else{
		team = TEAM_FREE;
			}
	}

	// override decision if limiting the players
	if ( (g_gametype.integer == GT_TOURNAMENT)
		&& level.numNonSpectatorClients >= 2 ) {
		team = TEAM_SPECTATOR;
	} else if ( g_maxGameClients.integer > 0 && 
		level.numNonSpectatorClients >= g_maxGameClients.integer ) {
		team = TEAM_SPECTATOR;
	}

	//
	// decide if we will allow the change
	//
	oldTeam = client->sess.sessionTeam;
	if ( team == oldTeam && team != TEAM_SPECTATOR ) {
		return;
	}

	//
	// execute the team change
	//

	// if the player was dead leave the body
	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
		CopyToBodyQue(ent);
	}

	// he starts at 'base'
	client->pers.teamState.state = TEAM_BEGIN;
	if ( oldTeam != TEAM_SPECTATOR ) {
		// Kill him (makes sure he loses flags, etc)
		ent->flags &= ~FL_GODMODE;
		ent->client->ps.stats[STAT_HEALTH] = ent->health = 0;
		player_die (ent, ent, ent, 100000, MOD_SUICIDE);

	}
	// they go to the end of the line for tournements
	if ( team == TEAM_SPECTATOR ) {
		if ( (g_gametype.integer != GT_TOURNAMENT) || (oldTeam != TEAM_SPECTATOR) )	{//so you don't get dropped to the bottom of the queue for changing skins, etc.
			client->sess.spectatorTime = level.time;
		}
	}

	client->sess.sessionTeam = team;
	client->sess.spectatorState = specState;
	client->sess.spectatorClient = specClient;

	client->sess.teamLeader = qfalse;
	if ( team == TEAM_RED || team == TEAM_BLUE ) {
		teamLeader = TeamLeader( team );
		// if there is no team leader or the team leader is a bot and this client is not a bot
		if ( teamLeader == -1 || ( !(g_entities[clientNum].r.svFlags & SVF_BOT) && (g_entities[teamLeader].r.svFlags & SVF_BOT) ) ) {
			SetLeader( team, clientNum );
		}
	}
	// make sure there is a team leader on the team the player came from
	if ( oldTeam == TEAM_RED || oldTeam == TEAM_BLUE ) {
		CheckTeamLeader( oldTeam );
	}

	BroadcastTeamChange( client, oldTeam );

	// get and distribute relevent paramters
	ClientUserinfoChanged( clientNum );

	ClientBegin( clientNum, qfalse );
}

/*
=================
StopFollowing

If the client being followed leaves the game, or you just want to drop
to free floating spectator mode
=================
*/
void StopFollowing( gentity_t *ent ) {
	ent->client->ps.persistant[ PERS_TEAM ] = TEAM_SPECTATOR;	
	ent->client->sess.sessionTeam = TEAM_SPECTATOR;	
	ent->client->sess.spectatorState = SPECTATOR_FREE;
	ent->client->ps.pm_flags &= ~PMF_FOLLOW;
	ent->r.svFlags &= ~SVF_BOT;
	ent->client->ps.clientNum = ent - g_entities;
	ent->client->ps.weapon = WP_NONE;
	ent->client->ps.isJediMaster = qfalse; // major exploit if you are spectating somebody and they are JM and you reconnect
	ent->health = ent->client->ps.stats[STAT_HEALTH] = 100; // so that you don't keep dead angles if you were spectating a dead person
}

/*
=================
Cmd_Team_f
=================
*/
void Cmd_Team_f( gentity_t *ent ) {
	int			oldTeam;
	char		s[MAX_TOKEN_CHARS];

	if ( trap_Argc() != 2 ) {
		oldTeam = ent->client->sess.sessionTeam;
		switch ( oldTeam ) {
		case TEAM_BLUE:
			trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "PRINTBLUETEAM")) );
			break;
		case TEAM_RED:
			trap_SendServerCommand( ent-g_entities, va("print \"Red team\n\"", G_GetStripEdString("SVINGAME", "PRINTREDTEAM")) );
			break;
		case TEAM_FREE:
			trap_SendServerCommand( ent-g_entities, va("print \"Free team\n\"", G_GetStripEdString("SVINGAME", "PRINTFREETEAM")) );
			break;
		case TEAM_SPECTATOR:
			trap_SendServerCommand( ent-g_entities, va("print \"Spectator team\n\"", G_GetStripEdString("SVINGAME", "PRINTSPECTEAM")) );
			break;
		}
		return;
	}

	if ( ent->client->switchTeamTime > level.time ) {
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOSWITCH")) );
		return;
	}

	if (gEscaping)
	{
		return;
	}

	// if they are playing a tournement game, count as a loss
	if ( (g_gametype.integer == GT_TOURNAMENT )
		&& ent->client->sess.sessionTeam == TEAM_FREE ) {//in a tournament game
		//disallow changing teams
		trap_SendServerCommand( ent-g_entities, "print \"Cannot switch teams in Duel\n\"" );
		return;
		//FIXME: why should this be a loss???
		//ent->client->sess.losses++;
	}

	trap_Argv( 1, s, sizeof( s ) );

	SetTeam( ent, s );

	ent->client->switchTeamTime = level.time + 5000;
}

/*
=================
Cmd_Team_f
=================
*/
void Cmd_ForceChanged_f( gentity_t *ent )
{
	char fpChStr[1024];
	const char *buf;
//	Cmd_Kill_f(ent);
	if (ent->client->sess.sessionTeam == TEAM_SPECTATOR)
	{ //if it's a spec, just make the changes now
		//trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "FORCEAPPLIED")) );
		//No longer print it, as the UI calls this a lot.
		WP_InitForcePowers( ent );
		goto argCheck;
	}

	buf = G_GetStripEdString("SVINGAME", "FORCEPOWERCHANGED");

	strcpy(fpChStr, buf);

	trap_SendServerCommand( ent-g_entities, va("print \"%s%s\n\n\"", S_COLOR_GREEN, fpChStr) );

	ent->client->ps.fd.forceDoInit = 1;
argCheck:
	if (g_gametype.integer == GT_TOURNAMENT)
	{ //If this is duel, don't even bother changing team in relation to this.
		return;
	}

	if (trap_Argc() > 1)
	{
		char	arg[MAX_TOKEN_CHARS];

		trap_Argv( 1, arg, sizeof( arg ) );

		if (arg && arg[0])
		{ //if there's an arg, assume it's a combo team command from the UI.
			Cmd_Team_f(ent);
		}
	}
}

/*
=================
Cmd_Follow_f
=================
*/
void Cmd_Follow_f( gentity_t *ent ) {
	int		i;
	char	arg[MAX_TOKEN_CHARS];

	if ( trap_Argc() != 2 ) {
		if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
			StopFollowing( ent );
		}
		return;
	}

	trap_Argv( 1, arg, sizeof( arg ) );
	i = ClientNumberFromString( ent, arg );
	if ( i == -1 ) {
		return;
	}

	// can't follow self
	if ( &level.clients[ i ] == ent->client ) {
		return;
	}

	// can't follow another spectator
	if ( level.clients[ i ].sess.sessionTeam == TEAM_SPECTATOR ) {
		return;
	}

	// if they are playing a tournement game, count as a loss
	if ( (g_gametype.integer == GT_TOURNAMENT )
		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
		//WTF???
		ent->client->sess.losses++;
	}

	// first set them to spectator
	if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
		SetTeam( ent, "spectator" );
	}

	ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
	ent->client->sess.spectatorClient = i;
}

/*
=================
Cmd_FollowCycle_f
=================
*/
void Cmd_FollowCycle_f( gentity_t *ent, int dir ) {
	int		clientnum;
	int		original;

	// if they are playing a tournement game, count as a loss
	if ( (g_gametype.integer == GT_TOURNAMENT )
		&& ent->client->sess.sessionTeam == TEAM_FREE ) {\
		//WTF???
		ent->client->sess.losses++;
	}
	// first set them to spectator
	if ( ent->client->sess.spectatorState == SPECTATOR_NOT ) {
		SetTeam( ent, "spectator" );
	}

	if ( dir != 1 && dir != -1 ) {
		G_Error( "Cmd_FollowCycle_f: bad dir %i", dir );
	}

	clientnum = ent->client->sess.spectatorClient;
	original = clientnum;
	do {
		clientnum += dir;
		if ( clientnum >= level.maxclients ) {
			clientnum = 0;
		}
		if ( clientnum < 0 ) {
			clientnum = level.maxclients - 1;
		}

		// can only follow connected clients
		if ( level.clients[ clientnum ].pers.connected != CON_CONNECTED ) {
			continue;
		}

		// can't follow another spectator
		if ( level.clients[ clientnum ].sess.sessionTeam == TEAM_SPECTATOR ) {
			continue;
		}

		// this is good, we can use it
		ent->client->sess.spectatorClient = clientnum;
		ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
		return;
	} while ( clientnum != original );

	// leave it where it was
}


/*
==================
G_Say
==================
*/

static void G_SayTo( gentity_t *ent, gentity_t *other, int mode, int color, const char *name, const char *message ) {
	if (!other) {
		return;
	}
	if (!other->inuse) {
		return;
	}
	if (!other->client) {
		return;
	}
	if ( other->client->pers.connected != CON_CONNECTED ) {
		return;
	}
	if ( mode == SAY_TEAM  && !OnSameTeam(ent, other) ) {
		return;
	}
	//cm NOTE: If we're not admin, dont hear the message. etc.
	if ( mode == SAY_ADMIN && !(other->r.svFlags & SVF_ADMIN1) && !(other->r.svFlags & SVF_ADMIN2)
		 && !(other->r.svFlags & SVF_ADMIN3)) {
		return;
	}
	if ( mode == SAY_REPORT && !(other->r.svFlags & SVF_ADMIN1) && !(other->r.svFlags & SVF_ADMIN2)
		 && !(other->r.svFlags & SVF_ADMIN3)) {
		return;
	}
	if ( mode == SAY_CLAN && !(other->r.svFlags & SVF_CLAN) ) {
		return;
	}
	// no chatting to players in tournements
	if ( (g_gametype.integer == GT_TOURNAMENT )
		&& other->client->sess.sessionTeam == TEAM_FREE
		&& ent->client->sess.sessionTeam != TEAM_FREE ) {
		//Hmm, maybe some option to do so if allowed?  Or at least in developer mode...
		return;
	}

	if ( G_IsClientChatIgnored ( other->s.number, ent->s.number ) )
	{
		return;
	}

	trap_SendServerCommand( other-g_entities, va("%s \"%s%c%c%s\"", 
		mode == SAY_TEAM ? "tchat" : "chat",
		name, Q_COLOR_ESCAPE, color, message));
}

#define EC		"\x19"

void G_Say( gentity_t *ent, gentity_t *target, int mode, const char *chatText ) {
	int			j;
	gentity_t	*other;
	int			color;
	char		name[64];
	// don't let text be too long for malicious reasons
	char		text[MAX_SAY_TEXT];
	char		location[64];

	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
		mode = SAY_ALL;
	}

	switch ( mode ) {
	default:
	case SAY_ALL:
		G_LogPrintf( "say: %s: %s\n", ent->client->pers.netname, chatText );
		char discordMsg[999];
		if (!(ent->r.svFlags & SVF_BOT)) {
			_snprintf_s(discordMsg, sizeof(discordMsg), _TRUNCATE, "[JKO]%s: %s", ent->client->pers.netname, chatText);
			sendExtensionCmd("say", discordMsg, 0); //say to all extensions
		}
		Com_sprintf (name, sizeof(name), "%s%c%c"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
		color = COLOR_GREEN;
		break;
	case SAY_TEAM:
		G_LogPrintf( "sayteam: %s: %s\n", ent->client->pers.netname, chatText );
		if (Team_GetLocationMsg(ent, location, sizeof(location)))
			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC") (%s)"EC": ", 
				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location);
		else
			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC")"EC": ", 
				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
		color = COLOR_CYAN;
		break;
	case SAY_TELL:
		if (target && g_gametype.integer >= GT_TEAM &&
			target->client->sess.sessionTeam == ent->client->sess.sessionTeam &&
			Team_GetLocationMsg(ent, location, sizeof(location)))
			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"] (%s)"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location );
		else
			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"]"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
		color = COLOR_MAGENTA;
		break;
	//cm new chat types
	case SAY_ADMIN:
		if (ent->r.svFlags & SVF_ADMIN1 || ent->r.svFlags & SVF_ADMIN2 || ent->r.svFlags & SVF_ADMIN3){
		G_LogPrintf( "sayteam: <admin>[%s]: %s\n", ent->client->pers.netname, chatText );
		Com_sprintf (name, sizeof(name), EC"^3<admin>^7[%s^7]: %s", 
				ent->client->pers.netname, chatText );
		}
		else {
			return;
		}
		color = COLOR_YELLOW;
		break;
	case SAY_REPORT:
		if (cm_report.integer == 1){
		G_LogPrintf( "sayteam: <report>[%s]: %s\n", ent->client->pers.netname, chatText );
		Com_sprintf (name, sizeof(name), EC"^5<report>^7[%s^7]: %s", 
				ent->client->pers.netname, chatText );
		}
		else {
			return;
		}
		color = COLOR_CYAN;
		break;
	case SAY_CLAN:
		if (ent->r.svFlags & SVF_CLAN){
		G_LogPrintf( "sayteam: <clan>[%s]: %s\n", ent->client->pers.netname, chatText );
		Com_sprintf (name, sizeof(name), EC"^1<clan>^7[%s^7]: %s", 
				ent->client->pers.netname, chatText );
		}
		else {
			return;
		}
		color = COLOR_RED;
		break;
	}
	
	Q_strncpyz( text, chatText, sizeof(text) );

	if ( target ) {
		G_SayTo( ent, target, mode, color, name, text );
		return;
	}

	// echo the text to the console
	if ( g_dedicated.integer ) {
		G_Printf( "%s%s\n", name, text);
	}

	// send it to all the apropriate clients
	for (j = 0; j < level.maxclients; j++) {
		other = &g_entities[j];
		G_SayTo( ent, other, mode, color, name, text );
	}
}


/*
==================
Cmd_Say_f
==================
*/
static void Cmd_Say_f( gentity_t *ent, int mode, qboolean arg0 ) {
	char		*p;

	if ( trap_Argc () < 2 && !arg0 ) {
		return;
	}

	if (arg0)
	{
		p = ConcatArgs( 0 );
	}
	else
	{
		p = ConcatArgs( 1 );
	}

	G_Say( ent, NULL, mode, p );
}

/*
==================
Cmd_Tell_f
==================
*/
static void Cmd_Tell_f( gentity_t *ent ) {
	int			targetNum;
	gentity_t	*target;
	char		*p;
	char		arg[MAX_TOKEN_CHARS];

	if ( trap_Argc () < 2 ) {
		return;
	}

	trap_Argv( 1, arg, sizeof( arg ) );
	targetNum = G_ClientNumberFromArg( arg );
	if ( targetNum < 0 || targetNum >= level.maxclients ) {
		return;
	}

	target = &g_entities[targetNum];
	if ( !target || !target->inuse || !target->client ) {
		return;
	}

	p = ConcatArgs( 2 );

	G_LogPrintf( "tell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, p );
	G_Say( ent, target, SAY_TELL, p );
	// don't tell to the player self if it was already directed to this player
	// also don't send the chat back to a bot
	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
		G_Say( ent, ent, SAY_TELL, p );
	}
}


static void G_VoiceTo( gentity_t *ent, gentity_t *other, int mode, const char *id, qboolean voiceonly ) {
	int color;
	char *cmd;

	if (!other) {
		return;
	}
	if (!other->inuse) {
		return;
	}
	if (!other->client) {
		return;
	}
	if ( mode == SAY_TEAM && !OnSameTeam(ent, other) ) {
		return;
	}
	// no chatting to players in tournements
	if ( (g_gametype.integer == GT_TOURNAMENT )) {
		return;
	}

	if (mode == SAY_TEAM) {
		color = COLOR_CYAN;
		cmd = "vtchat";
	}
	else if (mode == SAY_TELL) {
		color = COLOR_MAGENTA;
		cmd = "vtell";
	}
	else {
		color = COLOR_GREEN;
		cmd = "vchat";
	}

	trap_SendServerCommand( other-g_entities, va("%s %d %d %d %s", cmd, voiceonly, ent->s.number, color, id));
}

void G_Voice( gentity_t *ent, gentity_t *target, int mode, const char *id, qboolean voiceonly ) {
	int			j;
	gentity_t	*other;

	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
		mode = SAY_ALL;
	}

	if ( target ) {
		G_VoiceTo( ent, target, mode, id, voiceonly );
		return;
	}

	// echo the text to the console
	if ( g_dedicated.integer ) {
		G_Printf( "voice: %s %s\n", ent->client->pers.netname, id);
	}

	// send it to all the apropriate clients
	for (j = 0; j < level.maxclients; j++) {
		other = &g_entities[j];
		G_VoiceTo( ent, other, mode, id, voiceonly );
	}
}

/*
==================
Cmd_Voice_f
==================
*/
static void Cmd_Voice_f( gentity_t *ent, int mode, qboolean arg0, qboolean voiceonly ) {
	char		*p;

	if ( trap_Argc () < 2 && !arg0 ) {
		return;
	}

	if (arg0)
	{
		p = ConcatArgs( 0 );
	}
	else
	{
		p = ConcatArgs( 1 );
	}

	G_Voice( ent, NULL, mode, p, voiceonly );
}

/*
==================
Cmd_VoiceTell_f
==================
*/
static void Cmd_VoiceTell_f( gentity_t *ent, qboolean voiceonly ) {
	int			targetNum;
	gentity_t	*target;
	char		*id;
	char		arg[MAX_TOKEN_CHARS];

	if ( trap_Argc () < 2 ) {
		return;
	}

	trap_Argv( 1, arg, sizeof( arg ) );
	targetNum = atoi( arg );
	if ( targetNum < 0 || targetNum >= level.maxclients ) {
		return;
	}

	target = &g_entities[targetNum];
	if ( !target || !target->inuse || !target->client ) {
		return;
	}

	id = ConcatArgs( 2 );

	G_LogPrintf( "vtell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, id );
	G_Voice( ent, target, SAY_TELL, id, voiceonly );
	// don't tell to the player self if it was already directed to this player
	// also don't send the chat back to a bot
	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
		G_Voice( ent, ent, SAY_TELL, id, voiceonly );
	}
}


/*
==================
Cmd_VoiceTaunt_f
==================
*/
static void Cmd_VoiceTaunt_f( gentity_t *ent ) {
	gentity_t *who;
	int i;

	if (!ent->client) {
		return;
	}

	// insult someone who just killed you
	if (ent->enemy && ent->enemy->client && ent->enemy->client->lastkilled_client == ent->s.number) {
		// i am a dead corpse
		if (!(ent->enemy->r.svFlags & SVF_BOT)) {
			G_Voice( ent, ent->enemy, SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
		}
		if (!(ent->r.svFlags & SVF_BOT)) {
			G_Voice( ent, ent,        SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
		}
		ent->enemy = NULL;
		return;
	}
	// insult someone you just killed
	if (ent->client->lastkilled_client >= 0 && ent->client->lastkilled_client != ent->s.number) {
		who = g_entities + ent->client->lastkilled_client;
		if (who->client) {
			// who is the person I just killed
			if (who->client->lasthurt_mod == MOD_STUN_BATON) {
				if (!(who->r.svFlags & SVF_BOT)) {
					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );	// and I killed them with a gauntlet
				}
				if (!(ent->r.svFlags & SVF_BOT)) {
					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );
				}
			} else {
				if (!(who->r.svFlags & SVF_BOT)) {
					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );	// and I killed them with something else
				}
				if (!(ent->r.svFlags & SVF_BOT)) {
					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );
				}
			}
			ent->client->lastkilled_client = -1;
			return;
		}
	}

	if (g_gametype.integer >= GT_TEAM) {
		// praise a team mate who just got a reward
		for(i = 0; i < MAX_CLIENTS; i++) {
			who = g_entities + i;
			if (who->client && who != ent && who->client->sess.sessionTeam == ent->client->sess.sessionTeam) {
				if (who->client->rewardTime > level.time) {
					if (!(who->r.svFlags & SVF_BOT)) {
						G_Voice( ent, who, SAY_TELL, VOICECHAT_PRAISE, qfalse );
					}
					if (!(ent->r.svFlags & SVF_BOT)) {
						G_Voice( ent, ent, SAY_TELL, VOICECHAT_PRAISE, qfalse );
					}
					return;
				}
			}
		}
	}

	// just say something
	G_Voice( ent, NULL, SAY_ALL, VOICECHAT_TAUNT, qfalse );
}



static char	*gc_orders[] = {
	"hold your position",
	"hold this position",
	"come here",
	"cover me",
	"guard location",
	"search and destroy",
	"report"
};

void Cmd_GameCommand_f( gentity_t *ent ) {
	int		player;
	int		order;
	char	str[MAX_TOKEN_CHARS];

	trap_Argv( 1, str, sizeof( str ) );
	player = atoi( str );
	trap_Argv( 2, str, sizeof( str ) );
	order = atoi( str );

	if ( player < 0 || player >= MAX_CLIENTS ) {
		return;
	}
	if ( order < 0 || order > sizeof(gc_orders)/sizeof(char *) ) {
		return;
	}
	G_Say( ent, &g_entities[player], SAY_TELL, gc_orders[order] );
	G_Say( ent, ent, SAY_TELL, gc_orders[order] );
}

/*
==================
Cmd_Where_f
==================
*/
void Cmd_Where_f( gentity_t *ent ) {
	trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", vtos( ent->s.origin ) ) );
}

static const char *gameNames[] = {
	"Free For All",
	"Holocron FFA",
	"Jedi Master",
	"Duel",
	"Single Player",
	"Team FFA",
	"N/A",
	"Capture the Flag",
	"Capture the Ysalamiri"
};

/*
==================
G_ClientNumberFromName

Finds the client number of the client with the given name
==================
*/
int G_ClientNumberFromName ( const char* name )
{
	char		s2[MAX_STRING_CHARS];
	char		n2[MAX_STRING_CHARS];
	int			i;
	gclient_t*	cl;

	// check for a name match
	SanitizeString( (char*)name, s2 );
	for ( i=0, cl=level.clients ; i < level.numConnectedClients ; i++, cl++ ) 
	{
		SanitizeString( cl->pers.netname, n2 );
		if ( !strcmp( n2, s2 ) ) 
		{
			return i;
		}
	}

	return -1;
}

/*
==================
SanitizeString2

Rich's revised version of SanitizeString
==================
*/
void SanitizeString2( char *in, char *out )
{
	int i = 0;
	int r = 0;

	while (in[i])
	{
		if (i >= MAX_NAME_LENGTH-1)
		{ //the ui truncates the name here..
			break;
		}

		if (in[i] == '^')
		{
			if (in[i+1] >= 48 && //'0'
				in[i+1] <= 57) //'9'
			{ //only skip it if there's a number after it for the color
				i += 2;
				continue;
			}
			else
			{ //just skip the ^
				i++;
				continue;
			}
		}

		if (in[i] < 32)
		{
			i++;
			continue;
		}

		out[r] = tolower(in[i]); //in[i];
		r++;
		i++;
	}
	out[r] = 0;
}

/*
==================
G_ClientNumberFromStrippedSubstring

Clan Mod's way to make admin command execution easier
==================
*/
int G_ClientNumberFromStrippedSubstring ( const char* name )
{
	char		s2[MAX_STRING_CHARS];
	char		n2[MAX_STRING_CHARS];
	int			i, match = -1;
	gclient_t	*cl;

	// check for a name match
	SanitizeString2( (char*)name, s2 );

	for ( i=0 ; i < level.numConnectedClients ; i++ ) 
	{
		cl=&level.clients[level.sortedClients[i]];
		SanitizeString2( cl->pers.netname, n2 );
		if ( strstr( n2, s2 ) ) 
		{
			if( match != -1 )
			{ //found more than one match
				return -2;
			}
			match = level.sortedClients[i];
		}
	}

	return match;
}

/*
==================
G_ClientNumberFromArg

Clan Mod's way to make admin command execution easier
==================
*/
int G_ClientNumberFromArg ( char* name)
{
	int client_id = 0;
	char *cp;
	
	cp = name;
	while (*cp)
	{
		if ( *cp >= '0' && *cp <= '9' ) cp++;
		else
		{
			client_id = -1; //mark as alphanumeric
			break;
		}
	}

	if ( client_id == 0 )
	{ // arg is assumed to be client number
		client_id = atoi(name);
	}

	else
	{ // arg is client name
		if ( client_id == -1 )
		{
			client_id = G_ClientNumberFromStrippedSubstring(name);
		}
	}
	return client_id;
}

/*
==================
G_ClientNumberFromStrippedName

Same as above, but strips special characters out of the names before comparing.
==================
*/
int G_ClientNumberFromStrippedName ( const char* name )
{
	char		s2[MAX_STRING_CHARS];
	char		n2[MAX_STRING_CHARS];
	int			i;
	gclient_t*	cl;

	// check for a name match
	SanitizeString2( (char*)name, s2 );
	for ( i=0, cl=level.clients ; i < level.numConnectedClients ; i++, cl++ ) 
	{
		SanitizeString2( cl->pers.netname, n2 );
		if ( !strcmp( n2, s2 ) ) 
		{
			return i;
		}
	}

	return -1;
}

/*
==================
Cmd_CallVote_f
==================
*/
void Cmd_CallVote_f( gentity_t *ent ) {
	int		i;
	char	arg1[MAX_STRING_TOKENS];
	char	arg2[MAX_STRING_TOKENS];

	if ( !g_allowVote.integer ) {
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOVOTE")) );
		return;
	}

	if ( level.voteTime ) {
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "VOTEINPROGRESS")) );
		return;
	}
	if ( ent->client->pers.voteCount >= MAX_VOTE_COUNT ) {
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "MAXVOTES")) );
		return;
	}
	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOSPECVOTE")) );
		return;
	}

	// make sure it is a valid command to vote on
	trap_Argv( 1, arg1, sizeof( arg1 ) );
	trap_Argv( 2, arg2, sizeof( arg2 ) );

	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) ) {
		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
		return;
	}

	if ( !Q_stricmp( arg1, "map_restart" ) ) {
	} else if ( !Q_stricmp( arg1, "nextmap" ) ) {
	} else if ( !Q_stricmp( arg1, "map" ) ) {
	} else if ( !Q_stricmp( arg1, "g_gametype" ) ) {
	} else if ( !Q_stricmp( arg1, "kick" ) ) {
	} else if ( !Q_stricmp( arg1, "clientkick" ) ) {
	} else if ( !Q_stricmp( arg1, "g_doWarmup" ) ) {
	} else if ( !Q_stricmp( arg1, "timelimit" ) ) {
	} else if ( !Q_stricmp( arg1, "fraglimit" ) ) {
	} else {
		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
		trap_SendServerCommand( ent-g_entities, "print \"Vote commands are: map_restart, nextmap, map <mapname>, g_gametype <n>, kick <player>, clientkick <clientnum>, g_doWarmup, timelimit <time>, fraglimit <frags>.\n\"" );
		return;
	}

	// if there is still a vote to be executed
	if ( level.voteExecuteTime ) {
		level.voteExecuteTime = 0;
		trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", level.voteString ) );
	}

	// special case for g_gametype, check for bad values
	if ( !Q_stricmp( arg1, "g_gametype" ) )
	{
		i = atoi( arg2 );

		if (!(cm_voteControl.integer & (1 << V_G_GAMETYPE)) ) {
			trap_SendServerCommand(ent-g_entities, "print \"This vote option is not allowed on this server.\n\"");
			return;
		}

		if( i == GT_SINGLE_PLAYER || i < GT_FFA || i >= GT_MAX_GAME_TYPE) {
			trap_SendServerCommand( ent-g_entities, "print \"Invalid gametype.\n\"" );
			return;
		}

		level.votingGametype = qtrue;
		level.votingGametypeTo = i;

		Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %d", arg1, i );
		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s %s", arg1, gameNames[i] );
	}
	else if ( !Q_stricmp( arg1, "map" ) ) 
	{
		// special case for map changes, we want to reset the nextmap setting
		// this allows a player to change maps, but not upset the map rotation
		char	s[MAX_STRING_CHARS];

		if (!(cm_voteControl.integer & (1 << V_MAP)) ) {
			trap_SendServerCommand(ent-g_entities, "print \"This vote option is not allowed on this server.\n\"");
			return;
		}

		if (!G_DoesMapSupportGametype(arg2, trap_Cvar_VariableIntegerValue("g_gametype")))
		{
			//trap_SendServerCommand( ent-g_entities, "print \"You can't vote for this map, it isn't supported by the current gametype.\n\"" );
			trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOVOTE_MAPNOTSUPPORTEDBYGAME")) );
			return;
		}

		trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
		if (*s) {
			Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %s; set nextmap \"%s\"", arg1, arg2, s );
		} else {
			Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %s", arg1, arg2 );
		}
		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
	}
	else if ( !Q_stricmp ( arg1, "clientkick" ) )
	{
		int n = atoi ( arg2 );

		if (!(cm_voteControl.integer & (1 << V_CLIENTKICK)) ) {
			trap_SendServerCommand(ent-g_entities, "print \"This vote option is not allowed on this server.\n\"");
			return;
		}

		if ( n < 0 || n >= MAX_CLIENTS )
		{
			trap_SendServerCommand( ent-g_entities, va("print \"invalid client number %d.\n\"", n ) );
			return;
		}

		if ( g_entities[n].client->pers.connected == CON_DISCONNECTED )
		{
			trap_SendServerCommand( ent-g_entities, va("print \"there is no client with the client number %d.\n\"", n ) );
			return;
		}
			
		Com_sprintf ( level.voteString, sizeof(level.voteString ), "%s %s", arg1, arg2 );
		Com_sprintf ( level.voteDisplayString, sizeof(level.voteDisplayString), "kick %s", g_entities[n].client->pers.netname );
	}
	else if ( !Q_stricmp ( arg1, "kick" ) )
	{
		int clientid = G_ClientNumberFromName ( arg2 );

		if (!(cm_voteControl.integer & (1 << V_KICK)) ) {
			trap_SendServerCommand(ent-g_entities, "print \"This vote option is not allowed on this server.\n\"");
			return;
		}

		if ( clientid == -1 )
		{
			clientid = G_ClientNumberFromStrippedName(arg2);

			if (clientid == -1)
			{
				trap_SendServerCommand( ent-g_entities, va("print \"there is no client named '%s' currently on the server.\n\"", arg2 ) );
				return;
			}
		}

		Com_sprintf ( level.voteString, sizeof(level.voteString ), "clientkick %d", clientid );
		Com_sprintf ( level.voteDisplayString, sizeof(level.voteDisplayString), "kick %s", g_entities[clientid].client->pers.netname );
	}
	else if ( !Q_stricmp( arg1, "nextmap" ) ) 
	{
		char	s[MAX_STRING_CHARS];

		if (!(cm_voteControl.integer & (1 << V_NEXTMAP)) ) {
			trap_SendServerCommand(ent-g_entities, "print \"This vote option is not allowed on this server.\n\"");
			return;
		}

		trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
		if (!*s) {
			trap_SendServerCommand( ent-g_entities, "print \"nextmap not set.\n\"" );
			return;
		}
		Com_sprintf( level.voteString, sizeof( level.voteString ), "vstr nextmap");
		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
	} 
	else
	{
		if( (!Q_stricmp( arg1, "g_dowarmup") && !(cm_voteControl.integer & (1 << V_G_DOWARMUP))) ||
			(!Q_stricmp( arg1, "timelimit") && !(cm_voteControl.integer & (1 << V_TIMELIMIT))) ||
			(!Q_stricmp( arg1, "map_restart") && !(cm_voteControl.integer & (1 << V_MAP_RESTART))) ||
			(!Q_stricmp( arg1, "fraglimit") && !(cm_voteControl.integer & (1 << V_FRAGLIMIT))))
		{
			trap_SendServerCommand(ent-g_entities, va("print \"Voting not allowed for %s\n\"", arg1));
			return;
		}
		Com_sprintf( level.voteString, sizeof( level.voteString ), "%s \"%s\"", arg1, arg2 );
		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
	}

	trap_SendServerCommand( -1, va("print \"%s %s\n\"", ent->client->pers.netname, G_GetStripEdString("SVINGAME", "PLCALLEDVOTE") ) );

	// start the voting, the caller autoamtically votes yes
	level.voteTime = level.time;
	level.voteYes = 1;
	level.voteNo = 0;

	for ( i = 0 ; i < level.maxclients ; i++ ) {
		level.clients[i].ps.eFlags &= ~EF_VOTED;
	}
	ent->client->ps.eFlags |= EF_VOTED;

	trap_SetConfigstring( CS_VOTE_TIME, va("%i", level.voteTime ) );
	trap_SetConfigstring( CS_VOTE_STRING, level.voteDisplayString );	
	trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
	trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
}

/*
==================
Cmd_Vote_f
==================
*/
void Cmd_Vote_f( gentity_t *ent ) {
	char		msg[64];

	if ( !level.voteTime ) {
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOVOTEINPROG")) );
		return;
	}
	if ( ent->client->ps.eFlags & EF_VOTED ) {
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "VOTEALREADY")) );
		return;
	}
	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOVOTEASSPEC")) );
		return;
	}

	trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "PLVOTECAST")) );

	ent->client->ps.eFlags |= EF_VOTED;

	trap_Argv( 1, msg, sizeof( msg ) );

	if ( msg[0] == 'y' || msg[1] == 'Y' || msg[1] == '1' ) {
		level.voteYes++;
		trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
	} else {
		level.voteNo++;
		trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
	}

	// a majority will be determined in CheckVote, which will also account
	// for players entering or leaving
}

/*
==================
Cmd_CallTeamVote_f
==================
*/
void Cmd_CallTeamVote_f( gentity_t *ent ) {
	int		i, team, cs_offset;
	char	arg1[MAX_STRING_TOKENS];
	char	arg2[MAX_STRING_TOKENS];

	team = ent->client->sess.sessionTeam;
	if ( team == TEAM_RED )
		cs_offset = 0;
	else if ( team == TEAM_BLUE )
		cs_offset = 1;
	else
		return;

	if ( !g_allowVote.integer ) {
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOVOTE")) );
		return;
	}

	if ( level.teamVoteTime[cs_offset] ) {
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TEAMVOTEALREADY")) );
		return;
	}
	if ( ent->client->pers.teamVoteCount >= MAX_VOTE_COUNT ) {
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "MAXTEAMVOTES")) );
		return;
	}
	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOSPECVOTE")) );
		return;
	}

	// make sure it is a valid command to vote on
	trap_Argv( 1, arg1, sizeof( arg1 ) );
	arg2[0] = '\0';
	for ( i = 2; i < trap_Argc(); i++ ) {
		if (i > 2)
			strcat(arg2, " ");
		trap_Argv( i, &arg2[strlen(arg2)], sizeof( arg2 ) - strlen(arg2) );
	}

	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) ) {
		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
		return;
	}

	if ( !Q_stricmp( arg1, "leader" ) ) {
		char netname[MAX_NETNAME], leader[MAX_NETNAME];

		if ( !arg2[0] ) {
			i = ent->client->ps.clientNum;
		}
		else {
			// numeric values are just slot numbers
			for (i = 0; i < 3; i++) {
				if ( !arg2[i] || arg2[i] < '0' || arg2[i] > '9' )
					break;
			}
			if ( i >= 3 || !arg2[i]) {
				i = atoi( arg2 );
				if ( i < 0 || i >= level.maxclients ) {
					trap_SendServerCommand( ent-g_entities, va("print \"Bad client slot: %i\n\"", i) );
					return;
				}

				if ( !g_entities[i].inuse ) {
					trap_SendServerCommand( ent-g_entities, va("print \"Client %i is not active\n\"", i) );
					return;
				}
			}
			else {
				Q_strncpyz(leader, arg2, sizeof(leader));
				Q_CleanStr(leader);
				for ( i = 0 ; i < level.maxclients ; i++ ) {
					if ( level.clients[i].pers.connected == CON_DISCONNECTED )
						continue;
					if (level.clients[i].sess.sessionTeam != team)
						continue;
					Q_strncpyz(netname, level.clients[i].pers.netname, sizeof(netname));
					Q_CleanStr(netname);
					if ( !Q_stricmp(netname, leader) ) {
						break;
					}
				}
				if ( i >= level.maxclients ) {
					trap_SendServerCommand( ent-g_entities, va("print \"%s is not a valid player on your team.\n\"", arg2) );
					return;
				}
			}
		}
		Com_sprintf(arg2, sizeof(arg2), "%d", i);
	} else {
		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
		trap_SendServerCommand( ent-g_entities, "print \"Team vote commands are: leader <player>.\n\"" );
		return;
	}

	Com_sprintf( level.teamVoteString[cs_offset], sizeof( level.teamVoteString[cs_offset] ), "%s %s", arg1, arg2 );

	for ( i = 0 ; i < level.maxclients ; i++ ) {
		if ( level.clients[i].pers.connected == CON_DISCONNECTED )
			continue;
		if (level.clients[i].sess.sessionTeam == team)
			trap_SendServerCommand( i, va("print \"%s called a team vote.\n\"", ent->client->pers.netname ) );
	}

	// start the voting, the caller autoamtically votes yes
	level.teamVoteTime[cs_offset] = level.time;
	level.teamVoteYes[cs_offset] = 1;
	level.teamVoteNo[cs_offset] = 0;

	for ( i = 0 ; i < level.maxclients ; i++ ) {
		if (level.clients[i].sess.sessionTeam == team)
			level.clients[i].ps.eFlags &= ~EF_TEAMVOTED;
	}
	ent->client->ps.eFlags |= EF_TEAMVOTED;

	trap_SetConfigstring( CS_TEAMVOTE_TIME + cs_offset, va("%i", level.teamVoteTime[cs_offset] ) );
	trap_SetConfigstring( CS_TEAMVOTE_STRING + cs_offset, level.teamVoteString[cs_offset] );
	trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
	trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );
}

/*
==================
Cmd_TeamVote_f
==================
*/
void Cmd_TeamVote_f( gentity_t *ent ) {
	int			team, cs_offset;
	char		msg[64];

	team = ent->client->sess.sessionTeam;
	if ( team == TEAM_RED )
		cs_offset = 0;
	else if ( team == TEAM_BLUE )
		cs_offset = 1;
	else
		return;

	if ( !level.teamVoteTime[cs_offset] ) {
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOTEAMVOTEINPROG")) );
		return;
	}
	if ( ent->client->ps.eFlags & EF_TEAMVOTED ) {
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TEAMVOTEALREADYCAST")) );
		return;
	}
	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOVOTEASSPEC")) );
		return;
	}

	trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "PLTEAMVOTECAST")) );

	ent->client->ps.eFlags |= EF_TEAMVOTED;

	trap_Argv( 1, msg, sizeof( msg ) );

	if ( msg[0] == 'y' || msg[1] == 'Y' || msg[1] == '1' ) {
		level.teamVoteYes[cs_offset]++;
		trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
	} else {
		level.teamVoteNo[cs_offset]++;
		trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );	
	}

	// a majority will be determined in TeamCheckVote, which will also account
	// for players entering or leaving
}


/*
=================
Cmd_SetViewpos_f
=================
*/
void Cmd_SetViewpos_f( gentity_t *ent ) {
	vec3_t		origin, angles;
	char		buffer[MAX_TOKEN_CHARS];
	int			i;

	if ( !g_cheats.integer ) {
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOCHEATS")));
		return;
	}
	if ( trap_Argc() != 5 ) {
		trap_SendServerCommand( ent-g_entities, va("print \"usage: setviewpos x y z yaw\n\""));
		return;
	}

	VectorClear( angles );
	for ( i = 0 ; i < 3 ; i++ ) {
		trap_Argv( i + 1, buffer, sizeof( buffer ) );
		origin[i] = atof( buffer );
	}

	trap_Argv( 4, buffer, sizeof( buffer ) );
	angles[YAW] = atof( buffer );

	TeleportPlayer( ent, origin, angles );
}



/*
=================
Cmd_Stats_f
=================
*/
void Cmd_Stats_f( gentity_t *ent ) {
/*
	int max, n, i;

	max = trap_AAS_PointReachabilityAreaIndex( NULL );

	n = 0;
	for ( i = 0; i < max; i++ ) {
		if ( ent->client->areabits[i >> 3] & (1 << (i & 7)) )
			n++;
	}

	//trap_SendServerCommand( ent-g_entities, va("print \"visited %d of %d areas\n\"", n, max));
	trap_SendServerCommand( ent-g_entities, va("print \"%d%% level coverage\n\"", n * 100 / max));
*/
}

int G_ItemUsable(playerState_t *ps, int forcedUse)
{
	vec3_t fwd, fwdorg, dest, pos;
	vec3_t yawonly;
	vec3_t mins, maxs;
	vec3_t trtest;
	trace_t tr;

	if (ps->usingATST)
	{
		return 0;
	}
	
	if (ps->pm_flags & PMF_USE_ITEM_HELD)
	{ //force to let go first
		return 0;
	}

	if (!forcedUse)
	{
		forcedUse = bg_itemlist[ps->stats[STAT_HOLDABLE_ITEM]].giTag;
	}

	switch (forcedUse)
	{
	case HI_MEDPAC:
		if (ps->stats[STAT_HEALTH] >= ps->stats[STAT_MAX_HEALTH])
		{
			return 0;
		}

		if (ps->stats[STAT_HEALTH] <= 0)
		{
			return 0;
		}

		return 1;
	case HI_SEEKER:
		if (ps->eFlags & EF_SEEKERDRONE)
		{
			G_AddEvent(&g_entities[ps->clientNum], EV_ITEMUSEFAIL, SEEKER_ALREADYDEPLOYED);
			return 0;
		}

		return 1;
	case HI_SENTRY_GUN:
		if (ps->fd.sentryDeployed)
		{
			G_AddEvent(&g_entities[ps->clientNum], EV_ITEMUSEFAIL, SENTRY_ALREADYPLACED);
			return 0;
		}

		yawonly[ROLL] = 0;
		yawonly[PITCH] = 0;
		yawonly[YAW] = ps->viewangles[YAW];

		VectorSet( mins, -8, -8, 0 );
		VectorSet( maxs, 8, 8, 24 );

		AngleVectors(yawonly, fwd, NULL, NULL);

		fwdorg[0] = ps->origin[0] + fwd[0]*64;
		fwdorg[1] = ps->origin[1] + fwd[1]*64;
		fwdorg[2] = ps->origin[2] + fwd[2]*64;

		trtest[0] = fwdorg[0] + fwd[0]*16;
		trtest[1] = fwdorg[1] + fwd[1]*16;
		trtest[2] = fwdorg[2] + fwd[2]*16;

		trap_Trace(&tr, ps->origin, mins, maxs, trtest, ps->clientNum, MASK_PLAYERSOLID);

		if ((tr.fraction != 1 && tr.entityNum != ps->clientNum) || tr.startsolid || tr.allsolid)
		{
			G_AddEvent(&g_entities[ps->clientNum], EV_ITEMUSEFAIL, SENTRY_NOROOM);
			return 0;
		}

		return 1;
	case HI_SHIELD:
		mins[0] = -8;
		mins[1] = -8;
		mins[2] = 0;

		maxs[0] = 8;
		maxs[1] = 8;
		maxs[2] = 8;

		AngleVectors (ps->viewangles, fwd, NULL, NULL);
		fwd[2] = 0;
		VectorMA(ps->origin, 64, fwd, dest);
		trap_Trace(&tr, ps->origin, mins, maxs, dest, ps->clientNum, MASK_SHOT );
		if (tr.fraction > 0.9 && !tr.startsolid && !tr.allsolid)
		{
			VectorCopy(tr.endpos, pos);
			VectorSet( dest, pos[0], pos[1], pos[2] - 4096 );
			trap_Trace( &tr, pos, mins, maxs, dest, ps->clientNum, MASK_SOLID );
			if ( !tr.startsolid && !tr.allsolid )
			{
				return 1;
			}
		}
		G_AddEvent(&g_entities[ps->clientNum], EV_ITEMUSEFAIL, SHIELD_NOROOM);
		return 0;
	default:
		return 1;
	}
}

extern int saberOffSound;
extern int saberOnSound;

void Cmd_ToggleSaber_f(gentity_t *ent)
{
	if (!saberOffSound || !saberOnSound)
	{
		saberOffSound = G_SoundIndex("sound/weapons/saber/saberoffquick.wav");
		saberOnSound = G_SoundIndex("sound/weapons/saber/saberon.wav");
	}

	if (ent->client->ps.saberInFlight)
	{
		return;
	}

	if (ent->client->ps.forceHandExtend != HANDEXTEND_NONE)
	{
		return;
	}

	if (ent->client->ps.weapon != WP_SABER)
	{
		return;
	}

//	if (ent->client->ps.duelInProgress && !ent->client->ps.saberHolstered)
//	{
//		return;
//	}

	if (ent->client->ps.duelTime >= level.time)
	{
		return;
	}

	if (ent->client->ps.saberLockTime >= level.time)
	{
		return;
	}

	if (ent->client && ent->client->ps.weaponTime < 1)
	{
		if (ent->client->ps.saberHolstered)
		{
			ent->client->ps.saberHolstered = qfalse;
			G_Sound(ent, CHAN_AUTO, saberOnSound);
		}
		else
		{
			if (cm_dualblade.integer == 1) {
			if (ent->client->ps.saberHolstered == qfalse && ent->client->ps.dualBlade == qfalse) {
				ent->client->ps.dualBlade = qtrue;
				if (cm_savedualblade.integer == 1) {
					ent->client->pers.dualBlade = qtrue;
				}
				G_Sound(ent, CHAN_AUTO, saberOnSound);
			} else if (ent->client->ps.saberHolstered == qfalse && ent->client->ps.dualBlade == qtrue) {
				ent->client->ps.saberHolstered = qtrue;
				ent->client->ps.dualBlade = qfalse;
				if (cm_savedualblade.integer == 1) {
					ent->client->pers.dualBlade = qfalse;
				}
				G_Sound(ent, CHAN_AUTO, saberOffSound);
				//prevent anything from being done for 400ms after holster
				ent->client->ps.weaponTime = 400;
			}
			} else {
				ent->client->ps.saberHolstered = qtrue;
				G_Sound(ent, CHAN_AUTO, saberOffSound);
				//prevent anything from being done for 400ms after holster
				ent->client->ps.weaponTime = 400;
			}
		}
	}
}

void Cmd_SaberAttackCycle_f(gentity_t *ent)
{
	int selectLevel = 0;

	if ( !ent || !ent->client )
	{
		return;
	}
	/*
	if (ent->client->ps.weaponTime > 0)
	{ //no switching attack level when busy
		return;
	}
	*/

	if (ent->client->saberCycleQueue)
	{ //resume off of the queue if we haven't gotten a chance to update it yet
		selectLevel = ent->client->saberCycleQueue;
	}
	else
	{
		selectLevel = ent->client->ps.fd.saberAnimLevel;
	}

	selectLevel++;
	if ( selectLevel > ent->client->ps.fd.forcePowerLevel[FP_SABERATTACK] )
	{
		selectLevel = FORCE_LEVEL_1;
	}
/*
#ifndef FINAL_BUILD
	switch ( selectLevel )
	{
	case FORCE_LEVEL_1:
		trap_SendServerCommand( ent-g_entities, va("print \"Lightsaber Combat Style: %sfast\n\"", S_COLOR_BLUE) );
		break;
	case FORCE_LEVEL_2:
		trap_SendServerCommand( ent-g_entities, va("print \"Lightsaber Combat Style: %smedium\n\"", S_COLOR_YELLOW) );
		break;
	case FORCE_LEVEL_3:
		trap_SendServerCommand( ent-g_entities, va("print \"Lightsaber Combat Style: %sstrong\n\"", S_COLOR_RED) );
		break;
	}
#endif
*/
	if (ent->client->ps.weaponTime <= 0)
	{ //not busy, set it now
		ent->client->ps.fd.saberAnimLevel = selectLevel;
	}
	else
	{ //can't set it now or we might cause unexpected chaining, so queue it
		ent->client->saberCycleQueue = selectLevel;
	}
}

qboolean G_OtherPlayersDueling(void)
{
	int i = 0;
	gentity_t *ent;

	while (i < MAX_CLIENTS)
	{
		ent = &g_entities[i];

		if (ent && ent->inuse && ent->client && ent->client->ps.duelInProgress)
		{
			return qtrue;
		}
		i++;
	}

	return qfalse;
}

void Cmd_EngageDuel_f(gentity_t *ent)
{
	trace_t tr;
	vec3_t forward, fwdOrg;

	if (!g_privateDuel.integer)
	{
		return;
	}

	if (g_gametype.integer == GT_TOURNAMENT)
	{ //rather pointless in this mode..
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NODUEL_GAMETYPE")) );
		return;
	}

	if (g_gametype.integer >= GT_TEAM)
	{ //no private dueling in team modes
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NODUEL_GAMETYPE")) );
		return;
	}

	if (ent->client->ps.duelTime >= level.time)
	{
		return;
	}

	if (ent->client->ps.weapon != WP_SABER)
	{
		return;
	}

	/*
	if (!ent->client->ps.saberHolstered)
	{ //must have saber holstered at the start of the duel
		return;
	}
	*/
	//NOTE: No longer doing this..

	if (ent->client->ps.saberInFlight)
	{
		return;
	}

	if (ent->client->ps.duelInProgress)
	{
		return;
	}

	//cm NOTE: Cant allow punished/sleeping ppl to duel
	if (ent->client->pers.ampunish == qtrue)
	{
		return;
	}

	if (ent->client->pers.amsleep == qtrue)
	{
		return;
	}
	//JediDog: duel bug fix
	if (!ent->client->ps.forceHandExtend == HANDEXTEND_NONE)
	{
	   return;
	}
	//New: Don't let a player duel if he just did and hasn't waited 10 seconds yet (note: If someone challenges him, his duel timer will reset so he can accept)
	if (ent->client->ps.fd.privateDuelTime > level.time)
	{
		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "CANTDUEL_JUSTDID")) );
		return;
	}

	if (cm_multiduels.integer==0)
	{
		if (G_OtherPlayersDueling())
		{
			trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "CANTDUEL_BUSY")) );
			return;
		}
	}

	AngleVectors( ent->client->ps.viewangles, forward, NULL, NULL );

	fwdOrg[0] = ent->client->ps.origin[0] + forward[0]*256;
	fwdOrg[1] = ent->client->ps.origin[1] + forward[1]*256;
	fwdOrg[2] = (ent->client->ps.origin[2]+ent->client->ps.viewheight) + forward[2]*256;

	trap_Trace(&tr, ent->client->ps.origin, NULL, NULL, fwdOrg, ent->s.number, MASK_PLAYERSOLID);

	if (tr.fraction != 1 && tr.entityNum < MAX_CLIENTS)
	{
		gentity_t *challenged = &g_entities[tr.entityNum];

		if (!challenged || !challenged->client || !challenged->inuse ||
			challenged->health < 1 || challenged->client->ps.stats[STAT_HEALTH] < 1 ||
			challenged->client->ps.weapon != WP_SABER || challenged->client->ps.duelInProgress ||
			challenged->client->ps.saberInFlight)
		{
			return;
		}

		if (g_gametype.integer >= GT_TEAM && OnSameTeam(ent, challenged))
		{
			return;
		}

		if (challenged->client->ps.duelIndex == ent->s.number && challenged->client->ps.duelTime >= level.time )
		{

			ent->client->ps.duelInProgress = qtrue;
			challenged->client->ps.duelInProgress = qtrue;

			ent->client->ps.duelTime = level.time + 2000;
			challenged->client->ps.duelTime = level.time + 2000;

			G_AddEvent(ent, EV_PRIVATE_DUEL, 1);
			G_AddEvent(challenged, EV_PRIVATE_DUEL, 1);

			//cm NOTE: Fixing up duels.
			ent->health = cm_duelhealth.integer;
			ent->client->ps.stats[STAT_ARMOR] = cm_duelshield.integer;
			challenged->health = cm_duelhealth.integer;
			challenged->client->ps.stats[STAT_ARMOR] = cm_duelshield.integer;
			ent->client->ps.eFlags &= ~EF_INVULNERABLE;
			ent->client->invulnerableTimer = 0;
			challenged->client->ps.eFlags &= ~EF_INVULNERABLE;
			challenged->client->invulnerableTimer = 0;

			//Holster their sabers now, until the duel starts (then they'll get auto-turned on to look cool)

			if (!ent->client->ps.saberHolstered)
			{
				G_Sound(ent, CHAN_AUTO, saberOffSound);
				ent->client->ps.weaponTime = 400;
				ent->client->ps.saberHolstered = qtrue;
			}
			if (!challenged->client->ps.saberHolstered)
			{
				G_Sound(challenged, CHAN_AUTO, saberOffSound);
				challenged->client->ps.weaponTime = 400;
				challenged->client->ps.saberHolstered = qtrue;
			}
		}
		else
		{
			//Print the message that a player has been challenged in private, only announce the actual duel initiation in private
			trap_SendServerCommand( challenged-g_entities, va("cp \"%s\n^7%s\n\"", ent->client->pers.netname, G_GetStripEdString("SVINGAME", "PLDUELCHALLENGE")) );
				trap_SendServerCommand( ent-g_entities, va("cp \"%s\n^7%s\n\"", G_GetStripEdString("SVINGAME", "PLDUELCHALLENGED"), challenged->client->pers.netname) );
		}

		challenged->client->ps.fd.privateDuelTime = 0; //reset the timer in case this player just got out of a duel. He should still be able to accept the challenge.

		ent->client->ps.forceHandExtend = HANDEXTEND_DUELCHALLENGE;
		ent->client->ps.forceHandExtendTime = level.time + 1000;

		ent->client->ps.duelIndex = challenged->s.number;
		ent->client->ps.duelTime = level.time + 5000;
	}
}

void PM_SetAnim(int setAnimParts,int anim,int setAnimFlags, int blendTime);

#ifdef _DEBUG
extern stringID_table_t animTable[MAX_ANIMATIONS+1];

void Cmd_DebugSetSaberMove_f(gentity_t *self)
{
	int argNum = trap_Argc();
	char arg[MAX_STRING_CHARS];

	if (argNum < 2)
	{
		return;
	}

	trap_Argv( 1, arg, sizeof( arg ) );

	if (!arg[0])
	{
		return;
	}

	self->client->ps.saberMove = atoi(arg);
	self->client->ps.saberBlocked = BLOCKED_BOUNCE_MOVE;

	if (self->client->ps.saberMove >= LS_MOVE_MAX)
	{
		self->client->ps.saberMove = LS_MOVE_MAX-1;
	}

	Com_Printf("Anim for move: %s\n", animTable[saberMoveData[self->client->ps.saberMove].animToUse].name);
}

void Cmd_DebugSetBodyAnim_f(gentity_t *self, int flags)
{
	int argNum = trap_Argc();
	char arg[MAX_STRING_CHARS];
	int i = 0;
	pmove_t pmv;

	if (argNum < 2)
	{
		return;
	}

	trap_Argv( 1, arg, sizeof( arg ) );

	if (!arg[0])
	{
		return;
	}

	while (i < MAX_ANIMATIONS)
	{
		if (!Q_stricmp(arg, animTable[i].name))
		{
			break;
		}
		i++;
	}

	if (i == MAX_ANIMATIONS)
	{
		Com_Printf("Animation '%s' does not exist\n", arg);
		return;
	}

	memset (&pmv, 0, sizeof(pmv));
	pmv.ps = &self->client->ps;
	pmv.animations = bgGlobalAnimations;
	pmv.cmd = self->client->pers.cmd;
	pmv.trace = trap_Trace;
	pmv.pointcontents = trap_PointContents;
	pmv.gametype = g_gametype.integer;

	pm = &pmv;
	PM_SetAnim(SETANIM_BOTH, i, flags, 0);

	Com_Printf("Set body anim to %s\n", arg);
}
#endif

void StandardSetBodyAnim(gentity_t *self, int anim, int flags)
{
	pmove_t pmv;

	memset (&pmv, 0, sizeof(pmv));
	pmv.ps = &self->client->ps;
	pmv.animations = bgGlobalAnimations;
	pmv.cmd = self->client->pers.cmd;
	pmv.trace = trap_Trace;
	pmv.pointcontents = trap_PointContents;
	pmv.gametype = g_gametype.integer;

	pm = &pmv;
	PM_SetAnim(SETANIM_BOTH, anim, flags, 0);
}

void DismembermentTest(gentity_t *self);

#ifdef _DEBUG
void DismembermentByNum(gentity_t *self, int num);
#endif

/*
=================
ClientCommand
=================
*/
void ClientCommand( int clientNum ) {
	gentity_t *ent;
	char	cmd[MAX_TOKEN_CHARS];

	ent = g_entities + clientNum;
	if ( !ent->client ) {
		return;		// not fully in game yet
	}


	trap_Argv( 0, cmd, sizeof( cmd ) );

	//rww - redirect bot commands
	if (strstr(cmd, "bot_") && AcceptBotCommand(cmd, ent))
	{
		return;
	}
	//end rww

	if (Q_stricmp (cmd, "say") == 0) {
		if ( ent->client->pers.amsilence == qtrue )
		{
			trap_SendServerCommand(ent-g_entities,"print \"You have been silenced by an admin\n\"");
			trap_SendServerCommand(ent-g_entities,"cp \"You have been silenced by an admin\n\"");
			return;
		}
		else if ( ent->client->pers.ampunish == qtrue )
		{
			trap_SendServerCommand(ent-g_entities,"print \"You have been punished by an admin\n\"");
			trap_SendServerCommand(ent-g_entities,"cp \"You have been punished by an admin\n\"");
			return;
		}
		Cmd_Say_f (ent, SAY_ALL, qfalse);
		return;
	}
	if (Q_stricmp (cmd, "say_team") == 0) {
		if ( ent->client->pers.amsilence == qtrue )
		{
			trap_SendServerCommand(ent-g_entities,"print \"You have been silenced by an admin\n\"");
			trap_SendServerCommand(ent-g_entities,"cp \"You have been silenced by an admin\n\"");
			return;
		}
		else if ( ent->client->pers.ampunish == qtrue )
		{
			trap_SendServerCommand(ent-g_entities,"print \"You have been punished by an admin\n\"");
			trap_SendServerCommand(ent-g_entities,"cp \"You have been punished by an admin\n\"");
			return;
		}
		Cmd_Say_f (ent, SAY_TEAM, qfalse);
		return;
	}
	if (Q_stricmp (cmd, "tell") == 0) {
		if ( ent->client->pers.amsilence == qtrue )
		{
			trap_SendServerCommand(ent-g_entities,"print \"You have been silenced by an admin\n\"");
			trap_SendServerCommand(ent-g_entities,"cp \"You have been silenced by an admin\n\"");
			return;
		}
		else if ( ent->client->pers.ampunish == qtrue )
		{
			trap_SendServerCommand(ent-g_entities,"print \"You have been punished by an admin\n\"");
			trap_SendServerCommand(ent-g_entities,"cp \"You have been punished by an admin\n\"");
			return;
		}
		Cmd_Tell_f ( ent );
		return;
	}
	if (Q_stricmp (cmd, "vsay") == 0) {
		Cmd_Voice_f (ent, SAY_ALL, qfalse, qfalse);
		return;
	}
	if (Q_stricmp (cmd, "vsay_team") == 0) {
		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qfalse);
		return;
	}
	if (Q_stricmp (cmd, "vtell") == 0) {
		Cmd_VoiceTell_f ( ent, qfalse );
		return;
	}
	if (Q_stricmp (cmd, "vosay") == 0) {
		Cmd_Voice_f (ent, SAY_ALL, qfalse, qtrue);
		return;
	}
	if (Q_stricmp (cmd, "vosay_team") == 0) {
		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qtrue);
		return;
	}
	if (Q_stricmp (cmd, "votell") == 0) {
		Cmd_VoiceTell_f ( ent, qtrue );
		return;
	}
	if (Q_stricmp (cmd, "vtaunt") == 0) {
		Cmd_VoiceTaunt_f ( ent );
		return;
	}
	if (Q_stricmp (cmd, "score") == 0) {
		Cmd_Score_f (ent);
		return;
	}

	// ignore all other commands when at intermission
	if (level.intermissiontime)
	{
		qboolean giveError = qfalse;

		if (!Q_stricmp(cmd, "give"))
		{
			giveError = qtrue;
		}
		else if (!Q_stricmp(cmd, "god"))
		{
			giveError = qtrue;
		}
		else if (!Q_stricmp(cmd, "notarget"))
		{
			giveError = qtrue;
		}
		else if (!Q_stricmp(cmd, "noclip"))
		{
			giveError = qtrue;
		}
		else if (!Q_stricmp(cmd, "kill"))
		{
			giveError = qtrue;
		}
		else if (!Q_stricmp(cmd, "teamtask"))
		{
			giveError = qtrue;
		}
		else if (!Q_stricmp(cmd, "levelshot"))
		{
			giveError = qtrue;
		}
		else if (!Q_stricmp(cmd, "follow"))
		{
			giveError = qtrue;
		}
		else if (!Q_stricmp(cmd, "follownext"))
		{
			giveError = qtrue;
		}
		else if (!Q_stricmp(cmd, "followprev"))
		{
			giveError = qtrue;
		}
		else if (!Q_stricmp(cmd, "team"))
		{
			giveError = qtrue;
		}
		else if (!Q_stricmp(cmd, "forcechanged"))
		{ //special case: still update force change
			Cmd_ForceChanged_f (ent);
			return;
		}
		else if (!Q_stricmp(cmd, "where"))
		{
			giveError = qtrue;
		}
		else if (!Q_stricmp(cmd, "callvote"))
		{
			giveError = qtrue;
		}
		else if (!Q_stricmp(cmd, "vote"))
		{
			giveError = qtrue;
		}
		else if (!Q_stricmp(cmd, "callteamvote"))
		{
			giveError = qtrue;
		}
		else if (!Q_stricmp(cmd, "teamvote"))
		{
			giveError = qtrue;
		}
		else if (!Q_stricmp(cmd, "gc"))
		{
			giveError = qtrue;
		}
		else if (!Q_stricmp(cmd, "setviewpos"))
		{
			giveError = qtrue;
		}
		else if (!Q_stricmp(cmd, "stats"))
		{
			giveError = qtrue;
		}

		if (giveError)
		{
			trap_SendServerCommand( clientNum, va("print \"You cannot perform this task (%s) during the intermission.\n\"", cmd ) );
		}
		else
		{
			Cmd_Say_f (ent, qfalse, qtrue);
		}
		return;
	}

	if (Q_stricmp (cmd, "give") == 0)
	{
		Cmd_Give_f (ent);
	}
	else if (Q_stricmp (cmd, "god") == 0)
		Cmd_God_f (ent);
	else if (Q_stricmp (cmd, "notarget") == 0)
		Cmd_Notarget_f (ent);
	else if (Q_stricmp (cmd, "noclip") == 0)
		Cmd_Noclip_f (ent);
	else if (Q_stricmp (cmd, "kill") == 0)
		Cmd_Kill_f (ent);
	else if (Q_stricmp (cmd, "teamtask") == 0)
		Cmd_TeamTask_f (ent);
	else if (Q_stricmp (cmd, "levelshot") == 0)
		Cmd_LevelShot_f (ent);
	else if (Q_stricmp (cmd, "follow") == 0)
		Cmd_Follow_f (ent);
	else if (Q_stricmp (cmd, "follownext") == 0)
		Cmd_FollowCycle_f (ent, 1);
	else if (Q_stricmp (cmd, "followprev") == 0)
		Cmd_FollowCycle_f (ent, -1);
	else if (Q_stricmp (cmd, "team") == 0)
		Cmd_Team_f (ent);
	else if (Q_stricmp (cmd, "forcechanged") == 0)
		Cmd_ForceChanged_f (ent);
	else if (Q_stricmp (cmd, "where") == 0)
		Cmd_Where_f (ent);
	else if (Q_stricmp (cmd, "callvote") == 0)
		Cmd_CallVote_f (ent);
	else if (Q_stricmp (cmd, "vote") == 0)
		Cmd_Vote_f (ent);
	else if (Q_stricmp (cmd, "callteamvote") == 0)
		Cmd_CallTeamVote_f (ent);
	else if (Q_stricmp (cmd, "teamvote") == 0)
		Cmd_TeamVote_f (ent);
	else if (Q_stricmp (cmd, "gc") == 0)
		Cmd_GameCommand_f( ent );
	else if (Q_stricmp (cmd, "setviewpos") == 0)
		Cmd_SetViewpos_f( ent );
	else if (Q_stricmp (cmd, "stats") == 0)
		Cmd_Stats_f( ent );
	//cm BEGIN
	else if (Q_stricmp(cmd, "help") == 0){
		trap_SendServerCommand( ent-g_entities, "print \"\n^1=== ^7HELP ^1===\n\n^5/Emotes - List of emotions\n/AdminCmds - List of administration commands\n/Commands - List of client commands\n\n\"" );
	}
	else if (Q_stricmp(cmd, "emotes") == 0){
		trap_SendServerCommand( ent-g_entities, "print \"\n^1=== ^7EMOTES ^1===\n\n^5/sit, /beg, /flip, /cocky, /bounce, /breakdance, /kneel, /kiss\n/scratch, /dunno, /power, /lol, /throw, /throw2, /throw3, /shrug\n/super, /thumbsdown, /draw, /dance, /dance2, /nod, /shake\n\n\"" );
	}
	else if (Q_stricmp(cmd, "admincmds") == 0){
		trap_SendServerCommand( ent-g_entities, "print \"\n^1=== ^7ADMIN COMMANDS ^1===\n\n^5/empower - Give all forcepowers\n/terminator - Give all weapons\n/protect - Protection from damage\n/adminkick - Kick clients from server\n/adminban - Ban clients from server\n/g2animent - Spawn NPCs\n/slap - Throw clients into the air\n/silence - Make clients unable to speak\n/rename - Change clients names\n/punish - Punish a client\n/changemap - Change gametype and map on server\n/changemode - Change the mode\n/teleport - Teleport client(s)\n/slay - Kill a client\n/sleep - Sleep a client\n/origin - Your X Y Z coordinates\n/forceteam - forces a client to a team\n/myadmincommands - tells you what admin commands you can use for your admin level\n\n\"" );
	}
	else if (Q_stricmp(cmd, "commands") == 0){
		trap_SendServerCommand( ent-g_entities, "print \"\n^1=== ^7COMMANDS ^1===\n\n^5/showmotd - Show the MOTD\n/knockmedown - Knock yourself down\n/clanlogin - Log in as a clan member\n/clanlogout - Log out of clan membership\n/adminlogin - Log in as an admin\n/adminlogout - Log out of admin\n/clansay - Talk to clan members\n/adminsay - Talk to admins\n/report - Report a message to admins\n/ignore - Ignore a clients chat\n/who - View clients & status\n/origin - Your X Y Z coordinates\n\n\"" );
	}
	//cm CLIENT CMDS
	else if (Q_stricmp(cmd, "clanlogin" ) == 0) // client command: clanlogin <password>
    { 
		char   pass[MAX_STRING_CHARS]; 

		trap_Argv( 1, pass, sizeof( pass ) ); // password

		if ( trap_Argc() != 2 ){
			trap_SendServerCommand( clientNum, "print \"Usage: /clanlogin <password>\n\"" ); 
			return; 
		}

		if (!*cm_clanPassword.string && !cm_clanPassword.string[0]) {
			trap_SendServerCommand( clientNum, "print \"No clan password is set on this server.\n\"" ); 
			return;
		}

		if ( ent->r.svFlags & SVF_CLAN ) {
            trap_SendServerCommand( clientNum, "print \"You are already logged in. Type in /clanlogout to remove clan status.\n\"" ); 
            return; 
		}

		if ( !Q_stricmp( pass, cm_clanPassword.string ) ) {
			ent->r.svFlags |= SVF_CLAN;
			G_LogPrintf("%s %s\n", ent->client->pers.netname, cm_clanLogin_saying.string);
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", ent->client->pers.netname, cm_clanLogin_saying.string ));
			return; 
		}
		else {
			trap_SendServerCommand( ent-g_entities, "print \"Clan password is incorrect!\n\"" );
		}
	}
	else if (Q_stricmp(cmd, "clanlogout") == 0)  // client command: adminlogout 
    { 
		if ( ent->r.svFlags & SVF_CLAN )
		{ 
			ent->r.svFlags &= ~SVF_CLAN;
			G_LogPrintf("%s %s\n", ent->client->pers.netname, cm_clanLogout_saying.string);
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", ent->client->pers.netname, cm_clanLogout_saying.string ));             
		}
	}
	else if (Q_stricmp(cmd, "adminlogin") == 0)
    { 
		char   pass[MAX_STRING_CHARS]; 

        trap_Argv( 1, pass, sizeof( pass ) ); // password

        if ( trap_Argc() != 2 ) 
        {
            trap_SendServerCommand( ent-g_entities, "print \"Usage: /adminlogin <password>\n\"" ); 
            return; 
        }

		if (!*cm_adminPassword1.string && !cm_adminPassword1.string[0] && 
			!*cm_adminPassword2.string && !cm_adminPassword2.string[0] &&
			!*cm_adminPassword3.string && !cm_adminPassword3.string[0]) {
			trap_SendServerCommand( clientNum, "print \"No admin passwords are set on this server.\n\"" ); 
			return;
		}

        if ( (ent->r.svFlags & SVF_ADMIN1) || (ent->r.svFlags & SVF_ADMIN2) || (ent->r.svFlags & SVF_ADMIN3) ) {
            trap_SendServerCommand( clientNum, "print \"You are already logged in. Type in /adminlogout to remove admin status.\n\"" ); 
            return; 
        }

		if ( !Q_stricmp( pass, "" ) ) { //Blank? Don't log in!
			return;
		}

		if ( !Q_stricmp( pass, cm_adminPassword1.string ) ) {
			ent->r.svFlags |= SVF_ADMIN1;
			G_LogPrintf("%s %s\n", ent->client->pers.netname, cm_AdminLogin1_saying.string);
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", ent->client->pers.netname, cm_AdminLogin1_saying.string ));
			return; 
		}
		else if ( !Q_stricmp( pass, cm_adminPassword2.string ) ) {
			ent->r.svFlags |= SVF_ADMIN2;
			G_LogPrintf("%s %s\n", ent->client->pers.netname, cm_AdminLogin2_saying.string);
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", ent->client->pers.netname, cm_AdminLogin2_saying.string ));
			return; 
		}
		else if ( !Q_stricmp( pass, cm_adminPassword3.string ) ) {
			ent->r.svFlags |= SVF_ADMIN3;
			G_LogPrintf("%s %s\n", ent->client->pers.netname, cm_AdminLogin3_saying.string);
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", ent->client->pers.netname, cm_AdminLogin3_saying.string ));
			return; 
		}
		else {
			trap_SendServerCommand( ent-g_entities, va("print \"Admin password is incorrect!\n\"", ent->client->pers.netname ));
		}
    }
	else if (Q_stricmp(cmd, "adminlogout") == 0) 
    { 
		if ( ent->r.svFlags & SVF_ADMIN1 )
        { 
            ent->r.svFlags &= ~SVF_ADMIN1;
			G_LogPrintf("%s %s\n", ent->client->pers.netname, cm_AdminLogout1_saying.string);
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", ent->client->pers.netname, cm_AdminLogout1_saying.string ));             
        }
		if ( ent->r.svFlags & SVF_ADMIN2 )
        { 
            ent->r.svFlags &= ~SVF_ADMIN2;
			G_LogPrintf("%s %s\n", ent->client->pers.netname, cm_AdminLogout2_saying.string);
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", ent->client->pers.netname, cm_AdminLogout2_saying.string ));             
        }
		if ( ent->r.svFlags & SVF_ADMIN3 )
        {
            ent->r.svFlags &= ~SVF_ADMIN3;
			G_LogPrintf("%s %s\n", ent->client->pers.netname, cm_AdminLogout3_saying.string);
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", ent->client->pers.netname, cm_AdminLogout3_saying.string ));             
        }
    }
	else if (Q_stricmp(cmd, "clansay") == 0)
	{
		char		*p;

		p = ConcatArgs( 1 );

		if (strlen( p ) > MAX_SAY_TEXT) {
			return;
		}

		if ( trap_Argc() < 2 ) 
        {
            trap_SendServerCommand( ent-g_entities, "print \"Usage: /clansay <message>\n\"" ); 
            return; 
        }

		if ( !(ent->r.svFlags & SVF_CLAN) ) {
			trap_SendServerCommand( ent-g_entities, "print \"This command can only be used by clan members. Log into clan membership to use this.\n\"" ); 
            return;
		}

		G_Say( ent, NULL, SAY_CLAN, p );
		G_LogPrintf("ClanSay(%s): %s\n", ent->client->pers.netname, p);
	}
	else if (Q_stricmp(cmd, "adminsay") == 0)
	{
		char		*p;

		p = ConcatArgs( 1 );

		if (strlen( p ) > MAX_SAY_TEXT) {
			return;
		}

		if ( trap_Argc() < 2 ) 
        {
            trap_SendServerCommand( ent-g_entities, "print \"Usage: /adminsay <message>\n\"" ); 
            return; 
        }

		if ( !(ent->r.svFlags & SVF_ADMIN1) && !(ent->r.svFlags & SVF_ADMIN2) && !(ent->r.svFlags & SVF_ADMIN3) ) {
			trap_SendServerCommand( ent-g_entities, "print \"This command can only be used by admins. Log into administration to use this.\n\"" ); 
            return;
		}

		G_Say( ent, NULL, SAY_ADMIN, p );
		G_LogPrintf("AdminSay(%s): %s\n", ent->client->pers.netname, p);
	}
	else if (Q_stricmp(cmd, "report") == 0)
	{
		char		*p;

		p = ConcatArgs( 1 );

		if (strlen( p ) > MAX_SAY_TEXT) {
			return;
		}

		if (cm_report.integer == 0){
			trap_SendServerCommand( ent-g_entities, va("print \"The report command is disabled on this server.\n\"") );
			return;
		}

		if ( trap_Argc() < 2 ) 
        {
            trap_SendServerCommand( ent-g_entities, "print \"Usage: /report <message>\n\"" ); 
            return; 
        }

		G_Say( ent, NULL, SAY_REPORT, p );
		G_LogPrintf("(%s)Reported: %s\n", ent->client->pers.netname, p);
	}
	else if (Q_stricmp(cmd, "showmotd") == 0){
		ent->client->csTimeLeft = cm_motd_time.integer;
	}
	else if (Q_stricmp ( cmd, "ignore" ) == 0 ){
		int ignoree = -1;
		qboolean ignore;
		char   name[MAX_STRING_CHARS];
		if( trap_Argc() != 2 ){
			trap_SendServerCommand( ent-g_entities, "print \"Usage: /ignore <client>\n\"");
			return;
		}
		trap_Argv( 1, name, sizeof( name ) );
		ignoree = G_ClientNumberFromArg( name );
        if (ignoree == -1) 
        { 
            trap_SendServerCommand( ent-g_entities, va("print \"Can't find client ID for %s\n\"", name ) ); 
            return; 
        } 
        if (ignoree == -2) 
        { 
            trap_SendServerCommand( ent-g_entities, va("print \"Ambiguous client ID for %s\n\"", name ) ); 
            return; 
        } 
		if ( ignoree < 0 || ignoree >= MAX_CLIENTS )
		{
			trap_SendServerCommand(ent-g_entities, va("print\"Bad client ID\n\""));
			return;
		}
        if (!g_entities[ignoree].inuse) 
        {
            trap_SendServerCommand( ent-g_entities, va("print \"Client %s is not active\n\"", name ) ); 
            return; 
        }
		ignore = G_IsClientChatIgnored ( ent->client->ps.clientNum, ignoree ) ? qfalse : qtrue;
		if ( ignoree == ent->client->ps.clientNum )
		{
			trap_SendServerCommand( ent-g_entities, va("print \"You cant ignore yourself.\n\""));
			return;
		}
		G_IgnoreClientChat ( ent->client->ps.clientNum, ignoree, ignore);
		if ( ignore )
		{
			trap_SendServerCommand( ent-g_entities, va("print \"%s ^7is now being ignored.\n\"", g_entities[ignoree].client->pers.netname));
			trap_SendServerCommand( ignoree, va("print \"%s ^7is now ignoring you.\n\"", ent->client->pers.netname));
		}
		else
		{
			trap_SendServerCommand( ent-g_entities, va("print \"%s ^7is now unignored.\n\"", g_entities[ignoree].client->pers.netname));
			trap_SendServerCommand( ignoree, va("print \"%s ^7has unignored you.\n\"", ent->client->pers.netname));
		}
	}
	else if (Q_stricmp(cmd, "who") == 0) 
    {
		int i;
		trap_SendServerCommand(ent-g_entities, va("print \"\n^3===================================\n^1Current clients connected & client status\n^3===================================\n\""));
		for(i = 0; i < level.maxclients; i++) { 
			if(g_entities[i].client->pers.connected == CON_CONNECTED) { 
				trap_SendServerCommand(ent-g_entities, va("print \"%i %s\"", i, g_entities[i].client->pers.netname));
				if (g_entities[i].r.svFlags & SVF_ADMIN1){
					trap_SendServerCommand(ent-g_entities, va("print \" ^7(Admin: %s^7)\"", cm_adminLevel1.string));
				} else if (g_entities[i].r.svFlags & SVF_ADMIN2){
					trap_SendServerCommand(ent-g_entities, va("print \" ^7(Admin: %s^7)\"", cm_adminLevel2.string));
				} else if (g_entities[i].r.svFlags & SVF_ADMIN3){
					trap_SendServerCommand(ent-g_entities, va("print \" ^7(Admin: %s^7)\"", cm_adminLevel3.string));
				} if (g_entities[i].r.svFlags & SVF_CLAN){
					trap_SendServerCommand(ent-g_entities, va("print \" ^1(clan)\""));
				} if (g_entities[i].client->pers.ampunish == qtrue){
					trap_SendServerCommand(ent-g_entities, va("print \" ^6(punished)\""));
				} if (g_entities[i].client->pers.amsleep == qtrue){
					trap_SendServerCommand(ent-g_entities, va("print \" ^3(sleeping)\""));
				} if (g_entities[i].client->pers.amterminator == qtrue){
					trap_SendServerCommand(ent-g_entities, va("print \" ^4(terminator)\""));
				} if (g_entities[i].client->pers.amempower == qtrue){
					trap_SendServerCommand(ent-g_entities, va("print \" ^5(empowered)\""));
				} if (g_entities[i].client->pers.amsilence == qtrue){
					trap_SendServerCommand(ent-g_entities, va("print \" ^2(silenced)\""));
				} if (g_entities[i].r.svFlags & SVF_BOT){
					trap_SendServerCommand(ent-g_entities, va("print \" ^7(bot)\""));
				}
				trap_SendServerCommand(ent-g_entities, va("print \"\n\""));
			}
		}
	}
	else if (Q_stricmp(cmd, "KnockMeDown") == 0)
	{
		if (cm_knockmedown.integer == 0){
			trap_SendServerCommand( ent-g_entities, "print \"This command is disabled\n\"" );
			return;
		}
		if ((ent->client->ps.forceHandExtend == HANDEXTEND_KNOCKDOWN) ||
			(ent->health < 1) || (ent->client->ps.eFlags & EF_DEAD))
		{
			return;
		}
		ent->client->ps.forceHandExtend = HANDEXTEND_KNOCKDOWN;
		ent->client->ps.forceDodgeAnim = 0;
		ent->client->ps.velocity[2] = 375;
		ent->client->ps.forceHandExtendTime = level.time + 700;
		ent->client->ps.quickerGetup = qfalse;
	}
	//cm ADMIN CMDS
	else if (Q_stricmp(cmd, "origin") == 0)
		{
			int	client_id = -1; 
			char	arg1[MAX_STRING_CHARS];
			trap_Argv( 1, arg1, sizeof( arg1 ) );
			trap_Argv( 1,  arg1, sizeof( arg1 ) );
			client_id = G_ClientNumberFromArg( arg1 );
			if (client_id == -1) 
			{ 
				trap_SendServerCommand( ent-g_entities, va("print \"Can't find client ID for %s\n\"", arg1 ) ); 
				return;
			}
			if (client_id == -2) 
			{ 
				trap_SendServerCommand( ent-g_entities, va("print \"Ambiguous client ID for %s\n\"", arg1 ) ); 
				return;
			}
			if (client_id < 0 || client_id >= MAX_CLIENTS)
			{
				trap_SendServerCommand(ent-g_entities, va("print\"Bad client ID\n\""));
				return;
			}
			if (!g_entities[client_id].inuse) 
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Client %s is not active\n\"", arg1 ) ); 
				return; 
			}
			if (client_id)
			{
				trap_SendServerCommand( ent-g_entities, va("print \"^1X:^7%d, ^1Y:^7%d, ^1Z:^7%d\n\"", (int) g_entities[client_id].client->ps.origin[0], (int) g_entities[client_id].client->ps.origin[1], (int) g_entities[client_id].client->ps.origin[2]));
				return;
			}
			else
			{
				trap_SendServerCommand( ent-g_entities, va("print \"^1X:^7%d, ^1Y:^7%d, ^1Z:^7%d\n\"", (int) ent->client->ps.origin[0], (int) ent->client->ps.origin[1], (int) ent->client->ps.origin[2]));
			}
		}
	else if ( Q_stricmp (cmd, "lockteam") == 0 ){
		char teamname[MAX_TEAMNAME];
		
		if (ent->r.svFlags & SVF_ADMIN1)
		{
			if (!(cm_adminControl1.integer & (1 << A_LOCKTEAM)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN2)
		{
			if (!(cm_adminControl2.integer & (1 << A_LOCKTEAM)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN3)
		{
			if (!(cm_adminControl3.integer & (1 << A_LOCKTEAM)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (!(ent->r.svFlags & SVF_ADMIN1) && !(ent->r.svFlags & SVF_ADMIN2) && !(ent->r.svFlags & SVF_ADMIN3)){
				trap_SendServerCommand( ent-g_entities, "print \"Must login with /adminlogin (password)\n\"" );
				return;
		}

		if ( g_gametype.integer >= GT_TEAM || g_gametype.integer == GT_FFA ) {
		
		if ( trap_Argc() != 2 ){
			trap_SendServerCommand( ent-g_entities, va("print \"Usage: /lockteam (team)\n^3TEAMS = Spectator, Blue, Red, Free\n\""));
			return;
		}
		trap_Argv( 1, teamname, sizeof( teamname ) );		
		if ( !Q_stricmp( teamname, "red" ) || !Q_stricmp( teamname, "r" ) ) {
			if (level.isLockedred == qfalse){
			level.isLockedred = qtrue;
			G_LogPrintf("LockTeam admin command executed by %s on Red Team. (locking)\n", ent->client->pers.netname);
			trap_SendServerCommand( -1, va("cp \"^7The ^1Red ^7team is now ^1Locked^7.\n\""));
			trap_SendServerCommand( -1, va("print \"^7The ^1Red ^7team is now ^1Locked^7.\n\""));
			}
			else {
			level.isLockedred = qfalse;
			G_LogPrintf("LockTeam admin command executed by %s on Red Team. (unlocking)\n", ent->client->pers.netname);
			trap_SendServerCommand( -1, va("cp \"^7The ^1Red ^7team is now ^2unLocked^7.\n\""));
			trap_SendServerCommand( -1, va("print \"^7The ^1Red ^7team is now ^2unLocked^7.\n\""));
			}
		}
		else if ( !Q_stricmp( teamname, "blue" ) || !Q_stricmp( teamname, "b" ) ) {
			if (level.isLockedblue == qfalse){
			level.isLockedblue = qtrue;
			G_LogPrintf("LockTeam admin command executed by %s on Blue Team. (locking)\n", ent->client->pers.netname);
			trap_SendServerCommand( -1, va("cp \"^7The ^4Blue ^7team is now ^1Locked^7.\n\""));
			trap_SendServerCommand( -1, va("print \"^7The ^4Blue ^7team is now ^1Locked^7.\n\""));
			}
			else {
			level.isLockedblue = qfalse;
			G_LogPrintf("LockTeam admin command executed by %s on Blue Team. (unlocking)\n", ent->client->pers.netname);
			trap_SendServerCommand( -1, va("cp \"^7The ^4Blue ^7team is now ^2unLocked^7.\n\""));
			trap_SendServerCommand( -1, va("print \"^7The ^4Blue ^7team is now ^2unLocked^7.\n\""));
			}
		}
		else if( !Q_stricmp( teamname, "spectator" ) || !Q_stricmp( teamname, "s" ) || !Q_stricmp( teamname, "spec" ) || !Q_stricmp( teamname, "spectate" ) ) {
			if (level.isLockedspec == qfalse){
			level.isLockedspec = qtrue;
			G_LogPrintf("LockTeam admin command executed by %s on Spectator Team. (locking)\n", ent->client->pers.netname);
			trap_SendServerCommand( -1, va("cp \"^7The ^3Spectator ^7team is now ^1Locked^7.\n\""));
			trap_SendServerCommand( -1, va("print \"^7The ^3Spectator ^7team is now ^1Locked^7.\n\""));
			}
			else {
			level.isLockedspec = qfalse;
			G_LogPrintf("LockTeam admin command executed by %s on Spectator Team. (locking)\n", ent->client->pers.netname);
			trap_SendServerCommand( -1, va("cp \"^7The ^3Spectator ^7team is now ^2unLocked^7.\n\""));
			trap_SendServerCommand( -1, va("print \"^7The ^3Spectator ^7team is now ^2unLocked^7.\n\""));
			}
		}
		else if( !Q_stricmp( teamname, "join" ) || !Q_stricmp( teamname, "free" ) || !Q_stricmp( teamname, "enter" )
			 || !Q_stricmp( teamname, "f" ) || !Q_stricmp( teamname, "j" )) {
			if (level.isLockedjoin == qfalse){
			level.isLockedjoin = qtrue;
			G_LogPrintf("LockTeam admin command executed by %s on Join Team. (locking)\n", ent->client->pers.netname);
			trap_SendServerCommand( -1, va("cp \"^7The ^2Join ^7team is now ^1Locked^7.\n\""));
			trap_SendServerCommand( -1, va("print \"^7The ^2Join ^7team is now ^1Locked^7.\n\""));
			}
			else {
			level.isLockedjoin = qfalse;
			G_LogPrintf("LockTeam admin command executed by %s on Join Team. (unlocking)\n", ent->client->pers.netname);
			trap_SendServerCommand( -1, va("cp \"^7The ^2Join ^7team is now ^2unLocked^7.\n\""));
			trap_SendServerCommand( -1, va("print \"^7The ^2Join ^7team is now ^2unLocked^7.\n\""));
			}
		}
		else {
			trap_SendServerCommand( ent-g_entities, va("print \"Usage: /lockteam (team)\n^3TEAMS = Spectator, Blue, Red, Join\n\""));
			return;
			}
		}
		else
		{
			trap_SendServerCommand( ent-g_entities, va("print \"You cant lock the teams in this gameplay\n\""));
			return;
		}
	}
	else if (Q_stricmp(cmd, "forceteam") == 0)
	{
		char arg1[MAX_STRING_CHARS]; 
		char teamname[MAX_STRING_CHARS];
		int clientid;

		if (ent->r.svFlags & SVF_ADMIN1)
		{
			if (!(cm_adminControl1.integer & (1 << A_FORCETEAM)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN2)
		{
			if (!(cm_adminControl2.integer & (1 << A_FORCETEAM)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN3)
		{
			if (!(cm_adminControl3.integer & (1 << A_FORCETEAM)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (!(ent->r.svFlags & SVF_ADMIN1) && !(ent->r.svFlags & SVF_ADMIN2) && !(ent->r.svFlags & SVF_ADMIN3)){
				trap_SendServerCommand( ent-g_entities, "print \"Must login with /adminlogin (password)\n\"" );
				return;
		}

		if ( trap_Argc() != 3 ) 
         { 
            trap_SendServerCommand( ent-g_entities, "print \"Usage: /forceteam (team)\nTEAMS = Spectator, Blue, Red, Free\n\"" ); 
            return; 
         }
		if ( g_gametype.integer <= GT_TEAM && g_gametype.integer != GT_FFA ) {
			trap_SendServerCommand( ent-g_entities, va("print \"Can't use this command in this gametype\n\"" ) ); 
            return;
		}
			trap_Argv( 1, arg1, sizeof( arg1 ) );
			clientid = G_ClientNumberFromArg( arg1 );
			if (clientid == -1) 
         { 
            trap_SendServerCommand( ent-g_entities, va("print \"Can't find client ID for %s\n\"", arg1 ) ); 
            return; 
         } 
         if (clientid == -2) 
         { 
            trap_SendServerCommand( ent-g_entities, va("print \"Ambiguous client ID for %s\n\"", arg1 ) ); 
            return; 
         }
		 if (clientid < 0 || clientid >= MAX_CLIENTS)
		 {
			trap_SendServerCommand(ent-g_entities, va("print\"Bad client ID\n\""));
			return;
		 }
         if (!g_entities[clientid].inuse) 
         {
            trap_SendServerCommand( ent-g_entities, va("print \"Client %s is not active\n\"", arg1 ) ); 
            return; 
         }
			trap_Argv( 2, teamname, sizeof( teamname ) );
		if ( !Q_stricmp( teamname, "red" ) || !Q_stricmp( teamname, "r" ) ) {
			if (g_gametype.integer <= GT_TEAM){
				return;
			}
			SetTeam(&g_entities[clientid], "red" );
			trap_SendServerCommand( -1, va("print \"%s ^7has been forced to the ^1Red ^7team.\n\"", g_entities[clientid].client->pers.netname) );
			trap_SendServerCommand( -1, va("cp \"%s ^7has been forced to the ^1Red ^7team.\n\"", g_entities[clientid].client->pers.netname) );
		}
		else if ( !Q_stricmp( teamname, "blue" ) || !Q_stricmp( teamname, "b" ) ) {
			if (g_gametype.integer <= GT_TEAM){
				return;
			}
			SetTeam(&g_entities[clientid], "blue" );
			trap_SendServerCommand( -1, va("print \"%s ^7has been forced to the ^4blue ^7team.\n\"", g_entities[clientid].client->pers.netname) );
			trap_SendServerCommand( -1, va("cp \"%s ^7has been forced to the ^4blue ^7team.\n\"", g_entities[clientid].client->pers.netname) );
		}
		else if ( !Q_stricmp( teamname, "spectate" ) || !Q_stricmp( teamname, "spectator" )  || !Q_stricmp( teamname, "spec" ) || !Q_stricmp( teamname, "s" )) {
			SetTeam(&g_entities[clientid], "spectator" );
			trap_SendServerCommand( -1, va("print \"%s ^7has been forced to the ^3Spectator ^7team.\n\"", g_entities[clientid].client->pers.netname) );
			trap_SendServerCommand( -1, va("cp \"%s ^7has been forced to ^3Spectator ^7team.\n\"", g_entities[clientid].client->pers.netname) );
		}
		else if ( !Q_stricmp( teamname, "enter" ) || !Q_stricmp( teamname, "free" ) || !Q_stricmp( teamname, "join" ) || !Q_stricmp( teamname, "j" )
			 || !Q_stricmp( teamname, "f" )) {
			SetTeam(&g_entities[clientid], "free" );
			trap_SendServerCommand( -1, va("print \"%s ^7has been forced to the ^2Join ^7team.\n\"", g_entities[clientid].client->pers.netname) );
			trap_SendServerCommand( -1, va("cp \"%s ^7has been forced to the ^2Join ^7team.\n\"", g_entities[clientid].client->pers.netname) );
		}
	}
	else if (Q_stricmp(cmd, "slap") == 0)
	{
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];

		if (ent->r.svFlags & SVF_ADMIN1)
		{
			if (!(cm_adminControl1.integer & (1 << A_SLAP)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN2)
		{
			if (!(cm_adminControl2.integer & (1 << A_SLAP)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN3)
		{
			if (!(cm_adminControl3.integer & (1 << A_SLAP)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (!(ent->r.svFlags & SVF_ADMIN1) && !(ent->r.svFlags & SVF_ADMIN2) && !(ent->r.svFlags & SVF_ADMIN3)){
				trap_SendServerCommand( ent-g_entities, "print \"Must login with /adminlogin (password)\n\"" );
				return;
		}

		if (g_gametype.integer == GT_TOURNAMENT || g_gametype.integer == GT_TEAM ||
			g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY || 
			g_gametype.integer == GT_JEDIMASTER || g_gametype.integer == GT_HOLOCRON) {
				trap_SendServerCommand( ent-g_entities, va("print \"Cannot use this admin command in this gametype.\n\"" ) );
				return;
		}
		if ( trap_Argc() != 2 )
		{ 
			trap_SendServerCommand( ent-g_entities, "print \"Usage: ^3/slap (client)\n\"" ); 
			return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
        if (client_id == -1) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Can't find client ID for %s\n\"", arg1 ) ); 
           return;
        }
        if (client_id == -2) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Ambiguous client ID for %s\n\"", arg1 ) ); 
           return;
        }
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			trap_SendServerCommand(ent-g_entities, va("print\"Bad client ID\n\""));
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
           trap_SendServerCommand( ent-g_entities, va("print \"Client %s is not active\n\"", arg1 ) ); 
           return; 
        }
		if (g_entities[client_id].client->ps.duelInProgress){
			trap_SendServerCommand( ent-g_entities, va("print \"Client %s is in a duel\n\"", arg1 ) ); 
           return;
		}
		g_entities[client_id].client->ps.forceHandExtend = HANDEXTEND_KNOCKDOWN;
		g_entities[client_id].client->ps.forceDodgeAnim = 0;
		g_entities[client_id].client->ps.velocity[2] = 600;
		g_entities[client_id].client->ps.forceHandExtendTime = level.time + 2400;
		g_entities[client_id].client->ps.quickerGetup = qfalse;
		trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_slap_saying.string ) );
		trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_slap_saying.string ) ); 
	}
	else if (Q_stricmp(cmd, "changemode") == 0)
	{
		int i;
		char arg[MAX_STRING_CHARS];
		gentity_t * targetplayer;
		trap_Argv(1, arg, sizeof(arg));
		if (ent->r.svFlags & SVF_ADMIN1)
		{
			if (!(cm_adminControl1.integer & (1 << A_MODE)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN2)
		{
			if (!(cm_adminControl2.integer & (1 << A_MODE)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN3)
		{
			if (!(cm_adminControl3.integer & (1 << A_MODE)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (!(ent->r.svFlags & SVF_ADMIN1) && !(ent->r.svFlags & SVF_ADMIN2) && !(ent->r.svFlags & SVF_ADMIN3)){
				trap_SendServerCommand( ent-g_entities, "print \"Must login with /adminlogin (password)\n\"" );
				return;
		}
		if ( trap_Argc() < 2 )
		{ 
			trap_SendServerCommand( ent-g_entities, "print \"Usage: ^3/changemode (mode)\nmodes = clanmatch clanmeeting\n\"" ); 
			return; 
		}
		if ( !Q_stricmp( arg, "clanmeeting" ) || !Q_stricmp( arg, "meeting" ) ) {
			if ( g_gametype.integer != GT_FFA ) {
					trap_SendServerCommand( ent-g_entities, "print \"ClanMeeting mode can only be used during FFA gametype.\n\"");
					return;
				}
			if ((level.matchMode == qfalse) && (level.meetingMode == qfalse)){
				level.meetingMode = qtrue;
				G_LogPrintf("ChangeMode admin command executed by %s. (START: ClanMeeting)\n", ent->client->pers.netname);
				trap_SendServerCommand( -1, va("cp \"^7A ^3clan meeting^7 has begun!\n\""));
				trap_SendServerCommand( -1, va("print \"^7A ^3clan meeting^7 has begun!\n\""));
			} else if (level.meetingMode == qtrue) {
				level.meetingMode = qfalse;
				for( i = 0; i < level.maxclients; i++ )
					{
						targetplayer = &g_entities[i];
						if( targetplayer->client && targetplayer->client->pers.connected ){
							targetplayer->client->ps.forceRestricted = qfalse;
						}
					}
				trap_SendServerCommand( -1, va("cp \"^7The ^1clan meeting^7 has stopped!\n\""));
				trap_SendServerCommand( -1, va("print \"^7The ^1clan meeting^7 has stopped!\n\""));
			} else {
				trap_SendServerCommand( ent-g_entities, "print \"A mode is already enabled\n\"" );
				return;
			}
		}
		else if ( !Q_stricmp( arg, "clanmatch" ) || !Q_stricmp( arg, "match" ) ) {
			if ( g_gametype.integer != GT_TEAM ) {
					trap_SendServerCommand( ent-g_entities, "print \"ClanMatch mode can only be used during TFFA gametype.\n\"");
					return;
				}
			if ((level.matchMode == qfalse) && (level.meetingMode == qfalse)){
				level.matchMode = qtrue;
				G_LogPrintf("ChangeMode admin command executed by %s. (START: ClanMatch)\n", ent->client->pers.netname);
				trap_SendServerCommand( -1, va("cp \"^7A ^3clan match^7 has begun!\n\""));
				trap_SendServerCommand( -1, va("print \"^7A ^3clan match^7 has begun!\n\""));
			} else if (level.matchMode == qtrue) {
				level.matchMode = qfalse;
				for( i = 0; i < level.maxclients; i++ )
					{
						targetplayer = &g_entities[i];
						if( targetplayer->client && targetplayer->client->pers.connected && targetplayer->r.svFlags & SVF_BOT ){
								SetTeam(targetplayer, "free" );
						}
					}
				trap_SendServerCommand( -1, va("cp \"^7The ^1clan match^7 has stopped!\n\""));
				trap_SendServerCommand( -1, va("print \"^7The ^1clan match^7 has stopped!\n\""));
			}
			else {
				trap_SendServerCommand( ent-g_entities, "print \"A mode is already enabled\n\"" );
				return;
			}
		}
	}
	else if (Q_stricmp(cmd, "csprint") == 0)
	{
		int client_id = -1;
		char arg[MAX_STRING_CHARS];
		int pos = 0;
		char real_msg[MAX_STRING_CHARS];
		char *msg = ConcatArgs(2); 
		while(*msg) { 
			if(msg[0] == '\\' && msg[1] == 'n') { 
				msg++;
				real_msg[pos++] = '\n'; 
			} else { 
				real_msg[pos++] = *msg;
			} 
				msg++;
		}
		real_msg[pos] = 0;
		trap_Argv(1, arg, sizeof(arg));
		if(Q_stricmp(arg, "all") == 0)
		{
			trap_SendServerCommand( -1, va("cp \"%s\"", real_msg) );
			return;
		}
		client_id = G_ClientNumberFromArg( arg );
		if (ent->r.svFlags & SVF_ADMIN1)
		{
			if (!(cm_adminControl1.integer & (1 << A_CSPRINT)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN2)
		{
			if (!(cm_adminControl2.integer & (1 << A_CSPRINT)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN3)
		{
			if (!(cm_adminControl3.integer & (1 << A_CSPRINT)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (!(ent->r.svFlags & SVF_ADMIN1) && !(ent->r.svFlags & SVF_ADMIN2) && !(ent->r.svFlags & SVF_ADMIN3)){
				trap_SendServerCommand( ent-g_entities, "print \"Must login with /adminlogin (password)\n\"" );
				return;
		}
		if ( trap_Argc() != 3 )
		{ 
			trap_SendServerCommand( ent-g_entities, va("print \"Usage: ^3/csprint (client) (message)\n/csprint all (message)\n\"") ); 
			return; 
		}
		if (client_id == -1) 
        { 
			trap_SendServerCommand( ent-g_entities, va("print \"Can't find client ID for %s\n\"", arg) ); 
			return; 
        } 
        if (client_id == -2) 
        { 
			trap_SendServerCommand( ent-g_entities, va("print \"Ambiguous client ID for %s\n\"", arg) ); 
            return; 
        }
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			trap_SendServerCommand(ent-g_entities, va("print\"Bad client ID\n\""));
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
			trap_SendServerCommand( ent-g_entities, va("print \"Client %s is not active\n\"", arg) );
			return; 
        }
		trap_SendServerCommand(client_id, va("cp \"%s\"", real_msg) );
	}
	else if (Q_stricmp(cmd, "slay") == 0)
	{
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];

		if (ent->r.svFlags & SVF_ADMIN1)
		{
			if (!(cm_adminControl1.integer & (1 << A_SLAY)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN2)
		{
			if (!(cm_adminControl2.integer & (1 << A_SLAY)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN3)
		{
			if (!(cm_adminControl3.integer & (1 << A_SLAY)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (!(ent->r.svFlags & SVF_ADMIN1) && !(ent->r.svFlags & SVF_ADMIN2) && !(ent->r.svFlags & SVF_ADMIN3)){
				trap_SendServerCommand( ent-g_entities, "print \"Must login with /adminlogin (password)\n\"" );
				return;
		}

		if (g_gametype.integer == GT_TOURNAMENT || g_gametype.integer == GT_TEAM ||
			g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY || 
			g_gametype.integer == GT_JEDIMASTER || g_gametype.integer == GT_HOLOCRON) {
				trap_SendServerCommand( ent-g_entities, va("print \"Cannot use this admin command in this gametype.\n\"" ) );
				return;
		}
		if ( trap_Argc() != 2 )
		{ 
			trap_SendServerCommand( ent-g_entities, "print \"Usage: ^3/slay (client)\n\"" ); 
			return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
        if (client_id == -1) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Can't find client ID for %s\n\"", arg1 ) ); 
           return;
        }
        if (client_id == -2) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Ambiguous client ID for %s\n\"", arg1 ) ); 
           return;
        }
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			trap_SendServerCommand(ent-g_entities, va("print\"Bad client ID\n\""));
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
           trap_SendServerCommand( ent-g_entities, va("print \"Client %s is not active\n\"", arg1 ) ); 
           return; 
        }
		if (g_entities[client_id].client->ps.duelInProgress){
			trap_SendServerCommand( ent-g_entities, va("print \"Client %s is in a duel\n\"", arg1 ) ); 
           return;
		}
		if (client_id >= 0 && client_id < MAX_GENTITIES)
			{
				gentity_t *kEnt = &g_entities[client_id];

				if (kEnt->inuse && kEnt->client)
				{
					g_entities[client_id].flags &= ~FL_GODMODE;
					g_entities[client_id].client->ps.stats[STAT_HEALTH] = kEnt->health = -999;
					player_die (kEnt, kEnt, kEnt, 100000, MOD_SUICIDE);
					G_LogPrintf("Slay admin command executed by %s on %s.\n", ent->client->pers.netname, g_entities[client_id].client->pers.netname);
					trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_slay_saying.string ) );
					trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_slay_saying.string ) ); 
				}
			}
	}
	else if (Q_stricmp(cmd, "rename") == 0)
	{
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];
		char arg2[MAX_STRING_CHARS];

		if (ent->r.svFlags & SVF_ADMIN1)
		{
			if (!(cm_adminControl1.integer & (1 << A_RENAME)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN2)
		{
			if (!(cm_adminControl2.integer & (1 << A_RENAME)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN3)
		{
			if (!(cm_adminControl3.integer & (1 << A_RENAME)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (!(ent->r.svFlags & SVF_ADMIN1) && !(ent->r.svFlags & SVF_ADMIN2) && !(ent->r.svFlags & SVF_ADMIN3)){
				trap_SendServerCommand( ent-g_entities, "print \"Must login with /adminlogin (password)\n\"" );
				return;
		}

		if ( trap_Argc() != 3 )
		{ 
				trap_SendServerCommand( ent-g_entities, "print \"Usage: ^3/rename (client) (new name)\n\"" ); 
				return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
        if (client_id == -1) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Can't find client ID for %s\n\"", arg1 ) ); 
           return;
        }
        if (client_id == -2) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Ambiguous client ID for %s\n\"", arg1 ) ); 
           return;
        }
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			trap_SendServerCommand(ent-g_entities, va("print\"Bad client ID\n\""));
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
           trap_SendServerCommand( ent-g_entities, va("print \"Client %s is not active\n\"", arg1 ) ); 
           return; 
        }
		trap_Argv( 2, arg2, sizeof( arg2 ) );
		uwRename(&g_entities[client_id], arg2);
		trap_SendServerCommand( client_id, va("cp \"^7You've been renamed to\n^7%s\n\"", arg2) );
		trap_SendServerCommand( -1, va("print \"%s ^7has been renamed by an admin.\n\"", g_entities[client_id].client->pers.netname ) ); 
	}
	else if (Q_stricmp(cmd, "silence") == 0)
	{
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];

		if (ent->r.svFlags & SVF_ADMIN1)
		{
			if (!(cm_adminControl1.integer & (1 << A_SILENCE)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN2)
		{
			if (!(cm_adminControl2.integer & (1 << A_SILENCE)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN3)
		{
			if (!(cm_adminControl3.integer & (1 << A_SILENCE)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (!(ent->r.svFlags & SVF_ADMIN1) && !(ent->r.svFlags & SVF_ADMIN2) && !(ent->r.svFlags & SVF_ADMIN3)){
				trap_SendServerCommand( ent-g_entities, "print \"Must login with /adminlogin (password)\n\"" );
				return;
		}

		if ( trap_Argc() != 2 )
		{ 
				trap_SendServerCommand( ent-g_entities, "print \"Usage: ^3/silence (client)\n\"" ); 
				return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
        if (client_id == -1) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Can't find client ID for %s\n\"", arg1 ) ); 
           return;
        }
        if (client_id == -2) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Ambiguous client ID for %s\n\"", arg1 ) ); 
           return;
        }
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			trap_SendServerCommand(ent-g_entities, va("print\"Bad client ID\n\""));
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
           trap_SendServerCommand( ent-g_entities, va("print \"Client %s is not active\n\"", arg1 ) ); 
           return; 
        }
		if (g_entities[client_id].client->ps.duelInProgress){
			trap_SendServerCommand( ent-g_entities, va("print \"Client %s is in a duel\n\"", arg1 ) ); 
           return;
		}
		if (g_entities[client_id].client->pers.ampunish == qtrue){
			trap_SendServerCommand( ent-g_entities, va("print \"Client %s is currently being punished\n\"", arg1 ) ); 
           return;
		}
		if (g_entities[client_id].client->pers.amsilence == qtrue){
			g_entities[client_id].client->pers.amsilence = qfalse;
			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_silence_off_saying.string ) );
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_silence_off_saying.string ) ); 
		} else {
			g_entities[client_id].client->pers.amsilence = qtrue;
			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_silence_on_saying.string ) );
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_silence_on_saying.string ) ); 
		}
	}
	else if (Q_stricmp(cmd, "punish") == 0)
	{
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];

		if (ent->r.svFlags & SVF_ADMIN1)
		{
			if (!(cm_adminControl1.integer & (1 << A_PUNISH)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN2)
		{
			if (!(cm_adminControl2.integer & (1 << A_PUNISH)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN3)
		{
			if (!(cm_adminControl3.integer & (1 << A_PUNISH)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (!(ent->r.svFlags & SVF_ADMIN1) && !(ent->r.svFlags & SVF_ADMIN2) && !(ent->r.svFlags & SVF_ADMIN3)){
				trap_SendServerCommand( ent-g_entities, "print \"Must login with /adminlogin (password)\n\"" );
				return;
		}

		if ( trap_Argc() != 2 )
		{ 
				trap_SendServerCommand( ent-g_entities, "print \"Usage: ^3/punish (client)\n\"" ); 
				return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
        if (client_id == -1) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Can't find client ID for %s\n\"", arg1 ) ); 
           return;
        }
        if (client_id == -2) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Ambiguous client ID for %s\n\"", arg1 ) ); 
           return;
        }
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			trap_SendServerCommand(ent-g_entities, va("print\"Bad client ID\n\""));
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
           trap_SendServerCommand( ent-g_entities, va("print \"Client %s is not active\n\"", arg1 ) ); 
           return; 
        }
		if (g_entities[client_id].client->ps.duelInProgress){
			trap_SendServerCommand( ent-g_entities, va("print \"Client %s is in a duel\n\"", arg1 ) ); 
           return;
		}
		//REMOVE
		if (g_entities[client_id].client->pers.ampunish == qtrue){
			g_entities[client_id].client->pers.ampunish = qfalse;
			g_entities[client_id].client->ps.pm_type &= ~PM_FLOAT;
			g_entities[client_id].flags &= ~FL_GODMODE;
			g_entities[client_id].client->ps.weaponTime = 0;
			g_entities[client_id].client->ps.forceRestricted = qfalse;
			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_punish_off_saying.string ) );
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_punish_off_saying.string ) ); 
		//APPLY
		} else {
			g_entities[client_id].client->pers.ampunish = qtrue;
			g_entities[client_id].client->pers.amsilence = qfalse;
			g_entities[client_id].flags |= FL_GODMODE;
			g_entities[client_id].client->ps.forceRestricted = qtrue;
			g_entities[client_id].client->ps.saberHolstered = qtrue;
			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_punish_on_saying.string ) );
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_punish_on_saying.string ) ); 
		}
	}
	else if (Q_stricmp(cmd, "sleep") == 0)
	{
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];

		if (ent->r.svFlags & SVF_ADMIN1)
		{
			if (!(cm_adminControl1.integer & (1 << A_SLEEP)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN2)
		{
			if (!(cm_adminControl2.integer & (1 << A_SLEEP)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN3)
		{
			if (!(cm_adminControl3.integer & (1 << A_SLEEP)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (!(ent->r.svFlags & SVF_ADMIN1) && !(ent->r.svFlags & SVF_ADMIN2) && !(ent->r.svFlags & SVF_ADMIN3)){
				trap_SendServerCommand( ent-g_entities, "print \"Must login with /adminlogin (password)\n\"" );
				return;
		}

		if ( trap_Argc() != 2 )
		{ 
				trap_SendServerCommand( ent-g_entities, "print \"Usage: ^3/sleep (client)\n\"" ); 
				return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
        if (client_id == -1) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Can't find client ID for %s\n\"", arg1 ) ); 
           return;
        }
        if (client_id == -2) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Ambiguous client ID for %s\n\"", arg1 ) ); 
           return;
        }
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			trap_SendServerCommand(ent-g_entities, va("print\"Bad client ID\n\""));
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
           trap_SendServerCommand( ent-g_entities, va("print \"Client %s is not active\n\"", arg1 ) ); 
           return; 
        }
		if (g_entities[client_id].client->ps.duelInProgress){
			trap_SendServerCommand( ent-g_entities, va("print \"Client %s is in a duel\n\"", arg1 ) ); 
           return;
		}
		//REMOVE
		if (g_entities[client_id].client->pers.amsleep == qtrue){
			g_entities[client_id].client->pers.amsleep = qfalse;
			g_entities[client_id].client->ps.forceHandExtendTime = 100;
			g_entities[client_id].flags &= ~FL_GODMODE;
			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_sleep_off_saying.string ) );
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_sleep_off_saying.string ) ); 
		//APPLY
		} else {
			g_entities[client_id].client->pers.amsleep = qtrue;
			g_entities[client_id].client->ps.forceHandExtend = HANDEXTEND_KNOCKDOWN;
			g_entities[client_id].client->ps.forceDodgeAnim = 0;
			g_entities[client_id].client->ps.forceHandExtendTime = Q3_INFINITE;
			g_entities[client_id].client->ps.quickerGetup = qfalse;
			g_entities[client_id].client->ps.saberHolstered = qtrue;
			g_entities[client_id].flags |= FL_GODMODE;
			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_sleep_on_saying.string ) );
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_sleep_on_saying.string ) ); 
		}
	}
	else if (Q_stricmp(cmd, "testsaber") == 0){
		if (ent->client->pers.dualBlade == qtrue){
			trap_SendServerCommand( ent-g_entities, va("print \"You have pers.dualBlade\n\"") );
		}
		else {
			trap_SendServerCommand( ent-g_entities, va("print \"You DONT have pers.dualBlade\n\"") );
		}
	}
	else if (Q_stricmp(cmd, "empower") == 0){
		int f, i;
		vec3_t v;
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];

		if (ent->r.svFlags & SVF_ADMIN1)
		{
			if (!(cm_adminControl1.integer & (1 << A_EMPOWER)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN2)
		{
			if (!(cm_adminControl2.integer & (1 << A_EMPOWER)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN3)
		{
			if (!(cm_adminControl3.integer & (1 << A_EMPOWER)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (!(ent->r.svFlags & SVF_ADMIN1) && !(ent->r.svFlags & SVF_ADMIN2) && !(ent->r.svFlags & SVF_ADMIN3)){
				trap_SendServerCommand( ent-g_entities, "print \"Must login with /adminlogin (password)\n\"" );
				return;
		}

		if (g_gametype.integer == GT_TOURNAMENT || g_gametype.integer == GT_TEAM ||
			g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY || 
			g_gametype.integer == GT_JEDIMASTER || g_gametype.integer == GT_HOLOCRON) {
				trap_SendServerCommand( ent-g_entities, va("print \"Cannot use this admin command in this gametype.\n\"" ) );
				return;
		}
		if ( trap_Argc() > 2 )
		{ 
				trap_SendServerCommand( ent-g_entities, "print \"Usage: ^3/empower (client)\n\"" ); 
				return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
		if ( trap_Argc() < 2 )
        {
			client_id = ent->client->ps.clientNum;
		}
        if (client_id == -1) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Can't find client ID for %s\n\"", arg1 ) ); 
           return;
        }
        if (client_id == -2) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Ambiguous client ID for %s\n\"", arg1 ) ); 
           return;
        }
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			trap_SendServerCommand(ent-g_entities, va("print\"Bad client ID\n\""));
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
           trap_SendServerCommand( ent-g_entities, va("print \"Client %s is not active\n\"", arg1 ) ); 
           return; 
        }
		if (g_entities[client_id].client->ps.duelInProgress){
			trap_SendServerCommand( ent-g_entities, va("print \"Client %s is in a duel\n\"", arg1 ) ); 
           return;
		}
		//REMOVE
		if (g_entities[client_id].client->pers.amempower == qtrue)
		{
			g_entities[client_id].client->ps.isJediMaster = qfalse;
			g_entities[client_id].client->pers.amempower = qfalse;
			for( f = 0; f < NUM_FORCE_POWERS; f ++ ) {
				g_entities[client_id].client->ps.fd.forcePowerLevel[f] = g_entities[client_id].client->pers.forcePowerLevelSaved[f];
			}
			g_entities[client_id].client->ps.fd.forcePowersKnown = g_entities[client_id].client->pers.forcePowersKnownSaved;
			G_LogPrintf("Empower admin command executed by %s on %s. (removing)\n", ent->client->pers.netname, g_entities[client_id].client->pers.netname);
			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_empower_off_saying.string ) );
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_empower_off_saying.string ) );
		}
		//APPLY
		else {
			G_PlayEffect(EFFECT_SMOKE, g_entities[client_id].r.currentOrigin, v);
			G_ScreenShake(g_entities[client_id].client->ps.origin, NULL, 10.0f, 800, qtrue);
			G_LogPrintf("Empower admin command executed by %s on %s. (applying)\n", ent->client->pers.netname, g_entities[client_id].client->pers.netname);
			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_empower_on_saying.string ) );
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_empower_on_saying.string ) ); 
			g_entities[client_id].client->pers.amempower = qtrue;
			g_entities[client_id].client->ps.isJediMaster = qtrue;
			for( f = 0; f < NUM_FORCE_POWERS; f ++ ) {
				g_entities[client_id].client->pers.forcePowerLevelSaved[f] = g_entities[client_id].client->ps.fd.forcePowerLevel[f];
				g_entities[client_id].client->ps.fd.forcePowerLevel[f] = FORCE_LEVEL_3;
			}
			g_entities[client_id].client->pers.forcePowersKnownSaved = g_entities[client_id].client->ps.fd.forcePowersKnown;
			if ( g_gametype.integer >= GT_TEAM) {
				g_entities[client_id].client->ps.fd.forcePowersKnown = ( 1 << FP_HEAL | 1 << FP_SPEED | 1 << FP_PUSH | 1 << FP_PULL | 
												1 << FP_TELEPATHY | 1 << FP_GRIP | 1 << FP_LIGHTNING | 1 << FP_RAGE | 
												1 << FP_PROTECT | 1 << FP_ABSORB | 1 << FP_TEAM_HEAL | 1 << FP_TEAM_FORCE | 
												1 << FP_DRAIN | 1 << FP_SEE);
			}
			else{
				g_entities[client_id].client->ps.fd.forcePowersKnown = ( 1 << FP_HEAL | 1 << FP_SPEED | 1 << FP_PUSH | 1 << FP_PULL | 
												1 << FP_TELEPATHY | 1 << FP_GRIP | 1 << FP_LIGHTNING | 1 << FP_RAGE | 
												1 << FP_PROTECT | 1 << FP_ABSORB | 1 << FP_DRAIN | 1 << FP_SEE);
			}
			for( i = 0; i < NUM_FORCE_POWERS; i ++ ){
				g_entities[client_id].client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_3;
			}
			//REMOVE TERMINATOR
			if (g_entities[client_id].client->pers.amterminator == qtrue)
			{
				for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
					g_entities[client_id].client->ps.ammo[i] = 0;
				}
				g_entities[client_id].client->pers.amterminator = qfalse;
				g_entities[client_id].client->ps.weapon = WP_SABER;
				g_entities[client_id].client->ps.forceRestricted = qfalse;
				g_entities[client_id].client->ps.stats[STAT_WEAPONS] &= ~(1 << WP_STUN_BATON) & ~(1 << WP_BLASTER) & ~(1 << WP_DISRUPTOR)
					 & ~(1 << WP_BOWCASTER) & ~(1 << WP_REPEATER) & ~(1 << WP_DEMP2) & ~(1 << WP_FLECHETTE) & ~(1 << WP_ROCKET_LAUNCHER) & ~(1 << WP_THERMAL)
					 & ~(1 << WP_TRIP_MINE) & ~(1 << WP_DET_PACK);
				g_entities[client_id].client->ps.stats[STAT_HOLDABLE_ITEMS] &= ~(1 << HI_BINOCULARS) & ~(1 << HI_SEEKER) & ~(1 << HI_MEDPAC) & ~(1 << HI_SHIELD) & ~(1 << HI_SENTRY_GUN);
				if (!(g_weaponDisable.integer & (1 << WP_BRYAR_PISTOL))) {
					g_entities[client_id].client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BRYAR_PISTOL );
				} else {
					g_entities[client_id].client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_BRYAR_PISTOL );
				}
			}
		}
	}
	else if (Q_stricmp(cmd, "terminator") == 0){
		int i, f;
		vec3_t v;
		int	num = 999;
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];

		if (ent->r.svFlags & SVF_ADMIN1)
		{
			if (!(cm_adminControl1.integer & (1 << A_TERMINATOR)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN2)
		{
			if (!(cm_adminControl2.integer & (1 << A_TERMINATOR)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN3)
		{
			if (!(cm_adminControl3.integer & (1 << A_TERMINATOR)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (!(ent->r.svFlags & SVF_ADMIN1) && !(ent->r.svFlags & SVF_ADMIN2) && !(ent->r.svFlags & SVF_ADMIN3)){
				trap_SendServerCommand( ent-g_entities, "print \"Must login with /adminlogin (password)\n\"" );
				return;
		}

		if (g_gametype.integer == GT_TOURNAMENT || g_gametype.integer == GT_TEAM ||
			g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY || 
			g_gametype.integer == GT_JEDIMASTER || g_gametype.integer == GT_HOLOCRON) {
				trap_SendServerCommand( ent-g_entities, va("print \"Cannot use this admin command in this gametype.\n\"" ) );
				return;
		}
		if ( trap_Argc() > 2 )
		{ 
				trap_SendServerCommand( ent-g_entities, "print \"Usage: ^3/terminator (client)\n\"" ); 
				return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
		if ( trap_Argc() < 2 )
        {
			client_id = ent->client->ps.clientNum;
		}
        if (client_id == -1) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Can't find client ID for %s\n\"", arg1 ) ); 
           return;
        }
        if (client_id == -2) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Ambiguous client ID for %s\n\"", arg1 ) ); 
           return;
        }
		if ( client_id < 0 || client_id >= MAX_CLIENTS )
		{
			trap_SendServerCommand(ent-g_entities, va("print\"Bad client ID\n\""));
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
           trap_SendServerCommand( ent-g_entities, va("print \"Client %s is not active\n\"", arg1 ) ); 
           return; 
        }
		if (g_entities[client_id].client->ps.duelInProgress){
			trap_SendServerCommand( ent-g_entities, va("print \"Client %s is in a duel\n\"", arg1 ) ); 
           return;
		}
		//REMOVE
		if (g_entities[client_id].client->pers.amterminator == qtrue)
		{
			for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
				g_entities[client_id].client->ps.ammo[i] = 0;
			}
			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_terminator_off_saying.string ) );
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_terminator_off_saying.string ) ); 
			g_entities[client_id].client->pers.amterminator = qfalse;
			g_entities[client_id].client->ps.forceRestricted = qfalse;
			g_entities[client_id].client->ps.weapon = WP_SABER;
			g_entities[client_id].client->ps.stats[STAT_WEAPONS] &= ~(1 << WP_STUN_BATON) & ~(1 << WP_BLASTER) & ~(1 << WP_DISRUPTOR)
				 & ~(1 << WP_BOWCASTER) & ~(1 << WP_REPEATER) & ~(1 << WP_DEMP2) & ~(1 << WP_FLECHETTE) & ~(1 << WP_ROCKET_LAUNCHER) & ~(1 << WP_THERMAL)
				 & ~(1 << WP_TRIP_MINE) & ~(1 << WP_DET_PACK);
			g_entities[client_id].client->ps.stats[STAT_HOLDABLE_ITEMS] &= ~(1 << HI_BINOCULARS) & ~(1 << HI_SEEKER) & ~(1 << HI_MEDPAC) & ~(1 << HI_SHIELD) & ~(1 << HI_SENTRY_GUN);
			if (!(g_weaponDisable.integer & (1 << WP_BRYAR_PISTOL))) {
				g_entities[client_id].client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BRYAR_PISTOL );
			} else {
				g_entities[client_id].client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_BRYAR_PISTOL );
			}
		}
		//APPLY
		else {
			for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
				g_entities[client_id].client->ps.ammo[i] = num;
			}
			G_PlayEffect(EFFECT_SPARK_EXPLOSION, g_entities[client_id].r.currentOrigin, v);
			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_terminator_on_saying.string ) );
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_terminator_on_saying.string ) ); 
			G_ScreenShake(g_entities[client_id].client->ps.origin, NULL, 10.0f, 800, qtrue);
			g_entities[client_id].client->pers.amterminator = qtrue;
			g_entities[client_id].client->ps.forceRestricted = qtrue;
			g_entities[client_id].client->ps.weapon = WP_STUN_BATON;
			g_entities[client_id].client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_SABER );
			g_entities[client_id].client->ps.stats[STAT_WEAPONS] |= (1 << WP_STUN_BATON) | (1 << WP_BRYAR_PISTOL) | (1 << WP_BLASTER) | (1 << WP_DISRUPTOR)
				 | (1 << WP_BOWCASTER) | (1 << WP_REPEATER) | (1 << WP_DEMP2) | (1 << WP_FLECHETTE) | (1 << WP_ROCKET_LAUNCHER) | (1 << WP_THERMAL)
				 | (1 << WP_TRIP_MINE) | (1 << WP_DET_PACK);
			g_entities[client_id].client->ps.stats[STAT_HOLDABLE_ITEMS] |= (1 << HI_BINOCULARS) | (1 << HI_SEEKER) | (1 << HI_MEDPAC) | (1 << HI_SHIELD) | (1 << HI_SENTRY_GUN);
			//REMOVE EMPOWER
			if (g_entities[client_id].client->pers.amempower == qtrue)
				{
					g_entities[client_id].client->ps.isJediMaster = qfalse;
					g_entities[client_id].client->pers.amempower = qfalse;
					for( f = 0; f < NUM_FORCE_POWERS; f ++ ) {
						g_entities[client_id].client->ps.fd.forcePowerLevel[f] = g_entities[client_id].client->pers.forcePowerLevelSaved[f];
					}
					g_entities[client_id].client->ps.fd.forcePowersKnown = g_entities[client_id].client->pers.forcePowersKnownSaved;
				}
		}
	}
	else if (Q_stricmp(cmd, "protect") == 0){
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];

		if (ent->r.svFlags & SVF_ADMIN1)
		{
			if (!(cm_adminControl1.integer & (1 << A_PROTECT)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN2)
		{
			if (!(cm_adminControl2.integer & (1 << A_PROTECT)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN3)
		{
			if (!(cm_adminControl3.integer & (1 << A_PROTECT)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (!(ent->r.svFlags & SVF_ADMIN1) && !(ent->r.svFlags & SVF_ADMIN2) && !(ent->r.svFlags & SVF_ADMIN3)){
				trap_SendServerCommand( ent-g_entities, "print \"Must login with /adminlogin (password)\n\"" );
				return;
		}

		if (g_gametype.integer == GT_TOURNAMENT || g_gametype.integer == GT_TEAM ||
			g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY) {
				trap_SendServerCommand( ent-g_entities, va("print \"Cannot use this admin command in this gametype.\n\"" ) );
				return;
		}
		if ( trap_Argc() > 2 )
		{ 
				trap_SendServerCommand( ent-g_entities, "print \"Usage: ^3/protect (client)\n\"" ); 
				return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
		if ( trap_Argc() < 2 )
        {
			client_id = ent->client->ps.clientNum;
		}
        if (client_id == -1) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Can't find client ID for %s\n\"", arg1 ) ); 
           return;
        }
        if (client_id == -2) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Ambiguous client ID for %s\n\"", arg1 ) ); 
           return;
        }
		if ( client_id < 0 || client_id >= MAX_CLIENTS )
		{
			trap_SendServerCommand(ent-g_entities, va("print\"Bad client ID\n\""));
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
           trap_SendServerCommand( ent-g_entities, va("print \"Client %s is not active\n\"", arg1 ) ); 
           return; 
        }
		if (g_entities[client_id].client->ps.duelInProgress){
			trap_SendServerCommand( ent-g_entities, va("print \"Client %s is in a duel\n\"", arg1 ) ); 
           return;
		}
		//REMOVE
		if (g_entities[client_id].client->ps.eFlags & EF_INVULNERABLE)
		{
			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_protect_off_saying.string ) );
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_protect_off_saying.string ) ); 
			g_entities[client_id].client->ps.eFlags &= ~EF_INVULNERABLE;
			g_entities[client_id].client->invulnerableTimer = 0;
		}
		//APPLY
		else {
			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_protect_on_saying.string ) );
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_protect_on_saying.string ) ); 
			G_ScreenShake(g_entities[client_id].client->ps.origin, NULL, 10.0f, 800, qtrue);
			g_entities[client_id].client->ps.eFlags |= EF_INVULNERABLE;
			g_entities[client_id].client->invulnerableTimer = level.time + Q3_INFINITE;
		}
	}
	else if (Q_stricmp(cmd, "g2animent") == 0)
	{
		if (ent->r.svFlags & SVF_ADMIN1)
		{
			if (!(cm_adminControl1.integer & (1 << A_G2ANIMENT)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN2)
		{
			if (!(cm_adminControl2.integer & (1 << A_G2ANIMENT)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN3)
		{
			if (!(cm_adminControl3.integer & (1 << A_G2ANIMENT)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (!(ent->r.svFlags & SVF_ADMIN1) && !(ent->r.svFlags & SVF_ADMIN2) && !(ent->r.svFlags & SVF_ADMIN3)){
				trap_SendServerCommand( ent-g_entities, "print \"Must login with /adminlogin (password)\n\"" );
				return;
		}

		G_CreateExampleAnimEnt(ent);
	}
	else if (Q_stricmp(cmd, "changemap") == 0){
		char arg1[MAX_STRING_CHARS];

		if (ent->r.svFlags & SVF_ADMIN1)
		{
			if (!(cm_adminControl1.integer & (1 << A_CHANGEMAP)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN2)
		{
			if (!(cm_adminControl2.integer & (1 << A_CHANGEMAP)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN3)
		{
			if (!(cm_adminControl3.integer & (1 << A_CHANGEMAP)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (!(ent->r.svFlags & SVF_ADMIN1) && !(ent->r.svFlags & SVF_ADMIN2) && !(ent->r.svFlags & SVF_ADMIN3)){
				trap_SendServerCommand( ent-g_entities, "print \"Must login with /adminlogin (password)\n\"" );
				return;
		}

		if ( trap_Argc() != 3 )
		{ 
			trap_SendServerCommand( ent-g_entities, "print \"Usage: ^3/changemap (gametype) (map)\n\"" ); 
			return; 
		}
		trap_Argv( 1, arg1, sizeof( arg1 ) );
		trap_SendConsoleCommand( EXEC_APPEND, va("g_gametype %s\n", arg1));
		G_LogPrintf("ChangeMap admin command executed by %s to GAMETYPE:%s", ent->client->pers.netname, arg1);
		trap_Argv( 2, arg1, sizeof( arg1 ) );
		trap_SendConsoleCommand( EXEC_APPEND, va("map %s\n", arg1));
		G_LogPrintf(" MAP:%s.\n", arg1);
	}
	else if (Q_stricmp (cmd, "myadmincommands") == 0){
		if (!(ent->r.svFlags & SVF_ADMIN1) && !(ent->r.svFlags & SVF_ADMIN2) && !(ent->r.svFlags & SVF_ADMIN3)) {
				trap_SendServerCommand( ent-g_entities, va("print \"^1You are not an administrator on this server!\n\"") );
				return;
			}
		//TELEPORT CHECK
		if ((ent->r.svFlags & SVF_ADMIN1) && (cm_adminControl1.integer & (1 << A_ADMINTELE))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Teleport\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN2) && (cm_adminControl2.integer & (1 << A_ADMINTELE))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Teleport\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN3) && (cm_adminControl3.integer & (1 << A_ADMINTELE))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Teleport\n\"") ); }
		//SILENCE CHECK
		if ((ent->r.svFlags & SVF_ADMIN1) && (cm_adminControl1.integer & (1 << A_SILENCE))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Silence\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN2) && (cm_adminControl2.integer & (1 << A_SILENCE))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Silence\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN3) && (cm_adminControl3.integer & (1 << A_SILENCE))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Silence\n\"") ); }
		//PROTECT CHECK
		if ((ent->r.svFlags & SVF_ADMIN1) && (cm_adminControl1.integer & (1 << A_PROTECT))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Protect\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN2) && (cm_adminControl2.integer & (1 << A_PROTECT))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Protect\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN3) && (cm_adminControl3.integer & (1 << A_PROTECT))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Protect\n\"") ); }
		//ADMINBAN CHECK
		if ((ent->r.svFlags & SVF_ADMIN1) && (cm_adminControl1.integer & (1 << A_ADMINBAN))) {
			trap_SendServerCommand( ent-g_entities, va("print \"AdminBan\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN2) && (cm_adminControl2.integer & (1 << A_ADMINBAN))) {
			trap_SendServerCommand( ent-g_entities, va("print \"AdminBan\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN3) && (cm_adminControl3.integer & (1 << A_ADMINBAN))) {
			trap_SendServerCommand( ent-g_entities, va("print \"AdminBan\n\"") ); }
		//ADMINKICK CHECK
		if ((ent->r.svFlags & SVF_ADMIN1) && (cm_adminControl1.integer & (1 << A_ADMINKICK))) {
			trap_SendServerCommand( ent-g_entities, va("print \"AdminKick\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN2) && (cm_adminControl2.integer & (1 << A_ADMINKICK))) {
			trap_SendServerCommand( ent-g_entities, va("print \"AdminKick\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN3) && (cm_adminControl3.integer & (1 << A_ADMINKICK))) {
			trap_SendServerCommand( ent-g_entities, va("print \"AdminKick\n\"") ); }
		//G2ANIMENT CHECK
		if ((ent->r.svFlags & SVF_ADMIN1) && (cm_adminControl1.integer & (1 << A_G2ANIMENT))) {
			trap_SendServerCommand( ent-g_entities, va("print \"G2Animent\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN2) && (cm_adminControl2.integer & (1 << A_G2ANIMENT))) {
			trap_SendServerCommand( ent-g_entities, va("print \"G2Animent\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN3) && (cm_adminControl3.integer & (1 << A_G2ANIMENT))) {
			trap_SendServerCommand( ent-g_entities, va("print \"G2Animent\n\"") ); }
		//TERMINATOR CHECK
		if ((ent->r.svFlags & SVF_ADMIN1) && (cm_adminControl1.integer & (1 << A_TERMINATOR))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Terminator\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN2) && (cm_adminControl2.integer & (1 << A_TERMINATOR))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Terminator\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN3) && (cm_adminControl3.integer & (1 << A_TERMINATOR))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Terminator\n\"") ); }
		//SLAY CHECK
		if ((ent->r.svFlags & SVF_ADMIN1) && (cm_adminControl1.integer & (1 << A_SLAY))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Slay\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN2) && (cm_adminControl2.integer & (1 << A_SLAY))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Slay\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN3) && (cm_adminControl3.integer & (1 << A_SLAY))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Slay\n\"") ); }
		//CHANGEMAP CHECK
		if ((ent->r.svFlags & SVF_ADMIN1) && (cm_adminControl1.integer & (1 << A_CHANGEMAP))) {
			trap_SendServerCommand( ent-g_entities, va("print \"ChangeMap\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN2) && (cm_adminControl2.integer & (1 << A_CHANGEMAP))) {
			trap_SendServerCommand( ent-g_entities, va("print \"ChangeMap\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN3) && (cm_adminControl3.integer & (1 << A_CHANGEMAP))) {
			trap_SendServerCommand( ent-g_entities, va("print \"ChangeMap\n\"") ); }
		//EMPOWER CHECK
		if ((ent->r.svFlags & SVF_ADMIN1) && (cm_adminControl1.integer & (1 << A_EMPOWER))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Empower\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN2) && (cm_adminControl2.integer & (1 << A_EMPOWER))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Empower\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN3) && (cm_adminControl3.integer & (1 << A_EMPOWER))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Empower\n\"") ); }
		//RENAME CHECK
		if ((ent->r.svFlags & SVF_ADMIN1) && (cm_adminControl1.integer & (1 << A_RENAME))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Rename\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN2) && (cm_adminControl2.integer & (1 << A_RENAME))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Rename\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN3) && (cm_adminControl3.integer & (1 << A_RENAME))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Rename\n\"") ); }
		//FORCETEAM CHECK
		if ((ent->r.svFlags & SVF_ADMIN1) && (cm_adminControl1.integer & (1 << A_FORCETEAM))) {
			trap_SendServerCommand( ent-g_entities, va("print \"ForceTeam\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN2) && (cm_adminControl2.integer & (1 << A_FORCETEAM))) {
			trap_SendServerCommand( ent-g_entities, va("print \"ForceTeam\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN3) && (cm_adminControl3.integer & (1 << A_FORCETEAM))) {
			trap_SendServerCommand( ent-g_entities, va("print \"ForceTeam\n\"") ); }
		//PUNISH CHECK
		if ((ent->r.svFlags & SVF_ADMIN1) && (cm_adminControl1.integer & (1 << A_PUNISH))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Punish\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN2) && (cm_adminControl2.integer & (1 << A_PUNISH))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Punish\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN3) && (cm_adminControl3.integer & (1 << A_PUNISH))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Punish\n\"") ); }
		//SLEEP CHECK
		if ((ent->r.svFlags & SVF_ADMIN1) && (cm_adminControl1.integer & (1 << A_SLEEP))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Sleep\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN2) && (cm_adminControl2.integer & (1 << A_SLEEP))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Sleep\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN3) && (cm_adminControl3.integer & (1 << A_SLEEP))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Sleep\n\"") ); }
		//SLAP CHECK
		if ((ent->r.svFlags & SVF_ADMIN1) && (cm_adminControl1.integer & (1 << A_SLAP))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Slap\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN2) && (cm_adminControl2.integer & (1 << A_SLAP))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Slap\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN3) && (cm_adminControl3.integer & (1 << A_SLAP))) {
			trap_SendServerCommand( ent-g_entities, va("print \"Slap\n\"") ); }
		//LOCKTEAM CHECK
		if ((ent->r.svFlags & SVF_ADMIN1) && (cm_adminControl1.integer & (1 << A_LOCKTEAM))) {
			trap_SendServerCommand( ent-g_entities, va("print \"LockTeam\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN2) && (cm_adminControl2.integer & (1 << A_LOCKTEAM))) {
			trap_SendServerCommand( ent-g_entities, va("print \"LockTeam\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN3) && (cm_adminControl3.integer & (1 << A_LOCKTEAM))) {
			trap_SendServerCommand( ent-g_entities, va("print \"LockTeam\n\"") ); }
		//CSPRINT CHECK
		if ((ent->r.svFlags & SVF_ADMIN1) && (cm_adminControl1.integer & (1 << A_CSPRINT))) {
			trap_SendServerCommand( ent-g_entities, va("print \"CSPrint\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN2) && (cm_adminControl2.integer & (1 << A_CSPRINT))) {
			trap_SendServerCommand( ent-g_entities, va("print \"CSPrint\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN3) && (cm_adminControl3.integer & (1 << A_CSPRINT))) {
			trap_SendServerCommand( ent-g_entities, va("print \"CSPrint\n\"") ); }
		//CHANGEMODE CHECK
		if ((ent->r.svFlags & SVF_ADMIN1) && (cm_adminControl1.integer & (1 << A_MODE))) {
			trap_SendServerCommand( ent-g_entities, va("print \"ChangeMode\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN2) && (cm_adminControl2.integer & (1 << A_MODE))) {
			trap_SendServerCommand( ent-g_entities, va("print \"ChangeMode\n\"") ); }
		if ((ent->r.svFlags & SVF_ADMIN3) && (cm_adminControl3.integer & (1 << A_MODE))) {
			trap_SendServerCommand( ent-g_entities, va("print \"ChangeMode\n\"") ); }
	}
	else if (Q_stricmp(cmd, "teleport") == 0)
	{ // teleport to specific location
		vec3_t location;
		vec3_t forward;

		if (ent->r.svFlags & SVF_ADMIN1)
		{
			if (!(cm_adminControl1.integer & (1 << A_ADMINTELE)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN2)
		{
			if (!(cm_adminControl2.integer & (1 << A_ADMINTELE)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN3)
		{
			if (!(cm_adminControl3.integer & (1 << A_ADMINTELE)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (!(ent->r.svFlags & SVF_ADMIN1) && !(ent->r.svFlags & SVF_ADMIN2) && !(ent->r.svFlags & SVF_ADMIN3)){
				trap_SendServerCommand( ent-g_entities, "print \"Must login with /adminlogin (password)\n\"" );
				return;
		}

		if ( trap_Argc() == 1 || trap_Argc() > 5 )
		{
			trap_SendServerCommand( ent-g_entities, va("print \"Usage: ^3/teleport (client)\n/teleport (X Y Z)\n/teleport (client) (client)\n/teleport (client) (X Y Z)\n\"" ) );
			return;
		}
		if ( trap_Argc() == 2 )
		{
			int	client_id = -1;
			char	arg1[MAX_STRING_CHARS];
			trap_Argv( 1, arg1, sizeof( arg1 ) );
			client_id = G_ClientNumberFromArg( arg1 );

			if (client_id == -1)
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Can't find client ID for %s\n\"", arg1 ) );
				return;
			}
			if (client_id == -2)
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Ambiguous client ID for %s\n\"", arg1 ) );
				return;
			}
			if ( client_id < 0 || client_id >= MAX_CLIENTS )
			{
				trap_SendServerCommand(ent-g_entities, va("print\"Bad client ID\n\""));
				return;
			}
			if (!g_entities[client_id].inuse)
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Client %s is not active\n\"", arg1 ) );
				return;
			}
			if (g_entities[client_id].health <= 0)
			{
				return;
			}
			if ( client_id == ent->client->ps.clientNum )
			{
				trap_SendServerCommand( ent-g_entities, va("print \"You cant teleport yourself.\n\""));
				return;
			}
			VectorCopy(g_entities[client_id].client->ps.origin, location);
			AngleVectors(ent->client->ps.viewangles, forward, NULL, NULL);
			forward[2] = 0;
			VectorNormalize(forward);
			VectorMA(g_entities[client_id].client->ps.origin, 100, forward, location);
			location[2] += 5;
			TeleportPlayer(ent, location, g_entities[client_id].client->ps.viewangles);
			G_LogPrintf("Teleport admin command is executed by %s on %s.\n", ent->client->pers.netname, g_entities[client_id].client->pers.netname);
			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", ent->client->pers.netname, cm_teleport_saying.string ) );
			trap_SendServerCommand( -1, va("print \"%s^7 %s\n\"", ent->client->pers.netname, cm_teleport_saying.string ) );  
		}
		//Teleport player to player
		if ( trap_Argc() == 3 )
		{
			int	client_id = -1;
			int	client_id2 = -1;
			char	arg1[MAX_STRING_CHARS];
			char	arg2[MAX_STRING_CHARS];
			trap_Argv( 1, arg1, sizeof( arg1 ) );
			trap_Argv( 2, arg2, sizeof( arg2 ) );
			client_id = G_ClientNumberFromArg( arg1 );
			client_id2 = G_ClientNumberFromArg( arg2 );

			if (client_id == -1)
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Can't find client ID for %s\n\"", arg1 ) );
				return;
			}
			if (client_id == -2)
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Ambiguous client ID for %s\n\"", arg1 ) );
				return;
			}
			if ( client_id < 0 || client_id >= MAX_CLIENTS )
			{
				trap_SendServerCommand(ent-g_entities, va("print\"Bad client ID\n\""));
				return;
			}
			if (!g_entities[client_id].inuse)
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Client %s is not active\n\"", arg1 ) );
				return;
			}
			if (client_id2 == -1)
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Can't find client ID for %s\n\"", arg1 ) );
				return;
			}
			if (client_id2 == -2)
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Ambiguous client ID for %s\n\"", arg1 ) );
				return;
			}
			if ( client_id2 < 0 || client_id2 >= MAX_CLIENTS )
			{
				trap_SendServerCommand(ent-g_entities, va("print\"Bad client ID\n\""));
				return;
			}
			if (!g_entities[client_id2].inuse)
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Client %s is not active\n\"", arg1 ) );
				return;
			}
			if (g_entities[client_id2].health <= 0)
			{
				return;
			}

			//Copy client 2 origin
			VectorCopy(g_entities[client_id2].client->ps.origin, location);
			AngleVectors(g_entities[client_id2].client->ps.viewangles, forward, NULL, NULL);
			// set location out in front of your view
			forward[2] = 0; //no elevation change
			VectorNormalize(forward);
			VectorMA(g_entities[client_id2].client->ps.origin, 100, forward, location);
			location[2] += 5; //add just a bit of height???
			//Teleport you to them
			TeleportPlayer(&g_entities[client_id], location, g_entities[client_id2].client->ps.viewangles);
			G_LogPrintf("Teleport admin command is executed by %s on %s.\n", ent->client->pers.netname, g_entities[client_id].client->pers.netname);
			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_teleport_saying.string ) );
			trap_SendServerCommand( -1, va("print \"%s^7 %s\n\"", g_entities[client_id].client->pers.netname, cm_teleport_saying.string ) );
		}
		//Using manual coordinates
		if ( trap_Argc() == 4 )
		{
			Admin_Teleport(ent);
		}
		if ( trap_Argc() == 5 )
		{
			int	client_id = -1;			
			char	arg1[MAX_STRING_CHARS];
			vec3_t		origin;
			char		buffer[MAX_TOKEN_CHARS];	
			
			trap_Argv( 1, arg1, sizeof( arg1 ) );
			client_id = G_ClientNumberFromArg( arg1 );
			if (client_id == -1)
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Can't find client ID for %s\n\"", arg1 ) );
				return;
			}
			if (client_id == -2)
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Ambiguous client ID for %s\n\"", arg1 ) );
				return;
			}
			if ( client_id < 0 || client_id >= MAX_CLIENTS )
			{
				trap_SendServerCommand(ent-g_entities, va("print\"Bad client ID\n\""));
				return;
			}
			if (!g_entities[client_id].inuse)
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Client %s is not active\n\"", arg1 ) );
				return;
			}
			if (g_entities[client_id].health <= 0)
			{
				return;
			}
		
			trap_Argv(2, buffer, sizeof( buffer ) );
			origin[0] = atof(buffer);
			trap_Argv(3, buffer, sizeof( buffer ) );
			origin[1] = atof(buffer);
			trap_Argv(4, buffer, sizeof( buffer ) );
			origin[2] = atof(buffer);			

			TeleportPlayer( &g_entities[client_id], origin, g_entities[client_id].client->ps.viewangles );
			G_LogPrintf("Teleport admin command is executed by %s on %s.\n", ent->client->pers.netname, g_entities[client_id].client->pers.netname);
			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_teleport_saying.string ) );  
			trap_SendServerCommand( -1, va("print \"%s^7 %s\n\"", g_entities[client_id].client->pers.netname, cm_teleport_saying.string ) );  
		}
	}
	else if (Q_stricmp(cmd, "adminkick") == 0){
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];

		if (ent->r.svFlags & SVF_ADMIN1)
		{
			if (!(cm_adminControl1.integer & (1 << A_ADMINKICK)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN2)
		{
			if (!(cm_adminControl2.integer & (1 << A_ADMINKICK)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN3)
		{
			if (!(cm_adminControl3.integer & (1 << A_ADMINKICK)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (!(ent->r.svFlags & SVF_ADMIN1) && !(ent->r.svFlags & SVF_ADMIN2) && !(ent->r.svFlags & SVF_ADMIN3)){
				trap_SendServerCommand( ent-g_entities, "print \"Must login with /adminlogin (password)\n\"" );
				return;
		}

		if ( trap_Argc() > 2 )
		{ 
			trap_SendServerCommand( ent-g_entities, "print \"Usage: ^3/adminkick (client)\n\"" ); 
			return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
        if (client_id == -1) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Can't find client ID for %s\n\"", arg1 ) ); 
           return;
        }
        if (client_id == -2) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Ambiguous client ID for %s\n\"", arg1 ) ); 
           return;
        }
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			trap_SendServerCommand(ent-g_entities, va("print\"Bad client ID\n\""));
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
           trap_SendServerCommand( ent-g_entities, va("print \"Client %s is not active\n\"", arg1 ) ); 
           return; 
        }
		trap_SendConsoleCommand( EXEC_APPEND, va("clientkick %d", client_id) );
		G_LogPrintf("AdminKick command executed by %s on %s.\n", ent->client->pers.netname, g_entities[client_id].client->pers.netname);
	}
	else if (Q_stricmp(cmd, "adminban") == 0){
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];

		if (ent->r.svFlags & SVF_ADMIN1)
		{
			if (!(cm_adminControl1.integer & (1 << A_ADMINBAN)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN2)
		{
			if (!(cm_adminControl2.integer & (1 << A_ADMINBAN)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (ent->r.svFlags & SVF_ADMIN3)
		{
			if (!(cm_adminControl3.integer & (1 << A_ADMINBAN)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Command not allowed at this administration rank.\n\"") );
				return;
			}
		}
		else if (!(ent->r.svFlags & SVF_ADMIN1) && !(ent->r.svFlags & SVF_ADMIN2) && !(ent->r.svFlags & SVF_ADMIN3)){
				trap_SendServerCommand( ent-g_entities, "print \"Must login with /adminlogin (password)\n\"" );
				return;
		}

		if ( trap_Argc() > 2 )
		{ 
			trap_SendServerCommand( ent-g_entities, "print \"Usage: ^3/adminban (client)\n\"" ); 
			return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
        if (client_id == -1) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Can't find client ID for %s\n\"", arg1 ) ); 
           return;
        }
        if (client_id == -2) 
        { 
           trap_SendServerCommand( ent-g_entities, va("print \"Ambiguous client ID for %s\n\"", arg1 ) ); 
           return;
        }
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			trap_SendServerCommand(ent-g_entities, va("print\"Bad client ID\n\""));
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
           trap_SendServerCommand( ent-g_entities, va("print \"Client %s is not active\n\"", arg1 ) ); 
           return; 
        }
		trap_SendConsoleCommand( EXEC_APPEND, va("clientkick %d", client_id) );
		G_LogPrintf("AdminBan admin command executed by %s on %s. (IP: %s)\n", ent->client->pers.netname, g_entities[client_id].client->pers.netname, g_entities[client_id].client->sess.IPstring);
		AddIP( g_entities[client_id].client->sess.IPstring );
	}
	//cm EMOTES
	else if (Q_stricmp(cmd, "sit") == 0 )
		{
			if (!(cm_emoteControl.integer & (1 << E_SIT)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			if (ent->client->ps.groundEntityNum == ENTITYNUM_NONE){
				return;
			}
			if ((ent->client->ps.legsAnim&~ANIM_TOGGLEBIT) == BOTH_SIT2)
			{
				StandardSetBodyAnim(ent, BOTH_SIT2TOSTAND5, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
				ent->client->freeze=0;
				ent->client->ps.saberCanThrow = qtrue;
			}
			else
			{
				ent->client->ps.saberCanThrow = qfalse;
				ent->client->freeze=1;
				StandardSetBodyAnim(ent, BOTH_SIT2, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
				ent->client->ps.saberMove = LS_NONE;		
			}
		}
		else if (Q_stricmp(cmd, "beg") == 0)
		{
			if (!(cm_emoteControl.integer & (1 << E_BEG)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			StandardSetBodyAnim(ent, BOTH_KNEES1, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
		}
		else if (Q_stricmp(cmd, "flip") == 0)
		{
			if (!(cm_emoteControl.integer & (1 << E_FLIP)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			StandardSetBodyAnim(ent, 587, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
		}
		else if (Q_stricmp(cmd, "cocky") == 0)
		{
			if (!(cm_emoteControl.integer & (1 << E_COCKY)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			StandardSetBodyAnim(ent, 644, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
		}
		else if (Q_stricmp(cmd, "scratch") == 0)
		{
			if (!(cm_emoteControl.integer & (1 << E_SCRATCH)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			StandardSetBodyAnim(ent, 661, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
		}
		else if (Q_stricmp(cmd, "dunno") == 0)
		{
			if (!(cm_emoteControl.integer & (1 << E_DUNNO)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			StandardSetBodyAnim(ent, 665, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
		}
		else if (Q_stricmp(cmd, "power") == 0)
		{
			if (!(cm_emoteControl.integer & (1 << E_POWER)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			StandardSetBodyAnim(ent, 668, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
		}
		else if (Q_stricmp(cmd, "lol") == 0)
		{
			if (!(cm_emoteControl.integer & (1 << E_LOL)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			StandardSetBodyAnim(ent, 733, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
		}
		else if (Q_stricmp(cmd, "throw") == 0)
		{
			if (!(cm_emoteControl.integer & (1 << E_THROW)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			StandardSetBodyAnim(ent, 757, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
		}
		else if (Q_stricmp(cmd, "throw2") == 0)
		{
			if (!(cm_emoteControl.integer & (1 << E_THROW2)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			StandardSetBodyAnim(ent, 767, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
		}
		else if (Q_stricmp(cmd, "throw3") == 0)
		{
			if (!(cm_emoteControl.integer & (1 << E_THROW3)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			StandardSetBodyAnim(ent, 769, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
		}
		//cm NOTE: Use this later?
		/*else if (Q_stricmp(cmd, "secretissafewithus") == 0)
		{
			StandardSetBodyAnim(ent, 710, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
			ent->client->ps.saberMove = LS_NONE;
			ent->client->ps.saberBlocked = 0;
			ent->client->ps.saberBlocking = 0;
		}*/
		else if (Q_stricmp(cmd, "super") == 0 )
		{
			if (!(cm_emoteControl.integer & (1 << E_SUPER)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			StandardSetBodyAnim(ent, 603, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
		}
		else if (Q_stricmp(cmd, "thumbsdown") == 0 )
		{
			if (!(cm_emoteControl.integer & (1 << E_THUMBSDOWN)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			StandardSetBodyAnim(ent, 704, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
		}
		else if (Q_stricmp(cmd, "draw") == 0 )
		{
			if (!(cm_emoteControl.integer & (1 << E_DRAW)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			StandardSetBodyAnim(ent, 726, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
		}
		else if (Q_stricmp(cmd, "dance") == 0 )
		{
			if (!(cm_emoteControl.integer & (1 << E_DANCE)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			StandardSetBodyAnim(ent, 913, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
		}
		else if (Q_stricmp(cmd, "dance2") == 0 )
		{
			if (!(cm_emoteControl.integer & (1 << E_DANCE2)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			StandardSetBodyAnim(ent, 914, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
		}
		else if (Q_stricmp(cmd, "nod") == 0 )
		{
			if (!(cm_emoteControl.integer & (1 << E_NOD)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			StandardSetBodyAnim(ent, BOTH_HEADNOD, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
			ent->client->ps.saberMove = LS_NONE;
			ent->client->ps.saberBlocked = 0;
			ent->client->ps.saberBlocking = 0;
		}
		else if (Q_stricmp(cmd, "shake") == 0 )
		{
			if (!(cm_emoteControl.integer & (1 << E_SHAKE)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			StandardSetBodyAnim(ent, BOTH_HEADSHAKE, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
			ent->client->ps.saberMove = LS_NONE;
			ent->client->ps.saberBlocked = 0;
			ent->client->ps.saberBlocking = 0;
		}
		else if (Q_stricmp(cmd, "kiss") == 0 )
		{
			trace_t tr;
			vec3_t fPos;

			AngleVectors(ent->client->ps.viewangles, fPos, 0, 0);

			fPos[0] = ent->client->ps.origin[0] + fPos[0]*40;
			fPos[1] = ent->client->ps.origin[1] + fPos[1]*40;
			fPos[2] = ent->client->ps.origin[2] + fPos[2]*40;

			trap_Trace(&tr, ent->client->ps.origin, 0, 0, fPos, ent->s.number, ent->clipmask);

			if (!(cm_emoteControl.integer & (1 << E_KISS)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}

			if (tr.entityNum < MAX_CLIENTS && tr.entityNum != ent->s.number)
			{
				gentity_t *other = &g_entities[tr.entityNum];

				if (other && other->inuse && other->client)
				{
					vec3_t entDir;
					vec3_t otherDir;
					vec3_t entAngles;
					vec3_t otherAngles;

					if ((ent->client->ps.weapon == WP_SABER && other->client->ps.weapon == WP_SABER)/* && (ent->client->ps.saberHolstered && other->client->ps.saberHolstered)*/)
					{
						if ((ent->client->ps.weapon != WP_SABER || ent->client->ps.saberHolstered) &&
							(other->client->ps.weapon != WP_SABER || other->client->ps.saberHolstered))
						{
							VectorSubtract( other->client->ps.origin, ent->client->ps.origin, otherDir );
							VectorCopy( ent->client->ps.viewangles, entAngles );
							entAngles[YAW] = vectoyaw( otherDir );
							SetClientViewAngle( ent, entAngles );

							StandardSetBodyAnim(ent, BOTH_KISSER1LOOP, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
							ent->client->ps.saberMove = LS_NONE;
							ent->client->ps.saberBlocked = 0;
							ent->client->ps.saberBlocking = 0;

							VectorSubtract( ent->client->ps.origin, other->client->ps.origin, entDir );
							VectorCopy( other->client->ps.viewangles, otherAngles );
							otherAngles[YAW] = vectoyaw( entDir );
							SetClientViewAngle( other, otherAngles );

							StandardSetBodyAnim(other, BOTH_KISSEE1LOOP, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
							other->client->ps.saberMove = LS_NONE;
							other->client->ps.saberBlocked = 0;
							other->client->ps.saberBlocking = 0;
						}
					}
				}
			}
		}
		else if (Q_stricmp(cmd, "shrug") == 0 )
		{
			if (!(cm_emoteControl.integer & (1 << E_SHRUG)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			StandardSetBodyAnim(ent, 666, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
			ent->client->ps.saberMove = LS_NONE;
			ent->client->ps.saberBlocked = 0;
			ent->client->ps.saberBlocking = 0;
		}
		//cm NOTE: Use this later?
		/*else if (Q_stricmp(cmd, "sleep") == 0)
		{
			if ((ent->client->ps.legsAnim&~ANIM_TOGGLEBIT) == 1)
			{
				ent->client->ps.saberCanThrow = qtrue;
				ent->client->freeze=0;
				ent->client->ps.forceHandExtend = HANDEXTEND_KNOCKDOWN;
				ent->client->ps.forceDodgeAnim = 0;
				ent->client->ps.forceHandExtendTime = level.time + 2000;
				ent->client->ps.quickerGetup = qfalse;
			}
			else
			{
				StandardSetBodyAnim(ent, 1, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
				ent->client->ps.saberMove = LS_NONE;
				ent->client->ps.saberBlocked = 0;
				ent->client->ps.saberBlocking = 0;
				ent->client->freeze=1;
				ent->client->ps.saberCanThrow = qfalse;
			}
		}*/
		else if (Q_stricmp(cmd, "bounce") == 0 )
		{
			if (!(cm_emoteControl.integer & (1 << E_BOUNCE)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			StandardSetBodyAnim(ent, 937, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
			ent->client->ps.saberMove = LS_NONE;
			ent->client->ps.saberBlocked = 0;
			ent->client->ps.saberBlocking = 0;
		}
		else if (Q_stricmp(cmd, "breakdance") == 0 )
		{
			if (!(cm_emoteControl.integer & (1 << E_BREAKDANCE)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			StandardSetBodyAnim(ent, 943, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
			ent->client->ps.saberMove = LS_NONE;
			ent->client->ps.saberBlocked = 0;
			ent->client->ps.saberBlocking = 0;
		}
		else if (Q_stricmp(cmd, "kneel") == 0 )
		{
			if (!(cm_emoteControl.integer & (1 << E_KNEEL)))
			{
				trap_SendServerCommand( ent-g_entities, va("print \"Emote not allowed in this server.\n\"") );
				return;
			}
			if (ent->client->ps.groundEntityNum == ENTITYNUM_NONE){
				return;
			}
			if ((ent->client->ps.legsAnim&~ANIM_TOGGLEBIT) == 1049)
			{
				ent->client->freeze=0;
				ent->client->ps.saberCanThrow = qtrue;
			}
			else
			{
				ent->client->ps.saberCanThrow = qfalse;
				ent->client->freeze=1;
				StandardSetBodyAnim(ent, 1049, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
				ent->client->ps.saberMove = LS_NONE;
				ent->client->ps.saberBlocked = 0;
				ent->client->ps.saberBlocking = 0;	
			}
		}
		//cm END
	/*
	else if (Q_stricmp(cmd, "#mm") == 0 && CheatsOk( ent ))
	{
		G_PlayerBecomeATST(ent);
	}
	*/
	//I broke the ATST when I restructured it to use a single global anim set for all client animation.
	//You can fix it, but you'll have to implement unique animations (per character) again.
#ifdef _DEBUG //sigh..
	else if (Q_stricmp(cmd, "headexplodey") == 0 && CheatsOk( ent ))
	{
		Cmd_Kill_f (ent);
		if (ent->health < 1)
		{
			float presaveVel = ent->client->ps.velocity[2];
			ent->client->ps.velocity[2] = 500;
			DismembermentTest(ent);
			ent->client->ps.velocity[2] = presaveVel;
		}
	}
	else if (Q_stricmp(cmd, "g2animent") == 0 && CheatsOk( ent ))
	{
		G_CreateExampleAnimEnt(ent);
	}
	else if (Q_stricmp(cmd, "loveandpeace") == 0 && CheatsOk( ent ))
	{
		trace_t tr;
		vec3_t fPos;

		AngleVectors(ent->client->ps.viewangles, fPos, 0, 0);

		fPos[0] = ent->client->ps.origin[0] + fPos[0]*40;
		fPos[1] = ent->client->ps.origin[1] + fPos[1]*40;
		fPos[2] = ent->client->ps.origin[2] + fPos[2]*40;

		trap_Trace(&tr, ent->client->ps.origin, 0, 0, fPos, ent->s.number, ent->clipmask);

		if (tr.entityNum < MAX_CLIENTS && tr.entityNum != ent->s.number)
		{
			gentity_t *other = &g_entities[tr.entityNum];

			if (other && other->inuse && other->client)
			{
				vec3_t entDir;
				vec3_t otherDir;
				vec3_t entAngles;
				vec3_t otherAngles;

				if (ent->client->ps.weapon == WP_SABER && !ent->client->ps.saberHolstered)
				{
					Cmd_ToggleSaber_f(ent);
				}

				if (other->client->ps.weapon == WP_SABER && !other->client->ps.saberHolstered)
				{
					Cmd_ToggleSaber_f(other);
				}

				if ((ent->client->ps.weapon != WP_SABER || ent->client->ps.saberHolstered) &&
					(other->client->ps.weapon != WP_SABER || other->client->ps.saberHolstered))
				{
					VectorSubtract( other->client->ps.origin, ent->client->ps.origin, otherDir );
					VectorCopy( ent->client->ps.viewangles, entAngles );
					entAngles[YAW] = vectoyaw( otherDir );
					SetClientViewAngle( ent, entAngles );

					StandardSetBodyAnim(ent, BOTH_KISSER1LOOP, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
					ent->client->ps.saberMove = LS_NONE;
					ent->client->ps.saberBlocked = 0;
					ent->client->ps.saberBlocking = 0;

					VectorSubtract( ent->client->ps.origin, other->client->ps.origin, entDir );
					VectorCopy( other->client->ps.viewangles, otherAngles );
					otherAngles[YAW] = vectoyaw( entDir );
					SetClientViewAngle( other, otherAngles );

					StandardSetBodyAnim(other, BOTH_KISSEE1LOOP, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_HOLDLESS);
					other->client->ps.saberMove = LS_NONE;
					other->client->ps.saberBlocked = 0;
					other->client->ps.saberBlocking = 0;
				}
			}
		}
	}
#endif
	else if (Q_stricmp(cmd, "thedestroyer") == 0 && CheatsOk( ent ) && ent && ent->client && ent->client->ps.saberHolstered && ent->client->ps.weapon == WP_SABER)
	{
		Cmd_ToggleSaber_f(ent);

		if (!ent->client->ps.saberHolstered)
		{
			if (ent->client->ps.dualBlade)
			{
				ent->client->ps.dualBlade = qfalse;
				//ent->client->ps.fd.saberAnimLevel = FORCE_LEVEL_1;
			}
			else
			{
				ent->client->ps.dualBlade = qtrue;

				trap_SendServerCommand( -1, va("print \"%sTHE DESTROYER COMETH\n\"", S_COLOR_RED) );
				G_ScreenShake(vec3_origin, NULL, 10.0f, 800, qtrue);
				//ent->client->ps.fd.saberAnimLevel = FORCE_LEVEL_3;
			}
		}
	}
#ifdef _DEBUG
	else if (Q_stricmp(cmd, "debugSetSaberMove") == 0)
	{
		Cmd_DebugSetSaberMove_f(ent);
	}
	else if (Q_stricmp(cmd, "debugSetBodyAnim") == 0)
	{
		Cmd_DebugSetBodyAnim_f(ent, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD);
	}
	else if (Q_stricmp(cmd, "debugDismemberment") == 0)
	{
		Cmd_Kill_f (ent);
		if (ent->health < 1)
		{
			char	arg[MAX_STRING_CHARS];
			int		iArg = 0;

			if (trap_Argc() > 1)
			{
				trap_Argv( 1, arg, sizeof( arg ) );

				if (arg[0])
				{
					iArg = atoi(arg);
				}
			}

			DismembermentByNum(ent, iArg);
		}
	}
	else if (Q_stricmp(cmd, "debugKnockMeDown") == 0)
	{
		ent->client->ps.forceHandExtend = HANDEXTEND_KNOCKDOWN;
		ent->client->ps.forceDodgeAnim = 0;
		if (trap_Argc() > 1)
		{
			ent->client->ps.forceHandExtendTime = level.time + 1100;
			ent->client->ps.quickerGetup = qfalse;
		}
		else
		{
			ent->client->ps.forceHandExtendTime = level.time + 700;
			ent->client->ps.quickerGetup = qtrue;
		}
	}
#endif

	else
	{
		if (Q_stricmp(cmd, "addbot") == 0)
		{ //because addbot isn't a recognized command unless you're the server, but it is in the menus regardless
//			trap_SendServerCommand( clientNum, va("print \"You can only add bots as the server.\n\"" ) );
			trap_SendServerCommand( clientNum, va("print \"%s.\n\"", G_GetStripEdString("SVINGAME", "ONLY_ADD_BOTS_AS_SERVER")));
		}
		else
		{
			trap_SendServerCommand( clientNum, va("print \"unknown cmd %s\n\"", cmd ) );
		}
	}
}
