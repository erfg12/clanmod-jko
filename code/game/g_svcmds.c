// Copyright (C) 1999-2000 Id Software, Inc.
//

// this file holds commands that can be executed by the server console, but not remote clients

#include "g_local.h"


/*
==============================================================================

PACKET FILTERING
 

You can add or remove addresses from the filter list with:

addip <ip>
removeip <ip>

The ip address is specified in dot format, and any unspecified digits will match any value, so you can specify an entire class C network with "addip 192.246.40".

Removeip will only remove an address specified exactly the same way.  You cannot addip a subnet, then removeip a single host.

listip
Prints the current list of filters.

g_filterban <0 or 1>

If 1 (the default), then ip addresses matching the current list will be prohibited from entering the game.  This is the default setting.

If 0, then only addresses matching the list will be allowed.  This lets you easily set up a private game, or a game that only allows players from your local network.


==============================================================================
*/

// extern	vmCvar_t	g_banIPs;
// extern	vmCvar_t	g_filterBan;


typedef struct ipFilter_s
{
	unsigned	mask;
	unsigned	compare;
} ipFilter_t;

#define	MAX_IPFILTERS	1024

static ipFilter_t	ipFilters[MAX_IPFILTERS];
static int			numIPFilters;
extern int G_ClientNumberFromArg( char *str);
void uwRename(gentity_t *player, const char *newname);

/*
=================
StringToFilter
=================
*/
static qboolean StringToFilter (char *s, ipFilter_t *f)
{
	char	num[128];
	int		i, j;
	byte	b[4];
	byte	m[4];
	
	for (i=0 ; i<4 ; i++)
	{
		b[i] = 0;
		m[i] = 0;
	}
	
	for (i=0 ; i<4 ; i++)
	{
		if (*s < '0' || *s > '9')
		{
			G_Printf( "Bad filter address: %s\n", s );
			return qfalse;
		}
		
		j = 0;
		while (*s >= '0' && *s <= '9')
		{
			num[j++] = *s++;
		}
		num[j] = 0;
		b[i] = atoi(num);
		if (b[i] != 0)
			m[i] = 255;

		if (!*s)
			break;
		s++;
	}
	
	f->mask = *(unsigned *)m;
	f->compare = *(unsigned *)b;
	
	return qtrue;
}

/*
=================
UpdateIPBans
=================
*/
//cm NOTE: Updated to put banned ips into a file
static void UpdateIPBans (void)
{
	byte	b[4];
	int		i;
	char	ipstr[MAX_INFO_STRING];
	fileHandle_t	f;

	trap_FS_FOpenFile( "banIP.txt", &f, FS_WRITE );
	if ( !f )
	{
		trap_Printf( va("BAN Error: file cannot be opened for writing: %s\n", "banIP.txt") );
		return;
	}
	for (i = 0 ; i < numIPFilters ; i++)
	{
		if (ipFilters[i].compare == 0xffffffff)
			continue;

		*(unsigned *)b = ipFilters[i].compare;
		Com_sprintf( ipstr, sizeof(ipstr), "%i.%i.%i.%i ", b[0], b[1], b[2], b[3]);
		trap_FS_Write( ipstr, strlen(ipstr), f);
	}
	trap_FS_FCloseFile( f );

}
/*static void UpdateIPBans (void)
{
	byte	b[4];
	int		i;
	char	iplist[MAX_INFO_STRING];

	*iplist = 0;
	for (i = 0 ; i < numIPFilters ; i++)
	{
		if (ipFilters[i].compare == 0xffffffff)
			continue;

		*(unsigned *)b = ipFilters[i].compare;
		Com_sprintf( iplist + strlen(iplist), sizeof(iplist) - strlen(iplist), 
			"%i.%i.%i.%i ", b[0], b[1], b[2], b[3]);
	}

	trap_Cvar_Set( "g_banIPs", iplist );
}*/

/*
=================
G_FilterPacket
=================
*/
qboolean G_FilterPacket (char *from)
{
	int		i;
	unsigned	in;
	byte m[4] = {'\0','\0','\0','\0'};
	char *p;

	i = 0;
	p = from;
	while (*p && i < 4) {
		m[i] = 0;
		while (*p >= '0' && *p <= '9') {
			m[i] = m[i]*10 + (*p - '0');
			p++;
		}
		if (!*p || *p == ':')
			break;
		i++, p++;
	}
	
	in = *(unsigned *)m;

	for (i=0 ; i<numIPFilters ; i++)
		if ( (in & ipFilters[i].mask) == ipFilters[i].compare)
			return g_filterBan.integer != 0;

	return g_filterBan.integer == 0;
}

qboolean G_CheckMaxConnections( char *from )
{ // returns qfalse when # of players on this ip is <= sv_maxConnections or dont care to check
	int i=0,n=0,count=1;
	int idnum;
	char from2[22];
	gentity_t *ent;

	if ( !sv_maxConnections.integer ) { // max connections check is disabled //RoAR mod NOTE: Changed.
		return qfalse;
	}

	if ( g_dedicated.integer == 1 ) { //RoAR mod NOTE: Hosting a local server?
		return qfalse;
	}

	Q_strncpyz(from2, from, sizeof(from2));
	n=0;
	while(++n<strlen(from2))if(from2[n]==':')from2[n]=0;// stip port off of "from"

	if ( !Q_stricmp(from2, "localhost" ) ) { // localhost doesnt matter
		return qfalse;
	}

	if ( !Q_stricmp(from2, "" ) || from2[0] == 0 ) { // bots dont matter either
		return qfalse;
	}

	for(i =0 ; i < g_maxclients.integer; i++) {
		idnum = level.sortedClients[i];
		ent = g_entities + idnum;
		
		if ( !ent || !ent->client )
			continue;
			
		if ( ent->client->pers.connected == CON_DISCONNECTED )
			continue;

		if ( Q_stricmp(from2, ent->client->sess.IPstring ) )	// ips are not same so dont count
			continue;

		count++;
	}

	if ( count > sv_maxConnections.integer ) {
		return qtrue;
	}

	return qfalse;
}

/*
=================
AddIP
=================
*/
//cm NOTE: Made this a normal void for adding IPs in cmds.c
//static void AddIP( char *str )
void AddIP( char *str )
{
	int		i;

	for (i = 0 ; i < numIPFilters ; i++)
		if (ipFilters[i].compare == 0xffffffff)
			break;		// free spot
	if (i == numIPFilters)
	{
		if (numIPFilters == MAX_IPFILTERS)
		{
			G_Printf ("IP filter list is full\n");
			return;
		}
		numIPFilters++;
	}
	
	if (!StringToFilter (str, &ipFilters[i]))
		ipFilters[i].compare = 0xffffffffu;

	UpdateIPBans();
}
//cm NOTE: Added to put banned ips into a file
static void InitialAddIP( char *str )
{
	int		i;

	for (i = 0 ; i < numIPFilters ; i++)
		if (ipFilters[i].compare == 0xffffffff)
			break;		// free spot
	if (i == numIPFilters)
	{
		if (numIPFilters == MAX_IPFILTERS)
		{
			G_Printf ("IP filter list is full\n");
			return;
		}
		numIPFilters++;
	}
	
	if (!StringToFilter (str, &ipFilters[i]))
		ipFilters[i].compare = 0xffffffffu;
}

/*
=================
G_ProcessIPBans
=================
*/
//cm NOTE: Updated to put banned ips into a file
void G_ProcessIPBans(void) 
{
	char *s, *t;
	int len;
	fileHandle_t	f;
	char *buf;

	numIPFilters = 0;

	len = trap_FS_FOpenFile( "banIP.txt", &f, FS_READ );
	if ( !f )
	{
		trap_Printf( va( "BAN Warning: file cannot be opened for reading: %s\n", "banIP.txt") );
		return;
	}
	if ( !len )
	{ //empty file
		trap_FS_FCloseFile( f );
		return;
	}

	if ( (buf = BG_TempAlloc(len+1)) == 0 )
	{//alloc memory for buffer
		return;
	}
	trap_FS_Read( buf, len, f );
	trap_FS_FCloseFile( f );

	for (t = s = buf; *t; /* */ ) {
		s = strchr(s, ' ');
		if (!s)
			break;
		while (*s == ' ')
			*s++ = 0;
		if (*t)
			InitialAddIP( t );
		t = s;
	}
	BG_TempFree(len+1);
}
/*void G_ProcessIPBans(void) 
{
	char *s, *t;
	char		str[MAX_TOKEN_CHARS];

	Q_strncpyz( str, g_banIPs.string, sizeof(str) );

	for (t = s = g_banIPs.string; *t; ) {
		s = strchr(s, ' ');
		if (!s)
			break;
		while (*s == ' ')
			*s++ = 0;
		if (*t)
			AddIP( t );
		t = s;
	}
}*/


/*
=================
Svcmd_AddIP_f
=================
*/
void Svcmd_AddIP_f (void)
{
	char		str[MAX_TOKEN_CHARS];

	if ( trap_Argc() < 2 ) {
		G_Printf("Usage:  addip <ip-mask>\n");
		return;
	}

	trap_Argv( 1, str, sizeof( str ) );

	AddIP( str );

}

/*
=================
Svcmd_RemoveIP_f
=================
*/
void Svcmd_RemoveIP_f (void)
{
	ipFilter_t	f;
	int			i;
	char		str[MAX_TOKEN_CHARS];

	if ( trap_Argc() < 2 ) {
		G_Printf("Usage:  sv removeip <ip-mask>\n");
		return;
	}

	trap_Argv( 1, str, sizeof( str ) );

	if (!StringToFilter (str, &f))
		return;

	for (i=0 ; i<numIPFilters ; i++) {
		if (ipFilters[i].mask == f.mask	&&
			ipFilters[i].compare == f.compare) {
			ipFilters[i].compare = 0xffffffffu;
			G_Printf ("Removed.\n");

			UpdateIPBans();
			return;
		}
	}

	G_Printf ( "Didn't find %s.\n", str );
}

/*
===================
Svcmd_EntityList_f
===================
*/
void	Svcmd_EntityList_f (void) {
	int			e;
	gentity_t		*check;

	check = g_entities+1;
	for (e = 1; e < level.num_entities ; e++, check++) {
		if ( !check->inuse ) {
			continue;
		}
		G_Printf("%3i:", e);
		switch ( check->s.eType ) {
		case ET_GENERAL:
			G_Printf("ET_GENERAL          ");
			break;
		case ET_PLAYER:
			G_Printf("ET_PLAYER           ");
			break;
		case ET_ITEM:
			G_Printf("ET_ITEM             ");
			break;
		case ET_MISSILE:
			G_Printf("ET_MISSILE          ");
			break;
		case ET_MOVER:
			G_Printf("ET_MOVER            ");
			break;
		case ET_BEAM:
			G_Printf("ET_BEAM             ");
			break;
		case ET_PORTAL:
			G_Printf("ET_PORTAL           ");
			break;
		case ET_SPEAKER:
			G_Printf("ET_SPEAKER          ");
			break;
		case ET_PUSH_TRIGGER:
			G_Printf("ET_PUSH_TRIGGER     ");
			break;
		case ET_TELEPORT_TRIGGER:
			G_Printf("ET_TELEPORT_TRIGGER ");
			break;
		case ET_INVISIBLE:
			G_Printf("ET_INVISIBLE        ");
			break;
		case ET_GRAPPLE:
			G_Printf("ET_GRAPPLE          ");
			break;
		default:
			G_Printf("%3i                 ", check->s.eType);
			break;
		}

		if ( check->classname ) {
			G_Printf("%s", check->classname);
		}
		G_Printf("\n");
	}
}

gclient_t	*ClientForString( const char *s ) {
	gclient_t	*cl;
	int			i;
	int			idnum;

	// numeric values are just slot numbers
	if ( s[0] >= '0' && s[0] <= '9' ) {
		idnum = atoi( s );
		if ( idnum < 0 || idnum >= level.maxclients ) {
			Com_Printf( "Bad client slot: %i\n", idnum );
			return NULL;
		}

		cl = &level.clients[idnum];
		if ( cl->pers.connected == CON_DISCONNECTED ) {
			G_Printf( "Client %i is not connected\n", idnum );
			return NULL;
		}
		return cl;
	}

	// check for a name match
	for ( i=0 ; i < level.maxclients ; i++ ) {
		cl = &level.clients[i];
		if ( cl->pers.connected == CON_DISCONNECTED ) {
			continue;
		}
		if ( !Q_stricmp( cl->pers.netname, s ) ) {
			return cl;
		}
	}

	G_Printf( "User %s is not on the server\n", s );

	return NULL;
}

/*
===================
Svcmd_ForceTeam_f

forceteam <player> <team>
===================
*/
void	Svcmd_ForceTeam_f( void ) {
	gclient_t	*cl;
	char		str[MAX_TOKEN_CHARS];

	// find the player
	trap_Argv( 1, str, sizeof( str ) );
	cl = ClientForString( str );
	if ( !cl ) {
		return;
	}

	// set the team
	trap_Argv( 2, str, sizeof( str ) );
	SetTeam( &g_entities[cl - level.clients], str );
}

	void	Svcmd_LockTeam( void ) 
	{
		char teamname[MAX_TEAMNAME];
		if ( g_gametype.integer >= GT_TEAM || g_gametype.integer == GT_FFA ) {
		
		if ( trap_Argc() != 2 ){
			G_Printf("Usage: /lockteam (team)\nTEAMS = Spectator, Blue, Red, Free\n");
			return;
		}
		trap_Argv( 1, teamname, sizeof( teamname ) );		
		if ( !Q_stricmp( teamname, "red" ) || !Q_stricmp( teamname, "r" ) ) {
			if (level.isLockedred == qfalse){
			level.isLockedred = qtrue;
			G_LogPrintf("LockTeam admin command executed by SERVER on Red Team. (locking)\n");
			trap_SendServerCommand( -1, va("cp \"^7The ^1Red ^7team is now ^1Locked^7.\n\""));
			trap_SendServerCommand( -1, va("print \"^7The ^1Red ^7team is now ^1Locked^7.\n\""));
			}
			else {
			level.isLockedred = qfalse;
			G_LogPrintf("LockTeam admin command executed by SERVER on Red Team. (unlocking)\n");
			trap_SendServerCommand( -1, va("cp \"^7The ^1Red ^7team is now ^2unLocked^7.\n\""));
			trap_SendServerCommand( -1, va("print \"^7The ^1Red ^7team is now ^2unLocked^7.\n\""));
			}
		}
		else if ( !Q_stricmp( teamname, "blue" ) || !Q_stricmp( teamname, "b" ) ) {
			if (level.isLockedblue == qfalse){
			level.isLockedblue = qtrue;
			G_LogPrintf("LockTeam admin command executed by SERVER on Blue Team. (locking)\n");
			trap_SendServerCommand( -1, va("cp \"^7The ^4Blue ^7team is now ^1Locked^7.\n\""));
			trap_SendServerCommand( -1, va("print \"^7The ^4Blue ^7team is now ^1Locked^7.\n\""));
			}
			else {
			level.isLockedblue = qfalse;
			G_LogPrintf("LockTeam admin command executed by SERVER on Blue Team. (unlocking)\n");
			trap_SendServerCommand( -1, va("cp \"^7The ^4Blue ^7team is now ^2unLocked^7.\n\""));
			trap_SendServerCommand( -1, va("print \"^7The ^4Blue ^7team is now ^2unLocked^7.\n\""));
			}
		}
		else if( !Q_stricmp( teamname, "spectator" ) || !Q_stricmp( teamname, "s" ) || !Q_stricmp( teamname, "spec" ) || !Q_stricmp( teamname, "spectate" ) ) {
			if (level.isLockedspec == qfalse){
			level.isLockedspec = qtrue;
			G_LogPrintf("LockTeam admin command executed by SERVER on Spectator Team. (locking)\n");
			trap_SendServerCommand( -1, va("cp \"^7The ^3Spectator ^7team is now ^1Locked^7.\n\""));
			trap_SendServerCommand( -1, va("print \"^7The ^3Spectator ^7team is now ^1Locked^7.\n\""));
			}
			else {
			level.isLockedspec = qfalse;
			G_LogPrintf("LockTeam admin command executed by SERVER on Spectator Team. (locking)\n");
			trap_SendServerCommand( -1, va("cp \"^7The ^3Spectator ^7team is now ^2unLocked^7.\n\""));
			trap_SendServerCommand( -1, va("print \"^7The ^3Spectator ^7team is now ^2unLocked^7.\n\""));
			}
		}
		else if( !Q_stricmp( teamname, "join" ) || !Q_stricmp( teamname, "free" ) || !Q_stricmp( teamname, "enter" )
			 || !Q_stricmp( teamname, "f" ) || !Q_stricmp( teamname, "j" )) {
			if (level.isLockedjoin == qfalse){
			level.isLockedjoin = qtrue;
			G_LogPrintf("LockTeam admin command executed by SERVER on Join Team. (locking)\n");
			trap_SendServerCommand( -1, va("cp \"^7The ^2Join ^7team is now ^1Locked^7.\n\""));
			trap_SendServerCommand( -1, va("print \"^7The ^2Join ^7team is now ^1Locked^7.\n\""));
			}
			else {
			level.isLockedjoin = qfalse;
			G_LogPrintf("LockTeam admin command executed by SERVER on Join Team. (unlocking)\n");
			trap_SendServerCommand( -1, va("cp \"^7The ^2Join ^7team is now ^2unLocked^7.\n\""));
			trap_SendServerCommand( -1, va("print \"^7The ^2Join ^7team is now ^2unLocked^7.\n\""));
			}
		}
		else {
			G_Printf("Usage: /lockteam (team)\nTEAMS = Spectator, Blue, Red, Free\n");
			return;
			}
		}
		else
		{
			G_Printf("You cant lock the teams in this gameplay\n");
			return;
		}
	}
	void	Svcmd_Slap( void )
	{
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];
		if (g_gametype.integer == GT_TOURNAMENT || g_gametype.integer == GT_TEAM ||
				g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY || 
				g_gametype.integer == GT_JEDIMASTER || g_gametype.integer == GT_HOLOCRON) {
			G_Printf("Cannot use this admin command in this gametype.\n");
			return;
		}
		if ( trap_Argc() != 2 )
		{
			G_Printf("Usage: /slap (client)\n");
			return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
        if (client_id == -1) 
        {
			G_Printf("Can't find client ID\n");
			return;
        }
        if (client_id == -2) 
        {
			G_Printf("Ambiguous client ID\n");
			return;
        }
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			G_Printf("Bad client ID\n");
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
			G_Printf("Client is not active\n");
            return; 
        }
		if (g_entities[client_id].client->ps.duelInProgress){
			G_Printf("Client is in a duel\n");
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
	void	Svcmd_Slay( void )
	{
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];
		if (g_gametype.integer == GT_TOURNAMENT || g_gametype.integer == GT_TEAM ||
			g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY || 
			g_gametype.integer == GT_JEDIMASTER || g_gametype.integer == GT_HOLOCRON) {
				G_Printf("Cannot use this admin command in this gametype.\n");
				return;
		}
		if ( trap_Argc() != 2 )
		{
			G_Printf("Usage: /slay (client)\n");
			return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
        if (client_id == -1) 
        {
			G_Printf("Can't find client ID\n");
            return;
        }
        if (client_id == -2) 
        {
			G_Printf("Ambiguous client ID\n");
            return;
        }
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			G_Printf("Bad client ID\n");
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
			G_Printf("Client is not active\n");
            return; 
        }
		if (g_entities[client_id].client->ps.duelInProgress){
			G_Printf("Client is in a duel\n");
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
					G_LogPrintf("Slay admin command executed by SERVER on %s.\n", g_entities[client_id].client->pers.netname);
					trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_slay_saying.string ) );
					trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_slay_saying.string ) ); 
				}
			}
	}
	void	Svcmd_Rename( void )
	{
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];
		char arg2[MAX_STRING_CHARS];
		if ( trap_Argc() != 3 )
		{
			G_Printf("Usage: /rename (client) (new name)\n");
			return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
        if (client_id == -1) 
        {
			G_Printf("Can't find client ID\n");
            return;
        }
        if (client_id == -2) 
        {
			G_Printf("Ambiguous client ID\n");
            return;
        }
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			G_Printf("Bad client ID\n");
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
			G_Printf("Client is not active\n");
            return; 
        }
		trap_Argv( 2, arg2, sizeof( arg2 ) );
		uwRename(&g_entities[client_id], arg2);
		trap_SendServerCommand( client_id, va("cp \"^7You've been renamed to\n^7%s\n\"", arg2) );
		trap_SendServerCommand( -1, va("print \"%s ^7has been renamed by an admin.\n\"", g_entities[client_id].client->pers.netname ) ); 
	}
	void	Svcmd_Silence( void )
	{
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];
		if ( trap_Argc() != 2 )
		{
			G_Printf("Usage: /silence (client)\n");
			return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
        if (client_id == -1) 
        {
			G_Printf("Can't find client ID\n");
            return;
        }
        if (client_id == -2) 
        {
			G_Printf("Ambiguous client ID\n");
            return;
        }
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			G_Printf("Bad client ID\n");
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
			G_Printf("Client is not active\n");
            return; 
        }
		if (g_entities[client_id].client->ps.duelInProgress){
			G_Printf("Client is in a duel\n");
            return;
		}
		if (g_entities[client_id].client->pers.ampunish == qtrue){
			G_Printf("Client is currently being punished\n");
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
	void	Svcmd_Punish( void )
	{
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];
		if ( trap_Argc() != 2 )
		{
			G_Printf("Usage: /punish (client)\n");
			return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
        if (client_id == -1) 
        {
			G_Printf("Can't find client ID\n");
            return;
        }
        if (client_id == -2) 
        {
			G_Printf("Ambiguous client ID\n");
            return;
        }
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			G_Printf("Bad client ID\n");
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
			G_Printf("Client is not active\n");
            return; 
        }
		if (g_entities[client_id].client->ps.duelInProgress){
			G_Printf("Client is in a duel\n");
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
	char	*ConcatArgs( int start );
	void	Svcmd_CSprint( void )
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
		if ( trap_Argc() <= 2 )
		{ 
			G_Printf ( "Usage: ^3/csprint (client) (message)\n/csprint all (message)\n", arg ); 
			return; 
		}
		if (client_id == -1) 
        { 
           G_Printf ( "Can't find client ID for %s\n", arg ); 
           return; 
        } 
        if (client_id == -2) 
        { 
           G_Printf ( "Ambiguous client ID for %s\n", arg ); 
           return; 
        }
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			G_Printf("Bad client ID\n");
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
           G_Printf ( "Client %s is not active\n", arg ); 
           return; 
        }
		trap_SendServerCommand(client_id, va("cp \"%s\"", real_msg) );
	}
	void	Svcmd_ChangeMode( void )
	{
		int i;
		char arg[MAX_STRING_CHARS];
		gentity_t * targetplayer;
		trap_Argv(1, arg, sizeof(arg));
		if ( trap_Argc() < 2 )
		{ 
			G_Printf("Usage: /changemode (mode)\nmodes = clanmatch clanmeeting\n");
			return; 
		}
		if ( !Q_stricmp( arg, "clanmeeting" ) || !Q_stricmp( arg, "meeting" ) ) {
			if ( g_gametype.integer != GT_FFA ) {
				G_Printf("ClanMeeting mode can only be used during FFA gametype.\n");
				return;
			}
			if ((level.matchMode == qfalse) && (level.meetingMode == qfalse)){
				level.meetingMode = qtrue;
				G_LogPrintf("ChangeMode admin command executed by SERVER. (START: ClanMeeting)\n");
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
				G_Printf("A mode is already enabled\n");
				return;
			}
		}
	else if ( !Q_stricmp( arg, "clanmatch" ) || !Q_stricmp( arg, "match" ) ) {
			if ( g_gametype.integer != GT_TEAM ) {
				G_Printf("ClanMatch mode can only be used during TFFA gametype.\n");
				return;
			}
			if ((level.matchMode == qfalse) && (level.meetingMode == qfalse)){
				level.matchMode = qtrue;
				G_LogPrintf("ChangeMode admin command executed by SERVER. (START: ClanMatch)\n");
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
				G_Printf("A mode is already enabled\n");
				return;
			}
		}
	}
	void	Svcmd_Sleep( void )
	{
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];
		if ( trap_Argc() != 2 )
		{
			G_Printf("Usage: /sleep (client)\n");
			return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
        if (client_id == -1) 
        {
			G_Printf("Can't find client\n");
            return;
        }
        if (client_id == -2) 
        {
			G_Printf("Ambiguous client ID\n");
            return;
        }
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			G_Printf("Bad client ID\n");
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
			G_Printf("Client is not active\n");
            return; 
        }
		if (g_entities[client_id].client->ps.duelInProgress){
			G_Printf("Client is in a duel\n");
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
	void	Svcmd_Empower( void )
	{
		int f, i;
		vec3_t v;
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];
		if (g_gametype.integer == GT_TOURNAMENT || g_gametype.integer == GT_TEAM ||
			g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY || 
			g_gametype.integer == GT_JEDIMASTER || g_gametype.integer == GT_HOLOCRON) {
				G_Printf("Cannot use this admin command in this gametype.\n");
				return;
		}
		if ( trap_Argc() > 2 )
		{ 
			G_Printf("Usage: /empower (client)\n");
			return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
        if (client_id == -1) 
        {
			G_Printf("Can't find client ID\n");
            return;
        }
        if (client_id == -2) 
        {
			G_Printf("Ambiguous client ID\n");
            return;
        }
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			G_Printf("Bad client ID\n");
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
			G_Printf("Client is not active\n");
            return; 
        }
		if (g_entities[client_id].client->ps.duelInProgress){
			G_Printf("Client is in a duel\n");
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
			G_LogPrintf("Empower admin command executed by SERVER on %s. (removing)\n", g_entities[client_id].client->pers.netname);
			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_empower_off_saying.string ) );
			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_empower_off_saying.string ) );
		}
		//APPLY
		else {
			G_PlayEffect(EFFECT_SMOKE, g_entities[client_id].r.currentOrigin, v);
			G_ScreenShake(g_entities[client_id].client->ps.origin, NULL, 10.0f, 800, qtrue);
			G_LogPrintf("Empower admin command executed by SERVER on %s. (applying)\n", g_entities[client_id].client->pers.netname);
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
	void	Svcmd_Who( void ) 
    {
		int i;
		for(i = 0; i < level.maxclients; i++) { 
			if(g_entities[i].client->pers.connected == CON_CONNECTED) {
				G_Printf("IP:%s #:%i CLIENT:%s", g_entities[i].client->sess.IPstring, i, g_entities[i].client->pers.netname);
			}
		}
	}
	void	Svcmd_Terminator( void )
	{
		int i, f;
		vec3_t v;
		int	num = 999;
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];
		if (g_gametype.integer == GT_TOURNAMENT || g_gametype.integer == GT_TEAM ||
			g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY || 
			g_gametype.integer == GT_JEDIMASTER || g_gametype.integer == GT_HOLOCRON) {
				G_Printf("Cannot use this admin command in this gametype.\n");
				return;
		}
		if ( trap_Argc() > 2 )
		{
			G_Printf("Usage: /terminator (client)\n");
			return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
        if (client_id == -1) 
        {
			G_Printf("Can't find client ID\n");
            return;
        }
        if (client_id == -2) 
        {
			G_Printf("Ambiguous client\n");
            return;
        }
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			G_Printf("Bad client ID\n");
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
			G_Printf("Client is not active\n");
            return; 
        }
		if (g_entities[client_id].client->ps.duelInProgress){
			G_Printf("Client is in a duel\n");
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
	void	Svcmd_Protect( void )
	{
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];
		if (g_gametype.integer == GT_TOURNAMENT || g_gametype.integer == GT_TEAM ||
			g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY) {
				G_Printf("Cannot use this admin command in this gametype.\n");
				return;
		}
		if ( trap_Argc() > 2 )
		{
			G_Printf("Usage: /protect (client)\n");
			return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
        if (client_id == -1) 
        { 
			G_Printf("Can't find client ID\n");
            return;
        }
        if (client_id == -2) 
        { 
			G_Printf("Ambiguous client ID\n");
            return;
        }
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			G_Printf("Bad client ID\n");
			return;
		}
        if (!g_entities[client_id].inuse) 
        {
			G_Printf("Client is not active\n");
            return; 
        }
		if (g_entities[client_id].client->ps.duelInProgress){
			G_Printf("Client is in a duel\n");
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
	void	Svcmd_ChangeMap( void ) 
	{
		char arg1[MAX_STRING_CHARS];
		if ( trap_Argc() != 3 )
		{
			G_Printf("Usage: /changemap (gametype) (map)\n");
			return; 
		}
		trap_Argv( 1, arg1, sizeof( arg1 ) );
		trap_SendConsoleCommand( EXEC_APPEND, va("g_gametype %s\n", arg1));
		G_LogPrintf("ChangeMap admin command executed by SERVER to GAMETYPE:%s", arg1);
		trap_Argv( 2, arg1, sizeof( arg1 ) );
		trap_SendConsoleCommand( EXEC_APPEND, va("map %s\n", arg1));
		G_LogPrintf(" MAP:%s.\n", arg1);
	}
	void	Svcmd_Teleport( void )
	{ // teleport to specific location
		vec3_t location;
		vec3_t forward;
		if ( trap_Argc() <= 2 || trap_Argc() > 4 )
		{
			G_Printf("Usage: Usage: /teleport (client)\n/teleport (X Y Z)\n/teleport (client) (client)\n/teleport (client) (X Y Z)\n");
			return;
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
				G_Printf("Can't find client ID\n");
				return;
			}
			if (client_id == -2)
			{
				G_Printf("Ambiguous client ID\n");
				return;
			}
			if (client_id < 0 || client_id >= MAX_CLIENTS)
			{
				G_Printf("Bad client ID\n");
				return;
			}
			if (!g_entities[client_id].inuse)
			{
				G_Printf("Client is not active\n");
				return;
			}
			if (client_id2 == -1)
			{
				G_Printf("Can't find client ID\n");
				return;
			}
			if (client_id2 == -2)
			{
				G_Printf("Ambiguous client ID\n");
				return;
			}
			if (!g_entities[client_id2].inuse)
			{
				G_Printf("Client is not active\n");
				return;
			}
			if (g_entities[client_id].health <= 0)
			{
				return;
			}
			if (g_entities[client_id2].health <= 0)
			{
				return;
			}

			VectorCopy(g_entities[client_id2].client->ps.origin, location);
			AngleVectors(g_entities[client_id2].client->ps.viewangles, forward, NULL, NULL);
			forward[2] = 0; //no elevation change
			VectorNormalize(forward);
			VectorMA(g_entities[client_id2].client->ps.origin, 100, forward, location);
			location[2] += 5; //add just a bit of height???
			TeleportPlayer(&g_entities[client_id], location, g_entities[client_id2].client->ps.viewangles);
			G_LogPrintf("Teleport admin command is executed by SERVER on %s.\n", g_entities[client_id].client->pers.netname);
			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_teleport_saying.string ) );
			trap_SendServerCommand( -1, va("print \"%s^7 %s\n\"", g_entities[client_id].client->pers.netname, cm_teleport_saying.string ) );
		}
		//Using manual coordinates
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
				G_Printf("Can't find client ID\n");
				return;
			}
			if (client_id == -2)
			{
				G_Printf("Ambiguous client ID\n");
				return;
			}
			if (client_id < 0 || client_id >= MAX_CLIENTS)
			{
				G_Printf("Bad client ID\n");
				return;
			}
			if (!g_entities[client_id].inuse)
			{
				G_Printf("Client is not active\n");
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
			G_LogPrintf("Teleport admin command is executed by SERVER on %s.\n", g_entities[client_id].client->pers.netname);
			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_teleport_saying.string ) );  
			trap_SendServerCommand( -1, va("print \"%s^7 %s\n\"", g_entities[client_id].client->pers.netname, cm_teleport_saying.string ) );  
		}
	}
	void	Svcmd_AdminKick( void )
	{
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];
		if ( trap_Argc() > 2 )
		{
			G_Printf("Usage: /adminkick (client)\n");
			return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
        if (client_id == -1)
			{
				G_Printf("Can't find client ID\n");
				return;
			}
			if (client_id == -2)
			{
				G_Printf("Ambiguous client ID\n");
				return;
			}
			if (client_id < 0 || client_id >= MAX_CLIENTS)
			{
				G_Printf("Bad client ID\n");
				return;
			}
			if (!g_entities[client_id].inuse)
			{
				G_Printf("Client is not active\n");
				return;
			}
		trap_SendConsoleCommand( EXEC_APPEND, va("clientkick %d", client_id) );
		G_LogPrintf("AdminKick command executed by SERVER on %s.\n", g_entities[client_id].client->pers.netname);
	}
	void	Svcmd_AdminBan( void ) 
	{
		int client_id = -1;
		char arg1[MAX_STRING_CHARS];
		if ( trap_Argc() > 2 )
		{
			G_Printf("Usage: /adminban (client)\n"); 
			return; 
		}
		trap_Argv( 1,  arg1, sizeof( arg1 ) );
		client_id = G_ClientNumberFromArg( arg1 );
        if (client_id == -1)
		{
			G_Printf("Can't find client ID\n");
			return;
		}
		if (client_id == -2)
		{
			G_Printf("Ambiguous client ID\n");
			return;
		}
		if (client_id < 0 || client_id >= MAX_CLIENTS)
		{
			G_Printf("Bad client ID\n");
			return;
		}
		if (!g_entities[client_id].inuse)
		{
			G_Printf("Client is not active\n");
			return;
		}
		trap_SendConsoleCommand( EXEC_APPEND, va("clientkick %d", client_id) );
		G_LogPrintf("AdminBan admin command executed by SERVER on %s. (IP: %s)\n", g_entities[client_id].client->pers.netname, g_entities[client_id].client->sess.IPstring);
		AddIP( g_entities[client_id].client->sess.IPstring );
	}

char	*ConcatArgs( int start );

/*
=================
ConsoleCommand

=================
*/
qboolean	ConsoleCommand( void ) {
	char	cmd[MAX_TOKEN_CHARS];

	trap_Argv( 0, cmd, sizeof( cmd ) );

	if ( Q_stricmp (cmd, "entitylist") == 0 ) {
		Svcmd_EntityList_f();
		return qtrue;
	}

	if ( Q_stricmp (cmd, "forceteam") == 0 ) {
		Svcmd_ForceTeam_f();
		return qtrue;
	}

	if (Q_stricmp (cmd, "game_memory") == 0) {
		Svcmd_GameMem_f();
		return qtrue;
	}

	if (Q_stricmp (cmd, "addbot") == 0) {
		Svcmd_AddBot_f();
		return qtrue;
	}

	if (Q_stricmp (cmd, "botlist") == 0) {
		Svcmd_BotList_f();
		return qtrue;
	}

/*	if (Q_stricmp (cmd, "abort_podium") == 0) {
		Svcmd_AbortPodium_f();
		return qtrue;
	}
*/
	if (Q_stricmp (cmd, "addip") == 0) {
		Svcmd_AddIP_f();
		return qtrue;
	}

	if (Q_stricmp (cmd, "removeip") == 0) {
		Svcmd_RemoveIP_f();
		return qtrue;
	}

	if (Q_stricmp (cmd, "listip") == 0) {
		trap_SendConsoleCommand( EXEC_NOW, "g_banIPs\n" );
		return qtrue;
	}

	if (Q_stricmp (cmd, "punish") == 0) {
		Svcmd_Punish();
		return qtrue;
	}

	if (Q_stricmp (cmd, "sleep") == 0) {
		Svcmd_Sleep();
		return qtrue;
	}

	if (Q_stricmp (cmd, "csprint") == 0) {
		Svcmd_CSprint();
		return qtrue;
	}

	if (Q_stricmp (cmd, "changemode") == 0) {
		Svcmd_ChangeMode();
		return qtrue;
	}

	if (Q_stricmp (cmd, "silence") == 0) {
		Svcmd_Silence();
		return qtrue;
	}

	if (Q_stricmp (cmd, "empower") == 0) {
		Svcmd_Empower();
		return qtrue;
	}

	if (Q_stricmp (cmd, "rename") == 0) {
		Svcmd_Rename();
		return qtrue;
	}

	if (Q_stricmp (cmd, "kick") == 0) {
		Svcmd_AdminKick();
		return qtrue;
	}

	if (Q_stricmp (cmd, "changemap") == 0) {
		Svcmd_ChangeMap();
		return qtrue;
	}

	if (Q_stricmp (cmd, "lockteam") == 0) {
		Svcmd_LockTeam();
		return qtrue;
	}

	if (Q_stricmp (cmd, "slap") == 0) {
		Svcmd_Slap();
		return qtrue;
	}

	if (Q_stricmp (cmd, "protect") == 0) {
		Svcmd_Protect();
		return qtrue;
	}

	if (Q_stricmp (cmd, "slay") == 0) {
		Svcmd_Slay();
		return qtrue;
	}

	if (Q_stricmp (cmd, "terminator") == 0) {
		Svcmd_Terminator();
		return qtrue;
	}

	if (Q_stricmp (cmd, "who") == 0) {
		Svcmd_Who();
		return qtrue;
	}

	if (g_dedicated.integer) {
		if (Q_stricmp (cmd, "say") == 0) {
			trap_SendServerCommand( -1, va("print \"Server: %s\n\"", ConcatArgs(1) ) );
			return qtrue;
		}
		// everything else will also be printed as a say command
		trap_SendServerCommand( -1, va("print \"Server: %s\n\"", ConcatArgs(0) ) );
		return qtrue;
	}

	return qfalse;
}

