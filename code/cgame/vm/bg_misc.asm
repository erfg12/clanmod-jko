data
export forceMasteryLevels
align 4
LABELV forceMasteryLevels
address $120
address $121
address $122
address $123
address $124
address $125
address $126
address $127
export forceMasteryPoints
align 4
LABELV forceMasteryPoints
byte 4 0
byte 4 5
byte 4 10
byte 4 20
byte 4 30
byte 4 50
byte 4 75
byte 4 100
export bgForcePowerCost
align 4
LABELV bgForcePowerCost
byte 4 0
byte 4 2
byte 4 4
byte 4 6
byte 4 0
byte 4 0
byte 4 2
byte 4 6
byte 4 0
byte 4 2
byte 4 4
byte 4 6
byte 4 0
byte 4 1
byte 4 3
byte 4 6
byte 4 0
byte 4 1
byte 4 3
byte 4 6
byte 4 0
byte 4 4
byte 4 6
byte 4 8
byte 4 0
byte 4 1
byte 4 3
byte 4 6
byte 4 0
byte 4 2
byte 4 5
byte 4 8
byte 4 0
byte 4 4
byte 4 6
byte 4 8
byte 4 0
byte 4 2
byte 4 5
byte 4 8
byte 4 0
byte 4 1
byte 4 3
byte 4 6
byte 4 0
byte 4 1
byte 4 3
byte 4 6
byte 4 0
byte 4 1
byte 4 3
byte 4 6
byte 4 0
byte 4 2
byte 4 4
byte 4 6
byte 4 0
byte 4 2
byte 4 5
byte 4 8
byte 4 0
byte 4 1
byte 4 5
byte 4 8
byte 4 0
byte 4 1
byte 4 5
byte 4 8
byte 4 0
byte 4 4
byte 4 6
byte 4 8
export forcePowerSorted
align 4
LABELV forcePowerSorted
byte 4 5
byte 4 0
byte 4 10
byte 4 9
byte 4 11
byte 4 1
byte 4 2
byte 4 3
byte 4 4
byte 4 14
byte 4 7
byte 4 13
byte 4 8
byte 4 6
byte 4 12
byte 4 15
byte 4 16
byte 4 17
export forcePowerDarkLight
align 4
LABELV forcePowerDarkLight
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 2
byte 4 2
byte 4 2
byte 4 1
byte 4 1
byte 4 1
byte 4 2
byte 4 2
byte 4 0
byte 4 0
byte 4 0
byte 4 0
export WeaponReadyAnim
align 4
LABELV WeaponReadyAnim
byte 4 1091
byte 4 1101
byte 4 573
byte 4 1100
byte 4 1101
byte 4 1101
byte 4 1101
byte 4 1101
byte 4 1101
byte 4 1101
byte 4 1101
byte 4 1108
byte 4 1108
byte 4 1108
byte 4 571
byte 4 1099
export WeaponAttackAnim
align 4
LABELV WeaponAttackAnim
byte 4 117
byte 4 120
byte 4 573
byte 4 118
byte 4 120
byte 4 120
byte 4 120
byte 4 120
byte 4 120
byte 4 120
byte 4 120
byte 4 137
byte 4 120
byte 4 120
byte 4 571
byte 4 117
export BG_LegalizedForcePowers
code
proc BG_LegalizedForcePowers 436 12
file "../../game/bg_misc.c"
line 177
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// bg_misc.c -- both games misc functions, all completely stateless
;4:
;5:#include "q_shared.h"
;6:#include "bg_public.h"
;7:
;8:#ifdef QAGAME
;9:#include "g_local.h"
;10:#endif
;11:
;12:#ifdef UI_EXPORTS
;13:#include "../ui/ui_local.h"
;14:#endif
;15:
;16:#ifndef UI_EXPORTS
;17:#ifndef QAGAME
;18:#include "../cgame/cg_local.h"
;19:#endif
;20:#endif
;21:
;22://rww - not putting @ in front of these because
;23://we don't need them in a cgame striped lookup.
;24://Let me know if this causes problems, pat.
;25:char *forceMasteryLevels[NUM_FORCE_MASTERY_LEVELS] = 
;26:{
;27:	"MASTERY0",	//"Uninitiated",	// FORCE_MASTERY_UNINITIATED,
;28:	"MASTERY1",	//"Initiate",		// FORCE_MASTERY_INITIATE,
;29:	"MASTERY2",	//"Padawan",		// FORCE_MASTERY_PADAWAN,
;30:	"MASTERY3",	//"Jedi",			// FORCE_MASTERY_JEDI,
;31:	"MASTERY4",	//"Jedi Adept",		// FORCE_MASTERY_JEDI_GUARDIAN,
;32:	"MASTERY5",	//"Jedi Guardian",	// FORCE_MASTERY_JEDI_ADEPT,
;33:	"MASTERY6",	//"Jedi Knight",	// FORCE_MASTERY_JEDI_KNIGHT,
;34:	"MASTERY7",	//"Jedi Master"		// FORCE_MASTERY_JEDI_MASTER,
;35:};
;36:
;37:int forceMasteryPoints[NUM_FORCE_MASTERY_LEVELS] =
;38:{
;39:	0,		// FORCE_MASTERY_UNINITIATED,
;40:	5,		// FORCE_MASTERY_INITIATE,
;41:	10,		// FORCE_MASTERY_PADAWAN,
;42:	20,		// FORCE_MASTERY_JEDI,
;43:	30,		// FORCE_MASTERY_JEDI_GUARDIAN,
;44:	50,		// FORCE_MASTERY_JEDI_ADEPT,
;45:	75,		// FORCE_MASTERY_JEDI_KNIGHT,
;46:	100		// FORCE_MASTERY_JEDI_MASTER,
;47:};
;48:
;49:int bgForcePowerCost[NUM_FORCE_POWERS][NUM_FORCE_POWER_LEVELS] = //0 == neutral
;50:{
;51:	{	0,	2,	4,	6	},	// Heal			// FP_HEAL
;52:	{	0,	0,	2,	6	},	// Jump			//FP_LEVITATION,//hold/duration
;53:	{	0,	2,	4,	6	},	// Speed		//FP_SPEED,//duration
;54:	{	0,	1,	3,	6	},	// Push			//FP_PUSH,//hold/duration
;55:	{	0,	1,	3,	6	},	// Pull			//FP_PULL,//hold/duration
;56:	{	0,	4,	6,	8	},	// Mind Trick	//FP_TELEPATHY,//instant
;57:	{	0,	1,	3,	6	},	// Grip			//FP_GRIP,//hold/duration
;58:	{	0,	2,	5,	8	},	// Lightning	//FP_LIGHTNING,//hold/duration
;59:	{	0,	4,	6,	8	},	// Dark Rage	//FP_RAGE,//duration
;60:	{	0,	2,	5,	8	},	// Protection	//FP_PROTECT,//duration
;61:	{	0,	1,	3,	6	},	// Absorb		//FP_ABSORB,//duration
;62:	{	0,	1,	3,	6	},	// Team Heal	//FP_TEAM_HEAL,//instant
;63:	{	0,	1,	3,	6	},	// Team Force	//FP_TEAM_FORCE,//instant
;64:	{	0,	2,	4,	6	},	// Drain		//FP_DRAIN,//hold/duration
;65:	{	0,	2,	5,	8	},	// Sight		//FP_SEE,//duration
;66:	{	0,	1,	5,	8	},	// Saber Attack	//FP_SABERATTACK,
;67:	{	0,	1,	5,	8	},	// Saber Defend	//FP_SABERDEFEND,
;68:	{	0,	4,	6,	8	}	// Saber Throw	//FP_SABERTHROW,
;69:	//NUM_FORCE_POWERS
;70:};
;71:
;72:int forcePowerSorted[NUM_FORCE_POWERS] = 
;73:{ //rww - always use this order when drawing force powers for any reason
;74:	FP_TELEPATHY,
;75:	FP_HEAL,
;76:	FP_ABSORB,
;77:	FP_PROTECT,
;78:	FP_TEAM_HEAL,
;79:	FP_LEVITATION,
;80:	FP_SPEED,
;81:	FP_PUSH,
;82:	FP_PULL,
;83:	FP_SEE,
;84:	FP_LIGHTNING,
;85:	FP_DRAIN,
;86:	FP_RAGE,
;87:	FP_GRIP,
;88:	FP_TEAM_FORCE,
;89:	FP_SABERATTACK,
;90:	FP_SABERDEFEND,
;91:	FP_SABERTHROW
;92:};
;93:
;94:int forcePowerDarkLight[NUM_FORCE_POWERS] = //0 == neutral
;95:{ //nothing should be usable at rank 0..
;96:	FORCE_LIGHTSIDE,//FP_HEAL,//instant
;97:	0,//FP_LEVITATION,//hold/duration
;98:	0,//FP_SPEED,//duration
;99:	0,//FP_PUSH,//hold/duration
;100:	0,//FP_PULL,//hold/duration
;101:	FORCE_LIGHTSIDE,//FP_TELEPATHY,//instant
;102:	FORCE_DARKSIDE,//FP_GRIP,//hold/duration
;103:	FORCE_DARKSIDE,//FP_LIGHTNING,//hold/duration
;104:	FORCE_DARKSIDE,//FP_RAGE,//duration
;105:	FORCE_LIGHTSIDE,//FP_PROTECT,//duration
;106:	FORCE_LIGHTSIDE,//FP_ABSORB,//duration
;107:	FORCE_LIGHTSIDE,//FP_TEAM_HEAL,//instant
;108:	FORCE_DARKSIDE,//FP_TEAM_FORCE,//instant
;109:	FORCE_DARKSIDE,//FP_DRAIN,//hold/duration
;110:	0,//FP_SEE,//duration
;111:	0,//FP_SABERATTACK,
;112:	0,//FP_SABERDEFEND,
;113:	0//FP_SABERTHROW,
;114:		//NUM_FORCE_POWERS
;115:};
;116:
;117:int WeaponReadyAnim[WP_NUM_WEAPONS] =
;118:{
;119:	TORSO_DROPWEAP1,//WP_NONE,
;120:
;121:	TORSO_WEAPONREADY3,//WP_STUN_BATON,
;122:	BOTH_STAND2,//WP_SABER,
;123:	TORSO_WEAPONREADY2,//WP_BRYAR_PISTOL,
;124:	TORSO_WEAPONREADY3,//WP_BLASTER,
;125:	TORSO_WEAPONREADY3,//TORSO_WEAPONREADY4,//WP_DISRUPTOR,
;126:	TORSO_WEAPONREADY3,//TORSO_WEAPONREADY5,//WP_BOWCASTER,
;127:	TORSO_WEAPONREADY3,//TORSO_WEAPONREADY6,//WP_REPEATER,
;128:	TORSO_WEAPONREADY3,//TORSO_WEAPONREADY7,//WP_DEMP2,
;129:	TORSO_WEAPONREADY3,//TORSO_WEAPONREADY8,//WP_FLECHETTE,
;130:	TORSO_WEAPONREADY3,//TORSO_WEAPONREADY9,//WP_ROCKET_LAUNCHER,
;131:	TORSO_WEAPONREADY10,//WP_THERMAL,
;132:	TORSO_WEAPONREADY10,//TORSO_WEAPONREADY11,//WP_TRIP_MINE,
;133:	TORSO_WEAPONREADY10,//TORSO_WEAPONREADY12,//WP_DET_PACK,
;134:
;135:	//NOT VALID (e.g. should never really be used):
;136:	BOTH_STAND1,//WP_EMPLACED_GUN,
;137:	TORSO_WEAPONREADY1//WP_TURRET,
;138:};
;139:
;140:int WeaponAttackAnim[WP_NUM_WEAPONS] =
;141:{
;142:	BOTH_ATTACK1,//WP_NONE, //(shouldn't happen)
;143:
;144:	BOTH_ATTACK3,//WP_STUN_BATON,
;145:	BOTH_STAND2,//WP_SABER, //(has its own handling)
;146:	BOTH_ATTACK2,//WP_BRYAR_PISTOL,
;147:	BOTH_ATTACK3,//WP_BLASTER,
;148:	BOTH_ATTACK3,//BOTH_ATTACK4,//WP_DISRUPTOR,
;149:	BOTH_ATTACK3,//BOTH_ATTACK5,//WP_BOWCASTER,
;150:	BOTH_ATTACK3,//BOTH_ATTACK6,//WP_REPEATER,
;151:	BOTH_ATTACK3,//BOTH_ATTACK7,//WP_DEMP2,
;152:	BOTH_ATTACK3,//BOTH_ATTACK8,//WP_FLECHETTE,
;153:	BOTH_ATTACK3,//BOTH_ATTACK9,//WP_ROCKET_LAUNCHER,
;154:	BOTH_THERMAL_THROW,//WP_THERMAL,
;155:	BOTH_ATTACK3,//BOTH_ATTACK11,//WP_TRIP_MINE,
;156:	BOTH_ATTACK3,//BOTH_ATTACK12,//WP_DET_PACK,
;157:
;158:	//NOT VALID (e.g. should never really be used):
;159:	BOTH_STAND1,//WP_EMPLACED_GUN,
;160:	BOTH_ATTACK1//WP_TURRET,
;161:};
;162:
;163:
;164:/*
;165:================
;166:BG_LegalizedForcePowers
;167:
;168:The magical function to end all functions.
;169:This will take the force power string in powerOut and parse through it, then legalize
;170:it based on the supposed rank and spit it into powerOut, returning true if it was legal
;171:to begin with and false if not.
;172:fpDisabled is actually only expected (needed) from the server, because the ui disables
;173:force power selection anyway when force powers are disabled on the server.
;174:================
;175:*/
;176:qboolean BG_LegalizedForcePowers(char *powerOut, int maxRank, qboolean freeSaber, int teamForce, int gametype, int fpDisabled)
;177:{
line 180
;178:	char powerBuf[128];
;179:	char readBuf[128];
;180:	qboolean maintainsValidity = qtrue;
ADDRLP4 352
CNSTI4 1
ASGNI4
line 181
;181:	int powerLen = strlen(powerOut);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 360
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 356
ADDRLP4 360
INDIRI4
ASGNI4
line 182
;182:	int i = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
line 183
;183:	int c = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 184
;184:	int allowedPoints = 0;
ADDRLP4 88
CNSTI4 0
ASGNI4
line 185
;185:	int usedPoints = 0;
ADDRLP4 80
CNSTI4 0
ASGNI4
line 186
;186:	int countDown = 0;
ADDRLP4 84
CNSTI4 0
ASGNI4
line 191
;187:	
;188:	int final_Side;
;189:	int final_Powers[NUM_FORCE_POWERS];
;190:
;191:	if (powerLen >= 128)
ADDRLP4 356
INDIRI4
CNSTI4 128
LTI4 $129
line 192
;192:	{ //This should not happen. If it does, this is obviously a bogus string.
line 194
;193:		//They can have this string. Because I said so.
;194:		strcpy(powerBuf, "7-1-032330000000001333");
ADDRLP4 92
ARGP4
ADDRGP4 $131
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 195
;195:		maintainsValidity = qfalse;
ADDRLP4 352
CNSTI4 0
ASGNI4
line 196
;196:	}
ADDRGP4 $130
JUMPV
LABELV $129
line 198
;197:	else
;198:	{
line 199
;199:		strcpy(powerBuf, powerOut); //copy it as the original
ADDRLP4 92
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 200
;200:	}
LABELV $130
line 203
;201:
;202:	//first of all, print the max rank into the string as the rank
;203:	strcpy(powerOut, va("%i-", maxRank));
ADDRGP4 $132
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 364
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $134
JUMPV
LABELV $133
line 206
;204:
;205:	while (i < 128 && powerBuf[i] && powerBuf[i] != '-')
;206:	{
line 207
;207:		i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 208
;208:	}
LABELV $134
line 205
ADDRLP4 76
INDIRI4
CNSTI4 128
GEI4 $137
ADDRLP4 372
ADDRLP4 76
INDIRI4
ADDRLP4 92
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 0
EQI4 $137
ADDRLP4 372
INDIRI4
CNSTI4 45
NEI4 $133
LABELV $137
line 209
;209:	i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $139
JUMPV
LABELV $138
line 211
;210:	while (i < 128 && powerBuf[i] && powerBuf[i] != '-')
;211:	{
line 212
;212:		readBuf[c] = powerBuf[i];
ADDRLP4 0
INDIRI4
ADDRLP4 220
ADDP4
ADDRLP4 76
INDIRI4
ADDRLP4 92
ADDP4
INDIRI1
ASGNI1
line 213
;213:		c++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 214
;214:		i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 215
;215:	}
LABELV $139
line 210
ADDRLP4 76
INDIRI4
CNSTI4 128
GEI4 $142
ADDRLP4 380
ADDRLP4 76
INDIRI4
ADDRLP4 92
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 0
EQI4 $142
ADDRLP4 380
INDIRI4
CNSTI4 45
NEI4 $138
LABELV $142
line 216
;216:	readBuf[c] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 220
ADDP4
CNSTI1 0
ASGNI1
line 217
;217:	i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 219
;218:	//at this point, readBuf contains the intended side
;219:	final_Side = atoi(readBuf);
ADDRLP4 220
ARGP4
ADDRLP4 384
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 348
ADDRLP4 384
INDIRI4
ASGNI4
line 221
;220:
;221:	if (final_Side != FORCE_LIGHTSIDE &&
ADDRLP4 348
INDIRI4
CNSTI4 1
EQI4 $143
ADDRLP4 348
INDIRI4
CNSTI4 2
EQI4 $143
line 223
;222:		final_Side != FORCE_DARKSIDE)
;223:	{ //Not a valid side. You will be dark. Because I said so. (this is something that should never actually happen unless you purposely feed in an invalid config)
line 224
;224:		final_Side = FORCE_DARKSIDE;
ADDRLP4 348
CNSTI4 2
ASGNI4
line 225
;225:		maintainsValidity = qfalse;
ADDRLP4 352
CNSTI4 0
ASGNI4
line 226
;226:	}
LABELV $143
line 228
;227:
;228:	if (teamForce)
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $145
line 229
;229:	{ //If we are under force-aligned teams, make sure we're on the right side.
line 230
;230:		if (final_Side != teamForce)
ADDRLP4 348
INDIRI4
ADDRFP4 12
INDIRI4
EQI4 $147
line 231
;231:		{
line 232
;232:			final_Side = teamForce;
ADDRLP4 348
ADDRFP4 12
INDIRI4
ASGNI4
line 235
;233:			//maintainsValidity = qfalse;
;234:			//Not doing this, for now. Let them join the team with their filtered powers.
;235:		}
LABELV $147
line 236
;236:	}
LABELV $145
line 240
;237:
;238:	//Now we have established a valid rank, and a valid side.
;239:	//Read the force powers in, and cut them down based on the various rules supplied.
;240:	c = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $150
JUMPV
LABELV $149
line 242
;241:	while (i < 128 && powerBuf[i] && powerBuf[i] != '\n' && c < NUM_FORCE_POWERS)
;242:	{
line 243
;243:		readBuf[0] = powerBuf[i];
ADDRLP4 220
ADDRLP4 76
INDIRI4
ADDRLP4 92
ADDP4
INDIRI1
ASGNI1
line 244
;244:		readBuf[1] = 0;
ADDRLP4 220+1
CNSTI1 0
ASGNI1
line 245
;245:		final_Powers[c] = atoi(readBuf);
ADDRLP4 220
ARGP4
ADDRLP4 392
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 392
INDIRI4
ASGNI4
line 246
;246:		c++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 247
;247:		i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 248
;248:	}
LABELV $150
line 241
ADDRLP4 76
INDIRI4
CNSTI4 128
GEI4 $155
ADDRLP4 396
ADDRLP4 76
INDIRI4
ADDRLP4 92
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 396
INDIRI4
CNSTI4 0
EQI4 $155
ADDRLP4 396
INDIRI4
CNSTI4 10
EQI4 $155
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $149
LABELV $155
line 252
;249:
;250:	//final_Powers now contains all the stuff from the string
;251:	//Set the maximum allowed points used based on the max rank level, and count the points actually used.
;252:	allowedPoints = forceMasteryPoints[maxRank];
ADDRLP4 88
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceMasteryPoints
ADDP4
INDIRI4
ASGNI4
line 254
;253:
;254:	i = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $157
JUMPV
LABELV $156
line 256
;255:	while (i < NUM_FORCE_POWERS)
;256:	{ //if this power doesn't match the side we're on, then 0 it now.
line 257
;257:		if (final_Powers[i] &&
ADDRLP4 400
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 404
CNSTI4 0
ASGNI4
ADDRLP4 400
INDIRI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 404
INDIRI4
EQI4 $159
ADDRLP4 408
ADDRLP4 400
INDIRI4
ADDRGP4 forcePowerDarkLight
ADDP4
INDIRI4
ASGNI4
ADDRLP4 408
INDIRI4
ADDRLP4 404
INDIRI4
EQI4 $159
ADDRLP4 408
INDIRI4
ADDRLP4 348
INDIRI4
EQI4 $159
line 260
;258:			forcePowerDarkLight[i] &&
;259:			forcePowerDarkLight[i] != final_Side)
;260:		{
line 261
;261:			final_Powers[i] = 0;
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTI4 0
ASGNI4
line 263
;262:			//This is only likely to happen with g_forceBasedTeams. Let it slide.
;263:		}
LABELV $159
line 265
;264:
;265:		if ( final_Powers[i] &&
ADDRLP4 416
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 416
INDIRI4
EQI4 $161
ADDRFP4 20
INDIRI4
CNSTI4 1
ADDRLP4 76
INDIRI4
LSHI4
BANDI4
ADDRLP4 416
INDIRI4
EQI4 $161
line 267
;266:			(fpDisabled & (1 << i)) )
;267:		{ //if this power is disabled on the server via said server option, then we don't get it.
line 268
;268:			final_Powers[i] = 0;
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTI4 0
ASGNI4
line 269
;269:		}
LABELV $161
line 271
;270:
;271:		i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 272
;272:	}
LABELV $157
line 255
ADDRLP4 76
INDIRI4
CNSTI4 18
LTI4 $156
line 274
;273:
;274:	if (gametype < GT_TEAM)
ADDRFP4 16
INDIRI4
CNSTI4 5
GEI4 $163
line 275
;275:	{ //don't bother with team powers then
line 276
;276:		final_Powers[FP_TEAM_HEAL] = 0;
ADDRLP4 4+44
CNSTI4 0
ASGNI4
line 277
;277:		final_Powers[FP_TEAM_FORCE] = 0;
ADDRLP4 4+48
CNSTI4 0
ASGNI4
line 278
;278:	}
LABELV $163
line 280
;279:
;280:	usedPoints = 0;
ADDRLP4 80
CNSTI4 0
ASGNI4
line 281
;281:	i = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $168
JUMPV
LABELV $167
line 283
;282:	while (i < NUM_FORCE_POWERS)
;283:	{
line 284
;284:		countDown = 0;
ADDRLP4 84
CNSTI4 0
ASGNI4
line 286
;285:
;286:		countDown = final_Powers[i];
ADDRLP4 84
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $171
JUMPV
LABELV $170
line 289
;287:
;288:		while (countDown > 0)
;289:		{
line 290
;290:			usedPoints += bgForcePowerCost[i][countDown]; //[fp index][fp level]
ADDRLP4 80
ADDRLP4 80
INDIRI4
ADDRLP4 84
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 76
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 292
;291:			//if this is jump, or we have a free saber and it's offense or defense, take the level back down on level 1
;292:			if ( countDown == 1 &&
ADDRLP4 400
CNSTI4 1
ASGNI4
ADDRLP4 84
INDIRI4
ADDRLP4 400
INDIRI4
NEI4 $173
ADDRLP4 76
INDIRI4
ADDRLP4 400
INDIRI4
EQI4 $176
ADDRLP4 76
INDIRI4
CNSTI4 15
NEI4 $177
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $176
LABELV $177
ADDRLP4 76
INDIRI4
CNSTI4 16
NEI4 $173
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $173
LABELV $176
line 296
;293:				((i == FP_LEVITATION) ||
;294:				 (i == FP_SABERATTACK && freeSaber) ||
;295:				 (i == FP_SABERDEFEND && freeSaber)) )
;296:			{
line 297
;297:				usedPoints -= bgForcePowerCost[i][countDown];
ADDRLP4 80
ADDRLP4 80
INDIRI4
ADDRLP4 84
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 76
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 298
;298:			}
LABELV $173
line 299
;299:			countDown--;
ADDRLP4 84
ADDRLP4 84
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 300
;300:		}
LABELV $171
line 288
ADDRLP4 84
INDIRI4
CNSTI4 0
GTI4 $170
line 302
;301:
;302:		i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 303
;303:	}
LABELV $168
line 282
ADDRLP4 76
INDIRI4
CNSTI4 18
LTI4 $167
line 305
;304:
;305:	if (usedPoints > allowedPoints)
ADDRLP4 80
INDIRI4
ADDRLP4 88
INDIRI4
LEI4 $178
line 306
;306:	{ //Time to do the fancy stuff. (meaning, slowly cut parts off while taking a guess at what is most or least important in the config)
line 307
;307:		int attemptedCycles = 0;
ADDRLP4 408
CNSTI4 0
ASGNI4
line 308
;308:		int powerCycle = 2;
ADDRLP4 400
CNSTI4 2
ASGNI4
line 309
;309:		int minPow = 0;
ADDRLP4 404
CNSTI4 0
ASGNI4
line 311
;310:		
;311:		if (freeSaber)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $180
line 312
;312:		{
line 313
;313:			minPow = 1;
ADDRLP4 404
CNSTI4 1
ASGNI4
line 314
;314:		}
LABELV $180
line 316
;315:
;316:		maintainsValidity = qfalse;
ADDRLP4 352
CNSTI4 0
ASGNI4
ADDRGP4 $183
JUMPV
LABELV $182
line 319
;317:
;318:		while (usedPoints > allowedPoints)
;319:		{
line 320
;320:			c = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $186
JUMPV
LABELV $185
line 323
;321:
;322:			while (c < NUM_FORCE_POWERS && usedPoints > allowedPoints)
;323:			{
line 324
;324:				if (final_Powers[c] && final_Powers[c] < powerCycle)
ADDRLP4 412
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 412
INDIRI4
CNSTI4 0
EQI4 $188
ADDRLP4 412
INDIRI4
ADDRLP4 400
INDIRI4
GEI4 $188
line 325
;325:				{ //kill in order of lowest powers, because the higher powers are probably more important
line 326
;326:					if (c == FP_SABERATTACK &&
ADDRLP4 0
INDIRI4
CNSTI4 15
NEI4 $207
ADDRLP4 4+64
INDIRI4
ADDRLP4 404
INDIRI4
GTI4 $194
ADDRLP4 4+68
INDIRI4
CNSTI4 0
LEI4 $207
LABELV $194
line 328
;327:						(final_Powers[FP_SABERDEFEND] > minPow || final_Powers[FP_SABERTHROW] > 0))
;328:					{ //if we're on saber attack, only suck it down if we have no def or throw either
line 329
;329:						int whichOne = FP_SABERTHROW; //first try throw
ADDRLP4 416
CNSTI4 17
ASGNI4
line 331
;330:
;331:						if (!final_Powers[whichOne])
ADDRLP4 416
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $198
line 332
;332:						{
line 333
;333:							whichOne = FP_SABERDEFEND; //if no throw, drain defense
ADDRLP4 416
CNSTI4 16
ASGNI4
line 334
;334:						}
ADDRGP4 $198
JUMPV
LABELV $197
line 337
;335:
;336:						while (final_Powers[whichOne] > 0 && usedPoints > allowedPoints)
;337:						{
line 338
;338:							if ( final_Powers[whichOne] > 1 ||
ADDRLP4 416
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 1
GTI4 $204
ADDRLP4 416
INDIRI4
CNSTI4 15
NEI4 $203
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $191
LABELV $203
ADDRLP4 416
INDIRI4
CNSTI4 16
NEI4 $204
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $191
LABELV $204
line 341
;339:								( (whichOne != FP_SABERATTACK || !freeSaber) &&
;340:								  (whichOne != FP_SABERDEFEND || !freeSaber) ) )
;341:							{ //don't take attack or defend down on level 1 still, if it's free
line 342
;342:								usedPoints -= bgForcePowerCost[whichOne][final_Powers[whichOne]];
ADDRLP4 428
CNSTI4 2
ASGNI4
ADDRLP4 80
ADDRLP4 80
INDIRI4
ADDRLP4 416
INDIRI4
ADDRLP4 428
INDIRI4
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 428
INDIRI4
LSHI4
ADDRLP4 416
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 343
;343:								final_Powers[whichOne]--;
ADDRLP4 432
ADDRLP4 416
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ASGNP4
ADDRLP4 432
INDIRP4
ADDRLP4 432
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 344
;344:							}
line 346
;345:							else
;346:							{
line 347
;347:								break;
LABELV $201
line 349
;348:							}
;349:						}
LABELV $198
line 336
ADDRLP4 416
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 0
LEI4 $205
ADDRLP4 80
INDIRI4
ADDRLP4 88
INDIRI4
GTI4 $197
LABELV $205
line 350
;350:					}
ADDRGP4 $191
JUMPV
line 352
;351:					else
;352:					{
LABELV $206
line 354
;353:						while (final_Powers[c] > 0 && usedPoints > allowedPoints)
;354:						{
line 355
;355:							if ( final_Powers[c] > 1 ||
ADDRLP4 420
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 420
INDIRI4
GTI4 $213
ADDRLP4 0
INDIRI4
ADDRLP4 420
INDIRI4
EQI4 $208
ADDRLP4 0
INDIRI4
CNSTI4 15
NEI4 $212
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $208
LABELV $212
ADDRLP4 0
INDIRI4
CNSTI4 16
NEI4 $213
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $208
LABELV $213
line 359
;356:								((c != FP_LEVITATION) &&
;357:								(c != FP_SABERATTACK || !freeSaber) &&
;358:								(c != FP_SABERDEFEND || !freeSaber)) )
;359:							{
line 360
;360:								usedPoints -= bgForcePowerCost[c][final_Powers[c]];
ADDRLP4 428
CNSTI4 2
ASGNI4
ADDRLP4 80
ADDRLP4 80
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 428
INDIRI4
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 428
INDIRI4
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 361
;361:								final_Powers[c]--;
ADDRLP4 432
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ASGNP4
ADDRLP4 432
INDIRP4
ADDRLP4 432
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 362
;362:							}
line 364
;363:							else
;364:							{
line 365
;365:								break;
LABELV $210
line 367
;366:							}
;367:						}
LABELV $207
line 353
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 0
LEI4 $214
ADDRLP4 80
INDIRI4
ADDRLP4 88
INDIRI4
GTI4 $206
LABELV $214
LABELV $208
line 368
;368:					}
LABELV $191
line 369
;369:				}
LABELV $188
line 371
;370:
;371:				c++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 372
;372:			}
LABELV $186
line 322
ADDRLP4 0
INDIRI4
CNSTI4 18
GEI4 $215
ADDRLP4 80
INDIRI4
ADDRLP4 88
INDIRI4
GTI4 $185
LABELV $215
line 374
;373:
;374:			powerCycle++;
ADDRLP4 400
ADDRLP4 400
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 375
;375:			attemptedCycles++;
ADDRLP4 408
ADDRLP4 408
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 377
;376:
;377:			if (attemptedCycles > NUM_FORCE_POWERS)
ADDRLP4 408
INDIRI4
CNSTI4 18
LEI4 $216
line 378
;378:			{ //I think this should be impossible. But just in case.
line 379
;379:				break;
ADDRGP4 $184
JUMPV
LABELV $216
line 381
;380:			}
;381:		}
LABELV $183
line 318
ADDRLP4 80
INDIRI4
ADDRLP4 88
INDIRI4
GTI4 $182
LABELV $184
line 383
;382:
;383:		if (usedPoints > allowedPoints)
ADDRLP4 80
INDIRI4
ADDRLP4 88
INDIRI4
LEI4 $218
line 384
;384:		{ //Still? Fine then.. we will kill all of your powers, except the freebies.
line 385
;385:			i = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $221
JUMPV
LABELV $220
line 388
;386:
;387:			while (i < NUM_FORCE_POWERS)
;388:			{
line 389
;389:				final_Powers[i] = 0;
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTI4 0
ASGNI4
line 390
;390:				if (i == FP_LEVITATION ||
ADDRLP4 76
INDIRI4
CNSTI4 1
EQI4 $226
ADDRLP4 76
INDIRI4
CNSTI4 15
NEI4 $227
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $226
LABELV $227
ADDRLP4 76
INDIRI4
CNSTI4 16
NEI4 $223
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $223
LABELV $226
line 393
;391:					(i == FP_SABERATTACK && freeSaber) ||
;392:					(i == FP_SABERDEFEND && freeSaber))
;393:				{
line 394
;394:					final_Powers[i] = 1;
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTI4 1
ASGNI4
line 395
;395:				}
LABELV $223
line 396
;396:				i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 397
;397:			}
LABELV $221
line 387
ADDRLP4 76
INDIRI4
CNSTI4 18
LTI4 $220
line 398
;398:			usedPoints = 0;
ADDRLP4 80
CNSTI4 0
ASGNI4
line 399
;399:		}
LABELV $218
line 400
;400:	}
LABELV $178
line 402
;401:
;402:	if (freeSaber)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $228
line 403
;403:	{
line 404
;404:		if (final_Powers[FP_SABERATTACK] < 1)
ADDRLP4 4+60
INDIRI4
CNSTI4 1
GEI4 $230
line 405
;405:		{
line 406
;406:			final_Powers[FP_SABERATTACK] = 1;
ADDRLP4 4+60
CNSTI4 1
ASGNI4
line 407
;407:		}
LABELV $230
line 408
;408:		if (final_Powers[FP_SABERDEFEND] < 1)
ADDRLP4 4+64
INDIRI4
CNSTI4 1
GEI4 $234
line 409
;409:		{
line 410
;410:			final_Powers[FP_SABERDEFEND] = 1;
ADDRLP4 4+64
CNSTI4 1
ASGNI4
line 411
;411:		}
LABELV $234
line 412
;412:	}
LABELV $228
line 413
;413:	if (final_Powers[FP_LEVITATION] < 1)
ADDRLP4 4+4
INDIRI4
CNSTI4 1
GEI4 $238
line 414
;414:	{
line 415
;415:		final_Powers[FP_LEVITATION] = 1;
ADDRLP4 4+4
CNSTI4 1
ASGNI4
line 416
;416:	}
LABELV $238
line 418
;417:
;418:	if (fpDisabled)
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $242
line 419
;419:	{ //If we specifically have attack or def disabled, force them up to level 3. It's the way
line 422
;420:	  //things work for the case of all powers disabled.
;421:	  //If jump is disabled, down-cap it to level 1. Otherwise don't do a thing.
;422:		if (fpDisabled & (1 << FP_LEVITATION))
ADDRFP4 20
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $244
line 423
;423:		{
line 424
;424:			final_Powers[FP_LEVITATION] = 1;
ADDRLP4 4+4
CNSTI4 1
ASGNI4
line 425
;425:		}
LABELV $244
line 426
;426:		if (fpDisabled & (1 << FP_SABERATTACK))
ADDRFP4 20
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $247
line 427
;427:		{
line 428
;428:			final_Powers[FP_SABERATTACK] = 3;
ADDRLP4 4+60
CNSTI4 3
ASGNI4
line 429
;429:		}
LABELV $247
line 430
;430:		if (fpDisabled & (1 << FP_SABERDEFEND))
ADDRFP4 20
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $250
line 431
;431:		{
line 432
;432:			final_Powers[FP_SABERDEFEND] = 3;
ADDRLP4 4+64
CNSTI4 3
ASGNI4
line 433
;433:		}
LABELV $250
line 434
;434:	}
LABELV $242
line 436
;435:
;436:	if (final_Powers[FP_SABERATTACK] < 1)
ADDRLP4 4+60
INDIRI4
CNSTI4 1
GEI4 $253
line 437
;437:	{
line 438
;438:		final_Powers[FP_SABERDEFEND] = 0;
ADDRLP4 4+64
CNSTI4 0
ASGNI4
line 439
;439:		final_Powers[FP_SABERTHROW] = 0;
ADDRLP4 4+68
CNSTI4 0
ASGNI4
line 440
;440:	}
LABELV $253
line 445
;441:
;442:	//We finally have all the force powers legalized and stored locally.
;443:	//Put them all into the string and return the result. We already have
;444:	//the rank there, so print the side and the powers now.
;445:	Q_strcat(powerOut, 128, va("%i-", final_Side));
ADDRGP4 $132
ARGP4
ADDRLP4 348
INDIRI4
ARGI4
ADDRLP4 400
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 400
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 447
;446:
;447:	i = strlen(powerOut);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 404
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 404
INDIRI4
ASGNI4
line 448
;448:	c = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $259
JUMPV
LABELV $258
line 450
;449:	while (c < NUM_FORCE_POWERS)
;450:	{
line 451
;451:		strcpy(readBuf, va("%i", final_Powers[c]));
ADDRGP4 $261
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 408
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 220
ARGP4
ADDRLP4 408
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 452
;452:		powerOut[i] = readBuf[0];
ADDRLP4 76
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ADDRLP4 220
INDIRI1
ASGNI1
line 453
;453:		c++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 454
;454:		i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 455
;455:	}
LABELV $259
line 449
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $258
line 456
;456:	powerOut[i] = 0;
ADDRLP4 76
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 458
;457:
;458:	return maintainsValidity;
ADDRLP4 352
INDIRI4
RETI4
LABELV $128
endproc BG_LegalizedForcePowers 436 12
data
export bg_itemlist
align 4
LABELV bg_itemlist
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $262
address $262
address $263
address $264
address $265
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $266
byte 4 25
byte 4 3
byte 4 1
address $262
address $262
address $267
address $264
address $268
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $269
byte 4 100
byte 4 3
byte 4 2
address $262
address $262
address $270
address $271
address $272
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $273
byte 4 25
byte 4 4
byte 4 0
address $262
address $262
address $274
address $275
address $276
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $277
byte 4 120
byte 4 6
byte 4 1
address $262
address $262
address $278
address $275
address $279
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $280
byte 4 120
byte 4 6
byte 4 2
address $262
address $281
address $282
address $275
address $283
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $284
byte 4 25
byte 4 6
byte 4 3
address $262
address $262
address $285
address $275
address $286
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 6
byte 4 4
address $262
address $262
address $287
address $275
address $288
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $289
byte 4 60
byte 4 6
byte 4 5
address $262
address $262
address $290
address $275
address $291
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $292
byte 4 120
byte 4 6
byte 4 6
address $262
address $262
address $293
address $294
address $295
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $296
byte 4 25
byte 4 5
byte 4 12
address $262
address $262
address $297
address $294
address $298
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $299
byte 4 25
byte 4 5
byte 4 13
address $262
address $262
address $300
address $301
address $302
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $303
byte 4 25
byte 4 5
byte 4 14
address $262
address $262
address $304
address $305
address $306
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $307
byte 4 25
byte 4 5
byte 4 15
address $262
address $262
address $308
address $275
address $309
byte 4 0
byte 4 0
byte 4 0
address $310
address $311
byte 4 100
byte 4 1
byte 4 1
address $262
address $262
address $312
address $275
address $313
byte 4 0
byte 4 0
byte 4 0
address $314
address $315
byte 4 100
byte 4 1
byte 4 2
address $262
address $262
address $316
address $275
address $317
byte 4 0
byte 4 0
byte 4 0
address $318
address $319
byte 4 100
byte 4 1
byte 4 3
address $262
address $262
address $320
address $275
address $321
byte 4 0
byte 4 0
byte 4 0
address $322
address $323
byte 4 100
byte 4 1
byte 4 4
address $262
address $262
address $324
address $275
address $325
byte 4 0
byte 4 0
byte 4 0
address $326
address $327
byte 4 100
byte 4 1
byte 4 5
address $262
address $262
address $328
address $275
address $329
byte 4 0
byte 4 0
byte 4 0
address $330
address $331
byte 4 100
byte 4 1
byte 4 6
address $262
address $262
address $332
address $275
address $333
byte 4 0
byte 4 0
byte 4 0
address $334
address $335
byte 4 100
byte 4 1
byte 4 7
address $262
address $262
address $336
address $275
address $337
byte 4 0
byte 4 0
byte 4 0
address $338
address $339
byte 4 100
byte 4 1
byte 4 8
address $262
address $262
address $340
address $275
address $341
byte 4 0
byte 4 0
byte 4 0
address $342
address $343
byte 4 100
byte 4 1
byte 4 9
address $262
address $262
address $344
address $275
address $345
byte 4 0
byte 4 0
byte 4 0
address $346
address $347
byte 4 3
byte 4 1
byte 4 10
address $262
address $262
address $348
address $275
address $349
address $350
byte 4 0
byte 4 0
address $351
address $352
byte 4 4
byte 4 2
byte 4 7
address $262
address $262
address $353
address $275
address $354
address $355
byte 4 0
byte 4 0
address $356
address $357
byte 4 3
byte 4 2
byte 4 8
address $262
address $262
address $358
address $275
address $359
address $360
address $361
byte 4 0
address $362
address $363
byte 4 3
byte 4 2
byte 4 9
address $262
address $262
address $364
address $275
address $350
address $349
byte 4 0
byte 4 0
address $351
address $352
byte 4 4
byte 4 1
byte 4 11
address $262
address $262
address $365
address $275
address $355
address $354
byte 4 0
byte 4 0
address $356
address $357
byte 4 3
byte 4 1
byte 4 12
address $262
address $262
address $366
address $275
address $360
address $359
address $361
byte 4 0
address $362
address $363
byte 4 3
byte 4 1
byte 4 13
address $262
address $262
address $367
address $275
address $321
byte 4 0
byte 4 0
byte 4 0
address $322
address $323
byte 4 50
byte 4 1
byte 4 14
address $262
address $262
address $368
address $275
address $321
byte 4 0
byte 4 0
byte 4 0
address $322
address $323
byte 4 50
byte 4 1
byte 4 15
address $262
address $262
address $369
address $370
address $371
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $323
byte 4 100
byte 4 2
byte 4 1
address $262
address $262
address $372
address $370
address $371
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $373
byte 4 100
byte 4 2
byte 4 2
address $262
address $262
address $374
address $370
address $375
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $376
byte 4 100
byte 4 2
byte 4 3
address $262
address $262
address $377
address $370
address $378
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $379
byte 4 100
byte 4 2
byte 4 4
address $262
address $262
address $380
address $370
address $381
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $382
byte 4 3
byte 4 2
byte 4 5
address $262
address $262
address $383
byte 4 0
address $384
address $385
byte 4 0
byte 4 0
byte 4 0
address $386
byte 4 0
byte 4 8
byte 4 4
address $262
address $262
address $387
byte 4 0
address $388
address $389
byte 4 0
byte 4 0
byte 4 0
address $390
byte 4 0
byte 4 8
byte 4 5
address $262
address $262
address $391
byte 4 0
address $392
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $393
byte 4 0
byte 4 8
byte 4 6
address $262
address $262
address $394
address $370
address $395
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $396
byte 4 0
byte 4 8
byte 4 0
address $262
address $262
address $397
address $370
address $398
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $399
byte 4 0
byte 4 8
byte 4 0
address $262
address $262
byte 4 0
skip 48
export bg_numItems
align 4
LABELV bg_numItems
byte 4 42
export vectoyaw
code
proc vectoyaw 20 8
line 1250
;459:}
;460:
;461:/*QUAKED item_***** ( 0 0 0 ) (-16 -16 -16) (16 16 16) suspended
;462:DO NOT USE THIS CLASS, IT JUST HOLDS GENERAL INFORMATION.
;463:The suspended flag will allow items to hang in the air, otherwise they are dropped to the next surface.
;464:
;465:If an item is the target of another entity, it will not spawn in until fired.
;466:
;467:An item fires all of its targets when it is picked up.  If the toucher can't carry it, the targets won't be fired.
;468:
;469:"notfree" if set to 1, don't spawn in free for all games
;470:"notteam" if set to 1, don't spawn in team games
;471:"notsingle" if set to 1, don't spawn in single player games
;472:"wait"	override the default wait before respawning.  -1 = never respawn automatically, which can be used with targeted spawning.
;473:"random" random number of plus or minus seconds varied from the respawn time
;474:"count" override quantity or duration on most items.
;475:*/
;476:
;477:/*QUAKED misc_shield_floor_unit (1 0 0) (-16 -16 0) (16 16 40)
;478:#MODELNAME="/models/items/a_shield_converter.md3"
;479:Gives shield energy when used.
;480:
;481:"count" - max charge value (default 50)
;482:"chargerate" - rechage 1 point every this many milliseconds (default 3000)
;483:*/
;484:
;485:gitem_t	bg_itemlist[] = 
;486:{
;487:	{
;488:		NULL,				// classname	
;489:		NULL,				// pickup_sound
;490:		{	NULL,			// world_model[0]
;491:			NULL,			// world_model[1]
;492:			0, 0} ,			// world_model[2],[3]
;493:		NULL,				// view_model
;494:/* icon */		NULL,		// icon
;495:/* pickup */	//NULL,		// pickup_name
;496:		0,					// quantity
;497:		0,					// giType (IT_*)
;498:		0,					// giTag
;499:/* precache */ "",			// precaches
;500:/* sounds */ ""				// sounds
;501:	},	// leave index 0 alone
;502:
;503:	//
;504:	// Pickups
;505:	//
;506:
;507:/*QUAKED item_shield_sm_instant (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;508:Instant shield pickup, restores 25
;509:*/
;510:	{
;511:		"item_shield_sm_instant", 
;512:		"sound/player/pickupshield.wav",
;513:        { "models/map_objects/mp/psd_sm.md3",
;514:		0, 0, 0},
;515:/* view */		NULL,			
;516:/* icon */		"gfx/mp/small_shield",
;517:/* pickup *///	"Shield Small",
;518:		25,
;519:		IT_ARMOR,
;520:		1, //special for shield - max on pickup is maxhealth*tag, thus small shield goes up to 100 shield
;521:/* precache */ "",
;522:/* sounds */ ""
;523:	},
;524:
;525:/*QUAKED item_shield_lrg_instant (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;526:Instant shield pickup, restores 100
;527:*/
;528:	{
;529:		"item_shield_lrg_instant", 
;530:		"sound/player/pickupshield.wav",
;531:        { "models/map_objects/mp/psd.md3",
;532:		0, 0, 0},
;533:/* view */		NULL,			
;534:/* icon */		"gfx/mp/large_shield",
;535:/* pickup *///	"Shield Large",
;536:		100,
;537:		IT_ARMOR,
;538:		2, //special for shield - max on pickup is maxhealth*tag, thus large shield goes up to 200 shield
;539:/* precache */ "",
;540:/* sounds */ ""
;541:	},
;542:
;543:/*QUAKED item_medpak_instant (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;544:Instant medpack pickup, heals 25
;545:*/
;546:	{
;547:		"item_medpak_instant",
;548:		"sound/player/pickuphealth.wav",
;549:        { "models/map_objects/mp/medpac.md3", 
;550:		0, 0, 0 },
;551:/* view */		NULL,			
;552:/* icon */		"gfx/hud/i_icon_medkit",
;553:/* pickup *///	"Medpack",
;554:		25,
;555:		IT_HEALTH,
;556:		0,
;557:/* precache */ "",
;558:/* sounds */ ""
;559:	},
;560:
;561:
;562:	//
;563:	// ITEMS
;564:	//
;565:
;566:/*QUAKED item_seeker (.3 .3 1) (-8 -8 -0) (8 8 16) suspended
;567:30 seconds of seeker drone
;568:*/
;569:	{
;570:		"item_seeker", 
;571:		"sound/weapons/w_pkup.wav",
;572:		{ "models/items/remote.md3", 
;573:		0, 0, 0} ,
;574:/* view */		NULL,			
;575:/* icon */		"gfx/hud/i_icon_seeker",
;576:/* pickup *///	"Seeker Drone",
;577:		120,
;578:		IT_HOLDABLE,
;579:		HI_SEEKER,
;580:/* precache */ "",
;581:/* sounds */ ""
;582:	},
;583:
;584:/*QUAKED item_shield (.3 .3 1) (-8 -8 -0) (8 8 16) suspended
;585:Portable shield
;586:*/
;587:	{
;588:		"item_shield", 
;589:		"sound/weapons/w_pkup.wav",
;590:		{ "models/map_objects/mp/shield.md3", 
;591:		0, 0, 0} ,
;592:/* view */		NULL,			
;593:/* icon */		"gfx/hud/i_icon_shieldwall",
;594:/* pickup *///	"Forcefield",
;595:		120,
;596:		IT_HOLDABLE,
;597:		HI_SHIELD,
;598:/* precache */ "",
;599:/* sounds */ "sound/weapons/detpack/stick.wav sound/movers/doors/forcefield_on.wav sound/movers/doors/forcefield_off.wav sound/movers/doors/forcefield_lp.wav sound/effects/bumpfield.wav",
;600:	},
;601:
;602:/*QUAKED item_medpac (.3 .3 1) (-8 -8 -0) (8 8 16) suspended
;603:Bacta canister pickup, heals 25 on use
;604:*/
;605:	{
;606:		"item_medpac",	//should be item_bacta
;607:		"sound/weapons/w_pkup.wav",
;608:		{ "models/map_objects/mp/bacta.md3", 
;609:		0, 0, 0} ,
;610:/* view */		NULL,			
;611:/* icon */		"gfx/hud/i_icon_bacta",
;612:/* pickup *///	"Bacta Canister",
;613:		25,
;614:		IT_HOLDABLE,
;615:		HI_MEDPAC,
;616:/* precache */ "",
;617:/* sounds */ ""
;618:	},
;619:
;620:/*QUAKED item_datapad (.3 .3 1) (-8 -8 -0) (8 8 16) suspended
;621:Do not place this.
;622:*/
;623:	{
;624:		"item_datapad", 
;625:		"sound/weapons/w_pkup.wav",
;626:		{ "models/items/datapad.md3", 
;627:		0, 0, 0} ,
;628:/* view */		NULL,			
;629:/* icon */		NULL,
;630:/* pickup *///	"Datapad",
;631:		1,
;632:		IT_HOLDABLE,
;633:		HI_DATAPAD,
;634:/* precache */ "",
;635:/* sounds */ ""
;636:	},
;637:
;638:/*QUAKED item_binoculars (.3 .3 1) (-8 -8 -0) (8 8 16) suspended
;639:These will be standard equipment on the player - DO NOT PLACE
;640:*/
;641:	{
;642:		"item_binoculars", 
;643:		"sound/weapons/w_pkup.wav",
;644:		{ "models/items/binoculars.md3", 
;645:		0, 0, 0} ,
;646:/* view */		NULL,			
;647:/* icon */		"gfx/hud/i_icon_zoom",
;648:/* pickup *///	"Binoculars",
;649:		60,
;650:		IT_HOLDABLE,
;651:		HI_BINOCULARS,
;652:/* precache */ "",
;653:/* sounds */ ""
;654:	},
;655:
;656:/*QUAKED item_sentry_gun (.3 .3 1) (-8 -8 -0) (8 8 16) suspended
;657:Sentry gun inventory pickup.
;658:*/
;659:	{
;660:		"item_sentry_gun", 
;661:		"sound/weapons/w_pkup.wav",
;662:		{ "models/items/psgun.glm", 
;663:		0, 0, 0} ,
;664:/* view */		NULL,			
;665:/* icon */		"gfx/hud/i_icon_sentrygun",
;666:/* pickup *///	"Sentry Gun",
;667:		120,
;668:		IT_HOLDABLE,
;669:		HI_SENTRY_GUN,
;670:/* precache */ "",
;671:/* sounds */ ""
;672:	},
;673:
;674:/*QUAKED item_force_enlighten_light (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;675:Adds one rank to all Force powers temporarily. Only light jedi can use.
;676:*/
;677:	{
;678:		"item_force_enlighten_light",
;679:		"sound/player/enlightenment.wav",
;680:		{ "models/map_objects/mp/jedi_enlightenment.md3", 
;681:		0, 0, 0} ,
;682:/* view */		NULL,			
;683:/* icon */		"gfx/hud/mpi_jlight",
;684:/* pickup *///	"Light Force Enlightenment",
;685:		25,
;686:		IT_POWERUP,
;687:		PW_FORCE_ENLIGHTENED_LIGHT,
;688:/* precache */ "",
;689:/* sounds */ ""
;690:	},
;691:
;692:/*QUAKED item_force_enlighten_dark (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;693:Adds one rank to all Force powers temporarily. Only dark jedi can use.
;694:*/
;695:	{
;696:		"item_force_enlighten_dark",
;697:		"sound/player/enlightenment.wav",
;698:		{ "models/map_objects/mp/dk_enlightenment.md3", 
;699:		0, 0, 0} ,
;700:/* view */		NULL,			
;701:/* icon */		"gfx/hud/mpi_dklight",
;702:/* pickup *///	"Dark Force Enlightenment",
;703:		25,
;704:		IT_POWERUP,
;705:		PW_FORCE_ENLIGHTENED_DARK,
;706:/* precache */ "",
;707:/* sounds */ ""
;708:	},
;709:
;710:/*QUAKED item_force_boon (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;711:Unlimited Force Pool for a short time.
;712:*/
;713:	{
;714:		"item_force_boon",
;715:		"sound/player/boon.wav",
;716:		{ "models/map_objects/mp/force_boon.md3", 
;717:		0, 0, 0} ,
;718:/* view */		NULL,			
;719:/* icon */		"gfx/hud/mpi_fboon",
;720:/* pickup *///	"Force Boon",
;721:		25,
;722:		IT_POWERUP,
;723:		PW_FORCE_BOON,
;724:/* precache */ "",
;725:/* sounds */ ""
;726:	},
;727:
;728:/*QUAKED item_ysalimari (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;729:A small lizard carried on the player, which prevents the possessor from using any Force power.  However, he is unaffected by any Force power.
;730:*/
;731:	{
;732:		"item_ysalimari",
;733:		"sound/player/ysalimari.wav",
;734:		{ "models/map_objects/mp/ysalimari.md3", 
;735:		0, 0, 0} ,
;736:/* view */		NULL,			
;737:/* icon */		"gfx/hud/mpi_ysamari",
;738:/* pickup *///	"Ysalamiri",
;739:		25,
;740:		IT_POWERUP,
;741:		PW_YSALAMIRI,
;742:/* precache */ "",
;743:/* sounds */ ""
;744:	},
;745:
;746:	//
;747:	// WEAPONS 
;748:	//
;749:
;750:/*QUAKED weapon_stun_baton (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;751:Don't place this
;752:*/
;753:	{
;754:		"weapon_stun_baton", 
;755:		"sound/weapons/w_pkup.wav",
;756:        { "models/weapons2/stun_baton/baton_w.glm", 
;757:		0, 0, 0},
;758:/* view */		"models/weapons2/stun_baton/baton.md3", 
;759:/* icon */		"gfx/hud/w_icon_stunbaton",
;760:/* pickup *///	"Stun Baton",
;761:		100,
;762:		IT_WEAPON,
;763:		WP_STUN_BATON,
;764:/* precache */ "",
;765:/* sounds */ ""
;766:	},
;767:
;768:/*QUAKED weapon_saber (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;769:Don't place this
;770:*/
;771:	{
;772:		"weapon_saber", 
;773:		"sound/weapons/w_pkup.wav",
;774:        { "models/weapons2/saber/saber_w.glm",
;775:		0, 0, 0},
;776:/* view */		"models/weapons2/saber/saber_w.md3",
;777:/* icon */		"gfx/hud/w_icon_lightsaber",
;778:/* pickup *///	"Lightsaber",
;779:		100,
;780:		IT_WEAPON,
;781:		WP_SABER,
;782:/* precache */ "",
;783:/* sounds */ ""
;784:	},
;785:
;786:/*QUAKED weapon_bryar_pistol (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;787:Don't place this
;788:*/
;789:	{
;790:		"weapon_bryar_pistol", 
;791:		"sound/weapons/w_pkup.wav",
;792:        { "models/weapons2/briar_pistol/briar_pistol_w.glm", 
;793:		0, 0, 0},
;794:/* view */		"models/weapons2/briar_pistol/briar_pistol.md3", 
;795:/* icon */		"gfx/hud/w_icon_rifle",
;796:/* pickup *///	"Bryar Pistol",
;797:		100,
;798:		IT_WEAPON,
;799:		WP_BRYAR_PISTOL,
;800:/* precache */ "",
;801:/* sounds */ ""
;802:	},
;803:
;804:/*QUAKED weapon_blaster (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;805:*/
;806:	{
;807:		"weapon_blaster", 
;808:		"sound/weapons/w_pkup.wav",
;809:        { "models/weapons2/blaster_r/blaster_w.glm", 
;810:		0, 0, 0},
;811:/* view */		"models/weapons2/blaster_r/blaster.md3", 
;812:/* icon */		"gfx/hud/w_icon_blaster",
;813:/* pickup *///	"E11 Blaster Rifle",
;814:		100,
;815:		IT_WEAPON,
;816:		WP_BLASTER,
;817:/* precache */ "",
;818:/* sounds */ ""
;819:	},
;820:
;821:/*QUAKED weapon_disruptor (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;822:*/
;823:	{
;824:		"weapon_disruptor",
;825:		"sound/weapons/w_pkup.wav",
;826:        { "models/weapons2/disruptor/disruptor_w.glm", 
;827:		0, 0, 0},
;828:/* view */		"models/weapons2/disruptor/disruptor.md3", 
;829:/* icon */		"gfx/hud/w_icon_disruptor",
;830:/* pickup *///	"Tenloss Disruptor Rifle",
;831:		100,
;832:		IT_WEAPON,
;833:		WP_DISRUPTOR,
;834:/* precache */ "",
;835:/* sounds */ ""
;836:	},
;837:
;838:/*QUAKED weapon_bowcaster (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;839:*/
;840:	{
;841:		"weapon_bowcaster",
;842:		"sound/weapons/w_pkup.wav",
;843:        { "models/weapons2/bowcaster/bowcaster_w.glm", 
;844:		0, 0, 0},
;845:/* view */		"models/weapons2/bowcaster/bowcaster.md3", 
;846:/* icon */		"gfx/hud/w_icon_bowcaster",
;847:/* pickup *///	"Wookiee Bowcaster",
;848:		100,
;849:		IT_WEAPON,
;850:		WP_BOWCASTER,
;851:/* precache */ "",
;852:/* sounds */ ""
;853:	},
;854:
;855:/*QUAKED weapon_repeater (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;856:*/
;857:	{
;858:		"weapon_repeater", 
;859:		"sound/weapons/w_pkup.wav",
;860:        { "models/weapons2/heavy_repeater/heavy_repeater_w.glm", 
;861:		0, 0, 0},
;862:/* view */		"models/weapons2/heavy_repeater/heavy_repeater.md3", 
;863:/* icon */		"gfx/hud/w_icon_repeater",
;864:/* pickup *///	"Imperial Heavy Repeater",
;865:		100,
;866:		IT_WEAPON,
;867:		WP_REPEATER,
;868:/* precache */ "",
;869:/* sounds */ ""
;870:	},
;871:
;872:/*QUAKED weapon_demp2 (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;873:NOTENOTE This weapon is not yet complete.  Don't place it.
;874:*/
;875:	{
;876:		"weapon_demp2", 
;877:		"sound/weapons/w_pkup.wav",
;878:        { "models/weapons2/demp2/demp2_w.glm", 
;879:		0, 0, 0},
;880:/* view */		"models/weapons2/demp2/demp2.md3", 
;881:/* icon */		"gfx/hud/w_icon_demp2",
;882:/* pickup *///	"DEMP2",
;883:		100,
;884:		IT_WEAPON,
;885:		WP_DEMP2,
;886:/* precache */ "",
;887:/* sounds */ ""
;888:	},
;889:
;890:/*QUAKED weapon_flechette (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;891:*/
;892:	{
;893:		"weapon_flechette", 
;894:		"sound/weapons/w_pkup.wav",
;895:        { "models/weapons2/golan_arms/golan_arms_w.glm", 
;896:		0, 0, 0},
;897:/* view */		"models/weapons2/golan_arms/golan_arms.md3", 
;898:/* icon */		"gfx/hud/w_icon_flechette",
;899:/* pickup *///	"Golan Arms Flechette",
;900:		100,
;901:		IT_WEAPON,
;902:		WP_FLECHETTE,
;903:/* precache */ "",
;904:/* sounds */ ""
;905:	},
;906:
;907:/*QUAKED weapon_rocket_launcher (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;908:*/
;909:	{
;910:		"weapon_rocket_launcher",
;911:		"sound/weapons/w_pkup.wav",
;912:        { "models/weapons2/merr_sonn/merr_sonn_w.glm", 
;913:		0, 0, 0},
;914:/* view */		"models/weapons2/merr_sonn/merr_sonn.md3", 
;915:/* icon */		"gfx/hud/w_icon_merrsonn",
;916:/* pickup *///	"Merr-Sonn Missile System",
;917:		3,
;918:		IT_WEAPON,
;919:		WP_ROCKET_LAUNCHER,
;920:/* precache */ "",
;921:/* sounds */ ""
;922:	},
;923:
;924:/*QUAKED ammo_thermal (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;925:*/
;926:	{
;927:		"ammo_thermal",
;928:		"sound/weapons/w_pkup.wav",
;929:        { "models/weapons2/thermal/thermal_pu.md3", 
;930:		"models/weapons2/thermal/thermal_w.glm", 0, 0},
;931:/* view */		"models/weapons2/thermal/thermal.md3", 
;932:/* icon */		"gfx/hud/w_icon_thermal",
;933:/* pickup *///	"Thermal Detonators",
;934:		4,
;935:		IT_AMMO,
;936:		AMMO_THERMAL,
;937:/* precache */ "",
;938:/* sounds */ ""
;939:	},
;940:
;941:/*QUAKED ammo_tripmine (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;942:*/
;943:	{
;944:		"ammo_tripmine", 
;945:		"sound/weapons/w_pkup.wav",
;946:        { "models/weapons2/laser_trap/laser_trap_pu.md3", 
;947:		"models/weapons2/laser_trap/laser_trap_w.glm", 0, 0},
;948:/* view */		"models/weapons2/laser_trap/laser_trap.md3", 
;949:/* icon */		"gfx/hud/w_icon_tripmine",
;950:/* pickup *///	"Trip Mines",
;951:		3,
;952:		IT_AMMO,
;953:		AMMO_TRIPMINE,
;954:/* precache */ "",
;955:/* sounds */ ""
;956:	},
;957:
;958:/*QUAKED ammo_detpack (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;959:*/
;960:	{
;961:		"ammo_detpack", 
;962:		"sound/weapons/w_pkup.wav",
;963:        { "models/weapons2/detpack/det_pack_pu.md3", "models/weapons2/detpack/det_pack_proj.glm", "models/weapons2/detpack/det_pack_w.glm", 0},
;964:/* view */		"models/weapons2/detpack/det_pack.md3", 
;965:/* icon */		"gfx/hud/w_icon_detpack",
;966:/* pickup *///	"Det Packs",
;967:		3,
;968:		IT_AMMO,
;969:		AMMO_DETPACK,
;970:/* precache */ "",
;971:/* sounds */ ""
;972:	},
;973:
;974:/*QUAKED weapon_thermal (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;975:*/
;976:	{
;977:		"weapon_thermal",
;978:		"sound/weapons/w_pkup.wav",
;979:        { "models/weapons2/thermal/thermal_w.glm", "models/weapons2/thermal/thermal_pu.md3",
;980:		0, 0 },
;981:/* view */		"models/weapons2/thermal/thermal.md3", 
;982:/* icon */		"gfx/hud/w_icon_thermal",
;983:/* pickup *///	"Thermal Detonator",
;984:		4,
;985:		IT_WEAPON,
;986:		WP_THERMAL,
;987:/* precache */ "",
;988:/* sounds */ ""
;989:	},
;990:
;991:/*QUAKED weapon_trip_mine (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;992:*/
;993:	{
;994:		"weapon_trip_mine", 
;995:		"sound/weapons/w_pkup.wav",
;996:        { "models/weapons2/laser_trap/laser_trap_w.glm", "models/weapons2/laser_trap/laser_trap_pu.md3",
;997:		0, 0},
;998:/* view */		"models/weapons2/laser_trap/laser_trap.md3", 
;999:/* icon */		"gfx/hud/w_icon_tripmine",
;1000:/* pickup *///	"Trip Mine",
;1001:		3,
;1002:		IT_WEAPON,
;1003:		WP_TRIP_MINE,
;1004:/* precache */ "",
;1005:/* sounds */ ""
;1006:	},
;1007:
;1008:/*QUAKED weapon_det_pack (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1009:*/
;1010:	{
;1011:		"weapon_det_pack", 
;1012:		"sound/weapons/w_pkup.wav",
;1013:        { "models/weapons2/detpack/det_pack_proj.glm", "models/weapons2/detpack/det_pack_pu.md3", "models/weapons2/detpack/det_pack_w.glm", 0},
;1014:/* view */		"models/weapons2/detpack/det_pack.md3", 
;1015:/* icon */		"gfx/hud/w_icon_detpack",
;1016:/* pickup *///	"Det Pack",
;1017:		3,
;1018:		IT_WEAPON,
;1019:		WP_DET_PACK,
;1020:/* precache */ "",
;1021:/* sounds */ ""
;1022:	},
;1023:
;1024:/*QUAKED weapon_emplaced (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1025:*/
;1026:	{
;1027:		"weapon_emplaced", 
;1028:		"sound/weapons/w_pkup.wav",
;1029:        { "models/weapons2/blaster_r/blaster_w.glm", 
;1030:		0, 0, 0},
;1031:/* view */		"models/weapons2/blaster_r/blaster.md3", 
;1032:/* icon */		"gfx/hud/w_icon_blaster",
;1033:/* pickup *///	"Emplaced Gun",
;1034:		50,
;1035:		IT_WEAPON,
;1036:		WP_EMPLACED_GUN,
;1037:/* precache */ "",
;1038:/* sounds */ ""
;1039:	},
;1040:
;1041:
;1042://NOTE: This is to keep things from messing up because the turret weapon type isn't real
;1043:	{
;1044:		"weapon_turretwp", 
;1045:		"sound/weapons/w_pkup.wav",
;1046:        { "models/weapons2/blaster_r/blaster_w.glm", 
;1047:		0, 0, 0},
;1048:/* view */		"models/weapons2/blaster_r/blaster.md3", 
;1049:/* icon */		"gfx/hud/w_icon_blaster",
;1050:/* pickup *///	"Turret Gun",
;1051:		50,
;1052:		IT_WEAPON,
;1053:		WP_TURRET,
;1054:/* precache */ "",
;1055:/* sounds */ ""
;1056:	},
;1057:
;1058:	//
;1059:	// AMMO ITEMS
;1060:	//
;1061:
;1062:/*QUAKED ammo_force (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1063:Don't place this
;1064:*/
;1065:	{
;1066:		"ammo_force",
;1067:		"sound/player/pickupenergy.wav",
;1068:        { "models/items/energy_cell.md3", 
;1069:		0, 0, 0},
;1070:/* view */		NULL,			
;1071:/* icon */		"gfx/hud/w_icon_blaster",
;1072:/* pickup *///	"Force??",
;1073:		100,
;1074:		IT_AMMO,
;1075:		AMMO_FORCE,
;1076:/* precache */ "",
;1077:/* sounds */ ""
;1078:	},
;1079:
;1080:/*QUAKED ammo_blaster (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1081:Ammo for the Bryar and Blaster pistols.
;1082:*/
;1083:	{
;1084:		"ammo_blaster",
;1085:		"sound/player/pickupenergy.wav",
;1086:        { "models/items/energy_cell.md3", 
;1087:		0, 0, 0},
;1088:/* view */		NULL,			
;1089:/* icon */		"gfx/hud/i_icon_battery",
;1090:/* pickup *///	"Blaster Pack",
;1091:		100,
;1092:		IT_AMMO,
;1093:		AMMO_BLASTER,
;1094:/* precache */ "",
;1095:/* sounds */ ""
;1096:	},
;1097:
;1098:/*QUAKED ammo_powercell (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1099:Ammo for Tenloss Disruptor, Wookie Bowcaster, and the Destructive Electro Magnetic Pulse (demp2 ) guns
;1100:*/
;1101:	{
;1102:		"ammo_powercell",
;1103:		"sound/player/pickupenergy.wav",
;1104:        { "models/items/power_cell.md3", 
;1105:		0, 0, 0},
;1106:/* view */		NULL,			
;1107:/* icon */		"gfx/mp/ammo_power_cell",
;1108:/* pickup *///	"Power Cell",
;1109:		100,
;1110:		IT_AMMO,
;1111:		AMMO_POWERCELL,
;1112:/* precache */ "",
;1113:/* sounds */ ""
;1114:	},
;1115:
;1116:/*QUAKED ammo_metallic_bolts (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1117:Ammo for Imperial Heavy Repeater and the Golan Arms Flechette
;1118:*/
;1119:	{
;1120:		"ammo_metallic_bolts",
;1121:		"sound/player/pickupenergy.wav",
;1122:        { "models/items/metallic_bolts.md3", 
;1123:		0, 0, 0},
;1124:/* view */		NULL,			
;1125:/* icon */		"gfx/mp/ammo_metallic_bolts",
;1126:/* pickup *///	"Metallic Bolts",
;1127:		100,
;1128:		IT_AMMO,
;1129:		AMMO_METAL_BOLTS,
;1130:/* precache */ "",
;1131:/* sounds */ ""
;1132:	},
;1133:
;1134:/*QUAKED ammo_rockets (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1135:Ammo for Merr-Sonn portable missile launcher
;1136:*/
;1137:	{
;1138:		"ammo_rockets",
;1139:		"sound/player/pickupenergy.wav",
;1140:        { "models/items/rockets.md3", 
;1141:		0, 0, 0},
;1142:/* view */		NULL,			
;1143:/* icon */		"gfx/mp/ammo_rockets",
;1144:/* pickup *///	"Rockets",
;1145:		3,
;1146:		IT_AMMO,
;1147:		AMMO_ROCKETS,
;1148:/* precache */ "",
;1149:/* sounds */ ""
;1150:	},
;1151:
;1152:
;1153:	//
;1154:	// POWERUP ITEMS
;1155:	//
;1156:/*QUAKED team_CTF_redflag (1 0 0) (-16 -16 -16) (16 16 16)
;1157:Only in CTF games
;1158:*/
;1159:	{
;1160:		"team_CTF_redflag",
;1161:		NULL,
;1162:        { "models/flags/r_flag.md3",
;1163:		"models/flags/r_flag_ysal.md3", 0, 0 },
;1164:/* view */		NULL,			
;1165:/* icon */		"gfx/hud/mpi_rflag",
;1166:/* pickup *///	"Red Flag",
;1167:		0,
;1168:		IT_TEAM,
;1169:		PW_REDFLAG,
;1170:/* precache */ "",
;1171:/* sounds */ ""
;1172:	},
;1173:
;1174:/*QUAKED team_CTF_blueflag (0 0 1) (-16 -16 -16) (16 16 16)
;1175:Only in CTF games
;1176:*/
;1177:	{
;1178:		"team_CTF_blueflag",
;1179:		NULL,
;1180:        { "models/flags/b_flag.md3",
;1181:		"models/flags/b_flag_ysal.md3", 0, 0 },
;1182:/* view */		NULL,			
;1183:/* icon */		"gfx/hud/mpi_bflag",
;1184:/* pickup *///	"Blue Flag",
;1185:		0,
;1186:		IT_TEAM,
;1187:		PW_BLUEFLAG,
;1188:/* precache */ "",
;1189:/* sounds */ ""
;1190:	},
;1191:
;1192:	//
;1193:	// PERSISTANT POWERUP ITEMS
;1194:	//
;1195:
;1196:	/*QUAKED team_CTF_neutralflag (0 0 1) (-16 -16 -16) (16 16 16)
;1197:Only in One Flag CTF games
;1198:*/
;1199:	{
;1200:		"team_CTF_neutralflag",
;1201:		NULL,
;1202:        { "models/flags/n_flag.md3",
;1203:		0, 0, 0 },
;1204:/* view */		NULL,			
;1205:/* icon */		"icons/iconf_neutral1",
;1206:/* pickup *///	"Neutral Flag",
;1207:		0,
;1208:		IT_TEAM,
;1209:		PW_NEUTRALFLAG,
;1210:/* precache */ "",
;1211:/* sounds */ ""
;1212:	},
;1213:
;1214:	{
;1215:		"item_redcube",
;1216:		"sound/player/pickupenergy.wav",
;1217:        { "models/powerups/orb/r_orb.md3",
;1218:		0, 0, 0 },
;1219:/* view */		NULL,			
;1220:/* icon */		"icons/iconh_rorb",
;1221:/* pickup *///	"Red Cube",
;1222:		0,
;1223:		IT_TEAM,
;1224:		0,
;1225:/* precache */ "",
;1226:/* sounds */ ""
;1227:	},
;1228:
;1229:	{
;1230:		"item_bluecube",
;1231:		"sound/player/pickupenergy.wav",
;1232:        { "models/powerups/orb/b_orb.md3",
;1233:		0, 0, 0 },
;1234:/* view */		NULL,			
;1235:/* icon */		"icons/iconh_borb",
;1236:/* pickup *///	"Blue Cube",
;1237:		0,
;1238:		IT_TEAM,
;1239:		0,
;1240:/* precache */ "",
;1241:/* sounds */ ""
;1242:	},
;1243:
;1244:	// end of list marker
;1245:	{NULL}
;1246:};
;1247:
;1248:int		bg_numItems = sizeof(bg_itemlist) / sizeof(bg_itemlist[0]) - 1;
;1249:
;1250:float vectoyaw( const vec3_t vec ) {
line 1253
;1251:	float	yaw;
;1252:	
;1253:	if (vec[YAW] == 0 && vec[PITCH] == 0) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $401
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $401
line 1254
;1254:		yaw = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1255
;1255:	} else {
ADDRGP4 $402
JUMPV
LABELV $401
line 1256
;1256:		if (vec[PITCH]) {
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 0
EQF4 $403
line 1257
;1257:			yaw = ( atan2( vec[YAW], vec[PITCH]) * 180 / M_PI );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1127481344
ADDRLP4 16
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 1258
;1258:		} else if (vec[YAW] > 0) {
ADDRGP4 $404
JUMPV
LABELV $403
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 0
LEF4 $405
line 1259
;1259:			yaw = 90;
ADDRLP4 0
CNSTF4 1119092736
ASGNF4
line 1260
;1260:		} else {
ADDRGP4 $406
JUMPV
LABELV $405
line 1261
;1261:			yaw = 270;
ADDRLP4 0
CNSTF4 1132920832
ASGNF4
line 1262
;1262:		}
LABELV $406
LABELV $404
line 1263
;1263:		if (yaw < 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $407
line 1264
;1264:			yaw += 360;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 1265
;1265:		}
LABELV $407
line 1266
;1266:	}
LABELV $402
line 1268
;1267:
;1268:	return yaw;
ADDRLP4 0
INDIRF4
RETF4
LABELV $400
endproc vectoyaw 20 8
export BG_HasYsalamiri
proc BG_HasYsalamiri 8 0
line 1272
;1269:}
;1270:
;1271:qboolean BG_HasYsalamiri(int gametype, playerState_t *ps)
;1272:{
line 1273
;1273:	if (gametype == GT_CTY &&
ADDRFP4 0
INDIRI4
CNSTI4 8
NEI4 $410
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $412
ADDRLP4 0
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $410
LABELV $412
line 1275
;1274:		(ps->powerups[PW_REDFLAG] || ps->powerups[PW_BLUEFLAG]))
;1275:	{
line 1276
;1276:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $409
JUMPV
LABELV $410
line 1279
;1277:	}
;1278:
;1279:	if (ps->powerups[PW_YSALAMIRI])
ADDRFP4 4
INDIRP4
CNSTI4 404
ADDP4
INDIRI4
CNSTI4 0
EQI4 $413
line 1280
;1280:	{
line 1281
;1281:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $409
JUMPV
LABELV $413
line 1284
;1282:	}
;1283:
;1284:	return qfalse;
CNSTI4 0
RETI4
LABELV $409
endproc BG_HasYsalamiri 8 0
export BG_CanUseFPNow
proc BG_CanUseFPNow 16 8
line 1288
;1285:}
;1286:
;1287:qboolean BG_CanUseFPNow(int gametype, playerState_t *ps, int time, forcePowers_t power)
;1288:{
line 1289
;1289:	if (BG_HasYsalamiri(gametype, ps))
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $416
line 1290
;1290:	{
line 1291
;1291:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $415
JUMPV
LABELV $416
line 1294
;1292:	}
;1293:
;1294:	if ( ps->forceRestricted || ps->trueNonJedi )
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 608
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $420
ADDRLP4 4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $418
LABELV $420
line 1295
;1295:	{
line 1296
;1296:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $415
JUMPV
LABELV $418
line 1299
;1297:	}
;1298:
;1299:	if (ps->duelInProgress)
ADDRFP4 4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $421
line 1300
;1300:	{
line 1301
;1301:		if (power != FP_SABERATTACK && power != FP_SABERDEFEND && /*power != FP_SABERTHROW &&*/
ADDRLP4 12
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 15
EQI4 $423
ADDRLP4 12
INDIRI4
CNSTI4 16
EQI4 $423
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $423
line 1303
;1302:			power != FP_LEVITATION)
;1303:		{
line 1304
;1304:			if (!ps->saberLockFrame || power != FP_PUSH)
ADDRFP4 4
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
EQI4 $427
ADDRFP4 12
INDIRI4
CNSTI4 3
EQI4 $425
LABELV $427
line 1305
;1305:			{
line 1306
;1306:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $415
JUMPV
LABELV $425
line 1308
;1307:			}
;1308:		}
LABELV $423
line 1309
;1309:	}
LABELV $421
line 1311
;1310:
;1311:	if (ps->saberLockFrame || ps->saberLockTime > time)
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
NEI4 $430
ADDRLP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $428
LABELV $430
line 1312
;1312:	{
line 1313
;1313:		if (power != FP_PUSH)
ADDRFP4 12
INDIRI4
CNSTI4 3
EQI4 $431
line 1314
;1314:		{
line 1315
;1315:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $415
JUMPV
LABELV $431
line 1317
;1316:		}
;1317:	}
LABELV $428
line 1319
;1318:
;1319:	if (ps->fallingToDeath)
ADDRFP4 4
INDIRP4
CNSTI4 1352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $433
line 1320
;1320:	{
line 1321
;1321:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $415
JUMPV
LABELV $433
line 1324
;1322:	}
;1323:
;1324:	return qtrue;
CNSTI4 1
RETI4
LABELV $415
endproc BG_CanUseFPNow 16 8
export BG_FindItemForPowerup
proc BG_FindItemForPowerup 8 0
line 1332
;1325:}
;1326:
;1327:/*
;1328:==============
;1329:BG_FindItemForPowerup
;1330:==============
;1331:*/
;1332:gitem_t	*BG_FindItemForPowerup( powerup_t pw ) {
line 1335
;1333:	int		i;
;1334:
;1335:	for ( i = 0 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $439
JUMPV
LABELV $436
line 1336
;1336:		if ( (bg_itemlist[i].giType == IT_POWERUP || 
ADDRLP4 4
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 5
EQI4 $445
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $440
LABELV $445
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $440
line 1338
;1337:					bg_itemlist[i].giType == IT_TEAM) && 
;1338:			bg_itemlist[i].giTag == pw ) {
line 1339
;1339:			return &bg_itemlist[i];
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
RETP4
ADDRGP4 $435
JUMPV
LABELV $440
line 1341
;1340:		}
;1341:	}
LABELV $437
line 1335
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $439
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $436
line 1343
;1342:
;1343:	return NULL;
CNSTP4 0
RETP4
LABELV $435
endproc BG_FindItemForPowerup 8 0
export BG_FindItemForHoldable
proc BG_FindItemForHoldable 8 8
line 1352
;1344:}
;1345:
;1346:
;1347:/*
;1348:==============
;1349:BG_FindItemForHoldable
;1350:==============
;1351:*/
;1352:gitem_t	*BG_FindItemForHoldable( holdable_t pw ) {
line 1355
;1353:	int		i;
;1354:
;1355:	for ( i = 0 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $450
JUMPV
LABELV $447
line 1356
;1356:		if ( bg_itemlist[i].giType == IT_HOLDABLE && bg_itemlist[i].giTag == pw ) {
ADDRLP4 4
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $451
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $451
line 1357
;1357:			return &bg_itemlist[i];
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
RETP4
ADDRGP4 $446
JUMPV
LABELV $451
line 1359
;1358:		}
;1359:	}
LABELV $448
line 1355
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $450
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $447
line 1361
;1360:
;1361:	Com_Error( ERR_DROP, "HoldableItem not found" );
CNSTI4 1
ARGI4
ADDRGP4 $455
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1363
;1362:
;1363:	return NULL;
CNSTP4 0
RETP4
LABELV $446
endproc BG_FindItemForHoldable 8 8
export BG_FindItemForWeapon
proc BG_FindItemForWeapon 8 12
line 1373
;1364:}
;1365:
;1366:
;1367:/*
;1368:===============
;1369:BG_FindItemForWeapon
;1370:
;1371:===============
;1372:*/
;1373:gitem_t	*BG_FindItemForWeapon( weapon_t weapon ) {
line 1376
;1374:	gitem_t	*it;
;1375:	
;1376:	for ( it = bg_itemlist + 1 ; it->classname ; it++) {
ADDRLP4 0
ADDRGP4 bg_itemlist+52
ASGNP4
ADDRGP4 $460
JUMPV
LABELV $457
line 1377
;1377:		if ( it->giType == IT_WEAPON && it->giTag == weapon ) {
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $462
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $462
line 1378
;1378:			return it;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $456
JUMPV
LABELV $462
line 1380
;1379:		}
;1380:	}
LABELV $458
line 1376
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
LABELV $460
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $457
line 1382
;1381:
;1382:	Com_Error( ERR_DROP, "Couldn't find item for weapon %i", weapon);
CNSTI4 1
ARGI4
ADDRGP4 $464
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 1383
;1383:	return NULL;
CNSTP4 0
RETP4
LABELV $456
endproc BG_FindItemForWeapon 8 12
export BG_FindItem
proc BG_FindItem 8 8
line 1392
;1384:}
;1385:
;1386:/*
;1387:===============
;1388:BG_FindItem
;1389:
;1390:===============
;1391:*/
;1392:gitem_t	*BG_FindItem( const char *classname ) {
line 1395
;1393:	gitem_t	*it;
;1394:	
;1395:	for ( it = bg_itemlist + 1 ; it->classname ; it++ ) {
ADDRLP4 0
ADDRGP4 bg_itemlist+52
ASGNP4
ADDRGP4 $469
JUMPV
LABELV $466
line 1396
;1396:		if ( !Q_stricmp( it->classname, classname) )
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $471
line 1397
;1397:			return it;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $465
JUMPV
LABELV $471
line 1398
;1398:	}
LABELV $467
line 1395
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
LABELV $469
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $466
line 1400
;1399:
;1400:	return NULL;
CNSTP4 0
RETP4
LABELV $465
endproc BG_FindItem 8 8
export BG_PlayerTouchesItem
proc BG_PlayerTouchesItem 36 12
line 1411
;1401:}
;1402:
;1403:/*
;1404:============
;1405:BG_PlayerTouchesItem
;1406:
;1407:Items can be picked up without actually touching their physical bounds to make
;1408:grabbing them easier
;1409:============
;1410:*/
;1411:qboolean	BG_PlayerTouchesItem( playerState_t *ps, entityState_t *item, int atTime ) {
line 1414
;1412:	vec3_t		origin;
;1413:
;1414:	BG_EvaluateTrajectory( &item->pos, atTime, origin );
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1417
;1415:
;1416:	// we are ignoring ducked differences here
;1417:	if ( ps->origin[0] - origin[0] > 44
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16
INDIRF4
CNSTF4 1110441984
GTF4 $484
ADDRLP4 16
INDIRF4
CNSTF4 3259498496
LTF4 $484
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
ADDRLP4 24
CNSTF4 1108344832
ASGNF4
ADDRLP4 20
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ADDRLP4 24
INDIRF4
GTF4 $484
ADDRLP4 28
CNSTF4 3255828480
ASGNF4
ADDRLP4 20
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ADDRLP4 28
INDIRF4
LTF4 $484
ADDRLP4 32
ADDRLP4 12
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ADDRLP4 24
INDIRF4
GTF4 $484
ADDRLP4 32
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ADDRLP4 28
INDIRF4
GEF4 $474
LABELV $484
line 1422
;1418:		|| ps->origin[0] - origin[0] < -50
;1419:		|| ps->origin[1] - origin[1] > 36
;1420:		|| ps->origin[1] - origin[1] < -36
;1421:		|| ps->origin[2] - origin[2] > 36
;1422:		|| ps->origin[2] - origin[2] < -36 ) {
line 1423
;1423:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $473
JUMPV
LABELV $474
line 1426
;1424:	}
;1425:
;1426:	return qtrue;
CNSTI4 1
RETI4
LABELV $473
endproc BG_PlayerTouchesItem 36 12
export BG_ProperForceIndex
proc BG_ProperForceIndex 4 0
line 1430
;1427:}
;1428:
;1429:int BG_ProperForceIndex(int power)
;1430:{
line 1431
;1431:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $487
JUMPV
LABELV $486
line 1434
;1432:
;1433:	while (i < NUM_FORCE_POWERS)
;1434:	{
line 1435
;1435:		if (forcePowerSorted[i] == power)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forcePowerSorted
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $489
line 1436
;1436:		{
line 1437
;1437:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $485
JUMPV
LABELV $489
line 1440
;1438:		}
;1439:
;1440:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1441
;1441:	}
LABELV $487
line 1433
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $486
line 1443
;1442:
;1443:	return -1;
CNSTI4 -1
RETI4
LABELV $485
endproc BG_ProperForceIndex 4 0
export BG_CycleForce
proc BG_CycleForce 40 4
line 1447
;1444:}
;1445:
;1446:void BG_CycleForce(playerState_t *ps, int direction)
;1447:{
line 1448
;1448:	int i = ps->fd.forcePowerSelected;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ASGNI4
line 1449
;1449:	int x = i;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1450
;1450:	int presel = i;
ADDRLP4 8
ADDRLP4 4
INDIRI4
ASGNI4
line 1451
;1451:	int foundnext = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 1453
;1452:
;1453:	if (!ps->fd.forcePowersKnown & (1 << x) ||
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 0
NEI4 $496
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $497
JUMPV
LABELV $496
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $497
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $498
ADDRLP4 0
INDIRI4
CNSTI4 18
GEI4 $498
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $492
LABELV $498
line 1456
;1454:		x >= NUM_FORCE_POWERS ||
;1455:		x == -1)
;1456:	{ //apparently we have no valid force powers
line 1457
;1457:		return;
ADDRGP4 $491
JUMPV
LABELV $492
line 1460
;1458:	}
;1459:
;1460:	x = BG_ProperForceIndex(x);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_ProperForceIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 1461
;1461:	presel = x;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 1463
;1462:
;1463:	if (direction == 1)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $499
line 1464
;1464:	{ //get the next power
line 1465
;1465:		x++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1466
;1466:	}
ADDRGP4 $500
JUMPV
LABELV $499
line 1468
;1467:	else
;1468:	{ //get the previous power
line 1469
;1469:		x--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1470
;1470:	}
LABELV $500
line 1472
;1471:
;1472:	if (x >= NUM_FORCE_POWERS)
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $501
line 1473
;1473:	{ //cycled off the end.. cycle around to the first
line 1474
;1474:		x = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1475
;1475:	}
LABELV $501
line 1476
;1476:	if (x < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $503
line 1477
;1477:	{ //cycled off the beginning.. cycle around to the last
line 1478
;1478:		x = NUM_FORCE_POWERS-1;
ADDRLP4 0
CNSTI4 17
ASGNI4
line 1479
;1479:	}
LABELV $503
line 1481
;1480:
;1481:	i = forcePowerSorted[x]; //the "sorted" value of this power
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forcePowerSorted
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $506
JUMPV
LABELV $505
line 1484
;1482:
;1483:	while (x != presel)
;1484:	{ //loop around to the current force power
line 1485
;1485:		if (ps->fd.forcePowersKnown & (1 << i) && i != ps->fd.forcePowerSelected)
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $508
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
EQI4 $508
line 1486
;1486:		{ //we have the force power
line 1487
;1487:			if (i != FP_LEVITATION &&
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $510
ADDRLP4 4
INDIRI4
CNSTI4 15
EQI4 $510
ADDRLP4 4
INDIRI4
CNSTI4 16
EQI4 $510
ADDRLP4 4
INDIRI4
CNSTI4 17
EQI4 $510
line 1491
;1488:				i != FP_SABERATTACK &&
;1489:				i != FP_SABERDEFEND &&
;1490:				i != FP_SABERTHROW)
;1491:			{ //it's selectable
line 1492
;1492:				foundnext = i;
ADDRLP4 12
ADDRLP4 4
INDIRI4
ASGNI4
line 1493
;1493:				break;
ADDRGP4 $507
JUMPV
LABELV $510
line 1495
;1494:			}
;1495:		}
LABELV $508
line 1497
;1496:
;1497:		if (direction == 1)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $512
line 1498
;1498:		{ //next
line 1499
;1499:			x++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1500
;1500:		}
ADDRGP4 $513
JUMPV
LABELV $512
line 1502
;1501:		else
;1502:		{ //previous
line 1503
;1503:			x--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1504
;1504:		}
LABELV $513
line 1506
;1505:	
;1506:		if (x >= NUM_FORCE_POWERS)
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $514
line 1507
;1507:		{ //loop around
line 1508
;1508:			x = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1509
;1509:		}
LABELV $514
line 1510
;1510:		if (x < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $516
line 1511
;1511:		{ //loop around
line 1512
;1512:			x = NUM_FORCE_POWERS-1;
ADDRLP4 0
CNSTI4 17
ASGNI4
line 1513
;1513:		}
LABELV $516
line 1515
;1514:
;1515:		i = forcePowerSorted[x]; //set to the sorted value again
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forcePowerSorted
ADDP4
INDIRI4
ASGNI4
line 1516
;1516:	}
LABELV $506
line 1483
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $505
LABELV $507
line 1518
;1517:
;1518:	if (foundnext != -1)
ADDRLP4 12
INDIRI4
CNSTI4 -1
EQI4 $518
line 1519
;1519:	{ //found one, select it
line 1520
;1520:		ps->fd.forcePowerSelected = foundnext;
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1521
;1521:	}
LABELV $518
line 1522
;1522:}
LABELV $491
endproc BG_CycleForce 40 4
export BG_GetItemIndexByTag
proc BG_GetItemIndexByTag 8 0
line 1525
;1523:
;1524:int BG_GetItemIndexByTag(int tag, int type)
;1525:{ //Get the itemlist index from the tag and type
line 1526
;1526:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $522
JUMPV
LABELV $521
line 1529
;1527:
;1528:	while (i < bg_numItems)
;1529:	{
line 1530
;1530:		if (bg_itemlist[i].giTag == tag &&
ADDRLP4 4
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $524
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $524
line 1532
;1531:			bg_itemlist[i].giType == type)
;1532:		{
line 1533
;1533:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $520
JUMPV
LABELV $524
line 1536
;1534:		}
;1535:
;1536:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1537
;1537:	}
LABELV $522
line 1528
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $521
line 1539
;1538:
;1539:	return 0;
CNSTI4 0
RETI4
LABELV $520
endproc BG_GetItemIndexByTag 8 0
export BG_CycleInven
proc BG_CycleInven 12 8
line 1543
;1540:}
;1541:
;1542:void BG_CycleInven(playerState_t *ps, int direction)
;1543:{
line 1547
;1544:	int i;
;1545:	int original;
;1546:
;1547:	i = bg_itemlist[ps->stats[STAT_HOLDABLE_ITEM]].giTag;
ADDRLP4 0
CNSTI4 52
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 1548
;1548:	original = i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 1550
;1549:
;1550:	if (direction == 1)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $530
line 1551
;1551:	{ //next
line 1552
;1552:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1553
;1553:	}
ADDRGP4 $533
JUMPV
LABELV $530
line 1555
;1554:	else
;1555:	{ //previous
line 1556
;1556:		i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1557
;1557:	}
ADDRGP4 $533
JUMPV
LABELV $532
line 1560
;1558:
;1559:	while (i != original)
;1560:	{ //go in a full loop until hitting something, if hit nothing then select nothing
line 1561
;1561:		if (ps->stats[STAT_HOLDABLE_ITEMS] & (1 << i))
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $535
line 1562
;1562:		{ //we have it, select it.
line 1563
;1563:			ps->stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(i, IT_HOLDABLE);
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 8
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1564
;1564:			break;
ADDRGP4 $534
JUMPV
LABELV $535
line 1567
;1565:		}
;1566:
;1567:		if (direction == 1)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $537
line 1568
;1568:		{ //next
line 1569
;1569:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1570
;1570:		}
ADDRGP4 $538
JUMPV
LABELV $537
line 1572
;1571:		else
;1572:		{ //previous
line 1573
;1573:			i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1574
;1574:		}
LABELV $538
line 1576
;1575:
;1576:		if (i < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $539
line 1577
;1577:		{ //wrap around to the last
line 1578
;1578:			i = HI_NUM_HOLDABLE;
ADDRLP4 0
CNSTI4 7
ASGNI4
line 1579
;1579:		}
ADDRGP4 $540
JUMPV
LABELV $539
line 1580
;1580:		else if (i >= HI_NUM_HOLDABLE)
ADDRLP4 0
INDIRI4
CNSTI4 7
LTI4 $541
line 1581
;1581:		{ //wrap around to the first
line 1582
;1582:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1583
;1583:		}
LABELV $541
LABELV $540
line 1584
;1584:	}
LABELV $533
line 1559
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $532
LABELV $534
line 1585
;1585:}
LABELV $528
endproc BG_CycleInven 12 8
export BG_CanItemBeGrabbed
proc BG_CanItemBeGrabbed 56 8
line 1595
;1586:
;1587:/*
;1588:================
;1589:BG_CanItemBeGrabbed
;1590:
;1591:Returns false if the item should not be picked up.
;1592:This needs to be the same for client side prediction and server use.
;1593:================
;1594:*/
;1595:qboolean BG_CanItemBeGrabbed( int gametype, const entityState_t *ent, const playerState_t *ps ) {
line 1598
;1596:	gitem_t	*item;
;1597:
;1598:	if ( ent->modelindex < 1 || ent->modelindex >= bg_numItems ) {
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $546
ADDRLP4 4
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $544
LABELV $546
line 1599
;1599:		Com_Error( ERR_DROP, "BG_CanItemBeGrabbed: index out of range" );
CNSTI4 1
ARGI4
ADDRGP4 $547
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1600
;1600:	}
LABELV $544
line 1602
;1601:
;1602:	item = &bg_itemlist[ent->modelindex];
ADDRLP4 0
CNSTI4 52
ADDRFP4 4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 1604
;1603:
;1604:	if ( ps )
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $548
line 1605
;1605:	{
line 1606
;1606:		if ( ps->trueJedi )
ADDRFP4 8
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $550
line 1607
;1607:		{//force powers and saber only
line 1608
;1608:			if ( item->giType != IT_TEAM //not a flag
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 8
EQI4 $551
ADDRLP4 12
INDIRI4
CNSTI4 3
EQI4 $551
ADDRLP4 12
INDIRI4
CNSTI4 1
NEI4 $554
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
EQI4 $551
LABELV $554
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $555
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 1
EQI4 $551
LABELV $555
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $556
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 15
NEI4 $551
LABELV $556
line 1613
;1609:				&& item->giType != IT_ARMOR//not shields
;1610:				&& (item->giType != IT_WEAPON || item->giTag != WP_SABER)//not a saber
;1611:				&& (item->giType != IT_HOLDABLE || item->giTag != HI_SEEKER)//not a seeker
;1612:				&& (item->giType != IT_POWERUP || item->giTag == PW_YSALAMIRI) )//not a force pick-up
;1613:			{
line 1614
;1614:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
line 1616
;1615:			}
;1616:		}
LABELV $550
line 1617
;1617:		else if ( ps->trueNonJedi )
ADDRFP4 8
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 0
EQI4 $557
line 1618
;1618:		{//can't pick up force powerups
line 1619
;1619:			if ( (item->giType == IT_POWERUP && item->giTag != PW_YSALAMIRI) //if a powerup, can only can pick up ysalamiri
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $562
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 15
NEI4 $563
LABELV $562
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $564
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 1
EQI4 $563
LABELV $564
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $559
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
NEI4 $559
LABELV $563
line 1622
;1620:				|| (item->giType == IT_HOLDABLE && item->giTag == HI_SEEKER)//if holdable, cannot pick up seeker 
;1621:				|| (item->giType == IT_WEAPON && item->giTag == WP_SABER ) )//or if it's a saber
;1622:			{
line 1623
;1623:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
LABELV $559
line 1625
;1624:			}
;1625:		}
LABELV $557
LABELV $551
line 1626
;1626:		if ( ps->isJediMaster && item && (item->giType == IT_WEAPON || item->giType == IT_AMMO))
ADDRFP4 8
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $565
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $565
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $567
ADDRLP4 12
INDIRI4
CNSTI4 2
NEI4 $565
LABELV $567
line 1627
;1627:		{//jedi master cannot pick up weapons
line 1628
;1628:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
LABELV $565
line 1630
;1629:		}
;1630:		if ( ps->duelInProgress )
ADDRFP4 8
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $549
line 1631
;1631:		{ //no picking stuff up while in a duel, no matter what the type is
line 1632
;1632:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
line 1634
;1633:		}
;1634:	}
LABELV $548
line 1636
;1635:	else
;1636:	{//safety return since below code assumes a non-null ps
line 1637
;1637:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
LABELV $549
line 1640
;1638:	}
;1639:
;1640:	switch( item->giType ) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $571
ADDRLP4 8
INDIRI4
CNSTI4 8
GTI4 $571
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $622
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $622
address $620
address $573
address $578
address $581
address $584
address $594
address $617
address $571
address $599
code
LABELV $573
line 1642
;1641:	case IT_WEAPON:
;1642:		if (ent->generic1 == ps->clientNum && ent->powerups)
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
NEI4 $574
ADDRLP4 16
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 0
EQI4 $574
line 1643
;1643:		{
line 1644
;1644:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
LABELV $574
line 1646
;1645:		}
;1646:		if (!(ent->eFlags & EF_DROPPEDWEAPON) && (ps->stats[STAT_WEAPONS] & (1 << item->giTag)) &&
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16777216
BANDI4
ADDRLP4 20
INDIRI4
NEI4 $576
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 24
INDIRI4
LSHI4
BANDI4
ADDRLP4 20
INDIRI4
EQI4 $576
ADDRLP4 24
INDIRI4
CNSTI4 11
EQI4 $576
ADDRLP4 24
INDIRI4
CNSTI4 12
EQI4 $576
ADDRLP4 24
INDIRI4
CNSTI4 13
EQI4 $576
line 1648
;1647:			item->giTag != WP_THERMAL && item->giTag != WP_TRIP_MINE && item->giTag != WP_DET_PACK)
;1648:		{ //weaponstay stuff.. if this isn't dropped, and you already have it, you don't get it.
line 1649
;1649:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
LABELV $576
line 1651
;1650:		}
;1651:		return qtrue;	// weapons are always picked up
CNSTI4 1
RETI4
ADDRGP4 $543
JUMPV
LABELV $578
line 1654
;1652:
;1653:	case IT_AMMO:
;1654:		if ( ps->ammo[item->giTag] >= ammoData[item->giTag].max) {
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
ADDRGP4 ammoData
ADDP4
INDIRI4
LTI4 $579
line 1655
;1655:			return qfalse;		// can't hold any more
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
LABELV $579
line 1657
;1656:		}
;1657:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $543
JUMPV
LABELV $581
line 1660
;1658:
;1659:	case IT_ARMOR:
;1660:		if ( ps->stats[STAT_ARMOR] >= ps->stats[STAT_MAX_HEALTH] * item->giTag ) {
ADDRLP4 32
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
MULI4
LTI4 $582
line 1661
;1661:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
LABELV $582
line 1663
;1662:		}
;1663:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $543
JUMPV
LABELV $584
line 1668
;1664:
;1665:	case IT_HEALTH:
;1666:		// small and mega healths will go over the max, otherwise
;1667:		// don't pick up if already at max
;1668:		if ((ps->fd.forcePowersActive & (1 << FP_RAGE)))
ADDRFP4 8
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $585
line 1669
;1669:		{
line 1670
;1670:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
LABELV $585
line 1673
;1671:		}
;1672:
;1673:		if ( item->quantity == 5 || item->quantity == 100 ) {
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 5
EQI4 $589
ADDRLP4 36
INDIRI4
CNSTI4 100
NEI4 $587
LABELV $589
line 1674
;1674:			if ( ps->stats[STAT_HEALTH] >= ps->stats[STAT_MAX_HEALTH] * 2 ) {
ADDRLP4 40
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
LSHI4
LTI4 $590
line 1675
;1675:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
LABELV $590
line 1677
;1676:			}
;1677:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $543
JUMPV
LABELV $587
line 1680
;1678:		}
;1679:
;1680:		if ( ps->stats[STAT_HEALTH] >= ps->stats[STAT_MAX_HEALTH] ) {
ADDRLP4 40
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LTI4 $592
line 1681
;1681:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
LABELV $592
line 1683
;1682:		}
;1683:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $543
JUMPV
LABELV $594
line 1686
;1684:
;1685:	case IT_POWERUP:
;1686:		if (ps && (ps->powerups[PW_YSALAMIRI]))
ADDRLP4 44
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $595
ADDRLP4 44
INDIRP4
CNSTI4 404
ADDP4
INDIRI4
CNSTI4 0
EQI4 $595
line 1687
;1687:		{
line 1688
;1688:			if (item->giTag != PW_YSALAMIRI)
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 15
EQI4 $597
line 1689
;1689:			{
line 1690
;1690:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
LABELV $597
line 1692
;1691:			}
;1692:		}
LABELV $595
line 1693
;1693:		return qtrue;	// powerups are always picked up
CNSTI4 1
RETI4
ADDRGP4 $543
JUMPV
LABELV $599
line 1696
;1694:
;1695:	case IT_TEAM: // team items, such as flags
;1696:		if( gametype == GT_CTF || gametype == GT_CTY ) {
ADDRLP4 48
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 7
EQI4 $602
ADDRLP4 48
INDIRI4
CNSTI4 8
NEI4 $600
LABELV $602
line 1700
;1697:			// ent->modelindex2 is non-zero on items if they are dropped
;1698:			// we need to know this because we can pick up our dropped flag (and return it)
;1699:			// but we can't pick up our flag at base
;1700:			if (ps->persistant[PERS_TEAM] == TEAM_RED) {
ADDRFP4 8
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 1
NEI4 $603
line 1701
;1701:				if (item->giTag == PW_BLUEFLAG ||
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 5
EQI4 $608
ADDRLP4 52
INDIRI4
CNSTI4 4
NEI4 $609
ADDRFP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
NEI4 $608
LABELV $609
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 4
NEI4 $604
ADDRFP4 8
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $604
LABELV $608
line 1704
;1702:					(item->giTag == PW_REDFLAG && ent->modelindex2) ||
;1703:					(item->giTag == PW_REDFLAG && ps->powerups[PW_BLUEFLAG]) )
;1704:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $543
JUMPV
line 1705
;1705:			} else if (ps->persistant[PERS_TEAM] == TEAM_BLUE) {
LABELV $603
ADDRFP4 8
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 2
NEI4 $610
line 1706
;1706:				if (item->giTag == PW_REDFLAG ||
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 4
EQI4 $615
ADDRLP4 52
INDIRI4
CNSTI4 5
NEI4 $616
ADDRFP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
NEI4 $615
LABELV $616
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 5
NEI4 $612
ADDRFP4 8
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
CNSTI4 0
EQI4 $612
LABELV $615
line 1709
;1707:					(item->giTag == PW_BLUEFLAG && ent->modelindex2) ||
;1708:					(item->giTag == PW_BLUEFLAG && ps->powerups[PW_REDFLAG]) )
;1709:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $543
JUMPV
LABELV $612
line 1710
;1710:			}
LABELV $610
LABELV $604
line 1711
;1711:		}
LABELV $600
line 1713
;1712:
;1713:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
LABELV $617
line 1716
;1714:
;1715:	case IT_HOLDABLE:
;1716:		if ( ps->stats[STAT_HOLDABLE_ITEMS] & (1 << item->giTag))
ADDRFP4 8
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $618
line 1717
;1717:		{
line 1718
;1718:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $543
JUMPV
LABELV $618
line 1720
;1719:		}
;1720:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $543
JUMPV
LABELV $620
line 1723
;1721:
;1722:        case IT_BAD:
;1723:            Com_Error( ERR_DROP, "BG_CanItemBeGrabbed: IT_BAD" );
CNSTI4 1
ARGI4
ADDRGP4 $621
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1730
;1724:        default:
;1725:#ifndef Q3_VM
;1726:#ifndef NDEBUG // bk0001204
;1727:          Com_Printf("BG_CanItemBeGrabbed: unknown enum %d\n", item->giType );
;1728:#endif
;1729:#endif
;1730:         break;
LABELV $571
line 1733
;1731:	}
;1732:
;1733:	return qfalse;
CNSTI4 0
RETI4
LABELV $543
endproc BG_CanItemBeGrabbed 56 8
export BG_EvaluateTrajectory
proc BG_EvaluateTrajectory 84 12
line 1744
;1734:}
;1735:
;1736://======================================================================
;1737:
;1738:/*
;1739:================
;1740:BG_EvaluateTrajectory
;1741:
;1742:================
;1743:*/
;1744:void BG_EvaluateTrajectory( const trajectory_t *tr, int atTime, vec3_t result ) {
line 1748
;1745:	float		deltaTime;
;1746:	float		phase;
;1747:
;1748:	switch( tr->trType ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $624
ADDRLP4 8
INDIRI4
CNSTI4 5
GTI4 $624
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $637
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $637
address $627
address $627
address $628
address $630
address $629
address $635
code
LABELV $627
line 1751
;1749:	case TR_STATIONARY:
;1750:	case TR_INTERPOLATE:
;1751:		VectorCopy( tr->trBase, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1752
;1752:		break;
ADDRGP4 $625
JUMPV
LABELV $628
line 1754
;1753:	case TR_LINEAR:
;1754:		deltaTime = ( atTime - tr->trTime ) * 0.001;	// milliseconds to seconds
ADDRLP4 0
CNSTF4 981668463
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 1755
;1755:		VectorMA( tr->trBase, deltaTime, tr->trDelta, result );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 1756
;1756:		break;
ADDRGP4 $625
JUMPV
LABELV $629
line 1758
;1757:	case TR_SINE:
;1758:		deltaTime = ( atTime - tr->trTime ) / (float) tr->trDuration;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRFP4 4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1759
;1759:		phase = sin( deltaTime * M_PI * 2 );
CNSTF4 1073741824
CNSTF4 1078530011
ADDRLP4 0
INDIRF4
MULF4
MULF4
ARGF4
ADDRLP4 32
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 32
INDIRF4
ASGNF4
line 1760
;1760:		VectorMA( tr->trBase, phase, tr->trDelta, result );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 36
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1761
;1761:		break;
ADDRGP4 $625
JUMPV
LABELV $630
line 1763
;1762:	case TR_LINEAR_STOP:
;1763:		if ( atTime > tr->trTime + tr->trDuration ) {
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
LEI4 $631
line 1764
;1764:			atTime = tr->trTime + tr->trDuration;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1765
;1765:		}
LABELV $631
line 1766
;1766:		deltaTime = ( atTime - tr->trTime ) * 0.001;	// milliseconds to seconds
ADDRLP4 0
CNSTF4 981668463
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 1767
;1767:		if ( deltaTime < 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $633
line 1768
;1768:			deltaTime = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1769
;1769:		}
LABELV $633
line 1770
;1770:		VectorMA( tr->trBase, deltaTime, tr->trDelta, result );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 52
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 1771
;1771:		break;
ADDRGP4 $625
JUMPV
LABELV $635
line 1773
;1772:	case TR_GRAVITY:
;1773:		deltaTime = ( atTime - tr->trTime ) * 0.001;	// milliseconds to seconds
ADDRLP4 0
CNSTF4 981668463
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 1774
;1774:		VectorMA( tr->trBase, deltaTime, tr->trDelta, result );
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 64
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 1775
;1775:		result[2] -= 0.5 * DEFAULT_GRAVITY * deltaTime * deltaTime;		// FIXME: local gravity...
ADDRLP4 76
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 80
ADDRLP4 0
INDIRF4
ASGNF4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
CNSTF4 1137180672
ADDRLP4 80
INDIRF4
MULF4
ADDRLP4 80
INDIRF4
MULF4
SUBF4
ASGNF4
line 1776
;1776:		break;
ADDRGP4 $625
JUMPV
LABELV $624
line 1781
;1777:	default:
;1778:#ifdef QAGAME
;1779:		Com_Error( ERR_DROP, "BG_EvaluateTrajectory: [GAME SIDE] unknown trType: %i", tr->trType );
;1780:#else
;1781:		Com_Error( ERR_DROP, "BG_EvaluateTrajectory: [CLIENTGAME SIDE] unknown trType: %i", tr->trType );
CNSTI4 1
ARGI4
ADDRGP4 $636
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 1783
;1782:#endif
;1783:		break;
LABELV $625
line 1785
;1784:	}
;1785:}
LABELV $623
endproc BG_EvaluateTrajectory 84 12
export BG_EvaluateTrajectoryDelta
proc BG_EvaluateTrajectoryDelta 44 12
line 1794
;1786:
;1787:/*
;1788:================
;1789:BG_EvaluateTrajectoryDelta
;1790:
;1791:For determining velocity at a given time
;1792:================
;1793:*/
;1794:void BG_EvaluateTrajectoryDelta( const trajectory_t *tr, int atTime, vec3_t result ) {
line 1798
;1795:	float	deltaTime;
;1796:	float	phase;
;1797:
;1798:	switch( tr->trType ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $639
ADDRLP4 8
INDIRI4
CNSTI4 5
GTI4 $639
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $650
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $650
address $642
address $642
address $643
address $645
address $644
address $648
code
LABELV $642
line 1801
;1799:	case TR_STATIONARY:
;1800:	case TR_INTERPOLATE:
;1801:		VectorClear( result );
ADDRLP4 16
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRF4
ASGNF4
line 1802
;1802:		break;
ADDRGP4 $640
JUMPV
LABELV $643
line 1804
;1803:	case TR_LINEAR:
;1804:		VectorCopy( tr->trDelta, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1805
;1805:		break;
ADDRGP4 $640
JUMPV
LABELV $644
line 1807
;1806:	case TR_SINE:
;1807:		deltaTime = ( atTime - tr->trTime ) / (float) tr->trDuration;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRFP4 4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1808
;1808:		phase = cos( deltaTime * M_PI * 2 );	// derivative of sin = cos
CNSTF4 1073741824
CNSTF4 1078530011
ADDRLP4 4
INDIRF4
MULF4
MULF4
ARGF4
ADDRLP4 28
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRF4
ASGNF4
line 1809
;1809:		phase *= 0.5;
ADDRLP4 0
CNSTF4 1056964608
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 1810
;1810:		VectorScale( tr->trDelta, phase, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 1811
;1811:		break;
ADDRGP4 $640
JUMPV
LABELV $645
line 1813
;1812:	case TR_LINEAR_STOP:
;1813:		if ( atTime > tr->trTime + tr->trDuration ) {
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
LEI4 $646
line 1814
;1814:			VectorClear( result );
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
CNSTF4 0
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRF4
ASGNF4
line 1815
;1815:			return;
ADDRGP4 $638
JUMPV
LABELV $646
line 1817
;1816:		}
;1817:		VectorCopy( tr->trDelta, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1818
;1818:		break;
ADDRGP4 $640
JUMPV
LABELV $648
line 1820
;1819:	case TR_GRAVITY:
;1820:		deltaTime = ( atTime - tr->trTime ) * 0.001;	// milliseconds to seconds
ADDRLP4 4
CNSTF4 981668463
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 1821
;1821:		VectorCopy( tr->trDelta, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1822
;1822:		result[2] -= DEFAULT_GRAVITY * deltaTime;		// FIXME: local gravity...
ADDRLP4 36
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CNSTF4 1145569280
ADDRLP4 4
INDIRF4
MULF4
SUBF4
ASGNF4
line 1823
;1823:		break;
ADDRGP4 $640
JUMPV
LABELV $639
line 1825
;1824:	default:
;1825:		Com_Error( ERR_DROP, "BG_EvaluateTrajectoryDelta: unknown trType: %i", tr->trTime );
CNSTI4 1
ARGI4
ADDRGP4 $649
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 1826
;1826:		break;
LABELV $640
line 1828
;1827:	}
;1828:}
LABELV $638
endproc BG_EvaluateTrajectoryDelta 44 12
data
export eventnames
align 4
LABELV eventnames
address $651
address $652
address $653
address $654
address $655
address $656
address $657
address $658
address $659
address $660
address $661
address $662
address $663
address $664
address $665
address $666
address $667
address $668
address $669
address $670
address $671
address $672
address $673
address $674
address $675
address $676
address $677
address $678
address $679
address $680
address $681
address $682
address $683
address $684
address $685
address $686
address $687
address $688
address $689
address $690
address $691
address $692
address $693
address $694
address $695
address $696
address $697
address $698
address $699
address $700
address $701
address $702
address $703
address $704
address $705
address $706
address $707
address $708
address $709
address $710
address $711
address $712
address $713
address $714
address $715
address $716
address $717
address $718
address $719
address $720
address $721
address $722
address $723
address $724
address $725
address $726
address $727
address $728
address $729
address $730
address $731
address $732
address $733
address $734
address $735
address $736
address $737
address $738
address $739
address $740
address $741
address $742
address $743
address $744
address $745
address $746
address $747
address $748
address $749
address $750
address $751
address $752
address $753
address $754
address $755
address $756
address $757
address $758
address $759
address $760
export BG_AddPredictableEventToPlayerstate
code
proc BG_AddPredictableEventToPlayerstate 12 0
line 1991
;1829:
;1830:char *eventnames[] = {
;1831:	"EV_NONE",
;1832:
;1833:	"EV_CLIENTJOIN",
;1834:
;1835:	"EV_FOOTSTEP",
;1836:	"EV_FOOTSTEP_METAL",
;1837:	"EV_FOOTSPLASH",
;1838:	"EV_FOOTWADE",
;1839:	"EV_SWIM",
;1840:
;1841:	"EV_STEP_4",
;1842:	"EV_STEP_8",
;1843:	"EV_STEP_12",
;1844:	"EV_STEP_16",
;1845:
;1846:	"EV_FALL",
;1847:
;1848:	"EV_JUMP_PAD",			// boing sound at origin", jump sound on player
;1849:
;1850:	"EV_PRIVATE_DUEL",
;1851:
;1852:	"EV_JUMP",
;1853:	"EV_ROLL",
;1854:	"EV_WATER_TOUCH",	// foot touches
;1855:	"EV_WATER_LEAVE",	// foot leaves
;1856:	"EV_WATER_UNDER",	// head touches
;1857:	"EV_WATER_CLEAR",	// head leaves
;1858:
;1859:	"EV_ITEM_PICKUP",			// normal item pickups are predictable
;1860:	"EV_GLOBAL_ITEM_PICKUP",	// powerup / team sounds are broadcast to everyone
;1861:
;1862:	"EV_NOAMMO",
;1863:	"EV_CHANGE_WEAPON",
;1864:	"EV_FIRE_WEAPON",
;1865:	"EV_ALT_FIRE",
;1866:	"EV_SABER_ATTACK",
;1867:	"EV_SABER_HIT",
;1868:	"EV_SABER_BLOCK",
;1869:	"EV_SABER_UNHOLSTER",
;1870:	"EV_BECOME_JEDIMASTER",
;1871:	"EV_DISRUPTOR_MAIN_SHOT",
;1872:	"EV_DISRUPTOR_SNIPER_SHOT",
;1873:	"EV_DISRUPTOR_SNIPER_MISS",
;1874:	"EV_DISRUPTOR_HIT",
;1875:	"EV_DISRUPTOR_ZOOMSOUND",
;1876:
;1877:	"EV_PREDEFSOUND",
;1878:
;1879:	"EV_TEAM_POWER",
;1880:
;1881:	"EV_SCREENSHAKE",
;1882:
;1883:	"EV_USE",			// +Use key
;1884:
;1885:	"EV_USE_ITEM0",
;1886:	"EV_USE_ITEM1",
;1887:	"EV_USE_ITEM2",
;1888:	"EV_USE_ITEM3",
;1889:	"EV_USE_ITEM4",
;1890:	"EV_USE_ITEM5",
;1891:	"EV_USE_ITEM6",
;1892:	"EV_USE_ITEM7",
;1893:	"EV_USE_ITEM8",
;1894:	"EV_USE_ITEM9",
;1895:	"EV_USE_ITEM10",
;1896:	"EV_USE_ITEM11",
;1897:	"EV_USE_ITEM12",
;1898:	"EV_USE_ITEM13",
;1899:	"EV_USE_ITEM14",
;1900:	"EV_USE_ITEM15",
;1901:
;1902:	"EV_ITEMUSEFAIL",
;1903:
;1904:	"EV_ITEM_RESPAWN",
;1905:	"EV_ITEM_POP",
;1906:	"EV_PLAYER_TELEPORT_IN",
;1907:	"EV_PLAYER_TELEPORT_OUT",
;1908:
;1909:	"EV_GRENADE_BOUNCE",		// eventParm will be the soundindex
;1910:	"EV_MISSILE_STICK",
;1911:
;1912:	"EV_PLAY_EFFECT",
;1913:	"EV_PLAY_EFFECT_ID", //finally gave in and added it..
;1914:
;1915:	"EV_MUTE_SOUND",
;1916:	"EV_GENERAL_SOUND",
;1917:	"EV_GLOBAL_SOUND",		// no attenuation
;1918:	"EV_GLOBAL_TEAM_SOUND",
;1919:	"EV_ENTITY_SOUND",
;1920:
;1921:	"EV_PLAY_ROFF",
;1922:
;1923:	"EV_GLASS_SHATTER",
;1924:	"EV_DEBRIS",
;1925:
;1926:	"EV_MISSILE_HIT",
;1927:	"EV_MISSILE_MISS",
;1928:	"EV_MISSILE_MISS_METAL",
;1929:	"EV_BULLET",				// otherEntity is the shooter
;1930:
;1931:	"EV_PAIN",
;1932:	"EV_DEATH1",
;1933:	"EV_DEATH2",
;1934:	"EV_DEATH3",
;1935:	"EV_OBITUARY",
;1936:
;1937:	"EV_POWERUP_QUAD",
;1938:	"EV_POWERUP_BATTLESUIT",
;1939:	//"EV_POWERUP_REGEN",
;1940:
;1941:	"EV_FORCE_DRAINED",
;1942:
;1943:	"EV_GIB_PLAYER",			// gib a previously living player
;1944:	"EV_SCOREPLUM",			// score plum
;1945:
;1946:	"EV_CTFMESSAGE",
;1947:
;1948:	"EV_SAGA_ROUNDOVER",
;1949:	"EV_SAGA_OBJECTIVECOMPLETE",
;1950:
;1951:	"EV_DESTROY_GHOUL2_INSTANCE",
;1952:
;1953:	"EV_DESTROY_WEAPON_MODEL",
;1954:
;1955:	"EV_GIVE_NEW_RANK",
;1956:	"EV_SET_FREE_SABER",
;1957:	"EV_SET_FORCE_DISABLE",
;1958:
;1959:	"EV_WEAPON_CHARGE",
;1960:	"EV_WEAPON_CHARGE_ALT",
;1961:
;1962:	"EV_SHIELD_HIT",
;1963:
;1964:	"EV_DEBUG_LINE",
;1965:	"EV_TESTLINE",
;1966:	"EV_STOPLOOPINGSOUND",
;1967:	"EV_STARTLOOPINGSOUND",
;1968:	"EV_TAUNT",
;1969:
;1970:	"EV_TAUNT_YES",
;1971:	"EV_TAUNT_NO",
;1972:	"EV_TAUNT_FOLLOWME",
;1973:	"EV_TAUNT_GETFLAG",
;1974:	"EV_TAUNT_GUARDBASE",
;1975:	"EV_TAUNT_PATROL",
;1976:
;1977:	"EV_BODY_QUEUE_COPY"
;1978:
;1979:};
;1980:
;1981:/*
;1982:===============
;1983:BG_AddPredictableEventToPlayerstate
;1984:
;1985:Handles the sequence numbers
;1986:===============
;1987:*/
;1988:
;1989:void	trap_Cvar_VariableStringBuffer( const char *var_name, char *buffer, int bufsize );
;1990:
;1991:void BG_AddPredictableEventToPlayerstate( int newEvent, int eventParm, playerState_t *ps ) {
line 2006
;1992:
;1993:#ifdef _DEBUG
;1994:	{
;1995:		char buf[256];
;1996:		trap_Cvar_VariableStringBuffer("showevents", buf, sizeof(buf));
;1997:		if ( atof(buf) != 0 ) {
;1998:#ifdef QAGAME
;1999:			Com_Printf(" game event svt %5d -> %5d: num = %20s parm %d\n", ps->pmove_framecount/*ps->commandTime*/, ps->eventSequence, eventnames[newEvent], eventParm);
;2000:#else
;2001:			Com_Printf("Cgame event svt %5d -> %5d: num = %20s parm %d\n", ps->pmove_framecount/*ps->commandTime*/, ps->eventSequence, eventnames[newEvent], eventParm);
;2002:#endif
;2003:		}
;2004:	}
;2005:#endif
;2006:	ps->events[ps->eventSequence & (MAX_PS_EVENTS-1)] = newEvent;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 2007
;2007:	ps->eventParms[ps->eventSequence & (MAX_PS_EVENTS-1)] = eventParm;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 124
ADDP4
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 2008
;2008:	ps->eventSequence++;
ADDRLP4 8
ADDRFP4 8
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2009
;2009:}
LABELV $761
endproc BG_AddPredictableEventToPlayerstate 12 0
export BG_TouchJumpPad
proc BG_TouchJumpPad 32 8
line 2016
;2010:
;2011:/*
;2012:========================
;2013:BG_TouchJumpPad
;2014:========================
;2015:*/
;2016:void BG_TouchJumpPad( playerState_t *ps, entityState_t *jumppad ) {
line 2022
;2017:	vec3_t	angles;
;2018:	float p;
;2019:	int effectNum;
;2020:
;2021:	// spectators don't use jump pads
;2022:	if ( ps->pm_type != PM_NORMAL && ps->pm_type != PM_FLOAT ) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $763
ADDRLP4 20
INDIRI4
CNSTI4 1
EQI4 $763
line 2023
;2023:		return;
ADDRGP4 $762
JUMPV
LABELV $763
line 2028
;2024:	}
;2025:
;2026:	// if we didn't hit this same jumppad the previous frame
;2027:	// then don't play the event sound again if we are in a fat trigger
;2028:	if ( ps->jumppad_ent != jumppad->number ) {
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
EQI4 $765
line 2030
;2029:
;2030:		vectoangles( jumppad->origin2, angles);
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2031
;2031:		p = fabs( AngleNormalize180( angles[PITCH] ) );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 28
INDIRF4
ASGNF4
line 2032
;2032:		if( p < 45 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1110704128
GEF4 $767
line 2033
;2033:			effectNum = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 2034
;2034:		} else {
ADDRGP4 $768
JUMPV
LABELV $767
line 2035
;2035:			effectNum = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 2036
;2036:		}
LABELV $768
line 2037
;2037:	}
LABELV $765
line 2039
;2038:	// remember hitting this jumppad this frame
;2039:	ps->jumppad_ent = jumppad->number;
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 2040
;2040:	ps->jumppad_frame = ps->pmove_framecount;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
ASGNI4
line 2042
;2041:	// give the player the velocity from the jumppad
;2042:	VectorCopy( jumppad->origin2, ps->velocity );
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 2043
;2043:}
LABELV $762
endproc BG_TouchJumpPad 32 8
export BG_PlayerStateToEntityState
proc BG_PlayerStateToEntityState 28 0
line 2053
;2044:
;2045:/*
;2046:========================
;2047:BG_PlayerStateToEntityState
;2048:
;2049:This is done after each set of usercmd_t on the server,
;2050:and after local prediction on the client
;2051:========================
;2052:*/
;2053:void BG_PlayerStateToEntityState( playerState_t *ps, entityState_t *s, qboolean snap ) {
line 2056
;2054:	int		i;
;2055:
;2056:	if ( ps->pm_type == PM_INTERMISSION || ps->pm_type == PM_SPECTATOR ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 6
EQI4 $772
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $770
LABELV $772
line 2057
;2057:		s->eType = ET_INVISIBLE;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 12
ASGNI4
line 2058
;2058:	} else if ( ps->stats[STAT_HEALTH] <= GIB_HEALTH ) {
ADDRGP4 $771
JUMPV
LABELV $770
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $773
line 2059
;2059:		s->eType = ET_INVISIBLE;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 12
ASGNI4
line 2060
;2060:	} else {
ADDRGP4 $774
JUMPV
LABELV $773
line 2061
;2061:		s->eType = ET_PLAYER;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 2062
;2062:	}
LABELV $774
LABELV $771
line 2064
;2063:
;2064:	s->number = ps->clientNum;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 2066
;2065:
;2066:	s->pos.trType = TR_INTERPOLATE;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 1
ASGNI4
line 2067
;2067:	VectorCopy( ps->origin, s->pos.trBase );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2068
;2068:	if ( snap ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $775
line 2069
;2069:		SnapVector( s->pos.trBase );
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2070
;2070:	}
LABELV $775
line 2072
;2071:	// set the trDelta for flag direction
;2072:	VectorCopy( ps->velocity, s->pos.trDelta );
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2074
;2073:
;2074:	s->apos.trType = TR_INTERPOLATE;
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 1
ASGNI4
line 2075
;2075:	VectorCopy( ps->viewangles, s->apos.trBase );
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 2076
;2076:	if ( snap ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $777
line 2077
;2077:		SnapVector( s->apos.trBase );
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2078
;2078:	}
LABELV $777
line 2080
;2079:
;2080:	s->trickedentindex = ps->fd.forceMindtrickTargetIndex;
ADDRFP4 4
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1156
ADDP4
INDIRI4
ASGNI4
line 2081
;2081:	s->trickedentindex2 = ps->fd.forceMindtrickTargetIndex2;
ADDRFP4 4
INDIRP4
CNSTI4 152
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1160
ADDP4
INDIRI4
ASGNI4
line 2082
;2082:	s->trickedentindex3 = ps->fd.forceMindtrickTargetIndex3;
ADDRFP4 4
INDIRP4
CNSTI4 156
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1164
ADDP4
INDIRI4
ASGNI4
line 2083
;2083:	s->trickedentindex4 = ps->fd.forceMindtrickTargetIndex4;
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1168
ADDP4
INDIRI4
ASGNI4
line 2085
;2084:
;2085:	s->forceFrame = ps->saberLockFrame;
ADDRFP4 4
INDIRP4
CNSTI4 288
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
line 2087
;2086:
;2087:	s->emplacedOwner = ps->electrifyTime;
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ASGNI4
line 2089
;2088:
;2089:	s->speed = ps->speed;
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2091
;2090:
;2091:	s->genericenemyindex = ps->genericEnemyIndex;
ADDRFP4 4
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
line 2093
;2092:
;2093:	s->activeForcePass = ps->activeForcePass;
ADDRFP4 4
INDIRP4
CNSTI4 176
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ASGNI4
line 2095
;2094:
;2095:	s->angles2[YAW] = ps->movementDir;
ADDRFP4 4
INDIRP4
CNSTI4 132
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2096
;2096:	s->legsAnim = ps->legsAnim;
ADDRFP4 4
INDIRP4
CNSTI4 280
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 2097
;2097:	s->torsoAnim = ps->torsoAnim;
ADDRFP4 4
INDIRP4
CNSTI4 284
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
line 2098
;2098:	s->clientNum = ps->clientNum;		// ET_PLAYER looks here instead of at number
ADDRFP4 4
INDIRP4
CNSTI4 220
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 2100
;2099:										// so corpses can also reference the proper config
;2100:	s->eFlags = ps->eFlags;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 2102
;2101:
;2102:	s->saberInFlight = ps->saberInFlight;
ADDRFP4 4
INDIRP4
CNSTI4 228
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ASGNI4
line 2103
;2103:	s->saberEntityNum = ps->saberEntityNum;
ADDRFP4 4
INDIRP4
CNSTI4 232
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
line 2104
;2104:	s->saberMove = ps->saberMove;
ADDRFP4 4
INDIRP4
CNSTI4 236
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 2105
;2105:	s->forcePowersActive = ps->fd.forcePowersActive;
ADDRFP4 4
INDIRP4
CNSTI4 240
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
ASGNI4
line 2107
;2106:
;2107:	if (ps->duelInProgress)
ADDRFP4 0
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $779
line 2108
;2108:	{
line 2109
;2109:		s->bolt1 = 1;
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
CNSTI4 1
ASGNI4
line 2110
;2110:	}
ADDRGP4 $780
JUMPV
LABELV $779
line 2112
;2111:	else
;2112:	{
line 2113
;2113:		s->bolt1 = 0;
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
CNSTI4 0
ASGNI4
line 2114
;2114:	}
LABELV $780
line 2116
;2115:
;2116:	if (ps->dualBlade)
ADDRFP4 0
INDIRP4
CNSTI4 1364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $781
line 2117
;2117:	{
line 2118
;2118:		s->bolt2 = 1;
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 2119
;2119:	}
ADDRGP4 $782
JUMPV
LABELV $781
line 2121
;2120:	else
;2121:	{
line 2122
;2122:		s->bolt2 = 0;
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 2123
;2123:	}
LABELV $782
line 2125
;2124:
;2125:	s->otherEntityNum2 = ps->emplacedIndex;
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ASGNI4
line 2127
;2126:
;2127:	s->shouldtarget = ps->saberHolstered; //reuse bool in entitystate for players differently
ADDRFP4 4
INDIRP4
CNSTI4 268
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
ASGNI4
line 2128
;2128:	s->teamowner = ps->usingATST;
ADDRFP4 4
INDIRP4
CNSTI4 264
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
ASGNI4
line 2130
;2129:
;2130:	if (ps->genericEnemyIndex != -1)
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $783
line 2131
;2131:	{
line 2132
;2132:		s->eFlags |= EF_SEEKERDRONE;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1048576
BORI4
ASGNI4
line 2133
;2133:	}
LABELV $783
line 2135
;2134:
;2135:	if ( ps->stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $785
line 2136
;2136:		s->eFlags |= EF_DEAD;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 2137
;2137:	} else {
ADDRGP4 $786
JUMPV
LABELV $785
line 2138
;2138:		s->eFlags &= ~EF_DEAD;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 2139
;2139:	}
LABELV $786
line 2141
;2140:
;2141:	if ( ps->externalEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 0
EQI4 $787
line 2142
;2142:		s->event = ps->externalEvent;
ADDRFP4 4
INDIRP4
CNSTI4 252
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ASGNI4
line 2143
;2143:		s->eventParm = ps->externalEventParm;
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
ASGNI4
line 2144
;2144:	} else if ( ps->entityEventSequence < ps->eventSequence ) {
ADDRGP4 $788
JUMPV
LABELV $787
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
GEI4 $789
line 2147
;2145:		int		seq;
;2146:
;2147:		if ( ps->entityEventSequence < ps->eventSequence - MAX_PS_EVENTS) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 2
SUBI4
GEI4 $791
line 2148
;2148:			ps->entityEventSequence = ps->eventSequence - MAX_PS_EVENTS;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2149
;2149:		}
LABELV $791
line 2150
;2150:		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 2151
;2151:		s->event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 252
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
CNSTI4 116
ADDP4
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 8
LSHI4
BORI4
ASGNI4
line 2152
;2152:		s->eventParm = ps->eventParms[ seq ];
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
ADDP4
INDIRI4
ASGNI4
line 2153
;2153:		ps->entityEventSequence++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2154
;2154:	}
LABELV $789
LABELV $788
line 2157
;2155:
;2156:
;2157:	s->weapon = ps->weapon;
ADDRFP4 4
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 2158
;2158:	s->groundEntityNum = ps->groundEntityNum;
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ASGNI4
line 2160
;2159:
;2160:	s->powerups = 0;
ADDRFP4 4
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 0
ASGNI4
line 2161
;2161:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $793
line 2162
;2162:		if ( ps->powerups[ i ] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $797
line 2163
;2163:			s->powerups |= 1 << i;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 272
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 2164
;2164:		}
LABELV $797
line 2165
;2165:	}
LABELV $794
line 2161
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $793
line 2167
;2166:
;2167:	s->loopSound = ps->loopSound;
ADDRFP4 4
INDIRP4
CNSTI4 200
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
ASGNI4
line 2168
;2168:	s->generic1 = ps->generic1;
ADDRFP4 4
INDIRP4
CNSTI4 292
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
ASGNI4
line 2171
;2169:
;2170:	//NOT INCLUDED IN ENTITYSTATETOPLAYERSTATE:
;2171:	s->modelindex2 = ps->weaponstate;
ADDRFP4 4
INDIRP4
CNSTI4 216
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 2172
;2172:	s->constantLight = ps->weaponChargeTime;
ADDRFP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ASGNI4
line 2174
;2173:
;2174:	VectorCopy(ps->lastHitLoc, s->origin2);
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1368
ADDP4
INDIRB
ASGNB 12
line 2176
;2175:
;2176:	s->isJediMaster = ps->isJediMaster;
ADDRFP4 4
INDIRP4
CNSTI4 244
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ASGNI4
line 2178
;2177:
;2178:	s->time2 = ps->holocronBits;
ADDRFP4 4
INDIRP4
CNSTI4 88
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
ASGNI4
line 2180
;2179:
;2180:	s->fireflag = ps->fd.saberAnimLevel;
ADDRFP4 4
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 2181
;2181:}
LABELV $769
endproc BG_PlayerStateToEntityState 28 0
export BG_PlayerStateToEntityStateExtraPolate
proc BG_PlayerStateToEntityStateExtraPolate 28 0
line 2191
;2182:
;2183:/*
;2184:========================
;2185:BG_PlayerStateToEntityStateExtraPolate
;2186:
;2187:This is done after each set of usercmd_t on the server,
;2188:and after local prediction on the client
;2189:========================
;2190:*/
;2191:void BG_PlayerStateToEntityStateExtraPolate( playerState_t *ps, entityState_t *s, int time, qboolean snap ) {
line 2194
;2192:	int		i;
;2193:
;2194:	if ( ps->pm_type == PM_INTERMISSION || ps->pm_type == PM_SPECTATOR ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 6
EQI4 $802
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $800
LABELV $802
line 2195
;2195:		s->eType = ET_INVISIBLE;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 12
ASGNI4
line 2196
;2196:	} else if ( ps->stats[STAT_HEALTH] <= GIB_HEALTH ) {
ADDRGP4 $801
JUMPV
LABELV $800
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $803
line 2197
;2197:		s->eType = ET_INVISIBLE;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 12
ASGNI4
line 2198
;2198:	} else {
ADDRGP4 $804
JUMPV
LABELV $803
line 2199
;2199:		s->eType = ET_PLAYER;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 2200
;2200:	}
LABELV $804
LABELV $801
line 2202
;2201:
;2202:	s->number = ps->clientNum;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 2204
;2203:
;2204:	s->pos.trType = TR_LINEAR_STOP;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 2205
;2205:	VectorCopy( ps->origin, s->pos.trBase );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2206
;2206:	if ( snap ) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $805
line 2207
;2207:		SnapVector( s->pos.trBase );
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2208
;2208:	}
LABELV $805
line 2210
;2209:	// set the trDelta for flag direction and linear prediction
;2210:	VectorCopy( ps->velocity, s->pos.trDelta );
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2212
;2211:	// set the time for linear prediction
;2212:	s->pos.trTime = time;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 2214
;2213:	// set maximum extra polation time
;2214:	s->pos.trDuration = 50; // 1000 / sv_fps (default = 20)
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 50
ASGNI4
line 2216
;2215:
;2216:	s->apos.trType = TR_INTERPOLATE;
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 1
ASGNI4
line 2217
;2217:	VectorCopy( ps->viewangles, s->apos.trBase );
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 2218
;2218:	if ( snap ) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $807
line 2219
;2219:		SnapVector( s->apos.trBase );
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2220
;2220:	}
LABELV $807
line 2222
;2221:
;2222:	s->trickedentindex = ps->fd.forceMindtrickTargetIndex;
ADDRFP4 4
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1156
ADDP4
INDIRI4
ASGNI4
line 2223
;2223:	s->trickedentindex2 = ps->fd.forceMindtrickTargetIndex2;
ADDRFP4 4
INDIRP4
CNSTI4 152
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1160
ADDP4
INDIRI4
ASGNI4
line 2224
;2224:	s->trickedentindex3 = ps->fd.forceMindtrickTargetIndex3;
ADDRFP4 4
INDIRP4
CNSTI4 156
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1164
ADDP4
INDIRI4
ASGNI4
line 2225
;2225:	s->trickedentindex4 = ps->fd.forceMindtrickTargetIndex4;
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1168
ADDP4
INDIRI4
ASGNI4
line 2227
;2226:
;2227:	s->forceFrame = ps->saberLockFrame;
ADDRFP4 4
INDIRP4
CNSTI4 288
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
line 2229
;2228:
;2229:	s->emplacedOwner = ps->electrifyTime;
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ASGNI4
line 2231
;2230:
;2231:	s->speed = ps->speed;
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2233
;2232:
;2233:	s->genericenemyindex = ps->genericEnemyIndex;
ADDRFP4 4
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
line 2235
;2234:
;2235:	s->activeForcePass = ps->activeForcePass;
ADDRFP4 4
INDIRP4
CNSTI4 176
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ASGNI4
line 2237
;2236:
;2237:	s->angles2[YAW] = ps->movementDir;
ADDRFP4 4
INDIRP4
CNSTI4 132
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2238
;2238:	s->legsAnim = ps->legsAnim;
ADDRFP4 4
INDIRP4
CNSTI4 280
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 2239
;2239:	s->torsoAnim = ps->torsoAnim;
ADDRFP4 4
INDIRP4
CNSTI4 284
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
line 2240
;2240:	s->clientNum = ps->clientNum;		// ET_PLAYER looks here instead of at number
ADDRFP4 4
INDIRP4
CNSTI4 220
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 2242
;2241:										// so corpses can also reference the proper config
;2242:	s->eFlags = ps->eFlags;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 2244
;2243:
;2244:	s->saberInFlight = ps->saberInFlight;
ADDRFP4 4
INDIRP4
CNSTI4 228
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ASGNI4
line 2245
;2245:	s->saberEntityNum = ps->saberEntityNum;
ADDRFP4 4
INDIRP4
CNSTI4 232
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
line 2246
;2246:	s->saberMove = ps->saberMove;
ADDRFP4 4
INDIRP4
CNSTI4 236
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 2247
;2247:	s->forcePowersActive = ps->fd.forcePowersActive;
ADDRFP4 4
INDIRP4
CNSTI4 240
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
ASGNI4
line 2249
;2248:
;2249:	if (ps->duelInProgress)
ADDRFP4 0
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $809
line 2250
;2250:	{
line 2251
;2251:		s->bolt1 = 1;
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
CNSTI4 1
ASGNI4
line 2252
;2252:	}
ADDRGP4 $810
JUMPV
LABELV $809
line 2254
;2253:	else
;2254:	{
line 2255
;2255:		s->bolt1 = 0;
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
CNSTI4 0
ASGNI4
line 2256
;2256:	}
LABELV $810
line 2258
;2257:
;2258:	if (ps->dualBlade)
ADDRFP4 0
INDIRP4
CNSTI4 1364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $811
line 2259
;2259:	{
line 2260
;2260:		s->bolt2 = 1;
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 2261
;2261:	}
ADDRGP4 $812
JUMPV
LABELV $811
line 2263
;2262:	else
;2263:	{
line 2264
;2264:		s->bolt2 = 0;
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 2265
;2265:	}
LABELV $812
line 2267
;2266:
;2267:	s->otherEntityNum2 = ps->emplacedIndex;
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ASGNI4
line 2269
;2268:
;2269:	s->shouldtarget = ps->saberHolstered; //reuse bool in entitystate for players differently
ADDRFP4 4
INDIRP4
CNSTI4 268
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
ASGNI4
line 2270
;2270:	s->teamowner = ps->usingATST;
ADDRFP4 4
INDIRP4
CNSTI4 264
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
ASGNI4
line 2272
;2271:
;2272:	if (ps->genericEnemyIndex != -1)
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $813
line 2273
;2273:	{
line 2274
;2274:		s->eFlags |= EF_SEEKERDRONE;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1048576
BORI4
ASGNI4
line 2275
;2275:	}
LABELV $813
line 2277
;2276:
;2277:	if ( ps->stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $815
line 2278
;2278:		s->eFlags |= EF_DEAD;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 2279
;2279:	} else {
ADDRGP4 $816
JUMPV
LABELV $815
line 2280
;2280:		s->eFlags &= ~EF_DEAD;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 2281
;2281:	}
LABELV $816
line 2283
;2282:
;2283:	if ( ps->externalEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 0
EQI4 $817
line 2284
;2284:		s->event = ps->externalEvent;
ADDRFP4 4
INDIRP4
CNSTI4 252
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ASGNI4
line 2285
;2285:		s->eventParm = ps->externalEventParm;
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
ASGNI4
line 2286
;2286:	} else if ( ps->entityEventSequence < ps->eventSequence ) {
ADDRGP4 $818
JUMPV
LABELV $817
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
GEI4 $819
line 2289
;2287:		int		seq;
;2288:
;2289:		if ( ps->entityEventSequence < ps->eventSequence - MAX_PS_EVENTS) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 2
SUBI4
GEI4 $821
line 2290
;2290:			ps->entityEventSequence = ps->eventSequence - MAX_PS_EVENTS;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2291
;2291:		}
LABELV $821
line 2292
;2292:		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 2293
;2293:		s->event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 252
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
CNSTI4 116
ADDP4
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 8
LSHI4
BORI4
ASGNI4
line 2294
;2294:		s->eventParm = ps->eventParms[ seq ];
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
ADDP4
INDIRI4
ASGNI4
line 2295
;2295:		ps->entityEventSequence++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2296
;2296:	}
LABELV $819
LABELV $818
line 2297
;2297:	s->weapon = ps->weapon;
ADDRFP4 4
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 2298
;2298:	s->groundEntityNum = ps->groundEntityNum;
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ASGNI4
line 2300
;2299:
;2300:	s->powerups = 0;
ADDRFP4 4
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 0
ASGNI4
line 2301
;2301:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $823
line 2302
;2302:		if ( ps->powerups[ i ] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $827
line 2303
;2303:			s->powerups |= 1 << i;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 272
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 2304
;2304:		}
LABELV $827
line 2305
;2305:	}
LABELV $824
line 2301
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $823
line 2307
;2306:
;2307:	s->loopSound = ps->loopSound;
ADDRFP4 4
INDIRP4
CNSTI4 200
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
ASGNI4
line 2308
;2308:	s->generic1 = ps->generic1;
ADDRFP4 4
INDIRP4
CNSTI4 292
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
ASGNI4
line 2311
;2309:
;2310:	//NOT INCLUDED IN ENTITYSTATETOPLAYERSTATE:
;2311:	s->modelindex2 = ps->weaponstate;
ADDRFP4 4
INDIRP4
CNSTI4 216
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 2312
;2312:	s->constantLight = ps->weaponChargeTime;
ADDRFP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ASGNI4
line 2314
;2313:
;2314:	VectorCopy(ps->lastHitLoc, s->origin2);
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1368
ADDP4
INDIRB
ASGNB 12
line 2316
;2315:
;2316:	s->isJediMaster = ps->isJediMaster;
ADDRFP4 4
INDIRP4
CNSTI4 244
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ASGNI4
line 2318
;2317:
;2318:	s->time2 = ps->holocronBits;
ADDRFP4 4
INDIRP4
CNSTI4 88
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
ASGNI4
line 2320
;2319:
;2320:	s->fireflag = ps->fd.saberAnimLevel;
ADDRFP4 4
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 2321
;2321:}
LABELV $799
endproc BG_PlayerStateToEntityStateExtraPolate 28 0
data
align 4
LABELV bg_poolSize
byte 4 0
align 4
LABELV bg_poolTail
byte 4 2048000
export BG_Alloc
code
proc BG_Alloc 8 16
line 2337
;2322:
;2323:/*
;2324:=============================================================================
;2325:
;2326:PLAYER ANGLES
;2327:
;2328:=============================================================================
;2329:*/
;2330:#define MAX_POOL_SIZE	2048000 //1024000
;2331:
;2332:static char		bg_pool[MAX_POOL_SIZE];
;2333:static int		bg_poolSize = 0;
;2334:static int		bg_poolTail = MAX_POOL_SIZE;
;2335:
;2336:void *BG_Alloc ( int size )
;2337:{
line 2338
;2338:	bg_poolSize = ((bg_poolSize + 0x00000003) & 0xfffffffc);
ADDRLP4 0
ADDRGP4 bg_poolSize
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 3
ADDI4
CVIU4 4
CNSTU4 4294967292
BANDU4
CVUI4 4
ASGNI4
line 2340
;2339:
;2340:	if (bg_poolSize + size > bg_poolTail)
ADDRGP4 bg_poolSize
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ADDRGP4 bg_poolTail
INDIRI4
LEI4 $830
line 2341
;2341:	{
line 2342
;2342:		Com_Error( ERR_DROP, "BG_Alloc: buffer exceeded tail (%d > %d)", bg_poolSize + size, bg_poolTail);
CNSTI4 1
ARGI4
ADDRGP4 $832
ARGP4
ADDRGP4 bg_poolSize
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ARGI4
ADDRGP4 bg_poolTail
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 2343
;2343:		return 0;
CNSTP4 0
RETP4
ADDRGP4 $829
JUMPV
LABELV $830
line 2346
;2344:	}
;2345:
;2346:	bg_poolSize += size;
ADDRLP4 4
ADDRGP4 bg_poolSize
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 2348
;2347:
;2348:	return &bg_pool[bg_poolSize-size];
ADDRGP4 bg_poolSize
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ADDRGP4 bg_pool
ADDP4
RETP4
LABELV $829
endproc BG_Alloc 8 16
export BG_AllocUnaligned
proc BG_AllocUnaligned 4 16
line 2352
;2349:}
;2350:
;2351:void *BG_AllocUnaligned ( int size )
;2352:{
line 2353
;2353:	if (bg_poolSize + size > bg_poolTail)
ADDRGP4 bg_poolSize
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ADDRGP4 bg_poolTail
INDIRI4
LEI4 $834
line 2354
;2354:	{
line 2355
;2355:		Com_Error( ERR_DROP, "BG_AllocUnaligned: buffer exceeded tail (%d > %d)", bg_poolSize + size, bg_poolTail);
CNSTI4 1
ARGI4
ADDRGP4 $836
ARGP4
ADDRGP4 bg_poolSize
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ARGI4
ADDRGP4 bg_poolTail
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 2356
;2356:		return 0;
CNSTP4 0
RETP4
ADDRGP4 $833
JUMPV
LABELV $834
line 2359
;2357:	}
;2358:
;2359:	bg_poolSize += size;
ADDRLP4 0
ADDRGP4 bg_poolSize
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 2361
;2360:
;2361:	return &bg_pool[bg_poolSize-size];
ADDRGP4 bg_poolSize
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ADDRGP4 bg_pool
ADDP4
RETP4
LABELV $833
endproc BG_AllocUnaligned 4 16
export BG_TempAlloc
proc BG_TempAlloc 4 16
line 2365
;2362:}
;2363:
;2364:void *BG_TempAlloc( int size )
;2365:{
line 2366
;2366:	size = ((size + 0x00000003) & 0xfffffffc);
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 3
ADDI4
CVIU4 4
CNSTU4 4294967292
BANDU4
CVUI4 4
ASGNI4
line 2368
;2367:
;2368:	if (bg_poolTail - size < bg_poolSize)
ADDRGP4 bg_poolTail
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ADDRGP4 bg_poolSize
INDIRI4
GEI4 $838
line 2369
;2369:	{
line 2370
;2370:		Com_Error( ERR_DROP, "BG_TempAlloc: buffer exceeded head (%d > %d)", bg_poolTail - size, bg_poolSize);
CNSTI4 1
ARGI4
ADDRGP4 $840
ARGP4
ADDRGP4 bg_poolTail
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ARGI4
ADDRGP4 bg_poolSize
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 2371
;2371:		return 0;
CNSTP4 0
RETP4
ADDRGP4 $837
JUMPV
LABELV $838
line 2374
;2372:	}
;2373:
;2374:	bg_poolTail -= size;
ADDRLP4 0
ADDRGP4 bg_poolTail
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ASGNI4
line 2376
;2375:
;2376:	return &bg_pool[bg_poolTail];
ADDRGP4 bg_poolTail
INDIRI4
ADDRGP4 bg_pool
ADDP4
RETP4
LABELV $837
endproc BG_TempAlloc 4 16
export BG_TempFree
proc BG_TempFree 4 16
line 2380
;2377:}
;2378:
;2379:void BG_TempFree( int size )
;2380:{
line 2381
;2381:	size = ((size + 0x00000003) & 0xfffffffc);
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 3
ADDI4
CVIU4 4
CNSTU4 4294967292
BANDU4
CVUI4 4
ASGNI4
line 2383
;2382:
;2383:	if (bg_poolTail+size > MAX_POOL_SIZE)
ADDRGP4 bg_poolTail
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
CNSTI4 2048000
LEI4 $842
line 2384
;2384:	{
line 2385
;2385:		Com_Error( ERR_DROP, "BG_TempFree: tail greater than size (%d > %d)", bg_poolTail+size, MAX_POOL_SIZE );
CNSTI4 1
ARGI4
ADDRGP4 $844
ARGP4
ADDRGP4 bg_poolTail
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ARGI4
CNSTI4 2048000
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 2386
;2386:	}
LABELV $842
line 2388
;2387:
;2388:	bg_poolTail += size;
ADDRLP4 0
ADDRGP4 bg_poolTail
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 2389
;2389:}
LABELV $841
endproc BG_TempFree 4 16
export BG_StringAlloc
proc BG_StringAlloc 12 8
line 2392
;2390:
;2391:char *BG_StringAlloc ( const char *source )
;2392:{
line 2395
;2393:	char *dest;
;2394:
;2395:	dest = BG_Alloc ( strlen ( source ) + 1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 2396
;2396:	strcpy ( dest, source );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 2397
;2397:	return dest;
ADDRLP4 0
INDIRP4
RETP4
LABELV $845
endproc BG_StringAlloc 12 8
export BG_OutOfMemory
proc BG_OutOfMemory 4 0
line 2401
;2398:}
;2399:
;2400:qboolean BG_OutOfMemory ( void )
;2401:{
line 2402
;2402:	return bg_poolSize >= MAX_POOL_SIZE;
ADDRGP4 bg_poolSize
INDIRI4
CNSTI4 2048000
LTI4 $848
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $849
JUMPV
LABELV $848
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $849
ADDRLP4 0
INDIRI4
RETI4
LABELV $846
endproc BG_OutOfMemory 4 0
bss
align 1
LABELV bg_pool
skip 2048000
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
import CG_ReattachLimb
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
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
import BG_ParseAnimationFile
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
import saberMoveData
import Pmove
import PM_UpdateViewAngles
import pm
import bgGlobalAnimations
import BGPAFtextLoaded
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
LABELV $844
char 1 66
char 1 71
char 1 95
char 1 84
char 1 101
char 1 109
char 1 112
char 1 70
char 1 114
char 1 101
char 1 101
char 1 58
char 1 32
char 1 116
char 1 97
char 1 105
char 1 108
char 1 32
char 1 103
char 1 114
char 1 101
char 1 97
char 1 116
char 1 101
char 1 114
char 1 32
char 1 116
char 1 104
char 1 97
char 1 110
char 1 32
char 1 115
char 1 105
char 1 122
char 1 101
char 1 32
char 1 40
char 1 37
char 1 100
char 1 32
char 1 62
char 1 32
char 1 37
char 1 100
char 1 41
char 1 0
align 1
LABELV $840
char 1 66
char 1 71
char 1 95
char 1 84
char 1 101
char 1 109
char 1 112
char 1 65
char 1 108
char 1 108
char 1 111
char 1 99
char 1 58
char 1 32
char 1 98
char 1 117
char 1 102
char 1 102
char 1 101
char 1 114
char 1 32
char 1 101
char 1 120
char 1 99
char 1 101
char 1 101
char 1 100
char 1 101
char 1 100
char 1 32
char 1 104
char 1 101
char 1 97
char 1 100
char 1 32
char 1 40
char 1 37
char 1 100
char 1 32
char 1 62
char 1 32
char 1 37
char 1 100
char 1 41
char 1 0
align 1
LABELV $836
char 1 66
char 1 71
char 1 95
char 1 65
char 1 108
char 1 108
char 1 111
char 1 99
char 1 85
char 1 110
char 1 97
char 1 108
char 1 105
char 1 103
char 1 110
char 1 101
char 1 100
char 1 58
char 1 32
char 1 98
char 1 117
char 1 102
char 1 102
char 1 101
char 1 114
char 1 32
char 1 101
char 1 120
char 1 99
char 1 101
char 1 101
char 1 100
char 1 101
char 1 100
char 1 32
char 1 116
char 1 97
char 1 105
char 1 108
char 1 32
char 1 40
char 1 37
char 1 100
char 1 32
char 1 62
char 1 32
char 1 37
char 1 100
char 1 41
char 1 0
align 1
LABELV $832
char 1 66
char 1 71
char 1 95
char 1 65
char 1 108
char 1 108
char 1 111
char 1 99
char 1 58
char 1 32
char 1 98
char 1 117
char 1 102
char 1 102
char 1 101
char 1 114
char 1 32
char 1 101
char 1 120
char 1 99
char 1 101
char 1 101
char 1 100
char 1 101
char 1 100
char 1 32
char 1 116
char 1 97
char 1 105
char 1 108
char 1 32
char 1 40
char 1 37
char 1 100
char 1 32
char 1 62
char 1 32
char 1 37
char 1 100
char 1 41
char 1 0
align 1
LABELV $760
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
char 1 0
align 1
LABELV $759
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
char 1 0
align 1
LABELV $758
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
char 1 0
align 1
LABELV $757
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
char 1 0
align 1
LABELV $756
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
char 1 0
align 1
LABELV $755
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
char 1 0
align 1
LABELV $754
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
char 1 0
align 1
LABELV $753
char 1 69
char 1 86
char 1 95
char 1 84
char 1 65
char 1 85
char 1 78
char 1 84
char 1 0
align 1
LABELV $752
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
char 1 0
align 1
LABELV $751
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
char 1 0
align 1
LABELV $750
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
char 1 0
align 1
LABELV $749
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
char 1 0
align 1
LABELV $748
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
char 1 0
align 1
LABELV $747
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
char 1 0
align 1
LABELV $746
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
char 1 0
align 1
LABELV $745
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
char 1 0
align 1
LABELV $744
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
char 1 0
align 1
LABELV $743
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
char 1 0
align 1
LABELV $742
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
char 1 0
align 1
LABELV $741
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
char 1 0
align 1
LABELV $740
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
char 1 0
align 1
LABELV $739
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
char 1 0
align 1
LABELV $738
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
char 1 0
align 1
LABELV $737
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
char 1 0
align 1
LABELV $736
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
char 1 0
align 1
LABELV $735
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
char 1 0
align 1
LABELV $734
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
char 1 0
align 1
LABELV $733
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
char 1 0
align 1
LABELV $732
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
char 1 0
align 1
LABELV $731
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 65
char 1 84
char 1 72
char 1 51
char 1 0
align 1
LABELV $730
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 65
char 1 84
char 1 72
char 1 50
char 1 0
align 1
LABELV $729
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 65
char 1 84
char 1 72
char 1 49
char 1 0
align 1
LABELV $728
char 1 69
char 1 86
char 1 95
char 1 80
char 1 65
char 1 73
char 1 78
char 1 0
align 1
LABELV $727
char 1 69
char 1 86
char 1 95
char 1 66
char 1 85
char 1 76
char 1 76
char 1 69
char 1 84
char 1 0
align 1
LABELV $726
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
char 1 0
align 1
LABELV $725
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
char 1 0
align 1
LABELV $724
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
char 1 0
align 1
LABELV $723
char 1 69
char 1 86
char 1 95
char 1 68
char 1 69
char 1 66
char 1 82
char 1 73
char 1 83
char 1 0
align 1
LABELV $722
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
char 1 0
align 1
LABELV $721
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
char 1 0
align 1
LABELV $720
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
char 1 0
align 1
LABELV $719
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
char 1 0
align 1
LABELV $718
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
char 1 0
align 1
LABELV $717
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
char 1 0
align 1
LABELV $716
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
char 1 0
align 1
LABELV $715
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
char 1 0
align 1
LABELV $714
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
char 1 0
align 1
LABELV $713
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
char 1 0
align 1
LABELV $712
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
char 1 0
align 1
LABELV $711
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
char 1 0
align 1
LABELV $710
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
char 1 0
align 1
LABELV $709
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
char 1 0
align 1
LABELV $708
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
char 1 0
align 1
LABELV $707
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
char 1 0
align 1
LABELV $706
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
char 1 53
char 1 0
align 1
LABELV $705
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
char 1 0
align 1
LABELV $704
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
char 1 0
align 1
LABELV $703
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
char 1 0
align 1
LABELV $702
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
char 1 0
align 1
LABELV $701
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
char 1 0
align 1
LABELV $700
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
char 1 0
align 1
LABELV $699
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
char 1 0
align 1
LABELV $698
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
char 1 0
align 1
LABELV $697
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
char 1 0
align 1
LABELV $696
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
char 1 0
align 1
LABELV $695
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
char 1 0
align 1
LABELV $694
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
char 1 0
align 1
LABELV $693
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
char 1 0
align 1
LABELV $692
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
char 1 0
align 1
LABELV $691
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
char 1 0
align 1
LABELV $690
char 1 69
char 1 86
char 1 95
char 1 85
char 1 83
char 1 69
char 1 0
align 1
LABELV $689
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
char 1 0
align 1
LABELV $688
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
char 1 0
align 1
LABELV $687
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
char 1 0
align 1
LABELV $686
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
char 1 0
align 1
LABELV $685
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
char 1 0
align 1
LABELV $684
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
char 1 0
align 1
LABELV $683
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
char 1 0
align 1
LABELV $682
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
char 1 0
align 1
LABELV $681
char 1 69
char 1 86
char 1 95
char 1 66
char 1 69
char 1 67
char 1 79
char 1 77
char 1 69
char 1 95
char 1 74
char 1 69
char 1 68
char 1 73
char 1 77
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 0
align 1
LABELV $680
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
char 1 0
align 1
LABELV $679
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
char 1 0
align 1
LABELV $678
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
char 1 0
align 1
LABELV $677
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
char 1 0
align 1
LABELV $676
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
char 1 0
align 1
LABELV $675
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
char 1 0
align 1
LABELV $674
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
char 1 0
align 1
LABELV $673
char 1 69
char 1 86
char 1 95
char 1 78
char 1 79
char 1 65
char 1 77
char 1 77
char 1 79
char 1 0
align 1
LABELV $672
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
char 1 0
align 1
LABELV $671
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
char 1 0
align 1
LABELV $670
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
char 1 0
align 1
LABELV $669
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
char 1 0
align 1
LABELV $668
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
char 1 0
align 1
LABELV $667
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
char 1 0
align 1
LABELV $666
char 1 69
char 1 86
char 1 95
char 1 82
char 1 79
char 1 76
char 1 76
char 1 0
align 1
LABELV $665
char 1 69
char 1 86
char 1 95
char 1 74
char 1 85
char 1 77
char 1 80
char 1 0
align 1
LABELV $664
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
char 1 0
align 1
LABELV $663
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
char 1 0
align 1
LABELV $662
char 1 69
char 1 86
char 1 95
char 1 70
char 1 65
char 1 76
char 1 76
char 1 0
align 1
LABELV $661
char 1 69
char 1 86
char 1 95
char 1 83
char 1 84
char 1 69
char 1 80
char 1 95
char 1 49
char 1 54
char 1 0
align 1
LABELV $660
char 1 69
char 1 86
char 1 95
char 1 83
char 1 84
char 1 69
char 1 80
char 1 95
char 1 49
char 1 50
char 1 0
align 1
LABELV $659
char 1 69
char 1 86
char 1 95
char 1 83
char 1 84
char 1 69
char 1 80
char 1 95
char 1 56
char 1 0
align 1
LABELV $658
char 1 69
char 1 86
char 1 95
char 1 83
char 1 84
char 1 69
char 1 80
char 1 95
char 1 52
char 1 0
align 1
LABELV $657
char 1 69
char 1 86
char 1 95
char 1 83
char 1 87
char 1 73
char 1 77
char 1 0
align 1
LABELV $656
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
char 1 0
align 1
LABELV $655
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
char 1 0
align 1
LABELV $654
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
char 1 0
align 1
LABELV $653
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
char 1 0
align 1
LABELV $652
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
char 1 0
align 1
LABELV $651
char 1 69
char 1 86
char 1 95
char 1 78
char 1 79
char 1 78
char 1 69
char 1 0
align 1
LABELV $649
char 1 66
char 1 71
char 1 95
char 1 69
char 1 118
char 1 97
char 1 108
char 1 117
char 1 97
char 1 116
char 1 101
char 1 84
char 1 114
char 1 97
char 1 106
char 1 101
char 1 99
char 1 116
char 1 111
char 1 114
char 1 121
char 1 68
char 1 101
char 1 108
char 1 116
char 1 97
char 1 58
char 1 32
char 1 117
char 1 110
char 1 107
char 1 110
char 1 111
char 1 119
char 1 110
char 1 32
char 1 116
char 1 114
char 1 84
char 1 121
char 1 112
char 1 101
char 1 58
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $636
char 1 66
char 1 71
char 1 95
char 1 69
char 1 118
char 1 97
char 1 108
char 1 117
char 1 97
char 1 116
char 1 101
char 1 84
char 1 114
char 1 97
char 1 106
char 1 101
char 1 99
char 1 116
char 1 111
char 1 114
char 1 121
char 1 58
char 1 32
char 1 91
char 1 67
char 1 76
char 1 73
char 1 69
char 1 78
char 1 84
char 1 71
char 1 65
char 1 77
char 1 69
char 1 32
char 1 83
char 1 73
char 1 68
char 1 69
char 1 93
char 1 32
char 1 117
char 1 110
char 1 107
char 1 110
char 1 111
char 1 119
char 1 110
char 1 32
char 1 116
char 1 114
char 1 84
char 1 121
char 1 112
char 1 101
char 1 58
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $621
char 1 66
char 1 71
char 1 95
char 1 67
char 1 97
char 1 110
char 1 73
char 1 116
char 1 101
char 1 109
char 1 66
char 1 101
char 1 71
char 1 114
char 1 97
char 1 98
char 1 98
char 1 101
char 1 100
char 1 58
char 1 32
char 1 73
char 1 84
char 1 95
char 1 66
char 1 65
char 1 68
char 1 0
align 1
LABELV $547
char 1 66
char 1 71
char 1 95
char 1 67
char 1 97
char 1 110
char 1 73
char 1 116
char 1 101
char 1 109
char 1 66
char 1 101
char 1 71
char 1 114
char 1 97
char 1 98
char 1 98
char 1 101
char 1 100
char 1 58
char 1 32
char 1 105
char 1 110
char 1 100
char 1 101
char 1 120
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
LABELV $464
char 1 67
char 1 111
char 1 117
char 1 108
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
char 1 105
char 1 116
char 1 101
char 1 109
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $455
char 1 72
char 1 111
char 1 108
char 1 100
char 1 97
char 1 98
char 1 108
char 1 101
char 1 73
char 1 116
char 1 101
char 1 109
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
char 1 0
align 1
LABELV $399
char 1 105
char 1 99
char 1 111
char 1 110
char 1 115
char 1 47
char 1 105
char 1 99
char 1 111
char 1 110
char 1 104
char 1 95
char 1 98
char 1 111
char 1 114
char 1 98
char 1 0
align 1
LABELV $398
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 117
char 1 112
char 1 115
char 1 47
char 1 111
char 1 114
char 1 98
char 1 47
char 1 98
char 1 95
char 1 111
char 1 114
char 1 98
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $397
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 99
char 1 117
char 1 98
char 1 101
char 1 0
align 1
LABELV $396
char 1 105
char 1 99
char 1 111
char 1 110
char 1 115
char 1 47
char 1 105
char 1 99
char 1 111
char 1 110
char 1 104
char 1 95
char 1 114
char 1 111
char 1 114
char 1 98
char 1 0
align 1
LABELV $395
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 117
char 1 112
char 1 115
char 1 47
char 1 111
char 1 114
char 1 98
char 1 47
char 1 114
char 1 95
char 1 111
char 1 114
char 1 98
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $394
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 114
char 1 101
char 1 100
char 1 99
char 1 117
char 1 98
char 1 101
char 1 0
align 1
LABELV $393
char 1 105
char 1 99
char 1 111
char 1 110
char 1 115
char 1 47
char 1 105
char 1 99
char 1 111
char 1 110
char 1 102
char 1 95
char 1 110
char 1 101
char 1 117
char 1 116
char 1 114
char 1 97
char 1 108
char 1 49
char 1 0
align 1
LABELV $392
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 102
char 1 108
char 1 97
char 1 103
char 1 115
char 1 47
char 1 110
char 1 95
char 1 102
char 1 108
char 1 97
char 1 103
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $391
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 110
char 1 101
char 1 117
char 1 116
char 1 114
char 1 97
char 1 108
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $390
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 109
char 1 112
char 1 105
char 1 95
char 1 98
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $389
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 102
char 1 108
char 1 97
char 1 103
char 1 115
char 1 47
char 1 98
char 1 95
char 1 102
char 1 108
char 1 97
char 1 103
char 1 95
char 1 121
char 1 115
char 1 97
char 1 108
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $388
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 102
char 1 108
char 1 97
char 1 103
char 1 115
char 1 47
char 1 98
char 1 95
char 1 102
char 1 108
char 1 97
char 1 103
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $387
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $386
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 109
char 1 112
char 1 105
char 1 95
char 1 114
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $385
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 102
char 1 108
char 1 97
char 1 103
char 1 115
char 1 47
char 1 114
char 1 95
char 1 102
char 1 108
char 1 97
char 1 103
char 1 95
char 1 121
char 1 115
char 1 97
char 1 108
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $384
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 102
char 1 108
char 1 97
char 1 103
char 1 115
char 1 47
char 1 114
char 1 95
char 1 102
char 1 108
char 1 97
char 1 103
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $383
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 114
char 1 101
char 1 100
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $382
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 112
char 1 47
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 114
char 1 111
char 1 99
char 1 107
char 1 101
char 1 116
char 1 115
char 1 0
align 1
LABELV $381
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 105
char 1 116
char 1 101
char 1 109
char 1 115
char 1 47
char 1 114
char 1 111
char 1 99
char 1 107
char 1 101
char 1 116
char 1 115
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $380
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 114
char 1 111
char 1 99
char 1 107
char 1 101
char 1 116
char 1 115
char 1 0
align 1
LABELV $379
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 112
char 1 47
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 109
char 1 101
char 1 116
char 1 97
char 1 108
char 1 108
char 1 105
char 1 99
char 1 95
char 1 98
char 1 111
char 1 108
char 1 116
char 1 115
char 1 0
align 1
LABELV $378
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 105
char 1 116
char 1 101
char 1 109
char 1 115
char 1 47
char 1 109
char 1 101
char 1 116
char 1 97
char 1 108
char 1 108
char 1 105
char 1 99
char 1 95
char 1 98
char 1 111
char 1 108
char 1 116
char 1 115
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $377
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 109
char 1 101
char 1 116
char 1 97
char 1 108
char 1 108
char 1 105
char 1 99
char 1 95
char 1 98
char 1 111
char 1 108
char 1 116
char 1 115
char 1 0
align 1
LABELV $376
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 112
char 1 47
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 95
char 1 99
char 1 101
char 1 108
char 1 108
char 1 0
align 1
LABELV $375
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 105
char 1 116
char 1 101
char 1 109
char 1 115
char 1 47
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 95
char 1 99
char 1 101
char 1 108
char 1 108
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $374
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 99
char 1 101
char 1 108
char 1 108
char 1 0
align 1
LABELV $373
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 105
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 98
char 1 97
char 1 116
char 1 116
char 1 101
char 1 114
char 1 121
char 1 0
align 1
LABELV $372
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $371
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 105
char 1 116
char 1 101
char 1 109
char 1 115
char 1 47
char 1 101
char 1 110
char 1 101
char 1 114
char 1 103
char 1 121
char 1 95
char 1 99
char 1 101
char 1 108
char 1 108
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $370
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 47
char 1 112
char 1 105
char 1 99
char 1 107
char 1 117
char 1 112
char 1 101
char 1 110
char 1 101
char 1 114
char 1 103
char 1 121
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $369
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 0
align 1
LABELV $368
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 116
char 1 117
char 1 114
char 1 114
char 1 101
char 1 116
char 1 119
char 1 112
char 1 0
align 1
LABELV $367
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 101
char 1 109
char 1 112
char 1 108
char 1 97
char 1 99
char 1 101
char 1 100
char 1 0
align 1
LABELV $366
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 100
char 1 101
char 1 116
char 1 95
char 1 112
char 1 97
char 1 99
char 1 107
char 1 0
align 1
LABELV $365
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 116
char 1 114
char 1 105
char 1 112
char 1 95
char 1 109
char 1 105
char 1 110
char 1 101
char 1 0
align 1
LABELV $364
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 0
align 1
LABELV $363
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 100
char 1 101
char 1 116
char 1 112
char 1 97
char 1 99
char 1 107
char 1 0
align 1
LABELV $362
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 100
char 1 101
char 1 116
char 1 112
char 1 97
char 1 99
char 1 107
char 1 47
char 1 100
char 1 101
char 1 116
char 1 95
char 1 112
char 1 97
char 1 99
char 1 107
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $361
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 100
char 1 101
char 1 116
char 1 112
char 1 97
char 1 99
char 1 107
char 1 47
char 1 100
char 1 101
char 1 116
char 1 95
char 1 112
char 1 97
char 1 99
char 1 107
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $360
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 100
char 1 101
char 1 116
char 1 112
char 1 97
char 1 99
char 1 107
char 1 47
char 1 100
char 1 101
char 1 116
char 1 95
char 1 112
char 1 97
char 1 99
char 1 107
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $359
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 100
char 1 101
char 1 116
char 1 112
char 1 97
char 1 99
char 1 107
char 1 47
char 1 100
char 1 101
char 1 116
char 1 95
char 1 112
char 1 97
char 1 99
char 1 107
char 1 95
char 1 112
char 1 117
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $358
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 100
char 1 101
char 1 116
char 1 112
char 1 97
char 1 99
char 1 107
char 1 0
align 1
LABELV $357
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 116
char 1 114
char 1 105
char 1 112
char 1 109
char 1 105
char 1 110
char 1 101
char 1 0
align 1
LABELV $356
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 108
char 1 97
char 1 115
char 1 101
char 1 114
char 1 95
char 1 116
char 1 114
char 1 97
char 1 112
char 1 47
char 1 108
char 1 97
char 1 115
char 1 101
char 1 114
char 1 95
char 1 116
char 1 114
char 1 97
char 1 112
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $355
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 108
char 1 97
char 1 115
char 1 101
char 1 114
char 1 95
char 1 116
char 1 114
char 1 97
char 1 112
char 1 47
char 1 108
char 1 97
char 1 115
char 1 101
char 1 114
char 1 95
char 1 116
char 1 114
char 1 97
char 1 112
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $354
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 108
char 1 97
char 1 115
char 1 101
char 1 114
char 1 95
char 1 116
char 1 114
char 1 97
char 1 112
char 1 47
char 1 108
char 1 97
char 1 115
char 1 101
char 1 114
char 1 95
char 1 116
char 1 114
char 1 97
char 1 112
char 1 95
char 1 112
char 1 117
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $353
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 116
char 1 114
char 1 105
char 1 112
char 1 109
char 1 105
char 1 110
char 1 101
char 1 0
align 1
LABELV $352
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 0
align 1
LABELV $351
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 47
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $350
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 47
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $349
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 47
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 95
char 1 112
char 1 117
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $348
char 1 97
char 1 109
char 1 109
char 1 111
char 1 95
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 0
align 1
LABELV $347
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 109
char 1 101
char 1 114
char 1 114
char 1 115
char 1 111
char 1 110
char 1 110
char 1 0
align 1
LABELV $346
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 109
char 1 101
char 1 114
char 1 114
char 1 95
char 1 115
char 1 111
char 1 110
char 1 110
char 1 47
char 1 109
char 1 101
char 1 114
char 1 114
char 1 95
char 1 115
char 1 111
char 1 110
char 1 110
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $345
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 109
char 1 101
char 1 114
char 1 114
char 1 95
char 1 115
char 1 111
char 1 110
char 1 110
char 1 47
char 1 109
char 1 101
char 1 114
char 1 114
char 1 95
char 1 115
char 1 111
char 1 110
char 1 110
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $344
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 114
char 1 111
char 1 99
char 1 107
char 1 101
char 1 116
char 1 95
char 1 108
char 1 97
char 1 117
char 1 110
char 1 99
char 1 104
char 1 101
char 1 114
char 1 0
align 1
LABELV $343
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 102
char 1 108
char 1 101
char 1 99
char 1 104
char 1 101
char 1 116
char 1 116
char 1 101
char 1 0
align 1
LABELV $342
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 103
char 1 111
char 1 108
char 1 97
char 1 110
char 1 95
char 1 97
char 1 114
char 1 109
char 1 115
char 1 47
char 1 103
char 1 111
char 1 108
char 1 97
char 1 110
char 1 95
char 1 97
char 1 114
char 1 109
char 1 115
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $341
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 103
char 1 111
char 1 108
char 1 97
char 1 110
char 1 95
char 1 97
char 1 114
char 1 109
char 1 115
char 1 47
char 1 103
char 1 111
char 1 108
char 1 97
char 1 110
char 1 95
char 1 97
char 1 114
char 1 109
char 1 115
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $340
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 102
char 1 108
char 1 101
char 1 99
char 1 104
char 1 101
char 1 116
char 1 116
char 1 101
char 1 0
align 1
LABELV $339
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 100
char 1 101
char 1 109
char 1 112
char 1 50
char 1 0
align 1
LABELV $338
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 100
char 1 101
char 1 109
char 1 112
char 1 50
char 1 47
char 1 100
char 1 101
char 1 109
char 1 112
char 1 50
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $337
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 100
char 1 101
char 1 109
char 1 112
char 1 50
char 1 47
char 1 100
char 1 101
char 1 109
char 1 112
char 1 50
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $336
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 100
char 1 101
char 1 109
char 1 112
char 1 50
char 1 0
align 1
LABELV $335
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 114
char 1 101
char 1 112
char 1 101
char 1 97
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $334
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 104
char 1 101
char 1 97
char 1 118
char 1 121
char 1 95
char 1 114
char 1 101
char 1 112
char 1 101
char 1 97
char 1 116
char 1 101
char 1 114
char 1 47
char 1 104
char 1 101
char 1 97
char 1 118
char 1 121
char 1 95
char 1 114
char 1 101
char 1 112
char 1 101
char 1 97
char 1 116
char 1 101
char 1 114
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $333
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 104
char 1 101
char 1 97
char 1 118
char 1 121
char 1 95
char 1 114
char 1 101
char 1 112
char 1 101
char 1 97
char 1 116
char 1 101
char 1 114
char 1 47
char 1 104
char 1 101
char 1 97
char 1 118
char 1 121
char 1 95
char 1 114
char 1 101
char 1 112
char 1 101
char 1 97
char 1 116
char 1 101
char 1 114
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $332
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 114
char 1 101
char 1 112
char 1 101
char 1 97
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $331
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 98
char 1 111
char 1 119
char 1 99
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $330
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 98
char 1 111
char 1 119
char 1 99
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 47
char 1 98
char 1 111
char 1 119
char 1 99
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $329
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 98
char 1 111
char 1 119
char 1 99
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 47
char 1 98
char 1 111
char 1 119
char 1 99
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $328
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 98
char 1 111
char 1 119
char 1 99
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $327
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 100
char 1 105
char 1 115
char 1 114
char 1 117
char 1 112
char 1 116
char 1 111
char 1 114
char 1 0
align 1
LABELV $326
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
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
char 1 100
char 1 105
char 1 115
char 1 114
char 1 117
char 1 112
char 1 116
char 1 111
char 1 114
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $325
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
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
char 1 100
char 1 105
char 1 115
char 1 114
char 1 117
char 1 112
char 1 116
char 1 111
char 1 114
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $324
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 100
char 1 105
char 1 115
char 1 114
char 1 117
char 1 112
char 1 116
char 1 111
char 1 114
char 1 0
align 1
LABELV $323
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $322
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 95
char 1 114
char 1 47
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $321
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 95
char 1 114
char 1 47
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $320
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $319
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 114
char 1 105
char 1 102
char 1 108
char 1 101
char 1 0
align 1
LABELV $318
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 98
char 1 114
char 1 105
char 1 97
char 1 114
char 1 95
char 1 112
char 1 105
char 1 115
char 1 116
char 1 111
char 1 108
char 1 47
char 1 98
char 1 114
char 1 105
char 1 97
char 1 114
char 1 95
char 1 112
char 1 105
char 1 115
char 1 116
char 1 111
char 1 108
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $317
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 98
char 1 114
char 1 105
char 1 97
char 1 114
char 1 95
char 1 112
char 1 105
char 1 115
char 1 116
char 1 111
char 1 108
char 1 47
char 1 98
char 1 114
char 1 105
char 1 97
char 1 114
char 1 95
char 1 112
char 1 105
char 1 115
char 1 116
char 1 111
char 1 108
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $316
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 98
char 1 114
char 1 121
char 1 97
char 1 114
char 1 95
char 1 112
char 1 105
char 1 115
char 1 116
char 1 111
char 1 108
char 1 0
align 1
LABELV $315
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 0
align 1
LABELV $314
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
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
char 1 95
char 1 119
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $313
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
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
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $312
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 0
align 1
LABELV $311
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 119
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 115
char 1 116
char 1 117
char 1 110
char 1 98
char 1 97
char 1 116
char 1 111
char 1 110
char 1 0
align 1
LABELV $310
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 115
char 1 116
char 1 117
char 1 110
char 1 95
char 1 98
char 1 97
char 1 116
char 1 111
char 1 110
char 1 47
char 1 98
char 1 97
char 1 116
char 1 111
char 1 110
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $309
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 115
char 1 116
char 1 117
char 1 110
char 1 95
char 1 98
char 1 97
char 1 116
char 1 111
char 1 110
char 1 47
char 1 98
char 1 97
char 1 116
char 1 111
char 1 110
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $308
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 95
char 1 115
char 1 116
char 1 117
char 1 110
char 1 95
char 1 98
char 1 97
char 1 116
char 1 111
char 1 110
char 1 0
align 1
LABELV $307
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 109
char 1 112
char 1 105
char 1 95
char 1 121
char 1 115
char 1 97
char 1 109
char 1 97
char 1 114
char 1 105
char 1 0
align 1
LABELV $306
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 121
char 1 115
char 1 97
char 1 108
char 1 105
char 1 109
char 1 97
char 1 114
char 1 105
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $305
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 47
char 1 121
char 1 115
char 1 97
char 1 108
char 1 105
char 1 109
char 1 97
char 1 114
char 1 105
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $304
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 121
char 1 115
char 1 97
char 1 108
char 1 105
char 1 109
char 1 97
char 1 114
char 1 105
char 1 0
align 1
LABELV $303
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 109
char 1 112
char 1 105
char 1 95
char 1 102
char 1 98
char 1 111
char 1 111
char 1 110
char 1 0
align 1
LABELV $302
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 98
char 1 111
char 1 111
char 1 110
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $301
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 47
char 1 98
char 1 111
char 1 111
char 1 110
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $300
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 98
char 1 111
char 1 111
char 1 110
char 1 0
align 1
LABELV $299
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 109
char 1 112
char 1 105
char 1 95
char 1 100
char 1 107
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 0
align 1
LABELV $298
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 100
char 1 107
char 1 95
char 1 101
char 1 110
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 101
char 1 110
char 1 109
char 1 101
char 1 110
char 1 116
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $297
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 101
char 1 110
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 101
char 1 110
char 1 95
char 1 100
char 1 97
char 1 114
char 1 107
char 1 0
align 1
LABELV $296
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 109
char 1 112
char 1 105
char 1 95
char 1 106
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 0
align 1
LABELV $295
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 106
char 1 101
char 1 100
char 1 105
char 1 95
char 1 101
char 1 110
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 101
char 1 110
char 1 109
char 1 101
char 1 110
char 1 116
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $294
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 47
char 1 101
char 1 110
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 101
char 1 110
char 1 109
char 1 101
char 1 110
char 1 116
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $293
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 95
char 1 101
char 1 110
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 101
char 1 110
char 1 95
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 0
align 1
LABELV $292
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 105
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 115
char 1 101
char 1 110
char 1 116
char 1 114
char 1 121
char 1 103
char 1 117
char 1 110
char 1 0
align 1
LABELV $291
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 105
char 1 116
char 1 101
char 1 109
char 1 115
char 1 47
char 1 112
char 1 115
char 1 103
char 1 117
char 1 110
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $290
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 115
char 1 101
char 1 110
char 1 116
char 1 114
char 1 121
char 1 95
char 1 103
char 1 117
char 1 110
char 1 0
align 1
LABELV $289
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 105
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 122
char 1 111
char 1 111
char 1 109
char 1 0
align 1
LABELV $288
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 105
char 1 116
char 1 101
char 1 109
char 1 115
char 1 47
char 1 98
char 1 105
char 1 110
char 1 111
char 1 99
char 1 117
char 1 108
char 1 97
char 1 114
char 1 115
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $287
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 98
char 1 105
char 1 110
char 1 111
char 1 99
char 1 117
char 1 108
char 1 97
char 1 114
char 1 115
char 1 0
align 1
LABELV $286
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 105
char 1 116
char 1 101
char 1 109
char 1 115
char 1 47
char 1 100
char 1 97
char 1 116
char 1 97
char 1 112
char 1 97
char 1 100
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $285
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 100
char 1 97
char 1 116
char 1 97
char 1 112
char 1 97
char 1 100
char 1 0
align 1
LABELV $284
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 105
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 98
char 1 97
char 1 99
char 1 116
char 1 97
char 1 0
align 1
LABELV $283
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 98
char 1 97
char 1 99
char 1 116
char 1 97
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $282
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 109
char 1 101
char 1 100
char 1 112
char 1 97
char 1 99
char 1 0
align 1
LABELV $281
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
char 1 101
char 1 116
char 1 112
char 1 97
char 1 99
char 1 107
char 1 47
char 1 115
char 1 116
char 1 105
char 1 99
char 1 107
char 1 46
char 1 119
char 1 97
char 1 118
char 1 32
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
char 1 100
char 1 111
char 1 111
char 1 114
char 1 115
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 102
char 1 105
char 1 101
char 1 108
char 1 100
char 1 95
char 1 111
char 1 110
char 1 46
char 1 119
char 1 97
char 1 118
char 1 32
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
char 1 100
char 1 111
char 1 111
char 1 114
char 1 115
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 102
char 1 105
char 1 101
char 1 108
char 1 100
char 1 95
char 1 111
char 1 102
char 1 102
char 1 46
char 1 119
char 1 97
char 1 118
char 1 32
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
char 1 100
char 1 111
char 1 111
char 1 114
char 1 115
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 102
char 1 105
char 1 101
char 1 108
char 1 100
char 1 95
char 1 108
char 1 112
char 1 46
char 1 119
char 1 97
char 1 118
char 1 32
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 101
char 1 102
char 1 102
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 98
char 1 117
char 1 109
char 1 112
char 1 102
char 1 105
char 1 101
char 1 108
char 1 100
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $280
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 105
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 119
char 1 97
char 1 108
char 1 108
char 1 0
align 1
LABELV $279
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $278
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 0
align 1
LABELV $277
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 105
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 115
char 1 101
char 1 101
char 1 107
char 1 101
char 1 114
char 1 0
align 1
LABELV $276
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 105
char 1 116
char 1 101
char 1 109
char 1 115
char 1 47
char 1 114
char 1 101
char 1 109
char 1 111
char 1 116
char 1 101
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $275
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
char 1 119
char 1 95
char 1 112
char 1 107
char 1 117
char 1 112
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $274
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 115
char 1 101
char 1 101
char 1 107
char 1 101
char 1 114
char 1 0
align 1
LABELV $273
char 1 103
char 1 102
char 1 120
char 1 47
char 1 104
char 1 117
char 1 100
char 1 47
char 1 105
char 1 95
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 109
char 1 101
char 1 100
char 1 107
char 1 105
char 1 116
char 1 0
align 1
LABELV $272
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 109
char 1 101
char 1 100
char 1 112
char 1 97
char 1 99
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $271
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 47
char 1 112
char 1 105
char 1 99
char 1 107
char 1 117
char 1 112
char 1 104
char 1 101
char 1 97
char 1 108
char 1 116
char 1 104
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $270
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 109
char 1 101
char 1 100
char 1 112
char 1 97
char 1 107
char 1 95
char 1 105
char 1 110
char 1 115
char 1 116
char 1 97
char 1 110
char 1 116
char 1 0
align 1
LABELV $269
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 112
char 1 47
char 1 108
char 1 97
char 1 114
char 1 103
char 1 101
char 1 95
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 0
align 1
LABELV $268
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 112
char 1 115
char 1 100
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $267
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 95
char 1 108
char 1 114
char 1 103
char 1 95
char 1 105
char 1 110
char 1 115
char 1 116
char 1 97
char 1 110
char 1 116
char 1 0
align 1
LABELV $266
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 112
char 1 47
char 1 115
char 1 109
char 1 97
char 1 108
char 1 108
char 1 95
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 0
align 1
LABELV $265
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 109
char 1 97
char 1 112
char 1 95
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 109
char 1 112
char 1 47
char 1 112
char 1 115
char 1 100
char 1 95
char 1 115
char 1 109
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $264
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 47
char 1 112
char 1 105
char 1 99
char 1 107
char 1 117
char 1 112
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $263
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 95
char 1 115
char 1 109
char 1 95
char 1 105
char 1 110
char 1 115
char 1 116
char 1 97
char 1 110
char 1 116
char 1 0
align 1
LABELV $262
char 1 0
align 1
LABELV $261
char 1 37
char 1 105
char 1 0
align 1
LABELV $132
char 1 37
char 1 105
char 1 45
char 1 0
align 1
LABELV $131
char 1 55
char 1 45
char 1 49
char 1 45
char 1 48
char 1 51
char 1 50
char 1 51
char 1 51
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 49
char 1 51
char 1 51
char 1 51
char 1 0
align 1
LABELV $127
char 1 77
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 89
char 1 55
char 1 0
align 1
LABELV $126
char 1 77
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 89
char 1 54
char 1 0
align 1
LABELV $125
char 1 77
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 89
char 1 53
char 1 0
align 1
LABELV $124
char 1 77
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 89
char 1 52
char 1 0
align 1
LABELV $123
char 1 77
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 89
char 1 51
char 1 0
align 1
LABELV $122
char 1 77
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 89
char 1 50
char 1 0
align 1
LABELV $121
char 1 77
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 89
char 1 49
char 1 0
align 1
LABELV $120
char 1 77
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 89
char 1 48
char 1 0
