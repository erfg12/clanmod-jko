data
export ctfStateNames
align 4
LABELV ctfStateNames
address $83
address $84
address $85
address $86
address $87
address $88
address $89
export ctfStateDescriptions
align 4
LABELV ctfStateDescriptions
address $90
address $91
address $92
address $93
address $94
address $95
export sagaStateDescriptions
align 4
LABELV sagaStateDescriptions
address $90
address $96
address $97
export teamplayStateDescriptions
align 4
LABELV teamplayStateDescriptions
address $90
address $98
address $99
address $100
export BotStraightTPOrderCheck
code
proc BotStraightTPOrderCheck 4 0
file "../ai_main.c"
line 123
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_main.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_main.c $
;10: * $Author: Mrelusive $ 
;11: * $Revision: 35 $
;12: * $Modtime: 6/06/01 1:11p $
;13: * $Date: 6/06/01 12:06p $
;14: *
;15: *****************************************************************************/
;16:
;17:
;18:#include "g_local.h"
;19:#include "q_shared.h"
;20:#include "botlib.h"		//bot lib interface
;21:#include "be_aas.h"
;22:#include "be_ea.h"
;23:#include "be_ai_char.h"
;24:#include "be_ai_chat.h"
;25:#include "be_ai_gen.h"
;26:#include "be_ai_goal.h"
;27:#include "be_ai_move.h"
;28:#include "be_ai_weap.h"
;29://
;30:#include "ai_main.h"
;31:#include "w_saber.h"
;32://
;33:#include "chars.h"
;34:#include "inv.h"
;35:#include "syn.h"
;36:
;37:/*
;38:#define BOT_CTF_DEBUG	1
;39:*/
;40:
;41:#define MAX_PATH		144
;42:
;43:#define BOT_THINK_TIME	0
;44:
;45://bot states
;46:bot_state_t	*botstates[MAX_CLIENTS];
;47://number of bots
;48:int numbots;
;49://floating point time
;50:float floattime;
;51://time to do a regular update
;52:float regularupdate_time;
;53://
;54:
;55://for saga:
;56:extern int rebel_attackers;
;57:extern int imperial_attackers;
;58:
;59:boteventtracker_t gBotEventTracker[MAX_CLIENTS];
;60:
;61://rww - new bot cvars..
;62:vmCvar_t bot_forcepowers;
;63:vmCvar_t bot_forgimmick;
;64:vmCvar_t bot_honorableduelacceptance;
;65:#ifdef _DEBUG
;66:vmCvar_t bot_nogoals;
;67:vmCvar_t bot_debugmessages;
;68:#endif
;69:
;70:vmCvar_t bot_attachments;
;71:vmCvar_t bot_camp;
;72:
;73:vmCvar_t bot_wp_info;
;74:vmCvar_t bot_wp_edit;
;75:vmCvar_t bot_wp_clearweight;
;76:vmCvar_t bot_wp_distconnect;
;77:vmCvar_t bot_wp_visconnect;
;78://end rww
;79:
;80:wpobject_t *flagRed;
;81:wpobject_t *oFlagRed;
;82:wpobject_t *flagBlue;
;83:wpobject_t *oFlagBlue;
;84:
;85:gentity_t *eFlagRed;
;86:gentity_t *droppedRedFlag;
;87:gentity_t *eFlagBlue;
;88:gentity_t *droppedBlueFlag;
;89:
;90:char *ctfStateNames[] = {
;91:	"CTFSTATE_NONE",
;92:	"CTFSTATE_ATTACKER",
;93:	"CTFSTATE_DEFENDER",
;94:	"CTFSTATE_RETRIEVAL",
;95:	"CTFSTATE_GUARDCARRIER",
;96:	"CTFSTATE_GETFLAGHOME",
;97:	"CTFSTATE_MAXCTFSTATES"
;98:};
;99:
;100:char *ctfStateDescriptions[] = {
;101:	"I'm not occupied",
;102:	"I'm attacking the enemy's base",
;103:	"I'm defending our base",
;104:	"I'm getting our flag back",
;105:	"I'm escorting our flag carrier",
;106:	"I've got the enemy's flag"
;107:};
;108:
;109:char *sagaStateDescriptions[] = {
;110:	"I'm not occupied",
;111:	"I'm attemtping to complete the current objective",
;112:	"I'm preventing the enemy from completing their objective"
;113:};
;114:
;115:char *teamplayStateDescriptions[] = {
;116:	"I'm not occupied",
;117:	"I'm following my squad commander",
;118:	"I'm assisting my commanding",
;119:	"I'm attempting to regroup and form a new squad"
;120:};
;121:
;122:void BotStraightTPOrderCheck(gentity_t *ent, int ordernum, bot_state_t *bs)
;123:{
line 124
;124:	switch (ordernum)
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $104
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $107
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $108
ADDRGP4 $102
JUMPV
line 125
;125:	{
LABELV $104
line 127
;126:	case 0:
;127:		if (bs->squadLeader == ent)
ADDRFP4 8
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $103
line 128
;128:		{
line 129
;129:			bs->teamplayState = 0;
ADDRFP4 8
INDIRP4
CNSTI4 2696
ADDP4
CNSTI4 0
ASGNI4
line 130
;130:			bs->squadLeader = NULL;
ADDRFP4 8
INDIRP4
CNSTI4 1824
ADDP4
CNSTP4 0
ASGNP4
line 131
;131:		}
line 132
;132:		break;
ADDRGP4 $103
JUMPV
LABELV $107
line 134
;133:	case TEAMPLAYSTATE_FOLLOWING:
;134:		bs->teamplayState = ordernum;
ADDRFP4 8
INDIRP4
CNSTI4 2696
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 135
;135:		bs->isSquadLeader = 0;
ADDRFP4 8
INDIRP4
CNSTI4 1868
ADDP4
CNSTI4 0
ASGNI4
line 136
;136:		bs->squadLeader = ent;
ADDRFP4 8
INDIRP4
CNSTI4 1824
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 137
;137:		bs->wpDestSwitchTime = 0;
ADDRFP4 8
INDIRP4
CNSTI4 1980
ADDP4
CNSTF4 0
ASGNF4
line 138
;138:		break;
ADDRGP4 $103
JUMPV
LABELV $108
line 140
;139:	case TEAMPLAYSTATE_ASSISTING:
;140:		bs->teamplayState = ordernum;
ADDRFP4 8
INDIRP4
CNSTI4 2696
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 141
;141:		bs->isSquadLeader = 0;
ADDRFP4 8
INDIRP4
CNSTI4 1868
ADDP4
CNSTI4 0
ASGNI4
line 142
;142:		bs->squadLeader = ent;
ADDRFP4 8
INDIRP4
CNSTI4 1824
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 143
;143:		bs->wpDestSwitchTime = 0;
ADDRFP4 8
INDIRP4
CNSTI4 1980
ADDP4
CNSTF4 0
ASGNF4
line 144
;144:		break;
ADDRGP4 $103
JUMPV
LABELV $102
line 146
;145:	default:
;146:		bs->teamplayState = ordernum;
ADDRFP4 8
INDIRP4
CNSTI4 2696
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 147
;147:		break;
LABELV $103
line 149
;148:	}
;149:}
LABELV $101
endproc BotStraightTPOrderCheck 4 0
export BotSelectWeapon
proc BotSelectWeapon 0 8
line 152
;150:
;151:void BotSelectWeapon(int client, int weapon)
;152:{
line 153
;153:	if (weapon <= WP_NONE)
ADDRFP4 4
INDIRI4
CNSTI4 0
GTI4 $110
line 154
;154:	{
line 155
;155:		return;
ADDRGP4 $109
JUMPV
LABELV $110
line 157
;156:	}
;157:	trap_EA_SelectWeapon(client, weapon);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 trap_EA_SelectWeapon
CALLV
pop
line 158
;158:}
LABELV $109
endproc BotSelectWeapon 0 8
export BotReportStatus
proc BotReportStatus 4 8
line 161
;159:
;160:void BotReportStatus(bot_state_t *bs)
;161:{
line 162
;162:	if (g_gametype.integer == GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
NEI4 $113
line 163
;163:	{
line 164
;164:		trap_EA_SayTeam(bs->client, teamplayStateDescriptions[bs->teamplayState]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 2696
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 teamplayStateDescriptions
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 165
;165:	}
ADDRGP4 $114
JUMPV
LABELV $113
line 166
;166:	else if (g_gametype.integer == GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $116
line 167
;167:	{
line 168
;168:		trap_EA_SayTeam(bs->client, sagaStateDescriptions[bs->sagaState]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sagaStateDescriptions
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 169
;169:	}
ADDRGP4 $117
JUMPV
LABELV $116
line 170
;170:	else if (g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $123
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $119
LABELV $123
line 171
;171:	{
line 172
;172:		trap_EA_SayTeam(bs->client, ctfStateDescriptions[bs->ctfState]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ctfStateDescriptions
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 173
;173:	}
LABELV $119
LABELV $117
LABELV $114
line 174
;174:}
LABELV $112
endproc BotReportStatus 4 8
export BotOrder
proc BotOrder 52 12
line 177
;175:
;176:void BotOrder(gentity_t *ent, int clientnum, int ordernum)
;177:{
line 178
;178:	int stateMin = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 179
;179:	int stateMax = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 180
;180:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 182
;181:
;182:	if (!ent || !ent->client || !ent->client->sess.teamLeader)
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $128
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $128
ADDRLP4 20
INDIRP4
CNSTI4 1676
ADDP4
INDIRI4
CNSTI4 0
NEI4 $125
LABELV $128
line 183
;183:	{
line 184
;184:		return;
ADDRGP4 $124
JUMPV
LABELV $125
line 187
;185:	}
;186:
;187:	if (clientnum != -1 && !botstates[clientnum])
ADDRLP4 24
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 -1
EQI4 $129
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $129
line 188
;188:	{
line 189
;189:		return;
ADDRGP4 $124
JUMPV
LABELV $129
line 192
;190:	}
;191:
;192:	if (clientnum != -1 && !OnSameTeam(ent, &g_entities[clientnum]))
ADDRLP4 28
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 -1
EQI4 $131
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 852
ADDRLP4 28
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $131
line 193
;193:	{
line 194
;194:		return;
ADDRGP4 $124
JUMPV
LABELV $131
line 197
;195:	}
;196:
;197:	if (g_gametype.integer != GT_CTF && g_gametype.integer != GT_CTY && g_gametype.integer != GT_SAGA &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $133
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
EQI4 $133
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
EQI4 $133
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
EQI4 $133
line 199
;198:		g_gametype.integer != GT_TEAM)
;199:	{
line 200
;200:		return;
ADDRGP4 $124
JUMPV
LABELV $133
line 203
;201:	}
;202:
;203:	if (g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $143
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $139
LABELV $143
line 204
;204:	{
line 205
;205:		stateMin = CTFSTATE_NONE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 206
;206:		stateMax = CTFSTATE_MAXCTFSTATES;
ADDRLP4 8
CNSTI4 6
ASGNI4
line 207
;207:	}
ADDRGP4 $140
JUMPV
LABELV $139
line 208
;208:	else if (g_gametype.integer == GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $144
line 209
;209:	{
line 210
;210:		stateMin = SAGASTATE_NONE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 211
;211:		stateMax = SAGASTATE_MAXSAGASTATES;
ADDRLP4 8
CNSTI4 3
ASGNI4
line 212
;212:	}
ADDRGP4 $145
JUMPV
LABELV $144
line 213
;213:	else if (g_gametype.integer == GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
NEI4 $147
line 214
;214:	{
line 215
;215:		stateMin = TEAMPLAYSTATE_NONE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 216
;216:		stateMax = TEAMPLAYSTATE_MAXTPSTATES;
ADDRLP4 8
CNSTI4 4
ASGNI4
line 217
;217:	}
LABELV $147
LABELV $145
LABELV $140
line 219
;218:
;219:	if ((ordernum < stateMin && ordernum != -1) || ordernum >= stateMax)
ADDRLP4 36
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $153
ADDRLP4 36
INDIRI4
CNSTI4 -1
NEI4 $152
LABELV $153
ADDRFP4 8
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $150
LABELV $152
line 220
;220:	{
line 221
;221:		return;
ADDRGP4 $124
JUMPV
LABELV $150
line 224
;222:	}
;223:
;224:	if (clientnum != -1)
ADDRFP4 4
INDIRI4
CNSTI4 -1
EQI4 $162
line 225
;225:	{
line 226
;226:		if (ordernum == -1)
ADDRFP4 8
INDIRI4
CNSTI4 -1
NEI4 $156
line 227
;227:		{
line 228
;228:			BotReportStatus(botstates[clientnum]);
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotReportStatus
CALLV
pop
line 229
;229:		}
ADDRGP4 $155
JUMPV
LABELV $156
line 231
;230:		else
;231:		{
line 232
;232:			BotStraightTPOrderCheck(ent, ordernum, botstates[clientnum]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotStraightTPOrderCheck
CALLV
pop
line 233
;233:			botstates[clientnum]->state_Forced = ordernum;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2704
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 234
;234:			botstates[clientnum]->chatObject = ent;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2244
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 235
;235:			botstates[clientnum]->chatAltObject = NULL;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 236
;236:			if (BotDoChat(botstates[clientnum], "OrderAccepted", 1))
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 $160
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 40
ADDRGP4 BotDoChat
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $155
line 237
;237:			{
line 238
;238:				botstates[clientnum]->chatTeam = 1;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2240
ADDP4
CNSTI4 1
ASGNI4
line 239
;239:			}
line 240
;240:		}
line 241
;241:	}
ADDRGP4 $155
JUMPV
line 243
;242:	else
;243:	{
LABELV $161
line 245
;244:		while (i < MAX_CLIENTS)
;245:		{
line 246
;246:			if (botstates[i] && OnSameTeam(ent, &g_entities[i]))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $164
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $164
line 247
;247:			{
line 248
;248:				if (ordernum == -1)
ADDRFP4 8
INDIRI4
CNSTI4 -1
NEI4 $166
line 249
;249:				{
line 250
;250:					BotReportStatus(botstates[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotReportStatus
CALLV
pop
line 251
;251:				}
ADDRGP4 $167
JUMPV
LABELV $166
line 253
;252:				else
;253:				{
line 254
;254:					BotStraightTPOrderCheck(ent, ordernum, botstates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotStraightTPOrderCheck
CALLV
pop
line 255
;255:					botstates[i]->state_Forced = ordernum;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2704
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 256
;256:					botstates[i]->chatObject = ent;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2244
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 257
;257:					botstates[i]->chatAltObject = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 258
;258:					if (BotDoChat(botstates[i], "OrderAccepted", 0))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 $160
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 48
ADDRGP4 BotDoChat
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $168
line 259
;259:					{
line 260
;260:						botstates[i]->chatTeam = 1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2240
ADDP4
CNSTI4 1
ASGNI4
line 261
;261:					}
LABELV $168
line 262
;262:				}
LABELV $167
line 263
;263:			}
LABELV $164
line 265
;264:
;265:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 266
;266:		}
LABELV $162
line 244
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $161
line 267
;267:	}
LABELV $155
line 268
;268:}
LABELV $124
endproc BotOrder 52 12
export BotMindTricked
proc BotMindTricked 4 0
line 271
;269:
;270:int BotMindTricked(int botClient, int enemyClient)
;271:{
line 274
;272:	forcedata_t *fd;
;273:
;274:	if (!g_entities[enemyClient].client)
CNSTI4 852
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $171
line 275
;275:	{
line 276
;276:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $170
JUMPV
LABELV $171
line 279
;277:	}
;278:	
;279:	fd = &g_entities[enemyClient].client->ps.fd;
ADDRLP4 0
CNSTI4 852
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ASGNP4
line 281
;280:
;281:	if (!fd)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $175
line 282
;282:	{
line 283
;283:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $170
JUMPV
LABELV $175
line 286
;284:	}
;285:
;286:	if (botClient > 47)
ADDRFP4 0
INDIRI4
CNSTI4 47
LEI4 $177
line 287
;287:	{
line 288
;288:		if (fd->forceMindtrickTargetIndex4 & (1 << (botClient-48)))
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
CNSTI4 48
SUBI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $178
line 289
;289:		{
line 290
;290:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $170
JUMPV
line 292
;291:		}
;292:	}
LABELV $177
line 293
;293:	else if (botClient > 31)
ADDRFP4 0
INDIRI4
CNSTI4 31
LEI4 $181
line 294
;294:	{
line 295
;295:		if (fd->forceMindtrickTargetIndex3 & (1 << (botClient-32)))
ADDRLP4 0
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
CNSTI4 32
SUBI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $182
line 296
;296:		{
line 297
;297:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $170
JUMPV
line 299
;298:		}
;299:	}
LABELV $181
line 300
;300:	else if (botClient > 15)
ADDRFP4 0
INDIRI4
CNSTI4 15
LEI4 $185
line 301
;301:	{
line 302
;302:		if (fd->forceMindtrickTargetIndex2 & (1 << (botClient-16)))
ADDRLP4 0
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
CNSTI4 16
SUBI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $186
line 303
;303:		{
line 304
;304:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $170
JUMPV
line 306
;305:		}
;306:	}
LABELV $185
line 308
;307:	else
;308:	{
line 309
;309:		if (fd->forceMindtrickTargetIndex & (1 << botClient))
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $189
line 310
;310:		{
line 311
;311:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $170
JUMPV
LABELV $189
line 313
;312:		}
;313:	}
LABELV $186
LABELV $182
LABELV $178
line 315
;314:
;315:	return 0;
CNSTI4 0
RETI4
LABELV $170
endproc BotMindTricked 4 0
export BotAI_Print
proc BotAI_Print 0 0
line 323
;316:}
;317:
;318:int BotGetWeaponRange(bot_state_t *bs);
;319:int PassLovedOneCheck(bot_state_t *bs, gentity_t *ent);
;320:
;321:void ExitLevel( void );
;322:
;323:void QDECL BotAI_Print(int type, char *fmt, ...) { return; }
LABELV $191
endproc BotAI_Print 0 0
export IsTeamplay
proc IsTeamplay 0 0
line 328
;324:
;325:qboolean WP_ForcePowerUsable( gentity_t *self, forcePowers_t forcePower );
;326:
;327:int IsTeamplay(void)
;328:{
line 329
;329:	if ( g_gametype.integer < GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
GEI4 $193
line 330
;330:	{
line 331
;331:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $192
JUMPV
LABELV $193
line 334
;332:	}
;333:
;334:	return 1;
CNSTI4 1
RETI4
LABELV $192
endproc IsTeamplay 0 0
export BotAI_GetClientState
proc BotAI_GetClientState 4 12
line 342
;335:}
;336:
;337:/*
;338:==================
;339:BotAI_GetClientState
;340:==================
;341:*/
;342:int BotAI_GetClientState( int clientNum, playerState_t *state ) {
line 345
;343:	gentity_t	*ent;
;344:
;345:	ent = &g_entities[clientNum];
ADDRLP4 0
CNSTI4 852
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 346
;346:	if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $197
line 347
;347:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $196
JUMPV
LABELV $197
line 349
;348:	}
;349:	if ( !ent->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $199
line 350
;350:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $196
JUMPV
LABELV $199
line 353
;351:	}
;352:
;353:	memcpy( state, &ent->client->ps, sizeof(playerState_t) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
CNSTI4 1380
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 354
;354:	return qtrue;
CNSTI4 1
RETI4
LABELV $196
endproc BotAI_GetClientState 4 12
export BotAI_GetEntityState
proc BotAI_GetEntityState 4 12
line 362
;355:}
;356:
;357:/*
;358:==================
;359:BotAI_GetEntityState
;360:==================
;361:*/
;362:int BotAI_GetEntityState( int entityNum, entityState_t *state ) {
line 365
;363:	gentity_t	*ent;
;364:
;365:	ent = &g_entities[entityNum];
ADDRLP4 0
CNSTI4 852
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 366
;366:	memset( state, 0, sizeof(entityState_t) );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 296
ARGI4
ADDRGP4 memset
CALLP4
pop
line 367
;367:	if (!ent->inuse) return qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $202
CNSTI4 0
RETI4
ADDRGP4 $201
JUMPV
LABELV $202
line 368
;368:	if (!ent->r.linked) return qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 0
NEI4 $204
CNSTI4 0
RETI4
ADDRGP4 $201
JUMPV
LABELV $204
line 369
;369:	if (ent->r.svFlags & SVF_NOCLIENT) return qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $206
CNSTI4 0
RETI4
ADDRGP4 $201
JUMPV
LABELV $206
line 370
;370:	memcpy( state, &ent->s, sizeof(entityState_t) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 296
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 371
;371:	return qtrue;
CNSTI4 1
RETI4
LABELV $201
endproc BotAI_GetEntityState 4 12
export BotAI_GetSnapshotEntity
proc BotAI_GetSnapshotEntity 8 12
line 379
;372:}
;373:
;374:/*
;375:==================
;376:BotAI_GetSnapshotEntity
;377:==================
;378:*/
;379:int BotAI_GetSnapshotEntity( int clientNum, int sequence, entityState_t *state ) {
line 382
;380:	int		entNum;
;381:
;382:	entNum = trap_BotGetSnapshotEntity( clientNum, sequence );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_BotGetSnapshotEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 383
;383:	if ( entNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $209
line 384
;384:		memset(state, 0, sizeof(entityState_t));
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 296
ARGI4
ADDRGP4 memset
CALLP4
pop
line 385
;385:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $208
JUMPV
LABELV $209
line 388
;386:	}
;387:
;388:	BotAI_GetEntityState( entNum, state );
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 390
;389:
;390:	return sequence + 1;
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
RETI4
LABELV $208
endproc BotAI_GetSnapshotEntity 8 12
export BotEntityInfo
proc BotEntityInfo 0 8
line 398
;391:}
;392:
;393:/*
;394:==============
;395:BotEntityInfo
;396:==============
;397:*/
;398:void BotEntityInfo(int entnum, aas_entityinfo_t *info) {
line 399
;399:	trap_AAS_EntityInfo(entnum, info);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_AAS_EntityInfo
CALLV
pop
line 400
;400:}
LABELV $211
endproc BotEntityInfo 0 8
export NumBots
proc NumBots 0 0
line 407
;401:
;402:/*
;403:==============
;404:NumBots
;405:==============
;406:*/
;407:int NumBots(void) {
line 408
;408:	return numbots;
ADDRGP4 numbots
INDIRI4
RETI4
LABELV $212
endproc NumBots 0 0
export AngleDifference
proc AngleDifference 4 0
line 416
;409:}
;410:
;411:/*
;412:==============
;413:AngleDifference
;414:==============
;415:*/
;416:float AngleDifference(float ang1, float ang2) {
line 419
;417:	float diff;
;418:
;419:	diff = ang1 - ang2;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
SUBF4
ASGNF4
line 420
;420:	if (ang1 > ang2) {
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $214
line 421
;421:		if (diff > 180.0) diff -= 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 1127481344
LEF4 $215
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 422
;422:	}
ADDRGP4 $215
JUMPV
LABELV $214
line 423
;423:	else {
line 424
;424:		if (diff < -180.0) diff += 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
GEF4 $218
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $218
line 425
;425:	}
LABELV $215
line 426
;426:	return diff;
ADDRLP4 0
INDIRF4
RETF4
LABELV $213
endproc AngleDifference 4 0
export BotChangeViewAngle
proc BotChangeViewAngle 16 4
line 434
;427:}
;428:
;429:/*
;430:==============
;431:BotChangeViewAngle
;432:==============
;433:*/
;434:float BotChangeViewAngle(float angle, float ideal_angle, float speed) {
line 437
;435:	float move;
;436:
;437:	angle = AngleMod(angle);
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 438
;438:	ideal_angle = AngleMod(ideal_angle);
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 439
;439:	if (angle == ideal_angle) return angle;
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
NEF4 $221
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $220
JUMPV
LABELV $221
line 440
;440:	move = ideal_angle - angle;
ADDRLP4 0
ADDRFP4 4
INDIRF4
ADDRFP4 0
INDIRF4
SUBF4
ASGNF4
line 441
;441:	if (ideal_angle > angle) {
ADDRFP4 4
INDIRF4
ADDRFP4 0
INDIRF4
LEF4 $223
line 442
;442:		if (move > 180.0) move -= 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 1127481344
LEF4 $224
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 443
;443:	}
ADDRGP4 $224
JUMPV
LABELV $223
line 444
;444:	else {
line 445
;445:		if (move < -180.0) move += 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
GEF4 $227
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $227
line 446
;446:	}
LABELV $224
line 447
;447:	if (move > 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $229
line 448
;448:		if (move > speed) move = speed;
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $230
ADDRLP4 0
ADDRFP4 8
INDIRF4
ASGNF4
line 449
;449:	}
ADDRGP4 $230
JUMPV
LABELV $229
line 450
;450:	else {
line 451
;451:		if (move < -speed) move = -speed;
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $233
ADDRLP4 0
ADDRFP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $233
line 452
;452:	}
LABELV $230
line 453
;453:	return AngleMod(angle + move);
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 12
INDIRF4
RETF4
LABELV $220
endproc BotChangeViewAngle 16 4
export BotChangeViewAngles
proc BotChangeViewAngles 84 8
line 461
;454:}
;455:
;456:/*
;457:==============
;458:BotChangeViewAngles
;459:==============
;460:*/
;461:void BotChangeViewAngles(bot_state_t *bs, float thinktime) {
line 465
;462:	float diff, factor, maxchange, anglespeed, disired_speed;
;463:	int i;
;464:
;465:	if (bs->ideal_viewangles[PITCH] > 180) bs->ideal_viewangles[PITCH] -= 360;
ADDRFP4 0
INDIRP4
CNSTI4 1792
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $236
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 1792
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $236
line 467
;466:	
;467:	if (bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $238
ADDRLP4 28
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $238
line 468
;468:	{
line 469
;469:		factor = bs->skills.turnspeed_combat*bs->settings.skill;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 32
INDIRP4
CNSTI4 2328
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 1568
ADDP4
INDIRF4
MULF4
ASGNF4
line 470
;470:	}
ADDRGP4 $239
JUMPV
LABELV $238
line 472
;471:	else
;472:	{
line 473
;473:		factor = bs->skills.turnspeed;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 2324
ADDP4
INDIRF4
ASGNF4
line 474
;474:	}
LABELV $239
line 476
;475:
;476:	if (factor > 1)
ADDRLP4 12
INDIRF4
CNSTF4 1065353216
LEF4 $240
line 477
;477:	{
line 478
;478:		factor = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 479
;479:	}
LABELV $240
line 480
;480:	if (factor < 0.001)
ADDRLP4 12
INDIRF4
CNSTF4 981668463
GEF4 $242
line 481
;481:	{
line 482
;482:		factor = 0.001f;
ADDRLP4 12
CNSTF4 981668463
ASGNF4
line 483
;483:	}
LABELV $242
line 485
;484:
;485:	maxchange = bs->skills.maxturn;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 2332
ADDP4
INDIRF4
ASGNF4
line 488
;486:
;487:	//if (maxchange < 240) maxchange = 240;
;488:	maxchange *= thinktime;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 489
;489:	for (i = 0; i < 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $244
line 490
;490:		bs->viewangles[i] = AngleMod(bs->viewangles[i]);
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRF4
ASGNF4
line 491
;491:		bs->ideal_viewangles[i] = AngleMod(bs->ideal_viewangles[i]);
ADDRLP4 40
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1792
ADDP4
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRF4
ASGNF4
line 492
;492:		diff = AngleDifference(bs->viewangles[i], bs->ideal_viewangles[i]);
ADDRLP4 48
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 1792
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 56
ADDRGP4 AngleDifference
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 56
INDIRF4
ASGNF4
line 493
;493:		disired_speed = diff * factor;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 494
;494:		bs->viewanglespeed[i] += (bs->viewanglespeed[i] - disired_speed);
ADDRLP4 60
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 60
INDIRP4
ADDRLP4 64
INDIRF4
ADDRLP4 64
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
ADDF4
ASGNF4
line 495
;495:		if (bs->viewanglespeed[i] > 180) bs->viewanglespeed[i] = maxchange;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $248
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $248
line 496
;496:		if (bs->viewanglespeed[i] < -180) bs->viewanglespeed[i] = -maxchange;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
INDIRF4
CNSTF4 3274964992
GEF4 $250
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
ADDRLP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $250
line 497
;497:		anglespeed = bs->viewanglespeed[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
INDIRF4
ASGNF4
line 498
;498:		if (anglespeed > maxchange) anglespeed = maxchange;
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $252
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $252
line 499
;499:		if (anglespeed < -maxchange) anglespeed = -maxchange;
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
NEGF4
GEF4 $254
ADDRLP4 4
ADDRLP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $254
line 500
;500:		bs->viewangles[i] += anglespeed;
ADDRLP4 68
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
line 501
;501:		bs->viewangles[i] = AngleMod(bs->viewangles[i]);
ADDRLP4 72
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
INDIRF4
ARGF4
ADDRLP4 76
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 72
INDIRP4
ADDRLP4 76
INDIRF4
ASGNF4
line 502
;502:		bs->viewanglespeed[i] *= 0.45 * (1 - factor);
ADDRLP4 80
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
CNSTF4 1055286886
CNSTF4 1065353216
ADDRLP4 12
INDIRF4
SUBF4
MULF4
MULF4
ASGNF4
line 503
;503:	}
LABELV $245
line 489
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $244
line 504
;504:	if (bs->viewangles[PITCH] > 180) bs->viewangles[PITCH] -= 360;
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $256
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $256
line 505
;505:	trap_EA_View(bs->client, bs->viewangles);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
ADDRGP4 trap_EA_View
CALLV
pop
line 506
;506:}
LABELV $235
endproc BotChangeViewAngles 84 8
export BotInputToUserCommand
proc BotInputToUserCommand 120 16
line 513
;507:
;508:/*
;509:==============
;510:BotInputToUserCommand
;511:==============
;512:*/
;513:void BotInputToUserCommand(bot_input_t *bi, usercmd_t *ucmd, int delta_angles[3], int time, int useTime) {
line 519
;514:	vec3_t angles, forward, right;
;515:	short temp;
;516:	int j;
;517:
;518:	//clear the whole structure
;519:	memset(ucmd, 0, sizeof(usercmd_t));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 28
ARGI4
ADDRGP4 memset
CALLP4
pop
line 523
;520:	//
;521:	//Com_Printf("dir = %f %f %f speed = %f\n", bi->dir[0], bi->dir[1], bi->dir[2], bi->speed);
;522:	//the duration for the user command in milli seconds
;523:	ucmd->serverTime = time;
ADDRFP4 4
INDIRP4
ADDRFP4 12
INDIRI4
ASGNI4
line 525
;524:	//
;525:	if (bi->actionflags & ACTION_DELAYEDJUMP) {
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $259
line 526
;526:		bi->actionflags |= ACTION_JUMP;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 527
;527:		bi->actionflags &= ~ACTION_DELAYEDJUMP;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 528
;528:	}
LABELV $259
line 530
;529:	//set the buttons
;530:	if (bi->actionflags & ACTION_RESPAWN) ucmd->buttons = BUTTON_ATTACK;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $261
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 1
ASGNI4
LABELV $261
line 531
;531:	if (bi->actionflags & ACTION_ATTACK) ucmd->buttons |= BUTTON_ATTACK;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $263
ADDRLP4 44
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
LABELV $263
line 532
;532:	if (bi->actionflags & ACTION_ALT_ATTACK) ucmd->buttons |= BUTTON_ALT_ATTACK;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
CNSTI4 0
EQI4 $265
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
LABELV $265
line 534
;533://	if (bi->actionflags & ACTION_TALK) ucmd->buttons |= BUTTON_TALK;
;534:	if (bi->actionflags & ACTION_GESTURE) ucmd->buttons |= BUTTON_GESTURE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $267
ADDRLP4 52
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
LABELV $267
line 535
;535:	if (bi->actionflags & ACTION_USE) ucmd->buttons |= BUTTON_USE_HOLDABLE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $269
ADDRLP4 56
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
LABELV $269
line 536
;536:	if (bi->actionflags & ACTION_WALK) ucmd->buttons |= BUTTON_WALKING;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $271
ADDRLP4 60
CNSTI4 16
ASGNI4
ADDRLP4 64
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
ADDRLP4 60
INDIRI4
BORI4
ASGNI4
LABELV $271
line 538
;537:
;538:	if (bi->actionflags & ACTION_FORCEPOWER) ucmd->buttons |= BUTTON_FORCEPOWER;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 1048576
BANDI4
CNSTI4 0
EQI4 $273
ADDRLP4 68
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
LABELV $273
line 540
;539:
;540:	if (useTime < level.time && Q_irand(1, 10) < 5)
ADDRFP4 16
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $275
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 72
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 5
GEI4 $275
line 541
;541:	{ //for now just hit use randomly in case there's something useable around
line 542
;542:		ucmd->buttons |= BUTTON_USE;
ADDRLP4 76
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 543
;543:	}
LABELV $275
line 556
;544:#if 0
;545:// Here's an interesting bit.  The bots in TA used buttons to do additional gestures.
;546:// I ripped them out because I didn't want too many buttons given the fact that I was already adding some for JK2.
;547:// We can always add some back in if we want though.
;548:	if (bi->actionflags & ACTION_AFFIRMATIVE) ucmd->buttons |= BUTTON_AFFIRMATIVE;
;549:	if (bi->actionflags & ACTION_NEGATIVE) ucmd->buttons |= BUTTON_NEGATIVE;
;550:	if (bi->actionflags & ACTION_GETFLAG) ucmd->buttons |= BUTTON_GETFLAG;
;551:	if (bi->actionflags & ACTION_GUARDBASE) ucmd->buttons |= BUTTON_GUARDBASE;
;552:	if (bi->actionflags & ACTION_PATROL) ucmd->buttons |= BUTTON_PATROL;
;553:	if (bi->actionflags & ACTION_FOLLOWME) ucmd->buttons |= BUTTON_FOLLOWME;
;554:#endif //0
;555:
;556:	if (bi->weapon == WP_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
NEI4 $278
line 557
;557:	{
line 561
;558:#ifdef _DEBUG
;559://		Com_Printf("WARNING: Bot tried to use WP_NONE!\n");
;560:#endif
;561:		bi->weapon = WP_BRYAR_PISTOL;
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTI4 3
ASGNI4
line 562
;562:	}
LABELV $278
line 565
;563:
;564:	//
;565:	ucmd->weapon = bi->weapon;
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 568
;566:	//set the view angles
;567:	//NOTE: the ucmd->angles are the angles WITHOUT the delta angles
;568:	ucmd->angles[PITCH] = ANGLE2SHORT(bi->viewangles[PITCH]);
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1199570944
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 569
;569:	ucmd->angles[YAW] = ANGLE2SHORT(bi->viewangles[YAW]);
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1199570944
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 570
;570:	ucmd->angles[ROLL] = ANGLE2SHORT(bi->viewangles[ROLL]);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1199570944
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 572
;571:	//subtract the delta angles
;572:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $280
line 573
;573:		temp = ucmd->angles[j] - delta_angles[j];
ADDRLP4 76
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
ADDRLP4 76
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRI4
SUBI4
CVII2 4
ASGNI2
line 574
;574:		ucmd->angles[j] = temp;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
ADDRLP4 4
INDIRI2
CVII4 2
ASGNI4
line 575
;575:	}
LABELV $281
line 572
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $280
line 579
;576:	//NOTE: movement is relative to the REAL view angles
;577:	//get the horizontal forward and right vector
;578:	//get the pitch in the range [-180, 180]
;579:	if (bi->dir[2]) angles[PITCH] = bi->viewangles[PITCH];
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 0
EQF4 $284
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $285
JUMPV
LABELV $284
line 580
;580:	else angles[PITCH] = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
LABELV $285
line 581
;581:	angles[YAW] = bi->viewangles[YAW];
ADDRLP4 20+4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 582
;582:	angles[ROLL] = 0;
ADDRLP4 20+8
CNSTF4 0
ASGNF4
line 583
;583:	AngleVectors(angles, forward, right, NULL);
ADDRLP4 20
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 32
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 585
;584:	//bot input speed is in the range [0, 400]
;585:	bi->speed = bi->speed * 127 / 400;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTF4 1123942400
ADDRLP4 76
INDIRP4
INDIRF4
MULF4
CNSTF4 1137180672
DIVF4
ASGNF4
line 587
;586:	//set the view independent movement
;587:	ucmd->forwardmove = DotProduct(forward, bi->dir) * bi->speed;
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 8
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 8+4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 8+8
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 80
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
MULF4
CVFI4 4
CVII1 4
ASGNI1
line 588
;588:	ucmd->rightmove = DotProduct(right, bi->dir) * bi->speed;
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
ADDRLP4 32
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 32+4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 32+8
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 84
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
MULF4
CVFI4 4
CVII1 4
ASGNI1
line 589
;589:	ucmd->upmove = abs(forward[2]) * bi->dir[2] * bi->speed;
ADDRLP4 8+8
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 88
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
ADDRLP4 88
INDIRI4
CVIF4 4
ADDRLP4 92
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDRLP4 92
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
MULF4
CVFI4 4
CVII1 4
ASGNI1
line 591
;590:	//normal keyboard movement
;591:	if (bi->actionflags & ACTION_MOVEFORWARD) ucmd->forwardmove += 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $293
ADDRLP4 96
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
ADDI4
CVII1 4
ASGNI1
LABELV $293
line 592
;592:	if (bi->actionflags & ACTION_MOVEBACK) ucmd->forwardmove -= 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $295
ADDRLP4 100
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
SUBI4
CVII1 4
ASGNI1
LABELV $295
line 593
;593:	if (bi->actionflags & ACTION_MOVELEFT) ucmd->rightmove -= 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $297
ADDRLP4 104
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
SUBI4
CVII1 4
ASGNI1
LABELV $297
line 594
;594:	if (bi->actionflags & ACTION_MOVERIGHT) ucmd->rightmove += 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $299
ADDRLP4 108
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
ADDI4
CVII1 4
ASGNI1
LABELV $299
line 596
;595:	//jump/moveup
;596:	if (bi->actionflags & ACTION_JUMP) ucmd->upmove += 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $301
ADDRLP4 112
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
ADDI4
CVII1 4
ASGNI1
LABELV $301
line 598
;597:	//crouch/movedown
;598:	if (bi->actionflags & ACTION_CROUCH) ucmd->upmove -= 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $303
ADDRLP4 116
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
SUBI4
CVII1 4
ASGNI1
LABELV $303
line 602
;599:	//
;600:	//Com_Printf("forward = %d right = %d up = %d\n", ucmd.forwardmove, ucmd.rightmove, ucmd.upmove);
;601:	//Com_Printf("ucmd->serverTime = %d\n", ucmd->serverTime);
;602:}
LABELV $258
endproc BotInputToUserCommand 120 16
export BotUpdateInput
proc BotUpdateInput 64 20
line 609
;603:
;604:/*
;605:==============
;606:BotUpdateInput
;607:==============
;608:*/
;609:void BotUpdateInput(bot_state_t *bs, int time, int elapsed_time) {
line 614
;610:	bot_input_t bi;
;611:	int j;
;612:
;613:	//add the delta angles to the bot's current view angles
;614:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $306
line 615
;615:		bs->viewangles[j] = AngleMod(bs->viewangles[j] + SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 44
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
INDIRF4
CNSTF4 1001652224
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 84
ADDP4
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ARGF4
ADDRLP4 56
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 52
INDIRP4
ADDRLP4 56
INDIRF4
ASGNF4
line 616
;616:	}
LABELV $307
line 614
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $306
line 618
;617:	//change the bot view angles
;618:	BotChangeViewAngles(bs, (float) elapsed_time / 1000);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRGP4 BotChangeViewAngles
CALLV
pop
line 620
;619:	//retrieve the bot input
;620:	trap_EA_GetInput(bs->client, (float) time / 1000, &bi);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 trap_EA_GetInput
CALLV
pop
line 622
;621:	//respawn hack
;622:	if (bi.actionflags & ACTION_RESPAWN) {
ADDRLP4 4+32
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $310
line 623
;623:		if (bs->lastucmd.buttons & BUTTON_ATTACK) bi.actionflags &= ~(ACTION_RESPAWN|ACTION_ATTACK);
ADDRFP4 0
INDIRP4
CNSTI4 1412
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $313
ADDRLP4 4+32
ADDRLP4 4+32
INDIRI4
CNSTI4 -10
BANDI4
ASGNI4
LABELV $313
line 624
;624:	}
LABELV $310
line 626
;625:	//convert the bot input to a usercmd
;626:	BotInputToUserCommand(&bi, &bs->lastucmd, bs->cur_ps.delta_angles, time, bs->noUseTime);
ADDRLP4 4
ARGP4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 1396
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 84
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 4800
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotInputToUserCommand
CALLV
pop
line 628
;627:	//subtract the delta angles
;628:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $316
line 629
;629:		bs->viewangles[j] = AngleMod(bs->viewangles[j] - SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 48
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
INDIRF4
CNSTF4 1001652224
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 84
ADDP4
ADDP4
INDIRI4
CVIF4 4
MULF4
SUBF4
ARGF4
ADDRLP4 60
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 56
INDIRP4
ADDRLP4 60
INDIRF4
ASGNF4
line 630
;630:	}
LABELV $317
line 628
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $316
line 631
;631:}
LABELV $305
endproc BotUpdateInput 64 20
export BotAIRegularUpdate
proc BotAIRegularUpdate 0 0
line 638
;632:
;633:/*
;634:==============
;635:BotAIRegularUpdate
;636:==============
;637:*/
;638:void BotAIRegularUpdate(void) {
line 639
;639:	if (regularupdate_time < FloatTime()) {
ADDRGP4 regularupdate_time
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $321
line 640
;640:		trap_BotUpdateEntityItems();
ADDRGP4 trap_BotUpdateEntityItems
CALLV
pop
line 641
;641:		regularupdate_time = FloatTime() + 0.3;
ADDRGP4 regularupdate_time
ADDRGP4 floattime
INDIRF4
CNSTF4 1050253722
ADDF4
ASGNF4
line 642
;642:	}
LABELV $321
line 643
;643:}
LABELV $320
endproc BotAIRegularUpdate 0 0
export RemoveColorEscapeSequences
proc RemoveColorEscapeSequences 28 0
line 650
;644:
;645:/*
;646:==============
;647:RemoveColorEscapeSequences
;648:==============
;649:*/
;650:void RemoveColorEscapeSequences( char *text ) {
line 653
;651:	int i, l;
;652:
;653:	l = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 654
;654:	for ( i = 0; text[i]; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $327
JUMPV
LABELV $324
line 655
;655:		if (Q_IsColorString(&text[i])) {
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $328
ADDRLP4 12
CNSTI4 94
ASGNI4
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
NEI4 $328
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $328
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $328
ADDRLP4 16
INDIRI4
CNSTI4 55
GTI4 $328
ADDRLP4 16
INDIRI4
CNSTI4 48
LTI4 $328
line 656
;656:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 657
;657:			continue;
ADDRGP4 $325
JUMPV
LABELV $328
line 659
;658:		}
;659:		if (text[i] > 0x7E)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 126
LEI4 $330
line 660
;660:			continue;
ADDRGP4 $325
JUMPV
LABELV $330
line 661
;661:		text[l++] = text[i];
ADDRLP4 20
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 662
;662:	}
LABELV $325
line 654
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $327
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $324
line 663
;663:	text[l] = '\0';
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 664
;664:}
LABELV $323
endproc RemoveColorEscapeSequences 28 0
export BotAI
proc BotAI 1080 12
line 672
;665:
;666:
;667:/*
;668:==============
;669:BotAI
;670:==============
;671:*/
;672:int BotAI(int client, float thinktime) {
line 681
;673:	bot_state_t *bs;
;674:	char buf[1024], *args;
;675:	int j;
;676:#ifdef _DEBUG
;677:	int start = 0;
;678:	int end = 0;
;679:#endif
;680:
;681:	trap_EA_ResetInput(client);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_EA_ResetInput
CALLV
pop
line 683
;682:	//
;683:	bs = botstates[client];
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 684
;684:	if (!bs || !bs->inuse) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $335
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $333
LABELV $335
line 685
;685:		BotAI_Print(PRT_FATAL, "BotAI: client %d is not setup\n", client);
CNSTI4 4
ARGI4
ADDRGP4 $336
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 686
;686:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $332
JUMPV
LABELV $333
line 690
;687:	}
;688:
;689:	//retrieve the current client state
;690:	BotAI_GetClientState( client, &bs->cur_ps );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
ADDRGP4 $338
JUMPV
LABELV $337
line 693
;691:
;692:	//retrieve any waiting server commands
;693:	while( trap_BotGetServerCommand(client, buf, sizeof(buf)) ) {
line 695
;694:		//have buf point to the command and args to the command arguments
;695:		args = strchr( buf, ' ');
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 1040
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1040
INDIRP4
ASGNP4
line 696
;696:		if (!args) continue;
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $340
ADDRGP4 $338
JUMPV
LABELV $340
line 697
;697:		*args++ = '\0';
ADDRLP4 1044
ADDRLP4 1032
INDIRP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1044
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
CNSTI1 0
ASGNI1
line 700
;698:
;699:		//remove color espace sequences from the arguments
;700:		RemoveColorEscapeSequences( args );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 RemoveColorEscapeSequences
CALLV
pop
line 702
;701:
;702:		if (!Q_stricmp(buf, "cp "))
ADDRLP4 8
ARGP4
ADDRGP4 $344
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $342
line 703
;703:			{ /*CenterPrintf*/ }
ADDRGP4 $343
JUMPV
LABELV $342
line 704
;704:		else if (!Q_stricmp(buf, "cs"))
ADDRLP4 8
ARGP4
ADDRGP4 $347
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $345
line 705
;705:			{ /*ConfigStringModified*/ }
ADDRGP4 $346
JUMPV
LABELV $345
line 706
;706:		else if (!Q_stricmp(buf, "scores"))
ADDRLP4 8
ARGP4
ADDRGP4 $350
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $348
line 707
;707:			{ /*FIXME: parse scores?*/ }
ADDRGP4 $349
JUMPV
LABELV $348
line 708
;708:		else if (!Q_stricmp(buf, "clientLevelShot"))
ADDRLP4 8
ARGP4
ADDRGP4 $353
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $351
line 709
;709:			{ /*ignore*/ }
LABELV $351
LABELV $349
LABELV $346
LABELV $343
line 710
;710:	}
LABELV $338
line 693
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1040
ADDRGP4 trap_BotGetServerCommand
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $337
line 712
;711:	//add the delta angles to the bot's current view angles
;712:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $354
line 713
;713:		bs->viewangles[j] = AngleMod(bs->viewangles[j] + SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 1044
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1044
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 1052
INDIRP4
INDIRF4
CNSTF4 1001652224
ADDRLP4 1044
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ARGF4
ADDRLP4 1056
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1052
INDIRP4
ADDRLP4 1056
INDIRF4
ASGNF4
line 714
;714:	}
LABELV $355
line 712
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $354
line 716
;715:	//increase the local time of the bot
;716:	bs->ltime += thinktime;
ADDRLP4 1044
ADDRLP4 4
INDIRP4
CNSTI4 1760
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
ADDRLP4 1044
INDIRP4
INDIRF4
ADDRFP4 4
INDIRF4
ADDF4
ASGNF4
line 718
;717:	//
;718:	bs->thinktime = thinktime;
ADDRLP4 4
INDIRP4
CNSTI4 1716
ADDP4
ADDRFP4 4
INDIRF4
ASGNF4
line 720
;719:	//origin of the bot
;720:	VectorCopy(bs->cur_ps.origin, bs->origin);
ADDRLP4 4
INDIRP4
CNSTI4 1720
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 722
;721:	//eye coordinates of the bot
;722:	VectorCopy(bs->cur_ps.origin, bs->eye);
ADDRLP4 4
INDIRP4
CNSTI4 1744
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 723
;723:	bs->eye[2] += bs->cur_ps.viewheight;
ADDRLP4 1060
ADDRLP4 4
INDIRP4
CNSTI4 1752
ADDP4
ASGNP4
ADDRLP4 1060
INDIRP4
ADDRLP4 1060
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 729
;724:	//get the area the bot is in
;725:
;726:#ifdef _DEBUG
;727:	start = trap_Milliseconds();
;728:#endif
;729:	StandardBotAI(bs, thinktime);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 StandardBotAI
CALLV
pop
line 742
;730:#ifdef _DEBUG
;731:	end = trap_Milliseconds();
;732:
;733:	trap_Cvar_Update(&bot_debugmessages);
;734:
;735:	if (bot_debugmessages.integer)
;736:	{
;737:		Com_Printf("Single AI frametime: %i\n", (end - start));
;738:	}
;739:#endif
;740:
;741:	//subtract the delta angles
;742:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $358
line 743
;743:		bs->viewangles[j] = AngleMod(bs->viewangles[j] - SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 1064
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1072
ADDRLP4 1064
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 1072
INDIRP4
INDIRF4
CNSTF4 1001652224
ADDRLP4 1064
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
ADDP4
INDIRI4
CVIF4 4
MULF4
SUBF4
ARGF4
ADDRLP4 1076
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1072
INDIRP4
ADDRLP4 1076
INDIRF4
ASGNF4
line 744
;744:	}
LABELV $359
line 742
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $358
line 746
;745:	//everything was ok
;746:	return qtrue;
CNSTI4 1
RETI4
LABELV $332
endproc BotAI 1080 12
export BotScheduleBotThink
proc BotScheduleBotThink 12 0
line 754
;747:}
;748:
;749:/*
;750:==================
;751:BotScheduleBotThink
;752:==================
;753:*/
;754:void BotScheduleBotThink(void) {
line 757
;755:	int i, botnum;
;756:
;757:	botnum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 759
;758:
;759:	for( i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $363
line 760
;760:		if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $369
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $367
LABELV $369
line 761
;761:			continue;
ADDRGP4 $364
JUMPV
LABELV $367
line 764
;762:		}
;763:		//initialize the bot think residual time
;764:		botstates[i]->botthink_residual = BOT_THINK_TIME * botnum / numbots;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 numbots
INDIRI4
DIVI4
ASGNI4
line 765
;765:		botnum++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 766
;766:	}
LABELV $364
line 759
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $363
line 767
;767:}
LABELV $362
endproc BotScheduleBotThink 12 0
export PlayersInGame
proc PlayersInGame 24 0
line 770
;768:
;769:int PlayersInGame(void)
;770:{
line 771
;771:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 773
;772:	gentity_t *ent;
;773:	int pl = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $372
JUMPV
LABELV $371
line 776
;774:
;775:	while (i < MAX_CLIENTS)
;776:	{
line 777
;777:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 852
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 779
;778:
;779:		if (ent && ent->client && ent->client->pers.connected == CON_CONNECTED)
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $374
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $374
ADDRLP4 20
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $374
line 780
;780:		{
line 781
;781:			pl++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 782
;782:		}
LABELV $374
line 784
;783:
;784:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 785
;785:	}
LABELV $372
line 775
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $371
line 787
;786:
;787:	return pl;
ADDRLP4 8
INDIRI4
RETI4
LABELV $370
endproc PlayersInGame 24 0
export BotAISetupClient
proc BotAISetupClient 32 12
line 795
;788:}
;789:
;790:/*
;791:==============
;792:BotAISetupClient
;793:==============
;794:*/
;795:int BotAISetupClient(int client, struct bot_settings_s *settings, qboolean restart) {
line 798
;796:	bot_state_t *bs;
;797:
;798:	if (!botstates[client]) botstates[client] = B_Alloc(sizeof(bot_state_t)); //G_Alloc(sizeof(bot_state_t));
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $377
CNSTI4 4808
ARGI4
ADDRLP4 4
ADDRGP4 B_Alloc
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
LABELV $377
line 801
;799:																			  //rww - G_Alloc bad! B_Alloc good.
;800:
;801:	memset(botstates[client], 0, sizeof(bot_state_t));
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4808
ARGI4
ADDRGP4 memset
CALLP4
pop
line 803
;802:
;803:	bs = botstates[client];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 805
;804:
;805:	if (bs && bs->inuse) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $379
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $379
line 806
;806:		BotAI_Print(PRT_FATAL, "BotAISetupClient: client %d already setup\n", client);
CNSTI4 4
ARGI4
ADDRGP4 $381
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 807
;807:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $376
JUMPV
LABELV $379
line 810
;808:	}
;809:
;810:	memcpy(&bs->settings, settings, sizeof(bot_settings_t));
ADDRLP4 0
INDIRP4
CNSTI4 1424
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 292
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 812
;811:
;812:	bs->client = client; //need to know the client number before doing personality stuff
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 815
;813:
;814:	//initialize weapon weight defaults..
;815:	bs->botWeaponWeights[WP_NONE] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2624
ADDP4
CNSTF4 0
ASGNF4
line 816
;816:	bs->botWeaponWeights[WP_STUN_BATON] = 1;
ADDRLP4 0
INDIRP4
CNSTI4 2628
ADDP4
CNSTF4 1065353216
ASGNF4
line 817
;817:	bs->botWeaponWeights[WP_SABER] = 10;
ADDRLP4 0
INDIRP4
CNSTI4 2632
ADDP4
CNSTF4 1092616192
ASGNF4
line 818
;818:	bs->botWeaponWeights[WP_BRYAR_PISTOL] = 11;
ADDRLP4 0
INDIRP4
CNSTI4 2636
ADDP4
CNSTF4 1093664768
ASGNF4
line 819
;819:	bs->botWeaponWeights[WP_BLASTER] = 12;
ADDRLP4 0
INDIRP4
CNSTI4 2640
ADDP4
CNSTF4 1094713344
ASGNF4
line 820
;820:	bs->botWeaponWeights[WP_DISRUPTOR] = 13;
ADDRLP4 0
INDIRP4
CNSTI4 2644
ADDP4
CNSTF4 1095761920
ASGNF4
line 821
;821:	bs->botWeaponWeights[WP_BOWCASTER] = 14;
ADDRLP4 0
INDIRP4
CNSTI4 2648
ADDP4
CNSTF4 1096810496
ASGNF4
line 822
;822:	bs->botWeaponWeights[WP_REPEATER] = 15;
ADDRLP4 0
INDIRP4
CNSTI4 2652
ADDP4
CNSTF4 1097859072
ASGNF4
line 823
;823:	bs->botWeaponWeights[WP_DEMP2] = 16;
ADDRLP4 0
INDIRP4
CNSTI4 2656
ADDP4
CNSTF4 1098907648
ASGNF4
line 824
;824:	bs->botWeaponWeights[WP_FLECHETTE] = 17;
ADDRLP4 0
INDIRP4
CNSTI4 2660
ADDP4
CNSTF4 1099431936
ASGNF4
line 825
;825:	bs->botWeaponWeights[WP_ROCKET_LAUNCHER] = 18;
ADDRLP4 0
INDIRP4
CNSTI4 2664
ADDP4
CNSTF4 1099956224
ASGNF4
line 826
;826:	bs->botWeaponWeights[WP_THERMAL] = 14;
ADDRLP4 0
INDIRP4
CNSTI4 2668
ADDP4
CNSTF4 1096810496
ASGNF4
line 827
;827:	bs->botWeaponWeights[WP_TRIP_MINE] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2672
ADDP4
CNSTF4 0
ASGNF4
line 828
;828:	bs->botWeaponWeights[WP_DET_PACK] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2676
ADDP4
CNSTF4 0
ASGNF4
line 830
;829:
;830:	BotUtilizePersonality(bs);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BotUtilizePersonality
CALLV
pop
line 832
;831:
;832:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $382
line 833
;833:	{
line 834
;834:		bs->botWeaponWeights[WP_SABER] = 13;
ADDRLP4 0
INDIRP4
CNSTI4 2632
ADDP4
CNSTF4 1095761920
ASGNF4
line 835
;835:	}
LABELV $382
line 838
;836:
;837:	//allocate a goal state
;838:	bs->gs = trap_BotAllocGoalState(client);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 trap_BotAllocGoalState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1772
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 841
;839:
;840:	//allocate a weapon state
;841:	bs->ws = trap_BotAllocWeaponState();
ADDRLP4 16
ADDRGP4 trap_BotAllocWeaponState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1776
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 843
;842:
;843:	bs->inuse = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1
ASGNI4
line 844
;844:	bs->entitynum = client;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 845
;845:	bs->setupcount = 4;
ADDRLP4 0
INDIRP4
CNSTI4 1756
ADDP4
CNSTI4 4
ASGNI4
line 846
;846:	bs->entergame_time = FloatTime();
ADDRLP4 0
INDIRP4
CNSTI4 1764
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 847
;847:	bs->ms = trap_BotAllocMoveState();
ADDRLP4 20
ADDRGP4 trap_BotAllocMoveState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1768
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 848
;848:	numbots++;
ADDRLP4 24
ADDRGP4 numbots
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 851
;849:
;850:	//NOTE: reschedule the bot thinking
;851:	BotScheduleBotThink();
ADDRGP4 BotScheduleBotThink
CALLV
pop
line 853
;852:
;853:	if (PlayersInGame())
ADDRLP4 28
ADDRGP4 PlayersInGame
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $385
line 854
;854:	{ //don't talk to yourself
line 855
;855:		BotDoChat(bs, "GeneralGreetings", 0);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $387
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 856
;856:	}
LABELV $385
line 858
;857:
;858:	return qtrue;
CNSTI4 1
RETI4
LABELV $376
endproc BotAISetupClient 32 12
export BotAIShutdownClient
proc BotAIShutdownClient 12 12
line 866
;859:}
;860:
;861:/*
;862:==============
;863:BotAIShutdownClient
;864:==============
;865:*/
;866:int BotAIShutdownClient(int client, qboolean restart) {
line 869
;867:	bot_state_t *bs;
;868:
;869:	bs = botstates[client];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 870
;870:	if (!bs || !bs->inuse) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $391
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $389
LABELV $391
line 872
;871:		//BotAI_Print(PRT_ERROR, "BotAIShutdownClient: client %d already shutdown\n", client);
;872:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $388
JUMPV
LABELV $389
line 875
;873:	}
;874:
;875:	trap_BotFreeMoveState(bs->ms);
ADDRLP4 0
INDIRP4
CNSTI4 1768
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeMoveState
CALLV
pop
line 877
;876:	//free the goal state`			
;877:	trap_BotFreeGoalState(bs->gs);
ADDRLP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeGoalState
CALLV
pop
line 879
;878:	//free the weapon weights
;879:	trap_BotFreeWeaponState(bs->ws);
ADDRLP4 0
INDIRP4
CNSTI4 1776
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeWeaponState
CALLV
pop
line 882
;880:	//
;881:	//clear the bot state
;882:	memset(bs, 0, sizeof(bot_state_t));
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4808
ARGI4
ADDRGP4 memset
CALLP4
pop
line 884
;883:	//set the inuse flag to qfalse
;884:	bs->inuse = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 886
;885:	//there's one bot less
;886:	numbots--;
ADDRLP4 8
ADDRGP4 numbots
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 888
;887:	//everything went ok
;888:	return qtrue;
CNSTI4 1
RETI4
LABELV $388
endproc BotAIShutdownClient 12 12
export BotResetState
proc BotResetState 1700 12
line 899
;889:}
;890:
;891:/*
;892:==============
;893:BotResetState
;894:
;895:called when a bot enters the intermission or observer mode and
;896:when the level is changed
;897:==============
;898:*/
;899:void BotResetState(bot_state_t *bs) {
line 907
;900:	int client, entitynum, inuse;
;901:	int movestate, goalstate, weaponstate;
;902:	bot_settings_t settings;
;903:	playerState_t ps;							//current player state
;904:	float entergame_time;
;905:
;906:	//save some things that should not be reset here
;907:	memcpy(&settings, &bs->settings, sizeof(bot_settings_t));
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1424
ADDP4
ARGP4
CNSTI4 292
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 908
;908:	memcpy(&ps, &bs->cur_ps, sizeof(playerState_t));
ADDRLP4 316
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ARGP4
CNSTI4 1380
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 909
;909:	inuse = bs->inuse;
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 910
;910:	client = bs->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 911
;911:	entitynum = bs->entitynum;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 912
;912:	movestate = bs->ms;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1768
ADDP4
INDIRI4
ASGNI4
line 913
;913:	goalstate = bs->gs;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRI4
ASGNI4
line 914
;914:	weaponstate = bs->ws;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 1776
ADDP4
INDIRI4
ASGNI4
line 915
;915:	entergame_time = bs->entergame_time;
ADDRLP4 1696
ADDRFP4 0
INDIRP4
CNSTI4 1764
ADDP4
INDIRF4
ASGNF4
line 917
;916:	//reset the whole state
;917:	memset(bs, 0, sizeof(bot_state_t));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4808
ARGI4
ADDRGP4 memset
CALLP4
pop
line 919
;918:	//copy back some state stuff that should not be reset
;919:	bs->ms = movestate;
ADDRFP4 0
INDIRP4
CNSTI4 1768
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 920
;920:	bs->gs = goalstate;
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 921
;921:	bs->ws = weaponstate;
ADDRFP4 0
INDIRP4
CNSTI4 1776
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 922
;922:	memcpy(&bs->cur_ps, &ps, sizeof(playerState_t));
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRLP4 316
ARGP4
CNSTI4 1380
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 923
;923:	memcpy(&bs->settings, &settings, sizeof(bot_settings_t));
ADDRFP4 0
INDIRP4
CNSTI4 1424
ADDP4
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 292
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 924
;924:	bs->inuse = inuse;
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 925
;925:	bs->client = client;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 926
;926:	bs->entitynum = entitynum;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 927
;927:	bs->entergame_time = entergame_time;
ADDRFP4 0
INDIRP4
CNSTI4 1764
ADDP4
ADDRLP4 1696
INDIRF4
ASGNF4
line 929
;928:	//reset several states
;929:	if (bs->ms) trap_BotResetMoveState(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 1768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $393
ADDRFP4 0
INDIRP4
CNSTI4 1768
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetMoveState
CALLV
pop
LABELV $393
line 930
;930:	if (bs->gs) trap_BotResetGoalState(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRI4
CNSTI4 0
EQI4 $395
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetGoalState
CALLV
pop
LABELV $395
line 931
;931:	if (bs->ws) trap_BotResetWeaponState(bs->ws);
ADDRFP4 0
INDIRP4
CNSTI4 1776
ADDP4
INDIRI4
CNSTI4 0
EQI4 $397
ADDRFP4 0
INDIRP4
CNSTI4 1776
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetWeaponState
CALLV
pop
LABELV $397
line 932
;932:	if (bs->gs) trap_BotResetAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRI4
CNSTI4 0
EQI4 $399
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidGoals
CALLV
pop
LABELV $399
line 933
;933:	if (bs->ms) trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 1768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $401
ADDRFP4 0
INDIRP4
CNSTI4 1768
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
LABELV $401
line 934
;934:}
LABELV $392
endproc BotResetState 1700 12
export BotAILoadMap
proc BotAILoadMap 8 4
line 941
;935:
;936:/*
;937:==============
;938:BotAILoadMap
;939:==============
;940:*/
;941:int BotAILoadMap( int restart ) {
line 944
;942:	int			i;
;943:
;944:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $404
line 945
;945:		if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $408
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $408
line 946
;946:			BotResetState( botstates[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotResetState
CALLV
pop
line 947
;947:			botstates[i]->setupcount = 4;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 1756
ADDP4
CNSTI4 4
ASGNI4
line 948
;948:		}
LABELV $408
line 949
;949:	}
LABELV $405
line 944
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $404
line 951
;950:
;951:	return qtrue;
CNSTI4 1
RETI4
LABELV $403
endproc BotAILoadMap 8 4
export OrgVisible
proc OrgVisible 1084 28
line 956
;952:}
;953:
;954://rww - bot ai
;955:int OrgVisible(vec3_t org1, vec3_t org2, int ignore)
;956:{
line 959
;957:	trace_t tr;
;958:
;959:	trap_Trace(&tr, org1, NULL, NULL, org2, ignore, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1080
CNSTP4 0
ASGNP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 961
;960:
;961:	if (tr.fraction == 1)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $411
line 962
;962:	{
line 963
;963:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $410
JUMPV
LABELV $411
line 966
;964:	}
;965:
;966:	return 0;
CNSTI4 0
RETI4
LABELV $410
endproc OrgVisible 1084 28
export WPOrgVisible
proc WPOrgVisible 1104 28
line 970
;967:}
;968:
;969:int WPOrgVisible(gentity_t *bot, vec3_t org1, vec3_t org2, int ignore)
;970:{
line 974
;971:	trace_t tr;
;972:	gentity_t *ownent;
;973:
;974:	trap_Trace(&tr, org1, NULL, NULL, org2, ignore, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1084
CNSTP4 0
ASGNP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 976
;975:
;976:	if (tr.fraction == 1)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $415
line 977
;977:	{
line 978
;978:		trap_Trace(&tr, org1, NULL, NULL, org2, ignore, MASK_PLAYERSOLID);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1088
CNSTP4 0
ASGNP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 980
;979:
;980:		if (tr.fraction != 1 && tr.entityNum != ENTITYNUM_NONE && g_entities[tr.entityNum].s.eType == ET_SPECIAL)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $418
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
EQI4 $418
CNSTI4 852
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 4
NEI4 $418
line 981
;981:		{
line 982
;982:			if (g_entities[tr.entityNum].parent && g_entities[tr.entityNum].parent->client)
ADDRLP4 1092
CNSTI4 852
ASGNI4
ADDRLP4 1096
CNSTU4 0
ASGNU4
ADDRLP4 1092
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+536
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1096
INDIRU4
EQU4 $424
ADDRLP4 1092
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+536
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1096
INDIRU4
EQU4 $424
line 983
;983:			{
line 984
;984:				ownent = g_entities[tr.entityNum].parent;
ADDRLP4 1080
CNSTI4 852
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+536
ADDP4
INDIRP4
ASGNP4
line 986
;985:
;986:				if (OnSameTeam(bot, ownent) || bot->s.number == ownent->s.number)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $434
ADDRFP4 0
INDIRP4
INDIRI4
ADDRLP4 1080
INDIRP4
INDIRI4
NEI4 $432
LABELV $434
line 987
;987:				{
line 988
;988:					return 1;
CNSTI4 1
RETI4
ADDRGP4 $414
JUMPV
LABELV $432
line 990
;989:				}
;990:			}
LABELV $424
line 991
;991:			return 2;
CNSTI4 2
RETI4
ADDRGP4 $414
JUMPV
LABELV $418
line 994
;992:		}
;993:
;994:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $414
JUMPV
LABELV $415
line 997
;995:	}
;996:
;997:	return 0;
CNSTI4 0
RETI4
LABELV $414
endproc WPOrgVisible 1104 28
export OrgVisibleBox
proc OrgVisibleBox 1084 28
line 1001
;998:}
;999:
;1000:int OrgVisibleBox(vec3_t org1, vec3_t mins, vec3_t maxs, vec3_t org2, int ignore)
;1001:{
line 1004
;1002:	trace_t tr;
;1003:
;1004:	trap_Trace(&tr, org1, mins, maxs, org2, ignore, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1006
;1005:
;1006:	if (tr.fraction == 1 && !tr.startsolid && !tr.allsolid)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $436
ADDRLP4 1080
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1080
INDIRI4
NEI4 $436
ADDRLP4 0
INDIRI4
ADDRLP4 1080
INDIRI4
NEI4 $436
line 1007
;1007:	{
line 1008
;1008:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $435
JUMPV
LABELV $436
line 1011
;1009:	}
;1010:
;1011:	return 0;
CNSTI4 0
RETI4
LABELV $435
endproc OrgVisibleBox 1084 28
export CheckForFunc
proc CheckForFunc 1104 28
line 1015
;1012:}
;1013:
;1014:int CheckForFunc(vec3_t org, int ignore)
;1015:{
line 1020
;1016:	gentity_t *fent;
;1017:	vec3_t under;
;1018:	trace_t tr;
;1019:
;1020:	VectorCopy(org, under);
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1022
;1021:
;1022:	under[2] -= 64;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 1024
;1023:
;1024:	trap_Trace(&tr, org, NULL, NULL, under, ignore, MASK_SOLID);
ADDRLP4 16
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1096
CNSTP4 0
ASGNP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1026
;1025:
;1026:	if (tr.fraction == 1)
ADDRLP4 16+8
INDIRF4
CNSTF4 1065353216
NEF4 $442
line 1027
;1027:	{
line 1028
;1028:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $440
JUMPV
LABELV $442
line 1031
;1029:	}
;1030:
;1031:	fent = &g_entities[tr.entityNum];
ADDRLP4 0
CNSTI4 852
ADDRLP4 16+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1033
;1032:
;1033:	if (!fent)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $446
line 1034
;1034:	{
line 1035
;1035:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $440
JUMPV
LABELV $446
line 1038
;1036:	}
;1037:
;1038:	if (strstr(fent->classname, "func_"))
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 $450
ARGP4
ADDRLP4 1100
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 1100
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $448
line 1039
;1039:	{
line 1040
;1040:		return 1; //there's a func brush here
CNSTI4 1
RETI4
ADDRGP4 $440
JUMPV
LABELV $448
line 1043
;1041:	}
;1042:
;1043:	return 0;
CNSTI4 0
RETI4
LABELV $440
endproc CheckForFunc 1104 28
export GetNearestVisibleWP
proc GetNearestVisibleWP 84 20
line 1047
;1044:}
;1045:
;1046:int GetNearestVisibleWP(vec3_t org, int ignore)
;1047:{
line 1054
;1048:	int i;
;1049:	float bestdist;
;1050:	float flLen;
;1051:	int bestindex;
;1052:	vec3_t a, mins, maxs;
;1053:
;1054:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1055
;1055:	bestdist = 800;//99999;
ADDRLP4 20
CNSTF4 1145569280
ASGNF4
line 1057
;1056:			   //don't trace over 800 units away to avoid GIANT HORRIBLE SPEED HITS ^_^
;1057:	bestindex = -1;
ADDRLP4 48
CNSTI4 -1
ASGNI4
line 1059
;1058:
;1059:	mins[0] = -15;
ADDRLP4 24
CNSTF4 3245342720
ASGNF4
line 1060
;1060:	mins[1] = -15;
ADDRLP4 24+4
CNSTF4 3245342720
ASGNF4
line 1061
;1061:	mins[2] = -1;
ADDRLP4 24+8
CNSTF4 3212836864
ASGNF4
line 1062
;1062:	maxs[0] = 15;
ADDRLP4 36
CNSTF4 1097859072
ASGNF4
line 1063
;1063:	maxs[1] = 15;
ADDRLP4 36+4
CNSTF4 1097859072
ASGNF4
line 1064
;1064:	maxs[2] = 1;
ADDRLP4 36+8
CNSTF4 1065353216
ASGNF4
ADDRGP4 $457
JUMPV
LABELV $456
line 1067
;1065:
;1066:	while (i < gWPNum)
;1067:	{
line 1068
;1068:		if (gWPArray[i] && gWPArray[i]->inuse)
ADDRLP4 52
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $459
ADDRLP4 52
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $459
line 1069
;1069:		{
line 1070
;1070:			VectorSubtract(org, gWPArray[i]->origin, a);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 60
INDIRP4
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64
CNSTI4 4
ASGNI4
ADDRLP4 4+4
ADDRLP4 56
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68
CNSTI4 8
ASGNI4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1071
;1071:			flLen = VectorLength(a);
ADDRLP4 4
ARGP4
ADDRLP4 72
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 72
INDIRF4
ASGNF4
line 1073
;1072:
;1073:			if (flLen < bestdist && trap_InPVS(org, gWPArray[i]->origin) && OrgVisibleBox(org, mins, maxs, gWPArray[i]->origin, ignore))
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
GEF4 $463
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $463
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 OrgVisibleBox
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $463
line 1074
;1074:			{
line 1075
;1075:				bestdist = flLen;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 1076
;1076:				bestindex = i;
ADDRLP4 48
ADDRLP4 0
INDIRI4
ASGNI4
line 1077
;1077:			}
LABELV $463
line 1078
;1078:		}
LABELV $459
line 1080
;1079:
;1080:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1081
;1081:	}
LABELV $457
line 1066
ADDRLP4 0
INDIRI4
ADDRGP4 gWPNum
INDIRI4
LTI4 $456
line 1083
;1082:
;1083:	return bestindex;
ADDRLP4 48
INDIRI4
RETI4
LABELV $451
endproc GetNearestVisibleWP 84 20
export PassWayCheck
proc PassWayCheck 32 0
line 1091
;1084:}
;1085:
;1086://wpDirection
;1087://0 == FORWARD
;1088://1 == BACKWARD
;1089:
;1090:int PassWayCheck(bot_state_t *bs, int windex)
;1091:{
line 1092
;1092:	if (!gWPArray[windex] || !gWPArray[windex]->inuse)
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $468
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $466
LABELV $468
line 1093
;1093:	{
line 1094
;1094:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $465
JUMPV
LABELV $466
line 1097
;1095:	}
;1096:
;1097:	if (bs->wpDirection && (gWPArray[windex]->flags & WPFLAG_ONEWAY_FWD))
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $469
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $469
line 1098
;1098:	{
line 1099
;1099:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $465
JUMPV
LABELV $469
line 1101
;1100:	}
;1101:	else if (!bs->wpDirection && (gWPArray[windex]->flags & WPFLAG_ONEWAY_BACK))
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $471
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $471
line 1102
;1102:	{
line 1103
;1103:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $465
JUMPV
LABELV $471
line 1106
;1104:	}
;1105:
;1106:	if (bs->wpCurrent && gWPArray[windex]->forceJumpTo &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $473
ADDRLP4 20
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $473
ADDRLP4 28
CNSTI4 8
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
CNSTF4 1115684864
ADDF4
LEF4 $473
ADDRLP4 12
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
GEI4 $473
line 1109
;1107:		gWPArray[windex]->origin[2] > (bs->wpCurrent->origin[2]+64) &&
;1108:		bs->cur_ps.fd.forcePowerLevel[FP_LEVITATION] < gWPArray[windex]->forceJumpTo)
;1109:	{
line 1110
;1110:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $465
JUMPV
LABELV $473
line 1113
;1111:	}
;1112:
;1113:	return 1;
CNSTI4 1
RETI4
LABELV $465
endproc PassWayCheck 32 0
export TotalTrailDistance
proc TotalTrailDistance 40 0
line 1117
;1114:}
;1115:
;1116:float TotalTrailDistance(int start, int end, bot_state_t *bs)
;1117:{
line 1121
;1118:	int beginat;
;1119:	int endat;
;1120:	float distancetotal;
;1121:	float gdif = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1123
;1122:
;1123:	distancetotal = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 1125
;1124:
;1125:	if (start > end)
ADDRFP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LEI4 $476
line 1126
;1126:	{
line 1127
;1127:		beginat = end;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 1128
;1128:		endat = start;
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
line 1129
;1129:	}
ADDRGP4 $479
JUMPV
LABELV $476
line 1131
;1130:	else
;1131:	{
line 1132
;1132:		beginat = start;
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
line 1133
;1133:		endat = end;
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
line 1134
;1134:	}
ADDRGP4 $479
JUMPV
LABELV $478
line 1137
;1135:
;1136:	while (beginat < endat)
;1137:	{
line 1138
;1138:		if (beginat >= gWPNum || !gWPArray[beginat] || !gWPArray[beginat]->inuse)
ADDRLP4 0
INDIRI4
ADDRGP4 gWPNum
INDIRI4
GEI4 $484
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $484
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $481
LABELV $484
line 1139
;1139:		{
line 1140
;1140:			return -1; //error
CNSTF4 3212836864
RETF4
ADDRGP4 $475
JUMPV
LABELV $481
line 1143
;1141:		}
;1142:
;1143:		if ((end > start && gWPArray[beginat]->flags & WPFLAG_ONEWAY_BACK) ||
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRI4
LEI4 $488
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
NEI4 $487
LABELV $488
ADDRFP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LEI4 $485
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $485
LABELV $487
line 1145
;1144:			(start > end && gWPArray[beginat]->flags & WPFLAG_ONEWAY_FWD))
;1145:		{
line 1146
;1146:			return -1;
CNSTF4 3212836864
RETF4
ADDRGP4 $475
JUMPV
LABELV $485
line 1149
;1147:		}
;1148:	
;1149:		if (gWPArray[beginat]->forceJumpTo)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
EQI4 $489
line 1150
;1150:		{
line 1151
;1151:			if (gWPArray[beginat-1] && gWPArray[beginat-1]->origin[2]+64 < gWPArray[beginat]->origin[2])
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $491
ADDRLP4 28
CNSTI4 8
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
CNSTF4 1115684864
ADDF4
ADDRLP4 24
INDIRI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
GEF4 $491
line 1152
;1152:			{
line 1153
;1153:				gdif = gWPArray[beginat]->origin[2] - gWPArray[beginat-1]->origin[2];
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 36
CNSTI4 8
ASGNI4
ADDRLP4 12
ADDRLP4 32
INDIRI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 32
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1154
;1154:			}
LABELV $491
line 1156
;1155:
;1156:			if (gdif)
ADDRLP4 12
INDIRF4
CNSTF4 0
EQF4 $496
line 1157
;1157:			{
line 1162
;1158:			//	if (bs && bs->cur_ps.fd.forcePowerLevel[FP_LEVITATION] < gWPArray[beginat]->forceJumpTo)
;1159:			//	{
;1160:			//		return -1;
;1161:			//	}
;1162:			}
LABELV $496
line 1163
;1163:		}
LABELV $489
line 1172
;1164:		
;1165:	/*	if (bs->wpCurrent && gWPArray[windex]->forceJumpTo &&
;1166:			gWPArray[windex]->origin[2] > (bs->wpCurrent->origin[2]+64) &&
;1167:			bs->cur_ps.fd.forcePowerLevel[FP_LEVITATION] < gWPArray[windex]->forceJumpTo)
;1168:		{
;1169:			return -1;
;1170:		}*/
;1171:
;1172:		distancetotal += gWPArray[beginat]->disttonext;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1174
;1173:
;1174:		beginat++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1175
;1175:	}
LABELV $479
line 1136
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $478
line 1177
;1176:
;1177:	return distancetotal;
ADDRLP4 4
INDIRF4
RETF4
LABELV $475
endproc TotalTrailDistance 40 0
export CheckForShorterRoutes
proc CheckForShorterRoutes 40 12
line 1181
;1178:}
;1179:
;1180:void CheckForShorterRoutes(bot_state_t *bs, int newwpindex)
;1181:{
line 1188
;1182:	float bestlen;
;1183:	float checklen;
;1184:	int bestindex;
;1185:	int i;
;1186:	int fj;
;1187:
;1188:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1189
;1189:	fj = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1191
;1190:
;1191:	if (!bs->wpDestination)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $499
line 1192
;1192:	{
line 1193
;1193:		return;
ADDRGP4 $498
JUMPV
LABELV $499
line 1196
;1194:	}
;1195:
;1196:	if (newwpindex < bs->wpDestination->index)
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
GEI4 $501
line 1197
;1197:	{
line 1198
;1198:		bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 1199
;1199:	}
ADDRGP4 $502
JUMPV
LABELV $501
line 1200
;1200:	else if (newwpindex > bs->wpDestination->index)
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
LEI4 $503
line 1201
;1201:	{
line 1202
;1202:		bs->wpDirection = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 1
ASGNI4
line 1203
;1203:	}
LABELV $503
LABELV $502
line 1205
;1204:
;1205:	if (bs->wpSwitchTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1984
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $505
line 1206
;1206:	{
line 1207
;1207:		return;
ADDRGP4 $498
JUMPV
LABELV $505
line 1210
;1208:	}
;1209:
;1210:	if (!gWPArray[newwpindex]->neighbornum)
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 0
NEI4 $508
line 1211
;1211:	{
line 1212
;1212:		return;
ADDRGP4 $498
JUMPV
LABELV $508
line 1215
;1213:	}
;1214:
;1215:	bestindex = newwpindex;
ADDRLP4 12
ADDRFP4 4
INDIRI4
ASGNI4
line 1216
;1216:	bestlen = TotalTrailDistance(newwpindex, bs->wpDestination->index, bs);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRGP4 $511
JUMPV
LABELV $510
line 1219
;1217:
;1218:	while (i < gWPArray[newwpindex]->neighbornum)
;1219:	{
line 1220
;1220:		checklen = TotalTrailDistance(gWPArray[newwpindex]->neighbors[i].num, bs->wpDestination->index, bs);
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 32
INDIRF4
ASGNF4
line 1222
;1221:
;1222:		if (checklen < bestlen-64 || bestlen == -1)
ADDRLP4 8
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1115684864
SUBF4
LTF4 $515
ADDRLP4 4
INDIRF4
CNSTF4 3212836864
NEF4 $513
LABELV $515
line 1223
;1223:		{
line 1224
;1224:			if (bs->cur_ps.fd.forcePowerLevel[FP_LEVITATION] >= gWPArray[newwpindex]->neighbors[i].forceJumpTo)
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $516
line 1225
;1225:			{
line 1226
;1226:				bestlen = checklen;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 1227
;1227:				bestindex = gWPArray[newwpindex]->neighbors[i].num;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1229
;1228:
;1229:				if (gWPArray[newwpindex]->neighbors[i].forceJumpTo)
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $518
line 1230
;1230:				{
line 1231
;1231:					fj = gWPArray[newwpindex]->neighbors[i].forceJumpTo;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1232
;1232:				}
ADDRGP4 $519
JUMPV
LABELV $518
line 1234
;1233:				else
;1234:				{
line 1235
;1235:					fj = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1236
;1236:				}
LABELV $519
line 1237
;1237:			}
LABELV $516
line 1238
;1238:		}
LABELV $513
line 1240
;1239:
;1240:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1241
;1241:	}
LABELV $511
line 1218
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LTI4 $510
line 1243
;1242:
;1243:	if (bestindex != newwpindex && bestindex != -1)
ADDRLP4 12
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $520
ADDRLP4 12
INDIRI4
CNSTI4 -1
EQI4 $520
line 1244
;1244:	{
line 1245
;1245:		bs->wpCurrent = gWPArray[bestindex];
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 1246
;1246:		bs->wpSwitchTime = level.time + 3000;
ADDRFP4 0
INDIRP4
CNSTI4 1984
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
CVIF4 4
ASGNF4
line 1248
;1247:
;1248:		if (fj)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $523
line 1249
;1249:		{
line 1251
;1250:#ifndef FORCEJUMP_INSTANTMETHOD
;1251:			bs->forceJumpChargeTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1252
;1252:			bs->beStill = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 1253
;1253:			bs->forceJumping = bs->forceJumpChargeTime;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 2024
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1260
;1254:#else
;1255:			bs->beStill = level.time + 500;
;1256:			bs->jumpTime = level.time + fj*1200;
;1257:			bs->jDelay = level.time + 200;
;1258:			bs->forceJumping = bs->jumpTime;
;1259:#endif
;1260:		}
LABELV $523
line 1261
;1261:	}
LABELV $520
line 1262
;1262:}
LABELV $498
endproc CheckForShorterRoutes 40 12
export WPConstantRoutine
proc WPConstantRoutine 24 0
line 1265
;1263:
;1264:void WPConstantRoutine(bot_state_t *bs)
;1265:{
line 1266
;1266:	if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $528
line 1267
;1267:	{
line 1268
;1268:		return;
ADDRGP4 $527
JUMPV
LABELV $528
line 1271
;1269:	}
;1270:
;1271:	if (bs->wpCurrent->flags & WPFLAG_DUCK)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $530
line 1272
;1272:	{
line 1273
;1273:		bs->duckTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2008
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 1274
;1274:	}
LABELV $530
line 1277
;1275:
;1276:#ifndef FORCEJUMP_INSTANTMETHOD
;1277:	if (bs->wpCurrent->flags & WPFLAG_JUMP)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $533
line 1278
;1278:	{
line 1279
;1279:		float heightDif = (bs->wpCurrent->origin[2] - bs->origin[2]+16);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1281
;1280:
;1281:		if (bs->origin[2]+16 >= bs->wpCurrent->origin[2])
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
ADDRLP4 8
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
LTF4 $535
line 1282
;1282:		{ //then why exactly would we be force jumping?
line 1283
;1283:			heightDif = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1284
;1284:		}
LABELV $535
line 1286
;1285:
;1286:		if (heightDif > 40 && (bs->cur_ps.fd.forcePowersKnown & (1 << FP_LEVITATION)) && (bs->cur_ps.fd.forceJumpCharge < (forceJumpStrength[bs->cur_ps.fd.forcePowerLevel[FP_LEVITATION]]-100) || bs->cur_ps.groundEntityNum == ENTITYNUM_NONE))
ADDRLP4 0
INDIRF4
CNSTF4 1109393408
LEF4 $537
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
BANDI4
CNSTI4 0
EQI4 $537
ADDRLP4 12
INDIRP4
CNSTI4 1112
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRGP4 forceJumpStrength
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
LTF4 $539
ADDRLP4 12
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $537
LABELV $539
line 1287
;1287:		{
line 1288
;1288:			bs->forceJumpChargeTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1289
;1289:			if (bs->cur_ps.groundEntityNum != ENTITYNUM_NONE && bs->jumpPrep < (level.time-300))
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $541
ADDRLP4 20
INDIRP4
CNSTI4 2020
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
SUBI4
CVIF4 4
GEF4 $541
line 1290
;1290:			{
line 1291
;1291:				bs->jumpPrep = level.time + 700;
ADDRFP4 0
INDIRP4
CNSTI4 2020
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 700
ADDI4
CVIF4 4
ASGNF4
line 1292
;1292:			}
LABELV $541
line 1293
;1293:			bs->beStill = level.time + 300;
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
ADDI4
CVIF4 4
ASGNF4
line 1294
;1294:			bs->jumpTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2012
ADDP4
CNSTF4 0
ASGNF4
line 1296
;1295:
;1296:			if (bs->wpSeenTime < (level.time + 600))
ADDRFP4 0
INDIRP4
CNSTI4 1972
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CNSTI4 600
ADDI4
CVIF4 4
GEF4 $538
line 1297
;1297:			{
line 1298
;1298:				bs->wpSeenTime = level.time + 600;
ADDRFP4 0
INDIRP4
CNSTI4 1972
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 600
ADDI4
CVIF4 4
ASGNF4
line 1299
;1299:			}
line 1300
;1300:		}
ADDRGP4 $538
JUMPV
LABELV $537
line 1301
;1301:		else if (heightDif > 64 && !(bs->cur_ps.fd.forcePowersKnown & (1 << FP_LEVITATION)))
ADDRLP4 0
INDIRF4
CNSTF4 1115684864
LEF4 $550
ADDRFP4 0
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $550
line 1302
;1302:		{ //this point needs force jump to reach and we don't have it
line 1304
;1303:			//Kill the current point and turn around
;1304:			bs->wpCurrent = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
CNSTP4 0
ASGNP4
line 1305
;1305:			if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $552
line 1306
;1306:			{
line 1307
;1307:				bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 1308
;1308:			}
ADDRGP4 $527
JUMPV
LABELV $552
line 1310
;1309:			else
;1310:			{
line 1311
;1311:				bs->wpDirection = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 1
ASGNI4
line 1312
;1312:			}
line 1314
;1313:
;1314:			return;
ADDRGP4 $527
JUMPV
LABELV $550
LABELV $538
line 1316
;1315:		}
;1316:	}
LABELV $533
line 1319
;1317:#endif
;1318:
;1319:	if (bs->wpCurrent->forceJumpTo)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
EQI4 $554
line 1320
;1320:	{
line 1327
;1321:#ifdef FORCEJUMP_INSTANTMETHOD
;1322:		if (bs->origin[2]+16 < bs->wpCurrent->origin[2])
;1323:		{
;1324:			bs->jumpTime = level.time + 100;
;1325:		}
;1326:#else
;1327:		float heightDif = (bs->wpCurrent->origin[2] - bs->origin[2]+16);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1329
;1328:
;1329:		if (bs->origin[2]+16 >= bs->wpCurrent->origin[2])
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
ADDRLP4 8
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
LTF4 $556
line 1330
;1330:		{ //then why exactly would we be force jumping?
line 1331
;1331:			heightDif = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1332
;1332:		}
LABELV $556
line 1334
;1333:
;1334:		if (bs->cur_ps.fd.forceJumpCharge < (forceJumpStrength[bs->cur_ps.fd.forcePowerLevel[FP_LEVITATION]]-100))
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1112
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceJumpStrength
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
GEF4 $558
line 1335
;1335:		{
line 1336
;1336:			bs->forceJumpChargeTime = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1337
;1337:		}
LABELV $558
line 1339
;1338:#endif
;1339:	}
LABELV $554
line 1340
;1340:}
LABELV $527
endproc WPConstantRoutine 24 0
export BotCTFGuardDuty
proc BotCTFGuardDuty 0 0
line 1343
;1341:
;1342:qboolean BotCTFGuardDuty(bot_state_t *bs)
;1343:{
line 1344
;1344:	if (g_gametype.integer != GT_CTF &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $562
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
EQI4 $562
line 1346
;1345:		g_gametype.integer != GT_CTY)
;1346:	{
line 1347
;1347:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $561
JUMPV
LABELV $562
line 1350
;1348:	}
;1349:
;1350:	if (bs->ctfState == CTFSTATE_DEFENDER)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 2
NEI4 $566
line 1351
;1351:	{
line 1352
;1352:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $561
JUMPV
LABELV $566
line 1355
;1353:	}
;1354:
;1355:	return qfalse;
CNSTI4 0
RETI4
LABELV $561
endproc BotCTFGuardDuty 0 0
export WPTouchRoutine
proc WPTouchRoutine 56 8
line 1359
;1356:}
;1357:
;1358:void WPTouchRoutine(bot_state_t *bs)
;1359:{
line 1362
;1360:	int lastNum;
;1361:
;1362:	if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $569
line 1363
;1363:	{
line 1364
;1364:		return;
ADDRGP4 $568
JUMPV
LABELV $569
line 1367
;1365:	}
;1366:
;1367:	bs->wpTravelTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 1976
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 1369
;1368:
;1369:	if (bs->wpCurrent->flags & WPFLAG_NOMOVEFUNC)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
CNSTI4 0
EQI4 $572
line 1370
;1370:	{
line 1371
;1371:		bs->noUseTime = level.time + 4000;
ADDRFP4 0
INDIRP4
CNSTI4 4800
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 4000
ADDI4
ASGNI4
line 1372
;1372:	}
LABELV $572
line 1381
;1373:
;1374:#ifdef FORCEJUMP_INSTANTMETHOD
;1375:	if ((bs->wpCurrent->flags & WPFLAG_JUMP) && bs->wpCurrent->forceJumpTo)
;1376:	{ //jump if we're flagged to but not if this indicates a force jump point. Force jumping is
;1377:	  //handled elsewhere.
;1378:		bs->jumpTime = level.time + 100;
;1379:	}
;1380:#else
;1381:	if ((bs->wpCurrent->flags & WPFLAG_JUMP) && !bs->wpCurrent->forceJumpTo)
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $575
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $575
line 1382
;1382:	{ //jump if we're flagged to but not if this indicates a force jump point. Force jumping is
line 1384
;1383:	  //handled elsewhere.
;1384:		bs->jumpTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2012
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 1385
;1385:	}
LABELV $575
line 1388
;1386:#endif
;1387:
;1388:	trap_Cvar_Update(&bot_camp);
ADDRGP4 bot_camp
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1390
;1389:
;1390:	if (bs->isCamper && bot_camp.integer && (BotIsAChickenWuss(bs) || BotCTFGuardDuty(bs) || bs->isCamper == 2) && ((bs->wpCurrent->flags & WPFLAG_SNIPEORCAMP) || (bs->wpCurrent->flags & WPFLAG_SNIPEORCAMPSTAND)) &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 2060
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $578
ADDRGP4 bot_camp+12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $578
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 BotIsAChickenWuss
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $582
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 BotCTFGuardDuty
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $582
ADDRFP4 0
INDIRP4
CNSTI4 2060
ADDP4
INDIRI4
CNSTI4 2
NEI4 $578
LABELV $582
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 32
INDIRI4
NEI4 $583
ADDRLP4 28
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 32
INDIRI4
EQI4 $578
LABELV $583
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 2
EQI4 $578
ADDRLP4 36
INDIRI4
CNSTI4 1
EQI4 $578
line 1392
;1391:		bs->cur_ps.weapon != WP_SABER && bs->cur_ps.weapon != WP_STUN_BATON)
;1392:	{ //if we're a camper and a chicken then camp
line 1393
;1393:		if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $584
line 1394
;1394:		{
line 1395
;1395:			lastNum = bs->wpCurrent->index+1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1396
;1396:		}
ADDRGP4 $585
JUMPV
LABELV $584
line 1398
;1397:		else
;1398:		{
line 1399
;1399:			lastNum = bs->wpCurrent->index-1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1400
;1400:		}
LABELV $585
line 1402
;1401:
;1402:		if (gWPArray[lastNum] && gWPArray[lastNum]->inuse && gWPArray[lastNum]->index && bs->isCamping < level.time)
ADDRLP4 40
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $579
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $579
ADDRLP4 40
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $579
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $579
line 1403
;1403:		{
line 1404
;1404:			bs->isCamping = level.time + rand()%15000 + 30000;
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 48
INDIRI4
CNSTI4 15000
MODI4
ADDI4
CNSTI4 30000
ADDI4
CVIF4 4
ASGNF4
line 1405
;1405:			bs->wpCamping = bs->wpCurrent;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 2068
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ASGNP4
line 1406
;1406:			bs->wpCampingTo = gWPArray[lastNum];
ADDRFP4 0
INDIRP4
CNSTI4 2072
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 1408
;1407:
;1408:			if (bs->wpCurrent->flags & WPFLAG_SNIPEORCAMPSTAND)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $590
line 1409
;1409:			{
line 1410
;1410:				bs->campStanding = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 2076
ADDP4
CNSTI4 1
ASGNI4
line 1411
;1411:			}
ADDRGP4 $579
JUMPV
LABELV $590
line 1413
;1412:			else
;1413:			{
line 1414
;1414:				bs->campStanding = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 2076
ADDP4
CNSTI4 0
ASGNI4
line 1415
;1415:			}
line 1416
;1416:		}
line 1418
;1417:
;1418:	}
ADDRGP4 $579
JUMPV
LABELV $578
line 1419
;1419:	else if ((bs->cur_ps.weapon == WP_SABER || bs->cur_ps.weapon == WP_STUN_BATON) &&
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 2
EQI4 $595
ADDRLP4 40
INDIRI4
CNSTI4 1
NEI4 $592
LABELV $595
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $592
line 1421
;1420:		bs->isCamping > level.time)
;1421:	{
line 1422
;1422:		bs->isCamping = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
CNSTF4 0
ASGNF4
line 1423
;1423:		bs->wpCampingTo = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2072
ADDP4
CNSTP4 0
ASGNP4
line 1424
;1424:		bs->wpCamping = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
CNSTP4 0
ASGNP4
line 1425
;1425:	}
LABELV $592
LABELV $579
line 1427
;1426:
;1427:	if (bs->wpDestination)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $596
line 1428
;1428:	{
line 1429
;1429:		if (bs->wpCurrent->index == bs->wpDestination->index)
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
CNSTI4 16
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRLP4 44
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
NEI4 $598
line 1430
;1430:		{
line 1431
;1431:			bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 1433
;1432:
;1433:			if (bs->runningLikeASissy)
ADDRFP4 0
INDIRP4
CNSTI4 2308
ADDP4
INDIRI4
CNSTI4 0
EQI4 $600
line 1434
;1434:			{ //this obviously means we're scared and running, so we'll want to keep our navigational priorities less delayed
line 1435
;1435:				bs->destinationGrabTime = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
line 1436
;1436:			}
ADDRGP4 $599
JUMPV
LABELV $600
line 1438
;1437:			else
;1438:			{
line 1439
;1439:				bs->destinationGrabTime = level.time + 3500;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3500
ADDI4
CVIF4 4
ASGNF4
line 1440
;1440:			}
line 1441
;1441:		}
ADDRGP4 $599
JUMPV
LABELV $598
line 1443
;1442:		else
;1443:		{
line 1444
;1444:			CheckForShorterRoutes(bs, bs->wpCurrent->index);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 CheckForShorterRoutes
CALLV
pop
line 1445
;1445:		}
LABELV $599
line 1446
;1446:	}
LABELV $596
line 1447
;1447:}
LABELV $568
endproc WPTouchRoutine 56 8
export MoveTowardIdealAngles
proc MoveTowardIdealAngles 4 0
line 1450
;1448:
;1449:void MoveTowardIdealAngles(bot_state_t *bs)
;1450:{
line 1451
;1451:	VectorCopy(bs->goalAngles, bs->ideal_viewangles);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1792
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1896
ADDP4
INDIRB
ASGNB 12
line 1452
;1452:}
LABELV $604
endproc MoveTowardIdealAngles 4 0
lit
align 4
LABELV $606
byte 4 3245342720
byte 4 3245342720
byte 4 3238002688
align 4
LABELV $607
byte 4 1097859072
byte 4 1097859072
byte 4 1109393408
export BotTrace_Strafe
code
proc BotTrace_Strafe 1200 28
line 1461
;1453:
;1454:#define BOT_STRAFE_AVOIDANCE
;1455:
;1456:#ifdef BOT_STRAFE_AVOIDANCE
;1457:#define STRAFEAROUND_RIGHT			1
;1458:#define STRAFEAROUND_LEFT			2
;1459:
;1460:int BotTrace_Strafe(bot_state_t *bs, vec3_t traceto)
;1461:{
line 1462
;1462:	vec3_t playerMins = {-15, -15, /*DEFAULT_MINS_2*/-8};
ADDRLP4 1140
ADDRGP4 $606
INDIRB
ASGNB 12
line 1463
;1463:	vec3_t playerMaxs = {15, 15, DEFAULT_MAXS_2};
ADDRLP4 1152
ADDRGP4 $607
INDIRB
ASGNB 12
line 1469
;1464:	vec3_t from, to;
;1465:	vec3_t dirAng, dirDif;
;1466:	vec3_t forward, right;
;1467:	trace_t tr;
;1468:
;1469:	if (bs->cur_ps.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $608
line 1470
;1470:	{ //don't do this in the air, it can be.. dangerous.
line 1471
;1471:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $605
JUMPV
LABELV $608
line 1474
;1472:	}
;1473:
;1474:	VectorSubtract(traceto, bs->origin, dirAng);
ADDRLP4 1176
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 1176
INDIRP4
INDIRF4
ADDRLP4 1180
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 1176
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1180
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1475
;1475:	VectorNormalize(dirAng);
ADDRLP4 36
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1476
;1476:	vectoangles(dirAng, dirAng);
ADDRLP4 36
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1478
;1477:
;1478:	if (AngleDifference(bs->viewangles[YAW], dirAng[YAW]) > 60 ||
ADDRFP4 0
INDIRP4
CNSTI4 1784
ADDP4
INDIRF4
ARGF4
ADDRLP4 36+4
INDIRF4
ARGF4
ADDRLP4 1184
ADDRGP4 AngleDifference
CALLF4
ASGNF4
ADDRLP4 1184
INDIRF4
CNSTF4 1114636288
GTF4 $616
ADDRFP4 0
INDIRP4
CNSTI4 1784
ADDP4
INDIRF4
ARGF4
ADDRLP4 36+4
INDIRF4
ARGF4
ADDRLP4 1188
ADDRGP4 AngleDifference
CALLF4
ASGNF4
ADDRLP4 1188
INDIRF4
CNSTF4 3262119936
GEF4 $612
LABELV $616
line 1480
;1479:		AngleDifference(bs->viewangles[YAW], dirAng[YAW]) < -60)
;1480:	{ //If we aren't facing the direction we're going here, then we've got enough excuse to be too stupid to strafe around anyway
line 1481
;1481:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $605
JUMPV
LABELV $612
line 1484
;1482:	}
;1483:
;1484:	VectorCopy(bs->origin, from);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 1485
;1485:	VectorCopy(traceto, to);
ADDRLP4 12
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1487
;1486:
;1487:	VectorSubtract(to, from, dirDif);
ADDRLP4 48
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 1488
;1488:	VectorNormalize(dirDif);
ADDRLP4 48
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1489
;1489:	vectoangles(dirDif, dirDif);
ADDRLP4 48
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1491
;1490:
;1491:	AngleVectors(dirDif, forward, 0, 0);
ADDRLP4 48
ARGP4
ADDRLP4 1164
ARGP4
ADDRLP4 1192
CNSTP4 0
ASGNP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1493
;1492:
;1493:	to[0] = from[0] + forward[0]*32;
ADDRLP4 12
ADDRLP4 0
INDIRF4
CNSTF4 1107296256
ADDRLP4 1164
INDIRF4
MULF4
ADDF4
ASGNF4
line 1494
;1494:	to[1] = from[1] + forward[1]*32;
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1107296256
ADDRLP4 1164+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1495
;1495:	to[2] = from[2] + forward[2]*32;
ADDRLP4 12+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1107296256
ADDRLP4 1164+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1497
;1496:
;1497:	trap_Trace(&tr, from, playerMins, playerMaxs, to, bs->client, MASK_PLAYERSOLID);
ADDRLP4 60
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1140
ARGP4
ADDRLP4 1152
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1499
;1498:
;1499:	if (tr.fraction == 1)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
NEF4 $629
line 1500
;1500:	{
line 1501
;1501:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $605
JUMPV
LABELV $629
line 1504
;1502:	}
;1503:
;1504:	AngleVectors(dirAng, 0, right, 0);
ADDRLP4 36
ARGP4
ADDRLP4 1196
CNSTP4 0
ASGNP4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1506
;1505:
;1506:	from[0] += right[0]*32;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1107296256
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 1507
;1507:	from[1] += right[1]*32;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1107296256
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1508
;1508:	from[2] += right[2]*16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1510
;1509:
;1510:	to[0] += right[0]*32;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1107296256
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 1511
;1511:	to[1] += right[1]*32;
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1107296256
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1512
;1512:	to[2] += right[2]*32;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1107296256
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1514
;1513:
;1514:	trap_Trace(&tr, from, playerMins, playerMaxs, to, bs->client, MASK_PLAYERSOLID);
ADDRLP4 60
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1140
ARGP4
ADDRLP4 1152
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1516
;1515:
;1516:	if (tr.fraction == 1)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
NEF4 $640
line 1517
;1517:	{
line 1518
;1518:		return STRAFEAROUND_RIGHT;
CNSTI4 1
RETI4
ADDRGP4 $605
JUMPV
LABELV $640
line 1521
;1519:	}
;1520:
;1521:	from[0] -= right[0]*64;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1115684864
ADDRLP4 24
INDIRF4
MULF4
SUBF4
ASGNF4
line 1522
;1522:	from[1] -= right[1]*64;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1115684864
ADDRLP4 24+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 1523
;1523:	from[2] -= right[2]*64;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1115684864
ADDRLP4 24+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 1525
;1524:
;1525:	to[0] -= right[0]*64;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1115684864
ADDRLP4 24
INDIRF4
MULF4
SUBF4
ASGNF4
line 1526
;1526:	to[1] -= right[1]*64;
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1115684864
ADDRLP4 24+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 1527
;1527:	to[2] -= right[2]*64;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1115684864
ADDRLP4 24+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 1529
;1528:
;1529:	trap_Trace(&tr, from, playerMins, playerMaxs, to, bs->client, MASK_PLAYERSOLID);
ADDRLP4 60
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1140
ARGP4
ADDRLP4 1152
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1531
;1530:
;1531:	if (tr.fraction == 1)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
NEF4 $651
line 1532
;1532:	{
line 1533
;1533:		return STRAFEAROUND_LEFT;
CNSTI4 2
RETI4
ADDRGP4 $605
JUMPV
LABELV $651
line 1536
;1534:	}
;1535:
;1536:	return 0;
CNSTI4 0
RETI4
LABELV $605
endproc BotTrace_Strafe 1200 28
export BotTrace_Jump
proc BotTrace_Jump 1196 28
line 1541
;1537:}
;1538:#endif
;1539:
;1540:int BotTrace_Jump(bot_state_t *bs, vec3_t traceto)
;1541:{
line 1546
;1542:	vec3_t mins, maxs, a, fwd, traceto_mod, tracefrom_mod;
;1543:	trace_t tr;
;1544:	int orTr;
;1545:
;1546:	VectorSubtract(traceto, bs->origin, a);
ADDRLP4 1156
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 1156
INDIRP4
INDIRF4
ADDRLP4 1160
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 1156
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1160
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1547
;1547:	vectoangles(a, a);
ADDRLP4 24
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1549
;1548:
;1549:	AngleVectors(a, fwd, NULL, NULL);
ADDRLP4 24
ARGP4
ADDRLP4 1128
ARGP4
ADDRLP4 1164
CNSTP4 0
ASGNP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1551
;1550:
;1551:	traceto_mod[0] = bs->origin[0] + fwd[0]*4;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 1128
INDIRF4
MULF4
ADDF4
ASGNF4
line 1552
;1552:	traceto_mod[1] = bs->origin[1] + fwd[1]*4;
ADDRLP4 36+4
ADDRFP4 0
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 1128+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1553
;1553:	traceto_mod[2] = bs->origin[2] + fwd[2]*4;
ADDRLP4 36+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 1128+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1555
;1554:
;1555:	mins[0] = -15;
ADDRLP4 0
CNSTF4 3245342720
ASGNF4
line 1556
;1556:	mins[1] = -15;
ADDRLP4 0+4
CNSTF4 3245342720
ASGNF4
line 1557
;1557:	mins[2] = -18;
ADDRLP4 0+8
CNSTF4 3247439872
ASGNF4
line 1558
;1558:	maxs[0] = 15;
ADDRLP4 12
CNSTF4 1097859072
ASGNF4
line 1559
;1559:	maxs[1] = 15;
ADDRLP4 12+4
CNSTF4 1097859072
ASGNF4
line 1560
;1560:	maxs[2] = 32;
ADDRLP4 12+8
CNSTF4 1107296256
ASGNF4
line 1562
;1561:
;1562:	trap_Trace(&tr, bs->origin, mins, maxs, traceto_mod, bs->client, MASK_PLAYERSOLID);
ADDRLP4 48
ARGP4
ADDRLP4 1168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1168
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 1168
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1564
;1563:
;1564:	if (tr.fraction == 1)
ADDRLP4 48+8
INDIRF4
CNSTF4 1065353216
NEF4 $665
line 1565
;1565:	{
line 1566
;1566:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $654
JUMPV
LABELV $665
line 1569
;1567:	}
;1568:
;1569:	orTr = tr.entityNum;
ADDRLP4 1140
ADDRLP4 48+52
INDIRI4
ASGNI4
line 1571
;1570:
;1571:	VectorCopy(bs->origin, tracefrom_mod);
ADDRLP4 1144
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 1573
;1572:
;1573:	tracefrom_mod[2] += 41;
ADDRLP4 1144+8
ADDRLP4 1144+8
INDIRF4
CNSTF4 1109655552
ADDF4
ASGNF4
line 1574
;1574:	traceto_mod[2] += 41;
ADDRLP4 36+8
ADDRLP4 36+8
INDIRF4
CNSTF4 1109655552
ADDF4
ASGNF4
line 1576
;1575:
;1576:	mins[0] = -15;
ADDRLP4 0
CNSTF4 3245342720
ASGNF4
line 1577
;1577:	mins[1] = -15;
ADDRLP4 0+4
CNSTF4 3245342720
ASGNF4
line 1578
;1578:	mins[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1579
;1579:	maxs[0] = 15;
ADDRLP4 12
CNSTF4 1097859072
ASGNF4
line 1580
;1580:	maxs[1] = 15;
ADDRLP4 12+4
CNSTF4 1097859072
ASGNF4
line 1581
;1581:	maxs[2] = 8;
ADDRLP4 12+8
CNSTF4 1090519040
ASGNF4
line 1583
;1582:
;1583:	trap_Trace(&tr, tracefrom_mod, mins, maxs, traceto_mod, bs->client, MASK_PLAYERSOLID);
ADDRLP4 48
ARGP4
ADDRLP4 1144
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1585
;1584:
;1585:	if (tr.fraction == 1)
ADDRLP4 48+8
INDIRF4
CNSTF4 1065353216
NEF4 $675
line 1586
;1586:	{
line 1587
;1587:		if (orTr >= 0 && orTr < MAX_CLIENTS && botstates[orTr] && botstates[orTr]->jumpTime > level.time)
ADDRLP4 1140
INDIRI4
CNSTI4 0
LTI4 $678
ADDRLP4 1140
INDIRI4
CNSTI4 32
GEI4 $678
ADDRLP4 1176
ADDRLP4 1140
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1176
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $678
ADDRLP4 1176
INDIRP4
CNSTI4 2012
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $678
line 1588
;1588:		{
line 1589
;1589:			return 0; //so bots don't try to jump over each other at the same time
CNSTI4 0
RETI4
ADDRGP4 $654
JUMPV
LABELV $678
line 1592
;1590:		}
;1591:
;1592:		if (bs->currentEnemy && bs->currentEnemy->s.number == orTr && (BotGetWeaponRange(bs) == BWEAPONRANGE_SABER || BotGetWeaponRange(bs) == BWEAPONRANGE_MELEE))
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1184
ADDRLP4 1180
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1184
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $681
ADDRLP4 1184
INDIRP4
INDIRI4
ADDRLP4 1140
INDIRI4
NEI4 $681
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 1188
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 1188
INDIRI4
CNSTI4 4
EQI4 $683
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1192
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 1192
INDIRI4
CNSTI4 1
NEI4 $681
LABELV $683
line 1593
;1593:		{
line 1594
;1594:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $654
JUMPV
LABELV $681
line 1597
;1595:		}
;1596:
;1597:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $654
JUMPV
LABELV $675
line 1600
;1598:	}
;1599:
;1600:	return 0;
CNSTI4 0
RETI4
LABELV $654
endproc BotTrace_Jump 1196 28
export BotTrace_Duck
proc BotTrace_Duck 1168 28
line 1604
;1601:}
;1602:
;1603:int BotTrace_Duck(bot_state_t *bs, vec3_t traceto)
;1604:{
line 1608
;1605:	vec3_t mins, maxs, a, fwd, traceto_mod, tracefrom_mod;
;1606:	trace_t tr;
;1607:
;1608:	VectorSubtract(traceto, bs->origin, a);
ADDRLP4 1152
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 1152
INDIRP4
INDIRF4
ADDRLP4 1156
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 1152
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1156
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1609
;1609:	vectoangles(a, a);
ADDRLP4 24
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1611
;1610:
;1611:	AngleVectors(a, fwd, NULL, NULL);
ADDRLP4 24
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 1160
CNSTP4 0
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1613
;1612:
;1613:	traceto_mod[0] = bs->origin[0] + fwd[0]*4;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
line 1614
;1614:	traceto_mod[1] = bs->origin[1] + fwd[1]*4;
ADDRLP4 36+4
ADDRFP4 0
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1615
;1615:	traceto_mod[2] = bs->origin[2] + fwd[2]*4;
ADDRLP4 36+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1617
;1616:
;1617:	mins[0] = -15;
ADDRLP4 0
CNSTF4 3245342720
ASGNF4
line 1618
;1618:	mins[1] = -15;
ADDRLP4 0+4
CNSTF4 3245342720
ASGNF4
line 1619
;1619:	mins[2] = -23;
ADDRLP4 0+8
CNSTF4 3250061312
ASGNF4
line 1620
;1620:	maxs[0] = 15;
ADDRLP4 12
CNSTF4 1097859072
ASGNF4
line 1621
;1621:	maxs[1] = 15;
ADDRLP4 12+4
CNSTF4 1097859072
ASGNF4
line 1622
;1622:	maxs[2] = 8;
ADDRLP4 12+8
CNSTF4 1090519040
ASGNF4
line 1624
;1623:
;1624:	trap_Trace(&tr, bs->origin, mins, maxs, traceto_mod, bs->client, MASK_PLAYERSOLID);
ADDRLP4 60
ARGP4
ADDRLP4 1164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 1164
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1626
;1625:
;1626:	if (tr.fraction != 1)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
EQF4 $695
line 1627
;1627:	{
line 1628
;1628:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $684
JUMPV
LABELV $695
line 1631
;1629:	}
;1630:
;1631:	VectorCopy(bs->origin, tracefrom_mod);
ADDRLP4 1140
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 1633
;1632:
;1633:	tracefrom_mod[2] += 31;//33;
ADDRLP4 1140+8
ADDRLP4 1140+8
INDIRF4
CNSTF4 1106771968
ADDF4
ASGNF4
line 1634
;1634:	traceto_mod[2] += 31;//33;
ADDRLP4 36+8
ADDRLP4 36+8
INDIRF4
CNSTF4 1106771968
ADDF4
ASGNF4
line 1636
;1635:
;1636:	mins[0] = -15;
ADDRLP4 0
CNSTF4 3245342720
ASGNF4
line 1637
;1637:	mins[1] = -15;
ADDRLP4 0+4
CNSTF4 3245342720
ASGNF4
line 1638
;1638:	mins[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1639
;1639:	maxs[0] = 15;
ADDRLP4 12
CNSTF4 1097859072
ASGNF4
line 1640
;1640:	maxs[1] = 15;
ADDRLP4 12+4
CNSTF4 1097859072
ASGNF4
line 1641
;1641:	maxs[2] = 32;
ADDRLP4 12+8
CNSTF4 1107296256
ASGNF4
line 1643
;1642:
;1643:	trap_Trace(&tr, tracefrom_mod, mins, maxs, traceto_mod, bs->client, MASK_PLAYERSOLID);
ADDRLP4 60
ARGP4
ADDRLP4 1140
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1645
;1644:
;1645:	if (tr.fraction != 1)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
EQF4 $704
line 1646
;1646:	{
line 1647
;1647:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $684
JUMPV
LABELV $704
line 1650
;1648:	}
;1649:
;1650:	return 0;
CNSTI4 0
RETI4
LABELV $684
endproc BotTrace_Duck 1168 28
export PassStandardEnemyChecks
proc PassStandardEnemyChecks 56 8
line 1654
;1651:}
;1652:
;1653:int PassStandardEnemyChecks(bot_state_t *bs, gentity_t *en)
;1654:{
line 1655
;1655:	if (!bs || !en)
ADDRLP4 0
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRU4
EQU4 $710
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRU4
NEU4 $708
LABELV $710
line 1656
;1656:	{
line 1657
;1657:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $708
line 1660
;1658:	}
;1659:
;1660:	if (!en->client)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $711
line 1661
;1661:	{
line 1662
;1662:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $711
line 1665
;1663:	}
;1664:
;1665:	if (en->health < 1)
ADDRFP4 4
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $713
line 1666
;1666:	{
line 1667
;1667:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $713
line 1670
;1668:	}
;1669:
;1670:	if (!en->takedamage)
ADDRFP4 4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
NEI4 $715
line 1671
;1671:	{
line 1672
;1672:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $715
line 1675
;1673:	}
;1674:
;1675:	if (botstates[en->s.number] && cm_botsattackhumans.integer == 1)
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $717
ADDRGP4 cm_botsattackhumans+12
INDIRI4
CNSTI4 1
NEI4 $717
line 1676
;1676:	{
line 1677
;1677:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $717
line 1680
;1678:	}
;1679:
;1680:	if (bs->doingFallback &&
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 4804
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $720
ADDRGP4 gLevelFlags
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $720
line 1682
;1681:		(gLevelFlags & LEVELFLAG_IGNOREINFALLBACK))
;1682:	{
line 1683
;1683:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $720
line 1686
;1684:	}
;1685:
;1686:	if (en->client)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $722
line 1687
;1687:	{
line 1688
;1688:		if (en->client->ps.pm_type == PM_INTERMISSION ||
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 6
EQI4 $726
ADDRLP4 8
INDIRI4
CNSTI4 3
NEI4 $724
LABELV $726
line 1690
;1689:			en->client->ps.pm_type == PM_SPECTATOR)
;1690:		{
line 1691
;1691:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $724
line 1694
;1692:		}
;1693:
;1694:		if (en->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 3
NEI4 $727
line 1695
;1695:		{
line 1696
;1696:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $727
line 1699
;1697:		}
;1698:
;1699:		if (!en->client->pers.connected)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $729
line 1700
;1700:		{
line 1701
;1701:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $729
line 1703
;1702:		}
;1703:	}
LABELV $722
line 1705
;1704:
;1705:	if (!en->s.solid)
ADDRFP4 4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 0
NEI4 $731
line 1706
;1706:	{
line 1707
;1707:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $731
line 1710
;1708:	}
;1709:
;1710:	if (bs->client == en->s.number)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
NEI4 $733
line 1711
;1711:	{
line 1712
;1712:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $733
line 1715
;1713:	}
;1714:
;1715:	if (OnSameTeam(&g_entities[bs->client], en))
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $735
line 1716
;1716:	{
line 1717
;1717:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $735
line 1720
;1718:	}
;1719:
;1720:	if (BotMindTricked(bs->client, en->s.number))
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BotMindTricked
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $737
line 1721
;1721:	{
line 1722
;1722:		if (bs->currentEnemy && bs->currentEnemy->s.number == en->s.number)
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $739
ADDRLP4 16
INDIRP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
NEI4 $739
line 1723
;1723:		{
line 1725
;1724:			vec3_t vs;
;1725:			float vLen = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
line 1727
;1726:
;1727:			VectorSubtract(bs->origin, en->client->ps.origin, vs);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 24
ADDRLP4 36
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 36
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1728
;1728:			vLen = VectorLength(vs);
ADDRLP4 24
ARGP4
ADDRLP4 44
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 44
INDIRF4
ASGNF4
line 1730
;1729:
;1730:			if (vLen > 256 && (level.time - en->client->dangerTime) > 150)
ADDRLP4 20
INDIRF4
CNSTF4 1132462080
LEF4 $743
ADDRGP4 level+32
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 3000
ADDP4
INDIRI4
SUBI4
CNSTI4 150
LEI4 $743
line 1731
;1731:			{
line 1732
;1732:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $743
line 1734
;1733:			}
;1734:		}
LABELV $739
line 1735
;1735:	}
LABELV $737
line 1737
;1736:
;1737:	if (en->client->ps.duelInProgress && en->client->ps.duelIndex != bs->client)
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $746
ADDRLP4 16
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $746
line 1738
;1738:	{
line 1739
;1739:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $746
line 1742
;1740:	}
;1741:
;1742:	if (bs->cur_ps.duelInProgress && en->s.number != bs->cur_ps.duelIndex)
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1320
ADDP4
INDIRI4
CNSTI4 0
EQI4 $748
ADDRFP4 4
INDIRP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
EQI4 $748
line 1743
;1743:	{
line 1744
;1744:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $748
line 1747
;1745:	}
;1746:
;1747:	if (g_gametype.integer == GT_JEDIMASTER && !en->client->ps.isJediMaster && !bs->cur_ps.isJediMaster)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $750
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $750
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $750
line 1748
;1748:	{ //rules for attacking non-JM in JM mode
line 1750
;1749:		vec3_t vs;
;1750:		float vLen = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1752
;1751:
;1752:		if (!g_friendlyFire.integer)
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $753
line 1753
;1753:		{ //can't harm non-JM in JM mode if FF is off
line 1754
;1754:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $753
line 1757
;1755:		}
;1756:
;1757:		VectorSubtract(bs->origin, en->client->ps.origin, vs);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 28
ADDRLP4 44
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 44
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1758
;1758:		vLen = VectorLength(vs);
ADDRLP4 28
ARGP4
ADDRLP4 52
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 52
INDIRF4
ASGNF4
line 1760
;1759:
;1760:		if (vLen > 350)
ADDRLP4 40
INDIRF4
CNSTF4 1135542272
LEF4 $758
line 1761
;1761:		{
line 1762
;1762:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $758
line 1764
;1763:		}
;1764:	}
LABELV $750
line 1773
;1765:
;1766:	/*
;1767:	if (en->client && en->client->pers.connected != CON_CONNECTED)
;1768:	{
;1769:		return 0;
;1770:	}
;1771:	*/
;1772:
;1773:	return 1;
CNSTI4 1
RETI4
LABELV $707
endproc PassStandardEnemyChecks 56 8
export BotDamageNotification
proc BotDamageNotification 28 8
line 1777
;1774:}
;1775:
;1776:void BotDamageNotification(gclient_t *bot, gentity_t *attacker)
;1777:{
line 1782
;1778:	bot_state_t *bs;
;1779:	bot_state_t *bs_a;
;1780:	int i;
;1781:
;1782:	if (!bot || !attacker || !attacker->client)
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $764
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $764
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
NEU4 $761
LABELV $764
line 1783
;1783:	{
line 1784
;1784:		return;
ADDRGP4 $760
JUMPV
LABELV $761
line 1787
;1785:	}
;1786:
;1787:	bs_a = botstates[attacker->s.number];
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 1789
;1788:
;1789:	if (bs_a)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $765
line 1790
;1790:	{
line 1791
;1791:		bs_a->lastAttacked = &g_entities[bot->ps.clientNum];
ADDRLP4 4
INDIRP4
CNSTI4 1832
ADDP4
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1792
;1792:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1794
;1793:
;1794:		if (cm_botsattackhumans.integer == 1){
ADDRGP4 cm_botsattackhumans+12
INDIRI4
CNSTI4 1
NEI4 $771
line 1795
;1795:			return;
ADDRGP4 $760
JUMPV
LABELV $770
line 1799
;1796:		}
;1797:
;1798:		while (i < MAX_CLIENTS)
;1799:		{
line 1800
;1800:			if (botstates[i] &&
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $773
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $773
ADDRLP4 24
INDIRP4
CNSTI4 1832
ADDP4
INDIRP4
CVPU4 4
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
NEU4 $773
line 1803
;1801:				i != bs_a->client &&
;1802:				botstates[i]->lastAttacked == &g_entities[bot->ps.clientNum])
;1803:			{
line 1804
;1804:				botstates[i]->lastAttacked = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 1832
ADDP4
CNSTP4 0
ASGNP4
line 1805
;1805:			}
LABELV $773
line 1807
;1806:
;1807:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1808
;1808:		}
LABELV $771
line 1798
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $770
line 1809
;1809:	}
ADDRGP4 $766
JUMPV
LABELV $765
line 1811
;1810:	else //got attacked by a real client, so no one gets rights to lastAttacked
;1811:	{
line 1812
;1812:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $776
JUMPV
LABELV $775
line 1815
;1813:
;1814:		while (i < MAX_CLIENTS)
;1815:		{
line 1816
;1816:			if (botstates[i] &&
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $778
ADDRLP4 20
INDIRP4
CNSTI4 1832
ADDP4
INDIRP4
CVPU4 4
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
NEU4 $778
line 1818
;1817:				botstates[i]->lastAttacked == &g_entities[bot->ps.clientNum])
;1818:			{
line 1819
;1819:				botstates[i]->lastAttacked = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 1832
ADDP4
CNSTP4 0
ASGNP4
line 1820
;1820:			}
LABELV $778
line 1822
;1821:
;1822:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1823
;1823:		}
LABELV $776
line 1814
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $775
line 1824
;1824:	}
LABELV $766
line 1826
;1825:
;1826:	bs = botstates[bot->ps.clientNum];
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 1828
;1827:
;1828:	if (!bs)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $780
line 1829
;1829:	{
line 1830
;1830:		return;
ADDRGP4 $760
JUMPV
LABELV $780
line 1833
;1831:	}
;1832:
;1833:	bs->lastHurt = attacker;
ADDRLP4 8
INDIRP4
CNSTI4 1828
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 1835
;1834:
;1835:	if (bs->currentEnemy)
ADDRLP4 8
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $782
line 1836
;1836:	{
line 1837
;1837:		return;
ADDRGP4 $760
JUMPV
LABELV $782
line 1840
;1838:	}
;1839:
;1840:	if (!PassStandardEnemyChecks(bs, attacker))
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 PassStandardEnemyChecks
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $784
line 1841
;1841:	{
line 1842
;1842:		return;
ADDRGP4 $760
JUMPV
LABELV $784
line 1845
;1843:	}
;1844:
;1845:	if (PassLovedOneCheck(bs, attacker))
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $786
line 1846
;1846:	{
line 1847
;1847:		if (cm_botsattackhumans.integer == 1){
ADDRGP4 cm_botsattackhumans+12
INDIRI4
CNSTI4 1
NEI4 $788
line 1848
;1848:			return;
ADDRGP4 $760
JUMPV
LABELV $788
line 1850
;1849:		}
;1850:		bs->currentEnemy = attacker;
ADDRLP4 8
INDIRP4
CNSTI4 1816
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 1851
;1851:		bs->enemySeenTime = level.time + ENEMY_FORGET_MS;
ADDRLP4 8
INDIRP4
CNSTI4 1996
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 1852
;1852:	}
LABELV $786
line 1853
;1853:}
LABELV $760
endproc BotDamageNotification 28 8
export BotCanHear
proc BotCanHear 64 8
line 1856
;1854:
;1855:int BotCanHear(bot_state_t *bs, gentity_t *en, float endist)
;1856:{
line 1859
;1857:	float minlen;
;1858:
;1859:	if (!en || !en->client)
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $795
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $793
LABELV $795
line 1860
;1860:	{
line 1861
;1861:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $792
JUMPV
LABELV $793
line 1864
;1862:	}
;1863:
;1864:	if (en && en->client && en->client->ps.otherSoundTime > level.time)
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $796
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $796
ADDRLP4 20
INDIRP4
CNSTI4 1276
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $796
line 1865
;1865:	{
line 1866
;1866:		minlen = en->client->ps.otherSoundLen;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1280
ADDP4
INDIRF4
ASGNF4
line 1867
;1867:		goto checkStep;
ADDRGP4 $799
JUMPV
LABELV $796
line 1870
;1868:	}
;1869:
;1870:	if (en && en->client && en->client->ps.footstepTime > level.time)
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTU4 0
ASGNU4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $800
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $800
ADDRLP4 32
INDIRP4
CNSTI4 1272
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $800
line 1871
;1871:	{
line 1872
;1872:		minlen = 256;
ADDRLP4 0
CNSTF4 1132462080
ASGNF4
line 1873
;1873:		goto checkStep;
ADDRGP4 $799
JUMPV
LABELV $800
line 1876
;1874:	}
;1875:
;1876:	if (gBotEventTracker[en->s.number].eventTime < level.time)
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 gBotEventTracker+12
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $803
line 1877
;1877:	{
line 1878
;1878:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $792
JUMPV
LABELV $803
line 1881
;1879:	}
;1880:
;1881:	switch(gBotEventTracker[en->s.number].events[gBotEventTracker[en->s.number].eventSequence & (MAX_PS_EVENTS-1)])
ADDRLP4 40
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
ADDRLP4 36
ADDRLP4 40
INDIRI4
ADDRGP4 gBotEventTracker
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 40
INDIRI4
ADDRGP4 gBotEventTracker+4
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 24
EQI4 $812
ADDRLP4 36
INDIRI4
CNSTI4 25
EQI4 $812
ADDRLP4 48
CNSTI4 26
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $812
ADDRLP4 36
INDIRI4
ADDRLP4 48
INDIRI4
GTI4 $816
LABELV $815
ADDRLP4 56
CNSTI4 2
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 56
INDIRI4
LTI4 $807
ADDRLP4 36
INDIRI4
CNSTI4 15
GTI4 $807
ADDRLP4 36
INDIRI4
ADDRLP4 56
INDIRI4
LSHI4
ADDRGP4 $817-8
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $817
address $813
address $813
address $807
address $813
address $807
address $813
address $813
address $813
address $813
address $807
address $807
address $807
address $814
address $814
code
LABELV $816
ADDRLP4 36
INDIRI4
CNSTI4 67
EQI4 $811
ADDRGP4 $807
JUMPV
line 1882
;1882:	{
LABELV $811
line 1884
;1883:	case EV_GLOBAL_SOUND:
;1884:		minlen = 256;
ADDRLP4 0
CNSTF4 1132462080
ASGNF4
line 1885
;1885:		break;
ADDRGP4 $808
JUMPV
LABELV $812
line 1889
;1886:	case EV_FIRE_WEAPON:
;1887:	case EV_ALT_FIRE:
;1888:	case EV_SABER_ATTACK:
;1889:		minlen = 512;
ADDRLP4 0
CNSTF4 1140850688
ASGNF4
line 1890
;1890:		break;
ADDRGP4 $808
JUMPV
LABELV $813
line 1898
;1891:	case EV_STEP_4:
;1892:	case EV_STEP_8:
;1893:	case EV_STEP_12:
;1894:	case EV_STEP_16:
;1895:	case EV_FOOTSTEP:
;1896:	case EV_FOOTSTEP_METAL:
;1897:	case EV_FOOTWADE:
;1898:		minlen = 256;
ADDRLP4 0
CNSTF4 1132462080
ASGNF4
line 1899
;1899:		break;
ADDRGP4 $808
JUMPV
LABELV $814
line 1902
;1900:	case EV_JUMP:
;1901:	case EV_ROLL:
;1902:		minlen = 256;
ADDRLP4 0
CNSTF4 1132462080
ASGNF4
line 1903
;1903:		break;
ADDRGP4 $808
JUMPV
LABELV $807
line 1905
;1904:	default:
;1905:		minlen = 999999;
ADDRLP4 0
CNSTF4 1232348144
ASGNF4
line 1906
;1906:		break;
LABELV $808
LABELV $799
line 1909
;1907:	}
;1908:checkStep:
;1909:	if (BotMindTricked(bs->client, en->s.number))
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 BotMindTricked
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $819
line 1910
;1910:	{ //if mindtricked by this person, cut down on the minlen
line 1911
;1911:		minlen /= 4;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
DIVF4
ASGNF4
line 1912
;1912:	}
LABELV $819
line 1914
;1913:
;1914:	if (endist <= minlen)
ADDRFP4 8
INDIRF4
ADDRLP4 0
INDIRF4
GTF4 $821
line 1915
;1915:	{
line 1916
;1916:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $792
JUMPV
LABELV $821
line 1919
;1917:	}
;1918:
;1919:	return 0;
CNSTI4 0
RETI4
LABELV $792
endproc BotCanHear 64 8
export UpdateEventTracker
proc UpdateEventTracker 20 0
line 1923
;1920:}
;1921:
;1922:void UpdateEventTracker(void)
;1923:{
line 1926
;1924:	int i;
;1925:
;1926:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $825
JUMPV
LABELV $824
line 1929
;1927:
;1928:	while (i < MAX_CLIENTS)
;1929:	{
line 1930
;1930:		if (gBotEventTracker[i].eventSequence != level.clients[i].ps.eventSequence)
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 gBotEventTracker
ADDP4
INDIRI4
CNSTI4 3024
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 112
ADDP4
INDIRI4
EQI4 $827
line 1931
;1931:		{ //updated event
line 1932
;1932:			gBotEventTracker[i].eventSequence = level.clients[i].ps.eventSequence;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 gBotEventTracker
ADDP4
CNSTI4 3024
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 112
ADDP4
INDIRI4
ASGNI4
line 1933
;1933:			gBotEventTracker[i].events[0] = level.clients[i].ps.events[0];
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 gBotEventTracker+4
ADDP4
CNSTI4 3024
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 116
ADDP4
INDIRI4
ASGNI4
line 1934
;1934:			gBotEventTracker[i].events[1] = level.clients[i].ps.events[1];
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 gBotEventTracker+4+4
ADDP4
CNSTI4 3024
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 120
ADDP4
INDIRI4
ASGNI4
line 1935
;1935:			gBotEventTracker[i].eventTime = level.time + 0.5;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 gBotEventTracker+12
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDF4
ASGNF4
line 1936
;1936:		}
LABELV $827
line 1938
;1937:
;1938:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1939
;1939:	}
LABELV $825
line 1928
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $824
line 1940
;1940:}
LABELV $823
endproc UpdateEventTracker 20 0
export InFieldOfVision
proc InFieldOfVision 24 4
line 1943
;1941:
;1942:int InFieldOfVision(vec3_t viewangles, float fov, vec3_t angles)
;1943:{
line 1947
;1944:	int i;
;1945:	float diff, angle;
;1946:
;1947:	for (i = 0; i < 2; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $835
line 1948
;1948:	{
line 1949
;1949:		angle = AngleMod(viewangles[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
ASGNF4
line 1950
;1950:		angles[i] = AngleMod(angles[i]);
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRF4
ASGNF4
line 1951
;1951:		diff = angles[i] - angle;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
line 1952
;1952:		if (angles[i] > angle)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $839
line 1953
;1953:		{
line 1954
;1954:			if (diff > 180.0)
ADDRLP4 4
INDIRF4
CNSTF4 1127481344
LEF4 $840
line 1955
;1955:			{
line 1956
;1956:				diff -= 360.0;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 1957
;1957:			}
line 1958
;1958:		}
ADDRGP4 $840
JUMPV
LABELV $839
line 1960
;1959:		else
;1960:		{
line 1961
;1961:			if (diff < -180.0)
ADDRLP4 4
INDIRF4
CNSTF4 3274964992
GEF4 $843
line 1962
;1962:			{
line 1963
;1963:				diff += 360.0;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 1964
;1964:			}
LABELV $843
line 1965
;1965:		}
LABELV $840
line 1966
;1966:		if (diff > 0)
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $845
line 1967
;1967:		{
line 1968
;1968:			if (diff > fov * 0.5)
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
MULF4
LEF4 $846
line 1969
;1969:			{
line 1970
;1970:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $834
JUMPV
line 1972
;1971:			}
;1972:		}
LABELV $845
line 1974
;1973:		else
;1974:		{
line 1975
;1975:			if (diff < -fov * 0.5)
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
NEGF4
MULF4
GEF4 $849
line 1976
;1976:			{
line 1977
;1977:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $834
JUMPV
LABELV $849
line 1979
;1978:			}
;1979:		}
LABELV $846
line 1980
;1980:	}
LABELV $836
line 1947
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $835
line 1981
;1981:	return 1;
CNSTI4 1
RETI4
LABELV $834
endproc InFieldOfVision 24 4
export PassLovedOneCheck
proc PassLovedOneCheck 36 8
line 1986
;1982:}
;1983:
;1984://NOTE: This is base for cm_botsattackhumans
;1985:int PassLovedOneCheck(bot_state_t *bs, gentity_t *ent)
;1986:{
line 1990
;1987:	int i;
;1988:	bot_state_t *loved;
;1989:
;1990:	if (!bs->lovednum)
ADDRFP4 0
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $852
line 1991
;1991:	{
line 1992
;1992:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $851
JUMPV
LABELV $852
line 1995
;1993:	}
;1994:
;1995:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $854
line 1996
;1996:	{ //There is no love in 1-on-1
line 1997
;1997:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $851
JUMPV
LABELV $854
line 2000
;1998:	}
;1999:
;2000:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2002
;2001:
;2002:	if (!botstates[ent->s.number])
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $857
line 2003
;2003:	{ //not a bot
line 2004
;2004:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $851
JUMPV
LABELV $857
line 2007
;2005:	}
;2006:
;2007:	trap_Cvar_Update(&bot_attachments);
ADDRGP4 bot_attachments
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 2009
;2008:
;2009:	if (!bot_attachments.integer)
ADDRGP4 bot_attachments+12
INDIRI4
CNSTI4 0
NEI4 $859
line 2010
;2010:	{
line 2011
;2011:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $851
JUMPV
LABELV $859
line 2014
;2012:	}
;2013:
;2014:	loved = botstates[ent->s.number];
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $863
JUMPV
LABELV $862
line 2017
;2015:
;2016:	while (i < bs->lovednum)
;2017:	{
line 2018
;2018:		if (strcmp(level.clients[loved->client].pers.netname, bs->loved[i].name) == 0)
CNSTI4 3024
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $865
line 2019
;2019:		{
line 2020
;2020:			if (!IsTeamplay() && bs->loved[i].level < 2)
ADDRLP4 12
ADDRGP4 IsTeamplay
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $867
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
INDIRI4
CNSTI4 2
GEI4 $867
line 2021
;2021:			{ //if FFA and level of love is not greater than 1, just don't care
line 2022
;2022:				return 1;
CNSTI4 1
RETI4
ADDRGP4 $851
JUMPV
LABELV $867
line 2024
;2023:			}
;2024:			else if (IsTeamplay() && !OnSameTeam(&g_entities[bs->client], &g_entities[loved->client]) && bs->loved[i].level < 2)
ADDRLP4 16
ADDRGP4 IsTeamplay
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $869
ADDRLP4 20
CNSTI4 852
ASGNI4
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRLP4 28
ADDRGP4 g_entities
ASGNP4
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ARGP4
ADDRLP4 20
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $869
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
INDIRI4
CNSTI4 2
GEI4 $869
line 2025
;2025:			{ //is teamplay, but not on same team and level < 2
line 2026
;2026:				return 1;
CNSTI4 1
RETI4
ADDRGP4 $851
JUMPV
LABELV $869
line 2029
;2027:			}
;2028:			else
;2029:			{
line 2030
;2030:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $851
JUMPV
LABELV $865
line 2034
;2031:			}
;2032:		}
;2033:
;2034:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2035
;2035:	}
LABELV $863
line 2016
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
LTI4 $862
line 2037
;2036:
;2037:	return 1;
CNSTI4 1
RETI4
LABELV $851
endproc PassLovedOneCheck 36 8
export ScanForEnemies
proc ScanForEnemies 132 12
line 2043
;2038:}
;2039:
;2040:qboolean G_ThereIsAMaster(void);
;2041:
;2042:int ScanForEnemies(bot_state_t *bs)
;2043:{
line 2049
;2044:	vec3_t a;
;2045:	float distcheck;
;2046:	float closest;
;2047:	int bestindex;
;2048:	int i;
;2049:	float hasEnemyDist = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 2050
;2050:	qboolean noAttackNonJM = qfalse;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 2052
;2051:
;2052:	closest = 999999;
ADDRLP4 20
CNSTF4 1232348144
ASGNF4
line 2053
;2053:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2054
;2054:	bestindex = -1;
ADDRLP4 28
CNSTI4 -1
ASGNI4
line 2056
;2055:
;2056:	if (bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $872
line 2057
;2057:	{
line 2058
;2058:		hasEnemyDist = bs->frame_Enemy_Len;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ASGNF4
line 2059
;2059:	}
LABELV $872
line 2061
;2060:
;2061:	if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTU4 0
ASGNU4
ADDRLP4 36
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $874
ADDRLP4 44
ADDRLP4 36
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $874
ADDRLP4 44
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $874
line 2063
;2062:		bs->currentEnemy->client->ps.isJediMaster)
;2063:	{ //The Jedi Master must die.
line 2064
;2064:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $871
JUMPV
LABELV $874
line 2067
;2065:	}
;2066:
;2067:	if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
CNSTU4 0
ASGNU4
ADDRLP4 48
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
EQU4 $876
ADDRLP4 48
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
EQU4 $876
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
NEU4 $876
ADDRGP4 cm_botsattackhumans+12
INDIRI4
CNSTI4 1
NEI4 $876
line 2069
;2068:		!botstates[bs->currentEnemy->s.number] && cm_botsattackhumans.integer == 1)
;2069:	{ //dont attack other bots
line 2070
;2070:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $871
JUMPV
LABELV $876
line 2073
;2071:	}
;2072:
;2073:	if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $888
line 2074
;2074:	{
line 2075
;2075:		if (G_ThereIsAMaster() && !bs->cur_ps.isJediMaster)
ADDRLP4 56
ADDRGP4 G_ThereIsAMaster
CALLI4
ASGNI4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $888
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $888
line 2076
;2076:		{
line 2077
;2077:			if (!g_friendlyFire.integer)
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $884
line 2078
;2078:			{
line 2079
;2079:				noAttackNonJM = qtrue;
ADDRLP4 32
CNSTI4 1
ASGNI4
line 2080
;2080:			}
ADDRGP4 $888
JUMPV
LABELV $884
line 2082
;2081:			else
;2082:			{
line 2083
;2083:				closest = 128; //only get mad at people if they get close enough to you to anger you, or hurt you
ADDRLP4 20
CNSTF4 1124073472
ASGNF4
line 2084
;2084:			}
line 2085
;2085:		}
line 2086
;2086:	}
ADDRGP4 $888
JUMPV
LABELV $887
line 2089
;2087:
;2088:	while (i <= MAX_CLIENTS)
;2089:	{
line 2090
;2090:		if (i != bs->client && g_entities[i].client && !OnSameTeam(&g_entities[bs->client], &g_entities[i]) && PassStandardEnemyChecks(bs, &g_entities[i]) && trap_InPVS(g_entities[i].client->ps.origin, bs->eye) && PassLovedOneCheck(bs, &g_entities[i]))
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $890
ADDRLP4 64
CNSTI4 852
ASGNI4
ADDRLP4 68
ADDRLP4 64
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 68
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $890
ADDRLP4 72
ADDRGP4 g_entities
ASGNP4
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
MULI4
ADDRLP4 72
INDIRP4
ADDP4
ARGP4
ADDRLP4 68
INDIRI4
ADDRLP4 72
INDIRP4
ADDP4
ARGP4
ADDRLP4 76
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $890
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 80
ADDRGP4 PassStandardEnemyChecks
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $890
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
ADDRFP4 0
INDIRP4
CNSTI4 1744
ADDP4
ARGP4
ADDRLP4 84
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $890
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 88
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $890
line 2091
;2091:		{
line 2092
;2092:			VectorSubtract(g_entities[i].client->ps.origin, bs->eye, a);
ADDRLP4 92
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 92
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 92
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2093
;2093:			distcheck = VectorLength(a);
ADDRLP4 4
ARGP4
ADDRLP4 100
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 100
INDIRF4
ASGNF4
line 2094
;2094:			vectoangles(a, a);
ADDRLP4 4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2096
;2095:
;2096:			if (g_entities[i].client->ps.isJediMaster)
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $899
line 2097
;2097:			{ //make us think the Jedi Master is close so we'll attack him above all
line 2098
;2098:				distcheck = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 2099
;2099:			}
LABELV $899
line 2101
;2100:
;2101:			if (distcheck < closest && ((InFieldOfVision(bs->viewangles, 90, a) && !BotMindTricked(bs->client, i)) || BotCanHear(bs, &g_entities[i], distcheck)) && OrgVisible(bs->eye, g_entities[i].client->ps.origin, -1))
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
GEF4 $902
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1119092736
ARGF4
ADDRLP4 4
ARGP4
ADDRLP4 104
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $906
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 BotMindTricked
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $905
LABELV $906
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 112
ADDRGP4 BotCanHear
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $902
LABELV $905
ADDRFP4 0
INDIRP4
CNSTI4 1744
ADDP4
ARGP4
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
CNSTI4 -1
ARGI4
ADDRLP4 116
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $902
line 2102
;2102:			{
line 2103
;2103:				if (BotMindTricked(bs->client, i))
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 120
ADDRGP4 BotMindTricked
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $907
line 2104
;2104:				{
line 2105
;2105:					if (distcheck < 256 || (level.time - g_entities[i].client->dangerTime) < 100)
ADDRLP4 16
INDIRF4
CNSTF4 1132462080
LTF4 $913
ADDRGP4 level+32
INDIRI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 3000
ADDP4
INDIRI4
SUBI4
CNSTI4 100
GEI4 $908
LABELV $913
line 2106
;2106:					{
line 2107
;2107:						if (!hasEnemyDist || distcheck < (hasEnemyDist - 128))
ADDRLP4 24
INDIRF4
CNSTF4 0
EQF4 $916
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1124073472
SUBF4
GEF4 $908
LABELV $916
line 2108
;2108:						{ //if we have an enemy, only switch to closer if he is 128+ closer to avoid flipping out
line 2109
;2109:							if (!noAttackNonJM || g_entities[i].client->ps.isJediMaster)
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 128
INDIRI4
EQI4 $920
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 128
INDIRI4
EQI4 $908
LABELV $920
line 2110
;2110:							{
line 2111
;2111:								closest = distcheck;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 2112
;2112:								bestindex = i;
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
line 2113
;2113:							}
line 2114
;2114:						}
line 2115
;2115:					}
line 2116
;2116:				}
ADDRGP4 $908
JUMPV
LABELV $907
line 2118
;2117:				else
;2118:				{
line 2119
;2119:					if (!hasEnemyDist || distcheck < (hasEnemyDist - 128))
ADDRLP4 24
INDIRF4
CNSTF4 0
EQF4 $923
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1124073472
SUBF4
GEF4 $921
LABELV $923
line 2120
;2120:					{ //if we have an enemy, only switch to closer if he is 128+ closer to avoid flipping out
line 2121
;2121:						if (!noAttackNonJM || g_entities[i].client->ps.isJediMaster)
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 128
INDIRI4
EQI4 $927
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 128
INDIRI4
EQI4 $924
LABELV $927
line 2122
;2122:						{
line 2123
;2123:							closest = distcheck;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 2124
;2124:							bestindex = i;
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
line 2125
;2125:						}
LABELV $924
line 2126
;2126:					}
LABELV $921
line 2127
;2127:				}
LABELV $908
line 2128
;2128:			}
LABELV $902
line 2129
;2129:		}
LABELV $890
line 2130
;2130:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2131
;2131:	}
LABELV $888
line 2088
ADDRLP4 0
INDIRI4
CNSTI4 32
LEI4 $887
line 2133
;2132:	
;2133:	return bestindex;
ADDRLP4 28
INDIRI4
RETI4
LABELV $871
endproc ScanForEnemies 132 12
export WaitingForNow
proc WaitingForNow 72 8
line 2137
;2134:}
;2135:
;2136:int WaitingForNow(bot_state_t *bs, vec3_t goalpos)
;2137:{ //checks if the bot is doing something along the lines of waiting for an elevator to raise up
line 2140
;2138:	vec3_t xybot, xywp, a;
;2139:
;2140:	if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $929
line 2141
;2141:	{
line 2142
;2142:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $928
JUMPV
LABELV $929
line 2145
;2143:	}
;2144:
;2145:	if ((int)goalpos[0] != (int)bs->wpCurrent->origin[0] ||
ADDRLP4 36
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRF4
CVFI4 4
ADDRLP4 40
INDIRP4
INDIRF4
CVFI4 4
NEI4 $934
ADDRLP4 44
CNSTI4 4
ASGNI4
ADDRLP4 36
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
CVFI4 4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
CVFI4 4
NEI4 $934
ADDRLP4 48
CNSTI4 8
ASGNI4
ADDRLP4 36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
CVFI4 4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
CVFI4 4
EQI4 $931
LABELV $934
line 2148
;2146:		(int)goalpos[1] != (int)bs->wpCurrent->origin[1] ||
;2147:		(int)goalpos[2] != (int)bs->wpCurrent->origin[2])
;2148:	{
line 2149
;2149:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $928
JUMPV
LABELV $931
line 2152
;2150:	}
;2151:
;2152:	VectorCopy(bs->origin, xybot);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 2153
;2153:	VectorCopy(bs->wpCurrent->origin, xywp);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
INDIRB
ASGNB 12
line 2155
;2154:
;2155:	xybot[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2156
;2156:	xywp[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 2158
;2157:
;2158:	VectorSubtract(xybot, xywp, a);
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 2160
;2159:
;2160:	if (VectorLength(a) < 16 && bs->frame_Waypoint_Len > 100)
ADDRLP4 24
ARGP4
ADDRLP4 52
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 52
INDIRF4
CNSTF4 1098907648
GEF4 $943
ADDRFP4 0
INDIRP4
CNSTI4 2044
ADDP4
INDIRF4
CNSTF4 1120403456
LEF4 $943
line 2161
;2161:	{
line 2162
;2162:		if (CheckForFunc(bs->origin, bs->client))
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 CheckForFunc
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $944
line 2163
;2163:		{
line 2164
;2164:			return 1; //we're probably standing on an elevator and riding up/down. Or at least we hope so.
CNSTI4 1
RETI4
ADDRGP4 $928
JUMPV
line 2166
;2165:		}
;2166:	}
LABELV $943
line 2167
;2167:	else if (VectorLength(a) < 64 && bs->frame_Waypoint_Len > 64 &&
ADDRLP4 24
ARGP4
ADDRLP4 56
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 60
CNSTF4 1115684864
ASGNF4
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
GEF4 $947
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 2044
ADDP4
INDIRF4
ADDRLP4 60
INDIRF4
LEF4 $947
ADDRLP4 64
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 CheckForFunc
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $947
line 2169
;2168:		CheckForFunc(bs->origin, bs->client))
;2169:	{
line 2170
;2170:		bs->noUseTime = level.time + 2000;
ADDRFP4 0
INDIRP4
CNSTI4 4800
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2171
;2171:	}
LABELV $947
LABELV $944
line 2173
;2172:
;2173:	return 0;
CNSTI4 0
RETI4
LABELV $928
endproc WaitingForNow 72 8
export BotGetWeaponRange
proc BotGetWeaponRange 8 0
line 2177
;2174:}
;2175:
;2176:int BotGetWeaponRange(bot_state_t *bs)
;2177:{
line 2178
;2178:	switch (bs->cur_ps.weapon)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $951
ADDRLP4 0
INDIRI4
CNSTI4 13
GTI4 $951
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $967-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $967
address $954
address $955
address $956
address $957
address $958
address $959
address $960
address $961
address $962
address $963
address $964
address $965
address $966
code
line 2179
;2179:	{
LABELV $954
line 2181
;2180:	case WP_STUN_BATON:
;2181:		return BWEAPONRANGE_MELEE;
CNSTI4 1
RETI4
ADDRGP4 $950
JUMPV
LABELV $955
line 2183
;2182:	case WP_SABER:
;2183:		return BWEAPONRANGE_SABER;
CNSTI4 4
RETI4
ADDRGP4 $950
JUMPV
LABELV $956
line 2185
;2184:	case WP_BRYAR_PISTOL:
;2185:		return BWEAPONRANGE_MID;
CNSTI4 2
RETI4
ADDRGP4 $950
JUMPV
LABELV $957
line 2187
;2186:	case WP_BLASTER:
;2187:		return BWEAPONRANGE_MID;
CNSTI4 2
RETI4
ADDRGP4 $950
JUMPV
LABELV $958
line 2189
;2188:	case WP_DISRUPTOR:
;2189:		return BWEAPONRANGE_MID;
CNSTI4 2
RETI4
ADDRGP4 $950
JUMPV
LABELV $959
line 2191
;2190:	case WP_BOWCASTER:
;2191:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $950
JUMPV
LABELV $960
line 2193
;2192:	case WP_REPEATER:
;2193:		return BWEAPONRANGE_MID;
CNSTI4 2
RETI4
ADDRGP4 $950
JUMPV
LABELV $961
line 2195
;2194:	case WP_DEMP2:
;2195:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $950
JUMPV
LABELV $962
line 2197
;2196:	case WP_FLECHETTE:
;2197:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $950
JUMPV
LABELV $963
line 2199
;2198:	case WP_ROCKET_LAUNCHER:
;2199:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $950
JUMPV
LABELV $964
line 2201
;2200:	case WP_THERMAL:
;2201:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $950
JUMPV
LABELV $965
line 2203
;2202:	case WP_TRIP_MINE:
;2203:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $950
JUMPV
LABELV $966
line 2205
;2204:	case WP_DET_PACK:
;2205:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $950
JUMPV
LABELV $951
line 2207
;2206:	default:
;2207:		return BWEAPONRANGE_MID;
CNSTI4 2
RETI4
LABELV $950
endproc BotGetWeaponRange 8 0
export BotIsAChickenWuss
proc BotIsAChickenWuss 32 4
line 2212
;2208:	}
;2209:}
;2210:
;2211:int BotIsAChickenWuss(bot_state_t *bs)
;2212:{
line 2215
;2213:	int bWRange;
;2214:
;2215:	if (gLevelFlags & LEVELFLAG_IMUSTNTRUNAWAY)
ADDRGP4 gLevelFlags
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $970
line 2216
;2216:	{
line 2217
;2217:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $969
JUMPV
LABELV $970
line 2220
;2218:	}
;2219:
;2220:	if (g_gametype.integer == GT_SINGLE_PLAYER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $972
line 2221
;2221:	{
line 2222
;2222:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $969
JUMPV
LABELV $972
line 2225
;2223:	}
;2224:
;2225:	if (g_gametype.integer == GT_JEDIMASTER && !bs->cur_ps.isJediMaster)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $975
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
CNSTI4 0
NEI4 $975
line 2226
;2226:	{ //Then you may know no fear.
line 2228
;2227:		//Well, unless he's strong.
;2228:		if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $978
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $978
ADDRLP4 16
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $978
ADDRLP4 8
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 40
LEI4 $978
ADDRLP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 10
GEI4 $978
line 2232
;2229:			bs->currentEnemy->client->ps.isJediMaster &&
;2230:			bs->currentEnemy->health > 40 &&
;2231:			bs->cur_ps.weapon < WP_ROCKET_LAUNCHER)
;2232:		{ //explosive weapons are most effective against the Jedi Master
line 2233
;2233:			goto jmPass;
ADDRGP4 $980
JUMPV
LABELV $978
line 2235
;2234:		}
;2235:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $969
JUMPV
LABELV $975
LABELV $980
line 2238
;2236:	}
;2237:jmPass:
;2238:	if (bs->chickenWussCalculationTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2000
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $981
line 2239
;2239:	{
line 2240
;2240:		return 2; //don't want to keep going between two points...
CNSTI4 2
RETI4
ADDRGP4 $969
JUMPV
LABELV $981
line 2243
;2241:	}
;2242:
;2243:	if (g_gametype.integer == GT_JEDIMASTER && !bs->cur_ps.isJediMaster)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $984
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
CNSTI4 0
NEI4 $984
line 2244
;2244:	{
line 2245
;2245:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $969
JUMPV
LABELV $984
line 2248
;2246:	}
;2247:
;2248:	bs->chickenWussCalculationTime = level.time + MAX_CHICKENWUSS_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 2000
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 2250
;2249:
;2250:	if (g_entities[bs->client].health < BOT_RUN_HEALTH)
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 40
GEI4 $988
line 2251
;2251:	{
line 2252
;2252:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $969
JUMPV
LABELV $988
line 2255
;2253:	}
;2254:
;2255:	bWRange = BotGetWeaponRange(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 2257
;2256:
;2257:	if (bWRange == BWEAPONRANGE_MELEE || bWRange == BWEAPONRANGE_SABER)
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $993
ADDRLP4 0
INDIRI4
CNSTI4 4
NEI4 $991
LABELV $993
line 2258
;2258:	{
line 2259
;2259:		if (bWRange != BWEAPONRANGE_SABER || !bs->saberSpecialist)
ADDRLP4 0
INDIRI4
CNSTI4 4
NEI4 $996
ADDRFP4 0
INDIRP4
CNSTI4 2088
ADDP4
INDIRI4
CNSTI4 0
NEI4 $994
LABELV $996
line 2260
;2260:		{
line 2261
;2261:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $969
JUMPV
LABELV $994
line 2263
;2262:		}
;2263:	}
LABELV $991
line 2265
;2264:
;2265:	if (bs->cur_ps.weapon == WP_BRYAR_PISTOL)
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 3
NEI4 $997
line 2266
;2266:	{ //the bryar is a weak weapon, so just try to find a new one if it's what you're having to use
line 2267
;2267:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $969
JUMPV
LABELV $997
line 2270
;2268:	}
;2269:
;2270:	if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTU4 0
ASGNU4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $999
ADDRLP4 24
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $999
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $999
ADDRLP4 12
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1140850688
GEF4 $999
ADDRLP4 12
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $999
line 2273
;2271:		bs->currentEnemy->client->ps.weapon == WP_SABER &&
;2272:		bs->frame_Enemy_Len < 512 && bs->cur_ps.weapon != WP_SABER)
;2273:	{ //if close to an enemy with a saber and not using a saber, then try to back off
line 2274
;2274:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $969
JUMPV
LABELV $999
line 2278
;2275:	}
;2276:
;2277:	//didn't run, reset the timer
;2278:	bs->chickenWussCalculationTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2000
ADDP4
CNSTF4 0
ASGNF4
line 2280
;2279:
;2280:	return 0;
CNSTI4 0
RETI4
LABELV $969
endproc BotIsAChickenWuss 32 4
export GetNearestBadThing
proc GetNearestBadThing 1224 28
line 2284
;2281:}
;2282:
;2283:gentity_t *GetNearestBadThing(bot_state_t *bs)
;2284:{
line 2285
;2285:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2288
;2286:	float glen;
;2287:	vec3_t hold;
;2288:	int bestindex = 0;
ADDRLP4 1116
CNSTI4 0
ASGNI4
line 2289
;2289:	float bestdist = 800; //if not within a radius of 800, it's no threat anyway
ADDRLP4 1108
CNSTF4 1145569280
ASGNF4
line 2290
;2290:	int foundindex = 0;
ADDRLP4 1112
CNSTI4 0
ASGNI4
line 2291
;2291:	float factor = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRGP4 $1003
JUMPV
LABELV $1002
line 2296
;2292:	gentity_t *ent;
;2293:	trace_t tr;
;2294:
;2295:	while (i < MAX_GENTITIES)
;2296:	{
line 2297
;2297:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 852
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2299
;2298:
;2299:		if ( (ent &&
ADDRLP4 1124
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1124
INDIRU4
EQU4 $1013
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1124
INDIRU4
NEU4 $1013
ADDRLP4 1128
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 1128
INDIRI4
EQI4 $1013
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 1128
INDIRI4
EQI4 $1013
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ADDRLP4 1128
INDIRI4
EQI4 $1013
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
INDIRI4
ADDRLP4 1128
INDIRI4
NEI4 $1008
LABELV $1013
ADDRLP4 1136
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1136
INDIRU4
EQU4 $1005
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 1000
NEI4 $1005
ADDRLP4 1140
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 1140
INDIRI4
EQI4 $1005
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 1140
INDIRI4
LEI4 $1005
ADDRLP4 1144
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1148
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1144
INDIRI4
ADDRLP4 1148
INDIRI4
EQI4 $1005
ADDRLP4 1152
CNSTI4 852
ASGNI4
ADDRLP4 1156
ADDRLP4 1152
INDIRI4
ADDRLP4 1144
INDIRI4
MULI4
ASGNI4
ADDRLP4 1156
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1136
INDIRU4
EQU4 $1005
ADDRLP4 1160
ADDRGP4 g_entities
ASGNP4
ADDRLP4 1152
INDIRI4
ADDRLP4 1148
INDIRI4
MULI4
ADDRLP4 1160
INDIRP4
ADDP4
ARGP4
ADDRLP4 1156
INDIRI4
ADDRLP4 1160
INDIRP4
ADDP4
ARGP4
ADDRLP4 1164
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
NEI4 $1005
LABELV $1008
line 2312
;2300:			!ent->client &&
;2301:			ent->inuse &&
;2302:			ent->damage &&
;2303:			/*(ent->s.weapon == WP_THERMAL || ent->s.weapon == WP_FLECHETTE)*/
;2304:			ent->s.weapon &&
;2305:			ent->splashDamage) ||
;2306:			(ent &&
;2307:			ent->bolt_Head == 1000 &&
;2308:			ent->inuse &&
;2309:			ent->health > 0 &&
;2310:			ent->boltpoint3 != bs->client &&
;2311:			g_entities[ent->boltpoint3].client && !OnSameTeam(&g_entities[bs->client], &g_entities[ent->boltpoint3])) )
;2312:		{ //try to escape from anything with a non-0 s.weapon and non-0 damage. This hopefully only means dangerous projectiles.
line 2314
;2313:		  //Or a sentry gun if bolt_Head == 1000. This is a terrible hack, yes.
;2314:			VectorSubtract(bs->origin, ent->r.currentOrigin, hold);
ADDRLP4 1168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 1168
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 1168
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2315
;2315:			glen = VectorLength(hold);
ADDRLP4 8
ARGP4
ADDRLP4 1176
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 1176
INDIRF4
ASGNF4
line 2317
;2316:
;2317:			if (ent->s.weapon != WP_THERMAL && ent->s.weapon != WP_FLECHETTE &&
ADDRLP4 1180
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 11
EQI4 $1016
ADDRLP4 1180
INDIRI4
CNSTI4 9
EQI4 $1016
ADDRLP4 1180
INDIRI4
CNSTI4 13
EQI4 $1016
ADDRLP4 1180
INDIRI4
CNSTI4 12
EQI4 $1016
line 2319
;2318:				ent->s.weapon != WP_DET_PACK && ent->s.weapon != WP_TRIP_MINE)
;2319:			{
line 2320
;2320:				factor = 0.5;
ADDRLP4 24
CNSTF4 1056964608
ASGNF4
line 2322
;2321:
;2322:				if (ent->s.weapon && glen <= 256 && bs->settings.skill > 2)
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1017
ADDRLP4 20
INDIRF4
CNSTF4 1132462080
GTF4 $1017
ADDRFP4 0
INDIRP4
CNSTI4 1568
ADDP4
INDIRF4
CNSTF4 1073741824
LEF4 $1017
line 2323
;2323:				{ //it's a projectile so push it away
line 2324
;2324:					bs->doForcePush = level.time + 700;
ADDRFP4 0
INDIRP4
CNSTI4 4796
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 700
ADDI4
ASGNI4
line 2326
;2325:					//G_Printf("PUSH PROJECTILE\n");
;2326:				}
line 2327
;2327:			}
ADDRGP4 $1017
JUMPV
LABELV $1016
line 2329
;2328:			else
;2329:			{
line 2330
;2330:				factor = 1;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 2331
;2331:			}
LABELV $1017
line 2333
;2332:
;2333:			if (ent->s.weapon == WP_ROCKET_LAUNCHER &&
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 10
NEI4 $1021
ADDRLP4 1188
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1192
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1188
INDIRI4
ADDRLP4 1192
INDIRI4
EQI4 $1024
ADDRLP4 1188
INDIRI4
CNSTI4 0
LEI4 $1021
ADDRLP4 1188
INDIRI4
CNSTI4 32
GEI4 $1021
ADDRLP4 1196
CNSTI4 852
ASGNI4
ADDRLP4 1200
ADDRLP4 1196
INDIRI4
ADDRLP4 1188
INDIRI4
MULI4
ASGNI4
ADDRLP4 1200
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1021
ADDRLP4 1204
ADDRGP4 g_entities
ASGNP4
ADDRLP4 1196
INDIRI4
ADDRLP4 1192
INDIRI4
MULI4
ADDRLP4 1204
INDIRP4
ADDP4
ARGP4
ADDRLP4 1200
INDIRI4
ADDRLP4 1204
INDIRP4
ADDP4
ARGP4
ADDRLP4 1208
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1208
INDIRI4
CNSTI4 0
EQI4 $1021
LABELV $1024
line 2337
;2334:				(ent->r.ownerNum == bs->client ||
;2335:				(ent->r.ownerNum > 0 && ent->r.ownerNum < MAX_CLIENTS &&
;2336:				g_entities[ent->r.ownerNum].client && OnSameTeam(&g_entities[bs->client], &g_entities[ent->r.ownerNum]))) )
;2337:			{ //don't be afraid of your own rockets or your teammates' rockets
line 2338
;2338:				factor = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 2339
;2339:			}
LABELV $1021
line 2341
;2340:
;2341:			if (glen < bestdist*factor && trap_InPVS(bs->origin, ent->s.pos.trBase))
ADDRLP4 20
INDIRF4
ADDRLP4 1108
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
GEF4 $1025
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 1212
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 1212
INDIRI4
CNSTI4 0
EQI4 $1025
line 2342
;2342:			{
line 2343
;2343:				trap_Trace(&tr, bs->origin, NULL, NULL, ent->s.pos.trBase, bs->client, MASK_SOLID);
ADDRLP4 28
ARGP4
ADDRLP4 1216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1216
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 1220
CNSTP4 0
ASGNP4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 1216
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2345
;2344:
;2345:				if (tr.fraction == 1 || tr.entityNum == ent->s.number)
ADDRLP4 28+8
INDIRF4
CNSTF4 1065353216
EQF4 $1031
ADDRLP4 28+52
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
NEI4 $1027
LABELV $1031
line 2346
;2346:				{
line 2347
;2347:					bestindex = i;
ADDRLP4 1116
ADDRLP4 4
INDIRI4
ASGNI4
line 2348
;2348:					bestdist = glen;
ADDRLP4 1108
ADDRLP4 20
INDIRF4
ASGNF4
line 2349
;2349:					foundindex = 1;
ADDRLP4 1112
CNSTI4 1
ASGNI4
line 2350
;2350:				}
LABELV $1027
line 2351
;2351:			}
LABELV $1025
line 2352
;2352:		}
LABELV $1005
line 2354
;2353:
;2354:		if (ent && !ent->client && ent->inuse && ent->damage && ent->s.weapon && ent->r.ownerNum < MAX_CLIENTS && ent->r.ownerNum >= 0)
ADDRLP4 1172
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1172
INDIRU4
EQU4 $1032
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1172
INDIRU4
NEU4 $1032
ADDRLP4 1176
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 1176
INDIRI4
EQI4 $1032
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 1176
INDIRI4
EQI4 $1032
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ADDRLP4 1176
INDIRI4
EQI4 $1032
ADDRLP4 1180
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 32
GEI4 $1032
ADDRLP4 1180
INDIRI4
ADDRLP4 1176
INDIRI4
LTI4 $1032
line 2355
;2355:		{ //if we're in danger of a projectile belonging to someone and don't have an enemy, set the enemy to them
line 2356
;2356:			gentity_t *projOwner = &g_entities[ent->r.ownerNum];
ADDRLP4 1184
CNSTI4 852
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2358
;2357:
;2358:			if (projOwner && projOwner->inuse && projOwner->client)
ADDRLP4 1192
CNSTU4 0
ASGNU4
ADDRLP4 1184
INDIRP4
CVPU4 4
ADDRLP4 1192
INDIRU4
EQU4 $1034
ADDRLP4 1184
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1034
ADDRLP4 1184
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1192
INDIRU4
EQU4 $1034
line 2359
;2359:			{
line 2360
;2360:				if (!bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1036
line 2361
;2361:				{
line 2362
;2362:					if (PassStandardEnemyChecks(bs, projOwner))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1196
ADDRGP4 PassStandardEnemyChecks
CALLI4
ASGNI4
ADDRLP4 1196
INDIRI4
CNSTI4 0
EQI4 $1038
line 2363
;2363:					{
line 2364
;2364:						if (PassLovedOneCheck(bs, projOwner))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1200
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 1200
INDIRI4
CNSTI4 0
EQI4 $1040
line 2365
;2365:						{
line 2366
;2366:							VectorSubtract(bs->origin, ent->r.currentOrigin, hold);
ADDRLP4 1204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 1204
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 1204
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2367
;2367:							glen = VectorLength(hold);
ADDRLP4 8
ARGP4
ADDRLP4 1212
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 1212
INDIRF4
ASGNF4
line 2369
;2368:
;2369:							if (glen < 512)
ADDRLP4 20
INDIRF4
CNSTF4 1140850688
GEF4 $1044
line 2370
;2370:							{
line 2371
;2371:								bs->currentEnemy = projOwner;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
ADDRLP4 1184
INDIRP4
ASGNP4
line 2372
;2372:								bs->enemySeenTime = level.time + ENEMY_FORGET_MS;
ADDRFP4 0
INDIRP4
CNSTI4 1996
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 2373
;2373:							}
LABELV $1044
line 2374
;2374:						}
LABELV $1040
line 2375
;2375:					}
LABELV $1038
line 2376
;2376:				}
LABELV $1036
line 2377
;2377:			}
LABELV $1034
line 2378
;2378:		}
LABELV $1032
line 2380
;2379:
;2380:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2381
;2381:	}
LABELV $1003
line 2295
ADDRLP4 4
INDIRI4
CNSTI4 1024
LTI4 $1002
line 2383
;2382:
;2383:	if (foundindex)
ADDRLP4 1112
INDIRI4
CNSTI4 0
EQI4 $1047
line 2384
;2384:	{
line 2385
;2385:		bs->dontGoBack = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 2272
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
CVIF4 4
ASGNF4
line 2386
;2386:		return &g_entities[bestindex];
CNSTI4 852
ADDRLP4 1116
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
RETP4
ADDRGP4 $1001
JUMPV
LABELV $1047
line 2389
;2387:	}
;2388:	else
;2389:	{
line 2390
;2390:		return NULL;
CNSTP4 0
RETP4
LABELV $1001
endproc GetNearestBadThing 1224 28
export BotDefendFlag
proc BotDefendFlag 28 4
line 2395
;2391:	}
;2392:}
;2393:
;2394:int BotDefendFlag(bot_state_t *bs)
;2395:{
line 2399
;2396:	wpobject_t *flagPoint;
;2397:	vec3_t a;
;2398:
;2399:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1051
line 2400
;2400:	{
line 2401
;2401:		flagPoint = flagRed;
ADDRLP4 0
ADDRGP4 flagRed
INDIRP4
ASGNP4
line 2402
;2402:	}
ADDRGP4 $1052
JUMPV
LABELV $1051
line 2403
;2403:	else if (level.clients[bs->client].sess.sessionTeam == TEAM_BLUE)
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1053
line 2404
;2404:	{
line 2405
;2405:		flagPoint = flagBlue;
ADDRLP4 0
ADDRGP4 flagBlue
INDIRP4
ASGNP4
line 2406
;2406:	}
ADDRGP4 $1054
JUMPV
LABELV $1053
line 2408
;2407:	else
;2408:	{
line 2409
;2409:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1050
JUMPV
LABELV $1054
LABELV $1052
line 2412
;2410:	}
;2411:
;2412:	if (!flagPoint)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1055
line 2413
;2413:	{
line 2414
;2414:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1050
JUMPV
LABELV $1055
line 2417
;2415:	}
;2416:
;2417:	VectorSubtract(bs->origin, flagPoint->origin, a);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2419
;2418:
;2419:	if (VectorLength(a) > BASE_GUARD_DISTANCE)
ADDRLP4 4
ARGP4
ADDRLP4 24
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 1132462080
LEF4 $1059
line 2420
;2420:	{
line 2421
;2421:		bs->wpDestination = flagPoint;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2422
;2422:	}
LABELV $1059
line 2424
;2423:
;2424:	return 1;
CNSTI4 1
RETI4
LABELV $1050
endproc BotDefendFlag 28 4
export BotGetEnemyFlag
proc BotGetEnemyFlag 28 4
line 2428
;2425:}
;2426:
;2427:int BotGetEnemyFlag(bot_state_t *bs)
;2428:{
line 2432
;2429:	wpobject_t *flagPoint;
;2430:	vec3_t a;
;2431:
;2432:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1062
line 2433
;2433:	{
line 2434
;2434:		flagPoint = flagBlue;
ADDRLP4 0
ADDRGP4 flagBlue
INDIRP4
ASGNP4
line 2435
;2435:	}
ADDRGP4 $1063
JUMPV
LABELV $1062
line 2436
;2436:	else if (level.clients[bs->client].sess.sessionTeam == TEAM_BLUE)
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1064
line 2437
;2437:	{
line 2438
;2438:		flagPoint = flagRed;
ADDRLP4 0
ADDRGP4 flagRed
INDIRP4
ASGNP4
line 2439
;2439:	}
ADDRGP4 $1065
JUMPV
LABELV $1064
line 2441
;2440:	else
;2441:	{
line 2442
;2442:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1061
JUMPV
LABELV $1065
LABELV $1063
line 2445
;2443:	}
;2444:
;2445:	if (!flagPoint)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1066
line 2446
;2446:	{
line 2447
;2447:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1061
JUMPV
LABELV $1066
line 2450
;2448:	}
;2449:
;2450:	VectorSubtract(bs->origin, flagPoint->origin, a);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2452
;2451:
;2452:	if (VectorLength(a) > BASE_GETENEMYFLAG_DISTANCE)
ADDRLP4 4
ARGP4
ADDRLP4 24
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 1132462080
LEF4 $1070
line 2453
;2453:	{
line 2454
;2454:		bs->wpDestination = flagPoint;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2455
;2455:	}
LABELV $1070
line 2457
;2456:
;2457:	return 1;
CNSTI4 1
RETI4
LABELV $1061
endproc BotGetEnemyFlag 28 4
export BotGetFlagBack
proc BotGetFlagBack 52 12
line 2461
;2458:}
;2459:
;2460:int BotGetFlagBack(bot_state_t *bs)
;2461:{
line 2462
;2462:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2463
;2463:	int myFlag = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2464
;2464:	int foundCarrier = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2465
;2465:	int tempInt = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 2466
;2466:	gentity_t *ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2469
;2467:	vec3_t usethisvec;
;2468:
;2469:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1073
line 2470
;2470:	{
line 2471
;2471:		myFlag = PW_REDFLAG;
ADDRLP4 8
CNSTI4 4
ASGNI4
line 2472
;2472:	}
ADDRGP4 $1076
JUMPV
LABELV $1073
line 2474
;2473:	else
;2474:	{
line 2475
;2475:		myFlag = PW_BLUEFLAG;
ADDRLP4 8
CNSTI4 5
ASGNI4
line 2476
;2476:	}
ADDRGP4 $1076
JUMPV
LABELV $1075
line 2479
;2477:
;2478:	while (i < MAX_CLIENTS)
;2479:	{
line 2480
;2480:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 852
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2482
;2481:
;2482:		if (ent && ent->client && ent->client->ps.powerups[myFlag] && !OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 36
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $1078
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $1078
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1078
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $1078
line 2483
;2483:		{
line 2484
;2484:			foundCarrier = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 2485
;2485:			break;
ADDRGP4 $1077
JUMPV
LABELV $1078
line 2488
;2486:		}
;2487:
;2488:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2489
;2489:	}
LABELV $1076
line 2478
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1075
LABELV $1077
line 2491
;2490:
;2491:	if (!foundCarrier)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1080
line 2492
;2492:	{
line 2493
;2493:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1072
JUMPV
LABELV $1080
line 2496
;2494:	}
;2495:
;2496:	if (!ent)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1082
line 2497
;2497:	{
line 2498
;2498:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1072
JUMPV
LABELV $1082
line 2501
;2499:	}
;2500:
;2501:	if (bs->wpDestSwitchTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1084
line 2502
;2502:	{
line 2503
;2503:		if (ent->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1087
line 2504
;2504:		{
line 2505
;2505:			VectorCopy(ent->client->ps.origin, usethisvec);
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2506
;2506:		}
ADDRGP4 $1088
JUMPV
LABELV $1087
line 2508
;2507:		else
;2508:		{
line 2509
;2509:			VectorCopy(ent->s.origin, usethisvec);
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 2510
;2510:		}
LABELV $1088
line 2512
;2511:
;2512:		tempInt = GetNearestVisibleWP(usethisvec, 0);
ADDRLP4 20
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 32
INDIRI4
ASGNI4
line 2514
;2513:
;2514:		if (tempInt != -1 && TotalTrailDistance(bs->wpCurrent->index, tempInt, bs) != -1)
ADDRLP4 36
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 -1
EQI4 $1089
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 3212836864
EQF4 $1089
line 2515
;2515:		{
line 2516
;2516:			bs->wpDestination = gWPArray[tempInt];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2517
;2517:			bs->wpDestSwitchTime = level.time + Q_irand(1000, 5000);
CNSTI4 1000
ARGI4
CNSTI4 5000
ARGI4
ADDRLP4 48
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 2518
;2518:		}
LABELV $1089
line 2519
;2519:	}
LABELV $1084
line 2521
;2520:
;2521:	return 1;
CNSTI4 1
RETI4
LABELV $1072
endproc BotGetFlagBack 52 12
export BotGuardFlagCarrier
proc BotGuardFlagCarrier 52 12
line 2525
;2522:}
;2523:
;2524:int BotGuardFlagCarrier(bot_state_t *bs)
;2525:{
line 2526
;2526:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2527
;2527:	int enemyFlag = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2528
;2528:	int foundCarrier = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2529
;2529:	int tempInt = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 2530
;2530:	gentity_t *ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2533
;2531:	vec3_t usethisvec;
;2532:
;2533:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1093
line 2534
;2534:	{
line 2535
;2535:		enemyFlag = PW_BLUEFLAG;
ADDRLP4 8
CNSTI4 5
ASGNI4
line 2536
;2536:	}
ADDRGP4 $1096
JUMPV
LABELV $1093
line 2538
;2537:	else
;2538:	{
line 2539
;2539:		enemyFlag = PW_REDFLAG;
ADDRLP4 8
CNSTI4 4
ASGNI4
line 2540
;2540:	}
ADDRGP4 $1096
JUMPV
LABELV $1095
line 2543
;2541:
;2542:	while (i < MAX_CLIENTS)
;2543:	{
line 2544
;2544:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 852
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2546
;2545:
;2546:		if (ent && ent->client && ent->client->ps.powerups[enemyFlag] && OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 36
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $1098
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $1098
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1098
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $1098
line 2547
;2547:		{
line 2548
;2548:			foundCarrier = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 2549
;2549:			break;
ADDRGP4 $1097
JUMPV
LABELV $1098
line 2552
;2550:		}
;2551:
;2552:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2553
;2553:	}
LABELV $1096
line 2542
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1095
LABELV $1097
line 2555
;2554:
;2555:	if (!foundCarrier)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1100
line 2556
;2556:	{
line 2557
;2557:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1092
JUMPV
LABELV $1100
line 2560
;2558:	}
;2559:
;2560:	if (!ent)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1102
line 2561
;2561:	{
line 2562
;2562:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1092
JUMPV
LABELV $1102
line 2565
;2563:	}
;2564:
;2565:	if (bs->wpDestSwitchTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1104
line 2566
;2566:	{
line 2567
;2567:		if (ent->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1107
line 2568
;2568:		{
line 2569
;2569:			VectorCopy(ent->client->ps.origin, usethisvec);
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2570
;2570:		}
ADDRGP4 $1108
JUMPV
LABELV $1107
line 2572
;2571:		else
;2572:		{
line 2573
;2573:			VectorCopy(ent->s.origin, usethisvec);
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 2574
;2574:		}
LABELV $1108
line 2576
;2575:
;2576:		tempInt = GetNearestVisibleWP(usethisvec, 0);
ADDRLP4 20
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 32
INDIRI4
ASGNI4
line 2578
;2577:
;2578:		if (tempInt != -1 && TotalTrailDistance(bs->wpCurrent->index, tempInt, bs) != -1)
ADDRLP4 36
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 -1
EQI4 $1109
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 3212836864
EQF4 $1109
line 2579
;2579:		{
line 2580
;2580:			bs->wpDestination = gWPArray[tempInt];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2581
;2581:			bs->wpDestSwitchTime = level.time + Q_irand(1000, 5000);
CNSTI4 1000
ARGI4
CNSTI4 5000
ARGI4
ADDRLP4 48
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 2582
;2582:		}
LABELV $1109
line 2583
;2583:	}
LABELV $1104
line 2585
;2584:
;2585:	return 1;
CNSTI4 1
RETI4
LABELV $1092
endproc BotGuardFlagCarrier 52 12
export BotGetFlagHome
proc BotGetFlagHome 28 4
line 2589
;2586:}
;2587:
;2588:int BotGetFlagHome(bot_state_t *bs)
;2589:{
line 2593
;2590:	wpobject_t *flagPoint;
;2591:	vec3_t a;
;2592:
;2593:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1113
line 2594
;2594:	{
line 2595
;2595:		flagPoint = flagRed;
ADDRLP4 0
ADDRGP4 flagRed
INDIRP4
ASGNP4
line 2596
;2596:	}
ADDRGP4 $1114
JUMPV
LABELV $1113
line 2597
;2597:	else if (level.clients[bs->client].sess.sessionTeam == TEAM_BLUE)
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1115
line 2598
;2598:	{
line 2599
;2599:		flagPoint = flagBlue;
ADDRLP4 0
ADDRGP4 flagBlue
INDIRP4
ASGNP4
line 2600
;2600:	}
ADDRGP4 $1116
JUMPV
LABELV $1115
line 2602
;2601:	else
;2602:	{
line 2603
;2603:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1112
JUMPV
LABELV $1116
LABELV $1114
line 2606
;2604:	}
;2605:
;2606:	if (!flagPoint)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1117
line 2607
;2607:	{
line 2608
;2608:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1112
JUMPV
LABELV $1117
line 2611
;2609:	}
;2610:
;2611:	VectorSubtract(bs->origin, flagPoint->origin, a);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2613
;2612:
;2613:	if (VectorLength(a) > BASE_FLAGWAIT_DISTANCE)
ADDRLP4 4
ARGP4
ADDRLP4 24
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 1132462080
LEF4 $1121
line 2614
;2614:	{
line 2615
;2615:		bs->wpDestination = flagPoint;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2616
;2616:	}
LABELV $1121
line 2618
;2617:
;2618:	return 1;
CNSTI4 1
RETI4
LABELV $1112
endproc BotGetFlagHome 28 4
export GetNewFlagPoint
proc GetNewFlagPoint 1164 28
line 2622
;2619:}
;2620:
;2621:void GetNewFlagPoint(wpobject_t *wp, gentity_t *flagEnt, int team)
;2622:{ //get the nearest possible waypoint to the flag since it's not in its original position
line 2623
;2623:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2627
;2624:	vec3_t a, mins, maxs;
;2625:	float bestdist;
;2626:	float testdist;
;2627:	int bestindex = 0;
ADDRLP4 1132
CNSTI4 0
ASGNI4
line 2628
;2628:	int foundindex = 0;
ADDRLP4 1128
CNSTI4 0
ASGNI4
line 2631
;2629:	trace_t tr;
;2630:
;2631:	mins[0] = -15;
ADDRLP4 1104
CNSTF4 3245342720
ASGNF4
line 2632
;2632:	mins[1] = -15;
ADDRLP4 1104+4
CNSTF4 3245342720
ASGNF4
line 2633
;2633:	mins[2] = -5;
ADDRLP4 1104+8
CNSTF4 3231711232
ASGNF4
line 2634
;2634:	maxs[0] = 15;
ADDRLP4 1116
CNSTF4 1097859072
ASGNF4
line 2635
;2635:	maxs[1] = 15;
ADDRLP4 1116+4
CNSTF4 1097859072
ASGNF4
line 2636
;2636:	maxs[2] = 5;
ADDRLP4 1116+8
CNSTF4 1084227584
ASGNF4
line 2638
;2637:
;2638:	VectorSubtract(wp->origin, flagEnt->s.pos.trBase, a);
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 1136
INDIRP4
INDIRF4
ADDRLP4 1140
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 1136
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1140
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2640
;2639:
;2640:	bestdist = VectorLength(a);
ADDRLP4 4
ARGP4
ADDRLP4 1144
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 1144
INDIRF4
ASGNF4
line 2642
;2641:
;2642:	if (bestdist <= WP_KEEP_FLAG_DIST)
ADDRLP4 20
INDIRF4
CNSTF4 1124073472
GTF4 $1136
line 2643
;2643:	{
line 2644
;2644:		trap_Trace(&tr, wp->origin, mins, maxs, flagEnt->s.pos.trBase, flagEnt->s.number, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1148
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1148
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 1148
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2646
;2645:
;2646:		if (tr.fraction == 1)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $1136
line 2647
;2647:		{ //this point is good
line 2648
;2648:			return;
ADDRGP4 $1123
JUMPV
line 2650
;2649:		}
;2650:	}
LABELV $1135
line 2653
;2651:
;2652:	while (i < gWPNum)
;2653:	{
line 2654
;2654:		VectorSubtract(gWPArray[i]->origin, flagEnt->s.pos.trBase, a);
ADDRLP4 1148
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
ASGNP4
ADDRLP4 1152
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 1148
INDIRP4
INDIRP4
INDIRF4
ADDRLP4 1152
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 1148
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1152
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2655
;2655:		testdist = VectorLength(a);
ADDRLP4 4
ARGP4
ADDRLP4 1156
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 1156
INDIRF4
ASGNF4
line 2657
;2656:
;2657:		if (testdist < bestdist)
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
GEF4 $1140
line 2658
;2658:		{
line 2659
;2659:			trap_Trace(&tr, gWPArray[i]->origin, mins, maxs, flagEnt->s.pos.trBase, flagEnt->s.number, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1160
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1160
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 1160
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2661
;2660:
;2661:			if (tr.fraction == 1)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $1142
line 2662
;2662:			{
line 2663
;2663:				foundindex = 1;
ADDRLP4 1128
CNSTI4 1
ASGNI4
line 2664
;2664:				bestindex = i;
ADDRLP4 1132
ADDRLP4 0
INDIRI4
ASGNI4
line 2665
;2665:				bestdist = testdist;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 2666
;2666:			}
LABELV $1142
line 2667
;2667:		}
LABELV $1140
line 2669
;2668:
;2669:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2670
;2670:	}
LABELV $1136
line 2652
ADDRLP4 0
INDIRI4
ADDRGP4 gWPNum
INDIRI4
LTI4 $1135
line 2672
;2671:
;2672:	if (foundindex)
ADDRLP4 1128
INDIRI4
CNSTI4 0
EQI4 $1145
line 2673
;2673:	{
line 2674
;2674:		if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $1147
line 2675
;2675:		{
line 2676
;2676:			flagRed = gWPArray[bestindex];
ADDRGP4 flagRed
ADDRLP4 1132
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2677
;2677:		}
ADDRGP4 $1148
JUMPV
LABELV $1147
line 2679
;2678:		else
;2679:		{
line 2680
;2680:			flagBlue = gWPArray[bestindex];
ADDRGP4 flagBlue
ADDRLP4 1132
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2681
;2681:		}
LABELV $1148
line 2682
;2682:	}
LABELV $1145
line 2683
;2683:}
LABELV $1123
endproc GetNewFlagPoint 1164 28
export CTFTakesPriority
proc CTFTakesPriority 124 12
line 2686
;2684:
;2685:int CTFTakesPriority(bot_state_t *bs)
;2686:{
line 2687
;2687:	gentity_t *ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2688
;2688:	int enemyFlag = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2689
;2689:	int myFlag = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 2690
;2690:	int enemyHasOurFlag = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 2691
;2691:	int weHaveEnemyFlag = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 2692
;2692:	int numOnMyTeam = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 2693
;2693:	int numOnEnemyTeam = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 2694
;2694:	int numAttackers = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2695
;2695:	int numDefenders = 0;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 2696
;2696:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2698
;2697:	int idleWP;
;2698:	int dosw = 0;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 2699
;2699:	wpobject_t *dest_sw = NULL;
ADDRLP4 48
CNSTP4 0
ASGNP4
line 2706
;2700:#ifdef BOT_CTF_DEBUG
;2701:	vec3_t t;
;2702:
;2703:	G_Printf("CTFSTATE: %s\n", ctfStateNames[bs->ctfState]);
;2704:#endif
;2705:
;2706:	if (g_gametype.integer != GT_CTF && g_gametype.integer != GT_CTY)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $1150
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
EQI4 $1150
line 2707
;2707:	{
line 2708
;2708:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1149
JUMPV
LABELV $1150
line 2711
;2709:	}
;2710:
;2711:	if (bs->cur_ps.weapon == WP_BRYAR_PISTOL &&
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1154
ADDRGP4 level+32
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 1880
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
GEI4 $1154
line 2713
;2712:		(level.time - bs->lastDeadTime) < BOT_MAX_WEAPON_GATHER_TIME)
;2713:	{ //get the nearest weapon laying around base before heading off for battle
line 2714
;2714:		idleWP = GetBestIdleGoal(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 GetBestIdleGoal
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 56
INDIRI4
ASGNI4
line 2716
;2715:
;2716:		if (idleWP != -1 && gWPArray[idleWP] && gWPArray[idleWP]->inuse)
ADDRLP4 60
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 -1
EQI4 $1155
ADDRLP4 64
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1155
ADDRLP4 64
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1155
line 2717
;2717:		{
line 2718
;2718:			if (bs->wpDestSwitchTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1159
line 2719
;2719:			{
line 2720
;2720:				bs->wpDestination = gWPArray[idleWP];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2721
;2721:			}
LABELV $1159
line 2722
;2722:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1149
JUMPV
line 2724
;2723:		}
;2724:	}
LABELV $1154
line 2725
;2725:	else if (bs->cur_ps.weapon == WP_BRYAR_PISTOL &&
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1162
ADDRGP4 level+32
INDIRI4
ADDRLP4 56
INDIRP4
CNSTI4 1880
ADDP4
INDIRI4
SUBI4
CNSTI4 5000
GEI4 $1162
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1162
ADDRLP4 60
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1162
line 2728
;2726:		(level.time - bs->lastDeadTime) < BOT_MAX_WEAPON_CHASE_CTF &&
;2727:		bs->wpDestination && bs->wpDestination->weight)
;2728:	{
line 2729
;2729:		dest_sw = bs->wpDestination;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
line 2730
;2730:		dosw = 1;
ADDRLP4 40
CNSTI4 1
ASGNI4
line 2731
;2731:	}
LABELV $1162
LABELV $1155
line 2733
;2732:
;2733:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1165
line 2734
;2734:	{
line 2735
;2735:		myFlag = PW_REDFLAG;
ADDRLP4 16
CNSTI4 4
ASGNI4
line 2736
;2736:	}
ADDRGP4 $1166
JUMPV
LABELV $1165
line 2738
;2737:	else
;2738:	{
line 2739
;2739:		myFlag = PW_BLUEFLAG;
ADDRLP4 16
CNSTI4 5
ASGNI4
line 2740
;2740:	}
LABELV $1166
line 2742
;2741:
;2742:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1167
line 2743
;2743:	{
line 2744
;2744:		enemyFlag = PW_BLUEFLAG;
ADDRLP4 8
CNSTI4 5
ASGNI4
line 2745
;2745:	}
ADDRGP4 $1168
JUMPV
LABELV $1167
line 2747
;2746:	else
;2747:	{
line 2748
;2748:		enemyFlag = PW_REDFLAG;
ADDRLP4 8
CNSTI4 4
ASGNI4
line 2749
;2749:	}
LABELV $1168
line 2751
;2750:
;2751:	if (!flagRed || !flagBlue ||
ADDRLP4 64
ADDRGP4 flagRed
INDIRP4
ASGNP4
ADDRLP4 68
CNSTU4 0
ASGNU4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
EQU4 $1175
ADDRLP4 72
ADDRGP4 flagBlue
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
EQU4 $1175
ADDRLP4 76
CNSTI4 12
ASGNI4
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $1175
ADDRLP4 72
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $1175
ADDRGP4 eFlagRed
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
EQU4 $1175
ADDRGP4 eFlagBlue
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
NEU4 $1169
LABELV $1175
line 2754
;2752:		!flagRed->inuse || !flagBlue->inuse ||
;2753:		!eFlagRed || !eFlagBlue)
;2754:	{
line 2755
;2755:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1149
JUMPV
LABELV $1169
line 2768
;2756:	}
;2757:
;2758:#ifdef BOT_CTF_DEBUG
;2759:	VectorCopy(flagRed->origin, t);
;2760:	t[2] += 128;
;2761:	G_TestLine(flagRed->origin, t, 0x0000ff, 500);
;2762:
;2763:	VectorCopy(flagBlue->origin, t);
;2764:	t[2] += 128;
;2765:	G_TestLine(flagBlue->origin, t, 0x0000ff, 500);
;2766:#endif
;2767:
;2768:	if (droppedRedFlag && (droppedRedFlag->flags & FL_DROPPED_ITEM))
ADDRLP4 84
ADDRGP4 droppedRedFlag
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1176
ADDRLP4 84
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1176
line 2769
;2769:	{
line 2770
;2770:		GetNewFlagPoint(flagRed, droppedRedFlag, TEAM_RED);
ADDRGP4 flagRed
INDIRP4
ARGP4
ADDRGP4 droppedRedFlag
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 GetNewFlagPoint
CALLV
pop
line 2771
;2771:	}
ADDRGP4 $1177
JUMPV
LABELV $1176
line 2773
;2772:	else
;2773:	{
line 2774
;2774:		flagRed = oFlagRed;
ADDRGP4 flagRed
ADDRGP4 oFlagRed
INDIRP4
ASGNP4
line 2775
;2775:	}
LABELV $1177
line 2777
;2776:
;2777:	if (droppedBlueFlag && (droppedBlueFlag->flags & FL_DROPPED_ITEM))
ADDRLP4 88
ADDRGP4 droppedBlueFlag
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1178
ADDRLP4 88
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1178
line 2778
;2778:	{
line 2779
;2779:		GetNewFlagPoint(flagBlue, droppedBlueFlag, TEAM_BLUE);
ADDRGP4 flagBlue
INDIRP4
ARGP4
ADDRGP4 droppedBlueFlag
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 GetNewFlagPoint
CALLV
pop
line 2780
;2780:	}
ADDRGP4 $1179
JUMPV
LABELV $1178
line 2782
;2781:	else
;2782:	{
line 2783
;2783:		flagBlue = oFlagBlue;
ADDRGP4 flagBlue
ADDRGP4 oFlagBlue
INDIRP4
ASGNP4
line 2784
;2784:	}
LABELV $1179
line 2786
;2785:
;2786:	if (!bs->ctfState)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1180
line 2787
;2787:	{
line 2788
;2788:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1149
JUMPV
LABELV $1180
line 2791
;2789:	}
;2790:
;2791:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1183
JUMPV
LABELV $1182
line 2794
;2792:
;2793:	while (i < MAX_CLIENTS)
;2794:	{
line 2795
;2795:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 852
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2797
;2796:
;2797:		if (ent && ent->client)
ADDRLP4 96
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 96
INDIRU4
EQU4 $1185
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 96
INDIRU4
EQU4 $1185
line 2798
;2798:		{
line 2799
;2799:			if (ent->client->ps.powerups[enemyFlag] && OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1187
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $1187
line 2800
;2800:			{
line 2801
;2801:				weHaveEnemyFlag = 1;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 2802
;2802:			}
ADDRGP4 $1188
JUMPV
LABELV $1187
line 2803
;2803:			else if (ent->client->ps.powerups[myFlag] && !OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1189
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $1189
line 2804
;2804:			{
line 2805
;2805:				enemyHasOurFlag = 1;
ADDRLP4 32
CNSTI4 1
ASGNI4
line 2806
;2806:			}
LABELV $1189
LABELV $1188
line 2808
;2807:
;2808:			if (OnSameTeam(&g_entities[bs->client], ent))
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $1191
line 2809
;2809:			{
line 2810
;2810:				numOnMyTeam++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2811
;2811:			}
ADDRGP4 $1192
JUMPV
LABELV $1191
line 2813
;2812:			else
;2813:			{
line 2814
;2814:				numOnEnemyTeam++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2815
;2815:			}
LABELV $1192
line 2817
;2816:
;2817:			if (botstates[ent->s.number])
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1193
line 2818
;2818:			{
line 2819
;2819:				if (botstates[ent->s.number]->ctfState == CTFSTATE_ATTACKER ||
ADDRLP4 120
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 1
EQI4 $1197
ADDRLP4 120
INDIRI4
CNSTI4 3
NEI4 $1195
LABELV $1197
line 2821
;2820:					botstates[ent->s.number]->ctfState == CTFSTATE_RETRIEVAL)
;2821:				{
line 2822
;2822:					numAttackers++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2823
;2823:				}
ADDRGP4 $1194
JUMPV
LABELV $1195
line 2825
;2824:				else
;2825:				{
line 2826
;2826:					numDefenders++;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2827
;2827:				}
line 2828
;2828:			}
ADDRGP4 $1194
JUMPV
LABELV $1193
line 2830
;2829:			else
;2830:			{ //assume real players to be attackers in our logic
line 2831
;2831:				numAttackers++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2832
;2832:			}
LABELV $1194
line 2833
;2833:		}
LABELV $1185
line 2834
;2834:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2835
;2835:	}
LABELV $1183
line 2793
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1182
line 2837
;2836:
;2837:	if (bs->cur_ps.powerups[enemyFlag])
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 360
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1198
line 2838
;2838:	{
line 2839
;2839:		if ((numOnMyTeam < 2 || !numAttackers) && enemyHasOurFlag)
ADDRLP4 20
INDIRI4
CNSTI4 2
LTI4 $1202
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1200
LABELV $1202
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $1200
line 2840
;2840:		{
line 2841
;2841:			bs->ctfState = CTFSTATE_RETRIEVAL;
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 3
ASGNI4
line 2842
;2842:		}
ADDRGP4 $1199
JUMPV
LABELV $1200
line 2844
;2843:		else
;2844:		{
line 2845
;2845:			bs->ctfState = CTFSTATE_GETFLAGHOME;
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 5
ASGNI4
line 2846
;2846:		}
line 2847
;2847:	}
ADDRGP4 $1199
JUMPV
LABELV $1198
line 2848
;2848:	else if (bs->ctfState == CTFSTATE_GETFLAGHOME)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1203
line 2849
;2849:	{
line 2850
;2850:		bs->ctfState = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 0
ASGNI4
line 2851
;2851:	}
LABELV $1203
LABELV $1199
line 2853
;2852:
;2853:	if (bs->state_Forced)
ADDRFP4 0
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1205
line 2854
;2854:	{
line 2855
;2855:		bs->ctfState = bs->state_Forced;
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 2688
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
ASGNI4
line 2856
;2856:	}
LABELV $1205
line 2858
;2857:
;2858:	if (bs->ctfState == CTFSTATE_DEFENDER)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1207
line 2859
;2859:	{
line 2860
;2860:		if (BotDefendFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 BotDefendFlag
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $1209
line 2861
;2861:		{
line 2862
;2862:			goto success;
ADDRGP4 $1211
JUMPV
LABELV $1209
line 2864
;2863:		}
;2864:	}
LABELV $1207
line 2866
;2865:
;2866:	if (bs->ctfState == CTFSTATE_ATTACKER)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1212
line 2867
;2867:	{
line 2868
;2868:		if (BotGetEnemyFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 BotGetEnemyFlag
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $1214
line 2869
;2869:		{
line 2870
;2870:			goto success;
ADDRGP4 $1211
JUMPV
LABELV $1214
line 2872
;2871:		}
;2872:	}
LABELV $1212
line 2874
;2873:
;2874:	if (bs->ctfState == CTFSTATE_RETRIEVAL)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1216
line 2875
;2875:	{
line 2876
;2876:		if (BotGetFlagBack(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 BotGetFlagBack
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $1218
line 2877
;2877:		{
line 2878
;2878:			goto success;
ADDRGP4 $1211
JUMPV
LABELV $1218
line 2881
;2879:		}
;2880:		else
;2881:		{ //can't find anyone on another team being a carrier, so ignore this priority
line 2882
;2882:			bs->ctfState = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 0
ASGNI4
line 2883
;2883:		}
line 2884
;2884:	}
LABELV $1216
line 2886
;2885:
;2886:	if (bs->ctfState == CTFSTATE_GUARDCARRIER)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1220
line 2887
;2887:	{
line 2888
;2888:		if (BotGuardFlagCarrier(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 BotGuardFlagCarrier
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $1222
line 2889
;2889:		{
line 2890
;2890:			goto success;
ADDRGP4 $1211
JUMPV
LABELV $1222
line 2893
;2891:		}
;2892:		else
;2893:		{ //can't find anyone on our team being a carrier, so ignore this priority
line 2894
;2894:			bs->ctfState = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 0
ASGNI4
line 2895
;2895:		}
line 2896
;2896:	}
LABELV $1220
line 2898
;2897:
;2898:	if (bs->ctfState == CTFSTATE_GETFLAGHOME)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1224
line 2899
;2899:	{
line 2900
;2900:		if (BotGetFlagHome(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 BotGetFlagHome
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $1226
line 2901
;2901:		{
line 2902
;2902:			goto success;
ADDRGP4 $1211
JUMPV
LABELV $1226
line 2904
;2903:		}
;2904:	}
LABELV $1224
line 2906
;2905:
;2906:	return 0;
CNSTI4 0
RETI4
ADDRGP4 $1149
JUMPV
LABELV $1211
line 2909
;2907:
;2908:success:
;2909:	if (dosw)
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $1228
line 2910
;2910:	{ //allow ctf code to run, but if after a particular item then keep going after it
line 2911
;2911:		bs->wpDestination = dest_sw;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 48
INDIRP4
ASGNP4
line 2912
;2912:	}
LABELV $1228
line 2914
;2913:
;2914:	return 1;
CNSTI4 1
RETI4
LABELV $1149
endproc CTFTakesPriority 124 12
export EntityVisibleBox
proc EntityVisibleBox 1084 28
line 2918
;2915:}
;2916:
;2917:int EntityVisibleBox(vec3_t org1, vec3_t mins, vec3_t maxs, vec3_t org2, int ignore, int ignore2)
;2918:{
line 2921
;2919:	trace_t tr;
;2920:
;2921:	trap_Trace(&tr, org1, mins, maxs, org2, ignore, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2923
;2922:
;2923:	if (tr.fraction == 1 && !tr.startsolid && !tr.allsolid)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $1231
ADDRLP4 1080
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1080
INDIRI4
NEI4 $1231
ADDRLP4 0
INDIRI4
ADDRLP4 1080
INDIRI4
NEI4 $1231
line 2924
;2924:	{
line 2925
;2925:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1230
JUMPV
LABELV $1231
line 2927
;2926:	}
;2927:	else if (tr.entityNum != ENTITYNUM_NONE && tr.entityNum == ignore2)
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
EQI4 $1235
ADDRLP4 0+52
INDIRI4
ADDRFP4 20
INDIRI4
NEI4 $1235
line 2928
;2928:	{
line 2929
;2929:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1230
JUMPV
LABELV $1235
line 2932
;2930:	}
;2931:
;2932:	return 0;
CNSTI4 0
RETI4
LABELV $1230
endproc EntityVisibleBox 1084 28
export Saga_TargetClosestObjective
proc Saga_TargetClosestObjective 132 24
line 2936
;2933:}
;2934:
;2935:int Saga_TargetClosestObjective(bot_state_t *bs, int flag)
;2936:{
line 2937
;2937:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2938
;2938:	int bestindex = -1;
ADDRLP4 28
CNSTI4 -1
ASGNI4
line 2939
;2939:	float testdistance = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 2940
;2940:	float bestdistance = 999999999;
ADDRLP4 24
CNSTF4 1315859240
ASGNF4
line 2945
;2941:	gentity_t *goalent;
;2942:	vec3_t a, dif;
;2943:	vec3_t mins, maxs;
;2944:
;2945:	mins[0] = -1;
ADDRLP4 44
CNSTF4 3212836864
ASGNF4
line 2946
;2946:	mins[1] = -1;
ADDRLP4 44+4
CNSTF4 3212836864
ASGNF4
line 2947
;2947:	mins[2] = -1;
ADDRLP4 44+8
CNSTF4 3212836864
ASGNF4
line 2949
;2948:
;2949:	maxs[0] = 1;
ADDRLP4 56
CNSTF4 1065353216
ASGNF4
line 2950
;2950:	maxs[1] = 1;
ADDRLP4 56+4
CNSTF4 1065353216
ASGNF4
line 2951
;2951:	maxs[2] = 1;
ADDRLP4 56+8
CNSTF4 1065353216
ASGNF4
line 2953
;2952:
;2953:	if ( bs->wpDestination && (bs->wpDestination->flags & flag) && bs->wpDestination->associated_entity != ENTITYNUM_NONE &&
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
ADDRLP4 72
CNSTU4 0
ASGNU4
ADDRLP4 68
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $1249
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $1249
ADDRLP4 76
ADDRLP4 68
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 1023
EQI4 $1249
ADDRLP4 80
CNSTI4 852
ADDRLP4 76
INDIRI4
MULI4
ASGNI4
ADDRLP4 80
INDIRI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $1249
ADDRLP4 80
INDIRI4
ADDRGP4 g_entities+652
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $1249
line 2955
;2954:		 &g_entities[bs->wpDestination->associated_entity] && g_entities[bs->wpDestination->associated_entity].use )
;2955:	{
line 2956
;2956:		goto hasPoint;
ADDRGP4 $1247
JUMPV
LABELV $1248
line 2960
;2957:	}
;2958:
;2959:	while (i < gWPNum)
;2960:	{
line 2961
;2961:		if ( gWPArray[i] && gWPArray[i]->inuse && (gWPArray[i]->flags & flag) && gWPArray[i]->associated_entity != ENTITYNUM_NONE &&
ADDRLP4 84
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 88
CNSTU4 0
ASGNU4
ADDRLP4 84
INDIRP4
CVPU4 4
ADDRLP4 88
INDIRU4
EQU4 $1251
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRLP4 84
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $1251
ADDRLP4 84
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
BANDI4
ADDRLP4 92
INDIRI4
EQI4 $1251
ADDRLP4 96
ADDRLP4 84
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 1023
EQI4 $1251
ADDRLP4 100
CNSTI4 852
ADDRLP4 96
INDIRI4
MULI4
ASGNI4
ADDRLP4 100
INDIRI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
ADDRLP4 88
INDIRU4
EQU4 $1251
ADDRLP4 100
INDIRI4
ADDRGP4 g_entities+652
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 88
INDIRU4
EQU4 $1251
line 2963
;2962:			 &g_entities[gWPArray[i]->associated_entity] && g_entities[gWPArray[i]->associated_entity].use )
;2963:		{
line 2964
;2964:			VectorSubtract(gWPArray[i]->origin, bs->origin, a);
ADDRLP4 104
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
ASGNP4
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 104
INDIRP4
INDIRP4
INDIRF4
ADDRLP4 108
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 104
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 108
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2965
;2965:			testdistance = VectorLength(a);
ADDRLP4 4
ARGP4
ADDRLP4 112
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 112
INDIRF4
ASGNF4
line 2967
;2966:
;2967:			if (testdistance < bestdistance)
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
GEF4 $1256
line 2968
;2968:			{
line 2969
;2969:				bestdistance = testdistance;
ADDRLP4 24
ADDRLP4 16
INDIRF4
ASGNF4
line 2970
;2970:				bestindex = i;
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
line 2971
;2971:			}
LABELV $1256
line 2972
;2972:		}
LABELV $1251
line 2974
;2973:
;2974:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2975
;2975:	}
LABELV $1249
line 2959
ADDRLP4 0
INDIRI4
ADDRGP4 gWPNum
INDIRI4
LTI4 $1248
line 2977
;2976:
;2977:	if (bestindex != -1)
ADDRLP4 28
INDIRI4
CNSTI4 -1
EQI4 $1258
line 2978
;2978:	{
line 2979
;2979:		bs->wpDestination = gWPArray[bestindex];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2980
;2980:	}
ADDRGP4 $1259
JUMPV
LABELV $1258
line 2982
;2981:	else
;2982:	{
line 2983
;2983:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1239
JUMPV
LABELV $1259
LABELV $1247
line 2986
;2984:	}
;2985:hasPoint:
;2986:	goalent = &g_entities[bs->wpDestination->associated_entity];
ADDRLP4 20
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2988
;2987:
;2988:	if (!goalent)
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1260
line 2989
;2989:	{
line 2990
;2990:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1239
JUMPV
LABELV $1260
line 2993
;2991:	}
;2992:
;2993:	VectorSubtract(bs->origin, bs->wpDestination->origin, a);
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
ADDRLP4 84
INDIRP4
CNSTI4 1888
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 84
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 84
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 92
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2995
;2994:
;2995:	testdistance = VectorLength(a);
ADDRLP4 4
ARGP4
ADDRLP4 96
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 96
INDIRF4
ASGNF4
line 2997
;2996:
;2997:	dif[0] = (goalent->r.absmax[0]+goalent->r.absmin[0])/2;
ADDRLP4 32
ADDRLP4 20
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2998
;2998:	dif[1] = (goalent->r.absmax[1]+goalent->r.absmin[1])/2;
ADDRLP4 32+4
ADDRLP4 20
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2999
;2999:	dif[2] = (goalent->r.absmax[2]+goalent->r.absmin[2])/2;
ADDRLP4 32+8
ADDRLP4 20
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3002
;3000:	//brush models can have tricky origins, so this is our hacky method of getting the center point
;3001:
;3002:	if (goalent->takedamage && testdistance < BOT_MIN_SAGA_GOAL_SHOOT &&
ADDRLP4 20
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1266
ADDRLP4 16
INDIRF4
CNSTF4 1149239296
GEF4 $1266
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 116
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
INDIRI4
ARGI4
ADDRLP4 120
ADDRGP4 EntityVisibleBox
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $1266
line 3004
;3003:		EntityVisibleBox(bs->origin, mins, maxs, dif, bs->client, goalent->s.number))
;3004:	{
line 3005
;3005:		bs->shootGoal = goalent;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 3006
;3006:		bs->touchGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1840
ADDP4
CNSTP4 0
ASGNP4
line 3007
;3007:	}
ADDRGP4 $1267
JUMPV
LABELV $1266
line 3008
;3008:	else if (goalent->use && testdistance < BOT_MIN_SAGA_GOAL_TRAVEL)
ADDRLP4 20
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1268
ADDRLP4 16
INDIRF4
CNSTF4 1124073472
GEF4 $1268
line 3009
;3009:	{
line 3010
;3010:		bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3011
;3011:		bs->touchGoal = goalent;
ADDRFP4 0
INDIRP4
CNSTI4 1840
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 3012
;3012:	}
ADDRGP4 $1269
JUMPV
LABELV $1268
line 3014
;3013:	else
;3014:	{ //don't know how to handle this goal object!
line 3015
;3015:		bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3016
;3016:		bs->touchGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1840
ADDP4
CNSTP4 0
ASGNP4
line 3017
;3017:	}
LABELV $1269
LABELV $1267
line 3019
;3018:
;3019:	if (BotGetWeaponRange(bs) == BWEAPONRANGE_MELEE ||
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 1
EQI4 $1272
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 4
NEI4 $1270
LABELV $1272
line 3021
;3020:		BotGetWeaponRange(bs) == BWEAPONRANGE_SABER)
;3021:	{
line 3022
;3022:		bs->shootGoal = NULL; //too risky
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3023
;3023:	}
LABELV $1270
line 3025
;3024:
;3025:	if (bs->touchGoal)
ADDRFP4 0
INDIRP4
CNSTI4 1840
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1273
line 3026
;3026:	{
line 3028
;3027:		//G_Printf("Please, master, let me touch it!\n");
;3028:		VectorCopy(dif, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 32
INDIRB
ASGNB 12
line 3029
;3029:	}
LABELV $1273
line 3031
;3030:
;3031:	return 1;
CNSTI4 1
RETI4
LABELV $1239
endproc Saga_TargetClosestObjective 132 24
export Saga_DefendFromAttackers
proc Saga_DefendFromAttackers 68 8
line 3035
;3032:}
;3033:
;3034:void Saga_DefendFromAttackers(bot_state_t *bs)
;3035:{ //this may be a little cheap, but the best way to find our defending point is probably
line 3038
;3036:  //to just find the nearest person on the opposing team since they'll most likely
;3037:  //be on offense in this situation
;3038:	int wpClose = -1;
ADDRLP4 28
CNSTI4 -1
ASGNI4
line 3039
;3039:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3040
;3040:	float testdist = 999999;
ADDRLP4 20
CNSTF4 1232348144
ASGNF4
line 3041
;3041:	int bestindex = -1;
ADDRLP4 32
CNSTI4 -1
ASGNI4
line 3042
;3042:	float bestdist = 999999;
ADDRLP4 24
CNSTF4 1232348144
ASGNF4
ADDRGP4 $1277
JUMPV
LABELV $1276
line 3047
;3043:	gentity_t *ent;
;3044:	vec3_t a;
;3045:
;3046:	while (i < MAX_CLIENTS)
;3047:	{
line 3048
;3048:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 852
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3050
;3049:
;3050:		if (ent && ent->client && ent->client->sess.sessionTeam != g_entities[bs->client].client->sess.sessionTeam &&
ADDRLP4 40
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $1279
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $1279
ADDRLP4 48
CNSTI4 1636
ASGNI4
ADDRLP4 52
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
EQI4 $1279
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1279
ADDRLP4 52
INDIRI4
CNSTI4 3
EQI4 $1279
line 3052
;3051:			ent->health > 0 && ent->client->sess.sessionTeam != TEAM_SPECTATOR)
;3052:		{
line 3053
;3053:			VectorSubtract(ent->client->ps.origin, bs->origin, a);
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 56
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 56
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3055
;3054:
;3055:			testdist = VectorLength(a);
ADDRLP4 8
ARGP4
ADDRLP4 64
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 64
INDIRF4
ASGNF4
line 3057
;3056:
;3057:			if (testdist < bestdist)
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
GEF4 $1284
line 3058
;3058:			{
line 3059
;3059:				bestindex = i;
ADDRLP4 32
ADDRLP4 4
INDIRI4
ASGNI4
line 3060
;3060:				bestdist = testdist;
ADDRLP4 24
ADDRLP4 20
INDIRF4
ASGNF4
line 3061
;3061:			}
LABELV $1284
line 3062
;3062:		}
LABELV $1279
line 3064
;3063:
;3064:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3065
;3065:	}
LABELV $1277
line 3046
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1276
line 3067
;3066:
;3067:	if (bestindex == -1)
ADDRLP4 32
INDIRI4
CNSTI4 -1
NEI4 $1286
line 3068
;3068:	{
line 3069
;3069:		return;
ADDRGP4 $1275
JUMPV
LABELV $1286
line 3072
;3070:	}
;3071:
;3072:	wpClose = GetNearestVisibleWP(g_entities[bestindex].client->ps.origin, -1);	
CNSTI4 852
ADDRLP4 32
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 36
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 36
INDIRI4
ASGNI4
line 3074
;3073:
;3074:	if (wpClose != -1 && gWPArray[wpClose] && gWPArray[wpClose]->inuse)
ADDRLP4 28
INDIRI4
CNSTI4 -1
EQI4 $1289
ADDRLP4 44
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1289
ADDRLP4 44
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1289
line 3075
;3075:	{
line 3076
;3076:		bs->wpDestination = gWPArray[wpClose];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3077
;3077:		bs->destinationGrabTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 3078
;3078:	}
LABELV $1289
line 3079
;3079:}
LABELV $1275
endproc Saga_DefendFromAttackers 68 8
export Saga_CountDefenders
proc Saga_CountDefenders 28 0
line 3082
;3080:
;3081:int Saga_CountDefenders(bot_state_t *bs)
;3082:{
line 3083
;3083:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3084
;3084:	int num = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $1294
JUMPV
LABELV $1293
line 3089
;3085:	gentity_t *ent;
;3086:	bot_state_t *bot;
;3087:
;3088:	while (i < MAX_CLIENTS)
;3089:	{
line 3090
;3090:		ent = &g_entities[i];
ADDRLP4 4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3091
;3091:		bot = botstates[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 3093
;3092:
;3093:		if (ent && ent->client && bot)
ADDRLP4 20
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $1296
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $1296
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $1296
line 3094
;3094:		{
line 3095
;3095:			if (bot->sagaState == SAGASTATE_DEFENDER &&
ADDRLP4 8
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1298
ADDRLP4 24
CNSTI4 1636
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
NEI4 $1298
line 3097
;3096:				ent->client->sess.sessionTeam == g_entities[bs->client].client->sess.sessionTeam)
;3097:			{
line 3098
;3098:				num++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3099
;3099:			}
LABELV $1298
line 3100
;3100:		}
LABELV $1296
line 3102
;3101:
;3102:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3103
;3103:	}
LABELV $1294
line 3088
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1293
line 3105
;3104:
;3105:	return num;
ADDRLP4 12
INDIRI4
RETI4
LABELV $1292
endproc Saga_CountDefenders 28 0
export Saga_CountTeammates
proc Saga_CountTeammates 24 0
line 3109
;3106:}
;3107:
;3108:int Saga_CountTeammates(bot_state_t *bs)
;3109:{
line 3110
;3110:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3111
;3111:	int num = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1303
JUMPV
LABELV $1302
line 3115
;3112:	gentity_t *ent;
;3113:
;3114:	while (i < MAX_CLIENTS)
;3115:	{
line 3116
;3116:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 852
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3118
;3117:
;3118:		if (ent && ent->client)
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $1305
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $1305
line 3119
;3119:		{
line 3120
;3120:			if (ent->client->sess.sessionTeam == g_entities[bs->client].client->sess.sessionTeam)
ADDRLP4 20
CNSTI4 1636
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
NEI4 $1307
line 3121
;3121:			{
line 3122
;3122:				num++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3123
;3123:			}
LABELV $1307
line 3124
;3124:		}
LABELV $1305
line 3126
;3125:
;3126:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3127
;3127:	}
LABELV $1303
line 3114
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1302
line 3129
;3128:
;3129:	return num;
ADDRLP4 8
INDIRI4
RETI4
LABELV $1301
endproc Saga_CountTeammates 24 0
export SagaTakesPriority
proc SagaTakesPriority 1168 28
line 3133
;3130:}
;3131:
;3132:int SagaTakesPriority(bot_state_t *bs)
;3133:{
line 3139
;3134:	int attacker;
;3135:	int flagForDefendableObjective;
;3136:	int flagForAttackableObjective;
;3137:	int defenders, teammates;
;3138:	int idleWP;
;3139:	wpobject_t *dest_sw = NULL;
ADDRLP4 20
CNSTP4 0
ASGNP4
line 3140
;3140:	int dosw = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3145
;3141:	gclient_t *bcl;
;3142:	vec3_t dif;
;3143:	trace_t tr;
;3144:
;3145:	if (g_gametype.integer != GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
EQI4 $1311
line 3146
;3146:	{
line 3147
;3147:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1310
JUMPV
LABELV $1311
line 3150
;3148:	}
;3149:
;3150:	bcl = g_entities[bs->client].client;
ADDRLP4 0
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ASGNP4
line 3152
;3151:
;3152:	if (!bcl)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1315
line 3153
;3153:	{
line 3154
;3154:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1310
JUMPV
LABELV $1315
line 3157
;3155:	}
;3156:
;3157:	if (bs->cur_ps.weapon == WP_BRYAR_PISTOL &&
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1317
ADDRGP4 level+32
INDIRI4
ADDRLP4 1128
INDIRP4
CNSTI4 1880
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
GEI4 $1317
line 3159
;3158:		(level.time - bs->lastDeadTime) < BOT_MAX_WEAPON_GATHER_TIME)
;3159:	{ //get the nearest weapon laying around base before heading off for battle
line 3160
;3160:		idleWP = GetBestIdleGoal(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1132
ADDRGP4 GetBestIdleGoal
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1132
INDIRI4
ASGNI4
line 3162
;3161:
;3162:		if (idleWP != -1 && gWPArray[idleWP] && gWPArray[idleWP]->inuse)
ADDRLP4 1136
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 -1
EQI4 $1318
ADDRLP4 1140
ADDRLP4 1136
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1318
ADDRLP4 1140
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1318
line 3163
;3163:		{
line 3164
;3164:			if (bs->wpDestSwitchTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1322
line 3165
;3165:			{
line 3166
;3166:				bs->wpDestination = gWPArray[idleWP];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3167
;3167:			}
LABELV $1322
line 3168
;3168:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1310
JUMPV
line 3170
;3169:		}
;3170:	}
LABELV $1317
line 3171
;3171:	else if (bs->cur_ps.weapon == WP_BRYAR_PISTOL &&
ADDRLP4 1132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1325
ADDRGP4 level+32
INDIRI4
ADDRLP4 1132
INDIRP4
CNSTI4 1880
ADDP4
INDIRI4
SUBI4
CNSTI4 15000
GEI4 $1325
ADDRLP4 1136
ADDRLP4 1132
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1325
ADDRLP4 1136
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1325
line 3174
;3172:		(level.time - bs->lastDeadTime) < BOT_MAX_WEAPON_CHASE_TIME &&
;3173:		bs->wpDestination && bs->wpDestination->weight)
;3174:	{
line 3175
;3175:		dest_sw = bs->wpDestination;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
line 3176
;3176:		dosw = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 3177
;3177:	}
LABELV $1325
LABELV $1318
line 3179
;3178:
;3179:	if (bcl->sess.sessionTeam == SAGATEAM_IMPERIAL)
ADDRLP4 0
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1328
line 3180
;3180:	{
line 3181
;3181:		attacker = imperial_attackers;
ADDRLP4 12
ADDRGP4 imperial_attackers
INDIRI4
ASGNI4
line 3182
;3182:		flagForDefendableObjective = WPFLAG_SAGA_REBELOBJ;
ADDRLP4 40
CNSTI4 524288
ASGNI4
line 3183
;3183:		flagForAttackableObjective = WPFLAG_SAGA_IMPERIALOBJ;
ADDRLP4 16
CNSTI4 1048576
ASGNI4
line 3184
;3184:	}
ADDRGP4 $1329
JUMPV
LABELV $1328
line 3186
;3185:	else
;3186:	{
line 3187
;3187:		attacker = rebel_attackers;
ADDRLP4 12
ADDRGP4 rebel_attackers
INDIRI4
ASGNI4
line 3188
;3188:		flagForDefendableObjective = WPFLAG_SAGA_IMPERIALOBJ;
ADDRLP4 40
CNSTI4 1048576
ASGNI4
line 3189
;3189:		flagForAttackableObjective = WPFLAG_SAGA_REBELOBJ;
ADDRLP4 16
CNSTI4 524288
ASGNI4
line 3190
;3190:	}
LABELV $1329
line 3192
;3191:
;3192:	if (attacker)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1330
line 3193
;3193:	{
line 3194
;3194:		bs->sagaState = SAGASTATE_ATTACKER;
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
CNSTI4 1
ASGNI4
line 3195
;3195:	}
ADDRGP4 $1331
JUMPV
LABELV $1330
line 3197
;3196:	else
;3197:	{
line 3198
;3198:		bs->sagaState = SAGASTATE_DEFENDER;
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
CNSTI4 2
ASGNI4
line 3199
;3199:		defenders = Saga_CountDefenders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1140
ADDRGP4 Saga_CountDefenders
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 1140
INDIRI4
ASGNI4
line 3200
;3200:		teammates = Saga_CountTeammates(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1144
ADDRGP4 Saga_CountTeammates
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 1144
INDIRI4
ASGNI4
line 3202
;3201:
;3202:		if (defenders > teammates/3 && teammates > 1)
ADDRLP4 1148
ADDRLP4 36
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 1148
INDIRI4
CNSTI4 3
DIVI4
LEI4 $1332
ADDRLP4 1148
INDIRI4
CNSTI4 1
LEI4 $1332
line 3203
;3203:		{ //devote around 1/4 of our team to completing our own side goals even if we're a defender.
line 3205
;3204:		  //If we have no side goals we will realize that later on and join the defenders
;3205:			bs->sagaState = SAGASTATE_ATTACKER;
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
CNSTI4 1
ASGNI4
line 3206
;3206:		}
LABELV $1332
line 3207
;3207:	}
LABELV $1331
line 3209
;3208:
;3209:	if (bs->state_Forced)
ADDRFP4 0
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1334
line 3210
;3210:	{
line 3211
;3211:		bs->sagaState = bs->state_Forced;
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CNSTI4 2692
ADDP4
ADDRLP4 1140
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
ASGNI4
line 3212
;3212:	}
LABELV $1334
line 3214
;3213:
;3214:	if (bs->sagaState == SAGASTATE_ATTACKER)
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1336
line 3215
;3215:	{
line 3216
;3216:		if (!Saga_TargetClosestObjective(bs, flagForAttackableObjective))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 1140
ADDRGP4 Saga_TargetClosestObjective
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $1337
line 3217
;3217:		{ //looks like we have no goals other than to keep the other team from completing objectives
line 3218
;3218:			Saga_DefendFromAttackers(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Saga_DefendFromAttackers
CALLV
pop
line 3219
;3219:			if (bs->shootGoal)
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1337
line 3220
;3220:			{
line 3221
;3221:				dif[0] = (bs->shootGoal->r.absmax[0]+bs->shootGoal->r.absmin[0])/2;
ADDRLP4 1144
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 1144
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 1144
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3222
;3222:				dif[1] = (bs->shootGoal->r.absmax[1]+bs->shootGoal->r.absmin[1])/2;
ADDRLP4 1148
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24+4
ADDRLP4 1148
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 1148
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3223
;3223:				dif[2] = (bs->shootGoal->r.absmax[2]+bs->shootGoal->r.absmin[2])/2;
ADDRLP4 1152
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24+8
ADDRLP4 1152
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 1152
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3225
;3224:				
;3225:				if (!trap_InPVS(bs->origin, dif))
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1156
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $1344
line 3226
;3226:				{
line 3227
;3227:					bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3228
;3228:				}
ADDRGP4 $1337
JUMPV
LABELV $1344
line 3230
;3229:				else
;3230:				{
line 3231
;3231:					trap_Trace(&tr, bs->origin, NULL, NULL, dif, bs->client, MASK_SOLID);
ADDRLP4 48
ARGP4
ADDRLP4 1160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1160
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 1164
CNSTP4 0
ASGNP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1160
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 3233
;3232:
;3233:					if (tr.fraction != 1 && tr.entityNum != bs->shootGoal->s.number)
ADDRLP4 48+8
INDIRF4
CNSTF4 1065353216
EQF4 $1337
ADDRLP4 48+52
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
INDIRI4
EQI4 $1337
line 3234
;3234:					{
line 3235
;3235:						bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3236
;3236:					}
line 3237
;3237:				}
line 3238
;3238:			}
line 3239
;3239:		}
line 3240
;3240:	}
ADDRGP4 $1337
JUMPV
LABELV $1336
line 3241
;3241:	else if (bs->sagaState == SAGASTATE_DEFENDER)
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1350
line 3242
;3242:	{
line 3243
;3243:		Saga_DefendFromAttackers(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Saga_DefendFromAttackers
CALLV
pop
line 3244
;3244:		if (bs->shootGoal)
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1351
line 3245
;3245:		{
line 3246
;3246:			dif[0] = (bs->shootGoal->r.absmax[0]+bs->shootGoal->r.absmin[0])/2;
ADDRLP4 1140
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 1140
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 1140
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3247
;3247:			dif[1] = (bs->shootGoal->r.absmax[1]+bs->shootGoal->r.absmin[1])/2;
ADDRLP4 1144
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24+4
ADDRLP4 1144
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 1144
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3248
;3248:			dif[2] = (bs->shootGoal->r.absmax[2]+bs->shootGoal->r.absmin[2])/2;
ADDRLP4 1148
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24+8
ADDRLP4 1148
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 1148
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3250
;3249:				
;3250:			if (!trap_InPVS(bs->origin, dif))
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1152
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $1356
line 3251
;3251:			{
line 3252
;3252:				bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3253
;3253:			}
ADDRGP4 $1351
JUMPV
LABELV $1356
line 3255
;3254:			else
;3255:			{
line 3256
;3256:				trap_Trace(&tr, bs->origin, NULL, NULL, dif, bs->client, MASK_SOLID);
ADDRLP4 48
ARGP4
ADDRLP4 1156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 1160
CNSTP4 0
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1156
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 3258
;3257:
;3258:				if (tr.fraction != 1 && tr.entityNum != bs->shootGoal->s.number)
ADDRLP4 48+8
INDIRF4
CNSTF4 1065353216
EQF4 $1351
ADDRLP4 48+52
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
INDIRI4
EQI4 $1351
line 3259
;3259:				{
line 3260
;3260:					bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3261
;3261:				}
line 3262
;3262:			}
line 3263
;3263:		}
line 3264
;3264:	}
ADDRGP4 $1351
JUMPV
LABELV $1350
line 3266
;3265:	else
;3266:	{ //get busy!
line 3267
;3267:		Saga_TargetClosestObjective(bs, flagForAttackableObjective);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 Saga_TargetClosestObjective
CALLI4
pop
line 3268
;3268:		if (bs->shootGoal)
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1362
line 3269
;3269:		{
line 3270
;3270:			dif[0] = (bs->shootGoal->r.absmax[0]+bs->shootGoal->r.absmin[0])/2;
ADDRLP4 1140
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 1140
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 1140
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3271
;3271:			dif[1] = (bs->shootGoal->r.absmax[1]+bs->shootGoal->r.absmin[1])/2;
ADDRLP4 1144
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24+4
ADDRLP4 1144
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 1144
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3272
;3272:			dif[2] = (bs->shootGoal->r.absmax[2]+bs->shootGoal->r.absmin[2])/2;
ADDRLP4 1148
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24+8
ADDRLP4 1148
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 1148
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3274
;3273:				
;3274:			if (!trap_InPVS(bs->origin, dif))
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1152
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $1366
line 3275
;3275:			{
line 3276
;3276:				bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3277
;3277:			}
ADDRGP4 $1367
JUMPV
LABELV $1366
line 3279
;3278:			else
;3279:			{
line 3280
;3280:				trap_Trace(&tr, bs->origin, NULL, NULL, dif, bs->client, MASK_SOLID);
ADDRLP4 48
ARGP4
ADDRLP4 1156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 1160
CNSTP4 0
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1156
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 3282
;3281:
;3282:				if (tr.fraction != 1 && tr.entityNum != bs->shootGoal->s.number)
ADDRLP4 48+8
INDIRF4
CNSTF4 1065353216
EQF4 $1368
ADDRLP4 48+52
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
INDIRI4
EQI4 $1368
line 3283
;3283:				{
line 3284
;3284:					bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3285
;3285:				}
LABELV $1368
line 3286
;3286:			}
LABELV $1367
line 3287
;3287:		}
LABELV $1362
line 3288
;3288:	}
LABELV $1351
LABELV $1337
line 3290
;3289:
;3290:	if (dosw)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1372
line 3291
;3291:	{ //allow saga objective code to run, but if after a particular item then keep going after it
line 3292
;3292:		bs->wpDestination = dest_sw;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 3293
;3293:	}
LABELV $1372
line 3295
;3294:
;3295:	return 1;
CNSTI4 1
RETI4
LABELV $1310
endproc SagaTakesPriority 1168 28
export JMTakesPriority
proc JMTakesPriority 24 8
line 3299
;3296:}
;3297:
;3298:int JMTakesPriority(bot_state_t *bs)
;3299:{
line 3300
;3300:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3301
;3301:	int wpClose = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 3302
;3302:	gentity_t *theImportantEntity = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 3304
;3303:
;3304:	if (g_gametype.integer != GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $1375
line 3305
;3305:	{
line 3306
;3306:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1374
JUMPV
LABELV $1375
line 3309
;3307:	}
;3308:
;3309:	if (bs->cur_ps.isJediMaster)
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1378
line 3310
;3310:	{
line 3311
;3311:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1374
JUMPV
LABELV $1378
line 3316
;3312:	}
;3313:
;3314:	//jmState becomes the index for the one who carries the saber. If jmState is -1 then the saber is currently
;3315:	//without an owner
;3316:	bs->jmState = -1;
ADDRFP4 0
INDIRP4
CNSTI4 2700
ADDP4
CNSTI4 -1
ASGNI4
ADDRGP4 $1381
JUMPV
LABELV $1380
line 3319
;3317:
;3318:	while (i < MAX_CLIENTS)
;3319:	{
line 3320
;3320:		if (g_entities[i].client && g_entities[i].inuse &&
ADDRLP4 12
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1383
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1383
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1383
line 3322
;3321:			g_entities[i].client->ps.isJediMaster)
;3322:		{
line 3323
;3323:			bs->jmState = i;
ADDRFP4 0
INDIRP4
CNSTI4 2700
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 3324
;3324:			break;
ADDRGP4 $1382
JUMPV
LABELV $1383
line 3327
;3325:		}
;3326:
;3327:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3328
;3328:	}
LABELV $1381
line 3318
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1380
LABELV $1382
line 3330
;3329:
;3330:	if (bs->jmState != -1)
ADDRFP4 0
INDIRP4
CNSTI4 2700
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1388
line 3331
;3331:	{
line 3332
;3332:		theImportantEntity = &g_entities[bs->jmState];
ADDRLP4 4
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 2700
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3333
;3333:	}
ADDRGP4 $1389
JUMPV
LABELV $1388
line 3335
;3334:	else
;3335:	{
line 3336
;3336:		theImportantEntity = gJMSaberEnt;
ADDRLP4 4
ADDRGP4 gJMSaberEnt
INDIRP4
ASGNP4
line 3337
;3337:	}
LABELV $1389
line 3339
;3338:
;3339:	if (theImportantEntity && theImportantEntity->inuse && bs->destinationGrabTime < level.time)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1390
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1390
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1390
line 3340
;3340:	{
line 3341
;3341:		if (theImportantEntity->client)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1393
line 3342
;3342:		{
line 3343
;3343:			wpClose = GetNearestVisibleWP(theImportantEntity->client->ps.origin, theImportantEntity->s.number);	
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 3344
;3344:		}
ADDRGP4 $1394
JUMPV
LABELV $1393
line 3346
;3345:		else
;3346:		{
line 3347
;3347:			wpClose = GetNearestVisibleWP(theImportantEntity->r.currentOrigin, theImportantEntity->s.number);	
ADDRLP4 4
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 3348
;3348:		}
LABELV $1394
line 3350
;3349:
;3350:		if (wpClose != -1 && gWPArray[wpClose] && gWPArray[wpClose]->inuse)
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $1395
ADDRLP4 20
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1395
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1395
line 3351
;3351:		{
line 3364
;3352:			/*
;3353:			Com_Printf("BOT GRABBED IDEAL JM LOCATION\n");
;3354:			if (bs->wpDestination != gWPArray[wpClose])
;3355:			{
;3356:				Com_Printf("IDEAL WAS NOT ALREADY IDEAL\n");
;3357:
;3358:				if (!bs->wpDestination)
;3359:				{
;3360:					Com_Printf("IDEAL WAS NULL\n");
;3361:				}
;3362:			}
;3363:			*/
;3364:			bs->wpDestination = gWPArray[wpClose];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3365
;3365:			bs->destinationGrabTime = level.time + 4000;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 4000
ADDI4
CVIF4 4
ASGNF4
line 3366
;3366:		}
LABELV $1395
line 3367
;3367:	}
LABELV $1390
line 3369
;3368:
;3369:	return 1;
CNSTI4 1
RETI4
LABELV $1374
endproc JMTakesPriority 24 8
export BotHasAssociated
proc BotHasAssociated 12 0
line 3373
;3370:}
;3371:
;3372:int BotHasAssociated(bot_state_t *bs, wpobject_t *wp)
;3373:{
line 3376
;3374:	gentity_t *as;
;3375:
;3376:	if (wp->associated_entity == ENTITYNUM_NONE)
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1399
line 3377
;3377:	{ //make it think this is an item we have so we don't go after nothing
line 3378
;3378:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1399
line 3381
;3379:	}
;3380:
;3381:	as = &g_entities[wp->associated_entity];
ADDRLP4 0
CNSTI4 852
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3383
;3382:
;3383:	if (!as || !as->item)
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $1403
ADDRLP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $1401
LABELV $1403
line 3384
;3384:	{
line 3385
;3385:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1401
line 3388
;3386:	}
;3387:
;3388:	if (as->item->giType == IT_WEAPON)
ADDRLP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1404
line 3389
;3389:	{
line 3390
;3390:		if (bs->cur_ps.stats[STAT_WEAPONS] & (1 << as->item->giTag))
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1406
line 3391
;3391:		{
line 3392
;3392:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1406
line 3395
;3393:		}
;3394:
;3395:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1404
line 3397
;3396:	}
;3397:	else if (as->item->giType == IT_HOLDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $1408
line 3398
;3398:	{
line 3399
;3399:		if (bs->cur_ps.stats[STAT_HOLDABLE_ITEMS] & (1 << as->item->giTag))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1410
line 3400
;3400:		{
line 3401
;3401:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1410
line 3404
;3402:		}
;3403:
;3404:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1408
line 3406
;3405:	}
;3406:	else if (as->item->giType == IT_POWERUP)
ADDRLP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1412
line 3407
;3407:	{
line 3408
;3408:		if (bs->cur_ps.powerups[as->item->giTag])
ADDRLP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 360
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1414
line 3409
;3409:		{
line 3410
;3410:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1414
line 3413
;3411:		}
;3412:
;3413:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1412
line 3415
;3414:	}
;3415:	else if (as->item->giType == IT_AMMO)
ADDRLP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1416
line 3416
;3416:	{
line 3417
;3417:		if (bs->cur_ps.ammo[as->item->giTag] > 10) //hack
ADDRLP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
CNSTI4 10
LEI4 $1418
line 3418
;3418:		{
line 3419
;3419:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1418
line 3422
;3420:		}
;3421:
;3422:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1398
JUMPV
LABELV $1416
line 3425
;3423:	}
;3424:
;3425:	return 0;
CNSTI4 0
RETI4
LABELV $1398
endproc BotHasAssociated 12 0
export GetBestIdleGoal
proc GetBestIdleGoal 40 12
line 3429
;3426:}
;3427:
;3428:int GetBestIdleGoal(bot_state_t *bs)
;3429:{
line 3430
;3430:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3431
;3431:	int highestweight = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3432
;3432:	int desiredindex = -1;
ADDRLP4 16
CNSTI4 -1
ASGNI4
line 3433
;3433:	int dist_to_weight = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 3436
;3434:	int traildist;
;3435:
;3436:	if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1421
line 3437
;3437:	{
line 3438
;3438:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $1420
JUMPV
LABELV $1421
line 3441
;3439:	}
;3440:
;3441:	if (bs->isCamper != 2)
ADDRFP4 0
INDIRP4
CNSTI4 2060
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1423
line 3442
;3442:	{
line 3443
;3443:		if (bs->randomNavTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2080
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1425
line 3444
;3444:		{
line 3445
;3445:			if (Q_irand(1, 10) < 5)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 20
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 5
GEI4 $1428
line 3446
;3446:			{
line 3447
;3447:				bs->randomNav = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2084
ADDP4
CNSTI4 1
ASGNI4
line 3448
;3448:			}
ADDRGP4 $1429
JUMPV
LABELV $1428
line 3450
;3449:			else
;3450:			{
line 3451
;3451:				bs->randomNav = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2084
ADDP4
CNSTI4 0
ASGNI4
line 3452
;3452:			}
LABELV $1429
line 3454
;3453:			
;3454:			bs->randomNavTime = level.time + Q_irand(5000, 15000);
CNSTI4 5000
ARGI4
CNSTI4 15000
ARGI4
ADDRLP4 24
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2080
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
line 3455
;3455:		}
LABELV $1425
line 3456
;3456:	}
LABELV $1423
line 3458
;3457:
;3458:	if (bs->randomNav)
ADDRFP4 0
INDIRP4
CNSTI4 2084
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1434
line 3459
;3459:	{ //stop looking for items and/or camping on them
line 3460
;3460:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $1420
JUMPV
LABELV $1433
line 3464
;3461:	}
;3462:
;3463:	while (i < gWPNum)
;3464:	{
line 3465
;3465:		if (gWPArray[i] &&
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1436
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $1436
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 65536
BANDI4
ADDRLP4 24
INDIRI4
EQI4 $1436
ADDRLP4 20
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
LEF4 $1436
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 BotHasAssociated
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $1436
line 3470
;3466:			gWPArray[i]->inuse &&
;3467:			(gWPArray[i]->flags & WPFLAG_GOALPOINT) &&
;3468:			gWPArray[i]->weight > highestweight &&
;3469:			!BotHasAssociated(bs, gWPArray[i]))
;3470:		{
line 3471
;3471:			traildist = TotalTrailDistance(bs->wpCurrent->index, i, bs);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 36
INDIRF4
CVFI4 4
ASGNI4
line 3473
;3472:
;3473:			if (traildist != -1)
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $1438
line 3474
;3474:			{
line 3475
;3475:				dist_to_weight = (int)traildist/10000;
ADDRLP4 12
ADDRLP4 8
INDIRI4
CNSTI4 10000
DIVI4
ASGNI4
line 3476
;3476:				dist_to_weight = (gWPArray[i]->weight)-dist_to_weight;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 12
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
line 3478
;3477:
;3478:				if (dist_to_weight > highestweight)
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $1440
line 3479
;3479:				{
line 3480
;3480:					highestweight = dist_to_weight;
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 3481
;3481:					desiredindex = i;
ADDRLP4 16
ADDRLP4 0
INDIRI4
ASGNI4
line 3482
;3482:				}
LABELV $1440
line 3483
;3483:			}
LABELV $1438
line 3484
;3484:		}
LABELV $1436
line 3486
;3485:
;3486:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3487
;3487:	}
LABELV $1434
line 3463
ADDRLP4 0
INDIRI4
ADDRGP4 gWPNum
INDIRI4
LTI4 $1433
line 3489
;3488:
;3489:	return desiredindex;
ADDRLP4 16
INDIRI4
RETI4
LABELV $1420
endproc GetBestIdleGoal 40 12
export GetIdealDestination
proc GetIdealDestination 160 12
line 3493
;3490:}
;3491:
;3492:void GetIdealDestination(bot_state_t *bs)
;3493:{
line 3508
;3494:	int tempInt, cWPIndex, bChicken, idleWP;
;3495:	float distChange, plusLen, minusLen;
;3496:	vec3_t usethisvec, a;
;3497:	gentity_t *badthing;
;3498:
;3499:#ifdef _DEBUG
;3500:	trap_Cvar_Update(&bot_nogoals);
;3501:
;3502:	if (bot_nogoals.integer)
;3503:	{
;3504:		return;
;3505:	}
;3506:#endif
;3507:
;3508:	if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1443
line 3509
;3509:	{
line 3510
;3510:		return;
ADDRGP4 $1442
JUMPV
LABELV $1443
line 3513
;3511:	}
;3512:
;3513:	if ((level.time - bs->escapeDirTime) > 4000)
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
CNSTI4 2268
ADDP4
INDIRF4
SUBF4
CNSTF4 1165623296
LEF4 $1445
line 3514
;3514:	{
line 3515
;3515:		badthing = GetNearestBadThing(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 GetNearestBadThing
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
ASGNP4
line 3516
;3516:	}
ADDRGP4 $1446
JUMPV
LABELV $1445
line 3518
;3517:	else
;3518:	{
line 3519
;3519:		badthing = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 3520
;3520:	}
LABELV $1446
line 3522
;3521:
;3522:	if (badthing && badthing->inuse &&
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1448
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $1448
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
LEI4 $1448
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $1448
line 3524
;3523:		badthing->health > 0 && badthing->takedamage)
;3524:	{
line 3525
;3525:		bs->dangerousObject = badthing;
ADDRFP4 0
INDIRP4
CNSTI4 1848
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 3526
;3526:	}
ADDRGP4 $1449
JUMPV
LABELV $1448
line 3528
;3527:	else
;3528:	{
line 3529
;3529:		bs->dangerousObject = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1848
ADDP4
CNSTP4 0
ASGNP4
line 3530
;3530:	}
LABELV $1449
line 3532
;3531:
;3532:	if (!badthing && bs->wpDestIgnoreTime > level.time)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1450
ADDRFP4 0
INDIRP4
CNSTI4 1988
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $1450
line 3533
;3533:	{
line 3534
;3534:		return;
ADDRGP4 $1442
JUMPV
LABELV $1450
line 3537
;3535:	}
;3536:
;3537:	if (!badthing && bs->dontGoBack > level.time)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1453
ADDRFP4 0
INDIRP4
CNSTI4 2272
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $1453
line 3538
;3538:	{
line 3539
;3539:		if (bs->wpDestination)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1456
line 3540
;3540:		{
line 3541
;3541:			bs->wpStoreDest = bs->wpDestination;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 1892
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
line 3542
;3542:		}
LABELV $1456
line 3543
;3543:		bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 3544
;3544:		return;
ADDRGP4 $1442
JUMPV
LABELV $1453
line 3546
;3545:	}
;3546:	else if (!badthing && bs->wpStoreDest)
ADDRLP4 64
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
NEU4 $1458
ADDRFP4 0
INDIRP4
CNSTI4 1892
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
EQU4 $1458
line 3547
;3547:	{ //after we finish running away, switch back to our original destination
line 3548
;3548:		bs->wpDestination = bs->wpStoreDest;
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 1892
ADDP4
INDIRP4
ASGNP4
line 3549
;3549:		bs->wpStoreDest = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1892
ADDP4
CNSTP4 0
ASGNP4
line 3550
;3550:	}
LABELV $1458
line 3552
;3551:
;3552:	if (badthing && bs->wpCamping)
ADDRLP4 68
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
EQU4 $1460
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
EQU4 $1460
line 3553
;3553:	{
line 3554
;3554:		bs->wpCamping = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
CNSTP4 0
ASGNP4
line 3555
;3555:	}
LABELV $1460
line 3557
;3556:
;3557:	if (bs->wpCamping)
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1462
line 3558
;3558:	{
line 3559
;3559:		bs->wpDestination = bs->wpCamping;
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
ASGNP4
line 3560
;3560:		return;
ADDRGP4 $1442
JUMPV
LABELV $1462
line 3563
;3561:	}
;3562:
;3563:	if (!badthing && CTFTakesPriority(bs))
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1464
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 CTFTakesPriority
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $1464
line 3564
;3564:	{
line 3565
;3565:		if (bs->ctfState)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1442
line 3566
;3566:		{
line 3567
;3567:			bs->runningToEscapeThreat = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2312
ADDP4
CNSTI4 1
ASGNI4
line 3568
;3568:		}
line 3569
;3569:		return;
ADDRGP4 $1442
JUMPV
LABELV $1464
line 3571
;3570:	}
;3571:	else if (!badthing && SagaTakesPriority(bs))
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1468
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 SagaTakesPriority
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $1468
line 3572
;3572:	{
line 3573
;3573:		if (bs->sagaState)
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1442
line 3574
;3574:		{
line 3575
;3575:			bs->runningToEscapeThreat = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2312
ADDP4
CNSTI4 1
ASGNI4
line 3576
;3576:		}
line 3577
;3577:		return;
ADDRGP4 $1442
JUMPV
LABELV $1468
line 3579
;3578:	}
;3579:	else if (!badthing && JMTakesPriority(bs))
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1472
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 JMTakesPriority
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $1472
line 3580
;3580:	{
line 3581
;3581:		bs->runningToEscapeThreat = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2312
ADDP4
CNSTI4 1
ASGNI4
line 3582
;3582:	}
LABELV $1472
line 3584
;3583:
;3584:	if (badthing)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1474
line 3585
;3585:	{
line 3586
;3586:		bs->runningLikeASissy = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2308
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 3588
;3587:
;3588:		if (bs->wpDestination)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1477
line 3589
;3589:		{
line 3590
;3590:			bs->wpStoreDest = bs->wpDestination;
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 1892
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
line 3591
;3591:		}
LABELV $1477
line 3592
;3592:		bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 3594
;3593:
;3594:		if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1479
line 3595
;3595:		{
line 3596
;3596:			tempInt = bs->wpCurrent->index+1;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3597
;3597:		}
ADDRGP4 $1480
JUMPV
LABELV $1479
line 3599
;3598:		else
;3599:		{
line 3600
;3600:			tempInt = bs->wpCurrent->index-1;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3601
;3601:		}
LABELV $1480
line 3603
;3602:
;3603:		if (gWPArray[tempInt] && gWPArray[tempInt]->inuse && bs->escapeDirTime < level.time)
ADDRLP4 84
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1442
ADDRLP4 84
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1442
ADDRFP4 0
INDIRP4
CNSTI4 2268
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1442
line 3604
;3604:		{
line 3605
;3605:			VectorSubtract(badthing->s.pos.trBase, bs->wpCurrent->origin, a);
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3606
;3606:			plusLen = VectorLength(a);
ADDRLP4 12
ARGP4
ADDRLP4 96
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 96
INDIRF4
ASGNF4
line 3607
;3607:			VectorSubtract(badthing->s.pos.trBase, gWPArray[tempInt]->origin, a);
ADDRLP4 104
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 104
INDIRP4
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 104
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3608
;3608:			minusLen = VectorLength(a);
ADDRLP4 12
ARGP4
ADDRLP4 108
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 108
INDIRF4
ASGNF4
line 3610
;3609:
;3610:			if (plusLen < minusLen)
ADDRLP4 44
INDIRF4
ADDRLP4 48
INDIRF4
GEF4 $1442
line 3611
;3611:			{
line 3612
;3612:				if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1490
line 3613
;3613:				{
line 3614
;3614:					bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 3615
;3615:				}
ADDRGP4 $1491
JUMPV
LABELV $1490
line 3617
;3616:				else
;3617:				{
line 3618
;3618:					bs->wpDirection = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 1
ASGNI4
line 3619
;3619:				}
LABELV $1491
line 3621
;3620:
;3621:				bs->wpCurrent = gWPArray[tempInt];
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3623
;3622:
;3623:				bs->escapeDirTime = level.time + Q_irand(500, 1000);//Q_irand(1000, 1400);
CNSTI4 500
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 112
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2268
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 112
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 3626
;3624:
;3625:				//G_Printf("Escaping from scary bad thing [%s]\n", badthing->classname);
;3626:			}
line 3627
;3627:		}
line 3629
;3628:		//G_Printf("Run away run away run away!\n");
;3629:		return;
ADDRGP4 $1442
JUMPV
LABELV $1474
line 3632
;3630:	}
;3631:
;3632:	distChange = 0; //keep the compiler from complaining
ADDRLP4 24
CNSTF4 0
ASGNF4
line 3634
;3633:
;3634:	tempInt = BotGetWeaponRange(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 84
INDIRI4
ASGNI4
line 3636
;3635:
;3636:	if (tempInt == BWEAPONRANGE_MELEE)
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $1493
line 3637
;3637:	{
line 3638
;3638:		distChange = 1;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 3639
;3639:	}
ADDRGP4 $1494
JUMPV
LABELV $1493
line 3640
;3640:	else if (tempInt == BWEAPONRANGE_SABER)
ADDRLP4 4
INDIRI4
CNSTI4 4
NEI4 $1495
line 3641
;3641:	{
line 3642
;3642:		distChange = 1;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 3643
;3643:	}
ADDRGP4 $1496
JUMPV
LABELV $1495
line 3644
;3644:	else if (tempInt == BWEAPONRANGE_MID)
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $1497
line 3645
;3645:	{
line 3646
;3646:		distChange = 128;
ADDRLP4 24
CNSTF4 1124073472
ASGNF4
line 3647
;3647:	}
ADDRGP4 $1498
JUMPV
LABELV $1497
line 3648
;3648:	else if (tempInt == BWEAPONRANGE_LONG)
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $1499
line 3649
;3649:	{
line 3650
;3650:		distChange = 300;
ADDRLP4 24
CNSTF4 1133903872
ASGNF4
line 3651
;3651:	}
LABELV $1499
LABELV $1498
LABELV $1496
LABELV $1494
line 3653
;3652:
;3653:	if (bs->revengeEnemy && bs->revengeEnemy->health > 0 &&
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
ASGNP4
ADDRLP4 92
CNSTU4 0
ASGNU4
ADDRLP4 88
INDIRP4
CVPU4 4
ADDRLP4 92
INDIRU4
EQU4 $1501
ADDRLP4 88
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1501
ADDRLP4 96
ADDRLP4 88
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CVPU4 4
ADDRLP4 92
INDIRU4
EQU4 $1501
ADDRLP4 100
ADDRLP4 96
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 8
EQI4 $1503
ADDRLP4 100
INDIRI4
CNSTI4 2
NEI4 $1501
LABELV $1503
line 3655
;3654:		bs->revengeEnemy->client && (bs->revengeEnemy->client->pers.connected == CA_ACTIVE || bs->revengeEnemy->client->pers.connected == CA_AUTHORIZING))
;3655:	{ //if we hate someone, always try to get to them
line 3656
;3656:		if (bs->wpDestSwitchTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1502
line 3657
;3657:		{
line 3658
;3658:			if (bs->revengeEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1507
line 3659
;3659:			{
line 3660
;3660:				VectorCopy(bs->revengeEnemy->client->ps.origin, usethisvec);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3661
;3661:			}
ADDRGP4 $1508
JUMPV
LABELV $1507
line 3663
;3662:			else
;3663:			{
line 3664
;3664:				VectorCopy(bs->revengeEnemy->s.origin, usethisvec);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 3665
;3665:			}
LABELV $1508
line 3667
;3666:
;3667:			tempInt = GetNearestVisibleWP(usethisvec, 0);
ADDRLP4 28
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 104
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 104
INDIRI4
ASGNI4
line 3669
;3668:
;3669:			if (tempInt != -1 && TotalTrailDistance(bs->wpCurrent->index, tempInt, bs) != -1)
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $1502
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 112
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 116
INDIRF4
CNSTF4 3212836864
EQF4 $1502
line 3670
;3670:			{
line 3671
;3671:				bs->wpDestination = gWPArray[tempInt];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3672
;3672:				bs->wpDestSwitchTime = level.time + Q_irand(5000, 10000);
CNSTI4 5000
ARGI4
CNSTI4 10000
ARGI4
ADDRLP4 120
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 120
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 3673
;3673:			}
line 3674
;3674:		}
line 3675
;3675:	}
ADDRGP4 $1502
JUMPV
LABELV $1501
line 3676
;3676:	else if (bs->squadLeader && bs->squadLeader->health > 0 &&
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
ASGNP4
ADDRLP4 108
CNSTU4 0
ASGNU4
ADDRLP4 104
INDIRP4
CVPU4 4
ADDRLP4 108
INDIRU4
EQU4 $1512
ADDRLP4 104
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1512
ADDRLP4 112
ADDRLP4 104
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CVPU4 4
ADDRLP4 108
INDIRU4
EQU4 $1512
ADDRLP4 116
ADDRLP4 112
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 8
EQI4 $1514
ADDRLP4 116
INDIRI4
CNSTI4 2
NEI4 $1512
LABELV $1514
line 3678
;3677:		bs->squadLeader->client && (bs->squadLeader->client->pers.connected == CA_ACTIVE || bs->squadLeader->client->pers.connected == CA_AUTHORIZING))
;3678:	{
line 3679
;3679:		if (bs->wpDestSwitchTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1513
line 3680
;3680:		{
line 3681
;3681:			if (bs->squadLeader->client)
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1518
line 3682
;3682:			{
line 3683
;3683:				VectorCopy(bs->squadLeader->client->ps.origin, usethisvec);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3684
;3684:			}
ADDRGP4 $1519
JUMPV
LABELV $1518
line 3686
;3685:			else
;3686:			{
line 3687
;3687:				VectorCopy(bs->squadLeader->s.origin, usethisvec);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 3688
;3688:			}
LABELV $1519
line 3690
;3689:
;3690:			tempInt = GetNearestVisibleWP(usethisvec, 0);
ADDRLP4 28
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 120
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 120
INDIRI4
ASGNI4
line 3692
;3691:
;3692:			if (tempInt != -1 && TotalTrailDistance(bs->wpCurrent->index, tempInt, bs) != -1)
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $1513
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 132
INDIRF4
CNSTF4 3212836864
EQF4 $1513
line 3693
;3693:			{
line 3694
;3694:				bs->wpDestination = gWPArray[tempInt];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3695
;3695:				bs->wpDestSwitchTime = level.time + Q_irand(5000, 10000);
CNSTI4 5000
ARGI4
CNSTI4 10000
ARGI4
ADDRLP4 136
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 136
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 3696
;3696:			}
line 3697
;3697:		}
line 3698
;3698:	}
ADDRGP4 $1513
JUMPV
LABELV $1512
line 3699
;3699:	else if (bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1523
line 3700
;3700:	{
line 3701
;3701:		if (bs->currentEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1525
line 3702
;3702:		{
line 3703
;3703:			VectorCopy(bs->currentEnemy->client->ps.origin, usethisvec);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3704
;3704:		}
ADDRGP4 $1526
JUMPV
LABELV $1525
line 3706
;3705:		else
;3706:		{
line 3707
;3707:			VectorCopy(bs->currentEnemy->s.origin, usethisvec);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 3708
;3708:		}
LABELV $1526
line 3710
;3709:
;3710:		bChicken = BotIsAChickenWuss(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 BotIsAChickenWuss
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 120
INDIRI4
ASGNI4
line 3711
;3711:		bs->runningToEscapeThreat = bChicken;
ADDRFP4 0
INDIRP4
CNSTI4 2312
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 3713
;3712:
;3713:		if (bs->frame_Enemy_Len < distChange || (bChicken && bChicken != 2))
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
LTF4 $1529
ADDRLP4 124
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
EQI4 $1527
ADDRLP4 124
INDIRI4
CNSTI4 2
EQI4 $1527
LABELV $1529
line 3714
;3714:		{
line 3715
;3715:			cWPIndex = bs->wpCurrent->index;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 3717
;3716:
;3717:			if (bs->frame_Enemy_Len > 400)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1137180672
LEF4 $1530
line 3718
;3718:			{ //good distance away, start running toward a good place for an item or powerup or whatever
line 3719
;3719:				idleWP = GetBestIdleGoal(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 GetBestIdleGoal
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 128
INDIRI4
ASGNI4
line 3721
;3720:
;3721:				if (idleWP != -1 && gWPArray[idleWP] && gWPArray[idleWP]->inuse)
ADDRLP4 132
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 -1
EQI4 $1528
ADDRLP4 136
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1528
ADDRLP4 136
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1528
line 3722
;3722:				{
line 3723
;3723:					bs->wpDestination = gWPArray[idleWP];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3724
;3724:				}
line 3725
;3725:			}
ADDRGP4 $1528
JUMPV
LABELV $1530
line 3726
;3726:			else if (gWPArray[cWPIndex-1] && gWPArray[cWPIndex-1]->inuse &&
ADDRLP4 128
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 132
CNSTU4 0
ASGNU4
ADDRLP4 128
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 132
INDIRU4
EQU4 $1528
ADDRLP4 136
CNSTI4 12
ASGNI4
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRLP4 128
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
EQI4 $1528
ADDRLP4 128
INDIRI4
ADDRGP4 gWPArray+4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 132
INDIRU4
EQU4 $1528
ADDRLP4 128
INDIRI4
ADDRGP4 gWPArray+4
ADDP4
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
EQI4 $1528
line 3728
;3727:				gWPArray[cWPIndex+1] && gWPArray[cWPIndex+1]->inuse)
;3728:			{
line 3729
;3729:				VectorSubtract(gWPArray[cWPIndex+1]->origin, usethisvec, a);
ADDRLP4 144
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
ADDRLP4 144
INDIRI4
ADDRGP4 gWPArray+4
ADDP4
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 144
INDIRI4
ADDRGP4 gWPArray+4
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 28+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray+4
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 28+8
INDIRF4
SUBF4
ASGNF4
line 3730
;3730:				plusLen = VectorLength(a);
ADDRLP4 12
ARGP4
ADDRLP4 148
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 148
INDIRF4
ASGNF4
line 3731
;3731:				VectorSubtract(gWPArray[cWPIndex-1]->origin, usethisvec, a);
ADDRLP4 152
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
ADDRLP4 152
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 152
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 28+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 28+8
INDIRF4
SUBF4
ASGNF4
line 3732
;3732:				minusLen = VectorLength(a);
ADDRLP4 12
ARGP4
ADDRLP4 156
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 156
INDIRF4
ASGNF4
line 3734
;3733:
;3734:				if (minusLen > plusLen)
ADDRLP4 48
INDIRF4
ADDRLP4 44
INDIRF4
LEF4 $1554
line 3735
;3735:				{
line 3736
;3736:					bs->wpDestination = gWPArray[cWPIndex-1];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
ASGNP4
line 3737
;3737:				}
ADDRGP4 $1528
JUMPV
LABELV $1554
line 3739
;3738:				else
;3739:				{
line 3740
;3740:					bs->wpDestination = gWPArray[cWPIndex+1];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray+4
ADDP4
INDIRP4
ASGNP4
line 3741
;3741:				}
line 3742
;3742:			}
line 3743
;3743:		}
ADDRGP4 $1528
JUMPV
LABELV $1527
line 3744
;3744:		else if (bChicken != 2 && bs->wpDestSwitchTime < level.time)
ADDRLP4 40
INDIRI4
CNSTI4 2
EQI4 $1558
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1558
line 3745
;3745:		{
line 3746
;3746:			tempInt = GetNearestVisibleWP(usethisvec, 0);
ADDRLP4 28
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 128
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 128
INDIRI4
ASGNI4
line 3748
;3747:
;3748:			if (tempInt != -1 && TotalTrailDistance(bs->wpCurrent->index, tempInt, bs) != -1)
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $1561
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 136
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 3212836864
EQF4 $1561
line 3749
;3749:			{
line 3750
;3750:				bs->wpDestination = gWPArray[tempInt];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3752
;3751:
;3752:				if (g_gametype.integer == GT_SINGLE_PLAYER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $1563
line 3753
;3753:				{ //be more aggressive
line 3754
;3754:					bs->wpDestSwitchTime = level.time + Q_irand(300, 1000);
CNSTI4 300
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 144
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 144
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 3755
;3755:				}
ADDRGP4 $1564
JUMPV
LABELV $1563
line 3757
;3756:				else
;3757:				{
line 3758
;3758:					bs->wpDestSwitchTime = level.time + Q_irand(1000, 5000);
CNSTI4 1000
ARGI4
CNSTI4 5000
ARGI4
ADDRLP4 144
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 144
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 3759
;3759:				}
LABELV $1564
line 3760
;3760:			}
LABELV $1561
line 3761
;3761:		}
LABELV $1558
LABELV $1528
line 3762
;3762:	}
LABELV $1523
LABELV $1513
LABELV $1502
line 3764
;3763:
;3764:	if (!bs->wpDestination && bs->wpDestSwitchTime < level.time)
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1568
ADDRLP4 120
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1568
line 3765
;3765:	{
line 3767
;3766:		//G_Printf("I need something to do\n");
;3767:		idleWP = GetBestIdleGoal(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 GetBestIdleGoal
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 124
INDIRI4
ASGNI4
line 3769
;3768:
;3769:		if (idleWP != -1 && gWPArray[idleWP] && gWPArray[idleWP]->inuse)
ADDRLP4 128
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 -1
EQI4 $1571
ADDRLP4 132
ADDRLP4 128
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1571
ADDRLP4 132
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1571
line 3770
;3770:		{
line 3771
;3771:			bs->wpDestination = gWPArray[idleWP];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3772
;3772:		}
LABELV $1571
line 3773
;3773:	}
LABELV $1568
line 3774
;3774:}
LABELV $1442
endproc GetIdealDestination 160 12
export CommanderBotCTFAI
proc CommanderBotCTFAI 216 8
line 3777
;3775:
;3776:void CommanderBotCTFAI(bot_state_t *bs)
;3777:{
line 3778
;3778:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3780
;3779:	gentity_t *ent;
;3780:	int squadmates = 0;
ADDRLP4 136
CNSTI4 0
ASGNI4
line 3782
;3781:	gentity_t *squad[MAX_CLIENTS];
;3782:	int defendAttackPriority = 0; //0 == attack, 1 == defend
ADDRLP4 152
CNSTI4 0
ASGNI4
line 3783
;3783:	int guardDefendPriority = 0; //0 == defend, 1 == guard
ADDRLP4 176
CNSTI4 0
ASGNI4
line 3784
;3784:	int attackRetrievePriority = 0; //0 == retrieve, 1 == attack
ADDRLP4 172
CNSTI4 0
ASGNI4
line 3785
;3785:	int myFlag = 0;
ADDRLP4 164
CNSTI4 0
ASGNI4
line 3786
;3786:	int enemyFlag = 0;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 3787
;3787:	int enemyHasOurFlag = 0;
ADDRLP4 148
CNSTI4 0
ASGNI4
line 3788
;3788:	int weHaveEnemyFlag = 0;
ADDRLP4 160
CNSTI4 0
ASGNI4
line 3789
;3789:	int numOnMyTeam = 0;
ADDRLP4 156
CNSTI4 0
ASGNI4
line 3790
;3790:	int numOnEnemyTeam = 0;
ADDRLP4 168
CNSTI4 0
ASGNI4
line 3791
;3791:	int numAttackers = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 3792
;3792:	int numDefenders = 0;
ADDRLP4 180
CNSTI4 0
ASGNI4
line 3794
;3793:
;3794:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1574
line 3795
;3795:	{
line 3796
;3796:		myFlag = PW_REDFLAG;
ADDRLP4 164
CNSTI4 4
ASGNI4
line 3797
;3797:	}
ADDRGP4 $1575
JUMPV
LABELV $1574
line 3799
;3798:	else
;3799:	{
line 3800
;3800:		myFlag = PW_BLUEFLAG;
ADDRLP4 164
CNSTI4 5
ASGNI4
line 3801
;3801:	}
LABELV $1575
line 3803
;3802:
;3803:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1576
line 3804
;3804:	{
line 3805
;3805:		enemyFlag = PW_BLUEFLAG;
ADDRLP4 144
CNSTI4 5
ASGNI4
line 3806
;3806:	}
ADDRGP4 $1579
JUMPV
LABELV $1576
line 3808
;3807:	else
;3808:	{
line 3809
;3809:		enemyFlag = PW_REDFLAG;
ADDRLP4 144
CNSTI4 4
ASGNI4
line 3810
;3810:	}
ADDRGP4 $1579
JUMPV
LABELV $1578
line 3813
;3811:
;3812:	while (i < MAX_CLIENTS)
;3813:	{
line 3814
;3814:		ent = &g_entities[i];
ADDRLP4 4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3816
;3815:
;3816:		if (ent && ent->client)
ADDRLP4 188
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1581
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1581
line 3817
;3817:		{
line 3818
;3818:			if (ent->client->ps.powerups[enemyFlag] && OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1583
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
EQI4 $1583
line 3819
;3819:			{
line 3820
;3820:				weHaveEnemyFlag = 1;
ADDRLP4 160
CNSTI4 1
ASGNI4
line 3821
;3821:			}
ADDRGP4 $1584
JUMPV
LABELV $1583
line 3822
;3822:			else if (ent->client->ps.powerups[myFlag] && !OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 164
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1585
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 204
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 0
NEI4 $1585
line 3823
;3823:			{
line 3824
;3824:				enemyHasOurFlag = 1;
ADDRLP4 148
CNSTI4 1
ASGNI4
line 3825
;3825:			}
LABELV $1585
LABELV $1584
line 3827
;3826:
;3827:			if (OnSameTeam(&g_entities[bs->client], ent))
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 0
EQI4 $1587
line 3828
;3828:			{
line 3829
;3829:				numOnMyTeam++;
ADDRLP4 156
ADDRLP4 156
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3830
;3830:			}
ADDRGP4 $1588
JUMPV
LABELV $1587
line 3832
;3831:			else
;3832:			{
line 3833
;3833:				numOnEnemyTeam++;
ADDRLP4 168
ADDRLP4 168
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3834
;3834:			}
LABELV $1588
line 3836
;3835:
;3836:			if (botstates[ent->s.number])
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1589
line 3837
;3837:			{
line 3838
;3838:				if (botstates[ent->s.number]->ctfState == CTFSTATE_ATTACKER ||
ADDRLP4 212
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 1
EQI4 $1593
ADDRLP4 212
INDIRI4
CNSTI4 3
NEI4 $1591
LABELV $1593
line 3840
;3839:					botstates[ent->s.number]->ctfState == CTFSTATE_RETRIEVAL)
;3840:				{
line 3841
;3841:					numAttackers++;
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3842
;3842:				}
ADDRGP4 $1590
JUMPV
LABELV $1591
line 3844
;3843:				else
;3844:				{
line 3845
;3845:					numDefenders++;
ADDRLP4 180
ADDRLP4 180
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3846
;3846:				}
line 3847
;3847:			}
ADDRGP4 $1590
JUMPV
LABELV $1589
line 3849
;3848:			else
;3849:			{ //assume real players to be attackers in our logic
line 3850
;3850:				numAttackers++;
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3851
;3851:			}
LABELV $1590
line 3852
;3852:		}
LABELV $1581
line 3853
;3853:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3854
;3854:	}
LABELV $1579
line 3812
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1578
line 3856
;3855:
;3856:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1595
JUMPV
LABELV $1594
line 3859
;3857:
;3858:	while (i < MAX_CLIENTS)
;3859:	{
line 3860
;3860:		ent = &g_entities[i];
ADDRLP4 4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3862
;3861:
;3862:		if (ent && ent->client && botstates[i] && botstates[i]->squadLeader && botstates[i]->squadLeader->s.number == bs->client && i != bs->client)
ADDRLP4 188
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1597
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1597
ADDRLP4 196
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1597
ADDRLP4 200
ADDRLP4 196
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1597
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 200
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
NEI4 $1597
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
EQI4 $1597
line 3863
;3863:		{
line 3864
;3864:			squad[squadmates] = ent;
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 3865
;3865:			squadmates++;
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3866
;3866:		}
LABELV $1597
line 3868
;3867:
;3868:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3869
;3869:	}
LABELV $1595
line 3858
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1594
line 3871
;3870:
;3871:	squad[squadmates] = &g_entities[bs->client];
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3872
;3872:	squadmates++;
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3874
;3873:
;3874:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3876
;3875:
;3876:	if (enemyHasOurFlag && !weHaveEnemyFlag)
ADDRLP4 184
CNSTI4 0
ASGNI4
ADDRLP4 148
INDIRI4
ADDRLP4 184
INDIRI4
EQI4 $1602
ADDRLP4 160
INDIRI4
ADDRLP4 184
INDIRI4
NEI4 $1602
line 3877
;3877:	{ //start off with an attacker instead of a retriever if we don't have the enemy flag yet so that they can't capture it first.
line 3879
;3878:	  //after that we focus on getting our flag back.
;3879:		attackRetrievePriority = 1;
ADDRLP4 172
CNSTI4 1
ASGNI4
line 3880
;3880:	}
ADDRGP4 $1602
JUMPV
LABELV $1601
line 3883
;3881:
;3882:	while (i < squadmates)
;3883:	{
line 3884
;3884:		if (squad[i] && squad[i]->client && botstates[squad[i]->s.number])
ADDRLP4 188
CNSTI4 2
ASGNI4
ADDRLP4 192
ADDRLP4 0
INDIRI4
ADDRLP4 188
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ASGNP4
ADDRLP4 196
CNSTU4 0
ASGNU4
ADDRLP4 192
INDIRP4
CVPU4 4
ADDRLP4 196
INDIRU4
EQU4 $1604
ADDRLP4 192
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 196
INDIRU4
EQU4 $1604
ADDRLP4 192
INDIRP4
INDIRI4
ADDRLP4 188
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 196
INDIRU4
EQU4 $1604
line 3885
;3885:		{
line 3886
;3886:			if (botstates[squad[i]->s.number]->ctfState != CTFSTATE_GETFLAGHOME)
ADDRLP4 200
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 200
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 200
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 5
EQI4 $1606
line 3887
;3887:			{ //never tell a bot to stop trying to bring the flag to the base
line 3888
;3888:				if (defendAttackPriority)
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $1608
line 3889
;3889:				{
line 3890
;3890:					if (weHaveEnemyFlag)
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $1610
line 3891
;3891:					{
line 3892
;3892:						if (guardDefendPriority)
ADDRLP4 176
INDIRI4
CNSTI4 0
EQI4 $1612
line 3893
;3893:						{
line 3894
;3894:							botstates[squad[i]->s.number]->ctfState = CTFSTATE_GUARDCARRIER;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 4
ASGNI4
line 3895
;3895:							guardDefendPriority = 0;
ADDRLP4 176
CNSTI4 0
ASGNI4
line 3896
;3896:						}
ADDRGP4 $1611
JUMPV
LABELV $1612
line 3898
;3897:						else
;3898:						{
line 3899
;3899:							botstates[squad[i]->s.number]->ctfState = CTFSTATE_DEFENDER;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
ADDRLP4 204
INDIRI4
ASGNI4
line 3900
;3900:							guardDefendPriority = 1;
ADDRLP4 176
CNSTI4 1
ASGNI4
line 3901
;3901:						}
line 3902
;3902:					}
ADDRGP4 $1611
JUMPV
LABELV $1610
line 3904
;3903:					else
;3904:					{
line 3905
;3905:						botstates[squad[i]->s.number]->ctfState = CTFSTATE_DEFENDER;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
ADDRLP4 204
INDIRI4
ASGNI4
line 3906
;3906:					}
LABELV $1611
line 3907
;3907:					defendAttackPriority = 0;
ADDRLP4 152
CNSTI4 0
ASGNI4
line 3908
;3908:				}
ADDRGP4 $1607
JUMPV
LABELV $1608
line 3910
;3909:				else
;3910:				{
line 3911
;3911:					if (enemyHasOurFlag)
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $1614
line 3912
;3912:					{
line 3913
;3913:						if (attackRetrievePriority)
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $1616
line 3914
;3914:						{
line 3915
;3915:							botstates[squad[i]->s.number]->ctfState = CTFSTATE_ATTACKER;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 1
ASGNI4
line 3916
;3916:							attackRetrievePriority = 0;
ADDRLP4 172
CNSTI4 0
ASGNI4
line 3917
;3917:						}
ADDRGP4 $1615
JUMPV
LABELV $1616
line 3919
;3918:						else
;3919:						{
line 3920
;3920:							botstates[squad[i]->s.number]->ctfState = CTFSTATE_RETRIEVAL;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 3
ASGNI4
line 3921
;3921:							attackRetrievePriority = 1;
ADDRLP4 172
CNSTI4 1
ASGNI4
line 3922
;3922:						}
line 3923
;3923:					}
ADDRGP4 $1615
JUMPV
LABELV $1614
line 3925
;3924:					else
;3925:					{
line 3926
;3926:						botstates[squad[i]->s.number]->ctfState = CTFSTATE_ATTACKER;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 1
ASGNI4
line 3927
;3927:					}
LABELV $1615
line 3928
;3928:					defendAttackPriority = 1;
ADDRLP4 152
CNSTI4 1
ASGNI4
line 3929
;3929:				}
line 3930
;3930:			}
ADDRGP4 $1607
JUMPV
LABELV $1606
line 3931
;3931:			else if ((numOnMyTeam < 2 || !numAttackers) && enemyHasOurFlag)
ADDRLP4 156
INDIRI4
CNSTI4 2
LTI4 $1620
ADDRLP4 140
INDIRI4
CNSTI4 0
NEI4 $1618
LABELV $1620
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $1618
line 3932
;3932:			{ //I'm the only one on my team who will attack and the enemy has my flag, I have to go after him
line 3933
;3933:				botstates[squad[i]->s.number]->ctfState = CTFSTATE_RETRIEVAL;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 3
ASGNI4
line 3934
;3934:			}
LABELV $1618
LABELV $1607
line 3935
;3935:		}
LABELV $1604
line 3937
;3936:
;3937:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3938
;3938:	}
LABELV $1602
line 3882
ADDRLP4 0
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $1601
line 3939
;3939:}
LABELV $1573
endproc CommanderBotCTFAI 216 8
export CommanderBotSagaAI
proc CommanderBotSagaAI 180 8
line 3942
;3940:
;3941:void CommanderBotSagaAI(bot_state_t *bs)
;3942:{
line 3943
;3943:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3944
;3944:	int squadmates = 0;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 3945
;3945:	int commanded = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 3946
;3946:	int teammates = 0;
ADDRLP4 148
CNSTI4 0
ASGNI4
ADDRGP4 $1623
JUMPV
LABELV $1622
line 3952
;3947:	gentity_t *squad[MAX_CLIENTS];
;3948:	gentity_t *ent;
;3949:	bot_state_t *bst;
;3950:
;3951:	while (i < MAX_CLIENTS)
;3952:	{
line 3953
;3953:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 852
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3955
;3954:
;3955:		if (ent && ent->client && OnSameTeam(&g_entities[bs->client], ent) && botstates[ent->s.number])
ADDRLP4 156
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 156
INDIRU4
EQU4 $1625
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 156
INDIRU4
EQU4 $1625
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $1625
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1625
line 3956
;3956:		{
line 3957
;3957:			bst = botstates[ent->s.number];
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 3959
;3958:
;3959:			if (bst && !bst->isSquadLeader && !bst->state_Forced)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1627
ADDRLP4 168
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
NEI4 $1627
ADDRLP4 8
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
NEI4 $1627
line 3960
;3960:			{
line 3961
;3961:				squad[squadmates] = ent;
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 3962
;3962:				squadmates++;
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3963
;3963:			}
ADDRGP4 $1628
JUMPV
LABELV $1627
line 3964
;3964:			else if (bst && !bst->isSquadLeader && bst->state_Forced)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1629
ADDRLP4 176
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
ADDRLP4 176
INDIRI4
NEI4 $1629
ADDRLP4 8
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
ADDRLP4 176
INDIRI4
EQI4 $1629
line 3965
;3965:			{ //count them as commanded
line 3966
;3966:				commanded++;
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3967
;3967:			}
LABELV $1629
LABELV $1628
line 3968
;3968:		}
LABELV $1625
line 3970
;3969:
;3970:		if (ent && ent->client && OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 168
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 168
INDIRU4
EQU4 $1631
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 168
INDIRU4
EQU4 $1631
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $1631
line 3971
;3971:		{
line 3972
;3972:			teammates++;
ADDRLP4 148
ADDRLP4 148
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3973
;3973:		}
LABELV $1631
line 3975
;3974:
;3975:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3976
;3976:	}
LABELV $1623
line 3951
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1622
line 3978
;3977:	
;3978:	if (!squadmates)
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $1633
line 3979
;3979:	{
line 3980
;3980:		return;
ADDRGP4 $1621
JUMPV
LABELV $1633
line 3984
;3981:	}
;3982:
;3983:	//tell squad mates to do what I'm doing, up to half of team, let the other half make their own decisions
;3984:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1636
JUMPV
LABELV $1635
line 3987
;3985:
;3986:	while (i < squadmates && squad[i])
;3987:	{
line 3988
;3988:		bst = botstates[squad[i]->s.number];
ADDRLP4 152
CNSTI4 2
ASGNI4
ADDRLP4 8
ADDRLP4 4
INDIRI4
ADDRLP4 152
INDIRI4
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
INDIRI4
ADDRLP4 152
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 3990
;3989:
;3990:		if (commanded > teammates/2)
ADDRLP4 140
INDIRI4
ADDRLP4 148
INDIRI4
CNSTI4 2
DIVI4
LEI4 $1638
line 3991
;3991:		{
line 3992
;3992:			break;
ADDRGP4 $1637
JUMPV
LABELV $1638
line 3995
;3993:		}
;3994:
;3995:		if (bst)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1640
line 3996
;3996:		{
line 3997
;3997:			bst->state_Forced = bs->sagaState;
ADDRLP4 8
INDIRP4
CNSTI4 2704
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
ASGNI4
line 3998
;3998:			bst->sagaState = bs->sagaState;
ADDRLP4 156
CNSTI4 2692
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 3999
;3999:			commanded++;
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4000
;4000:		}
LABELV $1640
line 4002
;4001:
;4002:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4003
;4003:	}
LABELV $1636
line 3986
ADDRLP4 4
INDIRI4
ADDRLP4 144
INDIRI4
GEI4 $1642
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1635
LABELV $1642
LABELV $1637
line 4004
;4004:}
LABELV $1621
endproc CommanderBotSagaAI 180 8
export BotDoTeamplayAI
proc BotDoTeamplayAI 4 0
line 4007
;4005:
;4006:void BotDoTeamplayAI(bot_state_t *bs)
;4007:{
line 4008
;4008:	if (bs->state_Forced)
ADDRFP4 0
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1644
line 4009
;4009:	{
line 4010
;4010:		bs->teamplayState = bs->state_Forced;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2696
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
ASGNI4
line 4011
;4011:	}
LABELV $1644
line 4013
;4012:
;4013:	if (bs->teamplayState == TEAMPLAYSTATE_REGROUP)
ADDRFP4 0
INDIRP4
CNSTI4 2696
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1646
line 4014
;4014:	{ //force to find a new leader
line 4015
;4015:		bs->squadLeader = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
CNSTP4 0
ASGNP4
line 4016
;4016:		bs->isSquadLeader = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1868
ADDP4
CNSTI4 0
ASGNI4
line 4017
;4017:	}
LABELV $1646
line 4018
;4018:}
LABELV $1643
endproc BotDoTeamplayAI 4 0
export CommanderBotTeamplayAI
proc CommanderBotTeamplayAI 188 8
line 4021
;4019:
;4020:void CommanderBotTeamplayAI(bot_state_t *bs)
;4021:{
line 4022
;4022:	int i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 4023
;4023:	int squadmates = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 4024
;4024:	int teammates = 0;
ADDRLP4 160
CNSTI4 0
ASGNI4
line 4025
;4025:	int teammate_indanger = -1;
ADDRLP4 144
CNSTI4 -1
ASGNI4
line 4026
;4026:	int teammate_helped = 0;
ADDRLP4 148
CNSTI4 0
ASGNI4
line 4027
;4027:	int foundsquadleader = 0;
ADDRLP4 156
CNSTI4 0
ASGNI4
line 4028
;4028:	int worsthealth = 50;
ADDRLP4 152
CNSTI4 50
ASGNI4
ADDRGP4 $1650
JUMPV
LABELV $1649
line 4034
;4029:	gentity_t *squad[MAX_CLIENTS];
;4030:	gentity_t *ent;
;4031:	bot_state_t *bst;
;4032:
;4033:	while (i < MAX_CLIENTS)
;4034:	{
line 4035
;4035:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 852
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4037
;4036:
;4037:		if (ent && ent->client && OnSameTeam(&g_entities[bs->client], ent) && botstates[ent->s.number])
ADDRLP4 168
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 168
INDIRU4
EQU4 $1652
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 168
INDIRU4
EQU4 $1652
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $1652
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1652
line 4038
;4038:		{
line 4039
;4039:			bst = botstates[ent->s.number];
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 4041
;4040:
;4041:			if (foundsquadleader && bst && bst->isSquadLeader)
ADDRLP4 176
CNSTI4 0
ASGNI4
ADDRLP4 156
INDIRI4
ADDRLP4 176
INDIRI4
EQI4 $1654
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1654
ADDRLP4 4
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
ADDRLP4 176
INDIRI4
EQI4 $1654
line 4042
;4042:			{ //never more than one squad leader
line 4043
;4043:				bst->isSquadLeader = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1868
ADDP4
CNSTI4 0
ASGNI4
line 4044
;4044:			}
LABELV $1654
line 4046
;4045:
;4046:			if (bst && !bst->isSquadLeader)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1656
ADDRLP4 4
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1656
line 4047
;4047:			{
line 4048
;4048:				squad[squadmates] = ent;
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 4049
;4049:				squadmates++;
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4050
;4050:			}
ADDRGP4 $1657
JUMPV
LABELV $1656
line 4051
;4051:			else if (bst)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1658
line 4052
;4052:			{
line 4053
;4053:				foundsquadleader = 1;
ADDRLP4 156
CNSTI4 1
ASGNI4
line 4054
;4054:			}
LABELV $1658
LABELV $1657
line 4055
;4055:		}
LABELV $1652
line 4057
;4056:
;4057:		if (ent && ent->client && OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 180
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 180
INDIRU4
EQU4 $1660
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 180
INDIRU4
EQU4 $1660
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $1660
line 4058
;4058:		{
line 4059
;4059:			teammates++;
ADDRLP4 160
ADDRLP4 160
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4061
;4060:
;4061:			if (ent->health < worsthealth)
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 152
INDIRI4
GEI4 $1662
line 4062
;4062:			{
line 4063
;4063:				teammate_indanger = ent->s.number;
ADDRLP4 144
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 4064
;4064:				worsthealth = ent->health;
ADDRLP4 152
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ASGNI4
line 4065
;4065:			}
LABELV $1662
line 4066
;4066:		}
LABELV $1660
line 4068
;4067:
;4068:		i++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4069
;4069:	}
LABELV $1650
line 4033
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $1649
line 4071
;4070:	
;4071:	if (!squadmates)
ADDRLP4 140
INDIRI4
CNSTI4 0
NEI4 $1664
line 4072
;4072:	{
line 4073
;4073:		return;
ADDRGP4 $1648
JUMPV
LABELV $1664
line 4076
;4074:	}
;4075:
;4076:	i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1667
JUMPV
LABELV $1666
line 4079
;4077:
;4078:	while (i < squadmates && squad[i])
;4079:	{
line 4080
;4080:		bst = botstates[squad[i]->s.number];
ADDRLP4 164
CNSTI4 2
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ADDRLP4 164
INDIRI4
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
INDIRI4
ADDRLP4 164
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 4082
;4081:
;4082:		if (bst && !bst->state_Forced)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1669
ADDRLP4 4
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1669
line 4083
;4083:		{ //only order if this guy is not being ordered directly by the real player team leader
line 4084
;4084:			if (teammate_indanger >= 0 && !teammate_helped)
ADDRLP4 172
CNSTI4 0
ASGNI4
ADDRLP4 144
INDIRI4
ADDRLP4 172
INDIRI4
LTI4 $1671
ADDRLP4 148
INDIRI4
ADDRLP4 172
INDIRI4
NEI4 $1671
line 4085
;4085:			{ //send someone out to help whoever needs help most at the moment
line 4086
;4086:				bst->teamplayState = TEAMPLAYSTATE_ASSISTING;
ADDRLP4 4
INDIRP4
CNSTI4 2696
ADDP4
CNSTI4 2
ASGNI4
line 4087
;4087:				bst->squadLeader = &g_entities[teammate_indanger];
ADDRLP4 4
INDIRP4
CNSTI4 1824
ADDP4
CNSTI4 852
ADDRLP4 144
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4088
;4088:				teammate_helped = 1;
ADDRLP4 148
CNSTI4 1
ASGNI4
line 4089
;4089:			}
ADDRGP4 $1672
JUMPV
LABELV $1671
line 4090
;4090:			else if ((teammate_indanger == -1 || teammate_helped) && bst->teamplayState == TEAMPLAYSTATE_ASSISTING)
ADDRLP4 144
INDIRI4
CNSTI4 -1
EQI4 $1675
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $1673
LABELV $1675
ADDRLP4 4
INDIRP4
CNSTI4 2696
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1673
line 4091
;4091:			{ //no teammates need help badly, but this guy is trying to help them anyway, so stop
line 4092
;4092:				bst->teamplayState = TEAMPLAYSTATE_FOLLOWING;
ADDRLP4 4
INDIRP4
CNSTI4 2696
ADDP4
CNSTI4 1
ASGNI4
line 4093
;4093:				bst->squadLeader = &g_entities[bs->client];
ADDRLP4 4
INDIRP4
CNSTI4 1824
ADDP4
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4094
;4094:			}
LABELV $1673
LABELV $1672
line 4096
;4095:
;4096:			if (bs->squadRegroupInterval < level.time && Q_irand(1, 10) < 5)
ADDRFP4 0
INDIRP4
CNSTI4 1872
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1676
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 176
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 5
GEI4 $1676
line 4097
;4097:			{ //every so often tell the squad to regroup for the sake of variation
line 4098
;4098:				if (bst->teamplayState == TEAMPLAYSTATE_FOLLOWING)
ADDRLP4 4
INDIRP4
CNSTI4 2696
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1679
line 4099
;4099:				{
line 4100
;4100:					bst->teamplayState = TEAMPLAYSTATE_REGROUP;
ADDRLP4 4
INDIRP4
CNSTI4 2696
ADDP4
CNSTI4 3
ASGNI4
line 4101
;4101:				}
LABELV $1679
line 4103
;4102:
;4103:				bs->isSquadLeader = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1868
ADDP4
CNSTI4 0
ASGNI4
line 4104
;4104:				bs->squadCannotLead = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 1876
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 4105
;4105:				bs->squadRegroupInterval = level.time + Q_irand(45000, 65000);
CNSTI4 45000
ARGI4
CNSTI4 65000
ARGI4
ADDRLP4 180
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1872
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 180
INDIRI4
ADDI4
ASGNI4
line 4106
;4106:			}
LABELV $1676
line 4107
;4107:		}
LABELV $1669
line 4109
;4108:
;4109:		i++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4110
;4110:	}	
LABELV $1667
line 4078
ADDRLP4 8
INDIRI4
ADDRLP4 140
INDIRI4
GEI4 $1683
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1666
LABELV $1683
line 4111
;4111:}
LABELV $1648
endproc CommanderBotTeamplayAI 188 8
export CommanderBotAI
proc CommanderBotAI 0 4
line 4114
;4112:
;4113:void CommanderBotAI(bot_state_t *bs)
;4114:{
line 4115
;4115:	if (g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $1689
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $1685
LABELV $1689
line 4116
;4116:	{
line 4117
;4117:		CommanderBotCTFAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CommanderBotCTFAI
CALLV
pop
line 4118
;4118:	}
ADDRGP4 $1686
JUMPV
LABELV $1685
line 4119
;4119:	else if (g_gametype.integer == GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $1690
line 4120
;4120:	{
line 4121
;4121:		CommanderBotSagaAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CommanderBotSagaAI
CALLV
pop
line 4122
;4122:	}
ADDRGP4 $1691
JUMPV
LABELV $1690
line 4123
;4123:	else if (g_gametype.integer == GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
NEI4 $1693
line 4124
;4124:	{
line 4125
;4125:		CommanderBotTeamplayAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CommanderBotTeamplayAI
CALLV
pop
line 4126
;4126:	}
LABELV $1693
LABELV $1691
LABELV $1686
line 4127
;4127:}
LABELV $1684
endproc CommanderBotAI 0 4
export MeleeCombatHandling
proc MeleeCombatHandling 1200 28
line 4130
;4128:
;4129:void MeleeCombatHandling(bot_state_t *bs)
;4130:{
line 4142
;4131:	vec3_t usethisvec;
;4132:	vec3_t downvec;
;4133:	vec3_t midorg;
;4134:	vec3_t a;
;4135:	vec3_t fwd;
;4136:	vec3_t mins, maxs;
;4137:	trace_t tr;
;4138:	int en_down;
;4139:	int me_down;
;4140:	int mid_down;
;4141:
;4142:	if (!bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1697
line 4143
;4143:	{
line 4144
;4144:		return;
ADDRGP4 $1696
JUMPV
LABELV $1697
line 4147
;4145:	}
;4146:
;4147:	if (bs->currentEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1699
line 4148
;4148:	{
line 4149
;4149:		VectorCopy(bs->currentEnemy->client->ps.origin, usethisvec);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 4150
;4150:	}
ADDRGP4 $1700
JUMPV
LABELV $1699
line 4152
;4151:	else
;4152:	{
line 4153
;4153:		VectorCopy(bs->currentEnemy->s.origin, usethisvec);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 4154
;4154:	}
LABELV $1700
line 4156
;4155:
;4156:	if (bs->meleeStrafeTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2252
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1701
line 4157
;4157:	{
line 4158
;4158:		if (bs->meleeStrafeDir)
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1704
line 4159
;4159:		{
line 4160
;4160:			bs->meleeStrafeDir = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
CNSTI4 0
ASGNI4
line 4161
;4161:		}
ADDRGP4 $1705
JUMPV
LABELV $1704
line 4163
;4162:		else
;4163:		{
line 4164
;4164:			bs->meleeStrafeDir = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
CNSTI4 1
ASGNI4
line 4165
;4165:		}
LABELV $1705
line 4167
;4166:
;4167:		bs->meleeStrafeTime = level.time + Q_irand(500, 1800);
CNSTI4 500
ARGI4
CNSTI4 1800
ARGI4
ADDRLP4 1176
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2252
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1176
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 4168
;4168:	}
LABELV $1701
line 4170
;4169:
;4170:	mins[0] = -15;
ADDRLP4 36
CNSTF4 3245342720
ASGNF4
line 4171
;4171:	mins[1] = -15;
ADDRLP4 36+4
CNSTF4 3245342720
ASGNF4
line 4172
;4172:	mins[2] = -24;
ADDRLP4 36+8
CNSTF4 3250585600
ASGNF4
line 4173
;4173:	maxs[0] = 15;
ADDRLP4 48
CNSTF4 1097859072
ASGNF4
line 4174
;4174:	maxs[1] = 15;
ADDRLP4 48+4
CNSTF4 1097859072
ASGNF4
line 4175
;4175:	maxs[2] = 32;
ADDRLP4 48+8
CNSTF4 1107296256
ASGNF4
line 4177
;4176:
;4177:	VectorCopy(usethisvec, downvec);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 4178
;4178:	downvec[2] -= 4096;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 4180
;4179:
;4180:	trap_Trace(&tr, usethisvec, mins, maxs, downvec, -1, MASK_SOLID);
ADDRLP4 60
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 4182
;4181:
;4182:	en_down = (int)tr.endpos[2];
ADDRLP4 1164
ADDRLP4 60+12+8
INDIRF4
CVFI4 4
ASGNI4
line 4184
;4183:
;4184:	VectorCopy(bs->origin, downvec);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 4185
;4185:	downvec[2] -= 4096;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 4187
;4186:
;4187:	trap_Trace(&tr, bs->origin, mins, maxs, downvec, -1, MASK_SOLID);
ADDRLP4 60
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 4189
;4188:
;4189:	me_down = (int)tr.endpos[2];
ADDRLP4 1168
ADDRLP4 60+12+8
INDIRF4
CVFI4 4
ASGNI4
line 4191
;4190:
;4191:	VectorSubtract(usethisvec, bs->origin, a);
ADDRLP4 1176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 12
INDIRF4
ADDRLP4 1176
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 1176
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4192
;4192:	vectoangles(a, a);
ADDRLP4 24
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 4193
;4193:	AngleVectors(a, fwd, NULL, NULL);
ADDRLP4 24
ARGP4
ADDRLP4 1152
ARGP4
ADDRLP4 1180
CNSTP4 0
ASGNP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4195
;4194:
;4195:	midorg[0] = bs->origin[0] + fwd[0]*bs->frame_Enemy_Len/2;
ADDRLP4 1184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
ADDRLP4 1184
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 1152
INDIRF4
ADDRLP4 1184
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 4196
;4196:	midorg[1] = bs->origin[1] + fwd[1]*bs->frame_Enemy_Len/2;
ADDRLP4 1188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140+4
ADDRLP4 1188
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 1152+4
INDIRF4
ADDRLP4 1188
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 4197
;4197:	midorg[2] = bs->origin[2] + fwd[2]*bs->frame_Enemy_Len/2;
ADDRLP4 1192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140+8
ADDRLP4 1192
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 1152+8
INDIRF4
ADDRLP4 1192
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 4199
;4198:
;4199:	VectorCopy(midorg, downvec);
ADDRLP4 0
ADDRLP4 1140
INDIRB
ASGNB 12
line 4200
;4200:	downvec[2] -= 4096;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 4202
;4201:
;4202:	trap_Trace(&tr, midorg, mins, maxs, downvec, -1, MASK_SOLID);
ADDRLP4 60
ARGP4
ADDRLP4 1140
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 4204
;4203:
;4204:	mid_down = (int)tr.endpos[2];
ADDRLP4 1172
ADDRLP4 60+12+8
INDIRF4
CVFI4 4
ASGNI4
line 4206
;4205:
;4206:	if (me_down == en_down &&
ADDRLP4 1168
INDIRI4
ADDRLP4 1164
INDIRI4
NEI4 $1728
ADDRLP4 1164
INDIRI4
ADDRLP4 1172
INDIRI4
NEI4 $1728
line 4208
;4207:		en_down == mid_down)
;4208:	{
line 4209
;4209:		VectorCopy(usethisvec, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 4210
;4210:	}
LABELV $1728
line 4211
;4211:}
LABELV $1696
endproc MeleeCombatHandling 1200 28
export SaberCombatHandling
proc SaberCombatHandling 1272 28
line 4214
;4212:
;4213:void SaberCombatHandling(bot_state_t *bs)
;4214:{
line 4226
;4215:	vec3_t usethisvec;
;4216:	vec3_t downvec;
;4217:	vec3_t midorg;
;4218:	vec3_t a;
;4219:	vec3_t fwd;
;4220:	vec3_t mins, maxs;
;4221:	trace_t tr;
;4222:	int en_down;
;4223:	int me_down;
;4224:	int mid_down;
;4225:
;4226:	if (!bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1731
line 4227
;4227:	{
line 4228
;4228:		return;
ADDRGP4 $1730
JUMPV
LABELV $1731
line 4231
;4229:	}
;4230:
;4231:	if (bs->currentEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1733
line 4232
;4232:	{
line 4233
;4233:		VectorCopy(bs->currentEnemy->client->ps.origin, usethisvec);
ADDRLP4 1092
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 4234
;4234:	}
ADDRGP4 $1734
JUMPV
LABELV $1733
line 4236
;4235:	else
;4236:	{
line 4237
;4237:		VectorCopy(bs->currentEnemy->s.origin, usethisvec);
ADDRLP4 1092
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 4238
;4238:	}
LABELV $1734
line 4240
;4239:
;4240:	if (bs->meleeStrafeTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2252
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1735
line 4241
;4241:	{
line 4242
;4242:		if (bs->meleeStrafeDir)
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1738
line 4243
;4243:		{
line 4244
;4244:			bs->meleeStrafeDir = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
CNSTI4 0
ASGNI4
line 4245
;4245:		}
ADDRGP4 $1739
JUMPV
LABELV $1738
line 4247
;4246:		else
;4247:		{
line 4248
;4248:			bs->meleeStrafeDir = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
CNSTI4 1
ASGNI4
line 4249
;4249:		}
LABELV $1739
line 4251
;4250:
;4251:		bs->meleeStrafeTime = level.time + Q_irand(500, 1800);
CNSTI4 500
ARGI4
CNSTI4 1800
ARGI4
ADDRLP4 1176
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2252
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1176
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 4252
;4252:	}
LABELV $1735
line 4254
;4253:
;4254:	mins[0] = -15;
ADDRLP4 1116
CNSTF4 3245342720
ASGNF4
line 4255
;4255:	mins[1] = -15;
ADDRLP4 1116+4
CNSTF4 3245342720
ASGNF4
line 4256
;4256:	mins[2] = -24;
ADDRLP4 1116+8
CNSTF4 3250585600
ASGNF4
line 4257
;4257:	maxs[0] = 15;
ADDRLP4 1128
CNSTF4 1097859072
ASGNF4
line 4258
;4258:	maxs[1] = 15;
ADDRLP4 1128+4
CNSTF4 1097859072
ASGNF4
line 4259
;4259:	maxs[2] = 32;
ADDRLP4 1128+8
CNSTF4 1107296256
ASGNF4
line 4261
;4260:
;4261:	VectorCopy(usethisvec, downvec);
ADDRLP4 1080
ADDRLP4 1092
INDIRB
ASGNB 12
line 4262
;4262:	downvec[2] -= 4096;
ADDRLP4 1080+8
ADDRLP4 1080+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 4264
;4263:
;4264:	trap_Trace(&tr, usethisvec, mins, maxs, downvec, -1, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1128
ARGP4
ADDRLP4 1080
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 4266
;4265:
;4266:	en_down = (int)tr.endpos[2];
ADDRLP4 1164
ADDRLP4 0+12+8
INDIRF4
CVFI4 4
ASGNI4
line 4268
;4267:
;4268:	if (tr.startsolid || tr.allsolid)
ADDRLP4 1176
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1176
INDIRI4
NEI4 $1751
ADDRLP4 0
INDIRI4
ADDRLP4 1176
INDIRI4
EQI4 $1748
LABELV $1751
line 4269
;4269:	{
line 4270
;4270:		en_down = 1;
ADDRLP4 1164
CNSTI4 1
ASGNI4
line 4271
;4271:		me_down = 2;
ADDRLP4 1168
CNSTI4 2
ASGNI4
line 4272
;4272:	}
ADDRGP4 $1749
JUMPV
LABELV $1748
line 4274
;4273:	else
;4274:	{
line 4275
;4275:		VectorCopy(bs->origin, downvec);
ADDRLP4 1080
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 4276
;4276:		downvec[2] -= 4096;
ADDRLP4 1080+8
ADDRLP4 1080+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 4278
;4277:
;4278:		trap_Trace(&tr, bs->origin, mins, maxs, downvec, -1, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1128
ARGP4
ADDRLP4 1080
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 4280
;4279:
;4280:		me_down = (int)tr.endpos[2];
ADDRLP4 1168
ADDRLP4 0+12+8
INDIRF4
CVFI4 4
ASGNI4
line 4282
;4281:
;4282:		if (tr.startsolid || tr.allsolid)
ADDRLP4 1180
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1180
INDIRI4
NEI4 $1758
ADDRLP4 0
INDIRI4
ADDRLP4 1180
INDIRI4
EQI4 $1755
LABELV $1758
line 4283
;4283:		{
line 4284
;4284:			en_down = 1;
ADDRLP4 1164
CNSTI4 1
ASGNI4
line 4285
;4285:			me_down = 2;
ADDRLP4 1168
CNSTI4 2
ASGNI4
line 4286
;4286:		}
LABELV $1755
line 4287
;4287:	}
LABELV $1749
line 4289
;4288:
;4289:	VectorSubtract(usethisvec, bs->origin, a);
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1104
ADDRLP4 1092
INDIRF4
ADDRLP4 1180
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1104+4
ADDRLP4 1092+4
INDIRF4
ADDRLP4 1180
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1104+8
ADDRLP4 1092+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4290
;4290:	vectoangles(a, a);
ADDRLP4 1104
ARGP4
ADDRLP4 1104
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 4291
;4291:	AngleVectors(a, fwd, NULL, NULL);
ADDRLP4 1104
ARGP4
ADDRLP4 1152
ARGP4
ADDRLP4 1184
CNSTP4 0
ASGNP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4293
;4292:
;4293:	midorg[0] = bs->origin[0] + fwd[0]*bs->frame_Enemy_Len/2;
ADDRLP4 1188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
ADDRLP4 1188
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 1152
INDIRF4
ADDRLP4 1188
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 4294
;4294:	midorg[1] = bs->origin[1] + fwd[1]*bs->frame_Enemy_Len/2;
ADDRLP4 1192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140+4
ADDRLP4 1192
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 1152+4
INDIRF4
ADDRLP4 1192
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 4295
;4295:	midorg[2] = bs->origin[2] + fwd[2]*bs->frame_Enemy_Len/2;
ADDRLP4 1196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140+8
ADDRLP4 1196
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 1152+8
INDIRF4
ADDRLP4 1196
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 4297
;4296:
;4297:	VectorCopy(midorg, downvec);
ADDRLP4 1080
ADDRLP4 1140
INDIRB
ASGNB 12
line 4298
;4298:	downvec[2] -= 4096;
ADDRLP4 1080+8
ADDRLP4 1080+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 4300
;4299:
;4300:	trap_Trace(&tr, midorg, mins, maxs, downvec, -1, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRLP4 1140
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1128
ARGP4
ADDRLP4 1080
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 4302
;4301:
;4302:	mid_down = (int)tr.endpos[2];
ADDRLP4 1172
ADDRLP4 0+12+8
INDIRF4
CVFI4 4
ASGNI4
line 4304
;4303:
;4304:	if (me_down == en_down &&
ADDRLP4 1168
INDIRI4
ADDRLP4 1164
INDIRI4
NEI4 $1770
ADDRLP4 1164
INDIRI4
ADDRLP4 1172
INDIRI4
NEI4 $1770
line 4306
;4305:		en_down == mid_down)
;4306:	{
line 4307
;4307:		if (usethisvec[2] > (bs->origin[2]+32) &&
ADDRLP4 1204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092+8
INDIRF4
ADDRLP4 1204
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1107296256
ADDF4
LEF4 $1772
ADDRLP4 1208
ADDRLP4 1204
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1208
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1772
ADDRLP4 1208
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1772
line 4310
;4308:			bs->currentEnemy->client &&
;4309:			bs->currentEnemy->client->ps.groundEntityNum == ENTITYNUM_NONE)
;4310:		{
line 4311
;4311:			bs->jumpTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2012
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 4312
;4312:		}
LABELV $1772
line 4314
;4313:
;4314:		if (bs->frame_Enemy_Len > 128)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1124073472
LEF4 $1776
line 4315
;4315:		{ //be ready to attack
line 4316
;4316:			bs->saberDefending = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2708
ADDP4
CNSTI4 0
ASGNI4
line 4317
;4317:			bs->saberDefendDecideTime = level.time + Q_irand(1000, 2000);
CNSTI4 1000
ARGI4
CNSTI4 2000
ARGI4
ADDRLP4 1212
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2712
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1212
INDIRI4
ADDI4
ASGNI4
line 4318
;4318:		}
ADDRGP4 $1777
JUMPV
LABELV $1776
line 4320
;4319:		else
;4320:		{
line 4321
;4321:			if (bs->saberDefendDecideTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2712
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1779
line 4322
;4322:			{
line 4323
;4323:				if (bs->saberDefending)
ADDRFP4 0
INDIRP4
CNSTI4 2708
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1782
line 4324
;4324:				{
line 4325
;4325:					bs->saberDefending = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2708
ADDP4
CNSTI4 0
ASGNI4
line 4326
;4326:				}
ADDRGP4 $1783
JUMPV
LABELV $1782
line 4328
;4327:				else
;4328:				{
line 4329
;4329:					bs->saberDefending = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2708
ADDP4
CNSTI4 1
ASGNI4
line 4330
;4330:				}
LABELV $1783
line 4332
;4331:
;4332:				bs->saberDefendDecideTime = level.time + Q_irand(500, 2000);
CNSTI4 500
ARGI4
CNSTI4 2000
ARGI4
ADDRLP4 1212
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2712
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1212
INDIRI4
ADDI4
ASGNI4
line 4333
;4333:			}
LABELV $1779
line 4334
;4334:		}
LABELV $1777
line 4336
;4335:
;4336:		if (bs->frame_Enemy_Len < 54)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1113063424
GEF4 $1785
line 4337
;4337:		{
line 4338
;4338:			VectorCopy(bs->origin, bs->goalPosition);
ADDRLP4 1212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1212
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 1212
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 4339
;4339:			bs->saberBFTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2716
ADDP4
CNSTI4 0
ASGNI4
line 4340
;4340:		}
ADDRGP4 $1786
JUMPV
LABELV $1785
line 4342
;4341:		else
;4342:		{
line 4343
;4343:			VectorCopy(usethisvec, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 1092
INDIRB
ASGNB 12
line 4344
;4344:		}
LABELV $1786
line 4346
;4345:
;4346:		if (bs->frame_Enemy_Len > 90 && bs->saberBFTime > level.time && bs->saberBTime > level.time && bs->beStill < level.time && bs->saberSTime < level.time)
ADDRLP4 1212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1212
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1119092736
LEF4 $1787
ADDRLP4 1212
INDIRP4
CNSTI4 2716
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $1787
ADDRLP4 1212
INDIRP4
CNSTI4 2720
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $1787
ADDRLP4 1212
INDIRP4
CNSTI4 2004
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $1787
ADDRLP4 1212
INDIRP4
CNSTI4 2724
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1787
line 4347
;4347:		{
line 4348
;4348:			bs->beStill = level.time + Q_irand(500, 1000);
CNSTI4 500
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 1216
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1216
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 4349
;4349:			bs->saberSTime = level.time + Q_irand(1200, 1800);
CNSTI4 1200
ARGI4
CNSTI4 1800
ARGI4
ADDRLP4 1220
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2724
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1220
INDIRI4
ADDI4
ASGNI4
line 4350
;4350:		}
ADDRGP4 $1771
JUMPV
LABELV $1787
line 4351
;4351:		else if (bs->currentEnemy->client->ps.weapon == WP_SABER && bs->frame_Enemy_Len < 80 && (Q_irand(1, 10) < 8 && bs->saberBFTime < level.time) || bs->saberBTime > level.time)
ADDRLP4 1216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1216
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1802
ADDRLP4 1216
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1117782016
GEF4 $1802
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 1220
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1220
INDIRI4
CNSTI4 8
GEI4 $1802
ADDRFP4 0
INDIRP4
CNSTI4 2716
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LTI4 $1799
LABELV $1802
ADDRFP4 0
INDIRP4
CNSTI4 2720
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $1795
LABELV $1799
line 4352
;4352:		{
line 4356
;4353:			vec3_t vs;
;4354:			vec3_t groundcheck;
;4355:
;4356:			VectorSubtract(bs->origin, usethisvec, vs);
ADDRLP4 1248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1224
ADDRLP4 1248
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 1092
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1224+4
ADDRLP4 1248
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 1092+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1224+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 1092+8
INDIRF4
SUBF4
ASGNF4
line 4357
;4357:			VectorNormalize(vs);
ADDRLP4 1224
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 4359
;4358:
;4359:			bs->goalPosition[0] = bs->origin[0] + vs[0]*64;
ADDRLP4 1252
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1252
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 1252
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 1224
INDIRF4
MULF4
ADDF4
ASGNF4
line 4360
;4360:			bs->goalPosition[1] = bs->origin[1] + vs[1]*64;
ADDRLP4 1256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1256
INDIRP4
CNSTI4 1924
ADDP4
ADDRLP4 1256
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 1224+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 4361
;4361:			bs->goalPosition[2] = bs->origin[2] + vs[2]*64;
ADDRLP4 1260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1260
INDIRP4
CNSTI4 1928
ADDP4
ADDRLP4 1260
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 1224+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4363
;4362:
;4363:			if (bs->saberBTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2720
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1809
line 4364
;4364:			{
line 4365
;4365:				bs->saberBFTime = level.time + Q_irand(900, 1300);
CNSTI4 900
ARGI4
CNSTI4 1300
ARGI4
ADDRLP4 1264
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2716
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1264
INDIRI4
ADDI4
ASGNI4
line 4366
;4366:				bs->saberBTime = level.time + Q_irand(300, 700);
CNSTI4 300
ARGI4
CNSTI4 700
ARGI4
ADDRLP4 1268
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2720
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1268
INDIRI4
ADDI4
ASGNI4
line 4367
;4367:			}
LABELV $1809
line 4369
;4368:
;4369:			VectorCopy(bs->goalPosition, groundcheck);
ADDRLP4 1236
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
INDIRB
ASGNB 12
line 4371
;4370:
;4371:			groundcheck[2] -= 64;
ADDRLP4 1236+8
ADDRLP4 1236+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 4373
;4372:
;4373:			trap_Trace(&tr, bs->goalPosition, NULL, NULL, groundcheck, bs->client, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRLP4 1264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1264
INDIRP4
CNSTI4 1920
ADDP4
ARGP4
ADDRLP4 1268
CNSTP4 0
ASGNP4
ADDRLP4 1268
INDIRP4
ARGP4
ADDRLP4 1268
INDIRP4
ARGP4
ADDRLP4 1236
ARGP4
ADDRLP4 1264
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 4375
;4374:			
;4375:			if (tr.fraction == 1.0)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $1771
line 4376
;4376:			{ //don't back off of a ledge
line 4377
;4377:				VectorCopy(usethisvec, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 1092
INDIRB
ASGNB 12
line 4378
;4378:			}
line 4379
;4379:		}
ADDRGP4 $1771
JUMPV
LABELV $1795
line 4380
;4380:		else if (bs->currentEnemy->client->ps.weapon == WP_SABER && bs->frame_Enemy_Len >= 75)
ADDRLP4 1224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1224
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1771
ADDRLP4 1224
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1117126656
LTF4 $1771
line 4381
;4381:		{
line 4382
;4382:			bs->saberBFTime = level.time + Q_irand(700, 1300);
CNSTI4 700
ARGI4
CNSTI4 1300
ARGI4
ADDRLP4 1228
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2716
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1228
INDIRI4
ADDI4
ASGNI4
line 4383
;4383:			bs->saberBTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2720
ADDP4
CNSTI4 0
ASGNI4
line 4384
;4384:		}
line 4400
;4385:
;4386:		/*AngleVectors(bs->viewangles, NULL, fwd, NULL);
;4387:
;4388:		if (bs->meleeStrafeDir)
;4389:		{
;4390:			bs->goalPosition[0] += fwd[0]*16;
;4391:			bs->goalPosition[1] += fwd[1]*16;
;4392:			bs->goalPosition[2] += fwd[2]*16;
;4393:		}
;4394:		else
;4395:		{
;4396:			bs->goalPosition[0] -= fwd[0]*16;
;4397:			bs->goalPosition[1] -= fwd[1]*16;
;4398:			bs->goalPosition[2] -= fwd[2]*16;
;4399:		}*/
;4400:	}
ADDRGP4 $1771
JUMPV
LABELV $1770
line 4401
;4401:	else if (bs->frame_Enemy_Len <= 56)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1113587712
GTF4 $1821
line 4402
;4402:	{
line 4403
;4403:		bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4404
;4404:		bs->saberDefending = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2708
ADDP4
CNSTI4 0
ASGNI4
line 4405
;4405:	}
LABELV $1821
LABELV $1771
line 4406
;4406:}
LABELV $1730
endproc SaberCombatHandling 1272 28
export BotWeaponCanLead
proc BotWeaponCanLead 4 0
line 4409
;4407:
;4408:float BotWeaponCanLead(bot_state_t *bs)
;4409:{
line 4410
;4410:	int weap = bs->cur_ps.weapon;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
line 4412
;4411:
;4412:	if (weap == WP_BRYAR_PISTOL)
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $1824
line 4413
;4413:	{
line 4414
;4414:		return 0.5;
CNSTF4 1056964608
RETF4
ADDRGP4 $1823
JUMPV
LABELV $1824
line 4416
;4415:	}
;4416:	if (weap == WP_BLASTER)
ADDRLP4 0
INDIRI4
CNSTI4 4
NEI4 $1826
line 4417
;4417:	{
line 4418
;4418:		return 0.35;
CNSTF4 1051931443
RETF4
ADDRGP4 $1823
JUMPV
LABELV $1826
line 4420
;4419:	}
;4420:	if (weap == WP_BOWCASTER)
ADDRLP4 0
INDIRI4
CNSTI4 6
NEI4 $1828
line 4421
;4421:	{
line 4422
;4422:		return 0.5;
CNSTF4 1056964608
RETF4
ADDRGP4 $1823
JUMPV
LABELV $1828
line 4424
;4423:	}
;4424:	if (weap == WP_REPEATER)
ADDRLP4 0
INDIRI4
CNSTI4 7
NEI4 $1830
line 4425
;4425:	{
line 4426
;4426:		return 0.45;
CNSTF4 1055286886
RETF4
ADDRGP4 $1823
JUMPV
LABELV $1830
line 4428
;4427:	}
;4428:	if (weap == WP_THERMAL)
ADDRLP4 0
INDIRI4
CNSTI4 11
NEI4 $1832
line 4429
;4429:	{
line 4430
;4430:		return 0.5;
CNSTF4 1056964608
RETF4
ADDRGP4 $1823
JUMPV
LABELV $1832
line 4432
;4431:	}
;4432:	if (weap == WP_DEMP2)
ADDRLP4 0
INDIRI4
CNSTI4 8
NEI4 $1834
line 4433
;4433:	{
line 4434
;4434:		return 0.35;
CNSTF4 1051931443
RETF4
ADDRGP4 $1823
JUMPV
LABELV $1834
line 4436
;4435:	}
;4436:	if (weap == WP_ROCKET_LAUNCHER)
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $1836
line 4437
;4437:	{
line 4438
;4438:		return 0.7;
CNSTF4 1060320051
RETF4
ADDRGP4 $1823
JUMPV
LABELV $1836
line 4441
;4439:	}
;4440:	
;4441:	return 0;
CNSTF4 0
RETF4
LABELV $1823
endproc BotWeaponCanLead 4 0
export BotAimLeading
proc BotAimLeading 68 8
line 4445
;4442:}
;4443:
;4444:void BotAimLeading(bot_state_t *bs, vec3_t headlevel, float leadAmount)
;4445:{
line 4452
;4446:	int x;
;4447:	vec3_t predictedSpot;
;4448:	vec3_t movementVector;
;4449:	vec3_t a, ang;
;4450:	float vtotal;
;4451:
;4452:	if (!bs->currentEnemy ||
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 60
CNSTU4 0
ASGNU4
ADDRLP4 56
INDIRP4
CVPU4 4
ADDRLP4 60
INDIRU4
EQU4 $1841
ADDRLP4 56
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 60
INDIRU4
NEU4 $1839
LABELV $1841
line 4454
;4453:		!bs->currentEnemy->client)
;4454:	{
line 4455
;4455:		return;
ADDRGP4 $1838
JUMPV
LABELV $1839
line 4458
;4456:	}
;4457:
;4458:	if (!bs->frame_Enemy_Len)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 0
NEF4 $1842
line 4459
;4459:	{
line 4460
;4460:		return;
ADDRGP4 $1838
JUMPV
LABELV $1842
line 4463
;4461:	}
;4462:
;4463:	vtotal = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4465
;4464:
;4465:	if (bs->currentEnemy->client->ps.velocity[0] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1844
line 4466
;4466:	{
line 4467
;4467:		vtotal += -bs->currentEnemy->client->ps.velocity[0];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
NEGF4
ADDF4
ASGNF4
line 4468
;4468:	}
ADDRGP4 $1845
JUMPV
LABELV $1844
line 4470
;4469:	else
;4470:	{
line 4471
;4471:		vtotal += bs->currentEnemy->client->ps.velocity[0];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4472
;4472:	}
LABELV $1845
line 4474
;4473:
;4474:	if (bs->currentEnemy->client->ps.velocity[1] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1846
line 4475
;4475:	{
line 4476
;4476:		vtotal += -bs->currentEnemy->client->ps.velocity[1];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
NEGF4
ADDF4
ASGNF4
line 4477
;4477:	}
ADDRGP4 $1847
JUMPV
LABELV $1846
line 4479
;4478:	else
;4479:	{
line 4480
;4480:		vtotal += bs->currentEnemy->client->ps.velocity[1];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4481
;4481:	}
LABELV $1847
line 4483
;4482:
;4483:	if (bs->currentEnemy->client->ps.velocity[2] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1848
line 4484
;4484:	{
line 4485
;4485:		vtotal += -bs->currentEnemy->client->ps.velocity[2];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
NEGF4
ADDF4
ASGNF4
line 4486
;4486:	}
ADDRGP4 $1849
JUMPV
LABELV $1848
line 4488
;4487:	else
;4488:	{
line 4489
;4489:		vtotal += bs->currentEnemy->client->ps.velocity[2];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4490
;4490:	}
LABELV $1849
line 4494
;4491:
;4492:	//G_Printf("Leadin target with a velocity total of %f\n", vtotal);
;4493:
;4494:	VectorCopy(bs->currentEnemy->client->ps.velocity, movementVector);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 4496
;4495:
;4496:	VectorNormalize(movementVector);
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 4498
;4497:
;4498:	x = bs->frame_Enemy_Len*leadAmount; //hardly calculated with an exact science, but it works
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 4500
;4499:
;4500:	if (vtotal > 400)
ADDRLP4 0
INDIRF4
CNSTF4 1137180672
LEF4 $1850
line 4501
;4501:	{
line 4502
;4502:		vtotal = 400;
ADDRLP4 0
CNSTF4 1137180672
ASGNF4
line 4503
;4503:	}
LABELV $1850
line 4505
;4504:
;4505:	if (vtotal)
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $1852
line 4506
;4506:	{
line 4507
;4507:		x = (bs->frame_Enemy_Len*0.9)*leadAmount*(vtotal*0.0012); //hardly calculated with an exact science, but it works
ADDRLP4 16
CNSTF4 1063675494
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
ADDRFP4 8
INDIRF4
MULF4
CNSTF4 983386450
ADDRLP4 0
INDIRF4
MULF4
MULF4
CVFI4 4
ASGNI4
line 4508
;4508:	}
ADDRGP4 $1853
JUMPV
LABELV $1852
line 4510
;4509:	else
;4510:	{
line 4511
;4511:		x = (bs->frame_Enemy_Len*0.9)*leadAmount; //hardly calculated with an exact science, but it works
ADDRLP4 16
CNSTF4 1063675494
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
ADDRFP4 8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 4512
;4512:	}
LABELV $1853
line 4514
;4513:
;4514:	predictedSpot[0] = headlevel[0] + (movementVector[0]*x);
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 4515
;4515:	predictedSpot[1] = headlevel[1] + (movementVector[1]*x);
ADDRLP4 4+4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20+4
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 4516
;4516:	predictedSpot[2] = headlevel[2] + (movementVector[2]*x);
ADDRLP4 4+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 20+8
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 4518
;4517:
;4518:	VectorSubtract(predictedSpot, bs->eye, a);
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32+8
ADDRLP4 4+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4519
;4519:	vectoangles(a, ang);
ADDRLP4 32
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 4520
;4520:	VectorCopy(ang, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 44
INDIRB
ASGNB 12
line 4521
;4521:}
LABELV $1838
endproc BotAimLeading 68 8
export BotAimOffsetGoalAngles
proc BotAimOffsetGoalAngles 56 8
line 4524
;4522:
;4523:void BotAimOffsetGoalAngles(bot_state_t *bs)
;4524:{
line 4527
;4525:	int i;
;4526:	float accVal;
;4527:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4529
;4528:
;4529:	if (bs->skills.perfectaim)
ADDRFP4 0
INDIRP4
CNSTI4 2336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1863
line 4530
;4530:	{
line 4531
;4531:		return;
ADDRGP4 $1862
JUMPV
LABELV $1863
line 4534
;4532:	}
;4533:
;4534:	if (bs->aimOffsetTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2032
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $1865
line 4535
;4535:	{
line 4536
;4536:		if (bs->aimOffsetAmtYaw)
ADDRFP4 0
INDIRP4
CNSTI4 2036
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1868
line 4537
;4537:		{
line 4538
;4538:			bs->goalAngles[YAW] += bs->aimOffsetAmtYaw;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 1900
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 2036
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4539
;4539:		}
LABELV $1868
line 4541
;4540:
;4541:		if (bs->aimOffsetAmtPitch)
ADDRFP4 0
INDIRP4
CNSTI4 2040
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1873
line 4542
;4542:		{
line 4543
;4543:			bs->goalAngles[PITCH] += bs->aimOffsetAmtPitch;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 1896
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 2040
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4544
;4544:		}
ADDRGP4 $1873
JUMPV
LABELV $1872
line 4547
;4545:		
;4546:		while (i <= 2)
;4547:		{
line 4548
;4548:			if (bs->goalAngles[i] > 360)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDP4
INDIRF4
CNSTF4 1135869952
LEF4 $1875
line 4549
;4549:			{
line 4550
;4550:				bs->goalAngles[i] -= 360;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 4551
;4551:			}
LABELV $1875
line 4553
;4552:
;4553:			if (bs->goalAngles[i] < 0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1877
line 4554
;4554:			{
line 4555
;4555:				bs->goalAngles[i] += 360;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 4556
;4556:			}
LABELV $1877
line 4558
;4557:
;4558:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4559
;4559:		}
LABELV $1873
line 4546
ADDRLP4 0
INDIRI4
CNSTI4 2
LEI4 $1872
line 4560
;4560:		return;
ADDRGP4 $1862
JUMPV
LABELV $1865
line 4563
;4561:	}
;4562:
;4563:	accVal = bs->skills.accuracy/bs->settings.skill;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 2320
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 1568
ADDP4
INDIRF4
DIVF4
ASGNF4
line 4565
;4564:
;4565:	if (bs->currentEnemy && BotMindTricked(bs->client, bs->currentEnemy->s.number))
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1879
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BotMindTricked
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1879
line 4566
;4566:	{ //having to judge where they are by hearing them, so we should be quite inaccurate here
line 4567
;4567:		accVal *= 7;
ADDRLP4 4
CNSTF4 1088421888
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 4569
;4568:
;4569:		if (accVal < 30)
ADDRLP4 4
INDIRF4
CNSTF4 1106247680
GEF4 $1881
line 4570
;4570:		{
line 4571
;4571:			accVal = 30;
ADDRLP4 4
CNSTF4 1106247680
ASGNF4
line 4572
;4572:		}
LABELV $1881
line 4573
;4573:	}
LABELV $1879
line 4575
;4574:
;4575:	if (bs->revengeEnemy && bs->revengeHateLevel &&
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 28
INDIRU4
CNSTU4 0
EQU4 $1883
ADDRLP4 24
INDIRP4
CNSTI4 1864
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1883
ADDRLP4 24
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
NEU4 $1883
line 4577
;4576:		bs->currentEnemy == bs->revengeEnemy)
;4577:	{ //bot becomes more skilled as anger level raises
line 4578
;4578:		accVal = accVal/bs->revengeHateLevel;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1864
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 4579
;4579:	}
LABELV $1883
line 4581
;4580:
;4581:	if (bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1885
ADDRLP4 32
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1885
line 4582
;4582:	{ //assume our goal is aiming at the enemy, seeing as he's visible and all
line 4583
;4583:		if (!bs->currentEnemy->s.pos.trDelta[0] &&
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTF4 0
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 40
INDIRF4
NEF4 $1887
ADDRLP4 36
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 40
INDIRF4
NEF4 $1887
ADDRLP4 36
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ADDRLP4 40
INDIRF4
NEF4 $1887
line 4586
;4584:			!bs->currentEnemy->s.pos.trDelta[1] &&
;4585:			!bs->currentEnemy->s.pos.trDelta[2])
;4586:		{
line 4587
;4587:			accVal = 0; //he's not even moving, so he shouldn't really be hard to hit.
ADDRLP4 4
CNSTF4 0
ASGNF4
line 4588
;4588:		}
ADDRGP4 $1888
JUMPV
LABELV $1887
line 4590
;4589:		else
;4590:		{
line 4591
;4591:			accVal += accVal*0.25; //if he's moving he's this much harder to hit
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1048576000
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 4592
;4592:		}
LABELV $1888
line 4594
;4593:
;4594:		if (g_entities[bs->client].s.pos.trDelta[0] ||
ADDRLP4 44
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 44
INDIRI4
ADDRGP4 g_entities+12+24
ADDP4
INDIRF4
ADDRLP4 48
INDIRF4
NEF4 $1900
ADDRLP4 44
INDIRI4
ADDRGP4 g_entities+12+24+4
ADDP4
INDIRF4
ADDRLP4 48
INDIRF4
NEF4 $1900
ADDRLP4 44
INDIRI4
ADDRGP4 g_entities+12+24+8
ADDP4
INDIRF4
ADDRLP4 48
INDIRF4
EQF4 $1889
LABELV $1900
line 4597
;4595:			g_entities[bs->client].s.pos.trDelta[1] ||
;4596:			g_entities[bs->client].s.pos.trDelta[2])
;4597:		{
line 4598
;4598:			accVal += accVal*0.15; //make it somewhat harder to aim if we're moving also
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1041865114
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 4599
;4599:		}
LABELV $1889
line 4600
;4600:	}
LABELV $1885
line 4602
;4601:
;4602:	if (accVal > 90)
ADDRLP4 4
INDIRF4
CNSTF4 1119092736
LEF4 $1901
line 4603
;4603:	{
line 4604
;4604:		accVal = 90;
ADDRLP4 4
CNSTF4 1119092736
ASGNF4
line 4605
;4605:	}
LABELV $1901
line 4606
;4606:	if (accVal < 1)
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
GEF4 $1903
line 4607
;4607:	{
line 4608
;4608:		accVal = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 4609
;4609:	}
LABELV $1903
line 4611
;4610:
;4611:	if (!accVal)
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $1905
line 4612
;4612:	{
line 4613
;4613:		bs->aimOffsetAmtYaw = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2036
ADDP4
CNSTF4 0
ASGNF4
line 4614
;4614:		bs->aimOffsetAmtPitch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2040
ADDP4
CNSTF4 0
ASGNF4
line 4615
;4615:		return;
ADDRGP4 $1862
JUMPV
LABELV $1905
line 4618
;4616:	}
;4617:
;4618:	if (rand()%10 <= 5)
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GTI4 $1907
line 4619
;4619:	{
line 4620
;4620:		bs->aimOffsetAmtYaw = rand()%(int)accVal;
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2036
ADDP4
ADDRLP4 40
INDIRI4
ADDRLP4 4
INDIRF4
CVFI4 4
MODI4
CVIF4 4
ASGNF4
line 4621
;4621:	}
ADDRGP4 $1908
JUMPV
LABELV $1907
line 4623
;4622:	else
;4623:	{
line 4624
;4624:		bs->aimOffsetAmtYaw = -(rand()%(int)accVal);
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2036
ADDP4
ADDRLP4 40
INDIRI4
ADDRLP4 4
INDIRF4
CVFI4 4
MODI4
NEGI4
CVIF4 4
ASGNF4
line 4625
;4625:	}
LABELV $1908
line 4627
;4626:
;4627:	if (rand()%10 <= 5)
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GTI4 $1909
line 4628
;4628:	{
line 4629
;4629:		bs->aimOffsetAmtPitch = rand()%(int)accVal;
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2040
ADDP4
ADDRLP4 44
INDIRI4
ADDRLP4 4
INDIRF4
CVFI4 4
MODI4
CVIF4 4
ASGNF4
line 4630
;4630:	}
ADDRGP4 $1910
JUMPV
LABELV $1909
line 4632
;4631:	else
;4632:	{
line 4633
;4633:		bs->aimOffsetAmtPitch = -(rand()%(int)accVal);
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2040
ADDP4
ADDRLP4 44
INDIRI4
ADDRLP4 4
INDIRF4
CVFI4 4
MODI4
NEGI4
CVIF4 4
ASGNF4
line 4634
;4634:	}
LABELV $1910
line 4636
;4635:
;4636:	bs->aimOffsetTime = level.time + rand()%500 + 200;
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2032
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 44
INDIRI4
CNSTI4 500
MODI4
ADDI4
CNSTI4 200
ADDI4
CVIF4 4
ASGNF4
line 4637
;4637:}
LABELV $1862
endproc BotAimOffsetGoalAngles 56 8
export ShouldSecondaryFire
proc ShouldSecondaryFire 28 0
line 4640
;4638:
;4639:int ShouldSecondaryFire(bot_state_t *bs)
;4640:{
line 4645
;4641:	int weap;
;4642:	int dif;
;4643:	float rTime;
;4644:
;4645:	weap = bs->cur_ps.weapon;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
line 4647
;4646:
;4647:	if (bs->cur_ps.ammo[weaponData[weap].ammoIndex] < weaponData[weap].altEnergyPerShot)
ADDRLP4 12
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDRGP4 weaponData+20
ADDP4
INDIRI4
GEI4 $1913
line 4648
;4648:	{
line 4649
;4649:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1912
JUMPV
LABELV $1913
line 4652
;4650:	}
;4651:
;4652:	if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT && bs->cur_ps.weapon == WP_ROCKET_LAUNCHER)
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1916
ADDRLP4 16
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 10
NEI4 $1916
line 4653
;4653:	{
line 4654
;4654:		float heldTime = (level.time - bs->cur_ps.weaponChargeTime);
ADDRLP4 20
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 4656
;4655:
;4656:		rTime = bs->cur_ps.rocketLockTime;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRF4
ASGNF4
line 4658
;4657:
;4658:		if (rTime < 1)
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
GEF4 $1919
line 4659
;4659:		{
line 4660
;4660:			rTime = bs->cur_ps.rocketLastValidTime;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRF4
ASGNF4
line 4661
;4661:		}
LABELV $1919
line 4663
;4662:
;4663:		if (heldTime > 5000)
ADDRLP4 20
INDIRF4
CNSTF4 1167867904
LEF4 $1921
line 4664
;4664:		{ //just give up and release it if we can't manage a lock in 5 seconds
line 4665
;4665:			return 2;
CNSTI4 2
RETI4
ADDRGP4 $1912
JUMPV
LABELV $1921
line 4668
;4666:		}
;4667:
;4668:		if (rTime > 0)
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $1923
line 4669
;4669:		{
line 4670
;4670:			dif = ( level.time - rTime ) / ( 1200.0f / 16.0f );
ADDRLP4 8
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
SUBF4
CNSTF4 1117126656
DIVF4
CVFI4 4
ASGNI4
line 4672
;4671:			
;4672:			if (dif >= 10)
ADDRLP4 8
INDIRI4
CNSTI4 10
LTI4 $1926
line 4673
;4673:			{
line 4674
;4674:				return 2;
CNSTI4 2
RETI4
ADDRGP4 $1912
JUMPV
LABELV $1926
line 4676
;4675:			}
;4676:			else if (bs->frame_Enemy_Len > 250)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132068864
LEF4 $1917
line 4677
;4677:			{
line 4678
;4678:				return 1;
CNSTI4 1
RETI4
ADDRGP4 $1912
JUMPV
line 4680
;4679:			}
;4680:		}
LABELV $1923
line 4681
;4681:		else if (bs->frame_Enemy_Len > 250)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132068864
LEF4 $1917
line 4682
;4682:		{
line 4683
;4683:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1912
JUMPV
line 4685
;4684:		}
;4685:	}
LABELV $1916
line 4686
;4686:	else if ((bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT) && (level.time - bs->cur_ps.weaponChargeTime) > bs->altChargeTime)
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1932
ADDRGP4 level+32
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
SUBI4
ADDRLP4 20
INDIRP4
CNSTI4 2264
ADDP4
INDIRI4
LEI4 $1932
line 4687
;4687:	{
line 4688
;4688:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $1912
JUMPV
LABELV $1932
line 4690
;4689:	}
;4690:	else if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT)
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1935
line 4691
;4691:	{
line 4692
;4692:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1912
JUMPV
LABELV $1935
LABELV $1917
line 4695
;4693:	}
;4694:
;4695:	if (weap == WP_BRYAR_PISTOL && bs->frame_Enemy_Len < 300)
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $1937
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1133903872
GEF4 $1937
line 4696
;4696:	{
line 4697
;4697:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1912
JUMPV
LABELV $1937
line 4699
;4698:	}
;4699:	else if (weap == WP_BOWCASTER && bs->frame_Enemy_Len > 300)
ADDRLP4 0
INDIRI4
CNSTI4 6
NEI4 $1939
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1133903872
LEF4 $1939
line 4700
;4700:	{
line 4701
;4701:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1912
JUMPV
LABELV $1939
line 4703
;4702:	}
;4703:	else if (weap == WP_REPEATER && bs->frame_Enemy_Len < 600 && bs->frame_Enemy_Len > 250)
ADDRLP4 0
INDIRI4
CNSTI4 7
NEI4 $1941
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 1142292480
GEF4 $1941
ADDRLP4 24
INDIRF4
CNSTF4 1132068864
LEF4 $1941
line 4704
;4704:	{
line 4705
;4705:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1912
JUMPV
LABELV $1941
line 4707
;4706:	}
;4707:	else if (weap == WP_BLASTER && bs->frame_Enemy_Len < 300)
ADDRLP4 0
INDIRI4
CNSTI4 4
NEI4 $1943
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1133903872
GEF4 $1943
line 4708
;4708:	{
line 4709
;4709:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1912
JUMPV
LABELV $1943
line 4711
;4710:	}
;4711:	else if (weap == WP_ROCKET_LAUNCHER && bs->frame_Enemy_Len > 250)
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $1945
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132068864
LEF4 $1945
line 4712
;4712:	{
line 4713
;4713:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1912
JUMPV
LABELV $1945
line 4716
;4714:	}
;4715:
;4716:	return 0;
CNSTI4 0
RETI4
LABELV $1912
endproc ShouldSecondaryFire 28 0
export CombatBotAI
proc CombatBotAI 80 12
line 4720
;4717:}
;4718:
;4719:int CombatBotAI(bot_state_t *bs, float thinktime)
;4720:{
line 4725
;4721:	vec3_t eorg, a;
;4722:	int secFire;
;4723:	float fovcheck;
;4724:
;4725:	if (!bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1948
line 4726
;4726:	{
line 4727
;4727:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1947
JUMPV
LABELV $1948
line 4730
;4728:	}
;4729:
;4730:	if (bs->currentEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1950
line 4731
;4731:	{
line 4732
;4732:		VectorCopy(bs->currentEnemy->client->ps.origin, eorg);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 4733
;4733:	}
ADDRGP4 $1951
JUMPV
LABELV $1950
line 4735
;4734:	else
;4735:	{
line 4736
;4736:		VectorCopy(bs->currentEnemy->s.origin, eorg);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 4737
;4737:	}
LABELV $1951
line 4739
;4738:
;4739:	VectorSubtract(eorg, bs->eye, a);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4740
;4740:	vectoangles(a, a);
ADDRLP4 0
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 4742
;4741:
;4742:	if (BotGetWeaponRange(bs) == BWEAPONRANGE_SABER)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 4
NEI4 $1956
line 4743
;4743:	{
line 4744
;4744:		if (bs->frame_Enemy_Len <= SABER_ATTACK_RANGE)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1124073472
GTF4 $1957
line 4745
;4745:		{
line 4746
;4746:			bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4747
;4747:		}
line 4748
;4748:	}
ADDRGP4 $1957
JUMPV
LABELV $1956
line 4749
;4749:	else if (BotGetWeaponRange(bs) == BWEAPONRANGE_MELEE)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 1
NEI4 $1960
line 4750
;4750:	{
line 4751
;4751:		if (bs->frame_Enemy_Len <= MELEE_ATTACK_RANGE)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132462080
GTF4 $1961
line 4752
;4752:		{
line 4753
;4753:			bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4754
;4754:		}
line 4755
;4755:	}
ADDRGP4 $1961
JUMPV
LABELV $1960
line 4757
;4756:	else
;4757:	{
line 4758
;4758:		if (bs->cur_ps.weapon == WP_THERMAL || bs->cur_ps.weapon == WP_ROCKET_LAUNCHER)
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 11
EQI4 $1966
ADDRLP4 44
INDIRI4
CNSTI4 10
NEI4 $1964
LABELV $1966
line 4759
;4759:		{ //be careful with the hurty weapons
line 4760
;4760:			fovcheck = 40;
ADDRLP4 24
CNSTF4 1109393408
ASGNF4
line 4762
;4761:
;4762:			if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT &&
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1965
ADDRLP4 48
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 10
NEI4 $1965
line 4764
;4763:				bs->cur_ps.weapon == WP_ROCKET_LAUNCHER)
;4764:			{ //if we're charging the weapon up then we can hold fire down within a normal fov
line 4765
;4765:				fovcheck = 60;
ADDRLP4 24
CNSTF4 1114636288
ASGNF4
line 4766
;4766:			}
line 4767
;4767:		}
ADDRGP4 $1965
JUMPV
LABELV $1964
line 4769
;4768:		else
;4769:		{
line 4770
;4770:			fovcheck = 60;
ADDRLP4 24
CNSTF4 1114636288
ASGNF4
line 4771
;4771:		}
LABELV $1965
line 4773
;4772:
;4773:		if (bs->cur_ps.weaponstate == WEAPON_CHARGING ||
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 4
EQI4 $1971
ADDRLP4 48
INDIRI4
CNSTI4 5
NEI4 $1969
LABELV $1971
line 4775
;4774:			bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT)
;4775:		{
line 4776
;4776:			fovcheck = 160;
ADDRLP4 24
CNSTF4 1126170624
ASGNF4
line 4777
;4777:		}
LABELV $1969
line 4779
;4778:
;4779:		if (bs->frame_Enemy_Len < 128)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1124073472
GEF4 $1972
line 4780
;4780:		{
line 4781
;4781:			fovcheck *= 2;
ADDRLP4 24
CNSTF4 1073741824
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 4782
;4782:		}
LABELV $1972
line 4784
;4783:
;4784:		if (InFieldOfVision(bs->viewangles, fovcheck, a))
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 0
ARGP4
ADDRLP4 52
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $1974
line 4785
;4785:		{
line 4786
;4786:			if (bs->cur_ps.weapon == WP_THERMAL)
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 11
NEI4 $1976
line 4787
;4787:			{
line 4788
;4788:				if (((level.time - bs->cur_ps.weaponChargeTime) < (bs->frame_Enemy_Len*2) &&
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
ADDRLP4 64
ADDRLP4 56
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ASGNF4
ADDRGP4 level+32
INDIRI4
ADDRLP4 60
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1073741824
ADDRLP4 64
INDIRF4
MULF4
GEF4 $1984
ADDRGP4 level+32
INDIRI4
ADDRLP4 60
INDIRI4
SUBI4
CNSTI4 4000
GEI4 $1984
ADDRLP4 64
INDIRF4
CNSTF4 1115684864
GTF4 $1982
LABELV $1984
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 4
EQI4 $1977
ADDRLP4 68
INDIRI4
CNSTI4 5
EQI4 $1977
LABELV $1982
line 4793
;4789:					(level.time - bs->cur_ps.weaponChargeTime) < 4000 &&
;4790:					bs->frame_Enemy_Len > 64) ||
;4791:					(bs->cur_ps.weaponstate != WEAPON_CHARGING &&
;4792:					bs->cur_ps.weaponstate != WEAPON_CHARGING_ALT))
;4793:				{
line 4794
;4794:					if (bs->cur_ps.weaponstate != WEAPON_CHARGING && bs->cur_ps.weaponstate != WEAPON_CHARGING_ALT)
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 4
EQI4 $1985
ADDRLP4 72
INDIRI4
CNSTI4 5
EQI4 $1985
line 4795
;4795:					{
line 4796
;4796:						if (bs->frame_Enemy_Len > 512 && bs->frame_Enemy_Len < 800)
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ASGNF4
ADDRLP4 76
INDIRF4
CNSTF4 1140850688
LEF4 $1987
ADDRLP4 76
INDIRF4
CNSTF4 1145569280
GEF4 $1987
line 4797
;4797:						{
line 4798
;4798:							bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 4800
;4799:							//bs->doAttack = 1;
;4800:						}
ADDRGP4 $1988
JUMPV
LABELV $1987
line 4802
;4801:						else
;4802:						{
line 4803
;4803:							bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4805
;4804:							//bs->doAltAttack = 1;
;4805:						}
LABELV $1988
line 4806
;4806:					}
LABELV $1985
line 4808
;4807:
;4808:					if (bs->cur_ps.weaponstate == WEAPON_CHARGING)
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1989
line 4809
;4809:					{
line 4810
;4810:						bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4811
;4811:					}
ADDRGP4 $1977
JUMPV
LABELV $1989
line 4812
;4812:					else if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT)
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1977
line 4813
;4813:					{
line 4814
;4814:						bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 4815
;4815:					}
line 4816
;4816:				}
line 4817
;4817:			}
ADDRGP4 $1977
JUMPV
LABELV $1976
line 4819
;4818:			else
;4819:			{
line 4820
;4820:				secFire = ShouldSecondaryFire(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 ShouldSecondaryFire
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 56
INDIRI4
ASGNI4
line 4822
;4821:
;4822:				if (bs->cur_ps.weaponstate != WEAPON_CHARGING_ALT &&
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 5
EQI4 $1993
ADDRLP4 60
INDIRI4
CNSTI4 4
EQI4 $1993
line 4824
;4823:					bs->cur_ps.weaponstate != WEAPON_CHARGING)
;4824:				{
line 4825
;4825:					bs->altChargeTime = Q_irand(500, 1000);
CNSTI4 500
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 64
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2264
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 4826
;4826:				}
LABELV $1993
line 4828
;4827:
;4828:				if (secFire == 1)
ADDRLP4 28
INDIRI4
CNSTI4 1
NEI4 $1995
line 4829
;4829:				{
line 4830
;4830:					bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 4831
;4831:				}
ADDRGP4 $1996
JUMPV
LABELV $1995
line 4832
;4832:				else if (!secFire)
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $1997
line 4833
;4833:				{
line 4834
;4834:					if (bs->cur_ps.weapon != WP_THERMAL)
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 11
EQI4 $1999
line 4835
;4835:					{
line 4836
;4836:						if (bs->cur_ps.weaponstate != WEAPON_CHARGING ||
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
NEI4 $2004
ADDRLP4 64
INDIRP4
CNSTI4 2264
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
SUBI4
LEI4 $2000
LABELV $2004
line 4838
;4837:							bs->altChargeTime > (level.time - bs->cur_ps.weaponChargeTime))
;4838:						{
line 4839
;4839:							bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4840
;4840:						}
line 4841
;4841:					}
ADDRGP4 $2000
JUMPV
LABELV $1999
line 4843
;4842:					else
;4843:					{
line 4844
;4844:						bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4845
;4845:					}
LABELV $2000
line 4846
;4846:				}
LABELV $1997
LABELV $1996
line 4848
;4847:
;4848:				if (secFire == 2)
ADDRLP4 28
INDIRI4
CNSTI4 2
NEI4 $2005
line 4849
;4849:				{ //released a charge
line 4850
;4850:					return 1;
CNSTI4 1
RETI4
ADDRGP4 $1947
JUMPV
LABELV $2005
line 4852
;4851:				}
;4852:			}
LABELV $1977
line 4853
;4853:		}
LABELV $1974
line 4854
;4854:	}
LABELV $1961
LABELV $1957
line 4856
;4855:
;4856:	return 0;
CNSTI4 0
RETI4
LABELV $1947
endproc CombatBotAI 80 12
export BotFallbackNavigation
proc BotFallbackNavigation 1152 28
line 4860
;4857:}
;4858:
;4859:int BotFallbackNavigation(bot_state_t *bs)
;4860:{
line 4864
;4861:	vec3_t b_angle, fwd, trto, mins, maxs;
;4862:	trace_t tr;
;4863:
;4864:	if (bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2008
ADDRLP4 1140
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2008
line 4865
;4865:	{
line 4866
;4866:		return 2; //we're busy
CNSTI4 2
RETI4
ADDRGP4 $2007
JUMPV
LABELV $2008
line 4869
;4867:	}
;4868:
;4869:	mins[0] = -15;
ADDRLP4 24
CNSTF4 3245342720
ASGNF4
line 4870
;4870:	mins[1] = -15;
ADDRLP4 24+4
CNSTF4 3245342720
ASGNF4
line 4871
;4871:	mins[2] = 0;
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 4872
;4872:	maxs[0] = 15;
ADDRLP4 36
CNSTF4 1097859072
ASGNF4
line 4873
;4873:	maxs[1] = 15;
ADDRLP4 36+4
CNSTF4 1097859072
ASGNF4
line 4874
;4874:	maxs[2] = 32;
ADDRLP4 36+8
CNSTF4 1107296256
ASGNF4
line 4876
;4875:
;4876:	bs->goalAngles[PITCH] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
CNSTF4 0
ASGNF4
line 4877
;4877:	bs->goalAngles[ROLL] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
CNSTF4 0
ASGNF4
line 4879
;4878:
;4879:	VectorCopy(bs->goalAngles, b_angle);
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
INDIRB
ASGNB 12
line 4881
;4880:
;4881:	AngleVectors(b_angle, fwd, NULL, NULL);
ADDRLP4 48
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 1144
CNSTP4 0
ASGNP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4883
;4882:
;4883:	trto[0] = bs->origin[0] + fwd[0]*16;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1098907648
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 4884
;4884:	trto[1] = bs->origin[1] + fwd[1]*16;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1098907648
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 4885
;4885:	trto[2] = bs->origin[2] + fwd[2]*16;
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1098907648
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4887
;4886:
;4887:	trap_Trace(&tr, bs->origin, mins, maxs, trto, -1, MASK_SOLID);
ADDRLP4 60
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 4889
;4888:
;4889:	if (tr.fraction == 1)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
NEF4 $2018
line 4890
;4890:	{
line 4891
;4891:		VectorCopy(trto, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 4892
;4892:		return 1; //success!
CNSTI4 1
RETI4
ADDRGP4 $2007
JUMPV
LABELV $2018
line 4895
;4893:	}
;4894:	else
;4895:	{
line 4896
;4896:		bs->goalAngles[YAW] = rand()%360;
ADDRLP4 1148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
ADDRLP4 1148
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 4897
;4897:	}
line 4899
;4898:
;4899:	return 0;
CNSTI4 0
RETI4
LABELV $2007
endproc BotFallbackNavigation 1152 28
export BotTryAnotherWeapon
proc BotTryAnotherWeapon 16 8
line 4903
;4900:}
;4901:
;4902:int BotTryAnotherWeapon(bot_state_t *bs)
;4903:{ //out of ammo, resort to the first weapon we come across that has ammo
line 4906
;4904:	int i;
;4905:
;4906:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2023
JUMPV
LABELV $2022
line 4909
;4907:
;4908:	while (i < WP_NUM_WEAPONS)
;4909:	{
line 4910
;4910:		if (bs->cur_ps.ammo[weaponData[i].ammoIndex] > weaponData[i].energyPerShot &&
ADDRLP4 8
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRGP4 weaponData+8
ADDP4
INDIRI4
LEI4 $2025
ADDRLP4 12
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2025
line 4912
;4911:			(bs->cur_ps.stats[STAT_WEAPONS] & (1 << i)))
;4912:		{
line 4913
;4913:			bs->virtualWeapon = i;
ADDRFP4 0
INDIRP4
CNSTI4 2288
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 4914
;4914:			BotSelectWeapon(bs->client, i);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSelectWeapon
CALLV
pop
line 4917
;4915:			//bs->cur_ps.weapon = i;
;4916:			//level.clients[bs->client].ps.weapon = i;
;4917:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $2021
JUMPV
LABELV $2025
line 4920
;4918:		}
;4919:
;4920:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4921
;4921:	}
LABELV $2023
line 4908
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $2022
line 4923
;4922:
;4923:	if (bs->cur_ps.weapon != 1 && bs->virtualWeapon != 1)
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2028
ADDRLP4 4
INDIRP4
CNSTI4 2288
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2028
line 4924
;4924:	{ //should always have this.. shouldn't we?
line 4925
;4925:		bs->virtualWeapon = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2288
ADDP4
CNSTI4 1
ASGNI4
line 4926
;4926:		BotSelectWeapon(bs->client, 1);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotSelectWeapon
CALLV
pop
line 4929
;4927:		//bs->cur_ps.weapon = 1;
;4928:		//level.clients[bs->client].ps.weapon = 1;
;4929:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2021
JUMPV
LABELV $2028
line 4932
;4930:	}
;4931:
;4932:	return 0;
CNSTI4 0
RETI4
LABELV $2021
endproc BotTryAnotherWeapon 16 8
export BotWeaponSelectable
proc BotWeaponSelectable 12 0
line 4936
;4933:}
;4934:
;4935:qboolean BotWeaponSelectable(bot_state_t *bs, int weapon)
;4936:{
line 4937
;4937:	if (bs->cur_ps.ammo[weaponData[weapon].ammoIndex] >= weaponData[weapon].energyPerShot &&
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRGP4 weaponData+8
ADDP4
INDIRI4
LTI4 $2031
ADDRLP4 8
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2031
line 4939
;4938:		(bs->cur_ps.stats[STAT_WEAPONS] & (1 << weapon)))
;4939:	{
line 4940
;4940:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2030
JUMPV
LABELV $2031
line 4943
;4941:	}
;4942:	
;4943:	return qfalse;
CNSTI4 0
RETI4
LABELV $2030
endproc BotWeaponSelectable 12 0
export BotSelectIdealWeapon
proc BotSelectIdealWeapon 64 8
line 4947
;4944:}
;4945:
;4946:int BotSelectIdealWeapon(bot_state_t *bs)
;4947:{
line 4949
;4948:	int i;
;4949:	int bestweight = -1;
ADDRLP4 4
CNSTI4 -1
ASGNI4
line 4950
;4950:	int bestweapon = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 4952
;4951:
;4952:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2036
JUMPV
LABELV $2035
line 4955
;4953:
;4954:	while (i < WP_NUM_WEAPONS)
;4955:	{
line 4956
;4956:		if (bs->cur_ps.ammo[weaponData[i].ammoIndex] >= weaponData[i].energyPerShot &&
ADDRLP4 16
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
CNSTI4 2
ASGNI4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
ADDRGP4 weaponData+8
ADDP4
INDIRI4
LTI4 $2038
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 2624
ADDP4
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
LEF4 $2038
ADDRLP4 24
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2038
line 4959
;4957:			bs->botWeaponWeights[i] > bestweight &&
;4958:			(bs->cur_ps.stats[STAT_WEAPONS] & (1 << i)))
;4959:		{
line 4960
;4960:			if (i == WP_THERMAL)
ADDRLP4 0
INDIRI4
CNSTI4 11
NEI4 $2041
line 4961
;4961:			{ //special case..
line 4962
;4962:				if (bs->currentEnemy && bs->frame_Enemy_Len < 700)
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2042
ADDRLP4 28
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1143930880
GEF4 $2042
line 4963
;4963:				{
line 4964
;4964:					bestweight = bs->botWeaponWeights[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 2624
ADDP4
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 4965
;4965:					bestweapon = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 4966
;4966:				}
line 4967
;4967:			}
ADDRGP4 $2042
JUMPV
LABELV $2041
line 4969
;4968:			else
;4969:			{
line 4970
;4970:				bestweight = bs->botWeaponWeights[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 2624
ADDP4
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 4971
;4971:				bestweapon = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 4972
;4972:			}
LABELV $2042
line 4973
;4973:		}
LABELV $2038
line 4975
;4974:
;4975:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4976
;4976:	}
LABELV $2036
line 4954
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $2035
line 4978
;4977:
;4978:	if ( bs->currentEnemy && bs->frame_Enemy_Len < 300 &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2045
ADDRLP4 12
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1133903872
GEF4 $2045
ADDRLP4 8
INDIRI4
CNSTI4 3
EQI4 $2048
ADDRLP4 8
INDIRI4
CNSTI4 4
EQI4 $2048
ADDRLP4 8
INDIRI4
CNSTI4 6
NEI4 $2045
LABELV $2048
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2045
line 4981
;4979:		(bestweapon == WP_BRYAR_PISTOL || bestweapon == WP_BLASTER || bestweapon == WP_BOWCASTER) &&
;4980:		(bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_SABER)) )
;4981:	{
line 4982
;4982:		bestweapon = WP_SABER;
ADDRLP4 8
CNSTI4 2
ASGNI4
line 4983
;4983:		bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4984
;4984:	}
LABELV $2045
line 4986
;4985:
;4986:	if ( bs->currentEnemy && bs->frame_Enemy_Len > 300 &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTU4 0
ASGNU4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $2049
ADDRLP4 20
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1133903872
LEF4 $2049
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $2049
ADDRLP4 36
CNSTI4 2
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $2049
ADDRLP4 8
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $2049
line 4989
;4987:		bs->currentEnemy->client && bs->currentEnemy->client->ps.weapon != WP_SABER &&
;4988:		(bestweapon == WP_SABER) )
;4989:	{ //if the enemy is far away, and we have our saber selected, see if we have any good distance weapons instead
line 4990
;4990:		if (BotWeaponSelectable(bs, WP_DISRUPTOR))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 40
ADDRGP4 BotWeaponSelectable
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $2051
line 4991
;4991:		{
line 4992
;4992:			bestweapon = WP_DISRUPTOR;
ADDRLP4 8
CNSTI4 5
ASGNI4
line 4993
;4993:			bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4994
;4994:		}
ADDRGP4 $2052
JUMPV
LABELV $2051
line 4995
;4995:		else if (BotWeaponSelectable(bs, WP_ROCKET_LAUNCHER))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 44
ADDRGP4 BotWeaponSelectable
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $2053
line 4996
;4996:		{
line 4997
;4997:			bestweapon = WP_ROCKET_LAUNCHER;
ADDRLP4 8
CNSTI4 10
ASGNI4
line 4998
;4998:			bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4999
;4999:		}
ADDRGP4 $2054
JUMPV
LABELV $2053
line 5000
;5000:		else if (BotWeaponSelectable(bs, WP_BOWCASTER))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 48
ADDRGP4 BotWeaponSelectable
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $2055
line 5001
;5001:		{
line 5002
;5002:			bestweapon = WP_BOWCASTER;
ADDRLP4 8
CNSTI4 6
ASGNI4
line 5003
;5003:			bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 5004
;5004:		}
ADDRGP4 $2056
JUMPV
LABELV $2055
line 5005
;5005:		else if (BotWeaponSelectable(bs, WP_BLASTER))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 52
ADDRGP4 BotWeaponSelectable
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $2057
line 5006
;5006:		{
line 5007
;5007:			bestweapon = WP_BLASTER;
ADDRLP4 8
CNSTI4 4
ASGNI4
line 5008
;5008:			bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 5009
;5009:		}
ADDRGP4 $2058
JUMPV
LABELV $2057
line 5010
;5010:		else if (BotWeaponSelectable(bs, WP_REPEATER))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 56
ADDRGP4 BotWeaponSelectable
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $2059
line 5011
;5011:		{
line 5012
;5012:			bestweapon = WP_REPEATER;
ADDRLP4 8
CNSTI4 7
ASGNI4
line 5013
;5013:			bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 5014
;5014:		}
ADDRGP4 $2060
JUMPV
LABELV $2059
line 5015
;5015:		else if (BotWeaponSelectable(bs, WP_DEMP2))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRLP4 60
ADDRGP4 BotWeaponSelectable
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $2061
line 5016
;5016:		{
line 5017
;5017:			bestweapon = WP_DEMP2;
ADDRLP4 8
CNSTI4 8
ASGNI4
line 5018
;5018:			bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 5019
;5019:		}
LABELV $2061
LABELV $2060
LABELV $2058
LABELV $2056
LABELV $2054
LABELV $2052
line 5020
;5020:	}
LABELV $2049
line 5022
;5021:
;5022:	if (bestweight != -1 && bs->cur_ps.weapon != bestweapon && bs->virtualWeapon != bestweapon)
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $2063
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2063
ADDRLP4 40
INDIRP4
CNSTI4 2288
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2063
line 5023
;5023:	{
line 5024
;5024:		bs->virtualWeapon = bestweapon;
ADDRFP4 0
INDIRP4
CNSTI4 2288
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 5025
;5025:		BotSelectWeapon(bs->client, bestweapon);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 BotSelectWeapon
CALLV
pop
line 5028
;5026:		//bs->cur_ps.weapon = bestweapon;
;5027:		//level.clients[bs->client].ps.weapon = bestweapon;
;5028:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2034
JUMPV
LABELV $2063
line 5031
;5029:	}
;5030:
;5031:	return 0;
CNSTI4 0
RETI4
LABELV $2034
endproc BotSelectIdealWeapon 64 8
export BotSelectChoiceWeapon
proc BotSelectChoiceWeapon 20 8
line 5035
;5032:}
;5033:
;5034:int BotSelectChoiceWeapon(bot_state_t *bs, int weapon, int doselection)
;5035:{ //if !doselection then bot will only check if he has the specified weapon and return 1 (yes) or 0 (no)
line 5037
;5036:	int i;
;5037:	int hasit = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 5039
;5038:
;5039:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2067
JUMPV
LABELV $2066
line 5042
;5040:
;5041:	while (i < WP_NUM_WEAPONS)
;5042:	{
line 5043
;5043:		if (bs->cur_ps.ammo[weaponData[i].ammoIndex] > weaponData[i].energyPerShot &&
ADDRLP4 12
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDRGP4 weaponData+8
ADDP4
INDIRI4
LEI4 $2069
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $2069
ADDRLP4 16
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2069
line 5046
;5044:			i == weapon &&
;5045:			(bs->cur_ps.stats[STAT_WEAPONS] & (1 << i)))
;5046:		{
line 5047
;5047:			hasit = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 5048
;5048:			break;
ADDRGP4 $2068
JUMPV
LABELV $2069
line 5051
;5049:		}
;5050:
;5051:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5052
;5052:	}
LABELV $2067
line 5041
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $2066
LABELV $2068
line 5054
;5053:
;5054:	if (hasit && bs->cur_ps.weapon != weapon && doselection && bs->virtualWeapon != weapon)
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2072
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $2072
ADDRFP4 8
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2072
ADDRLP4 12
INDIRP4
CNSTI4 2288
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $2072
line 5055
;5055:	{
line 5056
;5056:		bs->virtualWeapon = weapon;
ADDRFP4 0
INDIRP4
CNSTI4 2288
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 5057
;5057:		BotSelectWeapon(bs->client, weapon);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BotSelectWeapon
CALLV
pop
line 5060
;5058:		//bs->cur_ps.weapon = weapon;
;5059:		//level.clients[bs->client].ps.weapon = weapon;
;5060:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $2065
JUMPV
LABELV $2072
line 5063
;5061:	}
;5062:
;5063:	if (hasit)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2074
line 5064
;5064:	{
line 5065
;5065:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2065
JUMPV
LABELV $2074
line 5068
;5066:	}
;5067:
;5068:	return 0;
CNSTI4 0
RETI4
LABELV $2065
endproc BotSelectChoiceWeapon 20 8
export BotSelectMelee
proc BotSelectMelee 8 8
line 5072
;5069:}
;5070:
;5071:int BotSelectMelee(bot_state_t *bs)
;5072:{
line 5073
;5073:	if (bs->cur_ps.weapon != 1 && bs->virtualWeapon != 1)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2077
ADDRLP4 0
INDIRP4
CNSTI4 2288
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2077
line 5074
;5074:	{
line 5075
;5075:		bs->virtualWeapon = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2288
ADDP4
CNSTI4 1
ASGNI4
line 5076
;5076:		BotSelectWeapon(bs->client, 1);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotSelectWeapon
CALLV
pop
line 5079
;5077:		//bs->cur_ps.weapon = 1;
;5078:		//level.clients[bs->client].ps.weapon = 1;
;5079:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2076
JUMPV
LABELV $2077
line 5082
;5080:	}
;5081:
;5082:	return 0;
CNSTI4 0
RETI4
LABELV $2076
endproc BotSelectMelee 8 8
export GetLoveLevel
proc GetLoveLevel 20 8
line 5086
;5083:}
;5084:
;5085:int GetLoveLevel(bot_state_t *bs, bot_state_t *love)
;5086:{
line 5087
;5087:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5088
;5088:	const char *lname = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 5090
;5089:
;5090:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $2080
line 5091
;5091:	{ //There is no love in 1-on-1
line 5092
;5092:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2079
JUMPV
LABELV $2080
line 5095
;5093:	}
;5094:
;5095:	if (!bs || !love || !g_entities[love->client].client)
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $2087
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $2087
CNSTI4 852
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $2083
LABELV $2087
line 5096
;5096:	{
line 5097
;5097:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2079
JUMPV
LABELV $2083
line 5100
;5098:	}
;5099:
;5100:	if (!bs->lovednum)
ADDRFP4 0
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2088
line 5101
;5101:	{
line 5102
;5102:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2079
JUMPV
LABELV $2088
line 5105
;5103:	}
;5104:
;5105:	trap_Cvar_Update(&bot_attachments);
ADDRGP4 bot_attachments
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 5107
;5106:
;5107:	if (!bot_attachments.integer)
ADDRGP4 bot_attachments+12
INDIRI4
CNSTI4 0
NEI4 $2090
line 5108
;5108:	{
line 5109
;5109:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2079
JUMPV
LABELV $2090
line 5112
;5110:	}
;5111:
;5112:	lname = g_entities[love->client].client->pers.netname;
ADDRLP4 4
CNSTI4 852
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ASGNP4
line 5114
;5113:
;5114:	if (!lname)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2097
line 5115
;5115:	{
line 5116
;5116:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2079
JUMPV
LABELV $2096
line 5120
;5117:	}
;5118:
;5119:	while (i < bs->lovednum)
;5120:	{
line 5121
;5121:		if (strcmp(bs->loved[i].name, lname) == 0)
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $2099
line 5122
;5122:		{
line 5123
;5123:			return bs->loved[i].level;
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
INDIRI4
RETI4
ADDRGP4 $2079
JUMPV
LABELV $2099
line 5126
;5124:		}
;5125:
;5126:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5127
;5127:	}
LABELV $2097
line 5119
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
LTI4 $2096
line 5129
;5128:
;5129:	return 0;
CNSTI4 0
RETI4
LABELV $2079
endproc GetLoveLevel 20 8
export BotLovedOneDied
proc BotLovedOneDied 40 12
line 5133
;5130:}
;5131:
;5132:void BotLovedOneDied(bot_state_t *bs, bot_state_t *loved, int lovelevel)
;5133:{
line 5134
;5134:	if (!loved->lastHurt || !loved->lastHurt->client ||
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $2105
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $2105
ADDRLP4 4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2102
LABELV $2105
line 5136
;5135:		loved->lastHurt->s.number == loved->client)
;5136:	{
line 5137
;5137:		return;
ADDRGP4 $2101
JUMPV
LABELV $2102
line 5140
;5138:	}
;5139:
;5140:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $2106
line 5141
;5141:	{ //There is no love in 1-on-1
line 5142
;5142:		return;
ADDRGP4 $2101
JUMPV
LABELV $2106
line 5145
;5143:	}
;5144:
;5145:	if (!IsTeamplay())
ADDRLP4 12
ADDRGP4 IsTeamplay
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2109
line 5146
;5146:	{
line 5147
;5147:		if (lovelevel < 2)
ADDRFP4 8
INDIRI4
CNSTI4 2
GEI4 $2110
line 5148
;5148:		{
line 5149
;5149:			return;
ADDRGP4 $2101
JUMPV
line 5151
;5150:		}
;5151:	}
LABELV $2109
line 5152
;5152:	else if (OnSameTeam(&g_entities[bs->client], loved->lastHurt))
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $2113
line 5153
;5153:	{ //don't hate teammates no matter what
line 5154
;5154:		return;
ADDRGP4 $2101
JUMPV
LABELV $2113
LABELV $2110
line 5157
;5155:	}
;5156:
;5157:	if (loved->client == loved->lastHurt->s.number)
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
INDIRI4
NEI4 $2115
line 5158
;5158:	{
line 5159
;5159:		return;
ADDRGP4 $2101
JUMPV
LABELV $2115
line 5162
;5160:	}
;5161:
;5162:	if (bs->client == loved->lastHurt->s.number)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
INDIRI4
NEI4 $2117
line 5163
;5163:	{ //oops!
line 5164
;5164:		return;
ADDRGP4 $2101
JUMPV
LABELV $2117
line 5167
;5165:	}
;5166:	
;5167:	trap_Cvar_Update(&bot_attachments);
ADDRGP4 bot_attachments
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 5169
;5168:
;5169:	if (!bot_attachments.integer)
ADDRGP4 bot_attachments+12
INDIRI4
CNSTI4 0
NEI4 $2119
line 5170
;5170:	{
line 5171
;5171:		return;
ADDRGP4 $2101
JUMPV
LABELV $2119
line 5174
;5172:	}
;5173:
;5174:	if (!PassLovedOneCheck(bs, loved->lastHurt))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $2122
line 5175
;5175:	{ //a loved one killed a loved one.. you cannot hate them
line 5176
;5176:		bs->chatObject = loved->lastHurt;
ADDRFP4 0
INDIRP4
CNSTI4 2244
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
line 5177
;5177:		bs->chatAltObject = &g_entities[loved->client];
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
CNSTI4 852
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 5178
;5178:		BotDoChat(bs, "LovedOneKilledLovedOne", 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2124
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 5179
;5179:		return;
ADDRGP4 $2101
JUMPV
LABELV $2122
line 5182
;5180:	}
;5181:
;5182:	if (bs->revengeEnemy == loved->lastHurt)
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
CVPU4 4
NEU4 $2125
line 5183
;5183:	{
line 5184
;5184:		if (bs->revengeHateLevel < bs->loved_death_thresh)
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1864
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 2616
ADDP4
INDIRI4
GEI4 $2126
line 5185
;5185:		{
line 5186
;5186:			bs->revengeHateLevel++;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 1864
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5188
;5187:
;5188:			if (bs->revengeHateLevel == bs->loved_death_thresh)
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 1864
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 2616
ADDP4
INDIRI4
NEI4 $2126
line 5189
;5189:			{
line 5192
;5190:				//broke into the highest anger level
;5191:				//CHAT: Hatred section
;5192:				bs->chatObject = loved->lastHurt;
ADDRFP4 0
INDIRP4
CNSTI4 2244
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
line 5193
;5193:				bs->chatAltObject = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 5194
;5194:				BotDoChat(bs, "Hatred", 1);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2131
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 5195
;5195:			}
line 5196
;5196:		}
line 5197
;5197:	}
ADDRGP4 $2126
JUMPV
LABELV $2125
line 5198
;5198:	else if (bs->revengeHateLevel < bs->loved_death_thresh-1)
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1864
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 2616
ADDP4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $2132
line 5199
;5199:	{ //only switch hatred if we don't hate the existing revenge-enemy too much
line 5201
;5200:		//CHAT: BelovedKilled section
;5201:		bs->chatObject = &g_entities[loved->client];
ADDRFP4 0
INDIRP4
CNSTI4 2244
ADDP4
CNSTI4 852
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 5202
;5202:		bs->chatAltObject = loved->lastHurt;
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
line 5203
;5203:		BotDoChat(bs, "BelovedKilled", 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2134
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 5204
;5204:		bs->revengeHateLevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1864
ADDP4
CNSTI4 0
ASGNI4
line 5205
;5205:		bs->revengeEnemy = loved->lastHurt;
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
line 5206
;5206:	}
LABELV $2132
LABELV $2126
line 5207
;5207:}
LABELV $2101
endproc BotLovedOneDied 40 12
export BotDeathNotify
proc BotDeathNotify 20 12
line 5210
;5208:
;5209:void BotDeathNotify(bot_state_t *bs)
;5210:{ //in case someone has an emotional attachment to us, we'll notify them
line 5211
;5211:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5212
;5212:	int ltest = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2137
JUMPV
LABELV $2136
line 5215
;5213:
;5214:	while (i < MAX_CLIENTS)
;5215:	{
line 5216
;5216:		if (botstates[i] && botstates[i]->lovednum)
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2139
ADDRLP4 8
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2139
line 5217
;5217:		{
line 5218
;5218:			ltest = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2142
JUMPV
LABELV $2141
line 5220
;5219:			while (ltest < botstates[i]->lovednum)
;5220:			{
line 5221
;5221:				if (strcmp(level.clients[bs->client].pers.netname, botstates[i]->loved[ltest].name) == 0)
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 68
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2144
line 5222
;5222:				{
line 5223
;5223:					BotLovedOneDied(botstates[i], bs, botstates[i]->loved[ltest].level);
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 68
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 16
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotLovedOneDied
CALLV
pop
line 5224
;5224:					break;
ADDRGP4 $2143
JUMPV
LABELV $2144
line 5227
;5225:				}
;5226:
;5227:				ltest++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5228
;5228:			}
LABELV $2142
line 5219
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
LTI4 $2141
LABELV $2143
line 5229
;5229:		}
LABELV $2139
line 5231
;5230:
;5231:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5232
;5232:	}
LABELV $2137
line 5214
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $2136
line 5233
;5233:}
LABELV $2135
endproc BotDeathNotify 20 12
export StrafeTracing
proc StrafeTracing 1156 28
line 5236
;5234:
;5235:void StrafeTracing(bot_state_t *bs)
;5236:{
line 5241
;5237:	vec3_t mins, maxs;
;5238:	vec3_t right, rorg, drorg;
;5239:	trace_t tr;
;5240:
;5241:	mins[0] = -15;
ADDRLP4 12
CNSTF4 3245342720
ASGNF4
line 5242
;5242:	mins[1] = -15;
ADDRLP4 12+4
CNSTF4 3245342720
ASGNF4
line 5244
;5243:	//mins[2] = -24;
;5244:	mins[2] = -22;
ADDRLP4 12+8
CNSTF4 3249537024
ASGNF4
line 5245
;5245:	maxs[0] = 15;
ADDRLP4 24
CNSTF4 1097859072
ASGNF4
line 5246
;5246:	maxs[1] = 15;
ADDRLP4 24+4
CNSTF4 1097859072
ASGNF4
line 5247
;5247:	maxs[2] = 32;
ADDRLP4 24+8
CNSTF4 1107296256
ASGNF4
line 5249
;5248:
;5249:	AngleVectors(bs->viewangles, NULL, right, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
ADDRLP4 1140
CNSTP4 0
ASGNP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 5251
;5250:
;5251:	if (bs->meleeStrafeDir)
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2151
line 5252
;5252:	{
line 5253
;5253:		rorg[0] = bs->origin[0] - right[0]*32;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1107296256
ADDRLP4 36
INDIRF4
MULF4
SUBF4
ASGNF4
line 5254
;5254:		rorg[1] = bs->origin[1] - right[1]*32;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1107296256
ADDRLP4 36+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 5255
;5255:		rorg[2] = bs->origin[2] - right[2]*32;
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1107296256
ADDRLP4 36+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 5256
;5256:	}
ADDRGP4 $2152
JUMPV
LABELV $2151
line 5258
;5257:	else
;5258:	{
line 5259
;5259:		rorg[0] = bs->origin[0] + right[0]*32;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1107296256
ADDRLP4 36
INDIRF4
MULF4
ADDF4
ASGNF4
line 5260
;5260:		rorg[1] = bs->origin[1] + right[1]*32;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1107296256
ADDRLP4 36+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 5261
;5261:		rorg[2] = bs->origin[2] + right[2]*32;
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1107296256
ADDRLP4 36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 5262
;5262:	}
LABELV $2152
line 5264
;5263:
;5264:	trap_Trace(&tr, bs->origin, mins, maxs, rorg, bs->client, MASK_SOLID);
ADDRLP4 48
ARGP4
ADDRLP4 1144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1144
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1144
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 5266
;5265:
;5266:	if (tr.fraction != 1)
ADDRLP4 48+8
INDIRF4
CNSTF4 1065353216
EQF4 $2161
line 5267
;5267:	{
line 5268
;5268:		bs->meleeStrafeDisable = level.time + Q_irand(500, 1500);
CNSTI4 500
ARGI4
CNSTI4 1500
ARGI4
ADDRLP4 1148
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2260
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1148
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 5269
;5269:	}
LABELV $2161
line 5271
;5270:
;5271:	VectorCopy(rorg, drorg);
ADDRLP4 1128
ADDRLP4 0
INDIRB
ASGNB 12
line 5273
;5272:
;5273:	drorg[2] -= 32;
ADDRLP4 1128+8
ADDRLP4 1128+8
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 5275
;5274:
;5275:	trap_Trace(&tr, rorg, NULL, NULL, drorg, bs->client, MASK_SOLID);
ADDRLP4 48
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1148
CNSTP4 0
ASGNP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRLP4 1128
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 5277
;5276:
;5277:	if (tr.fraction == 1)
ADDRLP4 48+8
INDIRF4
CNSTF4 1065353216
NEF4 $2166
line 5278
;5278:	{ //this may be a dangerous ledge, so don't strafe over it just in case
line 5279
;5279:		bs->meleeStrafeDisable = level.time + Q_irand(500, 1500);
CNSTI4 500
ARGI4
CNSTI4 1500
ARGI4
ADDRLP4 1152
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2260
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 1152
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 5280
;5280:	}
LABELV $2166
line 5281
;5281:}
LABELV $2146
endproc StrafeTracing 1156 28
export PrimFiring
proc PrimFiring 8 0
line 5284
;5282:
;5283:int PrimFiring(bot_state_t *bs)
;5284:{
line 5285
;5285:	if (bs->cur_ps.weaponstate != WEAPON_CHARGING &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
EQI4 $2171
ADDRLP4 0
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2171
line 5287
;5286:		bs->doAttack)
;5287:	{
line 5288
;5288:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2170
JUMPV
LABELV $2171
line 5291
;5289:	}
;5290:
;5291:	if (bs->cur_ps.weaponstate == WEAPON_CHARGING &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
NEI4 $2173
ADDRLP4 4
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2173
line 5293
;5292:		!bs->doAttack)
;5293:	{
line 5294
;5294:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2170
JUMPV
LABELV $2173
line 5297
;5295:	}
;5296:
;5297:	return 0;
CNSTI4 0
RETI4
LABELV $2170
endproc PrimFiring 8 0
export KeepPrimFromFiring
proc KeepPrimFromFiring 8 0
line 5301
;5298:}
;5299:
;5300:int KeepPrimFromFiring(bot_state_t *bs)
;5301:{
line 5302
;5302:	if (bs->cur_ps.weaponstate != WEAPON_CHARGING &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
EQI4 $2176
ADDRLP4 0
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2176
line 5304
;5303:		bs->doAttack)
;5304:	{
line 5305
;5305:		bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 5306
;5306:	}
LABELV $2176
line 5308
;5307:
;5308:	if (bs->cur_ps.weaponstate == WEAPON_CHARGING &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
NEI4 $2178
ADDRLP4 4
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2178
line 5310
;5309:		!bs->doAttack)
;5310:	{
line 5311
;5311:		bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 5312
;5312:	}
LABELV $2178
line 5314
;5313:
;5314:	return 0;
CNSTI4 0
RETI4
LABELV $2175
endproc KeepPrimFromFiring 8 0
export AltFiring
proc AltFiring 8 0
line 5318
;5315:}
;5316:
;5317:int AltFiring(bot_state_t *bs)
;5318:{
line 5319
;5319:	if (bs->cur_ps.weaponstate != WEAPON_CHARGING_ALT &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
EQI4 $2181
ADDRLP4 0
INDIRP4
CNSTI4 2280
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2181
line 5321
;5320:		bs->doAltAttack)
;5321:	{
line 5322
;5322:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2180
JUMPV
LABELV $2181
line 5325
;5323:	}
;5324:
;5325:	if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2183
ADDRLP4 4
INDIRP4
CNSTI4 2280
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2183
line 5327
;5326:		!bs->doAltAttack)
;5327:	{
line 5328
;5328:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2180
JUMPV
LABELV $2183
line 5331
;5329:	}
;5330:
;5331:	return 0;
CNSTI4 0
RETI4
LABELV $2180
endproc AltFiring 8 0
export KeepAltFromFiring
proc KeepAltFromFiring 8 0
line 5335
;5332:}
;5333:
;5334:int KeepAltFromFiring(bot_state_t *bs)
;5335:{
line 5336
;5336:	if (bs->cur_ps.weaponstate != WEAPON_CHARGING_ALT &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
EQI4 $2186
ADDRLP4 0
INDIRP4
CNSTI4 2280
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2186
line 5338
;5337:		bs->doAltAttack)
;5338:	{
line 5339
;5339:		bs->doAltAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 0
ASGNI4
line 5340
;5340:	}
LABELV $2186
line 5342
;5341:
;5342:	if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2188
ADDRLP4 4
INDIRP4
CNSTI4 2280
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2188
line 5344
;5343:		!bs->doAltAttack)
;5344:	{
line 5345
;5345:		bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 5346
;5346:	}
LABELV $2188
line 5348
;5347:
;5348:	return 0;
CNSTI4 0
RETI4
LABELV $2185
endproc KeepAltFromFiring 8 0
export CheckForFriendInLOF
proc CheckForFriendInLOF 1172 28
line 5352
;5349:}
;5350:
;5351:gentity_t *CheckForFriendInLOF(bot_state_t *bs)
;5352:{
line 5359
;5353:	vec3_t fwd;
;5354:	vec3_t trfrom, trto;
;5355:	vec3_t mins, maxs;
;5356:	gentity_t *trent;
;5357:	trace_t tr;
;5358:
;5359:	mins[0] = -3;
ADDRLP4 36
CNSTF4 3225419776
ASGNF4
line 5360
;5360:	mins[1] = -3;
ADDRLP4 36+4
CNSTF4 3225419776
ASGNF4
line 5361
;5361:	mins[2] = -3;
ADDRLP4 36+8
CNSTF4 3225419776
ASGNF4
line 5363
;5362:
;5363:	maxs[0] = 3;
ADDRLP4 48
CNSTF4 1077936128
ASGNF4
line 5364
;5364:	maxs[1] = 3;
ADDRLP4 48+4
CNSTF4 1077936128
ASGNF4
line 5365
;5365:	maxs[2] = 3;
ADDRLP4 48+8
CNSTF4 1077936128
ASGNF4
line 5367
;5366:
;5367:	AngleVectors(bs->viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 1144
CNSTP4 0
ASGNP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 5369
;5368:
;5369:	VectorCopy(bs->eye, trfrom);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1744
ADDP4
INDIRB
ASGNB 12
line 5371
;5370:
;5371:	trto[0] = trfrom[0] + fwd[0]*2048;
ADDRLP4 24
ADDRLP4 0
INDIRF4
CNSTF4 1157627904
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 5372
;5372:	trto[1] = trfrom[1] + fwd[1]*2048;
ADDRLP4 24+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1157627904
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 5373
;5373:	trto[2] = trfrom[2] + fwd[2]*2048;
ADDRLP4 24+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1157627904
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 5375
;5374:
;5375:	trap_Trace(&tr, trfrom, mins, maxs, trto, bs->client, MASK_PLAYERSOLID);
ADDRLP4 60
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 5377
;5376:
;5377:	if (tr.fraction != 1 && tr.entityNum <= MAX_CLIENTS)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
EQF4 $2201
ADDRLP4 60+52
INDIRI4
CNSTI4 32
GTI4 $2201
line 5378
;5378:	{
line 5379
;5379:		trent = &g_entities[tr.entityNum];
ADDRLP4 1140
CNSTI4 852
ADDRLP4 60+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 5381
;5380:
;5381:		if (trent && trent->client)
ADDRLP4 1148
ADDRLP4 1140
INDIRP4
ASGNP4
ADDRLP4 1152
CNSTU4 0
ASGNU4
ADDRLP4 1148
INDIRP4
CVPU4 4
ADDRLP4 1152
INDIRU4
EQU4 $2206
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1152
INDIRU4
EQU4 $2206
line 5382
;5382:		{
line 5383
;5383:			if (IsTeamplay() && OnSameTeam(&g_entities[bs->client], trent))
ADDRLP4 1156
ADDRGP4 IsTeamplay
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
EQI4 $2208
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRLP4 1160
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
EQI4 $2208
line 5384
;5384:			{
line 5385
;5385:				return trent;
ADDRLP4 1140
INDIRP4
RETP4
ADDRGP4 $2190
JUMPV
LABELV $2208
line 5388
;5386:			}
;5387:
;5388:			if (botstates[trent->s.number] && GetLoveLevel(bs, botstates[trent->s.number]) > 1)
ADDRLP4 1164
ADDRLP4 1140
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2210
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 1168
ADDRGP4 GetLoveLevel
CALLI4
ASGNI4
ADDRLP4 1168
INDIRI4
CNSTI4 1
LEI4 $2210
line 5389
;5389:			{
line 5390
;5390:				return trent;
ADDRLP4 1140
INDIRP4
RETP4
ADDRGP4 $2190
JUMPV
LABELV $2210
line 5392
;5391:			}
;5392:		}
LABELV $2206
line 5393
;5393:	}
LABELV $2201
line 5395
;5394:
;5395:	return NULL;
CNSTP4 0
RETP4
LABELV $2190
endproc CheckForFriendInLOF 1172 28
export BotScanForLeader
proc BotScanForLeader 36 8
line 5399
;5396:}
;5397:
;5398:void BotScanForLeader(bot_state_t *bs)
;5399:{ //bots will only automatically obtain a leader if it's another bot using this method.
line 5400
;5400:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5403
;5401:	gentity_t *ent;
;5402:
;5403:	if (bs->isSquadLeader)
ADDRFP4 0
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2216
line 5404
;5404:	{
line 5405
;5405:		return;
ADDRGP4 $2212
JUMPV
LABELV $2215
line 5409
;5406:	}
;5407:
;5408:	while (i < MAX_CLIENTS)
;5409:	{
line 5410
;5410:		ent = &g_entities[i];
ADDRLP4 4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 5412
;5411:
;5412:		if (ent && ent->client && botstates[i] && botstates[i]->isSquadLeader && bs->client != i)
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $2218
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $2218
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $2218
ADDRLP4 20
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2218
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $2218
line 5413
;5413:		{
line 5414
;5414:			if (OnSameTeam(&g_entities[bs->client], ent))
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $2220
line 5415
;5415:			{
line 5416
;5416:				bs->squadLeader = ent;
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 5417
;5417:				break;
ADDRGP4 $2217
JUMPV
LABELV $2220
line 5419
;5418:			}
;5419:			if (GetLoveLevel(bs, botstates[i]) > 1 && !IsTeamplay())
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 GetLoveLevel
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
LEI4 $2222
ADDRLP4 32
ADDRGP4 IsTeamplay
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $2222
line 5420
;5420:			{ //ignore love status regarding squad leaders if we're in teamplay
line 5421
;5421:				bs->squadLeader = ent;
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 5422
;5422:				break;
ADDRGP4 $2217
JUMPV
LABELV $2222
line 5424
;5423:			}
;5424:		}
LABELV $2218
line 5426
;5425:
;5426:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5427
;5427:	}
LABELV $2216
line 5408
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $2215
LABELV $2217
line 5428
;5428:}
LABELV $2212
endproc BotScanForLeader 36 8
export BotReplyGreetings
proc BotReplyGreetings 20 12
line 5431
;5429:
;5430:void BotReplyGreetings(bot_state_t *bs)
;5431:{
line 5432
;5432:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5433
;5433:	int numhello = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2226
JUMPV
LABELV $2225
line 5436
;5434:
;5435:	while (i < MAX_CLIENTS)
;5436:	{
line 5437
;5437:		if (botstates[i] &&
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2228
ADDRLP4 12
INDIRP4
CNSTI4 2092
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2228
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $2228
line 5440
;5438:			botstates[i]->canChat &&
;5439:			i != bs->client)
;5440:		{
line 5441
;5441:			botstates[i]->chatObject = &g_entities[bs->client];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2244
ADDP4
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 5442
;5442:			botstates[i]->chatAltObject = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 5443
;5443:			if (BotDoChat(botstates[i], "ResponseGreetings", 0))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 $2232
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 BotDoChat
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $2230
line 5444
;5444:			{
line 5445
;5445:				numhello++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5446
;5446:			}
LABELV $2230
line 5447
;5447:		}
LABELV $2228
line 5449
;5448:
;5449:		if (numhello > 3)
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $2233
line 5450
;5450:		{ //don't let more than 4 bots say hello at once
line 5451
;5451:			return;
ADDRGP4 $2224
JUMPV
LABELV $2233
line 5454
;5452:		}
;5453:
;5454:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5455
;5455:	}
LABELV $2226
line 5435
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $2225
line 5456
;5456:}
LABELV $2224
endproc BotReplyGreetings 20 12
export CTFFlagMovement
proc CTFFlagMovement 1184 28
line 5459
;5457:
;5458:void CTFFlagMovement(bot_state_t *bs)
;5459:{
line 5460
;5460:	int diddrop = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 5461
;5461:	gentity_t *desiredDrop = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 5465
;5462:	vec3_t a, mins, maxs;
;5463:	trace_t tr;
;5464:
;5465:	mins[0] = -15;
ADDRLP4 0
CNSTF4 3245342720
ASGNF4
line 5466
;5466:	mins[1] = -15;
ADDRLP4 0+4
CNSTF4 3245342720
ASGNF4
line 5467
;5467:	mins[2] = -7;
ADDRLP4 0+8
CNSTF4 3235905536
ASGNF4
line 5468
;5468:	maxs[0] = 15;
ADDRLP4 12
CNSTF4 1097859072
ASGNF4
line 5469
;5469:	maxs[1] = 15;
ADDRLP4 12+4
CNSTF4 1097859072
ASGNF4
line 5470
;5470:	maxs[2] = 7;
ADDRLP4 12+8
CNSTF4 1088421888
ASGNF4
line 5472
;5471:
;5472:	if (bs->wantFlag && (bs->wantFlag->flags & FL_DROPPED_ITEM))
ADDRLP4 1124
ADDRFP4 0
INDIRP4
CNSTI4 1836
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2240
ADDRLP4 1124
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $2240
line 5473
;5473:	{
line 5474
;5474:		if (bs->staticFlagSpot[0] == bs->wantFlag->s.pos.trBase[0] &&
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
ADDRLP4 1128
INDIRP4
CNSTI4 1836
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 1852
ADDP4
INDIRF4
ADDRLP4 1132
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
NEF4 $2242
ADDRLP4 1128
INDIRP4
CNSTI4 1856
ADDP4
INDIRF4
ADDRLP4 1132
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
NEF4 $2242
ADDRLP4 1128
INDIRP4
CNSTI4 1860
ADDP4
INDIRF4
ADDRLP4 1132
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
NEF4 $2242
line 5477
;5475:			bs->staticFlagSpot[1] == bs->wantFlag->s.pos.trBase[1] &&
;5476:			bs->staticFlagSpot[2] == bs->wantFlag->s.pos.trBase[2])
;5477:		{
line 5478
;5478:			VectorSubtract(bs->origin, bs->wantFlag->s.pos.trBase, a);
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
ADDRLP4 1136
INDIRP4
CNSTI4 1836
ADDP4
ASGNP4
ADDRLP4 32
ADDRLP4 1136
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 1140
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32+4
ADDRLP4 1136
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 1140
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32+8
ADDRLP4 1144
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 1144
INDIRP4
CNSTI4 1836
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5480
;5479:
;5480:			if (VectorLength(a) <= BOT_FLAG_GET_DISTANCE)
ADDRLP4 32
ARGP4
ADDRLP4 1148
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1148
INDIRF4
CNSTF4 1132462080
GTF4 $2246
line 5481
;5481:			{
line 5482
;5482:				VectorCopy(bs->wantFlag->s.pos.trBase, bs->goalPosition);
ADDRLP4 1152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1152
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 1152
INDIRP4
CNSTI4 1836
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 5483
;5483:				return;
ADDRGP4 $2235
JUMPV
LABELV $2246
line 5486
;5484:			}
;5485:			else
;5486:			{
line 5487
;5487:				bs->wantFlag = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1836
ADDP4
CNSTP4 0
ASGNP4
line 5488
;5488:			}
line 5489
;5489:		}
ADDRGP4 $2241
JUMPV
LABELV $2242
line 5491
;5490:		else
;5491:		{
line 5492
;5492:			bs->wantFlag = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1836
ADDP4
CNSTP4 0
ASGNP4
line 5493
;5493:		}
line 5494
;5494:	}
ADDRGP4 $2241
JUMPV
LABELV $2240
line 5495
;5495:	else if (bs->wantFlag)
ADDRFP4 0
INDIRP4
CNSTI4 1836
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2248
line 5496
;5496:	{
line 5497
;5497:		bs->wantFlag = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1836
ADDP4
CNSTP4 0
ASGNP4
line 5498
;5498:	}
LABELV $2248
LABELV $2241
line 5500
;5499:
;5500:	if (flagRed && flagBlue)
ADDRLP4 1128
CNSTU4 0
ASGNU4
ADDRGP4 flagRed
INDIRP4
CVPU4 4
ADDRLP4 1128
INDIRU4
EQU4 $2250
ADDRGP4 flagBlue
INDIRP4
CVPU4 4
ADDRLP4 1128
INDIRU4
EQU4 $2250
line 5501
;5501:	{
line 5502
;5502:		if (bs->wpDestination == flagRed ||
ADDRLP4 1132
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 1132
INDIRU4
ADDRGP4 flagRed
INDIRP4
CVPU4 4
EQU4 $2254
ADDRLP4 1132
INDIRU4
ADDRGP4 flagBlue
INDIRP4
CVPU4 4
NEU4 $2252
LABELV $2254
line 5504
;5503:			bs->wpDestination == flagBlue)
;5504:		{
line 5505
;5505:			if (bs->wpDestination == flagRed && droppedRedFlag && (droppedRedFlag->flags & FL_DROPPED_ITEM) && droppedRedFlag->classname && strcmp(droppedRedFlag->classname, "freed") != 0)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 flagRed
INDIRP4
CVPU4 4
NEU4 $2255
ADDRLP4 1136
ADDRGP4 droppedRedFlag
INDIRP4
ASGNP4
ADDRLP4 1140
CNSTU4 0
ASGNU4
ADDRLP4 1136
INDIRP4
CVPU4 4
ADDRLP4 1140
INDIRU4
EQU4 $2255
ADDRLP4 1136
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $2255
ADDRLP4 1144
ADDRLP4 1136
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1144
INDIRP4
CVPU4 4
ADDRLP4 1140
INDIRU4
EQU4 $2255
ADDRLP4 1144
INDIRP4
ARGP4
ADDRGP4 $2257
ARGP4
ADDRLP4 1148
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
EQI4 $2255
line 5506
;5506:			{
line 5507
;5507:				desiredDrop = droppedRedFlag;
ADDRLP4 24
ADDRGP4 droppedRedFlag
INDIRP4
ASGNP4
line 5508
;5508:				diddrop = 1;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 5509
;5509:			}
LABELV $2255
line 5510
;5510:			if (bs->wpDestination == flagBlue && droppedBlueFlag && (droppedBlueFlag->flags & FL_DROPPED_ITEM) && droppedBlueFlag->classname && strcmp(droppedBlueFlag->classname, "freed") != 0)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 flagBlue
INDIRP4
CVPU4 4
NEU4 $2258
ADDRLP4 1152
ADDRGP4 droppedBlueFlag
INDIRP4
ASGNP4
ADDRLP4 1156
CNSTU4 0
ASGNU4
ADDRLP4 1152
INDIRP4
CVPU4 4
ADDRLP4 1156
INDIRU4
EQU4 $2258
ADDRLP4 1152
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $2258
ADDRLP4 1160
ADDRLP4 1152
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1160
INDIRP4
CVPU4 4
ADDRLP4 1156
INDIRU4
EQU4 $2258
ADDRLP4 1160
INDIRP4
ARGP4
ADDRGP4 $2257
ARGP4
ADDRLP4 1164
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
EQI4 $2258
line 5511
;5511:			{
line 5512
;5512:				desiredDrop = droppedBlueFlag;
ADDRLP4 24
ADDRGP4 droppedBlueFlag
INDIRP4
ASGNP4
line 5513
;5513:				diddrop = 1;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 5514
;5514:			}
LABELV $2258
line 5516
;5515:
;5516:			if (diddrop && desiredDrop)
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2260
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2260
line 5517
;5517:			{
line 5518
;5518:				VectorSubtract(bs->origin, desiredDrop->s.pos.trBase, a);
ADDRLP4 1168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1172
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 1168
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 1172
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32+4
ADDRLP4 1168
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 1172
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5520
;5519:
;5520:				if (VectorLength(a) <= BOT_FLAG_GET_DISTANCE)
ADDRLP4 32
ARGP4
ADDRLP4 1176
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1176
INDIRF4
CNSTF4 1132462080
GTF4 $2264
line 5521
;5521:				{
line 5522
;5522:					trap_Trace(&tr, bs->origin, mins, maxs, desiredDrop->s.pos.trBase, bs->client, MASK_SOLID);
ADDRLP4 44
ARGP4
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 1180
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 5524
;5523:
;5524:					if (tr.fraction == 1 || tr.entityNum == desiredDrop->s.number)
ADDRLP4 44+8
INDIRF4
CNSTF4 1065353216
EQF4 $2270
ADDRLP4 44+52
INDIRI4
ADDRLP4 24
INDIRP4
INDIRI4
NEI4 $2266
LABELV $2270
line 5525
;5525:					{
line 5526
;5526:						VectorCopy(desiredDrop->s.pos.trBase, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 5527
;5527:						VectorCopy(desiredDrop->s.pos.trBase, bs->staticFlagSpot);
ADDRFP4 0
INDIRP4
CNSTI4 1852
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 5528
;5528:						return;
LABELV $2266
line 5530
;5529:					}
;5530:				}
LABELV $2264
line 5531
;5531:			}
LABELV $2260
line 5532
;5532:		}
LABELV $2252
line 5533
;5533:	}
LABELV $2250
line 5534
;5534:}
LABELV $2235
endproc CTFFlagMovement 1184 28
export BotCheckDetPacks
proc BotCheckDetPacks 84 12
line 5537
;5535:
;5536:void BotCheckDetPacks(bot_state_t *bs)
;5537:{
line 5538
;5538:	gentity_t *dp = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 5539
;5539:	gentity_t *myDet = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRGP4 $2273
JUMPV
LABELV $2272
line 5545
;5540:	vec3_t a;
;5541:	float enLen;
;5542:	float myLen;
;5543:
;5544:	while ( (dp = G_Find( dp, FOFS(classname), "detpack") ) != NULL )
;5545:	{
line 5546
;5546:		if (dp && dp->parent && dp->parent->s.number == bs->client)
ADDRLP4 32
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $2276
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $2276
ADDRLP4 36
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2276
line 5547
;5547:		{
line 5548
;5548:			myDet = dp;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 5549
;5549:			break;
ADDRGP4 $2274
JUMPV
LABELV $2276
line 5551
;5550:		}
;5551:	}
LABELV $2273
line 5544
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $2275
ARGP4
ADDRLP4 28
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2272
LABELV $2274
line 5553
;5552:
;5553:	if (!myDet)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2278
line 5554
;5554:	{
line 5555
;5555:		return;
ADDRGP4 $2271
JUMPV
LABELV $2278
line 5558
;5556:	}
;5557:
;5558:	if (!bs->currentEnemy || !bs->currentEnemy->client || !bs->frame_Enemy_Vis)
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTU4 0
ASGNU4
ADDRLP4 36
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $2283
ADDRLP4 36
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $2283
ADDRLP4 32
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2280
LABELV $2283
line 5559
;5559:	{ //require the enemy to be visilbe just to be fair..
line 5562
;5560:
;5561:		//unless..
;5562:		if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
CNSTU4 0
ASGNU4
ADDRLP4 48
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
EQU4 $2271
ADDRLP4 48
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
EQU4 $2271
ADDRGP4 level+32
INDIRI4
ADDRLP4 44
INDIRP4
CNSTI4 2300
ADDP4
INDIRI4
SUBI4
CNSTI4 5000
GEI4 $2271
line 5564
;5563:			(level.time - bs->plantContinue) < 5000)
;5564:		{ //it's a fresh plant (within 5 seconds) so we should be able to guess
line 5565
;5565:			goto stillmadeit;
line 5567
;5566:		}
;5567:		return;
LABELV $2280
LABELV $2287
line 5572
;5568:	}
;5569:
;5570:stillmadeit:
;5571:
;5572:	VectorSubtract(bs->currentEnemy->client->ps.origin, myDet->s.pos.trBase, a);
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
ASGNP4
ADDRLP4 48
CNSTI4 408
ASGNI4
ADDRLP4 56
CNSTI4 24
ASGNI4
ADDRLP4 8
ADDRLP4 44
INDIRP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 44
INDIRP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5573
;5573:	enLen = VectorLength(a);
ADDRLP4 8
ARGP4
ADDRLP4 60
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 60
INDIRF4
ASGNF4
line 5575
;5574:
;5575:	VectorSubtract(bs->origin, myDet->s.pos.trBase, a);
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 64
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 64
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5576
;5576:	myLen = VectorLength(a);
ADDRLP4 8
ARGP4
ADDRLP4 72
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 72
INDIRF4
ASGNF4
line 5578
;5577:
;5578:	if (enLen > myLen)
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
LEF4 $2292
line 5579
;5579:	{
line 5580
;5580:		return;
ADDRGP4 $2271
JUMPV
LABELV $2292
line 5583
;5581:	}
;5582:
;5583:	if (enLen < BOT_PLANT_BLOW_DISTANCE && OrgVisible(bs->currentEnemy->client->ps.origin, myDet->s.pos.trBase, bs->currentEnemy->s.number))
ADDRLP4 20
INDIRF4
CNSTF4 1132462080
GEF4 $2294
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $2294
line 5584
;5584:	{ //we could just call the "blow all my detpacks" function here, but I guess that's cheating.
line 5585
;5585:		bs->plantKillEmAll = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 2304
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 5586
;5586:	}
LABELV $2294
line 5587
;5587:}
LABELV $2271
endproc BotCheckDetPacks 84 12
export BotUseInventoryItem
proc BotUseInventoryItem 12 8
line 5590
;5588:
;5589:int BotUseInventoryItem(bot_state_t *bs)
;5590:{
line 5591
;5591:	if (bs->cur_ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_MEDPAC))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $2298
line 5592
;5592:	{
line 5593
;5593:		if (g_entities[bs->client].health <= 50)
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 50
GTI4 $2300
line 5594
;5594:		{
line 5595
;5595:			bs->cur_ps.stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(HI_MEDPAC, IT_HOLDABLE);
CNSTI4 3
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 0
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 5596
;5596:			goto wantuseitem;
ADDRGP4 $2303
JUMPV
LABELV $2300
line 5598
;5597:		}
;5598:	}
LABELV $2298
line 5599
;5599:	if (bs->cur_ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_SEEKER))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2304
line 5600
;5600:	{
line 5601
;5601:		if (bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2306
ADDRLP4 0
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2306
line 5602
;5602:		{
line 5603
;5603:			bs->cur_ps.stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(HI_SEEKER, IT_HOLDABLE);
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 4
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 5604
;5604:			goto wantuseitem;
ADDRGP4 $2303
JUMPV
LABELV $2306
line 5606
;5605:		}
;5606:	}
LABELV $2304
line 5607
;5607:	if (bs->cur_ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_SENTRY_GUN))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $2308
line 5608
;5608:	{
line 5609
;5609:		if (bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2310
ADDRLP4 0
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2310
line 5610
;5610:		{
line 5611
;5611:			bs->cur_ps.stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(HI_SENTRY_GUN, IT_HOLDABLE);
ADDRLP4 4
CNSTI4 6
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 5612
;5612:			goto wantuseitem;
ADDRGP4 $2303
JUMPV
LABELV $2310
line 5614
;5613:		}
;5614:	}
LABELV $2308
line 5615
;5615:	if (bs->cur_ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_SHIELD))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2312
line 5616
;5616:	{
line 5617
;5617:		if (bs->currentEnemy && bs->frame_Enemy_Vis && bs->runningToEscapeThreat)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2314
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2314
ADDRLP4 0
INDIRP4
CNSTI4 2312
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2314
line 5618
;5618:		{ //this will (hopefully) result in the bot placing the shield down while facing
line 5620
;5619:		  //the enemy and running away
;5620:			bs->cur_ps.stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(HI_SHIELD, IT_HOLDABLE);
CNSTI4 2
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 8
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 5621
;5621:			goto wantuseitem;
ADDRGP4 $2303
JUMPV
LABELV $2314
line 5623
;5622:		}
;5623:	}
LABELV $2312
line 5625
;5624:
;5625:	return 0;
CNSTI4 0
RETI4
ADDRGP4 $2297
JUMPV
LABELV $2303
line 5628
;5626:
;5627:wantuseitem:
;5628:	level.clients[bs->client].ps.stats[STAT_HOLDABLE_ITEM] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM];
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 3024
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 220
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 5630
;5629:
;5630:	return 1;
CNSTI4 1
RETI4
LABELV $2297
endproc BotUseInventoryItem 12 8
export BotSurfaceNear
proc BotSurfaceNear 1104 28
line 5634
;5631:}
;5632:
;5633:int BotSurfaceNear(bot_state_t *bs)
;5634:{
line 5638
;5635:	trace_t tr;
;5636:	vec3_t fwd;
;5637:
;5638:	AngleVectors(bs->viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1092
CNSTP4 0
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 5640
;5639:
;5640:	fwd[0] = bs->origin[0]+(fwd[0]*64);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 5641
;5641:	fwd[1] = bs->origin[1]+(fwd[1]*64);
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 5642
;5642:	fwd[2] = bs->origin[2]+(fwd[2]*64);
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 5644
;5643:
;5644:	trap_Trace(&tr, bs->origin, NULL, NULL, fwd, bs->client, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 1100
CNSTP4 0
ASGNP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 5646
;5645:
;5646:	if (tr.fraction != 1)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
EQF4 $2321
line 5647
;5647:	{
line 5648
;5648:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2316
JUMPV
LABELV $2321
line 5651
;5649:	}
;5650:
;5651:	return 0;
CNSTI4 0
RETI4
LABELV $2316
endproc BotSurfaceNear 1104 28
export BotWeaponBlockable
proc BotWeaponBlockable 4 0
line 5655
;5652:}
;5653:
;5654:int BotWeaponBlockable(int weapon)
;5655:{
line 5656
;5656:	switch (weapon)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $2325
ADDRLP4 0
INDIRI4
CNSTI4 13
GTI4 $2325
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2334-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2334
address $2327
address $2325
address $2325
address $2325
address $2328
address $2325
address $2325
address $2329
address $2325
address $2330
address $2331
address $2332
address $2333
code
line 5657
;5657:	{
LABELV $2327
line 5659
;5658:	case WP_STUN_BATON:
;5659:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2324
JUMPV
LABELV $2328
line 5661
;5660:	case WP_DISRUPTOR:
;5661:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2324
JUMPV
LABELV $2329
line 5663
;5662:	case WP_DEMP2:
;5663:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2324
JUMPV
LABELV $2330
line 5665
;5664:	case WP_ROCKET_LAUNCHER:
;5665:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2324
JUMPV
LABELV $2331
line 5667
;5666:	case WP_THERMAL:
;5667:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2324
JUMPV
LABELV $2332
line 5669
;5668:	case WP_TRIP_MINE:
;5669:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2324
JUMPV
LABELV $2333
line 5671
;5670:	case WP_DET_PACK:
;5671:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2324
JUMPV
LABELV $2325
line 5673
;5672:	default:
;5673:		return 1;
CNSTI4 1
RETI4
LABELV $2324
endproc BotWeaponBlockable 4 0
export StandardBotAI
proc StandardBotAI 424 24
line 5681
;5674:	}
;5675:}
;5676:
;5677:void Cmd_EngageDuel_f(gentity_t *ent);
;5678:void Cmd_ToggleSaber_f(gentity_t *ent);
;5679:
;5680:void StandardBotAI(bot_state_t *bs, float thinktime)
;5681:{
line 5685
;5682:	int wp, enemy;
;5683:	int desiredIndex;
;5684:	int goalWPIndex;
;5685:	int doingFallback = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 5690
;5686:	int fjHalt;
;5687:	vec3_t a, ang, headlevel, eorg, noz_x, noz_y, dif, a_fo;
;5688:	float reaction;
;5689:	float bLeadAmount;
;5690:	int meleestrafe = 0;
ADDRLP4 92
CNSTI4 0
ASGNI4
line 5691
;5691:	int useTheForce = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 5692
;5692:	int forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5693
;5693:	int cBAI = 0;
ADDRLP4 152
CNSTI4 0
ASGNI4
line 5694
;5694:	gentity_t *friendInLOF = 0;
ADDRLP4 52
CNSTP4 0
ASGNP4
line 5696
;5695:	float mLen;
;5696:	int visResult = 0;
ADDRLP4 100
CNSTI4 0
ASGNI4
line 5697
;5697:	int selResult = 0;
ADDRLP4 104
CNSTI4 0
ASGNI4
line 5698
;5698:	int mineSelect = 0;
ADDRLP4 156
CNSTI4 0
ASGNI4
line 5699
;5699:	int detSelect = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 5701
;5700:
;5701:	if (gDeactivated)
ADDRGP4 gDeactivated
INDIRF4
CNSTF4 0
EQF4 $2337
line 5702
;5702:	{
line 5703
;5703:		bs->wpCurrent = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
CNSTP4 0
ASGNP4
line 5704
;5704:		bs->currentEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTP4 0
ASGNP4
line 5705
;5705:		bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 5706
;5706:		bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 5707
;5707:		return;
ADDRGP4 $2336
JUMPV
LABELV $2337
line 5710
;5708:	}
;5709:
;5710:	if (g_entities[bs->client].inuse &&
ADDRLP4 168
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 168
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2339
ADDRLP4 168
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2339
ADDRLP4 168
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2339
line 5713
;5711:		g_entities[bs->client].client &&
;5712:		g_entities[bs->client].client->sess.sessionTeam == TEAM_SPECTATOR)
;5713:	{
line 5714
;5714:		bs->wpCurrent = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
CNSTP4 0
ASGNP4
line 5715
;5715:		bs->currentEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTP4 0
ASGNP4
line 5716
;5716:		bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 5717
;5717:		bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 5718
;5718:		return;
ADDRGP4 $2336
JUMPV
LABELV $2339
line 5721
;5719:	}
;5720:
;5721:	trap_Cvar_Update(&bot_forgimmick);
ADDRGP4 bot_forgimmick
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 5722
;5722:	trap_Cvar_Update(&bot_honorableduelacceptance);
ADDRGP4 bot_honorableduelacceptance
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 5724
;5723:
;5724:	if (bot_forgimmick.integer)
ADDRGP4 bot_forgimmick+12
INDIRI4
CNSTI4 0
EQI4 $2344
line 5725
;5725:	{
line 5726
;5726:		bs->wpCurrent = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
CNSTP4 0
ASGNP4
line 5727
;5727:		bs->currentEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTP4 0
ASGNP4
line 5728
;5728:		bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 5729
;5729:		bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 5731
;5730:
;5731:		if (bot_forgimmick.integer == 2)
ADDRGP4 bot_forgimmick+12
INDIRI4
CNSTI4 2
NEI4 $2336
line 5732
;5732:		{ //for debugging saber stuff, this is handy
line 5733
;5733:			trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 5734
;5734:		}
line 5735
;5735:		return;
ADDRGP4 $2336
JUMPV
LABELV $2344
line 5738
;5736:	}
;5737:
;5738:	if (!bs->lastDeadTime)
ADDRFP4 0
INDIRP4
CNSTI4 1880
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2350
line 5739
;5739:	{ //just spawned in?
line 5740
;5740:		bs->lastDeadTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 1880
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 5741
;5741:	}
LABELV $2350
line 5743
;5742:
;5743:	if (g_entities[bs->client].health < 1)
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2353
line 5744
;5744:	{
line 5745
;5745:		bs->lastDeadTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 1880
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 5747
;5746:
;5747:		if (!bs->deathActivitiesDone && bs->lastHurt && bs->lastHurt->client && bs->lastHurt->s.number != bs->client)
ADDRLP4 172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
CNSTI4 2620
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2357
ADDRLP4 176
ADDRLP4 172
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
ADDRLP4 180
CNSTU4 0
ASGNU4
ADDRLP4 176
INDIRP4
CVPU4 4
ADDRLP4 180
INDIRU4
EQU4 $2357
ADDRLP4 176
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 180
INDIRU4
EQU4 $2357
ADDRLP4 176
INDIRP4
INDIRI4
ADDRLP4 172
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $2357
line 5748
;5748:		{
line 5749
;5749:			BotDeathNotify(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotDeathNotify
CALLV
pop
line 5750
;5750:			if (PassLovedOneCheck(bs, bs->lastHurt))
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 184
INDIRP4
ARGP4
ADDRLP4 184
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ARGP4
ADDRLP4 188
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 0
EQI4 $2359
line 5751
;5751:			{
line 5753
;5752:				//CHAT: Died
;5753:				bs->chatObject = bs->lastHurt;
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 2244
ADDP4
ADDRLP4 192
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
line 5754
;5754:				bs->chatAltObject = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 5755
;5755:				BotDoChat(bs, "Died", 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2361
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 5756
;5756:			}
ADDRGP4 $2360
JUMPV
LABELV $2359
line 5757
;5757:			else if (!PassLovedOneCheck(bs, bs->lastHurt) &&
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
ARGP4
ADDRLP4 192
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
NEI4 $2362
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 204
ADDRLP4 200
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 204
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2362
ADDRLP4 204
INDIRP4
ARGP4
CNSTI4 852
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 208
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 0
EQI4 $2362
line 5760
;5758:				botstates[bs->lastHurt->s.number] &&
;5759:				PassLovedOneCheck(botstates[bs->lastHurt->s.number], &g_entities[bs->client]))
;5760:			{ //killed by a bot that I love, but that does not love me
line 5761
;5761:				bs->chatObject = bs->lastHurt;
ADDRLP4 212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 212
INDIRP4
CNSTI4 2244
ADDP4
ADDRLP4 212
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
line 5762
;5762:				bs->chatAltObject = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 5763
;5763:				BotDoChat(bs, "KilledOnPurposeByLove", 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2364
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 5764
;5764:			}
LABELV $2362
LABELV $2360
line 5766
;5765:
;5766:			bs->deathActivitiesDone = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2620
ADDP4
CNSTI4 1
ASGNI4
line 5767
;5767:		}
LABELV $2357
line 5769
;5768:		
;5769:		bs->wpCurrent = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
CNSTP4 0
ASGNP4
line 5770
;5770:		bs->currentEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTP4 0
ASGNP4
line 5771
;5771:		bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 5772
;5772:		bs->wpCamping = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
CNSTP4 0
ASGNP4
line 5773
;5773:		bs->wpCampingTo = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2072
ADDP4
CNSTP4 0
ASGNP4
line 5774
;5774:		bs->wpStoreDest = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1892
ADDP4
CNSTP4 0
ASGNP4
line 5775
;5775:		bs->wpDestIgnoreTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1988
ADDP4
CNSTF4 0
ASGNF4
line 5776
;5776:		bs->wpDestSwitchTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
CNSTF4 0
ASGNF4
line 5777
;5777:		bs->wpSeenTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1972
ADDP4
CNSTF4 0
ASGNF4
line 5778
;5778:		bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 5780
;5779:
;5780:		if (rand()%10 < 5 &&
ADDRLP4 184
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GEI4 $2336
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
CNSTI4 2236
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2368
ADDRLP4 188
INDIRP4
CNSTI4 2228
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2336
LABELV $2368
line 5782
;5781:			(!bs->doChat || bs->chatTime < level.time))
;5782:		{
line 5783
;5783:			trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 5784
;5784:		}
line 5786
;5785:
;5786:		return;
ADDRGP4 $2336
JUMPV
LABELV $2353
line 5789
;5787:	}
;5788:
;5789:	bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 5790
;5790:	bs->doAltAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 0
ASGNI4
line 5793
;5791:	//reset the attack states
;5792:
;5793:	if (bs->isSquadLeader)
ADDRFP4 0
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2369
line 5794
;5794:	{
line 5795
;5795:		CommanderBotAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CommanderBotAI
CALLV
pop
line 5796
;5796:	}
ADDRGP4 $2370
JUMPV
LABELV $2369
line 5798
;5797:	else
;5798:	{
line 5799
;5799:		BotDoTeamplayAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotDoTeamplayAI
CALLV
pop
line 5800
;5800:	}
LABELV $2370
line 5802
;5801:
;5802:	if (!bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2371
line 5803
;5803:	{
line 5804
;5804:		bs->frame_Enemy_Vis = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2056
ADDP4
CNSTI4 0
ASGNI4
line 5805
;5805:	}
LABELV $2371
line 5807
;5806:
;5807:	if (bs->revengeEnemy && bs->revengeEnemy->client &&
ADDRLP4 172
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
ASGNP4
ADDRLP4 176
CNSTU4 0
ASGNU4
ADDRLP4 172
INDIRP4
CVPU4 4
ADDRLP4 176
INDIRU4
EQU4 $2373
ADDRLP4 180
ADDRLP4 172
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 180
INDIRP4
CVPU4 4
ADDRLP4 176
INDIRU4
EQU4 $2373
ADDRLP4 184
ADDRLP4 180
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 8
EQI4 $2373
ADDRLP4 184
INDIRI4
CNSTI4 2
EQI4 $2373
line 5809
;5808:		bs->revengeEnemy->client->pers.connected != CA_ACTIVE && bs->revengeEnemy->client->pers.connected != CA_AUTHORIZING)
;5809:	{
line 5810
;5810:		bs->revengeEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
CNSTP4 0
ASGNP4
line 5811
;5811:		bs->revengeHateLevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1864
ADDP4
CNSTI4 0
ASGNI4
line 5812
;5812:	}
LABELV $2373
line 5814
;5813:
;5814:	if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 188
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 192
CNSTU4 0
ASGNU4
ADDRLP4 188
INDIRP4
CVPU4 4
ADDRLP4 192
INDIRU4
EQU4 $2375
ADDRLP4 196
ADDRLP4 188
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CVPU4 4
ADDRLP4 192
INDIRU4
EQU4 $2375
ADDRLP4 200
ADDRLP4 196
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 8
EQI4 $2375
ADDRLP4 200
INDIRI4
CNSTI4 2
EQI4 $2375
line 5816
;5815:		bs->currentEnemy->client->pers.connected != CA_ACTIVE && bs->currentEnemy->client->pers.connected != CA_AUTHORIZING)
;5816:	{
line 5817
;5817:		bs->currentEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTP4 0
ASGNP4
line 5818
;5818:	}
LABELV $2375
line 5820
;5819:
;5820:	fjHalt = 0;
ADDRLP4 96
CNSTI4 0
ASGNI4
line 5823
;5821:
;5822:#ifndef FORCEJUMP_INSTANTMETHOD
;5823:	if (bs->forceJumpChargeTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2377
line 5824
;5824:	{
line 5825
;5825:		useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5826
;5826:		forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5827
;5827:	}
LABELV $2377
line 5829
;5828:
;5829:	if (bs->currentEnemy && bs->currentEnemy->client && bs->frame_Enemy_Vis && bs->forceJumpChargeTime < level.time)
ADDRLP4 204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 208
ADDRLP4 204
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 212
CNSTU4 0
ASGNU4
ADDRLP4 208
INDIRP4
CVPU4 4
ADDRLP4 212
INDIRU4
EQU4 $2380
ADDRLP4 208
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 212
INDIRU4
EQU4 $2380
ADDRLP4 204
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2380
ADDRLP4 204
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $2380
line 5833
;5830:#else
;5831:	if (bs->currentEnemy && bs->currentEnemy->client && bs->frame_Enemy_Vis)
;5832:#endif
;5833:	{
line 5834
;5834:		VectorSubtract(bs->currentEnemy->client->ps.origin, bs->eye, a_fo);
ADDRLP4 216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 220
ADDRLP4 216
INDIRP4
CNSTI4 1816
ADDP4
ASGNP4
ADDRLP4 224
CNSTI4 408
ASGNI4
ADDRLP4 20
ADDRLP4 220
INDIRP4
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 216
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 220
INDIRP4
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 216
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20+8
ADDRLP4 228
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 228
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5835
;5835:		vectoangles(a_fo, a_fo);
ADDRLP4 20
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 5838
;5836:
;5837:		//do this above all things
;5838:		if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_PUSH)) && bs->doForcePush > level.time && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_PUSH]][FP_PUSH] && InFieldOfVision(bs->viewangles, 50, a_fo))
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 236
CNSTI4 8
ASGNI4
ADDRLP4 232
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ADDRLP4 236
INDIRI4
BANDI4
CNSTI4 0
EQI4 $2385
ADDRLP4 232
INDIRP4
CNSTI4 4796
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2385
ADDRLP4 240
CNSTI4 3024
ADDRLP4 232
INDIRP4
ADDRLP4 236
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 240
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 240
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+12
ADDP4
INDIRI4
LEI4 $2385
ADDRLP4 232
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 244
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 244
INDIRI4
CNSTI4 0
EQI4 $2385
line 5839
;5839:		{
line 5840
;5840:			level.clients[bs->client].ps.fd.forcePowerSelected = FP_PUSH;
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 3
ASGNI4
line 5841
;5841:			useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5842
;5842:			forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5843
;5843:		}
ADDRGP4 $2386
JUMPV
LABELV $2385
line 5844
;5844:		else if (bs->cur_ps.fd.forceSide == FORCE_DARKSIDE)
ADDRFP4 0
INDIRP4
CNSTI4 1204
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2389
line 5845
;5845:		{ //try dark side powers
line 5847
;5846:		  //in order of priority top to bottom
;5847:			if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_GRIP)) && (bs->cur_ps.fd.forcePowersActive & (1 << FP_GRIP)) && InFieldOfVision(bs->viewangles, 50, a_fo))
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
CNSTI4 64
ASGNI4
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRLP4 248
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ADDRLP4 252
INDIRI4
BANDI4
ADDRLP4 256
INDIRI4
EQI4 $2391
ADDRLP4 248
INDIRP4
CNSTI4 864
ADDP4
INDIRI4
ADDRLP4 252
INDIRI4
BANDI4
ADDRLP4 256
INDIRI4
EQI4 $2391
ADDRLP4 248
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 260
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
EQI4 $2391
line 5848
;5848:			{ //already gripping someone, so hold it
line 5849
;5849:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_GRIP;
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 6
ASGNI4
line 5850
;5850:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5851
;5851:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5852
;5852:			}
ADDRGP4 $2390
JUMPV
LABELV $2391
line 5853
;5853:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_LIGHTNING)) && bs->frame_Enemy_Len < FORCE_LIGHTNING_RADIUS && level.clients[bs->client].ps.fd.forcePower > 50 && InFieldOfVision(bs->viewangles, 50, a_fo))
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $2393
ADDRLP4 264
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1133903872
GEF4 $2393
CNSTI4 3024
ADDRLP4 264
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 50
LEI4 $2393
ADDRLP4 264
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 268
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $2393
line 5854
;5854:			{
line 5855
;5855:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_LIGHTNING;
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 7
ASGNI4
line 5856
;5856:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5857
;5857:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5858
;5858:			}
ADDRGP4 $2390
JUMPV
LABELV $2393
line 5859
;5859:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_GRIP)) && bs->frame_Enemy_Len < MAX_GRIP_DISTANCE && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_GRIP]][FP_GRIP] && InFieldOfVision(bs->viewangles, 50, a_fo))
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $2395
ADDRLP4 272
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132462080
GEF4 $2395
ADDRLP4 276
CNSTI4 3024
ADDRLP4 272
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 276
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+24
ADDP4
INDIRI4
LEI4 $2395
ADDRLP4 272
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 280
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $2395
line 5860
;5860:			{
line 5861
;5861:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_GRIP;
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 6
ASGNI4
line 5862
;5862:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5863
;5863:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5864
;5864:			}
ADDRGP4 $2390
JUMPV
LABELV $2395
line 5865
;5865:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_RAGE)) && g_entities[bs->client].health < 25 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_RAGE]][FP_RAGE])
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 284
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $2398
ADDRLP4 288
ADDRLP4 284
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 852
ADDRLP4 288
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 25
GEI4 $2398
ADDRLP4 292
CNSTI4 3024
ADDRLP4 288
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 292
INDIRP4
CNSTI4 976
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+32
ADDP4
INDIRI4
LEI4 $2398
line 5866
;5866:			{
line 5867
;5867:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_RAGE;
ADDRLP4 296
CNSTI4 8
ASGNI4
CNSTI4 3024
ADDRFP4 0
INDIRP4
ADDRLP4 296
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
ADDRLP4 296
INDIRI4
ASGNI4
line 5868
;5868:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5869
;5869:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5870
;5870:			}
ADDRGP4 $2390
JUMPV
LABELV $2398
line 5871
;5871:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_DRAIN)) && bs->frame_Enemy_Len < MAX_DRAIN_DISTANCE && level.clients[bs->client].ps.fd.forcePower > 50 && InFieldOfVision(bs->viewangles, 50, a_fo) && bs->currentEnemy->client->ps.fd.forcePower > 10 && bs->currentEnemy->client->ps.fd.forceSide == FORCE_LIGHTSIDE)
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 296
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $2390
ADDRLP4 296
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1140850688
GEF4 $2390
CNSTI4 3024
ADDRLP4 296
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 50
LEI4 $2390
ADDRLP4 296
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 300
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
EQI4 $2390
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 304
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 10
LEI4 $2390
ADDRLP4 304
INDIRP4
CNSTI4 1188
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2390
line 5872
;5872:			{
line 5873
;5873:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_DRAIN;
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 13
ASGNI4
line 5874
;5874:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5875
;5875:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5876
;5876:			}
line 5877
;5877:		}
ADDRGP4 $2390
JUMPV
LABELV $2389
line 5878
;5878:		else if (bs->cur_ps.fd.forceSide == FORCE_LIGHTSIDE)
ADDRFP4 0
INDIRP4
CNSTI4 1204
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2404
line 5879
;5879:		{ //try light side powers
line 5880
;5880:			if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_TELEPATHY)) && bs->frame_Enemy_Len < MAX_TRICK_DISTANCE && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_TELEPATHY]][FP_TELEPATHY] && InFieldOfVision(bs->viewangles, 50, a_fo) && !(bs->currentEnemy->client->ps.fd.forcePowersActive & (1 << FP_SEE)))
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $2406
ADDRLP4 248
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1140850688
GEF4 $2406
ADDRLP4 252
CNSTI4 3024
ADDRLP4 248
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 252
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 252
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+20
ADDP4
INDIRI4
LEI4 $2406
ADDRLP4 248
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 256
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 260
CNSTI4 0
ASGNI4
ADDRLP4 256
INDIRI4
ADDRLP4 260
INDIRI4
EQI4 $2406
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 260
INDIRI4
NEI4 $2406
line 5881
;5881:			{
line 5882
;5882:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_TELEPATHY;
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 5
ASGNI4
line 5883
;5883:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5884
;5884:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5885
;5885:			}
ADDRGP4 $2407
JUMPV
LABELV $2406
line 5886
;5886:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_ABSORB)) && g_entities[bs->client].health < 75 && bs->currentEnemy->client->ps.fd.forceSide == FORCE_DARKSIDE && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_ABSORB]][FP_ABSORB])
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2409
ADDRLP4 268
ADDRLP4 264
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 852
ADDRLP4 268
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 75
GEI4 $2409
ADDRLP4 264
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1188
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2409
ADDRLP4 272
CNSTI4 3024
ADDRLP4 268
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 272
INDIRP4
CNSTI4 984
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+40
ADDP4
INDIRI4
LEI4 $2409
line 5887
;5887:			{
line 5888
;5888:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_ABSORB;
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 10
ASGNI4
line 5889
;5889:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5890
;5890:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5891
;5891:			}
ADDRGP4 $2410
JUMPV
LABELV $2409
line 5892
;5892:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_PROTECT)) && g_entities[bs->client].health < 35 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_PROTECT]][FP_PROTECT])
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2413
ADDRLP4 280
ADDRLP4 276
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 852
ADDRLP4 280
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 35
GEI4 $2413
ADDRLP4 284
CNSTI4 3024
ADDRLP4 280
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 284
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 284
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+36
ADDP4
INDIRI4
LEI4 $2413
line 5893
;5893:			{
line 5894
;5894:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_PROTECT;
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 9
ASGNI4
line 5895
;5895:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5896
;5896:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5897
;5897:			}
LABELV $2413
LABELV $2410
LABELV $2407
line 5898
;5898:		}
LABELV $2404
LABELV $2390
LABELV $2386
line 5900
;5899:
;5900:		if (!useTheForce)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2417
line 5901
;5901:		{ //try neutral powers
line 5902
;5902:			if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_PUSH)) && bs->cur_ps.fd.forceGripBeingGripped > level.time && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_PUSH]][FP_PUSH] && InFieldOfVision(bs->viewangles, 50, a_fo))
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
CNSTI4 8
ASGNI4
ADDRLP4 248
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ADDRLP4 252
INDIRI4
BANDI4
CNSTI4 0
EQI4 $2419
ADDRLP4 248
INDIRP4
CNSTI4 1132
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2419
ADDRLP4 256
CNSTI4 3024
ADDRLP4 248
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 256
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 256
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+12
ADDP4
INDIRI4
LEI4 $2419
ADDRLP4 248
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 260
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
EQI4 $2419
line 5903
;5903:			{
line 5904
;5904:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_PUSH;
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 3
ASGNI4
line 5905
;5905:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5906
;5906:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5907
;5907:			}
ADDRGP4 $2420
JUMPV
LABELV $2419
line 5908
;5908:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_SPEED)) && g_entities[bs->client].health < 25 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_SPEED]][FP_SPEED])
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2423
ADDRLP4 268
ADDRLP4 264
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 852
ADDRLP4 268
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 25
GEI4 $2423
ADDRLP4 272
CNSTI4 3024
ADDRLP4 268
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 272
INDIRP4
CNSTI4 952
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+8
ADDP4
INDIRI4
LEI4 $2423
line 5909
;5909:			{
line 5910
;5910:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_SPEED;
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 2
ASGNI4
line 5911
;5911:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5912
;5912:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5913
;5913:			}
ADDRGP4 $2424
JUMPV
LABELV $2423
line 5914
;5914:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_SEE)) && BotMindTricked(bs->client, bs->currentEnemy->s.number) && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_SEE]][FP_SEE])
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $2427
ADDRLP4 276
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 276
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 280
ADDRGP4 BotMindTricked
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $2427
ADDRLP4 284
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 284
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 284
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+56
ADDP4
INDIRI4
LEI4 $2427
line 5915
;5915:			{
line 5916
;5916:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_SEE;
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 14
ASGNI4
line 5917
;5917:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5918
;5918:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5919
;5919:			}
ADDRGP4 $2428
JUMPV
LABELV $2427
line 5920
;5920:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_PULL)) && bs->frame_Enemy_Len < 256 && level.clients[bs->client].ps.fd.forcePower > 75 && InFieldOfVision(bs->viewangles, 50, a_fo))
ADDRLP4 288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 288
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2430
ADDRLP4 288
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132462080
GEF4 $2430
CNSTI4 3024
ADDRLP4 288
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 75
LEI4 $2430
ADDRLP4 288
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 292
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $2430
line 5921
;5921:			{
line 5922
;5922:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_PULL;
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 4
ASGNI4
line 5923
;5923:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5924
;5924:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5925
;5925:			}
LABELV $2430
LABELV $2428
LABELV $2424
LABELV $2420
line 5926
;5926:		}
LABELV $2417
line 5927
;5927:	}
LABELV $2380
line 5929
;5928:
;5929:	if (!useTheForce)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2432
line 5930
;5930:	{ //try powers that we don't care if we have an enemy for
line 5931
;5931:		if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_HEAL)) && g_entities[bs->client].health < 50 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_HEAL]][FP_HEAL] && bs->cur_ps.fd.forcePowerLevel[FP_HEAL] > FORCE_LEVEL_1)
ADDRLP4 216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 220
CNSTI4 1
ASGNI4
ADDRLP4 216
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ADDRLP4 220
INDIRI4
BANDI4
CNSTI4 0
EQI4 $2434
ADDRLP4 224
ADDRLP4 216
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 852
ADDRLP4 224
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 50
GEI4 $2434
ADDRLP4 228
CNSTI4 3024
ADDRLP4 224
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 228
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
ADDP4
INDIRI4
LEI4 $2434
ADDRLP4 216
INDIRP4
CNSTI4 960
ADDP4
INDIRI4
ADDRLP4 220
INDIRI4
LEI4 $2434
line 5932
;5932:		{
line 5933
;5933:			level.clients[bs->client].ps.fd.forcePowerSelected = FP_HEAL;
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 0
ASGNI4
line 5934
;5934:			useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5935
;5935:			forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5936
;5936:		}
ADDRGP4 $2435
JUMPV
LABELV $2434
line 5937
;5937:		else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_HEAL)) && g_entities[bs->client].health < 50 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_HEAL]][FP_HEAL] && !bs->currentEnemy && bs->isCamping > level.time)
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 232
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2437
ADDRLP4 236
ADDRLP4 232
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 852
ADDRLP4 236
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 50
GEI4 $2437
ADDRLP4 240
CNSTI4 3024
ADDRLP4 236
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 240
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 240
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
ADDP4
INDIRI4
LEI4 $2437
ADDRLP4 232
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2437
ADDRLP4 232
INDIRP4
CNSTI4 2064
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2437
line 5938
;5938:		{ //only meditate and heal if we're camping
line 5939
;5939:			level.clients[bs->client].ps.fd.forcePowerSelected = FP_HEAL;
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 0
ASGNI4
line 5940
;5940:			useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5941
;5941:			forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5942
;5942:		}
LABELV $2437
LABELV $2435
line 5943
;5943:	}
LABELV $2432
line 5946
;5944:
;5945:	//cm - dont use force on bots
;5946:	if (useTheForce && forceHostile)
ADDRLP4 216
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 216
INDIRI4
EQI4 $2441
ADDRLP4 16
INDIRI4
ADDRLP4 216
INDIRI4
EQI4 $2441
line 5947
;5947:	{
line 5948
;5948:		if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 220
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 224
CNSTU4 0
ASGNU4
ADDRLP4 220
INDIRP4
CVPU4 4
ADDRLP4 224
INDIRU4
EQU4 $2443
ADDRLP4 220
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 224
INDIRU4
EQU4 $2443
ADDRLP4 220
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 224
INDIRU4
EQU4 $2443
ADDRGP4 cm_botsattackhumans+12
INDIRI4
CNSTI4 1
NEI4 $2443
line 5950
;5949:		botstates[bs->currentEnemy->s.number] && cm_botsattackhumans.integer == 1)
;5950:		{
line 5951
;5951:			useTheForce = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 5952
;5952:			forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5953
;5953:		}
LABELV $2443
line 5954
;5954:	}
LABELV $2441
line 5956
;5955:
;5956:	if (useTheForce && forceHostile)
ADDRLP4 220
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 220
INDIRI4
EQI4 $2446
ADDRLP4 16
INDIRI4
ADDRLP4 220
INDIRI4
EQI4 $2446
line 5957
;5957:	{
line 5958
;5958:		if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 228
ADDRLP4 224
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 232
CNSTU4 0
ASGNU4
ADDRLP4 228
INDIRP4
CVPU4 4
ADDRLP4 232
INDIRU4
EQU4 $2448
ADDRLP4 228
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 232
INDIRU4
EQU4 $2448
ADDRLP4 236
CNSTI4 852
ASGNI4
ADDRLP4 240
ADDRLP4 224
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 236
INDIRI4
ADDRLP4 240
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 228
INDIRP4
ARGP4
CNSTI4 3024
ADDRLP4 240
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ADDRLP4 236
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 244
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 244
INDIRI4
CNSTI4 0
NEI4 $2448
line 5960
;5959:			!ForcePowerUsableOn(&g_entities[bs->client], bs->currentEnemy, level.clients[bs->client].ps.fd.forcePowerSelected))
;5960:		{
line 5961
;5961:			useTheForce = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 5962
;5962:			forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5963
;5963:		}
LABELV $2448
line 5964
;5964:	}
LABELV $2446
line 5966
;5965:
;5966:	doingFallback = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 5968
;5967:
;5968:	bs->deathActivitiesDone = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2620
ADDP4
CNSTI4 0
ASGNI4
line 5970
;5969:
;5970:	if (BotUseInventoryItem(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 224
ADDRGP4 BotUseInventoryItem
CALLI4
ASGNI4
ADDRLP4 224
INDIRI4
CNSTI4 0
EQI4 $2450
line 5971
;5971:	{
line 5972
;5972:		if (rand()%10 < 5)
ADDRLP4 228
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 228
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GEI4 $2452
line 5973
;5973:		{
line 5974
;5974:			trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 5975
;5975:		}
LABELV $2452
line 5976
;5976:	}
LABELV $2450
line 5978
;5977:
;5978:	if (bs->cur_ps.ammo[weaponData[bs->cur_ps.weapon].ammoIndex] < weaponData[bs->cur_ps.weapon].energyPerShot)
ADDRLP4 228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 232
CNSTI4 56
ADDRLP4 228
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 232
INDIRI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 228
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
ADDRLP4 232
INDIRI4
ADDRGP4 weaponData+8
ADDP4
INDIRI4
GEI4 $2454
line 5979
;5979:	{
line 5980
;5980:		if (BotTryAnotherWeapon(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 236
ADDRGP4 BotTryAnotherWeapon
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 0
EQI4 $2455
line 5981
;5981:		{
line 5982
;5982:			return;
ADDRGP4 $2336
JUMPV
line 5984
;5983:		}
;5984:	}
LABELV $2454
line 5986
;5985:	else
;5986:	{
line 5987
;5987:		if (bs->currentEnemy && bs->lastVisibleEnemyIndex == bs->currentEnemy->s.number &&
ADDRLP4 236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 240
ADDRLP4 236
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 240
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2459
ADDRLP4 236
INDIRP4
CNSTI4 1956
ADDP4
INDIRI4
ADDRLP4 240
INDIRP4
INDIRI4
NEI4 $2459
ADDRLP4 244
CNSTI4 0
ASGNI4
ADDRLP4 236
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 244
INDIRI4
EQI4 $2459
ADDRLP4 236
INDIRP4
CNSTI4 2284
ADDP4
INDIRI4
ADDRLP4 244
INDIRI4
EQI4 $2459
line 5989
;5988:			bs->frame_Enemy_Vis && bs->forceWeaponSelect /*&& bs->plantContinue < level.time*/)
;5989:		{
line 5990
;5990:			bs->forceWeaponSelect = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2284
ADDP4
CNSTI4 0
ASGNI4
line 5991
;5991:		}
LABELV $2459
line 5993
;5992:
;5993:		if (bs->plantContinue > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2300
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2461
line 5994
;5994:		{
line 5995
;5995:			bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 5996
;5996:			bs->destinationGrabTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
CNSTF4 0
ASGNF4
line 5997
;5997:		}
LABELV $2461
line 5999
;5998:
;5999:		if (!bs->forceWeaponSelect && bs->cur_ps.hasDetPackPlanted && bs->plantKillEmAll > level.time)
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
CNSTI4 0
ASGNI4
ADDRLP4 248
INDIRP4
CNSTI4 2284
ADDP4
INDIRI4
ADDRLP4 252
INDIRI4
NEI4 $2464
ADDRLP4 248
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
ADDRLP4 252
INDIRI4
EQI4 $2464
ADDRLP4 248
INDIRP4
CNSTI4 2304
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2464
line 6000
;6000:		{
line 6001
;6001:			bs->forceWeaponSelect = WP_DET_PACK;
ADDRFP4 0
INDIRP4
CNSTI4 2284
ADDP4
CNSTI4 13
ASGNI4
line 6002
;6002:		}
LABELV $2464
line 6004
;6003:
;6004:		if (bs->forceWeaponSelect)
ADDRFP4 0
INDIRP4
CNSTI4 2284
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2467
line 6005
;6005:		{
line 6006
;6006:			selResult = BotSelectChoiceWeapon(bs, bs->forceWeaponSelect, 1);
ADDRLP4 256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 256
INDIRP4
ARGP4
ADDRLP4 256
INDIRP4
CNSTI4 2284
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 260
ADDRGP4 BotSelectChoiceWeapon
CALLI4
ASGNI4
ADDRLP4 104
ADDRLP4 260
INDIRI4
ASGNI4
line 6007
;6007:		}
LABELV $2467
line 6009
;6008:
;6009:		if (selResult)
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $2469
line 6010
;6010:		{
line 6011
;6011:			if (selResult == 2)
ADDRLP4 104
INDIRI4
CNSTI4 2
NEI4 $2470
line 6012
;6012:			{ //newly selected
line 6013
;6013:				return;
ADDRGP4 $2336
JUMPV
line 6015
;6014:			}
;6015:		}
LABELV $2469
line 6016
;6016:		else if (BotSelectIdealWeapon(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
ADDRGP4 BotSelectIdealWeapon
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
EQI4 $2473
line 6017
;6017:		{
line 6018
;6018:			return;
ADDRGP4 $2336
JUMPV
LABELV $2473
LABELV $2470
line 6020
;6019:		}
;6020:	}
LABELV $2455
line 6026
;6021:	/*if (BotSelectMelee(bs))
;6022:	{
;6023:		return;
;6024:	}*/
;6025:
;6026:	reaction = bs->skills.reflex/bs->settings.skill;
ADDRLP4 236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 236
INDIRP4
CNSTI4 2316
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 236
INDIRP4
CNSTI4 1568
ADDP4
INDIRF4
DIVF4
ASGNF4
line 6028
;6027:
;6028:	if (reaction < 0)
ADDRLP4 48
INDIRF4
CNSTF4 0
GEF4 $2475
line 6029
;6029:	{
line 6030
;6030:		reaction = 0;
ADDRLP4 48
CNSTF4 0
ASGNF4
line 6031
;6031:	}
LABELV $2475
line 6032
;6032:	if (reaction > 2000)
ADDRLP4 48
INDIRF4
CNSTF4 1157234688
LEF4 $2477
line 6033
;6033:	{
line 6034
;6034:		reaction = 2000;
ADDRLP4 48
CNSTF4 1157234688
ASGNF4
line 6035
;6035:	}
LABELV $2477
line 6037
;6036:
;6037:	if (!bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2479
line 6038
;6038:	{
line 6039
;6039:		bs->timeToReact = level.time + reaction;
ADDRFP4 0
INDIRP4
CNSTI4 1992
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 48
INDIRF4
ADDF4
ASGNF4
line 6040
;6040:	}
LABELV $2479
line 6042
;6041:
;6042:	if (bs->cur_ps.weapon == WP_DET_PACK && bs->cur_ps.hasDetPackPlanted && bs->plantKillEmAll > level.time)
ADDRLP4 240
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 240
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 13
NEI4 $2482
ADDRLP4 240
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2482
ADDRLP4 240
INDIRP4
CNSTI4 2304
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2482
line 6043
;6043:	{
line 6044
;6044:		bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 6045
;6045:	}
LABELV $2482
line 6047
;6046:
;6047:	if (bs->wpCamping)
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2485
line 6048
;6048:	{
line 6049
;6049:		if (bs->isCamping < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2487
line 6050
;6050:		{
line 6051
;6051:			bs->wpCamping = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
CNSTP4 0
ASGNP4
line 6052
;6052:			bs->isCamping = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
CNSTF4 0
ASGNF4
line 6053
;6053:		}
LABELV $2487
line 6055
;6054:
;6055:		if (bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 244
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2490
ADDRLP4 244
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2490
line 6056
;6056:		{
line 6057
;6057:			bs->wpCamping = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
CNSTP4 0
ASGNP4
line 6058
;6058:			bs->isCamping = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
CNSTF4 0
ASGNF4
line 6059
;6059:		}
LABELV $2490
line 6060
;6060:	}
LABELV $2485
line 6062
;6061:
;6062:	if (bs->wpCurrent &&
ADDRLP4 244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 244
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2492
ADDRLP4 244
INDIRP4
CNSTI4 1972
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LTF4 $2496
ADDRLP4 244
INDIRP4
CNSTI4 1976
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2492
LABELV $2496
line 6064
;6063:		(bs->wpSeenTime < level.time || bs->wpTravelTime < level.time))
;6064:	{
line 6065
;6065:		bs->wpCurrent = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
CNSTP4 0
ASGNP4
line 6066
;6066:	}
LABELV $2492
line 6068
;6067:
;6068:	if (bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2497
line 6069
;6069:	{
line 6070
;6070:		if (bs->enemySeenTime < level.time ||
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
CNSTI4 1996
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LTF4 $2502
ADDRLP4 248
INDIRP4
ARGP4
ADDRLP4 248
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ARGP4
ADDRLP4 252
ADDRGP4 PassStandardEnemyChecks
CALLI4
ASGNI4
ADDRLP4 252
INDIRI4
CNSTI4 0
NEI4 $2499
LABELV $2502
line 6072
;6071:			!PassStandardEnemyChecks(bs, bs->currentEnemy))
;6072:		{
line 6073
;6073:			if (bs->revengeEnemy == bs->currentEnemy &&
ADDRLP4 256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
ADDRLP4 256
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 264
ADDRLP4 260
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 256
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 264
INDIRU4
NEU4 $2503
ADDRLP4 260
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2503
ADDRLP4 268
ADDRLP4 256
INDIRP4
CNSTI4 1832
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 268
INDIRU4
CNSTU4 0
EQU4 $2503
ADDRLP4 268
INDIRU4
ADDRLP4 264
INDIRU4
NEU4 $2503
line 6076
;6074:				bs->currentEnemy->health < 1 &&
;6075:				bs->lastAttacked && bs->lastAttacked == bs->currentEnemy)
;6076:			{
line 6078
;6077:				//CHAT: Destroyed hated one [KilledHatedOne section]
;6078:				bs->chatObject = bs->revengeEnemy;
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI4 2244
ADDP4
ADDRLP4 272
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
ASGNP4
line 6079
;6079:				bs->chatAltObject = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 6080
;6080:				BotDoChat(bs, "KilledHatedOne", 1);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2505
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 6081
;6081:				bs->revengeEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
CNSTP4 0
ASGNP4
line 6082
;6082:				bs->revengeHateLevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1864
ADDP4
CNSTI4 0
ASGNI4
line 6083
;6083:			}
ADDRGP4 $2504
JUMPV
LABELV $2503
line 6084
;6084:			else if (bs->currentEnemy->health < 1 && PassLovedOneCheck(bs, bs->currentEnemy) &&
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
ADDRLP4 272
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2506
ADDRLP4 272
INDIRP4
ARGP4
ADDRLP4 276
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $2506
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 288
ADDRLP4 284
INDIRP4
CNSTI4 1832
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 288
INDIRU4
CNSTU4 0
EQU4 $2506
ADDRLP4 288
INDIRU4
ADDRLP4 284
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
NEU4 $2506
line 6086
;6085:				bs->lastAttacked && bs->lastAttacked == bs->currentEnemy)
;6086:			{
line 6088
;6087:				//CHAT: Killed
;6088:				bs->chatObject = bs->currentEnemy;
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 2244
ADDP4
ADDRLP4 292
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
line 6089
;6089:				bs->chatAltObject = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 6090
;6090:				BotDoChat(bs, "Killed", 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2508
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 6091
;6091:			}
LABELV $2506
LABELV $2504
line 6093
;6092:
;6093:			bs->currentEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTP4 0
ASGNP4
line 6094
;6094:		}
LABELV $2499
line 6095
;6095:	}
LABELV $2497
line 6097
;6096:
;6097:	if (bot_honorableduelacceptance.integer)
ADDRGP4 bot_honorableduelacceptance+12
INDIRI4
CNSTI4 0
EQI4 $2509
line 6098
;6098:	{
line 6099
;6099:		if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
ADDRLP4 248
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 256
CNSTU4 0
ASGNU4
ADDRLP4 252
INDIRP4
CVPU4 4
ADDRLP4 256
INDIRU4
EQU4 $2512
ADDRLP4 260
ADDRLP4 252
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 260
INDIRP4
CVPU4 4
ADDRLP4 256
INDIRU4
EQU4 $2512
ADDRLP4 264
CNSTI4 2
ASGNI4
ADDRLP4 248
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 264
INDIRI4
NEI4 $2512
ADDRLP4 268
CNSTI4 0
ASGNI4
ADDRGP4 g_privateDuel+12
INDIRI4
ADDRLP4 268
INDIRI4
EQI4 $2512
ADDRLP4 248
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 268
INDIRI4
EQI4 $2512
ADDRLP4 248
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1137180672
GEF4 $2512
ADDRLP4 260
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 264
INDIRI4
NEI4 $2512
ADDRLP4 260
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
ADDRLP4 268
INDIRI4
EQI4 $2512
line 6106
;6100:			bs->cur_ps.weapon == WP_SABER &&
;6101:			g_privateDuel.integer &&
;6102:			bs->frame_Enemy_Vis &&
;6103:			bs->frame_Enemy_Len < 400 &&
;6104:			bs->currentEnemy->client->ps.weapon == WP_SABER &&
;6105:			bs->currentEnemy->client->ps.saberHolstered)
;6106:		{
line 6109
;6107:			vec3_t e_ang_vec;
;6108:
;6109:			VectorSubtract(bs->currentEnemy->client->ps.origin, bs->eye, e_ang_vec);
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 288
ADDRLP4 284
INDIRP4
CNSTI4 1816
ADDP4
ASGNP4
ADDRLP4 292
CNSTI4 408
ASGNI4
ADDRLP4 272
ADDRLP4 288
INDIRP4
INDIRP4
ADDRLP4 292
INDIRI4
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 284
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 272+4
ADDRLP4 288
INDIRP4
INDIRP4
ADDRLP4 292
INDIRI4
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 284
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272+8
ADDRLP4 296
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 296
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6111
;6110:
;6111:			if (InFieldOfVision(bs->viewangles, 100, e_ang_vec))
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1120403456
ARGF4
ADDRLP4 272
ARGP4
ADDRLP4 300
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
EQI4 $2517
line 6112
;6112:			{ //Our enemy has his saber holstered and has challenged us to a duel, so challenge him back
line 6113
;6113:				if (!bs->cur_ps.saberHolstered)
ADDRFP4 0
INDIRP4
CNSTI4 1328
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2519
line 6114
;6114:				{
line 6115
;6115:					Cmd_ToggleSaber_f(&g_entities[bs->client]);
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_ToggleSaber_f
CALLV
pop
line 6116
;6116:				}
ADDRGP4 $2520
JUMPV
LABELV $2519
line 6118
;6117:				else
;6118:				{
line 6119
;6119:					if (bs->currentEnemy->client->ps.duelIndex == bs->client &&
ADDRLP4 304
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 308
ADDRLP4 304
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 308
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRLP4 304
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2521
ADDRLP4 308
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2521
ADDRLP4 304
INDIRP4
CNSTI4 1320
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2521
line 6122
;6120:						bs->currentEnemy->client->ps.duelTime > level.time &&
;6121:						!bs->cur_ps.duelInProgress)
;6122:					{
line 6123
;6123:						Cmd_EngageDuel_f(&g_entities[bs->client]);
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_EngageDuel_f
CALLV
pop
line 6124
;6124:					}
LABELV $2521
line 6125
;6125:				}
LABELV $2520
line 6127
;6126:
;6127:				bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6128
;6128:				bs->doAltAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 0
ASGNI4
line 6129
;6129:				bs->botChallengingTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2740
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 6130
;6130:				bs->beStill = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 6131
;6131:			}
LABELV $2517
line 6132
;6132:		}
LABELV $2512
line 6133
;6133:	}
LABELV $2509
line 6137
;6134:	//Apparently this "allows you to cheese" when fighting against bots. I'm not sure why you'd want to con bots
;6135:	//into an easy kill, since they're bots and all. But whatever.
;6136:
;6137:	if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2526
line 6138
;6138:	{
line 6139
;6139:		wp = GetNearestVisibleWP(bs->origin, bs->client);
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 248
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 252
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 252
INDIRI4
ASGNI4
line 6141
;6140:
;6141:		if (wp != -1)
ADDRLP4 144
INDIRI4
CNSTI4 -1
EQI4 $2528
line 6142
;6142:		{
line 6143
;6143:			bs->wpCurrent = gWPArray[wp];
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 6144
;6144:			bs->wpSeenTime = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 1972
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
CVIF4 4
ASGNF4
line 6145
;6145:			bs->wpTravelTime = level.time + 10000; //never take more than 10 seconds to travel to a waypoint
ADDRFP4 0
INDIRP4
CNSTI4 1976
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 6146
;6146:		}
LABELV $2528
line 6147
;6147:	}
LABELV $2526
line 6149
;6148:
;6149:	if (bs->enemySeenTime < level.time || !bs->frame_Enemy_Vis || !bs->currentEnemy ||
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
CNSTI4 1996
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LTF4 $2537
ADDRLP4 248
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2537
ADDRLP4 252
ADDRLP4 248
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 256
CNSTU4 0
ASGNU4
ADDRLP4 252
INDIRU4
ADDRLP4 256
INDIRU4
EQU4 $2537
ADDRLP4 252
INDIRU4
ADDRLP4 256
INDIRU4
EQU4 $2532
LABELV $2537
line 6151
;6150:		(bs->currentEnemy /*&& bs->cur_ps.weapon == WP_SABER && bs->frame_Enemy_Len > 300*/))
;6151:	{
line 6152
;6152:		enemy = ScanForEnemies(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 ScanForEnemies
CALLI4
ASGNI4
ADDRLP4 148
ADDRLP4 260
INDIRI4
ASGNI4
line 6154
;6153:
;6154:		if (enemy != -1)
ADDRLP4 148
INDIRI4
CNSTI4 -1
EQI4 $2538
line 6155
;6155:		{
line 6156
;6156:			bs->currentEnemy = &g_entities[enemy];
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTI4 852
ADDRLP4 148
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 6157
;6157:			bs->enemySeenTime = level.time + ENEMY_FORGET_MS;
ADDRFP4 0
INDIRP4
CNSTI4 1996
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 6158
;6158:		}
LABELV $2538
line 6159
;6159:	}
LABELV $2532
line 6161
;6160:
;6161:	if (!bs->squadLeader && !bs->isSquadLeader)
ADDRLP4 260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2541
ADDRLP4 260
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2541
line 6162
;6162:	{
line 6163
;6163:		BotScanForLeader(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotScanForLeader
CALLV
pop
line 6164
;6164:	}
LABELV $2541
line 6166
;6165:
;6166:	if (!bs->squadLeader && bs->squadCannotLead < level.time)
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2543
ADDRLP4 264
INDIRP4
CNSTI4 1876
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $2543
line 6167
;6167:	{ //if still no leader after scanning, then become a squad leader
line 6168
;6168:		bs->isSquadLeader = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1868
ADDP4
CNSTI4 1
ASGNI4
line 6169
;6169:	}
LABELV $2543
line 6171
;6170:
;6171:	if (bs->isSquadLeader && bs->squadLeader)
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 268
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2546
ADDRLP4 268
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2546
line 6172
;6172:	{ //we don't follow anyone if we are a leader
line 6173
;6173:		bs->squadLeader = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
CNSTP4 0
ASGNP4
line 6174
;6174:	}
LABELV $2546
line 6177
;6175:
;6176:	//ESTABLISH VISIBILITIES AND DISTANCES FOR THE WHOLE FRAME HERE
;6177:	if (bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2548
line 6178
;6178:	{
line 6179
;6179:		VectorSubtract(bs->wpCurrent->origin, bs->origin, a);
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
ADDRLP4 272
INDIRP4
CNSTI4 1884
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 276
INDIRP4
INDIRP4
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 276
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 280
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6180
;6180:		bs->frame_Waypoint_Len = VectorLength(a);
ADDRLP4 0
ARGP4
ADDRLP4 284
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2044
ADDP4
ADDRLP4 284
INDIRF4
ASGNF4
line 6182
;6181:
;6182:		visResult = WPOrgVisible(&g_entities[bs->client], bs->origin, bs->wpCurrent->origin, bs->client);
ADDRLP4 288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 292
ADDRLP4 288
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 852
ADDRLP4 292
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 288
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 288
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ARGP4
ADDRLP4 292
INDIRI4
ARGI4
ADDRLP4 296
ADDRGP4 WPOrgVisible
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 296
INDIRI4
ASGNI4
line 6184
;6183:
;6184:		if (visResult == 2)
ADDRLP4 100
INDIRI4
CNSTI4 2
NEI4 $2552
line 6185
;6185:		{
line 6186
;6186:			bs->frame_Waypoint_Vis = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2048
ADDP4
CNSTI4 0
ASGNI4
line 6187
;6187:			bs->wpSeenTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1972
ADDP4
CNSTF4 0
ASGNF4
line 6188
;6188:			bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 6189
;6189:			bs->wpDestIgnoreTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 1988
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
CVIF4 4
ASGNF4
line 6191
;6190:
;6191:			if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2555
line 6192
;6192:			{
line 6193
;6193:				bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 6194
;6194:			}
ADDRGP4 $2553
JUMPV
LABELV $2555
line 6196
;6195:			else
;6196:			{
line 6197
;6197:				bs->wpDirection = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 1
ASGNI4
line 6198
;6198:			}
line 6199
;6199:		}
ADDRGP4 $2553
JUMPV
LABELV $2552
line 6200
;6200:		else if (visResult)
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $2557
line 6201
;6201:		{
line 6202
;6202:			bs->frame_Waypoint_Vis = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2048
ADDP4
CNSTI4 1
ASGNI4
line 6203
;6203:		}
ADDRGP4 $2558
JUMPV
LABELV $2557
line 6205
;6204:		else
;6205:		{
line 6206
;6206:			bs->frame_Waypoint_Vis = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2048
ADDP4
CNSTI4 0
ASGNI4
line 6207
;6207:		}
LABELV $2558
LABELV $2553
line 6208
;6208:	}
LABELV $2548
line 6210
;6209:
;6210:	if (bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2559
line 6211
;6211:	{
line 6212
;6212:		if (bs->currentEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2561
line 6213
;6213:		{
line 6214
;6214:			VectorCopy(bs->currentEnemy->client->ps.origin, eorg);
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 6215
;6215:			eorg[2] += bs->currentEnemy->client->ps.viewheight;
ADDRLP4 56+8
ADDRLP4 56+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 6216
;6216:		}
ADDRGP4 $2562
JUMPV
LABELV $2561
line 6218
;6217:		else
;6218:		{
line 6219
;6219:			VectorCopy(bs->currentEnemy->s.origin, eorg);
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 6220
;6220:		}
LABELV $2562
line 6222
;6221:
;6222:		VectorSubtract(eorg, bs->eye, a);
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 56+4
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 56+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6223
;6223:		bs->frame_Enemy_Len = VectorLength(a);
ADDRLP4 0
ARGP4
ADDRLP4 276
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
ADDRLP4 276
INDIRF4
ASGNF4
line 6225
;6224:
;6225:		if (OrgVisible(bs->eye, eorg, bs->client))
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 280
INDIRP4
CNSTI4 1744
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 284
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
EQI4 $2568
line 6226
;6226:		{
line 6227
;6227:			bs->frame_Enemy_Vis = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2056
ADDP4
CNSTI4 1
ASGNI4
line 6228
;6228:			VectorCopy(eorg, bs->lastEnemySpotted);
ADDRFP4 0
INDIRP4
CNSTI4 1932
ADDP4
ADDRLP4 56
INDIRB
ASGNB 12
line 6229
;6229:			VectorCopy(bs->origin, bs->hereWhenSpotted);
ADDRLP4 288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 288
INDIRP4
CNSTI4 1944
ADDP4
ADDRLP4 288
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 6230
;6230:			bs->lastVisibleEnemyIndex = bs->currentEnemy->s.number;
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 1956
ADDP4
ADDRLP4 292
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
INDIRI4
ASGNI4
line 6232
;6231:			//VectorCopy(bs->eye, bs->lastEnemySpotted);
;6232:			bs->hitSpotted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1960
ADDP4
CNSTI4 0
ASGNI4
line 6233
;6233:		}
ADDRGP4 $2560
JUMPV
LABELV $2568
line 6235
;6234:		else
;6235:		{
line 6236
;6236:			bs->frame_Enemy_Vis = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2056
ADDP4
CNSTI4 0
ASGNI4
line 6237
;6237:		}
line 6238
;6238:	}
ADDRGP4 $2560
JUMPV
LABELV $2559
line 6240
;6239:	else
;6240:	{
line 6241
;6241:		bs->lastVisibleEnemyIndex = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 1956
ADDP4
CNSTI4 1023
ASGNI4
line 6242
;6242:	}
LABELV $2560
line 6245
;6243:	//END
;6244:
;6245:	if (bs->frame_Enemy_Vis)
ADDRFP4 0
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2570
line 6246
;6246:	{
line 6247
;6247:		bs->enemySeenTime = level.time + ENEMY_FORGET_MS;
ADDRFP4 0
INDIRP4
CNSTI4 1996
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 6248
;6248:	}
LABELV $2570
line 6250
;6249:
;6250:	if (bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2573
line 6251
;6251:	{
line 6252
;6252:		WPConstantRoutine(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WPConstantRoutine
CALLV
pop
line 6254
;6253:
;6254:		if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2575
line 6255
;6255:		{ //WPConstantRoutine has the ability to nullify the waypoint if it fails certain checks, so..
line 6256
;6256:			return;
ADDRGP4 $2336
JUMPV
LABELV $2575
line 6259
;6257:		}
;6258:
;6259:		if (bs->wpCurrent->flags & WPFLAG_WAITFORFUNC)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $2577
line 6260
;6260:		{
line 6261
;6261:			if (!CheckForFunc(bs->wpCurrent->origin, -1))
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 272
ADDRGP4 CheckForFunc
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $2579
line 6262
;6262:			{
line 6263
;6263:				bs->beStill = level.time + 500; //no func brush under.. wait
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
line 6264
;6264:			}
LABELV $2579
line 6265
;6265:		}
LABELV $2577
line 6266
;6266:		if (bs->wpCurrent->flags & WPFLAG_NOMOVEFUNC)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
CNSTI4 0
EQI4 $2582
line 6267
;6267:		{
line 6268
;6268:			if (CheckForFunc(bs->wpCurrent->origin, -1))
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 272
ADDRGP4 CheckForFunc
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $2584
line 6269
;6269:			{
line 6270
;6270:				bs->beStill = level.time + 500; //func brush under.. wait
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
line 6271
;6271:			}
LABELV $2584
line 6272
;6272:		}
LABELV $2582
line 6274
;6273:
;6274:		if (bs->frame_Waypoint_Vis || (bs->wpCurrent->flags & WPFLAG_NOVIS))
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
CNSTI4 0
ASGNI4
ADDRLP4 272
INDIRP4
CNSTI4 2048
ADDP4
INDIRI4
ADDRLP4 276
INDIRI4
NEI4 $2589
ADDRLP4 272
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
ADDRLP4 276
INDIRI4
EQI4 $2587
LABELV $2589
line 6275
;6275:		{
line 6276
;6276:			bs->wpSeenTime = level.time + 1500; //if we lose sight of the point, we have 1.5 seconds to regain it before we drop it
ADDRFP4 0
INDIRP4
CNSTI4 1972
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
CVIF4 4
ASGNF4
line 6277
;6277:		}
LABELV $2587
line 6278
;6278:		VectorCopy(bs->wpCurrent->origin, bs->goalPosition);
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 280
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 280
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
INDIRB
ASGNB 12
line 6279
;6279:		if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2591
line 6280
;6280:		{
line 6281
;6281:			goalWPIndex = bs->wpCurrent->index-1;
ADDRLP4 136
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 6282
;6282:		}
ADDRGP4 $2592
JUMPV
LABELV $2591
line 6284
;6283:		else
;6284:		{
line 6285
;6285:			goalWPIndex = bs->wpCurrent->index+1;
ADDRLP4 136
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6286
;6286:		}
LABELV $2592
line 6288
;6287:
;6288:		if (bs->wpCamping)
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2593
line 6289
;6289:		{
line 6290
;6290:			VectorSubtract(bs->wpCampingTo->origin, bs->origin, a);
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 288
ADDRLP4 284
INDIRP4
CNSTI4 2072
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 288
INDIRP4
INDIRP4
INDIRF4
ADDRLP4 284
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 288
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 284
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 292
INDIRP4
CNSTI4 2072
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 292
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6291
;6291:			vectoangles(a, ang);
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6292
;6292:			VectorCopy(ang, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 6294
;6293:
;6294:			VectorSubtract(bs->origin, bs->wpCamping->origin, a);
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 300
ADDRLP4 296
INDIRP4
CNSTI4 2068
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 296
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 300
INDIRP4
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 296
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 300
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 304
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 304
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 304
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6295
;6295:			if (VectorLength(a) < 64)
ADDRLP4 0
ARGP4
ADDRLP4 308
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 308
INDIRF4
CNSTF4 1115684864
GEF4 $2594
line 6296
;6296:			{
line 6297
;6297:				VectorCopy(bs->wpCamping->origin, bs->goalPosition);
ADDRLP4 312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 312
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 312
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
INDIRB
ASGNB 12
line 6298
;6298:				bs->beStill = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 6300
;6299:
;6300:				if (!bs->campStanding)
ADDRFP4 0
INDIRP4
CNSTI4 2076
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2594
line 6301
;6301:				{
line 6302
;6302:					bs->duckTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 2008
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 6303
;6303:				}
line 6304
;6304:			}
line 6305
;6305:		}
ADDRGP4 $2594
JUMPV
LABELV $2593
line 6306
;6306:		else if (gWPArray[goalWPIndex] && gWPArray[goalWPIndex]->inuse &&
ADDRLP4 284
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 284
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2605
ADDRLP4 288
CNSTI4 0
ASGNI4
ADDRLP4 284
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 288
INDIRI4
EQI4 $2605
ADDRGP4 gLevelFlags
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 288
INDIRI4
NEI4 $2605
line 6308
;6307:			!(gLevelFlags & LEVELFLAG_NOPOINTPREDICTION))
;6308:		{
line 6309
;6309:			VectorSubtract(gWPArray[goalWPIndex]->origin, bs->origin, a);
ADDRLP4 292
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
ASGNP4
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 292
INDIRP4
INDIRP4
INDIRF4
ADDRLP4 296
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 292
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 296
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6310
;6310:			vectoangles(a, ang);
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6311
;6311:			VectorCopy(ang, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 6312
;6312:		}
ADDRGP4 $2606
JUMPV
LABELV $2605
line 6314
;6313:		else
;6314:		{
line 6315
;6315:			VectorSubtract(bs->wpCurrent->origin, bs->origin, a);
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 296
ADDRLP4 292
INDIRP4
CNSTI4 1884
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 296
INDIRP4
INDIRP4
INDIRF4
ADDRLP4 292
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 296
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 292
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 300
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 300
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6316
;6316:			vectoangles(a, ang);
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6317
;6317:			VectorCopy(ang, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 6318
;6318:		}
LABELV $2606
LABELV $2594
line 6320
;6319:
;6320:		if (bs->destinationGrabTime < level.time /*&& (!bs->wpDestination || (bs->currentEnemy && bs->frame_Enemy_Vis))*/)
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2611
line 6321
;6321:		{
line 6322
;6322:			GetIdealDestination(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 GetIdealDestination
CALLV
pop
line 6323
;6323:		}
LABELV $2611
line 6325
;6324:		
;6325:		if (bs->wpCurrent && bs->wpDestination)
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 296
CNSTU4 0
ASGNU4
ADDRLP4 292
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 296
INDIRU4
EQU4 $2614
ADDRLP4 292
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 296
INDIRU4
EQU4 $2614
line 6326
;6326:		{
line 6327
;6327:			if (TotalTrailDistance(bs->wpCurrent->index, bs->wpDestination->index, bs) == -1)
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 304
CNSTI4 16
ASGNI4
ADDRLP4 300
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ADDRLP4 304
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 300
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ADDRLP4 304
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 300
INDIRP4
ARGP4
ADDRLP4 308
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 308
INDIRF4
CNSTF4 3212836864
NEF4 $2616
line 6328
;6328:			{
line 6329
;6329:				bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 6330
;6330:				bs->destinationGrabTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 6331
;6331:			}
LABELV $2616
line 6332
;6332:		}
LABELV $2614
line 6334
;6333:
;6334:		if (bs->frame_Waypoint_Len < BOT_WPTOUCH_DISTANCE)
ADDRFP4 0
INDIRP4
CNSTI4 2044
ADDP4
INDIRF4
CNSTF4 1107296256
GEF4 $2574
line 6335
;6335:		{
line 6336
;6336:			WPTouchRoutine(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WPTouchRoutine
CALLV
pop
line 6338
;6337:
;6338:			if (!bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2621
line 6339
;6339:			{
line 6340
;6340:				desiredIndex = bs->wpCurrent->index+1;
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6341
;6341:			}
ADDRGP4 $2622
JUMPV
LABELV $2621
line 6343
;6342:			else
;6343:			{
line 6344
;6344:				desiredIndex = bs->wpCurrent->index-1;
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 6345
;6345:			}
LABELV $2622
line 6347
;6346:
;6347:			if (gWPArray[desiredIndex] &&
ADDRLP4 300
ADDRLP4 120
INDIRI4
ASGNI4
ADDRLP4 304
ADDRLP4 300
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 304
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2623
ADDRLP4 308
CNSTI4 0
ASGNI4
ADDRLP4 304
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 308
INDIRI4
EQI4 $2623
ADDRLP4 300
INDIRI4
ADDRGP4 gWPNum
INDIRI4
GEI4 $2623
ADDRLP4 300
INDIRI4
ADDRLP4 308
INDIRI4
LTI4 $2623
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 300
INDIRI4
ARGI4
ADDRLP4 312
ADDRGP4 PassWayCheck
CALLI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $2623
line 6352
;6348:				gWPArray[desiredIndex]->inuse &&
;6349:				desiredIndex < gWPNum &&
;6350:				desiredIndex >= 0 &&
;6351:				PassWayCheck(bs, desiredIndex))
;6352:			{
line 6353
;6353:				bs->wpCurrent = gWPArray[desiredIndex];
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
ADDRLP4 120
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 6354
;6354:			}
ADDRGP4 $2574
JUMPV
LABELV $2623
line 6356
;6355:			else
;6356:			{
line 6357
;6357:				if (bs->wpDestination)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2625
line 6358
;6358:				{
line 6359
;6359:					bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 6360
;6360:					bs->destinationGrabTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 6361
;6361:				}
LABELV $2625
line 6363
;6362:
;6363:				if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2628
line 6364
;6364:				{
line 6365
;6365:					bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 6366
;6366:				}
ADDRGP4 $2574
JUMPV
LABELV $2628
line 6368
;6367:				else
;6368:				{
line 6369
;6369:					bs->wpDirection = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 1
ASGNI4
line 6370
;6370:				}
line 6371
;6371:			}
line 6372
;6372:		}
line 6373
;6373:	}
ADDRGP4 $2574
JUMPV
LABELV $2573
line 6375
;6374:	else //We can't find a waypoint, going to need a fallback routine.
;6375:	{
line 6377
;6376:		/*if (g_gametype.integer == GT_TOURNAMENT)*/
;6377:		{ //helps them get out of messy situations
line 6384
;6378:			/*if ((level.time - bs->forceJumpChargeTime) > 3500)
;6379:			{
;6380:				bs->forceJumpChargeTime = level.time + 2000;
;6381:				trap_EA_MoveForward(bs->client);
;6382:			}
;6383:			*/
;6384:			bs->jumpTime = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 2012
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
CVIF4 4
ASGNF4
line 6385
;6385:			bs->jumpHoldTime = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 2016
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
CVIF4 4
ASGNF4
line 6386
;6386:			bs->jDelay = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2028
ADDP4
CNSTF4 0
ASGNF4
line 6387
;6387:		}
line 6388
;6388:		doingFallback = BotFallbackNavigation(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 BotFallbackNavigation
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 272
INDIRI4
ASGNI4
line 6389
;6389:	}
LABELV $2574
line 6391
;6390:
;6391:	if (doingFallback)
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2632
line 6392
;6392:	{
line 6393
;6393:		bs->doingFallback = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 4804
ADDP4
CNSTI4 1
ASGNI4
line 6394
;6394:	}
ADDRGP4 $2633
JUMPV
LABELV $2632
line 6396
;6395:	else
;6396:	{
line 6397
;6397:		bs->doingFallback = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 4804
ADDP4
CNSTI4 0
ASGNI4
line 6398
;6398:	}
LABELV $2633
line 6400
;6399:
;6400:	if (bs->timeToReact < level.time && bs->currentEnemy && bs->enemySeenTime > level.time + (ENEMY_FORGET_MS - (ENEMY_FORGET_MS*0.2)))
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI4 1992
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2634
ADDRLP4 272
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2634
ADDRLP4 272
INDIRP4
CNSTI4 1996
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1174011904
ADDF4
LEF4 $2634
line 6401
;6401:	{
line 6402
;6402:		if (bs->frame_Enemy_Vis)
ADDRFP4 0
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2638
line 6403
;6403:		{
line 6404
;6404:			cBAI = CombatBotAI(bs, thinktime);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 276
ADDRGP4 CombatBotAI
CALLI4
ASGNI4
ADDRLP4 152
ADDRLP4 276
INDIRI4
ASGNI4
line 6405
;6405:		}
ADDRGP4 $2639
JUMPV
LABELV $2638
line 6406
;6406:		else if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT)
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2640
line 6407
;6407:		{ //keep charging in case we see him again before we lose track of him
line 6408
;6408:			bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 6409
;6409:		}
ADDRGP4 $2641
JUMPV
LABELV $2640
line 6410
;6410:		else if (bs->cur_ps.weaponstate == WEAPON_CHARGING)
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
NEI4 $2642
line 6411
;6411:		{ //keep charging in case we see him again before we lose track of him
line 6412
;6412:			bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 6413
;6413:		}
LABELV $2642
LABELV $2641
LABELV $2639
line 6415
;6414:
;6415:		if (bs->destinationGrabTime > level.time + 100)
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
LEF4 $2644
line 6416
;6416:		{
line 6417
;6417:			bs->destinationGrabTime = level.time + 100; //assures that we will continue staying within a general area of where we want to be in a combat situation
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 6418
;6418:		}
LABELV $2644
line 6420
;6419:
;6420:		if (bs->currentEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2648
line 6421
;6421:		{
line 6422
;6422:			VectorCopy(bs->currentEnemy->client->ps.origin, headlevel);
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 6423
;6423:			headlevel[2] += bs->currentEnemy->client->ps.viewheight;
ADDRLP4 108+8
ADDRLP4 108+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 6424
;6424:		}
ADDRGP4 $2649
JUMPV
LABELV $2648
line 6426
;6425:		else
;6426:		{
line 6427
;6427:			VectorCopy(bs->currentEnemy->client->ps.origin, headlevel);
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 6428
;6428:		}
LABELV $2649
line 6430
;6429:
;6430:		if (!bs->frame_Enemy_Vis)
ADDRFP4 0
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2651
line 6431
;6431:		{
line 6433
;6432:			//if (!bs->hitSpotted && VectorLength(a) > 256)
;6433:			if (OrgVisible(bs->eye, bs->lastEnemySpotted, -1))
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 1744
ADDP4
ARGP4
ADDRLP4 276
INDIRP4
CNSTI4 1932
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 280
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $2652
line 6434
;6434:			{
line 6435
;6435:				VectorCopy(bs->lastEnemySpotted, headlevel);
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 1932
ADDP4
INDIRB
ASGNB 12
line 6436
;6436:				VectorSubtract(headlevel, bs->eye, a);
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 108
INDIRF4
ADDRLP4 284
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 108+4
INDIRF4
ADDRLP4 284
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 108+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6437
;6437:				vectoangles(a, ang);
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6438
;6438:				VectorCopy(ang, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 6440
;6439:
;6440:				if (bs->cur_ps.weapon == WP_FLECHETTE &&
ADDRLP4 288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 288
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 9
NEI4 $2652
ADDRLP4 288
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2652
ADDRLP4 292
ADDRLP4 288
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 296
CNSTU4 0
ASGNU4
ADDRLP4 292
INDIRP4
CVPU4 4
ADDRLP4 296
INDIRU4
EQU4 $2652
ADDRLP4 292
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 296
INDIRU4
EQU4 $2652
line 6443
;6441:					bs->cur_ps.weaponstate == WEAPON_READY &&
;6442:					bs->currentEnemy && bs->currentEnemy->client)
;6443:				{
line 6444
;6444:					mLen = VectorLength(a) > 128;
ADDRLP4 0
ARGP4
ADDRLP4 304
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 304
INDIRF4
CNSTF4 1124073472
LEF4 $2662
ADDRLP4 300
CNSTI4 1
ASGNI4
ADDRGP4 $2663
JUMPV
LABELV $2662
ADDRLP4 300
CNSTI4 0
ASGNI4
LABELV $2663
ADDRLP4 164
ADDRLP4 300
INDIRI4
CVIF4 4
ASGNF4
line 6445
;6445:					if (mLen > 128 && mLen < 1024)
ADDRLP4 308
ADDRLP4 164
INDIRF4
ASGNF4
ADDRLP4 308
INDIRF4
CNSTF4 1124073472
LEF4 $2652
ADDRLP4 308
INDIRF4
CNSTF4 1149239296
GEF4 $2652
line 6446
;6446:					{
line 6447
;6447:						VectorSubtract(bs->currentEnemy->client->ps.origin, bs->lastEnemySpotted, a);
ADDRLP4 312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 316
ADDRLP4 312
INDIRP4
CNSTI4 1816
ADDP4
ASGNP4
ADDRLP4 320
CNSTI4 408
ASGNI4
ADDRLP4 0
ADDRLP4 316
INDIRP4
INDIRP4
ADDRLP4 320
INDIRI4
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 312
INDIRP4
CNSTI4 1932
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 316
INDIRP4
INDIRP4
ADDRLP4 320
INDIRI4
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 312
INDIRP4
CNSTI4 1936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 324
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 324
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 324
INDIRP4
CNSTI4 1940
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6449
;6448:
;6449:						if (VectorLength(a) < 300)
ADDRLP4 0
ARGP4
ADDRLP4 328
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 328
INDIRF4
CNSTF4 1133903872
GEF4 $2652
line 6450
;6450:						{
line 6451
;6451:							bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 6452
;6452:						}
line 6453
;6453:					}
line 6454
;6454:				}
line 6455
;6455:			}
line 6456
;6456:		}
ADDRGP4 $2652
JUMPV
LABELV $2651
line 6458
;6457:		else
;6458:		{
line 6459
;6459:			bLeadAmount = BotWeaponCanLead(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 276
ADDRGP4 BotWeaponCanLead
CALLF4
ASGNF4
ADDRLP4 160
ADDRLP4 276
INDIRF4
ASGNF4
line 6460
;6460:			if ((bs->skills.accuracy/bs->settings.skill) <= 8 &&
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 280
INDIRP4
CNSTI4 2320
ADDP4
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 1568
ADDP4
INDIRF4
DIVF4
CNSTF4 1090519040
GTF4 $2670
ADDRLP4 160
INDIRF4
CNSTF4 0
EQF4 $2670
line 6462
;6461:				bLeadAmount)
;6462:			{
line 6463
;6463:				BotAimLeading(bs, headlevel, bLeadAmount);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 160
INDIRF4
ARGF4
ADDRGP4 BotAimLeading
CALLV
pop
line 6464
;6464:			}
ADDRGP4 $2671
JUMPV
LABELV $2670
line 6466
;6465:			else
;6466:			{
line 6467
;6467:				VectorSubtract(headlevel, bs->eye, a);
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 108
INDIRF4
ADDRLP4 284
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 108+4
INDIRF4
ADDRLP4 284
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 108+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6468
;6468:				vectoangles(a, ang);
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6469
;6469:				VectorCopy(ang, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 6470
;6470:			}
LABELV $2671
line 6472
;6471:
;6472:			BotAimOffsetGoalAngles(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotAimOffsetGoalAngles
CALLV
pop
line 6473
;6473:		}
LABELV $2652
line 6474
;6474:	}
LABELV $2634
line 6476
;6475:
;6476:	if (bs->cur_ps.saberInFlight)
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2676
line 6477
;6477:	{
line 6478
;6478:		bs->saberThrowTime = level.time + Q_irand(4000, 10000);
CNSTI4 4000
ARGI4
CNSTI4 10000
ARGI4
ADDRLP4 276
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2728
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 276
INDIRI4
ADDI4
ASGNI4
line 6479
;6479:	}
LABELV $2676
line 6481
;6480:
;6481:	if (bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2679
line 6482
;6482:	{
line 6483
;6483:		if (BotGetWeaponRange(bs) == BWEAPONRANGE_SABER)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 276
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 4
NEI4 $2681
line 6484
;6484:		{
line 6485
;6485:			int saberRange = SABER_ATTACK_RANGE;
ADDRLP4 280
CNSTI4 128
ASGNI4
line 6487
;6486:
;6487:			VectorSubtract(bs->currentEnemy->client->ps.origin, bs->eye, a_fo);
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 288
ADDRLP4 284
INDIRP4
CNSTI4 1816
ADDP4
ASGNP4
ADDRLP4 292
CNSTI4 408
ASGNI4
ADDRLP4 20
ADDRLP4 288
INDIRP4
INDIRP4
ADDRLP4 292
INDIRI4
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 284
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 288
INDIRP4
INDIRP4
ADDRLP4 292
INDIRI4
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 284
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20+8
ADDRLP4 296
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 296
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6488
;6488:			vectoangles(a_fo, a_fo);
ADDRLP4 20
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6490
;6489:
;6490:			if (bs->saberPowerTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2736
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $2685
line 6491
;6491:			{ //Don't just use strong attacks constantly, switch around a bit
line 6492
;6492:				if (Q_irand(1, 10) <= 5)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 300
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 5
GTI4 $2688
line 6493
;6493:				{
line 6494
;6494:					bs->saberPower = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 2732
ADDP4
CNSTI4 1
ASGNI4
line 6495
;6495:				}
ADDRGP4 $2689
JUMPV
LABELV $2688
line 6497
;6496:				else
;6497:				{
line 6498
;6498:					bs->saberPower = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 2732
ADDP4
CNSTI4 0
ASGNI4
line 6499
;6499:				}
LABELV $2689
line 6501
;6500:
;6501:				bs->saberPowerTime = level.time + Q_irand(3000, 15000);
CNSTI4 3000
ARGI4
CNSTI4 15000
ARGI4
ADDRLP4 304
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2736
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 304
INDIRI4
ADDI4
ASGNI4
line 6502
;6502:			}
LABELV $2685
line 6504
;6503:
;6504:			if (bs->currentEnemy->health > 75 && g_entities[bs->client].client->ps.fd.forcePowerLevel[FP_SABERATTACK] > 2)
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 75
LEI4 $2691
CNSTI4 852
ADDRLP4 300
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 2
LEI4 $2691
line 6505
;6505:			{
line 6506
;6506:				if (g_entities[bs->client].client->ps.fd.saberAnimLevel != FORCE_LEVEL_3 && bs->saberPower)
ADDRLP4 304
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 852
ADDRLP4 304
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
EQI4 $2692
ADDRLP4 304
INDIRP4
CNSTI4 2732
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2692
line 6507
;6507:				{ //if we are up against someone with a lot of health and we have a strong attack available, then h4q them
line 6508
;6508:					Cmd_SaberAttackCycle_f(&g_entities[bs->client]);
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_SaberAttackCycle_f
CALLV
pop
line 6509
;6509:				}
line 6510
;6510:			}
ADDRGP4 $2692
JUMPV
LABELV $2691
line 6511
;6511:			else if (bs->currentEnemy->health > 40 && g_entities[bs->client].client->ps.fd.forcePowerLevel[FP_SABERATTACK] > 1)
ADDRLP4 304
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 304
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 40
LEI4 $2697
CNSTI4 852
ADDRLP4 304
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2697
line 6512
;6512:			{
line 6513
;6513:				if (g_entities[bs->client].client->ps.fd.saberAnimLevel != FORCE_LEVEL_2)
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 2
EQI4 $2698
line 6514
;6514:				{ //they're down on health a little, use level 2 if we can
line 6515
;6515:					Cmd_SaberAttackCycle_f(&g_entities[bs->client]);
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_SaberAttackCycle_f
CALLV
pop
line 6516
;6516:				}
line 6517
;6517:			}
ADDRGP4 $2698
JUMPV
LABELV $2697
line 6519
;6518:			else
;6519:			{
line 6520
;6520:				if (g_entities[bs->client].client->ps.fd.saberAnimLevel != FORCE_LEVEL_1)
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 1
EQI4 $2703
line 6521
;6521:				{ //they've gone below 40 health, go at them with quick attacks
line 6522
;6522:					Cmd_SaberAttackCycle_f(&g_entities[bs->client]);
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_SaberAttackCycle_f
CALLV
pop
line 6523
;6523:				}
LABELV $2703
line 6524
;6524:			}
LABELV $2698
LABELV $2692
line 6526
;6525:
;6526:			if (g_gametype.integer == GT_SINGLE_PLAYER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $2706
line 6527
;6527:			{
line 6528
;6528:				saberRange *= 3;
ADDRLP4 280
CNSTI4 3
ADDRLP4 280
INDIRI4
MULI4
ASGNI4
line 6529
;6529:			}
LABELV $2706
line 6531
;6530:
;6531:			if (bs->frame_Enemy_Len <= saberRange)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ADDRLP4 280
INDIRI4
CVIF4 4
GTF4 $2709
line 6532
;6532:			{
line 6533
;6533:				SaberCombatHandling(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SaberCombatHandling
CALLV
pop
line 6535
;6534:
;6535:				if (bs->frame_Enemy_Len < 80)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1117782016
GEF4 $2682
line 6536
;6536:				{
line 6537
;6537:					meleestrafe = 1;
ADDRLP4 92
CNSTI4 1
ASGNI4
line 6538
;6538:				}
line 6539
;6539:			}
ADDRGP4 $2682
JUMPV
LABELV $2709
line 6540
;6540:			else if (bs->saberThrowTime < level.time && !bs->cur_ps.saberInFlight &&
ADDRLP4 308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 308
INDIRP4
CNSTI4 2728
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $2713
ADDRLP4 312
CNSTI4 0
ASGNI4
ADDRLP4 308
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ADDRLP4 312
INDIRI4
NEI4 $2713
ADDRLP4 308
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
ADDRLP4 312
INDIRI4
EQI4 $2713
ADDRLP4 308
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1106247680
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 316
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 316
INDIRI4
CNSTI4 0
EQI4 $2713
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1145569280
GEF4 $2713
line 6544
;6541:				(bs->cur_ps.fd.forcePowersKnown & (1 << FP_SABERTHROW)) &&
;6542:				InFieldOfVision(bs->viewangles, 30, a_fo) &&
;6543:				bs->frame_Enemy_Len < BOT_SABER_THROW_RANGE)
;6544:			{
line 6545
;6545:				bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 6546
;6546:				bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6547
;6547:			}
ADDRGP4 $2682
JUMPV
LABELV $2713
line 6548
;6548:			else if (bs->cur_ps.saberInFlight && bs->frame_Enemy_Len > 300 && bs->frame_Enemy_Len < BOT_SABER_THROW_RANGE)
ADDRLP4 320
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 320
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2682
ADDRLP4 324
ADDRLP4 320
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ASGNF4
ADDRLP4 324
INDIRF4
CNSTF4 1133903872
LEF4 $2682
ADDRLP4 324
INDIRF4
CNSTF4 1145569280
GEF4 $2682
line 6549
;6549:			{
line 6550
;6550:				bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 6551
;6551:				bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6552
;6552:			}
line 6553
;6553:		}
ADDRGP4 $2682
JUMPV
LABELV $2681
line 6554
;6554:		else if (BotGetWeaponRange(bs) == BWEAPONRANGE_MELEE)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 1
NEI4 $2718
line 6555
;6555:		{
line 6556
;6556:			if (bs->frame_Enemy_Len <= MELEE_ATTACK_RANGE)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132462080
GTF4 $2720
line 6557
;6557:			{
line 6558
;6558:				MeleeCombatHandling(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MeleeCombatHandling
CALLV
pop
line 6559
;6559:				meleestrafe = 1;
ADDRLP4 92
CNSTI4 1
ASGNI4
line 6560
;6560:			}
LABELV $2720
line 6561
;6561:		}
LABELV $2718
LABELV $2682
line 6562
;6562:	}
LABELV $2679
line 6564
;6563:
;6564:	if (doingFallback && bs->currentEnemy) //just stand and fire if we have no idea where we are
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2722
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2722
line 6565
;6565:	{
line 6566
;6566:		VectorCopy(bs->origin, bs->goalPosition);
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 276
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 6567
;6567:	}
LABELV $2722
line 6569
;6568:
;6569:	if (bs->forceJumping > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2024
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2724
line 6570
;6570:	{
line 6571
;6571:		VectorCopy(bs->origin, noz_x);
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 6572
;6572:		VectorCopy(bs->goalPosition, noz_y);
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
INDIRB
ASGNB 12
line 6574
;6573:
;6574:		noz_x[2] = noz_y[2];
ADDRLP4 36+8
ADDRLP4 68+8
INDIRF4
ASGNF4
line 6576
;6575:
;6576:		VectorSubtract(noz_x, noz_y, noz_x);
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRLP4 68
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 36+4
INDIRF4
ADDRLP4 68+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36+8
ADDRLP4 36+8
INDIRF4
ADDRLP4 68+8
INDIRF4
SUBF4
ASGNF4
line 6578
;6577:
;6578:		if (VectorLength(noz_x) < 32)
ADDRLP4 36
ARGP4
ADDRLP4 276
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 276
INDIRF4
CNSTF4 1107296256
GEF4 $2735
line 6579
;6579:		{
line 6580
;6580:			fjHalt = 1;
ADDRLP4 96
CNSTI4 1
ASGNI4
line 6581
;6581:		}
LABELV $2735
line 6582
;6582:	}
LABELV $2724
line 6584
;6583:
;6584:	if (bs->doChat && bs->chatTime > level.time && (!bs->currentEnemy || !bs->frame_Enemy_Vis))
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 280
CNSTI4 0
ASGNI4
ADDRLP4 276
INDIRP4
CNSTI4 2236
ADDP4
INDIRI4
ADDRLP4 280
INDIRI4
EQI4 $2737
ADDRLP4 276
INDIRP4
CNSTI4 2228
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2737
ADDRLP4 276
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2740
ADDRLP4 276
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 280
INDIRI4
NEI4 $2737
LABELV $2740
line 6585
;6585:	{
line 6586
;6586:		return;
ADDRGP4 $2336
JUMPV
LABELV $2737
line 6588
;6587:	}
;6588:	else if (bs->doChat && bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 288
CNSTI4 0
ASGNI4
ADDRLP4 284
INDIRP4
CNSTI4 2236
ADDP4
INDIRI4
ADDRLP4 288
INDIRI4
EQI4 $2741
ADDRLP4 284
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2741
ADDRLP4 284
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 288
INDIRI4
EQI4 $2741
line 6589
;6589:	{
line 6591
;6590:		//bs->chatTime = level.time + bs->chatTime_stored;
;6591:		bs->doChat = 0; //do we want to keep the bot waiting to chat until after the enemy is gone?
ADDRFP4 0
INDIRP4
CNSTI4 2236
ADDP4
CNSTI4 0
ASGNI4
line 6592
;6592:		bs->chatTeam = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2240
ADDP4
CNSTI4 0
ASGNI4
line 6593
;6593:	}
ADDRGP4 $2742
JUMPV
LABELV $2741
line 6594
;6594:	else if (bs->doChat && bs->chatTime <= level.time)
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 2236
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2743
ADDRLP4 292
INDIRP4
CNSTI4 2228
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GTF4 $2743
line 6595
;6595:	{
line 6596
;6596:		if (bs->chatTeam)
ADDRFP4 0
INDIRP4
CNSTI4 2240
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2746
line 6597
;6597:		{
line 6598
;6598:			trap_EA_SayTeam(bs->client, bs->currentChat);
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 296
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 2100
ADDP4
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 6599
;6599:			bs->chatTeam = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2240
ADDP4
CNSTI4 0
ASGNI4
line 6600
;6600:		}
ADDRGP4 $2747
JUMPV
LABELV $2746
line 6602
;6601:		else
;6602:		{
line 6603
;6603:			trap_EA_Say(bs->client, bs->currentChat);
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 296
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 2100
ADDP4
ARGP4
ADDRGP4 trap_EA_Say
CALLV
pop
line 6604
;6604:		}
LABELV $2747
line 6605
;6605:		if (bs->doChat == 2)
ADDRFP4 0
INDIRP4
CNSTI4 2236
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2748
line 6606
;6606:		{
line 6607
;6607:			BotReplyGreetings(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotReplyGreetings
CALLV
pop
line 6608
;6608:		}
LABELV $2748
line 6609
;6609:		bs->doChat = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2236
ADDP4
CNSTI4 0
ASGNI4
line 6610
;6610:	}
LABELV $2743
LABELV $2742
line 6612
;6611:
;6612:	CTFFlagMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CTFFlagMovement
CALLV
pop
line 6614
;6613:
;6614:	if (/*bs->wpDestination &&*/ bs->shootGoal &&
ADDRLP4 296
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 296
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2750
ADDRLP4 300
CNSTI4 0
ASGNI4
ADDRLP4 296
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 300
INDIRI4
LEI4 $2750
ADDRLP4 296
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 300
INDIRI4
EQI4 $2750
line 6617
;6615:		/*bs->wpDestination->associated_entity == bs->shootGoal->s.number &&*/
;6616:		bs->shootGoal->health > 0 && bs->shootGoal->takedamage)
;6617:	{
line 6618
;6618:		dif[0] = (bs->shootGoal->r.absmax[0]+bs->shootGoal->r.absmin[0])/2;
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80
ADDRLP4 304
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 304
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 6619
;6619:		dif[1] = (bs->shootGoal->r.absmax[1]+bs->shootGoal->r.absmin[1])/2;
ADDRLP4 308
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80+4
ADDRLP4 308
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 308
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 6620
;6620:		dif[2] = (bs->shootGoal->r.absmax[2]+bs->shootGoal->r.absmin[2])/2;
ADDRLP4 312
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80+8
ADDRLP4 312
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 312
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 6622
;6621:
;6622:		if (!bs->currentEnemy || bs->frame_Enemy_Len > 256)
ADDRLP4 316
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 316
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2756
ADDRLP4 316
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132462080
LEF4 $2754
LABELV $2756
line 6623
;6623:		{ //if someone is close then don't stop shooting them for this
line 6624
;6624:			VectorSubtract(dif, bs->eye, a);
ADDRLP4 320
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 80
INDIRF4
ADDRLP4 320
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 80+4
INDIRF4
ADDRLP4 320
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 80+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6625
;6625:			vectoangles(a, a);
ADDRLP4 0
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6626
;6626:			VectorCopy(a, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 6628
;6627:
;6628:			if (InFieldOfVision(bs->viewangles, 30, a) &&
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1106247680
ARGF4
ADDRLP4 0
ARGP4
ADDRLP4 324
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 0
EQI4 $2761
ADDRLP4 328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 328
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 332
CNSTP4 0
ASGNP4
ADDRLP4 332
INDIRP4
ARGP4
ADDRLP4 332
INDIRP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 328
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 328
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 336
ADDRGP4 EntityVisibleBox
CALLI4
ASGNI4
ADDRLP4 336
INDIRI4
CNSTI4 0
EQI4 $2761
line 6630
;6629:				EntityVisibleBox(bs->origin, NULL, NULL, dif, bs->client, bs->shootGoal->s.number))
;6630:			{
line 6631
;6631:				bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 6632
;6632:			}
LABELV $2761
line 6633
;6633:		}
LABELV $2754
line 6634
;6634:	}
LABELV $2750
line 6636
;6635:
;6636:	if (bs->cur_ps.hasDetPackPlanted)
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2763
line 6637
;6637:	{ //check if our enemy gets near it and detonate if he does
line 6638
;6638:		BotCheckDetPacks(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckDetPacks
CALLV
pop
line 6639
;6639:	}
ADDRGP4 $2764
JUMPV
LABELV $2763
line 6640
;6640:	else if (bs->currentEnemy && bs->lastVisibleEnemyIndex == bs->currentEnemy->s.number && !bs->frame_Enemy_Vis && bs->plantTime < level.time &&
ADDRLP4 304
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 308
ADDRLP4 304
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 308
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2765
ADDRLP4 304
INDIRP4
CNSTI4 1956
ADDP4
INDIRI4
ADDRLP4 308
INDIRP4
INDIRI4
NEI4 $2765
ADDRLP4 312
CNSTI4 0
ASGNI4
ADDRLP4 304
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 312
INDIRI4
NEI4 $2765
ADDRLP4 304
INDIRP4
CNSTI4 2292
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $2765
ADDRLP4 304
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
ADDRLP4 312
INDIRI4
NEI4 $2765
ADDRLP4 304
INDIRP4
CNSTI4 2280
ADDP4
INDIRI4
ADDRLP4 312
INDIRI4
NEI4 $2765
line 6642
;6641:		!bs->doAttack && !bs->doAltAttack)
;6642:	{
line 6643
;6643:		VectorSubtract(bs->origin, bs->hereWhenSpotted, a);
ADDRLP4 316
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 316
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 316
INDIRP4
CNSTI4 1944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 316
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 316
INDIRP4
CNSTI4 1948
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 320
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 320
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 320
INDIRP4
CNSTI4 1952
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6645
;6644:
;6645:		if (bs->plantDecided > level.time || (bs->frame_Enemy_Len < BOT_PLANT_DISTANCE*2 && VectorLength(a) < BOT_PLANT_DISTANCE))
ADDRLP4 324
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 324
INDIRP4
CNSTI4 2296
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GTI4 $2773
ADDRLP4 324
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1140850688
GEF4 $2766
ADDRLP4 0
ARGP4
ADDRLP4 328
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 328
INDIRF4
CNSTF4 1132462080
GEF4 $2766
LABELV $2773
line 6646
;6646:		{
line 6647
;6647:			mineSelect = BotSelectChoiceWeapon(bs, WP_TRIP_MINE, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 332
ADDRGP4 BotSelectChoiceWeapon
CALLI4
ASGNI4
ADDRLP4 156
ADDRLP4 332
INDIRI4
ASGNI4
line 6648
;6648:			detSelect = BotSelectChoiceWeapon(bs, WP_DET_PACK, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 336
ADDRGP4 BotSelectChoiceWeapon
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 336
INDIRI4
ASGNI4
line 6649
;6649:			if (bs->cur_ps.hasDetPackPlanted)
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2774
line 6650
;6650:			{
line 6651
;6651:				detSelect = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 6652
;6652:			}
LABELV $2774
line 6654
;6653:
;6654:			if (bs->plantDecided > level.time && bs->forceWeaponSelect &&
ADDRLP4 340
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 340
INDIRP4
CNSTI4 2296
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2776
ADDRLP4 344
ADDRLP4 340
INDIRP4
CNSTI4 2284
ADDP4
INDIRI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $2776
ADDRLP4 340
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 344
INDIRI4
NEI4 $2776
line 6656
;6655:				bs->cur_ps.weapon == bs->forceWeaponSelect)
;6656:			{
line 6657
;6657:				bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 6658
;6658:				bs->plantDecided = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2296
ADDP4
CNSTI4 0
ASGNI4
line 6659
;6659:				bs->plantTime = level.time + BOT_PLANT_INTERVAL;
ADDRFP4 0
INDIRP4
CNSTI4 2292
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 15000
ADDI4
ASGNI4
line 6660
;6660:				bs->plantContinue = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 2300
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 6661
;6661:				bs->beStill = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
line 6662
;6662:			}
ADDRGP4 $2766
JUMPV
LABELV $2776
line 6663
;6663:			else if (mineSelect || detSelect)
ADDRLP4 348
CNSTI4 0
ASGNI4
ADDRLP4 156
INDIRI4
ADDRLP4 348
INDIRI4
NEI4 $2784
ADDRLP4 140
INDIRI4
ADDRLP4 348
INDIRI4
EQI4 $2766
LABELV $2784
line 6664
;6664:			{
line 6665
;6665:				if (BotSurfaceNear(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 352
ADDRGP4 BotSurfaceNear
CALLI4
ASGNI4
ADDRLP4 352
INDIRI4
CNSTI4 0
EQI4 $2766
line 6666
;6666:				{
line 6667
;6667:					if (!mineSelect)
ADDRLP4 156
INDIRI4
CNSTI4 0
NEI4 $2787
line 6668
;6668:					{ //if no mines use detpacks, otherwise use mines
line 6669
;6669:						mineSelect = WP_DET_PACK;
ADDRLP4 156
CNSTI4 13
ASGNI4
line 6670
;6670:					}
ADDRGP4 $2788
JUMPV
LABELV $2787
line 6672
;6671:					else
;6672:					{
line 6673
;6673:						mineSelect = WP_TRIP_MINE;
ADDRLP4 156
CNSTI4 12
ASGNI4
line 6674
;6674:					}
LABELV $2788
line 6676
;6675:
;6676:					detSelect = BotSelectChoiceWeapon(bs, mineSelect, 1);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 356
ADDRGP4 BotSelectChoiceWeapon
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 356
INDIRI4
ASGNI4
line 6678
;6677:
;6678:					if (detSelect && detSelect != 2)
ADDRLP4 360
ADDRLP4 140
INDIRI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
EQI4 $2789
ADDRLP4 360
INDIRI4
CNSTI4 2
EQI4 $2789
line 6679
;6679:					{ //We have it and it is now our weapon
line 6680
;6680:						bs->plantDecided = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 2296
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 6681
;6681:						bs->forceWeaponSelect = mineSelect;
ADDRFP4 0
INDIRP4
CNSTI4 2284
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 6682
;6682:						return;
ADDRGP4 $2336
JUMPV
LABELV $2789
line 6684
;6683:					}
;6684:					else if (detSelect == 2)
ADDRLP4 140
INDIRI4
CNSTI4 2
NEI4 $2766
line 6685
;6685:					{
line 6686
;6686:						bs->forceWeaponSelect = mineSelect;
ADDRFP4 0
INDIRP4
CNSTI4 2284
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 6687
;6687:						return;
ADDRGP4 $2336
JUMPV
line 6689
;6688:					}
;6689:				}
line 6690
;6690:			}
line 6691
;6691:		}
line 6692
;6692:	}
LABELV $2765
line 6693
;6693:	else if (bs->plantContinue < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2300
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $2794
line 6694
;6694:	{
line 6695
;6695:		bs->forceWeaponSelect = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2284
ADDP4
CNSTI4 0
ASGNI4
line 6696
;6696:	}
LABELV $2794
LABELV $2766
LABELV $2764
line 6698
;6697:
;6698:	if (g_gametype.integer == GT_JEDIMASTER && !bs->cur_ps.isJediMaster && bs->jmState == -1 && gJMSaberEnt && gJMSaberEnt->inuse)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $2797
ADDRLP4 316
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 320
CNSTI4 0
ASGNI4
ADDRLP4 316
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ADDRLP4 320
INDIRI4
NEI4 $2797
ADDRLP4 316
INDIRP4
CNSTI4 2700
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $2797
ADDRLP4 324
ADDRGP4 gJMSaberEnt
INDIRP4
ASGNP4
ADDRLP4 324
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2797
ADDRLP4 324
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 320
INDIRI4
EQI4 $2797
line 6699
;6699:	{
line 6701
;6700:		vec3_t saberLen;
;6701:		float fSaberLen = 0;
ADDRLP4 340
CNSTF4 0
ASGNF4
line 6703
;6702:
;6703:		VectorSubtract(bs->origin, gJMSaberEnt->r.currentOrigin, saberLen);
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
ADDRGP4 gJMSaberEnt
INDIRP4
ASGNP4
ADDRLP4 328
ADDRLP4 344
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 348
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 328+4
ADDRLP4 344
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 348
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 328+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRGP4 gJMSaberEnt
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6704
;6704:		fSaberLen = VectorLength(saberLen);
ADDRLP4 328
ARGP4
ADDRLP4 352
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 340
ADDRLP4 352
INDIRF4
ASGNF4
line 6706
;6705:
;6706:		if (fSaberLen < 256)
ADDRLP4 340
INDIRF4
CNSTF4 1132462080
GEF4 $2802
line 6707
;6707:		{
line 6708
;6708:			if (OrgVisible(bs->origin, gJMSaberEnt->r.currentOrigin, bs->client))
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 356
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRGP4 gJMSaberEnt
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 356
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 360
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
EQI4 $2804
line 6709
;6709:			{
line 6710
;6710:				VectorCopy(gJMSaberEnt->r.currentOrigin, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRGP4 gJMSaberEnt
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 6711
;6711:			}
LABELV $2804
line 6712
;6712:		}
LABELV $2802
line 6713
;6713:	}
LABELV $2797
line 6715
;6714:
;6715:	if (bs->beStill < level.time && !WaitingForNow(bs, bs->goalPosition) && !fjHalt)
ADDRLP4 328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 328
INDIRP4
CNSTI4 2004
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2806
ADDRLP4 328
INDIRP4
ARGP4
ADDRLP4 328
INDIRP4
CNSTI4 1920
ADDP4
ARGP4
ADDRLP4 332
ADDRGP4 WaitingForNow
CALLI4
ASGNI4
ADDRLP4 336
CNSTI4 0
ASGNI4
ADDRLP4 332
INDIRI4
ADDRLP4 336
INDIRI4
NEI4 $2806
ADDRLP4 96
INDIRI4
ADDRLP4 336
INDIRI4
NEI4 $2806
line 6716
;6716:	{
line 6717
;6717:		VectorSubtract(bs->goalPosition, bs->origin, bs->goalMovedir);
ADDRLP4 340
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 340
INDIRP4
CNSTI4 1908
ADDP4
ADDRLP4 340
INDIRP4
CNSTI4 1920
ADDP4
INDIRF4
ADDRLP4 340
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
CNSTI4 1912
ADDP4
ADDRLP4 344
INDIRP4
CNSTI4 1924
ADDP4
INDIRF4
ADDRLP4 344
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
CNSTI4 1916
ADDP4
ADDRLP4 348
INDIRP4
CNSTI4 1928
ADDP4
INDIRF4
ADDRLP4 348
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6718
;6718:		VectorNormalize(bs->goalMovedir);
ADDRFP4 0
INDIRP4
CNSTI4 1908
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 6720
;6719:
;6720:		if (bs->jumpTime > level.time && bs->jDelay < level.time &&
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTI4 2012
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2809
ADDRLP4 352
INDIRP4
CNSTI4 2028
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2809
CNSTI4 3024
ADDRLP4 352
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1410
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $2809
line 6722
;6721:			level.clients[bs->client].pers.cmd.upmove > 0)
;6722:		{
line 6724
;6723:		//	trap_EA_Move(bs->client, bs->origin, 5000);
;6724:			bs->beStill = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
CVIF4 4
ASGNF4
line 6725
;6725:		}
ADDRGP4 $2810
JUMPV
LABELV $2809
line 6727
;6726:		else
;6727:		{
line 6728
;6728:			trap_EA_Move(bs->client, bs->goalMovedir, 5000);
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 356
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 356
INDIRP4
CNSTI4 1908
ADDP4
ARGP4
CNSTF4 1167867904
ARGF4
ADDRGP4 trap_EA_Move
CALLV
pop
line 6729
;6729:		}
LABELV $2810
line 6731
;6730:
;6731:		if (meleestrafe)
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $2814
line 6732
;6732:		{
line 6733
;6733:			StrafeTracing(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 StrafeTracing
CALLV
pop
line 6734
;6734:		}
LABELV $2814
line 6736
;6735:
;6736:		if (bs->meleeStrafeDir && meleestrafe && bs->meleeStrafeDisable < level.time)
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 360
CNSTI4 0
ASGNI4
ADDRLP4 356
INDIRP4
CNSTI4 2256
ADDP4
INDIRI4
ADDRLP4 360
INDIRI4
EQI4 $2816
ADDRLP4 92
INDIRI4
ADDRLP4 360
INDIRI4
EQI4 $2816
ADDRLP4 356
INDIRP4
CNSTI4 2260
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2816
line 6737
;6737:		{
line 6738
;6738:			trap_EA_MoveRight(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_MoveRight
CALLV
pop
line 6739
;6739:		}
ADDRGP4 $2817
JUMPV
LABELV $2816
line 6740
;6740:		else if (meleestrafe && bs->meleeStrafeDisable < level.time)
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $2819
ADDRFP4 0
INDIRP4
CNSTI4 2260
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2819
line 6741
;6741:		{
line 6742
;6742:			trap_EA_MoveLeft(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_MoveLeft
CALLV
pop
line 6743
;6743:		}
LABELV $2819
LABELV $2817
line 6745
;6744:
;6745:		if (BotTrace_Jump(bs, bs->goalPosition))
ADDRLP4 364
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRLP4 364
INDIRP4
CNSTI4 1920
ADDP4
ARGP4
ADDRLP4 368
ADDRGP4 BotTrace_Jump
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $2822
line 6746
;6746:		{
line 6747
;6747:			bs->jumpTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2012
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 6748
;6748:		}
ADDRGP4 $2823
JUMPV
LABELV $2822
line 6749
;6749:		else if (BotTrace_Duck(bs, bs->goalPosition))
ADDRLP4 372
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 372
INDIRP4
ARGP4
ADDRLP4 372
INDIRP4
CNSTI4 1920
ADDP4
ARGP4
ADDRLP4 376
ADDRGP4 BotTrace_Duck
CALLI4
ASGNI4
ADDRLP4 376
INDIRI4
CNSTI4 0
EQI4 $2825
line 6750
;6750:		{
line 6751
;6751:			bs->duckTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2008
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 6752
;6752:		}
ADDRGP4 $2826
JUMPV
LABELV $2825
line 6755
;6753:#ifdef BOT_STRAFE_AVOIDANCE
;6754:		else
;6755:		{
line 6756
;6756:			int strafeAround = BotTrace_Strafe(bs, bs->goalPosition);
ADDRLP4 384
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 384
INDIRP4
ARGP4
ADDRLP4 384
INDIRP4
CNSTI4 1920
ADDP4
ARGP4
ADDRLP4 388
ADDRGP4 BotTrace_Strafe
CALLI4
ASGNI4
ADDRLP4 380
ADDRLP4 388
INDIRI4
ASGNI4
line 6758
;6757:
;6758:			if (strafeAround == STRAFEAROUND_RIGHT)
ADDRLP4 380
INDIRI4
CNSTI4 1
NEI4 $2828
line 6759
;6759:			{
line 6760
;6760:				trap_EA_MoveRight(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_MoveRight
CALLV
pop
line 6761
;6761:			}
ADDRGP4 $2829
JUMPV
LABELV $2828
line 6762
;6762:			else if (strafeAround == STRAFEAROUND_LEFT)
ADDRLP4 380
INDIRI4
CNSTI4 2
NEI4 $2830
line 6763
;6763:			{
line 6764
;6764:				trap_EA_MoveLeft(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_MoveLeft
CALLV
pop
line 6765
;6765:			}
LABELV $2830
LABELV $2829
line 6766
;6766:		}
LABELV $2826
LABELV $2823
line 6768
;6767:#endif
;6768:	}
LABELV $2806
line 6771
;6769:
;6770:#ifndef FORCEJUMP_INSTANTMETHOD
;6771:	if (bs->forceJumpChargeTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2832
line 6772
;6772:	{
line 6773
;6773:		bs->jumpTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2012
ADDP4
CNSTF4 0
ASGNF4
line 6774
;6774:	}
LABELV $2832
line 6777
;6775:#endif
;6776:
;6777:	if (bs->jumpPrep > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2020
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2835
line 6778
;6778:	{
line 6779
;6779:		bs->forceJumpChargeTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
CNSTI4 0
ASGNI4
line 6780
;6780:	}
LABELV $2835
line 6782
;6781:
;6782:	if (bs->forceJumpChargeTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2838
line 6783
;6783:	{
line 6784
;6784:		bs->jumpHoldTime = ((bs->forceJumpChargeTime - level.time)/2) + level.time;
ADDRLP4 340
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 340
INDIRP4
CNSTI4 2016
ADDP4
ADDRLP4 340
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ADDRGP4 level+32
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 6785
;6785:		bs->forceJumpChargeTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
CNSTI4 0
ASGNI4
line 6786
;6786:	}
LABELV $2838
line 6788
;6787:
;6788:	if (bs->jumpHoldTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2016
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2843
line 6789
;6789:	{
line 6790
;6790:		bs->jumpTime = bs->jumpHoldTime;
ADDRLP4 340
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 340
INDIRP4
CNSTI4 2012
ADDP4
ADDRLP4 340
INDIRP4
CNSTI4 2016
ADDP4
INDIRF4
ASGNF4
line 6791
;6791:	}
LABELV $2843
line 6793
;6792:
;6793:	if (bs->jumpTime > level.time && bs->jDelay < level.time)
ADDRLP4 340
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 340
INDIRP4
CNSTI4 2012
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2846
ADDRLP4 340
INDIRP4
CNSTI4 2028
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $2846
line 6794
;6794:	{
line 6795
;6795:		if (bs->jumpHoldTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2016
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2850
line 6796
;6796:		{
line 6797
;6797:			trap_EA_Jump(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Jump
CALLV
pop
line 6798
;6798:			if (bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2853
line 6799
;6799:			{
line 6800
;6800:				if ((bs->wpCurrent->origin[2] - bs->origin[2]) < 64)
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 344
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
CNSTF4 1115684864
GEF4 $2854
line 6801
;6801:				{
line 6802
;6802:					trap_EA_MoveForward(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_MoveForward
CALLV
pop
line 6803
;6803:				}
line 6804
;6804:			}
ADDRGP4 $2854
JUMPV
LABELV $2853
line 6806
;6805:			else
;6806:			{
line 6807
;6807:				trap_EA_MoveForward(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_MoveForward
CALLV
pop
line 6808
;6808:			}
LABELV $2854
line 6809
;6809:			if (g_entities[bs->client].client->ps.groundEntityNum == ENTITYNUM_NONE)
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $2851
line 6810
;6810:			{
line 6811
;6811:				g_entities[bs->client].client->ps.pm_flags |= PMF_JUMP_HELD;
ADDRLP4 344
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 344
INDIRP4
ADDRLP4 344
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 6812
;6812:			}
line 6813
;6813:		}
ADDRGP4 $2851
JUMPV
LABELV $2850
line 6814
;6814:		else if (!(bs->cur_ps.pm_flags & PMF_JUMP_HELD))
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $2861
line 6815
;6815:		{
line 6816
;6816:			trap_EA_Jump(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Jump
CALLV
pop
line 6817
;6817:		}
LABELV $2861
LABELV $2851
line 6818
;6818:	}
LABELV $2846
line 6820
;6819:
;6820:	if (bs->duckTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2008
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $2863
line 6821
;6821:	{
line 6822
;6822:		trap_EA_Crouch(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Crouch
CALLV
pop
line 6823
;6823:	}
LABELV $2863
line 6825
;6824:
;6825:	if ( bs->dangerousObject && bs->dangerousObject->inuse && bs->dangerousObject->health > 0 &&
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
ADDRLP4 344
INDIRP4
CNSTI4 1848
ADDP4
INDIRP4
ASGNP4
ADDRLP4 352
CNSTU4 0
ASGNU4
ADDRLP4 348
INDIRP4
CVPU4 4
ADDRLP4 352
INDIRU4
EQU4 $2866
ADDRLP4 356
CNSTI4 0
ASGNI4
ADDRLP4 348
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 356
INDIRI4
EQI4 $2866
ADDRLP4 348
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 356
INDIRI4
LEI4 $2866
ADDRLP4 348
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 356
INDIRI4
EQI4 $2866
ADDRLP4 344
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 356
INDIRI4
EQI4 $2868
ADDRLP4 344
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 352
INDIRU4
NEU4 $2866
LABELV $2868
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 360
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 2
EQI4 $2869
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 364
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 364
INDIRI4
CNSTI4 3
NEI4 $2866
LABELV $2869
ADDRLP4 368
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 372
ADDRLP4 368
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 13
EQI4 $2866
ADDRLP4 372
INDIRI4
CNSTI4 12
EQI4 $2866
ADDRLP4 368
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2866
line 6830
;6826:		bs->dangerousObject->takedamage && (!bs->frame_Enemy_Vis || !bs->currentEnemy) &&
;6827:		(BotGetWeaponRange(bs) == BWEAPONRANGE_MID || BotGetWeaponRange(bs) == BWEAPONRANGE_LONG) &&
;6828:		bs->cur_ps.weapon != WP_DET_PACK && bs->cur_ps.weapon != WP_TRIP_MINE &&
;6829:		!bs->shootGoal )
;6830:	{
line 6833
;6831:		float danLen;
;6832:
;6833:		VectorSubtract(bs->dangerousObject->r.currentOrigin, bs->eye, a);
ADDRLP4 380
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 384
ADDRLP4 380
INDIRP4
CNSTI4 1848
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 384
INDIRP4
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 380
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 384
INDIRP4
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 380
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 388
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 388
INDIRP4
CNSTI4 1848
ADDP4
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 388
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6835
;6834:
;6835:		danLen = VectorLength(a);
ADDRLP4 0
ARGP4
ADDRLP4 392
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 376
ADDRLP4 392
INDIRF4
ASGNF4
line 6837
;6836:
;6837:		if (danLen > 256)
ADDRLP4 376
INDIRF4
CNSTF4 1132462080
LEF4 $2872
line 6838
;6838:		{
line 6839
;6839:			vectoangles(a, a);
ADDRLP4 0
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6840
;6840:			VectorCopy(a, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 6842
;6841:
;6842:			if (Q_irand(1, 10) < 5)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 396
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 396
INDIRI4
CNSTI4 5
GEI4 $2874
line 6843
;6843:			{
line 6844
;6844:				bs->goalAngles[YAW] += Q_irand(0, 3);
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 400
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 404
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
ASGNP4
ADDRLP4 404
INDIRP4
ADDRLP4 404
INDIRP4
INDIRF4
ADDRLP4 400
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 6845
;6845:				bs->goalAngles[PITCH] += Q_irand(0, 3);
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 408
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 412
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ASGNP4
ADDRLP4 412
INDIRP4
ADDRLP4 412
INDIRP4
INDIRF4
ADDRLP4 408
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 6846
;6846:			}
ADDRGP4 $2875
JUMPV
LABELV $2874
line 6848
;6847:			else
;6848:			{
line 6849
;6849:				bs->goalAngles[YAW] -= Q_irand(0, 3);
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 400
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 404
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
ASGNP4
ADDRLP4 404
INDIRP4
ADDRLP4 404
INDIRP4
INDIRF4
ADDRLP4 400
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 6850
;6850:				bs->goalAngles[PITCH] -= Q_irand(0, 3);
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 408
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 412
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ASGNP4
ADDRLP4 412
INDIRP4
ADDRLP4 412
INDIRP4
INDIRF4
ADDRLP4 408
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 6851
;6851:			}
LABELV $2875
line 6853
;6852:
;6853:			if (InFieldOfVision(bs->viewangles, 30, a) &&
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1106247680
ARGF4
ADDRLP4 0
ARGP4
ADDRLP4 400
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 400
INDIRI4
CNSTI4 0
EQI4 $2876
ADDRLP4 404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 404
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 408
CNSTP4 0
ASGNP4
ADDRLP4 408
INDIRP4
ARGP4
ADDRLP4 408
INDIRP4
ARGP4
ADDRLP4 412
ADDRLP4 404
INDIRP4
CNSTI4 1848
ADDP4
INDIRP4
ASGNP4
ADDRLP4 412
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 404
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
INDIRP4
INDIRI4
ARGI4
ADDRLP4 416
ADDRGP4 EntityVisibleBox
CALLI4
ASGNI4
ADDRLP4 416
INDIRI4
CNSTI4 0
EQI4 $2876
line 6855
;6854:				EntityVisibleBox(bs->origin, NULL, NULL, bs->dangerousObject->r.currentOrigin, bs->client, bs->dangerousObject->s.number))
;6855:			{
line 6856
;6856:				bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 6857
;6857:			}			
LABELV $2876
line 6858
;6858:		}
LABELV $2872
line 6859
;6859:	}
LABELV $2866
line 6861
;6860:
;6861:	if (PrimFiring(bs) ||
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 376
ADDRGP4 PrimFiring
CALLI4
ASGNI4
ADDRLP4 376
INDIRI4
CNSTI4 0
NEI4 $2880
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 380
ADDRGP4 AltFiring
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 0
EQI4 $2878
LABELV $2880
line 6863
;6862:		AltFiring(bs))
;6863:	{
line 6864
;6864:		friendInLOF = CheckForFriendInLOF(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 384
ADDRGP4 CheckForFriendInLOF
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 384
INDIRP4
ASGNP4
line 6866
;6865:
;6866:		if (friendInLOF)
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2879
line 6867
;6867:		{
line 6868
;6868:			if (PrimFiring(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 388
ADDRGP4 PrimFiring
CALLI4
ASGNI4
ADDRLP4 388
INDIRI4
CNSTI4 0
EQI4 $2883
line 6869
;6869:			{
line 6870
;6870:				KeepPrimFromFiring(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 KeepPrimFromFiring
CALLI4
pop
line 6871
;6871:			}
LABELV $2883
line 6872
;6872:			if (AltFiring(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 392
ADDRGP4 AltFiring
CALLI4
ASGNI4
ADDRLP4 392
INDIRI4
CNSTI4 0
EQI4 $2885
line 6873
;6873:			{
line 6874
;6874:				KeepAltFromFiring(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 KeepAltFromFiring
CALLI4
pop
line 6875
;6875:			}
LABELV $2885
line 6876
;6876:			if (useTheForce && forceHostile)
ADDRLP4 396
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 396
INDIRI4
EQI4 $2887
ADDRLP4 16
INDIRI4
ADDRLP4 396
INDIRI4
EQI4 $2887
line 6877
;6877:			{
line 6878
;6878:				useTheForce = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 6879
;6879:			}
LABELV $2887
line 6881
;6880:
;6881:			if (!useTheForce && friendInLOF->client)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2879
ADDRLP4 52
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2879
line 6882
;6882:			{ //we have a friend here and are not currently using force powers, see if we can help them out
line 6883
;6883:				if (friendInLOF->health <= 50 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_TEAM_HEAL]][FP_TEAM_HEAL])
ADDRLP4 52
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 50
GTI4 $2891
ADDRLP4 400
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 400
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 400
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+44
ADDP4
INDIRI4
LEI4 $2891
line 6884
;6884:				{
line 6885
;6885:					level.clients[bs->client].ps.fd.forcePowerSelected = FP_TEAM_HEAL;
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 11
ASGNI4
line 6886
;6886:					useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 6887
;6887:					forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 6888
;6888:				}
ADDRGP4 $2879
JUMPV
LABELV $2891
line 6889
;6889:				else if (friendInLOF->client->ps.fd.forcePower <= 50 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_TEAM_FORCE]][FP_TEAM_FORCE])
ADDRLP4 404
CNSTI4 932
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 404
INDIRI4
ADDP4
INDIRI4
CNSTI4 50
GTI4 $2879
ADDRLP4 408
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 408
INDIRP4
ADDRLP4 404
INDIRI4
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 408
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+48
ADDP4
INDIRI4
LEI4 $2879
line 6890
;6890:				{
line 6891
;6891:					level.clients[bs->client].ps.fd.forcePowerSelected = FP_TEAM_FORCE;
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 12
ASGNI4
line 6892
;6892:					useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 6893
;6893:					forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 6894
;6894:				}
line 6895
;6895:			}
line 6896
;6896:		}
line 6897
;6897:	}
ADDRGP4 $2879
JUMPV
LABELV $2878
line 6898
;6898:	else if (g_gametype.integer >= GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $2897
line 6899
;6899:	{ //still check for anyone to help..
line 6900
;6900:		friendInLOF = CheckForFriendInLOF(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 384
ADDRGP4 CheckForFriendInLOF
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 384
INDIRP4
ASGNP4
line 6902
;6901:
;6902:		if (!useTheForce && friendInLOF)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2900
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2900
line 6903
;6903:		{
line 6904
;6904:			if (friendInLOF->health <= 50 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_TEAM_HEAL]][FP_TEAM_HEAL])
ADDRLP4 52
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 50
GTI4 $2902
ADDRLP4 388
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 388
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 388
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+44
ADDP4
INDIRI4
LEI4 $2902
line 6905
;6905:			{
line 6906
;6906:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_TEAM_HEAL;
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 11
ASGNI4
line 6907
;6907:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 6908
;6908:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 6909
;6909:			}
ADDRGP4 $2903
JUMPV
LABELV $2902
line 6910
;6910:			else if (friendInLOF->client->ps.fd.forcePower <= 50 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_TEAM_FORCE]][FP_TEAM_FORCE])
ADDRLP4 392
CNSTI4 932
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 392
INDIRI4
ADDP4
INDIRI4
CNSTI4 50
GTI4 $2905
ADDRLP4 396
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 396
INDIRP4
ADDRLP4 392
INDIRI4
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 396
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+48
ADDP4
INDIRI4
LEI4 $2905
line 6911
;6911:			{
line 6912
;6912:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_TEAM_FORCE;
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 12
ASGNI4
line 6913
;6913:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 6914
;6914:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 6915
;6915:			}
LABELV $2905
LABELV $2903
line 6916
;6916:		}
LABELV $2900
line 6917
;6917:	}
LABELV $2897
LABELV $2879
line 6919
;6918:
;6919:	if (bs->doAttack && bs->cur_ps.weapon == WP_DET_PACK &&
ADDRLP4 384
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 388
CNSTI4 0
ASGNI4
ADDRLP4 384
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
ADDRLP4 388
INDIRI4
EQI4 $2908
ADDRLP4 384
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 13
NEI4 $2908
ADDRLP4 384
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
ADDRLP4 388
INDIRI4
EQI4 $2908
line 6921
;6920:		bs->cur_ps.hasDetPackPlanted)
;6921:	{ //maybe a bit hackish, but bots only want to plant one of these at any given time to avoid complications
line 6922
;6922:		bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6923
;6923:	}
LABELV $2908
line 6925
;6924:
;6925:	if (bs->doAttack && bs->cur_ps.weapon == WP_SABER &&
ADDRLP4 392
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 396
CNSTI4 0
ASGNI4
ADDRLP4 392
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
ADDRLP4 396
INDIRI4
EQI4 $2910
ADDRLP4 392
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2910
ADDRLP4 392
INDIRP4
CNSTI4 2708
ADDP4
INDIRI4
ADDRLP4 396
INDIRI4
EQI4 $2910
ADDRLP4 400
ADDRLP4 392
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 404
CNSTU4 0
ASGNU4
ADDRLP4 400
INDIRP4
CVPU4 4
ADDRLP4 404
INDIRU4
EQU4 $2910
ADDRLP4 408
ADDRLP4 400
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 408
INDIRP4
CVPU4 4
ADDRLP4 404
INDIRU4
EQU4 $2910
ADDRLP4 408
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ADDRGP4 BotWeaponBlockable
CALLI4
ASGNI4
ADDRLP4 412
INDIRI4
CNSTI4 0
EQI4 $2910
line 6928
;6926:		bs->saberDefending && bs->currentEnemy && bs->currentEnemy->client &&
;6927:		BotWeaponBlockable(bs->currentEnemy->client->ps.weapon) )
;6928:	{
line 6929
;6929:		bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6930
;6930:	}
LABELV $2910
line 6932
;6931:
;6932:	if (bs->cur_ps.saberLockTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2912
line 6933
;6933:	{
line 6934
;6934:		if (rand()%10 < 5)
ADDRLP4 416
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 416
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GEI4 $2915
line 6935
;6935:		{
line 6936
;6936:			bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 6937
;6937:		}
ADDRGP4 $2916
JUMPV
LABELV $2915
line 6939
;6938:		else
;6939:		{
line 6940
;6940:			bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6941
;6941:		}
LABELV $2916
line 6942
;6942:	}
LABELV $2912
line 6944
;6943:
;6944:	if (bs->botChallengingTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2740
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2917
line 6945
;6945:	{
line 6946
;6946:		bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6947
;6947:		bs->doAltAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 0
ASGNI4
line 6948
;6948:	}
LABELV $2917
line 6950
;6949:
;6950:	if (bs->doAttack)
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2920
line 6951
;6951:	{
line 6952
;6952:		trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 6953
;6953:	}
ADDRGP4 $2921
JUMPV
LABELV $2920
line 6954
;6954:	else if (bs->doAltAttack)
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2922
line 6955
;6955:	{
line 6956
;6956:		trap_EA_Alt_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Alt_Attack
CALLV
pop
line 6957
;6957:	}
LABELV $2922
LABELV $2921
line 6959
;6958:
;6959:	if (useTheForce && forceHostile && bs->botChallengingTime > level.time)
ADDRLP4 416
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 416
INDIRI4
EQI4 $2924
ADDRLP4 16
INDIRI4
ADDRLP4 416
INDIRI4
EQI4 $2924
ADDRFP4 0
INDIRP4
CNSTI4 2740
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2924
line 6960
;6960:	{
line 6961
;6961:		useTheForce = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 6962
;6962:	}
LABELV $2924
line 6964
;6963:
;6964:	if (useTheForce)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2927
line 6965
;6965:	{
line 6967
;6966:#ifndef FORCEJUMP_INSTANTMETHOD
;6967:		if (bs->forceJumpChargeTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $2929
line 6968
;6968:		{
line 6969
;6969:			level.clients[bs->client].ps.fd.forcePowerSelected = FP_LEVITATION;
CNSTI4 3024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 1
ASGNI4
line 6970
;6970:			trap_EA_ForcePower(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_ForcePower
CALLV
pop
line 6971
;6971:		}
ADDRGP4 $2930
JUMPV
LABELV $2929
line 6973
;6972:		else
;6973:		{
line 6975
;6974:#endif
;6975:			if (bot_forcepowers.integer && !g_forcePowerDisable.integer)
ADDRLP4 420
CNSTI4 0
ASGNI4
ADDRGP4 bot_forcepowers+12
INDIRI4
ADDRLP4 420
INDIRI4
EQI4 $2932
ADDRGP4 g_forcePowerDisable+12
INDIRI4
ADDRLP4 420
INDIRI4
NEI4 $2932
line 6976
;6976:			{
line 6977
;6977:				trap_EA_ForcePower(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_ForcePower
CALLV
pop
line 6978
;6978:			}
LABELV $2932
line 6980
;6979:#ifndef FORCEJUMP_INSTANTMETHOD
;6980:		}
LABELV $2930
line 6982
;6981:#endif
;6982:	}
LABELV $2927
line 6984
;6983:
;6984:	MoveTowardIdealAngles(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveTowardIdealAngles
CALLV
pop
line 6985
;6985:}
LABELV $2336
endproc StandardBotAI 424 24
bss
align 4
LABELV $2937
skip 4
align 4
LABELV $2938
skip 4
align 4
LABELV $2939
skip 4
export BotAIStartFrame
code
proc BotAIStartFrame 24 12
line 6993
;6986://end rww
;6987:
;6988:/*
;6989:==================
;6990:BotAIStartFrame
;6991:==================
;6992:*/
;6993:int BotAIStartFrame(int time) {
line 7000
;6994:	int i;
;6995:	int elapsed_time, thinktime;
;6996:	static int local_time;
;6997:	static int botlib_residual;
;6998:	static int lastbotthink_time;
;6999:
;7000:	G_CheckBotSpawn();
ADDRGP4 G_CheckBotSpawn
CALLV
pop
line 7003
;7001:
;7002:	//rww - addl bot frame functions
;7003:	if (gBotEdit)
ADDRGP4 gBotEdit
INDIRF4
CNSTF4 0
EQF4 $2940
line 7004
;7004:	{
line 7005
;7005:		trap_Cvar_Update(&bot_wp_info);
ADDRGP4 bot_wp_info
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 7006
;7006:		BotWaypointRender();
ADDRGP4 BotWaypointRender
CALLV
pop
line 7007
;7007:	}
LABELV $2940
line 7009
;7008:
;7009:	UpdateEventTracker();
ADDRGP4 UpdateEventTracker
CALLV
pop
line 7014
;7010:	//end rww
;7011:
;7012:	//cap the bot think time
;7013:	//if the bot think time changed we should reschedule the bots
;7014:	if (BOT_THINK_TIME != lastbotthink_time) {
ADDRGP4 $2939
INDIRI4
CNSTI4 0
EQI4 $2942
line 7015
;7015:		lastbotthink_time = BOT_THINK_TIME;
ADDRGP4 $2939
CNSTI4 0
ASGNI4
line 7016
;7016:		BotScheduleBotThink();
ADDRGP4 BotScheduleBotThink
CALLV
pop
line 7017
;7017:	}
LABELV $2942
line 7019
;7018:
;7019:	elapsed_time = time - local_time;
ADDRLP4 4
ADDRFP4 0
INDIRI4
ADDRGP4 $2937
INDIRI4
SUBI4
ASGNI4
line 7020
;7020:	local_time = time;
ADDRGP4 $2937
ADDRFP4 0
INDIRI4
ASGNI4
line 7022
;7021:
;7022:	if (elapsed_time > BOT_THINK_TIME) thinktime = elapsed_time;
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $2944
ADDRLP4 8
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $2945
JUMPV
LABELV $2944
line 7023
;7023:	else thinktime = BOT_THINK_TIME;
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $2945
line 7026
;7024:
;7025:	// execute scheduled bot AI
;7026:	for( i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2946
line 7027
;7027:		if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2952
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2950
LABELV $2952
line 7028
;7028:			continue;
ADDRGP4 $2947
JUMPV
LABELV $2950
line 7031
;7029:		}
;7030:		//
;7031:		botstates[i]->botthink_residual += elapsed_time;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 7033
;7032:		//
;7033:		if ( botstates[i]->botthink_residual >= thinktime ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $2953
line 7034
;7034:			botstates[i]->botthink_residual -= thinktime;
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 7036
;7035:
;7036:			if (g_entities[i].client->pers.connected == CON_CONNECTED) {
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
NEI4 $2955
line 7037
;7037:				BotAI(i, (float) thinktime / 1000);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRGP4 BotAI
CALLI4
pop
line 7038
;7038:			}
LABELV $2955
line 7039
;7039:		}
LABELV $2953
line 7040
;7040:	}
LABELV $2947
line 7026
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $2946
line 7043
;7041:
;7042:	// execute bot user commands every frame
;7043:	for( i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2958
line 7044
;7044:		if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2964
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2962
LABELV $2964
line 7045
;7045:			continue;
ADDRGP4 $2959
JUMPV
LABELV $2962
line 7047
;7046:		}
;7047:		if( g_entities[i].client->pers.connected != CON_CONNECTED ) {
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
EQI4 $2965
line 7048
;7048:			continue;
ADDRGP4 $2959
JUMPV
LABELV $2965
line 7051
;7049:		}
;7050:
;7051:		BotUpdateInput(botstates[i], time, elapsed_time);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotUpdateInput
CALLV
pop
line 7052
;7052:		trap_BotUserCommand(botstates[i]->client, &botstates[i]->lastucmd);
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 1396
ADDP4
ARGP4
ADDRGP4 trap_BotUserCommand
CALLV
pop
line 7053
;7053:	}
LABELV $2959
line 7043
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $2958
line 7055
;7054:
;7055:	return qtrue;
CNSTI4 1
RETI4
LABELV $2936
endproc BotAIStartFrame 24 12
export BotAISetup
proc BotAISetup 4 16
line 7063
;7056:}
;7057:
;7058:/*
;7059:==============
;7060:BotAISetup
;7061:==============
;7062:*/
;7063:int BotAISetup( int restart ) {
line 7065
;7064:	//rww - new bot cvars..
;7065:	trap_Cvar_Register(&bot_forcepowers, "bot_forcepowers", "1", CVAR_CHEAT);
ADDRGP4 bot_forcepowers
ARGP4
ADDRGP4 $2969
ARGP4
ADDRGP4 $2970
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7066
;7066:	trap_Cvar_Register(&bot_forgimmick, "bot_forgimmick", "0", CVAR_CHEAT);
ADDRGP4 bot_forgimmick
ARGP4
ADDRGP4 $2971
ARGP4
ADDRGP4 $2972
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7069
;7067:	//cm NOTE: I changed this for beta purposes
;7068:	//trap_Cvar_Register(&bot_honorableduelacceptance, "bot_honorableduelacceptance", "0", CVAR_CHEAT);
;7069:	trap_Cvar_Register(&bot_honorableduelacceptance, "bot_honorableduelacceptance", "0", 0);
ADDRGP4 bot_honorableduelacceptance
ARGP4
ADDRGP4 $2973
ARGP4
ADDRGP4 $2972
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7075
;7070:#ifdef _DEBUG
;7071:	trap_Cvar_Register(&bot_nogoals, "bot_nogoals", "0", CVAR_CHEAT);
;7072:	trap_Cvar_Register(&bot_debugmessages, "bot_debugmessages", "0", CVAR_CHEAT);
;7073:#endif
;7074:
;7075:	trap_Cvar_Register(&bot_attachments, "bot_attachments", "1", 0);
ADDRGP4 bot_attachments
ARGP4
ADDRGP4 $2974
ARGP4
ADDRGP4 $2970
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7076
;7076:	trap_Cvar_Register(&bot_camp, "bot_camp", "1", 0);
ADDRGP4 bot_camp
ARGP4
ADDRGP4 $2975
ARGP4
ADDRGP4 $2970
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7078
;7077:
;7078:	trap_Cvar_Register(&bot_wp_info, "bot_wp_info", "1", 0);
ADDRGP4 bot_wp_info
ARGP4
ADDRGP4 $2976
ARGP4
ADDRGP4 $2970
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7079
;7079:	trap_Cvar_Register(&bot_wp_edit, "bot_wp_edit", "0", CVAR_CHEAT);
ADDRGP4 bot_wp_edit
ARGP4
ADDRGP4 $2977
ARGP4
ADDRGP4 $2972
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7080
;7080:	trap_Cvar_Register(&bot_wp_clearweight, "bot_wp_clearweight", "1", 0);
ADDRGP4 bot_wp_clearweight
ARGP4
ADDRGP4 $2978
ARGP4
ADDRGP4 $2970
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7081
;7081:	trap_Cvar_Register(&bot_wp_distconnect, "bot_wp_distconnect", "1", 0);
ADDRGP4 bot_wp_distconnect
ARGP4
ADDRGP4 $2979
ARGP4
ADDRGP4 $2970
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7082
;7082:	trap_Cvar_Register(&bot_wp_visconnect, "bot_wp_visconnect", "1", 0);
ADDRGP4 bot_wp_visconnect
ARGP4
ADDRGP4 $2980
ARGP4
ADDRGP4 $2970
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7084
;7083:
;7084:	trap_Cvar_Update(&bot_forcepowers);
ADDRGP4 bot_forcepowers
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 7088
;7085:	//end rww
;7086:
;7087:	//if the game is restarted for a tournament
;7088:	if (restart) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $2981
line 7089
;7089:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2968
JUMPV
LABELV $2981
line 7093
;7090:	}
;7091:
;7092:	//initialize the bot states
;7093:	memset( botstates, 0, sizeof(botstates) );
ADDRGP4 botstates
ARGP4
CNSTI4 0
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 memset
CALLP4
pop
line 7095
;7094:
;7095:	if (!trap_BotLibSetup())
ADDRLP4 0
ADDRGP4 trap_BotLibSetup
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2983
line 7096
;7096:	{
line 7097
;7097:		return qfalse; //wts?!
CNSTI4 0
RETI4
ADDRGP4 $2968
JUMPV
LABELV $2983
line 7100
;7098:	}
;7099:
;7100:	return qtrue;
CNSTI4 1
RETI4
LABELV $2968
endproc BotAISetup 4 16
export BotAIShutdown
proc BotAIShutdown 8 8
line 7108
;7101:}
;7102:
;7103:/*
;7104:==============
;7105:BotAIShutdown
;7106:==============
;7107:*/
;7108:int BotAIShutdown( int restart ) {
line 7113
;7109:
;7110:	int i;
;7111:
;7112:	//if the game is restarted for a tournament
;7113:	if ( restart ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $2986
line 7115
;7114:		//shutdown all the bots in the botlib
;7115:		for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2988
line 7116
;7116:			if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2992
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $2992
line 7117
;7117:				BotAIShutdownClient(botstates[i]->client, restart);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 7118
;7118:			}
LABELV $2992
line 7119
;7119:		}
LABELV $2989
line 7115
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $2988
line 7121
;7120:		//don't shutdown the bot library
;7121:	}
ADDRGP4 $2987
JUMPV
LABELV $2986
line 7122
;7122:	else {
line 7123
;7123:		trap_BotLibShutdown();
ADDRGP4 trap_BotLibShutdown
CALLI4
pop
line 7124
;7124:	}
LABELV $2987
line 7125
;7125:	return qtrue;
CNSTI4 1
RETI4
LABELV $2985
endproc BotAIShutdown 8 8
import G_ThereIsAMaster
import WP_ForcePowerUsable
import ExitLevel
bss
export droppedBlueFlag
align 4
LABELV droppedBlueFlag
skip 4
export droppedRedFlag
align 4
LABELV droppedRedFlag
skip 4
export gBotEventTracker
align 4
LABELV gBotEventTracker
skip 512
import imperial_attackers
import rebel_attackers
export regularupdate_time
align 4
LABELV regularupdate_time
skip 4
export numbots
align 4
LABELV numbots
skip 4
export botstates
align 4
LABELV botstates
skip 128
import forceJumpStrength
import forceJumpHeight
import forcePowerNeeded
import g_MaxHolocronCarry
export floattime
align 4
LABELV floattime
skip 4
import gLevelFlags
import nodenum
import nodetable
import gLastPrintedIndex
import gWPNum
import gWPArray
import gWPRenderedFrame
import gBotEdit
import gDeactivated
import gWPRenderTime
import gBotChatBuffer
export eFlagBlue
align 4
LABELV eFlagBlue
skip 4
export eFlagRed
align 4
LABELV eFlagRed
skip 4
export oFlagBlue
align 4
LABELV oFlagBlue
skip 4
export flagBlue
align 4
LABELV flagBlue
skip 4
export oFlagRed
align 4
LABELV oFlagRed
skip 4
export flagRed
align 4
LABELV flagRed
skip 4
export bot_wp_visconnect
align 4
LABELV bot_wp_visconnect
skip 272
export bot_wp_distconnect
align 4
LABELV bot_wp_distconnect
skip 272
export bot_wp_clearweight
align 4
LABELV bot_wp_clearweight
skip 272
export bot_wp_edit
align 4
LABELV bot_wp_edit
skip 272
export bot_wp_info
align 4
LABELV bot_wp_info
skip 272
export bot_camp
align 4
LABELV bot_camp
skip 272
export bot_attachments
align 4
LABELV bot_attachments
skip 272
export bot_honorableduelacceptance
align 4
LABELV bot_honorableduelacceptance
skip 272
export bot_forgimmick
align 4
LABELV bot_forgimmick
skip 272
export bot_forcepowers
align 4
LABELV bot_forcepowers
skip 272
import ConcatArgs
import BotWaypointRender
import BotDoChat
import BotUtilizePersonality
import B_Free
import B_Alloc
import B_TempFree
import B_TempAlloc
import BotResetWeaponState
import BotFreeWeaponState
import BotAllocWeaponState
import BotLoadWeaponWeights
import BotGetWeaponInfo
import BotChooseBestFightWeapon
import BotShutdownWeaponAI
import BotSetupWeaponAI
import BotShutdownMoveAI
import BotSetupMoveAI
import BotSetBrushModelTypes
import BotAddAvoidSpot
import BotInitMoveState
import BotFreeMoveState
import BotAllocMoveState
import BotPredictVisiblePosition
import BotMovementViewTarget
import BotReachabilityArea
import BotResetLastAvoidReach
import BotResetAvoidReach
import BotMoveInDirection
import BotMoveToGoal
import BotResetMoveState
import BotShutdownGoalAI
import BotSetupGoalAI
import BotFreeGoalState
import BotAllocGoalState
import BotFreeItemWeights
import BotLoadItemWeights
import BotMutateGoalFuzzyLogic
import BotSaveGoalFuzzyLogic
import BotInterbreedGoalFuzzyLogic
import BotUpdateEntityItems
import BotInitLevelItems
import BotSetAvoidGoalTime
import BotAvoidGoalTime
import BotGetMapLocationGoal
import BotGetNextCampSpotGoal
import BotGetLevelItemGoal
import BotItemGoalInVisButNotVisible
import BotTouchingGoal
import BotChooseNBGItem
import BotChooseLTGItem
import BotGetSecondGoal
import BotGetTopGoal
import BotGoalName
import BotDumpGoalStack
import BotDumpAvoidGoals
import BotEmptyGoalStack
import BotPopGoal
import BotPushGoal
import BotRemoveFromAvoidGoals
import BotResetAvoidGoals
import BotResetGoalState
import GeneticParentsAndChildSelection
import BotSetChatName
import BotSetChatGender
import BotLoadChatFile
import BotReplaceSynonyms
import UnifyWhiteSpaces
import BotMatchVariable
import BotFindMatch
import StringContains
import BotGetChatMessage
import BotEnterChat
import BotChatLength
import BotReplyChat
import BotNumInitialChats
import BotInitialChat
import BotNumConsoleMessages
import BotNextConsoleMessage
import BotRemoveConsoleMessage
import BotQueueConsoleMessage
import BotFreeChatState
import BotAllocChatState
import BotShutdownChatAI
import BotSetupChatAI
import BotShutdownCharacters
import Characteristic_String
import Characteristic_BInteger
import Characteristic_Integer
import Characteristic_BFloat
import Characteristic_Float
import BotFreeCharacter
import BotLoadCharacter
import EA_Shutdown
import EA_Setup
import EA_ResetInput
import EA_GetInput
import EA_EndRegular
import EA_View
import EA_Move
import EA_DelayedJump
import EA_Jump
import EA_SelectWeapon
import EA_Use
import EA_Gesture
import EA_Talk
import EA_Respawn
import EA_ForcePower
import EA_Alt_Attack
import EA_Attack
import EA_MoveRight
import EA_MoveLeft
import EA_MoveBack
import EA_MoveForward
import EA_MoveDown
import EA_MoveUp
import EA_Walk
import EA_Crouch
import EA_Action
import EA_Command
import EA_SayTeam
import EA_Say
import GetBotLibAPI
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
import B_CleanupAlloc
import B_InitAlloc
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
LABELV $2980
char 1 98
char 1 111
char 1 116
char 1 95
char 1 119
char 1 112
char 1 95
char 1 118
char 1 105
char 1 115
char 1 99
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 0
align 1
LABELV $2979
char 1 98
char 1 111
char 1 116
char 1 95
char 1 119
char 1 112
char 1 95
char 1 100
char 1 105
char 1 115
char 1 116
char 1 99
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 0
align 1
LABELV $2978
char 1 98
char 1 111
char 1 116
char 1 95
char 1 119
char 1 112
char 1 95
char 1 99
char 1 108
char 1 101
char 1 97
char 1 114
char 1 119
char 1 101
char 1 105
char 1 103
char 1 104
char 1 116
char 1 0
align 1
LABELV $2977
char 1 98
char 1 111
char 1 116
char 1 95
char 1 119
char 1 112
char 1 95
char 1 101
char 1 100
char 1 105
char 1 116
char 1 0
align 1
LABELV $2976
char 1 98
char 1 111
char 1 116
char 1 95
char 1 119
char 1 112
char 1 95
char 1 105
char 1 110
char 1 102
char 1 111
char 1 0
align 1
LABELV $2975
char 1 98
char 1 111
char 1 116
char 1 95
char 1 99
char 1 97
char 1 109
char 1 112
char 1 0
align 1
LABELV $2974
char 1 98
char 1 111
char 1 116
char 1 95
char 1 97
char 1 116
char 1 116
char 1 97
char 1 99
char 1 104
char 1 109
char 1 101
char 1 110
char 1 116
char 1 115
char 1 0
align 1
LABELV $2973
char 1 98
char 1 111
char 1 116
char 1 95
char 1 104
char 1 111
char 1 110
char 1 111
char 1 114
char 1 97
char 1 98
char 1 108
char 1 101
char 1 100
char 1 117
char 1 101
char 1 108
char 1 97
char 1 99
char 1 99
char 1 101
char 1 112
char 1 116
char 1 97
char 1 110
char 1 99
char 1 101
char 1 0
align 1
LABELV $2972
char 1 48
char 1 0
align 1
LABELV $2971
char 1 98
char 1 111
char 1 116
char 1 95
char 1 102
char 1 111
char 1 114
char 1 103
char 1 105
char 1 109
char 1 109
char 1 105
char 1 99
char 1 107
char 1 0
align 1
LABELV $2970
char 1 49
char 1 0
align 1
LABELV $2969
char 1 98
char 1 111
char 1 116
char 1 95
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
LABELV $2508
char 1 75
char 1 105
char 1 108
char 1 108
char 1 101
char 1 100
char 1 0
align 1
LABELV $2505
char 1 75
char 1 105
char 1 108
char 1 108
char 1 101
char 1 100
char 1 72
char 1 97
char 1 116
char 1 101
char 1 100
char 1 79
char 1 110
char 1 101
char 1 0
align 1
LABELV $2364
char 1 75
char 1 105
char 1 108
char 1 108
char 1 101
char 1 100
char 1 79
char 1 110
char 1 80
char 1 117
char 1 114
char 1 112
char 1 111
char 1 115
char 1 101
char 1 66
char 1 121
char 1 76
char 1 111
char 1 118
char 1 101
char 1 0
align 1
LABELV $2361
char 1 68
char 1 105
char 1 101
char 1 100
char 1 0
align 1
LABELV $2275
char 1 100
char 1 101
char 1 116
char 1 112
char 1 97
char 1 99
char 1 107
char 1 0
align 1
LABELV $2257
char 1 102
char 1 114
char 1 101
char 1 101
char 1 100
char 1 0
align 1
LABELV $2232
char 1 82
char 1 101
char 1 115
char 1 112
char 1 111
char 1 110
char 1 115
char 1 101
char 1 71
char 1 114
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 115
char 1 0
align 1
LABELV $2134
char 1 66
char 1 101
char 1 108
char 1 111
char 1 118
char 1 101
char 1 100
char 1 75
char 1 105
char 1 108
char 1 108
char 1 101
char 1 100
char 1 0
align 1
LABELV $2131
char 1 72
char 1 97
char 1 116
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $2124
char 1 76
char 1 111
char 1 118
char 1 101
char 1 100
char 1 79
char 1 110
char 1 101
char 1 75
char 1 105
char 1 108
char 1 108
char 1 101
char 1 100
char 1 76
char 1 111
char 1 118
char 1 101
char 1 100
char 1 79
char 1 110
char 1 101
char 1 0
align 1
LABELV $450
char 1 102
char 1 117
char 1 110
char 1 99
char 1 95
char 1 0
align 1
LABELV $387
char 1 71
char 1 101
char 1 110
char 1 101
char 1 114
char 1 97
char 1 108
char 1 71
char 1 114
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 115
char 1 0
align 1
LABELV $381
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
char 1 58
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 100
char 1 32
char 1 97
char 1 108
char 1 114
char 1 101
char 1 97
char 1 100
char 1 121
char 1 32
char 1 115
char 1 101
char 1 116
char 1 117
char 1 112
char 1 10
char 1 0
align 1
LABELV $353
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 76
char 1 101
char 1 118
char 1 101
char 1 108
char 1 83
char 1 104
char 1 111
char 1 116
char 1 0
align 1
LABELV $350
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 115
char 1 0
align 1
LABELV $347
char 1 99
char 1 115
char 1 0
align 1
LABELV $344
char 1 99
char 1 112
char 1 32
char 1 0
align 1
LABELV $336
char 1 66
char 1 111
char 1 116
char 1 65
char 1 73
char 1 58
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 100
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 115
char 1 101
char 1 116
char 1 117
char 1 112
char 1 10
char 1 0
align 1
LABELV $160
char 1 79
char 1 114
char 1 100
char 1 101
char 1 114
char 1 65
char 1 99
char 1 99
char 1 101
char 1 112
char 1 116
char 1 101
char 1 100
char 1 0
align 1
LABELV $100
char 1 73
char 1 39
char 1 109
char 1 32
char 1 97
char 1 116
char 1 116
char 1 101
char 1 109
char 1 112
char 1 116
char 1 105
char 1 110
char 1 103
char 1 32
char 1 116
char 1 111
char 1 32
char 1 114
char 1 101
char 1 103
char 1 114
char 1 111
char 1 117
char 1 112
char 1 32
char 1 97
char 1 110
char 1 100
char 1 32
char 1 102
char 1 111
char 1 114
char 1 109
char 1 32
char 1 97
char 1 32
char 1 110
char 1 101
char 1 119
char 1 32
char 1 115
char 1 113
char 1 117
char 1 97
char 1 100
char 1 0
align 1
LABELV $99
char 1 73
char 1 39
char 1 109
char 1 32
char 1 97
char 1 115
char 1 115
char 1 105
char 1 115
char 1 116
char 1 105
char 1 110
char 1 103
char 1 32
char 1 109
char 1 121
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $98
char 1 73
char 1 39
char 1 109
char 1 32
char 1 102
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 105
char 1 110
char 1 103
char 1 32
char 1 109
char 1 121
char 1 32
char 1 115
char 1 113
char 1 117
char 1 97
char 1 100
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 101
char 1 114
char 1 0
align 1
LABELV $97
char 1 73
char 1 39
char 1 109
char 1 32
char 1 112
char 1 114
char 1 101
char 1 118
char 1 101
char 1 110
char 1 116
char 1 105
char 1 110
char 1 103
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 101
char 1 110
char 1 101
char 1 109
char 1 121
char 1 32
char 1 102
char 1 114
char 1 111
char 1 109
char 1 32
char 1 99
char 1 111
char 1 109
char 1 112
char 1 108
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 32
char 1 116
char 1 104
char 1 101
char 1 105
char 1 114
char 1 32
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 105
char 1 118
char 1 101
char 1 0
align 1
LABELV $96
char 1 73
char 1 39
char 1 109
char 1 32
char 1 97
char 1 116
char 1 116
char 1 101
char 1 109
char 1 116
char 1 112
char 1 105
char 1 110
char 1 103
char 1 32
char 1 116
char 1 111
char 1 32
char 1 99
char 1 111
char 1 109
char 1 112
char 1 108
char 1 101
char 1 116
char 1 101
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 99
char 1 117
char 1 114
char 1 114
char 1 101
char 1 110
char 1 116
char 1 32
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 105
char 1 118
char 1 101
char 1 0
align 1
LABELV $95
char 1 73
char 1 39
char 1 118
char 1 101
char 1 32
char 1 103
char 1 111
char 1 116
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 101
char 1 110
char 1 101
char 1 109
char 1 121
char 1 39
char 1 115
char 1 32
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $94
char 1 73
char 1 39
char 1 109
char 1 32
char 1 101
char 1 115
char 1 99
char 1 111
char 1 114
char 1 116
char 1 105
char 1 110
char 1 103
char 1 32
char 1 111
char 1 117
char 1 114
char 1 32
char 1 102
char 1 108
char 1 97
char 1 103
char 1 32
char 1 99
char 1 97
char 1 114
char 1 114
char 1 105
char 1 101
char 1 114
char 1 0
align 1
LABELV $93
char 1 73
char 1 39
char 1 109
char 1 32
char 1 103
char 1 101
char 1 116
char 1 116
char 1 105
char 1 110
char 1 103
char 1 32
char 1 111
char 1 117
char 1 114
char 1 32
char 1 102
char 1 108
char 1 97
char 1 103
char 1 32
char 1 98
char 1 97
char 1 99
char 1 107
char 1 0
align 1
LABELV $92
char 1 73
char 1 39
char 1 109
char 1 32
char 1 100
char 1 101
char 1 102
char 1 101
char 1 110
char 1 100
char 1 105
char 1 110
char 1 103
char 1 32
char 1 111
char 1 117
char 1 114
char 1 32
char 1 98
char 1 97
char 1 115
char 1 101
char 1 0
align 1
LABELV $91
char 1 73
char 1 39
char 1 109
char 1 32
char 1 97
char 1 116
char 1 116
char 1 97
char 1 99
char 1 107
char 1 105
char 1 110
char 1 103
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 101
char 1 110
char 1 101
char 1 109
char 1 121
char 1 39
char 1 115
char 1 32
char 1 98
char 1 97
char 1 115
char 1 101
char 1 0
align 1
LABELV $90
char 1 73
char 1 39
char 1 109
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 111
char 1 99
char 1 99
char 1 117
char 1 112
char 1 105
char 1 101
char 1 100
char 1 0
align 1
LABELV $89
char 1 67
char 1 84
char 1 70
char 1 83
char 1 84
char 1 65
char 1 84
char 1 69
char 1 95
char 1 77
char 1 65
char 1 88
char 1 67
char 1 84
char 1 70
char 1 83
char 1 84
char 1 65
char 1 84
char 1 69
char 1 83
char 1 0
align 1
LABELV $88
char 1 67
char 1 84
char 1 70
char 1 83
char 1 84
char 1 65
char 1 84
char 1 69
char 1 95
char 1 71
char 1 69
char 1 84
char 1 70
char 1 76
char 1 65
char 1 71
char 1 72
char 1 79
char 1 77
char 1 69
char 1 0
align 1
LABELV $87
char 1 67
char 1 84
char 1 70
char 1 83
char 1 84
char 1 65
char 1 84
char 1 69
char 1 95
char 1 71
char 1 85
char 1 65
char 1 82
char 1 68
char 1 67
char 1 65
char 1 82
char 1 82
char 1 73
char 1 69
char 1 82
char 1 0
align 1
LABELV $86
char 1 67
char 1 84
char 1 70
char 1 83
char 1 84
char 1 65
char 1 84
char 1 69
char 1 95
char 1 82
char 1 69
char 1 84
char 1 82
char 1 73
char 1 69
char 1 86
char 1 65
char 1 76
char 1 0
align 1
LABELV $85
char 1 67
char 1 84
char 1 70
char 1 83
char 1 84
char 1 65
char 1 84
char 1 69
char 1 95
char 1 68
char 1 69
char 1 70
char 1 69
char 1 78
char 1 68
char 1 69
char 1 82
char 1 0
align 1
LABELV $84
char 1 67
char 1 84
char 1 70
char 1 83
char 1 84
char 1 65
char 1 84
char 1 69
char 1 95
char 1 65
char 1 84
char 1 84
char 1 65
char 1 67
char 1 75
char 1 69
char 1 82
char 1 0
align 1
LABELV $83
char 1 67
char 1 84
char 1 70
char 1 83
char 1 84
char 1 65
char 1 84
char 1 69
char 1 95
char 1 78
char 1 79
char 1 78
char 1 69
char 1 0
