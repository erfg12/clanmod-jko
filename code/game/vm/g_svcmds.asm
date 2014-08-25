code
proc StringToFilter 160 8
file "../g_svcmds.c"
line 60
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:// this file holds commands that can be executed by the server console, but not remote clients
;5:
;6:#include "g_local.h"
;7:
;8:
;9:/*
;10:==============================================================================
;11:
;12:PACKET FILTERING
;13: 
;14:
;15:You can add or remove addresses from the filter list with:
;16:
;17:addip <ip>
;18:removeip <ip>
;19:
;20:The ip address is specified in dot format, and any unspecified digits will match any value, so you can specify an entire class C network with "addip 192.246.40".
;21:
;22:Removeip will only remove an address specified exactly the same way.  You cannot addip a subnet, then removeip a single host.
;23:
;24:listip
;25:Prints the current list of filters.
;26:
;27:g_filterban <0 or 1>
;28:
;29:If 1 (the default), then ip addresses matching the current list will be prohibited from entering the game.  This is the default setting.
;30:
;31:If 0, then only addresses matching the list will be allowed.  This lets you easily set up a private game, or a game that only allows players from your local network.
;32:
;33:
;34:==============================================================================
;35:*/
;36:
;37:// extern	vmCvar_t	g_banIPs;
;38:// extern	vmCvar_t	g_filterBan;
;39:
;40:
;41:typedef struct ipFilter_s
;42:{
;43:	unsigned	mask;
;44:	unsigned	compare;
;45:} ipFilter_t;
;46:
;47:#define	MAX_IPFILTERS	1024
;48:
;49:static ipFilter_t	ipFilters[MAX_IPFILTERS];
;50:static int			numIPFilters;
;51:extern int G_ClientNumberFromArg( char *str);
;52:void uwRename(gentity_t *player, const char *newname);
;53:
;54:/*
;55:=================
;56:StringToFilter
;57:=================
;58:*/
;59:static qboolean StringToFilter (char *s, ipFilter_t *f)
;60:{
line 66
;61:	char	num[128];
;62:	int		i, j;
;63:	byte	b[4];
;64:	byte	m[4];
;65:	
;66:	for (i=0 ; i<4 ; i++)
ADDRLP4 132
CNSTI4 0
ASGNI4
LABELV $79
line 67
;67:	{
line 68
;68:		b[i] = 0;
ADDRLP4 132
INDIRI4
ADDRLP4 136
ADDP4
CNSTU1 0
ASGNU1
line 69
;69:		m[i] = 0;
ADDRLP4 132
INDIRI4
ADDRLP4 140
ADDP4
CNSTU1 0
ASGNU1
line 70
;70:	}
LABELV $80
line 66
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 4
LTI4 $79
line 72
;71:	
;72:	for (i=0 ; i<4 ; i++)
ADDRLP4 132
CNSTI4 0
ASGNI4
LABELV $83
line 73
;73:	{
line 74
;74:		if (*s < '0' || *s > '9')
ADDRLP4 144
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 48
LTI4 $89
ADDRLP4 144
INDIRI4
CNSTI4 57
LEI4 $87
LABELV $89
line 75
;75:		{
line 76
;76:			G_Printf( "Bad filter address: %s\n", s );
ADDRGP4 $90
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 77
;77:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $78
JUMPV
LABELV $87
line 80
;78:		}
;79:		
;80:		j = 0;
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRGP4 $92
JUMPV
LABELV $91
line 82
;81:		while (*s >= '0' && *s <= '9')
;82:		{
line 83
;83:			num[j++] = *s++;
ADDRLP4 148
ADDRLP4 128
INDIRI4
ASGNI4
ADDRLP4 156
CNSTI4 1
ASGNI4
ADDRLP4 128
ADDRLP4 148
INDIRI4
ADDRLP4 156
INDIRI4
ADDI4
ASGNI4
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 152
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ASGNP4
ADDRLP4 148
INDIRI4
ADDRLP4 0
ADDP4
ADDRLP4 152
INDIRP4
INDIRI1
ASGNI1
line 84
;84:		}
LABELV $92
line 81
ADDRLP4 148
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 48
LTI4 $94
ADDRLP4 148
INDIRI4
CNSTI4 57
LEI4 $91
LABELV $94
line 85
;85:		num[j] = 0;
ADDRLP4 128
INDIRI4
ADDRLP4 0
ADDP4
CNSTI1 0
ASGNI1
line 86
;86:		b[i] = atoi(num);
ADDRLP4 0
ARGP4
ADDRLP4 152
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
ADDRLP4 136
ADDP4
ADDRLP4 152
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 87
;87:		if (b[i] != 0)
ADDRLP4 132
INDIRI4
ADDRLP4 136
ADDP4
INDIRU1
CVUI4 1
CNSTI4 0
EQI4 $95
line 88
;88:			m[i] = 255;
ADDRLP4 132
INDIRI4
ADDRLP4 140
ADDP4
CNSTU1 255
ASGNU1
LABELV $95
line 90
;89:
;90:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $97
line 91
;91:			break;
ADDRGP4 $85
JUMPV
LABELV $97
line 92
;92:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 93
;93:	}
LABELV $84
line 72
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 4
LTI4 $83
LABELV $85
line 95
;94:	
;95:	f->mask = *(unsigned *)m;
ADDRFP4 4
INDIRP4
ADDRLP4 140
INDIRU4
ASGNU4
line 96
;96:	f->compare = *(unsigned *)b;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 136
INDIRU4
ASGNU4
line 98
;97:	
;98:	return qtrue;
CNSTI4 1
RETI4
LABELV $78
endproc StringToFilter 160 8
proc UpdateIPBans 1040 28
line 108
;99:}
;100:
;101:/*
;102:=================
;103:UpdateIPBans
;104:=================
;105:*/
;106://cm NOTE: Updated to put banned ips into a file
;107:static void UpdateIPBans (void)
;108:{
line 114
;109:	byte	b[4];
;110:	int		i;
;111:	char	ipstr[MAX_INFO_STRING];
;112:	fileHandle_t	f;
;113:
;114:	trap_FS_FOpenFile( "banIP.txt", &f, FS_WRITE );
ADDRGP4 $100
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 115
;115:	if ( !f )
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $101
line 116
;116:	{
line 117
;117:		trap_Printf( va("BAN Error: file cannot be opened for writing: %s\n", "banIP.txt") );
ADDRGP4 $103
ARGP4
ADDRGP4 $100
ARGP4
ADDRLP4 1036
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 118
;118:		return;
ADDRGP4 $99
JUMPV
LABELV $101
line 120
;119:	}
;120:	for (i = 0 ; i < numIPFilters ; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $107
JUMPV
LABELV $104
line 121
;121:	{
line 122
;122:		if (ipFilters[i].compare == 0xffffffff)
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
CNSTU4 4294967295
NEU4 $108
line 123
;123:			continue;
ADDRGP4 $105
JUMPV
LABELV $108
line 125
;124:
;125:		*(unsigned *)b = ipFilters[i].compare;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
ASGNU4
line 126
;126:		Com_sprintf( ipstr, sizeof(ipstr), "%i.%i.%i.%i ", b[0], b[1], b[2], b[3]);
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $112
ARGP4
ADDRLP4 0
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 0+1
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 0+2
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 0+3
INDIRU1
CVUI4 1
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 127
;127:		trap_FS_Write( ipstr, strlen(ipstr), f);
ADDRLP4 8
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 128
;128:	}
LABELV $105
line 120
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $107
ADDRLP4 4
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $104
line 129
;129:	trap_FS_FCloseFile( f );
ADDRLP4 1032
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 131
;130:
;131:}
LABELV $99
endproc UpdateIPBans 1040 28
lit
align 1
LABELV $117
char 1 0
char 1 0
char 1 0
char 1 0
export G_FilterPacket
code
proc G_FilterPacket 28 0
line 158
;132:/*static void UpdateIPBans (void)
;133:{
;134:	byte	b[4];
;135:	int		i;
;136:	char	iplist[MAX_INFO_STRING];
;137:
;138:	*iplist = 0;
;139:	for (i = 0 ; i < numIPFilters ; i++)
;140:	{
;141:		if (ipFilters[i].compare == 0xffffffff)
;142:			continue;
;143:
;144:		*(unsigned *)b = ipFilters[i].compare;
;145:		Com_sprintf( iplist + strlen(iplist), sizeof(iplist) - strlen(iplist), 
;146:			"%i.%i.%i.%i ", b[0], b[1], b[2], b[3]);
;147:	}
;148:
;149:	trap_Cvar_Set( "g_banIPs", iplist );
;150:}*/
;151:
;152:/*
;153:=================
;154:G_FilterPacket
;155:=================
;156:*/
;157:qboolean G_FilterPacket (char *from)
;158:{
line 161
;159:	int		i;
;160:	unsigned	in;
;161:	byte m[4] = {'\0','\0','\0','\0'};
ADDRLP4 8
ADDRGP4 $117
INDIRB
ASGNB 4
line 164
;162:	char *p;
;163:
;164:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 165
;165:	p = from;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $119
JUMPV
LABELV $118
line 166
;166:	while (*p && i < 4) {
line 167
;167:		m[i] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTU1 0
ASGNU1
ADDRGP4 $122
JUMPV
LABELV $121
line 168
;168:		while (*p >= '0' && *p <= '9') {
line 169
;169:			m[i] = m[i]*10 + (*p - '0');
ADDRLP4 16
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 10
ADDRLP4 16
INDIRP4
INDIRU1
CVUI4 1
MULI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ADDI4
CVIU4 4
CVUU1 4
ASGNU1
line 170
;170:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 171
;171:		}
LABELV $122
line 168
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 48
LTI4 $124
ADDRLP4 16
INDIRI4
CNSTI4 57
LEI4 $121
LABELV $124
line 172
;172:		if (!*p || *p == ':')
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $127
ADDRLP4 20
INDIRI4
CNSTI4 58
NEI4 $125
LABELV $127
line 173
;173:			break;
ADDRGP4 $120
JUMPV
LABELV $125
line 174
;174:		i++, p++;
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
line 175
;175:	}
LABELV $119
line 166
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $128
ADDRLP4 4
INDIRI4
CNSTI4 4
LTI4 $118
LABELV $128
LABELV $120
line 177
;176:	
;177:	in = *(unsigned *)m;
ADDRLP4 12
ADDRLP4 8
INDIRU4
ASGNU4
line 179
;178:
;179:	for (i=0 ; i<numIPFilters ; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $132
JUMPV
LABELV $129
line 180
;180:		if ( (in & ipFilters[i].mask) == ipFilters[i].compare)
ADDRLP4 16
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 12
INDIRU4
ADDRLP4 16
INDIRI4
ADDRGP4 ipFilters
ADDP4
INDIRU4
BANDU4
ADDRLP4 16
INDIRI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
NEU4 $133
line 181
;181:			return g_filterBan.integer != 0;
ADDRGP4 g_filterBan+12
INDIRI4
CNSTI4 0
EQI4 $138
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $139
JUMPV
LABELV $138
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $139
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $116
JUMPV
LABELV $133
LABELV $130
line 179
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $132
ADDRLP4 4
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $129
line 183
;182:
;183:	return g_filterBan.integer == 0;
ADDRGP4 g_filterBan+12
INDIRI4
CNSTI4 0
NEI4 $142
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $143
JUMPV
LABELV $142
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $143
ADDRLP4 24
INDIRI4
RETI4
LABELV $116
endproc G_FilterPacket 28 0
export G_CheckMaxConnections
proc G_CheckMaxConnections 76 12
line 187
;184:}
;185:
;186:qboolean G_CheckMaxConnections( char *from )
;187:{ // returns qfalse when # of players on this ip is <= sv_maxConnections or dont care to check
line 188
;188:	int i=0,n=0,count=1;
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 40
CNSTI4 1
ASGNI4
line 193
;189:	int idnum;
;190:	char from2[22];
;191:	gentity_t *ent;
;192:
;193:	if ( !sv_maxConnections.integer ) { // max connections check is disabled //RoAR mod NOTE: Changed.
ADDRGP4 sv_maxConnections+12
INDIRI4
CNSTI4 0
NEI4 $145
line 194
;194:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $144
JUMPV
LABELV $145
line 197
;195:	}
;196:
;197:	if ( g_dedicated.integer == 1 ) { //RoAR mod NOTE: Hosting a local server?
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 1
NEI4 $148
line 198
;198:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $144
JUMPV
LABELV $148
line 201
;199:	}
;200:
;201:	Q_strncpyz(from2, from, sizeof(from2));
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 22
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 202
;202:	n=0;
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $152
JUMPV
LABELV $151
line 203
;203:	while(++n<strlen(from2))if(from2[n]==':')from2[n]=0;// stip port off of "from"
ADDRLP4 32
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 58
NEI4 $154
ADDRLP4 32
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
LABELV $154
LABELV $152
ADDRLP4 44
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 32
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 48
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $151
line 205
;204:
;205:	if ( !Q_stricmp(from2, "localhost" ) ) { // localhost doesnt matter
ADDRLP4 4
ARGP4
ADDRGP4 $158
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $156
line 206
;206:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $144
JUMPV
LABELV $156
line 209
;207:	}
;208:
;209:	if ( !Q_stricmp(from2, "" ) || from2[0] == 0 ) { // bots dont matter either
ADDRLP4 4
ARGP4
ADDRGP4 $161
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $162
ADDRLP4 4
INDIRI1
CVII4 1
ADDRLP4 60
INDIRI4
NEI4 $159
LABELV $162
line 210
;210:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $144
JUMPV
LABELV $159
line 213
;211:	}
;212:
;213:	for(i =0 ; i < g_maxclients.integer; i++) {
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRGP4 $166
JUMPV
LABELV $163
line 214
;214:		idnum = level.sortedClients[i];
ADDRLP4 36
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
ASGNI4
line 215
;215:		ent = g_entities + idnum;
ADDRLP4 0
CNSTI4 852
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 217
;216:		
;217:		if ( !ent || !ent->client )
ADDRLP4 68
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
EQU4 $171
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
NEU4 $169
LABELV $171
line 218
;218:			continue;
ADDRGP4 $164
JUMPV
LABELV $169
line 220
;219:			
;220:		if ( ent->client->pers.connected == CON_DISCONNECTED )
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $172
line 221
;221:			continue;
ADDRGP4 $164
JUMPV
LABELV $172
line 223
;222:
;223:		if ( Q_stricmp(from2, ent->client->sess.IPstring ) )	// ips are not same so dont count
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1688
ADDP4
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $174
line 224
;224:			continue;
ADDRGP4 $164
JUMPV
LABELV $174
line 226
;225:
;226:		count++;
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 227
;227:	}
LABELV $164
line 213
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $166
ADDRLP4 28
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $163
line 229
;228:
;229:	if ( count > sv_maxConnections.integer ) {
ADDRLP4 40
INDIRI4
ADDRGP4 sv_maxConnections+12
INDIRI4
LEI4 $176
line 230
;230:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $144
JUMPV
LABELV $176
line 233
;231:	}
;232:
;233:	return qfalse;
CNSTI4 0
RETI4
LABELV $144
endproc G_CheckMaxConnections 76 12
export AddIP
proc AddIP 8 8
line 244
;234:}
;235:
;236:/*
;237:=================
;238:AddIP
;239:=================
;240:*/
;241://cm NOTE: Made this a normal void for adding IPs in cmds.c
;242://static void AddIP( char *str )
;243:void AddIP( char *str )
;244:{
line 247
;245:	int		i;
;246:
;247:	for (i = 0 ; i < numIPFilters ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $183
JUMPV
LABELV $180
line 248
;248:		if (ipFilters[i].compare == 0xffffffff)
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
CNSTU4 4294967295
NEU4 $184
line 249
;249:			break;		// free spot
ADDRGP4 $182
JUMPV
LABELV $184
LABELV $181
line 247
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $183
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $180
LABELV $182
line 250
;250:	if (i == numIPFilters)
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
NEI4 $187
line 251
;251:	{
line 252
;252:		if (numIPFilters == MAX_IPFILTERS)
ADDRGP4 numIPFilters
INDIRI4
CNSTI4 1024
NEI4 $189
line 253
;253:		{
line 254
;254:			G_Printf ("IP filter list is full\n");
ADDRGP4 $191
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 255
;255:			return;
ADDRGP4 $179
JUMPV
LABELV $189
line 257
;256:		}
;257:		numIPFilters++;
ADDRLP4 4
ADDRGP4 numIPFilters
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 258
;258:	}
LABELV $187
line 260
;259:	
;260:	if (!StringToFilter (str, &ipFilters[i]))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 StringToFilter
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $192
line 261
;261:		ipFilters[i].compare = 0xffffffffu;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
CNSTU4 4294967295
ASGNU4
LABELV $192
line 263
;262:
;263:	UpdateIPBans();
ADDRGP4 UpdateIPBans
CALLV
pop
line 264
;264:}
LABELV $179
endproc AddIP 8 8
proc InitialAddIP 8 8
line 267
;265://cm NOTE: Added to put banned ips into a file
;266:static void InitialAddIP( char *str )
;267:{
line 270
;268:	int		i;
;269:
;270:	for (i = 0 ; i < numIPFilters ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $199
JUMPV
LABELV $196
line 271
;271:		if (ipFilters[i].compare == 0xffffffff)
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
CNSTU4 4294967295
NEU4 $200
line 272
;272:			break;		// free spot
ADDRGP4 $198
JUMPV
LABELV $200
LABELV $197
line 270
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $199
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $196
LABELV $198
line 273
;273:	if (i == numIPFilters)
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
NEI4 $203
line 274
;274:	{
line 275
;275:		if (numIPFilters == MAX_IPFILTERS)
ADDRGP4 numIPFilters
INDIRI4
CNSTI4 1024
NEI4 $205
line 276
;276:		{
line 277
;277:			G_Printf ("IP filter list is full\n");
ADDRGP4 $191
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 278
;278:			return;
ADDRGP4 $195
JUMPV
LABELV $205
line 280
;279:		}
;280:		numIPFilters++;
ADDRLP4 4
ADDRGP4 numIPFilters
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 281
;281:	}
LABELV $203
line 283
;282:	
;283:	if (!StringToFilter (str, &ipFilters[i]))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 StringToFilter
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $207
line 284
;284:		ipFilters[i].compare = 0xffffffffu;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
CNSTU4 4294967295
ASGNU4
LABELV $207
line 285
;285:}
LABELV $195
endproc InitialAddIP 8 8
export G_ProcessIPBans
proc G_ProcessIPBans 40 12
line 294
;286:
;287:/*
;288:=================
;289:G_ProcessIPBans
;290:=================
;291:*/
;292://cm NOTE: Updated to put banned ips into a file
;293:void G_ProcessIPBans(void) 
;294:{
line 300
;295:	char *s, *t;
;296:	int len;
;297:	fileHandle_t	f;
;298:	char *buf;
;299:
;300:	numIPFilters = 0;
ADDRGP4 numIPFilters
CNSTI4 0
ASGNI4
line 302
;301:
;302:	len = trap_FS_FOpenFile( "banIP.txt", &f, FS_READ );
ADDRGP4 $100
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 303
;303:	if ( !f )
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $211
line 304
;304:	{
line 305
;305:		trap_Printf( va( "BAN Warning: file cannot be opened for reading: %s\n", "banIP.txt") );
ADDRGP4 $213
ARGP4
ADDRGP4 $100
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 306
;306:		return;
ADDRGP4 $210
JUMPV
LABELV $211
line 308
;307:	}
;308:	if ( !len )
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $214
line 309
;309:	{ //empty file
line 310
;310:		trap_FS_FCloseFile( f );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 311
;311:		return;
ADDRGP4 $210
JUMPV
LABELV $214
line 314
;312:	}
;313:
;314:	if ( (buf = BG_TempAlloc(len+1)) == 0 )
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_TempAlloc
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $216
line 315
;315:	{//alloc memory for buffer
line 316
;316:		return;
ADDRGP4 $210
JUMPV
LABELV $216
line 318
;317:	}
;318:	trap_FS_Read( buf, len, f );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 319
;319:	trap_FS_FCloseFile( f );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 321
;320:
;321:	for (t = s = buf; *t; /* */ ) {
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
ADDRGP4 $221
JUMPV
LABELV $218
line 322
;322:		s = strchr(s, ' ');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 32
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
ASGNP4
line 323
;323:		if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $225
line 324
;324:			break;
ADDRGP4 $220
JUMPV
LABELV $224
line 326
;325:		while (*s == ' ')
;326:			*s++ = 0;
ADDRLP4 36
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI1 0
ASGNI1
LABELV $225
line 325
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $224
line 327
;327:		if (*t)
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $227
line 328
;328:			InitialAddIP( t );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 InitialAddIP
CALLV
pop
LABELV $227
line 329
;329:		t = s;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 330
;330:	}
LABELV $219
line 321
LABELV $221
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $218
LABELV $220
line 331
;331:	BG_TempFree(len+1);
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 BG_TempFree
CALLV
pop
line 332
;332:}
LABELV $210
endproc G_ProcessIPBans 40 12
export Svcmd_AddIP_f
proc Svcmd_AddIP_f 1028 12
line 359
;333:/*void G_ProcessIPBans(void) 
;334:{
;335:	char *s, *t;
;336:	char		str[MAX_TOKEN_CHARS];
;337:
;338:	Q_strncpyz( str, g_banIPs.string, sizeof(str) );
;339:
;340:	for (t = s = g_banIPs.string; *t; ) {
;341:		s = strchr(s, ' ');
;342:		if (!s)
;343:			break;
;344:		while (*s == ' ')
;345:			*s++ = 0;
;346:		if (*t)
;347:			AddIP( t );
;348:		t = s;
;349:	}
;350:}*/
;351:
;352:
;353:/*
;354:=================
;355:Svcmd_AddIP_f
;356:=================
;357:*/
;358:void Svcmd_AddIP_f (void)
;359:{
line 362
;360:	char		str[MAX_TOKEN_CHARS];
;361:
;362:	if ( trap_Argc() < 2 ) {
ADDRLP4 1024
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
GEI4 $230
line 363
;363:		G_Printf("Usage:  addip <ip-mask>\n");
ADDRGP4 $232
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 364
;364:		return;
ADDRGP4 $229
JUMPV
LABELV $230
line 367
;365:	}
;366:
;367:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 369
;368:
;369:	AddIP( str );
ADDRLP4 0
ARGP4
ADDRGP4 AddIP
CALLV
pop
line 371
;370:
;371:}
LABELV $229
endproc Svcmd_AddIP_f 1028 12
export Svcmd_RemoveIP_f
proc Svcmd_RemoveIP_f 1048 12
line 379
;372:
;373:/*
;374:=================
;375:Svcmd_RemoveIP_f
;376:=================
;377:*/
;378:void Svcmd_RemoveIP_f (void)
;379:{
line 384
;380:	ipFilter_t	f;
;381:	int			i;
;382:	char		str[MAX_TOKEN_CHARS];
;383:
;384:	if ( trap_Argc() < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $234
line 385
;385:		G_Printf("Usage:  sv removeip <ip-mask>\n");
ADDRGP4 $236
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 386
;386:		return;
ADDRGP4 $233
JUMPV
LABELV $234
line 389
;387:	}
;388:
;389:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 391
;390:
;391:	if (!StringToFilter (str, &f))
ADDRLP4 12
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1040
ADDRGP4 StringToFilter
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $237
line 392
;392:		return;
ADDRGP4 $233
JUMPV
LABELV $237
line 394
;393:
;394:	for (i=0 ; i<numIPFilters ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $242
JUMPV
LABELV $239
line 395
;395:		if (ipFilters[i].mask == f.mask	&&
ADDRLP4 1044
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 1044
INDIRI4
ADDRGP4 ipFilters
ADDP4
INDIRU4
ADDRLP4 4
INDIRU4
NEU4 $243
ADDRLP4 1044
INDIRI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
ADDRLP4 4+4
INDIRU4
NEU4 $243
line 396
;396:			ipFilters[i].compare == f.compare) {
line 397
;397:			ipFilters[i].compare = 0xffffffffu;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
CNSTU4 4294967295
ASGNU4
line 398
;398:			G_Printf ("Removed.\n");
ADDRGP4 $248
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 400
;399:
;400:			UpdateIPBans();
ADDRGP4 UpdateIPBans
CALLV
pop
line 401
;401:			return;
ADDRGP4 $233
JUMPV
LABELV $243
line 403
;402:		}
;403:	}
LABELV $240
line 394
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $242
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $239
line 405
;404:
;405:	G_Printf ( "Didn't find %s.\n", str );
ADDRGP4 $249
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 406
;406:}
LABELV $233
endproc Svcmd_RemoveIP_f 1048 12
export Svcmd_EntityList_f
proc Svcmd_EntityList_f 16 8
line 413
;407:
;408:/*
;409:===================
;410:Svcmd_EntityList_f
;411:===================
;412:*/
;413:void	Svcmd_EntityList_f (void) {
line 417
;414:	int			e;
;415:	gentity_t		*check;
;416:
;417:	check = g_entities+1;
ADDRLP4 0
ADDRGP4 g_entities+852
ASGNP4
line 418
;418:	for (e = 1; e < level.num_entities ; e++, check++) {
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $255
JUMPV
LABELV $252
line 419
;419:		if ( !check->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $257
line 420
;420:			continue;
ADDRGP4 $253
JUMPV
LABELV $257
line 422
;421:		}
;422:		G_Printf("%3i:", e);
ADDRGP4 $259
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 423
;423:		switch ( check->s.eType ) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $260
ADDRLP4 8
INDIRI4
CNSTI4 13
GTI4 $260
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $288
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $288
address $263
address $265
address $267
address $269
address $260
address $260
address $271
address $273
address $275
address $277
address $279
address $281
address $283
address $285
code
LABELV $263
line 425
;424:		case ET_GENERAL:
;425:			G_Printf("ET_GENERAL          ");
ADDRGP4 $264
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 426
;426:			break;
ADDRGP4 $261
JUMPV
LABELV $265
line 428
;427:		case ET_PLAYER:
;428:			G_Printf("ET_PLAYER           ");
ADDRGP4 $266
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 429
;429:			break;
ADDRGP4 $261
JUMPV
LABELV $267
line 431
;430:		case ET_ITEM:
;431:			G_Printf("ET_ITEM             ");
ADDRGP4 $268
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 432
;432:			break;
ADDRGP4 $261
JUMPV
LABELV $269
line 434
;433:		case ET_MISSILE:
;434:			G_Printf("ET_MISSILE          ");
ADDRGP4 $270
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 435
;435:			break;
ADDRGP4 $261
JUMPV
LABELV $271
line 437
;436:		case ET_MOVER:
;437:			G_Printf("ET_MOVER            ");
ADDRGP4 $272
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 438
;438:			break;
ADDRGP4 $261
JUMPV
LABELV $273
line 440
;439:		case ET_BEAM:
;440:			G_Printf("ET_BEAM             ");
ADDRGP4 $274
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 441
;441:			break;
ADDRGP4 $261
JUMPV
LABELV $275
line 443
;442:		case ET_PORTAL:
;443:			G_Printf("ET_PORTAL           ");
ADDRGP4 $276
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 444
;444:			break;
ADDRGP4 $261
JUMPV
LABELV $277
line 446
;445:		case ET_SPEAKER:
;446:			G_Printf("ET_SPEAKER          ");
ADDRGP4 $278
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 447
;447:			break;
ADDRGP4 $261
JUMPV
LABELV $279
line 449
;448:		case ET_PUSH_TRIGGER:
;449:			G_Printf("ET_PUSH_TRIGGER     ");
ADDRGP4 $280
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 450
;450:			break;
ADDRGP4 $261
JUMPV
LABELV $281
line 452
;451:		case ET_TELEPORT_TRIGGER:
;452:			G_Printf("ET_TELEPORT_TRIGGER ");
ADDRGP4 $282
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 453
;453:			break;
ADDRGP4 $261
JUMPV
LABELV $283
line 455
;454:		case ET_INVISIBLE:
;455:			G_Printf("ET_INVISIBLE        ");
ADDRGP4 $284
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 456
;456:			break;
ADDRGP4 $261
JUMPV
LABELV $285
line 458
;457:		case ET_GRAPPLE:
;458:			G_Printf("ET_GRAPPLE          ");
ADDRGP4 $286
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 459
;459:			break;
ADDRGP4 $261
JUMPV
LABELV $260
line 461
;460:		default:
;461:			G_Printf("%3i                 ", check->s.eType);
ADDRGP4 $287
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 462
;462:			break;
LABELV $261
line 465
;463:		}
;464:
;465:		if ( check->classname ) {
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $289
line 466
;466:			G_Printf("%s", check->classname);
ADDRGP4 $291
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 467
;467:		}
LABELV $289
line 468
;468:		G_Printf("\n");
ADDRGP4 $292
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 469
;469:	}
LABELV $253
line 418
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 852
ADDP4
ASGNP4
LABELV $255
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $252
line 470
;470:}
LABELV $250
endproc Svcmd_EntityList_f 16 8
export ClientForString
proc ClientForString 24 8
line 472
;471:
;472:gclient_t	*ClientForString( const char *s ) {
line 478
;473:	gclient_t	*cl;
;474:	int			i;
;475:	int			idnum;
;476:
;477:	// numeric values are just slot numbers
;478:	if ( s[0] >= '0' && s[0] <= '9' ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 48
LTI4 $294
ADDRLP4 12
INDIRI4
CNSTI4 57
GTI4 $294
line 479
;479:		idnum = atoi( s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 480
;480:		if ( idnum < 0 || idnum >= level.maxclients ) {
ADDRLP4 20
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $299
ADDRLP4 20
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $296
LABELV $299
line 481
;481:			Com_Printf( "Bad client slot: %i\n", idnum );
ADDRGP4 $300
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 482
;482:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $293
JUMPV
LABELV $296
line 485
;483:		}
;484:
;485:		cl = &level.clients[idnum];
ADDRLP4 0
CNSTI4 3024
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 486
;486:		if ( cl->pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $301
line 487
;487:			G_Printf( "Client %i is not connected\n", idnum );
ADDRGP4 $303
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 488
;488:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $293
JUMPV
LABELV $301
line 490
;489:		}
;490:		return cl;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $293
JUMPV
LABELV $294
line 494
;491:	}
;492:
;493:	// check for a name match
;494:	for ( i=0 ; i < level.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $307
JUMPV
LABELV $304
line 495
;495:		cl = &level.clients[i];
ADDRLP4 0
CNSTI4 3024
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 496
;496:		if ( cl->pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $309
line 497
;497:			continue;
ADDRGP4 $305
JUMPV
LABELV $309
line 499
;498:		}
;499:		if ( !Q_stricmp( cl->pers.netname, s ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $311
line 500
;500:			return cl;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $293
JUMPV
LABELV $311
line 502
;501:		}
;502:	}
LABELV $305
line 494
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $307
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $304
line 504
;503:
;504:	G_Printf( "User %s is not on the server\n", s );
ADDRGP4 $313
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 506
;505:
;506:	return NULL;
CNSTP4 0
RETP4
LABELV $293
endproc ClientForString 24 8
export Svcmd_ForceTeam_f
proc Svcmd_ForceTeam_f 1032 12
line 516
;507:}
;508:
;509:/*
;510:===================
;511:Svcmd_ForceTeam_f
;512:
;513:forceteam <player> <team>
;514:===================
;515:*/
;516:void	Svcmd_ForceTeam_f( void ) {
line 521
;517:	gclient_t	*cl;
;518:	char		str[MAX_TOKEN_CHARS];
;519:
;520:	// find the player
;521:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 522
;522:	cl = ClientForString( str );
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 ClientForString
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1028
INDIRP4
ASGNP4
line 523
;523:	if ( !cl ) {
ADDRLP4 1024
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $315
line 524
;524:		return;
ADDRGP4 $314
JUMPV
LABELV $315
line 528
;525:	}
;526:
;527:	// set the team
;528:	trap_Argv( 2, str, sizeof( str ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 529
;529:	SetTeam( &g_entities[cl - level.clients], str );
CNSTI4 852
ADDRLP4 1024
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3024
DIVI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 530
;530:}
LABELV $314
endproc Svcmd_ForceTeam_f 1032 12
export Svcmd_LockTeam
proc Svcmd_LockTeam 96 12
line 533
;531:
;532:	void	Svcmd_LockTeam( void ) 
;533:	{
line 535
;534:		char teamname[MAX_TEAMNAME];
;535:		if ( g_gametype.integer >= GT_TEAM || g_gametype.integer == GT_FFA ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
GEI4 $322
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
NEI4 $318
LABELV $322
line 537
;536:		
;537:		if ( trap_Argc() != 2 ){
ADDRLP4 32
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 2
EQI4 $323
line 538
;538:			G_Printf("Usage: /lockteam (team)\nTEAMS = Spectator, Blue, Red, Free\n");
ADDRGP4 $325
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 539
;539:			return;
ADDRGP4 $317
JUMPV
LABELV $323
line 541
;540:		}
;541:		trap_Argv( 1, teamname, sizeof( teamname ) );		
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 542
;542:		if ( !Q_stricmp( teamname, "red" ) || !Q_stricmp( teamname, "r" ) ) {
ADDRLP4 0
ARGP4
ADDRGP4 $328
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $330
ADDRLP4 0
ARGP4
ADDRGP4 $329
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $326
LABELV $330
line 543
;543:			if (level.isLockedred == qfalse){
ADDRGP4 level+9096
INDIRI4
CNSTI4 0
NEI4 $331
line 544
;544:			level.isLockedred = qtrue;
ADDRGP4 level+9096
CNSTI4 1
ASGNI4
line 545
;545:			G_LogPrintf("LockTeam admin command executed by SERVER on Red Team. (locking)\n");
ADDRGP4 $335
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 546
;546:			trap_SendServerCommand( -1, va("cp \"^7The ^1Red ^7team is now ^1Locked^7.\n\""));
ADDRGP4 $336
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 547
;547:			trap_SendServerCommand( -1, va("print \"^7The ^1Red ^7team is now ^1Locked^7.\n\""));
ADDRGP4 $337
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 548
;548:			}
ADDRGP4 $319
JUMPV
LABELV $331
line 549
;549:			else {
line 550
;550:			level.isLockedred = qfalse;
ADDRGP4 level+9096
CNSTI4 0
ASGNI4
line 551
;551:			G_LogPrintf("LockTeam admin command executed by SERVER on Red Team. (unlocking)\n");
ADDRGP4 $339
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 552
;552:			trap_SendServerCommand( -1, va("cp \"^7The ^1Red ^7team is now ^2unLocked^7.\n\""));
ADDRGP4 $340
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 553
;553:			trap_SendServerCommand( -1, va("print \"^7The ^1Red ^7team is now ^2unLocked^7.\n\""));
ADDRGP4 $341
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 554
;554:			}
line 555
;555:		}
ADDRGP4 $319
JUMPV
LABELV $326
line 556
;556:		else if ( !Q_stricmp( teamname, "blue" ) || !Q_stricmp( teamname, "b" ) ) {
ADDRLP4 0
ARGP4
ADDRGP4 $344
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $346
ADDRLP4 0
ARGP4
ADDRGP4 $345
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $342
LABELV $346
line 557
;557:			if (level.isLockedblue == qfalse){
ADDRGP4 level+9100
INDIRI4
CNSTI4 0
NEI4 $347
line 558
;558:			level.isLockedblue = qtrue;
ADDRGP4 level+9100
CNSTI4 1
ASGNI4
line 559
;559:			G_LogPrintf("LockTeam admin command executed by SERVER on Blue Team. (locking)\n");
ADDRGP4 $351
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 560
;560:			trap_SendServerCommand( -1, va("cp \"^7The ^4Blue ^7team is now ^1Locked^7.\n\""));
ADDRGP4 $352
ARGP4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 561
;561:			trap_SendServerCommand( -1, va("print \"^7The ^4Blue ^7team is now ^1Locked^7.\n\""));
ADDRGP4 $353
ARGP4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 562
;562:			}
ADDRGP4 $319
JUMPV
LABELV $347
line 563
;563:			else {
line 564
;564:			level.isLockedblue = qfalse;
ADDRGP4 level+9100
CNSTI4 0
ASGNI4
line 565
;565:			G_LogPrintf("LockTeam admin command executed by SERVER on Blue Team. (unlocking)\n");
ADDRGP4 $355
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 566
;566:			trap_SendServerCommand( -1, va("cp \"^7The ^4Blue ^7team is now ^2unLocked^7.\n\""));
ADDRGP4 $356
ARGP4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 567
;567:			trap_SendServerCommand( -1, va("print \"^7The ^4Blue ^7team is now ^2unLocked^7.\n\""));
ADDRGP4 $357
ARGP4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 568
;568:			}
line 569
;569:		}
ADDRGP4 $319
JUMPV
LABELV $342
line 570
;570:		else if( !Q_stricmp( teamname, "spectator" ) || !Q_stricmp( teamname, "s" ) || !Q_stricmp( teamname, "spec" ) || !Q_stricmp( teamname, "spectate" ) ) {
ADDRLP4 0
ARGP4
ADDRGP4 $360
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $366
ADDRLP4 0
ARGP4
ADDRGP4 $361
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $366
ADDRLP4 0
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $366
ADDRLP4 0
ARGP4
ADDRGP4 $363
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $358
LABELV $366
line 571
;571:			if (level.isLockedspec == qfalse){
ADDRGP4 level+9104
INDIRI4
CNSTI4 0
NEI4 $367
line 572
;572:			level.isLockedspec = qtrue;
ADDRGP4 level+9104
CNSTI4 1
ASGNI4
line 573
;573:			G_LogPrintf("LockTeam admin command executed by SERVER on Spectator Team. (locking)\n");
ADDRGP4 $371
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 574
;574:			trap_SendServerCommand( -1, va("cp \"^7The ^3Spectator ^7team is now ^1Locked^7.\n\""));
ADDRGP4 $372
ARGP4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 575
;575:			trap_SendServerCommand( -1, va("print \"^7The ^3Spectator ^7team is now ^1Locked^7.\n\""));
ADDRGP4 $373
ARGP4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 576
;576:			}
ADDRGP4 $319
JUMPV
LABELV $367
line 577
;577:			else {
line 578
;578:			level.isLockedspec = qfalse;
ADDRGP4 level+9104
CNSTI4 0
ASGNI4
line 579
;579:			G_LogPrintf("LockTeam admin command executed by SERVER on Spectator Team. (locking)\n");
ADDRGP4 $371
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 580
;580:			trap_SendServerCommand( -1, va("cp \"^7The ^3Spectator ^7team is now ^2unLocked^7.\n\""));
ADDRGP4 $375
ARGP4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 581
;581:			trap_SendServerCommand( -1, va("print \"^7The ^3Spectator ^7team is now ^2unLocked^7.\n\""));
ADDRGP4 $376
ARGP4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 582
;582:			}
line 583
;583:		}
ADDRGP4 $319
JUMPV
LABELV $358
line 584
;584:		else if( !Q_stricmp( teamname, "join" ) || !Q_stricmp( teamname, "free" ) || !Q_stricmp( teamname, "enter" )
ADDRLP4 0
ARGP4
ADDRGP4 $379
ARGP4
ADDRLP4 68
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $387
ADDRLP4 0
ARGP4
ADDRGP4 $380
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $387
ADDRLP4 0
ARGP4
ADDRGP4 $381
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $387
ADDRLP4 0
ARGP4
ADDRGP4 $382
ARGP4
ADDRLP4 80
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $387
ADDRLP4 0
ARGP4
ADDRGP4 $383
ARGP4
ADDRLP4 84
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $377
LABELV $387
line 585
;585:			 || !Q_stricmp( teamname, "f" ) || !Q_stricmp( teamname, "j" )) {
line 586
;586:			if (level.isLockedjoin == qfalse){
ADDRGP4 level+9108
INDIRI4
CNSTI4 0
NEI4 $388
line 587
;587:			level.isLockedjoin = qtrue;
ADDRGP4 level+9108
CNSTI4 1
ASGNI4
line 588
;588:			G_LogPrintf("LockTeam admin command executed by SERVER on Join Team. (locking)\n");
ADDRGP4 $392
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 589
;589:			trap_SendServerCommand( -1, va("cp \"^7The ^2Join ^7team is now ^1Locked^7.\n\""));
ADDRGP4 $393
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 590
;590:			trap_SendServerCommand( -1, va("print \"^7The ^2Join ^7team is now ^1Locked^7.\n\""));
ADDRGP4 $394
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 591
;591:			}
ADDRGP4 $319
JUMPV
LABELV $388
line 592
;592:			else {
line 593
;593:			level.isLockedjoin = qfalse;
ADDRGP4 level+9108
CNSTI4 0
ASGNI4
line 594
;594:			G_LogPrintf("LockTeam admin command executed by SERVER on Join Team. (unlocking)\n");
ADDRGP4 $396
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 595
;595:			trap_SendServerCommand( -1, va("cp \"^7The ^2Join ^7team is now ^2unLocked^7.\n\""));
ADDRGP4 $397
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 596
;596:			trap_SendServerCommand( -1, va("print \"^7The ^2Join ^7team is now ^2unLocked^7.\n\""));
ADDRGP4 $398
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 597
;597:			}
line 598
;598:		}
ADDRGP4 $319
JUMPV
LABELV $377
line 599
;599:		else {
line 600
;600:			G_Printf("Usage: /lockteam (team)\nTEAMS = Spectator, Blue, Red, Free\n");
ADDRGP4 $325
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 601
;601:			return;
ADDRGP4 $317
JUMPV
line 603
;602:			}
;603:		}
LABELV $318
line 605
;604:		else
;605:		{
line 606
;606:			G_Printf("You cant lock the teams in this gameplay\n");
ADDRGP4 $399
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 607
;607:			return;
LABELV $319
line 609
;608:		}
;609:	}
LABELV $317
endproc Svcmd_LockTeam 96 12
export Svcmd_Slap
proc Svcmd_Slap 1048 12
line 611
;610:	void	Svcmd_Slap( void )
;611:	{
line 612
;612:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 614
;613:		char arg1[MAX_STRING_CHARS];
;614:		if (g_gametype.integer == GT_TOURNAMENT || g_gametype.integer == GT_TEAM ||
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $413
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
EQI4 $413
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $413
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
EQI4 $413
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $413
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $401
LABELV $413
line 616
;615:				g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY || 
;616:				g_gametype.integer == GT_JEDIMASTER || g_gametype.integer == GT_HOLOCRON) {
line 617
;617:			G_Printf("Cannot use this admin command in this gametype.\n");
ADDRGP4 $414
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 618
;618:			return;
ADDRGP4 $400
JUMPV
LABELV $401
line 620
;619:		}
;620:		if ( trap_Argc() != 2 )
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $415
line 621
;621:		{
line 622
;622:			G_Printf("Usage: /slap (client)\n");
ADDRGP4 $417
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 623
;623:			return; 
ADDRGP4 $400
JUMPV
LABELV $415
line 625
;624:		}
;625:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 626
;626:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 627
;627:        if (client_id == -1) 
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $418
line 628
;628:        {
line 629
;629:			G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 630
;630:			return;
ADDRGP4 $400
JUMPV
LABELV $418
line 632
;631:        }
;632:        if (client_id == -2) 
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $421
line 633
;633:        {
line 634
;634:			G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 635
;635:			return;
ADDRGP4 $400
JUMPV
LABELV $421
line 637
;636:        }
;637:		if (client_id < 0 || client_id >= MAX_CLIENTS)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $426
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $424
LABELV $426
line 638
;638:		{
line 639
;639:			G_Printf("Bad client ID\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 640
;640:			return;
ADDRGP4 $400
JUMPV
LABELV $424
line 642
;641:		}
;642:        if (!g_entities[client_id].inuse) 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $428
line 643
;643:        {
line 644
;644:			G_Printf("Client is not active\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 645
;645:            return; 
ADDRGP4 $400
JUMPV
LABELV $428
line 647
;646:        }
;647:		if (g_entities[client_id].client->ps.duelInProgress){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $432
line 648
;648:			G_Printf("Client is in a duel\n");
ADDRGP4 $435
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 649
;649:            return;
ADDRGP4 $400
JUMPV
LABELV $432
line 651
;650:		}
;651:		g_entities[client_id].client->ps.forceHandExtend = HANDEXTEND_KNOCKDOWN;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 8
ASGNI4
line 652
;652:		g_entities[client_id].client->ps.forceDodgeAnim = 0;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 0
ASGNI4
line 653
;653:		g_entities[client_id].client->ps.velocity[2] = 600;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1142292480
ASGNF4
line 654
;654:		g_entities[client_id].client->ps.forceHandExtendTime = level.time + 2400;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2400
ADDI4
ASGNI4
line 655
;655:		g_entities[client_id].client->ps.quickerGetup = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1264
ADDP4
CNSTI4 0
ASGNI4
line 656
;656:		trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_slap_saying.string ) );
ADDRGP4 $442
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_slap_saying+16
ARGP4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 657
;657:		trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_slap_saying.string ) ); 
ADDRGP4 $445
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_slap_saying+16
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 658
;658:	}
LABELV $400
endproc Svcmd_Slap 1048 12
export Svcmd_Slay
proc Svcmd_Slay 1072 20
line 660
;659:	void	Svcmd_Slay( void )
;660:	{
line 661
;661:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 663
;662:		char arg1[MAX_STRING_CHARS];
;663:		if (g_gametype.integer == GT_TOURNAMENT || g_gametype.integer == GT_TEAM ||
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $461
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
EQI4 $461
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $461
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
EQI4 $461
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $461
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $449
LABELV $461
line 665
;664:			g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY || 
;665:			g_gametype.integer == GT_JEDIMASTER || g_gametype.integer == GT_HOLOCRON) {
line 666
;666:				G_Printf("Cannot use this admin command in this gametype.\n");
ADDRGP4 $414
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 667
;667:				return;
ADDRGP4 $448
JUMPV
LABELV $449
line 669
;668:		}
;669:		if ( trap_Argc() != 2 )
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $462
line 670
;670:		{
line 671
;671:			G_Printf("Usage: /slay (client)\n");
ADDRGP4 $464
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 672
;672:			return; 
ADDRGP4 $448
JUMPV
LABELV $462
line 674
;673:		}
;674:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 675
;675:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 676
;676:        if (client_id == -1) 
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $465
line 677
;677:        {
line 678
;678:			G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 679
;679:            return;
ADDRGP4 $448
JUMPV
LABELV $465
line 681
;680:        }
;681:        if (client_id == -2) 
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $467
line 682
;682:        {
line 683
;683:			G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 684
;684:            return;
ADDRGP4 $448
JUMPV
LABELV $467
line 686
;685:        }
;686:		if (client_id < 0 || client_id >= MAX_CLIENTS)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $471
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $469
LABELV $471
line 687
;687:		{
line 688
;688:			G_Printf("Bad client ID\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 689
;689:			return;
ADDRGP4 $448
JUMPV
LABELV $469
line 691
;690:		}
;691:        if (!g_entities[client_id].inuse) 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $472
line 692
;692:        {
line 693
;693:			G_Printf("Client is not active\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 694
;694:            return; 
ADDRGP4 $448
JUMPV
LABELV $472
line 696
;695:        }
;696:		if (g_entities[client_id].client->ps.duelInProgress){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $475
line 697
;697:			G_Printf("Client is in a duel\n");
ADDRGP4 $435
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 698
;698:            return;
ADDRGP4 $448
JUMPV
LABELV $475
line 700
;699:		}
;700:		if (client_id >= 0 && client_id < MAX_GENTITIES)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $478
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $478
line 701
;701:			{
line 702
;702:				gentity_t *kEnt = &g_entities[client_id];
ADDRLP4 1044
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 704
;703:
;704:				if (kEnt->inuse && kEnt->client)
ADDRLP4 1044
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $480
ADDRLP4 1044
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $480
line 705
;705:				{
line 706
;706:					g_entities[client_id].flags &= ~FL_GODMODE;
ADDRLP4 1052
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+472
ADDP4
ASGNP4
ADDRLP4 1052
INDIRP4
ADDRLP4 1052
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 707
;707:					g_entities[client_id].client->ps.stats[STAT_HEALTH] = kEnt->health = -999;
ADDRLP4 1056
CNSTI4 -999
ASGNI4
ADDRLP4 1044
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 1056
INDIRI4
ASGNI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 1056
INDIRI4
ASGNI4
line 708
;708:					player_die (kEnt, kEnt, kEnt, 100000, MOD_SUICIDE);
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 35
ARGI4
ADDRGP4 player_die
CALLV
pop
line 709
;709:					G_LogPrintf("Slay admin command executed by SERVER on %s.\n", g_entities[client_id].client->pers.netname);
ADDRGP4 $484
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 710
;710:					trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_slay_saying.string ) );
ADDRGP4 $442
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_slay_saying+16
ARGP4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 711
;711:					trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_slay_saying.string ) ); 
ADDRGP4 $445
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_slay_saying+16
ARGP4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 712
;712:				}
LABELV $480
line 713
;713:			}
LABELV $478
line 714
;714:	}
LABELV $448
endproc Svcmd_Slay 1072 20
export Svcmd_Rename
proc Svcmd_Rename 2072 12
line 716
;715:	void	Svcmd_Rename( void )
;716:	{
line 717
;717:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 720
;718:		char arg1[MAX_STRING_CHARS];
;719:		char arg2[MAX_STRING_CHARS];
;720:		if ( trap_Argc() != 3 )
ADDRLP4 2052
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2052
INDIRI4
CNSTI4 3
EQI4 $491
line 721
;721:		{
line 722
;722:			G_Printf("Usage: /rename (client) (new name)\n");
ADDRGP4 $493
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 723
;723:			return; 
ADDRGP4 $490
JUMPV
LABELV $491
line 725
;724:		}
;725:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 726
;726:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 1028
ARGP4
ADDRLP4 2056
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2056
INDIRI4
ASGNI4
line 727
;727:        if (client_id == -1) 
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $494
line 728
;728:        {
line 729
;729:			G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 730
;730:            return;
ADDRGP4 $490
JUMPV
LABELV $494
line 732
;731:        }
;732:        if (client_id == -2) 
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $496
line 733
;733:        {
line 734
;734:			G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 735
;735:            return;
ADDRGP4 $490
JUMPV
LABELV $496
line 737
;736:        }
;737:		if (client_id < 0 || client_id >= MAX_CLIENTS)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $500
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $498
LABELV $500
line 738
;738:		{
line 739
;739:			G_Printf("Bad client ID\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 740
;740:			return;
ADDRGP4 $490
JUMPV
LABELV $498
line 742
;741:		}
;742:        if (!g_entities[client_id].inuse) 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $501
line 743
;743:        {
line 744
;744:			G_Printf("Client is not active\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 745
;745:            return; 
ADDRGP4 $490
JUMPV
LABELV $501
line 747
;746:        }
;747:		trap_Argv( 2, arg2, sizeof( arg2 ) );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 748
;748:		uwRename(&g_entities[client_id], arg2);
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 uwRename
CALLV
pop
line 749
;749:		trap_SendServerCommand( client_id, va("cp \"^7You've been renamed to\n^7%s\n\"", arg2) );
ADDRGP4 $504
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2064
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 750
;750:		trap_SendServerCommand( -1, va("print \"%s ^7has been renamed by an admin.\n\"", g_entities[client_id].client->pers.netname ) ); 
ADDRGP4 $505
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 2068
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 751
;751:	}
LABELV $490
endproc Svcmd_Rename 2072 12
export Svcmd_Silence
proc Svcmd_Silence 1048 12
line 753
;752:	void	Svcmd_Silence( void )
;753:	{
line 754
;754:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 756
;755:		char arg1[MAX_STRING_CHARS];
;756:		if ( trap_Argc() != 2 )
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $508
line 757
;757:		{
line 758
;758:			G_Printf("Usage: /silence (client)\n");
ADDRGP4 $510
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 759
;759:			return; 
ADDRGP4 $507
JUMPV
LABELV $508
line 761
;760:		}
;761:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 762
;762:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 763
;763:        if (client_id == -1) 
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $511
line 764
;764:        {
line 765
;765:			G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 766
;766:            return;
ADDRGP4 $507
JUMPV
LABELV $511
line 768
;767:        }
;768:        if (client_id == -2) 
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $513
line 769
;769:        {
line 770
;770:			G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 771
;771:            return;
ADDRGP4 $507
JUMPV
LABELV $513
line 773
;772:        }
;773:		if (client_id < 0 || client_id >= MAX_CLIENTS)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $517
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $515
LABELV $517
line 774
;774:		{
line 775
;775:			G_Printf("Bad client ID\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 776
;776:			return;
ADDRGP4 $507
JUMPV
LABELV $515
line 778
;777:		}
;778:        if (!g_entities[client_id].inuse) 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $518
line 779
;779:        {
line 780
;780:			G_Printf("Client is not active\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 781
;781:            return; 
ADDRGP4 $507
JUMPV
LABELV $518
line 783
;782:        }
;783:		if (g_entities[client_id].client->ps.duelInProgress){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $521
line 784
;784:			G_Printf("Client is in a duel\n");
ADDRGP4 $435
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 785
;785:            return;
ADDRGP4 $507
JUMPV
LABELV $521
line 787
;786:		}
;787:		if (g_entities[client_id].client->pers.ampunish == qtrue){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
CNSTI4 1
NEI4 $524
line 788
;788:			G_Printf("Client is currently being punished\n");
ADDRGP4 $527
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 789
;789:            return;
ADDRGP4 $507
JUMPV
LABELV $524
line 791
;790:		}
;791:		if (g_entities[client_id].client->pers.amsilence == qtrue){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
CNSTI4 1
NEI4 $528
line 792
;792:			g_entities[client_id].client->pers.amsilence = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 0
ASGNI4
line 793
;793:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_silence_off_saying.string ) );
ADDRGP4 $442
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_silence_off_saying+16
ARGP4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 794
;794:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_silence_off_saying.string ) ); 
ADDRGP4 $445
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_silence_off_saying+16
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 795
;795:		} else {
ADDRGP4 $529
JUMPV
LABELV $528
line 796
;796:			g_entities[client_id].client->pers.amsilence = qtrue;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 1
ASGNI4
line 797
;797:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_silence_on_saying.string ) );
ADDRGP4 $442
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_silence_on_saying+16
ARGP4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 798
;798:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_silence_on_saying.string ) ); 
ADDRGP4 $445
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_silence_on_saying+16
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 799
;799:		}
LABELV $529
line 800
;800:	}
LABELV $507
endproc Svcmd_Silence 1048 12
export Svcmd_Punish
proc Svcmd_Punish 1056 12
line 802
;801:	void	Svcmd_Punish( void )
;802:	{
line 803
;803:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 805
;804:		char arg1[MAX_STRING_CHARS];
;805:		if ( trap_Argc() != 2 )
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $542
line 806
;806:		{
line 807
;807:			G_Printf("Usage: /punish (client)\n");
ADDRGP4 $544
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 808
;808:			return; 
ADDRGP4 $541
JUMPV
LABELV $542
line 810
;809:		}
;810:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 811
;811:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 812
;812:        if (client_id == -1) 
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $545
line 813
;813:        {
line 814
;814:			G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 815
;815:            return;
ADDRGP4 $541
JUMPV
LABELV $545
line 817
;816:        }
;817:        if (client_id == -2) 
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $547
line 818
;818:        {
line 819
;819:			G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 820
;820:            return;
ADDRGP4 $541
JUMPV
LABELV $547
line 822
;821:        }
;822:		if (client_id < 0 || client_id >= MAX_CLIENTS)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $551
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $549
LABELV $551
line 823
;823:		{
line 824
;824:			G_Printf("Bad client ID\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 825
;825:			return;
ADDRGP4 $541
JUMPV
LABELV $549
line 827
;826:		}
;827:        if (!g_entities[client_id].inuse) 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $552
line 828
;828:        {
line 829
;829:			G_Printf("Client is not active\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 830
;830:            return; 
ADDRGP4 $541
JUMPV
LABELV $552
line 832
;831:        }
;832:		if (g_entities[client_id].client->ps.duelInProgress){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $555
line 833
;833:			G_Printf("Client is in a duel\n");
ADDRGP4 $435
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 834
;834:            return;
ADDRGP4 $541
JUMPV
LABELV $555
line 837
;835:		}
;836:		//REMOVE
;837:		if (g_entities[client_id].client->pers.ampunish == qtrue){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
CNSTI4 1
NEI4 $558
line 838
;838:			g_entities[client_id].client->pers.ampunish = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 0
ASGNI4
line 839
;839:			g_entities[client_id].client->ps.pm_type &= ~PM_FLOAT;
ADDRLP4 1040
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 1040
INDIRP4
ADDRLP4 1040
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 840
;840:			g_entities[client_id].flags &= ~FL_GODMODE;
ADDRLP4 1044
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+472
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
ADDRLP4 1044
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 841
;841:			g_entities[client_id].client->ps.weaponTime = 0;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 842
;842:			g_entities[client_id].client->ps.forceRestricted = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 0
ASGNI4
line 843
;843:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_punish_off_saying.string ) );
ADDRGP4 $442
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_punish_off_saying+16
ARGP4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 844
;844:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_punish_off_saying.string ) ); 
ADDRGP4 $445
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_punish_off_saying+16
ARGP4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 846
;845:		//APPLY
;846:		} else {
ADDRGP4 $559
JUMPV
LABELV $558
line 847
;847:			g_entities[client_id].client->pers.ampunish = qtrue;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 1
ASGNI4
line 848
;848:			g_entities[client_id].client->pers.amsilence = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 0
ASGNI4
line 849
;849:			g_entities[client_id].flags |= FL_GODMODE;
ADDRLP4 1040
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+472
ADDP4
ASGNP4
ADDRLP4 1040
INDIRP4
ADDRLP4 1040
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 850
;850:			g_entities[client_id].client->ps.forceRestricted = qtrue;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 1
ASGNI4
line 851
;851:			g_entities[client_id].client->ps.saberHolstered = qtrue;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
CNSTI4 1
ASGNI4
line 852
;852:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_punish_on_saying.string ) );
ADDRGP4 $442
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_punish_on_saying+16
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 853
;853:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_punish_on_saying.string ) ); 
ADDRGP4 $445
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_punish_on_saying+16
ARGP4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 854
;854:		}
LABELV $559
line 855
;855:	}
LABELV $541
endproc Svcmd_Punish 1056 12
export Svcmd_CSprint
proc Svcmd_CSprint 2084 12
line 858
;856:	char	*ConcatArgs( int start );
;857:	void	Svcmd_CSprint( void )
;858:	{
line 859
;859:		int client_id = -1;
ADDRLP4 1032
CNSTI4 -1
ASGNI4
line 861
;860:		char arg[MAX_STRING_CHARS];
;861:		int pos = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 863
;862:		char real_msg[MAX_STRING_CHARS];
;863:		char *msg = ConcatArgs(2); 
CNSTI4 2
ARGI4
ADDRLP4 2060
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2060
INDIRP4
ASGNP4
ADDRGP4 $581
JUMPV
LABELV $580
line 864
;864:		while(*msg) { 
line 865
;865:			if(msg[0] == '\\' && msg[1] == 'n') { 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $583
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 110
NEI4 $583
line 866
;866:				msg++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 867
;867:				real_msg[pos++] = '\n'; 
ADDRLP4 2068
ADDRLP4 1028
INDIRI4
ASGNI4
ADDRLP4 1028
ADDRLP4 2068
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 2068
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 10
ASGNI1
line 868
;868:			} else { 
ADDRGP4 $584
JUMPV
LABELV $583
line 869
;869:				real_msg[pos++] = *msg;
ADDRLP4 2068
ADDRLP4 1028
INDIRI4
ASGNI4
ADDRLP4 1028
ADDRLP4 2068
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 2068
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 870
;870:			} 
LABELV $584
line 871
;871:				msg++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 872
;872:		}
LABELV $581
line 864
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $580
line 873
;873:		real_msg[pos] = 0;
ADDRLP4 1028
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 874
;874:		trap_Argv(1, arg, sizeof(arg));
CNSTI4 1
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 875
;875:		if(Q_stricmp(arg, "all") == 0)
ADDRLP4 1036
ARGP4
ADDRGP4 $587
ARGP4
ADDRLP4 2064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $585
line 876
;876:		{
line 877
;877:			trap_SendServerCommand( -1, va("cp \"%s\"", real_msg) );
ADDRGP4 $588
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2068
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 878
;878:			return;
ADDRGP4 $579
JUMPV
LABELV $585
line 880
;879:		}
;880:		client_id = G_ClientNumberFromArg( arg );
ADDRLP4 1036
ARGP4
ADDRLP4 2068
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 2068
INDIRI4
ASGNI4
line 881
;881:		if ( trap_Argc() <= 2 )
ADDRLP4 2072
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 2
GTI4 $589
line 882
;882:		{ 
line 883
;883:			G_Printf ( "Usage: ^3/csprint (client) (message)\n/csprint all (message)\n", arg ); 
ADDRGP4 $591
ARGP4
ADDRLP4 1036
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 884
;884:			return; 
ADDRGP4 $579
JUMPV
LABELV $589
line 886
;885:		}
;886:		if (client_id == -1) 
ADDRLP4 1032
INDIRI4
CNSTI4 -1
NEI4 $592
line 887
;887:        { 
line 888
;888:           G_Printf ( "Can't find client ID for %s\n", arg ); 
ADDRGP4 $594
ARGP4
ADDRLP4 1036
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 889
;889:           return; 
ADDRGP4 $579
JUMPV
LABELV $592
line 891
;890:        } 
;891:        if (client_id == -2) 
ADDRLP4 1032
INDIRI4
CNSTI4 -2
NEI4 $595
line 892
;892:        { 
line 893
;893:           G_Printf ( "Ambiguous client ID for %s\n", arg ); 
ADDRGP4 $597
ARGP4
ADDRLP4 1036
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 894
;894:           return; 
ADDRGP4 $579
JUMPV
LABELV $595
line 896
;895:        }
;896:		if (client_id < 0 || client_id >= MAX_CLIENTS)
ADDRLP4 1032
INDIRI4
CNSTI4 0
LTI4 $600
ADDRLP4 1032
INDIRI4
CNSTI4 32
LTI4 $598
LABELV $600
line 897
;897:		{
line 898
;898:			G_Printf("Bad client ID\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 899
;899:			return;
ADDRGP4 $579
JUMPV
LABELV $598
line 901
;900:		}
;901:        if (!g_entities[client_id].inuse) 
CNSTI4 852
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $601
line 902
;902:        {
line 903
;903:           G_Printf ( "Client %s is not active\n", arg ); 
ADDRGP4 $604
ARGP4
ADDRLP4 1036
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 904
;904:           return; 
ADDRGP4 $579
JUMPV
LABELV $601
line 906
;905:        }
;906:		trap_SendServerCommand(client_id, va("cp \"%s\"", real_msg) );
ADDRGP4 $588
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2080
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRLP4 2080
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 907
;907:	}
LABELV $579
endproc Svcmd_CSprint 2084 12
export Svcmd_ChangeMode
proc Svcmd_ChangeMode 1068 12
line 909
;908:	void	Svcmd_ChangeMode( void )
;909:	{
line 913
;910:		int i;
;911:		char arg[MAX_STRING_CHARS];
;912:		gentity_t * targetplayer;
;913:		trap_Argv(1, arg, sizeof(arg));
CNSTI4 1
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 914
;914:		if ( trap_Argc() < 2 )
ADDRLP4 1032
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 2
GEI4 $606
line 915
;915:		{ 
line 916
;916:			G_Printf("Usage: /changemode (mode)\nmodes = clanmatch clanmeeting\n");
ADDRGP4 $608
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 917
;917:			return; 
ADDRGP4 $605
JUMPV
LABELV $606
line 919
;918:		}
;919:		if ( !Q_stricmp( arg, "clanmeeting" ) || !Q_stricmp( arg, "meeting" ) ) {
ADDRLP4 8
ARGP4
ADDRGP4 $611
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $613
ADDRLP4 8
ARGP4
ADDRGP4 $612
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $609
LABELV $613
line 920
;920:			if ( g_gametype.integer != GT_FFA ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $614
line 921
;921:				G_Printf("ClanMeeting mode can only be used during FFA gametype.\n");
ADDRGP4 $617
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 922
;922:				return;
ADDRGP4 $605
JUMPV
LABELV $614
line 924
;923:			}
;924:			if ((level.matchMode == qfalse) && (level.meetingMode == qfalse)){
ADDRLP4 1044
CNSTI4 0
ASGNI4
ADDRGP4 level+9116
INDIRI4
ADDRLP4 1044
INDIRI4
NEI4 $618
ADDRGP4 level+9112
INDIRI4
ADDRLP4 1044
INDIRI4
NEI4 $618
line 925
;925:				level.meetingMode = qtrue;
ADDRGP4 level+9112
CNSTI4 1
ASGNI4
line 926
;926:				G_LogPrintf("ChangeMode admin command executed by SERVER. (START: ClanMeeting)\n");
ADDRGP4 $623
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 927
;927:				trap_SendServerCommand( -1, va("cp \"^7A ^3clan meeting^7 has begun!\n\""));
ADDRGP4 $624
ARGP4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 928
;928:				trap_SendServerCommand( -1, va("print \"^7A ^3clan meeting^7 has begun!\n\""));
ADDRGP4 $625
ARGP4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 929
;929:			} else if (level.meetingMode == qtrue) {
ADDRGP4 $610
JUMPV
LABELV $618
ADDRGP4 level+9112
INDIRI4
CNSTI4 1
NEI4 $626
line 930
;930:				level.meetingMode = qfalse;
ADDRGP4 level+9112
CNSTI4 0
ASGNI4
line 931
;931:				for( i = 0; i < level.maxclients; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $633
JUMPV
LABELV $630
line 932
;932:					{
line 933
;933:						targetplayer = &g_entities[i];
ADDRLP4 0
CNSTI4 852
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 934
;934:						if( targetplayer->client && targetplayer->client->pers.connected ){
ADDRLP4 1048
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1048
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $635
ADDRLP4 1048
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
EQI4 $635
line 935
;935:							targetplayer->client->ps.forceRestricted = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 0
ASGNI4
line 936
;936:						}
LABELV $635
line 937
;937:					}
LABELV $631
line 931
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $633
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $630
line 938
;938:				trap_SendServerCommand( -1, va("cp \"^7The ^1clan meeting^7 has stopped!\n\""));
ADDRGP4 $637
ARGP4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 939
;939:				trap_SendServerCommand( -1, va("print \"^7The ^1clan meeting^7 has stopped!\n\""));
ADDRGP4 $638
ARGP4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 940
;940:			} else {
ADDRGP4 $610
JUMPV
LABELV $626
line 941
;941:				G_Printf("A mode is already enabled\n");
ADDRGP4 $639
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 942
;942:				return;
ADDRGP4 $605
JUMPV
line 944
;943:			}
;944:		}
LABELV $609
line 945
;945:	else if ( !Q_stricmp( arg, "clanmatch" ) || !Q_stricmp( arg, "match" ) ) {
ADDRLP4 8
ARGP4
ADDRGP4 $642
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $644
ADDRLP4 8
ARGP4
ADDRGP4 $643
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $640
LABELV $644
line 946
;946:			if ( g_gametype.integer != GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
EQI4 $645
line 947
;947:				G_Printf("ClanMatch mode can only be used during TFFA gametype.\n");
ADDRGP4 $648
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 948
;948:				return;
ADDRGP4 $605
JUMPV
LABELV $645
line 950
;949:			}
;950:			if ((level.matchMode == qfalse) && (level.meetingMode == qfalse)){
ADDRLP4 1052
CNSTI4 0
ASGNI4
ADDRGP4 level+9116
INDIRI4
ADDRLP4 1052
INDIRI4
NEI4 $649
ADDRGP4 level+9112
INDIRI4
ADDRLP4 1052
INDIRI4
NEI4 $649
line 951
;951:				level.matchMode = qtrue;
ADDRGP4 level+9116
CNSTI4 1
ASGNI4
line 952
;952:				G_LogPrintf("ChangeMode admin command executed by SERVER. (START: ClanMatch)\n");
ADDRGP4 $654
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 953
;953:				trap_SendServerCommand( -1, va("cp \"^7A ^3clan match^7 has begun!\n\""));
ADDRGP4 $655
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 954
;954:				trap_SendServerCommand( -1, va("print \"^7A ^3clan match^7 has begun!\n\""));
ADDRGP4 $656
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 955
;955:			} else if (level.matchMode == qtrue) {
ADDRGP4 $650
JUMPV
LABELV $649
ADDRGP4 level+9116
INDIRI4
CNSTI4 1
NEI4 $657
line 956
;956:				level.matchMode = qfalse;
ADDRGP4 level+9116
CNSTI4 0
ASGNI4
line 957
;957:				for( i = 0; i < level.maxclients; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $664
JUMPV
LABELV $661
line 958
;958:					{
line 959
;959:						targetplayer = &g_entities[i];
ADDRLP4 0
CNSTI4 852
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 960
;960:						if( targetplayer->client && targetplayer->client->pers.connected && targetplayer->r.svFlags & SVF_BOT ){
ADDRLP4 1060
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1060
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $666
ADDRLP4 1064
CNSTI4 0
ASGNI4
ADDRLP4 1060
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
ADDRLP4 1064
INDIRI4
EQI4 $666
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 1064
INDIRI4
EQI4 $666
line 961
;961:								SetTeam(targetplayer, "free" );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $380
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 962
;962:						}
LABELV $666
line 963
;963:					}
LABELV $662
line 957
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $664
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $661
line 964
;964:				trap_SendServerCommand( -1, va("cp \"^7The ^1clan match^7 has stopped!\n\""));
ADDRGP4 $668
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 965
;965:				trap_SendServerCommand( -1, va("print \"^7The ^1clan match^7 has stopped!\n\""));
ADDRGP4 $669
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 966
;966:			}
ADDRGP4 $658
JUMPV
LABELV $657
line 967
;967:			else {
line 968
;968:				G_Printf("A mode is already enabled\n");
ADDRGP4 $639
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 969
;969:				return;
LABELV $658
LABELV $650
line 971
;970:			}
;971:		}
LABELV $640
LABELV $610
line 972
;972:	}
LABELV $605
endproc Svcmd_ChangeMode 1068 12
export Svcmd_Sleep
proc Svcmd_Sleep 1052 12
line 974
;973:	void	Svcmd_Sleep( void )
;974:	{
line 975
;975:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 977
;976:		char arg1[MAX_STRING_CHARS];
;977:		if ( trap_Argc() != 2 )
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $671
line 978
;978:		{
line 979
;979:			G_Printf("Usage: /sleep (client)\n");
ADDRGP4 $673
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 980
;980:			return; 
ADDRGP4 $670
JUMPV
LABELV $671
line 982
;981:		}
;982:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 983
;983:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 984
;984:        if (client_id == -1) 
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $674
line 985
;985:        {
line 986
;986:			G_Printf("Can't find client\n");
ADDRGP4 $676
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 987
;987:            return;
ADDRGP4 $670
JUMPV
LABELV $674
line 989
;988:        }
;989:        if (client_id == -2) 
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $677
line 990
;990:        {
line 991
;991:			G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 992
;992:            return;
ADDRGP4 $670
JUMPV
LABELV $677
line 994
;993:        }
;994:		if (client_id < 0 || client_id >= MAX_CLIENTS)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $681
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $679
LABELV $681
line 995
;995:		{
line 996
;996:			G_Printf("Bad client ID\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 997
;997:			return;
ADDRGP4 $670
JUMPV
LABELV $679
line 999
;998:		}
;999:        if (!g_entities[client_id].inuse) 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $682
line 1000
;1000:        {
line 1001
;1001:			G_Printf("Client is not active\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1002
;1002:            return; 
ADDRGP4 $670
JUMPV
LABELV $682
line 1004
;1003:        }
;1004:		if (g_entities[client_id].client->ps.duelInProgress){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $685
line 1005
;1005:			G_Printf("Client is in a duel\n");
ADDRGP4 $435
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1006
;1006:            return;
ADDRGP4 $670
JUMPV
LABELV $685
line 1009
;1007:		}
;1008:		//REMOVE
;1009:		if (g_entities[client_id].client->pers.amsleep == qtrue){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
CNSTI4 1
NEI4 $688
line 1010
;1010:			g_entities[client_id].client->pers.amsleep = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
CNSTI4 0
ASGNI4
line 1011
;1011:			g_entities[client_id].client->ps.forceHandExtendTime = 100;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
CNSTI4 100
ASGNI4
line 1012
;1012:			g_entities[client_id].flags &= ~FL_GODMODE;
ADDRLP4 1040
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+472
ADDP4
ASGNP4
ADDRLP4 1040
INDIRP4
ADDRLP4 1040
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 1013
;1013:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_sleep_off_saying.string ) );
ADDRGP4 $442
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_sleep_off_saying+16
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1014
;1014:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_sleep_off_saying.string ) ); 
ADDRGP4 $445
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_sleep_off_saying+16
ARGP4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1016
;1015:		//APPLY
;1016:		} else {
ADDRGP4 $689
JUMPV
LABELV $688
line 1017
;1017:			g_entities[client_id].client->pers.amsleep = qtrue;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
CNSTI4 1
ASGNI4
line 1018
;1018:			g_entities[client_id].client->ps.forceHandExtend = HANDEXTEND_KNOCKDOWN;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 8
ASGNI4
line 1019
;1019:			g_entities[client_id].client->ps.forceDodgeAnim = 0;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 0
ASGNI4
line 1020
;1020:			g_entities[client_id].client->ps.forceHandExtendTime = Q3_INFINITE;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
CNSTI4 16777216
ASGNI4
line 1021
;1021:			g_entities[client_id].client->ps.quickerGetup = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1264
ADDP4
CNSTI4 0
ASGNI4
line 1022
;1022:			g_entities[client_id].client->ps.saberHolstered = qtrue;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
CNSTI4 1
ASGNI4
line 1023
;1023:			g_entities[client_id].flags |= FL_GODMODE;
ADDRLP4 1040
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+472
ADDP4
ASGNP4
ADDRLP4 1040
INDIRP4
ADDRLP4 1040
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1024
;1024:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_sleep_on_saying.string ) );
ADDRGP4 $442
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_sleep_on_saying+16
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1025
;1025:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_sleep_on_saying.string ) ); 
ADDRGP4 $445
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_sleep_on_saying+16
ARGP4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1026
;1026:		}
LABELV $689
line 1027
;1027:	}
LABELV $670
endproc Svcmd_Sleep 1052 12
export Svcmd_Empower
proc Svcmd_Empower 1084 20
line 1029
;1028:	void	Svcmd_Empower( void )
;1029:	{
line 1032
;1030:		int f, i;
;1031:		vec3_t v;
;1032:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 1034
;1033:		char arg1[MAX_STRING_CHARS];
;1034:		if (g_gametype.integer == GT_TOURNAMENT || g_gametype.integer == GT_TEAM ||
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $722
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
EQI4 $722
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $722
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
EQI4 $722
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $722
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $710
LABELV $722
line 1036
;1035:			g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY || 
;1036:			g_gametype.integer == GT_JEDIMASTER || g_gametype.integer == GT_HOLOCRON) {
line 1037
;1037:				G_Printf("Cannot use this admin command in this gametype.\n");
ADDRGP4 $414
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1038
;1038:				return;
ADDRGP4 $709
JUMPV
LABELV $710
line 1040
;1039:		}
;1040:		if ( trap_Argc() > 2 )
ADDRLP4 1048
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 2
LEI4 $723
line 1041
;1041:		{ 
line 1042
;1042:			G_Printf("Usage: /empower (client)\n");
ADDRGP4 $725
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1043
;1043:			return; 
ADDRGP4 $709
JUMPV
LABELV $723
line 1045
;1044:		}
;1045:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1046
;1046:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 12
ARGP4
ADDRLP4 1052
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1052
INDIRI4
ASGNI4
line 1047
;1047:        if (client_id == -1) 
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $726
line 1048
;1048:        {
line 1049
;1049:			G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1050
;1050:            return;
ADDRGP4 $709
JUMPV
LABELV $726
line 1052
;1051:        }
;1052:        if (client_id == -2) 
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $728
line 1053
;1053:        {
line 1054
;1054:			G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1055
;1055:            return;
ADDRGP4 $709
JUMPV
LABELV $728
line 1057
;1056:        }
;1057:		if (client_id < 0 || client_id >= MAX_CLIENTS)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $732
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $730
LABELV $732
line 1058
;1058:		{
line 1059
;1059:			G_Printf("Bad client ID\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1060
;1060:			return;
ADDRGP4 $709
JUMPV
LABELV $730
line 1062
;1061:		}
;1062:        if (!g_entities[client_id].inuse) 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $733
line 1063
;1063:        {
line 1064
;1064:			G_Printf("Client is not active\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1065
;1065:            return; 
ADDRGP4 $709
JUMPV
LABELV $733
line 1067
;1066:        }
;1067:		if (g_entities[client_id].client->ps.duelInProgress){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $736
line 1068
;1068:			G_Printf("Client is in a duel\n");
ADDRGP4 $435
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1069
;1069:            return;
ADDRGP4 $709
JUMPV
LABELV $736
line 1072
;1070:		}
;1071:		//REMOVE
;1072:		if (g_entities[client_id].client->pers.amempower == qtrue)
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $739
line 1073
;1073:		{
line 1074
;1074:			g_entities[client_id].client->ps.isJediMaster = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 0
ASGNI4
line 1075
;1075:			g_entities[client_id].client->pers.amempower = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
CNSTI4 0
ASGNI4
line 1076
;1076:			for( f = 0; f < NUM_FORCE_POWERS; f ++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $744
line 1077
;1077:				g_entities[client_id].client->ps.fd.forcePowerLevel[f] = g_entities[client_id].client->pers.forcePowerLevelSaved[f];
ADDRLP4 1060
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1064
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1060
INDIRI4
ADDRLP4 1064
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
ADDRLP4 1060
INDIRI4
ADDRLP4 1064
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1560
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1078
;1078:			}
LABELV $745
line 1076
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 18
LTI4 $744
line 1079
;1079:			g_entities[client_id].client->ps.fd.forcePowersKnown = g_entities[client_id].client->pers.forcePowersKnownSaved;
ADDRLP4 1060
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1060
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ADDRLP4 1060
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
ASGNI4
line 1080
;1080:			G_LogPrintf("Empower admin command executed by SERVER on %s. (removing)\n", g_entities[client_id].client->pers.netname);
ADDRGP4 $752
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1081
;1081:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_empower_off_saying.string ) );
ADDRGP4 $442
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_empower_off_saying+16
ARGP4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1082
;1082:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_empower_off_saying.string ) );
ADDRGP4 $445
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_empower_off_saying+16
ARGP4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1083
;1083:		}
ADDRGP4 $740
JUMPV
LABELV $739
line 1085
;1084:		//APPLY
;1085:		else {
line 1086
;1086:			G_PlayEffect(EFFECT_SMOKE, g_entities[client_id].r.currentOrigin, v);
CNSTI4 1
ARGI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+72
ADDP4
ARGP4
ADDRLP4 1036
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 1087
;1087:			G_ScreenShake(g_entities[client_id].client->ps.origin, NULL, 10.0f, 800, qtrue);
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTF4 1092616192
ARGF4
CNSTI4 800
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_ScreenShake
CALLP4
pop
line 1088
;1088:			G_LogPrintf("Empower admin command executed by SERVER on %s. (applying)\n", g_entities[client_id].client->pers.netname);
ADDRGP4 $761
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1089
;1089:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_empower_on_saying.string ) );
ADDRGP4 $442
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_empower_on_saying+16
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1090
;1090:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_empower_on_saying.string ) ); 
ADDRGP4 $445
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_empower_on_saying+16
ARGP4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1091
;1091:			g_entities[client_id].client->pers.amempower = qtrue;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
CNSTI4 1
ASGNI4
line 1092
;1092:			g_entities[client_id].client->ps.isJediMaster = qtrue;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 1
ASGNI4
line 1093
;1093:			for( f = 0; f < NUM_FORCE_POWERS; f ++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $769
line 1094
;1094:				g_entities[client_id].client->pers.forcePowerLevelSaved[f] = g_entities[client_id].client->ps.fd.forcePowerLevel[f];
ADDRLP4 1068
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1072
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1068
INDIRI4
ADDRLP4 1072
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1560
ADDP4
ADDP4
ADDRLP4 1068
INDIRI4
ADDRLP4 1072
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1095
;1095:				g_entities[client_id].client->ps.fd.forcePowerLevel[f] = FORCE_LEVEL_3;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 3
ASGNI4
line 1096
;1096:			}
LABELV $770
line 1093
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 18
LTI4 $769
line 1097
;1097:			g_entities[client_id].client->pers.forcePowersKnownSaved = g_entities[client_id].client->ps.fd.forcePowersKnown;
ADDRLP4 1068
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1068
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
ADDRLP4 1068
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
ASGNI4
line 1098
;1098:			if ( g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $778
line 1099
;1099:				g_entities[client_id].client->ps.fd.forcePowersKnown = ( 1 << FP_HEAL | 1 << FP_SPEED | 1 << FP_PUSH | 1 << FP_PULL | 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
CNSTI4 32765
ASGNI4
line 1103
;1100:												1 << FP_TELEPATHY | 1 << FP_GRIP | 1 << FP_LIGHTNING | 1 << FP_RAGE | 
;1101:												1 << FP_PROTECT | 1 << FP_ABSORB | 1 << FP_TEAM_HEAL | 1 << FP_TEAM_FORCE | 
;1102:												1 << FP_DRAIN | 1 << FP_SEE);
;1103:			}
ADDRGP4 $779
JUMPV
LABELV $778
line 1104
;1104:			else{
line 1105
;1105:				g_entities[client_id].client->ps.fd.forcePowersKnown = ( 1 << FP_HEAL | 1 << FP_SPEED | 1 << FP_PUSH | 1 << FP_PULL | 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
CNSTI4 26621
ASGNI4
line 1108
;1106:												1 << FP_TELEPATHY | 1 << FP_GRIP | 1 << FP_LIGHTNING | 1 << FP_RAGE | 
;1107:												1 << FP_PROTECT | 1 << FP_ABSORB | 1 << FP_DRAIN | 1 << FP_SEE);
;1108:			}
LABELV $779
line 1109
;1109:			for( i = 0; i < NUM_FORCE_POWERS; i ++ ){
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $783
line 1110
;1110:				g_entities[client_id].client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_3;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 3
ASGNI4
line 1111
;1111:			}
LABELV $784
line 1109
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 18
LTI4 $783
line 1113
;1112:			//REMOVE TERMINATOR
;1113:			if (g_entities[client_id].client->pers.amterminator == qtrue)
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 1
NEI4 $788
line 1114
;1114:			{
line 1115
;1115:				for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $791
line 1116
;1116:					g_entities[client_id].client->ps.ammo[i] = 0;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 408
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 1117
;1117:				}
LABELV $792
line 1115
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 16
LTI4 $791
line 1118
;1118:				g_entities[client_id].client->pers.amterminator = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
CNSTI4 0
ASGNI4
line 1119
;1119:				g_entities[client_id].client->ps.weapon = WP_SABER;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 1120
;1120:				g_entities[client_id].client->ps.forceRestricted = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 0
ASGNI4
line 1121
;1121:				g_entities[client_id].client->ps.stats[STAT_WEAPONS] &= ~(1 << WP_STUN_BATON) & ~(1 << WP_BLASTER) & ~(1 << WP_DISRUPTOR)
ADDRLP4 1072
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 1072
INDIRP4
ADDRLP4 1072
INDIRP4
INDIRI4
CNSTI4 -16371
BANDI4
ASGNI4
line 1124
;1122:					 & ~(1 << WP_BOWCASTER) & ~(1 << WP_REPEATER) & ~(1 << WP_DEMP2) & ~(1 << WP_FLECHETTE) & ~(1 << WP_ROCKET_LAUNCHER) & ~(1 << WP_THERMAL)
;1123:					 & ~(1 << WP_TRIP_MINE) & ~(1 << WP_DET_PACK);
;1124:				g_entities[client_id].client->ps.stats[STAT_HOLDABLE_ITEMS] &= ~(1 << HI_BINOCULARS) & ~(1 << HI_SEEKER) & ~(1 << HI_MEDPAC) & ~(1 << HI_SHIELD) & ~(1 << HI_SENTRY_GUN);
ADDRLP4 1076
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 1076
INDIRP4
ADDRLP4 1076
INDIRP4
INDIRI4
CNSTI4 -111
BANDI4
ASGNI4
line 1125
;1125:				if (!(g_weaponDisable.integer & (1 << WP_BRYAR_PISTOL))) {
ADDRGP4 g_weaponDisable+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $801
line 1126
;1126:					g_entities[client_id].client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BRYAR_PISTOL );
ADDRLP4 1080
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 1080
INDIRP4
ADDRLP4 1080
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1127
;1127:				} else {
ADDRGP4 $802
JUMPV
LABELV $801
line 1128
;1128:					g_entities[client_id].client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_BRYAR_PISTOL );
ADDRLP4 1080
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 1080
INDIRP4
ADDRLP4 1080
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 1129
;1129:				}
LABELV $802
line 1130
;1130:			}
LABELV $788
line 1131
;1131:		}
LABELV $740
line 1132
;1132:	}
LABELV $709
endproc Svcmd_Empower 1084 20
export Svcmd_Who
proc Svcmd_Who 12 16
line 1134
;1133:	void	Svcmd_Who( void ) 
;1134:    {
line 1136
;1135:		int i;
;1136:		for(i = 0; i < level.maxclients; i++) { 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $810
JUMPV
LABELV $807
line 1137
;1137:			if(g_entities[i].client->pers.connected == CON_CONNECTED) {
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $812
line 1138
;1138:				G_Printf("IP:%s #:%i CLIENT:%s", g_entities[i].client->sess.IPstring, i, g_entities[i].client->pers.netname);
ADDRGP4 $815
ARGP4
ADDRLP4 8
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1688
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1139
;1139:			}
LABELV $812
line 1140
;1140:		}
LABELV $808
line 1136
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $810
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $807
line 1141
;1141:	}
LABELV $806
endproc Svcmd_Who 12 16
export Svcmd_Terminator
proc Svcmd_Terminator 1092 20
line 1143
;1142:	void	Svcmd_Terminator( void )
;1143:	{
line 1146
;1144:		int i, f;
;1145:		vec3_t v;
;1146:		int	num = 999;
ADDRLP4 12
CNSTI4 999
ASGNI4
line 1147
;1147:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 1149
;1148:		char arg1[MAX_STRING_CHARS];
;1149:		if (g_gametype.integer == GT_TOURNAMENT || g_gametype.integer == GT_TEAM ||
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $831
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
EQI4 $831
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $831
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
EQI4 $831
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $831
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $819
LABELV $831
line 1151
;1150:			g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY || 
;1151:			g_gametype.integer == GT_JEDIMASTER || g_gametype.integer == GT_HOLOCRON) {
line 1152
;1152:				G_Printf("Cannot use this admin command in this gametype.\n");
ADDRGP4 $414
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1153
;1153:				return;
ADDRGP4 $818
JUMPV
LABELV $819
line 1155
;1154:		}
;1155:		if ( trap_Argc() > 2 )
ADDRLP4 1052
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 2
LEI4 $832
line 1156
;1156:		{
line 1157
;1157:			G_Printf("Usage: /terminator (client)\n");
ADDRGP4 $834
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1158
;1158:			return; 
ADDRGP4 $818
JUMPV
LABELV $832
line 1160
;1159:		}
;1160:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1161
;1161:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 16
ARGP4
ADDRLP4 1056
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1056
INDIRI4
ASGNI4
line 1162
;1162:        if (client_id == -1) 
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $835
line 1163
;1163:        {
line 1164
;1164:			G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1165
;1165:            return;
ADDRGP4 $818
JUMPV
LABELV $835
line 1167
;1166:        }
;1167:        if (client_id == -2) 
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $837
line 1168
;1168:        {
line 1169
;1169:			G_Printf("Ambiguous client\n");
ADDRGP4 $839
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1170
;1170:            return;
ADDRGP4 $818
JUMPV
LABELV $837
line 1172
;1171:        }
;1172:		if (client_id < 0 || client_id >= MAX_CLIENTS)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $842
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $840
LABELV $842
line 1173
;1173:		{
line 1174
;1174:			G_Printf("Bad client ID\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1175
;1175:			return;
ADDRGP4 $818
JUMPV
LABELV $840
line 1177
;1176:		}
;1177:        if (!g_entities[client_id].inuse) 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $843
line 1178
;1178:        {
line 1179
;1179:			G_Printf("Client is not active\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1180
;1180:            return; 
ADDRGP4 $818
JUMPV
LABELV $843
line 1182
;1181:        }
;1182:		if (g_entities[client_id].client->ps.duelInProgress){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $846
line 1183
;1183:			G_Printf("Client is in a duel\n");
ADDRGP4 $435
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1184
;1184:            return;
ADDRGP4 $818
JUMPV
LABELV $846
line 1187
;1185:		}
;1186:		//REMOVE
;1187:		if (g_entities[client_id].client->pers.amterminator == qtrue)
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
INDIRI4
CNSTI4 1
NEI4 $849
line 1188
;1188:		{
line 1189
;1189:			for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $852
line 1190
;1190:				g_entities[client_id].client->ps.ammo[i] = 0;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 408
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 1191
;1191:			}
LABELV $853
line 1189
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $852
line 1192
;1192:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_terminator_off_saying.string ) );
ADDRGP4 $442
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_terminator_off_saying+16
ARGP4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1193
;1193:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_terminator_off_saying.string ) ); 
ADDRGP4 $445
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_terminator_off_saying+16
ARGP4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1194
;1194:			g_entities[client_id].client->pers.amterminator = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
CNSTI4 0
ASGNI4
line 1195
;1195:			g_entities[client_id].client->ps.forceRestricted = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 0
ASGNI4
line 1196
;1196:			g_entities[client_id].client->ps.weapon = WP_SABER;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 1197
;1197:			g_entities[client_id].client->ps.stats[STAT_WEAPONS] &= ~(1 << WP_STUN_BATON) & ~(1 << WP_BLASTER) & ~(1 << WP_DISRUPTOR)
ADDRLP4 1072
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 1072
INDIRP4
ADDRLP4 1072
INDIRP4
INDIRI4
CNSTI4 -16371
BANDI4
ASGNI4
line 1200
;1198:				 & ~(1 << WP_BOWCASTER) & ~(1 << WP_REPEATER) & ~(1 << WP_DEMP2) & ~(1 << WP_FLECHETTE) & ~(1 << WP_ROCKET_LAUNCHER) & ~(1 << WP_THERMAL)
;1199:				 & ~(1 << WP_TRIP_MINE) & ~(1 << WP_DET_PACK);
;1200:			g_entities[client_id].client->ps.stats[STAT_HOLDABLE_ITEMS] &= ~(1 << HI_BINOCULARS) & ~(1 << HI_SEEKER) & ~(1 << HI_MEDPAC) & ~(1 << HI_SHIELD) & ~(1 << HI_SENTRY_GUN);
ADDRLP4 1076
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 1076
INDIRP4
ADDRLP4 1076
INDIRP4
INDIRI4
CNSTI4 -111
BANDI4
ASGNI4
line 1201
;1201:			if (!(g_weaponDisable.integer & (1 << WP_BRYAR_PISTOL))) {
ADDRGP4 g_weaponDisable+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $866
line 1202
;1202:				g_entities[client_id].client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BRYAR_PISTOL );
ADDRLP4 1080
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 1080
INDIRP4
ADDRLP4 1080
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1203
;1203:			} else {
ADDRGP4 $850
JUMPV
LABELV $866
line 1204
;1204:				g_entities[client_id].client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_BRYAR_PISTOL );
ADDRLP4 1080
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 1080
INDIRP4
ADDRLP4 1080
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 1205
;1205:			}
line 1206
;1206:		}
ADDRGP4 $850
JUMPV
LABELV $849
line 1208
;1207:		//APPLY
;1208:		else {
line 1209
;1209:			for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $871
line 1210
;1210:				g_entities[client_id].client->ps.ammo[i] = num;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 408
ADDP4
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1211
;1211:			}
LABELV $872
line 1209
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $871
line 1212
;1212:			G_PlayEffect(EFFECT_SPARK_EXPLOSION, g_entities[client_id].r.currentOrigin, v);
CNSTI4 4
ARGI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+72
ADDP4
ARGP4
ADDRLP4 1040
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 1213
;1213:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_terminator_on_saying.string ) );
ADDRGP4 $442
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_terminator_on_saying+16
ARGP4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1214
;1214:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_terminator_on_saying.string ) ); 
ADDRGP4 $445
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_terminator_on_saying+16
ARGP4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1215
;1215:			G_ScreenShake(g_entities[client_id].client->ps.origin, NULL, 10.0f, 800, qtrue);
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTF4 1092616192
ARGF4
CNSTI4 800
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_ScreenShake
CALLP4
pop
line 1216
;1216:			g_entities[client_id].client->pers.amterminator = qtrue;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1536
ADDP4
CNSTI4 1
ASGNI4
line 1217
;1217:			g_entities[client_id].client->ps.forceRestricted = qtrue;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 1
ASGNI4
line 1218
;1218:			g_entities[client_id].client->ps.weapon = WP_STUN_BATON;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 1219
;1219:			g_entities[client_id].client->ps.stats[STAT_WEAPONS] &= ~( 1 << WP_SABER );
ADDRLP4 1072
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 1072
INDIRP4
ADDRLP4 1072
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 1220
;1220:			g_entities[client_id].client->ps.stats[STAT_WEAPONS] |= (1 << WP_STUN_BATON) | (1 << WP_BRYAR_PISTOL) | (1 << WP_BLASTER) | (1 << WP_DISRUPTOR)
ADDRLP4 1076
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 1076
INDIRP4
ADDRLP4 1076
INDIRP4
INDIRI4
CNSTI4 16378
BORI4
ASGNI4
line 1223
;1221:				 | (1 << WP_BOWCASTER) | (1 << WP_REPEATER) | (1 << WP_DEMP2) | (1 << WP_FLECHETTE) | (1 << WP_ROCKET_LAUNCHER) | (1 << WP_THERMAL)
;1222:				 | (1 << WP_TRIP_MINE) | (1 << WP_DET_PACK);
;1223:			g_entities[client_id].client->ps.stats[STAT_HOLDABLE_ITEMS] |= (1 << HI_BINOCULARS) | (1 << HI_SEEKER) | (1 << HI_MEDPAC) | (1 << HI_SHIELD) | (1 << HI_SENTRY_GUN);
ADDRLP4 1080
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 1080
INDIRP4
ADDRLP4 1080
INDIRP4
INDIRI4
CNSTI4 110
BORI4
ASGNI4
line 1225
;1224:			//REMOVE EMPOWER
;1225:			if (g_entities[client_id].client->pers.amempower == qtrue)
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 1
NEI4 $889
line 1226
;1226:				{
line 1227
;1227:					g_entities[client_id].client->ps.isJediMaster = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 0
ASGNI4
line 1228
;1228:					g_entities[client_id].client->pers.amempower = qfalse;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
CNSTI4 0
ASGNI4
line 1229
;1229:					for( f = 0; f < NUM_FORCE_POWERS; f ++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $894
line 1230
;1230:						g_entities[client_id].client->ps.fd.forcePowerLevel[f] = g_entities[client_id].client->pers.forcePowerLevelSaved[f];
ADDRLP4 1084
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1088
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1084
INDIRI4
ADDRLP4 1088
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
ADDRLP4 1084
INDIRI4
ADDRLP4 1088
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1560
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1231
;1231:					}
LABELV $895
line 1229
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 18
LTI4 $894
line 1232
;1232:					g_entities[client_id].client->ps.fd.forcePowersKnown = g_entities[client_id].client->pers.forcePowersKnownSaved;
ADDRLP4 1084
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1084
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ADDRLP4 1084
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
ASGNI4
line 1233
;1233:				}
LABELV $889
line 1234
;1234:		}
LABELV $850
line 1235
;1235:	}
LABELV $818
endproc Svcmd_Terminator 1092 20
export Svcmd_Protect
proc Svcmd_Protect 1052 20
line 1237
;1236:	void	Svcmd_Protect( void )
;1237:	{
line 1238
;1238:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 1240
;1239:		char arg1[MAX_STRING_CHARS];
;1240:		if (g_gametype.integer == GT_TOURNAMENT || g_gametype.integer == GT_TEAM ||
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $911
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
EQI4 $911
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $911
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $903
LABELV $911
line 1241
;1241:			g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY) {
line 1242
;1242:				G_Printf("Cannot use this admin command in this gametype.\n");
ADDRGP4 $414
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1243
;1243:				return;
ADDRGP4 $902
JUMPV
LABELV $903
line 1245
;1244:		}
;1245:		if ( trap_Argc() > 2 )
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
LEI4 $912
line 1246
;1246:		{
line 1247
;1247:			G_Printf("Usage: /protect (client)\n");
ADDRGP4 $914
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1248
;1248:			return; 
ADDRGP4 $902
JUMPV
LABELV $912
line 1250
;1249:		}
;1250:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1251
;1251:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 1252
;1252:        if (client_id == -1) 
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $915
line 1253
;1253:        { 
line 1254
;1254:			G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1255
;1255:            return;
ADDRGP4 $902
JUMPV
LABELV $915
line 1257
;1256:        }
;1257:        if (client_id == -2) 
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $917
line 1258
;1258:        { 
line 1259
;1259:			G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1260
;1260:            return;
ADDRGP4 $902
JUMPV
LABELV $917
line 1262
;1261:        }
;1262:		if (client_id < 0 || client_id >= MAX_CLIENTS)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $921
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $919
LABELV $921
line 1263
;1263:		{
line 1264
;1264:			G_Printf("Bad client ID\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1265
;1265:			return;
ADDRGP4 $902
JUMPV
LABELV $919
line 1267
;1266:		}
;1267:        if (!g_entities[client_id].inuse) 
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $922
line 1268
;1268:        {
line 1269
;1269:			G_Printf("Client is not active\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1270
;1270:            return; 
ADDRGP4 $902
JUMPV
LABELV $922
line 1272
;1271:        }
;1272:		if (g_entities[client_id].client->ps.duelInProgress){
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $925
line 1273
;1273:			G_Printf("Client is in a duel\n");
ADDRGP4 $435
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1274
;1274:            return;
ADDRGP4 $902
JUMPV
LABELV $925
line 1277
;1275:		}
;1276:		//REMOVE
;1277:		if (g_entities[client_id].client->ps.eFlags & EF_INVULNERABLE)
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 67108864
BANDI4
CNSTI4 0
EQI4 $928
line 1278
;1278:		{
line 1279
;1279:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_protect_off_saying.string ) );
ADDRGP4 $442
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_protect_off_saying+16
ARGP4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1280
;1280:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_protect_off_saying.string ) ); 
ADDRGP4 $445
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_protect_off_saying+16
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1281
;1281:			g_entities[client_id].client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 1048
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 1048
INDIRP4
ADDRLP4 1048
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 1282
;1282:			g_entities[client_id].client->invulnerableTimer = 0;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1752
ADDP4
CNSTI4 0
ASGNI4
line 1283
;1283:		}
ADDRGP4 $929
JUMPV
LABELV $928
line 1285
;1284:		//APPLY
;1285:		else {
line 1286
;1286:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_protect_on_saying.string ) );
ADDRGP4 $442
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_protect_on_saying+16
ARGP4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1287
;1287:			trap_SendServerCommand( -1, va("print \"%s ^7%s\n\"", g_entities[client_id].client->pers.netname, cm_protect_on_saying.string ) ); 
ADDRGP4 $445
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_protect_on_saying+16
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1288
;1288:			G_ScreenShake(g_entities[client_id].client->ps.origin, NULL, 10.0f, 800, qtrue);
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTF4 1092616192
ARGF4
CNSTI4 800
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_ScreenShake
CALLP4
pop
line 1289
;1289:			g_entities[client_id].client->ps.eFlags |= EF_INVULNERABLE;
ADDRLP4 1048
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 1048
INDIRP4
ADDRLP4 1048
INDIRP4
INDIRI4
CNSTI4 67108864
BORI4
ASGNI4
line 1290
;1290:			g_entities[client_id].client->invulnerableTimer = level.time + Q3_INFINITE;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1752
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 16777216
ADDI4
ASGNI4
line 1291
;1291:		}
LABELV $929
line 1292
;1292:	}
LABELV $902
endproc Svcmd_Protect 1052 20
export Svcmd_ChangeMap
proc Svcmd_ChangeMap 1036 12
line 1294
;1293:	void	Svcmd_ChangeMap( void ) 
;1294:	{
line 1296
;1295:		char arg1[MAX_STRING_CHARS];
;1296:		if ( trap_Argc() != 3 )
ADDRLP4 1024
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 3
EQI4 $946
line 1297
;1297:		{
line 1298
;1298:			G_Printf("Usage: /changemap (gametype) (map)\n");
ADDRGP4 $948
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1299
;1299:			return; 
ADDRGP4 $945
JUMPV
LABELV $946
line 1301
;1300:		}
;1301:		trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1302
;1302:		trap_SendConsoleCommand( EXEC_APPEND, va("g_gametype %s\n", arg1));
ADDRGP4 $949
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1303
;1303:		G_LogPrintf("ChangeMap admin command executed by SERVER to GAMETYPE:%s", arg1);
ADDRGP4 $950
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1304
;1304:		trap_Argv( 2, arg1, sizeof( arg1 ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1305
;1305:		trap_SendConsoleCommand( EXEC_APPEND, va("map %s\n", arg1));
ADDRGP4 $951
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1032
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1306
;1306:		G_LogPrintf(" MAP:%s.\n", arg1);
ADDRGP4 $952
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1307
;1307:	}
LABELV $945
endproc Svcmd_ChangeMap 1036 12
export Svcmd_Teleport
proc Svcmd_Teleport 2136 16
line 1309
;1308:	void	Svcmd_Teleport( void )
;1309:	{ // teleport to specific location
line 1312
;1310:		vec3_t location;
;1311:		vec3_t forward;
;1312:		if ( trap_Argc() <= 2 || trap_Argc() > 4 )
ADDRLP4 24
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 2
LEI4 $956
ADDRLP4 28
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 4
LEI4 $954
LABELV $956
line 1313
;1313:		{
line 1314
;1314:			G_Printf("Usage: Usage: /teleport (client)\n/teleport (X Y Z)\n/teleport (client) (client)\n/teleport (client) (X Y Z)\n");
ADDRGP4 $957
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1315
;1315:			return;
ADDRGP4 $953
JUMPV
LABELV $954
line 1318
;1316:		}
;1317:		//Teleport player to player
;1318:		if ( trap_Argc() == 3 )
ADDRLP4 32
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 3
NEI4 $958
line 1319
;1319:		{
line 1320
;1320:			int	client_id = -1;
ADDRLP4 36
CNSTI4 -1
ASGNI4
line 1321
;1321:			int	client_id2 = -1;
ADDRLP4 40
CNSTI4 -1
ASGNI4
line 1324
;1322:			char	arg1[MAX_STRING_CHARS];
;1323:			char	arg2[MAX_STRING_CHARS];
;1324:			trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 44
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1325
;1325:			trap_Argv( 2, arg2, sizeof( arg2 ) );
CNSTI4 2
ARGI4
ADDRLP4 1068
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1326
;1326:			client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 44
ARGP4
ADDRLP4 2092
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 2092
INDIRI4
ASGNI4
line 1327
;1327:			client_id2 = G_ClientNumberFromArg( arg2 );
ADDRLP4 1068
ARGP4
ADDRLP4 2096
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 2096
INDIRI4
ASGNI4
line 1329
;1328:
;1329:			if (client_id == -1)
ADDRLP4 36
INDIRI4
CNSTI4 -1
NEI4 $960
line 1330
;1330:			{
line 1331
;1331:				G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1332
;1332:				return;
ADDRGP4 $953
JUMPV
LABELV $960
line 1334
;1333:			}
;1334:			if (client_id == -2)
ADDRLP4 36
INDIRI4
CNSTI4 -2
NEI4 $962
line 1335
;1335:			{
line 1336
;1336:				G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1337
;1337:				return;
ADDRGP4 $953
JUMPV
LABELV $962
line 1339
;1338:			}
;1339:			if (client_id < 0 || client_id >= MAX_CLIENTS)
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $966
ADDRLP4 36
INDIRI4
CNSTI4 32
LTI4 $964
LABELV $966
line 1340
;1340:			{
line 1341
;1341:				G_Printf("Bad client ID\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1342
;1342:				return;
ADDRGP4 $953
JUMPV
LABELV $964
line 1344
;1343:			}
;1344:			if (!g_entities[client_id].inuse)
CNSTI4 852
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $967
line 1345
;1345:			{
line 1346
;1346:				G_Printf("Client is not active\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1347
;1347:				return;
ADDRGP4 $953
JUMPV
LABELV $967
line 1349
;1348:			}
;1349:			if (client_id2 == -1)
ADDRLP4 40
INDIRI4
CNSTI4 -1
NEI4 $970
line 1350
;1350:			{
line 1351
;1351:				G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1352
;1352:				return;
ADDRGP4 $953
JUMPV
LABELV $970
line 1354
;1353:			}
;1354:			if (client_id2 == -2)
ADDRLP4 40
INDIRI4
CNSTI4 -2
NEI4 $972
line 1355
;1355:			{
line 1356
;1356:				G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1357
;1357:				return;
ADDRGP4 $953
JUMPV
LABELV $972
line 1359
;1358:			}
;1359:			if (!g_entities[client_id2].inuse)
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $974
line 1360
;1360:			{
line 1361
;1361:				G_Printf("Client is not active\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1362
;1362:				return;
ADDRGP4 $953
JUMPV
LABELV $974
line 1364
;1363:			}
;1364:			if (g_entities[client_id].health <= 0)
CNSTI4 852
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $977
line 1365
;1365:			{
line 1366
;1366:				return;
ADDRGP4 $953
JUMPV
LABELV $977
line 1368
;1367:			}
;1368:			if (g_entities[client_id2].health <= 0)
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $980
line 1369
;1369:			{
line 1370
;1370:				return;
ADDRGP4 $953
JUMPV
LABELV $980
line 1373
;1371:			}
;1372:
;1373:			VectorCopy(g_entities[client_id2].client->ps.origin, location);
ADDRLP4 0
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1374
;1374:			AngleVectors(g_entities[client_id2].client->ps.viewangles, forward, NULL, NULL);
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 2104
CNSTP4 0
ASGNP4
ADDRLP4 2104
INDIRP4
ARGP4
ADDRLP4 2104
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1375
;1375:			forward[2] = 0; //no elevation change
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1376
;1376:			VectorNormalize(forward);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1377
;1377:			VectorMA(g_entities[client_id2].client->ps.origin, 100, forward, location);
ADDRLP4 2108
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ASGNI4
ADDRLP4 2112
CNSTF4 1120403456
ASGNF4
ADDRLP4 0
ADDRLP4 2108
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 2112
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 2108
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 2112
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1120403456
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1378
;1378:			location[2] += 5; //add just a bit of height???
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 1379
;1379:			TeleportPlayer(&g_entities[client_id], location, g_entities[client_id2].client->ps.viewangles);
ADDRLP4 2116
CNSTI4 852
ASGNI4
ADDRLP4 2116
INDIRI4
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 2116
INDIRI4
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 1380
;1380:			G_LogPrintf("Teleport admin command is executed by SERVER on %s.\n", g_entities[client_id].client->pers.netname);
ADDRGP4 $995
ARGP4
CNSTI4 852
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1381
;1381:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_teleport_saying.string ) );
ADDRGP4 $442
ARGP4
CNSTI4 852
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_teleport_saying+16
ARGP4
ADDRLP4 2120
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2120
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1382
;1382:			trap_SendServerCommand( -1, va("print \"%s^7 %s\n\"", g_entities[client_id].client->pers.netname, cm_teleport_saying.string ) );
ADDRGP4 $999
ARGP4
CNSTI4 852
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_teleport_saying+16
ARGP4
ADDRLP4 2124
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2124
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1383
;1383:		}
LABELV $958
line 1385
;1384:		//Using manual coordinates
;1385:		if ( trap_Argc() == 5 )
ADDRLP4 36
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 5
NEI4 $1002
line 1386
;1386:		{
line 1387
;1387:			int	client_id = -1;			
ADDRLP4 40
CNSTI4 -1
ASGNI4
line 1392
;1388:			char	arg1[MAX_STRING_CHARS];
;1389:			vec3_t		origin;
;1390:			char		buffer[MAX_TOKEN_CHARS];	
;1391:			
;1392:			trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 1080
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1393
;1393:			client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 1080
ARGP4
ADDRLP4 2104
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 2104
INDIRI4
ASGNI4
line 1394
;1394:			if (client_id == -1)
ADDRLP4 40
INDIRI4
CNSTI4 -1
NEI4 $1004
line 1395
;1395:			{
line 1396
;1396:				G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1397
;1397:				return;
ADDRGP4 $953
JUMPV
LABELV $1004
line 1399
;1398:			}
;1399:			if (client_id == -2)
ADDRLP4 40
INDIRI4
CNSTI4 -2
NEI4 $1006
line 1400
;1400:			{
line 1401
;1401:				G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1402
;1402:				return;
ADDRGP4 $953
JUMPV
LABELV $1006
line 1404
;1403:			}
;1404:			if (client_id < 0 || client_id >= MAX_CLIENTS)
ADDRLP4 40
INDIRI4
CNSTI4 0
LTI4 $1010
ADDRLP4 40
INDIRI4
CNSTI4 32
LTI4 $1008
LABELV $1010
line 1405
;1405:			{
line 1406
;1406:				G_Printf("Bad client ID\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1407
;1407:				return;
ADDRGP4 $953
JUMPV
LABELV $1008
line 1409
;1408:			}
;1409:			if (!g_entities[client_id].inuse)
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1011
line 1410
;1410:			{
line 1411
;1411:				G_Printf("Client is not active\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1412
;1412:				return;
ADDRGP4 $953
JUMPV
LABELV $1011
line 1414
;1413:			}
;1414:			if (g_entities[client_id].health <= 0)
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1014
line 1415
;1415:			{
line 1416
;1416:				return;
ADDRGP4 $953
JUMPV
LABELV $1014
line 1419
;1417:			}
;1418:		
;1419:			trap_Argv(2, buffer, sizeof( buffer ) );
CNSTI4 2
ARGI4
ADDRLP4 44
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1420
;1420:			origin[0] = atof(buffer);
ADDRLP4 44
ARGP4
ADDRLP4 2112
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1068
ADDRLP4 2112
INDIRF4
ASGNF4
line 1421
;1421:			trap_Argv(3, buffer, sizeof( buffer ) );
CNSTI4 3
ARGI4
ADDRLP4 44
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1422
;1422:			origin[1] = atof(buffer);
ADDRLP4 44
ARGP4
ADDRLP4 2116
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1068+4
ADDRLP4 2116
INDIRF4
ASGNF4
line 1423
;1423:			trap_Argv(4, buffer, sizeof( buffer ) );
CNSTI4 4
ARGI4
ADDRLP4 44
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1424
;1424:			origin[2] = atof(buffer);			
ADDRLP4 44
ARGP4
ADDRLP4 2120
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1068+8
ADDRLP4 2120
INDIRF4
ASGNF4
line 1426
;1425:
;1426:			TeleportPlayer( &g_entities[client_id], origin, g_entities[client_id].client->ps.viewangles );
ADDRLP4 2124
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ASGNI4
ADDRLP4 2124
INDIRI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1068
ARGP4
ADDRLP4 2124
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 1427
;1427:			G_LogPrintf("Teleport admin command is executed by SERVER on %s.\n", g_entities[client_id].client->pers.netname);
ADDRGP4 $995
ARGP4
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1428
;1428:			trap_SendServerCommand( -1, va("cp \"%s^7\n%s\n\"", g_entities[client_id].client->pers.netname, cm_teleport_saying.string ) );  
ADDRGP4 $442
ARGP4
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_teleport_saying+16
ARGP4
ADDRLP4 2128
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2128
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1429
;1429:			trap_SendServerCommand( -1, va("print \"%s^7 %s\n\"", g_entities[client_id].client->pers.netname, cm_teleport_saying.string ) );  
ADDRGP4 $999
ARGP4
CNSTI4 852
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 cm_teleport_saying+16
ARGP4
ADDRLP4 2132
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2132
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1430
;1430:		}
LABELV $1002
line 1431
;1431:	}
LABELV $953
endproc Svcmd_Teleport 2136 16
export Svcmd_AdminKick
proc Svcmd_AdminKick 1044 12
line 1433
;1432:	void	Svcmd_AdminKick( void )
;1433:	{
line 1434
;1434:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 1436
;1435:		char arg1[MAX_STRING_CHARS];
;1436:		if ( trap_Argc() > 2 )
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
LEI4 $1026
line 1437
;1437:		{
line 1438
;1438:			G_Printf("Usage: /adminkick (client)\n");
ADDRGP4 $1028
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1439
;1439:			return; 
ADDRGP4 $1025
JUMPV
LABELV $1026
line 1441
;1440:		}
;1441:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1442
;1442:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 1443
;1443:        if (client_id == -1)
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $1029
line 1444
;1444:			{
line 1445
;1445:				G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1446
;1446:				return;
ADDRGP4 $1025
JUMPV
LABELV $1029
line 1448
;1447:			}
;1448:			if (client_id == -2)
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $1031
line 1449
;1449:			{
line 1450
;1450:				G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1451
;1451:				return;
ADDRGP4 $1025
JUMPV
LABELV $1031
line 1453
;1452:			}
;1453:			if (client_id < 0 || client_id >= MAX_CLIENTS)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1035
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1033
LABELV $1035
line 1454
;1454:			{
line 1455
;1455:				G_Printf("Bad client ID\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1456
;1456:				return;
ADDRGP4 $1025
JUMPV
LABELV $1033
line 1458
;1457:			}
;1458:			if (!g_entities[client_id].inuse)
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1036
line 1459
;1459:			{
line 1460
;1460:				G_Printf("Client is not active\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1461
;1461:				return;
ADDRGP4 $1025
JUMPV
LABELV $1036
line 1463
;1462:			}
;1463:		trap_SendConsoleCommand( EXEC_APPEND, va("clientkick %d", client_id) );
ADDRGP4 $1039
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1464
;1464:		G_LogPrintf("AdminKick command executed by SERVER on %s.\n", g_entities[client_id].client->pers.netname);
ADDRGP4 $1040
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1465
;1465:	}
LABELV $1025
endproc Svcmd_AdminKick 1044 12
export Svcmd_AdminBan
proc Svcmd_AdminBan 1048 12
line 1467
;1466:	void	Svcmd_AdminBan( void ) 
;1467:	{
line 1468
;1468:		int client_id = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 1470
;1469:		char arg1[MAX_STRING_CHARS];
;1470:		if ( trap_Argc() > 2 )
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
LEI4 $1043
line 1471
;1471:		{
line 1472
;1472:			G_Printf("Usage: /adminban (client)\n"); 
ADDRGP4 $1045
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1473
;1473:			return; 
ADDRGP4 $1042
JUMPV
LABELV $1043
line 1475
;1474:		}
;1475:		trap_Argv( 1,  arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1476
;1476:		client_id = G_ClientNumberFromArg( arg1 );
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 G_ClientNumberFromArg
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 1477
;1477:        if (client_id == -1)
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $1046
line 1478
;1478:		{
line 1479
;1479:			G_Printf("Can't find client ID\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1480
;1480:			return;
ADDRGP4 $1042
JUMPV
LABELV $1046
line 1482
;1481:		}
;1482:		if (client_id == -2)
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $1048
line 1483
;1483:		{
line 1484
;1484:			G_Printf("Ambiguous client ID\n");
ADDRGP4 $423
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1485
;1485:			return;
ADDRGP4 $1042
JUMPV
LABELV $1048
line 1487
;1486:		}
;1487:		if (client_id < 0 || client_id >= MAX_CLIENTS)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1052
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1050
LABELV $1052
line 1488
;1488:		{
line 1489
;1489:			G_Printf("Bad client ID\n");
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1490
;1490:			return;
ADDRGP4 $1042
JUMPV
LABELV $1050
line 1492
;1491:		}
;1492:		if (!g_entities[client_id].inuse)
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1053
line 1493
;1493:		{
line 1494
;1494:			G_Printf("Client is not active\n");
ADDRGP4 $431
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1495
;1495:			return;
ADDRGP4 $1042
JUMPV
LABELV $1053
line 1497
;1496:		}
;1497:		trap_SendConsoleCommand( EXEC_APPEND, va("clientkick %d", client_id) );
ADDRGP4 $1039
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1498
;1498:		G_LogPrintf("AdminBan admin command executed by SERVER on %s. (IP: %s)\n", g_entities[client_id].client->pers.netname, g_entities[client_id].client->sess.IPstring);
ADDRGP4 $1056
ARGP4
ADDRLP4 1044
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1044
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 1044
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1688
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1499
;1499:		AddIP( g_entities[client_id].client->sess.IPstring );
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1688
ADDP4
ARGP4
ADDRGP4 AddIP
CALLV
pop
line 1500
;1500:	}
LABELV $1042
endproc Svcmd_AdminBan 1048 12
export ConsoleCommand
proc ConsoleCommand 1128 12
line 1510
;1501:
;1502:char	*ConcatArgs( int start );
;1503:
;1504:/*
;1505:=================
;1506:ConsoleCommand
;1507:
;1508:=================
;1509:*/
;1510:qboolean	ConsoleCommand( void ) {
line 1513
;1511:	char	cmd[MAX_TOKEN_CHARS];
;1512:
;1513:	trap_Argv( 0, cmd, sizeof( cmd ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1515
;1514:
;1515:	if ( Q_stricmp (cmd, "entitylist") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $1063
ARGP4
ADDRLP4 1024
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
NEI4 $1061
line 1516
;1516:		Svcmd_EntityList_f();
ADDRGP4 Svcmd_EntityList_f
CALLV
pop
line 1517
;1517:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1061
line 1520
;1518:	}
;1519:
;1520:	if ( Q_stricmp (cmd, "forceteam") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $1066
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $1064
line 1521
;1521:		Svcmd_ForceTeam_f();
ADDRGP4 Svcmd_ForceTeam_f
CALLV
pop
line 1522
;1522:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1064
line 1525
;1523:	}
;1524:
;1525:	if (Q_stricmp (cmd, "game_memory") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1069
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $1067
line 1526
;1526:		Svcmd_GameMem_f();
ADDRGP4 Svcmd_GameMem_f
CALLV
pop
line 1527
;1527:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1067
line 1530
;1528:	}
;1529:
;1530:	if (Q_stricmp (cmd, "addbot") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1072
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $1070
line 1531
;1531:		Svcmd_AddBot_f();
ADDRGP4 Svcmd_AddBot_f
CALLV
pop
line 1532
;1532:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1070
line 1535
;1533:	}
;1534:
;1535:	if (Q_stricmp (cmd, "botlist") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1075
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $1073
line 1536
;1536:		Svcmd_BotList_f();
ADDRGP4 Svcmd_BotList_f
CALLV
pop
line 1537
;1537:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1073
line 1545
;1538:	}
;1539:
;1540:/*	if (Q_stricmp (cmd, "abort_podium") == 0) {
;1541:		Svcmd_AbortPodium_f();
;1542:		return qtrue;
;1543:	}
;1544:*/
;1545:	if (Q_stricmp (cmd, "addip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1078
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $1076
line 1546
;1546:		Svcmd_AddIP_f();
ADDRGP4 Svcmd_AddIP_f
CALLV
pop
line 1547
;1547:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1076
line 1550
;1548:	}
;1549:
;1550:	if (Q_stricmp (cmd, "removeip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1081
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $1079
line 1551
;1551:		Svcmd_RemoveIP_f();
ADDRGP4 Svcmd_RemoveIP_f
CALLV
pop
line 1552
;1552:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1079
line 1555
;1553:	}
;1554:
;1555:	if (Q_stricmp (cmd, "listip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1084
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $1082
line 1556
;1556:		trap_SendConsoleCommand( EXEC_NOW, "g_banIPs\n" );
CNSTI4 0
ARGI4
ADDRGP4 $1085
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1557
;1557:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1082
line 1560
;1558:	}
;1559:
;1560:	if (Q_stricmp (cmd, "punish") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1088
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $1086
line 1561
;1561:		Svcmd_Punish();
ADDRGP4 Svcmd_Punish
CALLV
pop
line 1562
;1562:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1086
line 1565
;1563:	}
;1564:
;1565:	if (Q_stricmp (cmd, "sleep") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1091
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $1089
line 1566
;1566:		Svcmd_Sleep();
ADDRGP4 Svcmd_Sleep
CALLV
pop
line 1567
;1567:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1089
line 1570
;1568:	}
;1569:
;1570:	if (Q_stricmp (cmd, "csprint") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1094
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $1092
line 1571
;1571:		Svcmd_CSprint();
ADDRGP4 Svcmd_CSprint
CALLV
pop
line 1572
;1572:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1092
line 1575
;1573:	}
;1574:
;1575:	if (Q_stricmp (cmd, "changemode") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1097
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $1095
line 1576
;1576:		Svcmd_ChangeMode();
ADDRGP4 Svcmd_ChangeMode
CALLV
pop
line 1577
;1577:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1095
line 1580
;1578:	}
;1579:
;1580:	if (Q_stricmp (cmd, "silence") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1100
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $1098
line 1581
;1581:		Svcmd_Silence();
ADDRGP4 Svcmd_Silence
CALLV
pop
line 1582
;1582:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1098
line 1585
;1583:	}
;1584:
;1585:	if (Q_stricmp (cmd, "empower") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1103
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $1101
line 1586
;1586:		Svcmd_Empower();
ADDRGP4 Svcmd_Empower
CALLV
pop
line 1587
;1587:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1101
line 1590
;1588:	}
;1589:
;1590:	if (Q_stricmp (cmd, "rename") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1106
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1104
line 1591
;1591:		Svcmd_Rename();
ADDRGP4 Svcmd_Rename
CALLV
pop
line 1592
;1592:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1104
line 1595
;1593:	}
;1594:
;1595:	if (Q_stricmp (cmd, "kick") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1109
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $1107
line 1596
;1596:		Svcmd_AdminKick();
ADDRGP4 Svcmd_AdminKick
CALLV
pop
line 1597
;1597:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1107
line 1600
;1598:	}
;1599:
;1600:	if (Q_stricmp (cmd, "changemap") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1112
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $1110
line 1601
;1601:		Svcmd_ChangeMap();
ADDRGP4 Svcmd_ChangeMap
CALLV
pop
line 1602
;1602:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1110
line 1605
;1603:	}
;1604:
;1605:	if (Q_stricmp (cmd, "lockteam") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1115
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $1113
line 1606
;1606:		Svcmd_LockTeam();
ADDRGP4 Svcmd_LockTeam
CALLV
pop
line 1607
;1607:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1113
line 1610
;1608:	}
;1609:
;1610:	if (Q_stricmp (cmd, "slap") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1118
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $1116
line 1611
;1611:		Svcmd_Slap();
ADDRGP4 Svcmd_Slap
CALLV
pop
line 1612
;1612:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1116
line 1615
;1613:	}
;1614:
;1615:	if (Q_stricmp (cmd, "protect") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1121
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $1119
line 1616
;1616:		Svcmd_Protect();
ADDRGP4 Svcmd_Protect
CALLV
pop
line 1617
;1617:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1119
line 1620
;1618:	}
;1619:
;1620:	if (Q_stricmp (cmd, "slay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1124
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $1122
line 1621
;1621:		Svcmd_Slay();
ADDRGP4 Svcmd_Slay
CALLV
pop
line 1622
;1622:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1122
line 1625
;1623:	}
;1624:
;1625:	if (Q_stricmp (cmd, "terminator") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1127
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $1125
line 1626
;1626:		Svcmd_Terminator();
ADDRGP4 Svcmd_Terminator
CALLV
pop
line 1627
;1627:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1125
line 1630
;1628:	}
;1629:
;1630:	if (Q_stricmp (cmd, "who") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1130
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $1128
line 1631
;1631:		Svcmd_Who();
ADDRGP4 Svcmd_Who
CALLV
pop
line 1632
;1632:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1128
line 1635
;1633:	}
;1634:
;1635:	if (g_dedicated.integer) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $1131
line 1636
;1636:		if (Q_stricmp (cmd, "say") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1136
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $1134
line 1637
;1637:			trap_SendServerCommand( -1, va("print \"Server: %s\n\"", ConcatArgs(1) ) );
CNSTI4 1
ARGI4
ADDRLP4 1120
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $1137
ARGP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRLP4 1124
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1638
;1638:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1134
line 1641
;1639:		}
;1640:		// everything else will also be printed as a say command
;1641:		trap_SendServerCommand( -1, va("print \"Server: %s\n\"", ConcatArgs(0) ) );
CNSTI4 0
ARGI4
ADDRLP4 1120
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $1137
ARGP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRLP4 1124
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1642
;1642:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1060
JUMPV
LABELV $1131
line 1645
;1643:	}
;1644:
;1645:	return qfalse;
CNSTI4 0
RETI4
LABELV $1060
endproc ConsoleCommand 1128 12
import ConcatArgs
import uwRename
import G_ClientNumberFromArg
bss
align 4
LABELV numIPFilters
skip 4
align 4
LABELV ipFilters
skip 8192
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
LABELV $1137
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $1136
char 1 115
char 1 97
char 1 121
char 1 0
align 1
LABELV $1130
char 1 119
char 1 104
char 1 111
char 1 0
align 1
LABELV $1127
char 1 116
char 1 101
char 1 114
char 1 109
char 1 105
char 1 110
char 1 97
char 1 116
char 1 111
char 1 114
char 1 0
align 1
LABELV $1124
char 1 115
char 1 108
char 1 97
char 1 121
char 1 0
align 1
LABELV $1121
char 1 112
char 1 114
char 1 111
char 1 116
char 1 101
char 1 99
char 1 116
char 1 0
align 1
LABELV $1118
char 1 115
char 1 108
char 1 97
char 1 112
char 1 0
align 1
LABELV $1115
char 1 108
char 1 111
char 1 99
char 1 107
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $1112
char 1 99
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 109
char 1 97
char 1 112
char 1 0
align 1
LABELV $1109
char 1 107
char 1 105
char 1 99
char 1 107
char 1 0
align 1
LABELV $1106
char 1 114
char 1 101
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $1103
char 1 101
char 1 109
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 0
align 1
LABELV $1100
char 1 115
char 1 105
char 1 108
char 1 101
char 1 110
char 1 99
char 1 101
char 1 0
align 1
LABELV $1097
char 1 99
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 109
char 1 111
char 1 100
char 1 101
char 1 0
align 1
LABELV $1094
char 1 99
char 1 115
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 0
align 1
LABELV $1091
char 1 115
char 1 108
char 1 101
char 1 101
char 1 112
char 1 0
align 1
LABELV $1088
char 1 112
char 1 117
char 1 110
char 1 105
char 1 115
char 1 104
char 1 0
align 1
LABELV $1085
char 1 103
char 1 95
char 1 98
char 1 97
char 1 110
char 1 73
char 1 80
char 1 115
char 1 10
char 1 0
align 1
LABELV $1084
char 1 108
char 1 105
char 1 115
char 1 116
char 1 105
char 1 112
char 1 0
align 1
LABELV $1081
char 1 114
char 1 101
char 1 109
char 1 111
char 1 118
char 1 101
char 1 105
char 1 112
char 1 0
align 1
LABELV $1078
char 1 97
char 1 100
char 1 100
char 1 105
char 1 112
char 1 0
align 1
LABELV $1075
char 1 98
char 1 111
char 1 116
char 1 108
char 1 105
char 1 115
char 1 116
char 1 0
align 1
LABELV $1072
char 1 97
char 1 100
char 1 100
char 1 98
char 1 111
char 1 116
char 1 0
align 1
LABELV $1069
char 1 103
char 1 97
char 1 109
char 1 101
char 1 95
char 1 109
char 1 101
char 1 109
char 1 111
char 1 114
char 1 121
char 1 0
align 1
LABELV $1066
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $1063
char 1 101
char 1 110
char 1 116
char 1 105
char 1 116
char 1 121
char 1 108
char 1 105
char 1 115
char 1 116
char 1 0
align 1
LABELV $1056
char 1 65
char 1 100
char 1 109
char 1 105
char 1 110
char 1 66
char 1 97
char 1 110
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 37
char 1 115
char 1 46
char 1 32
char 1 40
char 1 73
char 1 80
char 1 58
char 1 32
char 1 37
char 1 115
char 1 41
char 1 10
char 1 0
align 1
LABELV $1045
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 98
char 1 97
char 1 110
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 0
align 1
LABELV $1040
char 1 65
char 1 100
char 1 109
char 1 105
char 1 110
char 1 75
char 1 105
char 1 99
char 1 107
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 37
char 1 115
char 1 46
char 1 10
char 1 0
align 1
LABELV $1039
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 107
char 1 105
char 1 99
char 1 107
char 1 32
char 1 37
char 1 100
char 1 0
align 1
LABELV $1028
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 107
char 1 105
char 1 99
char 1 107
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 0
align 1
LABELV $999
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 94
char 1 55
char 1 32
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $995
char 1 84
char 1 101
char 1 108
char 1 101
char 1 112
char 1 111
char 1 114
char 1 116
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 105
char 1 115
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 37
char 1 115
char 1 46
char 1 10
char 1 0
align 1
LABELV $957
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 116
char 1 101
char 1 108
char 1 101
char 1 112
char 1 111
char 1 114
char 1 116
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 47
char 1 116
char 1 101
char 1 108
char 1 101
char 1 112
char 1 111
char 1 114
char 1 116
char 1 32
char 1 40
char 1 88
char 1 32
char 1 89
char 1 32
char 1 90
char 1 41
char 1 10
char 1 47
char 1 116
char 1 101
char 1 108
char 1 101
char 1 112
char 1 111
char 1 114
char 1 116
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 47
char 1 116
char 1 101
char 1 108
char 1 101
char 1 112
char 1 111
char 1 114
char 1 116
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 32
char 1 40
char 1 88
char 1 32
char 1 89
char 1 32
char 1 90
char 1 41
char 1 10
char 1 0
align 1
LABELV $952
char 1 32
char 1 77
char 1 65
char 1 80
char 1 58
char 1 37
char 1 115
char 1 46
char 1 10
char 1 0
align 1
LABELV $951
char 1 109
char 1 97
char 1 112
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $950
char 1 67
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 77
char 1 97
char 1 112
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 116
char 1 111
char 1 32
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 89
char 1 80
char 1 69
char 1 58
char 1 37
char 1 115
char 1 0
align 1
LABELV $949
char 1 103
char 1 95
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $948
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 99
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 109
char 1 97
char 1 112
char 1 32
char 1 40
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 41
char 1 32
char 1 40
char 1 109
char 1 97
char 1 112
char 1 41
char 1 10
char 1 0
align 1
LABELV $914
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 112
char 1 114
char 1 111
char 1 116
char 1 101
char 1 99
char 1 116
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 0
align 1
LABELV $839
char 1 65
char 1 109
char 1 98
char 1 105
char 1 103
char 1 117
char 1 111
char 1 117
char 1 115
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 10
char 1 0
align 1
LABELV $834
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 116
char 1 101
char 1 114
char 1 109
char 1 105
char 1 110
char 1 97
char 1 116
char 1 111
char 1 114
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 0
align 1
LABELV $815
char 1 73
char 1 80
char 1 58
char 1 37
char 1 115
char 1 32
char 1 35
char 1 58
char 1 37
char 1 105
char 1 32
char 1 67
char 1 76
char 1 73
char 1 69
char 1 78
char 1 84
char 1 58
char 1 37
char 1 115
char 1 0
align 1
LABELV $761
char 1 69
char 1 109
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 37
char 1 115
char 1 46
char 1 32
char 1 40
char 1 97
char 1 112
char 1 112
char 1 108
char 1 121
char 1 105
char 1 110
char 1 103
char 1 41
char 1 10
char 1 0
align 1
LABELV $752
char 1 69
char 1 109
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 37
char 1 115
char 1 46
char 1 32
char 1 40
char 1 114
char 1 101
char 1 109
char 1 111
char 1 118
char 1 105
char 1 110
char 1 103
char 1 41
char 1 10
char 1 0
align 1
LABELV $725
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 101
char 1 109
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 0
align 1
LABELV $676
char 1 67
char 1 97
char 1 110
char 1 39
char 1 116
char 1 32
char 1 102
char 1 105
char 1 110
char 1 100
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 10
char 1 0
align 1
LABELV $673
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 115
char 1 108
char 1 101
char 1 101
char 1 112
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 0
align 1
LABELV $669
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 49
char 1 99
char 1 108
char 1 97
char 1 110
char 1 32
char 1 109
char 1 97
char 1 116
char 1 99
char 1 104
char 1 94
char 1 55
char 1 32
char 1 104
char 1 97
char 1 115
char 1 32
char 1 115
char 1 116
char 1 111
char 1 112
char 1 112
char 1 101
char 1 100
char 1 33
char 1 10
char 1 34
char 1 0
align 1
LABELV $668
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 49
char 1 99
char 1 108
char 1 97
char 1 110
char 1 32
char 1 109
char 1 97
char 1 116
char 1 99
char 1 104
char 1 94
char 1 55
char 1 32
char 1 104
char 1 97
char 1 115
char 1 32
char 1 115
char 1 116
char 1 111
char 1 112
char 1 112
char 1 101
char 1 100
char 1 33
char 1 10
char 1 34
char 1 0
align 1
LABELV $656
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 65
char 1 32
char 1 94
char 1 51
char 1 99
char 1 108
char 1 97
char 1 110
char 1 32
char 1 109
char 1 97
char 1 116
char 1 99
char 1 104
char 1 94
char 1 55
char 1 32
char 1 104
char 1 97
char 1 115
char 1 32
char 1 98
char 1 101
char 1 103
char 1 117
char 1 110
char 1 33
char 1 10
char 1 34
char 1 0
align 1
LABELV $655
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 65
char 1 32
char 1 94
char 1 51
char 1 99
char 1 108
char 1 97
char 1 110
char 1 32
char 1 109
char 1 97
char 1 116
char 1 99
char 1 104
char 1 94
char 1 55
char 1 32
char 1 104
char 1 97
char 1 115
char 1 32
char 1 98
char 1 101
char 1 103
char 1 117
char 1 110
char 1 33
char 1 10
char 1 34
char 1 0
align 1
LABELV $654
char 1 67
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 77
char 1 111
char 1 100
char 1 101
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 46
char 1 32
char 1 40
char 1 83
char 1 84
char 1 65
char 1 82
char 1 84
char 1 58
char 1 32
char 1 67
char 1 108
char 1 97
char 1 110
char 1 77
char 1 97
char 1 116
char 1 99
char 1 104
char 1 41
char 1 10
char 1 0
align 1
LABELV $648
char 1 67
char 1 108
char 1 97
char 1 110
char 1 77
char 1 97
char 1 116
char 1 99
char 1 104
char 1 32
char 1 109
char 1 111
char 1 100
char 1 101
char 1 32
char 1 99
char 1 97
char 1 110
char 1 32
char 1 111
char 1 110
char 1 108
char 1 121
char 1 32
char 1 98
char 1 101
char 1 32
char 1 117
char 1 115
char 1 101
char 1 100
char 1 32
char 1 100
char 1 117
char 1 114
char 1 105
char 1 110
char 1 103
char 1 32
char 1 84
char 1 70
char 1 70
char 1 65
char 1 32
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 46
char 1 10
char 1 0
align 1
LABELV $643
char 1 109
char 1 97
char 1 116
char 1 99
char 1 104
char 1 0
align 1
LABELV $642
char 1 99
char 1 108
char 1 97
char 1 110
char 1 109
char 1 97
char 1 116
char 1 99
char 1 104
char 1 0
align 1
LABELV $639
char 1 65
char 1 32
char 1 109
char 1 111
char 1 100
char 1 101
char 1 32
char 1 105
char 1 115
char 1 32
char 1 97
char 1 108
char 1 114
char 1 101
char 1 97
char 1 100
char 1 121
char 1 32
char 1 101
char 1 110
char 1 97
char 1 98
char 1 108
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $638
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 49
char 1 99
char 1 108
char 1 97
char 1 110
char 1 32
char 1 109
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 94
char 1 55
char 1 32
char 1 104
char 1 97
char 1 115
char 1 32
char 1 115
char 1 116
char 1 111
char 1 112
char 1 112
char 1 101
char 1 100
char 1 33
char 1 10
char 1 34
char 1 0
align 1
LABELV $637
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 49
char 1 99
char 1 108
char 1 97
char 1 110
char 1 32
char 1 109
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 94
char 1 55
char 1 32
char 1 104
char 1 97
char 1 115
char 1 32
char 1 115
char 1 116
char 1 111
char 1 112
char 1 112
char 1 101
char 1 100
char 1 33
char 1 10
char 1 34
char 1 0
align 1
LABELV $625
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 65
char 1 32
char 1 94
char 1 51
char 1 99
char 1 108
char 1 97
char 1 110
char 1 32
char 1 109
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 94
char 1 55
char 1 32
char 1 104
char 1 97
char 1 115
char 1 32
char 1 98
char 1 101
char 1 103
char 1 117
char 1 110
char 1 33
char 1 10
char 1 34
char 1 0
align 1
LABELV $624
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 65
char 1 32
char 1 94
char 1 51
char 1 99
char 1 108
char 1 97
char 1 110
char 1 32
char 1 109
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 94
char 1 55
char 1 32
char 1 104
char 1 97
char 1 115
char 1 32
char 1 98
char 1 101
char 1 103
char 1 117
char 1 110
char 1 33
char 1 10
char 1 34
char 1 0
align 1
LABELV $623
char 1 67
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 77
char 1 111
char 1 100
char 1 101
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 46
char 1 32
char 1 40
char 1 83
char 1 84
char 1 65
char 1 82
char 1 84
char 1 58
char 1 32
char 1 67
char 1 108
char 1 97
char 1 110
char 1 77
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 41
char 1 10
char 1 0
align 1
LABELV $617
char 1 67
char 1 108
char 1 97
char 1 110
char 1 77
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 32
char 1 109
char 1 111
char 1 100
char 1 101
char 1 32
char 1 99
char 1 97
char 1 110
char 1 32
char 1 111
char 1 110
char 1 108
char 1 121
char 1 32
char 1 98
char 1 101
char 1 32
char 1 117
char 1 115
char 1 101
char 1 100
char 1 32
char 1 100
char 1 117
char 1 114
char 1 105
char 1 110
char 1 103
char 1 32
char 1 70
char 1 70
char 1 65
char 1 32
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 46
char 1 10
char 1 0
align 1
LABELV $612
char 1 109
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $611
char 1 99
char 1 108
char 1 97
char 1 110
char 1 109
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $608
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 99
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 109
char 1 111
char 1 100
char 1 101
char 1 32
char 1 40
char 1 109
char 1 111
char 1 100
char 1 101
char 1 41
char 1 10
char 1 109
char 1 111
char 1 100
char 1 101
char 1 115
char 1 32
char 1 61
char 1 32
char 1 99
char 1 108
char 1 97
char 1 110
char 1 109
char 1 97
char 1 116
char 1 99
char 1 104
char 1 32
char 1 99
char 1 108
char 1 97
char 1 110
char 1 109
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 10
char 1 0
align 1
LABELV $604
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 115
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 97
char 1 99
char 1 116
char 1 105
char 1 118
char 1 101
char 1 10
char 1 0
align 1
LABELV $597
char 1 65
char 1 109
char 1 98
char 1 105
char 1 103
char 1 117
char 1 111
char 1 117
char 1 115
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 73
char 1 68
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $594
char 1 67
char 1 97
char 1 110
char 1 39
char 1 116
char 1 32
char 1 102
char 1 105
char 1 110
char 1 100
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 73
char 1 68
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $591
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 94
char 1 51
char 1 47
char 1 99
char 1 115
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 32
char 1 40
char 1 109
char 1 101
char 1 115
char 1 115
char 1 97
char 1 103
char 1 101
char 1 41
char 1 10
char 1 47
char 1 99
char 1 115
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 97
char 1 108
char 1 108
char 1 32
char 1 40
char 1 109
char 1 101
char 1 115
char 1 115
char 1 97
char 1 103
char 1 101
char 1 41
char 1 10
char 1 0
align 1
LABELV $588
char 1 99
char 1 112
char 1 32
char 1 34
char 1 37
char 1 115
char 1 34
char 1 0
align 1
LABELV $587
char 1 97
char 1 108
char 1 108
char 1 0
align 1
LABELV $544
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 112
char 1 117
char 1 110
char 1 105
char 1 115
char 1 104
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 0
align 1
LABELV $527
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 105
char 1 115
char 1 32
char 1 99
char 1 117
char 1 114
char 1 114
char 1 101
char 1 110
char 1 116
char 1 108
char 1 121
char 1 32
char 1 98
char 1 101
char 1 105
char 1 110
char 1 103
char 1 32
char 1 112
char 1 117
char 1 110
char 1 105
char 1 115
char 1 104
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $510
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 115
char 1 105
char 1 108
char 1 101
char 1 110
char 1 99
char 1 101
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 0
align 1
LABELV $505
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 32
char 1 94
char 1 55
char 1 104
char 1 97
char 1 115
char 1 32
char 1 98
char 1 101
char 1 101
char 1 110
char 1 32
char 1 114
char 1 101
char 1 110
char 1 97
char 1 109
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 97
char 1 110
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $504
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 89
char 1 111
char 1 117
char 1 39
char 1 118
char 1 101
char 1 32
char 1 98
char 1 101
char 1 101
char 1 110
char 1 32
char 1 114
char 1 101
char 1 110
char 1 97
char 1 109
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 10
char 1 94
char 1 55
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $493
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 114
char 1 101
char 1 110
char 1 97
char 1 109
char 1 101
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 32
char 1 40
char 1 110
char 1 101
char 1 119
char 1 32
char 1 110
char 1 97
char 1 109
char 1 101
char 1 41
char 1 10
char 1 0
align 1
LABELV $484
char 1 83
char 1 108
char 1 97
char 1 121
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 37
char 1 115
char 1 46
char 1 10
char 1 0
align 1
LABELV $464
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 115
char 1 108
char 1 97
char 1 121
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 0
align 1
LABELV $445
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 32
char 1 94
char 1 55
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $442
char 1 99
char 1 112
char 1 32
char 1 34
char 1 37
char 1 115
char 1 94
char 1 55
char 1 10
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $435
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 105
char 1 115
char 1 32
char 1 105
char 1 110
char 1 32
char 1 97
char 1 32
char 1 100
char 1 117
char 1 101
char 1 108
char 1 10
char 1 0
align 1
LABELV $431
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 97
char 1 99
char 1 116
char 1 105
char 1 118
char 1 101
char 1 10
char 1 0
align 1
LABELV $427
char 1 66
char 1 97
char 1 100
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 73
char 1 68
char 1 10
char 1 0
align 1
LABELV $423
char 1 65
char 1 109
char 1 98
char 1 105
char 1 103
char 1 117
char 1 111
char 1 117
char 1 115
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 73
char 1 68
char 1 10
char 1 0
align 1
LABELV $420
char 1 67
char 1 97
char 1 110
char 1 39
char 1 116
char 1 32
char 1 102
char 1 105
char 1 110
char 1 100
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 73
char 1 68
char 1 10
char 1 0
align 1
LABELV $417
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 115
char 1 108
char 1 97
char 1 112
char 1 32
char 1 40
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 41
char 1 10
char 1 0
align 1
LABELV $414
char 1 67
char 1 97
char 1 110
char 1 110
char 1 111
char 1 116
char 1 32
char 1 117
char 1 115
char 1 101
char 1 32
char 1 116
char 1 104
char 1 105
char 1 115
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 105
char 1 110
char 1 32
char 1 116
char 1 104
char 1 105
char 1 115
char 1 32
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 46
char 1 10
char 1 0
align 1
LABELV $399
char 1 89
char 1 111
char 1 117
char 1 32
char 1 99
char 1 97
char 1 110
char 1 116
char 1 32
char 1 108
char 1 111
char 1 99
char 1 107
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 116
char 1 101
char 1 97
char 1 109
char 1 115
char 1 32
char 1 105
char 1 110
char 1 32
char 1 116
char 1 104
char 1 105
char 1 115
char 1 32
char 1 103
char 1 97
char 1 109
char 1 101
char 1 112
char 1 108
char 1 97
char 1 121
char 1 10
char 1 0
align 1
LABELV $398
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 50
char 1 74
char 1 111
char 1 105
char 1 110
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 50
char 1 117
char 1 110
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $397
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 50
char 1 74
char 1 111
char 1 105
char 1 110
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 50
char 1 117
char 1 110
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $396
char 1 76
char 1 111
char 1 99
char 1 107
char 1 84
char 1 101
char 1 97
char 1 109
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 74
char 1 111
char 1 105
char 1 110
char 1 32
char 1 84
char 1 101
char 1 97
char 1 109
char 1 46
char 1 32
char 1 40
char 1 117
char 1 110
char 1 108
char 1 111
char 1 99
char 1 107
char 1 105
char 1 110
char 1 103
char 1 41
char 1 10
char 1 0
align 1
LABELV $394
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 50
char 1 74
char 1 111
char 1 105
char 1 110
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 49
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $393
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 50
char 1 74
char 1 111
char 1 105
char 1 110
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 49
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $392
char 1 76
char 1 111
char 1 99
char 1 107
char 1 84
char 1 101
char 1 97
char 1 109
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 74
char 1 111
char 1 105
char 1 110
char 1 32
char 1 84
char 1 101
char 1 97
char 1 109
char 1 46
char 1 32
char 1 40
char 1 108
char 1 111
char 1 99
char 1 107
char 1 105
char 1 110
char 1 103
char 1 41
char 1 10
char 1 0
align 1
LABELV $383
char 1 106
char 1 0
align 1
LABELV $382
char 1 102
char 1 0
align 1
LABELV $381
char 1 101
char 1 110
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $380
char 1 102
char 1 114
char 1 101
char 1 101
char 1 0
align 1
LABELV $379
char 1 106
char 1 111
char 1 105
char 1 110
char 1 0
align 1
LABELV $376
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 51
char 1 83
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 111
char 1 114
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 50
char 1 117
char 1 110
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $375
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 51
char 1 83
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 111
char 1 114
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 50
char 1 117
char 1 110
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $373
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 51
char 1 83
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 111
char 1 114
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 49
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $372
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 51
char 1 83
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 111
char 1 114
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 49
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $371
char 1 76
char 1 111
char 1 99
char 1 107
char 1 84
char 1 101
char 1 97
char 1 109
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 83
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 111
char 1 114
char 1 32
char 1 84
char 1 101
char 1 97
char 1 109
char 1 46
char 1 32
char 1 40
char 1 108
char 1 111
char 1 99
char 1 107
char 1 105
char 1 110
char 1 103
char 1 41
char 1 10
char 1 0
align 1
LABELV $363
char 1 115
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 101
char 1 0
align 1
LABELV $362
char 1 115
char 1 112
char 1 101
char 1 99
char 1 0
align 1
LABELV $361
char 1 115
char 1 0
align 1
LABELV $360
char 1 115
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 111
char 1 114
char 1 0
align 1
LABELV $357
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 52
char 1 66
char 1 108
char 1 117
char 1 101
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 50
char 1 117
char 1 110
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $356
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 52
char 1 66
char 1 108
char 1 117
char 1 101
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 50
char 1 117
char 1 110
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $355
char 1 76
char 1 111
char 1 99
char 1 107
char 1 84
char 1 101
char 1 97
char 1 109
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 66
char 1 108
char 1 117
char 1 101
char 1 32
char 1 84
char 1 101
char 1 97
char 1 109
char 1 46
char 1 32
char 1 40
char 1 117
char 1 110
char 1 108
char 1 111
char 1 99
char 1 107
char 1 105
char 1 110
char 1 103
char 1 41
char 1 10
char 1 0
align 1
LABELV $353
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 52
char 1 66
char 1 108
char 1 117
char 1 101
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 49
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $352
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 52
char 1 66
char 1 108
char 1 117
char 1 101
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 49
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $351
char 1 76
char 1 111
char 1 99
char 1 107
char 1 84
char 1 101
char 1 97
char 1 109
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 66
char 1 108
char 1 117
char 1 101
char 1 32
char 1 84
char 1 101
char 1 97
char 1 109
char 1 46
char 1 32
char 1 40
char 1 108
char 1 111
char 1 99
char 1 107
char 1 105
char 1 110
char 1 103
char 1 41
char 1 10
char 1 0
align 1
LABELV $345
char 1 98
char 1 0
align 1
LABELV $344
char 1 98
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $341
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 49
char 1 82
char 1 101
char 1 100
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 50
char 1 117
char 1 110
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $340
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 49
char 1 82
char 1 101
char 1 100
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 50
char 1 117
char 1 110
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $339
char 1 76
char 1 111
char 1 99
char 1 107
char 1 84
char 1 101
char 1 97
char 1 109
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 82
char 1 101
char 1 100
char 1 32
char 1 84
char 1 101
char 1 97
char 1 109
char 1 46
char 1 32
char 1 40
char 1 117
char 1 110
char 1 108
char 1 111
char 1 99
char 1 107
char 1 105
char 1 110
char 1 103
char 1 41
char 1 10
char 1 0
align 1
LABELV $337
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 49
char 1 82
char 1 101
char 1 100
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 49
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $336
char 1 99
char 1 112
char 1 32
char 1 34
char 1 94
char 1 55
char 1 84
char 1 104
char 1 101
char 1 32
char 1 94
char 1 49
char 1 82
char 1 101
char 1 100
char 1 32
char 1 94
char 1 55
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 119
char 1 32
char 1 94
char 1 49
char 1 76
char 1 111
char 1 99
char 1 107
char 1 101
char 1 100
char 1 94
char 1 55
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $335
char 1 76
char 1 111
char 1 99
char 1 107
char 1 84
char 1 101
char 1 97
char 1 109
char 1 32
char 1 97
char 1 100
char 1 109
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 32
char 1 101
char 1 120
char 1 101
char 1 99
char 1 117
char 1 116
char 1 101
char 1 100
char 1 32
char 1 98
char 1 121
char 1 32
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 32
char 1 111
char 1 110
char 1 32
char 1 82
char 1 101
char 1 100
char 1 32
char 1 84
char 1 101
char 1 97
char 1 109
char 1 46
char 1 32
char 1 40
char 1 108
char 1 111
char 1 99
char 1 107
char 1 105
char 1 110
char 1 103
char 1 41
char 1 10
char 1 0
align 1
LABELV $329
char 1 114
char 1 0
align 1
LABELV $328
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $325
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 47
char 1 108
char 1 111
char 1 99
char 1 107
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 40
char 1 116
char 1 101
char 1 97
char 1 109
char 1 41
char 1 10
char 1 84
char 1 69
char 1 65
char 1 77
char 1 83
char 1 32
char 1 61
char 1 32
char 1 83
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 111
char 1 114
char 1 44
char 1 32
char 1 66
char 1 108
char 1 117
char 1 101
char 1 44
char 1 32
char 1 82
char 1 101
char 1 100
char 1 44
char 1 32
char 1 70
char 1 114
char 1 101
char 1 101
char 1 10
char 1 0
align 1
LABELV $313
char 1 85
char 1 115
char 1 101
char 1 114
char 1 32
char 1 37
char 1 115
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 111
char 1 110
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 10
char 1 0
align 1
LABELV $303
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 105
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 99
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $300
char 1 66
char 1 97
char 1 100
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 115
char 1 108
char 1 111
char 1 116
char 1 58
char 1 32
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $292
char 1 10
char 1 0
align 1
LABELV $291
char 1 37
char 1 115
char 1 0
align 1
LABELV $287
char 1 37
char 1 51
char 1 105
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
char 1 32
char 1 32
char 1 32
char 1 0
align 1
LABELV $286
char 1 69
char 1 84
char 1 95
char 1 71
char 1 82
char 1 65
char 1 80
char 1 80
char 1 76
char 1 69
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
char 1 0
align 1
LABELV $284
char 1 69
char 1 84
char 1 95
char 1 73
char 1 78
char 1 86
char 1 73
char 1 83
char 1 73
char 1 66
char 1 76
char 1 69
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 0
align 1
LABELV $282
char 1 69
char 1 84
char 1 95
char 1 84
char 1 69
char 1 76
char 1 69
char 1 80
char 1 79
char 1 82
char 1 84
char 1 95
char 1 84
char 1 82
char 1 73
char 1 71
char 1 71
char 1 69
char 1 82
char 1 32
char 1 0
align 1
LABELV $280
char 1 69
char 1 84
char 1 95
char 1 80
char 1 85
char 1 83
char 1 72
char 1 95
char 1 84
char 1 82
char 1 73
char 1 71
char 1 71
char 1 69
char 1 82
char 1 32
char 1 32
char 1 32
char 1 32
char 1 32
char 1 0
align 1
LABELV $278
char 1 69
char 1 84
char 1 95
char 1 83
char 1 80
char 1 69
char 1 65
char 1 75
char 1 69
char 1 82
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
char 1 0
align 1
LABELV $276
char 1 69
char 1 84
char 1 95
char 1 80
char 1 79
char 1 82
char 1 84
char 1 65
char 1 76
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
char 1 0
align 1
LABELV $274
char 1 69
char 1 84
char 1 95
char 1 66
char 1 69
char 1 65
char 1 77
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
char 1 0
align 1
LABELV $272
char 1 69
char 1 84
char 1 95
char 1 77
char 1 79
char 1 86
char 1 69
char 1 82
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
char 1 0
align 1
LABELV $270
char 1 69
char 1 84
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 73
char 1 76
char 1 69
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
char 1 0
align 1
LABELV $268
char 1 69
char 1 84
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
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
char 1 0
align 1
LABELV $266
char 1 69
char 1 84
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 69
char 1 82
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
char 1 0
align 1
LABELV $264
char 1 69
char 1 84
char 1 95
char 1 71
char 1 69
char 1 78
char 1 69
char 1 82
char 1 65
char 1 76
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
char 1 0
align 1
LABELV $259
char 1 37
char 1 51
char 1 105
char 1 58
char 1 0
align 1
LABELV $249
char 1 68
char 1 105
char 1 100
char 1 110
char 1 39
char 1 116
char 1 32
char 1 102
char 1 105
char 1 110
char 1 100
char 1 32
char 1 37
char 1 115
char 1 46
char 1 10
char 1 0
align 1
LABELV $248
char 1 82
char 1 101
char 1 109
char 1 111
char 1 118
char 1 101
char 1 100
char 1 46
char 1 10
char 1 0
align 1
LABELV $236
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 32
char 1 115
char 1 118
char 1 32
char 1 114
char 1 101
char 1 109
char 1 111
char 1 118
char 1 101
char 1 105
char 1 112
char 1 32
char 1 60
char 1 105
char 1 112
char 1 45
char 1 109
char 1 97
char 1 115
char 1 107
char 1 62
char 1 10
char 1 0
align 1
LABELV $232
char 1 85
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 32
char 1 97
char 1 100
char 1 100
char 1 105
char 1 112
char 1 32
char 1 60
char 1 105
char 1 112
char 1 45
char 1 109
char 1 97
char 1 115
char 1 107
char 1 62
char 1 10
char 1 0
align 1
LABELV $213
char 1 66
char 1 65
char 1 78
char 1 32
char 1 87
char 1 97
char 1 114
char 1 110
char 1 105
char 1 110
char 1 103
char 1 58
char 1 32
char 1 102
char 1 105
char 1 108
char 1 101
char 1 32
char 1 99
char 1 97
char 1 110
char 1 110
char 1 111
char 1 116
char 1 32
char 1 98
char 1 101
char 1 32
char 1 111
char 1 112
char 1 101
char 1 110
char 1 101
char 1 100
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 114
char 1 101
char 1 97
char 1 100
char 1 105
char 1 110
char 1 103
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $191
char 1 73
char 1 80
char 1 32
char 1 102
char 1 105
char 1 108
char 1 116
char 1 101
char 1 114
char 1 32
char 1 108
char 1 105
char 1 115
char 1 116
char 1 32
char 1 105
char 1 115
char 1 32
char 1 102
char 1 117
char 1 108
char 1 108
char 1 10
char 1 0
align 1
LABELV $161
char 1 0
align 1
LABELV $158
char 1 108
char 1 111
char 1 99
char 1 97
char 1 108
char 1 104
char 1 111
char 1 115
char 1 116
char 1 0
align 1
LABELV $112
char 1 37
char 1 105
char 1 46
char 1 37
char 1 105
char 1 46
char 1 37
char 1 105
char 1 46
char 1 37
char 1 105
char 1 32
char 1 0
align 1
LABELV $103
char 1 66
char 1 65
char 1 78
char 1 32
char 1 69
char 1 114
char 1 114
char 1 111
char 1 114
char 1 58
char 1 32
char 1 102
char 1 105
char 1 108
char 1 101
char 1 32
char 1 99
char 1 97
char 1 110
char 1 110
char 1 111
char 1 116
char 1 32
char 1 98
char 1 101
char 1 32
char 1 111
char 1 112
char 1 101
char 1 110
char 1 101
char 1 100
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 119
char 1 114
char 1 105
char 1 116
char 1 105
char 1 110
char 1 103
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $100
char 1 98
char 1 97
char 1 110
char 1 73
char 1 80
char 1 46
char 1 116
char 1 120
char 1 116
char 1 0
align 1
LABELV $90
char 1 66
char 1 97
char 1 100
char 1 32
char 1 102
char 1 105
char 1 108
char 1 116
char 1 101
char 1 114
char 1 32
char 1 97
char 1 100
char 1 100
char 1 114
char 1 101
char 1 115
char 1 115
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
