export trap_Cvar_VariableValue
code
proc trap_Cvar_VariableValue 132 12
file "../g_bot.c"
line 35
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_bot.c
;4:
;5:#include "g_local.h"
;6:
;7:
;8:static int		g_numBots;
;9:static char		*g_botInfos[MAX_BOTS];
;10:
;11:
;12:int				g_numArenas;
;13:static char		*g_arenaInfos[MAX_ARENAS];
;14:
;15:
;16:#define BOT_BEGIN_DELAY_BASE		2000
;17:#define BOT_BEGIN_DELAY_INCREMENT	1500
;18:
;19:#define BOT_SPAWN_QUEUE_DEPTH	16
;20:
;21:typedef struct {
;22:	int		clientNum;
;23:	int		spawnTime;
;24:} botSpawnQueue_t;
;25:
;26://static int			botBeginDelay = 0;  // bk001206 - unused, init
;27:static botSpawnQueue_t	botSpawnQueue[BOT_SPAWN_QUEUE_DEPTH];
;28:
;29:vmCvar_t bot_minplayers;
;30:
;31:extern gentity_t	*podium1;
;32:extern gentity_t	*podium2;
;33:extern gentity_t	*podium3;
;34:
;35:float trap_Cvar_VariableValue( const char *var_name ) {
line 38
;36:	char buf[128];
;37:
;38:	trap_Cvar_VariableStringBuffer(var_name, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 39
;39:	return atof(buf);
ADDRLP4 0
ARGP4
ADDRLP4 128
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 128
INDIRF4
RETF4
LABELV $79
endproc trap_Cvar_VariableValue 132 12
export G_ParseInfos
proc G_ParseInfos 2084 12
line 49
;40:}
;41:
;42:
;43:
;44:/*
;45:===============
;46:G_ParseInfos
;47:===============
;48:*/
;49:int G_ParseInfos( char *buf, int max, char *infos[] ) {
line 55
;50:	char	*token;
;51:	int		count;
;52:	char	key[MAX_TOKEN_CHARS];
;53:	char	info[MAX_INFO_STRING];
;54:
;55:	count = 0;
ADDRLP4 2052
CNSTI4 0
ASGNI4
ADDRGP4 $82
JUMPV
LABELV $81
line 57
;56:
;57:	while ( 1 ) {
line 58
;58:		token = COM_Parse( (const char **)(&buf) );
ADDRFP4 0
ARGP4
ADDRLP4 2056
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2056
INDIRP4
ASGNP4
line 59
;59:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $84
line 60
;60:			break;
ADDRGP4 $83
JUMPV
LABELV $84
line 62
;61:		}
;62:		if ( strcmp( token, "{" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $88
ARGP4
ADDRLP4 2060
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
EQI4 $86
line 63
;63:			Com_Printf( "Missing { in info file\n" );
ADDRGP4 $89
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 64
;64:			break;
ADDRGP4 $83
JUMPV
LABELV $86
line 67
;65:		}
;66:
;67:		if ( count == max ) {
ADDRLP4 2052
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $90
line 68
;68:			Com_Printf( "Max infos exceeded\n" );
ADDRGP4 $92
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 69
;69:			break;
ADDRGP4 $83
JUMPV
LABELV $90
line 72
;70:		}
;71:
;72:		info[0] = '\0';
ADDRLP4 1028
CNSTI1 0
ASGNI1
ADDRGP4 $94
JUMPV
LABELV $93
line 73
;73:		while ( 1 ) {
line 74
;74:			token = COM_ParseExt( (const char **)(&buf), qtrue );
ADDRFP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 2064
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ASGNP4
line 75
;75:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $96
line 76
;76:				Com_Printf( "Unexpected end of info file\n" );
ADDRGP4 $98
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 77
;77:				break;
ADDRGP4 $95
JUMPV
LABELV $96
line 79
;78:			}
;79:			if ( !strcmp( token, "}" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $101
ARGP4
ADDRLP4 2068
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $99
line 80
;80:				break;
ADDRGP4 $95
JUMPV
LABELV $99
line 82
;81:			}
;82:			Q_strncpyz( key, token, sizeof( key ) );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 84
;83:
;84:			token = COM_ParseExt( (const char **)(&buf), qfalse );
ADDRFP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 2072
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2072
INDIRP4
ASGNP4
line 85
;85:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $102
line 86
;86:				strcpy( token, "<NULL>" );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $104
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 87
;87:			}
LABELV $102
line 88
;88:			Info_SetValueForKey( info, key, token );
ADDRLP4 1028
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 89
;89:		}
LABELV $94
line 73
ADDRGP4 $93
JUMPV
LABELV $95
line 91
;90:		//NOTE: extra space for arena number
;91:		infos[count] = G_Alloc(strlen(info) + strlen("\\num\\") + strlen(va("%d", MAX_ARENAS)) + 1);
ADDRLP4 1028
ARGP4
ADDRLP4 2064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $105
ARGP4
ADDRLP4 2068
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $106
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2072
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2072
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2064
INDIRI4
ADDRLP4 2068
INDIRI4
ADDI4
ADDRLP4 2076
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 2080
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 2080
INDIRP4
ASGNP4
line 92
;92:		if (infos[count]) {
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $107
line 93
;93:			strcpy(infos[count], info);
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 94
;94:			count++;
ADDRLP4 2052
ADDRLP4 2052
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 95
;95:		}
LABELV $107
line 96
;96:	}
LABELV $82
line 57
ADDRGP4 $81
JUMPV
LABELV $83
line 97
;97:	return count;
ADDRLP4 2052
INDIRI4
RETI4
LABELV $80
endproc G_ParseInfos 2084 12
proc G_LoadArenasFromFile 8216 16
line 105
;98:}
;99:
;100:/*
;101:===============
;102:G_LoadArenasFromFile
;103:===============
;104:*/
;105:static void G_LoadArenasFromFile( char *filename ) {
line 110
;106:	int				len;
;107:	fileHandle_t	f;
;108:	char			buf[MAX_ARENAS_TEXT];
;109:
;110:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8200
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8200
INDIRI4
ASGNI4
line 111
;111:	if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $110
line 112
;112:		trap_Printf( va( S_COLOR_RED "file not found: %s\n", filename ) );
ADDRGP4 $112
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 113
;113:		return;
ADDRGP4 $109
JUMPV
LABELV $110
line 115
;114:	}
;115:	if ( len >= MAX_ARENAS_TEXT ) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $113
line 116
;116:		trap_Printf( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, MAX_ARENAS_TEXT ) );
ADDRGP4 $115
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 8192
ARGI4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 117
;117:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 118
;118:		return;
ADDRGP4 $109
JUMPV
LABELV $113
line 121
;119:	}
;120:
;121:	trap_FS_Read( buf, len, f );
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 122
;122:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 123
;123:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 125
;124:
;125:	g_numArenas += G_ParseInfos( buf, MAX_ARENAS - g_numArenas, &g_arenaInfos[g_numArenas] );
ADDRLP4 8
ARGP4
ADDRLP4 8204
ADDRGP4 g_numArenas
ASGNP4
ADDRLP4 8208
ADDRLP4 8204
INDIRP4
INDIRI4
ASGNI4
CNSTI4 1024
ADDRLP4 8208
INDIRI4
SUBI4
ARGI4
ADDRLP4 8208
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
ARGP4
ADDRLP4 8212
ADDRGP4 G_ParseInfos
CALLI4
ASGNI4
ADDRLP4 8204
INDIRP4
ADDRLP4 8208
INDIRI4
ADDRLP4 8212
INDIRI4
ADDI4
ASGNI4
line 126
;126:}
LABELV $109
endproc G_LoadArenasFromFile 8216 16
export G_GetMapTypeBits
proc G_GetMapTypeBits 32 8
line 129
;127:
;128:int G_GetMapTypeBits(char *type)
;129:{
line 130
;130:	int typeBits = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 132
;131:
;132:	if( *type ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $117
line 133
;133:		if( strstr( type, "ffa" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $121
ARGP4
ADDRLP4 4
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $119
line 134
;134:			typeBits |= (1 << GT_FFA);
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 135
;135:			typeBits |= (1 << GT_TEAM);
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 136
;136:		}
LABELV $119
line 137
;137:		if( strstr( type, "holocron" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $124
ARGP4
ADDRLP4 8
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $122
line 138
;138:			typeBits |= (1 << GT_HOLOCRON);
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 139
;139:		}
LABELV $122
line 140
;140:		if( strstr( type, "jedimaster" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $127
ARGP4
ADDRLP4 12
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $125
line 141
;141:			typeBits |= (1 << GT_JEDIMASTER);
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 142
;142:		}
LABELV $125
line 143
;143:		if( strstr( type, "duel" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $130
ARGP4
ADDRLP4 16
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $128
line 144
;144:			typeBits |= (1 << GT_TOURNAMENT);
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 145
;145:		}
LABELV $128
line 146
;146:		if( strstr( type, "saga" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $133
ARGP4
ADDRLP4 20
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $131
line 147
;147:			typeBits |= (1 << GT_SAGA);
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 148
;148:		}
LABELV $131
line 149
;149:		if( strstr( type, "ctf" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $136
ARGP4
ADDRLP4 24
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $134
line 150
;150:			typeBits |= (1 << GT_CTF);
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 151
;151:		}
LABELV $134
line 152
;152:		if( strstr( type, "cty" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $139
ARGP4
ADDRLP4 28
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $118
line 153
;153:			typeBits |= (1 << GT_CTY);
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 154
;154:		}
line 155
;155:	} else {
ADDRGP4 $118
JUMPV
LABELV $117
line 156
;156:		typeBits |= (1 << GT_FFA);
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 157
;157:	}
LABELV $118
line 159
;158:
;159:	return typeBits;
ADDRLP4 0
INDIRI4
RETI4
LABELV $116
endproc G_GetMapTypeBits 32 8
export G_DoesMapSupportGametype
proc G_DoesMapSupportGametype 28 8
line 163
;160:}
;161:
;162:qboolean G_DoesMapSupportGametype(const char *mapname, int gametype)
;163:{
line 164
;164:	int			typeBits = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 165
;165:	int			thisLevel = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 166
;166:	int			n = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 167
;167:	char		*type = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 169
;168:
;169:	if (!g_arenaInfos[0])
ADDRGP4 g_arenaInfos
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $141
line 170
;170:	{
line 171
;171:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $140
JUMPV
LABELV $141
line 174
;172:	}
;173:
;174:	if (!mapname || !mapname[0])
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $145
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $143
LABELV $145
line 175
;175:	{
line 176
;176:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $140
JUMPV
LABELV $143
line 179
;177:	}
;178:
;179:	for( n = 0; n < g_numArenas; n++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $149
JUMPV
LABELV $146
line 180
;180:	{
line 181
;181:		type = Info_ValueForKey( g_arenaInfos[n], "map" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $150
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 183
;182:
;183:		if (Q_stricmp(mapname, type) == 0)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $151
line 184
;184:		{
line 185
;185:			thisLevel = n;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 186
;186:			break;
ADDRGP4 $148
JUMPV
LABELV $151
line 188
;187:		}
;188:	}
LABELV $147
line 179
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $149
ADDRLP4 0
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
LTI4 $146
LABELV $148
line 190
;189:
;190:	if (thisLevel == -1)
ADDRLP4 8
INDIRI4
CNSTI4 -1
NEI4 $153
line 191
;191:	{
line 192
;192:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $140
JUMPV
LABELV $153
line 195
;193:	}
;194:
;195:	type = Info_ValueForKey(g_arenaInfos[thisLevel], "type");
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 197
;196:
;197:	typeBits = G_GetMapTypeBits(type);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_GetMapTypeBits
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 198
;198:	if (typeBits & (1 << gametype))
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $156
line 199
;199:	{ //the map in question supports the gametype in question, so..
line 200
;200:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $140
JUMPV
LABELV $156
line 203
;201:	}
;202:
;203:	return qfalse;
CNSTI4 0
RETI4
LABELV $140
endproc G_DoesMapSupportGametype 28 8
export G_RefreshNextMap
proc G_RefreshNextMap 312 16
line 208
;204:}
;205:
;206://rww - auto-obtain nextmap. I could've sworn Q3 had something like this, but I guess not.
;207:const char *G_RefreshNextMap(int gametype, qboolean forced)
;208:{
line 209
;209:	int			typeBits = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 210
;210:	int			thisLevel = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 211
;211:	int			desiredMap = 0;
ADDRLP4 292
CNSTI4 0
ASGNI4
line 212
;212:	int			n = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 213
;213:	char		*type = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 214
;214:	qboolean	loopingUp = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 217
;215:	vmCvar_t	mapname;
;216:
;217:	if (!g_autoMapCycle.integer && !forced)
ADDRLP4 296
CNSTI4 0
ASGNI4
ADDRGP4 g_autoMapCycle+12
INDIRI4
ADDRLP4 296
INDIRI4
NEI4 $159
ADDRFP4 4
INDIRI4
ADDRLP4 296
INDIRI4
NEI4 $159
line 218
;218:	{
line 219
;219:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $158
JUMPV
LABELV $159
line 222
;220:	}
;221:
;222:	if (!g_arenaInfos[0])
ADDRGP4 g_arenaInfos
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $162
line 223
;223:	{
line 224
;224:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $158
JUMPV
LABELV $162
line 227
;225:	}
;226:
;227:	trap_Cvar_Register( &mapname, "mapname", "", CVAR_SERVERINFO | CVAR_ROM );
ADDRLP4 20
ARGP4
ADDRGP4 $164
ARGP4
ADDRGP4 $165
ARGP4
CNSTI4 68
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 228
;228:	for( n = 0; n < g_numArenas; n++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $169
JUMPV
LABELV $166
line 229
;229:	{
line 230
;230:		type = Info_ValueForKey( g_arenaInfos[n], "map" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $150
ARGP4
ADDRLP4 300
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 300
INDIRP4
ASGNP4
line 232
;231:
;232:		if (Q_stricmp(mapname.string, type) == 0)
ADDRLP4 20+16
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 304
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 304
INDIRI4
CNSTI4 0
NEI4 $170
line 233
;233:		{
line 234
;234:			thisLevel = n;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
line 235
;235:			break;
ADDRGP4 $168
JUMPV
LABELV $170
line 237
;236:		}
;237:	}
LABELV $167
line 228
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $169
ADDRLP4 0
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
LTI4 $166
LABELV $168
line 239
;238:
;239:	desiredMap = thisLevel;
ADDRLP4 292
ADDRLP4 12
INDIRI4
ASGNI4
line 241
;240:
;241:	n = thisLevel+1;
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $174
JUMPV
LABELV $173
line 243
;242:	while (n != thisLevel)
;243:	{ //now cycle through the arena list and find the next map that matches the gametype we're in
line 244
;244:		if (!g_arenaInfos[n] || n >= g_numArenas)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $178
ADDRLP4 0
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
LTI4 $176
LABELV $178
line 245
;245:		{
line 246
;246:			if (loopingUp)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $179
line 247
;247:			{ //this shouldn't happen, but if it does we have a null entry break in the arena file
line 249
;248:			  //if this is the case just break out of the loop instead of sticking in an infinite loop
;249:				break;
ADDRGP4 $175
JUMPV
LABELV $179
line 251
;250:			}
;251:			n = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 252
;252:			loopingUp = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 253
;253:		}
LABELV $176
line 255
;254:
;255:		type = Info_ValueForKey(g_arenaInfos[n], "type");
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 304
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 304
INDIRP4
ASGNP4
line 257
;256:		
;257:		typeBits = G_GetMapTypeBits(type);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 308
ADDRGP4 G_GetMapTypeBits
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 308
INDIRI4
ASGNI4
line 258
;258:		if (typeBits & (1 << gametype))
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $181
line 259
;259:		{
line 260
;260:			desiredMap = n;
ADDRLP4 292
ADDRLP4 0
INDIRI4
ASGNI4
line 261
;261:			break;
ADDRGP4 $175
JUMPV
LABELV $181
line 264
;262:		}
;263:
;264:		n++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 265
;265:	}
LABELV $174
line 242
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $173
LABELV $175
line 267
;266:
;267:	if (desiredMap == thisLevel)
ADDRLP4 292
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $183
line 268
;268:	{ //If this is the only level for this game mode or we just can't find a map for this game mode, then nextmap
line 270
;269:	  //will always restart.
;270:		trap_Cvar_Set( "nextmap", "map_restart 0");
ADDRGP4 $185
ARGP4
ADDRGP4 $186
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 271
;271:	}
ADDRGP4 $184
JUMPV
LABELV $183
line 273
;272:	else
;273:	{ //otherwise we have a valid nextmap to cycle to, so use it.
line 274
;274:		type = Info_ValueForKey( g_arenaInfos[desiredMap], "map" );
ADDRLP4 292
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $150
ARGP4
ADDRLP4 300
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 300
INDIRP4
ASGNP4
line 275
;275:		trap_Cvar_Set( "nextmap", va("map %s", type));
ADDRGP4 $187
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 304
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $185
ARGP4
ADDRLP4 304
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 276
;276:	}
LABELV $184
line 278
;277:
;278:	return Info_ValueForKey( g_arenaInfos[desiredMap], "map" );
ADDRLP4 292
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $150
ARGP4
ADDRLP4 300
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 300
INDIRP4
RETP4
LABELV $158
endproc G_RefreshNextMap 312 16
proc G_LoadArenas 1460 16
line 286
;279:}
;280:
;281:/*
;282:===============
;283:G_LoadArenas
;284:===============
;285:*/
;286:static void G_LoadArenas( void ) {
line 295
;287:	int			numdirs;
;288:	vmCvar_t	arenasFile;
;289:	char		filename[128];
;290:	char		dirlist[1024];
;291:	char*		dirptr;
;292:	int			i, n;
;293:	int			dirlen;
;294:
;295:	g_numArenas = 0;
ADDRGP4 g_numArenas
CNSTI4 0
ASGNI4
line 297
;296:
;297:	trap_Cvar_Register( &arenasFile, "g_arenasFile", "", CVAR_INIT|CVAR_ROM );
ADDRLP4 148
ARGP4
ADDRGP4 $189
ARGP4
ADDRGP4 $165
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 298
;298:	if( *arenasFile.string ) {
ADDRLP4 148+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $190
line 299
;299:		G_LoadArenasFromFile(arenasFile.string);
ADDRLP4 148+16
ARGP4
ADDRGP4 G_LoadArenasFromFile
CALLV
pop
line 300
;300:	}
ADDRGP4 $191
JUMPV
LABELV $190
line 301
;301:	else {
line 302
;302:		G_LoadArenasFromFile("scripts/arenas.txt");
ADDRGP4 $194
ARGP4
ADDRGP4 G_LoadArenasFromFile
CALLV
pop
line 303
;303:	}
LABELV $191
line 306
;304:
;305:	// get all arenas from .arena files
;306:	numdirs = trap_FS_GetFileList("scripts", ".arena", dirlist, 1024 );
ADDRGP4 $195
ARGP4
ADDRGP4 $196
ARGP4
ADDRLP4 420
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1444
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 1444
INDIRI4
ASGNI4
line 307
;307:	dirptr  = dirlist;
ADDRLP4 4
ADDRLP4 420
ASGNP4
line 308
;308:	for (i = 0; i < numdirs; i++, dirptr += dirlen+1) {
ADDRLP4 136
CNSTI4 0
ASGNI4
ADDRGP4 $200
JUMPV
LABELV $197
line 309
;309:		dirlen = strlen(dirptr);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1448
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 1448
INDIRI4
ASGNI4
line 310
;310:		strcpy(filename, "scripts/");
ADDRLP4 8
ARGP4
ADDRGP4 $201
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 311
;311:		strcat(filename, dirptr);
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 312
;312:		G_LoadArenasFromFile(filename);
ADDRLP4 8
ARGP4
ADDRGP4 G_LoadArenasFromFile
CALLV
pop
line 313
;313:	}
LABELV $198
line 308
ADDRLP4 1448
CNSTI4 1
ASGNI4
ADDRLP4 136
ADDRLP4 136
INDIRI4
ADDRLP4 1448
INDIRI4
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 140
INDIRI4
ADDRLP4 1448
INDIRI4
ADDI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
LABELV $200
ADDRLP4 136
INDIRI4
ADDRLP4 144
INDIRI4
LTI4 $197
line 314
;314:	trap_Printf( va( "%i arenas parsed\n", g_numArenas ) );
ADDRGP4 $202
ARGP4
ADDRGP4 g_numArenas
INDIRI4
ARGI4
ADDRLP4 1452
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1452
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 316
;315:	
;316:	for( n = 0; n < g_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $206
JUMPV
LABELV $203
line 317
;317:		Info_SetValueForKey( g_arenaInfos[n], "num", va( "%i", n ) );
ADDRGP4 $208
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1456
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $207
ARGP4
ADDRLP4 1456
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 318
;318:	}
LABELV $204
line 316
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $206
ADDRLP4 0
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
LTI4 $203
line 320
;319:
;320:	G_RefreshNextMap(g_gametype.integer, qfalse);
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_RefreshNextMap
CALLP4
pop
line 321
;321:}
LABELV $188
endproc G_LoadArenas 1460 16
export G_GetArenaInfoByMap
proc G_GetArenaInfoByMap 12 8
line 329
;322:
;323:
;324:/*
;325:===============
;326:G_GetArenaInfoByNumber
;327:===============
;328:*/
;329:const char *G_GetArenaInfoByMap( const char *map ) {
line 332
;330:	int			n;
;331:
;332:	for( n = 0; n < g_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $214
JUMPV
LABELV $211
line 333
;333:		if( Q_stricmp( Info_ValueForKey( g_arenaInfos[n], "map" ), map ) == 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $150
ARGP4
ADDRLP4 4
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $215
line 334
;334:			return g_arenaInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $210
JUMPV
LABELV $215
line 336
;335:		}
;336:	}
LABELV $212
line 332
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $214
ADDRLP4 0
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
LTI4 $211
line 338
;337:
;338:	return NULL;
CNSTP4 0
RETP4
LABELV $210
endproc G_GetArenaInfoByMap 12 8
export G_AddRandomBot
proc G_AddRandomBot 80 20
line 373
;339:}
;340:
;341:#if 0
;342:/*
;343:=================
;344:PlayerIntroSound
;345:=================
;346:*/
;347:static void PlayerIntroSound( const char *modelAndSkin ) {
;348:	char	model[MAX_QPATH];
;349:	char	*skin;
;350:
;351:	Q_strncpyz( model, modelAndSkin, sizeof(model) );
;352:	skin = Q_strrchr( model, '/' );
;353:	if ( skin ) {
;354:		*skin++ = '\0';
;355:	}
;356:	else {
;357:		skin = model;
;358:	}
;359:
;360:	if( Q_stricmp( skin, "default" ) == 0 ) {
;361:		skin = model;
;362:	}
;363:
;364:	trap_SendConsoleCommand( EXEC_APPEND, va( "play sound/player/announce/%s.wav\n", skin ) );
;365:}
;366:#endif
;367:
;368:/*
;369:===============
;370:G_AddRandomBot
;371:===============
;372:*/
;373:void G_AddRandomBot( int team ) {
line 379
;374:	int		i, n, num;
;375:	float	skill;
;376:	char	*value, netname[36], *teamstr;
;377:	gclient_t	*cl;
;378:
;379:	num = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 380
;380:	for ( n = 0; n < g_numBots ; n++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $221
JUMPV
LABELV $218
line 381
;381:		value = Info_ValueForKey( g_botInfos[n], "name" );
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $222
ARGP4
ADDRLP4 64
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 64
INDIRP4
ASGNP4
line 383
;382:		//
;383:		for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $226
JUMPV
LABELV $223
line 384
;384:			cl = level.clients + i;
ADDRLP4 0
CNSTI4 3024
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 385
;385:			if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $228
line 386
;386:				continue;
ADDRGP4 $224
JUMPV
LABELV $228
line 388
;387:			}
;388:			if ( !(g_entities[cl->ps.clientNum].r.svFlags & SVF_BOT) ) {
CNSTI4 852
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $230
line 389
;389:				continue;
ADDRGP4 $224
JUMPV
LABELV $230
line 391
;390:			}
;391:			if ( team >= 0 && cl->sess.sessionTeam != team ) {
ADDRLP4 68
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
LTI4 $234
ADDRLP4 0
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $234
line 392
;392:				continue;
ADDRGP4 $224
JUMPV
LABELV $234
line 394
;393:			}
;394:			if ( !Q_stricmp( value, cl->pers.netname ) ) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $236
line 395
;395:				break;
ADDRGP4 $225
JUMPV
LABELV $236
line 397
;396:			}
;397:		}
LABELV $224
line 383
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $226
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $223
LABELV $225
line 398
;398:		if (i >= g_maxclients.integer) {
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $238
line 399
;399:			num++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 400
;400:		}
LABELV $238
line 401
;401:	}
LABELV $219
line 380
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $221
ADDRLP4 12
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $218
line 402
;402:	num = random() * num;
ADDRLP4 64
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 64
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 403
;403:	for ( n = 0; n < g_numBots ; n++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $244
JUMPV
LABELV $241
line 404
;404:		value = Info_ValueForKey( g_botInfos[n], "name" );
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $222
ARGP4
ADDRLP4 68
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 68
INDIRP4
ASGNP4
line 406
;405:		//
;406:		for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $248
JUMPV
LABELV $245
line 407
;407:			cl = level.clients + i;
ADDRLP4 0
CNSTI4 3024
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 408
;408:			if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $250
line 409
;409:				continue;
ADDRGP4 $246
JUMPV
LABELV $250
line 411
;410:			}
;411:			if ( !(g_entities[cl->ps.clientNum].r.svFlags & SVF_BOT) ) {
CNSTI4 852
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $252
line 412
;412:				continue;
ADDRGP4 $246
JUMPV
LABELV $252
line 414
;413:			}
;414:			if ( team >= 0 && cl->sess.sessionTeam != team ) {
ADDRLP4 72
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
LTI4 $256
ADDRLP4 0
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $256
line 415
;415:				continue;
ADDRGP4 $246
JUMPV
LABELV $256
line 417
;416:			}
;417:			if ( !Q_stricmp( value, cl->pers.netname ) ) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $258
line 418
;418:				break;
ADDRGP4 $247
JUMPV
LABELV $258
line 420
;419:			}
;420:		}
LABELV $246
line 406
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $248
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $245
LABELV $247
line 421
;421:		if (i >= g_maxclients.integer) {
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $260
line 422
;422:			num--;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 423
;423:			if (num <= 0) {
ADDRLP4 16
INDIRI4
CNSTI4 0
GTI4 $263
line 424
;424:				skill = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $265
ARGP4
ADDRLP4 72
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 72
INDIRF4
ASGNF4
line 425
;425:				if (team == TEAM_RED) teamstr = "red";
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $266
ADDRLP4 60
ADDRGP4 $268
ASGNP4
ADDRGP4 $267
JUMPV
LABELV $266
line 426
;426:				else if (team == TEAM_BLUE) teamstr = "blue";
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $269
ADDRLP4 60
ADDRGP4 $271
ASGNP4
ADDRGP4 $270
JUMPV
LABELV $269
line 427
;427:				else teamstr = "";
ADDRLP4 60
ADDRGP4 $165
ASGNP4
LABELV $270
LABELV $267
line 428
;428:				strncpy(netname, value, sizeof(netname)-1);
ADDRLP4 20
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 35
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 429
;429:				netname[sizeof(netname)-1] = '\0';
ADDRLP4 20+35
CNSTI1 0
ASGNI1
line 430
;430:				Q_CleanStr(netname);
ADDRLP4 20
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 431
;431:				trap_SendConsoleCommand( EXEC_INSERT, va("addbot %s %f %s %i\n", netname, skill, teamstr, 0) );
ADDRGP4 $273
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 432
;432:				return;
ADDRGP4 $217
JUMPV
LABELV $263
line 434
;433:			}
;434:		}
LABELV $260
line 435
;435:	}
LABELV $242
line 403
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $244
ADDRLP4 12
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $241
line 436
;436:}
LABELV $217
endproc G_AddRandomBot 80 20
export G_RemoveRandomBot
proc G_RemoveRandomBot 56 8
line 443
;437:
;438:/*
;439:===============
;440:G_RemoveRandomBot
;441:===============
;442:*/
;443:int G_RemoveRandomBot( int team ) {
line 448
;444:	int i;
;445:	char netname[36];
;446:	gclient_t	*cl;
;447:
;448:	for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $278
JUMPV
LABELV $275
line 449
;449:		cl = level.clients + i;
ADDRLP4 0
CNSTI4 3024
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 450
;450:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $280
line 451
;451:			continue;
ADDRGP4 $276
JUMPV
LABELV $280
line 453
;452:		}
;453:		if ( !(g_entities[cl->ps.clientNum].r.svFlags & SVF_BOT) ) {
CNSTI4 852
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $282
line 454
;454:			continue;
ADDRGP4 $276
JUMPV
LABELV $282
line 457
;455:		}
;456:		//[BugFix9]
;457:		if ( cl->sess.sessionTeam == TEAM_SPECTATOR 
ADDRLP4 0
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 3
NEI4 $286
ADDRLP4 0
INDIRP4
CNSTI4 1644
ADDP4
INDIRI4
CNSTI4 2
NEI4 $286
line 459
;458:			&& cl->sess.spectatorState == SPECTATOR_FOLLOW )
;459:		{//this entity is actually following another entity so the ps data is for a
line 461
;460:			//different entity.  Bots never spectate like this so, skip this player.
;461:			continue;
ADDRGP4 $276
JUMPV
LABELV $286
line 464
;462:		}
;463:		//[/BugFix9]
;464:		if ( team >= 0 && cl->sess.sessionTeam != team ) {
ADDRLP4 48
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
LTI4 $288
ADDRLP4 0
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $288
line 465
;465:			continue;
ADDRGP4 $276
JUMPV
LABELV $288
line 467
;466:		}
;467:		strcpy(netname, cl->pers.netname);
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 468
;468:		Q_CleanStr(netname);
ADDRLP4 8
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 469
;469:		trap_SendConsoleCommand( EXEC_INSERT, va("kick %s\n", netname) );
ADDRGP4 $290
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 470
;470:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $274
JUMPV
LABELV $276
line 448
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $278
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $275
line 472
;471:	}
;472:	return qfalse;
CNSTI4 0
RETI4
LABELV $274
endproc G_RemoveRandomBot 56 8
export G_CountHumanPlayers
proc G_CountHumanPlayers 16 0
line 480
;473:}
;474:
;475:/*
;476:===============
;477:G_CountHumanPlayers
;478:===============
;479:*/
;480:int G_CountHumanPlayers( int team ) {
line 484
;481:	int i, num;
;482:	gclient_t	*cl;
;483:
;484:	num = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 485
;485:	for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $295
JUMPV
LABELV $292
line 486
;486:		cl = level.clients + i;
ADDRLP4 4
CNSTI4 3024
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 487
;487:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $297
line 488
;488:			continue;
ADDRGP4 $293
JUMPV
LABELV $297
line 492
;489:		}
;490:		//[BugFix17]
;491:		//can't use cl->ps.clientNum since the ps.clientNum might be for the clientNum of the player that this client is specing.
;492:		if ( g_entities[i].r.svFlags & SVF_BOT ) {
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $299
line 495
;493:		//if ( g_entities[cl->ps.clientNum].r.svFlags & SVF_BOT ) {
;494:		//[/BugFix17]
;495:			continue;
ADDRGP4 $293
JUMPV
LABELV $299
line 497
;496:		}
;497:		if ( team >= 0 && cl->sess.sessionTeam != team ) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $303
ADDRLP4 4
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $303
line 498
;498:			continue;
ADDRGP4 $293
JUMPV
LABELV $303
line 500
;499:		}
;500:		num++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 501
;501:	}
LABELV $293
line 485
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $295
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $292
line 502
;502:	return num;
ADDRLP4 8
INDIRI4
RETI4
LABELV $291
endproc G_CountHumanPlayers 16 0
export G_CountBotPlayers
proc G_CountBotPlayers 20 0
line 510
;503:}
;504:
;505:/*
;506:===============
;507:G_CountBotPlayers
;508:===============
;509:*/
;510:int G_CountBotPlayers( int team ) {
line 514
;511:	int i, n, num;
;512:	gclient_t	*cl;
;513:
;514:	num = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 515
;515:	for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $309
JUMPV
LABELV $306
line 516
;516:		cl = level.clients + i;
ADDRLP4 8
CNSTI4 3024
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 517
;517:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 8
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $311
line 518
;518:			continue;
ADDRGP4 $307
JUMPV
LABELV $311
line 522
;519:		}
;520:		//[BugFix17]
;521:		//can't use cl->ps.clientNum since the ps.clientNum might be for the clientNum of the player that this client is specing.
;522:		if ( !(g_entities[i].r.svFlags & SVF_BOT) ) {
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $313
line 524
;523:		//if ( !(g_entities[cl->ps.clientNum].r.svFlags & SVF_BOT) ) {
;524:			continue;
ADDRGP4 $307
JUMPV
LABELV $313
line 527
;525:		}
;526:		//[/BugFix17]
;527:		if ( team >= 0 && cl->sess.sessionTeam != team ) {
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $317
ADDRLP4 8
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $317
line 528
;528:			continue;
ADDRGP4 $307
JUMPV
LABELV $317
line 530
;529:		}
;530:		num++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 531
;531:	}
LABELV $307
line 515
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $309
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $306
line 532
;532:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $319
line 533
;533:		if( !botSpawnQueue[n].spawnTime ) {
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $323
line 534
;534:			continue;
ADDRGP4 $320
JUMPV
LABELV $323
line 536
;535:		}
;536:		if ( botSpawnQueue[n].spawnTime > level.time ) {
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $326
line 537
;537:			continue;
ADDRGP4 $320
JUMPV
LABELV $326
line 539
;538:		}
;539:		num++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 540
;540:	}
LABELV $320
line 532
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $319
line 541
;541:	return num;
ADDRLP4 12
INDIRI4
RETI4
LABELV $305
endproc G_CountBotPlayers 20 0
bss
align 4
LABELV $331
skip 4
export G_CheckMinimumPlayers
code
proc G_CheckMinimumPlayers 36 4
line 549
;542:}
;543:
;544:/*
;545:===============
;546:G_CheckMinimumPlayers
;547:===============
;548:*/
;549:void G_CheckMinimumPlayers( void ) {
line 554
;550:	int minplayers;
;551:	int humanplayers, botplayers;
;552:	static int checkminimumplayers_time;
;553:
;554:	if (level.intermissiontime) return;
ADDRGP4 level+9008
INDIRI4
CNSTI4 0
EQI4 $332
ADDRGP4 $330
JUMPV
LABELV $332
line 556
;555:	//only check once each 10 seconds
;556:	if (checkminimumplayers_time > level.time - 10000) {
ADDRGP4 $331
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $335
line 557
;557:		return;
ADDRGP4 $330
JUMPV
LABELV $335
line 559
;558:	}
;559:	checkminimumplayers_time = level.time;
ADDRGP4 $331
ADDRGP4 level+32
INDIRI4
ASGNI4
line 560
;560:	trap_Cvar_Update(&bot_minplayers);
ADDRGP4 bot_minplayers
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 561
;561:	minplayers = bot_minplayers.integer;
ADDRLP4 0
ADDRGP4 bot_minplayers+12
INDIRI4
ASGNI4
line 562
;562:	if (minplayers <= 0) return;
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $340
ADDRGP4 $330
JUMPV
LABELV $340
line 564
;563:
;564:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $342
line 565
;565:		if (minplayers >= g_maxclients.integer / 2) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 2
DIVI4
LTI4 $345
line 566
;566:			minplayers = (g_maxclients.integer / 2) -1;
ADDRLP4 0
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 1
SUBI4
ASGNI4
line 567
;567:		}
LABELV $345
line 569
;568:
;569:		humanplayers = G_CountHumanPlayers( TEAM_RED );
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 570
;570:		botplayers = G_CountBotPlayers(	TEAM_RED );
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 572
;571:		//
;572:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $349
line 573
;573:			G_AddRandomBot( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 574
;574:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $350
JUMPV
LABELV $349
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $351
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $351
line 575
;575:			G_RemoveRandomBot( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 576
;576:		}
LABELV $351
LABELV $350
line 578
;577:		//
;578:		humanplayers = G_CountHumanPlayers( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRLP4 24
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 579
;579:		botplayers = G_CountBotPlayers( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRLP4 28
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
ASGNI4
line 581
;580:		//
;581:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $353
line 582
;582:			G_AddRandomBot( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 583
;583:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $343
JUMPV
LABELV $353
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $343
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $343
line 584
;584:			G_RemoveRandomBot( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 585
;585:		}
line 586
;586:	}
ADDRGP4 $343
JUMPV
LABELV $342
line 587
;587:	else if (g_gametype.integer == GT_TOURNAMENT ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $357
line 588
;588:		if (minplayers >= g_maxclients.integer) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $360
line 589
;589:			minplayers = g_maxclients.integer-1;
ADDRLP4 0
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 590
;590:		}
LABELV $360
line 591
;591:		humanplayers = G_CountHumanPlayers( -1 );
CNSTI4 -1
ARGI4
ADDRLP4 12
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 592
;592:		botplayers = G_CountBotPlayers( -1 );
CNSTI4 -1
ARGI4
ADDRLP4 16
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 594
;593:		//
;594:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $364
line 595
;595:			G_AddRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 596
;596:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $358
JUMPV
LABELV $364
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $358
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $358
line 598
;597:			// try to remove spectators first
;598:			if (!G_RemoveRandomBot( TEAM_SPECTATOR )) {
CNSTI4 3
ARGI4
ADDRLP4 24
ADDRGP4 G_RemoveRandomBot
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $358
line 600
;599:				// just remove the bot that is playing
;600:				G_RemoveRandomBot( -1 );
CNSTI4 -1
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 601
;601:			}
line 602
;602:		}
line 603
;603:	}
ADDRGP4 $358
JUMPV
LABELV $357
line 604
;604:	else if (g_gametype.integer == GT_FFA) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
NEI4 $370
line 605
;605:		if (minplayers >= g_maxclients.integer) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $373
line 606
;606:			minplayers = g_maxclients.integer-1;
ADDRLP4 0
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 607
;607:		}
LABELV $373
line 608
;608:		humanplayers = G_CountHumanPlayers( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 609
;609:		botplayers = G_CountBotPlayers( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 611
;610:		//
;611:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $377
line 612
;612:			G_AddRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 613
;613:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $371
JUMPV
LABELV $377
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $371
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $371
line 614
;614:			G_RemoveRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 615
;615:		}
line 616
;616:	}
ADDRGP4 $371
JUMPV
LABELV $370
line 617
;617:	else if (g_gametype.integer == GT_HOLOCRON || g_gametype.integer == GT_JEDIMASTER) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $385
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $381
LABELV $385
line 618
;618:		if (minplayers >= g_maxclients.integer) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $386
line 619
;619:			minplayers = g_maxclients.integer-1;
ADDRLP4 0
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 620
;620:		}
LABELV $386
line 621
;621:		humanplayers = G_CountHumanPlayers( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 622
;622:		botplayers = G_CountBotPlayers( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 624
;623:		//
;624:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $390
line 625
;625:			G_AddRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 626
;626:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $391
JUMPV
LABELV $390
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $392
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $392
line 627
;627:			G_RemoveRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 628
;628:		}
LABELV $392
LABELV $391
line 629
;629:	}
LABELV $381
LABELV $371
LABELV $358
LABELV $343
line 630
;630:}
LABELV $330
endproc G_CheckMinimumPlayers 36 4
export G_CheckBotSpawn
proc G_CheckBotSpawn 4 8
line 637
;631:
;632:/*
;633:===============
;634:G_CheckBotSpawn
;635:===============
;636:*/
;637:void G_CheckBotSpawn( void ) {
line 640
;638:	int		n;
;639:
;640:	G_CheckMinimumPlayers();
ADDRGP4 G_CheckMinimumPlayers
CALLV
pop
line 642
;641:
;642:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $395
line 643
;643:		if( !botSpawnQueue[n].spawnTime ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $399
line 644
;644:			continue;
ADDRGP4 $396
JUMPV
LABELV $399
line 646
;645:		}
;646:		if ( botSpawnQueue[n].spawnTime > level.time ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $402
line 647
;647:			continue;
ADDRGP4 $396
JUMPV
LABELV $402
line 649
;648:		}
;649:		ClientBegin( botSpawnQueue[n].clientNum, qfalse );
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 650
;650:		botSpawnQueue[n].spawnTime = 0;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
CNSTI4 0
ASGNI4
line 658
;651:
;652:		/*
;653:		if( g_gametype.integer == GT_SINGLE_PLAYER ) {
;654:			trap_GetUserinfo( botSpawnQueue[n].clientNum, userinfo, sizeof(userinfo) );
;655:			PlayerIntroSound( Info_ValueForKey (userinfo, "model") );
;656:		}
;657:		*/
;658:	}
LABELV $396
line 642
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $395
line 659
;659:}
LABELV $394
endproc G_CheckBotSpawn 4 8
proc AddBotToSpawnQueue 4 8
line 667
;660:
;661:
;662:/*
;663:===============
;664:AddBotToSpawnQueue
;665:===============
;666:*/
;667:static void AddBotToSpawnQueue( int clientNum, int delay ) {
line 670
;668:	int		n;
;669:
;670:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $408
line 671
;671:		if( !botSpawnQueue[n].spawnTime ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $412
line 672
;672:			botSpawnQueue[n].spawnTime = level.time + delay;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 673
;673:			botSpawnQueue[n].clientNum = clientNum;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 674
;674:			return;
ADDRGP4 $407
JUMPV
LABELV $412
line 676
;675:		}
;676:	}
LABELV $409
line 670
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $408
line 678
;677:
;678:	G_Printf( S_COLOR_YELLOW "Unable to delay spawn\n" );
ADDRGP4 $417
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 679
;679:	ClientBegin( clientNum, qfalse );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 680
;680:}
LABELV $407
endproc AddBotToSpawnQueue 4 8
export G_RemoveQueuedBotBegin
proc G_RemoveQueuedBotBegin 4 0
line 691
;681:
;682:
;683:/*
;684:===============
;685:G_RemoveQueuedBotBegin
;686:
;687:Called on client disconnect to make sure the delayed spawn
;688:doesn't happen on a freed index
;689:===============
;690:*/
;691:void G_RemoveQueuedBotBegin( int clientNum ) {
line 694
;692:	int		n;
;693:
;694:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $419
line 695
;695:		if( botSpawnQueue[n].clientNum == clientNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $423
line 696
;696:			botSpawnQueue[n].spawnTime = 0;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
CNSTI4 0
ASGNI4
line 697
;697:			return;
ADDRGP4 $418
JUMPV
LABELV $423
line 699
;698:		}
;699:	}
LABELV $420
line 694
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $419
line 700
;700:}
LABELV $418
endproc G_RemoveQueuedBotBegin 4 0
export G_BotConnect
proc G_BotConnect 1336 12
line 708
;701:
;702:
;703:/*
;704:===============
;705:G_BotConnect
;706:===============
;707:*/
;708:qboolean G_BotConnect( int clientNum, qboolean restart ) {
line 712
;709:	bot_settings_t	settings;
;710:	char			userinfo[MAX_INFO_STRING];
;711:
;712:	trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 714
;713:
;714:	Q_strncpyz( settings.personalityfile, Info_ValueForKey( userinfo, "personality" ), sizeof(settings.personalityfile) );
ADDRLP4 292
ARGP4
ADDRGP4 $427
ARGP4
ADDRLP4 1316
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1316
INDIRP4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 715
;715:	settings.skill = atof( Info_ValueForKey( userinfo, "skill" ) );
ADDRLP4 292
ARGP4
ADDRGP4 $429
ARGP4
ADDRLP4 1320
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1320
INDIRP4
ARGP4
ADDRLP4 1324
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0+144
ADDRLP4 1324
INDIRF4
ASGNF4
line 716
;716:	Q_strncpyz( settings.team, Info_ValueForKey( userinfo, "team" ), sizeof(settings.team) );
ADDRLP4 292
ARGP4
ADDRGP4 $431
ARGP4
ADDRLP4 1328
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0+148
ARGP4
ADDRLP4 1328
INDIRP4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 718
;717:
;718:	if (!BotAISetupClient( clientNum, &settings, restart )) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 1332
ADDRGP4 BotAISetupClient
CALLI4
ASGNI4
ADDRLP4 1332
INDIRI4
CNSTI4 0
NEI4 $433
line 719
;719:		trap_DropClient( clientNum, "BotAISetupClient failed" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $435
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 720
;720:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $426
JUMPV
LABELV $433
line 723
;721:	}
;722:
;723:	return qtrue;
CNSTI4 1
RETI4
LABELV $426
endproc G_BotConnect 1336 12
proc G_AddBot 1140 12
line 732
;724:}
;725:
;726:
;727:/*
;728:===============
;729:G_AddBot
;730:===============
;731:*/
;732:static void G_AddBot( const char *name, float skill, const char *team, int delay, char *altname) {
line 742
;733:	int				clientNum;
;734:	char			*botinfo;
;735:	gentity_t		*bot;
;736:	char			*key;
;737:	char			*s;
;738:	char			*botname;
;739:	char			*model;
;740://	char			*headmodel;
;741:	char			userinfo[MAX_INFO_STRING];
;742:	int				preTeam = 0;
ADDRLP4 1052
CNSTI4 0
ASGNI4
line 745
;743:
;744:	// get the botinfo from bots.txt
;745:	botinfo = G_GetBotInfoByName( name );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 G_GetBotInfoByName
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1056
INDIRP4
ASGNP4
line 746
;746:	if ( !botinfo ) {
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $437
line 747
;747:		G_Printf( S_COLOR_RED "Error: Bot '%s' not defined\n", name );
ADDRGP4 $439
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 748
;748:		return;
ADDRGP4 $436
JUMPV
LABELV $437
line 752
;749:	}
;750:
;751:	// create the bot's userinfo
;752:	userinfo[0] = '\0';
ADDRLP4 0
CNSTI1 0
ASGNI1
line 754
;753:
;754:	botname = Info_ValueForKey( botinfo, "funname" );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $440
ARGP4
ADDRLP4 1060
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1048
ADDRLP4 1060
INDIRP4
ASGNP4
line 755
;755:	if( !botname[0] ) {
ADDRLP4 1048
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $441
line 756
;756:		botname = Info_ValueForKey( botinfo, "name" );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $222
ARGP4
ADDRLP4 1064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1048
ADDRLP4 1064
INDIRP4
ASGNP4
line 757
;757:	}
LABELV $441
line 759
;758:	// check for an alternative name
;759:	if (altname && altname[0]) {
ADDRLP4 1064
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1064
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $443
ADDRLP4 1064
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $443
line 760
;760:		botname = altname;
ADDRLP4 1048
ADDRFP4 16
INDIRP4
ASGNP4
line 761
;761:	}
LABELV $443
line 762
;762:	Info_SetValueForKey( userinfo, "name", botname );
ADDRLP4 0
ARGP4
ADDRGP4 $222
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 763
;763:	Info_SetValueForKey( userinfo, "rate", "25000" );
ADDRLP4 0
ARGP4
ADDRGP4 $445
ARGP4
ADDRGP4 $446
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 764
;764:	Info_SetValueForKey( userinfo, "snaps", "20" );
ADDRLP4 0
ARGP4
ADDRGP4 $447
ARGP4
ADDRGP4 $448
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 765
;765:	Info_SetValueForKey( userinfo, "skill", va("%1.2f", skill) );
ADDRGP4 $449
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $429
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 767
;766:
;767:	if ( skill >= 1 && skill < 2 ) {
ADDRLP4 1072
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1072
INDIRF4
CNSTF4 1065353216
LTF4 $450
ADDRLP4 1072
INDIRF4
CNSTF4 1073741824
GEF4 $450
line 768
;768:		Info_SetValueForKey( userinfo, "handicap", "50" );
ADDRLP4 0
ARGP4
ADDRGP4 $452
ARGP4
ADDRGP4 $453
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 769
;769:	}
ADDRGP4 $451
JUMPV
LABELV $450
line 770
;770:	else if ( skill >= 2 && skill < 3 ) {
ADDRLP4 1076
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1076
INDIRF4
CNSTF4 1073741824
LTF4 $454
ADDRLP4 1076
INDIRF4
CNSTF4 1077936128
GEF4 $454
line 771
;771:		Info_SetValueForKey( userinfo, "handicap", "70" );
ADDRLP4 0
ARGP4
ADDRGP4 $452
ARGP4
ADDRGP4 $456
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 772
;772:	}
ADDRGP4 $455
JUMPV
LABELV $454
line 773
;773:	else if ( skill >= 3 && skill < 4 ) {
ADDRLP4 1080
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1080
INDIRF4
CNSTF4 1077936128
LTF4 $457
ADDRLP4 1080
INDIRF4
CNSTF4 1082130432
GEF4 $457
line 774
;774:		Info_SetValueForKey( userinfo, "handicap", "90" );
ADDRLP4 0
ARGP4
ADDRGP4 $452
ARGP4
ADDRGP4 $459
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 775
;775:	}
LABELV $457
LABELV $455
LABELV $451
line 777
;776:
;777:	key = "model";
ADDRLP4 1024
ADDRGP4 $460
ASGNP4
line 778
;778:	model = Info_ValueForKey( botinfo, key );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1084
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1084
INDIRP4
ASGNP4
line 779
;779:	if ( !*model ) {
ADDRLP4 1044
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $461
line 780
;780:		model = "visor/default";
ADDRLP4 1044
ADDRGP4 $463
ASGNP4
line 781
;781:	}
LABELV $461
line 782
;782:	Info_SetValueForKey( userinfo, key, model );
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 783
;783:	key = "team_model";
ADDRLP4 1024
ADDRGP4 $464
ASGNP4
line 784
;784:	Info_SetValueForKey( userinfo, key, model );
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 795
;785:
;786:/*	key = "headmodel";
;787:	headmodel = Info_ValueForKey( botinfo, key );
;788:	if ( !*headmodel ) {
;789:		headmodel = model;
;790:	}
;791:	Info_SetValueForKey( userinfo, key, headmodel );
;792:	key = "team_headmodel";
;793:	Info_SetValueForKey( userinfo, key, headmodel );
;794:*/
;795:	key = "gender";
ADDRLP4 1024
ADDRGP4 $465
ASGNP4
line 796
;796:	s = Info_ValueForKey( botinfo, key );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1088
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1088
INDIRP4
ASGNP4
line 797
;797:	if ( !*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $466
line 798
;798:		s = "male";
ADDRLP4 1028
ADDRGP4 $468
ASGNP4
line 799
;799:	}
LABELV $466
line 800
;800:	Info_SetValueForKey( userinfo, "sex", s );
ADDRLP4 0
ARGP4
ADDRGP4 $469
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 802
;801:
;802:	key = "color1";
ADDRLP4 1024
ADDRGP4 $470
ASGNP4
line 803
;803:	s = Info_ValueForKey( botinfo, key );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1092
INDIRP4
ASGNP4
line 804
;804:	if ( !*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $471
line 805
;805:		s = "4";
ADDRLP4 1028
ADDRGP4 $473
ASGNP4
line 806
;806:	}
LABELV $471
line 807
;807:	Info_SetValueForKey( userinfo, key, s );
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 809
;808:
;809:	key = "color2";
ADDRLP4 1024
ADDRGP4 $474
ASGNP4
line 810
;810:	s = Info_ValueForKey( botinfo, key );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1096
INDIRP4
ASGNP4
line 811
;811:	if ( !*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $475
line 812
;812:		s = "5";
ADDRLP4 1028
ADDRGP4 $477
ASGNP4
line 813
;813:	}
LABELV $475
line 814
;814:	Info_SetValueForKey( userinfo, key, s );
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 816
;815:
;816:	s = Info_ValueForKey(botinfo, "personality");
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $427
ARGP4
ADDRLP4 1100
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1100
INDIRP4
ASGNP4
line 817
;817:	if (!*s )
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $478
line 818
;818:	{
line 819
;819:		Info_SetValueForKey( userinfo, "personality", "botfiles/default.jkb" );
ADDRLP4 0
ARGP4
ADDRGP4 $427
ARGP4
ADDRGP4 $480
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 820
;820:	}
ADDRGP4 $479
JUMPV
LABELV $478
line 822
;821:	else
;822:	{
line 823
;823:		Info_SetValueForKey( userinfo, "personality", s );
ADDRLP4 0
ARGP4
ADDRGP4 $427
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 824
;824:	}
LABELV $479
line 827
;825:
;826:	// have the server allocate a client slot
;827:	clientNum = trap_BotAllocateClient();
ADDRLP4 1104
ADDRGP4 trap_BotAllocateClient
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1104
INDIRI4
ASGNI4
line 828
;828:	if ( clientNum == -1 ) {
ADDRLP4 1036
INDIRI4
CNSTI4 -1
NEI4 $481
line 831
;829://		G_Printf( S_COLOR_RED "Unable to add bot.  All player slots are in use.\n" );
;830://		G_Printf( S_COLOR_RED "Start server with more 'open' slots.\n" );
;831:		trap_SendServerCommand( -1, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "UNABLE_TO_ADD_BOT")));
ADDRGP4 $484
ARGP4
ADDRGP4 $485
ARGP4
ADDRLP4 1108
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $483
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRLP4 1112
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 832
;832:		return;
ADDRGP4 $436
JUMPV
LABELV $481
line 836
;833:	}
;834:
;835:	// initialize the bot settings
;836:	if( !team || !*team ) {
ADDRLP4 1108
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $488
ADDRLP4 1108
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $486
LABELV $488
line 837
;837:		if( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $489
line 838
;838:			if( PickTeam(clientNum) == TEAM_RED) {
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1112
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 1
NEI4 $492
line 839
;839:				team = "red";
ADDRFP4 8
ADDRGP4 $268
ASGNP4
line 840
;840:			}
ADDRGP4 $490
JUMPV
LABELV $492
line 841
;841:			else {
line 842
;842:				team = "blue";
ADDRFP4 8
ADDRGP4 $271
ASGNP4
line 843
;843:			}
line 844
;844:		}
ADDRGP4 $490
JUMPV
LABELV $489
line 845
;845:		else {
line 846
;846:			team = "red";
ADDRFP4 8
ADDRGP4 $268
ASGNP4
line 847
;847:		}
LABELV $490
line 848
;848:	}
LABELV $486
line 850
;849://	Info_SetValueForKey( userinfo, "characterfile", Info_ValueForKey( botinfo, "aifile" ) );
;850:	Info_SetValueForKey( userinfo, "skill", va( "%5.2f", skill ) );
ADDRGP4 $494
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 1112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $429
ARGP4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 851
;851:	Info_SetValueForKey( userinfo, "team", team );
ADDRLP4 0
ARGP4
ADDRGP4 $431
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 853
;852:
;853:	bot = &g_entities[ clientNum ];
ADDRLP4 1040
CNSTI4 852
ADDRLP4 1036
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 854
;854:	bot->r.svFlags |= SVF_BOT;
ADDRLP4 1116
ADDRLP4 1040
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1116
INDIRP4
ADDRLP4 1116
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 855
;855:	bot->inuse = qtrue;
ADDRLP4 1040
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 1
ASGNI4
line 858
;856:
;857:	// register the userinfo
;858:	trap_SetUserinfo( clientNum, userinfo );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 860
;859:
;860:	if (g_gametype.integer >= GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $495
line 861
;861:	{
line 862
;862:		if (team && Q_stricmp(team, "red") == 0)
ADDRLP4 1120
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1120
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $498
ADDRLP4 1120
INDIRP4
ARGP4
ADDRGP4 $268
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $498
line 863
;863:		{
line 864
;864:			bot->client->sess.sessionTeam = TEAM_RED;
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1636
ADDP4
CNSTI4 1
ASGNI4
line 865
;865:		}
ADDRGP4 $499
JUMPV
LABELV $498
line 866
;866:		else if (team && Q_stricmp(team, "blue") == 0)
ADDRLP4 1128
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $500
ADDRLP4 1128
INDIRP4
ARGP4
ADDRGP4 $271
ARGP4
ADDRLP4 1132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $500
line 867
;867:		{
line 868
;868:			bot->client->sess.sessionTeam = TEAM_BLUE;
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1636
ADDP4
CNSTI4 2
ASGNI4
line 869
;869:		}
ADDRGP4 $501
JUMPV
LABELV $500
line 871
;870:		else
;871:		{
line 872
;872:			bot->client->sess.sessionTeam = PickTeam( -1 );
CNSTI4 -1
ARGI4
ADDRLP4 1136
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1636
ADDP4
ADDRLP4 1136
INDIRI4
ASGNI4
line 873
;873:		}
LABELV $501
LABELV $499
line 874
;874:	}
LABELV $495
line 876
;875:
;876:	preTeam = bot->client->sess.sessionTeam;
ADDRLP4 1052
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
ASGNI4
line 879
;877:
;878:	// have it connect to the game as a normal client
;879:	if ( ClientConnect( clientNum, qtrue, qtrue ) ) {
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1120
CNSTI4 1
ASGNI4
ADDRLP4 1120
INDIRI4
ARGI4
ADDRLP4 1120
INDIRI4
ARGI4
ADDRLP4 1124
ADDRGP4 ClientConnect
CALLP4
ASGNP4
ADDRLP4 1124
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $502
line 880
;880:		return;
ADDRGP4 $436
JUMPV
LABELV $502
line 883
;881:	}
;882:
;883:	if (bot->client->sess.sessionTeam != preTeam)
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
ADDRLP4 1052
INDIRI4
EQI4 $504
line 884
;884:	{
line 885
;885:		trap_GetUserinfo(clientNum, userinfo, MAX_INFO_STRING);
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 887
;886:
;887:		if (bot->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 3
NEI4 $506
line 888
;888:		{
line 889
;889:			bot->client->sess.sessionTeam = preTeam;
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1636
ADDP4
ADDRLP4 1052
INDIRI4
ASGNI4
line 890
;890:		}
LABELV $506
line 892
;891:
;892:		if (bot->client->sess.sessionTeam == TEAM_RED)
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 1
NEI4 $508
line 893
;893:		{
line 894
;894:			team = "Red";
ADDRFP4 8
ADDRGP4 $510
ASGNP4
line 895
;895:		}
ADDRGP4 $509
JUMPV
LABELV $508
line 897
;896:		else
;897:		{
line 898
;898:			team = "Blue";
ADDRFP4 8
ADDRGP4 $511
ASGNP4
line 899
;899:		}
LABELV $509
line 901
;900:
;901:		Info_SetValueForKey( userinfo, "team", team );
ADDRLP4 0
ARGP4
ADDRGP4 $431
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 903
;902:
;903:		trap_SetUserinfo( clientNum, userinfo );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 905
;904:
;905:		bot->client->ps.persistant[ PERS_TEAM ] = bot->client->sess.sessionTeam;
ADDRLP4 1128
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 292
ADDP4
ADDRLP4 1128
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
ASGNI4
line 907
;906:
;907:		G_ReadSessionData( bot->client );
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_ReadSessionData
CALLV
pop
line 908
;908:		ClientUserinfoChanged( clientNum );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 909
;909:	}
LABELV $504
line 911
;910:
;911:	if( delay == 0 ) {
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $512
line 912
;912:		ClientBegin( clientNum, qfalse );
ADDRLP4 1036
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 913
;913:		return;
ADDRGP4 $436
JUMPV
LABELV $512
line 916
;914:	}
;915:
;916:	AddBotToSpawnQueue( clientNum, delay );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 AddBotToSpawnQueue
CALLV
pop
line 917
;917:}
LABELV $436
endproc G_AddBot 1140 12
export Svcmd_AddBot_f
proc Svcmd_AddBot_f 4112 20
line 925
;918:
;919:
;920:/*
;921:===============
;922:Svcmd_AddBot_f
;923:===============
;924:*/
;925:void Svcmd_AddBot_f( void ) {
line 934
;926:	float			skill;
;927:	int				delay;
;928:	char			name[MAX_TOKEN_CHARS];
;929:	char			altname[MAX_TOKEN_CHARS];
;930:	char			string[MAX_TOKEN_CHARS];
;931:	char			team[MAX_TOKEN_CHARS];
;932:
;933:	// are bots enabled?
;934:	if ( !trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
ADDRGP4 $517
ARGP4
ADDRLP4 4104
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 4104
INDIRI4
CNSTI4 0
NEI4 $515
line 935
;935:		return;
ADDRGP4 $514
JUMPV
LABELV $515
line 939
;936:	}
;937:
;938:	// name
;939:	trap_Argv( 1, name, sizeof( name ) );
CNSTI4 1
ARGI4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 940
;940:	if ( !name[0] ) {
ADDRLP4 1024
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $518
line 941
;941:		trap_Printf( "Usage: Addbot <botname> [skill 1-5] [team] [msec delay] [altname]\n" );
ADDRGP4 $520
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 942
;942:		return;
ADDRGP4 $514
JUMPV
LABELV $518
line 946
;943:	}
;944:
;945:	// skill
;946:	trap_Argv( 2, string, sizeof( string ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 947
;947:	if ( !string[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $521
line 948
;948:		skill = 4;
ADDRLP4 4096
CNSTF4 1082130432
ASGNF4
line 949
;949:	}
ADDRGP4 $522
JUMPV
LABELV $521
line 950
;950:	else {
line 951
;951:		skill = atof( string );
ADDRLP4 0
ARGP4
ADDRLP4 4108
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 4096
ADDRLP4 4108
INDIRF4
ASGNF4
line 952
;952:	}
LABELV $522
line 955
;953:
;954:	// team
;955:	trap_Argv( 3, team, sizeof( team ) );
CNSTI4 3
ARGI4
ADDRLP4 3072
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 958
;956:
;957:	// delay
;958:	trap_Argv( 4, string, sizeof( string ) );
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 959
;959:	if ( !string[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $523
line 960
;960:		delay = 0;
ADDRLP4 4100
CNSTI4 0
ASGNI4
line 961
;961:	}
ADDRGP4 $524
JUMPV
LABELV $523
line 962
;962:	else {
line 963
;963:		delay = atoi( string );
ADDRLP4 0
ARGP4
ADDRLP4 4108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4100
ADDRLP4 4108
INDIRI4
ASGNI4
line 964
;964:	}
LABELV $524
line 967
;965:
;966:	// alternative name
;967:	trap_Argv( 5, altname, sizeof( altname ) );
CNSTI4 5
ARGI4
ADDRLP4 2048
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 969
;968:
;969:	G_AddBot( name, skill, team, delay, altname );
ADDRLP4 1024
ARGP4
ADDRLP4 4096
INDIRF4
ARGF4
ADDRLP4 3072
ARGP4
ADDRLP4 4100
INDIRI4
ARGI4
ADDRLP4 2048
ARGP4
ADDRGP4 G_AddBot
CALLV
pop
line 973
;970:
;971:	// if this was issued during gameplay and we are playing locally,
;972:	// go ahead and load the bot's media immediately
;973:	if ( level.time - level.startTime > 1000 &&
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $525
ADDRGP4 $529
ARGP4
ADDRLP4 4108
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 4108
INDIRI4
CNSTI4 0
EQI4 $525
line 974
;974:		trap_Cvar_VariableIntegerValue( "cl_running" ) ) {
line 975
;975:		trap_SendServerCommand( -1, "loaddefered\n" );	// FIXME: spelled wrong, but not changing for demo
CNSTI4 -1
ARGI4
ADDRGP4 $530
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 976
;976:	}
LABELV $525
line 977
;977:}
LABELV $514
endproc Svcmd_AddBot_f 4112 20
export Svcmd_BotList_f
proc Svcmd_BotList_f 4120 20
line 984
;978:
;979:/*
;980:===============
;981:Svcmd_BotList_f
;982:===============
;983:*/
;984:void Svcmd_BotList_f( void ) {
line 991
;985:	int i;
;986:	char name[MAX_TOKEN_CHARS];
;987:	char funname[MAX_TOKEN_CHARS];
;988:	char model[MAX_TOKEN_CHARS];
;989:	char personality[MAX_TOKEN_CHARS];
;990:
;991:	trap_Printf("^1name             model            personality              funname\n");
ADDRGP4 $532
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 992
;992:	for (i = 0; i < g_numBots; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $536
JUMPV
LABELV $533
line 993
;993:		strcpy(name, Info_ValueForKey( g_botInfos[i], "name" ));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $222
ARGP4
ADDRLP4 4100
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 4100
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 994
;994:		if ( !*name ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $537
line 995
;995:			strcpy(name, "Padawan");
ADDRLP4 4
ARGP4
ADDRGP4 $539
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 996
;996:		}
LABELV $537
line 997
;997:		strcpy(funname, Info_ValueForKey( g_botInfos[i], "funname" ));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $440
ARGP4
ADDRLP4 4104
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ARGP4
ADDRLP4 4104
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 998
;998:		if ( !*funname ) {
ADDRLP4 1028
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $540
line 999
;999:			strcpy(funname, "");
ADDRLP4 1028
ARGP4
ADDRGP4 $165
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1000
;1000:		}
LABELV $540
line 1001
;1001:		strcpy(model, Info_ValueForKey( g_botInfos[i], "model" ));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $460
ARGP4
ADDRLP4 4108
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2052
ARGP4
ADDRLP4 4108
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1002
;1002:		if ( !*model ) {
ADDRLP4 2052
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $542
line 1003
;1003:			strcpy(model, "visor/default");
ADDRLP4 2052
ARGP4
ADDRGP4 $463
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1004
;1004:		}
LABELV $542
line 1005
;1005:		strcpy(personality, Info_ValueForKey( g_botInfos[i], "personality"));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $427
ARGP4
ADDRLP4 4112
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3076
ARGP4
ADDRLP4 4112
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1006
;1006:		if (!*personality ) {
ADDRLP4 3076
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $544
line 1007
;1007:			strcpy(personality, "botfiles/default.jkb");
ADDRLP4 3076
ARGP4
ADDRGP4 $480
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1008
;1008:		}
LABELV $544
line 1009
;1009:		trap_Printf(va("%-16s %-16s %-20s %-20s\n", name, model, personality, funname));
ADDRGP4 $546
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2052
ARGP4
ADDRLP4 3076
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 4116
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4116
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 1010
;1010:	}
LABELV $534
line 992
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $536
ADDRLP4 0
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $533
line 1011
;1011:}
LABELV $531
endproc Svcmd_BotList_f 4120 20
proc G_LoadBotsFromFile 8216 16
line 1078
;1012:
;1013:#if 0
;1014:/*
;1015:===============
;1016:G_SpawnBots
;1017:===============
;1018:*/
;1019:static void G_SpawnBots( char *botList, int baseDelay ) {
;1020:	char		*bot;
;1021:	char		*p;
;1022:	float		skill;
;1023:	int			delay;
;1024:	char		bots[MAX_INFO_VALUE];
;1025:
;1026:	podium1 = NULL;
;1027:	podium2 = NULL;
;1028:	podium3 = NULL;
;1029:
;1030:	skill = trap_Cvar_VariableValue( "g_spSkill" );
;1031:	if( skill < 1 ) {
;1032:		trap_Cvar_Set( "g_spSkill", "1" );
;1033:		skill = 1;
;1034:	}
;1035:	else if ( skill > 5 ) {
;1036:		trap_Cvar_Set( "g_spSkill", "5" );
;1037:		skill = 5;
;1038:	}
;1039:
;1040:	Q_strncpyz( bots, botList, sizeof(bots) );
;1041:	p = &bots[0];
;1042:	delay = baseDelay;
;1043:	while( *p ) {
;1044:		//skip spaces
;1045:		while( *p && *p == ' ' ) {
;1046:			p++;
;1047:		}
;1048:		if( !p ) {
;1049:			break;
;1050:		}
;1051:
;1052:		// mark start of bot name
;1053:		bot = p;
;1054:
;1055:		// skip until space of null
;1056:		while( *p && *p != ' ' ) {
;1057:			p++;
;1058:		}
;1059:		if( *p ) {
;1060:			*p++ = 0;
;1061:		}
;1062:
;1063:		// we must add the bot this way, calling G_AddBot directly at this stage
;1064:		// does "Bad Things"
;1065:		trap_SendConsoleCommand( EXEC_INSERT, va("addbot %s %f free %i\n", bot, skill, delay) );
;1066:
;1067:		delay += BOT_BEGIN_DELAY_INCREMENT;
;1068:	}
;1069:}
;1070:#endif
;1071:
;1072:
;1073:/*
;1074:===============
;1075:G_LoadBotsFromFile
;1076:===============
;1077:*/
;1078:static void G_LoadBotsFromFile( char *filename ) {
line 1083
;1079:	int				len;
;1080:	fileHandle_t	f;
;1081:	char			buf[MAX_BOTS_TEXT];
;1082:
;1083:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8200
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8200
INDIRI4
ASGNI4
line 1084
;1084:	if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $548
line 1085
;1085:		trap_Printf( va( S_COLOR_RED "file not found: %s\n", filename ) );
ADDRGP4 $112
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 1086
;1086:		return;
ADDRGP4 $547
JUMPV
LABELV $548
line 1088
;1087:	}
;1088:	if ( len >= MAX_BOTS_TEXT ) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $550
line 1089
;1089:		trap_Printf( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, MAX_BOTS_TEXT ) );
ADDRGP4 $115
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 8192
ARGI4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 1090
;1090:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1091
;1091:		return;
ADDRGP4 $547
JUMPV
LABELV $550
line 1094
;1092:	}
;1093:
;1094:	trap_FS_Read( buf, len, f );
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 1095
;1095:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 1096
;1096:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1098
;1097:
;1098:	g_numBots += G_ParseInfos( buf, MAX_BOTS - g_numBots, &g_botInfos[g_numBots] );
ADDRLP4 8
ARGP4
ADDRLP4 8204
ADDRGP4 g_numBots
ASGNP4
ADDRLP4 8208
ADDRLP4 8204
INDIRP4
INDIRI4
ASGNI4
CNSTI4 1024
ADDRLP4 8208
INDIRI4
SUBI4
ARGI4
ADDRLP4 8208
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
ARGP4
ADDRLP4 8212
ADDRGP4 G_ParseInfos
CALLI4
ASGNI4
ADDRLP4 8204
INDIRP4
ADDRLP4 8208
INDIRI4
ADDRLP4 8212
INDIRI4
ADDI4
ASGNI4
line 1099
;1099:}
LABELV $547
endproc G_LoadBotsFromFile 8216 16
proc G_LoadBots 1456 16
line 1106
;1100:
;1101:/*
;1102:===============
;1103:G_LoadBots
;1104:===============
;1105:*/
;1106:static void G_LoadBots( void ) {
line 1115
;1107:	vmCvar_t	botsFile;
;1108:	int			numdirs;
;1109:	char		filename[128];
;1110:	char		dirlist[1024];
;1111:	char*		dirptr;
;1112:	int			i;
;1113:	int			dirlen;
;1114:
;1115:	if ( !trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
ADDRGP4 $517
ARGP4
ADDRLP4 1440
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 1440
INDIRI4
CNSTI4 0
NEI4 $553
line 1116
;1116:		return;
ADDRGP4 $552
JUMPV
LABELV $553
line 1119
;1117:	}
;1118:
;1119:	g_numBots = 0;
ADDRGP4 g_numBots
CNSTI4 0
ASGNI4
line 1121
;1120:
;1121:	trap_Cvar_Register( &botsFile, "g_botsFile", "", CVAR_INIT|CVAR_ROM );
ADDRLP4 144
ARGP4
ADDRGP4 $555
ARGP4
ADDRGP4 $165
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1122
;1122:	if( *botsFile.string ) {
ADDRLP4 144+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $556
line 1123
;1123:		G_LoadBotsFromFile(botsFile.string);
ADDRLP4 144+16
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 1124
;1124:	}
ADDRGP4 $557
JUMPV
LABELV $556
line 1125
;1125:	else {
line 1127
;1126:		//G_LoadBotsFromFile("scripts/bots.txt");
;1127:		G_LoadBotsFromFile("botfiles/bots.txt");
ADDRGP4 $560
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 1128
;1128:	}
LABELV $557
line 1131
;1129:
;1130:	// get all bots from .bot files
;1131:	numdirs = trap_FS_GetFileList("scripts", ".bot", dirlist, 1024 );
ADDRGP4 $195
ARGP4
ADDRGP4 $561
ARGP4
ADDRLP4 416
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1444
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 1444
INDIRI4
ASGNI4
line 1132
;1132:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 416
ASGNP4
line 1133
;1133:	for (i = 0; i < numdirs; i++, dirptr += dirlen+1) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $565
JUMPV
LABELV $562
line 1134
;1134:		dirlen = strlen(dirptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1448
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 136
ADDRLP4 1448
INDIRI4
ASGNI4
line 1135
;1135:		strcpy(filename, "scripts/");
ADDRLP4 4
ARGP4
ADDRGP4 $201
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1136
;1136:		strcat(filename, dirptr);
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1137
;1137:		G_LoadBotsFromFile(filename);
ADDRLP4 4
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 1138
;1138:	}
LABELV $563
line 1133
ADDRLP4 1448
CNSTI4 1
ASGNI4
ADDRLP4 132
ADDRLP4 132
INDIRI4
ADDRLP4 1448
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 136
INDIRI4
ADDRLP4 1448
INDIRI4
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
LABELV $565
ADDRLP4 132
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $562
line 1139
;1139:	trap_Printf( va( "%i bots parsed\n", g_numBots ) );
ADDRGP4 $566
ARGP4
ADDRGP4 g_numBots
INDIRI4
ARGI4
ADDRLP4 1452
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1452
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 1140
;1140:}
LABELV $552
endproc G_LoadBots 1456 16
export G_GetBotInfoByNumber
proc G_GetBotInfoByNumber 8 8
line 1149
;1141:
;1142:
;1143:
;1144:/*
;1145:===============
;1146:G_GetBotInfoByNumber
;1147:===============
;1148:*/
;1149:char *G_GetBotInfoByNumber( int num ) {
line 1150
;1150:	if( num < 0 || num >= g_numBots ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $570
ADDRLP4 0
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $568
LABELV $570
line 1151
;1151:		trap_Printf( va( S_COLOR_RED "Invalid bot number: %i\n", num ) );
ADDRGP4 $571
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 1152
;1152:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $567
JUMPV
LABELV $568
line 1154
;1153:	}
;1154:	return g_botInfos[num];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
RETP4
LABELV $567
endproc G_GetBotInfoByNumber 8 8
export G_GetBotInfoByName
proc G_GetBotInfoByName 16 8
line 1163
;1155:}
;1156:
;1157:
;1158:/*
;1159:===============
;1160:G_GetBotInfoByName
;1161:===============
;1162:*/
;1163:char *G_GetBotInfoByName( const char *name ) {
line 1167
;1164:	int		n;
;1165:	char	*value;
;1166:
;1167:	for ( n = 0; n < g_numBots ; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $576
JUMPV
LABELV $573
line 1168
;1168:		value = Info_ValueForKey( g_botInfos[n], "name" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $222
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 1169
;1169:		if ( !Q_stricmp( value, name ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $577
line 1170
;1170:			return g_botInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $572
JUMPV
LABELV $577
line 1172
;1171:		}
;1172:	}
LABELV $574
line 1167
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $576
ADDRLP4 0
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $573
line 1174
;1173:
;1174:	return NULL;
CNSTP4 0
RETP4
LABELV $572
endproc G_GetBotInfoByName 16 8
export G_InitBots
proc G_InitBots 0 16
line 1186
;1175:}
;1176:
;1177://rww - pd
;1178:void LoadPath_ThisLevel(void);
;1179://end rww
;1180:
;1181:/*
;1182:===============
;1183:G_InitBots
;1184:===============
;1185:*/
;1186:void G_InitBots( qboolean restart ) {
line 1187
;1187:	G_LoadBots();
ADDRGP4 G_LoadBots
CALLV
pop
line 1188
;1188:	G_LoadArenas();
ADDRGP4 G_LoadArenas
CALLV
pop
line 1190
;1189:
;1190:	trap_Cvar_Register( &bot_minplayers, "bot_minplayers", "0", CVAR_SERVERINFO );
ADDRGP4 bot_minplayers
ARGP4
ADDRGP4 $580
ARGP4
ADDRGP4 $581
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1193
;1191:
;1192:	//rww - new bot route stuff
;1193:	LoadPath_ThisLevel();
ADDRGP4 LoadPath_ThisLevel
CALLV
pop
line 1195
;1194:	//end rww
;1195:}
LABELV $579
endproc G_InitBots 0 16
import LoadPath_ThisLevel
import podium3
import podium2
import podium1
bss
export bot_minplayers
align 4
LABELV bot_minplayers
skip 272
align 4
LABELV botSpawnQueue
skip 128
align 4
LABELV g_arenaInfos
skip 4096
export g_numArenas
align 4
LABELV g_numArenas
skip 4
align 4
LABELV g_botInfos
skip 4096
align 4
LABELV g_numBots
skip 4
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
import BotInterbreedEndMatch
import UpdateTournamentInfo
import G_WriteSessionData
import G_InitWorldSession
import G_InitSessionData
import G_ReadSessionData
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
LABELV $581
char 1 48
char 1 0
align 1
LABELV $580
char 1 98
char 1 111
char 1 116
char 1 95
char 1 109
char 1 105
char 1 110
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 115
char 1 0
align 1
LABELV $571
char 1 94
char 1 49
char 1 73
char 1 110
char 1 118
char 1 97
char 1 108
char 1 105
char 1 100
char 1 32
char 1 98
char 1 111
char 1 116
char 1 32
char 1 110
char 1 117
char 1 109
char 1 98
char 1 101
char 1 114
char 1 58
char 1 32
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $566
char 1 37
char 1 105
char 1 32
char 1 98
char 1 111
char 1 116
char 1 115
char 1 32
char 1 112
char 1 97
char 1 114
char 1 115
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $561
char 1 46
char 1 98
char 1 111
char 1 116
char 1 0
align 1
LABELV $560
char 1 98
char 1 111
char 1 116
char 1 102
char 1 105
char 1 108
char 1 101
char 1 115
char 1 47
char 1 98
char 1 111
char 1 116
char 1 115
char 1 46
char 1 116
char 1 120
char 1 116
char 1 0
align 1
LABELV $555
char 1 103
char 1 95
char 1 98
char 1 111
char 1 116
char 1 115
char 1 70
char 1 105
char 1 108
char 1 101
char 1 0
align 1
LABELV $546
char 1 37
char 1 45
char 1 49
char 1 54
char 1 115
char 1 32
char 1 37
char 1 45
char 1 49
char 1 54
char 1 115
char 1 32
char 1 37
char 1 45
char 1 50
char 1 48
char 1 115
char 1 32
char 1 37
char 1 45
char 1 50
char 1 48
char 1 115
char 1 10
char 1 0
align 1
LABELV $539
char 1 80
char 1 97
char 1 100
char 1 97
char 1 119
char 1 97
char 1 110
char 1 0
align 1
LABELV $532
char 1 94
char 1 49
char 1 110
char 1 97
char 1 109
char 1 101
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 112
char 1 101
char 1 114
char 1 115
char 1 111
char 1 110
char 1 97
char 1 108
char 1 105
char 1 116
char 1 121
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 102
char 1 117
char 1 110
char 1 110
char 1 97
char 1 109
char 1 101
char 1 10
char 1 0
align 1
LABELV $530
char 1 108
char 1 111
char 1 97
char 1 100
char 1 100
char 1 101
char 1 102
char 1 101
char 1 114
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $529
char 1 99
char 1 108
char 1 95
char 1 114
char 1 117
char 1 110
char 1 110
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $520
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 65
char 1 100
char 1 100
char 1 98
char 1 111
char 1 116
char 1 32
char 1 60
char 1 98
char 1 111
char 1 116
char 1 110
char 1 97
char 1 109
char 1 101
char 1 62
char 1 32
char 1 91
char 1 115
char 1 107
char 1 105
char 1 108
char 1 108
char 1 32
char 1 49
char 1 45
char 1 53
char 1 93
char 1 32
char 1 91
char 1 116
char 1 101
char 1 97
char 1 109
char 1 93
char 1 32
char 1 91
char 1 109
char 1 115
char 1 101
char 1 99
char 1 32
char 1 100
char 1 101
char 1 108
char 1 97
char 1 121
char 1 93
char 1 32
char 1 91
char 1 97
char 1 108
char 1 116
char 1 110
char 1 97
char 1 109
char 1 101
char 1 93
char 1 10
char 1 0
align 1
LABELV $517
char 1 98
char 1 111
char 1 116
char 1 95
char 1 101
char 1 110
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $511
char 1 66
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $510
char 1 82
char 1 101
char 1 100
char 1 0
align 1
LABELV $494
char 1 37
char 1 53
char 1 46
char 1 50
char 1 102
char 1 0
align 1
LABELV $485
char 1 85
char 1 78
char 1 65
char 1 66
char 1 76
char 1 69
char 1 95
char 1 84
char 1 79
char 1 95
char 1 65
char 1 68
char 1 68
char 1 95
char 1 66
char 1 79
char 1 84
char 1 0
align 1
LABELV $484
char 1 83
char 1 86
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 0
align 1
LABELV $483
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $480
char 1 98
char 1 111
char 1 116
char 1 102
char 1 105
char 1 108
char 1 101
char 1 115
char 1 47
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 46
char 1 106
char 1 107
char 1 98
char 1 0
align 1
LABELV $477
char 1 53
char 1 0
align 1
LABELV $474
char 1 99
char 1 111
char 1 108
char 1 111
char 1 114
char 1 50
char 1 0
align 1
LABELV $473
char 1 52
char 1 0
align 1
LABELV $470
char 1 99
char 1 111
char 1 108
char 1 111
char 1 114
char 1 49
char 1 0
align 1
LABELV $469
char 1 115
char 1 101
char 1 120
char 1 0
align 1
LABELV $468
char 1 109
char 1 97
char 1 108
char 1 101
char 1 0
align 1
LABELV $465
char 1 103
char 1 101
char 1 110
char 1 100
char 1 101
char 1 114
char 1 0
align 1
LABELV $464
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $463
char 1 118
char 1 105
char 1 115
char 1 111
char 1 114
char 1 47
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 0
align 1
LABELV $460
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $459
char 1 57
char 1 48
char 1 0
align 1
LABELV $456
char 1 55
char 1 48
char 1 0
align 1
LABELV $453
char 1 53
char 1 48
char 1 0
align 1
LABELV $452
char 1 104
char 1 97
char 1 110
char 1 100
char 1 105
char 1 99
char 1 97
char 1 112
char 1 0
align 1
LABELV $449
char 1 37
char 1 49
char 1 46
char 1 50
char 1 102
char 1 0
align 1
LABELV $448
char 1 50
char 1 48
char 1 0
align 1
LABELV $447
char 1 115
char 1 110
char 1 97
char 1 112
char 1 115
char 1 0
align 1
LABELV $446
char 1 50
char 1 53
char 1 48
char 1 48
char 1 48
char 1 0
align 1
LABELV $445
char 1 114
char 1 97
char 1 116
char 1 101
char 1 0
align 1
LABELV $440
char 1 102
char 1 117
char 1 110
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $439
char 1 94
char 1 49
char 1 69
char 1 114
char 1 114
char 1 111
char 1 114
char 1 58
char 1 32
char 1 66
char 1 111
char 1 116
char 1 32
char 1 39
char 1 37
char 1 115
char 1 39
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 100
char 1 101
char 1 102
char 1 105
char 1 110
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $435
char 1 66
char 1 111
char 1 116
char 1 65
char 1 73
char 1 83
char 1 101
char 1 116
char 1 117
char 1 112
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 102
char 1 97
char 1 105
char 1 108
char 1 101
char 1 100
char 1 0
align 1
LABELV $431
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $429
char 1 115
char 1 107
char 1 105
char 1 108
char 1 108
char 1 0
align 1
LABELV $427
char 1 112
char 1 101
char 1 114
char 1 115
char 1 111
char 1 110
char 1 97
char 1 108
char 1 105
char 1 116
char 1 121
char 1 0
align 1
LABELV $417
char 1 94
char 1 51
char 1 85
char 1 110
char 1 97
char 1 98
char 1 108
char 1 101
char 1 32
char 1 116
char 1 111
char 1 32
char 1 100
char 1 101
char 1 108
char 1 97
char 1 121
char 1 32
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 10
char 1 0
align 1
LABELV $290
char 1 107
char 1 105
char 1 99
char 1 107
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $273
char 1 97
char 1 100
char 1 100
char 1 98
char 1 111
char 1 116
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $271
char 1 98
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $268
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $265
char 1 103
char 1 95
char 1 115
char 1 112
char 1 83
char 1 107
char 1 105
char 1 108
char 1 108
char 1 0
align 1
LABELV $222
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $208
char 1 37
char 1 105
char 1 0
align 1
LABELV $207
char 1 110
char 1 117
char 1 109
char 1 0
align 1
LABELV $202
char 1 37
char 1 105
char 1 32
char 1 97
char 1 114
char 1 101
char 1 110
char 1 97
char 1 115
char 1 32
char 1 112
char 1 97
char 1 114
char 1 115
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $201
char 1 115
char 1 99
char 1 114
char 1 105
char 1 112
char 1 116
char 1 115
char 1 47
char 1 0
align 1
LABELV $196
char 1 46
char 1 97
char 1 114
char 1 101
char 1 110
char 1 97
char 1 0
align 1
LABELV $195
char 1 115
char 1 99
char 1 114
char 1 105
char 1 112
char 1 116
char 1 115
char 1 0
align 1
LABELV $194
char 1 115
char 1 99
char 1 114
char 1 105
char 1 112
char 1 116
char 1 115
char 1 47
char 1 97
char 1 114
char 1 101
char 1 110
char 1 97
char 1 115
char 1 46
char 1 116
char 1 120
char 1 116
char 1 0
align 1
LABELV $189
char 1 103
char 1 95
char 1 97
char 1 114
char 1 101
char 1 110
char 1 97
char 1 115
char 1 70
char 1 105
char 1 108
char 1 101
char 1 0
align 1
LABELV $187
char 1 109
char 1 97
char 1 112
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $186
char 1 109
char 1 97
char 1 112
char 1 95
char 1 114
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 32
char 1 48
char 1 0
align 1
LABELV $185
char 1 110
char 1 101
char 1 120
char 1 116
char 1 109
char 1 97
char 1 112
char 1 0
align 1
LABELV $165
char 1 0
align 1
LABELV $164
char 1 109
char 1 97
char 1 112
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $155
char 1 116
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $150
char 1 109
char 1 97
char 1 112
char 1 0
align 1
LABELV $139
char 1 99
char 1 116
char 1 121
char 1 0
align 1
LABELV $136
char 1 99
char 1 116
char 1 102
char 1 0
align 1
LABELV $133
char 1 115
char 1 97
char 1 103
char 1 97
char 1 0
align 1
LABELV $130
char 1 100
char 1 117
char 1 101
char 1 108
char 1 0
align 1
LABELV $127
char 1 106
char 1 101
char 1 100
char 1 105
char 1 109
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $124
char 1 104
char 1 111
char 1 108
char 1 111
char 1 99
char 1 114
char 1 111
char 1 110
char 1 0
align 1
LABELV $121
char 1 102
char 1 102
char 1 97
char 1 0
align 1
LABELV $115
char 1 94
char 1 49
char 1 102
char 1 105
char 1 108
char 1 101
char 1 32
char 1 116
char 1 111
char 1 111
char 1 32
char 1 108
char 1 97
char 1 114
char 1 103
char 1 101
char 1 58
char 1 32
char 1 37
char 1 115
char 1 32
char 1 105
char 1 115
char 1 32
char 1 37
char 1 105
char 1 44
char 1 32
char 1 109
char 1 97
char 1 120
char 1 32
char 1 97
char 1 108
char 1 108
char 1 111
char 1 119
char 1 101
char 1 100
char 1 32
char 1 105
char 1 115
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $112
char 1 94
char 1 49
char 1 102
char 1 105
char 1 108
char 1 101
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 102
char 1 111
char 1 117
char 1 110
char 1 100
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $106
char 1 37
char 1 100
char 1 0
align 1
LABELV $105
char 1 92
char 1 110
char 1 117
char 1 109
char 1 92
char 1 0
align 1
LABELV $104
char 1 60
char 1 78
char 1 85
char 1 76
char 1 76
char 1 62
char 1 0
align 1
LABELV $101
char 1 125
char 1 0
align 1
LABELV $98
char 1 85
char 1 110
char 1 101
char 1 120
char 1 112
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 32
char 1 101
char 1 110
char 1 100
char 1 32
char 1 111
char 1 102
char 1 32
char 1 105
char 1 110
char 1 102
char 1 111
char 1 32
char 1 102
char 1 105
char 1 108
char 1 101
char 1 10
char 1 0
align 1
LABELV $92
char 1 77
char 1 97
char 1 120
char 1 32
char 1 105
char 1 110
char 1 102
char 1 111
char 1 115
char 1 32
char 1 101
char 1 120
char 1 99
char 1 101
char 1 101
char 1 100
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $89
char 1 77
char 1 105
char 1 115
char 1 115
char 1 105
char 1 110
char 1 103
char 1 32
char 1 123
char 1 32
char 1 105
char 1 110
char 1 32
char 1 105
char 1 110
char 1 102
char 1 111
char 1 32
char 1 102
char 1 105
char 1 108
char 1 101
char 1 10
char 1 0
align 1
LABELV $88
char 1 123
char 1 0
