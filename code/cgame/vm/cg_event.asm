bss
align 1
LABELV $130
skip 64
export CG_PlaceString
code
proc CG_PlaceString 116 20
file "../cg_event.c"
line 25
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_event.c -- handle entity events at snapshot or playerstate transitions
;4:
;5:#include "cg_local.h"
;6:#include "fx_local.h"
;7:#include "..\ghoul2\g2.h"
;8:#include "../ui/ui_shared.h"
;9:
;10:// for the voice chats
;11:#include "../../ui/menudef.h"
;12://==========================================================================
;13:
;14:extern int g_saberFlashTime;
;15:extern vec3_t g_saberFlashPos;
;16:extern char *showPowersName[];
;17:
;18:/*
;19:===================
;20:CG_PlaceString
;21:
;22:Also called by scoreboard drawing
;23:===================
;24:*/
;25:const char	*CG_PlaceString( int rank ) {
line 36
;26:	static char	str[64];
;27:	char	*s, *t;
;28:	// number extenstions, eg 1st, 2nd, 3rd, 4th etc.
;29:	// note that the rules are different for french, but by changing the required strip strings they seem to work
;30:	char sST[10];
;31:	char sND[10];
;32:	char sRD[10];
;33:	char sTH[10];
;34:	char sTiedFor[64];	// german is much longer, super safe...
;35:
;36:	trap_SP_GetStringTextString("INGAMETEXT_NUMBER_ST",sST, sizeof(sST) );
ADDRGP4 $131
ARGP4
ADDRLP4 64
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 37
;37:	trap_SP_GetStringTextString("INGAMETEXT_NUMBER_ND",sND, sizeof(sND) );
ADDRGP4 $132
ARGP4
ADDRLP4 74
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 38
;38:	trap_SP_GetStringTextString("INGAMETEXT_NUMBER_RD",sRD, sizeof(sRD) );
ADDRGP4 $133
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 39
;39:	trap_SP_GetStringTextString("INGAMETEXT_NUMBER_TH",sTH, sizeof(sTH) );
ADDRGP4 $134
ARGP4
ADDRLP4 94
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 40
;40:	trap_SP_GetStringTextString("INGAMETEXT_TIED_FOR" ,sTiedFor,sizeof(sTiedFor) );
ADDRGP4 $135
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 41
;41:	strcat(sTiedFor," ");	// save worrying about translators adding spaces or not
ADDRLP4 0
ARGP4
ADDRGP4 $136
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 43
;42:
;43:	if ( rank & RANK_TIED_FLAG ) {
ADDRFP4 0
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $137
line 44
;44:		rank &= ~RANK_TIED_FLAG;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 45
;45:		t = sTiedFor;//"Tied for ";
ADDRLP4 108
ADDRLP4 0
ASGNP4
line 46
;46:	} else {
ADDRGP4 $138
JUMPV
LABELV $137
line 47
;47:		t = "";
ADDRLP4 108
ADDRGP4 $139
ASGNP4
line 48
;48:	}
LABELV $138
line 50
;49:
;50:	if ( rank == 1 ) {
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $140
line 51
;51:		s = va("1%s",sST);//S_COLOR_BLUE "1st" S_COLOR_WHITE;		// draw in blue
ADDRGP4 $142
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
ASGNP4
line 52
;52:	} else if ( rank == 2 ) {
ADDRGP4 $141
JUMPV
LABELV $140
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $143
line 53
;53:		s = va("2%s",sND);//S_COLOR_RED "2nd" S_COLOR_WHITE;		// draw in red
ADDRGP4 $145
ARGP4
ADDRLP4 74
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
ASGNP4
line 54
;54:	} else if ( rank == 3 ) {
ADDRGP4 $144
JUMPV
LABELV $143
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $146
line 55
;55:		s = va("3%s",sRD);//S_COLOR_YELLOW "3rd" S_COLOR_WHITE;		// draw in yellow
ADDRGP4 $148
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
ASGNP4
line 56
;56:	} else if ( rank == 11 ) {
ADDRGP4 $147
JUMPV
LABELV $146
ADDRFP4 0
INDIRI4
CNSTI4 11
NEI4 $149
line 57
;57:		s = va("11%s",sTH);
ADDRGP4 $151
ARGP4
ADDRLP4 94
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
ASGNP4
line 58
;58:	} else if ( rank == 12 ) {
ADDRGP4 $150
JUMPV
LABELV $149
ADDRFP4 0
INDIRI4
CNSTI4 12
NEI4 $152
line 59
;59:		s = va("12%s",sTH);
ADDRGP4 $154
ARGP4
ADDRLP4 94
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
ASGNP4
line 60
;60:	} else if ( rank == 13 ) {
ADDRGP4 $153
JUMPV
LABELV $152
ADDRFP4 0
INDIRI4
CNSTI4 13
NEI4 $155
line 61
;61:		s = va("13%s",sTH);
ADDRGP4 $157
ARGP4
ADDRLP4 94
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
ASGNP4
line 62
;62:	} else if ( rank % 10 == 1 ) {
ADDRGP4 $156
JUMPV
LABELV $155
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 1
NEI4 $158
line 63
;63:		s = va("%i%s", rank,sST);
ADDRGP4 $160
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 64
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
ASGNP4
line 64
;64:	} else if ( rank % 10 == 2 ) {
ADDRGP4 $159
JUMPV
LABELV $158
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 2
NEI4 $161
line 65
;65:		s = va("%i%s", rank,sND);
ADDRGP4 $160
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 74
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
ASGNP4
line 66
;66:	} else if ( rank % 10 == 3 ) {
ADDRGP4 $162
JUMPV
LABELV $161
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 3
NEI4 $163
line 67
;67:		s = va("%i%s", rank,sRD);
ADDRGP4 $160
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 84
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
ASGNP4
line 68
;68:	} else {
ADDRGP4 $164
JUMPV
LABELV $163
line 69
;69:		s = va("%i%s", rank,sTH);
ADDRGP4 $160
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 94
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
ASGNP4
line 70
;70:	}
LABELV $164
LABELV $162
LABELV $159
LABELV $156
LABELV $153
LABELV $150
LABELV $147
LABELV $144
LABELV $141
line 72
;71:
;72:	Com_sprintf( str, sizeof( str ), "%s%s", t, s );
ADDRGP4 $130
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $165
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 73
;73:	return str;
ADDRGP4 $130
RETP4
LABELV $129
endproc CG_PlaceString 116 20
proc CG_Obituary 1168 24
line 83
;74:}
;75:
;76:qboolean CG_ThereIsAMaster(void);
;77:
;78:/*
;79:=============
;80:CG_Obituary
;81:=============
;82:*/
;83:static void CG_Obituary( entityState_t *ent ) {
line 94
;84:	int			mod;
;85:	int			target, attacker;
;86:	char		*message;
;87:	const char	*targetInfo;
;88:	const char	*attackerInfo;
;89:	char		targetName[32];
;90:	char		attackerName[32];
;91:	gender_t	gender;
;92:	clientInfo_t	*ci;
;93:
;94:	target = ent->otherEntityNum;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 95
;95:	attacker = ent->otherEntityNum2;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 96
;96:	mod = ent->eventParm;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ASGNI4
line 98
;97:
;98:	if ( target < 0 || target >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $169
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $167
LABELV $169
line 99
;99:		CG_Error( "CG_Obituary: target out of range" );
ADDRGP4 $170
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 100
;100:	}
LABELV $167
line 101
;101:	ci = &cgs.clientinfo[target];
ADDRLP4 88
CNSTI4 788
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 103
;102:
;103:	if ( attacker < 0 || attacker >= MAX_CLIENTS ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $174
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $172
LABELV $174
line 104
;104:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 105
;105:		attackerInfo = NULL;
ADDRLP4 52
CNSTP4 0
ASGNP4
line 106
;106:	} else {
ADDRGP4 $173
JUMPV
LABELV $172
line 107
;107:		attackerInfo = CG_ConfigString( CS_PLAYERS + attacker );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 104
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 104
INDIRP4
ASGNP4
line 108
;108:	}
LABELV $173
line 110
;109:
;110:	targetInfo = CG_ConfigString( CS_PLAYERS + target );
ADDRLP4 4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 104
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 104
INDIRP4
ASGNP4
line 111
;111:	if ( !targetInfo ) {
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $175
line 112
;112:		return;
ADDRGP4 $166
JUMPV
LABELV $175
line 114
;113:	}
;114:	Q_strncpyz( targetName, Info_ValueForKey( targetInfo, "n" ), sizeof(targetName) - 2);
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 $177
ARGP4
ADDRLP4 108
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 115
;115:	strcat( targetName, S_COLOR_WHITE );
ADDRLP4 12
ARGP4
ADDRGP4 $178
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 119
;116:
;117:	// check for single client messages
;118:
;119:	switch( mod ) {
ADDRLP4 44
INDIRI4
CNSTI4 29
LTI4 $179
ADDRLP4 44
INDIRI4
CNSTI4 37
GTI4 $179
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $183-116
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $183
address $181
address $181
address $181
address $181
address $179
address $181
address $181
address $181
address $181
code
LABELV $181
line 128
;120:	case MOD_SUICIDE:
;121:	case MOD_FALLING:
;122:	case MOD_CRUSH:
;123:	case MOD_WATER:
;124:	case MOD_SLIME:
;125:	case MOD_LAVA:
;126:	case MOD_TARGET_LASER:
;127:	case MOD_TRIGGER_HURT:
;128:		message = "DIED_GENERIC";
ADDRLP4 8
ADDRGP4 $182
ASGNP4
line 129
;129:		break;
ADDRGP4 $180
JUMPV
LABELV $179
line 131
;130:	default:
;131:		message = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 132
;132:		break;
LABELV $180
line 136
;133:	}
;134:
;135:	// Attacker killed themselves.  Ridicule them for it.
;136:	if (attacker == target) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $185
line 137
;137:		gender = ci->gender;
ADDRLP4 92
ADDRLP4 88
INDIRP4
CNSTI4 480
ADDP4
INDIRI4
ASGNI4
line 138
;138:		switch (mod) {
ADDRLP4 44
INDIRI4
CNSTI4 4
LTI4 $187
ADDRLP4 44
INDIRI4
CNSTI4 34
GTI4 $187
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $228-16
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $228
address $189
address $189
address $189
address $189
address $189
address $189
address $189
address $189
address $189
address $197
address $205
address $187
address $189
address $197
address $197
address $197
address $197
address $197
address $197
address $197
address $197
address $197
address $197
address $187
address $187
address $187
address $187
address $187
address $187
address $187
address $213
code
LABELV $189
line 149
;139:		case MOD_BRYAR_PISTOL:
;140:		case MOD_BRYAR_PISTOL_ALT:
;141:		case MOD_BLASTER:
;142:		case MOD_DISRUPTOR:
;143:		case MOD_DISRUPTOR_SPLASH:
;144:		case MOD_DISRUPTOR_SNIPER:
;145:		case MOD_BOWCASTER:
;146:		case MOD_REPEATER:
;147:		case MOD_REPEATER_ALT:
;148:		case MOD_FLECHETTE:
;149:			if ( gender == GENDER_FEMALE )
ADDRLP4 92
INDIRI4
CNSTI4 1
NEI4 $190
line 150
;150:				message = "SUICIDE_SHOT_FEMALE";
ADDRLP4 8
ADDRGP4 $192
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $190
line 151
;151:			else if ( gender == GENDER_NEUTER )
ADDRLP4 92
INDIRI4
CNSTI4 2
NEI4 $193
line 152
;152:				message = "SUICIDE_SHOT_GENDERLESS";
ADDRLP4 8
ADDRGP4 $195
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $193
line 154
;153:			else
;154:				message = "SUICIDE_SHOT_MALE";
ADDRLP4 8
ADDRGP4 $196
ASGNP4
line 155
;155:			break;
ADDRGP4 $188
JUMPV
LABELV $197
line 167
;156:		case MOD_REPEATER_ALT_SPLASH:
;157:		case MOD_FLECHETTE_ALT_SPLASH:
;158:		case MOD_ROCKET:
;159:		case MOD_ROCKET_SPLASH:
;160:		case MOD_ROCKET_HOMING:
;161:		case MOD_ROCKET_HOMING_SPLASH:
;162:		case MOD_THERMAL:
;163:		case MOD_THERMAL_SPLASH:
;164:		case MOD_TRIP_MINE_SPLASH:
;165:		case MOD_TIMED_MINE_SPLASH:
;166:		case MOD_DET_PACK_SPLASH:
;167:			if ( gender == GENDER_FEMALE )
ADDRLP4 92
INDIRI4
CNSTI4 1
NEI4 $198
line 168
;168:				message = "SUICIDE_EXPLOSIVES_FEMALE";
ADDRLP4 8
ADDRGP4 $200
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $198
line 169
;169:			else if ( gender == GENDER_NEUTER )
ADDRLP4 92
INDIRI4
CNSTI4 2
NEI4 $201
line 170
;170:				message = "SUICIDE_EXPLOSIVES_GENDERLESS";
ADDRLP4 8
ADDRGP4 $203
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $201
line 172
;171:			else
;172:				message = "SUICIDE_EXPLOSIVES_MALE";
ADDRLP4 8
ADDRGP4 $204
ASGNP4
line 173
;173:			break;
ADDRGP4 $188
JUMPV
LABELV $205
line 175
;174:		case MOD_DEMP2:
;175:			if ( gender == GENDER_FEMALE )
ADDRLP4 92
INDIRI4
CNSTI4 1
NEI4 $206
line 176
;176:				message = "SUICIDE_ELECTROCUTED_FEMALE";
ADDRLP4 8
ADDRGP4 $208
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $206
line 177
;177:			else if ( gender == GENDER_NEUTER )
ADDRLP4 92
INDIRI4
CNSTI4 2
NEI4 $209
line 178
;178:				message = "SUICIDE_ELECTROCUTED_GENDERLESS";
ADDRLP4 8
ADDRGP4 $211
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $209
line 180
;179:			else
;180:				message = "SUICIDE_ELECTROCUTED_MALE";
ADDRLP4 8
ADDRGP4 $212
ASGNP4
line 181
;181:			break;
ADDRGP4 $188
JUMPV
LABELV $213
line 183
;182:		case MOD_FALLING:
;183:			if ( gender == GENDER_FEMALE )
ADDRLP4 92
INDIRI4
CNSTI4 1
NEI4 $214
line 184
;184:				message = "SUICIDE_FALLDEATH_FEMALE";
ADDRLP4 8
ADDRGP4 $216
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $214
line 185
;185:			else if ( gender == GENDER_NEUTER )
ADDRLP4 92
INDIRI4
CNSTI4 2
NEI4 $217
line 186
;186:				message = "SUICIDE_FALLDEATH_GENDERLESS";
ADDRLP4 8
ADDRGP4 $219
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $217
line 188
;187:			else
;188:				message = "SUICIDE_FALLDEATH_MALE";
ADDRLP4 8
ADDRGP4 $220
ASGNP4
line 189
;189:			break;
ADDRGP4 $188
JUMPV
LABELV $187
line 191
;190:		default:
;191:			if ( gender == GENDER_FEMALE )
ADDRLP4 92
INDIRI4
CNSTI4 1
NEI4 $221
line 192
;192:				message = "SUICIDE_GENERICDEATH_FEMALE";
ADDRLP4 8
ADDRGP4 $223
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $221
line 193
;193:			else if ( gender == GENDER_NEUTER )
ADDRLP4 92
INDIRI4
CNSTI4 2
NEI4 $224
line 194
;194:				message = "SUICIDE_GENERICDEATH_GENDERLESS";
ADDRLP4 8
ADDRGP4 $226
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $224
line 196
;195:			else
;196:				message = "SUICIDE_GENERICDEATH_MALE";
ADDRLP4 8
ADDRGP4 $227
ASGNP4
line 197
;197:			break;
LABELV $188
line 199
;198:		}
;199:	}
LABELV $185
line 201
;200:
;201:	if (target != attacker && target < MAX_CLIENTS && attacker < MAX_CLIENTS)
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $230
ADDRLP4 124
CNSTI4 32
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 124
INDIRI4
GEI4 $230
ADDRLP4 0
INDIRI4
ADDRLP4 124
INDIRI4
GEI4 $230
line 202
;202:	{
line 203
;203:		goto clientkilled;
ADDRGP4 $232
JUMPV
LABELV $230
line 206
;204:	}
;205:
;206:	if (message) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $233
line 207
;207:		gender = ci->gender;
ADDRLP4 92
ADDRLP4 88
INDIRP4
CNSTI4 480
ADDP4
INDIRI4
ASGNI4
line 209
;208:
;209:		if (!message[0])
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $235
line 210
;210:		{
line 211
;211:			if ( gender == GENDER_FEMALE )
ADDRLP4 92
INDIRI4
CNSTI4 1
NEI4 $237
line 212
;212:				message = "SUICIDE_GENERICDEATH_FEMALE";
ADDRLP4 8
ADDRGP4 $223
ASGNP4
ADDRGP4 $238
JUMPV
LABELV $237
line 213
;213:			else if ( gender == GENDER_NEUTER )
ADDRLP4 92
INDIRI4
CNSTI4 2
NEI4 $239
line 214
;214:				message = "SUICIDE_GENERICDEATH_GENDERLESS";
ADDRLP4 8
ADDRGP4 $226
ASGNP4
ADDRGP4 $240
JUMPV
LABELV $239
line 216
;215:			else
;216:				message = "SUICIDE_GENERICDEATH_MALE";
ADDRLP4 8
ADDRGP4 $227
ASGNP4
LABELV $240
LABELV $238
line 217
;217:		}
LABELV $235
line 218
;218:		message = (char *)CG_GetStripEdString("INGAMETEXT", message);
ADDRGP4 $241
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 128
INDIRP4
ASGNP4
line 220
;219:
;220:		CG_Printf( "%s %s\n", targetName, message);
ADDRGP4 $242
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 221
;221:		return;
ADDRGP4 $166
JUMPV
LABELV $233
LABELV $232
line 227
;222:	}
;223:
;224:clientkilled:
;225:
;226:	// check for kill messages from the current clientNum
;227:	if ( attacker == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $243
line 230
;228:		char	*s;
;229:
;230:		if ( cgs.gametype < GT_TEAM && cgs.gametype != GT_TOURNAMENT ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
GEI4 $246
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 3
EQI4 $246
line 231
;231:			if (cgs.gametype == GT_JEDIMASTER &&
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 2
NEI4 $250
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $250
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $250
ADDRGP4 cg+36
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $250
ADDRLP4 136
ADDRGP4 CG_ThereIsAMaster
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $250
line 236
;232:				attacker < MAX_CLIENTS &&
;233:				!ent->isJediMaster &&
;234:				!cg.snap->ps.isJediMaster &&
;235:				CG_ThereIsAMaster())
;236:			{
line 239
;237:				char part1[512];
;238:				char part2[512];
;239:				trap_SP_GetStringTextString("INGAMETEXT_KILLED_MESSAGE", part1, sizeof(part1));
ADDRGP4 $254
ARGP4
ADDRLP4 140
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 240
;240:				trap_SP_GetStringTextString("INGAMETEXT_JMKILLED_NOTJM", part2, sizeof(part2));
ADDRGP4 $255
ARGP4
ADDRLP4 652
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 241
;241:				s = va("%s %s\n%s\n", part1, targetName, part2);
ADDRGP4 $256
ARGP4
ADDRLP4 140
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 652
ARGP4
ADDRLP4 1164
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 128
ADDRLP4 1164
INDIRP4
ASGNP4
line 242
;242:			}
ADDRGP4 $247
JUMPV
LABELV $250
line 243
;243:			else if (cgs.gametype == GT_JEDIMASTER &&
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 2
NEI4 $257
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $257
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
NEI4 $257
ADDRGP4 cg+36
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
NEI4 $257
line 247
;244:				attacker < MAX_CLIENTS &&
;245:				!ent->isJediMaster &&
;246:				!cg.snap->ps.isJediMaster)
;247:			{ //no JM, saber must be out
line 249
;248:				char part1[512];
;249:				trap_SP_GetStringTextString("INGAMETEXT_KILLED_MESSAGE", part1, sizeof(part1));
ADDRGP4 $254
ARGP4
ADDRLP4 144
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 256
;250:				/*
;251:				kmsg1 = "for 0 points.\nGo for the saber!";
;252:				strcpy(part2, kmsg1);
;253:
;254:				s = va("%s %s %s\n", part1, targetName, part2);
;255:				*/
;256:				s = va("%s %s\n", part1, targetName);
ADDRGP4 $242
ARGP4
ADDRLP4 144
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 656
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 128
ADDRLP4 656
INDIRP4
ASGNP4
line 257
;257:			}
ADDRGP4 $247
JUMPV
LABELV $257
line 259
;258:			else
;259:			{
line 262
;260:				char sPlaceWith[256];
;261:				char sKilledStr[256];
;262:				trap_SP_GetStringTextString("INGAMETEXT_PLACE_WITH",     sPlaceWith, sizeof(sPlaceWith));
ADDRGP4 $261
ARGP4
ADDRLP4 144
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 263
;263:				trap_SP_GetStringTextString("INGAMETEXT_KILLED_MESSAGE", sKilledStr, sizeof(sKilledStr));
ADDRGP4 $254
ARGP4
ADDRLP4 400
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 265
;264:
;265:				s = va("%s %s.\n%s %s %i.", sKilledStr, targetName, 
ADDRGP4 cg+36
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 656
ADDRGP4 CG_PlaceString
CALLP4
ASGNP4
ADDRGP4 $262
ARGP4
ADDRLP4 400
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 656
INDIRP4
ARGP4
ADDRLP4 144
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
ARGI4
ADDRLP4 660
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 128
ADDRLP4 660
INDIRP4
ASGNP4
line 269
;266:					CG_PlaceString( cg.snap->ps.persistant[PERS_RANK] + 1 ), 
;267:					sPlaceWith,
;268:					cg.snap->ps.persistant[PERS_SCORE] );
;269:			}
line 270
;270:		} else {
ADDRGP4 $247
JUMPV
LABELV $246
line 272
;271:			char sKilledStr[256];
;272:			trap_SP_GetStringTextString("INGAMETEXT_KILLED_MESSAGE", sKilledStr, sizeof(sKilledStr));
ADDRGP4 $254
ARGP4
ADDRLP4 132
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 273
;273:			s = va("%s %s", sKilledStr, targetName );
ADDRGP4 $265
ARGP4
ADDRLP4 132
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 388
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 128
ADDRLP4 388
INDIRP4
ASGNP4
line 274
;274:		}
LABELV $247
line 275
;275:		if (!(cg_singlePlayerActive.integer && cg_cameraOrbit.integer)) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 cg_singlePlayerActive+12
INDIRI4
ADDRLP4 132
INDIRI4
EQI4 $270
ADDRGP4 cg_cameraOrbit+12
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $266
LABELV $270
line 276
;276:			CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRLP4 128
INDIRP4
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 277
;277:		} 
LABELV $266
line 279
;278:		// print the text message as well
;279:	}
LABELV $243
line 282
;280:
;281:	// check for double client messages
;282:	if ( !attackerInfo ) {
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $271
line 283
;283:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 284
;284:		strcpy( attackerName, "noname" );
ADDRLP4 56
ARGP4
ADDRGP4 $273
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 285
;285:	} else {
ADDRGP4 $272
JUMPV
LABELV $271
line 286
;286:		Q_strncpyz( attackerName, Info_ValueForKey( attackerInfo, "n" ), sizeof(attackerName) - 2);
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 $177
ARGP4
ADDRLP4 128
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 56
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 287
;287:		strcat( attackerName, S_COLOR_WHITE );
ADDRLP4 56
ARGP4
ADDRGP4 $178
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 289
;288:		// check for kill messages about the current clientNum
;289:		if ( target == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $274
line 290
;290:			Q_strncpyz( cg.killerName, attackerName, sizeof( cg.killerName ) );
ADDRGP4 cg+6996
ARGP4
ADDRLP4 56
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 291
;291:		}
LABELV $274
line 292
;292:	}
LABELV $272
line 294
;293:
;294:	if ( attacker != ENTITYNUM_WORLD ) {
ADDRLP4 0
INDIRI4
CNSTI4 1022
EQI4 $279
line 295
;295:		switch (mod) {
ADDRLP4 44
INDIRI4
CNSTI4 1
LTI4 $281
ADDRLP4 44
INDIRI4
CNSTI4 37
GTI4 $281
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $332-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $332
address $283
address $285
address $287
address $289
address $289
address $291
address $293
address $293
address $295
address $297
address $299
address $301
address $301
address $303
address $303
address $305
address $307
address $309
address $309
address $311
address $311
address $313
address $313
address $315
address $317
address $319
address $321
address $323
address $281
address $281
address $281
address $327
address $325
address $329
address $281
address $281
address $331
code
LABELV $283
line 297
;296:		case MOD_STUN_BATON:
;297:			message = "KILLED_STUN";
ADDRLP4 8
ADDRGP4 $284
ASGNP4
line 298
;298:			break;
ADDRGP4 $282
JUMPV
LABELV $285
line 300
;299:		case MOD_MELEE:
;300:			message = "KILLED_MELEE";
ADDRLP4 8
ADDRGP4 $286
ASGNP4
line 301
;301:			break;
ADDRGP4 $282
JUMPV
LABELV $287
line 303
;302:		case MOD_SABER:
;303:			message = "KILLED_SABER";
ADDRLP4 8
ADDRGP4 $288
ASGNP4
line 304
;304:			break;
ADDRGP4 $282
JUMPV
LABELV $289
line 307
;305:		case MOD_BRYAR_PISTOL:
;306:		case MOD_BRYAR_PISTOL_ALT:
;307:			message = "KILLED_BRYAR";
ADDRLP4 8
ADDRGP4 $290
ASGNP4
line 308
;308:			break;
ADDRGP4 $282
JUMPV
LABELV $291
line 310
;309:		case MOD_BLASTER:
;310:			message = "KILLED_BLASTER";
ADDRLP4 8
ADDRGP4 $292
ASGNP4
line 311
;311:			break;
ADDRGP4 $282
JUMPV
LABELV $293
line 314
;312:		case MOD_DISRUPTOR:
;313:		case MOD_DISRUPTOR_SPLASH:
;314:			message = "KILLED_DISRUPTOR";
ADDRLP4 8
ADDRGP4 $294
ASGNP4
line 315
;315:			break;
ADDRGP4 $282
JUMPV
LABELV $295
line 317
;316:		case MOD_DISRUPTOR_SNIPER:
;317:			message = "KILLED_DISRUPTORSNIPE";
ADDRLP4 8
ADDRGP4 $296
ASGNP4
line 318
;318:			break;
ADDRGP4 $282
JUMPV
LABELV $297
line 320
;319:		case MOD_BOWCASTER:
;320:			message = "KILLED_BOWCASTER";
ADDRLP4 8
ADDRGP4 $298
ASGNP4
line 321
;321:			break;
ADDRGP4 $282
JUMPV
LABELV $299
line 323
;322:		case MOD_REPEATER:
;323:			message = "KILLED_REPEATER";
ADDRLP4 8
ADDRGP4 $300
ASGNP4
line 324
;324:			break;
ADDRGP4 $282
JUMPV
LABELV $301
line 327
;325:		case MOD_REPEATER_ALT:
;326:		case MOD_REPEATER_ALT_SPLASH:
;327:			message = "KILLED_REPEATERALT";
ADDRLP4 8
ADDRGP4 $302
ASGNP4
line 328
;328:			break;
ADDRGP4 $282
JUMPV
LABELV $303
line 331
;329:		case MOD_DEMP2:
;330:		case MOD_DEMP2_ALT:
;331:			message = "KILLED_DEMP2";
ADDRLP4 8
ADDRGP4 $304
ASGNP4
line 332
;332:			break;
ADDRGP4 $282
JUMPV
LABELV $305
line 334
;333:		case MOD_FLECHETTE:
;334:			message = "KILLED_FLECHETTE";
ADDRLP4 8
ADDRGP4 $306
ASGNP4
line 335
;335:			break;
ADDRGP4 $282
JUMPV
LABELV $307
line 337
;336:		case MOD_FLECHETTE_ALT_SPLASH:
;337:			message = "KILLED_FLECHETTE_MINE";
ADDRLP4 8
ADDRGP4 $308
ASGNP4
line 338
;338:			break;
ADDRGP4 $282
JUMPV
LABELV $309
line 341
;339:		case MOD_ROCKET:
;340:		case MOD_ROCKET_SPLASH:
;341:			message = "KILLED_ROCKET";
ADDRLP4 8
ADDRGP4 $310
ASGNP4
line 342
;342:			break;
ADDRGP4 $282
JUMPV
LABELV $311
line 345
;343:		case MOD_ROCKET_HOMING:
;344:		case MOD_ROCKET_HOMING_SPLASH:
;345:			message = "KILLED_ROCKET_HOMING";
ADDRLP4 8
ADDRGP4 $312
ASGNP4
line 346
;346:			break;
ADDRGP4 $282
JUMPV
LABELV $313
line 349
;347:		case MOD_THERMAL:
;348:		case MOD_THERMAL_SPLASH:
;349:			message = "KILLED_THERMAL";
ADDRLP4 8
ADDRGP4 $314
ASGNP4
line 350
;350:			break;
ADDRGP4 $282
JUMPV
LABELV $315
line 352
;351:		case MOD_TRIP_MINE_SPLASH:
;352:			message = "KILLED_TRIPMINE";
ADDRLP4 8
ADDRGP4 $316
ASGNP4
line 353
;353:			break;
ADDRGP4 $282
JUMPV
LABELV $317
line 355
;354:		case MOD_TIMED_MINE_SPLASH:
;355:			message = "KILLED_TRIPMINE_TIMED";
ADDRLP4 8
ADDRGP4 $318
ASGNP4
line 356
;356:			break;
ADDRGP4 $282
JUMPV
LABELV $319
line 358
;357:		case MOD_DET_PACK_SPLASH:
;358:			message = "KILLED_DETPACK";
ADDRLP4 8
ADDRGP4 $320
ASGNP4
line 359
;359:			break;
ADDRGP4 $282
JUMPV
LABELV $321
line 361
;360:		case MOD_FORCE_DARK:
;361:			message = "KILLED_DARKFORCE";
ADDRLP4 8
ADDRGP4 $322
ASGNP4
line 362
;362:			break;
ADDRGP4 $282
JUMPV
LABELV $323
line 364
;363:		case MOD_SENTRY:
;364:			message = "KILLED_SENTRY";
ADDRLP4 8
ADDRGP4 $324
ASGNP4
line 365
;365:			break;
ADDRGP4 $282
JUMPV
LABELV $325
line 367
;366:		case MOD_TELEFRAG:
;367:			message = "KILLED_TELEFRAG";
ADDRLP4 8
ADDRGP4 $326
ASGNP4
line 368
;368:			break;
ADDRGP4 $282
JUMPV
LABELV $327
line 370
;369:		case MOD_CRUSH:
;370:			message = "KILLED_GENERIC";//"KILLED_FORCETOSS";
ADDRLP4 8
ADDRGP4 $328
ASGNP4
line 371
;371:			break;
ADDRGP4 $282
JUMPV
LABELV $329
line 373
;372:		case MOD_FALLING:
;373:			message = "KILLED_FORCETOSS";
ADDRLP4 8
ADDRGP4 $330
ASGNP4
line 374
;374:			break;
ADDRGP4 $282
JUMPV
LABELV $331
line 376
;375:		case MOD_TRIGGER_HURT:
;376:			message = "KILLED_GENERIC";//"KILLED_FORCETOSS";
ADDRLP4 8
ADDRGP4 $328
ASGNP4
line 377
;377:			break;
ADDRGP4 $282
JUMPV
LABELV $281
line 379
;378:		default:
;379:			message = "KILLED_GENERIC";
ADDRLP4 8
ADDRGP4 $328
ASGNP4
line 380
;380:			break;
LABELV $282
line 383
;381:		}
;382:
;383:		if (message) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $334
line 384
;384:			message = (char *)CG_GetStripEdString("INGAMETEXT", message);
ADDRGP4 $241
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 132
INDIRP4
ASGNP4
line 386
;385:
;386:			CG_Printf( "%s %s %s\n", 
ADDRGP4 $336
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 56
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 388
;387:				targetName, message, attackerName);
;388:			return;
ADDRGP4 $166
JUMPV
LABELV $334
line 390
;389:		}
;390:	}
LABELV $279
line 393
;391:
;392:	// we don't know what it was
;393:	CG_Printf( "%s %s\n", targetName, (char *)CG_GetStripEdString("INGAMETEXT", "DIED_GENERIC") );
ADDRGP4 $241
ARGP4
ADDRGP4 $182
ARGP4
ADDRLP4 128
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $242
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 394
;394:}
LABELV $166
endproc CG_Obituary 1168 24
export CG_ToggleBinoculars
proc CG_ToggleBinoculars 0 16
line 399
;395:
;396://==========================================================================
;397:
;398:void CG_ToggleBinoculars(centity_t *cent, int forceZoom)
;399:{
line 400
;400:	if (cent->currentState.number != cg.snap->ps.clientNum)
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
EQI4 $338
line 401
;401:	{
line 402
;402:		return;
ADDRGP4 $337
JUMPV
LABELV $338
line 405
;403:	}
;404:
;405:	if (cg.snap->ps.weaponstate != WEAPON_READY)
ADDRGP4 cg+36
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 0
EQI4 $341
line 406
;406:	{ //So we can't fool it and reactivate while switching to the saber or something.
line 407
;407:		return;
ADDRGP4 $337
JUMPV
LABELV $341
line 410
;408:	}
;409:
;410:	if (cg.snap->ps.weapon == WP_SABER)
ADDRGP4 cg+36
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 2
NEI4 $344
line 411
;411:	{ //No.
line 412
;412:		return;
ADDRGP4 $337
JUMPV
LABELV $344
line 415
;413:	}
;414:
;415:	if (forceZoom)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $347
line 416
;416:	{
line 417
;417:		if (forceZoom == 2)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $349
line 418
;418:		{
line 419
;419:			cg.snap->ps.zoomMode = 0;
ADDRGP4 cg+36
INDIRP4
CNSTI4 1376
ADDP4
CNSTI4 0
ASGNI4
line 420
;420:		}
ADDRGP4 $350
JUMPV
LABELV $349
line 421
;421:		else if (forceZoom == 1)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $352
line 422
;422:		{
line 423
;423:			cg.snap->ps.zoomMode = 2;
ADDRGP4 cg+36
INDIRP4
CNSTI4 1376
ADDP4
CNSTI4 2
ASGNI4
line 424
;424:		}
LABELV $352
LABELV $350
line 425
;425:	}
LABELV $347
line 427
;426:
;427:	if (cg.snap->ps.zoomMode == 0)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1376
ADDP4
INDIRI4
CNSTI4 0
NEI4 $355
line 428
;428:	{
line 429
;429:		trap_S_StartSound( NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.media.zoomStart );
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+1252
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 430
;430:	}
ADDRGP4 $356
JUMPV
LABELV $355
line 431
;431:	else if (cg.snap->ps.zoomMode == 2)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1376
ADDP4
INDIRI4
CNSTI4 2
NEI4 $361
line 432
;432:	{
line 433
;433:		trap_S_StartSound( NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.media.zoomEnd );
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+1260
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 434
;434:	}
LABELV $361
LABELV $356
line 435
;435:}
LABELV $337
endproc CG_ToggleBinoculars 0 16
proc CG_UseItem 32 16
line 442
;436:
;437:/*
;438:===============
;439:CG_UseItem
;440:===============
;441:*/
;442:static void CG_UseItem( centity_t *cent ) {
line 448
;443:	clientInfo_t *ci;
;444:	int			itemNum, clientNum;
;445:	gitem_t		*item;
;446:	entityState_t *es;
;447:
;448:	es = &cent->currentState;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 450
;449:	
;450:	itemNum = (es->event & ~EV_EVENT_BITS) - EV_USE_ITEM0;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 40
SUBI4
ASGNI4
line 451
;451:	if ( itemNum < 0 || itemNum > HI_NUM_HOLDABLE ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $370
ADDRLP4 0
INDIRI4
CNSTI4 7
LEI4 $368
LABELV $370
line 452
;452:		itemNum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 453
;453:	}
LABELV $368
line 456
;454:
;455:	// print a message if the local player
;456:	if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $371
line 457
;457:		if ( !itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $374
line 459
;458:			//CG_CenterPrint( "No item to use", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
;459:		} else {
ADDRGP4 $375
JUMPV
LABELV $374
line 460
;460:			item = BG_FindItemForHoldable( itemNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindItemForHoldable
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 24
INDIRP4
ASGNP4
line 461
;461:		}
LABELV $375
line 462
;462:	}
LABELV $371
line 464
;463:
;464:	switch ( itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $377
ADDRLP4 0
INDIRI4
CNSTI4 6
GTI4 $377
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $391
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $391
address $377
address $380
address $377
address $384
address $377
address $379
address $377
code
line 468
;465:	default:
;466:	case HI_NONE:
;467:		//trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useNothingSound );
;468:		break;
LABELV $379
line 471
;469:
;470:	case HI_BINOCULARS:
;471:		CG_ToggleBinoculars(cent, es->eventParm);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ToggleBinoculars
CALLV
pop
line 472
;472:		break;
ADDRGP4 $377
JUMPV
LABELV $380
line 475
;473:
;474:	case HI_SEEKER:
;475:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.deploySeeker );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+768
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 476
;476:		break;
ADDRGP4 $377
JUMPV
line 481
;477:
;478:	case HI_SHIELD:
;479:	case HI_DATAPAD:
;480:	case HI_SENTRY_GUN:
;481:		break;
LABELV $384
line 485
;482:
;483://	case HI_MEDKIT:
;484:	case HI_MEDPAC:
;485:		clientNum = cent->currentState.clientNum;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ASGNI4
line 486
;486:		if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 28
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $385
ADDRLP4 28
INDIRI4
CNSTI4 32
GEI4 $385
line 487
;487:			ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 16
CNSTI4 788
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 488
;488:			ci->medkitUsageTime = cg.time;
ADDRLP4 16
INDIRP4
CNSTI4 152
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 489
;489:		}
LABELV $385
line 490
;490:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.medkitSound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+772
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 491
;491:		break;
LABELV $377
line 494
;492:	}
;493:
;494:	if (cg.snap && cg.snap->ps.clientNum == cent->currentState.number && itemNum != HI_BINOCULARS)
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $392
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $392
ADDRLP4 0
INDIRI4
CNSTI4 5
EQI4 $392
line 495
;495:	{ //if not using binoculars, we just used that item up, so switch
line 496
;496:		BG_CycleInven(&cg.snap->ps, 1);
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_CycleInven
CALLV
pop
line 497
;497:		cg.itemSelect = -1; //update the client-side selection display
ADDRGP4 cg+3516
CNSTI4 -1
ASGNI4
line 498
;498:	}
LABELV $392
line 499
;499:}
LABELV $367
endproc CG_UseItem 32 16
proc CG_ItemPickup 1044 12
line 509
;500:
;501:
;502:/*
;503:================
;504:CG_ItemPickup
;505:
;506:A new item was picked up this frame
;507:================
;508:*/
;509:static void CG_ItemPickup( int itemNum ) {
line 510
;510:	cg.itemPickup = itemNum;
ADDRGP4 cg+13360
ADDRFP4 0
INDIRI4
ASGNI4
line 511
;511:	cg.itemPickupTime = cg.time;
ADDRGP4 cg+13364
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 512
;512:	cg.itemPickupBlendTime = cg.time;
ADDRGP4 cg+13368
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 514
;513:	// see if it should be the grabbed weapon
;514:	if ( cg.snap && bg_itemlist[itemNum].giType == IT_WEAPON ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $404
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $404
line 521
;515:
;516:		// 0 == no switching
;517:		// 1 == automatically switch to best SAFE weapon
;518:		// 2 == automatically switch to best weapon, safe or otherwise
;519:		// 3 == if not saber, automatically switch to best weapon, safe or otherwise
;520:
;521:		if (0 == cg_autoswitch.integer)
ADDRGP4 cg_autoswitch+12
INDIRI4
CNSTI4 0
NEI4 $408
line 522
;522:		{
line 524
;523:			// don't switch
;524:		}
ADDRGP4 $409
JUMPV
LABELV $408
line 525
;525:		else if ( cg_autoswitch.integer == 1)
ADDRGP4 cg_autoswitch+12
INDIRI4
CNSTI4 1
NEI4 $411
line 526
;526:		{ //only autoselect if not explosive ("safe")
line 527
;527:			if (bg_itemlist[itemNum].giTag != WP_TRIP_MINE &&
ADDRLP4 0
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 12
EQI4 $412
ADDRLP4 0
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 13
EQI4 $412
ADDRLP4 0
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 11
EQI4 $412
ADDRLP4 0
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 10
EQI4 $412
ADDRLP4 4
CNSTI4 192
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
LEI4 $412
ADDRGP4 cg+36
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $412
line 533
;528:				bg_itemlist[itemNum].giTag != WP_DET_PACK &&
;529:				bg_itemlist[itemNum].giTag != WP_THERMAL &&
;530:				bg_itemlist[itemNum].giTag != WP_ROCKET_LAUNCHER &&
;531:				bg_itemlist[itemNum].giTag > cg.snap->ps.weapon &&
;532:				cg.snap->ps.weapon != WP_SABER)
;533:			{
line 534
;534:				if (!cg.snap->ps.emplacedIndex)
ADDRGP4 cg+36
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
NEI4 $423
line 535
;535:				{
line 536
;536:					cg.weaponSelectTime = cg.time;
ADDRGP4 cg+13372
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 537
;537:				}
LABELV $423
line 538
;538:				cg.weaponSelect = bg_itemlist[itemNum].giTag;
ADDRGP4 cg+3508
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 539
;539:			}
line 540
;540:		}
ADDRGP4 $412
JUMPV
LABELV $411
line 541
;541:		else if ( cg_autoswitch.integer == 2)
ADDRGP4 cg_autoswitch+12
INDIRI4
CNSTI4 2
NEI4 $430
line 542
;542:		{ //autoselect if better
line 543
;543:			if (bg_itemlist[itemNum].giTag > cg.snap->ps.weapon &&
ADDRLP4 0
CNSTI4 192
ASGNI4
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRI4
LEI4 $433
ADDRGP4 cg+36
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $433
line 545
;544:				cg.snap->ps.weapon != WP_SABER)
;545:			{
line 546
;546:				if (!cg.snap->ps.emplacedIndex)
ADDRGP4 cg+36
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
NEI4 $438
line 547
;547:				{
line 548
;548:					cg.weaponSelectTime = cg.time;
ADDRGP4 cg+13372
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 549
;549:				}
LABELV $438
line 550
;550:				cg.weaponSelect = bg_itemlist[itemNum].giTag;
ADDRGP4 cg+3508
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 551
;551:			}
LABELV $433
line 552
;552:		}
LABELV $430
LABELV $412
LABELV $409
line 568
;553:		/*
;554:		else if ( cg_autoswitch.integer == 3)
;555:		{ //autoselect if better and not using the saber as a weapon
;556:			if (bg_itemlist[itemNum].giTag > cg.snap->ps.weapon &&
;557:				cg.snap->ps.weapon != WP_SABER)
;558:			{
;559:				if (!cg.snap->ps.emplacedIndex)
;560:				{
;561:					cg.weaponSelectTime = cg.time;
;562:				}
;563:				cg.weaponSelect = bg_itemlist[itemNum].giTag;
;564:			}
;565:		}
;566:		*/
;567:		//No longer required - just not switching ever if using saber
;568:	}
LABELV $404
line 571
;569:
;570:	//rww - print pickup messages
;571:	if (bg_itemlist[itemNum].classname && bg_itemlist[itemNum].classname[0] &&
ADDRLP4 0
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRGP4 bg_itemlist
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $445
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $445
ADDRLP4 0
INDIRI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $450
ADDRLP4 0
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 4
EQI4 $445
ADDRLP4 0
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 5
EQI4 $445
LABELV $450
line 573
;572:		(bg_itemlist[itemNum].giType != IT_TEAM || (bg_itemlist[itemNum].giTag != PW_REDFLAG && bg_itemlist[itemNum].giTag != PW_BLUEFLAG)) )
;573:	{ //don't print messages for flags, they have their own pickup event broadcasts
line 576
;574:		char	text[1024];
;575:
;576:		if ( trap_SP_GetStringTextString( va("INGAME_%s",bg_itemlist[itemNum].classname), text, sizeof( text )))
ADDRGP4 $453
ARGP4
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1036
ADDRGP4 trap_SP_GetStringTextString
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $451
line 577
;577:		{
line 578
;578:			Com_Printf("%s %s\n", CG_GetStripEdString("INGAMETEXT", "PICKUPLINE"), text);
ADDRGP4 $241
ARGP4
ADDRGP4 $454
ARGP4
ADDRLP4 1040
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $242
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 579
;579:		}
ADDRGP4 $452
JUMPV
LABELV $451
line 581
;580:		else
;581:		{
line 582
;582:			Com_Printf("%s %s\n", CG_GetStripEdString("INGAMETEXT", "PICKUPLINE"), bg_itemlist[itemNum].classname);
ADDRGP4 $241
ARGP4
ADDRGP4 $454
ARGP4
ADDRLP4 1040
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $242
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 583
;583:		}
LABELV $452
line 584
;584:	}
LABELV $445
line 585
;585:}
LABELV $398
endproc CG_ItemPickup 1044 12
export CG_PainEvent
proc CG_PainEvent 12 16
line 595
;586:
;587:
;588:/*
;589:================
;590:CG_PainEvent
;591:
;592:Also called by playerstate transition
;593:================
;594:*/
;595:void CG_PainEvent( centity_t *cent, int health ) {
line 599
;596:	char	*snd;
;597:
;598:	// don't do more than two pain sounds a second
;599:	if ( cg.time - cent->pe.painTime < 500 ) {
ADDRGP4 cg+64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRI4
SUBI4
CNSTI4 500
GEI4 $456
line 600
;600:		return;
ADDRGP4 $455
JUMPV
LABELV $456
line 603
;601:	}
;602:
;603:	if ( health < 25 ) {
ADDRFP4 4
INDIRI4
CNSTI4 25
GEI4 $459
line 604
;604:		snd = "*pain25.wav";
ADDRLP4 0
ADDRGP4 $461
ASGNP4
line 605
;605:	} else if ( health < 50 ) {
ADDRGP4 $460
JUMPV
LABELV $459
ADDRFP4 4
INDIRI4
CNSTI4 50
GEI4 $462
line 606
;606:		snd = "*pain50.wav";
ADDRLP4 0
ADDRGP4 $464
ASGNP4
line 607
;607:	} else if ( health < 75 ) {
ADDRGP4 $463
JUMPV
LABELV $462
ADDRFP4 4
INDIRI4
CNSTI4 75
GEI4 $465
line 608
;608:		snd = "*pain75.wav";
ADDRLP4 0
ADDRGP4 $467
ASGNP4
line 609
;609:	} else {
ADDRGP4 $466
JUMPV
LABELV $465
line 610
;610:		snd = "*pain100.wav";
ADDRLP4 0
ADDRGP4 $468
ASGNP4
line 611
;611:	}
LABELV $466
LABELV $463
LABELV $460
line 612
;612:	trap_S_StartSound( NULL, cent->currentState.number, CHAN_VOICE, 
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 616
;613:		CG_CustomSound( cent->currentState.number, snd ) );
;614:
;615:	// save pain time for programitic twitch animation
;616:	cent->pe.painTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 617
;617:	cent->pe.painDirection	^= 1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 618
;618:}
LABELV $455
endproc CG_PainEvent 12 16
export CG_ReattachLimb
proc CG_ReattachLimb 16 12
line 621
;619:
;620:void CG_ReattachLimb(centity_t *source)
;621:{
line 625
;622:	char *limbName;
;623:	char *stubCapName;
;624:
;625:	switch (source->torsoBolt)
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 10
LTI4 $471
ADDRLP4 8
INDIRI4
CNSTI4 16
GTI4 $471
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $495-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $495
address $474
address $477
address $480
address $483
address $486
address $489
address $492
code
line 626
;626:	{
LABELV $474
line 628
;627:	case G2_MODELPART_HEAD:
;628:		limbName = "head";
ADDRLP4 0
ADDRGP4 $475
ASGNP4
line 629
;629:		stubCapName = "torso_cap_head_off";
ADDRLP4 4
ADDRGP4 $476
ASGNP4
line 630
;630:		break;
ADDRGP4 $472
JUMPV
LABELV $477
line 632
;631:	case G2_MODELPART_WAIST:
;632:		limbName = "torso";
ADDRLP4 0
ADDRGP4 $478
ASGNP4
line 633
;633:		stubCapName = "hips_cap_torso_off";
ADDRLP4 4
ADDRGP4 $479
ASGNP4
line 634
;634:		break;
ADDRGP4 $472
JUMPV
LABELV $480
line 636
;635:	case G2_MODELPART_LARM:
;636:		limbName = "l_arm";
ADDRLP4 0
ADDRGP4 $481
ASGNP4
line 637
;637:		stubCapName = "torso_cap_l_arm_off";
ADDRLP4 4
ADDRGP4 $482
ASGNP4
line 638
;638:		break;
ADDRGP4 $472
JUMPV
LABELV $483
line 640
;639:	case G2_MODELPART_RARM:
;640:		limbName = "r_arm";
ADDRLP4 0
ADDRGP4 $484
ASGNP4
line 641
;641:		stubCapName = "torso_cap_r_arm_off";
ADDRLP4 4
ADDRGP4 $485
ASGNP4
line 642
;642:		break;
ADDRGP4 $472
JUMPV
LABELV $486
line 644
;643:	case G2_MODELPART_RHAND:
;644:		limbName = "r_hand";
ADDRLP4 0
ADDRGP4 $487
ASGNP4
line 645
;645:		stubCapName = "r_arm_cap_r_hand_off";
ADDRLP4 4
ADDRGP4 $488
ASGNP4
line 646
;646:		break;
ADDRGP4 $472
JUMPV
LABELV $489
line 648
;647:	case G2_MODELPART_LLEG:
;648:		limbName = "l_leg";
ADDRLP4 0
ADDRGP4 $490
ASGNP4
line 649
;649:		stubCapName = "hips_cap_l_leg_off";
ADDRLP4 4
ADDRGP4 $491
ASGNP4
line 650
;650:		break;
ADDRGP4 $472
JUMPV
LABELV $492
line 652
;651:	case G2_MODELPART_RLEG:
;652:		limbName = "r_leg";
ADDRLP4 0
ADDRGP4 $493
ASGNP4
line 653
;653:		stubCapName = "hips_cap_r_leg_off";
ADDRLP4 4
ADDRGP4 $494
ASGNP4
line 654
;654:		break;
ADDRGP4 $472
JUMPV
LABELV $471
line 656
;655:	default:
;656:		source->torsoBolt = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
CNSTI4 0
ASGNI4
line 657
;657:		source->ghoul2weapon = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 960
ADDP4
CNSTP4 0
ASGNP4
line 658
;658:		return;
ADDRGP4 $470
JUMPV
LABELV $472
line 661
;659:	}
;660:
;661:	trap_G2API_SetSurfaceOnOff(source->ghoul2, limbName, 0);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_G2API_SetSurfaceOnOff
CALLI4
pop
line 662
;662:	trap_G2API_SetSurfaceOnOff(source->ghoul2, stubCapName, 0x00000100);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_G2API_SetSurfaceOnOff
CALLI4
pop
line 664
;663:
;664:	source->torsoBolt = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
CNSTI4 0
ASGNI4
line 666
;665:
;666:	source->ghoul2weapon = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 960
ADDP4
CNSTP4 0
ASGNP4
line 667
;667:}
LABELV $470
endproc CG_ReattachLimb 16 12
proc CG_BodyQueueCopy 64 40
line 670
;668:
;669:static void CG_BodyQueueCopy(centity_t *cent, int clientNum, int knownWeapon)
;670:{
line 674
;671:	centity_t		*source;
;672:	animation_t		*anim;
;673:	float			animSpeed;
;674:	int				flags=BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 12
CNSTI4 72
ASGNI4
line 677
;675:	clientInfo_t	*ci;
;676:
;677:	if (cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $498
line 678
;678:	{
line 679
;679:		trap_G2API_CleanGhoul2Models(&cent->ghoul2);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 680
;680:	}
LABELV $498
line 682
;681:
;682:	if (clientNum < 0 || clientNum >= MAX_CLIENTS)
ADDRLP4 20
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $502
ADDRLP4 20
INDIRI4
CNSTI4 32
LTI4 $500
LABELV $502
line 683
;683:	{
line 684
;684:		return;
ADDRGP4 $497
JUMPV
LABELV $500
line 687
;685:	}
;686:
;687:	source = &cg_entities[ clientNum ];
ADDRLP4 4
CNSTI4 1920
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 688
;688:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 16
CNSTI4 788
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 690
;689:
;690:	if (!source)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $504
line 691
;691:	{
line 692
;692:		return;
ADDRGP4 $497
JUMPV
LABELV $504
line 695
;693:	}
;694:
;695:	if (!source->ghoul2)
ADDRLP4 4
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $506
line 696
;696:	{
line 697
;697:		return;
ADDRGP4 $497
JUMPV
LABELV $506
line 700
;698:	}
;699:
;700:	cent->isATST = source->isATST;
ADDRLP4 24
CNSTI4 1028
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 702
;701:
;702:	cent->dustTrailTime = source->dustTrailTime;
ADDRLP4 28
CNSTI4 616
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 704
;703:
;704:	trap_G2API_DuplicateGhoul2Instance(source->ghoul2, &cent->ghoul2);
ADDRLP4 32
CNSTI4 952
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
CALLV
pop
line 707
;705:
;706:	//either force the weapon from when we died or remove it if it was a dropped weapon
;707:	if (knownWeapon > WP_BRYAR_PISTOL && trap_G2API_HasGhoul2ModelOnIndex(&(cent->ghoul2), 1))
ADDRFP4 8
INDIRI4
CNSTI4 3
LEI4 $508
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 36
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $508
line 708
;708:	{
line 709
;709:		trap_G2API_RemoveGhoul2Model(&(cent->ghoul2), 1);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_G2API_RemoveGhoul2Model
CALLI4
pop
line 710
;710:	}
ADDRGP4 $509
JUMPV
LABELV $508
line 711
;711:	else if (trap_G2API_HasGhoul2ModelOnIndex(&(cent->ghoul2), 1))
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 40
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $510
line 712
;712:	{
line 713
;713:		trap_G2API_CopySpecificGhoul2Model(g2WeaponInstances[knownWeapon], 0, cent->ghoul2, 1);
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g2WeaponInstances
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_G2API_CopySpecificGhoul2Model
CALLV
pop
line 714
;714:	}
LABELV $510
LABELV $509
line 716
;715:
;716:	anim = &bgGlobalAnimations[ cent->currentState.torsoAnim ];
ADDRLP4 0
CNSTI4 28
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
ASGNP4
line 717
;717:	animSpeed = 50.0f / anim->frameLerp;
ADDRLP4 8
CNSTF4 1112014848
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 720
;718:
;719:	//this will just set us to the last frame of the animation, in theory
;720:	if (source->isATST)
ADDRLP4 4
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $512
line 721
;721:	{
line 722
;722:		int aNum = cgs.clientinfo[source->currentState.number].frame+1;
ADDRLP4 44
CNSTI4 788
ADDRLP4 4
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+76
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 723
;723:		anim = &bgGlobalAnimations[ BOTH_DEAD1 ];
ADDRLP4 0
ADDRGP4 bgGlobalAnimations+1316
ASGNP4
line 724
;724:		animSpeed = 1;
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
line 726
;725:
;726:		flags &= ~BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
ADDRGP4 $518
JUMPV
LABELV $517
line 729
;727:
;728:		while (aNum >= anim->firstFrame+anim->numFrames)
;729:		{
line 730
;730:			aNum--;
ADDRLP4 44
ADDRLP4 44
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 731
;731:		}
LABELV $518
line 728
ADDRLP4 44
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
GEI4 $517
line 733
;732:
;733:		trap_G2API_SetBoneAnim(cent->ghoul2, 0, "pelvis", aNum, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, 150);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $520
ARGP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 734
;734:	}
ADDRGP4 $513
JUMPV
LABELV $512
line 736
;735:	else
;736:	{
line 737
;737:		int aNum = cgs.clientinfo[source->currentState.number].frame+1;
ADDRLP4 44
CNSTI4 788
ADDRLP4 4
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+43024+76
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $525
JUMPV
LABELV $524
line 740
;738:
;739:		while (aNum >= anim->firstFrame+anim->numFrames)
;740:		{
line 741
;741:			aNum--;
ADDRLP4 44
ADDRLP4 44
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 742
;742:		}
LABELV $525
line 739
ADDRLP4 44
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
GEI4 $524
line 744
;743:
;744:		if (aNum < anim->firstFrame-1)
ADDRLP4 44
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $527
line 745
;745:		{ //wrong animation...?
line 746
;746:			aNum = (anim->firstFrame+anim->numFrames)-1;
ADDRLP4 44
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 747
;747:		}
LABELV $527
line 754
;748:
;749:		//if (!cgs.clientinfo[source->currentState.number].frame || (cent->currentState.torsoAnim&~ANIM_TOGGLEBIT) != (source->currentState.torsoAnim&~ANIM_TOGGLEBIT) )
;750:		//{
;751:		//	aNum = (anim->firstFrame+anim->numFrames)-1;
;752:		//}
;753:
;754:		trap_G2API_SetBoneAnim(cent->ghoul2, 0, "upper_lumbar", aNum, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, 150);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $529
ARGP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 755
;755:		trap_G2API_SetBoneAnim(cent->ghoul2, 0, "model_root", aNum, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, 150);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $531
ARGP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 756
;756:		trap_G2API_SetBoneAnim(cent->ghoul2, 0, "Motion", aNum, anim->firstFrame + anim->numFrames, flags, animSpeed, cg.time, -1, 150);
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $533
ARGP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cg+64
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 757
;757:	}
LABELV $513
line 760
;758:
;759:	//After we create the bodyqueue, regenerate any limbs on the real instance
;760:	if (source->torsoBolt)
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
CNSTI4 0
EQI4 $535
line 761
;761:	{
line 762
;762:		CG_ReattachLimb(source);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 CG_ReattachLimb
CALLV
pop
line 763
;763:	}
LABELV $535
line 764
;764:}
LABELV $497
endproc CG_BodyQueueCopy 64 40
export CG_TeamName
proc CG_TeamName 0 0
line 767
;765:
;766:const char *CG_TeamName(int team)
;767:{
line 768
;768:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $538
line 769
;769:		return "RED";
ADDRGP4 $540
RETP4
ADDRGP4 $537
JUMPV
LABELV $538
line 770
;770:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $541
line 771
;771:		return "BLUE";
ADDRGP4 $543
RETP4
ADDRGP4 $537
JUMPV
LABELV $541
line 772
;772:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $544
line 773
;773:		return "SPECTATOR";
ADDRGP4 $546
RETP4
ADDRGP4 $537
JUMPV
LABELV $544
line 774
;774:	return "FREE";
ADDRGP4 $547
RETP4
LABELV $537
endproc CG_TeamName 0 0
export CG_PrintCTFMessage
proc CG_PrintCTFMessage 1076 20
line 778
;775:}
;776:
;777:void CG_PrintCTFMessage(clientInfo_t *ci, const char *teamName, int ctfMessage)
;778:{
line 780
;779:	char printMsg[1024];
;780:	char *refName = NULL;
ADDRLP4 1028
CNSTP4 0
ASGNP4
line 781
;781:	const char *stripEdString = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 783
;782:
;783:	switch (ctfMessage)
ADDRLP4 1032
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
LTI4 $548
ADDRLP4 1032
INDIRI4
CNSTI4 4
GTI4 $548
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $561
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $561
address $551
address $553
address $555
address $557
address $559
code
line 784
;784:	{
LABELV $551
line 786
;785:	case CTFMESSAGE_FRAGGED_FLAG_CARRIER:
;786:		refName = "FRAGGED_FLAG_CARRIER";
ADDRLP4 1028
ADDRGP4 $552
ASGNP4
line 787
;787:		break;
ADDRGP4 $550
JUMPV
LABELV $553
line 789
;788:	case CTFMESSAGE_FLAG_RETURNED:
;789:		refName = "FLAG_RETURNED";
ADDRLP4 1028
ADDRGP4 $554
ASGNP4
line 790
;790:		break;
ADDRGP4 $550
JUMPV
LABELV $555
line 792
;791:	case CTFMESSAGE_PLAYER_RETURNED_FLAG:
;792:		refName = "PLAYER_RETURNED_FLAG";
ADDRLP4 1028
ADDRGP4 $556
ASGNP4
line 793
;793:		break;
ADDRGP4 $550
JUMPV
LABELV $557
line 795
;794:	case CTFMESSAGE_PLAYER_CAPTURED_FLAG:
;795:		refName = "PLAYER_CAPTURED_FLAG";
ADDRLP4 1028
ADDRGP4 $558
ASGNP4
line 796
;796:		break;
ADDRGP4 $550
JUMPV
LABELV $559
line 798
;797:	case CTFMESSAGE_PLAYER_GOT_FLAG:
;798:		refName = "PLAYER_GOT_FLAG";
ADDRLP4 1028
ADDRGP4 $560
ASGNP4
line 799
;799:		break;
line 801
;800:	default:
;801:		return;
LABELV $550
line 804
;802:	}
;803:
;804:	stripEdString = CG_GetStripEdString("INGAMETEXT", refName);
ADDRGP4 $241
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1036
INDIRP4
ASGNP4
line 806
;805:
;806:	if (!stripEdString || !stripEdString[0])
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $564
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $562
LABELV $564
line 807
;807:	{
line 808
;808:		return;
ADDRGP4 $548
JUMPV
LABELV $562
line 811
;809:	}
;810:
;811:	if (teamName && teamName[0])
ADDRLP4 1044
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1044
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $565
ADDRLP4 1044
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $565
line 812
;812:	{
line 813
;813:		const char *f = strstr(stripEdString, "%s");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $567
ARGP4
ADDRLP4 1052
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 1048
ADDRLP4 1052
INDIRP4
ASGNP4
line 815
;814:
;815:		if (f)
ADDRLP4 1048
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $568
line 816
;816:		{
line 817
;817:			int strLen = 0;
ADDRLP4 1060
CNSTI4 0
ASGNI4
line 818
;818:			int i = 0;
ADDRLP4 1056
CNSTI4 0
ASGNI4
line 820
;819:
;820:			if (ci)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $574
line 821
;821:			{
line 822
;822:				Com_sprintf(printMsg, sizeof(printMsg), "%s ", ci->name);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $572
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 823
;823:				strLen = strlen(printMsg);
ADDRLP4 4
ARGP4
ADDRLP4 1064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1060
ADDRLP4 1064
INDIRI4
ASGNI4
line 824
;824:			}
ADDRGP4 $574
JUMPV
LABELV $573
line 827
;825:
;826:			while (stripEdString[i] && i < 512)
;827:			{
line 828
;828:				if (stripEdString[i] == '%' &&
ADDRLP4 1056
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 37
NEI4 $576
ADDRLP4 1056
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 115
NEI4 $576
line 830
;829:					stripEdString[i+1] == 's')
;830:				{
line 831
;831:					printMsg[strLen] = '\0';
ADDRLP4 1060
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 832
;832:					Q_strcat(printMsg, sizeof(printMsg), teamName);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 833
;833:					strLen = strlen(printMsg);
ADDRLP4 4
ARGP4
ADDRLP4 1072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1060
ADDRLP4 1072
INDIRI4
ASGNI4
line 835
;834:
;835:					i++;
ADDRLP4 1056
ADDRLP4 1056
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 836
;836:				}
ADDRGP4 $577
JUMPV
LABELV $576
line 838
;837:				else
;838:				{
line 839
;839:					printMsg[strLen] = stripEdString[i];
ADDRLP4 1060
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 1056
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 840
;840:					strLen++;
ADDRLP4 1060
ADDRLP4 1060
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 841
;841:				}
LABELV $577
line 843
;842:
;843:				i++;
ADDRLP4 1056
ADDRLP4 1056
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 844
;844:			}
LABELV $574
line 826
ADDRLP4 1056
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $578
ADDRLP4 1056
INDIRI4
CNSTI4 512
LTI4 $573
LABELV $578
line 846
;845:
;846:			printMsg[strLen] = '\0';
ADDRLP4 1060
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 848
;847:
;848:			goto doPrint;
ADDRGP4 $579
JUMPV
LABELV $568
line 850
;849:		}
;850:	}
LABELV $565
line 852
;851:
;852:	if (ci)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $580
line 853
;853:	{
line 854
;854:		Com_sprintf(printMsg, sizeof(printMsg), "%s %s", ci->name, stripEdString);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $265
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 855
;855:	}
ADDRGP4 $581
JUMPV
LABELV $580
line 857
;856:	else
;857:	{
line 858
;858:		Com_sprintf(printMsg, sizeof(printMsg), "%s", stripEdString);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 859
;859:	}
LABELV $581
LABELV $579
line 862
;860:
;861:doPrint:
;862:	Com_Printf("%s\n", printMsg);
ADDRGP4 $582
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 863
;863:}
LABELV $548
endproc CG_PrintCTFMessage 1076 20
export CG_GetCTFMessageEvent
proc CG_GetCTFMessageEvent 20 12
line 866
;864:
;865:void CG_GetCTFMessageEvent(entityState_t *es)
;866:{
line 867
;867:	int clIndex = es->trickedentindex;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 868
;868:	int teamIndex = es->trickedentindex2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 869
;869:	clientInfo_t *ci = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 870
;870:	const char *teamName = NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
line 872
;871:
;872:	if (clIndex < MAX_CLIENTS)
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $584
line 873
;873:	{
line 874
;874:		ci = &cgs.clientinfo[clIndex];
ADDRLP4 8
CNSTI4 788
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 875
;875:	}
LABELV $584
line 877
;876:
;877:	if (teamIndex < 50)
ADDRLP4 4
INDIRI4
CNSTI4 50
GEI4 $587
line 878
;878:	{
line 879
;879:		teamName = CG_TeamName(teamIndex);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 CG_TeamName
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 880
;880:	}
LABELV $587
line 882
;881:
;882:	CG_PrintCTFMessage(ci, teamName, es->eventParm);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PrintCTFMessage
CALLV
pop
line 883
;883:}
LABELV $583
endproc CG_GetCTFMessageEvent 20 12
export DoFall
proc DoFall 8 16
line 886
;884:
;885:void DoFall(centity_t *cent, entityState_t *es, int clientNum)
;886:{
line 887
;887:	int delta = es->eventParm;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ASGNI4
line 889
;888:
;889:	if (cent->currentState.eFlags & EF_DEAD)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $590
line 890
;890:	{ //corpses crack into the ground ^_^
line 891
;891:		if (delta > 25)
ADDRLP4 0
INDIRI4
CNSTI4 25
LEI4 $592
line 892
;892:		{
line 893
;893:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.fallSound );
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+716
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 894
;894:		}
ADDRGP4 $591
JUMPV
LABELV $592
line 896
;895:		else
;896:		{
line 897
;897:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, trap_S_RegisterSound( "sound/movers/objects/objectHit.wav" ) );
ADDRGP4 $596
ARGP4
ADDRLP4 4
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 898
;898:		}
line 899
;899:	}
ADDRGP4 $591
JUMPV
LABELV $590
line 900
;900:	else if (delta > 50)
ADDRLP4 0
INDIRI4
CNSTI4 50
LEI4 $597
line 901
;901:	{
line 902
;902:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.fallSound );
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+716
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 903
;903:		trap_S_StartSound( NULL, cent->currentState.number, CHAN_VOICE, 
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $601
ARGP4
ADDRLP4 4
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 905
;904:			CG_CustomSound( cent->currentState.number, "*land1.wav" ) );
;905:		cent->pe.painTime = cg.time;	// don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 906
;906:	}
ADDRGP4 $598
JUMPV
LABELV $597
line 907
;907:	else if (delta > 44)
ADDRLP4 0
INDIRI4
CNSTI4 44
LEI4 $603
line 908
;908:	{
line 909
;909:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.fallSound );
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+716
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 910
;910:		trap_S_StartSound( NULL, cent->currentState.number, CHAN_VOICE, 
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $601
ARGP4
ADDRLP4 4
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 912
;911:			CG_CustomSound( cent->currentState.number, "*land1.wav" ) );
;912:		cent->pe.painTime = cg.time;	// don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 913
;913:	}
ADDRGP4 $604
JUMPV
LABELV $603
line 915
;914:	else
;915:	{
line 916
;916:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.landSound );
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+712
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 917
;917:	}
LABELV $604
LABELV $598
LABELV $591
line 919
;918:	
;919:	if ( clientNum == cg.predictedPlayerState.clientNum )
ADDRFP4 8
INDIRI4
ADDRGP4 cg+96+144
INDIRI4
NEI4 $610
line 920
;920:	{
line 922
;921:		// smooth landing z changes
;922:		cg.landChange = -delta;
ADDRGP4 cg+3500
ADDRLP4 0
INDIRI4
NEGI4
CVIF4 4
ASGNF4
line 923
;923:		if (cg.landChange > 32)
ADDRGP4 cg+3500
INDIRF4
CNSTF4 1107296256
LEF4 $615
line 924
;924:		{
line 925
;925:			cg.landChange = 32;
ADDRGP4 cg+3500
CNSTF4 1107296256
ASGNF4
line 926
;926:		}
LABELV $615
line 927
;927:		if (cg.landChange < -32)
ADDRGP4 cg+3500
INDIRF4
CNSTF4 3254779904
GEF4 $619
line 928
;928:		{
line 929
;929:			cg.landChange = -32;
ADDRGP4 cg+3500
CNSTF4 3254779904
ASGNF4
line 930
;930:		}
LABELV $619
line 931
;931:		cg.landTime = cg.time;
ADDRGP4 cg+3504
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 932
;932:	}
LABELV $610
line 933
;933:}
LABELV $589
endproc DoFall 8 16
export CG_InClientBitflags
proc CG_InClientBitflags 8 0
line 936
;934:
;935:int CG_InClientBitflags(entityState_t *ent, int client)
;936:{
line 938
;937:	int checkIn;
;938:	int sub = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 940
;939:
;940:	if (client > 47)
ADDRFP4 4
INDIRI4
CNSTI4 47
LEI4 $626
line 941
;941:	{
line 942
;942:		checkIn = ent->trickedentindex4;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 943
;943:		sub = 48;
ADDRLP4 0
CNSTI4 48
ASGNI4
line 944
;944:	}
ADDRGP4 $627
JUMPV
LABELV $626
line 945
;945:	else if (client > 31)
ADDRFP4 4
INDIRI4
CNSTI4 31
LEI4 $628
line 946
;946:	{
line 947
;947:		checkIn = ent->trickedentindex3;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ASGNI4
line 948
;948:		sub = 32;
ADDRLP4 0
CNSTI4 32
ASGNI4
line 949
;949:	}
ADDRGP4 $629
JUMPV
LABELV $628
line 950
;950:	else if (client > 15)
ADDRFP4 4
INDIRI4
CNSTI4 15
LEI4 $630
line 951
;951:	{
line 952
;952:		checkIn = ent->trickedentindex2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 953
;953:		sub = 16;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 954
;954:	}
ADDRGP4 $631
JUMPV
LABELV $630
line 956
;955:	else
;956:	{
line 957
;957:		checkIn = ent->trickedentindex;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 958
;958:	}
LABELV $631
LABELV $629
LABELV $627
line 960
;959:
;960:	if (checkIn & (1 << (client-sub)))
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $632
line 961
;961:	{
line 962
;962:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $625
JUMPV
LABELV $632
line 965
;963:	}
;964:	
;965:	return 0;
CNSTI4 0
RETI4
LABELV $625
endproc CG_InClientBitflags 8 0
lit
align 4
LABELV $1063
byte 4 3245342720
byte 4 3245342720
byte 4 3246391296
align 4
LABELV $1064
byte 4 1097859072
byte 4 1097859072
byte 4 1109393408
align 4
LABELV $1310
byte 4 3245342720
byte 4 3245342720
byte 4 3246391296
align 4
LABELV $1311
byte 4 1097859072
byte 4 1097859072
byte 4 1109393408
align 4
LABELV $1328
byte 4 3245342720
byte 4 3245342720
byte 4 3246391296
align 4
LABELV $1329
byte 4 1097859072
byte 4 1097859072
byte 4 1109393408
export CG_EntityEvent
code
proc CG_EntityEvent 1252 36
line 977
;966:}
;967:
;968:/*
;969:==============
;970:CG_EntityEvent
;971:
;972:An entity has an event value
;973:also called by CG_CheckPlayerstateEvents
;974:==============
;975:*/
;976:#define	DEBUGNAME(x) if(cg_debugEvents.integer){CG_Printf(x"\n");}
;977:void CG_EntityEvent( centity_t *cent, vec3_t position ) {
line 984
;978:	entityState_t	*es;
;979:	int				event;
;980:	vec3_t			dir;
;981:	const char		*s;
;982:	int				clientNum;
;983:	clientInfo_t	*ci;
;984:	int				eID = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 985
;985:	int				isnd = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 988
;986:	centity_t		*cl_ent;
;987:
;988:	es = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 989
;989:	event = es->event & ~EV_EVENT_BITS;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 991
;990:
;991:	if ( cg_debugEvents.integer ) {
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $635
line 992
;992:		CG_Printf( "ent:%3i  event:%3i ", es->number, event );
ADDRGP4 $638
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 993
;993:	}
LABELV $635
line 995
;994:
;995:	if ( !event ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $639
line 996
;996:		DEBUGNAME("ZEROEVENT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $634
ADDRGP4 $644
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 997
;997:		return;
ADDRGP4 $634
JUMPV
LABELV $639
line 1000
;998:	}
;999:
;1000:	clientNum = es->clientNum;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ASGNI4
line 1001
;1001:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $647
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $645
LABELV $647
line 1002
;1002:		clientNum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1003
;1003:	}
LABELV $645
line 1004
;1004:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 36
CNSTI4 788
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 1006
;1005:
;1006:	switch ( event ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $649
ADDRLP4 8
INDIRI4
CNSTI4 109
GTI4 $649
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1756-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1756
address $651
address $658
address $668
address $679
address $690
address $701
address $721
address $721
address $721
address $721
address $712
address $751
address $756
address $773
address $779
address $834
address $841
address $848
address $855
address $861
address $913
address $927
address $941
address $948
address $986
address $999
address $1005
address $1032
address $1053
address $1059
address $1079
address $1099
address $1119
address $1126
address $1133
address $1146
address $1175
address $1197
address $649
address $1207
address $1212
address $1217
address $1222
address $1227
address $1232
address $1237
address $1242
address $1247
address $1252
address $1257
address $1262
address $1267
address $1272
address $1277
address $649
address $1282
address $1347
address $1340
address $1305
address $1323
address $1355
address $1428
address $1454
address $1489
address $1505
address $1514
address $1531
address $1542
address $1600
address $1609
address $1614
address $1619
address $1433
address $1440
address $1447
address $649
address $1636
address $1646
address $1646
address $1646
address $1657
address $1662
address $1673
address $1684
address $1694
address $1360
address $1365
address $1370
address $1375
address $1380
address $1392
address $1403
address $1416
address $1422
address $1713
address $1722
address $1731
address $1736
address $1741
address $1708
address $1699
address $792
address $798
address $804
address $810
address $816
address $822
address $828
address $1746
code
LABELV $651
line 1011
;1007:	//
;1008:	// movement generated events
;1009:	//
;1010:	case EV_CLIENTJOIN:
;1011:		DEBUGNAME("EV_CLIENTJOIN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $652
ADDRGP4 $655
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $652
line 1014
;1012:
;1013:		//Slight hack to force a local reinit of client entity on join.
;1014:		cl_ent = &cg_entities[es->eventParm];
ADDRLP4 32
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 1016
;1015:
;1016:		if (cl_ent)
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $650
line 1017
;1017:		{
line 1018
;1018:			cl_ent->isATST = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1028
ADDP4
CNSTI4 0
ASGNI4
line 1019
;1019:			cl_ent->atstFootClang = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1032
ADDP4
CNSTI4 0
ASGNI4
line 1020
;1020:			cl_ent->atstSwinging = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1036
ADDP4
CNSTI4 0
ASGNI4
line 1022
;1021://			cl_ent->torsoBolt = 0;
;1022:			cl_ent->bolt1 = 0;
ADDRLP4 32
INDIRP4
CNSTI4 984
ADDP4
CNSTI4 0
ASGNI4
line 1023
;1023:			cl_ent->bolt2 = 0;
ADDRLP4 32
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 0
ASGNI4
line 1024
;1024:			cl_ent->bolt3 = 0;
ADDRLP4 32
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 0
ASGNI4
line 1025
;1025:			cl_ent->bolt4 = 0;
ADDRLP4 32
INDIRP4
CNSTI4 996
ADDP4
CNSTI4 0
ASGNI4
line 1026
;1026:			cl_ent->saberLength = SABER_LENGTH_MAX;
ADDRLP4 32
INDIRP4
CNSTI4 1000
ADDP4
CNSTF4 1109393408
ASGNF4
line 1027
;1027:			cl_ent->saberExtendTime = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1004
ADDP4
CNSTI4 0
ASGNI4
line 1028
;1028:			cl_ent->boltInfo = 0;
ADDRLP4 32
INDIRP4
CNSTI4 980
ADDP4
CNSTI4 0
ASGNI4
line 1029
;1029:			cl_ent->frame_minus1_refreshed = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1464
ADDP4
CNSTI4 0
ASGNI4
line 1030
;1030:			cl_ent->frame_minus2_refreshed = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1468
ADDP4
CNSTI4 0
ASGNI4
line 1031
;1031:			cl_ent->frame_hold_time = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1684
ADDP4
CNSTI4 0
ASGNI4
line 1032
;1032:			cl_ent->frame_hold_refreshed = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1688
ADDP4
CNSTI4 0
ASGNI4
line 1033
;1033:			cl_ent->trickAlpha = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1904
ADDP4
CNSTI4 0
ASGNI4
line 1034
;1034:			cl_ent->trickAlphaTime = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1908
ADDP4
CNSTI4 0
ASGNI4
line 1035
;1035:			cl_ent->ghoul2weapon = NULL;
ADDRLP4 32
INDIRP4
CNSTI4 960
ADDP4
CNSTP4 0
ASGNP4
line 1036
;1036:			cl_ent->weapon = WP_NONE;
ADDRLP4 32
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 0
ASGNI4
line 1037
;1037:			cl_ent->teamPowerEffectTime = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1912
ADDP4
CNSTI4 0
ASGNI4
line 1038
;1038:			cl_ent->teamPowerType = 0;
ADDRLP4 32
INDIRP4
CNSTI4 1916
ADDP4
CNSTI4 0
ASGNI4
line 1039
;1039:		}
line 1040
;1040:		break;
ADDRGP4 $650
JUMPV
LABELV $658
line 1043
;1041:
;1042:	case EV_FOOTSTEP:
;1043:		DEBUGNAME("EV_FOOTSTEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $659
ADDRGP4 $662
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $659
line 1044
;1044:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $650
line 1045
;1045:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 36
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 cgs+70296+604
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1047
;1046:				cgs.media.footsteps[ ci->footsteps ][rand()&3] );
;1047:		}
line 1048
;1048:		break;
ADDRGP4 $650
JUMPV
LABELV $668
line 1050
;1049:	case EV_FOOTSTEP_METAL:
;1050:		DEBUGNAME("EV_FOOTSTEP_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $669
ADDRGP4 $672
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $669
line 1051
;1051:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $650
line 1052
;1052:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+604+16
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1054
;1053:				cgs.media.footsteps[ FOOTSTEP_METAL ][rand()&3] );
;1054:		}
line 1055
;1055:		break;
ADDRGP4 $650
JUMPV
LABELV $679
line 1057
;1056:	case EV_FOOTSPLASH:
;1057:		DEBUGNAME("EV_FOOTSPLASH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $680
ADDRGP4 $683
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $680
line 1058
;1058:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $650
line 1059
;1059:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+604+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1061
;1060:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;1061:		}
line 1062
;1062:		break;
ADDRGP4 $650
JUMPV
LABELV $690
line 1064
;1063:	case EV_FOOTWADE:
;1064:		DEBUGNAME("EV_FOOTWADE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $691
ADDRGP4 $694
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $691
line 1065
;1065:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $650
line 1066
;1066:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+604+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1068
;1067:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;1068:		}
line 1069
;1069:		break;
ADDRGP4 $650
JUMPV
LABELV $701
line 1071
;1070:	case EV_SWIM:
;1071:		DEBUGNAME("EV_SWIM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $702
ADDRGP4 $705
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $702
line 1072
;1072:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $650
line 1073
;1073:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+70296+604+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1075
;1074:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;1075:		}
line 1076
;1076:		break;
ADDRGP4 $650
JUMPV
LABELV $712
line 1080
;1077:
;1078:
;1079:	case EV_FALL:
;1080:		DEBUGNAME("EV_FALL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $713
ADDRGP4 $716
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $713
line 1081
;1081:		if (es->number == cg.snap->ps.clientNum && cg.snap->ps.fallingToDeath)
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $717
ADDRGP4 cg+36
INDIRP4
CNSTI4 1396
ADDP4
INDIRI4
CNSTI4 0
EQI4 $717
line 1082
;1082:		{
line 1083
;1083:			break;
ADDRGP4 $650
JUMPV
LABELV $717
line 1085
;1084:		}
;1085:		DoFall(cent, es, clientNum);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 DoFall
CALLV
pop
line 1086
;1086:		break;
ADDRGP4 $650
JUMPV
LABELV $721
line 1091
;1087:	case EV_STEP_4:
;1088:	case EV_STEP_8:
;1089:	case EV_STEP_12:
;1090:	case EV_STEP_16:		// smooth out step up transitions
;1091:		DEBUGNAME("EV_STEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $722
ADDRGP4 $725
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $722
line 1092
;1092:	{
line 1097
;1093:		float	oldStep;
;1094:		int		delta;
;1095:		int		step;
;1096:
;1097:		if ( clientNum != cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+96+144
INDIRI4
EQI4 $726
line 1098
;1098:			break;
ADDRGP4 $650
JUMPV
LABELV $726
line 1101
;1099:		}
;1100:		// if we are interpolating, we don't need to smooth steps
;1101:		if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) ||
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $738
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 64
INDIRI4
NEI4 $738
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $738
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $730
LABELV $738
line 1102
;1102:			cg_nopredict.integer || cg_synchronousClients.integer ) {
line 1103
;1103:			break;
ADDRGP4 $650
JUMPV
LABELV $730
line 1106
;1104:		}
;1105:		// check for stepping up before a previous step is completed
;1106:		delta = cg.time - cg.stepTime;
ADDRLP4 52
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cg+3488
INDIRI4
SUBI4
ASGNI4
line 1107
;1107:		if (delta < STEP_TIME) {
ADDRLP4 52
INDIRI4
CNSTI4 200
GEI4 $741
line 1108
;1108:			oldStep = cg.stepChange * (STEP_TIME - delta) / STEP_TIME;
ADDRLP4 56
ADDRGP4 cg+3484
INDIRF4
CNSTI4 200
ADDRLP4 52
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1128792064
DIVF4
ASGNF4
line 1109
;1109:		} else {
ADDRGP4 $742
JUMPV
LABELV $741
line 1110
;1110:			oldStep = 0;
ADDRLP4 56
CNSTF4 0
ASGNF4
line 1111
;1111:		}
LABELV $742
line 1114
;1112:
;1113:		// add this amount
;1114:		step = 4 * (event - EV_STEP_4 + 1 );
ADDRLP4 60
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 28
SUBI4
CNSTI4 4
ADDI4
ASGNI4
line 1115
;1115:		cg.stepChange = oldStep + step;
ADDRGP4 cg+3484
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1116
;1116:		if ( cg.stepChange > MAX_STEP_CHANGE ) {
ADDRGP4 cg+3484
INDIRF4
CNSTF4 1107296256
LEF4 $745
line 1117
;1117:			cg.stepChange = MAX_STEP_CHANGE;
ADDRGP4 cg+3484
CNSTF4 1107296256
ASGNF4
line 1118
;1118:		}
LABELV $745
line 1119
;1119:		cg.stepTime = cg.time;
ADDRGP4 cg+3488
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 1120
;1120:		break;
ADDRGP4 $650
JUMPV
LABELV $751
line 1124
;1121:	}
;1122:
;1123:	case EV_JUMP_PAD:
;1124:		DEBUGNAME("EV_JUMP_PAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $650
ADDRGP4 $755
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1125
;1125:		break;
ADDRGP4 $650
JUMPV
LABELV $756
line 1128
;1126:
;1127:	case EV_PRIVATE_DUEL:
;1128:		DEBUGNAME("EV_PRIVATE_DUEL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $757
ADDRGP4 $760
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $757
line 1130
;1129:
;1130:		if (cg.snap->ps.clientNum != es->number)
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
EQI4 $761
line 1131
;1131:		{
line 1132
;1132:			break;
ADDRGP4 $650
JUMPV
LABELV $761
line 1135
;1133:		}
;1134:
;1135:		if (es->eventParm)
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $764
line 1136
;1136:		{ //starting the duel
line 1137
;1137:			if (es->eventParm == 2)
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 2
NEI4 $766
line 1138
;1138:			{
line 1139
;1139:				CG_CenterPrint( CG_GetStripEdString("SVINGAME", "BEGIN_DUEL"), 120, GIANTCHAR_WIDTH*2 );				
ADDRGP4 $768
ARGP4
ADDRGP4 $769
ARGP4
ADDRLP4 52
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
CNSTI4 120
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 1140
;1140:				trap_S_StartLocalSound( cgs.media.countFightSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+70296+852
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1141
;1141:			}
ADDRGP4 $650
JUMPV
LABELV $766
line 1143
;1142:			else
;1143:			{
line 1144
;1144:				trap_S_StartBackgroundTrack( "music/mp/duel.mp3", "music/mp/duel.mp3", qfalse );
ADDRLP4 52
ADDRGP4 $772
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_StartBackgroundTrack
CALLV
pop
line 1145
;1145:			}
line 1146
;1146:		}
ADDRGP4 $650
JUMPV
LABELV $764
line 1148
;1147:		else
;1148:		{ //ending the duel
line 1149
;1149:			CG_StartMusic(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 CG_StartMusic
CALLV
pop
line 1150
;1150:		}
line 1151
;1151:		break;
ADDRGP4 $650
JUMPV
LABELV $773
line 1154
;1152:
;1153:	case EV_JUMP:
;1154:		DEBUGNAME("EV_JUMP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $774
ADDRGP4 $777
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $774
line 1155
;1155:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $778
ARGP4
ADDRLP4 52
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1156
;1156:		break;
ADDRGP4 $650
JUMPV
LABELV $779
line 1158
;1157:	case EV_ROLL:
;1158:		DEBUGNAME("EV_ROLL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $780
ADDRGP4 $783
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $780
line 1159
;1159:		if (es->number == cg.snap->ps.clientNum && cg.snap->ps.fallingToDeath)
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $784
ADDRGP4 cg+36
INDIRP4
CNSTI4 1396
ADDP4
INDIRI4
CNSTI4 0
EQI4 $784
line 1160
;1160:		{
line 1161
;1161:			break;
ADDRGP4 $650
JUMPV
LABELV $784
line 1163
;1162:		}
;1163:		if (es->eventParm)
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $788
line 1164
;1164:		{ //fall-roll-in-one event
line 1165
;1165:			DoFall(cent, es, clientNum);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 DoFall
CALLV
pop
line 1166
;1166:		}
LABELV $788
line 1168
;1167:
;1168:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $778
ARGP4
ADDRLP4 56
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1169
;1169:		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.rollSound  );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+70296+752
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1172
;1170:
;1171:		//FIXME: need some sort of body impact on ground sound and maybe kick up some dust?
;1172:		break;
ADDRGP4 $650
JUMPV
LABELV $792
line 1175
;1173:
;1174:	case EV_TAUNT:
;1175:		DEBUGNAME("EV_TAUNT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $793
ADDRGP4 $796
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $793
line 1176
;1176:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*taunt.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $797
ARGP4
ADDRLP4 60
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1177
;1177:		break;
ADDRGP4 $650
JUMPV
LABELV $798
line 1179
;1178:	case EV_TAUNT_YES:
;1179:		DEBUGNAME("EV_TAUNT_YES");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $799
ADDRGP4 $802
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $799
line 1180
;1180:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_YES);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $803
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 1181
;1181:		break;
ADDRGP4 $650
JUMPV
LABELV $804
line 1183
;1182:	case EV_TAUNT_NO:
;1183:		DEBUGNAME("EV_TAUNT_NO");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $805
ADDRGP4 $808
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $805
line 1184
;1184:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_NO);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $809
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 1185
;1185:		break;
ADDRGP4 $650
JUMPV
LABELV $810
line 1187
;1186:	case EV_TAUNT_FOLLOWME:
;1187:		DEBUGNAME("EV_TAUNT_FOLLOWME");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $811
ADDRGP4 $814
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $811
line 1188
;1188:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_FOLLOWME);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $815
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 1189
;1189:		break;
ADDRGP4 $650
JUMPV
LABELV $816
line 1191
;1190:	case EV_TAUNT_GETFLAG:
;1191:		DEBUGNAME("EV_TAUNT_GETFLAG");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $817
ADDRGP4 $820
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $817
line 1192
;1192:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONGETFLAG);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $821
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 1193
;1193:		break;
ADDRGP4 $650
JUMPV
LABELV $822
line 1195
;1194:	case EV_TAUNT_GUARDBASE:
;1195:		DEBUGNAME("EV_TAUNT_GUARDBASE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $823
ADDRGP4 $826
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $823
line 1196
;1196:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONDEFENSE);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $827
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 1197
;1197:		break;
ADDRGP4 $650
JUMPV
LABELV $828
line 1199
;1198:	case EV_TAUNT_PATROL:
;1199:		DEBUGNAME("EV_TAUNT_PATROL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $829
ADDRGP4 $832
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $829
line 1200
;1200:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONPATROL);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $833
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 1201
;1201:		break;
ADDRGP4 $650
JUMPV
LABELV $834
line 1203
;1202:	case EV_WATER_TOUCH:
;1203:		DEBUGNAME("EV_WATER_TOUCH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $835
ADDRGP4 $838
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $835
line 1204
;1204:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+756
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1205
;1205:		break;
ADDRGP4 $650
JUMPV
LABELV $841
line 1207
;1206:	case EV_WATER_LEAVE:
;1207:		DEBUGNAME("EV_WATER_LEAVE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $842
ADDRGP4 $845
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $842
line 1208
;1208:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+760
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1209
;1209:		break;
ADDRGP4 $650
JUMPV
LABELV $848
line 1211
;1210:	case EV_WATER_UNDER:
;1211:		DEBUGNAME("EV_WATER_UNDER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $849
ADDRGP4 $852
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $849
line 1212
;1212:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrUnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+764
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1213
;1213:		break;
ADDRGP4 $650
JUMPV
LABELV $855
line 1215
;1214:	case EV_WATER_CLEAR:
;1215:		DEBUGNAME("EV_WATER_CLEAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $856
ADDRGP4 $859
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $856
line 1216
;1216:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*gasp.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $860
ARGP4
ADDRLP4 64
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1217
;1217:		break;
ADDRGP4 $650
JUMPV
LABELV $861
line 1220
;1218:
;1219:	case EV_ITEM_PICKUP:
;1220:		DEBUGNAME("EV_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $862
ADDRGP4 $865
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $862
line 1221
;1221:		{
line 1224
;1222:			gitem_t	*item;
;1223:			int		index;
;1224:			qboolean	newindex = qfalse;
ADDRLP4 68
CNSTI4 0
ASGNI4
line 1226
;1225:
;1226:			index = cg_entities[es->eventParm].currentState.modelindex;		// player predicted
ADDRLP4 72
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+212
ADDP4
INDIRI4
ASGNI4
line 1228
;1227:
;1228:			if (index < 1 && cg_entities[es->eventParm].currentState.isJediMaster)
ADDRLP4 72
INDIRI4
CNSTI4 1
GEI4 $867
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+244
ADDP4
INDIRI4
CNSTI4 0
EQI4 $867
line 1229
;1229:			{ //a holocron most likely
line 1230
;1230:				index = cg_entities[es->eventParm].currentState.trickedentindex4;
ADDRLP4 72
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+160
ADDP4
INDIRI4
ASGNI4
line 1231
;1231:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.holocronPickup );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+1248
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1233
;1232:								
;1233:				if (es->number == cg.snap->ps.clientNum && showPowersName[index])
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $873
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 showPowersName
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $873
line 1234
;1234:				{
line 1235
;1235:					const char *strText = CG_GetStripEdString("INGAMETEXT", "PICKUPLINE");
ADDRGP4 $241
ARGP4
ADDRGP4 $454
ARGP4
ADDRLP4 84
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 84
INDIRP4
ASGNP4
line 1238
;1236:
;1237:					//Com_Printf("%s %s\n", strText, showPowersName[index]);
;1238:					CG_CenterPrint( va("%s %s\n", strText, CG_GetStripEdString("INGAME",showPowersName[index])), SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $876
ARGP4
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 showPowersName
ADDP4
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $242
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 1239
;1239:				}
LABELV $873
line 1242
;1240:
;1241:				//Show the player their force selection bar in case picking the holocron up changed the current selection
;1242:				if (index != FP_SABERATTACK && index != FP_SABERDEFEND && index != FP_SABERTHROW &&
ADDRLP4 80
ADDRLP4 72
INDIRI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 15
EQI4 $877
ADDRLP4 80
INDIRI4
CNSTI4 16
EQI4 $877
ADDRLP4 80
INDIRI4
CNSTI4 17
EQI4 $877
ADDRLP4 84
CNSTI4 1
ASGNI4
ADDRLP4 80
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $877
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $877
ADDRLP4 88
CNSTI4 896
ASGNI4
ADDRLP4 80
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRI4
EQI4 $883
ADDRGP4 cg+36
INDIRP4
CNSTI4 892
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $877
LABELV $883
line 1246
;1243:					index != FP_LEVITATION &&
;1244:					es->number == cg.snap->ps.clientNum &&
;1245:					(index == cg.snap->ps.fd.forcePowerSelected || !(cg.snap->ps.fd.forcePowersActive & (1 << cg.snap->ps.fd.forcePowerSelected))))
;1246:				{
line 1247
;1247:					if (cg.forceSelect != index)
ADDRGP4 cg+3512
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $884
line 1248
;1248:					{
line 1249
;1249:						cg.forceSelect = index;
ADDRGP4 cg+3512
ADDRLP4 72
INDIRI4
ASGNI4
line 1250
;1250:						newindex = qtrue;
ADDRLP4 68
CNSTI4 1
ASGNI4
line 1251
;1251:					}
LABELV $884
line 1252
;1252:				}
LABELV $877
line 1254
;1253:
;1254:				if (es->number == cg.snap->ps.clientNum && newindex)
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $650
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $650
line 1255
;1255:				{
line 1256
;1256:					if (cg.forceSelectTime < cg.time)
ADDRGP4 cg+13792
INDIRF4
ADDRGP4 cg+64
INDIRI4
CVIF4 4
GEF4 $650
line 1257
;1257:					{
line 1258
;1258:						cg.forceSelectTime = cg.time;
ADDRGP4 cg+13792
ADDRGP4 cg+64
INDIRI4
CVIF4 4
ASGNF4
line 1259
;1259:					}
line 1260
;1260:				}
line 1262
;1261:
;1262:				break;
ADDRGP4 $650
JUMPV
LABELV $867
line 1265
;1263:			}
;1264:
;1265:			if (cg_entities[es->eventParm].weapon >= cg.time)
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+956
ADDP4
INDIRI4
ADDRGP4 cg+64
INDIRI4
LTI4 $897
line 1266
;1266:			{ //rww - an unfortunately necessary hack to prevent double item pickups
line 1267
;1267:				break;
ADDRGP4 $650
JUMPV
LABELV $897
line 1274
;1268:			}
;1269:
;1270:			//Hopefully even if this entity is somehow removed and replaced with, say, another
;1271:			//item, this time will have expired by the time that item needs to be picked up.
;1272:			//Of course, it's quite possible this will fail miserably, so if you've got a better
;1273:			//solution then please do use it.
;1274:			cg_entities[es->eventParm].weapon = cg.time+500;
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+956
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1276
;1275:
;1276:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 80
ADDRLP4 72
INDIRI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 1
LTI4 $905
ADDRLP4 80
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $903
LABELV $905
line 1277
;1277:				break;
ADDRGP4 $650
JUMPV
LABELV $903
line 1279
;1278:			}
;1279:			item = &bg_itemlist[ index ];
ADDRLP4 76
CNSTI4 52
ADDRLP4 72
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 1281
;1280:
;1281:			if ( /*item->giType != IT_POWERUP && */item->giType != IT_TEAM) {
ADDRLP4 76
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
EQI4 $906
line 1282
;1282:				if (item->pickup_sound && item->pickup_sound[0])
ADDRLP4 84
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $908
ADDRLP4 84
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $908
line 1283
;1283:				{
line 1284
;1284:					trap_S_StartSound (NULL, es->number, CHAN_AUTO,	trap_S_RegisterSound( item->pickup_sound ) );
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 88
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1285
;1285:				}
LABELV $908
line 1286
;1286:			}
LABELV $906
line 1289
;1287:
;1288:			// show icon and name on status bar
;1289:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $650
line 1290
;1290:				CG_ItemPickup( index );
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 1291
;1291:			}
line 1292
;1292:		}
line 1293
;1293:		break;
ADDRGP4 $650
JUMPV
LABELV $913
line 1296
;1294:
;1295:	case EV_GLOBAL_ITEM_PICKUP:
;1296:		DEBUGNAME("EV_GLOBAL_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $914
ADDRGP4 $917
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $914
line 1297
;1297:		{
line 1301
;1298:			gitem_t	*item;
;1299:			int		index;
;1300:
;1301:			index = es->eventParm;		// player predicted
ADDRLP4 68
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ASGNI4
line 1303
;1302:
;1303:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 76
ADDRLP4 68
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 1
LTI4 $920
ADDRLP4 76
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $918
LABELV $920
line 1304
;1304:				break;
ADDRGP4 $650
JUMPV
LABELV $918
line 1306
;1305:			}
;1306:			item = &bg_itemlist[ index ];
ADDRLP4 72
CNSTI4 52
ADDRLP4 68
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 1308
;1307:			// powerup pickups are global
;1308:			if( item->pickup_sound && item->pickup_sound[0] ) {
ADDRLP4 80
ADDRLP4 72
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $921
ADDRLP4 80
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $921
line 1309
;1309:				trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, trap_S_RegisterSound( item->pickup_sound) );
ADDRLP4 72
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1310
;1310:			}
LABELV $921
line 1313
;1311:
;1312:			// show icon and name on status bar
;1313:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $650
line 1314
;1314:				CG_ItemPickup( index );
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 1315
;1315:			}
line 1316
;1316:		}
line 1317
;1317:		break;
ADDRGP4 $650
JUMPV
LABELV $927
line 1323
;1318:
;1319:	//
;1320:	// weapon events
;1321:	//
;1322:	case EV_NOAMMO:
;1323:		DEBUGNAME("EV_NOAMMO");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $928
ADDRGP4 $931
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $928
line 1325
;1324://		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.noAmmoSound );
;1325:		if ( es->number == cg.snap->ps.clientNum )
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $650
line 1326
;1326:		{
line 1327
;1327:			int weap = 0;
ADDRLP4 68
CNSTI4 0
ASGNI4
line 1329
;1328:
;1329:			if (es->eventParm && es->eventParm < WP_NUM_WEAPONS)
ADDRLP4 72
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $935
ADDRLP4 72
INDIRI4
CNSTI4 16
GEI4 $935
line 1330
;1330:			{
line 1331
;1331:				cg.snap->ps.stats[STAT_WEAPONS] &= ~(1 << es->eventParm);
ADDRLP4 76
ADDRGP4 cg+36
INDIRP4
CNSTI4 276
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 1332
;1332:				weap = cg.snap->ps.weapon;
ADDRLP4 68
ADDRGP4 cg+36
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 1333
;1333:			}
ADDRGP4 $936
JUMPV
LABELV $935
line 1334
;1334:			else if (es->eventParm)
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $939
line 1335
;1335:			{
line 1336
;1336:				weap = (es->eventParm-WP_NUM_WEAPONS);
ADDRLP4 68
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 1337
;1337:			}
LABELV $939
LABELV $936
line 1338
;1338:			CG_OutOfAmmoChange(weap);
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 CG_OutOfAmmoChange
CALLV
pop
line 1339
;1339:		}
line 1340
;1340:		break;
ADDRGP4 $650
JUMPV
LABELV $941
line 1342
;1341:	case EV_CHANGE_WEAPON:
;1342:		DEBUGNAME("EV_CHANGE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $942
ADDRGP4 $945
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $942
line 1343
;1343:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.selectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+600
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1344
;1344:		break;
ADDRGP4 $650
JUMPV
LABELV $948
line 1346
;1345:	case EV_FIRE_WEAPON:
;1346:		DEBUGNAME("EV_FIRE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $949
ADDRGP4 $952
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $949
line 1347
;1347:		if (cent->currentState.number >= MAX_CLIENTS && cent->currentState.eType != ET_GRAPPLE)
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 32
LTI4 $953
ADDRLP4 68
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
EQI4 $953
line 1348
;1348:		{ //special case for turret firing
line 1352
;1349:			vec3_t gunpoint, gunangle;
;1350:			mdxaBone_t matrix;
;1351:
;1352:			weaponInfo_t *weaponInfo = &cg_weapons[WP_TURRET];
ADDRLP4 72
ADDRGP4 cg_weapons+3120
ASGNP4
line 1354
;1353:
;1354:			if ( !weaponInfo->registered )
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $956
line 1355
;1355:			{
line 1356
;1356:				memset( weaponInfo, 0, sizeof( *weaponInfo ) );
ADDRLP4 72
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 208
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1358
;1357:
;1358:				weaponInfo->flashSound[0]		= NULL_SOUND;
ADDRLP4 72
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 0
ASGNI4
line 1359
;1359:				weaponInfo->firingSound			= NULL_SOUND;
ADDRLP4 72
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 0
ASGNI4
line 1360
;1360:				weaponInfo->chargeSound			= NULL_SOUND;
ADDRLP4 72
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 1361
;1361:				weaponInfo->muzzleEffect		= NULL_HANDLE;
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
CNSTI4 0
ASGNI4
line 1362
;1362:				weaponInfo->missileModel		= NULL_HANDLE;
ADDRLP4 72
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 0
ASGNI4
line 1363
;1363:				weaponInfo->missileSound		= NULL_SOUND;
ADDRLP4 72
INDIRP4
CNSTI4 100
ADDP4
CNSTI4 0
ASGNI4
line 1364
;1364:				weaponInfo->missileDlight		= 0;
ADDRLP4 72
INDIRP4
CNSTI4 108
ADDP4
CNSTF4 0
ASGNF4
line 1365
;1365:				weaponInfo->missileHitSound		= NULL_SOUND;
ADDRLP4 72
INDIRP4
CNSTI4 128
ADDP4
CNSTI4 0
ASGNI4
line 1366
;1366:				weaponInfo->missileTrailFunc	= FX_TurretProjectileThink;
ADDRLP4 72
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 FX_TurretProjectileThink
ASGNP4
line 1368
;1367:
;1368:				trap_FX_RegisterEffect("effects/blaster/wall_impact.efx");
ADDRGP4 $958
ARGP4
ADDRGP4 trap_FX_RegisterEffect
CALLI4
pop
line 1369
;1369:				trap_FX_RegisterEffect("effects/blaster/flesh_impact.efx");
ADDRGP4 $959
ARGP4
ADDRGP4 trap_FX_RegisterEffect
CALLI4
pop
line 1371
;1370:
;1371:				weaponInfo->registered = qtrue;
ADDRLP4 72
INDIRP4
CNSTI4 1
ASGNI4
line 1372
;1372:			}
LABELV $956
line 1374
;1373:
;1374:			if (cent->ghoul2)
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $650
line 1375
;1375:			{
line 1376
;1376:				if (!cent->bolt1)
ADDRFP4 0
INDIRP4
CNSTI4 984
ADDP4
INDIRI4
CNSTI4 0
NEI4 $962
line 1377
;1377:				{
line 1378
;1378:					cent->bolt1 = trap_G2API_AddBolt(cent->ghoul2, 0, "*flash01");
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $964
ARGP4
ADDRLP4 152
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 148
INDIRP4
CNSTI4 984
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 1379
;1379:				}
LABELV $962
line 1380
;1380:				if (!cent->bolt2)
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
CNSTI4 0
NEI4 $961
line 1381
;1381:				{
line 1382
;1382:					cent->bolt2 = trap_G2API_AddBolt(cent->ghoul2, 0, "*flash02");
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $967
ARGP4
ADDRLP4 152
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 148
INDIRP4
CNSTI4 988
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 1383
;1383:				}
line 1384
;1384:			}
line 1386
;1385:			else
;1386:			{
line 1387
;1387:				break;
LABELV $961
line 1390
;1388:			}
;1389:
;1390:			if (cent->currentState.eventParm)
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $968
line 1391
;1391:			{
line 1392
;1392:				trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cent->bolt2, &matrix, cent->currentState.angles, cent->currentState.origin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 148
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 1393
;1393:			}
ADDRGP4 $969
JUMPV
LABELV $968
line 1395
;1394:			else
;1395:			{
line 1396
;1396:				trap_G2API_GetBoltMatrix(cent->ghoul2, 0, cent->bolt1, &matrix, cent->currentState.angles, cent->currentState.origin, cg.time, cgs.gameModels, cent->modelScale);
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 952
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 148
INDIRP4
CNSTI4 984
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 cg+64
INDIRI4
ARGI4
ADDRGP4 cgs+36364
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 964
ADDP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 1397
;1397:			}
LABELV $969
line 1399
;1398:
;1399:			gunpoint[0] = matrix.matrix[0][3];
ADDRLP4 124
ADDRLP4 76+12
INDIRF4
ASGNF4
line 1400
;1400:			gunpoint[1] = matrix.matrix[1][3];
ADDRLP4 124+4
ADDRLP4 76+16+12
INDIRF4
ASGNF4
line 1401
;1401:			gunpoint[2] = matrix.matrix[2][3];
ADDRLP4 124+8
ADDRLP4 76+32+12
INDIRF4
ASGNF4
line 1403
;1402:
;1403:			gunangle[0] = -matrix.matrix[0][0];
ADDRLP4 136
ADDRLP4 76
INDIRF4
NEGF4
ASGNF4
line 1404
;1404:			gunangle[1] = -matrix.matrix[1][0];
ADDRLP4 136+4
ADDRLP4 76+16
INDIRF4
NEGF4
ASGNF4
line 1405
;1405:			gunangle[2] = -matrix.matrix[2][0];
ADDRLP4 136+8
ADDRLP4 76+32
INDIRF4
NEGF4
ASGNF4
line 1407
;1406:
;1407:			trap_FX_PlayEffectID(trap_FX_RegisterEffect( "effects/turret/muzzle_flash.efx" ), gunpoint, gunangle);
ADDRGP4 $985
ARGP4
ADDRLP4 148
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
ARGI4
ADDRLP4 124
ARGP4
ADDRLP4 136
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1408
;1408:		}
ADDRGP4 $650
JUMPV
LABELV $953
line 1410
;1409:		else
;1410:		{
line 1411
;1411:			CG_FireWeapon( cent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 1412
;1412:		}
line 1413
;1413:		break;
ADDRGP4 $650
JUMPV
LABELV $986
line 1416
;1414:
;1415:	case EV_ALT_FIRE:
;1416:		DEBUGNAME("EV_ALT_FIRE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $987
ADDRGP4 $990
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $987
line 1417
;1417:		CG_FireWeapon( cent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 1420
;1418:
;1419:		//if you just exploded your detpacks and you have no ammo left for them, autoswitch
;1420:		if ( cg.snap->ps.clientNum == cent->currentState.number &&
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $650
ADDRGP4 cg+36
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 13
NEI4 $650
line 1422
;1421:			cg.snap->ps.weapon == WP_DET_PACK )
;1422:		{
line 1423
;1423:			if (cg.snap->ps.ammo[weaponData[WP_DET_PACK].ammoIndex] == 0) 
ADDRGP4 weaponData+728
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 452
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $650
line 1424
;1424:			{
line 1425
;1425:				CG_OutOfAmmoChange(WP_DET_PACK);
CNSTI4 13
ARGI4
ADDRGP4 CG_OutOfAmmoChange
CALLV
pop
line 1426
;1426:			}
line 1427
;1427:		}
line 1429
;1428:
;1429:		break;
ADDRGP4 $650
JUMPV
LABELV $999
line 1432
;1430:
;1431:	case EV_SABER_ATTACK:
;1432:		DEBUGNAME("EV_SABER_ATTACK");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1000
ADDRGP4 $1003
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1000
line 1433
;1433:		trap_S_StartSound(es->pos.trBase, es->number, CHAN_WEAPON, trap_S_RegisterSound(va("sound/weapons/saber/saberhup%i.wav", Q_irand(1, 8))));
CNSTI4 1
ARGI4
CNSTI4 8
ARGI4
ADDRLP4 72
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRGP4 $1004
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1434
;1434:		break;
ADDRGP4 $650
JUMPV
LABELV $1005
line 1437
;1435:
;1436:	case EV_SABER_HIT:
;1437:		DEBUGNAME("EV_SABER_HIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1006
ADDRGP4 $1009
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1006
line 1438
;1438:		if (es->eventParm == 16)
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 16
NEI4 $1010
line 1439
;1439:		{ //Make lots of sparks, something special happened
line 1441
;1440:			vec3_t fxDir;
;1441:			VectorCopy(es->angles, fxDir);
ADDRLP4 88
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1442
;1442:			if (!fxDir[0] && !fxDir[1] && !fxDir[2])
ADDRLP4 100
CNSTF4 0
ASGNF4
ADDRLP4 88
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1012
ADDRLP4 88+4
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1012
ADDRLP4 88+8
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1012
line 1443
;1443:			{
line 1444
;1444:				fxDir[1] = 1;
ADDRLP4 88+4
CNSTF4 1065353216
ASGNF4
line 1445
;1445:			}
LABELV $1012
line 1446
;1446:			trap_S_StartSound(es->origin, es->number, CHAN_AUTO, trap_S_RegisterSound("sound/weapons/saber/saberhit.wav"));
ADDRGP4 $1017
ARGP4
ADDRLP4 104
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1447
;1447:			trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/blood_sparks.efx"), es->origin, fxDir );
ADDRGP4 $1018
ARGP4
ADDRLP4 112
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1448
;1448:			trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/blood_sparks.efx"), es->origin, fxDir );
ADDRGP4 $1018
ARGP4
ADDRLP4 116
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1449
;1449:			trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/blood_sparks.efx"), es->origin, fxDir );
ADDRGP4 $1018
ARGP4
ADDRLP4 120
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1450
;1450:			trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/blood_sparks.efx"), es->origin, fxDir );
ADDRGP4 $1018
ARGP4
ADDRLP4 124
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1451
;1451:			trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/blood_sparks.efx"), es->origin, fxDir );
ADDRGP4 $1018
ARGP4
ADDRLP4 128
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1452
;1452:			trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/blood_sparks.efx"), es->origin, fxDir );
ADDRGP4 $1018
ARGP4
ADDRLP4 132
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1453
;1453:		}
ADDRGP4 $650
JUMPV
LABELV $1010
line 1454
;1454:		else if (es->eventParm)
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1019
line 1455
;1455:		{ //hit a person
line 1457
;1456:			vec3_t fxDir;
;1457:			VectorCopy(es->angles, fxDir);
ADDRLP4 88
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1458
;1458:			if (!fxDir[0] && !fxDir[1] && !fxDir[2])
ADDRLP4 100
CNSTF4 0
ASGNF4
ADDRLP4 88
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1021
ADDRLP4 88+4
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1021
ADDRLP4 88+8
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1021
line 1459
;1459:			{
line 1460
;1460:				fxDir[1] = 1;
ADDRLP4 88+4
CNSTF4 1065353216
ASGNF4
line 1461
;1461:			}
LABELV $1021
line 1462
;1462:			trap_S_StartSound(es->origin, es->number, CHAN_AUTO, trap_S_RegisterSound("sound/weapons/saber/saberhit.wav"));
ADDRGP4 $1017
ARGP4
ADDRLP4 104
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1463
;1463:			trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/blood_sparks.efx"), es->origin, fxDir );
ADDRGP4 $1018
ARGP4
ADDRLP4 112
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1464
;1464:		}
ADDRGP4 $650
JUMPV
LABELV $1019
line 1466
;1465:		else
;1466:		{ //hit something else
line 1468
;1467:			vec3_t fxDir;
;1468:			VectorCopy(es->angles, fxDir);
ADDRLP4 88
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1469
;1469:			if (!fxDir[0] && !fxDir[1] && !fxDir[2])
ADDRLP4 100
CNSTF4 0
ASGNF4
ADDRLP4 88
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1026
ADDRLP4 88+4
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1026
ADDRLP4 88+8
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1026
line 1470
;1470:			{
line 1471
;1471:				fxDir[1] = 1;
ADDRLP4 88+4
CNSTF4 1065353216
ASGNF4
line 1472
;1472:			}			
LABELV $1026
line 1473
;1473:			trap_S_StartSound(es->origin, es->number, CHAN_AUTO, trap_S_RegisterSound("sound/weapons/saber/saberhit.wav"));
ADDRGP4 $1017
ARGP4
ADDRLP4 104
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1474
;1474:			trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/spark.efx"), es->origin, fxDir );
ADDRGP4 $1031
ARGP4
ADDRLP4 112
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1475
;1475:		}
line 1476
;1476:		break;
ADDRGP4 $650
JUMPV
LABELV $1032
line 1479
;1477:
;1478:	case EV_SABER_BLOCK:
;1479:		DEBUGNAME("EV_SABER_BLOCK");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1033
ADDRGP4 $1036
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1033
line 1481
;1480:
;1481:		if (es->eventParm)
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1037
line 1482
;1482:		{ //saber block
line 1484
;1483:			vec3_t fxDir;
;1484:			VectorCopy(es->angles, fxDir);
ADDRLP4 88
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1485
;1485:			if (!fxDir[0] && !fxDir[1] && !fxDir[2])
ADDRLP4 100
CNSTF4 0
ASGNF4
ADDRLP4 88
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1039
ADDRLP4 88+4
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1039
ADDRLP4 88+8
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1039
line 1486
;1486:			{
line 1487
;1487:				fxDir[1] = 1;
ADDRLP4 88+4
CNSTF4 1065353216
ASGNF4
line 1488
;1488:			}
LABELV $1039
line 1489
;1489:			trap_S_StartSound(es->origin, es->number, CHAN_AUTO, trap_S_RegisterSound(va( "sound/weapons/saber/saberblock%d.wav", Q_irand(1, 9) )));
CNSTI4 1
ARGI4
CNSTI4 9
ARGI4
ADDRLP4 104
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRGP4 $1044
ARGP4
ADDRLP4 104
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 112
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1490
;1490:			trap_FX_PlayEffectID( trap_FX_RegisterEffect("saber/saber_block.efx"), es->origin, fxDir );
ADDRGP4 $1045
ARGP4
ADDRLP4 120
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1492
;1491:
;1492:			g_saberFlashTime = cg.time-50;
ADDRGP4 g_saberFlashTime
ADDRGP4 cg+64
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1493
;1493:			VectorCopy( es->origin, g_saberFlashPos );
ADDRGP4 g_saberFlashPos
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1494
;1494:		}
ADDRGP4 $650
JUMPV
LABELV $1037
line 1496
;1495:		else
;1496:		{ //projectile block
line 1498
;1497:			vec3_t fxDir;
;1498:			VectorCopy(es->angles, fxDir);
ADDRLP4 88
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1499
;1499:			if (!fxDir[0] && !fxDir[1] && !fxDir[2])
ADDRLP4 100
CNSTF4 0
ASGNF4
ADDRLP4 88
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1047
ADDRLP4 88+4
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1047
ADDRLP4 88+8
INDIRF4
ADDRLP4 100
INDIRF4
NEF4 $1047
line 1500
;1500:			{
line 1501
;1501:				fxDir[1] = 1;
ADDRLP4 88+4
CNSTF4 1065353216
ASGNF4
line 1502
;1502:			}
LABELV $1047
line 1503
;1503:			trap_FX_PlayEffectID(trap_FX_RegisterEffect("blaster/deflect.efx"), es->origin, fxDir);
ADDRGP4 $1052
ARGP4
ADDRLP4 104
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1504
;1504:		}
line 1505
;1505:		break;
ADDRGP4 $650
JUMPV
LABELV $1053
line 1508
;1506:
;1507:	case EV_SABER_UNHOLSTER:
;1508:		DEBUGNAME("EV_SABER_UNHOLSTER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1054
ADDRGP4 $1057
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1054
line 1509
;1509:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, trap_S_RegisterSound( "sound/weapons/saber/saberon.wav" ) );
ADDRGP4 $1058
ARGP4
ADDRLP4 88
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 88
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1510
;1510:		break;
ADDRGP4 $650
JUMPV
LABELV $1059
line 1513
;1511:
;1512:	case EV_BECOME_JEDIMASTER:
;1513:		DEBUGNAME("EV_SABER_UNHOLSTER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1060
ADDRGP4 $1057
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1060
line 1514
;1514:		{
line 1516
;1515:			trace_t tr;
;1516:			vec3_t playerMins = {-15, -15, DEFAULT_MINS_2+8};
ADDRLP4 92
ADDRGP4 $1063
INDIRB
ASGNB 12
line 1517
;1517:			vec3_t playerMaxs = {15, 15, DEFAULT_MAXS_2};
ADDRLP4 104
ADDRGP4 $1064
INDIRB
ASGNB 12
line 1520
;1518:			vec3_t ang, pos, dpos;
;1519:
;1520:			VectorClear(ang);
ADDRLP4 1232
CNSTF4 0
ASGNF4
ADDRLP4 116+8
ADDRLP4 1232
INDIRF4
ASGNF4
ADDRLP4 116+4
ADDRLP4 1232
INDIRF4
ASGNF4
ADDRLP4 116
ADDRLP4 1232
INDIRF4
ASGNF4
line 1521
;1521:			ang[ROLL] = 1;
ADDRLP4 116+8
CNSTF4 1065353216
ASGNF4
line 1523
;1522:
;1523:			VectorCopy(position, dpos);
ADDRLP4 1208
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1524
;1524:			dpos[2] -= 4096;
ADDRLP4 1208+8
ADDRLP4 1208+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 1526
;1525:
;1526:			CG_Trace(&tr, position, playerMins, playerMaxs, dpos, es->number, MASK_SOLID);
ADDRLP4 128
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 1208
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 1527
;1527:			VectorCopy(tr.endpos, pos);
ADDRLP4 1220
ADDRLP4 128+12
INDIRB
ASGNB 12
line 1529
;1528:			
;1529:			if (tr.fraction == 1)
ADDRLP4 128+8
INDIRF4
CNSTF4 1065353216
NEF4 $1070
line 1530
;1530:			{
line 1531
;1531:				break;
ADDRGP4 $650
JUMPV
LABELV $1070
line 1533
;1532:			}
;1533:			trap_FX_PlayEffectID(trap_FX_RegisterEffect("mp/jedispawn.efx"), pos, ang);
ADDRGP4 $1073
ARGP4
ADDRLP4 1236
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 1236
INDIRI4
ARGI4
ADDRLP4 1220
ARGP4
ADDRLP4 116
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1535
;1534:
;1535:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, trap_S_RegisterSound( "sound/weapons/saber/saberon.wav" ) );
ADDRGP4 $1058
ARGP4
ADDRLP4 1240
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1240
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1537
;1536:
;1537:			if (cg.snap->ps.clientNum == es->number)
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
NEI4 $650
line 1538
;1538:			{
line 1539
;1539:				trap_S_StartLocalSound(cgs.media.happyMusic, CHAN_LOCAL);
ADDRGP4 cgs+70296+832
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1540
;1540:				CGCam_SetMusicMult(0.3, 5000);
CNSTF4 1050253722
ARGF4
CNSTI4 5000
ARGI4
ADDRGP4 CGCam_SetMusicMult
CALLV
pop
line 1541
;1541:			}
line 1542
;1542:		}
line 1543
;1543:		break;
ADDRGP4 $650
JUMPV
LABELV $1079
line 1546
;1544:
;1545:	case EV_DISRUPTOR_MAIN_SHOT:
;1546:		DEBUGNAME("EV_DISRUPTOR_MAIN_SHOT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1080
ADDRGP4 $1083
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1080
line 1547
;1547:		if (cent->currentState.eventParm != cg.snap->ps.clientNum ||
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $1088
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
EQI4 $1084
LABELV $1088
line 1549
;1548:			cg.renderingThirdPerson)
;1549:		{ //h4q3ry
line 1550
;1550:			CG_GetClientWeaponMuzzleBoltPoint(cent->currentState.eventParm, cent->currentState.origin2);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 92
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRGP4 CG_GetClientWeaponMuzzleBoltPoint
CALLV
pop
line 1551
;1551:		}
ADDRGP4 $1085
JUMPV
LABELV $1084
line 1553
;1552:		else
;1553:		{
line 1554
;1554:			if (cg.lastFPFlashPoint[0] ||cg.lastFPFlashPoint[1] || cg.lastFPFlashPoint[2])
ADDRLP4 92
CNSTF4 0
ASGNF4
ADDRGP4 cg+13796
INDIRF4
ADDRLP4 92
INDIRF4
NEF4 $1097
ADDRGP4 cg+13796+4
INDIRF4
ADDRLP4 92
INDIRF4
NEF4 $1097
ADDRGP4 cg+13796+8
INDIRF4
ADDRLP4 92
INDIRF4
EQF4 $1089
LABELV $1097
line 1555
;1555:			{ //get the position of the muzzle flash for the first person weapon model from the last frame
line 1556
;1556:				VectorCopy(cg.lastFPFlashPoint, cent->currentState.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 cg+13796
INDIRB
ASGNB 12
line 1557
;1557:			}
LABELV $1089
line 1558
;1558:		}
LABELV $1085
line 1559
;1559:		FX_DisruptorMainShot( cent->currentState.origin2, cent->lerpOrigin ); 
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 FX_DisruptorMainShot
CALLV
pop
line 1560
;1560:		break;
ADDRGP4 $650
JUMPV
LABELV $1099
line 1563
;1561:
;1562:	case EV_DISRUPTOR_SNIPER_SHOT:
;1563:		DEBUGNAME("EV_DISRUPTOR_SNIPER_SHOT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1100
ADDRGP4 $1103
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1100
line 1564
;1564:		if (cent->currentState.eventParm != cg.snap->ps.clientNum ||
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $1108
ADDRGP4 cg+88
INDIRI4
CNSTI4 0
EQI4 $1104
LABELV $1108
line 1566
;1565:			cg.renderingThirdPerson)
;1566:		{ //h4q3ry
line 1567
;1567:			CG_GetClientWeaponMuzzleBoltPoint(cent->currentState.eventParm, cent->currentState.origin2);
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 96
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRGP4 CG_GetClientWeaponMuzzleBoltPoint
CALLV
pop
line 1568
;1568:		}
ADDRGP4 $1105
JUMPV
LABELV $1104
line 1570
;1569:		else
;1570:		{
line 1571
;1571:			if (cg.lastFPFlashPoint[0] ||cg.lastFPFlashPoint[1] || cg.lastFPFlashPoint[2])
ADDRLP4 96
CNSTF4 0
ASGNF4
ADDRGP4 cg+13796
INDIRF4
ADDRLP4 96
INDIRF4
NEF4 $1117
ADDRGP4 cg+13796+4
INDIRF4
ADDRLP4 96
INDIRF4
NEF4 $1117
ADDRGP4 cg+13796+8
INDIRF4
ADDRLP4 96
INDIRF4
EQF4 $1109
LABELV $1117
line 1572
;1572:			{ //get the position of the muzzle flash for the first person weapon model from the last frame
line 1573
;1573:				VectorCopy(cg.lastFPFlashPoint, cent->currentState.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 cg+13796
INDIRB
ASGNB 12
line 1574
;1574:			}
LABELV $1109
line 1575
;1575:		}
LABELV $1105
line 1576
;1576:		FX_DisruptorAltShot( cent->currentState.origin2, cent->lerpOrigin, cent->currentState.shouldtarget );
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 96
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 96
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ARGI4
ADDRGP4 FX_DisruptorAltShot
CALLV
pop
line 1577
;1577:		break;
ADDRGP4 $650
JUMPV
LABELV $1119
line 1580
;1578:
;1579:	case EV_DISRUPTOR_SNIPER_MISS:
;1580:		DEBUGNAME("EV_DISRUPTOR_SNIPER_MISS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1120
ADDRGP4 $1123
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1120
line 1581
;1581:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1582
;1582:		if (es->weapon)
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1124
line 1583
;1583:		{ //primary
line 1584
;1584:			FX_DisruptorHitWall( cent->lerpOrigin, dir );
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 FX_DisruptorHitWall
CALLV
pop
line 1585
;1585:		}
ADDRGP4 $650
JUMPV
LABELV $1124
line 1587
;1586:		else
;1587:		{ //secondary
line 1588
;1588:			FX_DisruptorAltMiss( cent->lerpOrigin, dir );
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 FX_DisruptorAltMiss
CALLV
pop
line 1589
;1589:		}
line 1590
;1590:		break;
ADDRGP4 $650
JUMPV
LABELV $1126
line 1593
;1591:
;1592:	case EV_DISRUPTOR_HIT:
;1593:		DEBUGNAME("EV_DISRUPTOR_HIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1127
ADDRGP4 $1130
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1127
line 1594
;1594:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1595
;1595:		if (es->weapon)
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1131
line 1596
;1596:		{ //client
line 1597
;1597:			FX_DisruptorHitPlayer( cent->lerpOrigin, dir, qtrue );
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 FX_DisruptorHitPlayer
CALLV
pop
line 1598
;1598:		}
ADDRGP4 $650
JUMPV
LABELV $1131
line 1600
;1599:		else
;1600:		{ //non-client
line 1601
;1601:			FX_DisruptorHitWall( cent->lerpOrigin, dir );
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 FX_DisruptorHitWall
CALLV
pop
line 1602
;1602:		}
line 1603
;1603:		break;
ADDRGP4 $650
JUMPV
LABELV $1133
line 1606
;1604:
;1605:	case EV_DISRUPTOR_ZOOMSOUND:
;1606:		DEBUGNAME("EV_DISRUPTOR_ZOOMSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1134
ADDRGP4 $1137
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1134
line 1607
;1607:		if (es->number == cg.snap->ps.clientNum)
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $650
line 1608
;1608:		{
line 1609
;1609:			if (cg.snap->ps.zoomMode)
ADDRGP4 cg+36
INDIRP4
CNSTI4 1376
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1141
line 1610
;1610:			{
line 1611
;1611:				trap_S_StartLocalSound(trap_S_RegisterSound("sound/weapons/disruptor/zoomstart.wav"), CHAN_AUTO);
ADDRGP4 $1144
ARGP4
ADDRLP4 100
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1612
;1612:			}
ADDRGP4 $650
JUMPV
LABELV $1141
line 1614
;1613:			else
;1614:			{
line 1615
;1615:				trap_S_StartLocalSound(trap_S_RegisterSound("sound/weapons/disruptor/zoomend.wav"), CHAN_AUTO);
ADDRGP4 $1145
ARGP4
ADDRLP4 100
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1616
;1616:			}
line 1617
;1617:		}
line 1618
;1618:		break;
ADDRGP4 $650
JUMPV
LABELV $1146
line 1620
;1619:	case EV_PREDEFSOUND:
;1620:		DEBUGNAME("EV_PREDEFSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1147
ADDRGP4 $1150
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1147
line 1621
;1621:		{
line 1622
;1622:			int sID = -1;
ADDRLP4 100
CNSTI4 -1
ASGNI4
line 1624
;1623:
;1624:			switch (es->eventParm)
ADDRLP4 104
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 1
LTI4 $1152
ADDRLP4 104
INDIRI4
CNSTI4 6
GTI4 $1152
ADDRLP4 104
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1171-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1171
address $1154
address $1156
address $1158
address $1165
address $1167
address $1169
code
line 1625
;1625:			{
LABELV $1154
line 1627
;1626:			case PDSOUND_PROTECTHIT:
;1627:				sID = trap_S_RegisterSound("sound/weapons/force/protecthit.mp3");
ADDRGP4 $1155
ARGP4
ADDRLP4 112
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 112
INDIRI4
ASGNI4
line 1628
;1628:				break;
ADDRGP4 $1152
JUMPV
LABELV $1156
line 1630
;1629:			case PDSOUND_PROTECT:
;1630:				sID = trap_S_RegisterSound("sound/weapons/force/protect.mp3");
ADDRGP4 $1157
ARGP4
ADDRLP4 116
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 116
INDIRI4
ASGNI4
line 1631
;1631:				break;
ADDRGP4 $1152
JUMPV
LABELV $1158
line 1633
;1632:			case PDSOUND_ABSORBHIT:
;1633:				sID = trap_S_RegisterSound("sound/weapons/force/absorbhit.mp3");
ADDRGP4 $1159
ARGP4
ADDRLP4 120
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 120
INDIRI4
ASGNI4
line 1634
;1634:				if (es->trickedentindex >= 0 && es->trickedentindex < MAX_CLIENTS)
ADDRLP4 124
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
LTI4 $1152
ADDRLP4 124
INDIRI4
CNSTI4 32
GEI4 $1152
line 1635
;1635:				{
line 1636
;1636:					int clnum = es->trickedentindex;
ADDRLP4 128
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 1638
;1637:
;1638:					cg_entities[clnum].teamPowerEffectTime = cg.time + 1000;
CNSTI4 1920
ADDRLP4 128
INDIRI4
MULI4
ADDRGP4 cg_entities+1912
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1639
;1639:					cg_entities[clnum].teamPowerType = 3;
CNSTI4 1920
ADDRLP4 128
INDIRI4
MULI4
ADDRGP4 cg_entities+1916
ADDP4
CNSTI4 3
ASGNI4
line 1640
;1640:				}
line 1641
;1641:				break;
ADDRGP4 $1152
JUMPV
LABELV $1165
line 1643
;1642:			case PDSOUND_ABSORB:
;1643:				sID = trap_S_RegisterSound("sound/weapons/force/absorb.mp3");
ADDRGP4 $1166
ARGP4
ADDRLP4 128
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 128
INDIRI4
ASGNI4
line 1644
;1644:				break;
ADDRGP4 $1152
JUMPV
LABELV $1167
line 1646
;1645:			case PDSOUND_FORCEJUMP:
;1646:				sID = trap_S_RegisterSound("sound/weapons/force/jump.mp3");
ADDRGP4 $1168
ARGP4
ADDRLP4 132
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 132
INDIRI4
ASGNI4
line 1647
;1647:				break;
ADDRGP4 $1152
JUMPV
LABELV $1169
line 1649
;1648:			case PDSOUND_FORCEGRIP:
;1649:				sID = trap_S_RegisterSound("sound/weapons/force/grip.mp3");
ADDRGP4 $1170
ARGP4
ADDRLP4 136
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 136
INDIRI4
ASGNI4
line 1650
;1650:				break;
line 1652
;1651:			default:
;1652:				break;
LABELV $1152
line 1655
;1653:			}
;1654:
;1655:			if (sID != 1)
ADDRLP4 100
INDIRI4
CNSTI4 1
EQI4 $650
line 1656
;1656:			{
line 1657
;1657:				trap_S_StartSound(es->origin, es->number, CHAN_AUTO, sID);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 100
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1658
;1658:			}
line 1659
;1659:		}
line 1660
;1660:		break;
ADDRGP4 $650
JUMPV
LABELV $1175
line 1663
;1661:
;1662:	case EV_TEAM_POWER:
;1663:		DEBUGNAME("EV_TEAM_POWER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1176
ADDRGP4 $1179
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1176
line 1664
;1664:		{
line 1665
;1665:			int clnum = 0;
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRGP4 $1181
JUMPV
LABELV $1180
line 1668
;1666:
;1667:			while (clnum < MAX_CLIENTS)
;1668:			{
line 1669
;1669:				if (CG_InClientBitflags(es, clnum))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 100
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 CG_InClientBitflags
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $1183
line 1670
;1670:				{
line 1671
;1671:					if (es->eventParm == 1)
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1185
line 1672
;1672:					{ //eventParm 1 is heal
line 1673
;1673:						trap_S_StartSound (NULL, clnum, CHAN_AUTO, cgs.media.teamHealSound );
CNSTP4 0
ARGP4
ADDRLP4 100
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+688
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1674
;1674:						cg_entities[clnum].teamPowerEffectTime = cg.time + 1000;
CNSTI4 1920
ADDRLP4 100
INDIRI4
MULI4
ADDRGP4 cg_entities+1912
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1675
;1675:						cg_entities[clnum].teamPowerType = 1;
CNSTI4 1920
ADDRLP4 100
INDIRI4
MULI4
ADDRGP4 cg_entities+1916
ADDP4
CNSTI4 1
ASGNI4
line 1676
;1676:					}
ADDRGP4 $1186
JUMPV
LABELV $1185
line 1678
;1677:					else
;1678:					{ //eventParm 2 is force regen
line 1679
;1679:						trap_S_StartSound (NULL, clnum, CHAN_AUTO, cgs.media.teamRegenSound );
CNSTP4 0
ARGP4
ADDRLP4 100
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+692
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1680
;1680:						cg_entities[clnum].teamPowerEffectTime = cg.time + 1000;
CNSTI4 1920
ADDRLP4 100
INDIRI4
MULI4
ADDRGP4 cg_entities+1912
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1681
;1681:						cg_entities[clnum].teamPowerType = 0;
CNSTI4 1920
ADDRLP4 100
INDIRI4
MULI4
ADDRGP4 cg_entities+1916
ADDP4
CNSTI4 0
ASGNI4
line 1682
;1682:					}
LABELV $1186
line 1683
;1683:				}
LABELV $1183
line 1684
;1684:				clnum++;
ADDRLP4 100
ADDRLP4 100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1685
;1685:			}
LABELV $1181
line 1667
ADDRLP4 100
INDIRI4
CNSTI4 32
LTI4 $1180
line 1686
;1686:		}
line 1687
;1687:		break;
ADDRGP4 $650
JUMPV
LABELV $1197
line 1690
;1688:
;1689:	case EV_SCREENSHAKE:
;1690:		DEBUGNAME("EV_SCREENSHAKE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1198
ADDRGP4 $1201
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1198
line 1691
;1691:		if (!es->modelindex || cg.predictedPlayerState.clientNum == es->modelindex-1)
ADDRLP4 100
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $1206
ADDRGP4 cg+96+144
INDIRI4
ADDRLP4 100
INDIRI4
CNSTI4 1
SUBI4
NEI4 $650
LABELV $1206
line 1692
;1692:		{
line 1693
;1693:			CGCam_Shake(es->angles[0], es->time);
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ARGI4
ADDRGP4 CGCam_Shake
CALLV
pop
line 1694
;1694:		}
line 1695
;1695:		break;
ADDRGP4 $650
JUMPV
LABELV $1207
line 1697
;1696:	case EV_USE_ITEM0:
;1697:		DEBUGNAME("EV_USE_ITEM0");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1208
ADDRGP4 $1211
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1208
line 1698
;1698:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1699
;1699:		break;
ADDRGP4 $650
JUMPV
LABELV $1212
line 1701
;1700:	case EV_USE_ITEM1:
;1701:		DEBUGNAME("EV_USE_ITEM1");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1213
ADDRGP4 $1216
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1213
line 1702
;1702:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1703
;1703:		break;
ADDRGP4 $650
JUMPV
LABELV $1217
line 1705
;1704:	case EV_USE_ITEM2:
;1705:		DEBUGNAME("EV_USE_ITEM2");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1218
ADDRGP4 $1221
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1218
line 1706
;1706:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1707
;1707:		break;
ADDRGP4 $650
JUMPV
LABELV $1222
line 1709
;1708:	case EV_USE_ITEM3:
;1709:		DEBUGNAME("EV_USE_ITEM3");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1223
ADDRGP4 $1226
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1223
line 1710
;1710:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1711
;1711:		break;
ADDRGP4 $650
JUMPV
LABELV $1227
line 1713
;1712:	case EV_USE_ITEM4:
;1713:		DEBUGNAME("EV_USE_ITEM4");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1228
ADDRGP4 $1231
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1228
line 1714
;1714:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1715
;1715:		break;
ADDRGP4 $650
JUMPV
LABELV $1232
line 1717
;1716:	case EV_USE_ITEM5:
;1717:		DEBUGNAME("EV_USE_ITEM5");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1233
ADDRGP4 $1236
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1233
line 1718
;1718:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1719
;1719:		break;
ADDRGP4 $650
JUMPV
LABELV $1237
line 1721
;1720:	case EV_USE_ITEM6:
;1721:		DEBUGNAME("EV_USE_ITEM6");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1238
ADDRGP4 $1241
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1238
line 1722
;1722:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1723
;1723:		break;
ADDRGP4 $650
JUMPV
LABELV $1242
line 1725
;1724:	case EV_USE_ITEM7:
;1725:		DEBUGNAME("EV_USE_ITEM7");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1243
ADDRGP4 $1246
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1243
line 1726
;1726:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1727
;1727:		break;
ADDRGP4 $650
JUMPV
LABELV $1247
line 1729
;1728:	case EV_USE_ITEM8:
;1729:		DEBUGNAME("EV_USE_ITEM8");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1248
ADDRGP4 $1251
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1248
line 1730
;1730:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1731
;1731:		break;
ADDRGP4 $650
JUMPV
LABELV $1252
line 1733
;1732:	case EV_USE_ITEM9:
;1733:		DEBUGNAME("EV_USE_ITEM9");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1253
ADDRGP4 $1256
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1253
line 1734
;1734:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1735
;1735:		break;
ADDRGP4 $650
JUMPV
LABELV $1257
line 1737
;1736:	case EV_USE_ITEM10:
;1737:		DEBUGNAME("EV_USE_ITEM10");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1258
ADDRGP4 $1261
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1258
line 1738
;1738:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1739
;1739:		break;
ADDRGP4 $650
JUMPV
LABELV $1262
line 1741
;1740:	case EV_USE_ITEM11:
;1741:		DEBUGNAME("EV_USE_ITEM11");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1263
ADDRGP4 $1266
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1263
line 1742
;1742:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1743
;1743:		break;
ADDRGP4 $650
JUMPV
LABELV $1267
line 1745
;1744:	case EV_USE_ITEM12:
;1745:		DEBUGNAME("EV_USE_ITEM12");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1268
ADDRGP4 $1271
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1268
line 1746
;1746:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1747
;1747:		break;
ADDRGP4 $650
JUMPV
LABELV $1272
line 1749
;1748:	case EV_USE_ITEM13:
;1749:		DEBUGNAME("EV_USE_ITEM13");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1273
ADDRGP4 $1276
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1273
line 1750
;1750:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1751
;1751:		break;
ADDRGP4 $650
JUMPV
LABELV $1277
line 1753
;1752:	case EV_USE_ITEM14:
;1753:		DEBUGNAME("EV_USE_ITEM14");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1278
ADDRGP4 $1281
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1278
line 1754
;1754:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1755
;1755:		break;
ADDRGP4 $650
JUMPV
LABELV $1282
line 1758
;1756:
;1757:	case EV_ITEMUSEFAIL:
;1758:		DEBUGNAME("EV_ITEMUSEFAIL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1283
ADDRGP4 $1286
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1283
line 1759
;1759:		if (cg.snap->ps.clientNum == es->number)
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
NEI4 $650
line 1760
;1760:		{
line 1761
;1761:			char *stripedref = NULL;
ADDRLP4 104
CNSTP4 0
ASGNP4
line 1763
;1762:
;1763:			switch(es->eventParm)
ADDRLP4 108
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 1
LTI4 $1291
ADDRLP4 108
INDIRI4
CNSTI4 4
GTI4 $1291
ADDRLP4 108
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1301-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1301
address $1293
address $1295
address $1297
address $1299
code
line 1764
;1764:			{
LABELV $1293
line 1766
;1765:			case SENTRY_NOROOM:
;1766:				stripedref = (char *)CG_GetStripEdString("INGAMETEXT", "SENTRY_NOROOM");
ADDRGP4 $241
ARGP4
ADDRGP4 $1294
ARGP4
ADDRLP4 116
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 116
INDIRP4
ASGNP4
line 1767
;1767:				break;
ADDRGP4 $1291
JUMPV
LABELV $1295
line 1769
;1768:			case SENTRY_ALREADYPLACED:
;1769:				stripedref = (char *)CG_GetStripEdString("INGAMETEXT", "SENTRY_ALREADYPLACED");
ADDRGP4 $241
ARGP4
ADDRGP4 $1296
ARGP4
ADDRLP4 120
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 120
INDIRP4
ASGNP4
line 1770
;1770:				break;
ADDRGP4 $1291
JUMPV
LABELV $1297
line 1772
;1771:			case SHIELD_NOROOM:
;1772:				stripedref = (char *)CG_GetStripEdString("INGAMETEXT", "SHIELD_NOROOM");
ADDRGP4 $241
ARGP4
ADDRGP4 $1298
ARGP4
ADDRLP4 124
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 124
INDIRP4
ASGNP4
line 1773
;1773:				break;
ADDRGP4 $1291
JUMPV
LABELV $1299
line 1775
;1774:			case SEEKER_ALREADYDEPLOYED:
;1775:				stripedref = (char *)CG_GetStripEdString("INGAMETEXT", "SEEKER_ALREADYDEPLOYED");
ADDRGP4 $241
ARGP4
ADDRGP4 $1300
ARGP4
ADDRLP4 128
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 104
ADDRLP4 128
INDIRP4
ASGNP4
line 1776
;1776:				break;
line 1778
;1777:			default:
;1778:				break;
LABELV $1291
line 1781
;1779:			}
;1780:
;1781:			if (!stripedref)
ADDRLP4 104
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1303
line 1782
;1782:			{
line 1783
;1783:				break;
ADDRGP4 $650
JUMPV
LABELV $1303
line 1786
;1784:			}
;1785:
;1786:			Com_Printf("%s\n", stripedref);
ADDRGP4 $582
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1787
;1787:		}
line 1788
;1788:		break;
ADDRGP4 $650
JUMPV
LABELV $1305
line 1796
;1789:
;1790:	//=================================================================
;1791:
;1792:	//
;1793:	// other events
;1794:	//
;1795:	case EV_PLAYER_TELEPORT_IN:
;1796:		DEBUGNAME("EV_PLAYER_TELEPORT_IN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1306
ADDRGP4 $1309
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1306
line 1797
;1797:		{
line 1799
;1798:			trace_t tr;
;1799:			vec3_t playerMins = {-15, -15, DEFAULT_MINS_2+8};
ADDRLP4 104
ADDRGP4 $1310
INDIRB
ASGNB 12
line 1800
;1800:			vec3_t playerMaxs = {15, 15, DEFAULT_MAXS_2};
ADDRLP4 116
ADDRGP4 $1311
INDIRB
ASGNB 12
line 1803
;1801:			vec3_t ang, pos, dpos;
;1802:
;1803:			VectorClear(ang);
ADDRLP4 1244
CNSTF4 0
ASGNF4
ADDRLP4 128+8
ADDRLP4 1244
INDIRF4
ASGNF4
ADDRLP4 128+4
ADDRLP4 1244
INDIRF4
ASGNF4
ADDRLP4 128
ADDRLP4 1244
INDIRF4
ASGNF4
line 1804
;1804:			ang[ROLL] = 1;
ADDRLP4 128+8
CNSTF4 1065353216
ASGNF4
line 1806
;1805:
;1806:			VectorCopy(position, dpos);
ADDRLP4 1220
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1807
;1807:			dpos[2] -= 4096;
ADDRLP4 1220+8
ADDRLP4 1220+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 1809
;1808:
;1809:			CG_Trace(&tr, position, playerMins, playerMaxs, dpos, es->number, MASK_SOLID);
ADDRLP4 140
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 116
ARGP4
ADDRLP4 1220
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 1810
;1810:			VectorCopy(tr.endpos, pos);
ADDRLP4 1232
ADDRLP4 140+12
INDIRB
ASGNB 12
line 1812
;1811:			
;1812:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+696
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1814
;1813:
;1814:			if (tr.fraction == 1)
ADDRLP4 140+8
INDIRF4
CNSTF4 1065353216
NEF4 $1319
line 1815
;1815:			{
line 1816
;1816:				break;
ADDRGP4 $650
JUMPV
LABELV $1319
line 1818
;1817:			}
;1818:			trap_FX_PlayEffectID(trap_FX_RegisterEffect("mp/spawn.efx"), pos, ang);
ADDRGP4 $1322
ARGP4
ADDRLP4 1248
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 1248
INDIRI4
ARGI4
ADDRLP4 1232
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1819
;1819:		}
line 1820
;1820:		break;
ADDRGP4 $650
JUMPV
LABELV $1323
line 1823
;1821:
;1822:	case EV_PLAYER_TELEPORT_OUT:
;1823:		DEBUGNAME("EV_PLAYER_TELEPORT_OUT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1324
ADDRGP4 $1327
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1324
line 1824
;1824:		{
line 1826
;1825:			trace_t tr;
;1826:			vec3_t playerMins = {-15, -15, DEFAULT_MINS_2+8};
ADDRLP4 104
ADDRGP4 $1328
INDIRB
ASGNB 12
line 1827
;1827:			vec3_t playerMaxs = {15, 15, DEFAULT_MAXS_2};
ADDRLP4 116
ADDRGP4 $1329
INDIRB
ASGNB 12
line 1830
;1828:			vec3_t ang, pos, dpos;
;1829:
;1830:			VectorClear(ang);
ADDRLP4 1244
CNSTF4 0
ASGNF4
ADDRLP4 128+8
ADDRLP4 1244
INDIRF4
ASGNF4
ADDRLP4 128+4
ADDRLP4 1244
INDIRF4
ASGNF4
ADDRLP4 128
ADDRLP4 1244
INDIRF4
ASGNF4
line 1831
;1831:			ang[ROLL] = 1;
ADDRLP4 128+8
CNSTF4 1065353216
ASGNF4
line 1833
;1832:
;1833:			VectorCopy(position, dpos);
ADDRLP4 1220
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1834
;1834:			dpos[2] -= 4096;
ADDRLP4 1220+8
ADDRLP4 1220+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 1836
;1835:
;1836:			CG_Trace(&tr, position, playerMins, playerMaxs, dpos, es->number, MASK_SOLID);
ADDRLP4 140
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 116
ARGP4
ADDRLP4 1220
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 1837
;1837:			VectorCopy(tr.endpos, pos);
ADDRLP4 1232
ADDRLP4 140+12
INDIRB
ASGNB 12
line 1839
;1838:
;1839:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+700
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1841
;1840:
;1841:			if (tr.fraction == 1)
ADDRLP4 140+8
INDIRF4
CNSTF4 1065353216
NEF4 $1337
line 1842
;1842:			{
line 1843
;1843:				break;
ADDRGP4 $650
JUMPV
LABELV $1337
line 1845
;1844:			}
;1845:			trap_FX_PlayEffectID(trap_FX_RegisterEffect("mp/spawn.efx"), pos, ang);
ADDRGP4 $1322
ARGP4
ADDRLP4 1248
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 1248
INDIRI4
ARGI4
ADDRLP4 1232
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 1846
;1846:		}
line 1847
;1847:		break;
ADDRGP4 $650
JUMPV
LABELV $1340
line 1850
;1848:
;1849:	case EV_ITEM_POP:
;1850:		DEBUGNAME("EV_ITEM_POP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1341
ADDRGP4 $1344
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1341
line 1851
;1851:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+704
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1852
;1852:		break;
ADDRGP4 $650
JUMPV
LABELV $1347
line 1854
;1853:	case EV_ITEM_RESPAWN:
;1854:		DEBUGNAME("EV_ITEM_RESPAWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1348
ADDRGP4 $1351
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1348
line 1855
;1855:		cent->miscTime = cg.time;	// scale up from this
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 1856
;1856:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+704
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1857
;1857:		break;
ADDRGP4 $650
JUMPV
LABELV $1355
line 1860
;1858:
;1859:	case EV_GRENADE_BOUNCE:
;1860:		DEBUGNAME("EV_GRENADE_BOUNCE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $650
ADDRGP4 $1359
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1862
;1861:		//Do something here?
;1862:		break;
ADDRGP4 $650
JUMPV
LABELV $1360
line 1865
;1863:
;1864:	case EV_SCOREPLUM:
;1865:		DEBUGNAME("EV_SCOREPLUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1361
ADDRGP4 $1364
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1361
line 1866
;1866:		CG_ScorePlum( cent->currentState.otherEntityNum, cent->lerpOrigin, cent->currentState.time );
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 104
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ScorePlum
CALLV
pop
line 1867
;1867:		break;
ADDRGP4 $650
JUMPV
LABELV $1365
line 1870
;1868:
;1869:	case EV_CTFMESSAGE:
;1870:		DEBUGNAME("EV_CTFMESSAGE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1366
ADDRGP4 $1369
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1366
line 1871
;1871:		CG_GetCTFMessageEvent(es);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_GetCTFMessageEvent
CALLV
pop
line 1872
;1872:		break;
ADDRGP4 $650
JUMPV
LABELV $1370
line 1878
;1873:
;1874:	//
;1875:	// saga gameplay events
;1876:	//
;1877:	case EV_SAGA_ROUNDOVER:
;1878:		DEBUGNAME("EV_SAGA_ROUNDOVER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1371
ADDRGP4 $1374
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1371
line 1879
;1879:		CG_SagaRoundOver(&cg_entities[cent->currentState.weapon], cent->currentState.eventParm);
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 108
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
ADDRLP4 108
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_SagaRoundOver
CALLV
pop
line 1880
;1880:		break;
ADDRGP4 $650
JUMPV
LABELV $1375
line 1882
;1881:	case EV_SAGA_OBJECTIVECOMPLETE:
;1882:		DEBUGNAME("EV_SAGA_OBJECTIVECOMPLETE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1376
ADDRGP4 $1379
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1376
line 1883
;1883:		CG_SagaObjectiveCompleted(&cg_entities[cent->currentState.weapon], cent->currentState.eventParm, cent->currentState.trickedentindex);
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1920
ADDRLP4 112
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
ADDRLP4 112
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 112
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_SagaObjectiveCompleted
CALLV
pop
line 1884
;1884:		break;
ADDRGP4 $650
JUMPV
LABELV $1380
line 1887
;1885:
;1886:	case EV_DESTROY_GHOUL2_INSTANCE:
;1887:		DEBUGNAME("EV_DESTROY_GHOUL2_INSTANCE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1381
ADDRGP4 $1384
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1381
line 1888
;1888:		if (cg_entities[es->eventParm].ghoul2 && trap_G2_HaveWeGhoul2Models(cg_entities[es->eventParm].ghoul2))
ADDRLP4 116
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 116
INDIRI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $650
ADDRLP4 116
INDIRI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $650
line 1889
;1889:		{
line 1890
;1890:			if (es->eventParm < MAX_CLIENTS)
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 32
GEI4 $1389
line 1891
;1891:			{ //You try to do very bad thing!
line 1895
;1892:#ifdef _DEBUG
;1893:				Com_Printf("WARNING: Tried to kill a client ghoul2 instance with a server event!\n");
;1894:#endif
;1895:				break;
ADDRGP4 $650
JUMPV
LABELV $1389
line 1897
;1896:			}
;1897:			trap_G2API_CleanGhoul2Models(&(cg_entities[es->eventParm].ghoul2));
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
CALLV
pop
line 1898
;1898:		}
line 1899
;1899:		break;
ADDRGP4 $650
JUMPV
LABELV $1392
line 1902
;1900:
;1901:	case EV_DESTROY_WEAPON_MODEL:
;1902:		DEBUGNAME("EV_DESTROY_WEAPON_MODEL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1393
ADDRGP4 $1396
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1393
line 1903
;1903:		if (cg_entities[es->eventParm].ghoul2 && trap_G2_HaveWeGhoul2Models(cg_entities[es->eventParm].ghoul2) &&
ADDRLP4 124
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 124
INDIRI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $650
ADDRLP4 124
INDIRI4
ADDRGP4 cg_entities+952
ADDP4
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $650
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 132
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $650
line 1905
;1904:			trap_G2API_HasGhoul2ModelOnIndex(&(cg_entities[es->eventParm].ghoul2), 1))
;1905:		{
line 1906
;1906:			trap_G2API_RemoveGhoul2Model(&(cg_entities[es->eventParm].ghoul2), 1);
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+952
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_G2API_RemoveGhoul2Model
CALLI4
pop
line 1907
;1907:		}
line 1908
;1908:		break;
ADDRGP4 $650
JUMPV
LABELV $1403
line 1911
;1909:
;1910:	case EV_GIVE_NEW_RANK:
;1911:		DEBUGNAME("EV_GIVE_NEW_RANK");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1404
ADDRGP4 $1407
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1404
line 1912
;1912:		if (es->trickedentindex == cg.snap->ps.clientNum)
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $650
line 1913
;1913:		{
line 1914
;1914:			trap_Cvar_Set("ui_rankChange", va("%i", es->eventParm));
ADDRGP4 $1412
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 136
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1411
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1916
;1915:
;1916:			trap_Cvar_Set("ui_myteam", va("%i", es->bolt2));
ADDRGP4 $1412
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1413
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1918
;1917:
;1918:			if (!( trap_Key_GetCatcher() & KEYCATCH_UI ) && !es->bolt1)
ADDRLP4 144
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 148
CNSTI4 0
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 148
INDIRI4
NEI4 $650
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRLP4 148
INDIRI4
NEI4 $650
line 1919
;1919:			{
line 1920
;1920:				trap_OpenUIMenu(3);
CNSTI4 3
ARGI4
ADDRGP4 trap_OpenUIMenu
CALLV
pop
line 1921
;1921:			}
line 1922
;1922:		}
line 1923
;1923:		break;
ADDRGP4 $650
JUMPV
LABELV $1416
line 1926
;1924:
;1925:	case EV_SET_FREE_SABER:
;1926:		DEBUGNAME("EV_SET_FREE_SABER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1417
ADDRGP4 $1420
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1417
line 1928
;1927:
;1928:		trap_Cvar_Set("ui_freeSaber", va("%i", es->eventParm));
ADDRGP4 $1412
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 136
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1421
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1929
;1929:		break;
ADDRGP4 $650
JUMPV
LABELV $1422
line 1932
;1930:
;1931:	case EV_SET_FORCE_DISABLE:
;1932:		DEBUGNAME("EV_SET_FORCE_DISABLE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1423
ADDRGP4 $1426
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1423
line 1934
;1933:
;1934:		trap_Cvar_Set("ui_forcePowerDisable", va("%i", es->eventParm));
ADDRGP4 $1412
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1427
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1935
;1935:		break;
ADDRGP4 $650
JUMPV
LABELV $1428
line 1941
;1936:
;1937:	//
;1938:	// missile impacts
;1939:	//
;1940:	case EV_MISSILE_STICK:
;1941:		DEBUGNAME("EV_MISSILE_STICK");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $650
ADDRGP4 $1432
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1943
;1942://		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.missileStick );
;1943:		break;
ADDRGP4 $650
JUMPV
LABELV $1433
line 1946
;1944:
;1945:	case EV_MISSILE_HIT:
;1946:		DEBUGNAME("EV_MISSILE_HIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1434
ADDRGP4 $1437
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1434
line 1947
;1947:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1948
;1948:		if (cent->currentState.eFlags & EF_ALT_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1438
line 1949
;1949:		{
line 1950
;1950:			CG_MissileHitPlayer( es->weapon, position, dir, es->otherEntityNum, qtrue);
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_MissileHitPlayer
CALLV
pop
line 1951
;1951:		}
ADDRGP4 $650
JUMPV
LABELV $1438
line 1953
;1952:		else
;1953:		{
line 1954
;1954:			CG_MissileHitPlayer( es->weapon, position, dir, es->otherEntityNum, qfalse);
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_MissileHitPlayer
CALLV
pop
line 1955
;1955:		}
line 1956
;1956:		break;
ADDRGP4 $650
JUMPV
LABELV $1440
line 1959
;1957:
;1958:	case EV_MISSILE_MISS:
;1959:		DEBUGNAME("EV_MISSILE_MISS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1441
ADDRGP4 $1444
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1441
line 1960
;1960:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1961
;1961:		if (cent->currentState.eFlags & EF_ALT_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1445
line 1962
;1962:		{
line 1963
;1963:			CG_MissileHitWall(es->weapon, 0, position, dir, IMPACTSOUND_DEFAULT, qtrue, es->generic1);
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 148
CNSTI4 0
ASGNI4
ADDRLP4 148
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 148
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 1964
;1964:		}
ADDRGP4 $650
JUMPV
LABELV $1445
line 1966
;1965:		else
;1966:		{
line 1967
;1967:			CG_MissileHitWall(es->weapon, 0, position, dir, IMPACTSOUND_DEFAULT, qfalse, 0);
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
CNSTI4 0
ASGNI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 144
INDIRI4
ARGI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 1968
;1968:		}
line 1969
;1969:		break;
ADDRGP4 $650
JUMPV
LABELV $1447
line 1972
;1970:
;1971:	case EV_MISSILE_MISS_METAL:
;1972:		DEBUGNAME("EV_MISSILE_MISS_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1448
ADDRGP4 $1451
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1448
line 1973
;1973:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1974
;1974:		if (cent->currentState.eFlags & EF_ALT_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1452
line 1975
;1975:		{
line 1976
;1976:			CG_MissileHitWall(es->weapon, 0, position, dir, IMPACTSOUND_METAL, qtrue, es->generic1);
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 148
CNSTI4 1
ASGNI4
ADDRLP4 148
INDIRI4
ARGI4
ADDRLP4 148
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 1977
;1977:		}
ADDRGP4 $650
JUMPV
LABELV $1452
line 1979
;1978:		else
;1979:		{
line 1980
;1980:			CG_MissileHitWall(es->weapon, 0, position, dir, IMPACTSOUND_METAL, qfalse, 0);
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
CNSTI4 0
ASGNI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 1981
;1981:		}
line 1982
;1982:		break;
ADDRGP4 $650
JUMPV
LABELV $1454
line 1985
;1983:
;1984:	case EV_PLAY_EFFECT:
;1985:		DEBUGNAME("EV_PLAY_EFFECT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1455
ADDRGP4 $1458
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1455
line 1986
;1986:		switch(es->eventParm)
ADDRLP4 144
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 1
LTI4 $1459
ADDRLP4 144
INDIRI4
CNSTI4 9
GTI4 $1459
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1480-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1480
address $1462
address $1464
address $1466
address $1468
address $1470
address $1472
address $1474
address $1476
address $1478
code
line 1987
;1987:		{ //it isn't a hack, it's ingenuity!
LABELV $1462
line 1989
;1988:		case EFFECT_SMOKE:
;1989:			eID = trap_FX_RegisterEffect("emplaced/dead_smoke.efx");
ADDRGP4 $1463
ARGP4
ADDRLP4 152
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 152
INDIRI4
ASGNI4
line 1990
;1990:			break;
ADDRGP4 $1460
JUMPV
LABELV $1464
line 1992
;1991:		case EFFECT_EXPLOSION:
;1992:			eID = trap_FX_RegisterEffect("emplaced/explode.efx");
ADDRGP4 $1465
ARGP4
ADDRLP4 156
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 156
INDIRI4
ASGNI4
line 1993
;1993:			break;
ADDRGP4 $1460
JUMPV
LABELV $1466
line 1995
;1994:		case EFFECT_EXPLOSION_PAS:
;1995:			eID = trap_FX_RegisterEffect("turret/explode.efx");
ADDRGP4 $1467
ARGP4
ADDRLP4 160
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 160
INDIRI4
ASGNI4
line 1996
;1996:			break;
ADDRGP4 $1460
JUMPV
LABELV $1468
line 1998
;1997:		case EFFECT_SPARK_EXPLOSION:
;1998:			eID = trap_FX_RegisterEffect("spark_explosion.efx");
ADDRGP4 $1469
ARGP4
ADDRLP4 164
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 164
INDIRI4
ASGNI4
line 1999
;1999:			break;
ADDRGP4 $1460
JUMPV
LABELV $1470
line 2001
;2000:		case EFFECT_EXPLOSION_TRIPMINE:
;2001:			eID = trap_FX_RegisterEffect("tripMine/explosion.efx");
ADDRGP4 $1471
ARGP4
ADDRLP4 168
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 168
INDIRI4
ASGNI4
line 2002
;2002:			break;
ADDRGP4 $1460
JUMPV
LABELV $1472
line 2004
;2003:		case EFFECT_EXPLOSION_DETPACK:
;2004:			eID = trap_FX_RegisterEffect("detpack/explosion.efx");
ADDRGP4 $1473
ARGP4
ADDRLP4 172
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 172
INDIRI4
ASGNI4
line 2005
;2005:			break;
ADDRGP4 $1460
JUMPV
LABELV $1474
line 2007
;2006:		case EFFECT_EXPLOSION_FLECHETTE:
;2007:			eID = trap_FX_RegisterEffect("flechette/alt_blow.efx");
ADDRGP4 $1475
ARGP4
ADDRLP4 176
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 176
INDIRI4
ASGNI4
line 2008
;2008:			break;
ADDRGP4 $1460
JUMPV
LABELV $1476
line 2010
;2009:		case EFFECT_STUNHIT:
;2010:			eID = trap_FX_RegisterEffect("stunBaton/flesh_impact.efx");
ADDRGP4 $1477
ARGP4
ADDRLP4 180
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 180
INDIRI4
ASGNI4
line 2011
;2011:			break;
ADDRGP4 $1460
JUMPV
LABELV $1478
line 2013
;2012:		case EFFECT_EXPLOSION_DEMP2ALT:
;2013:			FX_DEMP2_AltDetonate( cent->lerpOrigin, es->weapon );
ADDRFP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 FX_DEMP2_AltDetonate
CALLV
pop
line 2014
;2014:			eID = trap_FX_RegisterEffect("demp2/altDetonate.efx");
ADDRGP4 $1479
ARGP4
ADDRLP4 184
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 184
INDIRI4
ASGNI4
line 2015
;2015:			break;
ADDRGP4 $1460
JUMPV
LABELV $1459
line 2017
;2016:		default:
;2017:			eID = -1;
ADDRLP4 28
CNSTI4 -1
ASGNI4
line 2018
;2018:			break;
LABELV $1460
line 2021
;2019:		}
;2020:
;2021:		if (eID != -1)
ADDRLP4 28
INDIRI4
CNSTI4 -1
EQI4 $650
line 2022
;2022:		{
line 2025
;2023:			vec3_t fxDir;
;2024:
;2025:			VectorCopy(es->angles, fxDir);
ADDRLP4 152
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 2027
;2026:
;2027:			if (!fxDir[0] && !fxDir[1] && !fxDir[2])
ADDRLP4 164
CNSTF4 0
ASGNF4
ADDRLP4 152
INDIRF4
ADDRLP4 164
INDIRF4
NEF4 $1484
ADDRLP4 152+4
INDIRF4
ADDRLP4 164
INDIRF4
NEF4 $1484
ADDRLP4 152+8
INDIRF4
ADDRLP4 164
INDIRF4
NEF4 $1484
line 2028
;2028:			{
line 2029
;2029:				fxDir[1] = 1;
ADDRLP4 152+4
CNSTF4 1065353216
ASGNF4
line 2030
;2030:			}
LABELV $1484
line 2032
;2031:
;2032:			trap_FX_PlayEffectID(eID, es->origin, fxDir);
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 2033
;2033:		}
line 2034
;2034:		break;
ADDRGP4 $650
JUMPV
LABELV $1489
line 2037
;2035:
;2036:	case EV_PLAY_EFFECT_ID:
;2037:		DEBUGNAME("EV_PLAY_EFFECT_ID");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1490
ADDRGP4 $1493
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1490
line 2038
;2038:		{
line 2041
;2039:			vec3_t fxDir;
;2040:
;2041:			AngleVectors(es->angles, fxDir, 0, 0);
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 152
ARGP4
ADDRLP4 164
CNSTP4 0
ASGNP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2043
;2042:			
;2043:			if (!fxDir[0] && !fxDir[1] && !fxDir[2])
ADDRLP4 168
CNSTF4 0
ASGNF4
ADDRLP4 152
INDIRF4
ADDRLP4 168
INDIRF4
NEF4 $1494
ADDRLP4 152+4
INDIRF4
ADDRLP4 168
INDIRF4
NEF4 $1494
ADDRLP4 152+8
INDIRF4
ADDRLP4 168
INDIRF4
NEF4 $1494
line 2044
;2044:			{
line 2045
;2045:				fxDir[1] = 1;
ADDRLP4 152+4
CNSTF4 1065353216
ASGNF4
line 2046
;2046:			}
LABELV $1494
line 2048
;2047:
;2048:			if ( cgs.gameEffects[ es->eventParm ] )
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+38412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1499
line 2049
;2049:			{
line 2050
;2050:				trap_FX_PlayEffectID(cgs.gameEffects[es->eventParm], es->origin, fxDir );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+38412
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 2051
;2051:			}
ADDRGP4 $650
JUMPV
LABELV $1499
line 2053
;2052:			else
;2053:			{
line 2054
;2054:				s = CG_ConfigString( CS_EFFECTS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 768
ADDI4
ARGI4
ADDRLP4 172
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 172
INDIRP4
ASGNP4
line 2055
;2055:				if (s && s[0])
ADDRLP4 176
ADDRLP4 40
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $650
ADDRLP4 176
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $650
line 2056
;2056:				{
line 2057
;2057:					trap_FX_PlayEffectID(trap_FX_RegisterEffect(s), es->origin, fxDir );
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 180
ADDRGP4 trap_FX_RegisterEffect
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 trap_FX_PlayEffectID
CALLV
pop
line 2058
;2058:				}
line 2059
;2059:			}
line 2060
;2060:		}
line 2061
;2061:		break;
ADDRGP4 $650
JUMPV
LABELV $1505
line 2064
;2062:
;2063:	case EV_MUTE_SOUND:
;2064:		DEBUGNAME("EV_MUTE_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1506
ADDRGP4 $1509
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1506
line 2065
;2065:		if (cg_entities[es->trickedentindex2].currentState.eFlags & EF_SOUNDTRACKER)
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+8
ADDP4
INDIRI4
CNSTI4 8388608
BANDI4
CNSTI4 0
EQI4 $1510
line 2066
;2066:		{
line 2067
;2067:			cg_entities[es->trickedentindex2].currentState.eFlags -= EF_SOUNDTRACKER;
ADDRLP4 152
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+8
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
CNSTI4 8388608
SUBI4
ASGNI4
line 2068
;2068:		}
LABELV $1510
line 2069
;2069:		trap_S_MuteSound(es->trickedentindex2, es->trickedentindex);
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_MuteSound
CALLV
pop
line 2070
;2070:		trap_S_StopLoopingSound(es->trickedentindex2);
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 2071
;2071:		break;
ADDRGP4 $650
JUMPV
LABELV $1514
line 2074
;2072:
;2073:	case EV_GENERAL_SOUND:
;2074:		DEBUGNAME("EV_GENERAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1515
ADDRGP4 $1518
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1515
line 2075
;2075:		if (es->saberEntityNum == TRACK_CHANNEL_2 || es->saberEntityNum == TRACK_CHANNEL_3 ||
ADDRLP4 156
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 52
EQI4 $1522
ADDRLP4 156
INDIRI4
CNSTI4 53
EQI4 $1522
ADDRLP4 156
INDIRI4
CNSTI4 55
NEI4 $1519
LABELV $1522
line 2077
;2076:			es->saberEntityNum == TRACK_CHANNEL_5)
;2077:		{ //channels 2 and 3 are for speed and rage, 5 for sight
line 2078
;2078:			if ( cgs.gameSounds[ es->eventParm ] )
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+37388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $650
line 2079
;2079:			{
line 2080
;2080:				trap_S_AddRealLoopingSound(es->number, es->pos.trBase, vec3_origin, cgs.gameSounds[ es->eventParm ] );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+37388
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddRealLoopingSound
CALLV
pop
line 2081
;2081:			}
line 2082
;2082:		}
ADDRGP4 $650
JUMPV
LABELV $1519
line 2084
;2083:		else
;2084:		{
line 2085
;2085:			if ( cgs.gameSounds[ es->eventParm ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+37388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1527
line 2086
;2086:				trap_S_StartSound (NULL, es->number, CHAN_VOICE, cgs.gameSounds[ es->eventParm ] );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+37388
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2087
;2087:			} else {
ADDRGP4 $650
JUMPV
LABELV $1527
line 2088
;2088:				s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 160
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 160
INDIRP4
ASGNP4
line 2089
;2089:				trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, s ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 164
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2090
;2090:			}
line 2091
;2091:		}
line 2092
;2092:		break;
ADDRGP4 $650
JUMPV
LABELV $1531
line 2095
;2093:
;2094:	case EV_GLOBAL_SOUND:	// play from the player's head so it never diminishes
;2095:		DEBUGNAME("EV_GLOBAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1532
ADDRGP4 $1535
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1532
line 2096
;2096:		if ( cgs.gameSounds[ es->eventParm ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+37388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1536
line 2097
;2097:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.gameSounds[ es->eventParm ] );
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+37388
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2098
;2098:		} else {
ADDRGP4 $650
JUMPV
LABELV $1536
line 2099
;2099:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 160
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 160
INDIRP4
ASGNP4
line 2100
;2100:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, CG_CustomSound( es->number, s ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 164
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2101
;2101:		}
line 2102
;2102:		break;
ADDRGP4 $650
JUMPV
LABELV $1542
line 2105
;2103:
;2104:	case EV_GLOBAL_TEAM_SOUND:	// play from the player's head so it never diminishes
;2105:		{
line 2106
;2106:			DEBUGNAME("EV_GLOBAL_TEAM_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1543
ADDRGP4 $1546
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1543
line 2107
;2107:			switch( es->eventParm ) {
ADDRLP4 160
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
LTI4 $650
ADDRLP4 160
INDIRI4
CNSTI4 10
GTI4 $650
ADDRLP4 160
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1599
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1599
address $650
address $650
address $1552
address $1560
address $1568
address $1576
address $1584
address $1587
address $1590
address $1593
address $1596
code
line 2110
;2108:				case GTS_RED_CAPTURE: // CTF: red team captured the blue flag, 1FCTF: red team captured the neutral flag
;2109:					//CG_AddBufferedSound( cgs.media.redScoredSound );
;2110:					break;
line 2113
;2111:				case GTS_BLUE_CAPTURE: // CTF: blue team captured the red flag, 1FCTF: blue team captured the neutral flag
;2112:					//CG_AddBufferedSound( cgs.media.blueScoredSound );
;2113:					break;
LABELV $1552
line 2115
;2114:				case GTS_RED_RETURN: // CTF: blue flag returned, 1FCTF: never used
;2115:					if (cgs.gametype == GT_CTY)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $1553
line 2116
;2116:					{
line 2117
;2117:						CG_AddBufferedSound( cgs.media.blueYsalReturnedSound );
ADDRGP4 cgs+70296+816
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2118
;2118:					}
ADDRGP4 $650
JUMPV
LABELV $1553
line 2120
;2119:					else
;2120:					{
line 2121
;2121:						CG_AddBufferedSound( cgs.media.blueFlagReturnedSound );
ADDRGP4 cgs+70296+800
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2122
;2122:					}
line 2123
;2123:					break;
ADDRGP4 $650
JUMPV
LABELV $1560
line 2125
;2124:				case GTS_BLUE_RETURN: // CTF red flag returned, 1FCTF: neutral flag returned
;2125:					if (cgs.gametype == GT_CTY)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $1561
line 2126
;2126:					{
line 2127
;2127:						CG_AddBufferedSound( cgs.media.redYsalReturnedSound );
ADDRGP4 cgs+70296+812
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2128
;2128:					}
ADDRGP4 $650
JUMPV
LABELV $1561
line 2130
;2129:					else
;2130:					{
line 2131
;2131:						CG_AddBufferedSound( cgs.media.redFlagReturnedSound );
ADDRGP4 cgs+70296+796
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2132
;2132:					}
line 2133
;2133:					break;
ADDRGP4 $650
JUMPV
LABELV $1568
line 2137
;2134:
;2135:				case GTS_RED_TAKEN: // CTF: red team took blue flag, 1FCTF: blue team took the neutral flag
;2136:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;2137:					if (cgs.gametype == GT_CTY)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $1569
line 2138
;2138:					{
line 2139
;2139:						CG_AddBufferedSound( cgs.media.redTookYsalSound );
ADDRGP4 cgs+70296+820
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2140
;2140:					}
ADDRGP4 $650
JUMPV
LABELV $1569
line 2142
;2141:					else
;2142:					{
line 2143
;2143:					 	CG_AddBufferedSound( cgs.media.redTookFlagSound );
ADDRGP4 cgs+70296+804
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2144
;2144:					}
line 2145
;2145:					break;
ADDRGP4 $650
JUMPV
LABELV $1576
line 2148
;2146:				case GTS_BLUE_TAKEN: // CTF: blue team took the red flag, 1FCTF red team took the neutral flag
;2147:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;2148:					if (cgs.gametype == GT_CTY)
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $1577
line 2149
;2149:					{
line 2150
;2150:						CG_AddBufferedSound( cgs.media.blueTookYsalSound );
ADDRGP4 cgs+70296+824
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2151
;2151:					}
ADDRGP4 $650
JUMPV
LABELV $1577
line 2153
;2152:					else
;2153:					{
line 2154
;2154:						CG_AddBufferedSound( cgs.media.blueTookFlagSound );
ADDRGP4 cgs+70296+808
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2155
;2155:					}
line 2156
;2156:					break;
ADDRGP4 $650
JUMPV
LABELV $1584
line 2158
;2157:				case GTS_REDTEAM_SCORED:
;2158:					CG_AddBufferedSound(cgs.media.redScoredSound);
ADDRGP4 cgs+70296+776
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2159
;2159:					break;
ADDRGP4 $650
JUMPV
LABELV $1587
line 2161
;2160:				case GTS_BLUETEAM_SCORED:
;2161:					CG_AddBufferedSound(cgs.media.blueScoredSound);
ADDRGP4 cgs+70296+780
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2162
;2162:					break;
ADDRGP4 $650
JUMPV
LABELV $1590
line 2164
;2163:				case GTS_REDTEAM_TOOK_LEAD:
;2164:					CG_AddBufferedSound(cgs.media.redLeadsSound);
ADDRGP4 cgs+70296+784
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2165
;2165:					break;
ADDRGP4 $650
JUMPV
LABELV $1593
line 2167
;2166:				case GTS_BLUETEAM_TOOK_LEAD:
;2167:					CG_AddBufferedSound(cgs.media.blueLeadsSound);
ADDRGP4 cgs+70296+788
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2168
;2168:					break;
ADDRGP4 $650
JUMPV
LABELV $1596
line 2170
;2169:				case GTS_TEAMS_ARE_TIED:
;2170:					CG_AddBufferedSound( cgs.media.teamsTiedSound );
ADDRGP4 cgs+70296+792
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 2171
;2171:					break;
line 2173
;2172:				default:
;2173:					break;
line 2175
;2174:			}
;2175:			break;
ADDRGP4 $650
JUMPV
LABELV $1600
line 2179
;2176:		}
;2177:
;2178:	case EV_ENTITY_SOUND:
;2179:		DEBUGNAME("EV_ENTITY_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1601
ADDRGP4 $1604
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1601
line 2181
;2180:		//somewhat of a hack - weapon is the caller entity's index, trickedentindex is the proper sound channel
;2181:		if ( cgs.gameSounds[ es->eventParm ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+37388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1605
line 2182
;2182:			trap_S_StartSound (NULL, es->weapon, es->trickedentindex, cgs.gameSounds[ es->eventParm ] );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+37388
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2183
;2183:		} else {
ADDRGP4 $650
JUMPV
LABELV $1605
line 2184
;2184:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 160
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 160
INDIRP4
ASGNP4
line 2185
;2185:			trap_S_StartSound (NULL, es->weapon, es->trickedentindex, CG_CustomSound( es->weapon, s ) );
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2186
;2186:		}
line 2187
;2187:		break;
ADDRGP4 $650
JUMPV
LABELV $1609
line 2190
;2188:
;2189:	case EV_PLAY_ROFF:
;2190:		DEBUGNAME("EV_PLAY_ROFF");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1610
ADDRGP4 $1613
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1610
line 2191
;2191:		trap_ROFF_Play(es->weapon, es->eventParm, es->trickedentindex);
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_ROFF_Play
CALLI4
pop
line 2192
;2192:		break;
ADDRGP4 $650
JUMPV
LABELV $1614
line 2195
;2193:
;2194:	case EV_GLASS_SHATTER:
;2195:		DEBUGNAME("EV_GLASS_SHATTER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1615
ADDRGP4 $1618
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1615
line 2196
;2196:		CG_GlassShatter(es->genericenemyindex, es->origin, es->angles, es->trickedentindex, es->pos.trTime);
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_GlassShatter
CALLV
pop
line 2197
;2197:		break;
ADDRGP4 $650
JUMPV
LABELV $1619
line 2200
;2198:
;2199:	case EV_DEBRIS:
;2200:		DEBUGNAME("EV_DEBRIS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1620
ADDRGP4 $1623
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1620
line 2201
;2201:		if (es->weapon)
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1624
line 2202
;2202:		{
line 2203
;2203:			if (cgs.gameSounds[es->weapon])
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+37388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1626
line 2204
;2204:			{
line 2205
;2205:				isnd = cgs.gameSounds[es->weapon];
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+37388
ADDP4
INDIRI4
ASGNI4
line 2206
;2206:			}
ADDRGP4 $1625
JUMPV
LABELV $1626
line 2208
;2207:			else
;2208:			{
line 2209
;2209:				s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 168
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 168
INDIRP4
ASGNP4
line 2210
;2210:				isnd = CG_CustomSound( es->number, s );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 172
INDIRI4
ASGNI4
line 2211
;2211:			}
line 2212
;2212:		}
ADDRGP4 $1625
JUMPV
LABELV $1624
line 2214
;2213:		else
;2214:		{
line 2215
;2215:			isnd = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2216
;2216:		}
LABELV $1625
line 2218
;2217:
;2218:		if (es->trickedentindex > 0)
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1630
line 2219
;2219:		{
line 2220
;2220:			if (cgs.gameModels[es->trickedentindex])
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1632
line 2221
;2221:			{
line 2222
;2222:				CG_CreateDebris(es->number, es->pos.trBase, es->angles, es->origin, isnd, cgs.gameModels[es->trickedentindex]);
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36364
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_CreateDebris
CALLV
pop
line 2223
;2223:			}
ADDRGP4 $650
JUMPV
LABELV $1632
line 2225
;2224:			else
;2225:			{ //default to "rock" type
line 2226
;2226:				CG_CreateDebris(es->number, es->pos.trBase, es->angles, es->origin, isnd, -1);
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 CG_CreateDebris
CALLV
pop
line 2227
;2227:			}
line 2228
;2228:		}
ADDRGP4 $650
JUMPV
LABELV $1630
line 2230
;2229:		else
;2230:		{
line 2231
;2231:			CG_CreateDebris(es->number, es->pos.trBase, es->angles, es->origin, isnd, es->trickedentindex);
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_CreateDebris
CALLV
pop
line 2232
;2232:		}
line 2233
;2233:		break;
ADDRGP4 $650
JUMPV
LABELV $1636
line 2238
;2234:
;2235:	case EV_PAIN:
;2236:		// local player sounds are triggered in CG_CheckLocalSounds,
;2237:		// so ignore events on the player
;2238:		DEBUGNAME("EV_PAIN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1637
ADDRGP4 $1640
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1637
line 2240
;2239:
;2240:		if ( !cg_oldPainSounds.integer || (cent->currentState.number != cg.snap->ps.clientNum) )
ADDRGP4 cg_oldPainSounds+12
INDIRI4
CNSTI4 0
EQI4 $1645
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
EQI4 $650
LABELV $1645
line 2241
;2241:		{
line 2242
;2242:			CG_PainEvent( cent, es->eventParm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PainEvent
CALLV
pop
line 2243
;2243:		}
line 2244
;2244:		break;
ADDRGP4 $650
JUMPV
LABELV $1646
line 2249
;2245:
;2246:	case EV_DEATH1:
;2247:	case EV_DEATH2:
;2248:	case EV_DEATH3:
;2249:		DEBUGNAME("EV_DEATHx");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1647
ADDRGP4 $1650
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1647
line 2250
;2250:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, 
ADDRGP4 $1651
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 78
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 168
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 168
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 172
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2252
;2251:				CG_CustomSound( es->number, va("*death%i.wav", event - EV_DEATH1 + 1) ) );
;2252:		if (es->eventParm && es->number == cg.snap->ps.clientNum)
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $650
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $650
line 2253
;2253:		{
line 2254
;2254:			trap_S_StartLocalSound(cgs.media.dramaticFailure, CHAN_LOCAL);
ADDRGP4 cgs+70296+836
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2255
;2255:			CGCam_SetMusicMult(0.3, 5000);
CNSTF4 1050253722
ARGF4
CNSTI4 5000
ARGI4
ADDRGP4 CGCam_SetMusicMult
CALLV
pop
line 2256
;2256:		}
line 2257
;2257:		break;
ADDRGP4 $650
JUMPV
LABELV $1657
line 2261
;2258:
;2259:
;2260:	case EV_OBITUARY:
;2261:		DEBUGNAME("EV_OBITUARY");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1658
ADDRGP4 $1661
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1658
line 2262
;2262:		CG_Obituary( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Obituary
CALLV
pop
line 2263
;2263:		break;
ADDRGP4 $650
JUMPV
LABELV $1662
line 2269
;2264:
;2265:	//
;2266:	// powerup events
;2267:	//
;2268:	case EV_POWERUP_QUAD:
;2269:		DEBUGNAME("EV_POWERUP_QUAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1663
ADDRGP4 $1666
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1663
line 2270
;2270:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $650
line 2271
;2271:			cg.powerupActive = PW_QUAD;
ADDRGP4 cg+13104
CNSTI4 1
ASGNI4
line 2272
;2272:			cg.powerupTime = cg.time;
ADDRGP4 cg+13108
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 2273
;2273:		}
line 2275
;2274:		//trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.quadSound );
;2275:		break;
ADDRGP4 $650
JUMPV
LABELV $1673
line 2277
;2276:	case EV_POWERUP_BATTLESUIT:
;2277:		DEBUGNAME("EV_POWERUP_BATTLESUIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1674
ADDRGP4 $1677
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1674
line 2278
;2278:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $650
line 2279
;2279:			cg.powerupActive = PW_BATTLESUIT;
ADDRGP4 cg+13104
CNSTI4 2
ASGNI4
line 2280
;2280:			cg.powerupTime = cg.time;
ADDRGP4 cg+13108
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 2281
;2281:		}
line 2283
;2282:		//trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.protectSound );
;2283:		break;
ADDRGP4 $650
JUMPV
LABELV $1684
line 2286
;2284:
;2285:	case EV_FORCE_DRAINED:
;2286:		DEBUGNAME("EV_FORCE_DRAINED");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1685
ADDRGP4 $1688
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1685
line 2287
;2287:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 2289
;2288:		//FX_ForceDrained(position, dir);
;2289:		trap_S_StartSound (NULL, es->owner, CHAN_AUTO, cgs.media.drainSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+70296+828
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2290
;2290:		cg_entities[es->owner].teamPowerEffectTime = cg.time + 1000;
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1912
ADDP4
ADDRGP4 cg+64
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2291
;2291:		cg_entities[es->owner].teamPowerType = 2;
CNSTI4 1920
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+1916
ADDP4
CNSTI4 2
ASGNI4
line 2292
;2292:		break;
ADDRGP4 $650
JUMPV
LABELV $1694
line 2295
;2293:
;2294:	case EV_GIB_PLAYER:
;2295:		DEBUGNAME("EV_GIB_PLAYER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $650
ADDRGP4 $1698
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 2298
;2296:		//trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
;2297:		//CG_GibPlayer( cent->lerpOrigin );
;2298:		break;
ADDRGP4 $650
JUMPV
LABELV $1699
line 2301
;2299:
;2300:	case EV_STARTLOOPINGSOUND:
;2301:		DEBUGNAME("EV_STARTLOOPINGSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1700
ADDRGP4 $1703
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1700
line 2302
;2302:		if ( cgs.gameSounds[ es->eventParm ] )
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+37388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1704
line 2303
;2303:		{
line 2304
;2304:			isnd = cgs.gameSounds[es->eventParm];
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+37388
ADDP4
INDIRI4
ASGNI4
line 2305
;2305:		}
ADDRGP4 $1705
JUMPV
LABELV $1704
line 2307
;2306:		else
;2307:		{
line 2308
;2308:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 180
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 180
INDIRP4
ASGNP4
line 2309
;2309:			isnd = CG_CustomSound(es->number, s);
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 184
INDIRI4
ASGNI4
line 2310
;2310:		}
LABELV $1705
line 2312
;2311:
;2312:		trap_S_AddRealLoopingSound( es->number, es->pos.trBase, vec3_origin, isnd );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_S_AddRealLoopingSound
CALLV
pop
line 2313
;2313:		es->loopSound = isnd;
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 2314
;2314:		break;
ADDRGP4 $650
JUMPV
LABELV $1708
line 2317
;2315:
;2316:	case EV_STOPLOOPINGSOUND:
;2317:		DEBUGNAME("EV_STOPLOOPINGSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1709
ADDRGP4 $1712
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1709
line 2318
;2318:		trap_S_StopLoopingSound( es->number );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 2319
;2319:		es->loopSound = 0;
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 2320
;2320:		break;
ADDRGP4 $650
JUMPV
LABELV $1713
line 2323
;2321:
;2322:	case EV_WEAPON_CHARGE:
;2323:		DEBUGNAME("EV_WEAPON_CHARGE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1714
ADDRGP4 $1717
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1714
line 2324
;2324:		assert(es->eventParm > WP_NONE && es->eventParm < WP_NUM_WEAPONS);
line 2325
;2325:		if (cg_weapons[es->eventParm].chargeSound)
CNSTI4 208
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+88
ADDP4
INDIRI4
CNSTI4 0
EQI4 $650
line 2326
;2326:		{
line 2327
;2327:			trap_S_StartSound(NULL, es->number, CHAN_WEAPON, cg_weapons[es->eventParm].chargeSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 208
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+88
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2328
;2328:		}
line 2329
;2329:		break;
ADDRGP4 $650
JUMPV
LABELV $1722
line 2332
;2330:
;2331:	case EV_WEAPON_CHARGE_ALT:
;2332:		DEBUGNAME("EV_WEAPON_CHARGE_ALT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1723
ADDRGP4 $1726
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1723
line 2333
;2333:		assert(es->eventParm > WP_NONE && es->eventParm < WP_NUM_WEAPONS);
line 2334
;2334:		if (cg_weapons[es->eventParm].altChargeSound)
CNSTI4 208
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+152
ADDP4
INDIRI4
CNSTI4 0
EQI4 $650
line 2335
;2335:		{
line 2336
;2336:			trap_S_StartSound(NULL, es->number, CHAN_WEAPON, cg_weapons[es->eventParm].altChargeSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 208
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+152
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 2337
;2337:		}
line 2338
;2338:		break;
ADDRGP4 $650
JUMPV
LABELV $1731
line 2341
;2339:
;2340:	case EV_SHIELD_HIT:
;2341:		DEBUGNAME("EV_SHIELD_HIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1732
ADDRGP4 $1735
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1732
line 2342
;2342:		ByteToDir(es->eventParm, dir);
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 2343
;2343:		CG_PlayerShieldHit(es->otherEntityNum, dir, es->time2);
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PlayerShieldHit
CALLV
pop
line 2344
;2344:		break;
ADDRGP4 $650
JUMPV
LABELV $1736
line 2347
;2345:
;2346:	case EV_DEBUG_LINE:
;2347:		DEBUGNAME("EV_DEBUG_LINE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1737
ADDRGP4 $1740
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1737
line 2348
;2348:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 2349
;2349:		break;
ADDRGP4 $650
JUMPV
LABELV $1741
line 2352
;2350:
;2351:	case EV_TESTLINE:
;2352:		DEBUGNAME("EV_TESTLINE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1742
ADDRGP4 $1745
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1742
line 2353
;2353:		CG_TestLine(es->origin, es->origin2, es->time2, es->weapon, 1);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CVIU4 4
ARGU4
CNSTI4 1
ARGI4
ADDRGP4 CG_TestLine
CALLV
pop
line 2354
;2354:		break;
ADDRGP4 $650
JUMPV
LABELV $1746
line 2357
;2355:
;2356:	case EV_BODY_QUEUE_COPY:
;2357:		DEBUGNAME("EV_BODY_QUEUE_COPY");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1747
ADDRGP4 $1750
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1747
line 2358
;2358:		CG_BodyQueueCopy(cent, es->eventParm, es->weapon);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_BodyQueueCopy
CALLV
pop
line 2359
;2359:		break;
ADDRGP4 $650
JUMPV
LABELV $649
line 2362
;2360:
;2361:	default:
;2362:		DEBUGNAME("UNKNOWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1751
ADDRGP4 $1754
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1751
line 2363
;2363:		CG_Error( "Unknown event: %i", event );
ADDRGP4 $1755
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 2364
;2364:		break;
LABELV $650
line 2367
;2365:	}
;2366:
;2367:}
LABELV $634
endproc CG_EntityEvent 1252 36
export CG_CheckEvents
proc CG_CheckEvents 8 12
line 2376
;2368:
;2369:
;2370:/*
;2371:==============
;2372:CG_CheckEvents
;2373:
;2374:==============
;2375:*/
;2376:void CG_CheckEvents( centity_t *cent ) {
line 2378
;2377:	// check for event-only entities
;2378:	if ( cent->currentState.eType > ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 16
LEI4 $1759
line 2379
;2379:		if ( cent->previousEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1761
line 2380
;2380:			return;	// already fired
ADDRGP4 $1758
JUMPV
LABELV $1761
line 2383
;2381:		}
;2382:		// if this is a player event set the entity number of the client entity number
;2383:		if ( cent->currentState.eFlags & EF_PLAYER_EVENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1763
line 2384
;2384:			cent->currentState.number = cent->currentState.otherEntityNum;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 2385
;2385:		}
LABELV $1763
line 2387
;2386:
;2387:		cent->previousEvent = 1;
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 1
ASGNI4
line 2389
;2388:
;2389:		cent->currentState.event = cent->currentState.eType - ET_EVENTS;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 2390
;2390:	} else {
ADDRGP4 $1760
JUMPV
LABELV $1759
line 2392
;2391:		// check for events riding with another entity
;2392:		if ( cent->currentState.event == cent->previousEvent ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
NEI4 $1765
line 2393
;2393:			return;
ADDRGP4 $1758
JUMPV
LABELV $1765
line 2395
;2394:		}
;2395:		cent->previousEvent = cent->currentState.event;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 604
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ASGNI4
line 2396
;2396:		if ( ( cent->currentState.event & ~EV_EVENT_BITS ) == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 0
NEI4 $1767
line 2397
;2397:			return;
ADDRGP4 $1758
JUMPV
LABELV $1767
line 2399
;2398:		}
;2399:	}
LABELV $1760
line 2402
;2400:
;2401:	// calculate the position at exactly the frame time
;2402:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, cent->lerpOrigin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2403
;2403:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 2405
;2404:
;2405:	CG_EntityEvent( cent, cent->lerpOrigin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 928
ADDP4
ARGP4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 2406
;2406:}
LABELV $1758
endproc CG_CheckEvents 8 12
import CG_ThereIsAMaster
import showPowersName
import g_saberFlashPos
import g_saberFlashTime
import trap_SP_Register
import trap_SP_RegisterServer
import trap_PC_RemoveAllGlobalDefines
import trap_PC_LoadGlobalDefines
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Controls_SetConfig
import Controls_GetConfig
import UI_OutOfMemory
import UI_InitMemory
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
import FX_RocketHitPlayer
import FX_RocketHitWall
import FX_RocketAltProjectileThink
import FX_RocketProjectileThink
import FX_FlechetteAltProjectileThink
import FX_FlechetteWeaponHitPlayer
import FX_FlechetteWeaponHitWall
import FX_FlechetteProjectileThink
import FX_DEMP2_AltDetonate
import FX_DEMP2_HitPlayer
import FX_DEMP2_HitWall
import FX_DEMP2_ProjectileThink
import FX_RepeaterAltHitPlayer
import FX_RepeaterHitPlayer
import FX_RepeaterAltHitWall
import FX_RepeaterHitWall
import FX_RepeaterAltProjectileThink
import FX_RepeaterProjectileThink
import FX_BowcasterHitPlayer
import FX_BowcasterHitWall
import FX_BowcasterAltProjectileThink
import FX_BowcasterProjectileThink
import FX_DisruptorHitPlayer
import FX_DisruptorHitWall
import FX_DisruptorAltHit
import FX_DisruptorAltMiss
import FX_DisruptorAltShot
import FX_DisruptorMainShot
import FX_BryarAltProjectileThink
import FX_BryarProjectileThink
import g2WeaponInstances
import CG_CheckPlayerG2Weapons
import CG_CopyG2WeaponInstance
import CG_ShutDownG2Weapons
import CG_InitG2Weapons
import CG_CreateBBRefEnts
import CG_SetGhoul2Info
import CG_Init_CGents
import CG_Init_CG
import trap_G2API_SetNewOrigin
import trap_G2API_SetSurfaceOnOff
import trap_G2API_SetRootSurface
import trap_G2API_SetBoneAnim
import trap_G2API_GetGLAName
import trap_G2API_SetBoneAngles
import trap_G2API_CleanGhoul2Models
import trap_G2API_SetBoltInfo
import trap_G2API_AddBolt
import trap_G2API_RemoveGhoul2Model
import trap_G2API_HasGhoul2ModelOnIndex
import trap_G2API_DuplicateGhoul2Instance
import trap_G2API_CopySpecificGhoul2Model
import trap_G2API_CopyGhoul2Instance
import trap_G2API_GiveMeVectorFromMatrix
import trap_G2API_InitGhoul2Model
import trap_G2API_GetBoltMatrix_NoRecNoRot
import trap_G2API_GetBoltMatrix_NoReconstruct
import trap_G2API_GetBoltMatrix
import trap_G2_HaveWeGhoul2Models
import trap_G2_SetGhoul2ModelIndexes
import trap_G2_ListModelBones
import trap_G2_ListModelSurfaces
import trap_G2API_CollisionDetect
import FX_ForceDrained
import FX_BlasterWeaponHitPlayer
import FX_BlasterWeaponHitWall
import FX_BlasterAltFireThink
import FX_BlasterProjectileThink
import FX_BryarAltHitPlayer
import FX_BryarHitPlayer
import FX_BryarAltHitWall
import FX_BryarHitWall
import CG_Spark
import FX_TurretHitPlayer
import FX_TurretHitWall
import FX_TurretProjectileThink
import CG_NewParticleArea
import initparticles
import CG_GetStripEdString
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_ROFF_Purge_Ent
import trap_ROFF_Play
import trap_ROFF_Cache
import trap_ROFF_UpdateEntities
import trap_ROFF_Clean
import trap_CG_RegisterSharedMemory
import trap_SP_GetStringTextString
import trap_SP_Print
import trap_FX_AddSprite
import trap_FX_AddPrimitive
import trap_FX_AddBezier
import trap_FX_AddPoly
import trap_FX_AdjustTime
import trap_FX_FreeSystem
import trap_FX_InitSystem
import trap_FX_AddScheduledEffects
import trap_FX_PlayBoltedEffectID
import trap_FX_PlayEntityEffectID
import trap_FX_PlayEffectID
import trap_FX_PlaySimpleEffectID
import trap_FX_PlayEntityEffect
import trap_FX_PlayEffect
import trap_FX_PlaySimpleEffect
import trap_FX_RegisterEffect
import trap_R_inPVS
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import BG_CycleForce
import BG_ProperForceIndex
import BG_CycleInven
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_OpenUIMenu
import trap_SetClientTurnExtent
import trap_SetClientForceAngle
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_FX_AddLine
import trap_R_GetBModelVerts
import trap_R_SetLightStyle
import trap_R_GetLightStyle
import trap_R_RemapShader
import trap_R_DrawRotatePic2
import trap_R_DrawRotatePic
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_AnyLanguage_ReadCharFromString
import trap_Language_UsesSpaces
import trap_Language_IsAsian
import trap_R_Font_DrawString
import trap_R_Font_HeightPixels
import trap_R_Font_StrLenChars
import trap_R_Font_StrLenPixels
import trap_R_RegisterFont
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_S_MuteSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_SagaObjectiveCompleted
import CG_SagaRoundOver
import CG_InitSagaMode
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_IsMindTricked
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_ProcessSnapshots
import CG_InitGlass
import CG_TestLine
import CG_SurfaceExplosion
import CG_MakeExplosion
import CG_Bleed
import CG_ScorePlum
import CG_CreateDebris
import CG_GlassShatter
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawIconBackground
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_GetClientWeaponMuzzleBoltPoint
import TurretClientRun
import ScaleModelAxis
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_ManualEntityRender
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_PlayerShieldHit
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_DeferMenuScript
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawScaledProportionalString
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawBigString
import CG_DrawStringExt
import CG_DrawNumField
import CG_DrawString
import CG_DrawRotatePic2
import CG_DrawRotatePic
import CG_DrawPic
import CG_FillRect
import CG_TestModelAnimate_f
import CG_TestModelSetAnglespost_f
import CG_TestModelSetAnglespre_f
import CG_ListModelBones_f
import CG_ListModelSurfaces_f
import CG_TestModelSurfaceOnOff_f
import CG_TestG2Model_f
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_PrevForcePower_f
import CG_NextForcePower_f
import CG_PrevInventory_f
import CG_NextInventory_f
import CG_BuildSpectatorString
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import cg_debugBB
import ui_myteam
import cg_recordSPDemoName
import cg_recordSPDemo
import cg_singlePlayerActive
import cg_enableBreath
import cg_enableDust
import cg_singlePlayer
import cg_currentSelectedPlayerName
import cg_currentSelectedPlayer
import cg_blueTeamName
import cg_redTeamName
import cg_trueLightning
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_msec
import pmove_fixed
import cg_smoothClients
import cg_hudFiles
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawEnemyInfo
import cg_lagometer
import cg_stereoSeparation
import cg_thirdPersonHorzOffset
import cg_thirdPersonAlpha
import cg_thirdPersonTargetDamp
import cg_thirdPersonCameraDamp
import cg_thirdPersonVertOffset
import cg_thirdPersonPitchOffset
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_thirdPerson
import cg_dismember
import cg_animBlend
import cg_auraShell
import cg_speedTrail
import cg_duelHeadAngles
import cg_saberTrail
import cg_saberContact
import cg_saberDynamicMarkTime
import cg_saberDynamicMarks
import cg_fpls
import cg_saberModelTraceEffect
import cg_oldPainSounds
import cg_swingAngles
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_dynamicCrosshair
import cg_drawScores
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_shadows
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
import CGCam_SetMusicMult
import CGCam_Shake
import cgScreenEffects
import ammoTicPos
import forceTicPos
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
LABELV $1755
char 1 85
char 1 110
char 1 107
char 1 110
char 1 111
char 1 119
char 1 110
char 1 32
char 1 101
char 1 118
char 1 101
char 1 110
char 1 116
char 1 58
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $1754
char 1 85
char 1 78
char 1 75
char 1 78
char 1 79
char 1 87
char 1 78
char 1 10
char 1 0
align 1
LABELV $1750
char 1 69
char 1 86
char 1 95
char 1 66
char 1 79
char 1 68
char 1 89
char 1 95
char 1 81
char 1 85
char 1 69
char 1 85
char 1 69
char 1 95
char 1 67
char 1 79
char 1 80
char 1 89
char 1 10
char 1 0
align 1
LABELV $1745
char 1 69
char 1 86
char 1 95
char 1 84
char 1 69
char 1 83
char 1 84
char 1 76
char 1 73
char 1 78
char 1 69
char 1 10
char 1 0
align 1
LABELV $1740
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 66
char 1 85
char 1 71
char 1 95
char 1 76
char 1 73
char 1 78
char 1 69
char 1 10
char 1 0
align 1
LABELV $1735
char 1 69
char 1 86
char 1 95
char 1 83
char 1 72
char 1 73
char 1 69
char 1 76
char 1 68
char 1 95
char 1 72
char 1 73
char 1 84
char 1 10
char 1 0
align 1
LABELV $1726
char 1 69
char 1 86
char 1 95
char 1 87
char 1 69
char 1 65
char 1 80
char 1 79
char 1 78
char 1 95
char 1 67
char 1 72
char 1 65
char 1 82
char 1 71
char 1 69
char 1 95
char 1 65
char 1 76
char 1 84
char 1 10
char 1 0
align 1
LABELV $1717
char 1 69
char 1 86
char 1 95
char 1 87
char 1 69
char 1 65
char 1 80
char 1 79
char 1 78
char 1 95
char 1 67
char 1 72
char 1 65
char 1 82
char 1 71
char 1 69
char 1 10
char 1 0
align 1
LABELV $1712
char 1 69
char 1 86
char 1 95
char 1 83
char 1 84
char 1 79
char 1 80
char 1 76
char 1 79
char 1 79
char 1 80
char 1 73
char 1 78
char 1 71
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 10
char 1 0
align 1
LABELV $1703
char 1 69
char 1 86
char 1 95
char 1 83
char 1 84
char 1 65
char 1 82
char 1 84
char 1 76
char 1 79
char 1 79
char 1 80
char 1 73
char 1 78
char 1 71
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 10
char 1 0
align 1
LABELV $1698
char 1 69
char 1 86
char 1 95
char 1 71
char 1 73
char 1 66
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 69
char 1 82
char 1 10
char 1 0
align 1
LABELV $1688
char 1 69
char 1 86
char 1 95
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 95
char 1 68
char 1 82
char 1 65
char 1 73
char 1 78
char 1 69
char 1 68
char 1 10
char 1 0
align 1
LABELV $1677
char 1 69
char 1 86
char 1 95
char 1 80
char 1 79
char 1 87
char 1 69
char 1 82
char 1 85
char 1 80
char 1 95
char 1 66
char 1 65
char 1 84
char 1 84
char 1 76
char 1 69
char 1 83
char 1 85
char 1 73
char 1 84
char 1 10
char 1 0
align 1
LABELV $1666
char 1 69
char 1 86
char 1 95
char 1 80
char 1 79
char 1 87
char 1 69
char 1 82
char 1 85
char 1 80
char 1 95
char 1 81
char 1 85
char 1 65
char 1 68
char 1 10
char 1 0
align 1
LABELV $1661
char 1 69
char 1 86
char 1 95
char 1 79
char 1 66
char 1 73
char 1 84
char 1 85
char 1 65
char 1 82
char 1 89
char 1 10
char 1 0
align 1
LABELV $1651
char 1 42
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 37
char 1 105
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1650
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 65
char 1 84
char 1 72
char 1 120
char 1 10
char 1 0
align 1
LABELV $1640
char 1 69
char 1 86
char 1 95
char 1 80
char 1 65
char 1 73
char 1 78
char 1 10
char 1 0
align 1
LABELV $1623
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 66
char 1 82
char 1 73
char 1 83
char 1 10
char 1 0
align 1
LABELV $1618
char 1 69
char 1 86
char 1 95
char 1 71
char 1 76
char 1 65
char 1 83
char 1 83
char 1 95
char 1 83
char 1 72
char 1 65
char 1 84
char 1 84
char 1 69
char 1 82
char 1 10
char 1 0
align 1
LABELV $1613
char 1 69
char 1 86
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 95
char 1 82
char 1 79
char 1 70
char 1 70
char 1 10
char 1 0
align 1
LABELV $1604
char 1 69
char 1 86
char 1 95
char 1 69
char 1 78
char 1 84
char 1 73
char 1 84
char 1 89
char 1 95
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 10
char 1 0
align 1
LABELV $1546
char 1 69
char 1 86
char 1 95
char 1 71
char 1 76
char 1 79
char 1 66
char 1 65
char 1 76
char 1 95
char 1 84
char 1 69
char 1 65
char 1 77
char 1 95
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 10
char 1 0
align 1
LABELV $1535
char 1 69
char 1 86
char 1 95
char 1 71
char 1 76
char 1 79
char 1 66
char 1 65
char 1 76
char 1 95
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 10
char 1 0
align 1
LABELV $1518
char 1 69
char 1 86
char 1 95
char 1 71
char 1 69
char 1 78
char 1 69
char 1 82
char 1 65
char 1 76
char 1 95
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 10
char 1 0
align 1
LABELV $1509
char 1 69
char 1 86
char 1 95
char 1 77
char 1 85
char 1 84
char 1 69
char 1 95
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 10
char 1 0
align 1
LABELV $1493
char 1 69
char 1 86
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 95
char 1 69
char 1 70
char 1 70
char 1 69
char 1 67
char 1 84
char 1 95
char 1 73
char 1 68
char 1 10
char 1 0
align 1
LABELV $1479
char 1 100
char 1 101
char 1 109
char 1 112
char 1 50
char 1 47
char 1 97
char 1 108
char 1 116
char 1 68
char 1 101
char 1 116
char 1 111
char 1 110
char 1 97
char 1 116
char 1 101
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1477
char 1 115
char 1 116
char 1 117
char 1 110
char 1 66
char 1 97
char 1 116
char 1 111
char 1 110
char 1 47
char 1 102
char 1 108
char 1 101
char 1 115
char 1 104
char 1 95
char 1 105
char 1 109
char 1 112
char 1 97
char 1 99
char 1 116
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1475
char 1 102
char 1 108
char 1 101
char 1 99
char 1 104
char 1 101
char 1 116
char 1 116
char 1 101
char 1 47
char 1 97
char 1 108
char 1 116
char 1 95
char 1 98
char 1 108
char 1 111
char 1 119
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1473
char 1 100
char 1 101
char 1 116
char 1 112
char 1 97
char 1 99
char 1 107
char 1 47
char 1 101
char 1 120
char 1 112
char 1 108
char 1 111
char 1 115
char 1 105
char 1 111
char 1 110
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1471
char 1 116
char 1 114
char 1 105
char 1 112
char 1 77
char 1 105
char 1 110
char 1 101
char 1 47
char 1 101
char 1 120
char 1 112
char 1 108
char 1 111
char 1 115
char 1 105
char 1 111
char 1 110
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1469
char 1 115
char 1 112
char 1 97
char 1 114
char 1 107
char 1 95
char 1 101
char 1 120
char 1 112
char 1 108
char 1 111
char 1 115
char 1 105
char 1 111
char 1 110
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1467
char 1 116
char 1 117
char 1 114
char 1 114
char 1 101
char 1 116
char 1 47
char 1 101
char 1 120
char 1 112
char 1 108
char 1 111
char 1 100
char 1 101
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1465
char 1 101
char 1 109
char 1 112
char 1 108
char 1 97
char 1 99
char 1 101
char 1 100
char 1 47
char 1 101
char 1 120
char 1 112
char 1 108
char 1 111
char 1 100
char 1 101
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1463
char 1 101
char 1 109
char 1 112
char 1 108
char 1 97
char 1 99
char 1 101
char 1 100
char 1 47
char 1 100
char 1 101
char 1 97
char 1 100
char 1 95
char 1 115
char 1 109
char 1 111
char 1 107
char 1 101
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1458
char 1 69
char 1 86
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 95
char 1 69
char 1 70
char 1 70
char 1 69
char 1 67
char 1 84
char 1 10
char 1 0
align 1
LABELV $1451
char 1 69
char 1 86
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 73
char 1 76
char 1 69
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 95
char 1 77
char 1 69
char 1 84
char 1 65
char 1 76
char 1 10
char 1 0
align 1
LABELV $1444
char 1 69
char 1 86
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 73
char 1 76
char 1 69
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 10
char 1 0
align 1
LABELV $1437
char 1 69
char 1 86
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 73
char 1 76
char 1 69
char 1 95
char 1 72
char 1 73
char 1 84
char 1 10
char 1 0
align 1
LABELV $1432
char 1 69
char 1 86
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 73
char 1 76
char 1 69
char 1 95
char 1 83
char 1 84
char 1 73
char 1 67
char 1 75
char 1 10
char 1 0
align 1
LABELV $1427
char 1 117
char 1 105
char 1 95
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 80
char 1 111
char 1 119
char 1 101
char 1 114
char 1 68
char 1 105
char 1 115
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $1426
char 1 69
char 1 86
char 1 95
char 1 83
char 1 69
char 1 84
char 1 95
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 95
char 1 68
char 1 73
char 1 83
char 1 65
char 1 66
char 1 76
char 1 69
char 1 10
char 1 0
align 1
LABELV $1421
char 1 117
char 1 105
char 1 95
char 1 102
char 1 114
char 1 101
char 1 101
char 1 83
char 1 97
char 1 98
char 1 101
char 1 114
char 1 0
align 1
LABELV $1420
char 1 69
char 1 86
char 1 95
char 1 83
char 1 69
char 1 84
char 1 95
char 1 70
char 1 82
char 1 69
char 1 69
char 1 95
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 10
char 1 0
align 1
LABELV $1413
char 1 117
char 1 105
char 1 95
char 1 109
char 1 121
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $1412
char 1 37
char 1 105
char 1 0
align 1
LABELV $1411
char 1 117
char 1 105
char 1 95
char 1 114
char 1 97
char 1 110
char 1 107
char 1 67
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 0
align 1
LABELV $1407
char 1 69
char 1 86
char 1 95
char 1 71
char 1 73
char 1 86
char 1 69
char 1 95
char 1 78
char 1 69
char 1 87
char 1 95
char 1 82
char 1 65
char 1 78
char 1 75
char 1 10
char 1 0
align 1
LABELV $1396
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 83
char 1 84
char 1 82
char 1 79
char 1 89
char 1 95
char 1 87
char 1 69
char 1 65
char 1 80
char 1 79
char 1 78
char 1 95
char 1 77
char 1 79
char 1 68
char 1 69
char 1 76
char 1 10
char 1 0
align 1
LABELV $1384
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 83
char 1 84
char 1 82
char 1 79
char 1 89
char 1 95
char 1 71
char 1 72
char 1 79
char 1 85
char 1 76
char 1 50
char 1 95
char 1 73
char 1 78
char 1 83
char 1 84
char 1 65
char 1 78
char 1 67
char 1 69
char 1 10
char 1 0
align 1
LABELV $1379
char 1 69
char 1 86
char 1 95
char 1 83
char 1 65
char 1 71
char 1 65
char 1 95
char 1 79
char 1 66
char 1 74
char 1 69
char 1 67
char 1 84
char 1 73
char 1 86
char 1 69
char 1 67
char 1 79
char 1 77
char 1 80
char 1 76
char 1 69
char 1 84
char 1 69
char 1 10
char 1 0
align 1
LABELV $1374
char 1 69
char 1 86
char 1 95
char 1 83
char 1 65
char 1 71
char 1 65
char 1 95
char 1 82
char 1 79
char 1 85
char 1 78
char 1 68
char 1 79
char 1 86
char 1 69
char 1 82
char 1 10
char 1 0
align 1
LABELV $1369
char 1 69
char 1 86
char 1 95
char 1 67
char 1 84
char 1 70
char 1 77
char 1 69
char 1 83
char 1 83
char 1 65
char 1 71
char 1 69
char 1 10
char 1 0
align 1
LABELV $1364
char 1 69
char 1 86
char 1 95
char 1 83
char 1 67
char 1 79
char 1 82
char 1 69
char 1 80
char 1 76
char 1 85
char 1 77
char 1 10
char 1 0
align 1
LABELV $1359
char 1 69
char 1 86
char 1 95
char 1 71
char 1 82
char 1 69
char 1 78
char 1 65
char 1 68
char 1 69
char 1 95
char 1 66
char 1 79
char 1 85
char 1 78
char 1 67
char 1 69
char 1 10
char 1 0
align 1
LABELV $1351
char 1 69
char 1 86
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 95
char 1 82
char 1 69
char 1 83
char 1 80
char 1 65
char 1 87
char 1 78
char 1 10
char 1 0
align 1
LABELV $1344
char 1 69
char 1 86
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 95
char 1 80
char 1 79
char 1 80
char 1 10
char 1 0
align 1
LABELV $1327
char 1 69
char 1 86
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 69
char 1 82
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
char 1 79
char 1 85
char 1 84
char 1 10
char 1 0
align 1
LABELV $1322
char 1 109
char 1 112
char 1 47
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1309
char 1 69
char 1 86
char 1 95
char 1 80
char 1 76
char 1 65
char 1 89
char 1 69
char 1 82
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
char 1 73
char 1 78
char 1 10
char 1 0
align 1
LABELV $1300
char 1 83
char 1 69
char 1 69
char 1 75
char 1 69
char 1 82
char 1 95
char 1 65
char 1 76
char 1 82
char 1 69
char 1 65
char 1 68
char 1 89
char 1 68
char 1 69
char 1 80
char 1 76
char 1 79
char 1 89
char 1 69
char 1 68
char 1 0
align 1
LABELV $1298
char 1 83
char 1 72
char 1 73
char 1 69
char 1 76
char 1 68
char 1 95
char 1 78
char 1 79
char 1 82
char 1 79
char 1 79
char 1 77
char 1 0
align 1
LABELV $1296
char 1 83
char 1 69
char 1 78
char 1 84
char 1 82
char 1 89
char 1 95
char 1 65
char 1 76
char 1 82
char 1 69
char 1 65
char 1 68
char 1 89
char 1 80
char 1 76
char 1 65
char 1 67
char 1 69
char 1 68
char 1 0
align 1
LABELV $1294
char 1 83
char 1 69
char 1 78
char 1 84
char 1 82
char 1 89
char 1 95
char 1 78
char 1 79
char 1 82
char 1 79
char 1 79
char 1 77
char 1 0
align 1
LABELV $1286
char 1 69
char 1 86
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 85
char 1 83
char 1 69
char 1 70
char 1 65
char 1 73
char 1 76
char 1 10
char 1 0
align 1
LABELV $1281
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 49
char 1 52
char 1 10
char 1 0
align 1
LABELV $1276
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 49
char 1 51
char 1 10
char 1 0
align 1
LABELV $1271
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 49
char 1 50
char 1 10
char 1 0
align 1
LABELV $1266
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 49
char 1 49
char 1 10
char 1 0
align 1
LABELV $1261
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 49
char 1 48
char 1 10
char 1 0
align 1
LABELV $1256
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 57
char 1 10
char 1 0
align 1
LABELV $1251
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 56
char 1 10
char 1 0
align 1
LABELV $1246
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 55
char 1 10
char 1 0
align 1
LABELV $1241
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 54
char 1 10
char 1 0
align 1
LABELV $1236
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 53
char 1 10
char 1 0
align 1
LABELV $1231
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 52
char 1 10
char 1 0
align 1
LABELV $1226
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 51
char 1 10
char 1 0
align 1
LABELV $1221
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 50
char 1 10
char 1 0
align 1
LABELV $1216
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 49
char 1 10
char 1 0
align 1
LABELV $1211
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 48
char 1 10
char 1 0
align 1
LABELV $1201
char 1 69
char 1 86
char 1 95
char 1 83
char 1 67
char 1 82
char 1 69
char 1 69
char 1 78
char 1 83
char 1 72
char 1 65
char 1 75
char 1 69
char 1 10
char 1 0
align 1
LABELV $1179
char 1 69
char 1 86
char 1 95
char 1 84
char 1 69
char 1 65
char 1 77
char 1 95
char 1 80
char 1 79
char 1 87
char 1 69
char 1 82
char 1 10
char 1 0
align 1
LABELV $1170
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 103
char 1 114
char 1 105
char 1 112
char 1 46
char 1 109
char 1 112
char 1 51
char 1 0
align 1
LABELV $1168
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 106
char 1 117
char 1 109
char 1 112
char 1 46
char 1 109
char 1 112
char 1 51
char 1 0
align 1
LABELV $1166
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 97
char 1 98
char 1 115
char 1 111
char 1 114
char 1 98
char 1 46
char 1 109
char 1 112
char 1 51
char 1 0
align 1
LABELV $1159
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 97
char 1 98
char 1 115
char 1 111
char 1 114
char 1 98
char 1 104
char 1 105
char 1 116
char 1 46
char 1 109
char 1 112
char 1 51
char 1 0
align 1
LABELV $1157
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 112
char 1 114
char 1 111
char 1 116
char 1 101
char 1 99
char 1 116
char 1 46
char 1 109
char 1 112
char 1 51
char 1 0
align 1
LABELV $1155
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 47
char 1 112
char 1 114
char 1 111
char 1 116
char 1 101
char 1 99
char 1 116
char 1 104
char 1 105
char 1 116
char 1 46
char 1 109
char 1 112
char 1 51
char 1 0
align 1
LABELV $1150
char 1 69
char 1 86
char 1 95
char 1 80
char 1 82
char 1 69
char 1 68
char 1 69
char 1 70
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 10
char 1 0
align 1
LABELV $1145
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 100
char 1 105
char 1 115
char 1 114
char 1 117
char 1 112
char 1 116
char 1 111
char 1 114
char 1 47
char 1 122
char 1 111
char 1 111
char 1 109
char 1 101
char 1 110
char 1 100
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1144
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 100
char 1 105
char 1 115
char 1 114
char 1 117
char 1 112
char 1 116
char 1 111
char 1 114
char 1 47
char 1 122
char 1 111
char 1 111
char 1 109
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1137
char 1 69
char 1 86
char 1 95
char 1 68
char 1 73
char 1 83
char 1 82
char 1 85
char 1 80
char 1 84
char 1 79
char 1 82
char 1 95
char 1 90
char 1 79
char 1 79
char 1 77
char 1 83
char 1 79
char 1 85
char 1 78
char 1 68
char 1 10
char 1 0
align 1
LABELV $1130
char 1 69
char 1 86
char 1 95
char 1 68
char 1 73
char 1 83
char 1 82
char 1 85
char 1 80
char 1 84
char 1 79
char 1 82
char 1 95
char 1 72
char 1 73
char 1 84
char 1 10
char 1 0
align 1
LABELV $1123
char 1 69
char 1 86
char 1 95
char 1 68
char 1 73
char 1 83
char 1 82
char 1 85
char 1 80
char 1 84
char 1 79
char 1 82
char 1 95
char 1 83
char 1 78
char 1 73
char 1 80
char 1 69
char 1 82
char 1 95
char 1 77
char 1 73
char 1 83
char 1 83
char 1 10
char 1 0
align 1
LABELV $1103
char 1 69
char 1 86
char 1 95
char 1 68
char 1 73
char 1 83
char 1 82
char 1 85
char 1 80
char 1 84
char 1 79
char 1 82
char 1 95
char 1 83
char 1 78
char 1 73
char 1 80
char 1 69
char 1 82
char 1 95
char 1 83
char 1 72
char 1 79
char 1 84
char 1 10
char 1 0
align 1
LABELV $1083
char 1 69
char 1 86
char 1 95
char 1 68
char 1 73
char 1 83
char 1 82
char 1 85
char 1 80
char 1 84
char 1 79
char 1 82
char 1 95
char 1 77
char 1 65
char 1 73
char 1 78
char 1 95
char 1 83
char 1 72
char 1 79
char 1 84
char 1 10
char 1 0
align 1
LABELV $1073
char 1 109
char 1 112
char 1 47
char 1 106
char 1 101
char 1 100
char 1 105
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1058
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 111
char 1 110
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1057
char 1 69
char 1 86
char 1 95
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 95
char 1 85
char 1 78
char 1 72
char 1 79
char 1 76
char 1 83
char 1 84
char 1 69
char 1 82
char 1 10
char 1 0
align 1
LABELV $1052
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 47
char 1 100
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1045
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 95
char 1 98
char 1 108
char 1 111
char 1 99
char 1 107
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1044
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 98
char 1 108
char 1 111
char 1 99
char 1 107
char 1 37
char 1 100
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1036
char 1 69
char 1 86
char 1 95
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 95
char 1 66
char 1 76
char 1 79
char 1 67
char 1 75
char 1 10
char 1 0
align 1
LABELV $1031
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 112
char 1 97
char 1 114
char 1 107
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1018
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 98
char 1 108
char 1 111
char 1 111
char 1 100
char 1 95
char 1 115
char 1 112
char 1 97
char 1 114
char 1 107
char 1 115
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $1017
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 104
char 1 105
char 1 116
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1009
char 1 69
char 1 86
char 1 95
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 95
char 1 72
char 1 73
char 1 84
char 1 10
char 1 0
align 1
LABELV $1004
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 104
char 1 117
char 1 112
char 1 37
char 1 105
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $1003
char 1 69
char 1 86
char 1 95
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 95
char 1 65
char 1 84
char 1 84
char 1 65
char 1 67
char 1 75
char 1 10
char 1 0
align 1
LABELV $990
char 1 69
char 1 86
char 1 95
char 1 65
char 1 76
char 1 84
char 1 95
char 1 70
char 1 73
char 1 82
char 1 69
char 1 10
char 1 0
align 1
LABELV $985
char 1 101
char 1 102
char 1 102
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 116
char 1 117
char 1 114
char 1 114
char 1 101
char 1 116
char 1 47
char 1 109
char 1 117
char 1 122
char 1 122
char 1 108
char 1 101
char 1 95
char 1 102
char 1 108
char 1 97
char 1 115
char 1 104
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $967
char 1 42
char 1 102
char 1 108
char 1 97
char 1 115
char 1 104
char 1 48
char 1 50
char 1 0
align 1
LABELV $964
char 1 42
char 1 102
char 1 108
char 1 97
char 1 115
char 1 104
char 1 48
char 1 49
char 1 0
align 1
LABELV $959
char 1 101
char 1 102
char 1 102
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 47
char 1 102
char 1 108
char 1 101
char 1 115
char 1 104
char 1 95
char 1 105
char 1 109
char 1 112
char 1 97
char 1 99
char 1 116
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $958
char 1 101
char 1 102
char 1 102
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 47
char 1 119
char 1 97
char 1 108
char 1 108
char 1 95
char 1 105
char 1 109
char 1 112
char 1 97
char 1 99
char 1 116
char 1 46
char 1 101
char 1 102
char 1 120
char 1 0
align 1
LABELV $952
char 1 69
char 1 86
char 1 95
char 1 70
char 1 73
char 1 82
char 1 69
char 1 95
char 1 87
char 1 69
char 1 65
char 1 80
char 1 79
char 1 78
char 1 10
char 1 0
align 1
LABELV $945
char 1 69
char 1 86
char 1 95
char 1 67
char 1 72
char 1 65
char 1 78
char 1 71
char 1 69
char 1 95
char 1 87
char 1 69
char 1 65
char 1 80
char 1 79
char 1 78
char 1 10
char 1 0
align 1
LABELV $931
char 1 69
char 1 86
char 1 95
char 1 78
char 1 79
char 1 65
char 1 77
char 1 77
char 1 79
char 1 10
char 1 0
align 1
LABELV $917
char 1 69
char 1 86
char 1 95
char 1 71
char 1 76
char 1 79
char 1 66
char 1 65
char 1 76
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 95
char 1 80
char 1 73
char 1 67
char 1 75
char 1 85
char 1 80
char 1 10
char 1 0
align 1
LABELV $876
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 0
align 1
LABELV $865
char 1 69
char 1 86
char 1 95
char 1 73
char 1 84
char 1 69
char 1 77
char 1 95
char 1 80
char 1 73
char 1 67
char 1 75
char 1 85
char 1 80
char 1 10
char 1 0
align 1
LABELV $860
char 1 42
char 1 103
char 1 97
char 1 115
char 1 112
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $859
char 1 69
char 1 86
char 1 95
char 1 87
char 1 65
char 1 84
char 1 69
char 1 82
char 1 95
char 1 67
char 1 76
char 1 69
char 1 65
char 1 82
char 1 10
char 1 0
align 1
LABELV $852
char 1 69
char 1 86
char 1 95
char 1 87
char 1 65
char 1 84
char 1 69
char 1 82
char 1 95
char 1 85
char 1 78
char 1 68
char 1 69
char 1 82
char 1 10
char 1 0
align 1
LABELV $845
char 1 69
char 1 86
char 1 95
char 1 87
char 1 65
char 1 84
char 1 69
char 1 82
char 1 95
char 1 76
char 1 69
char 1 65
char 1 86
char 1 69
char 1 10
char 1 0
align 1
LABELV $838
char 1 69
char 1 86
char 1 95
char 1 87
char 1 65
char 1 84
char 1 69
char 1 82
char 1 95
char 1 84
char 1 79
char 1 85
char 1 67
char 1 72
char 1 10
char 1 0
align 1
LABELV $833
char 1 111
char 1 110
char 1 112
char 1 97
char 1 116
char 1 114
char 1 111
char 1 108
char 1 0
align 1
LABELV $832
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 95
char 1 80
char 1 65
char 1 84
char 1 82
char 1 79
char 1 76
char 1 10
char 1 0
align 1
LABELV $827
char 1 111
char 1 110
char 1 100
char 1 101
char 1 102
char 1 101
char 1 110
char 1 115
char 1 101
char 1 0
align 1
LABELV $826
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 95
char 1 71
char 1 85
char 1 65
char 1 82
char 1 68
char 1 66
char 1 65
char 1 83
char 1 69
char 1 10
char 1 0
align 1
LABELV $821
char 1 111
char 1 110
char 1 103
char 1 101
char 1 116
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $820
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 95
char 1 71
char 1 69
char 1 84
char 1 70
char 1 76
char 1 65
char 1 71
char 1 10
char 1 0
align 1
LABELV $815
char 1 102
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 109
char 1 101
char 1 0
align 1
LABELV $814
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 95
char 1 70
char 1 79
char 1 76
char 1 76
char 1 79
char 1 87
char 1 77
char 1 69
char 1 10
char 1 0
align 1
LABELV $809
char 1 110
char 1 111
char 1 0
align 1
LABELV $808
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 95
char 1 78
char 1 79
char 1 10
char 1 0
align 1
LABELV $803
char 1 121
char 1 101
char 1 115
char 1 0
align 1
LABELV $802
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 95
char 1 89
char 1 69
char 1 83
char 1 10
char 1 0
align 1
LABELV $797
char 1 42
char 1 116
char 1 97
char 1 117
char 1 110
char 1 116
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $796
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 10
char 1 0
align 1
LABELV $783
char 1 69
char 1 86
char 1 95
char 1 82
char 1 79
char 1 76
char 1 76
char 1 10
char 1 0
align 1
LABELV $778
char 1 42
char 1 106
char 1 117
char 1 109
char 1 112
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $777
char 1 69
char 1 86
char 1 95
char 1 74
char 1 85
char 1 77
char 1 80
char 1 10
char 1 0
align 1
LABELV $772
char 1 109
char 1 117
char 1 115
char 1 105
char 1 99
char 1 47
char 1 109
char 1 112
char 1 47
char 1 100
char 1 117
char 1 101
char 1 108
char 1 46
char 1 109
char 1 112
char 1 51
char 1 0
align 1
LABELV $769
char 1 66
char 1 69
char 1 71
char 1 73
char 1 78
char 1 95
char 1 68
char 1 85
char 1 69
char 1 76
char 1 0
align 1
LABELV $768
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
LABELV $760
char 1 69
char 1 86
char 1 95
char 1 80
char 1 82
char 1 73
char 1 86
char 1 65
char 1 84
char 1 69
char 1 95
char 1 68
char 1 85
char 1 69
char 1 76
char 1 10
char 1 0
align 1
LABELV $755
char 1 69
char 1 86
char 1 95
char 1 74
char 1 85
char 1 77
char 1 80
char 1 95
char 1 80
char 1 65
char 1 68
char 1 10
char 1 0
align 1
LABELV $725
char 1 69
char 1 86
char 1 95
char 1 83
char 1 84
char 1 69
char 1 80
char 1 10
char 1 0
align 1
LABELV $716
char 1 69
char 1 86
char 1 95
char 1 70
char 1 65
char 1 76
char 1 76
char 1 10
char 1 0
align 1
LABELV $705
char 1 69
char 1 86
char 1 95
char 1 83
char 1 87
char 1 73
char 1 77
char 1 10
char 1 0
align 1
LABELV $694
char 1 69
char 1 86
char 1 95
char 1 70
char 1 79
char 1 79
char 1 84
char 1 87
char 1 65
char 1 68
char 1 69
char 1 10
char 1 0
align 1
LABELV $683
char 1 69
char 1 86
char 1 95
char 1 70
char 1 79
char 1 79
char 1 84
char 1 83
char 1 80
char 1 76
char 1 65
char 1 83
char 1 72
char 1 10
char 1 0
align 1
LABELV $672
char 1 69
char 1 86
char 1 95
char 1 70
char 1 79
char 1 79
char 1 84
char 1 83
char 1 84
char 1 69
char 1 80
char 1 95
char 1 77
char 1 69
char 1 84
char 1 65
char 1 76
char 1 10
char 1 0
align 1
LABELV $662
char 1 69
char 1 86
char 1 95
char 1 70
char 1 79
char 1 79
char 1 84
char 1 83
char 1 84
char 1 69
char 1 80
char 1 10
char 1 0
align 1
LABELV $655
char 1 69
char 1 86
char 1 95
char 1 67
char 1 76
char 1 73
char 1 69
char 1 78
char 1 84
char 1 74
char 1 79
char 1 73
char 1 78
char 1 10
char 1 0
align 1
LABELV $644
char 1 90
char 1 69
char 1 82
char 1 79
char 1 69
char 1 86
char 1 69
char 1 78
char 1 84
char 1 10
char 1 0
align 1
LABELV $638
char 1 101
char 1 110
char 1 116
char 1 58
char 1 37
char 1 51
char 1 105
char 1 32
char 1 32
char 1 101
char 1 118
char 1 101
char 1 110
char 1 116
char 1 58
char 1 37
char 1 51
char 1 105
char 1 32
char 1 0
align 1
LABELV $601
char 1 42
char 1 108
char 1 97
char 1 110
char 1 100
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $596
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 109
char 1 111
char 1 118
char 1 101
char 1 114
char 1 115
char 1 47
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 72
char 1 105
char 1 116
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $582
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $572
char 1 37
char 1 115
char 1 32
char 1 0
align 1
LABELV $567
char 1 37
char 1 115
char 1 0
align 1
LABELV $560
char 1 80
char 1 76
char 1 65
char 1 89
char 1 69
char 1 82
char 1 95
char 1 71
char 1 79
char 1 84
char 1 95
char 1 70
char 1 76
char 1 65
char 1 71
char 1 0
align 1
LABELV $558
char 1 80
char 1 76
char 1 65
char 1 89
char 1 69
char 1 82
char 1 95
char 1 67
char 1 65
char 1 80
char 1 84
char 1 85
char 1 82
char 1 69
char 1 68
char 1 95
char 1 70
char 1 76
char 1 65
char 1 71
char 1 0
align 1
LABELV $556
char 1 80
char 1 76
char 1 65
char 1 89
char 1 69
char 1 82
char 1 95
char 1 82
char 1 69
char 1 84
char 1 85
char 1 82
char 1 78
char 1 69
char 1 68
char 1 95
char 1 70
char 1 76
char 1 65
char 1 71
char 1 0
align 1
LABELV $554
char 1 70
char 1 76
char 1 65
char 1 71
char 1 95
char 1 82
char 1 69
char 1 84
char 1 85
char 1 82
char 1 78
char 1 69
char 1 68
char 1 0
align 1
LABELV $552
char 1 70
char 1 82
char 1 65
char 1 71
char 1 71
char 1 69
char 1 68
char 1 95
char 1 70
char 1 76
char 1 65
char 1 71
char 1 95
char 1 67
char 1 65
char 1 82
char 1 82
char 1 73
char 1 69
char 1 82
char 1 0
align 1
LABELV $547
char 1 70
char 1 82
char 1 69
char 1 69
char 1 0
align 1
LABELV $546
char 1 83
char 1 80
char 1 69
char 1 67
char 1 84
char 1 65
char 1 84
char 1 79
char 1 82
char 1 0
align 1
LABELV $543
char 1 66
char 1 76
char 1 85
char 1 69
char 1 0
align 1
LABELV $540
char 1 82
char 1 69
char 1 68
char 1 0
align 1
LABELV $533
char 1 77
char 1 111
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $531
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 95
char 1 114
char 1 111
char 1 111
char 1 116
char 1 0
align 1
LABELV $529
char 1 117
char 1 112
char 1 112
char 1 101
char 1 114
char 1 95
char 1 108
char 1 117
char 1 109
char 1 98
char 1 97
char 1 114
char 1 0
align 1
LABELV $520
char 1 112
char 1 101
char 1 108
char 1 118
char 1 105
char 1 115
char 1 0
align 1
LABELV $494
char 1 104
char 1 105
char 1 112
char 1 115
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 114
char 1 95
char 1 108
char 1 101
char 1 103
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $493
char 1 114
char 1 95
char 1 108
char 1 101
char 1 103
char 1 0
align 1
LABELV $491
char 1 104
char 1 105
char 1 112
char 1 115
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 108
char 1 95
char 1 108
char 1 101
char 1 103
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $490
char 1 108
char 1 95
char 1 108
char 1 101
char 1 103
char 1 0
align 1
LABELV $488
char 1 114
char 1 95
char 1 97
char 1 114
char 1 109
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 114
char 1 95
char 1 104
char 1 97
char 1 110
char 1 100
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $487
char 1 114
char 1 95
char 1 104
char 1 97
char 1 110
char 1 100
char 1 0
align 1
LABELV $485
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 114
char 1 95
char 1 97
char 1 114
char 1 109
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $484
char 1 114
char 1 95
char 1 97
char 1 114
char 1 109
char 1 0
align 1
LABELV $482
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 108
char 1 95
char 1 97
char 1 114
char 1 109
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $481
char 1 108
char 1 95
char 1 97
char 1 114
char 1 109
char 1 0
align 1
LABELV $479
char 1 104
char 1 105
char 1 112
char 1 115
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $478
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 0
align 1
LABELV $476
char 1 116
char 1 111
char 1 114
char 1 115
char 1 111
char 1 95
char 1 99
char 1 97
char 1 112
char 1 95
char 1 104
char 1 101
char 1 97
char 1 100
char 1 95
char 1 111
char 1 102
char 1 102
char 1 0
align 1
LABELV $475
char 1 104
char 1 101
char 1 97
char 1 100
char 1 0
align 1
LABELV $468
char 1 42
char 1 112
char 1 97
char 1 105
char 1 110
char 1 49
char 1 48
char 1 48
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $467
char 1 42
char 1 112
char 1 97
char 1 105
char 1 110
char 1 55
char 1 53
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $464
char 1 42
char 1 112
char 1 97
char 1 105
char 1 110
char 1 53
char 1 48
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $461
char 1 42
char 1 112
char 1 97
char 1 105
char 1 110
char 1 50
char 1 53
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $454
char 1 80
char 1 73
char 1 67
char 1 75
char 1 85
char 1 80
char 1 76
char 1 73
char 1 78
char 1 69
char 1 0
align 1
LABELV $453
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 95
char 1 37
char 1 115
char 1 0
align 1
LABELV $336
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $330
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 84
char 1 79
char 1 83
char 1 83
char 1 0
align 1
LABELV $328
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 71
char 1 69
char 1 78
char 1 69
char 1 82
char 1 73
char 1 67
char 1 0
align 1
LABELV $326
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 84
char 1 69
char 1 76
char 1 69
char 1 70
char 1 82
char 1 65
char 1 71
char 1 0
align 1
LABELV $324
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 83
char 1 69
char 1 78
char 1 84
char 1 82
char 1 89
char 1 0
align 1
LABELV $322
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 68
char 1 65
char 1 82
char 1 75
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 0
align 1
LABELV $320
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 68
char 1 69
char 1 84
char 1 80
char 1 65
char 1 67
char 1 75
char 1 0
align 1
LABELV $318
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 84
char 1 82
char 1 73
char 1 80
char 1 77
char 1 73
char 1 78
char 1 69
char 1 95
char 1 84
char 1 73
char 1 77
char 1 69
char 1 68
char 1 0
align 1
LABELV $316
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 84
char 1 82
char 1 73
char 1 80
char 1 77
char 1 73
char 1 78
char 1 69
char 1 0
align 1
LABELV $314
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 84
char 1 72
char 1 69
char 1 82
char 1 77
char 1 65
char 1 76
char 1 0
align 1
LABELV $312
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 82
char 1 79
char 1 67
char 1 75
char 1 69
char 1 84
char 1 95
char 1 72
char 1 79
char 1 77
char 1 73
char 1 78
char 1 71
char 1 0
align 1
LABELV $310
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 82
char 1 79
char 1 67
char 1 75
char 1 69
char 1 84
char 1 0
align 1
LABELV $308
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 70
char 1 76
char 1 69
char 1 67
char 1 72
char 1 69
char 1 84
char 1 84
char 1 69
char 1 95
char 1 77
char 1 73
char 1 78
char 1 69
char 1 0
align 1
LABELV $306
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 70
char 1 76
char 1 69
char 1 67
char 1 72
char 1 69
char 1 84
char 1 84
char 1 69
char 1 0
align 1
LABELV $304
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 68
char 1 69
char 1 77
char 1 80
char 1 50
char 1 0
align 1
LABELV $302
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 82
char 1 69
char 1 80
char 1 69
char 1 65
char 1 84
char 1 69
char 1 82
char 1 65
char 1 76
char 1 84
char 1 0
align 1
LABELV $300
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 82
char 1 69
char 1 80
char 1 69
char 1 65
char 1 84
char 1 69
char 1 82
char 1 0
align 1
LABELV $298
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 66
char 1 79
char 1 87
char 1 67
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 0
align 1
LABELV $296
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 68
char 1 73
char 1 83
char 1 82
char 1 85
char 1 80
char 1 84
char 1 79
char 1 82
char 1 83
char 1 78
char 1 73
char 1 80
char 1 69
char 1 0
align 1
LABELV $294
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 68
char 1 73
char 1 83
char 1 82
char 1 85
char 1 80
char 1 84
char 1 79
char 1 82
char 1 0
align 1
LABELV $292
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 66
char 1 76
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 0
align 1
LABELV $290
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 66
char 1 82
char 1 89
char 1 65
char 1 82
char 1 0
align 1
LABELV $288
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 0
align 1
LABELV $286
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 77
char 1 69
char 1 76
char 1 69
char 1 69
char 1 0
align 1
LABELV $284
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 83
char 1 84
char 1 85
char 1 78
char 1 0
align 1
LABELV $273
char 1 110
char 1 111
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $265
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $262
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 46
char 1 10
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 105
char 1 46
char 1 0
align 1
LABELV $261
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 80
char 1 76
char 1 65
char 1 67
char 1 69
char 1 95
char 1 87
char 1 73
char 1 84
char 1 72
char 1 0
align 1
LABELV $256
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 10
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $255
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 74
char 1 77
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 78
char 1 79
char 1 84
char 1 74
char 1 77
char 1 0
align 1
LABELV $254
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 95
char 1 77
char 1 69
char 1 83
char 1 83
char 1 65
char 1 71
char 1 69
char 1 0
align 1
LABELV $242
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $241
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 0
align 1
LABELV $227
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 71
char 1 69
char 1 78
char 1 69
char 1 82
char 1 73
char 1 67
char 1 68
char 1 69
char 1 65
char 1 84
char 1 72
char 1 95
char 1 77
char 1 65
char 1 76
char 1 69
char 1 0
align 1
LABELV $226
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 71
char 1 69
char 1 78
char 1 69
char 1 82
char 1 73
char 1 67
char 1 68
char 1 69
char 1 65
char 1 84
char 1 72
char 1 95
char 1 71
char 1 69
char 1 78
char 1 68
char 1 69
char 1 82
char 1 76
char 1 69
char 1 83
char 1 83
char 1 0
align 1
LABELV $223
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 71
char 1 69
char 1 78
char 1 69
char 1 82
char 1 73
char 1 67
char 1 68
char 1 69
char 1 65
char 1 84
char 1 72
char 1 95
char 1 70
char 1 69
char 1 77
char 1 65
char 1 76
char 1 69
char 1 0
align 1
LABELV $220
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 70
char 1 65
char 1 76
char 1 76
char 1 68
char 1 69
char 1 65
char 1 84
char 1 72
char 1 95
char 1 77
char 1 65
char 1 76
char 1 69
char 1 0
align 1
LABELV $219
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 70
char 1 65
char 1 76
char 1 76
char 1 68
char 1 69
char 1 65
char 1 84
char 1 72
char 1 95
char 1 71
char 1 69
char 1 78
char 1 68
char 1 69
char 1 82
char 1 76
char 1 69
char 1 83
char 1 83
char 1 0
align 1
LABELV $216
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 70
char 1 65
char 1 76
char 1 76
char 1 68
char 1 69
char 1 65
char 1 84
char 1 72
char 1 95
char 1 70
char 1 69
char 1 77
char 1 65
char 1 76
char 1 69
char 1 0
align 1
LABELV $212
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 69
char 1 76
char 1 69
char 1 67
char 1 84
char 1 82
char 1 79
char 1 67
char 1 85
char 1 84
char 1 69
char 1 68
char 1 95
char 1 77
char 1 65
char 1 76
char 1 69
char 1 0
align 1
LABELV $211
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 69
char 1 76
char 1 69
char 1 67
char 1 84
char 1 82
char 1 79
char 1 67
char 1 85
char 1 84
char 1 69
char 1 68
char 1 95
char 1 71
char 1 69
char 1 78
char 1 68
char 1 69
char 1 82
char 1 76
char 1 69
char 1 83
char 1 83
char 1 0
align 1
LABELV $208
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 69
char 1 76
char 1 69
char 1 67
char 1 84
char 1 82
char 1 79
char 1 67
char 1 85
char 1 84
char 1 69
char 1 68
char 1 95
char 1 70
char 1 69
char 1 77
char 1 65
char 1 76
char 1 69
char 1 0
align 1
LABELV $204
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 69
char 1 88
char 1 80
char 1 76
char 1 79
char 1 83
char 1 73
char 1 86
char 1 69
char 1 83
char 1 95
char 1 77
char 1 65
char 1 76
char 1 69
char 1 0
align 1
LABELV $203
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 69
char 1 88
char 1 80
char 1 76
char 1 79
char 1 83
char 1 73
char 1 86
char 1 69
char 1 83
char 1 95
char 1 71
char 1 69
char 1 78
char 1 68
char 1 69
char 1 82
char 1 76
char 1 69
char 1 83
char 1 83
char 1 0
align 1
LABELV $200
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 69
char 1 88
char 1 80
char 1 76
char 1 79
char 1 83
char 1 73
char 1 86
char 1 69
char 1 83
char 1 95
char 1 70
char 1 69
char 1 77
char 1 65
char 1 76
char 1 69
char 1 0
align 1
LABELV $196
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 83
char 1 72
char 1 79
char 1 84
char 1 95
char 1 77
char 1 65
char 1 76
char 1 69
char 1 0
align 1
LABELV $195
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 83
char 1 72
char 1 79
char 1 84
char 1 95
char 1 71
char 1 69
char 1 78
char 1 68
char 1 69
char 1 82
char 1 76
char 1 69
char 1 83
char 1 83
char 1 0
align 1
LABELV $192
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 95
char 1 83
char 1 72
char 1 79
char 1 84
char 1 95
char 1 70
char 1 69
char 1 77
char 1 65
char 1 76
char 1 69
char 1 0
align 1
LABELV $182
char 1 68
char 1 73
char 1 69
char 1 68
char 1 95
char 1 71
char 1 69
char 1 78
char 1 69
char 1 82
char 1 73
char 1 67
char 1 0
align 1
LABELV $178
char 1 94
char 1 55
char 1 0
align 1
LABELV $177
char 1 110
char 1 0
align 1
LABELV $170
char 1 67
char 1 71
char 1 95
char 1 79
char 1 98
char 1 105
char 1 116
char 1 117
char 1 97
char 1 114
char 1 121
char 1 58
char 1 32
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 32
char 1 111
char 1 117
char 1 116
char 1 32
char 1 111
char 1 102
char 1 32
char 1 114
char 1 97
char 1 110
char 1 103
char 1 101
char 1 0
align 1
LABELV $165
char 1 37
char 1 115
char 1 37
char 1 115
char 1 0
align 1
LABELV $160
char 1 37
char 1 105
char 1 37
char 1 115
char 1 0
align 1
LABELV $157
char 1 49
char 1 51
char 1 37
char 1 115
char 1 0
align 1
LABELV $154
char 1 49
char 1 50
char 1 37
char 1 115
char 1 0
align 1
LABELV $151
char 1 49
char 1 49
char 1 37
char 1 115
char 1 0
align 1
LABELV $148
char 1 51
char 1 37
char 1 115
char 1 0
align 1
LABELV $145
char 1 50
char 1 37
char 1 115
char 1 0
align 1
LABELV $142
char 1 49
char 1 37
char 1 115
char 1 0
align 1
LABELV $139
char 1 0
align 1
LABELV $136
char 1 32
char 1 0
align 1
LABELV $135
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 84
char 1 73
char 1 69
char 1 68
char 1 95
char 1 70
char 1 79
char 1 82
char 1 0
align 1
LABELV $134
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 78
char 1 85
char 1 77
char 1 66
char 1 69
char 1 82
char 1 95
char 1 84
char 1 72
char 1 0
align 1
LABELV $133
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 78
char 1 85
char 1 77
char 1 66
char 1 69
char 1 82
char 1 95
char 1 82
char 1 68
char 1 0
align 1
LABELV $132
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 78
char 1 85
char 1 77
char 1 66
char 1 69
char 1 82
char 1 95
char 1 78
char 1 68
char 1 0
align 1
LABELV $131
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 69
char 1 88
char 1 84
char 1 95
char 1 78
char 1 85
char 1 77
char 1 66
char 1 69
char 1 82
char 1 95
char 1 83
char 1 84
char 1 0
