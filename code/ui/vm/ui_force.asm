data
export uiForceSide
align 4
LABELV uiForceSide
byte 4 1
export uiJediNonJedi
align 4
LABELV uiJediNonJedi
byte 4 -1
export uiForceRank
align 4
LABELV uiForceRank
byte 4 6
export uiMaxRank
align 4
LABELV uiMaxRank
byte 4 7
export uiMaxPoints
align 4
LABELV uiMaxPoints
byte 4 20
export uiForceUsed
align 4
LABELV uiForceUsed
byte 4 0
export uiForceAvailable
align 4
LABELV uiForceAvailable
byte 4 0
export gTouchedForce
align 4
LABELV gTouchedForce
byte 4 0
export uiForcePowersDisabled
align 4
LABELV uiForcePowersDisabled
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
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
export uiForcePowersRank
align 4
LABELV uiForcePowersRank
byte 4 0
byte 4 1
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
byte 4 0
byte 4 0
byte 4 1
byte 4 1
byte 4 0
export uiForcePowerDarkLight
align 4
LABELV uiForcePowerDarkLight
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
export UI_InitForceShaders
code
proc UI_InitForceShaders 96 4
file "../ui_force.c"
line 97
;1://
;2:/*
;3:=======================================================================
;4:
;5:FORCE INTERFACE 
;6:
;7:=======================================================================
;8:*/
;9:
;10:// use this to get a demo build without an explicit demo build, i.e. to get the demo ui files to build
;11:#include "ui_local.h"
;12:#include "../qcommon/qfiles.h"
;13:#include "ui_force.h"
;14:
;15:int uiForceSide = FORCE_LIGHTSIDE;
;16:int uiJediNonJedi = -1;
;17:int uiForceRank = FORCE_MASTERY_JEDI_KNIGHT;
;18:int uiMaxRank = MAX_FORCE_RANK;
;19:int uiMaxPoints = 20;
;20:int	uiForceUsed = 0;
;21:int uiForceAvailable=0;
;22:
;23:extern const char *UI_TeamName(int team);
;24:
;25:qboolean gTouchedForce = qfalse;
;26:vmCvar_t	ui_freeSaber, ui_forcePowerDisable;
;27:void Menu_ShowItemByName(menuDef_t *menu, const char *p, qboolean bShow);
;28:
;29:qboolean uiForcePowersDisabled[NUM_FORCE_POWERS] = {
;30:	qfalse,//FP_HEAL,//instant
;31:	qfalse,//FP_LEVITATION,//hold/duration
;32:	qfalse,//FP_SPEED,//duration
;33:	qfalse,//FP_PUSH,//hold/duration
;34:	qfalse,//FP_PULL,//hold/duration
;35:	qfalse,//FP_TELEPATHY,//instant
;36:	qfalse,//FP_GRIP,//hold/duration
;37:	qfalse,//FP_LIGHTNING,//hold/duration
;38:	qfalse,//FP_RAGE,//duration
;39:	qfalse,//FP_PROTECT,
;40:	qfalse,//FP_ABSORB,
;41:	qfalse,//FP_TEAM_HEAL,
;42:	qfalse,//FP_TEAM_FORCE,
;43:	qfalse,//FP_DRAIN,
;44:	qfalse,//FP_SEE,
;45:	qfalse,//FP_SABERATTACK,
;46:	qfalse,//FP_SABERDEFEND,
;47:	qfalse//FP_SABERTHROW,
;48:};
;49:
;50:int uiForcePowersRank[NUM_FORCE_POWERS] = {
;51:	0,//FP_HEAL = 0,//instant
;52:	1,//FP_LEVITATION,//hold/duration, this one defaults to 1 (gives a free point)
;53:	0,//FP_SPEED,//duration
;54:	0,//FP_PUSH,//hold/duration
;55:	0,//FP_PULL,//hold/duration
;56:	0,//FP_TELEPATHY,//instant
;57:	0,//FP_GRIP,//hold/duration
;58:	0,//FP_LIGHTNING,//hold/duration
;59:	0,//FP_RAGE,//duration
;60:	0,//FP_PROTECT,
;61:	0,//FP_ABSORB,
;62:	0,//FP_TEAM_HEAL,
;63:	0,//FP_TEAM_FORCE,
;64:	0,//FP_DRAIN,
;65:	0,//FP_SEE,
;66:	1,//FP_SABERATTACK, //default to 1 point in attack
;67:	1,//FP_SABERDEFEND, //defualt to 1 point in defense
;68:	0//FP_SABERTHROW,
;69:};
;70:
;71:int uiForcePowerDarkLight[NUM_FORCE_POWERS] = //0 == neutral
;72:{ //nothing should be usable at rank 0..
;73:	FORCE_LIGHTSIDE,//FP_HEAL,//instant
;74:	0,//FP_LEVITATION,//hold/duration
;75:	0,//FP_SPEED,//duration
;76:	0,//FP_PUSH,//hold/duration
;77:	0,//FP_PULL,//hold/duration
;78:	FORCE_LIGHTSIDE,//FP_TELEPATHY,//instant
;79:	FORCE_DARKSIDE,//FP_GRIP,//hold/duration
;80:	FORCE_DARKSIDE,//FP_LIGHTNING,//hold/duration
;81:	FORCE_DARKSIDE,//FP_RAGE,//duration
;82:	FORCE_LIGHTSIDE,//FP_PROTECT,//duration
;83:	FORCE_LIGHTSIDE,//FP_ABSORB,//duration
;84:	FORCE_LIGHTSIDE,//FP_TEAM_HEAL,//instant
;85:	FORCE_DARKSIDE,//FP_TEAM_FORCE,//instant
;86:	FORCE_DARKSIDE,//FP_DRAIN,//hold/duration
;87:	0,//FP_SEE,//duration
;88:	0,//FP_SABERATTACK,
;89:	0,//FP_SABERDEFEND,
;90:	0//FP_SABERTHROW,
;91:		//NUM_FORCE_POWERS
;92:};
;93:
;94:int uiForceStarShaders[NUM_FORCE_STAR_IMAGES][2];
;95:int uiSaberColorShaders[NUM_SABER_COLORS];
;96:void UI_InitForceShaders(void)
;97:{
line 98
;98:	uiForceStarShaders[0][0] = trap_R_RegisterShaderNoMip("forcestar0");
ADDRGP4 $150
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiForceStarShaders
ADDRLP4 0
INDIRI4
ASGNI4
line 99
;99:	uiForceStarShaders[0][1] = trap_R_RegisterShaderNoMip("forcestar0");
ADDRGP4 $150
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiForceStarShaders+4
ADDRLP4 4
INDIRI4
ASGNI4
line 100
;100:	uiForceStarShaders[1][0] = trap_R_RegisterShaderNoMip("forcecircle1");
ADDRGP4 $153
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiForceStarShaders+8
ADDRLP4 8
INDIRI4
ASGNI4
line 101
;101:	uiForceStarShaders[1][1] = trap_R_RegisterShaderNoMip("forcestar1");
ADDRGP4 $156
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiForceStarShaders+8+4
ADDRLP4 12
INDIRI4
ASGNI4
line 102
;102:	uiForceStarShaders[2][0] = trap_R_RegisterShaderNoMip("forcecircle2");
ADDRGP4 $158
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiForceStarShaders+16
ADDRLP4 16
INDIRI4
ASGNI4
line 103
;103:	uiForceStarShaders[2][1] = trap_R_RegisterShaderNoMip("forcestar2");
ADDRGP4 $161
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiForceStarShaders+16+4
ADDRLP4 20
INDIRI4
ASGNI4
line 104
;104:	uiForceStarShaders[3][0] = trap_R_RegisterShaderNoMip("forcecircle3");
ADDRGP4 $163
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiForceStarShaders+24
ADDRLP4 24
INDIRI4
ASGNI4
line 105
;105:	uiForceStarShaders[3][1] = trap_R_RegisterShaderNoMip("forcestar3");
ADDRGP4 $166
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiForceStarShaders+24+4
ADDRLP4 28
INDIRI4
ASGNI4
line 106
;106:	uiForceStarShaders[4][0] = trap_R_RegisterShaderNoMip("forcecircle4");
ADDRGP4 $168
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiForceStarShaders+32
ADDRLP4 32
INDIRI4
ASGNI4
line 107
;107:	uiForceStarShaders[4][1] = trap_R_RegisterShaderNoMip("forcestar4");
ADDRGP4 $171
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiForceStarShaders+32+4
ADDRLP4 36
INDIRI4
ASGNI4
line 108
;108:	uiForceStarShaders[5][0] = trap_R_RegisterShaderNoMip("forcecircle5");
ADDRGP4 $173
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiForceStarShaders+40
ADDRLP4 40
INDIRI4
ASGNI4
line 109
;109:	uiForceStarShaders[5][1] = trap_R_RegisterShaderNoMip("forcestar5");
ADDRGP4 $176
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiForceStarShaders+40+4
ADDRLP4 44
INDIRI4
ASGNI4
line 110
;110:	uiForceStarShaders[6][0] = trap_R_RegisterShaderNoMip("forcecircle6");
ADDRGP4 $178
ARGP4
ADDRLP4 48
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiForceStarShaders+48
ADDRLP4 48
INDIRI4
ASGNI4
line 111
;111:	uiForceStarShaders[6][1] = trap_R_RegisterShaderNoMip("forcestar6");
ADDRGP4 $181
ARGP4
ADDRLP4 52
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiForceStarShaders+48+4
ADDRLP4 52
INDIRI4
ASGNI4
line 112
;112:	uiForceStarShaders[7][0] = trap_R_RegisterShaderNoMip("forcecircle7");
ADDRGP4 $183
ARGP4
ADDRLP4 56
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiForceStarShaders+56
ADDRLP4 56
INDIRI4
ASGNI4
line 113
;113:	uiForceStarShaders[7][1] = trap_R_RegisterShaderNoMip("forcestar7");
ADDRGP4 $186
ARGP4
ADDRLP4 60
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiForceStarShaders+56+4
ADDRLP4 60
INDIRI4
ASGNI4
line 114
;114:	uiForceStarShaders[8][0] = trap_R_RegisterShaderNoMip("forcecircle8");
ADDRGP4 $188
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiForceStarShaders+64
ADDRLP4 64
INDIRI4
ASGNI4
line 115
;115:	uiForceStarShaders[8][1] = trap_R_RegisterShaderNoMip("forcestar8");
ADDRGP4 $191
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiForceStarShaders+64+4
ADDRLP4 68
INDIRI4
ASGNI4
line 117
;116:
;117:	uiSaberColorShaders[SABER_RED]		= trap_R_RegisterShaderNoMip("menu/art/saber_red");
ADDRGP4 $192
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiSaberColorShaders
ADDRLP4 72
INDIRI4
ASGNI4
line 118
;118:	uiSaberColorShaders[SABER_ORANGE]	= trap_R_RegisterShaderNoMip("menu/art/saber_orange");
ADDRGP4 $194
ARGP4
ADDRLP4 76
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiSaberColorShaders+4
ADDRLP4 76
INDIRI4
ASGNI4
line 119
;119:	uiSaberColorShaders[SABER_YELLOW]	= trap_R_RegisterShaderNoMip("menu/art/saber_yellow");
ADDRGP4 $196
ARGP4
ADDRLP4 80
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiSaberColorShaders+8
ADDRLP4 80
INDIRI4
ASGNI4
line 120
;120:	uiSaberColorShaders[SABER_GREEN]	= trap_R_RegisterShaderNoMip("menu/art/saber_green");
ADDRGP4 $198
ARGP4
ADDRLP4 84
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiSaberColorShaders+12
ADDRLP4 84
INDIRI4
ASGNI4
line 121
;121:	uiSaberColorShaders[SABER_BLUE]		= trap_R_RegisterShaderNoMip("menu/art/saber_blue");
ADDRGP4 $200
ARGP4
ADDRLP4 88
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiSaberColorShaders+16
ADDRLP4 88
INDIRI4
ASGNI4
line 122
;122:	uiSaberColorShaders[SABER_PURPLE]	= trap_R_RegisterShaderNoMip("menu/art/saber_purple");
ADDRGP4 $202
ARGP4
ADDRLP4 92
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiSaberColorShaders+20
ADDRLP4 92
INDIRI4
ASGNI4
line 123
;123:}
LABELV $149
endproc UI_InitForceShaders 96 4
lit
align 4
LABELV $215
byte 4 1045220557
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
export UI_DrawForceStars
code
proc UI_DrawForceStars 40 20
line 127
;124:
;125:// Draw the stars spent on the current force power
;126:void UI_DrawForceStars(rectDef_t *rect, float scale, vec4_t color, int textStyle, int forceindex, int val, int min, int max) 
;127:{
line 128
;128:	int	i,pad = 4;
ADDRLP4 16
CNSTI4 4
ASGNI4
line 129
;129:	int	xPos,width = 16;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 132
;130:	int starcolor;
;131:
;132:	if (val < min || val > max) 
ADDRLP4 20
ADDRFP4 20
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRFP4 24
INDIRI4
LTI4 $206
ADDRLP4 20
INDIRI4
ADDRFP4 28
INDIRI4
LEI4 $204
LABELV $206
line 133
;133:	{
line 134
;134:		val = min;
ADDRFP4 20
ADDRFP4 24
INDIRI4
ASGNI4
line 135
;135:	}
LABELV $204
line 137
;136:
;137:	if (1)	// if (val)
line 138
;138:	{
line 139
;139:		xPos = rect->x;
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRF4
CVFI4 4
ASGNI4
line 141
;140:
;141:		for (i=FORCE_LEVEL_1;i<=max;i++)
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $212
JUMPV
LABELV $209
line 142
;142:		{
line 143
;143:			starcolor = bgForcePowerCost[forceindex][i];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
ASGNI4
line 145
;144:
;145:			if (uiForcePowersDisabled[forceindex])
ADDRFP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersDisabled
ADDP4
INDIRI4
CNSTI4 0
EQI4 $213
line 146
;146:			{
line 147
;147:				vec4_t grColor = {0.2f, 0.2f, 0.2f, 1.0f};
ADDRLP4 24
ADDRGP4 $215
INDIRB
ASGNB 16
line 148
;148:				trap_R_SetColor(grColor);
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 149
;149:			}
LABELV $213
line 151
;150:
;151:			if (val >= i)
ADDRFP4 20
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $216
line 152
;152:			{	// Draw a star.
line 153
;153:				UI_DrawHandlePic( xPos, rect->y+6, width, width, uiForceStarShaders[starcolor][1] );
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1086324736
ADDF4
ARGF4
ADDRLP4 24
ADDRLP4 4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiForceStarShaders+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 154
;154:			}
ADDRGP4 $217
JUMPV
LABELV $216
line 156
;155:			else
;156:			{	// Draw a circle.
line 157
;157:				UI_DrawHandlePic( xPos, rect->y+6, width, width, uiForceStarShaders[starcolor][0] );
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1086324736
ADDF4
ARGF4
ADDRLP4 24
ADDRLP4 4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiForceStarShaders
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 158
;158:			}
LABELV $217
line 160
;159:
;160:			if (uiForcePowersDisabled[forceindex])
ADDRFP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersDisabled
ADDP4
INDIRI4
CNSTI4 0
EQI4 $219
line 161
;161:			{
line 162
;162:				trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 163
;163:			}
LABELV $219
line 165
;164:
;165:			xPos += width + pad;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ADDI4
ASGNI4
line 166
;166:		}
LABELV $210
line 141
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $212
ADDRLP4 0
INDIRI4
ADDRFP4 28
INDIRI4
LEI4 $209
line 167
;167:	}
LABELV $207
line 168
;168:}
LABELV $203
endproc UI_DrawForceStars 40 20
export UI_UpdateClientForcePowers
proc UI_UpdateClientForcePowers 12 84
line 172
;169:
;170:// Set the client's force power layout.
;171:void UI_UpdateClientForcePowers(const char *teamArg)
;172:{
line 173
;173:	trap_Cvar_Set( "forcepowers", va("%i-%i-%i%i%i%i%i%i%i%i%i%i%i%i%i%i%i%i%i%i",
ADDRGP4 $223
ARGP4
ADDRGP4 uiForceRank
INDIRI4
ARGI4
ADDRGP4 uiForceSide
INDIRI4
ARGI4
ADDRGP4 uiForcePowersRank
INDIRI4
ARGI4
ADDRGP4 uiForcePowersRank+4
INDIRI4
ARGI4
ADDRGP4 uiForcePowersRank+8
INDIRI4
ARGI4
ADDRGP4 uiForcePowersRank+12
INDIRI4
ARGI4
ADDRGP4 uiForcePowersRank+16
INDIRI4
ARGI4
ADDRGP4 uiForcePowersRank+20
INDIRI4
ARGI4
ADDRGP4 uiForcePowersRank+24
INDIRI4
ARGI4
ADDRGP4 uiForcePowersRank+28
INDIRI4
ARGI4
ADDRGP4 uiForcePowersRank+32
INDIRI4
ARGI4
ADDRGP4 uiForcePowersRank+36
INDIRI4
ARGI4
ADDRGP4 uiForcePowersRank+40
INDIRI4
ARGI4
ADDRGP4 uiForcePowersRank+44
INDIRI4
ARGI4
ADDRGP4 uiForcePowersRank+48
INDIRI4
ARGI4
ADDRGP4 uiForcePowersRank+52
INDIRI4
ARGI4
ADDRGP4 uiForcePowersRank+56
INDIRI4
ARGI4
ADDRGP4 uiForcePowersRank+60
INDIRI4
ARGI4
ADDRGP4 uiForcePowersRank+64
INDIRI4
ARGI4
ADDRGP4 uiForcePowersRank+68
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $222
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 182
;174:		uiForceRank, uiForceSide, uiForcePowersRank[0], uiForcePowersRank[1],
;175:		uiForcePowersRank[2], uiForcePowersRank[3], uiForcePowersRank[4],
;176:		uiForcePowersRank[5], uiForcePowersRank[6], uiForcePowersRank[7],
;177:		uiForcePowersRank[8], uiForcePowersRank[9], uiForcePowersRank[10],
;178:		uiForcePowersRank[11], uiForcePowersRank[12], uiForcePowersRank[13],
;179:		uiForcePowersRank[14], uiForcePowersRank[15], uiForcePowersRank[16],
;180:		uiForcePowersRank[17]) );
;181:
;182:	if (gTouchedForce)
ADDRGP4 gTouchedForce
INDIRI4
CNSTI4 0
EQI4 $241
line 183
;183:	{
line 184
;184:		if (teamArg && teamArg[0])
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $243
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $243
line 185
;185:		{
line 186
;186:			trap_Cmd_ExecuteText( EXEC_APPEND, va("forcechanged \"%s\"\n", teamArg) );
ADDRGP4 $245
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 187
;187:		}
ADDRGP4 $244
JUMPV
LABELV $243
line 189
;188:		else
;189:		{
line 190
;190:			trap_Cmd_ExecuteText( EXEC_APPEND, "forcechanged\n" );
CNSTI4 2
ARGI4
ADDRGP4 $246
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 191
;191:		}
LABELV $244
line 192
;192:	}
LABELV $241
line 194
;193:
;194:	gTouchedForce = qfalse;
ADDRGP4 gTouchedForce
CNSTI4 0
ASGNI4
line 195
;195:}
LABELV $221
endproc UI_UpdateClientForcePowers 12 84
export UI_TranslateFCFIndex
proc UI_TranslateFCFIndex 0 0
line 198
;196:
;197:int UI_TranslateFCFIndex(int index)
;198:{
line 199
;199:	if (uiForceSide == FORCE_LIGHTSIDE)
ADDRGP4 uiForceSide
INDIRI4
CNSTI4 1
NEI4 $248
line 200
;200:	{
line 201
;201:		return index-uiInfo.forceConfigLightIndexBegin;
ADDRFP4 0
INDIRI4
ADDRGP4 uiInfo+95192
INDIRI4
SUBI4
RETI4
ADDRGP4 $247
JUMPV
LABELV $248
line 204
;202:	}
;203:
;204:	return index-uiInfo.forceConfigDarkIndexBegin;
ADDRFP4 0
INDIRI4
ADDRGP4 uiInfo+95188
INDIRI4
SUBI4
RETI4
LABELV $247
endproc UI_TranslateFCFIndex 0 0
export UI_SaveForceTemplate
proc UI_SaveForceTemplate 568 20
line 208
;205:}
;206:
;207:void UI_SaveForceTemplate()
;208:{
line 209
;209:	char *selectedName = UI_Cvar_VariableString("ui_SaveFCF");
ADDRGP4 $253
ARGP4
ADDRLP4 540
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 540
INDIRP4
ASGNP4
line 213
;210:	char fcfString[512];
;211:	char forceStringValue[4];
;212:	fileHandle_t f;
;213:	int strPlace = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 214
;214:	int forcePlace = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 215
;215:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 216
;216:	qboolean foundFeederItem = qfalse;
ADDRLP4 532
CNSTI4 0
ASGNI4
line 218
;217:
;218:	if (!selectedName || !selectedName[0])
ADDRLP4 528
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $256
ADDRLP4 528
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $254
LABELV $256
line 219
;219:	{
line 220
;220:		Com_Printf("You did not provide a name for the template.\n");
ADDRGP4 $257
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 221
;221:		return;
ADDRGP4 $252
JUMPV
LABELV $254
line 224
;222:	}
;223:
;224:	if (uiForceSide == FORCE_LIGHTSIDE)
ADDRGP4 uiForceSide
INDIRI4
CNSTI4 1
NEI4 $258
line 225
;225:	{ //write it into the light side folder
line 226
;226:		trap_FS_FOpenFile(va("forcecfg/light/%s.fcf", selectedName), &f, FS_WRITE);
ADDRGP4 $260
ARGP4
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 548
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 548
INDIRP4
ARGP4
ADDRLP4 536
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 227
;227:	}
ADDRGP4 $259
JUMPV
LABELV $258
line 229
;228:	else
;229:	{ //if it isn't light it must be dark
line 230
;230:		trap_FS_FOpenFile(va("forcecfg/dark/%s.fcf", selectedName), &f, FS_WRITE);
ADDRGP4 $261
ARGP4
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 548
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 548
INDIRP4
ARGP4
ADDRLP4 536
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 231
;231:	}
LABELV $259
line 233
;232:
;233:	if (!f)
ADDRLP4 536
INDIRI4
CNSTI4 0
NEI4 $262
line 234
;234:	{
line 235
;235:		Com_Printf("There was an error writing the template file (read-only?).\n");
ADDRGP4 $264
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 236
;236:		return;
ADDRGP4 $252
JUMPV
LABELV $262
line 239
;237:	}
;238:
;239:	Com_sprintf(fcfString, sizeof(fcfString), "%i-%i-", uiForceRank, uiForceSide);
ADDRLP4 16
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 $265
ARGP4
ADDRGP4 uiForceRank
INDIRI4
ARGI4
ADDRGP4 uiForceSide
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 240
;240:	strPlace = strlen(fcfString);
ADDRLP4 16
ARGP4
ADDRLP4 548
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 548
INDIRI4
ASGNI4
ADDRGP4 $267
JUMPV
LABELV $266
line 243
;241:
;242:	while (forcePlace < NUM_FORCE_POWERS)
;243:	{
line 244
;244:		Com_sprintf(forceStringValue, sizeof(forceStringValue), "%i", uiForcePowersRank[forcePlace]);
ADDRLP4 8
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $269
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 246
;245:		//Just use the force digit even if multiple digits. Shouldn't be longer than 1.
;246:		fcfString[strPlace] = forceStringValue[0];
ADDRLP4 12
INDIRI4
ADDRLP4 16
ADDP4
ADDRLP4 8
INDIRI1
ASGNI1
line 247
;247:		strPlace++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 248
;248:		forcePlace++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 249
;249:	}
LABELV $267
line 242
ADDRLP4 4
INDIRI4
CNSTI4 18
LTI4 $266
line 250
;250:	fcfString[strPlace] = '\n';
ADDRLP4 12
INDIRI4
ADDRLP4 16
ADDP4
CNSTI1 10
ASGNI1
line 251
;251:	fcfString[strPlace+1] = 0;
ADDRLP4 12
INDIRI4
ADDRLP4 16+1
ADDP4
CNSTI1 0
ASGNI1
line 253
;252:
;253:	trap_FS_Write(fcfString, strlen(fcfString), f);
ADDRLP4 16
ARGP4
ADDRLP4 552
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16
ARGP4
ADDRLP4 552
INDIRI4
ARGI4
ADDRLP4 536
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 254
;254:	trap_FS_FCloseFile(f);
ADDRLP4 536
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 256
;255:
;256:	Com_Printf("Template saved as \"%s\".\n", selectedName);
ADDRGP4 $271
ARGP4
ADDRLP4 528
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 259
;257:
;258:	//Now, update the FCF list
;259:	UI_LoadForceConfig_List();
ADDRGP4 UI_LoadForceConfig_List
CALLV
pop
ADDRGP4 $273
JUMPV
LABELV $272
line 263
;260:
;261:	//Then, scroll through and select the template for the file we just saved
;262:	while (i < uiInfo.forceConfigCount)
;263:	{
line 264
;264:		if (!Q_stricmp(uiInfo.forceConfigNames[i], selectedName))
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 uiInfo+78292
ADDP4
ARGP4
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 556
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 556
INDIRI4
CNSTI4 0
NEI4 $276
line 265
;265:		{
line 266
;266:			if ((uiForceSide == FORCE_LIGHTSIDE && uiInfo.forceConfigSide[i]) ||
ADDRGP4 uiForceSide
INDIRI4
CNSTI4 1
NEI4 $284
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+94676
ADDP4
INDIRI4
CNSTI4 0
NEI4 $283
LABELV $284
ADDRLP4 560
CNSTI4 2
ASGNI4
ADDRGP4 uiForceSide
INDIRI4
ADDRLP4 560
INDIRI4
NEI4 $279
ADDRLP4 0
INDIRI4
ADDRLP4 560
INDIRI4
LSHI4
ADDRGP4 uiInfo+94676
ADDP4
INDIRI4
CNSTI4 0
NEI4 $279
LABELV $283
line 268
;267:				(uiForceSide == FORCE_DARKSIDE && !uiInfo.forceConfigSide[i]))
;268:			{
line 269
;269:				Menu_SetFeederSelection(NULL, FEEDER_FORCECFG, UI_TranslateFCFIndex(i), NULL);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 564
ADDRGP4 UI_TranslateFCFIndex
CALLI4
ASGNI4
CNSTP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRLP4 564
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 270
;270:				foundFeederItem = qtrue;
ADDRLP4 532
CNSTI4 1
ASGNI4
line 271
;271:			}
LABELV $279
line 272
;272:		}
LABELV $276
line 274
;273:
;274:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 275
;275:	}
LABELV $273
line 262
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+78284
INDIRI4
LTI4 $272
line 278
;276:
;277:	//Else, go back to 0
;278:	if (!foundFeederItem)
ADDRLP4 532
INDIRI4
CNSTI4 0
NEI4 $285
line 279
;279:	{
line 280
;280:		Menu_SetFeederSelection(NULL, FEEDER_FORCECFG, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 16
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 281
;281:	}
LABELV $285
line 282
;282:}
LABELV $252
endproc UI_SaveForceTemplate 568 20
export UpdateForceUsed
proc UpdateForceUsed 40 12
line 288
;283:
;284:
;285:// 
;286:extern qboolean UI_TrueJediEnabled( void );
;287:void UpdateForceUsed()
;288:{
line 293
;289:	int curpower, currank;
;290:	menuDef_t *menu;
;291:
;292:	// Currently we don't make a distinction between those that wish to play Jedi of lower than maximum skill.
;293:	uiForceRank = uiMaxRank;
ADDRGP4 uiForceRank
ADDRGP4 uiMaxRank
INDIRI4
ASGNI4
line 295
;294:
;295:	uiForceUsed = 0;
ADDRGP4 uiForceUsed
CNSTI4 0
ASGNI4
line 296
;296:	uiForceAvailable = forceMasteryPoints[uiForceRank];
ADDRGP4 uiForceAvailable
ADDRGP4 uiForceRank
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceMasteryPoints
ADDP4
INDIRI4
ASGNI4
line 299
;297:
;298:	// Make sure that we have one freebie in jump.
;299:	if (uiForcePowersRank[FP_LEVITATION]<1)
ADDRGP4 uiForcePowersRank+4
INDIRI4
CNSTI4 1
GEI4 $288
line 300
;300:	{
line 301
;301:		uiForcePowersRank[FP_LEVITATION]=1;
ADDRGP4 uiForcePowersRank+4
CNSTI4 1
ASGNI4
line 302
;302:	}
LABELV $288
line 304
;303:
;304:	if ( UI_TrueJediEnabled() )
ADDRLP4 12
ADDRGP4 UI_TrueJediEnabled
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $292
line 305
;305:	{//true jedi mode is set
line 306
;306:		if ( uiJediNonJedi == -1 )
ADDRGP4 uiJediNonJedi
INDIRI4
CNSTI4 -1
NEI4 $294
line 307
;307:		{
line 308
;308:			int x = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 309
;309:			qboolean clear = qfalse, update = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 24
CNSTI4 0
ASGNI4
line 310
;310:			uiJediNonJedi = FORCE_NONJEDI;
ADDRGP4 uiJediNonJedi
CNSTI4 0
ASGNI4
ADDRGP4 $297
JUMPV
LABELV $296
line 312
;311:			while ( x < NUM_FORCE_POWERS )
;312:			{//if any force power is set, we must be a jedi
line 313
;313:				if ( x == FP_LEVITATION || x == FP_SABERATTACK )
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $301
ADDRLP4 16
INDIRI4
CNSTI4 15
NEI4 $299
LABELV $301
line 314
;314:				{
line 315
;315:					if ( uiForcePowersRank[x] > 1 )
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
CNSTI4 1
LEI4 $302
line 316
;316:					{
line 317
;317:						uiJediNonJedi = FORCE_JEDI;
ADDRGP4 uiJediNonJedi
CNSTI4 1
ASGNI4
line 318
;318:						break;
ADDRGP4 $298
JUMPV
LABELV $302
line 320
;319:					}
;320:					else if ( uiForcePowersRank[x] > 0 )
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
CNSTI4 0
LEI4 $300
line 321
;321:					{
line 322
;322:						clear = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 323
;323:					}
line 324
;324:				}
ADDRGP4 $300
JUMPV
LABELV $299
line 325
;325:				else if ( uiForcePowersRank[x] > 0 )
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
CNSTI4 0
LEI4 $306
line 326
;326:				{
line 327
;327:					uiJediNonJedi = FORCE_JEDI;
ADDRGP4 uiJediNonJedi
CNSTI4 1
ASGNI4
line 328
;328:					break;
ADDRGP4 $298
JUMPV
LABELV $306
LABELV $300
line 330
;329:				}
;330:				x++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 331
;331:			}
LABELV $297
line 311
ADDRLP4 16
INDIRI4
CNSTI4 18
LTI4 $296
LABELV $298
line 332
;332:			if ( uiJediNonJedi == FORCE_JEDI )
ADDRGP4 uiJediNonJedi
INDIRI4
CNSTI4 1
NEI4 $308
line 333
;333:			{
line 334
;334:				if ( uiForcePowersRank[FP_SABERATTACK] < 1 )
ADDRGP4 uiForcePowersRank+60
INDIRI4
CNSTI4 1
GEI4 $309
line 335
;335:				{
line 336
;336:					uiForcePowersRank[FP_SABERATTACK]=1;
ADDRGP4 uiForcePowersRank+60
CNSTI4 1
ASGNI4
line 337
;337:					update = qtrue;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 338
;338:				}
line 339
;339:			}
ADDRGP4 $309
JUMPV
LABELV $308
line 340
;340:			else if ( clear )
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $314
line 341
;341:			{
line 342
;342:				x = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $317
JUMPV
LABELV $316
line 344
;343:				while ( x < NUM_FORCE_POWERS )
;344:				{//clear all force
line 345
;345:					uiForcePowersRank[x] = 0;
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
CNSTI4 0
ASGNI4
line 346
;346:					x++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 347
;347:				}
LABELV $317
line 343
ADDRLP4 16
INDIRI4
CNSTI4 18
LTI4 $316
line 348
;348:				update = qtrue;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 349
;349:			}
LABELV $314
LABELV $309
line 350
;350:			if ( update )
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $319
line 351
;351:			{
line 353
;352:				int myTeam;
;353:				myTeam = (int)(trap_Cvar_VariableValue("ui_myteam"));
ADDRGP4 $321
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 354
;354:				if ( myTeam != TEAM_SPECTATOR )
ADDRLP4 28
INDIRI4
CNSTI4 3
EQI4 $322
line 355
;355:				{
line 356
;356:					UI_UpdateClientForcePowers(UI_TeamName(myTeam));//will cause him to respawn, if it's been 5 seconds since last one
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 UI_TeamName
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 UI_UpdateClientForcePowers
CALLV
pop
line 357
;357:				}
ADDRGP4 $323
JUMPV
LABELV $322
line 359
;358:				else
;359:				{
line 360
;360:					UI_UpdateClientForcePowers(NULL);//just update powers
CNSTP4 0
ARGP4
ADDRGP4 UI_UpdateClientForcePowers
CALLV
pop
line 361
;361:				}
LABELV $323
line 362
;362:			}
LABELV $319
line 363
;363:		}
LABELV $294
line 364
;364:	}
LABELV $292
line 366
;365:
;366:	menu = Menus_FindByName("ingame_playerforce");
ADDRGP4 $324
ARGP4
ADDRLP4 16
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 368
;367:	// Set the cost of the saberattack according to whether its free.
;368:	if (ui_freeSaber.integer)
ADDRGP4 ui_freeSaber+12
INDIRI4
CNSTI4 0
EQI4 $325
line 369
;369:	{	// Make saber free
line 370
;370:		bgForcePowerCost[FP_SABERATTACK][FORCE_LEVEL_1] = 0;
ADDRGP4 bgForcePowerCost+240+4
CNSTI4 0
ASGNI4
line 371
;371:		bgForcePowerCost[FP_SABERDEFEND][FORCE_LEVEL_1] = 0;
ADDRGP4 bgForcePowerCost+256+4
CNSTI4 0
ASGNI4
line 373
;372:		// Make sure that we have one freebie in saber if applicable.
;373:		if (uiForcePowersRank[FP_SABERATTACK]<1)
ADDRGP4 uiForcePowersRank+60
INDIRI4
CNSTI4 1
GEI4 $332
line 374
;374:		{
line 375
;375:			uiForcePowersRank[FP_SABERATTACK]=1;
ADDRGP4 uiForcePowersRank+60
CNSTI4 1
ASGNI4
line 376
;376:		}
LABELV $332
line 377
;377:		if (uiForcePowersRank[FP_SABERDEFEND]<1)
ADDRGP4 uiForcePowersRank+64
INDIRI4
CNSTI4 1
GEI4 $336
line 378
;378:		{
line 379
;379:			uiForcePowersRank[FP_SABERDEFEND]=1;
ADDRGP4 uiForcePowersRank+64
CNSTI4 1
ASGNI4
line 380
;380:		}
LABELV $336
line 381
;381:		if (menu)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $326
line 382
;382:		{
line 383
;383:			Menu_ShowItemByName(menu, "setfp_saberdefend", qtrue);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $342
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 384
;384:			Menu_ShowItemByName(menu, "setfp_saberthrow", qtrue);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $343
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 385
;385:			Menu_ShowItemByName(menu, "effectentry", qtrue);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $344
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 386
;386:			Menu_ShowItemByName(menu, "effectfield", qtrue);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $345
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 387
;387:			Menu_ShowItemByName(menu, "nosaber", qfalse);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $346
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 388
;388:		}
line 389
;389:	}
ADDRGP4 $326
JUMPV
LABELV $325
line 391
;390:	else
;391:	{	// Make saber normal cost
line 392
;392:		bgForcePowerCost[FP_SABERATTACK][FORCE_LEVEL_1] = 1;
ADDRGP4 bgForcePowerCost+240+4
CNSTI4 1
ASGNI4
line 393
;393:		bgForcePowerCost[FP_SABERDEFEND][FORCE_LEVEL_1] = 1;
ADDRGP4 bgForcePowerCost+256+4
CNSTI4 1
ASGNI4
line 395
;394:		// Also, check if there is no saberattack.  If there isn't, there had better not be any defense or throw!
;395:		if (uiForcePowersRank[FP_SABERATTACK]<1)
ADDRGP4 uiForcePowersRank+60
INDIRI4
CNSTI4 1
GEI4 $351
line 396
;396:		{
line 397
;397:			uiForcePowersRank[FP_SABERDEFEND]=0;
ADDRGP4 uiForcePowersRank+64
CNSTI4 0
ASGNI4
line 398
;398:			uiForcePowersRank[FP_SABERTHROW]=0;
ADDRGP4 uiForcePowersRank+68
CNSTI4 0
ASGNI4
line 399
;399:			if (menu)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $352
line 400
;400:			{
line 401
;401:				Menu_ShowItemByName(menu, "setfp_saberdefend", qfalse);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $342
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 402
;402:				Menu_ShowItemByName(menu, "setfp_saberthrow", qfalse);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $343
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 403
;403:				Menu_ShowItemByName(menu, "effectentry", qfalse);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $344
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 404
;404:				Menu_ShowItemByName(menu, "effectfield", qfalse);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $345
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 405
;405:				Menu_ShowItemByName(menu, "nosaber", qtrue);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $346
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 406
;406:			}
line 407
;407:		}
ADDRGP4 $352
JUMPV
LABELV $351
line 409
;408:		else
;409:		{
line 410
;410:			if (menu)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $358
line 411
;411:			{
line 412
;412:				Menu_ShowItemByName(menu, "setfp_saberdefend", qtrue);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $342
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 413
;413:				Menu_ShowItemByName(menu, "setfp_saberthrow", qtrue);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $343
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 414
;414:				Menu_ShowItemByName(menu, "effectentry", qtrue);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $344
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 415
;415:				Menu_ShowItemByName(menu, "effectfield", qtrue);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $345
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 416
;416:				Menu_ShowItemByName(menu, "nosaber", qfalse);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $346
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 417
;417:			}
LABELV $358
line 418
;418:		}
LABELV $352
line 419
;419:	}
LABELV $326
line 422
;420:
;421:	// Make sure that we're still legal.
;422:	for (curpower=0;curpower<NUM_FORCE_POWERS;curpower++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $360
line 423
;423:	{	// Make sure that our ranks are within legal limits.
line 424
;424:		if (uiForcePowersRank[curpower]<0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
CNSTI4 0
GEI4 $364
line 425
;425:			uiForcePowersRank[curpower]=0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $365
JUMPV
LABELV $364
line 426
;426:		else if (uiForcePowersRank[curpower]>=NUM_FORCE_POWER_LEVELS)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
CNSTI4 4
LTI4 $366
line 427
;427:			uiForcePowersRank[curpower]=(NUM_FORCE_POWER_LEVELS-1);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
CNSTI4 3
ASGNI4
LABELV $366
LABELV $365
line 429
;428:
;429:		for (currank=FORCE_LEVEL_1;currank<=uiForcePowersRank[curpower];currank++)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $371
JUMPV
LABELV $368
line 430
;430:		{	// Check on this force power
line 431
;431:			if (uiForcePowersRank[curpower]>0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
CNSTI4 0
LEI4 $372
line 432
;432:			{	// Do not charge the player for the one freebie in jump, or if there is one in saber.
line 433
;433:				if  (	(curpower == FP_LEVITATION && currank == FORCE_LEVEL_1) ||
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $379
ADDRLP4 4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $380
LABELV $379
ADDRLP4 0
INDIRI4
CNSTI4 15
NEI4 $382
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $382
ADDRGP4 ui_freeSaber+12
INDIRI4
CNSTI4 0
NEI4 $380
LABELV $382
ADDRLP4 0
INDIRI4
CNSTI4 16
NEI4 $374
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $374
ADDRGP4 ui_freeSaber+12
INDIRI4
CNSTI4 0
EQI4 $374
LABELV $380
line 436
;434:						(curpower == FP_SABERATTACK && currank == FORCE_LEVEL_1 && ui_freeSaber.integer) ||
;435:						(curpower == FP_SABERDEFEND && currank == FORCE_LEVEL_1 && ui_freeSaber.integer) )
;436:				{
line 438
;437:					// Do nothing (written this way for clarity)
;438:				}
ADDRGP4 $375
JUMPV
LABELV $374
line 440
;439:				else
;440:				{	// Check if we can accrue the cost of this power.
line 441
;441:					if (bgForcePowerCost[curpower][currank] > uiForceAvailable)
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
ADDRGP4 uiForceAvailable
INDIRI4
LEI4 $383
line 442
;442:					{	// We can't afford this power.  Break to the next one.
line 444
;443:						// Remove this power from the player's roster.
;444:						uiForcePowersRank[curpower] = currank-1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 445
;445:						break;
ADDRGP4 $370
JUMPV
LABELV $383
line 448
;446:					}
;447:					else
;448:					{	// Sure we can afford it.
line 449
;449:						uiForceUsed += bgForcePowerCost[curpower][currank];
ADDRLP4 24
ADDRGP4 uiForceUsed
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 450
;450:						uiForceAvailable -= bgForcePowerCost[curpower][currank];
ADDRLP4 28
ADDRGP4 uiForceAvailable
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
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
line 451
;451:					}
line 452
;452:				}
LABELV $375
line 453
;453:			}
LABELV $372
line 454
;454:		}
LABELV $369
line 429
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $371
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
LEI4 $368
LABELV $370
line 455
;455:	}
LABELV $361
line 422
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $360
line 457
;456:
;457:}
LABELV $287
endproc UpdateForceUsed 40 12
export UI_ReadLegalForce
proc UI_ReadLegalForce 1712 24
line 463
;458:
;459:
;460://Mostly parts of other functions merged into one another.
;461://Puts the current UI stuff into a string, legalizes it, and then reads it back out.
;462:void UI_ReadLegalForce(void)
;463:{
line 466
;464:	char fcfString[512];
;465:	char forceStringValue[4];
;466:	int strPlace = 0;
ADDRLP4 604
CNSTI4 0
ASGNI4
line 467
;467:	int forcePlace = 0;
ADDRLP4 596
CNSTI4 0
ASGNI4
line 468
;468:	int i = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 471
;469:	char singleBuf[64];
;470:	char info[MAX_INFO_VALUE];
;471:	int c = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 472
;472:	int iBuf = 0;
ADDRLP4 592
CNSTI4 0
ASGNI4
line 473
;473:	int forcePowerRank = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 474
;474:	int currank = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 475
;475:	int forceTeam = 0;
ADDRLP4 1636
CNSTI4 0
ASGNI4
line 476
;476:	qboolean updateForceLater = qfalse;
ADDRLP4 1632
CNSTI4 0
ASGNI4
line 479
;477:
;478:	//First, stick them into a string.
;479:	Com_sprintf(fcfString, sizeof(fcfString), "%i-%i-", uiForceRank, uiForceSide);
ADDRLP4 16
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 $265
ARGP4
ADDRGP4 uiForceRank
INDIRI4
ARGI4
ADDRGP4 uiForceSide
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 480
;480:	strPlace = strlen(fcfString);
ADDRLP4 16
ARGP4
ADDRLP4 1640
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 604
ADDRLP4 1640
INDIRI4
ASGNI4
ADDRGP4 $387
JUMPV
LABELV $386
line 483
;481:
;482:	while (forcePlace < NUM_FORCE_POWERS)
;483:	{
line 484
;484:		Com_sprintf(forceStringValue, sizeof(forceStringValue), "%i", uiForcePowersRank[forcePlace]);
ADDRLP4 600
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $269
ARGP4
ADDRLP4 596
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 486
;485:		//Just use the force digit even if multiple digits. Shouldn't be longer than 1.
;486:		fcfString[strPlace] = forceStringValue[0];
ADDRLP4 604
INDIRI4
ADDRLP4 16
ADDP4
ADDRLP4 600
INDIRI1
ASGNI1
line 487
;487:		strPlace++;
ADDRLP4 604
ADDRLP4 604
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 488
;488:		forcePlace++;
ADDRLP4 596
ADDRLP4 596
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 489
;489:	}
LABELV $387
line 482
ADDRLP4 596
INDIRI4
CNSTI4 18
LTI4 $386
line 490
;490:	fcfString[strPlace] = '\n';
ADDRLP4 604
INDIRI4
ADDRLP4 16
ADDP4
CNSTI1 10
ASGNI1
line 491
;491:	fcfString[strPlace+1] = 0;
ADDRLP4 604
INDIRI4
ADDRLP4 16+1
ADDP4
CNSTI1 0
ASGNI1
line 493
;492:
;493:	info[0] = '\0';
ADDRLP4 608
CNSTI1 0
ASGNI1
line 494
;494:	trap_GetConfigString(CS_SERVERINFO, info, sizeof(info));
CNSTI4 0
ARGI4
ADDRLP4 608
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 496
;495:
;496:	if (atoi( Info_ValueForKey( info, "g_forceBasedTeams" ) ))
ADDRLP4 608
ARGP4
ADDRGP4 $392
ARGP4
ADDRLP4 1644
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1644
INDIRP4
ARGP4
ADDRLP4 1648
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1648
INDIRI4
CNSTI4 0
EQI4 $390
line 497
;497:	{
line 498
;498:		switch((int)(trap_Cvar_VariableValue("ui_myteam")))
ADDRGP4 $321
ARGP4
ADDRLP4 1656
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1652
ADDRLP4 1656
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 1652
INDIRI4
CNSTI4 1
EQI4 $396
ADDRLP4 1652
INDIRI4
CNSTI4 2
EQI4 $397
ADDRGP4 $394
JUMPV
line 499
;499:		{
LABELV $396
line 501
;500:		case TEAM_RED:
;501:			forceTeam = FORCE_DARKSIDE;
ADDRLP4 1636
CNSTI4 2
ASGNI4
line 502
;502:			break;
ADDRGP4 $394
JUMPV
LABELV $397
line 504
;503:		case TEAM_BLUE:
;504:			forceTeam = FORCE_LIGHTSIDE;
ADDRLP4 1636
CNSTI4 1
ASGNI4
line 505
;505:			break;
line 507
;506:		default:
;507:			break;
LABELV $394
line 509
;508:		}
;509:	}
LABELV $390
line 511
;510:	//Second, legalize them.
;511:	if (!BG_LegalizedForcePowers(fcfString, uiMaxRank, ui_freeSaber.integer, forceTeam, atoi( Info_ValueForKey( info, "g_gametype" )), 0))
ADDRLP4 608
ARGP4
ADDRGP4 $401
ARGP4
ADDRLP4 1652
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1656
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 16
ARGP4
ADDRGP4 uiMaxRank
INDIRI4
ARGI4
ADDRGP4 ui_freeSaber+12
INDIRI4
ARGI4
ADDRLP4 1636
INDIRI4
ARGI4
ADDRLP4 1656
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1660
ADDRGP4 BG_LegalizedForcePowers
CALLI4
ASGNI4
ADDRLP4 1660
INDIRI4
CNSTI4 0
NEI4 $398
line 512
;512:	{ //if they were illegal, we should refresh them.
line 513
;513:		updateForceLater = qtrue;
ADDRLP4 1632
CNSTI4 1
ASGNI4
line 514
;514:	}
LABELV $398
line 517
;515:
;516:	//Lastly, put them back into the UI storage from the legalized string
;517:	i = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $403
JUMPV
LABELV $402
line 520
;518:
;519:	while (fcfString[i] && fcfString[i] != '-')
;520:	{
line 521
;521:		singleBuf[c] = fcfString[i];
ADDRLP4 0
INDIRI4
ADDRLP4 528
ADDP4
ADDRLP4 12
INDIRI4
ADDRLP4 16
ADDP4
INDIRI1
ASGNI1
line 522
;522:		c++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 523
;523:		i++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 524
;524:	}
LABELV $403
line 519
ADDRLP4 1664
ADDRLP4 12
INDIRI4
ADDRLP4 16
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1664
INDIRI4
CNSTI4 0
EQI4 $405
ADDRLP4 1664
INDIRI4
CNSTI4 45
NEI4 $402
LABELV $405
line 525
;525:	singleBuf[c] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 528
ADDP4
CNSTI1 0
ASGNI1
line 526
;526:	c = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 527
;527:	i++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 529
;528:
;529:	iBuf = atoi(singleBuf);
ADDRLP4 528
ARGP4
ADDRLP4 1668
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 592
ADDRLP4 1668
INDIRI4
ASGNI4
line 531
;530:
;531:	if (iBuf > uiMaxRank || iBuf < 0)
ADDRLP4 592
INDIRI4
ADDRGP4 uiMaxRank
INDIRI4
GTI4 $408
ADDRLP4 592
INDIRI4
CNSTI4 0
GEI4 $406
LABELV $408
line 532
;532:	{ //this force config uses a rank level higher than our currently restricted level.. so we can't use it
line 535
;533:	  //FIXME: Print a message indicating this to the user
;534:	//	return;
;535:	}
LABELV $406
line 537
;536:
;537:	uiForceRank = iBuf;
ADDRGP4 uiForceRank
ADDRLP4 592
INDIRI4
ASGNI4
ADDRGP4 $410
JUMPV
LABELV $409
line 540
;538:
;539:	while (fcfString[i] && fcfString[i] != '-')
;540:	{
line 541
;541:		singleBuf[c] = fcfString[i];
ADDRLP4 0
INDIRI4
ADDRLP4 528
ADDP4
ADDRLP4 12
INDIRI4
ADDRLP4 16
ADDP4
INDIRI1
ASGNI1
line 542
;542:		c++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 543
;543:		i++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 544
;544:	}
LABELV $410
line 539
ADDRLP4 1676
ADDRLP4 12
INDIRI4
ADDRLP4 16
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1676
INDIRI4
CNSTI4 0
EQI4 $412
ADDRLP4 1676
INDIRI4
CNSTI4 45
NEI4 $409
LABELV $412
line 545
;545:	singleBuf[c] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 528
ADDP4
CNSTI1 0
ASGNI1
line 546
;546:	c = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 547
;547:	i++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 549
;548:
;549:	uiForceSide = atoi(singleBuf);
ADDRLP4 528
ARGP4
ADDRLP4 1680
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 uiForceSide
ADDRLP4 1680
INDIRI4
ASGNI4
line 551
;550:
;551:	if (uiForceSide != FORCE_LIGHTSIDE &&
ADDRLP4 1684
ADDRGP4 uiForceSide
INDIRI4
ASGNI4
ADDRLP4 1684
INDIRI4
CNSTI4 1
EQI4 $416
ADDRLP4 1684
INDIRI4
CNSTI4 2
EQI4 $416
line 553
;552:		uiForceSide != FORCE_DARKSIDE)
;553:	{
line 554
;554:		uiForceSide = FORCE_LIGHTSIDE;
ADDRGP4 uiForceSide
CNSTI4 1
ASGNI4
line 555
;555:		return;
ADDRGP4 $385
JUMPV
LABELV $415
line 560
;556:	}
;557:
;558:	//clear out the existing powers
;559:	while (c < NUM_FORCE_POWERS)
;560:	{
line 561
;561:		uiForcePowersRank[c] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
CNSTI4 0
ASGNI4
line 562
;562:		c++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 563
;563:	}
LABELV $416
line 559
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $415
line 564
;564:	uiForceUsed = 0;
ADDRGP4 uiForceUsed
CNSTI4 0
ASGNI4
line 565
;565:	uiForceAvailable = forceMasteryPoints[uiForceRank];
ADDRGP4 uiForceAvailable
ADDRGP4 uiForceRank
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceMasteryPoints
ADDP4
INDIRI4
ASGNI4
line 566
;566:	gTouchedForce = qtrue;
ADDRGP4 gTouchedForce
CNSTI4 1
ASGNI4
line 568
;567:
;568:	for (c=0;fcfString[i]&&c<NUM_FORCE_POWERS;c++,i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $421
JUMPV
LABELV $418
line 569
;569:	{
line 570
;570:		singleBuf[0] = fcfString[i];
ADDRLP4 528
ADDRLP4 12
INDIRI4
ADDRLP4 16
ADDP4
INDIRI1
ASGNI1
line 571
;571:		singleBuf[1] = 0;
ADDRLP4 528+1
CNSTI1 0
ASGNI1
line 572
;572:		iBuf = atoi(singleBuf);	// So, that means that Force Power "c" wants to be set to rank "iBuf".
ADDRLP4 528
ARGP4
ADDRLP4 1688
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 592
ADDRLP4 1688
INDIRI4
ASGNI4
line 574
;573:		
;574:		if (iBuf < 0)
ADDRLP4 592
INDIRI4
CNSTI4 0
GEI4 $423
line 575
;575:		{
line 576
;576:			iBuf = 0;
ADDRLP4 592
CNSTI4 0
ASGNI4
line 577
;577:		}
LABELV $423
line 579
;578:
;579:		forcePowerRank = iBuf;
ADDRLP4 8
ADDRLP4 592
INDIRI4
ASGNI4
line 581
;580:
;581:		if (forcePowerRank > FORCE_LEVEL_3 || forcePowerRank < 0)
ADDRLP4 8
INDIRI4
CNSTI4 3
GTI4 $427
ADDRLP4 8
INDIRI4
CNSTI4 0
GEI4 $425
LABELV $427
line 582
;582:		{ //err..  not correct
line 583
;583:			continue;  // skip this power
ADDRGP4 $419
JUMPV
LABELV $425
line 586
;584:		}
;585:
;586:		if (uiForcePowerDarkLight[c] && uiForcePowerDarkLight[c] != uiForceSide)
ADDRLP4 1696
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowerDarkLight
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1696
INDIRI4
CNSTI4 0
EQI4 $428
ADDRLP4 1696
INDIRI4
ADDRGP4 uiForceSide
INDIRI4
EQI4 $428
line 587
;587:		{ //Apparently the user has crafted a force config that has powers that don't fit with the config's side.
line 588
;588:			continue;  // skip this power
ADDRGP4 $419
JUMPV
LABELV $428
line 592
;589:		}
;590:
;591:		// Accrue cost for each assigned rank for this power.
;592:		for (currank=FORCE_LEVEL_1;currank<=forcePowerRank;currank++)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $433
JUMPV
LABELV $430
line 593
;593:		{	
line 594
;594:			if (bgForcePowerCost[c][currank] > uiForceAvailable)
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
ADDRGP4 uiForceAvailable
INDIRI4
LEI4 $434
line 595
;595:			{	// Break out, we can't afford any more power.
line 596
;596:				break;
ADDRGP4 $432
JUMPV
LABELV $434
line 599
;597:			}
;598:			// Pay for this rank of this power.
;599:			uiForceUsed += bgForcePowerCost[c][currank];
ADDRLP4 1700
ADDRGP4 uiForceUsed
ASGNP4
ADDRLP4 1700
INDIRP4
ADDRLP4 1700
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 600
;600:			uiForceAvailable -= bgForcePowerCost[c][currank];
ADDRLP4 1704
ADDRGP4 uiForceAvailable
ASGNP4
ADDRLP4 1704
INDIRP4
ADDRLP4 1704
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
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
line 602
;601:
;602:			uiForcePowersRank[c]++;
ADDRLP4 1708
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
ASGNP4
ADDRLP4 1708
INDIRP4
ADDRLP4 1708
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 603
;603:		}
LABELV $431
line 592
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $433
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $430
LABELV $432
line 604
;604:	}
LABELV $419
line 568
ADDRLP4 1688
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 1688
INDIRI4
ADDI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 1688
INDIRI4
ADDI4
ASGNI4
LABELV $421
ADDRLP4 12
INDIRI4
ADDRLP4 16
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $436
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $418
LABELV $436
line 606
;605:
;606:	if (uiForcePowersRank[FP_LEVITATION] < 1)
ADDRGP4 uiForcePowersRank+4
INDIRI4
CNSTI4 1
GEI4 $437
line 607
;607:	{
line 608
;608:		uiForcePowersRank[FP_LEVITATION]=1;
ADDRGP4 uiForcePowersRank+4
CNSTI4 1
ASGNI4
line 609
;609:	}
LABELV $437
line 610
;610:	if (uiForcePowersRank[FP_SABERATTACK] < 1 && ui_freeSaber.integer)
ADDRGP4 uiForcePowersRank+60
INDIRI4
CNSTI4 1
GEI4 $441
ADDRGP4 ui_freeSaber+12
INDIRI4
CNSTI4 0
EQI4 $441
line 611
;611:	{
line 612
;612:		uiForcePowersRank[FP_SABERATTACK]=1;
ADDRGP4 uiForcePowersRank+60
CNSTI4 1
ASGNI4
line 613
;613:	}
LABELV $441
line 614
;614:	if (uiForcePowersRank[FP_SABERDEFEND] < 1 && ui_freeSaber.integer)
ADDRGP4 uiForcePowersRank+64
INDIRI4
CNSTI4 1
GEI4 $446
ADDRGP4 ui_freeSaber+12
INDIRI4
CNSTI4 0
EQI4 $446
line 615
;615:	{
line 616
;616:		uiForcePowersRank[FP_SABERDEFEND]=1;
ADDRGP4 uiForcePowersRank+64
CNSTI4 1
ASGNI4
line 617
;617:	}
LABELV $446
line 619
;618:
;619:	UpdateForceUsed();
ADDRGP4 UpdateForceUsed
CALLV
pop
line 621
;620:
;621:	if (updateForceLater)
ADDRLP4 1632
INDIRI4
CNSTI4 0
EQI4 $451
line 622
;622:	{
line 623
;623:		gTouchedForce = qtrue;
ADDRGP4 gTouchedForce
CNSTI4 1
ASGNI4
line 624
;624:		UI_UpdateClientForcePowers(NULL);
CNSTP4 0
ARGP4
ADDRGP4 UI_UpdateClientForcePowers
CALLV
pop
line 625
;625:	}
LABELV $451
line 626
;626:}
LABELV $385
endproc UI_ReadLegalForce 1712 24
export UI_UpdateForcePowers
proc UI_UpdateForcePowers 324 4
line 629
;627:
;628:void UI_UpdateForcePowers()
;629:{
line 630
;630:	char *forcePowers = UI_Cvar_VariableString("forcepowers");
ADDRGP4 $222
ARGP4
ADDRLP4 272
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 272
INDIRP4
ASGNP4
line 632
;631:	char readBuf[256];
;632:	int i = 0, i_f = 0, i_r = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 12
CNSTI4 0
ASGNI4
line 634
;633:
;634:	uiForceSide = 0;
ADDRGP4 uiForceSide
CNSTI4 0
ASGNI4
line 636
;635:
;636:	if (forcePowers && forcePowers[0])
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $454
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $454
line 637
;637:	{
ADDRGP4 $457
JUMPV
LABELV $456
line 639
;638:		while (forcePowers[i])
;639:		{
line 640
;640:			i_r = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $460
JUMPV
LABELV $459
line 643
;641:
;642:			while (forcePowers[i] && forcePowers[i] != '-' && i_r < 255)
;643:			{
line 644
;644:				readBuf[i_r] = forcePowers[i];
ADDRLP4 12
INDIRI4
ADDRLP4 16
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 645
;645:				i_r++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 646
;646:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 647
;647:			}
LABELV $460
line 642
ADDRLP4 280
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $463
ADDRLP4 280
INDIRI4
CNSTI4 45
EQI4 $463
ADDRLP4 12
INDIRI4
CNSTI4 255
LTI4 $459
LABELV $463
line 648
;648:			readBuf[i_r] = '\0';
ADDRLP4 12
INDIRI4
ADDRLP4 16
ADDP4
CNSTI1 0
ASGNI1
line 649
;649:			if (i_r >= 255 || !forcePowers[i] || forcePowers[i] != '-')
ADDRLP4 12
INDIRI4
CNSTI4 255
GEI4 $467
ADDRLP4 284
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
EQI4 $467
ADDRLP4 284
INDIRI4
CNSTI4 45
EQI4 $464
LABELV $467
line 650
;650:			{
line 651
;651:				uiForceSide = 0;
ADDRGP4 uiForceSide
CNSTI4 0
ASGNI4
line 652
;652:				goto validitycheck;
ADDRGP4 $468
JUMPV
LABELV $464
line 654
;653:			}
;654:			uiForceRank = atoi(readBuf);
ADDRLP4 16
ARGP4
ADDRLP4 288
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 uiForceRank
ADDRLP4 288
INDIRI4
ASGNI4
line 655
;655:			i_r = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 657
;656:
;657:			if (uiForceRank > uiMaxRank)
ADDRGP4 uiForceRank
INDIRI4
ADDRGP4 uiMaxRank
INDIRI4
LEI4 $469
line 658
;658:			{
line 659
;659:				uiForceRank = uiMaxRank;
ADDRGP4 uiForceRank
ADDRGP4 uiMaxRank
INDIRI4
ASGNI4
line 660
;660:			}
LABELV $469
line 662
;661:
;662:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $472
JUMPV
LABELV $471
line 665
;663:
;664:			while (forcePowers[i] && forcePowers[i] != '-' && i_r < 255)
;665:			{
line 666
;666:				readBuf[i_r] = forcePowers[i];
ADDRLP4 12
INDIRI4
ADDRLP4 16
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 667
;667:				i_r++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 668
;668:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 669
;669:			}
LABELV $472
line 664
ADDRLP4 292
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $475
ADDRLP4 292
INDIRI4
CNSTI4 45
EQI4 $475
ADDRLP4 12
INDIRI4
CNSTI4 255
LTI4 $471
LABELV $475
line 670
;670:			readBuf[i_r] = '\0';
ADDRLP4 12
INDIRI4
ADDRLP4 16
ADDP4
CNSTI1 0
ASGNI1
line 671
;671:			if (i_r >= 255 || !forcePowers[i] || forcePowers[i] != '-')
ADDRLP4 12
INDIRI4
CNSTI4 255
GEI4 $479
ADDRLP4 296
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
EQI4 $479
ADDRLP4 296
INDIRI4
CNSTI4 45
EQI4 $476
LABELV $479
line 672
;672:			{
line 673
;673:				uiForceSide = 0;
ADDRGP4 uiForceSide
CNSTI4 0
ASGNI4
line 674
;674:				goto validitycheck;
ADDRGP4 $468
JUMPV
LABELV $476
line 676
;675:			}
;676:			uiForceSide = atoi(readBuf);
ADDRLP4 16
ARGP4
ADDRLP4 300
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 uiForceSide
ADDRLP4 300
INDIRI4
ASGNI4
line 677
;677:			i_r = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 679
;678:
;679:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 681
;680:
;681:			i_f = FP_HEAL;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $481
JUMPV
LABELV $480
line 684
;682:
;683:			while (forcePowers[i] && i_f < NUM_FORCE_POWERS)
;684:			{
line 685
;685:				readBuf[0] = forcePowers[i];
ADDRLP4 16
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 686
;686:				readBuf[1] = '\0';
ADDRLP4 16+1
CNSTI1 0
ASGNI1
line 687
;687:				uiForcePowersRank[i_f] = atoi(readBuf);
ADDRLP4 16
ARGP4
ADDRLP4 304
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
ADDRLP4 304
INDIRI4
ASGNI4
line 689
;688:
;689:				if (i_f == FP_LEVITATION &&
ADDRLP4 312
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 312
INDIRI4
NEI4 $484
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
ADDRLP4 312
INDIRI4
GEI4 $484
line 691
;690:					uiForcePowersRank[i_f] < 1)
;691:				{
line 692
;692:					uiForcePowersRank[i_f] = 1;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
CNSTI4 1
ASGNI4
line 693
;693:				}
LABELV $484
line 695
;694:
;695:				if (i_f == FP_SABERATTACK &&
ADDRLP4 4
INDIRI4
CNSTI4 15
NEI4 $486
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
CNSTI4 1
GEI4 $486
ADDRGP4 ui_freeSaber+12
INDIRI4
CNSTI4 0
EQI4 $486
line 698
;696:					uiForcePowersRank[i_f] < 1 &&
;697:					ui_freeSaber.integer)
;698:				{
line 699
;699:					uiForcePowersRank[i_f] = 1;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
CNSTI4 1
ASGNI4
line 700
;700:				}
LABELV $486
line 702
;701:
;702:				if (i_f == FP_SABERDEFEND &&
ADDRLP4 4
INDIRI4
CNSTI4 16
NEI4 $489
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
CNSTI4 1
GEI4 $489
ADDRGP4 ui_freeSaber+12
INDIRI4
CNSTI4 0
EQI4 $489
line 705
;703:					uiForcePowersRank[i_f] < 1 &&
;704:					ui_freeSaber.integer)
;705:				{
line 706
;706:					uiForcePowersRank[i_f] = 1;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
CNSTI4 1
ASGNI4
line 707
;707:				}
LABELV $489
line 709
;708:
;709:				i_f++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 710
;710:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 711
;711:			}
LABELV $481
line 683
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $492
ADDRLP4 4
INDIRI4
CNSTI4 18
LTI4 $480
LABELV $492
line 713
;712:
;713:			if (i_f < NUM_FORCE_POWERS)
ADDRLP4 4
INDIRI4
CNSTI4 18
GEI4 $493
line 714
;714:			{ //info for all the powers wasn't there..
line 715
;715:				uiForceSide = 0;
ADDRGP4 uiForceSide
CNSTI4 0
ASGNI4
line 716
;716:				goto validitycheck;
ADDRGP4 $468
JUMPV
LABELV $493
line 718
;717:			}
;718:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 719
;719:		}
LABELV $457
line 638
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $456
line 720
;720:	}
LABELV $454
LABELV $468
line 724
;721:
;722:validitycheck:
;723:
;724:	if (!uiForceSide)
ADDRGP4 uiForceSide
INDIRI4
CNSTI4 0
NEI4 $495
line 725
;725:	{
line 726
;726:		uiForceSide = 1;
ADDRGP4 uiForceSide
CNSTI4 1
ASGNI4
line 727
;727:		uiForceRank = 1;
ADDRGP4 uiForceRank
CNSTI4 1
ASGNI4
line 728
;728:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $498
JUMPV
LABELV $497
line 730
;729:		while (i < NUM_FORCE_POWERS)
;730:		{
line 731
;731:			if (i == FP_LEVITATION)
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $500
line 732
;732:			{
line 733
;733:				uiForcePowersRank[i] = 1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
CNSTI4 1
ASGNI4
line 734
;734:			}
ADDRGP4 $501
JUMPV
LABELV $500
line 735
;735:			else if (i == FP_SABERATTACK && ui_freeSaber.integer)
ADDRLP4 0
INDIRI4
CNSTI4 15
NEI4 $502
ADDRGP4 ui_freeSaber+12
INDIRI4
CNSTI4 0
EQI4 $502
line 736
;736:			{
line 737
;737:				uiForcePowersRank[i] = 1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
CNSTI4 1
ASGNI4
line 738
;738:			}
ADDRGP4 $503
JUMPV
LABELV $502
line 739
;739:			else if (i == FP_SABERDEFEND && ui_freeSaber.integer)
ADDRLP4 0
INDIRI4
CNSTI4 16
NEI4 $505
ADDRGP4 ui_freeSaber+12
INDIRI4
CNSTI4 0
EQI4 $505
line 740
;740:			{
line 741
;741:				uiForcePowersRank[i] = 1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
CNSTI4 1
ASGNI4
line 742
;742:			}
ADDRGP4 $506
JUMPV
LABELV $505
line 744
;743:			else
;744:			{
line 745
;745:				uiForcePowersRank[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
CNSTI4 0
ASGNI4
line 746
;746:			}
LABELV $506
LABELV $503
LABELV $501
line 748
;747:
;748:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 749
;749:		}
LABELV $498
line 729
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $497
line 751
;750:
;751:		UI_UpdateClientForcePowers(NULL);
CNSTP4 0
ARGP4
ADDRGP4 UI_UpdateClientForcePowers
CALLV
pop
line 752
;752:	}
LABELV $495
line 754
;753:
;754:	UpdateForceUsed();
ADDRGP4 UpdateForceUsed
CALLV
pop
line 755
;755:}
LABELV $453
endproc UI_UpdateForcePowers 324 4
export UI_SkinColor_HandleKey
proc UI_SkinColor_HandleKey 8 8
line 759
;756:extern int	uiSkinColor;
;757:
;758:qboolean UI_SkinColor_HandleKey(int flags, float *special, int key, int num, int min, int max, int type) 
;759:{
line 760
;760:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) 
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $513
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $513
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $513
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $509
LABELV $513
line 761
;761:  {
line 762
;762:  	int i = num;
ADDRLP4 4
ADDRFP4 12
INDIRI4
ASGNI4
line 764
;763:
;764:	if (key == A_MOUSE2)
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $514
line 765
;765:	{
line 766
;766:	    i--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 767
;767:	}
ADDRGP4 $515
JUMPV
LABELV $514
line 769
;768:	else
;769:	{
line 770
;770:	    i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 771
;771:	}
LABELV $515
line 773
;772:
;773:    if (i < min)
ADDRLP4 4
INDIRI4
ADDRFP4 16
INDIRI4
GEI4 $516
line 774
;774:	{
line 775
;775:		i = max;
ADDRLP4 4
ADDRFP4 20
INDIRI4
ASGNI4
line 776
;776:	}
ADDRGP4 $517
JUMPV
LABELV $516
line 777
;777:	else if (i > max)
ADDRLP4 4
INDIRI4
ADDRFP4 20
INDIRI4
LEI4 $518
line 778
;778:	{
line 779
;779:      i = min;
ADDRLP4 4
ADDRFP4 16
INDIRI4
ASGNI4
line 780
;780:    }
LABELV $518
LABELV $517
line 782
;781:
;782:    num = i;
ADDRFP4 12
ADDRLP4 4
INDIRI4
ASGNI4
line 784
;783:
;784:	uiSkinColor = num;
ADDRGP4 uiSkinColor
ADDRFP4 12
INDIRI4
ASGNI4
line 786
;785:
;786:	UI_FeederSelection(FEEDER_Q3HEADS, uiInfo.q3SelectedHead);
CNSTF4 1094713344
ARGF4
ADDRGP4 uiInfo+78280
INDIRI4
ARGI4
ADDRGP4 UI_FeederSelection
CALLI4
pop
line 788
;787:
;788:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $508
JUMPV
LABELV $509
line 790
;789:  }
;790:  return qfalse;
CNSTI4 0
RETI4
LABELV $508
endproc UI_SkinColor_HandleKey 8 8
export UI_ForceSide_HandleKey
proc UI_ForceSide_HandleKey 1048 16
line 797
;791:}
;792:
;793:
;794:
;795:
;796:qboolean UI_ForceSide_HandleKey(int flags, float *special, int key, int num, int min, int max, int type) 
;797:{
line 800
;798:	char info[MAX_INFO_VALUE];
;799:
;800:	info[0] = '\0';
ADDRLP4 0
CNSTI1 0
ASGNI1
line 801
;801:	trap_GetConfigString(CS_SERVERINFO, info, sizeof(info));
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 803
;802:
;803:	if (atoi( Info_ValueForKey( info, "g_forceBasedTeams" ) ))
ADDRLP4 0
ARGP4
ADDRGP4 $392
ARGP4
ADDRLP4 1024
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1028
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
EQI4 $522
line 804
;804:	{
line 805
;805:		switch((int)(trap_Cvar_VariableValue("ui_myteam")))
ADDRGP4 $321
ARGP4
ADDRLP4 1036
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1032
ADDRLP4 1036
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 1
EQI4 $527
ADDRLP4 1032
INDIRI4
CNSTI4 2
EQI4 $528
ADDRGP4 $525
JUMPV
line 806
;806:		{
LABELV $527
line 808
;807:		case TEAM_RED:
;808:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $521
JUMPV
LABELV $528
line 810
;809:		case TEAM_BLUE:
;810:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $521
JUMPV
line 812
;811:		default:
;812:			break;
LABELV $525
line 814
;813:		}
;814:	}
LABELV $522
line 816
;815:
;816:	if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) 
ADDRLP4 1032
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 141
EQI4 $533
ADDRLP4 1032
INDIRI4
CNSTI4 142
EQI4 $533
ADDRLP4 1032
INDIRI4
CNSTI4 10
EQI4 $533
ADDRLP4 1032
INDIRI4
CNSTI4 13
NEI4 $529
LABELV $533
line 817
;817:	{
line 818
;818:		int i = num;
ADDRLP4 1040
ADDRFP4 12
INDIRI4
ASGNI4
line 819
;819:		int x = 0;
ADDRLP4 1036
CNSTI4 0
ASGNI4
line 822
;820:
;821:		//update the feeder item selection, it might be different depending on side
;822:		Menu_SetFeederSelection(NULL, FEEDER_FORCECFG, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 16
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 824
;823:
;824:		if (key == A_MOUSE2)
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $534
line 825
;825:		{
line 826
;826:			i--;
ADDRLP4 1040
ADDRLP4 1040
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 827
;827:		}
ADDRGP4 $535
JUMPV
LABELV $534
line 829
;828:		else
;829:		{
line 830
;830:			i++;
ADDRLP4 1040
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 831
;831:		}
LABELV $535
line 833
;832:
;833:		if (i < min)
ADDRLP4 1040
INDIRI4
ADDRFP4 16
INDIRI4
GEI4 $536
line 834
;834:		{
line 835
;835:			i = max;
ADDRLP4 1040
ADDRFP4 20
INDIRI4
ASGNI4
line 836
;836:		}
ADDRGP4 $537
JUMPV
LABELV $536
line 837
;837:		else if (i > max)
ADDRLP4 1040
INDIRI4
ADDRFP4 20
INDIRI4
LEI4 $538
line 838
;838:		{
line 839
;839:			i = min;
ADDRLP4 1040
ADDRFP4 16
INDIRI4
ASGNI4
line 840
;840:		}
LABELV $538
LABELV $537
line 842
;841:
;842:		num = i;
ADDRFP4 12
ADDRLP4 1040
INDIRI4
ASGNI4
line 844
;843:
;844:		uiForceSide = num;
ADDRGP4 uiForceSide
ADDRFP4 12
INDIRI4
ASGNI4
ADDRGP4 $541
JUMPV
LABELV $540
line 848
;845:
;846:		// Resetting power ranks based on if light or dark side is chosen
;847:		while (x < NUM_FORCE_POWERS)
;848:		{
line 849
;849:			if (uiForcePowerDarkLight[x] && uiForceSide != uiForcePowerDarkLight[x])
ADDRLP4 1044
ADDRLP4 1036
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowerDarkLight
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $543
ADDRGP4 uiForceSide
INDIRI4
ADDRLP4 1044
INDIRI4
EQI4 $543
line 850
;850:			{
line 851
;851:				uiForcePowersRank[x] = 0;
ADDRLP4 1036
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
CNSTI4 0
ASGNI4
line 852
;852:			}
LABELV $543
line 853
;853:			x++;
ADDRLP4 1036
ADDRLP4 1036
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 854
;854:		}
LABELV $541
line 847
ADDRLP4 1036
INDIRI4
CNSTI4 18
LTI4 $540
line 856
;855:
;856:		UpdateForceUsed();
ADDRGP4 UpdateForceUsed
CALLV
pop
line 858
;857:
;858:		gTouchedForce = qtrue;
ADDRGP4 gTouchedForce
CNSTI4 1
ASGNI4
line 859
;859:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $521
JUMPV
LABELV $529
line 861
;860:	}
;861:	return qfalse;
CNSTI4 0
RETI4
LABELV $521
endproc UI_ForceSide_HandleKey 1048 16
export UI_JediNonJedi_HandleKey
proc UI_JediNonJedi_HandleKey 1052 12
line 865
;862:}
;863:
;864:qboolean UI_JediNonJedi_HandleKey(int flags, float *special, int key, int num, int min, int max, int type) 
;865:{
line 868
;866:	char info[MAX_INFO_VALUE];
;867:
;868:	info[0] = '\0';
ADDRLP4 0
CNSTI1 0
ASGNI1
line 869
;869:	trap_GetConfigString(CS_SERVERINFO, info, sizeof(info));
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 871
;870:
;871:	if ( !UI_TrueJediEnabled() )
ADDRLP4 1024
ADDRGP4 UI_TrueJediEnabled
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
NEI4 $546
line 872
;872:	{//true jedi mode is not set
line 873
;873:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $546
line 876
;874:	}
;875:
;876:	if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) 
ADDRLP4 1028
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 141
EQI4 $552
ADDRLP4 1028
INDIRI4
CNSTI4 142
EQI4 $552
ADDRLP4 1028
INDIRI4
CNSTI4 10
EQI4 $552
ADDRLP4 1028
INDIRI4
CNSTI4 13
NEI4 $548
LABELV $552
line 877
;877:	{
line 878
;878:		int i = num;
ADDRLP4 1036
ADDRFP4 12
INDIRI4
ASGNI4
line 879
;879:		int x = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 881
;880:
;881:		if (key == A_MOUSE2)
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $553
line 882
;882:		{
line 883
;883:			i--;
ADDRLP4 1036
ADDRLP4 1036
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 884
;884:		}
ADDRGP4 $554
JUMPV
LABELV $553
line 886
;885:		else
;886:		{
line 887
;887:			i++;
ADDRLP4 1036
ADDRLP4 1036
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 888
;888:		}
LABELV $554
line 890
;889:
;890:		if (i < min)
ADDRLP4 1036
INDIRI4
ADDRFP4 16
INDIRI4
GEI4 $555
line 891
;891:		{
line 892
;892:			i = max;
ADDRLP4 1036
ADDRFP4 20
INDIRI4
ASGNI4
line 893
;893:		}
ADDRGP4 $556
JUMPV
LABELV $555
line 894
;894:		else if (i > max)
ADDRLP4 1036
INDIRI4
ADDRFP4 20
INDIRI4
LEI4 $557
line 895
;895:		{
line 896
;896:			i = min;
ADDRLP4 1036
ADDRFP4 16
INDIRI4
ASGNI4
line 897
;897:		}
LABELV $557
LABELV $556
line 899
;898:
;899:		num = i;
ADDRFP4 12
ADDRLP4 1036
INDIRI4
ASGNI4
line 901
;900:
;901:		uiJediNonJedi = num;
ADDRGP4 uiJediNonJedi
ADDRFP4 12
INDIRI4
ASGNI4
line 904
;902:
;903:		// Resetting power ranks based on if light or dark side is chosen
;904:		if ( !num )
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $559
line 905
;905:		{//not a jedi?
line 906
;906:			int myTeam = (int)(trap_Cvar_VariableValue("ui_myteam"));
ADDRGP4 $321
ARGP4
ADDRLP4 1044
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1040
ADDRLP4 1044
INDIRF4
CVFI4 4
ASGNI4
ADDRGP4 $562
JUMPV
LABELV $561
line 908
;907:			while ( x < NUM_FORCE_POWERS )
;908:			{//clear all force powers
line 909
;909:				uiForcePowersRank[x] = 0;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
CNSTI4 0
ASGNI4
line 910
;910:				x++;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 911
;911:			}
LABELV $562
line 907
ADDRLP4 1032
INDIRI4
CNSTI4 18
LTI4 $561
line 912
;912:			if ( myTeam != TEAM_SPECTATOR )
ADDRLP4 1040
INDIRI4
CNSTI4 3
EQI4 $564
line 913
;913:			{
line 914
;914:				UI_UpdateClientForcePowers(UI_TeamName(myTeam));//will cause him to respawn, if it's been 5 seconds since last one
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1048
ADDRGP4 UI_TeamName
CALLP4
ASGNP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 UI_UpdateClientForcePowers
CALLV
pop
line 915
;915:			}
ADDRGP4 $560
JUMPV
LABELV $564
line 917
;916:			else
;917:			{
line 918
;918:				UI_UpdateClientForcePowers(NULL);//just update powers
CNSTP4 0
ARGP4
ADDRGP4 UI_UpdateClientForcePowers
CALLV
pop
line 919
;919:			}
line 920
;920:		}
ADDRGP4 $560
JUMPV
LABELV $559
line 921
;921:		else if ( num )
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $566
line 922
;922:		{//a jedi, set the minimums, hopefuly they know to set the rest!
line 923
;923:			if ( uiForcePowersRank[FP_LEVITATION] < FORCE_LEVEL_1 )
ADDRGP4 uiForcePowersRank+4
INDIRI4
CNSTI4 1
GEI4 $568
line 924
;924:			{//force jump 1 minimum
line 925
;925:				uiForcePowersRank[FP_LEVITATION] = FORCE_LEVEL_1;
ADDRGP4 uiForcePowersRank+4
CNSTI4 1
ASGNI4
line 926
;926:			}
LABELV $568
line 927
;927:			if ( uiForcePowersRank[FP_SABERATTACK] < FORCE_LEVEL_1 )
ADDRGP4 uiForcePowersRank+60
INDIRI4
CNSTI4 1
GEI4 $572
line 928
;928:			{//saber attack 1, minimum
line 929
;929:				uiForcePowersRank[FP_SABERATTACK] = FORCE_LEVEL_1;
ADDRGP4 uiForcePowersRank+60
CNSTI4 1
ASGNI4
line 930
;930:			}
LABELV $572
line 931
;931:		}
LABELV $566
LABELV $560
line 933
;932:
;933:		UpdateForceUsed();
ADDRGP4 UpdateForceUsed
CALLV
pop
line 935
;934:
;935:		gTouchedForce = qtrue;
ADDRGP4 gTouchedForce
CNSTI4 1
ASGNI4
line 936
;936:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $545
JUMPV
LABELV $548
line 938
;937:	}
;938:	return qfalse;
CNSTI4 0
RETI4
LABELV $545
endproc UI_JediNonJedi_HandleKey 1052 12
export UI_ForceMaxRank_HandleKey
proc UI_ForceMaxRank_HandleKey 12 8
line 942
;939:}
;940:
;941:qboolean UI_ForceMaxRank_HandleKey(int flags, float *special, int key, int num, int min, int max, int type) 
;942:{
line 943
;943:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) 
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $581
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $581
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $581
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $577
LABELV $581
line 944
;944:  {
line 945
;945:  	int i = num;
ADDRLP4 4
ADDRFP4 12
INDIRI4
ASGNI4
line 947
;946:
;947:	if (key == A_MOUSE2)
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $582
line 948
;948:	{
line 949
;949:	    i--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 950
;950:	}
ADDRGP4 $583
JUMPV
LABELV $582
line 952
;951:	else
;952:	{
line 953
;953:	    i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 954
;954:	}
LABELV $583
line 956
;955:
;956:    if (i < min)
ADDRLP4 4
INDIRI4
ADDRFP4 16
INDIRI4
GEI4 $584
line 957
;957:	{
line 958
;958:		i = max;
ADDRLP4 4
ADDRFP4 20
INDIRI4
ASGNI4
line 959
;959:	}
ADDRGP4 $585
JUMPV
LABELV $584
line 960
;960:	else if (i > max)
ADDRLP4 4
INDIRI4
ADDRFP4 20
INDIRI4
LEI4 $586
line 961
;961:	{
line 962
;962:      i = min;
ADDRLP4 4
ADDRFP4 16
INDIRI4
ASGNI4
line 963
;963:    }
LABELV $586
LABELV $585
line 965
;964:
;965:    num = i;
ADDRFP4 12
ADDRLP4 4
INDIRI4
ASGNI4
line 967
;966:
;967:	uiMaxRank = num;
ADDRGP4 uiMaxRank
ADDRFP4 12
INDIRI4
ASGNI4
line 969
;968:
;969:	trap_Cvar_Set( "g_maxForceRank", va("%i", num));
ADDRGP4 $269
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $588
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 972
;970:
;971:	// The update force used will remove overallocated powers automatically.
;972:	UpdateForceUsed();
ADDRGP4 UpdateForceUsed
CALLV
pop
line 974
;973:
;974:	gTouchedForce = qtrue;
ADDRGP4 gTouchedForce
CNSTI4 1
ASGNI4
line 976
;975:
;976:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $576
JUMPV
LABELV $577
line 978
;977:  }
;978:  return qfalse;
CNSTI4 0
RETI4
LABELV $576
endproc UI_ForceMaxRank_HandleKey 12 8
export UI_ForcePowerRank_HandleKey
proc UI_ForcePowerRank_HandleKey 36 0
line 984
;979:}
;980:
;981:
;982:// This function will either raise or lower a power by one rank.
;983:qboolean UI_ForcePowerRank_HandleKey(int flags, float *special, int key, int num, int min, int max, int type) 
;984:{
line 987
;985:	qboolean raising;
;986:
;987:	if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) 
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 141
EQI4 $594
ADDRLP4 4
INDIRI4
CNSTI4 142
EQI4 $594
ADDRLP4 4
INDIRI4
CNSTI4 10
EQI4 $594
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $590
LABELV $594
line 988
;988:	{
line 992
;989:		int forcepower, rank;
;990:
;991:		//this will give us the index as long as UI_FORCE_RANK is always one below the first force rank index
;992:		forcepower = (type-UI_FORCE_RANK)-1;
ADDRLP4 8
ADDRFP4 24
INDIRI4
CNSTI4 258
SUBI4
CNSTI4 1
SUBI4
ASGNI4
line 995
;993:		
;994:		//the power is disabled on the server
;995:		if (uiForcePowersDisabled[forcepower])
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersDisabled
ADDP4
INDIRI4
CNSTI4 0
EQI4 $595
line 996
;996:		{
line 997
;997:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $589
JUMPV
LABELV $595
line 1001
;998:		}
;999:
;1000:		// If we are not on the same side as a power, or if we are not of any rank at all.
;1001:		if (uiForcePowerDarkLight[forcepower] && uiForceSide != uiForcePowerDarkLight[forcepower])
ADDRLP4 16
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowerDarkLight
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $597
ADDRGP4 uiForceSide
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $597
line 1002
;1002:		{
line 1003
;1003:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $589
JUMPV
LABELV $597
line 1005
;1004:		}
;1005:		else if (forcepower == FP_SABERDEFEND || forcepower == FP_SABERTHROW)
ADDRLP4 8
INDIRI4
CNSTI4 16
EQI4 $601
ADDRLP4 8
INDIRI4
CNSTI4 17
NEI4 $599
LABELV $601
line 1006
;1006:		{	// Saberdefend and saberthrow can't be bought if there is no saberattack
line 1007
;1007:			if (uiForcePowersRank[FP_SABERATTACK] < 1)
ADDRGP4 uiForcePowersRank+60
INDIRI4
CNSTI4 1
GEI4 $602
line 1008
;1008:			{
line 1009
;1009:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $589
JUMPV
LABELV $602
line 1011
;1010:			}
;1011:		}
LABELV $599
line 1013
;1012:
;1013:		if (type == UI_FORCE_RANK_LEVITATION)
ADDRFP4 24
INDIRI4
CNSTI4 260
NEI4 $605
line 1014
;1014:		{
line 1015
;1015:			min += 1;
ADDRFP4 16
ADDRFP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1016
;1016:		}
LABELV $605
line 1017
;1017:		if (type == UI_FORCE_RANK_SABERATTACK && ui_freeSaber.integer)
ADDRFP4 24
INDIRI4
CNSTI4 274
NEI4 $607
ADDRGP4 ui_freeSaber+12
INDIRI4
CNSTI4 0
EQI4 $607
line 1018
;1018:		{
line 1019
;1019:			min += 1;
ADDRFP4 16
ADDRFP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1020
;1020:		}
LABELV $607
line 1021
;1021:		if (type == UI_FORCE_RANK_SABERDEFEND && ui_freeSaber.integer)
ADDRFP4 24
INDIRI4
CNSTI4 275
NEI4 $610
ADDRGP4 ui_freeSaber+12
INDIRI4
CNSTI4 0
EQI4 $610
line 1022
;1022:		{
line 1023
;1023:			min += 1;
ADDRFP4 16
ADDRFP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1024
;1024:		}
LABELV $610
line 1026
;1025:
;1026:		if (key == A_MOUSE2)
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $613
line 1027
;1027:		{	// Lower a point.
line 1028
;1028:			if (uiForcePowersRank[forcepower]<=min)
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
ADDRFP4 16
INDIRI4
GTI4 $615
line 1029
;1029:			{
line 1030
;1030:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $589
JUMPV
LABELV $615
line 1032
;1031:			}
;1032:			raising = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1033
;1033:		}
ADDRGP4 $614
JUMPV
LABELV $613
line 1035
;1034:		else
;1035:		{	// Raise a point.
line 1036
;1036:			if (uiForcePowersRank[forcepower]>=max)
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
ADDRFP4 20
INDIRI4
LTI4 $617
line 1037
;1037:			{
line 1038
;1038:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $589
JUMPV
LABELV $617
line 1040
;1039:			}
;1040:			raising = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1041
;1041:		}
LABELV $614
line 1043
;1042:
;1043:		if (raising)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $619
line 1044
;1044:		{	// Check if we can accrue the cost of this power.
line 1045
;1045:			rank = uiForcePowersRank[forcepower]+1;
ADDRLP4 12
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1046
;1046:			if (bgForcePowerCost[forcepower][rank] > uiForceAvailable)
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
ADDRGP4 uiForceAvailable
INDIRI4
LEI4 $621
line 1047
;1047:			{	// We can't afford this power.  Abandon ship.
line 1048
;1048:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $589
JUMPV
LABELV $621
line 1051
;1049:			}
;1050:			else
;1051:			{	// Sure we can afford it.
line 1052
;1052:				uiForceUsed += bgForcePowerCost[forcepower][rank];
ADDRLP4 24
ADDRGP4 uiForceUsed
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1053
;1053:				uiForceAvailable -= bgForcePowerCost[forcepower][rank];
ADDRLP4 28
ADDRGP4 uiForceAvailable
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1054
;1054:				uiForcePowersRank[forcepower]=rank;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1055
;1055:			}
line 1056
;1056:		}
ADDRGP4 $620
JUMPV
LABELV $619
line 1058
;1057:		else
;1058:		{	// Lower the point.
line 1059
;1059:			rank = uiForcePowersRank[forcepower];
ADDRLP4 12
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
ASGNI4
line 1060
;1060:			uiForceUsed -= bgForcePowerCost[forcepower][rank];
ADDRLP4 24
ADDRGP4 uiForceUsed
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1061
;1061:			uiForceAvailable += bgForcePowerCost[forcepower][rank];
ADDRLP4 28
ADDRGP4 uiForceAvailable
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1062
;1062:			uiForcePowersRank[forcepower]--;
ADDRLP4 32
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1063
;1063:		}
LABELV $620
line 1065
;1064:
;1065:		UpdateForceUsed();
ADDRGP4 UpdateForceUsed
CALLV
pop
line 1067
;1066:
;1067:		gTouchedForce = qtrue;
ADDRGP4 gTouchedForce
CNSTI4 1
ASGNI4
line 1069
;1068:
;1069:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $589
JUMPV
LABELV $590
line 1071
;1070:	}
;1071:	return qfalse;
CNSTI4 0
RETI4
LABELV $589
endproc UI_ForcePowerRank_HandleKey 36 0
data
export gCustRank
align 4
LABELV gCustRank
byte 4 0
export gCustSide
align 4
LABELV gCustSide
byte 4 0
export gCustPowersRank
align 4
LABELV gCustPowersRank
byte 4 0
byte 4 1
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
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
export UI_ForceConfigHandle
code
proc UI_ForceConfigHandle 9376 24
line 1105
;1072:}
;1073:
;1074:
;1075:int gCustRank = 0;
;1076:int gCustSide = 0;
;1077:
;1078:int gCustPowersRank[NUM_FORCE_POWERS] = {
;1079:	0,//FP_HEAL = 0,//instant
;1080:	1,//FP_LEVITATION,//hold/duration, this one defaults to 1 (gives a free point)
;1081:	0,//FP_SPEED,//duration
;1082:	0,//FP_PUSH,//hold/duration
;1083:	0,//FP_PULL,//hold/duration
;1084:	0,//FP_TELEPATHY,//instant
;1085:	0,//FP_GRIP,//hold/duration
;1086:	0,//FP_LIGHTNING,//hold/duration
;1087:	0,//FP_RAGE,//duration
;1088:	0,//FP_PROTECT,
;1089:	0,//FP_ABSORB,
;1090:	0,//FP_TEAM_HEAL,
;1091:	0,//FP_TEAM_FORCE,
;1092:	0,//FP_DRAIN,
;1093:	0,//FP_SEE,
;1094:	0,//FP_SABERATTACK,
;1095:	0,//FP_SABERDEFEND,
;1096:	0//FP_SABERTHROW,
;1097:};
;1098:
;1099:/*
;1100:=================
;1101:UI_ForceConfigHandle
;1102:=================
;1103:*/
;1104:void UI_ForceConfigHandle( int oldindex, int newindex )
;1105:{
line 1107
;1106:	fileHandle_t f;
;1107:	int len = 0;
ADDRLP4 8276
CNSTI4 0
ASGNI4
line 1108
;1108:	int i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1109
;1109:	int c = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1110
;1110:	int iBuf = 0, forcePowerRank, currank;
ADDRLP4 8272
CNSTI4 0
ASGNI4
line 1114
;1111:	char fcfBuffer[8192];
;1112:	char singleBuf[64];
;1113:	char info[MAX_INFO_VALUE];
;1114:	int forceTeam = 0;
ADDRLP4 9308
CNSTI4 0
ASGNI4
line 1116
;1115:
;1116:	if (oldindex == 0)
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $624
line 1117
;1117:	{ //switching out from custom config, so first shove the current values into the custom storage
line 1118
;1118:		i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $627
JUMPV
LABELV $626
line 1121
;1119:
;1120:		while (i < NUM_FORCE_POWERS)
;1121:		{
line 1122
;1122:			gCustPowersRank[i] = uiForcePowersRank[i];
ADDRLP4 9312
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9312
INDIRI4
ADDRGP4 gCustPowersRank
ADDP4
ADDRLP4 9312
INDIRI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
ASGNI4
line 1123
;1123:			i++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1124
;1124:		}
LABELV $627
line 1120
ADDRLP4 8
INDIRI4
CNSTI4 18
LTI4 $626
line 1125
;1125:		gCustRank = uiForceRank;
ADDRGP4 gCustRank
ADDRGP4 uiForceRank
INDIRI4
ASGNI4
line 1126
;1126:		gCustSide = uiForceSide;
ADDRGP4 gCustSide
ADDRGP4 uiForceSide
INDIRI4
ASGNI4
line 1127
;1127:	}
LABELV $624
line 1129
;1128:
;1129:	if (newindex == 0)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $629
line 1130
;1130:	{ //switching back to custom, shove the values back in from the custom storage
line 1131
;1131:		i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1132
;1132:		uiForceUsed = 0;
ADDRGP4 uiForceUsed
CNSTI4 0
ASGNI4
line 1133
;1133:		gTouchedForce = qtrue;
ADDRGP4 gTouchedForce
CNSTI4 1
ASGNI4
ADDRGP4 $632
JUMPV
LABELV $631
line 1136
;1134:
;1135:		while (i < NUM_FORCE_POWERS)
;1136:		{
line 1137
;1137:			uiForcePowersRank[i] = gCustPowersRank[i];
ADDRLP4 9312
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9312
INDIRI4
ADDRGP4 uiForcePowersRank
ADDP4
ADDRLP4 9312
INDIRI4
ADDRGP4 gCustPowersRank
ADDP4
INDIRI4
ASGNI4
line 1138
;1138:			uiForceUsed += uiForcePowersRank[i];
ADDRLP4 9316
ADDRGP4 uiForceUsed
ASGNP4
ADDRLP4 9316
INDIRP4
ADDRLP4 9316
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1139
;1139:			i++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1140
;1140:		}
LABELV $632
line 1135
ADDRLP4 8
INDIRI4
CNSTI4 18
LTI4 $631
line 1141
;1141:		uiForceRank = gCustRank;
ADDRGP4 uiForceRank
ADDRGP4 gCustRank
INDIRI4
ASGNI4
line 1142
;1142:		uiForceSide = gCustSide;
ADDRGP4 uiForceSide
ADDRGP4 gCustSide
INDIRI4
ASGNI4
line 1144
;1143:
;1144:		UpdateForceUsed();
ADDRGP4 UpdateForceUsed
CALLV
pop
line 1145
;1145:		return;
ADDRGP4 $623
JUMPV
LABELV $629
line 1149
;1146:	}
;1147:
;1148:	//If we made it here, we want to load in a new config
;1149:	if (uiForceSide == FORCE_LIGHTSIDE)
ADDRGP4 uiForceSide
INDIRI4
CNSTI4 1
NEI4 $634
line 1150
;1150:	{ //we should only be displaying lightside configs, so.. look in the light folder
line 1151
;1151:		newindex += uiInfo.forceConfigLightIndexBegin;
ADDRFP4 4
ADDRFP4 4
INDIRI4
ADDRGP4 uiInfo+95192
INDIRI4
ADDI4
ASGNI4
line 1152
;1152:		if (newindex >= uiInfo.forceConfigCount)
ADDRFP4 4
INDIRI4
ADDRGP4 uiInfo+78284
INDIRI4
LTI4 $637
line 1153
;1153:		{
line 1154
;1154:			return;
ADDRGP4 $623
JUMPV
LABELV $637
line 1156
;1155:		}
;1156:		len = trap_FS_FOpenFile(va("forcecfg/light/%s.fcf", uiInfo.forceConfigNames[newindex]), &f, FS_READ);
ADDRGP4 $260
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 uiInfo+78292
ADDP4
ARGP4
ADDRLP4 9312
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 9312
INDIRP4
ARGP4
ADDRLP4 9304
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 9316
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 8276
ADDRLP4 9316
INDIRI4
ASGNI4
line 1157
;1157:	}
ADDRGP4 $635
JUMPV
LABELV $634
line 1159
;1158:	else
;1159:	{ //else dark
line 1160
;1160:		newindex += uiInfo.forceConfigDarkIndexBegin;
ADDRFP4 4
ADDRFP4 4
INDIRI4
ADDRGP4 uiInfo+95188
INDIRI4
ADDI4
ASGNI4
line 1161
;1161:		if (newindex >= uiInfo.forceConfigCount || newindex > uiInfo.forceConfigLightIndexBegin)
ADDRLP4 9312
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 9312
INDIRI4
ADDRGP4 uiInfo+78284
INDIRI4
GEI4 $646
ADDRLP4 9312
INDIRI4
ADDRGP4 uiInfo+95192
INDIRI4
LEI4 $642
LABELV $646
line 1162
;1162:		{ //dark gets read in before light
line 1163
;1163:			return;
ADDRGP4 $623
JUMPV
LABELV $642
line 1165
;1164:		}
;1165:		len = trap_FS_FOpenFile(va("forcecfg/dark/%s.fcf", uiInfo.forceConfigNames[newindex]), &f, FS_READ);
ADDRGP4 $261
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 uiInfo+78292
ADDP4
ARGP4
ADDRLP4 9316
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 9316
INDIRP4
ARGP4
ADDRLP4 9304
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 9320
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 8276
ADDRLP4 9320
INDIRI4
ASGNI4
line 1166
;1166:	}
LABELV $635
line 1168
;1167:
;1168:	if (len <= 0)
ADDRLP4 8276
INDIRI4
CNSTI4 0
GTI4 $648
line 1169
;1169:	{ //This should not have happened. But, before we quit out, attempt searching the other light/dark folder for the file.
line 1170
;1170:		if (uiForceSide == FORCE_LIGHTSIDE)
ADDRGP4 uiForceSide
INDIRI4
CNSTI4 1
NEI4 $650
line 1171
;1171:		{
line 1172
;1172:			len = trap_FS_FOpenFile(va("forcecfg/dark/%s.fcf", uiInfo.forceConfigNames[newindex]), &f, FS_READ);
ADDRGP4 $261
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 uiInfo+78292
ADDP4
ARGP4
ADDRLP4 9312
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 9312
INDIRP4
ARGP4
ADDRLP4 9304
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 9316
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 8276
ADDRLP4 9316
INDIRI4
ASGNI4
line 1173
;1173:		}
ADDRGP4 $651
JUMPV
LABELV $650
line 1175
;1174:		else
;1175:		{
line 1176
;1176:			len = trap_FS_FOpenFile(va("forcecfg/light/%s.fcf", uiInfo.forceConfigNames[newindex]), &f, FS_READ);
ADDRGP4 $260
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 uiInfo+78292
ADDP4
ARGP4
ADDRLP4 9312
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 9312
INDIRP4
ARGP4
ADDRLP4 9304
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 9316
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 8276
ADDRLP4 9316
INDIRI4
ASGNI4
line 1177
;1177:		}
LABELV $651
line 1179
;1178:
;1179:		if (len <= 0)
ADDRLP4 8276
INDIRI4
CNSTI4 0
GTI4 $654
line 1180
;1180:		{ //still failure? Oh well.
line 1181
;1181:			return;
ADDRGP4 $623
JUMPV
LABELV $654
line 1183
;1182:		}
;1183:	}
LABELV $648
line 1185
;1184:
;1185:	if (len >= 8192)
ADDRLP4 8276
INDIRI4
CNSTI4 8192
LTI4 $656
line 1186
;1186:	{
line 1187
;1187:		return;
ADDRGP4 $623
JUMPV
LABELV $656
line 1190
;1188:	}
;1189:
;1190:	trap_FS_Read(fcfBuffer, len, f);
ADDRLP4 16
ARGP4
ADDRLP4 8276
INDIRI4
ARGI4
ADDRLP4 9304
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 1191
;1191:	fcfBuffer[len] = 0;
ADDRLP4 8276
INDIRI4
ADDRLP4 16
ADDP4
CNSTI1 0
ASGNI1
line 1192
;1192:	trap_FS_FCloseFile(f);
ADDRLP4 9304
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1194
;1193:
;1194:	i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1196
;1195:
;1196:	info[0] = '\0';
ADDRLP4 8280
CNSTI1 0
ASGNI1
line 1197
;1197:	trap_GetConfigString(CS_SERVERINFO, info, sizeof(info));
CNSTI4 0
ARGI4
ADDRLP4 8280
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1199
;1198:
;1199:	if (atoi( Info_ValueForKey( info, "g_forceBasedTeams" ) ))
ADDRLP4 8280
ARGP4
ADDRGP4 $392
ARGP4
ADDRLP4 9312
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 9312
INDIRP4
ARGP4
ADDRLP4 9316
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 9316
INDIRI4
CNSTI4 0
EQI4 $658
line 1200
;1200:	{
line 1201
;1201:		switch((int)(trap_Cvar_VariableValue("ui_myteam")))
ADDRGP4 $321
ARGP4
ADDRLP4 9324
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 9320
ADDRLP4 9324
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 9320
INDIRI4
CNSTI4 1
EQI4 $663
ADDRLP4 9320
INDIRI4
CNSTI4 2
EQI4 $664
ADDRGP4 $661
JUMPV
line 1202
;1202:		{
LABELV $663
line 1204
;1203:		case TEAM_RED:
;1204:			forceTeam = FORCE_DARKSIDE;
ADDRLP4 9308
CNSTI4 2
ASGNI4
line 1205
;1205:			break;
ADDRGP4 $661
JUMPV
LABELV $664
line 1207
;1206:		case TEAM_BLUE:
;1207:			forceTeam = FORCE_LIGHTSIDE;
ADDRLP4 9308
CNSTI4 1
ASGNI4
line 1208
;1208:			break;
line 1210
;1209:		default:
;1210:			break;
LABELV $661
line 1212
;1211:		}
;1212:	}
LABELV $658
line 1214
;1213:
;1214:	BG_LegalizedForcePowers(fcfBuffer, uiMaxRank, ui_freeSaber.integer, forceTeam, atoi( Info_ValueForKey( info, "g_gametype" )), 0);
ADDRLP4 8280
ARGP4
ADDRGP4 $401
ARGP4
ADDRLP4 9320
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 9320
INDIRP4
ARGP4
ADDRLP4 9324
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 16
ARGP4
ADDRGP4 uiMaxRank
INDIRI4
ARGI4
ADDRGP4 ui_freeSaber+12
INDIRI4
ARGI4
ADDRLP4 9308
INDIRI4
ARGI4
ADDRLP4 9324
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BG_LegalizedForcePowers
CALLI4
pop
ADDRGP4 $667
JUMPV
LABELV $666
line 1220
;1215:	//legalize the config based on the max rank
;1216:
;1217:	//now that we're done with the handle, it's time to parse our force data out of the string
;1218:	//we store strings in rank-side-xxxxxxxxx format (where the x's are individual force power levels)
;1219:	while (fcfBuffer[i] && fcfBuffer[i] != '-')
;1220:	{
line 1221
;1221:		singleBuf[c] = fcfBuffer[i];
ADDRLP4 0
INDIRI4
ADDRLP4 8208
ADDP4
ADDRLP4 8
INDIRI4
ADDRLP4 16
ADDP4
INDIRI1
ASGNI1
line 1222
;1222:		c++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1223
;1223:		i++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1224
;1224:	}
LABELV $667
line 1219
ADDRLP4 9328
ADDRLP4 8
INDIRI4
ADDRLP4 16
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 9328
INDIRI4
CNSTI4 0
EQI4 $669
ADDRLP4 9328
INDIRI4
CNSTI4 45
NEI4 $666
LABELV $669
line 1225
;1225:	singleBuf[c] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8208
ADDP4
CNSTI1 0
ASGNI1
line 1226
;1226:	c = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1227
;1227:	i++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1229
;1228:
;1229:	iBuf = atoi(singleBuf);
ADDRLP4 8208
ARGP4
ADDRLP4 9332
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8272
ADDRLP4 9332
INDIRI4
ASGNI4
line 1231
;1230:
;1231:	if (iBuf > uiMaxRank || iBuf < 0)
ADDRLP4 8272
INDIRI4
ADDRGP4 uiMaxRank
INDIRI4
GTI4 $672
ADDRLP4 8272
INDIRI4
CNSTI4 0
GEI4 $670
LABELV $672
line 1232
;1232:	{ //this force config uses a rank level higher than our currently restricted level.. so we can't use it
line 1234
;1233:	  //FIXME: Print a message indicating this to the user
;1234:		return;
ADDRGP4 $623
JUMPV
LABELV $670
line 1237
;1235:	}
;1236:
;1237:	uiForceRank = iBuf;
ADDRGP4 uiForceRank
ADDRLP4 8272
INDIRI4
ASGNI4
ADDRGP4 $674
JUMPV
LABELV $673
line 1240
;1238:
;1239:	while (fcfBuffer[i] && fcfBuffer[i] != '-')
;1240:	{
line 1241
;1241:		singleBuf[c] = fcfBuffer[i];
ADDRLP4 0
INDIRI4
ADDRLP4 8208
ADDP4
ADDRLP4 8
INDIRI4
ADDRLP4 16
ADDP4
INDIRI1
ASGNI1
line 1242
;1242:		c++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1243
;1243:		i++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1244
;1244:	}
LABELV $674
line 1239
ADDRLP4 9340
ADDRLP4 8
INDIRI4
ADDRLP4 16
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 9340
INDIRI4
CNSTI4 0
EQI4 $676
ADDRLP4 9340
INDIRI4
CNSTI4 45
NEI4 $673
LABELV $676
line 1245
;1245:	singleBuf[c] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8208
ADDP4
CNSTI1 0
ASGNI1
line 1246
;1246:	c = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1247
;1247:	i++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1249
;1248:
;1249:	uiForceSide = atoi(singleBuf);
ADDRLP4 8208
ARGP4
ADDRLP4 9344
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 uiForceSide
ADDRLP4 9344
INDIRI4
ASGNI4
line 1251
;1250:
;1251:	if (uiForceSide != FORCE_LIGHTSIDE &&
ADDRLP4 9348
ADDRGP4 uiForceSide
INDIRI4
ASGNI4
ADDRLP4 9348
INDIRI4
CNSTI4 1
EQI4 $680
ADDRLP4 9348
INDIRI4
CNSTI4 2
EQI4 $680
line 1253
;1252:		uiForceSide != FORCE_DARKSIDE)
;1253:	{
line 1254
;1254:		uiForceSide = FORCE_LIGHTSIDE;
ADDRGP4 uiForceSide
CNSTI4 1
ASGNI4
line 1255
;1255:		return;
ADDRGP4 $623
JUMPV
LABELV $679
line 1260
;1256:	}
;1257:
;1258:	//clear out the existing powers
;1259:	while (c < NUM_FORCE_POWERS)
;1260:	{
line 1280
;1261:		/*
;1262:		if (c==FP_LEVITATION)
;1263:		{
;1264:			uiForcePowersRank[c]=1;
;1265:		}
;1266:		else if (c==FP_SABERATTACK && ui_freeSaber.integer)
;1267:		{
;1268:			uiForcePowersRank[c]=1;
;1269:		}
;1270:		else if (c==FP_SABERDEFEND && ui_freeSaber.integer)
;1271:		{
;1272:			uiForcePowersRank[c]=1;
;1273:		}
;1274:		else
;1275:		{
;1276:			uiForcePowersRank[c] = 0;
;1277:		}
;1278:		*/
;1279:		//rww - don't need to do these checks. Just trust whatever the saber config says.
;1280:		uiForcePowersRank[c] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
CNSTI4 0
ASGNI4
line 1281
;1281:		c++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1282
;1282:	}
LABELV $680
line 1259
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $679
line 1283
;1283:	uiForceUsed = 0;
ADDRGP4 uiForceUsed
CNSTI4 0
ASGNI4
line 1284
;1284:	uiForceAvailable = forceMasteryPoints[uiForceRank];
ADDRGP4 uiForceAvailable
ADDRGP4 uiForceRank
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceMasteryPoints
ADDP4
INDIRI4
ASGNI4
line 1285
;1285:	gTouchedForce = qtrue;
ADDRGP4 gTouchedForce
CNSTI4 1
ASGNI4
line 1287
;1286:
;1287:	for (c=0;fcfBuffer[i]&&c<NUM_FORCE_POWERS;c++,i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $685
JUMPV
LABELV $682
line 1288
;1288:	{
line 1289
;1289:		singleBuf[0] = fcfBuffer[i];
ADDRLP4 8208
ADDRLP4 8
INDIRI4
ADDRLP4 16
ADDP4
INDIRI1
ASGNI1
line 1290
;1290:		singleBuf[1] = 0;
ADDRLP4 8208+1
CNSTI1 0
ASGNI1
line 1291
;1291:		iBuf = atoi(singleBuf);	// So, that means that Force Power "c" wants to be set to rank "iBuf".
ADDRLP4 8208
ARGP4
ADDRLP4 9352
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8272
ADDRLP4 9352
INDIRI4
ASGNI4
line 1293
;1292:		
;1293:		if (iBuf < 0)
ADDRLP4 8272
INDIRI4
CNSTI4 0
GEI4 $687
line 1294
;1294:		{
line 1295
;1295:			iBuf = 0;
ADDRLP4 8272
CNSTI4 0
ASGNI4
line 1296
;1296:		}
LABELV $687
line 1298
;1297:
;1298:		forcePowerRank = iBuf;
ADDRLP4 12
ADDRLP4 8272
INDIRI4
ASGNI4
line 1300
;1299:
;1300:		if (forcePowerRank > FORCE_LEVEL_3 || forcePowerRank < 0)
ADDRLP4 12
INDIRI4
CNSTI4 3
GTI4 $691
ADDRLP4 12
INDIRI4
CNSTI4 0
GEI4 $689
LABELV $691
line 1301
;1301:		{ //err..  not correct
line 1302
;1302:			continue;  // skip this power
ADDRGP4 $683
JUMPV
LABELV $689
line 1305
;1303:		}
;1304:
;1305:		if (uiForcePowerDarkLight[c] && uiForcePowerDarkLight[c] != uiForceSide)
ADDRLP4 9360
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowerDarkLight
ADDP4
INDIRI4
ASGNI4
ADDRLP4 9360
INDIRI4
CNSTI4 0
EQI4 $692
ADDRLP4 9360
INDIRI4
ADDRGP4 uiForceSide
INDIRI4
EQI4 $692
line 1306
;1306:		{ //Apparently the user has crafted a force config that has powers that don't fit with the config's side.
line 1307
;1307:			continue;  // skip this power
ADDRGP4 $683
JUMPV
LABELV $692
line 1311
;1308:		}
;1309:
;1310:		// Accrue cost for each assigned rank for this power.
;1311:		for (currank=FORCE_LEVEL_1;currank<=forcePowerRank;currank++)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $697
JUMPV
LABELV $694
line 1312
;1312:		{	
line 1313
;1313:			if (bgForcePowerCost[c][currank] > uiForceAvailable)
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
ADDRGP4 uiForceAvailable
INDIRI4
LEI4 $698
line 1314
;1314:			{	// Break out, we can't afford any more power.
line 1315
;1315:				break;
ADDRGP4 $696
JUMPV
LABELV $698
line 1318
;1316:			}
;1317:			// Pay for this rank of this power.
;1318:			uiForceUsed += bgForcePowerCost[c][currank];
ADDRLP4 9364
ADDRGP4 uiForceUsed
ASGNP4
ADDRLP4 9364
INDIRP4
ADDRLP4 9364
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1319
;1319:			uiForceAvailable -= bgForcePowerCost[c][currank];
ADDRLP4 9368
ADDRGP4 uiForceAvailable
ASGNP4
ADDRLP4 9368
INDIRP4
ADDRLP4 9368
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
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
line 1321
;1320:
;1321:			uiForcePowersRank[c]++;
ADDRLP4 9372
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
ASGNP4
ADDRLP4 9372
INDIRP4
ADDRLP4 9372
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1322
;1322:		}
LABELV $695
line 1311
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $697
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $694
LABELV $696
line 1323
;1323:	}
LABELV $683
line 1287
ADDRLP4 9352
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 9352
INDIRI4
ADDI4
ASGNI4
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 9352
INDIRI4
ADDI4
ASGNI4
LABELV $685
ADDRLP4 8
INDIRI4
ADDRLP4 16
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $700
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $682
LABELV $700
line 1325
;1324:
;1325:	if (uiForcePowersRank[FP_LEVITATION] < 1)
ADDRGP4 uiForcePowersRank+4
INDIRI4
CNSTI4 1
GEI4 $701
line 1326
;1326:	{
line 1327
;1327:		uiForcePowersRank[FP_LEVITATION]=1;
ADDRGP4 uiForcePowersRank+4
CNSTI4 1
ASGNI4
line 1328
;1328:	}
LABELV $701
line 1329
;1329:	if (uiForcePowersRank[FP_SABERATTACK] < 1 && ui_freeSaber.integer)
ADDRGP4 uiForcePowersRank+60
INDIRI4
CNSTI4 1
GEI4 $705
ADDRGP4 ui_freeSaber+12
INDIRI4
CNSTI4 0
EQI4 $705
line 1330
;1330:	{
line 1331
;1331:		uiForcePowersRank[FP_SABERATTACK]=1;
ADDRGP4 uiForcePowersRank+60
CNSTI4 1
ASGNI4
line 1332
;1332:	}
LABELV $705
line 1333
;1333:	if (uiForcePowersRank[FP_SABERDEFEND] < 1 && ui_freeSaber.integer)
ADDRGP4 uiForcePowersRank+64
INDIRI4
CNSTI4 1
GEI4 $710
ADDRGP4 ui_freeSaber+12
INDIRI4
CNSTI4 0
EQI4 $710
line 1334
;1334:	{
line 1335
;1335:		uiForcePowersRank[FP_SABERDEFEND]=1;
ADDRGP4 uiForcePowersRank+64
CNSTI4 1
ASGNI4
line 1336
;1336:	}
LABELV $710
line 1338
;1337:
;1338:	UpdateForceUsed();
ADDRGP4 UpdateForceUsed
CALLV
pop
line 1339
;1339:}
LABELV $623
endproc UI_ForceConfigHandle 9376 24
import uiSkinColor
import UI_TrueJediEnabled
bss
export uiForceStarShaders
align 4
LABELV uiForceStarShaders
skip 72
import Menu_ShowItemByName
import UI_TeamName
import UI_DrawTotalForceStars
export ui_forcePowerDisable
align 4
LABELV ui_forcePowerDisable
skip 272
export ui_freeSaber
align 4
LABELV ui_freeSaber
skip 272
export uiSaberColorShaders
align 4
LABELV uiSaberColorShaders
skip 24
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetBotNameByNumber
import UI_LoadBots
import UI_GetNumBots
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_SaveConfigMenu
import UI_SaveConfigMenu_Cache
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import UI_AddBotsMenu
import UI_AddBots_Cache
import trap_G2API_SetBoneAngles
import trap_R_RemapShader
import trap_RealTime
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_S_StartBackgroundTrack
import trap_S_StopBackgroundTrack
import trap_R_RegisterFont
import trap_MemoryRemaining
import trap_LAN_CompareServers
import trap_LAN_ServerStatus
import trap_LAN_ResetPings
import trap_LAN_RemoveServer
import trap_LAN_AddServer
import trap_LAN_UpdateVisiblePings
import trap_LAN_ServerIsVisible
import trap_LAN_MarkServerVisible
import trap_LAN_SaveCachedServers
import trap_LAN_LoadCachedServers
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerPing
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import UI_SPSkillMenu_Cache
import UI_SPSkillMenu
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
import uis
import UI_LoadBestScores
import m_entersound
import UI_StartDemoLoop
import UI_Cvar_VariableString
import UI_Argv
import UI_ForceMenuOff
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawTextBox
import UI_CursorInRect
import UI_DrawChar
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawSides
import UI_DrawTopBottom
import UI_DrawRect
import UI_FillRect
import UI_DrawHandlePic
import UI_DrawNamedPic
import UI_ClampCvar
import UI_ConsoleCommand
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Shutdown
import UI_Init
import uiInfo
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UI_BotSelectMenu_Cache
import UI_BotSelectMenu
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyServer_Cache
import UI_SpecifyServerMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
import UI_CDKeyMenu_f
import UI_CDKeyMenu_Cache
import UI_CDKeyMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import UI_DrawConnectScreen
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_UpdateCvars
import UI_RegisterCvars
import UI_MainMenu
import MainMenu_Cache
import UI_LoadForceConfig_List
import UI_LoadArenas
import UI_ClearScores
import UI_ShowPostGame
import UI_AdjustTimeByGame
import _UI_SetActiveMenu
import UI_LoadMenus
import UI_Load
import UI_Report
import UI_FeederSelection
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import text_color_highlight
import text_color_normal
import text_color_disabled
import listbar_color
import list_color
import name_color
import color_dim
import color_red
import color_orange
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
import ui_serverStatusTimeOut
import ui_bigFont
import ui_smallFont
import ui_scoreTime
import ui_scoreShutoutBonus
import ui_scoreSkillBonus
import ui_scoreTimeBonus
import ui_scoreBase
import ui_scoreTeam
import ui_scorePerfect
import ui_scoreScore
import ui_scoreGauntlets
import ui_scoreAssists
import ui_scoreDefends
import ui_scoreExcellents
import ui_scoreImpressives
import ui_scoreAccuracy
import ui_singlePlayerActive
import ui_lastServerRefresh_3
import ui_lastServerRefresh_2
import ui_lastServerRefresh_1
import ui_lastServerRefresh_0
import ui_selectedPlayerName
import ui_selectedPlayer
import ui_currentOpponent
import ui_mapIndex
import ui_currentNetMap
import ui_currentMap
import ui_currentTier
import ui_menuFiles
import ui_opponentName
import ui_dedicated
import ui_serverFilterType
import ui_netSource
import ui_joinGameType
import ui_actualNetGameType
import ui_netGameType
import ui_gameType
import ui_fragLimit
import ui_captureLimit
import ui_cdkeychecked
import ui_cdkey
import ui_server16
import ui_server15
import ui_server14
import ui_server13
import ui_server12
import ui_server11
import ui_server10
import ui_server9
import ui_server8
import ui_server7
import ui_server6
import ui_server5
import ui_server4
import ui_server3
import ui_server2
import ui_server1
import ui_marks
import ui_drawCrosshairNames
import ui_drawCrosshair
import ui_browserShowEmpty
import ui_browserShowFull
import ui_browserSortKey
import ui_browserGameType
import ui_browserMaster
import ui_spSelection
import ui_spSkill
import ui_spVideos
import ui_spAwards
import ui_spScores5
import ui_spScores4
import ui_spScores3
import ui_spScores2
import ui_spScores1
import ui_botsFile
import ui_arenasFile
import ui_ctf_friendly
import ui_ctf_timelimit
import ui_ctf_capturelimit
import ui_team_friendly
import ui_team_timelimit
import ui_team_fraglimit
import ui_selectedModelIndex
import ui_tourney_timelimit
import ui_tourney_fraglimit
import ui_ffa_timelimit
import ui_ffa_fraglimit
import trap_SP_GetStringTextString
import trap_SP_Register
import trap_SP_RegisterServer
import trap_AnyLanguage_ReadCharFromString
import trap_Language_UsesSpaces
import trap_Language_IsAsian
import trap_R_Font_DrawString
import trap_R_Font_HeightPixels
import trap_R_Font_StrLenChars
import trap_R_Font_StrLenPixels
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
LABELV $588
char 1 103
char 1 95
char 1 109
char 1 97
char 1 120
char 1 70
char 1 111
char 1 114
char 1 99
char 1 101
char 1 82
char 1 97
char 1 110
char 1 107
char 1 0
align 1
LABELV $401
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
char 1 0
align 1
LABELV $392
char 1 103
char 1 95
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 66
char 1 97
char 1 115
char 1 101
char 1 100
char 1 84
char 1 101
char 1 97
char 1 109
char 1 115
char 1 0
align 1
LABELV $346
char 1 110
char 1 111
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 0
align 1
LABELV $345
char 1 101
char 1 102
char 1 102
char 1 101
char 1 99
char 1 116
char 1 102
char 1 105
char 1 101
char 1 108
char 1 100
char 1 0
align 1
LABELV $344
char 1 101
char 1 102
char 1 102
char 1 101
char 1 99
char 1 116
char 1 101
char 1 110
char 1 116
char 1 114
char 1 121
char 1 0
align 1
LABELV $343
char 1 115
char 1 101
char 1 116
char 1 102
char 1 112
char 1 95
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 116
char 1 104
char 1 114
char 1 111
char 1 119
char 1 0
align 1
LABELV $342
char 1 115
char 1 101
char 1 116
char 1 102
char 1 112
char 1 95
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 100
char 1 101
char 1 102
char 1 101
char 1 110
char 1 100
char 1 0
align 1
LABELV $324
char 1 105
char 1 110
char 1 103
char 1 97
char 1 109
char 1 101
char 1 95
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 0
align 1
LABELV $321
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
LABELV $271
char 1 84
char 1 101
char 1 109
char 1 112
char 1 108
char 1 97
char 1 116
char 1 101
char 1 32
char 1 115
char 1 97
char 1 118
char 1 101
char 1 100
char 1 32
char 1 97
char 1 115
char 1 32
char 1 34
char 1 37
char 1 115
char 1 34
char 1 46
char 1 10
char 1 0
align 1
LABELV $269
char 1 37
char 1 105
char 1 0
align 1
LABELV $265
char 1 37
char 1 105
char 1 45
char 1 37
char 1 105
char 1 45
char 1 0
align 1
LABELV $264
char 1 84
char 1 104
char 1 101
char 1 114
char 1 101
char 1 32
char 1 119
char 1 97
char 1 115
char 1 32
char 1 97
char 1 110
char 1 32
char 1 101
char 1 114
char 1 114
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
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 116
char 1 101
char 1 109
char 1 112
char 1 108
char 1 97
char 1 116
char 1 101
char 1 32
char 1 102
char 1 105
char 1 108
char 1 101
char 1 32
char 1 40
char 1 114
char 1 101
char 1 97
char 1 100
char 1 45
char 1 111
char 1 110
char 1 108
char 1 121
char 1 63
char 1 41
char 1 46
char 1 10
char 1 0
align 1
LABELV $261
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 99
char 1 102
char 1 103
char 1 47
char 1 100
char 1 97
char 1 114
char 1 107
char 1 47
char 1 37
char 1 115
char 1 46
char 1 102
char 1 99
char 1 102
char 1 0
align 1
LABELV $260
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 99
char 1 102
char 1 103
char 1 47
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 47
char 1 37
char 1 115
char 1 46
char 1 102
char 1 99
char 1 102
char 1 0
align 1
LABELV $257
char 1 89
char 1 111
char 1 117
char 1 32
char 1 100
char 1 105
char 1 100
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 112
char 1 114
char 1 111
char 1 118
char 1 105
char 1 100
char 1 101
char 1 32
char 1 97
char 1 32
char 1 110
char 1 97
char 1 109
char 1 101
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 116
char 1 101
char 1 109
char 1 112
char 1 108
char 1 97
char 1 116
char 1 101
char 1 46
char 1 10
char 1 0
align 1
LABELV $253
char 1 117
char 1 105
char 1 95
char 1 83
char 1 97
char 1 118
char 1 101
char 1 70
char 1 67
char 1 70
char 1 0
align 1
LABELV $246
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 99
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $245
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 99
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 100
char 1 32
char 1 34
char 1 37
char 1 115
char 1 34
char 1 10
char 1 0
align 1
LABELV $223
char 1 37
char 1 105
char 1 45
char 1 37
char 1 105
char 1 45
char 1 37
char 1 105
char 1 37
char 1 105
char 1 37
char 1 105
char 1 37
char 1 105
char 1 37
char 1 105
char 1 37
char 1 105
char 1 37
char 1 105
char 1 37
char 1 105
char 1 37
char 1 105
char 1 37
char 1 105
char 1 37
char 1 105
char 1 37
char 1 105
char 1 37
char 1 105
char 1 37
char 1 105
char 1 37
char 1 105
char 1 37
char 1 105
char 1 37
char 1 105
char 1 37
char 1 105
char 1 0
align 1
LABELV $222
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 115
char 1 0
align 1
LABELV $202
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 95
char 1 112
char 1 117
char 1 114
char 1 112
char 1 108
char 1 101
char 1 0
align 1
LABELV $200
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $198
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 95
char 1 103
char 1 114
char 1 101
char 1 101
char 1 110
char 1 0
align 1
LABELV $196
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 95
char 1 121
char 1 101
char 1 108
char 1 108
char 1 111
char 1 119
char 1 0
align 1
LABELV $194
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 95
char 1 111
char 1 114
char 1 97
char 1 110
char 1 103
char 1 101
char 1 0
align 1
LABELV $192
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 95
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $191
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 56
char 1 0
align 1
LABELV $188
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 99
char 1 105
char 1 114
char 1 99
char 1 108
char 1 101
char 1 56
char 1 0
align 1
LABELV $186
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 55
char 1 0
align 1
LABELV $183
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 99
char 1 105
char 1 114
char 1 99
char 1 108
char 1 101
char 1 55
char 1 0
align 1
LABELV $181
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 54
char 1 0
align 1
LABELV $178
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 99
char 1 105
char 1 114
char 1 99
char 1 108
char 1 101
char 1 54
char 1 0
align 1
LABELV $176
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 53
char 1 0
align 1
LABELV $173
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 99
char 1 105
char 1 114
char 1 99
char 1 108
char 1 101
char 1 53
char 1 0
align 1
LABELV $171
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 52
char 1 0
align 1
LABELV $168
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 99
char 1 105
char 1 114
char 1 99
char 1 108
char 1 101
char 1 52
char 1 0
align 1
LABELV $166
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 51
char 1 0
align 1
LABELV $163
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 99
char 1 105
char 1 114
char 1 99
char 1 108
char 1 101
char 1 51
char 1 0
align 1
LABELV $161
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 50
char 1 0
align 1
LABELV $158
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 99
char 1 105
char 1 114
char 1 99
char 1 108
char 1 101
char 1 50
char 1 0
align 1
LABELV $156
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 49
char 1 0
align 1
LABELV $153
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 99
char 1 105
char 1 114
char 1 99
char 1 108
char 1 101
char 1 49
char 1 0
align 1
LABELV $150
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 48
char 1 0
