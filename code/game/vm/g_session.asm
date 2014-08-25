export G_WriteClientSessionData
code
proc G_WriteClientSessionData 84 48
file "../g_session.c"
line 23
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:
;6:/*
;7:=======================================================================
;8:
;9:  SESSION DATA
;10:
;11:Session data is the only data that stays persistant across level loads
;12:and tournament restarts.
;13:=======================================================================
;14:*/
;15:
;16:/*
;17:================
;18:G_WriteClientSessionData
;19:
;20:Called on game shutdown
;21:================
;22:*/
;23:void G_WriteClientSessionData( gclient_t *client ) {
line 28
;24:	const char	*s;
;25:	const char	*var;
;26:	char		IPstring[64];
;27:
;28:	strcpy(IPstring, client->sess.IPstring);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1688
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 30
;29:
;30:	if (!IPstring[0])
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $79
line 31
;31:	{ //make sure there's at least something
line 32
;32:		strcpy(IPstring, "none");
ADDRLP4 0
ARGP4
ADDRGP4 $81
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 33
;33:	}
LABELV $79
line 35
;34:
;35:	s = va("%i %i %i %i %i %i %i %i %i %i %s", 
ADDRGP4 $82
ARGP4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 1640
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 1644
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 1648
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 1652
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 1656
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 1676
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 1668
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 1664
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 1660
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 76
INDIRP4
ASGNP4
line 49
;36:		client->sess.sessionTeam,
;37:		client->sess.spectatorTime,
;38:		client->sess.spectatorState,
;39:		client->sess.spectatorClient,
;40:		client->sess.wins,
;41:		client->sess.losses,
;42:		client->sess.teamLeader,
;43:		client->sess.setForce,
;44:		client->sess.saberLevel,
;45:		client->sess.selectedFP,
;46:		IPstring
;47:		);
;48:
;49:	var = va( "session%i", client - level.clients );
ADDRGP4 $83
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3024
DIVI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 80
INDIRP4
ASGNP4
line 51
;50:
;51:	trap_Cvar_Set( var, s );
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 52
;52:}
LABELV $78
endproc G_WriteClientSessionData 84 48
export G_ReadSessionData
proc G_ReadSessionData 1056 52
line 61
;53:
;54:/*
;55:================
;56:G_ReadSessionData
;57:
;58:Called on a reconnect
;59:================
;60:*/
;61:void G_ReadSessionData( gclient_t *client ) {
line 70
;62:	char	s[MAX_STRING_CHARS];
;63:	const char	*var;
;64:
;65:	// bk001205 - format
;66:	int teamLeader;
;67:	int spectatorState;
;68:	int sessionTeam;
;69:
;70:	var = va( "session%i", client - level.clients );
ADDRGP4 $83
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3024
DIVI4
ARGI4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1040
INDIRP4
ASGNP4
line 71
;71:	trap_Cvar_VariableStringBuffer( var, s, sizeof(s) );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 73
;72:
;73:	sscanf( s, "%i %i %i %i %i %i %i %i %i %i %s",
ADDRLP4 0
ARGP4
ADDRGP4 $82
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 1044
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1044
INDIRP4
CNSTI4 1640
ADDP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 1044
INDIRP4
CNSTI4 1648
ADDP4
ARGP4
ADDRLP4 1044
INDIRP4
CNSTI4 1652
ADDP4
ARGP4
ADDRLP4 1044
INDIRP4
CNSTI4 1656
ADDP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1044
INDIRP4
CNSTI4 1668
ADDP4
ARGP4
ADDRLP4 1044
INDIRP4
CNSTI4 1664
ADDP4
ARGP4
ADDRLP4 1044
INDIRP4
CNSTI4 1660
ADDP4
ARGP4
ADDRLP4 1044
INDIRP4
CNSTI4 1688
ADDP4
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 88
;74:		&sessionTeam,                 // bk010221 - format
;75:		&client->sess.spectatorTime,
;76:		&spectatorState,              // bk010221 - format
;77:		&client->sess.spectatorClient,
;78:		&client->sess.wins,
;79:		&client->sess.losses,
;80:		&teamLeader,                   // bk010221 - format
;81:		&client->sess.setForce,
;82:		&client->sess.saberLevel,
;83:		&client->sess.selectedFP,
;84:		&client->sess.IPstring
;85:		);
;86:
;87:	// bk001205 - format issues
;88:	client->sess.sessionTeam = (team_t)sessionTeam;
ADDRFP4 0
INDIRP4
CNSTI4 1636
ADDP4
ADDRLP4 1036
INDIRI4
ASGNI4
line 89
;89:	client->sess.spectatorState = (spectatorState_t)spectatorState;
ADDRFP4 0
INDIRP4
CNSTI4 1644
ADDP4
ADDRLP4 1032
INDIRI4
ASGNI4
line 90
;90:	client->sess.teamLeader = (qboolean)teamLeader;
ADDRFP4 0
INDIRP4
CNSTI4 1676
ADDP4
ADDRLP4 1028
INDIRI4
ASGNI4
line 92
;91:
;92:	client->ps.fd.saberAnimLevel = client->sess.saberLevel;
ADDRLP4 1048
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1048
INDIRP4
CNSTI4 1228
ADDP4
ADDRLP4 1048
INDIRP4
CNSTI4 1664
ADDP4
INDIRI4
ASGNI4
line 93
;93:	client->ps.fd.forcePowerSelected = client->sess.selectedFP;
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CNSTI4 852
ADDP4
ADDRLP4 1052
INDIRP4
CNSTI4 1660
ADDP4
INDIRI4
ASGNI4
line 94
;94:}
LABELV $84
endproc G_ReadSessionData 1056 52
export G_InitSessionData
proc G_InitSessionData 1044 52
line 104
;95:
;96:
;97:/*
;98:================
;99:G_InitSessionData
;100:
;101:Called on a first-time connect
;102:================
;103:*/
;104:void G_InitSessionData( gclient_t *client, char *userinfo, qboolean isBot, qboolean firstTime) {
line 108
;105:	clientSession_t	*sess;
;106:	const char		*value;
;107:
;108:	sess = &client->sess;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1636
ADDP4
ASGNP4
line 111
;109:
;110:	// initial team determination
;111:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $86
line 112
;112:		if ( g_teamAutoJoin.integer ) {
ADDRGP4 g_teamAutoJoin+12
INDIRI4
CNSTI4 0
EQI4 $89
line 113
;113:			sess->sessionTeam = PickTeam( -1 );
CNSTI4 -1
ARGI4
ADDRLP4 8
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 114
;114:			BroadcastTeamChange( client, -1 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 115
;115:		} else {
ADDRGP4 $87
JUMPV
LABELV $89
line 117
;116:			// always spawn as spectator in team games
;117:			if (!isBot)
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $92
line 118
;118:			{
line 119
;119:				sess->sessionTeam = TEAM_SPECTATOR;	
ADDRLP4 0
INDIRP4
CNSTI4 3
ASGNI4
line 120
;120:			}
ADDRGP4 $87
JUMPV
LABELV $92
line 122
;121:			else
;122:			{ //Bots choose their team on creation
line 123
;123:				value = Info_ValueForKey( userinfo, "team" );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $94
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 124
;124:				if (value[0] == 'r' || value[0] == 'R')
ADDRLP4 12
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 114
EQI4 $97
ADDRLP4 12
INDIRI4
CNSTI4 82
NEI4 $95
LABELV $97
line 125
;125:				{
line 126
;126:					sess->sessionTeam = TEAM_RED;
ADDRLP4 0
INDIRP4
CNSTI4 1
ASGNI4
line 127
;127:				}
ADDRGP4 $96
JUMPV
LABELV $95
line 128
;128:				else if (value[0] == 'b' || value[0] == 'B')
ADDRLP4 16
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 98
EQI4 $100
ADDRLP4 16
INDIRI4
CNSTI4 66
NEI4 $98
LABELV $100
line 129
;129:				{
line 130
;130:					sess->sessionTeam = TEAM_BLUE;
ADDRLP4 0
INDIRP4
CNSTI4 2
ASGNI4
line 131
;131:				}
ADDRGP4 $99
JUMPV
LABELV $98
line 133
;132:				else
;133:				{
line 134
;134:					sess->sessionTeam = PickTeam( -1 );
CNSTI4 -1
ARGI4
ADDRLP4 20
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ASGNI4
line 135
;135:				}
LABELV $99
LABELV $96
line 136
;136:				BroadcastTeamChange( client, -1 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 137
;137:			}
line 138
;138:		}
line 139
;139:	} else {
ADDRGP4 $87
JUMPV
LABELV $86
line 140
;140:		value = Info_ValueForKey( userinfo, "team" );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $94
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 141
;141:		if ( value[0] == 's' ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 115
NEI4 $101
line 143
;142:			// a willing spectator, not a waiting-in-line
;143:			sess->sessionTeam = TEAM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 3
ASGNI4
line 144
;144:		} else {
ADDRGP4 $102
JUMPV
LABELV $101
line 145
;145:			switch ( g_gametype.integer ) {
ADDRLP4 12
ADDRGP4 g_gametype+12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $103
ADDRLP4 12
INDIRI4
CNSTI4 4
GTI4 $103
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $116
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $116
address $106
address $106
address $106
address $112
address $106
code
LABELV $103
LABELV $106
line 151
;146:			default:
;147:			case GT_FFA:
;148:			case GT_HOLOCRON:
;149:			case GT_JEDIMASTER:
;150:			case GT_SINGLE_PLAYER:
;151:				if ( g_maxGameClients.integer > 0 && 
ADDRGP4 g_maxGameClients+12
INDIRI4
CNSTI4 0
LEI4 $107
ADDRGP4 level+76
INDIRI4
ADDRGP4 g_maxGameClients+12
INDIRI4
LTI4 $107
line 152
;152:					level.numNonSpectatorClients >= g_maxGameClients.integer ) {
line 153
;153:					sess->sessionTeam = TEAM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 3
ASGNI4
line 154
;154:				} else {
ADDRGP4 $104
JUMPV
LABELV $107
line 155
;155:					sess->sessionTeam = TEAM_FREE;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 156
;156:				}
line 157
;157:				break;
ADDRGP4 $104
JUMPV
LABELV $112
line 160
;158:			case GT_TOURNAMENT:
;159:				// if the game is full, go into a waiting mode
;160:				if ( level.numNonSpectatorClients >= 2 ) {
ADDRGP4 level+76
INDIRI4
CNSTI4 2
LTI4 $113
line 161
;161:					sess->sessionTeam = TEAM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 3
ASGNI4
line 162
;162:				} else {
ADDRGP4 $104
JUMPV
LABELV $113
line 163
;163:					sess->sessionTeam = TEAM_FREE;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 164
;164:				}
line 165
;165:				break;
LABELV $104
line 167
;166:			}
;167:		}
LABELV $102
line 168
;168:	}
LABELV $87
line 170
;169:
;170:	sess->spectatorState = SPECTATOR_FREE;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 1
ASGNI4
line 171
;171:	sess->spectatorTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 173
;172:
;173:	if(firstTime)
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $118
line 174
;174:	{//only reset skillpoints for new players.
line 175
;175:		sess->IPstring[0] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI1 0
ASGNI1
line 176
;176:	}
ADDRGP4 $119
JUMPV
LABELV $118
line 178
;177:	else
;178:	{//remember the data from the last time.
line 183
;179:		char	s[MAX_STRING_CHARS];
;180:		const char	*var;
;181:		int tempInt;
;182:
;183:		var = va( "session%i", client - level.clients );
ADDRGP4 $83
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3024
DIVI4
ARGI4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1036
ADDRLP4 1040
INDIRP4
ASGNP4
line 184
;184:		trap_Cvar_VariableStringBuffer( var, s, sizeof(s) );
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 185
;185:		sscanf( s, "%i %i %i %i %i %i %i %i %i %i %s",
ADDRLP4 12
ARGP4
ADDRGP4 $82
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 8
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1688
ADDP4
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 198
;186:			&tempInt,                 // bk010221 - format
;187:			&tempInt,
;188:			&tempInt,              // bk010221 - format
;189:			&tempInt,
;190:			&tempInt,
;191:			&tempInt,
;192:			&tempInt,                   // bk010221 - format
;193:			&tempInt,
;194:			&tempInt,
;195:			&tempInt,
;196:			&client->sess.IPstring
;197:			);
;198:	}
LABELV $119
line 200
;199:
;200:	G_WriteClientSessionData( client );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 201
;201:}
LABELV $85
endproc G_InitSessionData 1044 52
export G_InitWorldSession
proc G_InitWorldSession 1032 12
line 210
;202:
;203:
;204:/*
;205:==================
;206:G_InitWorldSession
;207:
;208:==================
;209:*/
;210:void G_InitWorldSession( void ) {
line 214
;211:	char	s[MAX_STRING_CHARS];
;212:	int			gt;
;213:
;214:	trap_Cvar_VariableStringBuffer( "session", s, sizeof(s) );
ADDRGP4 $121
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 215
;215:	gt = atoi( s );
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1028
INDIRI4
ASGNI4
line 219
;216:	
;217:	// if the gametype changed since the last session, don't use any
;218:	// client sessions
;219:	if ( g_gametype.integer != gt ) {
ADDRGP4 g_gametype+12
INDIRI4
ADDRLP4 1024
INDIRI4
EQI4 $122
line 220
;220:		level.newSession = qtrue;
ADDRGP4 level+64
CNSTI4 1
ASGNI4
line 221
;221:		G_Printf( "Gametype changed, clearing session data.\n" );
ADDRGP4 $126
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 222
;222:	}
LABELV $122
line 223
;223:}
LABELV $120
endproc G_InitWorldSession 1032 12
export G_WriteSessionData
proc G_WriteSessionData 8 8
line 231
;224:
;225:/*
;226:==================
;227:G_WriteSessionData
;228:
;229:==================
;230:*/
;231:void G_WriteSessionData( void ) {
line 234
;232:	int		i;
;233:
;234:	trap_Cvar_Set( "session", va("%i", g_gametype.integer) );
ADDRGP4 $128
ARGP4
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $121
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 236
;235:
;236:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $133
JUMPV
LABELV $130
line 237
;237:		if ( level.clients[i].pers.connected == CON_CONNECTED ) {
CNSTI4 3024
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $135
line 238
;238:			G_WriteClientSessionData( &level.clients[i] );
CNSTI4 3024
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 239
;239:		}
LABELV $135
line 240
;240:	}
LABELV $131
line 236
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $133
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $130
line 241
;241:}
LABELV $127
endproc G_WriteSessionData 8 8
import trap_ROFF_Purge_Ent
import trap_ROFF_Play
import trap_ROFF_Cache
import trap_ROFF_UpdateEntities
import trap_ROFF_Clean
import trap_SP_GetStringTextString
import trap_SP_Register
import trap_SP_RegisterServer
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_ForcePower
import trap_EA_Alt_Attack
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Milliseconds
import trap_Error
import trap_Printf
import cm_botsattackhumans
import cm_clanLogout_saying
import cm_clanLogin_saying
import cm_teleport_saying
import cm_slay_saying
import cm_sleep_off_saying
import cm_sleep_on_saying
import cm_punish_off_saying
import cm_punish_on_saying
import cm_slap_saying
import cm_silence_off_saying
import cm_silence_on_saying
import cm_protect_off_saying
import cm_protect_on_saying
import cm_terminator_off_saying
import cm_terminator_on_saying
import cm_empower_off_saying
import cm_empower_on_saying
import cm_AdminLogout3_saying
import cm_AdminLogout2_saying
import cm_AdminLogout1_saying
import cm_AdminLogin3_saying
import cm_AdminLogin2_saying
import cm_AdminLogin1_saying
import cm_adminPassword3
import cm_adminPassword2
import cm_adminPassword1
import cm_clanPassword
import cm_voteControl
import cm_emoteControl
import cm_adminControl3
import cm_adminControl2
import cm_adminControl1
import cm_adminLevel3
import cm_adminLevel2
import cm_adminLevel1
import cm_report
import cm_clanTag
import cm_badwords
import sv_maxConnections
import cm_autoprotecttime
import cm_knockmedown
import cm_blacknames
import cm_duelshield
import cm_duelhealth
import cm_duelradius
import cm_duelstatus
import mod_pushall
import cm_samenames
import cm_duelbeginsaberoff
import cm_multiduels
import cm_savedualblade
import cm_dualblade
import cm_motd_time
import cm_motd
import cm_console_motd
import g_austrian
import g_saberDebugPrint
import g_saberDmgDelay_Wound
import g_saberDmgDelay_Idle
import g_saberDmgVelocityScale
import g_timeouttospec
import g_forceDodge
import g_dismember
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_rankings
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_debugUp
import g_debugRight
import g_debugForward
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_motd
import g_synchronousClients
import g_adaptRespawn
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlySaber
import g_friendlyFire
import g_saberInterpolate
import g_capturelimit
import g_timelimit
import g_duel_fraglimit
import g_fraglimit
import g_duelWeaponDisable
import g_fraglimitVoteCorrection
import g_allowDuelSuicide
import g_weaponDisable
import g_forcePowerDisable
import g_spawnInvulnerability
import g_forceRegenTime
import g_saberDamageScale
import g_slowmoDuelEnd
import g_logClientInfo
import g_saberBoxTraceSize
import g_saberAlwaysBoxTrace
import g_saberGhoul2Collision
import g_saberTraceSaberFirst
import g_saberLockFactor
import g_saberLocking
import g_privateDuel
import g_forceBasedTeams
import g_maxForceRank
import g_dmflags
import g_autoMapCycle
import g_trueJedi
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_entities
import level
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectSagaSpawnPoint
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import B_CleanupAlloc
import B_InitAlloc
import InFieldOfVision
import BotOrder
import OrgVisible
import InitSagaMode
import G_ClearClientLog
import G_LogExit
import G_LogWeaponOutput
import G_LogWeaponInit
import G_LogWeaponItem
import G_LogWeaponPowerup
import G_LogWeaponFrag
import G_LogWeaponDeath
import G_LogWeaponKill
import G_LogWeaponDamage
import G_LogWeaponFire
import G_LogWeaponPickup
import Jedi_DodgeEvasion
import ForceTelepathy
import ForceThrow
import ForceSeeing
import ForceTeamForceReplenish
import ForceTeamHeal
import ForceAbsorb
import ForceProtect
import ForceGrip
import ForceRage
import ForceSpeed
import ForceHeal
import ForcePowerUsableOn
import WP_ForcePowersUpdate
import WP_SpawnInitForcePowers
import WP_InitForcePowers
import WP_SaberInitBladeData
import WP_SaberCanBlock
import WP_SaberPositionUpdate
import WP_ForcePowerStop
import HasSetSaberOnly
import G_PreDefSound
import G_RefreshNextMap
import G_DoesMapSupportGametype
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import UpdateTournamentInfo
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import Team_CheckDroppedItem
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import G_CheckClientTimeouts
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_GetStripEdString
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import gSlowMoDuelTime
import gDoSlowMoDuel
import g_ff_objectives
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import BlowDetpacks
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import gJMSaberEnt
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamCount
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import WP_FireGenericBlasterMissile
import WP_FireTurretMissile
import G_CreateExampleAnimEnt
import G_PlayerBecomeATST
import ATST_ManageDamageBoxes
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import WP_FireBlasterMissile
import G_ExplodeMissile
import G_BounceProjectile
import CreateMissile
import G_RunMissile
import G_ReflectMissile
import gGAvoidDismember
import G_CheckForDismemberment
import ExplodeDeath
import TossClientCubes
import TossClientItems
import TossClientWeapon
import body_die
import G_RadiusDamage
import G_Damage
import CanDamage
import trap_G2API_SetBoneAnim
import trap_G2API_GetGLAName
import trap_G2API_SetBoneAngles
import trap_G2API_CollisionDetect
import trap_G2API_CleanGhoul2Models
import trap_G2API_RemoveGhoul2Model
import trap_G2API_HasGhoul2ModelOnIndex
import trap_G2API_DuplicateGhoul2Instance
import trap_G2API_CopySpecificGhoul2Model
import trap_G2API_CopyGhoul2Instance
import trap_G2API_SetBoltInfo
import trap_G2API_AddBolt
import trap_G2API_InitGhoul2Model
import trap_G2API_GetBoltMatrix_NoRecNoRot
import trap_G2API_GetBoltMatrix_NoReconstruct
import trap_G2API_GetBoltMatrix
import trap_G2_HaveWeGhoul2Models
import trap_G2_SetGhoul2ModelIndexes
import trap_G2_ListModelBones
import trap_G2_ListModelSurfaces
import G_SkinIndex
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vtos
import tv
import G_RunObject
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_KillG2Queue
import G_SendG2KillQueue
import TryUse
import G_EntitySound
import G_SoundAtLoc
import G_Sound
import G_MuteSound
import G_ScreenShake
import G_PlayEffect
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetAngles
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_RadiusList
import G_Find
import G_KillBox
import G_TeamCommand
import G_EffectIndex
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import ResetItem
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import ItemUse_MedPack
import ItemUse_Seeker
import ItemUse_Sentry
import ItemUse_Shield
import ItemUse_Binoculars
import G_GetDuelWinner
import Cmd_EngageDuel_f
import Cmd_ToggleSaber_f
import G_ItemUsable
import Cmd_SaberAttackCycle_f
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import gEscapeTime
import gEscaping
import g2SaberInstance
import precachedKyle
import forcePowerDarkLight
import WeaponAttackAnim
import WeaponReadyAnim
import BG_OutOfMemory
import BG_StringAlloc
import BG_TempFree
import BG_TempAlloc
import BG_AllocUnaligned
import BG_Alloc
import BG_CanUseFPNow
import BG_HasYsalamiri
import BG_GetItemIndexByTag
import BG_ParseAnimationFile
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_ForcePowerDrain
import BG_SaberStartTransAnim
import BG_InDeathAnim
import BG_InRoll
import BG_KnockawayForParry
import BG_BrokenParryForParry
import BG_BrokenParryForAttack
import BG_SaberInSpecialAttack
import BG_SpinningSaberAnim
import BG_FlippingAnim
import BG_SaberInIdle
import BG_SaberInSpecial
import BG_SaberInAttack
import BG_DirectFlippingAnim
import BG_InSaberStandAnim
import BG_InSpecialJump
import BG_LegalizedForcePowers
import saberMoveData
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import vectoyaw
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import pm
import bgForcePowerCost
import forceMasteryPoints
import forceMasteryLevels
import bgGlobalAnimations
import BGPAFtextLoaded
import forcePowerSorted
import WP_MuzzlePoint
import ammoData
import weaponData
import GetStringForID
import GetIDForString
import Q_irand
import irand
import flrand
import Rand_Init
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import va
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseVec4
import COM_ParseFloat
import COM_ParseInt
import COM_ParseString
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import SkipWhitespace
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import powf
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkBlue
import colorLtBlue
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import colorTable
import bytedirs
import Com_Memcpy
import Com_Memset
import Hunk_Alloc
import forceSpeedLevels
import FloatSwap
import LongSwap
import ShortSwap
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import vsprintf
import _atoi
import atoi
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $128
char 1 37
char 1 105
char 1 0
align 1
LABELV $126
char 1 71
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 32
char 1 99
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 100
char 1 44
char 1 32
char 1 99
char 1 108
char 1 101
char 1 97
char 1 114
char 1 105
char 1 110
char 1 103
char 1 32
char 1 115
char 1 101
char 1 115
char 1 115
char 1 105
char 1 111
char 1 110
char 1 32
char 1 100
char 1 97
char 1 116
char 1 97
char 1 46
char 1 10
char 1 0
align 1
LABELV $121
char 1 115
char 1 101
char 1 115
char 1 115
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $94
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $83
char 1 115
char 1 101
char 1 115
char 1 115
char 1 105
char 1 111
char 1 110
char 1 37
char 1 105
char 1 0
align 1
LABELV $82
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $81
char 1 110
char 1 111
char 1 110
char 1 101
char 1 0
