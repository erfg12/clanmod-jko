data
export drawTeamOverlayModificationCount
align 4
LABELV drawTeamOverlayModificationCount
byte 4 -1
export CG_InitTeamChat
code
proc CG_InitTeamChat 0 12
file "../cg_newDraw.c"
line 17
;1:#include "cg_local.h"
;2:#include "../ui/ui_shared.h"
;3:
;4:extern displayContextDef_t cgDC;
;5:
;6:
;7:// set in CG_ParseTeamInfo
;8:
;9://static int sortedTeamPlayers[TEAM_MAXOVERLAY];
;10://static int numSortedTeamPlayers;
;11:int drawTeamOverlayModificationCount = -1;
;12:
;13://static char systemChat[256];
;14://static char teamChat1[256];
;15://static char teamChat2[256];
;16:
;17:void CG_InitTeamChat(void) {
line 18
;18:  memset(teamChat1, 0, sizeof(teamChat1));
ADDRGP4 teamChat1
ARGP4
CNSTI4 0
ARGI4
CNSTI4 256
ARGI4
ADDRGP4 memset
CALLP4
pop
line 19
;19:  memset(teamChat2, 0, sizeof(teamChat2));
ADDRGP4 teamChat2
ARGP4
CNSTI4 0
ARGI4
CNSTI4 256
ARGI4
ADDRGP4 memset
CALLP4
pop
line 20
;20:  memset(systemChat, 0, sizeof(systemChat));
ADDRGP4 systemChat
ARGP4
CNSTI4 0
ARGI4
CNSTI4 256
ARGI4
ADDRGP4 memset
CALLP4
pop
line 21
;21:}
LABELV $129
endproc CG_InitTeamChat 0 12
export CG_SetPrintString
proc CG_SetPrintString 0 8
line 23
;22:
;23:void CG_SetPrintString(int type, const char *p) {
line 24
;24:  if (type == SYSTEM_PRINT) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $131
line 25
;25:    strcpy(systemChat, p);
ADDRGP4 systemChat
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 26
;26:  } else {
ADDRGP4 $132
JUMPV
LABELV $131
line 27
;27:    strcpy(teamChat2, teamChat1);
ADDRGP4 teamChat2
ARGP4
ADDRGP4 teamChat1
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 28
;28:    strcpy(teamChat1, p);
ADDRGP4 teamChat1
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 29
;29:  }
LABELV $132
line 30
;30:}
LABELV $130
endproc CG_SetPrintString 0 8
export CG_CheckOrderPending
proc CG_CheckOrderPending 28 12
line 32
;31:
;32:void CG_CheckOrderPending(void) {
line 33
;33:	if (cgs.gametype < GT_CTF) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 7
GEI4 $134
line 34
;34:		return;
ADDRGP4 $133
JUMPV
LABELV $134
line 36
;35:	}
;36:	if (cgs.orderPending) {
ADDRGP4 cgs+70240
INDIRI4
CNSTI4 0
EQI4 $137
line 39
;37:		//clientInfo_t *ci = cgs.clientinfo + sortedTeamPlayers[cg_currentSelectedPlayer.integer];
;38:		const char *p1, *p2, *b;
;39:		p1 = p2 = b = NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 40
;40:		switch (cgs.currentOrder) {
ADDRLP4 16
ADDRGP4 cgs+70236
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
LTI4 $140
ADDRLP4 16
INDIRI4
CNSTI4 7
GTI4 $140
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $168-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $168
address $143
address $147
address $151
address $155
address $162
address $165
address $159
code
LABELV $143
line 42
;41:			case TEAMTASK_OFFENSE:
;42:				p1 = VOICECHAT_ONOFFENSE;
ADDRLP4 8
ADDRGP4 $144
ASGNP4
line 43
;43:				p2 = VOICECHAT_OFFENSE;
ADDRLP4 4
ADDRGP4 $145
ASGNP4
line 44
;44:				b = "+button7; wait; -button7";
ADDRLP4 0
ADDRGP4 $146
ASGNP4
line 45
;45:			break;
ADDRGP4 $141
JUMPV
LABELV $147
line 47
;46:			case TEAMTASK_DEFENSE:
;47:				p1 = VOICECHAT_ONDEFENSE;
ADDRLP4 8
ADDRGP4 $148
ASGNP4
line 48
;48:				p2 = VOICECHAT_DEFEND;
ADDRLP4 4
ADDRGP4 $149
ASGNP4
line 49
;49:				b = "+button8; wait; -button8";
ADDRLP4 0
ADDRGP4 $150
ASGNP4
line 50
;50:			break;					
ADDRGP4 $141
JUMPV
LABELV $151
line 52
;51:			case TEAMTASK_PATROL:
;52:				p1 = VOICECHAT_ONPATROL;
ADDRLP4 8
ADDRGP4 $152
ASGNP4
line 53
;53:				p2 = VOICECHAT_PATROL;
ADDRLP4 4
ADDRGP4 $153
ASGNP4
line 54
;54:				b = "+button9; wait; -button9";
ADDRLP4 0
ADDRGP4 $154
ASGNP4
line 55
;55:			break;
ADDRGP4 $141
JUMPV
LABELV $155
line 57
;56:			case TEAMTASK_FOLLOW: 
;57:				p1 = VOICECHAT_ONFOLLOW;
ADDRLP4 8
ADDRGP4 $156
ASGNP4
line 58
;58:				p2 = VOICECHAT_FOLLOWME;
ADDRLP4 4
ADDRGP4 $157
ASGNP4
line 59
;59:				b = "+button10; wait; -button10";
ADDRLP4 0
ADDRGP4 $158
ASGNP4
line 60
;60:			break;
ADDRGP4 $141
JUMPV
LABELV $159
line 62
;61:			case TEAMTASK_CAMP:
;62:				p1 = VOICECHAT_ONCAMPING;
ADDRLP4 8
ADDRGP4 $160
ASGNP4
line 63
;63:				p2 = VOICECHAT_CAMP;
ADDRLP4 4
ADDRGP4 $161
ASGNP4
line 64
;64:			break;
ADDRGP4 $141
JUMPV
LABELV $162
line 66
;65:			case TEAMTASK_RETRIEVE:
;66:				p1 = VOICECHAT_ONGETFLAG;
ADDRLP4 8
ADDRGP4 $163
ASGNP4
line 67
;67:				p2 = VOICECHAT_RETURNFLAG;
ADDRLP4 4
ADDRGP4 $164
ASGNP4
line 68
;68:			break;
ADDRGP4 $141
JUMPV
LABELV $165
line 70
;69:			case TEAMTASK_ESCORT:
;70:				p1 = VOICECHAT_ONFOLLOWCARRIER;
ADDRLP4 8
ADDRGP4 $166
ASGNP4
line 71
;71:				p2 = VOICECHAT_FOLLOWFLAGCARRIER;
ADDRLP4 4
ADDRGP4 $167
ASGNP4
line 72
;72:			break;
LABELV $140
LABELV $141
line 75
;73:		}
;74:
;75:		if (cg_currentSelectedPlayer.integer == numSortedTeamPlayers) {
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
NEI4 $170
line 77
;76:			// to everyone
;77:			trap_SendConsoleCommand(va("cmd vsay_team %s\n", p2));
ADDRGP4 $173
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 78
;78:		} else {
ADDRGP4 $171
JUMPV
LABELV $170
line 80
;79:			// for the player self
;80:			if (sortedTeamPlayers[cg_currentSelectedPlayer.integer] == cg.snap->ps.clientNum && p1) {
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
NEI4 $174
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $174
line 81
;81:				trap_SendConsoleCommand(va("teamtask %i\n", cgs.currentOrder));
ADDRGP4 $178
ARGP4
ADDRGP4 cgs+70236
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 83
;82:				//trap_SendConsoleCommand(va("cmd say_team %s\n", p2));
;83:				trap_SendConsoleCommand(va("cmd vsay_team %s\n", p1));
ADDRGP4 $173
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 84
;84:			} else if (p2) {
ADDRGP4 $175
JUMPV
LABELV $174
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $180
line 86
;85:				//trap_SendConsoleCommand(va("cmd say_team %s, %s\n", ci->name,p));
;86:				trap_SendConsoleCommand(va("cmd vtell %d %s\n", sortedTeamPlayers[cg_currentSelectedPlayer.integer], p2));
ADDRGP4 $182
ARGP4
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 87
;87:			}
LABELV $180
LABELV $175
line 88
;88:		}
LABELV $171
line 89
;89:		if (b) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $184
line 90
;90:			trap_SendConsoleCommand(b);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 91
;91:		}
LABELV $184
line 92
;92:		cgs.orderPending = qfalse;
ADDRGP4 cgs+70240
CNSTI4 0
ASGNI4
line 93
;93:	}
LABELV $137
line 94
;94:}
LABELV $133
endproc CG_CheckOrderPending 28 12
proc CG_SetSelectedPlayerName 8 8
line 96
;95:
;96:static void CG_SetSelectedPlayerName() {
line 97
;97:  if (cg_currentSelectedPlayer.integer >= 0 && cg_currentSelectedPlayer.integer < numSortedTeamPlayers) {
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 0
LTI4 $188
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
GEI4 $188
line 98
;98:		clientInfo_t *ci = cgs.clientinfo + sortedTeamPlayers[cg_currentSelectedPlayer.integer];
ADDRLP4 0
CNSTI4 788
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 99
;99:	  if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $189
line 100
;100:			trap_Cvar_Set("cg_selectedPlayerName", ci->name);
ADDRGP4 $196
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 101
;101:			trap_Cvar_Set("cg_selectedPlayer", va("%d", sortedTeamPlayers[cg_currentSelectedPlayer.integer]));
ADDRGP4 $198
ARGP4
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $197
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 102
;102:			cgs.currentOrder = ci->teamTask;
ADDRGP4 cgs+70236
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 103
;103:	  }
line 104
;104:	} else {
ADDRGP4 $189
JUMPV
LABELV $188
line 105
;105:		trap_Cvar_Set("cg_selectedPlayerName", "Everyone");
ADDRGP4 $196
ARGP4
ADDRGP4 $201
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 106
;106:	}
LABELV $189
line 107
;107:}
LABELV $187
endproc CG_SetSelectedPlayerName 8 8
export CG_GetSelectedPlayer
proc CG_GetSelectedPlayer 0 0
line 108
;108:int CG_GetSelectedPlayer() {
line 109
;109:	if (cg_currentSelectedPlayer.integer < 0 || cg_currentSelectedPlayer.integer >= numSortedTeamPlayers) {
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 0
LTI4 $207
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
LTI4 $203
LABELV $207
line 110
;110:		cg_currentSelectedPlayer.integer = 0;
ADDRGP4 cg_currentSelectedPlayer+12
CNSTI4 0
ASGNI4
line 111
;111:	}
LABELV $203
line 112
;112:	return cg_currentSelectedPlayer.integer;
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
RETI4
LABELV $202
endproc CG_GetSelectedPlayer 0 0
export CG_SelectNextPlayer
proc CG_SelectNextPlayer 4 0
line 115
;113:}
;114:
;115:void CG_SelectNextPlayer(void) {
line 116
;116:	CG_CheckOrderPending();
ADDRGP4 CG_CheckOrderPending
CALLV
pop
line 117
;117:	if (cg_currentSelectedPlayer.integer >= 0 && cg_currentSelectedPlayer.integer < numSortedTeamPlayers) {
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 0
LTI4 $211
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
GEI4 $211
line 118
;118:		cg_currentSelectedPlayer.integer++;
ADDRLP4 0
ADDRGP4 cg_currentSelectedPlayer+12
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 119
;119:	} else {
ADDRGP4 $212
JUMPV
LABELV $211
line 120
;120:		cg_currentSelectedPlayer.integer = 0;
ADDRGP4 cg_currentSelectedPlayer+12
CNSTI4 0
ASGNI4
line 121
;121:	}
LABELV $212
line 122
;122:	CG_SetSelectedPlayerName();
ADDRGP4 CG_SetSelectedPlayerName
CALLV
pop
line 123
;123:}
LABELV $210
endproc CG_SelectNextPlayer 4 0
export CG_SelectPrevPlayer
proc CG_SelectPrevPlayer 4 0
line 125
;124:
;125:void CG_SelectPrevPlayer(void) {
line 126
;126:	CG_CheckOrderPending();
ADDRGP4 CG_CheckOrderPending
CALLV
pop
line 127
;127:	if (cg_currentSelectedPlayer.integer > 0 && cg_currentSelectedPlayer.integer < numSortedTeamPlayers) {
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 0
LEI4 $218
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
GEI4 $218
line 128
;128:		cg_currentSelectedPlayer.integer--;
ADDRLP4 0
ADDRGP4 cg_currentSelectedPlayer+12
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 129
;129:	} else {
ADDRGP4 $219
JUMPV
LABELV $218
line 130
;130:		cg_currentSelectedPlayer.integer = numSortedTeamPlayers;
ADDRGP4 cg_currentSelectedPlayer+12
ADDRGP4 numSortedTeamPlayers
INDIRI4
ASGNI4
line 131
;131:	}
LABELV $219
line 132
;132:	CG_SetSelectedPlayerName();
ADDRGP4 CG_SetSelectedPlayerName
CALLV
pop
line 133
;133:}
LABELV $217
endproc CG_SelectPrevPlayer 4 0
export CG_StatusHandle
proc CG_StatusHandle 8 0
line 136
;134:
;135:
;136:qhandle_t CG_StatusHandle(int task) {
line 137
;137:	qhandle_t h = cgs.media.assaultShader;
ADDRLP4 0
ADDRGP4 cgs+70296+860
INDIRI4
ASGNI4
line 138
;138:	switch (task) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $227
ADDRLP4 4
INDIRI4
CNSTI4 7
GTI4 $227
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $252-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $252
address $229
address $232
address $235
address $238
address $244
address $247
address $241
code
LABELV $229
line 140
;139:		case TEAMTASK_OFFENSE :
;140:			h = cgs.media.assaultShader;
ADDRLP4 0
ADDRGP4 cgs+70296+860
INDIRI4
ASGNI4
line 141
;141:			break;
ADDRGP4 $228
JUMPV
LABELV $232
line 143
;142:		case TEAMTASK_DEFENSE :
;143:			h = cgs.media.defendShader;
ADDRLP4 0
ADDRGP4 cgs+70296+872
INDIRI4
ASGNI4
line 144
;144:			break;
ADDRGP4 $228
JUMPV
LABELV $235
line 146
;145:		case TEAMTASK_PATROL :
;146:			h = cgs.media.patrolShader;
ADDRLP4 0
ADDRGP4 cgs+70296+856
INDIRI4
ASGNI4
line 147
;147:			break;
ADDRGP4 $228
JUMPV
LABELV $238
line 149
;148:		case TEAMTASK_FOLLOW :
;149:			h = cgs.media.followShader;
ADDRLP4 0
ADDRGP4 cgs+70296+868
INDIRI4
ASGNI4
line 150
;150:			break;
ADDRGP4 $228
JUMPV
LABELV $241
line 152
;151:		case TEAMTASK_CAMP :
;152:			h = cgs.media.campShader;
ADDRLP4 0
ADDRGP4 cgs+70296+864
INDIRI4
ASGNI4
line 153
;153:			break;
ADDRGP4 $228
JUMPV
LABELV $244
line 155
;154:		case TEAMTASK_RETRIEVE :
;155:			h = cgs.media.retrieveShader; 
ADDRLP4 0
ADDRGP4 cgs+70296+880
INDIRI4
ASGNI4
line 156
;156:			break;
ADDRGP4 $228
JUMPV
LABELV $247
line 158
;157:		case TEAMTASK_ESCORT :
;158:			h = cgs.media.escortShader; 
ADDRLP4 0
ADDRGP4 cgs+70296+884
INDIRI4
ASGNI4
line 159
;159:			break;
ADDRGP4 $228
JUMPV
LABELV $227
line 161
;160:		default : 
;161:			h = cgs.media.assaultShader;
ADDRLP4 0
ADDRGP4 cgs+70296+860
INDIRI4
ASGNI4
line 162
;162:			break;
LABELV $228
line 164
;163:	}
;164:	return h;
ADDRLP4 0
INDIRI4
RETI4
LABELV $224
endproc CG_StatusHandle 8 0
export CG_GetValue
proc CG_GetValue 44 0
line 168
;165:}
;166:
;167:
;168:float CG_GetValue(int ownerDraw) {
line 173
;169:	centity_t	*cent;
;170: 	clientInfo_t *ci;
;171:	playerState_t	*ps;
;172:
;173:  cent = &cg_entities[cg.snap->ps.clientNum];
ADDRLP4 4
CNSTI4 1920
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 174
;174:	ps = &cg.snap->ps;
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 176
;175:
;176:  switch (ownerDraw) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 27
EQI4 $272
ADDRLP4 16
CNSTI4 28
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $270
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
GTI4 $276
LABELV $275
ADDRLP4 20
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 24
CNSTI4 2
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $263
ADDRLP4 20
INDIRI4
CNSTI4 4
EQI4 $269
ADDRLP4 20
INDIRI4
CNSTI4 6
EQI4 $264
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
LTI4 $258
LABELV $277
ADDRFP4 0
INDIRI4
CNSTI4 20
EQI4 $267
ADDRGP4 $258
JUMPV
LABELV $276
ADDRLP4 28
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 32
CNSTI4 40
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $259
ADDRLP4 28
INDIRI4
CNSTI4 41
EQI4 $261
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $258
LABELV $278
ADDRFP4 0
INDIRI4
CNSTI4 70
EQI4 $274
ADDRGP4 $258
JUMPV
LABELV $259
line 178
;177:  case CG_SELECTEDPLAYER_ARMOR:
;178:    ci = cgs.clientinfo + sortedTeamPlayers[CG_GetSelectedPlayer()];
ADDRLP4 36
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 8
CNSTI4 788
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 179
;179:    return ci->armor;
ADDRLP4 8
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $254
JUMPV
line 180
;180:    break;
LABELV $261
line 182
;181:  case CG_SELECTEDPLAYER_HEALTH:
;182:    ci = cgs.clientinfo + sortedTeamPlayers[CG_GetSelectedPlayer()];
ADDRLP4 40
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 8
CNSTI4 788
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 183
;183:    return ci->health;
ADDRLP4 8
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $254
JUMPV
line 184
;184:    break;
LABELV $263
line 186
;185:  case CG_PLAYER_ARMOR_VALUE:
;186:		return ps->stats[STAT_ARMOR];
ADDRLP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $254
JUMPV
line 187
;187:    break;
LABELV $264
line 189
;188:  case CG_PLAYER_AMMO_VALUE:
;189:		if ( cent->currentState.weapon ) 
ADDRLP4 4
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $258
line 190
;190:		{
line 191
;191:			return ps->ammo[weaponData[cent->currentState.weapon].ammoIndex];
CNSTI4 56
ADDRLP4 4
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $254
JUMPV
line 193
;192:		}
;193:    break;
LABELV $267
line 195
;194:  case CG_PLAYER_SCORE:
;195:	  return cg.snap->ps.persistant[PERS_SCORE];
ADDRGP4 cg+36
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $254
JUMPV
line 196
;196:    break;
LABELV $269
line 198
;197:  case CG_PLAYER_HEALTH:
;198:		return ps->stats[STAT_HEALTH];
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $254
JUMPV
line 199
;199:    break;
LABELV $270
line 201
;200:  case CG_RED_SCORE:
;201:		return cgs.scores1;
ADDRGP4 cgs+36324
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $254
JUMPV
line 202
;202:    break;
LABELV $272
line 204
;203:  case CG_BLUE_SCORE:
;204:		return cgs.scores2;
ADDRGP4 cgs+36328
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $254
JUMPV
line 205
;205:    break;
LABELV $274
line 207
;206:  case CG_PLAYER_FORCE_VALUE:
;207:		return ps->fd.forcePower;
ADDRLP4 0
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $254
JUMPV
line 208
;208:    break;
line 210
;209:  default:
;210:    break;
LABELV $258
line 212
;211:  }
;212:	return -1;
CNSTF4 3212836864
RETF4
LABELV $254
endproc CG_GetValue 44 0
export CG_OtherTeamHasFlag
proc CG_OtherTeamHasFlag 8 0
line 215
;213:}
;214:
;215:qboolean CG_OtherTeamHasFlag(void) {
line 216
;216:	if (cgs.gametype == GT_CTF || cgs.gametype == GT_CTY) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 7
EQI4 $284
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $280
LABELV $284
line 217
;217:		int team = cg.snap->ps.persistant[PERS_TEAM];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
ASGNI4
line 218
;218:		if (team == TEAM_RED && cgs.redflag == FLAG_TAKEN) {
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $286
ADDRGP4 cgs+36348
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $286
line 219
;219:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $279
JUMPV
LABELV $286
line 220
;220:		} else if (team == TEAM_BLUE && cgs.blueflag == FLAG_TAKEN) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $289
ADDRGP4 cgs+36352
INDIRI4
CNSTI4 1
NEI4 $289
line 221
;221:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $279
JUMPV
LABELV $289
line 222
;222:		} else {
line 223
;223:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $279
JUMPV
LABELV $280
line 226
;224:		}
;225:	}
;226:	return qfalse;
CNSTI4 0
RETI4
LABELV $279
endproc CG_OtherTeamHasFlag 8 0
export CG_YourTeamHasFlag
proc CG_YourTeamHasFlag 8 0
line 229
;227:}
;228:
;229:qboolean CG_YourTeamHasFlag(void) {
line 230
;230:	if (cgs.gametype == GT_CTF || cgs.gametype == GT_CTY) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 7
EQI4 $297
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $293
LABELV $297
line 231
;231:		int team = cg.snap->ps.persistant[PERS_TEAM];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
ASGNI4
line 232
;232:		if (team == TEAM_RED && cgs.blueflag == FLAG_TAKEN) {
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $299
ADDRGP4 cgs+36352
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $299
line 233
;233:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $292
JUMPV
LABELV $299
line 234
;234:		} else if (team == TEAM_BLUE && cgs.redflag == FLAG_TAKEN) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $302
ADDRGP4 cgs+36348
INDIRI4
CNSTI4 1
NEI4 $302
line 235
;235:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $292
JUMPV
LABELV $302
line 236
;236:		} else {
line 237
;237:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $292
JUMPV
LABELV $293
line 240
;238:		}
;239:	}
;240:	return qfalse;
CNSTI4 0
RETI4
LABELV $292
endproc CG_YourTeamHasFlag 8 0
export CG_OwnerDrawVisible
proc CG_OwnerDrawVisible 4 0
line 245
;241:}
;242:
;243:// THINKABOUTME: should these be exclusive or inclusive.. 
;244:// 
;245:qboolean CG_OwnerDrawVisible(int flags) {
line 247
;246:
;247:	if (flags & CG_SHOW_TEAMINFO) {
ADDRFP4 0
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $306
line 248
;248:		return (cg_currentSelectedPlayer.integer == numSortedTeamPlayers);
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
NEI4 $310
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $311
JUMPV
LABELV $310
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $311
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $305
JUMPV
LABELV $306
line 251
;249:	}
;250:
;251:	if (flags & CG_SHOW_NOTEAMINFO) {
ADDRFP4 0
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $312
line 252
;252:		return !(cg_currentSelectedPlayer.integer == numSortedTeamPlayers);
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
EQI4 $316
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $317
JUMPV
LABELV $316
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $317
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $305
JUMPV
LABELV $312
line 255
;253:	}
;254:
;255:	if (flags & CG_SHOW_OTHERTEAMHASFLAG) {
ADDRFP4 0
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $318
line 256
;256:		return CG_OtherTeamHasFlag();
ADDRLP4 0
ADDRGP4 CG_OtherTeamHasFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $305
JUMPV
LABELV $318
line 259
;257:	}
;258:
;259:	if (flags & CG_SHOW_YOURTEAMHASENEMYFLAG) {
ADDRFP4 0
INDIRI4
CNSTI4 262144
BANDI4
CNSTI4 0
EQI4 $320
line 260
;260:		return CG_YourTeamHasFlag();
ADDRLP4 0
ADDRGP4 CG_YourTeamHasFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $305
JUMPV
LABELV $320
line 263
;261:	}
;262:
;263:	if (flags & (CG_SHOW_BLUE_TEAM_HAS_REDFLAG | CG_SHOW_RED_TEAM_HAS_BLUEFLAG)) {
ADDRFP4 0
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $322
line 264
;264:		if (flags & CG_SHOW_BLUE_TEAM_HAS_REDFLAG && (cgs.redflag == FLAG_TAKEN || cgs.flagStatus == FLAG_TAKEN_RED)) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
BANDI4
CNSTI4 0
EQI4 $324
ADDRGP4 cgs+36348
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $328
ADDRGP4 cgs+36356
INDIRI4
CNSTI4 2
NEI4 $324
LABELV $328
line 265
;265:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $305
JUMPV
LABELV $324
line 266
;266:		} else if (flags & CG_SHOW_RED_TEAM_HAS_BLUEFLAG && (cgs.blueflag == FLAG_TAKEN || cgs.flagStatus == FLAG_TAKEN_BLUE)) {
ADDRFP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $329
ADDRGP4 cgs+36352
INDIRI4
CNSTI4 1
EQI4 $333
ADDRGP4 cgs+36356
INDIRI4
CNSTI4 3
NEI4 $329
LABELV $333
line 267
;267:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $305
JUMPV
LABELV $329
line 269
;268:		}
;269:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $305
JUMPV
LABELV $322
line 272
;270:	}
;271:
;272:	if (flags & CG_SHOW_ANYTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $334
line 273
;273:		if( cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
LTI4 $336
line 274
;274:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $305
JUMPV
LABELV $336
line 276
;275:		}
;276:	}
LABELV $334
line 278
;277:
;278:	if (flags & CG_SHOW_ANYNONTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $339
line 279
;279:		if( cgs.gametype < GT_TEAM) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
GEI4 $341
line 280
;280:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $305
JUMPV
LABELV $341
line 282
;281:		}
;282:	}
LABELV $339
line 284
;283:
;284:	if (flags & CG_SHOW_CTF) {
ADDRFP4 0
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $344
line 285
;285:		if( cgs.gametype == GT_CTF || cgs.gametype == GT_CTY ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 7
EQI4 $350
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $346
LABELV $350
line 286
;286:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $305
JUMPV
LABELV $346
line 288
;287:		}
;288:	}
LABELV $344
line 290
;289:
;290:	if (flags & CG_SHOW_HEALTHCRITICAL) {
ADDRFP4 0
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $351
line 291
;291:		if (cg.snap->ps.stats[STAT_HEALTH] < 25) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 25
GEI4 $353
line 292
;292:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $305
JUMPV
LABELV $353
line 294
;293:		}
;294:	}
LABELV $351
line 296
;295:
;296:	if (flags & CG_SHOW_HEALTHOK) {
ADDRFP4 0
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $356
line 297
;297:		if (cg.snap->ps.stats[STAT_HEALTH] >= 25) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 25
LTI4 $358
line 298
;298:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $305
JUMPV
LABELV $358
line 300
;299:		}
;300:	}
LABELV $356
line 302
;301:
;302:	if (flags & CG_SHOW_SINGLEPLAYER) {
ADDRFP4 0
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $361
line 303
;303:		if( cgs.gametype == GT_SINGLE_PLAYER ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 4
NEI4 $363
line 304
;304:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $305
JUMPV
LABELV $363
line 306
;305:		}
;306:	}
LABELV $361
line 308
;307:
;308:	if (flags & CG_SHOW_TOURNAMENT) {
ADDRFP4 0
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $366
line 309
;309:		if( cgs.gametype == GT_TOURNAMENT ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 3
NEI4 $368
line 310
;310:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $305
JUMPV
LABELV $368
line 312
;311:		}
;312:	}
LABELV $366
line 314
;313:
;314:	if (flags & CG_SHOW_DURINGINCOMINGVOICE) {
ADDRFP4 0
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $371
line 315
;315:	}
LABELV $371
line 317
;316:
;317:	if (flags & CG_SHOW_IF_PLAYER_HAS_FLAG) {
ADDRFP4 0
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $373
line 318
;318:		if (cg.snap->ps.powerups[PW_REDFLAG] || cg.snap->ps.powerups[PW_BLUEFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 404
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $381
ADDRGP4 cg+36
INDIRP4
CNSTI4 408
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $381
ADDRGP4 cg+36
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $375
LABELV $381
line 319
;319:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $305
JUMPV
LABELV $375
line 321
;320:		}
;321:	}
LABELV $373
line 322
;322:	return qfalse;
CNSTI4 0
RETI4
LABELV $305
endproc CG_OwnerDrawVisible 4 0
data
align 4
LABELV $383
address $384
export CG_GetKillerText
code
proc CG_GetKillerText 8 12
line 326
;323:}
;324:
;325:
;326:const char *CG_GetKillerText(void) {
line 328
;327:	static const char *s = "";
;328:	if ( cg.killerName[0] ) {
ADDRGP4 cg+6996
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $385
line 329
;329:		s = va("%s %s", CG_GetStripEdString("INGAMETEXT", "KILLEDBY"), cg.killerName );
ADDRGP4 $389
ARGP4
ADDRGP4 $390
ARGP4
ADDRLP4 0
ADDRGP4 CG_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $388
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 cg+6996
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $383
ADDRLP4 4
INDIRP4
ASGNP4
line 330
;330:	}
LABELV $385
line 331
;331:	return s;
ADDRGP4 $383
INDIRP4
RETP4
LABELV $382
endproc CG_GetKillerText 8 12
data
align 4
LABELV $393
address $384
export CG_GetGameStatusText
code
proc CG_GetGameStatusText 264 16
line 335
;332:}
;333:
;334:
;335:const char *CG_GetGameStatusText(void) {
line 337
;336:	static const char *s = "";
;337:	if ( cgs.gametype < GT_TEAM) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
GEI4 $394
line 338
;338:		if (cg.snap->ps.persistant[PERS_TEAM] != TEAM_SPECTATOR ) 
ADDRGP4 cg+36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 3
EQI4 $395
line 339
;339:		{
line 341
;340:			char sPlaceWith[256];
;341:			trap_SP_GetStringTextString("INGAMETEXT_PLACE_WITH", sPlaceWith, sizeof(sPlaceWith));
ADDRGP4 $400
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 343
;342:
;343:			s = va("%s %s %i",CG_PlaceString( cg.snap->ps.persistant[PERS_RANK] + 1 ), sPlaceWith, cg.snap->ps.persistant[PERS_SCORE] );
ADDRGP4 cg+36
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 256
ADDRGP4 CG_PlaceString
CALLP4
ASGNP4
ADDRGP4 $401
ARGP4
ADDRLP4 256
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $393
ADDRLP4 260
INDIRP4
ASGNP4
line 344
;344:		}
line 345
;345:	} else {
ADDRGP4 $395
JUMPV
LABELV $394
line 346
;346:		if ( cg.teamScores[0] == cg.teamScores[1] ) {
ADDRGP4 cg+5056
INDIRI4
ADDRGP4 cg+5056+4
INDIRI4
NEI4 $404
line 347
;347:			s = va("Teams are tied at %i", cg.teamScores[0] );
ADDRGP4 $409
ARGP4
ADDRGP4 cg+5056
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $393
ADDRLP4 0
INDIRP4
ASGNP4
line 348
;348:		} else if ( cg.teamScores[0] >= cg.teamScores[1] ) {
ADDRGP4 $405
JUMPV
LABELV $404
ADDRGP4 cg+5056
INDIRI4
ADDRGP4 cg+5056+4
INDIRI4
LTI4 $411
line 349
;349:			s = va("Red leads Blue, %i to %i", cg.teamScores[0], cg.teamScores[1] );
ADDRGP4 $416
ARGP4
ADDRGP4 cg+5056
INDIRI4
ARGI4
ADDRGP4 cg+5056+4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $393
ADDRLP4 0
INDIRP4
ASGNP4
line 350
;350:		} else {
ADDRGP4 $412
JUMPV
LABELV $411
line 351
;351:			s = va("Blue leads Red, %i to %i", cg.teamScores[1], cg.teamScores[0] );
ADDRGP4 $420
ARGP4
ADDRGP4 cg+5056+4
INDIRI4
ARGI4
ADDRGP4 cg+5056
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $393
ADDRLP4 0
INDIRP4
ASGNP4
line 352
;352:		}
LABELV $412
LABELV $405
line 353
;353:	}
LABELV $395
line 354
;354:	return s;
ADDRGP4 $393
INDIRP4
RETP4
LABELV $392
endproc CG_GetGameStatusText 264 16
export CG_GameTypeString
proc CG_GameTypeString 0 0
line 357
;355:}
;356:	
;357:const char *CG_GameTypeString(void) {
line 358
;358:	if ( cgs.gametype == GT_FFA ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 0
NEI4 $425
line 359
;359:		return "Free For All";
ADDRGP4 $428
RETP4
ADDRGP4 $424
JUMPV
LABELV $425
line 360
;360:	} else if ( cgs.gametype == GT_HOLOCRON ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 1
NEI4 $429
line 361
;361:		return "Holocron FFA";
ADDRGP4 $432
RETP4
ADDRGP4 $424
JUMPV
LABELV $429
line 362
;362:	} else if ( cgs.gametype == GT_JEDIMASTER ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 2
NEI4 $433
line 363
;363:		return "Jedi Master";
ADDRGP4 $436
RETP4
ADDRGP4 $424
JUMPV
LABELV $433
line 364
;364:	} else if ( cgs.gametype == GT_TEAM ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 5
NEI4 $437
line 365
;365:		return "Team FFA";
ADDRGP4 $440
RETP4
ADDRGP4 $424
JUMPV
LABELV $437
line 366
;366:	} else if ( cgs.gametype == GT_SAGA ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 6
NEI4 $441
line 367
;367:		return "N/A";
ADDRGP4 $444
RETP4
ADDRGP4 $424
JUMPV
LABELV $441
line 368
;368:	} else if ( cgs.gametype == GT_CTF ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 7
NEI4 $445
line 369
;369:		return "Capture the Flag";
ADDRGP4 $448
RETP4
ADDRGP4 $424
JUMPV
LABELV $445
line 370
;370:	} else if ( cgs.gametype == GT_CTY ) {
ADDRGP4 cgs+32960
INDIRI4
CNSTI4 8
NEI4 $449
line 371
;371:		return "Capture the Ysalamiri";
ADDRGP4 $452
RETP4
ADDRGP4 $424
JUMPV
LABELV $449
line 373
;372:	}
;373:	return "";
ADDRGP4 $384
RETP4
LABELV $424
endproc CG_GameTypeString 0 0
lit
align 1
LABELV $456
char 1 0
skip 4095
code
proc CG_Text_Paint_Limit 4148 36
line 381
;374:}
;375:						 
;376:extern int MenuFontToHandle(int iMenuFont);
;377:
;378:// maxX param is initially an X limit, but is also used as feedback. 0 = text was clipped to fit within, else maxX = next pos
;379://
;380:static void CG_Text_Paint_Limit(float *maxX, float x, float y, float scale, vec4_t color, const char* text, float adjust, int limit, int iMenuFont) 
;381:{
line 386
;382:	qboolean bIsTrailingPunctuation;
;383:
;384:	// this is kinda dirty, but...
;385:	//
;386:	int iFontIndex = MenuFontToHandle(iMenuFont);
ADDRFP4 32
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 MenuFontToHandle
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 389
;387:	
;388:	//float fMax = *maxX;
;389:	int iPixelLen = trap_R_Font_StrLenPixels(text, iFontIndex, scale);
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 trap_R_Font_StrLenPixels
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 390
;390:	if (x + iPixelLen > *maxX)
ADDRFP4 4
INDIRF4
ADDRLP4 8
INDIRI4
CVIF4 4
ADDF4
ADDRFP4 0
INDIRP4
INDIRF4
LEF4 $454
line 391
;391:	{
line 395
;392:		// whole text won't fit, so we need to print just the amount that does...
;393:		//  Ok, this is slow and tacky, but only called occasionally, and it works...
;394:		//
;395:		char sTemp[4096]={0};	// lazy assumption
ADDRLP4 28
ADDRGP4 $456
INDIRB
ASGNB 4096
line 396
;396:		const char *psText = text;
ADDRLP4 4124
ADDRFP4 20
INDIRP4
ASGNP4
line 397
;397:		char *psOut = &sTemp[0];
ADDRLP4 20
ADDRLP4 28
ASGNP4
line 398
;398:		char *psOutLastGood = psOut;
ADDRLP4 4128
ADDRLP4 20
INDIRP4
ASGNP4
ADDRGP4 $458
JUMPV
LABELV $457
line 404
;399:		unsigned int uiLetter;
;400:
;401:		while (*psText && (x + trap_R_Font_StrLenPixels(sTemp, iFontIndex, scale)<=*maxX) 
;402:			   && psOut < &sTemp[sizeof(sTemp)-1]	// sanity
;403:				)
;404:		{
line 406
;405:			int iAdvanceCount;
;406:			psOutLastGood = psOut;			
ADDRLP4 4128
ADDRLP4 20
INDIRP4
ASGNP4
line 408
;407:
;408:			uiLetter = trap_AnyLanguage_ReadCharFromString(psText, &iAdvanceCount, &bIsTrailingPunctuation);
ADDRLP4 4124
INDIRP4
ARGP4
ADDRLP4 4132
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 4136
ADDRGP4 trap_AnyLanguage_ReadCharFromString
CALLU4
ASGNU4
ADDRLP4 24
ADDRLP4 4136
INDIRU4
ASGNU4
line 409
;409:			psText += iAdvanceCount;
ADDRLP4 4124
ADDRLP4 4132
INDIRI4
ADDRLP4 4124
INDIRP4
ADDP4
ASGNP4
line 411
;410:
;411:			if (uiLetter > 255)
ADDRLP4 24
INDIRU4
CNSTU4 255
LEU4 $461
line 412
;412:			{
line 413
;413:				*psOut++ = uiLetter>>8;
ADDRLP4 4140
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 4140
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4140
INDIRP4
ADDRLP4 24
INDIRU4
CNSTI4 8
RSHU4
CVUI4 4
CVII1 4
ASGNI1
line 414
;414:				*psOut++ = uiLetter&0xFF;
ADDRLP4 4144
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 4144
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4144
INDIRP4
ADDRLP4 24
INDIRU4
CNSTU4 255
BANDU4
CVUI4 4
CVII1 4
ASGNI1
line 415
;415:			}
ADDRGP4 $462
JUMPV
LABELV $461
line 417
;416:			else
;417:			{
line 418
;418:				*psOut++ = uiLetter&0xFF;
ADDRLP4 4140
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 4140
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4140
INDIRP4
ADDRLP4 24
INDIRU4
CNSTU4 255
BANDU4
CVUI4 4
CVII1 4
ASGNI1
line 419
;419:			}
LABELV $462
line 420
;420:		}
LABELV $458
line 401
ADDRLP4 4124
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $464
ADDRLP4 28
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 4132
ADDRGP4 trap_R_Font_StrLenPixels
CALLI4
ASGNI4
ADDRFP4 4
INDIRF4
ADDRLP4 4132
INDIRI4
CVIF4 4
ADDF4
ADDRFP4 0
INDIRP4
INDIRF4
GTF4 $464
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 28+4095
CVPU4 4
LTU4 $457
LABELV $464
line 421
;421:		*psOutLastGood = '\0';
ADDRLP4 4128
INDIRP4
CNSTI1 0
ASGNI1
line 423
;422:
;423:		*maxX = 0;	// feedback
ADDRFP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 424
;424:		CG_Text_Paint(x, y, scale, color, sTemp, adjust, limit, ITEM_TEXTSTYLE_NORMAL, iMenuFont);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRFP4 24
INDIRF4
ARGF4
ADDRFP4 28
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 32
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 425
;425:	}
ADDRGP4 $455
JUMPV
LABELV $454
line 427
;426:	else
;427:	{
line 430
;428:		// whole text fits fine, so print it all...
;429:		//
;430:		*maxX = x + iPixelLen;	// feedback the next position, as the caller expects		
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRF4
ADDRLP4 8
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 431
;431:		CG_Text_Paint(x, y, scale, color, text, adjust, limit, ITEM_TEXTSTYLE_NORMAL, iMenuFont);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 24
INDIRF4
ARGF4
ADDRFP4 28
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 32
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 432
;432:	}
LABELV $455
line 433
;433:}
LABELV $453
endproc CG_Text_Paint_Limit 4148 36
export CG_DrawNewTeamInfo
proc CG_DrawNewTeamInfo 100 36
line 439
;434:
;435:
;436:
;437:#define PIC_WIDTH 12
;438:
;439:void CG_DrawNewTeamInfo(rectDef_t *rect, float text_x, float text_y, float scale, vec4_t color, qhandle_t shader) {
line 451
;440:	int xx;
;441:	float y;
;442:	int i, j, len, count;
;443:	const char *p;
;444:	vec4_t		hcolor;
;445:	float pwidth, lwidth, maxx, leftOver;
;446:	clientInfo_t *ci;
;447:	gitem_t	*item;
;448:	qhandle_t h;
;449:
;450:	// max player name width
;451:	pwidth = 0;
ADDRLP4 64
CNSTF4 0
ASGNF4
line 452
;452:	count = (numSortedTeamPlayers > 8) ? 8 : numSortedTeamPlayers;
ADDRGP4 numSortedTeamPlayers
INDIRI4
CNSTI4 8
LEI4 $467
ADDRLP4 72
CNSTI4 8
ASGNI4
ADDRGP4 $468
JUMPV
LABELV $467
ADDRLP4 72
ADDRGP4 numSortedTeamPlayers
INDIRI4
ASGNI4
LABELV $468
ADDRLP4 32
ADDRLP4 72
INDIRI4
ASGNI4
line 453
;453:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $472
JUMPV
LABELV $469
line 454
;454:		ci = cgs.clientinfo + sortedTeamPlayers[i];
ADDRLP4 4
CNSTI4 788
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 455
;455:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $474
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
NEI4 $474
line 456
;456:			len = CG_Text_Width( ci->name, scale, 0);
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 80
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 80
INDIRI4
ASGNI4
line 457
;457:			if (len > pwidth)
ADDRLP4 28
INDIRI4
CVIF4 4
ADDRLP4 64
INDIRF4
LEF4 $477
line 458
;458:				pwidth = len;
ADDRLP4 64
ADDRLP4 28
INDIRI4
CVIF4 4
ASGNF4
LABELV $477
line 459
;459:		}
LABELV $474
line 460
;460:	}
LABELV $470
line 453
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $472
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $469
line 463
;461:
;462:	// max location name width
;463:	lwidth = 0;
ADDRLP4 68
CNSTF4 0
ASGNF4
line 464
;464:	for (i = 1; i < MAX_LOCATIONS; i++) {
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $479
line 465
;465:		p = CG_ConfigString(CS_LOCATIONS + i);
ADDRLP4 8
INDIRI4
CNSTI4 640
ADDI4
ARGI4
ADDRLP4 76
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 76
INDIRP4
ASGNP4
line 466
;466:		if (p && *p) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $483
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $483
line 467
;467:			len = CG_Text_Width(p, scale, 0);
ADDRLP4 20
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 84
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 84
INDIRI4
ASGNI4
line 468
;468:			if (len > lwidth)
ADDRLP4 28
INDIRI4
CVIF4 4
ADDRLP4 68
INDIRF4
LEF4 $485
line 469
;469:				lwidth = len;
ADDRLP4 68
ADDRLP4 28
INDIRI4
CVIF4 4
ASGNF4
LABELV $485
line 470
;470:		}
LABELV $483
line 471
;471:	}
LABELV $480
line 464
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 64
LTI4 $479
line 473
;472:
;473:	y = rect->y;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 475
;474:
;475:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $490
JUMPV
LABELV $487
line 476
;476:		ci = cgs.clientinfo + sortedTeamPlayers[i];
ADDRLP4 4
CNSTI4 788
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+43024
ADDP4
ASGNP4
line 477
;477:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $492
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
NEI4 $492
line 479
;478:
;479:			xx = rect->x + 1;
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 480
;480:			for (j = 0; j <= PW_NUM_POWERUPS; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $495
line 481
;481:				if (ci->powerups & (1 << j)) {
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $499
line 483
;482:
;483:					item = BG_FindItemForPowerup( j );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 80
INDIRP4
ASGNP4
line 485
;484:
;485:					if (item) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $501
line 486
;486:						CG_DrawPic( xx, y, PIC_WIDTH, PIC_WIDTH, trap_R_RegisterShader( item->icon ) );
ADDRLP4 16
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 88
CNSTF4 1094713344
ASGNF4
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 84
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 487
;487:						xx += PIC_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 488
;488:					}
LABELV $501
line 489
;489:				}
LABELV $499
line 490
;490:			}
LABELV $496
line 480
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LEI4 $495
line 493
;491:
;492:			// FIXME: max of 3 powerups shown properly
;493:			xx = rect->x + (PIC_WIDTH * 3) + 2;
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1108344832
ADDF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ASGNI4
line 495
;494:
;495:			CG_GetColorForHealth( ci->health, ci->armor, hcolor );
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ARGP4
ADDRGP4 CG_GetColorForHealth
CALLV
pop
line 496
;496:			trap_R_SetColor(hcolor);
ADDRLP4 48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 497
;497:			CG_DrawPic( xx, y + 1, PIC_WIDTH - 2, PIC_WIDTH - 2, cgs.media.heartShader );
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
ADDF4
ARGF4
ADDRLP4 84
CNSTF4 1092616192
ASGNF4
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 84
INDIRF4
ARGF4
ADDRGP4 cgs+70296+568
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 503
;498:
;499:			//Com_sprintf (st, sizeof(st), "%3i %3i", ci->health,	ci->armor);
;500:			//CG_Text_Paint(xx, y + text_y, scale, hcolor, st, 0, 0); 
;501:
;502:			// draw weapon icon
;503:			xx += PIC_WIDTH + 1;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 13
ADDI4
ASGNI4
line 514
;504:
;505:// weapon used is not that useful, use the space for task
;506:#if 0
;507:			if ( cg_weapons[ci->curWeapon].weaponIcon ) {
;508:				CG_DrawPic( xx, y, PIC_WIDTH, PIC_WIDTH, cg_weapons[ci->curWeapon].weaponIcon );
;509:			} else {
;510:				CG_DrawPic( xx, y, PIC_WIDTH, PIC_WIDTH, cgs.media.deferShader );
;511:			}
;512:#endif
;513:
;514:			trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 515
;515:			if (cgs.orderPending) {
ADDRGP4 cgs+70240
INDIRI4
CNSTI4 0
EQI4 $505
line 517
;516:				// blink the icon
;517:				if ( cg.time > cgs.orderTime - 2500 && (cg.time >> 9 ) & 1 ) {
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cgs+70244
INDIRI4
CNSTI4 2500
SUBI4
LEI4 $508
ADDRGP4 cg+64
INDIRI4
CNSTI4 9
RSHI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $508
line 518
;518:					h = 0;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 519
;519:				} else {
ADDRGP4 $506
JUMPV
LABELV $508
line 520
;520:					h = CG_StatusHandle(cgs.currentOrder);
ADDRGP4 cgs+70236
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 CG_StatusHandle
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 88
INDIRI4
ASGNI4
line 521
;521:				}
line 522
;522:			}	else {
ADDRGP4 $506
JUMPV
LABELV $505
line 523
;523:				h = CG_StatusHandle(ci->teamTask);
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 CG_StatusHandle
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 88
INDIRI4
ASGNI4
line 524
;524:			}
LABELV $506
line 526
;525:
;526:			if (h) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $514
line 527
;527:				CG_DrawPic( xx, y, PIC_WIDTH, PIC_WIDTH, h);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 88
CNSTF4 1094713344
ASGNF4
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 528
;528:			}
LABELV $514
line 530
;529:
;530:			xx += PIC_WIDTH + 1;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 13
ADDI4
ASGNI4
line 532
;531:
;532:			leftOver = rect->w - xx;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 533
;533:			maxx = xx + leftOver / 3;
ADDRLP4 36
ADDRLP4 12
INDIRI4
CVIF4 4
ADDRLP4 40
INDIRF4
CNSTF4 1077936128
DIVF4
ADDF4
ASGNF4
line 537
;534:
;535:
;536:
;537:			CG_Text_Paint_Limit(&maxx, xx, y + text_y, scale, color, ci->name, 0, 0, FONT_MEDIUM); 
ADDRLP4 36
ARGP4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 CG_Text_Paint_Limit
CALLV
pop
line 539
;538:
;539:			p = CG_ConfigString(CS_LOCATIONS + ci->location);
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 640
ADDI4
ARGI4
ADDRLP4 88
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 88
INDIRP4
ASGNP4
line 540
;540:			if (!p || !*p) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $518
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $516
LABELV $518
line 541
;541:				p = "unknown";
ADDRLP4 20
ADDRGP4 $519
ASGNP4
line 542
;542:			}
LABELV $516
line 544
;543:
;544:			xx += leftOver / 3 + 2;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CVIF4 4
ADDRLP4 40
INDIRF4
CNSTF4 1077936128
DIVF4
CNSTF4 1073741824
ADDF4
ADDF4
CVFI4 4
ASGNI4
line 545
;545:			maxx = rect->w - 4;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1082130432
SUBF4
ASGNF4
line 547
;546:
;547:			CG_Text_Paint_Limit(&maxx, xx, y + text_y, scale, color, p, 0, 0, FONT_MEDIUM); 
ADDRLP4 36
ARGP4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 CG_Text_Paint_Limit
CALLV
pop
line 548
;548:			y += text_y + 2;
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1073741824
ADDF4
ADDF4
ASGNF4
line 549
;549:			if ( y + text_y + 2 > rect->y + rect->h ) {
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
CNSTF4 1073741824
ADDF4
ADDRLP4 96
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
LEF4 $520
line 550
;550:				break;
ADDRGP4 $489
JUMPV
LABELV $520
line 553
;551:			}
;552:
;553:		}
LABELV $492
line 554
;554:	}
LABELV $488
line 475
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $490
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $487
LABELV $489
line 555
;555:}
LABELV $465
endproc CG_DrawNewTeamInfo 100 36
export CG_DrawTeamSpectators
proc CG_DrawTeamSpectators 24 36
line 558
;556:
;557:
;558:void CG_DrawTeamSpectators(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader) {
line 559
;559:	if (cg.spectatorLen) {
ADDRGP4 cg+8052
INDIRI4
CNSTI4 0
EQI4 $523
line 562
;560:		float maxX;
;561:
;562:		if (cg.spectatorWidth == -1) {
ADDRGP4 cg+8056
INDIRF4
CNSTF4 3212836864
NEF4 $526
line 563
;563:			cg.spectatorWidth = 0;
ADDRGP4 cg+8056
CNSTF4 0
ASGNF4
line 564
;564:			cg.spectatorPaintX = rect->x + 1;
ADDRGP4 cg+8064
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 565
;565:			cg.spectatorPaintX2 = -1;
ADDRGP4 cg+8068
CNSTI4 -1
ASGNI4
line 566
;566:		}
LABELV $526
line 568
;567:
;568:		if (cg.spectatorOffset > cg.spectatorLen) {
ADDRGP4 cg+8072
INDIRI4
ADDRGP4 cg+8052
INDIRI4
LEI4 $532
line 569
;569:			cg.spectatorOffset = 0;
ADDRGP4 cg+8072
CNSTI4 0
ASGNI4
line 570
;570:			cg.spectatorPaintX = rect->x + 1;
ADDRGP4 cg+8064
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 571
;571:			cg.spectatorPaintX2 = -1;
ADDRGP4 cg+8068
CNSTI4 -1
ASGNI4
line 572
;572:		}
LABELV $532
line 574
;573:
;574:		if (cg.time > cg.spectatorTime) {
ADDRGP4 cg+64
INDIRI4
ADDRGP4 cg+8060
INDIRI4
LEI4 $539
line 575
;575:			cg.spectatorTime = cg.time + 10;
ADDRGP4 cg+8060
ADDRGP4 cg+64
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 576
;576:			if (cg.spectatorPaintX <= rect->x + 2) {
ADDRGP4 cg+8064
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
GTF4 $545
line 577
;577:				if (cg.spectatorOffset < cg.spectatorLen) {
ADDRGP4 cg+8072
INDIRI4
ADDRGP4 cg+8052
INDIRI4
GEI4 $548
line 578
;578:					cg.spectatorPaintX += CG_Text_Width(&cg.spectatorList[cg.spectatorOffset], scale, 1) - 1;
ADDRGP4 cg+8072
INDIRI4
ADDRGP4 cg+7028
ADDP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 8
ADDRGP4 cg+8064
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ADDI4
ASGNI4
line 579
;579:					cg.spectatorOffset++;
ADDRLP4 12
ADDRGP4 cg+8072
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 580
;580:				} else {
ADDRGP4 $546
JUMPV
LABELV $548
line 581
;581:					cg.spectatorOffset = 0;
ADDRGP4 cg+8072
CNSTI4 0
ASGNI4
line 582
;582:					if (cg.spectatorPaintX2 >= 0) {
ADDRGP4 cg+8068
INDIRI4
CNSTI4 0
LTI4 $557
line 583
;583:						cg.spectatorPaintX = cg.spectatorPaintX2;
ADDRGP4 cg+8064
ADDRGP4 cg+8068
INDIRI4
ASGNI4
line 584
;584:					} else {
ADDRGP4 $558
JUMPV
LABELV $557
line 585
;585:						cg.spectatorPaintX = rect->x + rect->w - 2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 cg+8064
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
CVFI4 4
ASGNI4
line 586
;586:					}
LABELV $558
line 587
;587:					cg.spectatorPaintX2 = -1;
ADDRGP4 cg+8068
CNSTI4 -1
ASGNI4
line 588
;588:				}
line 589
;589:			} else {
ADDRGP4 $546
JUMPV
LABELV $545
line 590
;590:				cg.spectatorPaintX--;
ADDRLP4 4
ADDRGP4 cg+8064
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 591
;591:				if (cg.spectatorPaintX2 >= 0) {
ADDRGP4 cg+8068
INDIRI4
CNSTI4 0
LTI4 $565
line 592
;592:					cg.spectatorPaintX2--;
ADDRLP4 8
ADDRGP4 cg+8068
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 593
;593:				}
LABELV $565
line 594
;594:			}
LABELV $546
line 595
;595:		}
LABELV $539
line 597
;596:
;597:		maxX = rect->x + rect->w - 2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 598
;598:		CG_Text_Paint_Limit(&maxX, cg.spectatorPaintX, rect->y + rect->h - 3, scale, color, &cg.spectatorList[cg.spectatorOffset], 0, 0, FONT_MEDIUM); 
ADDRLP4 0
ARGP4
ADDRGP4 cg+8064
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1077936128
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 cg+8072
INDIRI4
ADDRGP4 cg+7028
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 CG_Text_Paint_Limit
CALLV
pop
line 599
;599:		if (cg.spectatorPaintX2 >= 0) {
ADDRGP4 cg+8068
INDIRI4
CNSTI4 0
LTI4 $572
line 600
;600:			float maxX2 = rect->x + rect->w - 2;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 601
;601:			CG_Text_Paint_Limit(&maxX2, cg.spectatorPaintX2, rect->y + rect->h - 3, scale, color, cg.spectatorList, 0, cg.spectatorOffset, FONT_MEDIUM); 
ADDRLP4 12
ARGP4
ADDRGP4 cg+8068
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1077936128
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 cg+7028
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 cg+8072
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 CG_Text_Paint_Limit
CALLV
pop
line 602
;602:		}
LABELV $572
line 603
;603:		if (cg.spectatorOffset && maxX > 0) {
ADDRGP4 cg+8072
INDIRI4
CNSTI4 0
EQI4 $578
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $578
line 605
;604:			// if we have an offset ( we are skipping the first part of the string ) and we fit the string
;605:			if (cg.spectatorPaintX2 == -1) {
ADDRGP4 cg+8068
INDIRI4
CNSTI4 -1
NEI4 $579
line 606
;606:						cg.spectatorPaintX2 = rect->x + rect->w - 2;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 cg+8068
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
CVFI4 4
ASGNI4
line 607
;607:			}
line 608
;608:		} else {
ADDRGP4 $579
JUMPV
LABELV $578
line 609
;609:			cg.spectatorPaintX2 = -1;
ADDRGP4 cg+8068
CNSTI4 -1
ASGNI4
line 610
;610:		}
LABELV $579
line 612
;611:
;612:	}
LABELV $523
line 613
;613:}
LABELV $522
endproc CG_DrawTeamSpectators 24 36
export CG_DrawMedal
proc CG_DrawMedal 32 36
line 617
;614:
;615:
;616:
;617:void CG_DrawMedal(int ownerDraw, rectDef_t *rect, float scale, vec4_t color, qhandle_t shader) {
line 618
;618:	score_t *score = &cg.scores[cg.selectedScore];
ADDRLP4 8
CNSTI4 60
ADDRGP4 cg+5052
INDIRI4
MULI4
ADDRGP4 cg+5064
ADDP4
ASGNP4
line 619
;619:	float value = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 620
;620:	char *text = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 621
;621:	color[3] = 0.25;
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1048576000
ASGNF4
line 623
;622:
;623:	switch (ownerDraw) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 53
LTI4 $589
ADDRLP4 12
INDIRI4
CNSTI4 59
GTI4 $599
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $600-212
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $600
address $591
address $592
address $593
address $594
address $595
address $596
address $597
code
LABELV $599
ADDRFP4 0
INDIRI4
CNSTI4 69
EQI4 $598
ADDRGP4 $589
JUMPV
LABELV $591
line 625
;624:		case CG_ACCURACY:
;625:			value = score->accuracy;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 626
;626:			break;
ADDRGP4 $590
JUMPV
LABELV $592
line 628
;627:		case CG_ASSISTS:
;628:			value = score->assistCount;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 629
;629:			break;
ADDRGP4 $590
JUMPV
LABELV $593
line 631
;630:		case CG_DEFEND:
;631:			value = score->defendCount;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 632
;632:			break;
ADDRGP4 $590
JUMPV
LABELV $594
line 634
;633:		case CG_EXCELLENT:
;634:			value = score->excellentCount;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 635
;635:			break;
ADDRGP4 $590
JUMPV
LABELV $595
line 637
;636:		case CG_IMPRESSIVE:
;637:			value = score->impressiveCount;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 638
;638:			break;
ADDRGP4 $590
JUMPV
LABELV $596
line 640
;639:		case CG_PERFECT:
;640:			value = score->perfect;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 641
;641:			break;
ADDRGP4 $590
JUMPV
LABELV $597
line 643
;642:		case CG_GAUNTLET:
;643:			value = score->guantletCount;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 644
;644:			break;
ADDRGP4 $590
JUMPV
LABELV $598
line 646
;645:		case CG_CAPTURES:
;646:			value = score->captures;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 647
;647:			break;
LABELV $589
LABELV $590
line 650
;648:	}
;649:
;650:	if (value > 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $602
line 651
;651:		if (ownerDraw != CG_PERFECT) {
ADDRFP4 0
INDIRI4
CNSTI4 58
EQI4 $604
line 652
;652:			if (ownerDraw == CG_ACCURACY) {
ADDRFP4 0
INDIRI4
CNSTI4 53
NEI4 $606
line 653
;653:				text = va("%i%%", (int)value);
ADDRGP4 $608
ARGP4
ADDRLP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 654
;654:				if (value > 50) {
ADDRLP4 0
INDIRF4
CNSTF4 1112014848
LEF4 $605
line 655
;655:					color[3] = 1.0;
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 656
;656:				}
line 657
;657:			} else {
ADDRGP4 $605
JUMPV
LABELV $606
line 658
;658:				text = va("%i", (int)value);
ADDRGP4 $611
ARGP4
ADDRLP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 659
;659:				color[3] = 1.0;
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 660
;660:			}
line 661
;661:		} else {
ADDRGP4 $605
JUMPV
LABELV $604
line 662
;662:			if (value) {
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $612
line 663
;663:				color[3] = 1.0;
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 664
;664:			}
LABELV $612
line 665
;665:			text = "Wow";
ADDRLP4 4
ADDRGP4 $614
ASGNP4
line 666
;666:		}
LABELV $605
line 667
;667:	}
LABELV $602
line 669
;668:
;669:	trap_R_SetColor(color);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 670
;670:	CG_DrawPic( rect->x, rect->y, rect->w, rect->h, shader );
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 672
;671:
;672:	if (text) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $615
line 673
;673:		color[3] = 1.0;
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 674
;674:		value = CG_Text_Width(text, scale, 0);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
CVIF4 4
ASGNF4
line 675
;675:		CG_Text_Paint(rect->x + (rect->w - value) / 2, rect->y + rect->h + 10 , scale, color, text, 0, 0, 0, FONT_MEDIUM); 
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1092616192
ADDF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 676
;676:	}
LABELV $615
line 677
;677:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 679
;678:
;679:}
LABELV $586
endproc CG_DrawMedal 32 36
export CG_OwnerDraw
proc CG_OwnerDraw 0 0
line 683
;680:
;681:	
;682://
;683:void CG_OwnerDraw(float x, float y, float w, float h, float text_x, float text_y, int ownerDraw, int ownerDrawFlags, int align, float special, float scale, vec4_t color, qhandle_t shader, int textStyle,int font) {
line 866
;684:
;685://Ignore all this, at least for now. May put some stat stuff back in menu files later.
;686:#if 0
;687:	rectDef_t rect;
;688:
;689:  if ( cg_drawStatus.integer == 0 ) {
;690:		return;
;691:	}
;692:
;693:	//if (ownerDrawFlags != 0 && !CG_OwnerDrawVisible(ownerDrawFlags)) {
;694:	//	return;
;695:	//}
;696:
;697:  rect.x = x;
;698:  rect.y = y;
;699:  rect.w = w;
;700:  rect.h = h;
;701:
;702:  switch (ownerDraw) {
;703:  case CG_PLAYER_ARMOR_ICON:
;704:    CG_DrawPlayerArmorIcon(&rect, ownerDrawFlags & CG_SHOW_2DONLY);
;705:    break;
;706:  case CG_PLAYER_ARMOR_ICON2D:
;707:    CG_DrawPlayerArmorIcon(&rect, qtrue);
;708:    break;
;709:  case CG_PLAYER_ARMOR_VALUE:
;710:    CG_DrawPlayerArmorValue(&rect, scale, color, shader, textStyle);
;711:    break;
;712:  case CG_PLAYER_FORCE_VALUE:
;713:    CG_DrawPlayerForceValue(&rect, scale, color, shader, textStyle);
;714:	return ;
;715:  case CG_PLAYER_AMMO_ICON:
;716:    CG_DrawPlayerAmmoIcon(&rect, ownerDrawFlags & CG_SHOW_2DONLY);
;717:    break;
;718:  case CG_PLAYER_AMMO_ICON2D:
;719:    CG_DrawPlayerAmmoIcon(&rect, qtrue);
;720:    break;
;721:  case CG_PLAYER_AMMO_VALUE:
;722:    CG_DrawPlayerAmmoValue(&rect, scale, color, shader, textStyle);
;723:    break;
;724:  case CG_SELECTEDPLAYER_HEAD:
;725:    CG_DrawSelectedPlayerHead(&rect, ownerDrawFlags & CG_SHOW_2DONLY, qfalse);
;726:    break;
;727:  case CG_VOICE_HEAD:
;728:    CG_DrawSelectedPlayerHead(&rect, ownerDrawFlags & CG_SHOW_2DONLY, qtrue);
;729:    break;
;730:  case CG_VOICE_NAME:
;731:    CG_DrawSelectedPlayerName(&rect, scale, color, qtrue, textStyle);
;732:    break;
;733:  case CG_SELECTEDPLAYER_STATUS:
;734:    CG_DrawSelectedPlayerStatus(&rect);
;735:    break;
;736:  case CG_SELECTEDPLAYER_ARMOR:
;737:    CG_DrawSelectedPlayerArmor(&rect, scale, color, shader, textStyle);
;738:    break;
;739:  case CG_SELECTEDPLAYER_HEALTH:
;740:    CG_DrawSelectedPlayerHealth(&rect, scale, color, shader, textStyle);
;741:    break;
;742:  case CG_SELECTEDPLAYER_NAME:
;743:    CG_DrawSelectedPlayerName(&rect, scale, color, qfalse, textStyle);
;744:    break;
;745:  case CG_SELECTEDPLAYER_LOCATION:
;746:    CG_DrawSelectedPlayerLocation(&rect, scale, color, textStyle);
;747:    break;
;748:  case CG_SELECTEDPLAYER_WEAPON:
;749:    CG_DrawSelectedPlayerWeapon(&rect);
;750:    break;
;751:  case CG_SELECTEDPLAYER_POWERUP:
;752:    CG_DrawSelectedPlayerPowerup(&rect, ownerDrawFlags & CG_SHOW_2DONLY);
;753:    break;
;754:  case CG_PLAYER_HEAD:
;755:    CG_DrawPlayerHead(&rect, ownerDrawFlags & CG_SHOW_2DONLY);
;756:    break;
;757:  case CG_PLAYER_ITEM:
;758:    CG_DrawPlayerItem(&rect, scale, ownerDrawFlags & CG_SHOW_2DONLY);
;759:    break;
;760:  case CG_PLAYER_SCORE:
;761:    CG_DrawPlayerScore(&rect, scale, color, shader, textStyle);
;762:    break;
;763:  case CG_PLAYER_HEALTH:
;764:    CG_DrawPlayerHealth(&rect, scale, color, shader, textStyle);
;765:    break;
;766:  case CG_RED_SCORE:
;767:    CG_DrawRedScore(&rect, scale, color, shader, textStyle);
;768:    break;
;769:  case CG_BLUE_SCORE:
;770:    CG_DrawBlueScore(&rect, scale, color, shader, textStyle);
;771:    break;
;772:  case CG_RED_NAME:
;773:    CG_DrawRedName(&rect, scale, color, textStyle);
;774:    break;
;775:  case CG_BLUE_NAME:
;776:    CG_DrawBlueName(&rect, scale, color, textStyle);
;777:    break;
;778:  case CG_BLUE_FLAGHEAD:
;779:    CG_DrawBlueFlagHead(&rect);
;780:    break;
;781:  case CG_BLUE_FLAGSTATUS:
;782:    CG_DrawBlueFlagStatus(&rect, shader);
;783:    break;
;784:  case CG_BLUE_FLAGNAME:
;785:    CG_DrawBlueFlagName(&rect, scale, color, textStyle);
;786:    break;
;787:  case CG_RED_FLAGHEAD:
;788:    CG_DrawRedFlagHead(&rect);
;789:    break;
;790:  case CG_RED_FLAGSTATUS:
;791:    CG_DrawRedFlagStatus(&rect, shader);
;792:    break;
;793:  case CG_RED_FLAGNAME:
;794:    CG_DrawRedFlagName(&rect, scale, color, textStyle);
;795:    break;
;796:  case CG_PLAYER_LOCATION:
;797:    CG_DrawPlayerLocation(&rect, scale, color, textStyle);
;798:    break;
;799:  case CG_TEAM_COLOR:
;800:    CG_DrawTeamColor(&rect, color);
;801:    break;
;802:  case CG_CTF_POWERUP:
;803:    CG_DrawCTFPowerUp(&rect);
;804:    break;
;805:  case CG_AREA_POWERUP:
;806:		CG_DrawAreaPowerUp(&rect, align, special, scale, color);
;807:    break;
;808:  case CG_PLAYER_STATUS:
;809:    CG_DrawPlayerStatus(&rect);
;810:    break;
;811:  case CG_PLAYER_HASFLAG:
;812:    CG_DrawPlayerHasFlag(&rect, qfalse);
;813:    break;
;814:  case CG_PLAYER_HASFLAG2D:
;815:    CG_DrawPlayerHasFlag(&rect, qtrue);
;816:    break;
;817:  case CG_AREA_SYSTEMCHAT:
;818:    CG_DrawAreaSystemChat(&rect, scale, color, shader);
;819:    break;
;820:  case CG_AREA_TEAMCHAT:
;821:    CG_DrawAreaTeamChat(&rect, scale, color, shader);
;822:    break;
;823:  case CG_AREA_CHAT:
;824:    CG_DrawAreaChat(&rect, scale, color, shader);
;825:    break;
;826:  case CG_GAME_TYPE:
;827:    CG_DrawGameType(&rect, scale, color, shader, textStyle);
;828:    break;
;829:  case CG_GAME_STATUS:
;830:    CG_DrawGameStatus(&rect, scale, color, shader, textStyle);
;831:		break;
;832:  case CG_KILLER:
;833:    CG_DrawKiller(&rect, scale, color, shader, textStyle);
;834:		break;
;835:	case CG_ACCURACY:
;836:	case CG_ASSISTS:
;837:	case CG_DEFEND:
;838:	case CG_EXCELLENT:
;839:	case CG_IMPRESSIVE:
;840:	case CG_PERFECT:
;841:	case CG_GAUNTLET:
;842:	case CG_CAPTURES:
;843:		CG_DrawMedal(ownerDraw, &rect, scale, color, shader);
;844:		break;
;845:  case CG_SPECTATORS:
;846:		CG_DrawTeamSpectators(&rect, scale, color, shader);
;847:		break;
;848:  case CG_TEAMINFO:
;849:		if (cg_currentSelectedPlayer.integer == numSortedTeamPlayers) {
;850:			CG_DrawNewTeamInfo(&rect, text_x, text_y, scale, color, shader);
;851:		}
;852:		break;
;853:  case CG_CAPFRAGLIMIT:
;854:    CG_DrawCapFragLimit(&rect, scale, color, shader, textStyle);
;855:		break;
;856:  case CG_1STPLACE:
;857:    CG_Draw1stPlace(&rect, scale, color, shader, textStyle);
;858:		break;
;859:  case CG_2NDPLACE:
;860:    CG_Draw2ndPlace(&rect, scale, color, shader, textStyle);
;861:		break;
;862:  default:
;863:    break;
;864:  }
;865:#endif
;866:}
LABELV $617
endproc CG_OwnerDraw 0 0
export CG_MouseEvent
proc CG_MouseEvent 16 12
line 868
;867:
;868:void CG_MouseEvent(int x, int y) {
line 871
;869:	int n;
;870:
;871:	if ( (cg.predictedPlayerState.pm_type == PM_NORMAL || cg.predictedPlayerState.pm_type == PM_FLOAT || cg.predictedPlayerState.pm_type == PM_SPECTATOR) && cg.showScores == qfalse) {
ADDRGP4 cg+96+4
INDIRI4
CNSTI4 0
EQI4 $629
ADDRGP4 cg+96+4
INDIRI4
CNSTI4 1
EQI4 $629
ADDRGP4 cg+96+4
INDIRI4
CNSTI4 3
NEI4 $619
LABELV $629
ADDRGP4 cg+6984
INDIRI4
CNSTI4 0
NEI4 $619
line 872
;872:    trap_Key_SetCatcher(0);
CNSTI4 0
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 873
;873:		return;
ADDRGP4 $618
JUMPV
LABELV $619
line 876
;874:	}
;875:
;876:	cgs.cursorX+= x;
ADDRLP4 4
ADDRGP4 cgs+70208
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
line 877
;877:	if (cgs.cursorX < 0)
ADDRGP4 cgs+70208
INDIRI4
CNSTI4 0
GEI4 $631
line 878
;878:		cgs.cursorX = 0;
ADDRGP4 cgs+70208
CNSTI4 0
ASGNI4
ADDRGP4 $632
JUMPV
LABELV $631
line 879
;879:	else if (cgs.cursorX > 640)
ADDRGP4 cgs+70208
INDIRI4
CNSTI4 640
LEI4 $635
line 880
;880:		cgs.cursorX = 640;
ADDRGP4 cgs+70208
CNSTI4 640
ASGNI4
LABELV $635
LABELV $632
line 882
;881:
;882:	cgs.cursorY += y;
ADDRLP4 8
ADDRGP4 cgs+70212
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 883
;883:	if (cgs.cursorY < 0)
ADDRGP4 cgs+70212
INDIRI4
CNSTI4 0
GEI4 $640
line 884
;884:		cgs.cursorY = 0;
ADDRGP4 cgs+70212
CNSTI4 0
ASGNI4
ADDRGP4 $641
JUMPV
LABELV $640
line 885
;885:	else if (cgs.cursorY > 480)
ADDRGP4 cgs+70212
INDIRI4
CNSTI4 480
LEI4 $644
line 886
;886:		cgs.cursorY = 480;
ADDRGP4 cgs+70212
CNSTI4 480
ASGNI4
LABELV $644
LABELV $641
line 888
;887:
;888:	n = Display_CursorType(cgs.cursorX, cgs.cursorY);
ADDRGP4 cgs+70208
INDIRI4
ARGI4
ADDRGP4 cgs+70212
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 Display_CursorType
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 889
;889:	cgs.activeCursor = 0;
ADDRGP4 cgs+70232
CNSTI4 0
ASGNI4
line 890
;890:	if (n == CURSOR_ARROW) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $651
line 891
;891:		cgs.activeCursor = cgs.media.selectCursor;
ADDRGP4 cgs+70232
ADDRGP4 cgs+70296+920
INDIRI4
ASGNI4
line 892
;892:	} else if (n == CURSOR_SIZER) {
ADDRGP4 $652
JUMPV
LABELV $651
ADDRLP4 0
INDIRI4
CNSTI4 4
NEI4 $656
line 893
;893:		cgs.activeCursor = cgs.media.sizeCursor;
ADDRGP4 cgs+70232
ADDRGP4 cgs+70296+924
INDIRI4
ASGNI4
line 894
;894:	}
LABELV $656
LABELV $652
line 896
;895:
;896:  if (cgs.capturedItem) {
ADDRGP4 cgs+70228
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $661
line 897
;897:	  Display_MouseMove(cgs.capturedItem, x, y);
ADDRGP4 cgs+70228
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Display_MouseMove
CALLI4
pop
line 898
;898:  } else {
ADDRGP4 $662
JUMPV
LABELV $661
line 899
;899:	  Display_MouseMove(NULL, cgs.cursorX, cgs.cursorY);
CNSTP4 0
ARGP4
ADDRGP4 cgs+70208
INDIRI4
ARGI4
ADDRGP4 cgs+70212
INDIRI4
ARGI4
ADDRGP4 Display_MouseMove
CALLI4
pop
line 900
;900:  }
LABELV $662
line 902
;901:
;902:}
LABELV $618
endproc CG_MouseEvent 16 12
export CG_HideTeamMenu
proc CG_HideTeamMenu 0 4
line 910
;903:
;904:/*
;905:==================
;906:CG_HideTeamMenus
;907:==================
;908:
;909:*/
;910:void CG_HideTeamMenu() {
line 911
;911:  Menus_CloseByName("teamMenu");
ADDRGP4 $668
ARGP4
ADDRGP4 Menus_CloseByName
CALLV
pop
line 912
;912:  Menus_CloseByName("getMenu");
ADDRGP4 $669
ARGP4
ADDRGP4 Menus_CloseByName
CALLV
pop
line 913
;913:}
LABELV $667
endproc CG_HideTeamMenu 0 4
export CG_ShowTeamMenu
proc CG_ShowTeamMenu 0 4
line 921
;914:
;915:/*
;916:==================
;917:CG_ShowTeamMenus
;918:==================
;919:
;920:*/
;921:void CG_ShowTeamMenu() {
line 922
;922:  Menus_OpenByName("teamMenu");
ADDRGP4 $668
ARGP4
ADDRGP4 Menus_OpenByName
CALLV
pop
line 923
;923:}
LABELV $670
endproc CG_ShowTeamMenu 0 4
export CG_EventHandling
proc CG_EventHandling 0 0
line 937
;924:
;925:
;926:
;927:
;928:/*
;929:==================
;930:CG_EventHandling
;931:==================
;932: type 0 - no event handling
;933:      1 - team menu
;934:      2 - hud editor
;935:
;936:*/
;937:void CG_EventHandling(int type) {
line 938
;938:	cgs.eventHandling = type;
ADDRGP4 cgs+70216
ADDRFP4 0
INDIRI4
ASGNI4
line 939
;939:  if (type == CGAME_EVENT_NONE) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $673
line 940
;940:    CG_HideTeamMenu();
ADDRGP4 CG_HideTeamMenu
CALLV
pop
line 941
;941:  } else if (type == CGAME_EVENT_TEAMMENU) {
ADDRGP4 $674
JUMPV
LABELV $673
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $675
line 943
;942:    //CG_ShowTeamMenu();
;943:  } else if (type == CGAME_EVENT_SCOREBOARD) {
ADDRGP4 $676
JUMPV
LABELV $675
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $677
line 944
;944:  }
LABELV $677
LABELV $676
LABELV $674
line 946
;945:
;946:}
LABELV $671
endproc CG_EventHandling 0 0
export CG_KeyEvent
proc CG_KeyEvent 8 16
line 950
;947:
;948:
;949:
;950:void CG_KeyEvent(int key, qboolean down) {
line 952
;951:
;952:	if (!down) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $680
line 953
;953:		return;
ADDRGP4 $679
JUMPV
LABELV $680
line 956
;954:	}
;955:
;956:	if ( cg.predictedPlayerState.pm_type == PM_NORMAL || cg.predictedPlayerState.pm_type == PM_NORMAL || (cg.predictedPlayerState.pm_type == PM_SPECTATOR && cg.showScores == qfalse)) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 cg+96+4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $692
ADDRGP4 cg+96+4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $692
ADDRGP4 cg+96+4
INDIRI4
CNSTI4 3
NEI4 $682
ADDRGP4 cg+6984
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $682
LABELV $692
line 957
;957:		CG_EventHandling(CGAME_EVENT_NONE);
CNSTI4 0
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 958
;958:    trap_Key_SetCatcher(0);
CNSTI4 0
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 959
;959:		return;
ADDRGP4 $679
JUMPV
LABELV $682
line 970
;960:	}
;961:
;962:  //if (key == trap_Key_GetKey("teamMenu") || !Display_CaptureItem(cgs.cursorX, cgs.cursorY)) {
;963:    // if we see this then we should always be visible
;964:  //  CG_EventHandling(CGAME_EVENT_NONE);
;965:  //  trap_Key_SetCatcher(0);
;966:  //}
;967:
;968:
;969:
;970:  Display_HandleKey(key, down, cgs.cursorX, cgs.cursorY);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+70208
INDIRI4
ARGI4
ADDRGP4 cgs+70212
INDIRI4
ARGI4
ADDRGP4 Display_HandleKey
CALLV
pop
line 972
;971:
;972:	if (cgs.capturedItem) {
ADDRGP4 cgs+70228
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $695
line 973
;973:		cgs.capturedItem = NULL;
ADDRGP4 cgs+70228
CNSTP4 0
ASGNP4
line 974
;974:	}	else {
ADDRGP4 $696
JUMPV
LABELV $695
line 975
;975:		if (key == A_MOUSE2 && down) {
ADDRFP4 0
INDIRI4
CNSTI4 142
NEI4 $699
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $699
line 976
;976:			cgs.capturedItem = Display_CaptureItem(cgs.cursorX, cgs.cursorY);
ADDRGP4 cgs+70208
INDIRI4
ARGI4
ADDRGP4 cgs+70212
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Display_CaptureItem
CALLP4
ASGNP4
ADDRGP4 cgs+70228
ADDRLP4 4
INDIRP4
ASGNP4
line 977
;977:		}
LABELV $699
line 978
;978:	}
LABELV $696
line 979
;979:}
LABELV $679
endproc CG_KeyEvent 8 16
export CG_ClientNumFromName
proc CG_ClientNumFromName 12 8
line 981
;980:
;981:int CG_ClientNumFromName(const char *p) {
line 983
;982:  int i;
;983:  for (i = 0; i < cgs.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $708
JUMPV
LABELV $705
line 984
;984:    if (cgs.clientinfo[i].infoValid && Q_stricmp(cgs.clientinfo[i].name, p) == 0) {
ADDRLP4 4
CNSTI4 788
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+43024
ADDP4
INDIRI4
CNSTI4 0
EQI4 $710
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+43024+4
ADDP4
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
NEI4 $710
line 985
;985:      return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $704
JUMPV
LABELV $710
line 987
;986:    }
;987:  }
LABELV $706
line 983
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $708
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+32988
INDIRI4
LTI4 $705
line 988
;988:  return -1;
CNSTI4 -1
RETI4
LABELV $704
endproc CG_ClientNumFromName 12 8
export CG_ShowResponseHead
proc CG_ShowResponseHead 0 8
line 991
;989:}
;990:
;991:void CG_ShowResponseHead(void) {
line 992
;992:  Menus_OpenByName("voiceMenu");
ADDRGP4 $716
ARGP4
ADDRGP4 Menus_OpenByName
CALLV
pop
line 993
;993:	trap_Cvar_Set("cl_conXOffset", "72");
ADDRGP4 $717
ARGP4
ADDRGP4 $718
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 994
;994:	cg.voiceTime = cg.time;
ADDRGP4 cg+13116
ADDRGP4 cg+64
INDIRI4
ASGNI4
line 995
;995:}
LABELV $715
endproc CG_ShowResponseHead 0 8
export CG_RunMenuScript
proc CG_RunMenuScript 0 0
line 997
;996:
;997:void CG_RunMenuScript(char **args) {
line 998
;998:}
LABELV $721
endproc CG_RunMenuScript 0 0
export CG_DeferMenuScript
proc CG_DeferMenuScript 0 0
line 1001
;999:
;1000:qboolean CG_DeferMenuScript (char **args) 
;1001:{
line 1002
;1002:	return qfalse;
CNSTI4 0
RETI4
LABELV $722
endproc CG_DeferMenuScript 0 0
export CG_GetTeamColor
proc CG_GetTeamColor 8 0
line 1005
;1003:}
;1004:
;1005:void CG_GetTeamColor(vec4_t *color) {
line 1006
;1006:  if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 1
NEI4 $724
line 1007
;1007:    (*color)[0] = 1.0f;
ADDRFP4 0
INDIRP4
CNSTF4 1065353216
ASGNF4
line 1008
;1008:    (*color)[3] = 0.25f;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1048576000
ASGNF4
line 1009
;1009:    (*color)[1] = (*color)[2] = 0.0f;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 1010
;1010:  } else if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE) {
ADDRGP4 $725
JUMPV
LABELV $724
ADDRGP4 cg+36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 2
NEI4 $727
line 1011
;1011:    (*color)[0] = (*color)[1] = 0.0f;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRF4
ASGNF4
line 1012
;1012:    (*color)[2] = 1.0f;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 1013
;1013:    (*color)[3] = 0.25f;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1048576000
ASGNF4
line 1014
;1014:  } else {
ADDRGP4 $728
JUMPV
LABELV $727
line 1015
;1015:    (*color)[0] = (*color)[2] = 0.0f;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRF4
ASGNF4
line 1016
;1016:    (*color)[1] = 0.17f;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1043207291
ASGNF4
line 1017
;1017:    (*color)[3] = 0.25f;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1048576000
ASGNF4
line 1018
;1018:	}
LABELV $728
LABELV $725
line 1019
;1019:}
LABELV $723
endproc CG_GetTeamColor 8 0
import MenuFontToHandle
import cgDC
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
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
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
LABELV $718
char 1 55
char 1 50
char 1 0
align 1
LABELV $717
char 1 99
char 1 108
char 1 95
char 1 99
char 1 111
char 1 110
char 1 88
char 1 79
char 1 102
char 1 102
char 1 115
char 1 101
char 1 116
char 1 0
align 1
LABELV $716
char 1 118
char 1 111
char 1 105
char 1 99
char 1 101
char 1 77
char 1 101
char 1 110
char 1 117
char 1 0
align 1
LABELV $669
char 1 103
char 1 101
char 1 116
char 1 77
char 1 101
char 1 110
char 1 117
char 1 0
align 1
LABELV $668
char 1 116
char 1 101
char 1 97
char 1 109
char 1 77
char 1 101
char 1 110
char 1 117
char 1 0
align 1
LABELV $614
char 1 87
char 1 111
char 1 119
char 1 0
align 1
LABELV $611
char 1 37
char 1 105
char 1 0
align 1
LABELV $608
char 1 37
char 1 105
char 1 37
char 1 37
char 1 0
align 1
LABELV $519
char 1 117
char 1 110
char 1 107
char 1 110
char 1 111
char 1 119
char 1 110
char 1 0
align 1
LABELV $452
char 1 67
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 89
char 1 115
char 1 97
char 1 108
char 1 97
char 1 109
char 1 105
char 1 114
char 1 105
char 1 0
align 1
LABELV $448
char 1 67
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 70
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $444
char 1 78
char 1 47
char 1 65
char 1 0
align 1
LABELV $440
char 1 84
char 1 101
char 1 97
char 1 109
char 1 32
char 1 70
char 1 70
char 1 65
char 1 0
align 1
LABELV $436
char 1 74
char 1 101
char 1 100
char 1 105
char 1 32
char 1 77
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $432
char 1 72
char 1 111
char 1 108
char 1 111
char 1 99
char 1 114
char 1 111
char 1 110
char 1 32
char 1 70
char 1 70
char 1 65
char 1 0
align 1
LABELV $428
char 1 70
char 1 114
char 1 101
char 1 101
char 1 32
char 1 70
char 1 111
char 1 114
char 1 32
char 1 65
char 1 108
char 1 108
char 1 0
align 1
LABELV $420
char 1 66
char 1 108
char 1 117
char 1 101
char 1 32
char 1 108
char 1 101
char 1 97
char 1 100
char 1 115
char 1 32
char 1 82
char 1 101
char 1 100
char 1 44
char 1 32
char 1 37
char 1 105
char 1 32
char 1 116
char 1 111
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $416
char 1 82
char 1 101
char 1 100
char 1 32
char 1 108
char 1 101
char 1 97
char 1 100
char 1 115
char 1 32
char 1 66
char 1 108
char 1 117
char 1 101
char 1 44
char 1 32
char 1 37
char 1 105
char 1 32
char 1 116
char 1 111
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $409
char 1 84
char 1 101
char 1 97
char 1 109
char 1 115
char 1 32
char 1 97
char 1 114
char 1 101
char 1 32
char 1 116
char 1 105
char 1 101
char 1 100
char 1 32
char 1 97
char 1 116
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $401
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $400
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
LABELV $390
char 1 75
char 1 73
char 1 76
char 1 76
char 1 69
char 1 68
char 1 66
char 1 89
char 1 0
align 1
LABELV $389
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
LABELV $388
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $384
char 1 0
align 1
LABELV $201
char 1 69
char 1 118
char 1 101
char 1 114
char 1 121
char 1 111
char 1 110
char 1 101
char 1 0
align 1
LABELV $198
char 1 37
char 1 100
char 1 0
align 1
LABELV $197
char 1 99
char 1 103
char 1 95
char 1 115
char 1 101
char 1 108
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 0
align 1
LABELV $196
char 1 99
char 1 103
char 1 95
char 1 115
char 1 101
char 1 108
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $182
char 1 99
char 1 109
char 1 100
char 1 32
char 1 118
char 1 116
char 1 101
char 1 108
char 1 108
char 1 32
char 1 37
char 1 100
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $178
char 1 116
char 1 101
char 1 97
char 1 109
char 1 116
char 1 97
char 1 115
char 1 107
char 1 32
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $173
char 1 99
char 1 109
char 1 100
char 1 32
char 1 118
char 1 115
char 1 97
char 1 121
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $167
char 1 102
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 102
char 1 108
char 1 97
char 1 103
char 1 99
char 1 97
char 1 114
char 1 114
char 1 105
char 1 101
char 1 114
char 1 0
align 1
LABELV $166
char 1 111
char 1 110
char 1 102
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 99
char 1 97
char 1 114
char 1 114
char 1 105
char 1 101
char 1 114
char 1 0
align 1
LABELV $164
char 1 114
char 1 101
char 1 116
char 1 117
char 1 114
char 1 110
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $163
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
LABELV $161
char 1 99
char 1 97
char 1 109
char 1 112
char 1 0
align 1
LABELV $160
char 1 111
char 1 110
char 1 99
char 1 97
char 1 109
char 1 112
char 1 0
align 1
LABELV $158
char 1 43
char 1 98
char 1 117
char 1 116
char 1 116
char 1 111
char 1 110
char 1 49
char 1 48
char 1 59
char 1 32
char 1 119
char 1 97
char 1 105
char 1 116
char 1 59
char 1 32
char 1 45
char 1 98
char 1 117
char 1 116
char 1 116
char 1 111
char 1 110
char 1 49
char 1 48
char 1 0
align 1
LABELV $157
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
LABELV $156
char 1 111
char 1 110
char 1 102
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 0
align 1
LABELV $154
char 1 43
char 1 98
char 1 117
char 1 116
char 1 116
char 1 111
char 1 110
char 1 57
char 1 59
char 1 32
char 1 119
char 1 97
char 1 105
char 1 116
char 1 59
char 1 32
char 1 45
char 1 98
char 1 117
char 1 116
char 1 116
char 1 111
char 1 110
char 1 57
char 1 0
align 1
LABELV $153
char 1 112
char 1 97
char 1 116
char 1 114
char 1 111
char 1 108
char 1 0
align 1
LABELV $152
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
LABELV $150
char 1 43
char 1 98
char 1 117
char 1 116
char 1 116
char 1 111
char 1 110
char 1 56
char 1 59
char 1 32
char 1 119
char 1 97
char 1 105
char 1 116
char 1 59
char 1 32
char 1 45
char 1 98
char 1 117
char 1 116
char 1 116
char 1 111
char 1 110
char 1 56
char 1 0
align 1
LABELV $149
char 1 100
char 1 101
char 1 102
char 1 101
char 1 110
char 1 100
char 1 0
align 1
LABELV $148
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
LABELV $146
char 1 43
char 1 98
char 1 117
char 1 116
char 1 116
char 1 111
char 1 110
char 1 55
char 1 59
char 1 32
char 1 119
char 1 97
char 1 105
char 1 116
char 1 59
char 1 32
char 1 45
char 1 98
char 1 117
char 1 116
char 1 116
char 1 111
char 1 110
char 1 55
char 1 0
align 1
LABELV $145
char 1 111
char 1 102
char 1 102
char 1 101
char 1 110
char 1 115
char 1 101
char 1 0
align 1
LABELV $144
char 1 111
char 1 110
char 1 111
char 1 102
char 1 102
char 1 101
char 1 110
char 1 115
char 1 101
char 1 0
