export vmMain
code
proc vmMain 12 8
file "../ui_main.c"
line 36
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:USER INTERFACE MAIN
;7:
;8:=======================================================================
;9:*/
;10:
;11:// use this to get a demo build without an explicit demo build, i.e. to get the demo ui files to build
;12://#define PRE_RELEASE_TADEMO
;13:
;14:#include "ui_local.h"
;15:#include "../qcommon/qfiles.h"
;16:#include "../qcommon/game_version.h"
;17:#include "ui_force.h"
;18:
;19:/*
;20:================
;21:vmMain
;22:
;23:This is the only way control passes into the module.
;24:!!! This MUST BE THE VERY FIRST FUNCTION compiled into the .qvm file !!!
;25:================
;26:*/
;27:vmCvar_t  ui_debug;
;28:vmCvar_t  ui_initialized;
;29:
;30:void _UI_Init( qboolean );
;31:void _UI_Shutdown( void );
;32:void _UI_KeyEvent( int key, qboolean down );
;33:void _UI_MouseEvent( int dx, int dy );
;34:void _UI_Refresh( int realtime );
;35:qboolean _UI_IsFullscreen( void );
;36:int vmMain( int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6, int arg7, int arg8, int arg9, int arg10, int arg11  ) {
line 37
;37:  switch ( command ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $150
ADDRLP4 0
INDIRI4
CNSTI4 10
GTI4 $150
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $163
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $163
address $152
address $153
address $154
address $155
address $156
address $157
address $158
address $159
address $160
address $161
address $162
code
LABELV $152
line 39
;38:	  case UI_GETAPIVERSION:
;39:		  return UI_API_VERSION;
CNSTI4 7
RETI4
ADDRGP4 $149
JUMPV
LABELV $153
line 42
;40:
;41:	  case UI_INIT:
;42:		  _UI_Init(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 _UI_Init
CALLV
pop
line 43
;43:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $154
line 46
;44:
;45:	  case UI_SHUTDOWN:
;46:		  _UI_Shutdown();
ADDRGP4 _UI_Shutdown
CALLV
pop
line 47
;47:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $155
line 50
;48:
;49:	  case UI_KEY_EVENT:
;50:		  _UI_KeyEvent( arg0, arg1 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 _UI_KeyEvent
CALLV
pop
line 51
;51:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $156
line 54
;52:
;53:	  case UI_MOUSE_EVENT:
;54:		  _UI_MouseEvent( arg0, arg1 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 _UI_MouseEvent
CALLV
pop
line 55
;55:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $157
line 58
;56:
;57:	  case UI_REFRESH:
;58:		  _UI_Refresh( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 _UI_Refresh
CALLV
pop
line 59
;59:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $158
line 62
;60:
;61:	  case UI_IS_FULLSCREEN:
;62:		  return _UI_IsFullscreen();
ADDRLP4 4
ADDRGP4 _UI_IsFullscreen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $149
JUMPV
LABELV $159
line 65
;63:
;64:	  case UI_SET_ACTIVE_MENU:
;65:		  _UI_SetActiveMenu( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 _UI_SetActiveMenu
CALLV
pop
line 66
;66:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $160
line 69
;67:
;68:	  case UI_CONSOLE_COMMAND:
;69:		  return UI_ConsoleCommand(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $149
JUMPV
LABELV $161
line 72
;70:
;71:	  case UI_DRAW_CONNECT_SCREEN:
;72:		  UI_DrawConnectScreen( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawConnectScreen
CALLV
pop
line 73
;73:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $162
line 75
;74:	  case UI_HASUNIQUECDKEY: // mod authors need to observe this
;75:	    return qtrue; // bk010117 - change this to qfalse for mods!
CNSTI4 1
RETI4
ADDRGP4 $149
JUMPV
LABELV $150
line 79
;76:
;77:	}
;78:
;79:	return -1;
CNSTI4 -1
RETI4
LABELV $149
endproc vmMain 12 8
data
export holdSPString
align 1
LABELV holdSPString
char 1 0
skip 1023
export uiSkinColor
align 4
LABELV uiSkinColor
byte 4 0
lit
align 4
LABELV serverFilters
address $164
address $165
address $166
address $165
align 4
LABELV numServerFilters
byte 4 2
data
align 4
LABELV skillLevels
address $167
address $168
address $169
address $170
address $171
lit
align 4
LABELV numSkillLevels
byte 4 5
data
align 4
LABELV teamArenaGameTypes
address $172
address $173
address $174
address $175
address $176
address $177
address $178
address $179
address $180
address $181
lit
align 4
LABELV numTeamArenaGameTypes
byte 4 10
data
align 4
LABELV netnames
address $182
address $183
address $184
byte 4 0
align 4
LABELV gamecodetoui
byte 4 4
byte 4 2
byte 4 3
byte 4 0
byte 4 5
byte 4 1
byte 4 6
align 4
LABELV uitogamecode
byte 4 4
byte 4 6
byte 4 2
byte 4 3
byte 4 1
byte 4 5
byte 4 7
export UI_TeamName
code
proc UI_TeamName 0 0
line 156
;80:}
;81:
;82:menuDef_t *Menus_FindByName(const char *p);
;83:void Menu_ShowItemByName(menuDef_t *menu, const char *p, qboolean bShow);
;84:void UpdateForceUsed();
;85:
;86:char holdSPString[1024]={0};
;87:
;88:uiInfo_t uiInfo;
;89:
;90:static void UI_StartServerRefresh(qboolean full);
;91:static void UI_StopServerRefresh( void );
;92:static void UI_DoServerRefresh( void );
;93:static void UI_BuildServerDisplayList(qboolean force);
;94:static void UI_BuildServerStatus(qboolean force);
;95:static void UI_BuildFindPlayerList(qboolean force);
;96:static int QDECL UI_ServersQsortCompare( const void *arg1, const void *arg2 );
;97:static int UI_MapCountByGameType(qboolean singlePlayer);
;98:static int UI_HeadCountByTeam( void );
;99:static int UI_HeadCountByColor( void );
;100:static void UI_ParseGameInfo(const char *teamFile);
;101:static const char *UI_SelectedMap(int index, int *actual);
;102:static const char *UI_SelectedHead(int index, int *actual);
;103:static int UI_GetIndexFromSelection(int actual);
;104:
;105:int ProcessNewUI( int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6 );
;106:int	uiSkinColor=TEAM_FREE;
;107:
;108:static const serverFilter_t serverFilters[] = {
;109:	{"All", "" },
;110:	{"Jedi Knight 2", "" },
;111:};
;112:static const int numServerFilters = sizeof(serverFilters) / sizeof(serverFilter_t);
;113:
;114:
;115:
;116:
;117:static const char *skillLevels[] = {
;118:  "SKILL1",//"I Can Win",
;119:  "SKILL2",//"Bring It On",
;120:  "SKILL3",//"Hurt Me Plenty",
;121:  "SKILL4",//"Hardcore",
;122:  "SKILL5"//"Nightmare"
;123:};
;124:static const int numSkillLevels = sizeof(skillLevels) / sizeof(const char*);
;125:
;126:
;127:
;128:static const char *teamArenaGameTypes[] = {
;129:	"FFA",
;130:	"HOLOCRON",
;131:	"JEDIMASTER",
;132:	"DUEL",
;133:	"SP",
;134:	"TEAM FFA",
;135:	"N/A",
;136:	"CTF",
;137:	"CTY",
;138:	"TEAMTOURNAMENT"
;139:};
;140:static int const numTeamArenaGameTypes = sizeof(teamArenaGameTypes) / sizeof(const char*);
;141:
;142:
;143:
;144:static char* netnames[] = {
;145:	"???",
;146:	"UDP",
;147:	"IPX",
;148:	NULL
;149:};
;150:
;151:static int gamecodetoui[] = {4,2,3,0,5,1,6};
;152:static int uitogamecode[] = {4,6,2,3,1,5,7};
;153:
;154:const char *UI_GetStripEdString(const char *refSection, const char *refName);
;155:
;156:const char *UI_TeamName(int team)  {
line 157
;157:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $186
line 158
;158:		return "RED";
ADDRGP4 $188
RETP4
ADDRGP4 $185
JUMPV
LABELV $186
line 159
;159:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $189
line 160
;160:		return "BLUE";
ADDRGP4 $191
RETP4
ADDRGP4 $185
JUMPV
LABELV $189
line 161
;161:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $192
line 162
;162:		return "SPECTATOR";
ADDRGP4 $194
RETP4
ADDRGP4 $185
JUMPV
LABELV $192
line 163
;163:	return "FREE";
ADDRGP4 $195
RETP4
LABELV $185
endproc UI_TeamName 0 0
bss
align 1
LABELV $197
skip 256
code
proc GetCRDelineatedString 20 8
line 169
;164:}
;165:
;166:// returns either string or NULL for OOR...
;167://
;168:static const char *GetCRDelineatedString( const char *psStripFileRef, const char *psStripStringRef, int iIndex)
;169:{
line 171
;170:	static char sTemp[256];
;171:	const char *psList = UI_GetStripEdString(psStripFileRef, psStripStringRef);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $199
JUMPV
LABELV $198
line 175
;172:	char *p;
;173:
;174:	while (iIndex--)
;175:	{
line 176
;176:		psList = strchr(psList,'\n');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 12
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 177
;177:		if (!psList){
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $201
line 178
;178:			return NULL;	// OOR
CNSTP4 0
RETP4
ADDRGP4 $196
JUMPV
LABELV $201
line 180
;179:		}
;180:		psList++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 181
;181:	}
LABELV $199
line 174
ADDRLP4 12
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $198
line 183
;182:
;183:	strcpy(sTemp,psList);
ADDRGP4 $197
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 184
;184:	p = strchr(sTemp,'\n');
ADDRGP4 $197
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 16
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 185
;185:	if (p) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $203
line 186
;186:		*p = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 187
;187:	}
LABELV $203
line 189
;188:
;189:	return sTemp;
ADDRGP4 $197
RETP4
LABELV $196
endproc GetCRDelineatedString 20 8
proc GetMonthAbbrevString 12 12
line 194
;190:}
;191:
;192:
;193:static const char *GetMonthAbbrevString( int iMonth )
;194:{
line 195
;195:	const char *p = GetCRDelineatedString("INGAMETEXT","MONTHS", iMonth);
ADDRGP4 $206
ARGP4
ADDRGP4 $207
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 GetCRDelineatedString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 197
;196:	
;197:	return p ? p : "Jan";	// sanity
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $210
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $210
ADDRLP4 8
ADDRGP4 $208
ASGNP4
LABELV $211
ADDRLP4 8
INDIRP4
RETP4
LABELV $205
endproc GetMonthAbbrevString 12 12
lit
align 4
LABELV numNetSources
byte 4 3
code
proc GetNetSourceString 12 12
line 214
;198:}
;199:
;200:
;201:
;202:
;203:/*
;204:static const char *netSources[] = {
;205:	"Local",
;206:	"Internet",
;207:	"Favorites"
;208://	"Mplayer"
;209:};
;210:static const int numNetSources = sizeof(netSources) / sizeof(const char*);
;211:*/
;212:static const int numNetSources = 3;	// now hard-entered in StripEd file
;213:static const char *GetNetSourceString(int iSource)
;214:{
line 215
;215:	const char *p = GetCRDelineatedString("INGAMETEXT","NET_SOURCES", iSource);
ADDRGP4 $206
ARGP4
ADDRGP4 $213
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 GetCRDelineatedString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 217
;216:
;217:	return p ? p : "??";
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $216
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $217
JUMPV
LABELV $216
ADDRLP4 8
ADDRGP4 $214
ASGNP4
LABELV $217
ADDRLP4 8
INDIRP4
RETP4
LABELV $212
endproc GetNetSourceString 12 12
export AssetCache
proc AssetCache 84 8
line 223
;218:}
;219:
;220:
;221:
;222:
;223:void AssetCache() {
line 229
;224:	int n;
;225:	//if (Assets.textFont == NULL) {
;226:	//}
;227:	//Assets.background = trap_R_RegisterShaderNoMip( ASSET_BACKGROUND );
;228:	//Com_Printf("Menu Size: %i bytes\n", sizeof(Menus));
;229:	uiInfo.uiDC.Assets.gradientBar = trap_R_RegisterShaderNoMip( ASSET_GRADIENTBAR );
ADDRGP4 $221
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+28
ADDRLP4 4
INDIRI4
ASGNI4
line 230
;230:	uiInfo.uiDC.Assets.fxBasePic = trap_R_RegisterShaderNoMip( ART_FX_BASE );
ADDRGP4 $224
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+136
ADDRLP4 8
INDIRI4
ASGNI4
line 231
;231:	uiInfo.uiDC.Assets.fxPic[0] = trap_R_RegisterShaderNoMip( ART_FX_RED );
ADDRGP4 $227
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+140
ADDRLP4 12
INDIRI4
ASGNI4
line 232
;232:	uiInfo.uiDC.Assets.fxPic[1] = trap_R_RegisterShaderNoMip( ART_FX_ORANGE );//trap_R_RegisterShaderNoMip( ART_FX_YELLOW );
ADDRGP4 $231
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+140+4
ADDRLP4 16
INDIRI4
ASGNI4
line 233
;233:	uiInfo.uiDC.Assets.fxPic[2] = trap_R_RegisterShaderNoMip( ART_FX_YELLOW );//trap_R_RegisterShaderNoMip( ART_FX_GREEN );
ADDRGP4 $235
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+140+8
ADDRLP4 20
INDIRI4
ASGNI4
line 234
;234:	uiInfo.uiDC.Assets.fxPic[3] = trap_R_RegisterShaderNoMip( ART_FX_GREEN );//trap_R_RegisterShaderNoMip( ART_FX_TEAL );
ADDRGP4 $239
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+140+12
ADDRLP4 24
INDIRI4
ASGNI4
line 235
;235:	uiInfo.uiDC.Assets.fxPic[4] = trap_R_RegisterShaderNoMip( ART_FX_BLUE );
ADDRGP4 $243
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+140+16
ADDRLP4 28
INDIRI4
ASGNI4
line 236
;236:	uiInfo.uiDC.Assets.fxPic[5] = trap_R_RegisterShaderNoMip( ART_FX_PURPLE );//trap_R_RegisterShaderNoMip( ART_FX_CYAN );
ADDRGP4 $247
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+140+20
ADDRLP4 32
INDIRI4
ASGNI4
line 237
;237:	uiInfo.uiDC.Assets.fxPic[6] = trap_R_RegisterShaderNoMip( ART_FX_WHITE );
ADDRGP4 $251
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+140+24
ADDRLP4 36
INDIRI4
ASGNI4
line 238
;238:	uiInfo.uiDC.Assets.scrollBar = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR );
ADDRGP4 $254
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+48
ADDRLP4 40
INDIRI4
ASGNI4
line 239
;239:	uiInfo.uiDC.Assets.scrollBarArrowDown = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWDOWN );
ADDRGP4 $257
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+36
ADDRLP4 44
INDIRI4
ASGNI4
line 240
;240:	uiInfo.uiDC.Assets.scrollBarArrowUp = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWUP );
ADDRGP4 $260
ARGP4
ADDRLP4 48
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+32
ADDRLP4 48
INDIRI4
ASGNI4
line 241
;241:	uiInfo.uiDC.Assets.scrollBarArrowLeft = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWLEFT );
ADDRGP4 $263
ARGP4
ADDRLP4 52
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+40
ADDRLP4 52
INDIRI4
ASGNI4
line 242
;242:	uiInfo.uiDC.Assets.scrollBarArrowRight = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWRIGHT );
ADDRGP4 $266
ARGP4
ADDRLP4 56
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+44
ADDRLP4 56
INDIRI4
ASGNI4
line 243
;243:	uiInfo.uiDC.Assets.scrollBarThumb = trap_R_RegisterShaderNoMip( ASSET_SCROLL_THUMB );
ADDRGP4 $269
ARGP4
ADDRLP4 60
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+52
ADDRLP4 60
INDIRI4
ASGNI4
line 244
;244:	uiInfo.uiDC.Assets.sliderBar = trap_R_RegisterShaderNoMip( ASSET_SLIDER_BAR );
ADDRGP4 $272
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+68
ADDRLP4 64
INDIRI4
ASGNI4
line 245
;245:	uiInfo.uiDC.Assets.sliderThumb = trap_R_RegisterShaderNoMip( ASSET_SLIDER_THUMB );
ADDRGP4 $275
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+72
ADDRLP4 68
INDIRI4
ASGNI4
line 247
;246:
;247:	for( n = 0; n < NUM_CROSSHAIRS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $276
line 248
;248:		uiInfo.uiDC.Assets.crosshairShader[n] = trap_R_RegisterShaderNoMip( va("gfx/2d/crosshair%c", 'a' + n ) );
ADDRGP4 $282
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 97
ADDI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+260+168
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 249
;249:	}
LABELV $277
line 247
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $276
line 251
;250:
;251:	uiInfo.newHighScoreSound = 0;//trap_S_RegisterSound("sound/feedback/voc_newhighscore.wav");
ADDRGP4 uiInfo+60864
CNSTI4 0
ASGNI4
line 252
;252:}
LABELV $218
endproc AssetCache 84 8
export _UI_DrawSides
proc _UI_DrawSides 12 36
line 254
;253:
;254:void _UI_DrawSides(float x, float y, float w, float h, float size) {
line 255
;255:	size *= uiInfo.uiDC.xscale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 uiInfo+232
INDIRF4
MULF4
ASGNF4
line 256
;256:	trap_R_DrawStretchPic( x, y, size, h, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uiInfo+11800
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 257
;257:	trap_R_DrawStretchPic( x + w - size, y, size, h, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRLP4 4
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 uiInfo+11800
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 258
;258:}
LABELV $284
endproc _UI_DrawSides 12 36
export _UI_DrawTopBottom
proc _UI_DrawTopBottom 12 36
line 260
;259:
;260:void _UI_DrawTopBottom(float x, float y, float w, float h, float size) {
line 261
;261:	size *= uiInfo.uiDC.yscale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 uiInfo+228
INDIRF4
MULF4
ASGNF4
line 262
;262:	trap_R_DrawStretchPic( x, y, w, size, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uiInfo+11800
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 263
;263:	trap_R_DrawStretchPic( x, y + h - size, w, size, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 uiInfo+11800
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 264
;264:}
LABELV $288
endproc _UI_DrawTopBottom 12 36
export _UI_DrawRect
proc _UI_DrawRect 0 20
line 272
;265:/*
;266:================
;267:UI_DrawRect
;268:
;269:Coordinates are 640*480 virtual values
;270:=================
;271:*/
;272:void _UI_DrawRect( float x, float y, float width, float height, float size, const float *color ) {
line 273
;273:	trap_R_SetColor( color );
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 275
;274:
;275:  _UI_DrawTopBottom(x, y, width, height, size);
ADDRFP4 0
INDIRF4
ARGF4
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
INDIRF4
ARGF4
ADDRGP4 _UI_DrawTopBottom
CALLV
pop
line 276
;276:  _UI_DrawSides(x, y, width, height, size);
ADDRFP4 0
INDIRF4
ARGF4
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
INDIRF4
ARGF4
ADDRGP4 _UI_DrawSides
CALLV
pop
line 278
;277:
;278:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 279
;279:}
LABELV $292
endproc _UI_DrawRect 0 20
export MenuFontToHandle
proc MenuFontToHandle 4 0
line 282
;280:
;281:int MenuFontToHandle(int iMenuFont)
;282:{
line 283
;283:	switch (iMenuFont)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $296
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $299
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $302
ADDRGP4 $294
JUMPV
line 284
;284:	{
LABELV $296
line 285
;285:		case 1: return uiInfo.uiDC.Assets.qhSmallFont;
ADDRGP4 uiInfo+260+12
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $299
line 286
;286:		case 2: return uiInfo.uiDC.Assets.qhMediumFont;
ADDRGP4 uiInfo+260+16
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $302
line 287
;287:		case 3: return uiInfo.uiDC.Assets.qhBigFont;
ADDRGP4 uiInfo+260+20
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $294
line 290
;288:	}
;289:
;290:	return uiInfo.uiDC.Assets.qhMediumFont;	// 0;
ADDRGP4 uiInfo+260+16
INDIRI4
RETI4
LABELV $293
endproc MenuFontToHandle 4 0
export Text_Width
proc Text_Width 12 12
line 294
;291:}
;292:
;293:int Text_Width(const char *text, float scale, int iMenuFont) 
;294:{	
line 295
;295:	int iFontIndex = MenuFontToHandle(iMenuFont);
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 MenuFontToHandle
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 297
;296:
;297:	return trap_R_Font_StrLenPixels(text, iFontIndex, scale);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 trap_R_Font_StrLenPixels
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $307
endproc Text_Width 12 12
export Text_Height
proc Text_Height 12 8
line 301
;298:}
;299:
;300:int Text_Height(const char *text, float scale, int iMenuFont) 
;301:{
line 302
;302:	int iFontIndex = MenuFontToHandle(iMenuFont);
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 MenuFontToHandle
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 304
;303:
;304:	return trap_R_Font_HeightPixels(iFontIndex, scale);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 trap_R_Font_HeightPixels
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $308
endproc Text_Height 12 8
export Text_Paint
proc Text_Paint 20 28
line 308
;305:}
;306:
;307:void Text_Paint(float x, float y, float scale, vec4_t color, const char *text, float adjust, int limit, int style, int iMenuFont)
;308:{
line 309
;309:	int iStyleOR = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 311
;310:
;311:	int iFontIndex = MenuFontToHandle(iMenuFont);
ADDRFP4 32
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 MenuFontToHandle
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 315
;312:	//
;313:	// kludge.. convert JK2 menu styles to SOF2 printstring ctrl codes...
;314:	//	
;315:	switch (style)
ADDRLP4 12
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $310
ADDRLP4 12
INDIRI4
CNSTI4 6
GTI4 $310
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $319
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $319
address $312
address $313
address $314
address $315
address $316
address $317
address $318
code
line 316
;316:	{
LABELV $312
line 317
;317:	case  ITEM_TEXTSTYLE_NORMAL:			iStyleOR = 0;break;					// JK2 normal text
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $311
JUMPV
LABELV $313
line 318
;318:	case  ITEM_TEXTSTYLE_BLINK:				iStyleOR = (int)STYLE_BLINK;break;		// JK2 fast blinking
ADDRLP4 0
CNSTI4 1073741824
ASGNI4
ADDRGP4 $311
JUMPV
LABELV $314
line 319
;319:	case  ITEM_TEXTSTYLE_PULSE:				iStyleOR = (int)STYLE_BLINK;break;		// JK2 slow pulsing
ADDRLP4 0
CNSTI4 1073741824
ASGNI4
ADDRGP4 $311
JUMPV
LABELV $315
line 320
;320:	case  ITEM_TEXTSTYLE_SHADOWED:			iStyleOR = (int)STYLE_DROPSHADOW;break;	// JK2 drop shadow
ADDRLP4 0
CNSTU4 2147483648
CVUI4 4
ASGNI4
ADDRGP4 $311
JUMPV
LABELV $316
line 321
;321:	case  ITEM_TEXTSTYLE_OUTLINED:			iStyleOR = (int)STYLE_DROPSHADOW;break;	// JK2 drop shadow
ADDRLP4 0
CNSTU4 2147483648
CVUI4 4
ASGNI4
ADDRGP4 $311
JUMPV
LABELV $317
line 322
;322:	case  ITEM_TEXTSTYLE_OUTLINESHADOWED:	iStyleOR = (int)STYLE_DROPSHADOW;break;	// JK2 drop shadow
ADDRLP4 0
CNSTU4 2147483648
CVUI4 4
ASGNI4
ADDRGP4 $311
JUMPV
LABELV $318
line 323
;323:	case  ITEM_TEXTSTYLE_SHADOWEDMORE:		iStyleOR = (int)STYLE_DROPSHADOW;break;	// JK2 drop shadow
ADDRLP4 0
CNSTU4 2147483648
CVUI4 4
ASGNI4
LABELV $310
LABELV $311
line 326
;324:	}
;325:
;326:	trap_R_Font_DrawString(	x,		// int ox
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
BORI4
ARGI4
ADDRFP4 24
INDIRI4
CNSTI4 0
NEI4 $321
ADDRLP4 16
CNSTI4 -1
ASGNI4
ADDRGP4 $322
JUMPV
LABELV $321
ADDRLP4 16
ADDRFP4 24
INDIRI4
ASGNI4
LABELV $322
ADDRLP4 16
INDIRI4
ARGI4
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 trap_R_Font_DrawString
CALLV
pop
line 334
;327:							y,		// int oy
;328:							text,	// const char *text
;329:							color,	// paletteRGBA_c c
;330:							iStyleOR | iFontIndex,	// const int iFontHandle
;331:							!limit?-1:limit,		// iCharLimit (-1 = none)
;332:							scale	// const float scale = 1.0f
;333:							);
;334:}
LABELV $309
endproc Text_Paint 20 28
export Text_PaintWithCursor
proc Text_PaintWithCursor 1076 36
ADDRFP4 24
ADDRFP4 24
INDIRI4
CVII1 4
ASGNI1
line 338
;335:
;336:
;337:void Text_PaintWithCursor(float x, float y, float scale, vec4_t color, const char *text, int cursorPos, char cursor, int limit, int style, int iMenuFont) 
;338:{
line 339
;339:	Text_Paint(x, y, scale, color, text, 0, limit, style, iMenuFont);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 28
INDIRI4
ARGI4
ADDRFP4 32
INDIRI4
ARGI4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 343
;340:
;341:	// now print the cursor as well...  (excuse the braces, it's for porting C++ to C)
;342:	//
;343:	{
line 345
;344:		char sTemp[1024];
;345:		int iCopyCount = limit ? min(strlen(text), limit) : strlen(text);
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $326
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
ADDRFP4 28
INDIRI4
GEI4 $328
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1040
INDIRI4
ASGNI4
ADDRGP4 $329
JUMPV
LABELV $328
ADDRLP4 1032
ADDRFP4 28
INDIRI4
ASGNI4
LABELV $329
ADDRLP4 1028
ADDRLP4 1032
INDIRI4
ASGNI4
ADDRGP4 $327
JUMPV
LABELV $326
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1044
INDIRI4
ASGNI4
LABELV $327
ADDRLP4 0
ADDRLP4 1028
INDIRI4
ASGNI4
line 346
;346:			iCopyCount = min(iCopyCount,cursorPos);
ADDRLP4 0
INDIRI4
ADDRFP4 20
INDIRI4
GEI4 $331
ADDRLP4 1048
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 $332
JUMPV
LABELV $331
ADDRLP4 1048
ADDRFP4 20
INDIRI4
ASGNI4
LABELV $332
ADDRLP4 0
ADDRLP4 1048
INDIRI4
ASGNI4
line 347
;347:			iCopyCount = min(iCopyCount,sizeof(sTemp));
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 1024
GEU4 $334
ADDRLP4 1052
ADDRLP4 0
INDIRI4
CVIU4 4
ASGNU4
ADDRGP4 $335
JUMPV
LABELV $334
ADDRLP4 1052
CNSTU4 1024
ASGNU4
LABELV $335
ADDRLP4 0
ADDRLP4 1052
INDIRU4
CVUI4 4
ASGNI4
line 351
;348:
;349:			// copy text into temp buffer for pixel measure...
;350:			//			
;351:			strncpy(sTemp,text,iCopyCount);
ADDRLP4 4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 352
;352:					sTemp[iCopyCount] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 354
;353:
;354:			{
line 355
;355:				int iFontIndex = MenuFontToHandle( iMenuFont );	
ADDRFP4 36
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 MenuFontToHandle
CALLI4
ASGNI4
ADDRLP4 1056
ADDRLP4 1064
INDIRI4
ASGNI4
line 356
;356:				int iNextXpos  = trap_R_Font_StrLenPixels(sTemp, iFontIndex, scale );
ADDRLP4 4
ARGP4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 1068
ADDRGP4 trap_R_Font_StrLenPixels
CALLI4
ASGNI4
ADDRLP4 1060
ADDRLP4 1068
INDIRI4
ASGNI4
line 358
;357:
;358:				Text_Paint(x+iNextXpos, y, scale, color, va("%c",cursor), 0, limit, style|ITEM_TEXTSTYLE_BLINK, iMenuFont);
ADDRGP4 $336
ARGP4
ADDRFP4 24
INDIRI1
CVII4 1
ARGI4
ADDRLP4 1072
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRF4
ADDRLP4 1060
INDIRI4
CVIF4 4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 28
INDIRI4
ARGI4
ADDRFP4 32
INDIRI4
CNSTI4 1
BORI4
ARGI4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 359
;359:			}
line 360
;360:	}
line 361
;361:}
LABELV $323
endproc Text_PaintWithCursor 1076 36
lit
align 1
LABELV $340
char 1 0
skip 4095
code
proc Text_Paint_Limit 4144 36
line 367
;362:
;363:
;364:// maxX param is initially an X limit, but is also used as feedback. 0 = text was clipped to fit within, else maxX = next pos
;365://
;366:static void Text_Paint_Limit(float *maxX, float x, float y, float scale, vec4_t color, const char* text, float adjust, int limit, int iMenuFont) 
;367:{
line 370
;368:	// this is kinda dirty, but...
;369:	//
;370:	int iFontIndex = MenuFontToHandle(iMenuFont);
ADDRFP4 32
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 MenuFontToHandle
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 373
;371:	
;372:	//float fMax = *maxX;
;373:	int iPixelLen = trap_R_Font_StrLenPixels(text, iFontIndex, scale);
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 trap_R_Font_StrLenPixels
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 374
;374:	if (x + iPixelLen > *maxX)
ADDRFP4 4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDF4
ADDRFP4 0
INDIRP4
INDIRF4
LEF4 $338
line 375
;375:	{
line 379
;376:		// whole text won't fit, so we need to print just the amount that does...
;377:		//  Ok, this is slow and tacky, but only called occasionally, and it works...
;378:		//
;379:		char sTemp[4096]={0};	// lazy assumption
ADDRLP4 24
ADDRGP4 $340
INDIRB
ASGNB 4096
line 380
;380:		const char *psText = text;
ADDRLP4 4120
ADDRFP4 20
INDIRP4
ASGNP4
line 381
;381:		char *psOut = &sTemp[0];
ADDRLP4 16
ADDRLP4 24
ASGNP4
line 382
;382:		char *psOutLastGood = psOut;
ADDRLP4 4124
ADDRLP4 16
INDIRP4
ASGNP4
ADDRGP4 $342
JUMPV
LABELV $341
line 388
;383:		unsigned int uiLetter;
;384:
;385:		while (*psText && (x + trap_R_Font_StrLenPixels(sTemp, iFontIndex, scale)<=*maxX) 
;386:			   && psOut < &sTemp[sizeof(sTemp)-1]	// sanity
;387:				)
;388:		{
line 390
;389:			int iAdvanceCount;
;390:			psOutLastGood = psOut;
ADDRLP4 4124
ADDRLP4 16
INDIRP4
ASGNP4
line 392
;391:			
;392:			uiLetter = trap_AnyLanguage_ReadCharFromString(psText, &iAdvanceCount, NULL);
ADDRLP4 4120
INDIRP4
ARGP4
ADDRLP4 4128
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 4132
ADDRGP4 trap_AnyLanguage_ReadCharFromString
CALLU4
ASGNU4
ADDRLP4 20
ADDRLP4 4132
INDIRU4
ASGNU4
line 393
;393:			psText += iAdvanceCount;
ADDRLP4 4120
ADDRLP4 4128
INDIRI4
ADDRLP4 4120
INDIRP4
ADDP4
ASGNP4
line 395
;394:
;395:			if (uiLetter > 255)
ADDRLP4 20
INDIRU4
CNSTU4 255
LEU4 $345
line 396
;396:			{
line 397
;397:				*psOut++ = uiLetter>>8;
ADDRLP4 4136
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 4136
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4136
INDIRP4
ADDRLP4 20
INDIRU4
CNSTI4 8
RSHU4
CVUI4 4
CVII1 4
ASGNI1
line 398
;398:				*psOut++ = uiLetter&0xFF;
ADDRLP4 4140
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 4140
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4140
INDIRP4
ADDRLP4 20
INDIRU4
CNSTU4 255
BANDU4
CVUI4 4
CVII1 4
ASGNI1
line 399
;399:			}
ADDRGP4 $346
JUMPV
LABELV $345
line 401
;400:			else
;401:			{
line 402
;402:				*psOut++ = uiLetter&0xFF;
ADDRLP4 4136
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 4136
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4136
INDIRP4
ADDRLP4 20
INDIRU4
CNSTU4 255
BANDU4
CVUI4 4
CVII1 4
ASGNI1
line 403
;403:			}
LABELV $346
line 404
;404:		}
LABELV $342
line 385
ADDRLP4 4120
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $348
ADDRLP4 24
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 4128
ADDRGP4 trap_R_Font_StrLenPixels
CALLI4
ASGNI4
ADDRFP4 4
INDIRF4
ADDRLP4 4128
INDIRI4
CVIF4 4
ADDF4
ADDRFP4 0
INDIRP4
INDIRF4
GTF4 $348
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 24+4095
CVPU4 4
LTU4 $341
LABELV $348
line 405
;405:		*psOutLastGood = '\0';
ADDRLP4 4124
INDIRP4
CNSTI1 0
ASGNI1
line 407
;406:
;407:		*maxX = 0;	// feedback
ADDRFP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 408
;408:		Text_Paint(x, y, scale, color, sTemp, adjust, limit, ITEM_TEXTSTYLE_NORMAL, iMenuFont);
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
ADDRLP4 24
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
ADDRGP4 Text_Paint
CALLV
pop
line 409
;409:	}
ADDRGP4 $339
JUMPV
LABELV $338
line 411
;410:	else
;411:	{
line 414
;412:		// whole text fits fine, so print it all...
;413:		//
;414:		*maxX = x + iPixelLen;	// feedback the next position, as the caller expects		
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 415
;415:		Text_Paint(x, y, scale, color, text, adjust, limit, ITEM_TEXTSTYLE_NORMAL, iMenuFont);
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
ADDRGP4 Text_Paint
CALLV
pop
line 416
;416:	}
LABELV $339
line 417
;417:}
LABELV $337
endproc Text_Paint_Limit 4144 36
export UI_ShowPostGame
proc UI_ShowPostGame 0 8
line 420
;418:
;419:
;420:void UI_ShowPostGame(qboolean newHigh) {
line 421
;421:	trap_Cvar_Set ("cg_cameraOrbit", "0");
ADDRGP4 $350
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 422
;422:	trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $352
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 423
;423:	trap_Cvar_Set( "sv_killserver", "1" );
ADDRGP4 $353
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 424
;424:	uiInfo.soundHighScore = newHigh;
ADDRGP4 uiInfo+11836
ADDRFP4 0
INDIRI4
ASGNI4
line 425
;425:  _UI_SetActiveMenu(UIMENU_POSTGAME);
CNSTI4 5
ARGI4
ADDRGP4 _UI_SetActiveMenu
CALLV
pop
line 426
;426:}
LABELV $349
endproc UI_ShowPostGame 0 8
export UI_DrawCenteredPic
proc UI_DrawCenteredPic 8 20
line 433
;427:/*
;428:=================
;429:_UI_Refresh
;430:=================
;431:*/
;432:
;433:void UI_DrawCenteredPic(qhandle_t image, int w, int h) {
line 435
;434:  int x, y;
;435:  x = (SCREEN_WIDTH - w) / 2;
ADDRLP4 0
CNSTI4 640
ADDRFP4 4
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 436
;436:  y = (SCREEN_HEIGHT - h) / 2;
ADDRLP4 4
CNSTI4 480
ADDRFP4 8
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 437
;437:  UI_DrawHandlePic(x, y, w, h, image);
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 438
;438:}
LABELV $356
endproc UI_DrawCenteredPic 8 20
data
export frameCount
align 4
LABELV frameCount
byte 4 0
align 1
LABELV $358
char 1 0
skip 1023
export UI_GetStripEdString
code
proc UI_GetStripEdString 4 12
line 450
;439:
;440:int frameCount = 0;
;441:int startTime;
;442:
;443:vmCvar_t	ui_rankChange;
;444:static void UI_BuildPlayerList();
;445:char parsedFPMessage[1024];
;446:extern int FPMessageTime;
;447:void Text_PaintCenter(float x, float y, float scale, vec4_t color, const char *text, float adjust, int iMenuFont);
;448:
;449:const char *UI_GetStripEdString(const char *refSection, const char *refName)
;450:{
line 453
;451:	static char text[1024]={0};
;452:
;453:	trap_SP_GetStringTextString(va("%s_%s", refSection, refName), text, sizeof(text));
ADDRGP4 $359
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $358
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 454
;454:	return text;
ADDRGP4 $358
RETP4
LABELV $357
endproc UI_GetStripEdString 4 12
bss
align 4
LABELV $361
skip 4
align 4
LABELV $362
skip 16
export _UI_Refresh
code
proc _UI_Refresh 32 20
line 459
;455:}
;456:
;457:#define	UI_FPS_FRAMES	4
;458:void _UI_Refresh( int realtime )
;459:{
line 467
;460:	static int index;
;461:	static int	previousTimes[UI_FPS_FRAMES];
;462:
;463:	//if ( !( trap_Key_GetCatcher() & KEYCATCH_UI ) ) {
;464:	//	return;
;465:	//}
;466:
;467:	uiInfo.uiDC.frameTime = realtime - uiInfo.uiDC.realTime;
ADDRGP4 uiInfo+244
ADDRFP4 0
INDIRI4
ADDRGP4 uiInfo+240
INDIRI4
SUBI4
ASGNI4
line 468
;468:	uiInfo.uiDC.realTime = realtime;
ADDRGP4 uiInfo+240
ADDRFP4 0
INDIRI4
ASGNI4
line 470
;469:
;470:	previousTimes[index % UI_FPS_FRAMES] = uiInfo.uiDC.frameTime;
ADDRGP4 $361
INDIRI4
CNSTI4 4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 $362
ADDP4
ADDRGP4 uiInfo+244
INDIRI4
ASGNI4
line 471
;471:	index++;
ADDRLP4 0
ADDRGP4 $361
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 472
;472:	if ( index > UI_FPS_FRAMES ) {
ADDRGP4 $361
INDIRI4
CNSTI4 4
LEI4 $367
line 475
;473:		int i, total;
;474:		// average multiple frames together to smooth changes out a bit
;475:		total = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 476
;476:		for ( i = 0 ; i < UI_FPS_FRAMES ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $369
line 477
;477:			total += previousTimes[i];
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $362
ADDP4
INDIRI4
ADDI4
ASGNI4
line 478
;478:		}
LABELV $370
line 476
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
LTI4 $369
line 479
;479:		if ( !total ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $373
line 480
;480:			total = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 481
;481:		}
LABELV $373
line 482
;482:		uiInfo.uiDC.FPS = 1000 * UI_FPS_FRAMES / total;
ADDRGP4 uiInfo+11812
CNSTI4 4000
ADDRLP4 8
INDIRI4
DIVI4
CVIF4 4
ASGNF4
line 483
;483:	}
LABELV $367
line 487
;484:
;485:
;486:
;487:	UI_UpdateCvars();
ADDRGP4 UI_UpdateCvars
CALLV
pop
line 489
;488:
;489:	if (Menu_Count() > 0) {
ADDRLP4 4
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $376
line 491
;490:		// paint all the menus
;491:		Menu_PaintAll();
ADDRGP4 Menu_PaintAll
CALLV
pop
line 493
;492:		// refresh server browser list
;493:		UI_DoServerRefresh();
ADDRGP4 UI_DoServerRefresh
CALLV
pop
line 495
;494:		// refresh server status
;495:		UI_BuildServerStatus(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 497
;496:		// refresh find player list
;497:		UI_BuildFindPlayerList(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_BuildFindPlayerList
CALLV
pop
line 498
;498:	} 
LABELV $376
line 501
;499:	
;500:	// draw cursor
;501:	UI_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 502
;502:	if (Menu_Count() > 0) {
ADDRLP4 8
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LEI4 $378
line 503
;503:		UI_DrawHandlePic( uiInfo.uiDC.cursorx, uiInfo.uiDC.cursory, 48, 48, uiInfo.uiDC.Assets.cursor);
ADDRGP4 uiInfo+248
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 uiInfo+252
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
CNSTF4 1111490560
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 uiInfo+260+24
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 504
;504:	}
LABELV $378
line 507
;505:
;506:#ifndef NDEBUG
;507:	if (uiInfo.uiDC.debug)
ADDRGP4 uiInfo+256
INDIRI4
CNSTI4 0
EQI4 $384
line 508
;508:	{
line 512
;509:		// cursor coordinates
;510:		//FIXME
;511:		//UI_DrawString( 0, 0, va("(%d,%d)",uis.cursorx,uis.cursory), UI_LEFT|UI_SMALLFONT, colorRed );
;512:	}
LABELV $384
line 515
;513:#endif
;514:
;515:	if (ui_rankChange.integer)
ADDRGP4 ui_rankChange+12
INDIRI4
CNSTI4 0
EQI4 $387
line 516
;516:	{
line 517
;517:		FPMessageTime = realtime + 3000;
ADDRGP4 FPMessageTime
ADDRFP4 0
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 519
;518:
;519:		if (!parsedFPMessage[0] /*&& uiMaxRank > ui_rankChange.integer*/)
ADDRGP4 parsedFPMessage
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $390
line 520
;520:		{
line 521
;521:			const char *printMessage = UI_GetStripEdString("INGAMETEXT", "SET_NEW_RANK");
ADDRGP4 $206
ARGP4
ADDRGP4 $392
ARGP4
ADDRLP4 28
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 28
INDIRP4
ASGNP4
line 523
;522:
;523:			int i = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 524
;524:			int p = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 525
;525:			int linecount = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 $394
JUMPV
LABELV $393
line 528
;526:
;527:			while (printMessage[i] && p < 1024)
;528:			{
line 529
;529:				parsedFPMessage[p] = printMessage[i];
ADDRLP4 12
INDIRI4
ADDRGP4 parsedFPMessage
ADDP4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 530
;530:				p++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 531
;531:				i++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 532
;532:				linecount++;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 534
;533:
;534:				if (linecount > 64 && printMessage[i] == ' ')
ADDRLP4 24
INDIRI4
CNSTI4 64
LEI4 $396
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $396
line 535
;535:				{
line 536
;536:					parsedFPMessage[p] = '\n';
ADDRLP4 12
INDIRI4
ADDRGP4 parsedFPMessage
ADDP4
CNSTI1 10
ASGNI1
line 537
;537:					p++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 538
;538:					linecount = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 539
;539:				}
LABELV $396
line 540
;540:			}
LABELV $394
line 527
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $398
ADDRLP4 12
INDIRI4
CNSTI4 1024
LTI4 $393
LABELV $398
line 541
;541:			parsedFPMessage[p] = '\0';
ADDRLP4 12
INDIRI4
ADDRGP4 parsedFPMessage
ADDP4
CNSTI1 0
ASGNI1
line 542
;542:		}
LABELV $390
line 545
;543:
;544:		//if (uiMaxRank > ui_rankChange.integer)
;545:		{
line 546
;546:			uiMaxRank = ui_rankChange.integer;
ADDRGP4 uiMaxRank
ADDRGP4 ui_rankChange+12
INDIRI4
ASGNI4
line 547
;547:			uiForceRank = uiMaxRank;
ADDRGP4 uiForceRank
ADDRGP4 uiMaxRank
INDIRI4
ASGNI4
line 561
;548:
;549:			/*
;550:			while (x < NUM_FORCE_POWERS)
;551:			{
;552:				//For now just go ahead and clear force powers upon rank change
;553:				uiForcePowersRank[x] = 0;
;554:				x++;
;555:			}
;556:			uiForcePowersRank[FP_LEVITATION] = 1;
;557:			uiForceUsed = 0;
;558:			*/
;559:
;560:			//Use BG_LegalizedForcePowers and transfer the result into the UI force settings
;561:			UI_ReadLegalForce();
ADDRGP4 UI_ReadLegalForce
CALLV
pop
line 562
;562:		}
line 564
;563:
;564:		if (ui_freeSaber.integer && uiForcePowersRank[FP_SABERATTACK] < 1)
ADDRGP4 ui_freeSaber+12
INDIRI4
CNSTI4 0
EQI4 $400
ADDRGP4 uiForcePowersRank+60
INDIRI4
CNSTI4 1
GEI4 $400
line 565
;565:		{
line 566
;566:			uiForcePowersRank[FP_SABERATTACK] = 1;
ADDRGP4 uiForcePowersRank+60
CNSTI4 1
ASGNI4
line 567
;567:		}
LABELV $400
line 568
;568:		if (ui_freeSaber.integer && uiForcePowersRank[FP_SABERDEFEND] < 1)
ADDRGP4 ui_freeSaber+12
INDIRI4
CNSTI4 0
EQI4 $405
ADDRGP4 uiForcePowersRank+64
INDIRI4
CNSTI4 1
GEI4 $405
line 569
;569:		{
line 570
;570:			uiForcePowersRank[FP_SABERDEFEND] = 1;
ADDRGP4 uiForcePowersRank+64
CNSTI4 1
ASGNI4
line 571
;571:		}
LABELV $405
line 572
;572:		trap_Cvar_Set("ui_rankChange", "0");
ADDRGP4 $410
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 575
;573:
;574:		//remember to update the force power count after changing the max rank
;575:		UpdateForceUsed();
ADDRGP4 UpdateForceUsed
CALLV
pop
line 576
;576:	}
LABELV $387
line 578
;577:
;578:	if (ui_freeSaber.integer)
ADDRGP4 ui_freeSaber+12
INDIRI4
CNSTI4 0
EQI4 $411
line 579
;579:	{
line 580
;580:		bgForcePowerCost[FP_SABERATTACK][FORCE_LEVEL_1] = 0;
ADDRGP4 bgForcePowerCost+240+4
CNSTI4 0
ASGNI4
line 581
;581:		bgForcePowerCost[FP_SABERDEFEND][FORCE_LEVEL_1] = 0;
ADDRGP4 bgForcePowerCost+256+4
CNSTI4 0
ASGNI4
line 582
;582:	}
ADDRGP4 $412
JUMPV
LABELV $411
line 584
;583:	else
;584:	{
line 585
;585:		bgForcePowerCost[FP_SABERATTACK][FORCE_LEVEL_1] = 1;
ADDRGP4 bgForcePowerCost+240+4
CNSTI4 1
ASGNI4
line 586
;586:		bgForcePowerCost[FP_SABERDEFEND][FORCE_LEVEL_1] = 1;
ADDRGP4 bgForcePowerCost+256+4
CNSTI4 1
ASGNI4
line 587
;587:	}
LABELV $412
line 616
;588:
;589:	/*
;590:	if (parsedFPMessage[0] && FPMessageTime > realtime)
;591:	{
;592:		vec4_t txtCol;
;593:		int txtStyle = ITEM_TEXTSTYLE_SHADOWED;
;594:
;595:		if ((FPMessageTime - realtime) < 2000)
;596:		{
;597:			txtCol[0] = colorWhite[0];
;598:			txtCol[1] = colorWhite[1];
;599:			txtCol[2] = colorWhite[2];
;600:			txtCol[3] = (((float)FPMessageTime - (float)realtime)/2000);
;601:
;602:			txtStyle = 0;
;603:		}
;604:		else
;605:		{
;606:			txtCol[0] = colorWhite[0];
;607:			txtCol[1] = colorWhite[1];
;608:			txtCol[2] = colorWhite[2];
;609:			txtCol[3] = colorWhite[3];
;610:		}
;611:
;612:		Text_Paint(10, 0, 1, txtCol, parsedFPMessage, 0, 1024, txtStyle, FONT_MEDIUM);
;613:	}
;614:	*/
;615:	//For now, don't bother.
;616:}
LABELV $360
endproc _UI_Refresh 32 20
export _UI_Shutdown
proc _UI_Shutdown 0 0
line 623
;617:
;618:/*
;619:=================
;620:_UI_Shutdown
;621:=================
;622:*/
;623:void _UI_Shutdown( void ) {
line 624
;624:	trap_LAN_SaveCachedServers();
ADDRGP4 trap_LAN_SaveCachedServers
CALLV
pop
line 625
;625:}
LABELV $422
endproc _UI_Shutdown 0 0
data
export defaultMenu
align 4
LABELV defaultMenu
byte 4 0
bss
align 1
LABELV $424
skip 32768
export GetMenuBuffer
code
proc GetMenuBuffer 16 16
line 629
;626:
;627:char *defaultMenu = NULL;
;628:
;629:char *GetMenuBuffer(const char *filename) {
line 634
;630:	int	len;
;631:	fileHandle_t	f;
;632:	static char buf[MAX_MENUFILE];
;633:
;634:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 635
;635:	if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $425
line 636
;636:		trap_Print( va( S_COLOR_RED "menu file not found: %s, using default\n", filename ) );
ADDRGP4 $427
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 637
;637:		return defaultMenu;
ADDRGP4 defaultMenu
INDIRP4
RETP4
ADDRGP4 $423
JUMPV
LABELV $425
line 639
;638:	}
;639:	if ( len >= MAX_MENUFILE ) {
ADDRLP4 0
INDIRI4
CNSTI4 32768
LTI4 $428
line 640
;640:		trap_Print( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i", filename, len, MAX_MENUFILE ) );
ADDRGP4 $430
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 32768
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 641
;641:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 642
;642:		return defaultMenu;
ADDRGP4 defaultMenu
INDIRP4
RETP4
ADDRGP4 $423
JUMPV
LABELV $428
line 645
;643:	}
;644:
;645:	trap_FS_Read( buf, len, f );
ADDRGP4 $424
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
line 646
;646:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $424
ADDP4
CNSTI1 0
ASGNI1
line 647
;647:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 649
;648:	//COM_Compress(buf);
;649:  return buf;
ADDRGP4 $424
RETP4
LABELV $423
endproc GetMenuBuffer 16 16
export Asset_Parse
proc Asset_Parse 2152 12
line 653
;650:
;651:}
;652:
;653:qboolean Asset_Parse(int handle) {
line 658
;654:	char	stripedFile[MAX_STRING_CHARS];
;655:	pc_token_t token;
;656:	const char *tempStr;
;657:
;658:	if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 2068
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $432
line 659
;659:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $432
line 660
;660:	if (Q_stricmp(token.string, "{") != 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $437
ARGP4
ADDRLP4 2072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
EQI4 $439
line 661
;661:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $438
line 664
;662:	}
;663:    
;664:	while ( 1 ) {
line 666
;665:
;666:		memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 668
;667:
;668:		if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 2076
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
NEI4 $441
line 669
;669:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $441
line 671
;670:
;671:		if (Q_stricmp(token.string, "}") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $446
ARGP4
ADDRLP4 2080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
NEI4 $443
line 672
;672:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $431
JUMPV
LABELV $443
line 676
;673:		}
;674:
;675:		// font
;676:		if (Q_stricmp(token.string, "font") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $450
ARGP4
ADDRLP4 2084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $447
line 678
;677:			int pointSize;
;678:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle,&pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 2092
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 2092
INDIRI4
CNSTI4 0
EQI4 $453
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 2088
ARGP4
ADDRLP4 2096
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 2096
INDIRI4
CNSTI4 0
NEI4 $451
LABELV $453
line 679
;679:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $451
line 682
;680:			}			
;681:			//trap_R_RegisterFont(tempStr, pointSize, &uiInfo.uiDC.Assets.textFont);
;682:			uiInfo.uiDC.Assets.qhMediumFont = trap_R_RegisterFont(tempStr);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 2100
ADDRGP4 trap_R_RegisterFont
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+16
ADDRLP4 2100
INDIRI4
ASGNI4
line 683
;683:			uiInfo.uiDC.Assets.fontRegistered = qtrue;
ADDRGP4 uiInfo+260+132
CNSTI4 1
ASGNI4
line 684
;684:			continue;
ADDRGP4 $439
JUMPV
LABELV $447
line 687
;685:		}
;686:
;687:		if (Q_stricmp(token.string, "smallFont") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $461
ARGP4
ADDRLP4 2088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2088
INDIRI4
CNSTI4 0
NEI4 $458
line 689
;688:			int pointSize;
;689:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle,&pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 2096
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 2096
INDIRI4
CNSTI4 0
EQI4 $464
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 2092
ARGP4
ADDRLP4 2100
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 2100
INDIRI4
CNSTI4 0
NEI4 $462
LABELV $464
line 690
;690:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $462
line 693
;691:			}
;692:			//trap_R_RegisterFont(tempStr, pointSize, &uiInfo.uiDC.Assets.smallFont);
;693:			uiInfo.uiDC.Assets.qhSmallFont = trap_R_RegisterFont(tempStr);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 2104
ADDRGP4 trap_R_RegisterFont
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+12
ADDRLP4 2104
INDIRI4
ASGNI4
line 694
;694:			continue;
ADDRGP4 $439
JUMPV
LABELV $458
line 697
;695:		}
;696:
;697:		if (Q_stricmp(token.string, "bigFont") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $470
ARGP4
ADDRLP4 2092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2092
INDIRI4
CNSTI4 0
NEI4 $467
line 699
;698:			int pointSize;
;699:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle,&pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 2100
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 2100
INDIRI4
CNSTI4 0
EQI4 $473
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 2096
ARGP4
ADDRLP4 2104
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
CNSTI4 0
NEI4 $471
LABELV $473
line 700
;700:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $471
line 703
;701:			}
;702:			//trap_R_RegisterFont(tempStr, pointSize, &uiInfo.uiDC.Assets.bigFont);
;703:			uiInfo.uiDC.Assets.qhBigFont = trap_R_RegisterFont(tempStr);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 2108
ADDRGP4 trap_R_RegisterFont
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+20
ADDRLP4 2108
INDIRI4
ASGNI4
line 704
;704:			continue;
ADDRGP4 $439
JUMPV
LABELV $467
line 707
;705:		}
;706:
;707:		if (Q_stricmp(token.string, "stripedFile") == 0) 
ADDRLP4 0+16
ARGP4
ADDRGP4 $479
ARGP4
ADDRLP4 2096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2096
INDIRI4
CNSTI4 0
NEI4 $476
line 708
;708:		{
line 709
;709:			if (!PC_String_Parse(handle, &tempStr))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 2100
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 2100
INDIRI4
CNSTI4 0
NEI4 $480
line 710
;710:			{
line 711
;711:				Com_Printf(S_COLOR_YELLOW,"Bad 1st parameter for keyword 'stripedFile'");
ADDRGP4 $482
ARGP4
ADDRGP4 $483
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 712
;712:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $480
line 714
;713:			}
;714:			Q_strncpyz( stripedFile, tempStr,  sizeof(stripedFile) );
ADDRLP4 1044
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 715
;715:			trap_SP_Register(stripedFile);
ADDRLP4 1044
ARGP4
ADDRGP4 trap_SP_Register
CALLI4
pop
line 716
;716:			continue;
ADDRGP4 $439
JUMPV
LABELV $476
line 719
;717:		}
;718:
;719:		if (Q_stricmp(token.string, "cursor") == 0) 
ADDRLP4 0+16
ARGP4
ADDRGP4 $487
ARGP4
ADDRLP4 2100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2100
INDIRI4
CNSTI4 0
NEI4 $484
line 720
;720:		{
line 721
;721:			if (!PC_String_Parse(handle, &uiInfo.uiDC.Assets.cursorStr))
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+260+4
ARGP4
ADDRLP4 2104
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
CNSTI4 0
NEI4 $488
line 722
;722:			{
line 723
;723:				Com_Printf(S_COLOR_YELLOW,"Bad 1st parameter for keyword 'cursor'");
ADDRGP4 $482
ARGP4
ADDRGP4 $492
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 724
;724:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $488
line 726
;725:			}
;726:			uiInfo.uiDC.Assets.cursor = trap_R_RegisterShaderNoMip( uiInfo.uiDC.Assets.cursorStr);
ADDRGP4 uiInfo+260+4
INDIRP4
ARGP4
ADDRLP4 2108
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+24
ADDRLP4 2108
INDIRI4
ASGNI4
line 727
;727:			continue;
ADDRGP4 $439
JUMPV
LABELV $484
line 731
;728:		}
;729:
;730:		// gradientbar
;731:		if (Q_stricmp(token.string, "gradientbar") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $500
ARGP4
ADDRLP4 2104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
CNSTI4 0
NEI4 $497
line 732
;732:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 2108
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 2108
INDIRI4
CNSTI4 0
NEI4 $501
line 733
;733:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $501
line 735
;734:			}
;735:			uiInfo.uiDC.Assets.gradientBar = trap_R_RegisterShaderNoMip(tempStr);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 2112
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+28
ADDRLP4 2112
INDIRI4
ASGNI4
line 736
;736:			continue;
ADDRGP4 $439
JUMPV
LABELV $497
line 740
;737:		}
;738:
;739:		// enterMenuSound
;740:		if (Q_stricmp(token.string, "menuEnterSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $508
ARGP4
ADDRLP4 2108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2108
INDIRI4
CNSTI4 0
NEI4 $505
line 741
;741:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 2112
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 2112
INDIRI4
CNSTI4 0
NEI4 $509
line 742
;742:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $509
line 744
;743:			}
;744:			uiInfo.uiDC.Assets.menuEnterSound = trap_S_RegisterSound( tempStr );
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 2116
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+76
ADDRLP4 2116
INDIRI4
ASGNI4
line 745
;745:			continue;
ADDRGP4 $439
JUMPV
LABELV $505
line 749
;746:		}
;747:
;748:		// exitMenuSound
;749:		if (Q_stricmp(token.string, "menuExitSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $516
ARGP4
ADDRLP4 2112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2112
INDIRI4
CNSTI4 0
NEI4 $513
line 750
;750:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 2116
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 2116
INDIRI4
CNSTI4 0
NEI4 $517
line 751
;751:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $517
line 753
;752:			}
;753:			uiInfo.uiDC.Assets.menuExitSound = trap_S_RegisterSound( tempStr );
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 2120
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+80
ADDRLP4 2120
INDIRI4
ASGNI4
line 754
;754:			continue;
ADDRGP4 $439
JUMPV
LABELV $513
line 758
;755:		}
;756:
;757:		// itemFocusSound
;758:		if (Q_stricmp(token.string, "itemFocusSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $524
ARGP4
ADDRLP4 2116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2116
INDIRI4
CNSTI4 0
NEI4 $521
line 759
;759:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 2120
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 2120
INDIRI4
CNSTI4 0
NEI4 $525
line 760
;760:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $525
line 762
;761:			}
;762:			uiInfo.uiDC.Assets.itemFocusSound = trap_S_RegisterSound( tempStr );
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 2124
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+88
ADDRLP4 2124
INDIRI4
ASGNI4
line 763
;763:			continue;
ADDRGP4 $439
JUMPV
LABELV $521
line 767
;764:		}
;765:
;766:		// menuBuzzSound
;767:		if (Q_stricmp(token.string, "menuBuzzSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $532
ARGP4
ADDRLP4 2120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2120
INDIRI4
CNSTI4 0
NEI4 $529
line 768
;768:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 2124
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 2124
INDIRI4
CNSTI4 0
NEI4 $533
line 769
;769:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $533
line 771
;770:			}
;771:			uiInfo.uiDC.Assets.menuBuzzSound = trap_S_RegisterSound( tempStr );
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 2128
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+260+84
ADDRLP4 2128
INDIRI4
ASGNI4
line 772
;772:			continue;
ADDRGP4 $439
JUMPV
LABELV $529
line 775
;773:		}
;774:
;775:		if (Q_stricmp(token.string, "fadeClamp") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $540
ARGP4
ADDRLP4 2124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2124
INDIRI4
CNSTI4 0
NEI4 $537
line 776
;776:			if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.fadeClamp)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+260+92
ARGP4
ADDRLP4 2128
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 2128
INDIRI4
CNSTI4 0
NEI4 $439
line 777
;777:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
line 779
;778:			}
;779:			continue;
LABELV $537
line 782
;780:		}
;781:
;782:		if (Q_stricmp(token.string, "fadeCycle") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $548
ARGP4
ADDRLP4 2128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2128
INDIRI4
CNSTI4 0
NEI4 $545
line 783
;783:			if (!PC_Int_Parse(handle, &uiInfo.uiDC.Assets.fadeCycle)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+260+96
ARGP4
ADDRLP4 2132
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 2132
INDIRI4
CNSTI4 0
NEI4 $439
line 784
;784:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
line 786
;785:			}
;786:			continue;
LABELV $545
line 789
;787:		}
;788:
;789:		if (Q_stricmp(token.string, "fadeAmount") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $556
ARGP4
ADDRLP4 2132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2132
INDIRI4
CNSTI4 0
NEI4 $553
line 790
;790:			if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.fadeAmount)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+260+100
ARGP4
ADDRLP4 2136
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 2136
INDIRI4
CNSTI4 0
NEI4 $439
line 791
;791:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
line 793
;792:			}
;793:			continue;
LABELV $553
line 796
;794:		}
;795:
;796:		if (Q_stricmp(token.string, "shadowX") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $564
ARGP4
ADDRLP4 2136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2136
INDIRI4
CNSTI4 0
NEI4 $561
line 797
;797:			if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.shadowX)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+260+104
ARGP4
ADDRLP4 2140
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 2140
INDIRI4
CNSTI4 0
NEI4 $439
line 798
;798:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
line 800
;799:			}
;800:			continue;
LABELV $561
line 803
;801:		}
;802:
;803:		if (Q_stricmp(token.string, "shadowY") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $572
ARGP4
ADDRLP4 2140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2140
INDIRI4
CNSTI4 0
NEI4 $569
line 804
;804:			if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.shadowY)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+260+108
ARGP4
ADDRLP4 2144
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 2144
INDIRI4
CNSTI4 0
NEI4 $439
line 805
;805:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
line 807
;806:			}
;807:			continue;
LABELV $569
line 810
;808:		}
;809:
;810:		if (Q_stricmp(token.string, "shadowColor") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $580
ARGP4
ADDRLP4 2144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2144
INDIRI4
CNSTI4 0
NEI4 $577
line 811
;811:			if (!PC_Color_Parse(handle, &uiInfo.uiDC.Assets.shadowColor)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+260+112
ARGP4
ADDRLP4 2148
ADDRGP4 PC_Color_Parse
CALLI4
ASGNI4
ADDRLP4 2148
INDIRI4
CNSTI4 0
NEI4 $581
line 812
;812:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $581
line 814
;813:			}
;814:			uiInfo.uiDC.Assets.shadowFadeClamp = uiInfo.uiDC.Assets.shadowColor[3];
ADDRGP4 uiInfo+260+128
ADDRGP4 uiInfo+260+112+12
INDIRF4
ASGNF4
line 815
;815:			continue;
LABELV $577
line 818
;816:		}
;817:
;818:	}
LABELV $439
line 664
ADDRGP4 $438
JUMPV
line 819
;819:	return qfalse;
CNSTI4 0
RETI4
LABELV $431
endproc Asset_Parse 2152 12
export UI_Report
proc UI_Report 0 0
line 823
;820:}
;821:
;822:
;823:void UI_Report() {
line 824
;824:  String_Report();
ADDRGP4 String_Report
CALLV
pop
line 827
;825:  //Font_Report();
;826:
;827:}
LABELV $590
endproc UI_Report 0 0
export UI_ParseMenu
proc UI_ParseMenu 1060 12
line 829
;828:
;829:void UI_ParseMenu(const char *menuFile) {
line 833
;830:	int handle;
;831:	pc_token_t token;
;832:
;833:	Com_Printf("Parsing menu file:%s\n", menuFile);
ADDRGP4 $592
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 835
;834:
;835:	handle = trap_PC_LoadSource(menuFile);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1044
INDIRI4
ASGNI4
line 836
;836:	if (!handle) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $596
line 837
;837:		return;
ADDRGP4 $591
JUMPV
LABELV $595
line 840
;838:	}
;839:
;840:	while ( 1 ) {
line 841
;841:		memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 842
;842:		if (!trap_PC_ReadToken( handle, &token )) {
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1048
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $598
line 843
;843:			break;
ADDRGP4 $597
JUMPV
LABELV $598
line 856
;844:		}
;845:
;846:		//if ( Q_stricmp( token, "{" ) ) {
;847:		//	Com_Printf( "Missing { in menu file\n" );
;848:		//	break;
;849:		//}
;850:
;851:		//if ( menuCount == MAX_MENUS ) {
;852:		//	Com_Printf( "Too many menus!\n" );
;853:		//	break;
;854:		//}
;855:
;856:		if ( token.string[0] == '}' ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $600
line 857
;857:			break;
ADDRGP4 $597
JUMPV
LABELV $600
line 860
;858:		}
;859:
;860:		if (Q_stricmp(token.string, "assetGlobalDef") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $606
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $603
line 861
;861:			if (Asset_Parse(handle)) {
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1056
ADDRGP4 Asset_Parse
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $597
line 862
;862:				continue;
ADDRGP4 $596
JUMPV
line 863
;863:			} else {
line 864
;864:				break;
LABELV $603
line 868
;865:			}
;866:		}
;867:
;868:		if (Q_stricmp(token.string, "menudef") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $612
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $609
line 870
;869:			// start a new menu
;870:			Menu_New(handle);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 Menu_New
CALLV
pop
line 871
;871:		}
LABELV $609
line 872
;872:	}
LABELV $596
line 840
ADDRGP4 $595
JUMPV
LABELV $597
line 873
;873:	trap_PC_FreeSource(handle);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_PC_FreeSource
CALLI4
pop
line 874
;874:}
LABELV $591
endproc UI_ParseMenu 1060 12
export Load_Menu
proc Load_Menu 1048 8
line 876
;875:
;876:qboolean Load_Menu(int handle) {
line 879
;877:	pc_token_t token;
;878:
;879:	if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1040
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $614
line 880
;880:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $613
JUMPV
LABELV $614
line 881
;881:	if (token.string[0] != '{') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $620
line 882
;882:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $613
JUMPV
LABELV $619
line 885
;883:	}
;884:
;885:	while ( 1 ) {
line 887
;886:
;887:		if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $622
line 888
;888:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $613
JUMPV
LABELV $622
line 890
;889:    
;890:		if ( token.string[0] == 0 ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $624
line 891
;891:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $613
JUMPV
LABELV $624
line 894
;892:		}
;893:
;894:		if ( token.string[0] == '}' ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $627
line 895
;895:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $613
JUMPV
LABELV $627
line 898
;896:		}
;897:
;898:		UI_ParseMenu(token.string); 
ADDRLP4 0+16
ARGP4
ADDRGP4 UI_ParseMenu
CALLV
pop
line 899
;899:	}
LABELV $620
line 885
ADDRGP4 $619
JUMPV
line 900
;900:	return qfalse;
CNSTI4 0
RETI4
LABELV $613
endproc Load_Menu 1048 8
export UI_LoadMenus
proc UI_LoadMenus 1068 8
line 903
;901:}
;902:
;903:void UI_LoadMenus(const char *menuFile, qboolean reset) {
line 908
;904:	pc_token_t token;
;905:	int handle;
;906:	int start;
;907:
;908:	start = trap_Milliseconds();
ADDRLP4 1048
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 1048
INDIRI4
ASGNI4
line 910
;909:
;910:	trap_PC_LoadGlobalDefines ( "ui/jk2mp/menudef.h" );
ADDRGP4 $632
ARGP4
ADDRGP4 trap_PC_LoadGlobalDefines
CALLI4
pop
line 912
;911:
;912:	handle = trap_PC_LoadSource( menuFile );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1052
INDIRI4
ASGNI4
line 913
;913:	if (!handle) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $633
line 914
;914:		Com_Printf( S_COLOR_YELLOW "menu file not found: %s, using default\n", menuFile );
ADDRGP4 $635
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 915
;915:		handle = trap_PC_LoadSource( "ui/jk2mpmenus.txt" );
ADDRGP4 $636
ARGP4
ADDRLP4 1056
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1056
INDIRI4
ASGNI4
line 916
;916:		if (!handle) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $637
line 917
;917:			trap_Error( va( S_COLOR_RED "default menu file not found: ui/menus.txt, unable to continue!\n", menuFile ) );
ADDRGP4 $639
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 918
;918:		}
LABELV $637
line 919
;919:	}
LABELV $633
line 921
;920:
;921:	if (reset) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $643
line 922
;922:		Menu_Reset();
ADDRGP4 Menu_Reset
CALLV
pop
line 923
;923:	}
ADDRGP4 $643
JUMPV
LABELV $642
line 925
;924:
;925:	while ( 1 ) {
line 926
;926:		if (!trap_PC_ReadToken(handle, &token))
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1056
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $645
line 927
;927:			break;
ADDRGP4 $644
JUMPV
LABELV $645
line 928
;928:		if( token.string[0] == 0 || token.string[0] == '}') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $651
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $647
LABELV $651
line 929
;929:			break;
ADDRGP4 $644
JUMPV
LABELV $647
line 932
;930:		}
;931:
;932:		if ( token.string[0] == '}' ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $652
line 933
;933:			break;
ADDRGP4 $644
JUMPV
LABELV $652
line 936
;934:		}
;935:
;936:		if (Q_stricmp(token.string, "loadmenu") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $658
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $655
line 937
;937:			if (Load_Menu(handle)) {
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 Load_Menu
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
EQI4 $644
line 938
;938:				continue;
line 939
;939:			} else {
line 940
;940:				break;
LABELV $655
line 943
;941:			}
;942:		}
;943:	}
LABELV $643
line 925
ADDRGP4 $642
JUMPV
LABELV $644
line 945
;944:
;945:	Com_Printf("UI menu load time = %d milli seconds\n", trap_Milliseconds() - start);
ADDRLP4 1056
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRGP4 $661
ARGP4
ADDRLP4 1056
INDIRI4
ADDRLP4 1044
INDIRI4
SUBI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 947
;946:
;947:	trap_PC_FreeSource( handle );
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_PC_FreeSource
CALLI4
pop
line 949
;948:
;949:	trap_PC_RemoveAllGlobalDefines ( );
ADDRGP4 trap_PC_RemoveAllGlobalDefines
CALLV
pop
line 950
;950:}
LABELV $631
endproc UI_LoadMenus 1068 8
export UI_Load
proc UI_Load 1048 8
line 952
;951:
;952:void UI_Load() {
line 955
;953:	char *menuSet;
;954:	char lastName[1024];
;955:	menuDef_t *menu = Menu_GetFocused();
ADDRLP4 1032
ADDRGP4 Menu_GetFocused
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1032
INDIRP4
ASGNP4
line 957
;956:
;957:	if (menu && menu->window.name) {
ADDRLP4 1040
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 1040
INDIRU4
EQU4 $663
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1040
INDIRU4
EQU4 $663
line 958
;958:		strcpy(lastName, menu->window.name);
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 959
;959:	}
ADDRGP4 $664
JUMPV
LABELV $663
line 961
;960:	else
;961:	{
line 962
;962:		lastName[0] = 0;
ADDRLP4 8
CNSTI1 0
ASGNI1
line 963
;963:	}
LABELV $664
line 965
;964:
;965:	if (uiInfo.inGameLoad)
ADDRGP4 uiInfo+95200
INDIRI4
CNSTI4 0
EQI4 $665
line 966
;966:	{
line 967
;967:		menuSet= "ui/jk2mpingame.txt";
ADDRLP4 0
ADDRGP4 $668
ASGNP4
line 968
;968:	}
ADDRGP4 $666
JUMPV
LABELV $665
line 970
;969:	else
;970:	{
line 971
;971:		menuSet= UI_Cvar_VariableString("ui_menuFilesMP");
ADDRGP4 $669
ARGP4
ADDRLP4 1044
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1044
INDIRP4
ASGNP4
line 972
;972:	}
LABELV $666
line 973
;973:	if (menuSet == NULL || menuSet[0] == '\0') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $672
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $670
LABELV $672
line 974
;974:		menuSet = "ui/jk2mpmenus.txt";
ADDRLP4 0
ADDRGP4 $636
ASGNP4
line 975
;975:	}
LABELV $670
line 977
;976:
;977:	String_Init();
ADDRGP4 String_Init
CALLV
pop
line 982
;978:
;979:#ifdef PRE_RELEASE_TADEMO
;980:	UI_ParseGameInfo("demogameinfo.txt");
;981:#else
;982:	UI_ParseGameInfo("ui/jk2mp/gameinfo.txt");
ADDRGP4 $673
ARGP4
ADDRGP4 UI_ParseGameInfo
CALLV
pop
line 984
;983:#endif
;984:	UI_LoadArenas();
ADDRGP4 UI_LoadArenas
CALLV
pop
line 985
;985:	UI_LoadBots();
ADDRGP4 UI_LoadBots
CALLV
pop
line 987
;986:
;987:	UI_LoadMenus(menuSet, qtrue);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 988
;988:	Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 989
;989:	Menus_ActivateByName(lastName);
ADDRLP4 8
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 991
;990:
;991:}
LABELV $662
endproc UI_Load 1048 8
data
align 4
LABELV handicapValues
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
byte 4 0
code
proc UI_DrawHandicap 20 36
line 995
;992:
;993:static const char *handicapValues[] = {"None","95","90","85","80","75","70","65","60","55","50","45","40","35","30","25","20","15","10","5",NULL};
;994:
;995:static void UI_DrawHandicap(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 998
;996:  int i, h;
;997:
;998:  h = Com_Clamp( 5, 100, trap_Cvar_VariableValue("handicap") );
ADDRGP4 $695
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 999
;999:  i = 20 - h / 5;
ADDRLP4 0
CNSTI4 20
ADDRLP4 4
INDIRI4
CNSTI4 5
DIVI4
SUBI4
ASGNI4
line 1001
;1000:
;1001:  Text_Paint(rect->x, rect->y, scale, color, handicapValues[i], 0, 0, textStyle, iMenuFont);
ADDRLP4 16
ADDRFP4 0
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
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 handicapValues
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1002
;1002:}
LABELV $694
endproc UI_DrawHandicap 20 36
proc UI_DrawClanName 8 36
line 1004
;1003:
;1004:static void UI_DrawClanName(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1005
;1005:  Text_Paint(rect->x, rect->y, scale, color, UI_Cvar_VariableString("ui_teamName"), 0, 0, textStyle, iMenuFont);
ADDRGP4 $697
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1006
;1006:}
LABELV $696
endproc UI_DrawClanName 8 36
proc UI_SetCapFragLimits 16 8
line 1009
;1007:
;1008:
;1009:static void UI_SetCapFragLimits(qboolean uiVars) {
line 1010
;1010:	int cap = 5;
ADDRLP4 0
CNSTI4 5
ASGNI4
line 1011
;1011:	int frag = 10;
ADDRLP4 4
CNSTI4 10
ASGNI4
line 1013
;1012:
;1013:	if (uiVars) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $699
line 1014
;1014:		trap_Cvar_Set("ui_captureLimit", va("%d", cap));
ADDRGP4 $702
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $701
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1015
;1015:		trap_Cvar_Set("ui_fragLimit", va("%d", frag));
ADDRGP4 $702
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $703
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1016
;1016:	} else {
ADDRGP4 $700
JUMPV
LABELV $699
line 1017
;1017:		trap_Cvar_Set("capturelimit", va("%d", cap));
ADDRGP4 $702
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $704
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1018
;1018:		trap_Cvar_Set("fraglimit", va("%d", frag));
ADDRGP4 $702
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $705
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1019
;1019:	}
LABELV $700
line 1020
;1020:}
LABELV $698
endproc UI_SetCapFragLimits 16 8
proc UI_DrawGameType 4 36
line 1022
;1021:// ui_gameType assumes gametype 0 is -1 ALL and will not show
;1022:static void UI_DrawGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1023
;1023:  Text_Paint(rect->x, rect->y, scale, color, uiInfo.gameTypes[ui_gameType.integer].gameType, 0, 0, textStyle, iMenuFont);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1024
;1024:}
LABELV $706
endproc UI_DrawGameType 4 36
proc UI_DrawNetGameType 4 36
line 1026
;1025:
;1026:static void UI_DrawNetGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1027
;1027:	if (ui_netGameType.integer < 0 || ui_netGameType.integer > uiInfo.numGameTypes) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 0
LTI4 $715
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRGP4 uiInfo+17744
INDIRI4
LEI4 $710
LABELV $715
line 1028
;1028:		trap_Cvar_Set("ui_netGameType", "0");
ADDRGP4 $716
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1029
;1029:		trap_Cvar_Set("ui_actualNetGameType", "0");
ADDRGP4 $717
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1030
;1030:	}
LABELV $710
line 1031
;1031:  Text_Paint(rect->x, rect->y, scale, color, uiInfo.gameTypes[ui_netGameType.integer].gameType , 0, 0, textStyle, iMenuFont);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1032
;1032:}
LABELV $709
endproc UI_DrawNetGameType 4 36
proc UI_DrawAutoSwitch 28 36
line 1034
;1033:
;1034:static void UI_DrawAutoSwitch(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1035
;1035:	int switchVal = trap_Cvar_VariableValue("cg_autoswitch");
ADDRGP4 $721
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 1036
;1036:	const char *switchString = "AUTOSWITCH1";
ADDRLP4 4
ADDRGP4 $722
ASGNP4
line 1037
;1037:	const char *stripString = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1039
;1038:
;1039:	switch(switchVal)
ADDRLP4 16
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $729
ADDRLP4 16
INDIRI4
CNSTI4 2
EQI4 $725
ADDRLP4 16
INDIRI4
CNSTI4 3
EQI4 $727
ADDRGP4 $724
JUMPV
line 1040
;1040:	{
LABELV $725
line 1042
;1041:	case 2:
;1042:		switchString = "AUTOSWITCH2";
ADDRLP4 4
ADDRGP4 $726
ASGNP4
line 1043
;1043:		break;
ADDRGP4 $724
JUMPV
LABELV $727
line 1045
;1044:	case 3:
;1045:		switchString = "AUTOSWITCH3";
ADDRLP4 4
ADDRGP4 $728
ASGNP4
line 1046
;1046:		break;
ADDRGP4 $724
JUMPV
LABELV $729
line 1048
;1047:	case 0:
;1048:		switchString = "AUTOSWITCH0";
ADDRLP4 4
ADDRGP4 $730
ASGNP4
line 1049
;1049:		break;
line 1051
;1050:	default:
;1051:		break;
LABELV $724
line 1054
;1052:	}
;1053:
;1054:	stripString = UI_GetStripEdString("INGAMETEXT", (char *)switchString);
ADDRGP4 $206
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1056
;1055:
;1056:	if (stripString)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $731
line 1057
;1057:	{
line 1058
;1058:		Text_Paint(rect->x, rect->y, scale, color, stripString, 0, 0, textStyle, iMenuFont);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1059
;1059:	}
LABELV $731
line 1060
;1060:}
LABELV $720
endproc UI_DrawAutoSwitch 28 36
proc UI_DrawJoinGameType 4 36
line 1062
;1061:
;1062:static void UI_DrawJoinGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1063
;1063:	if (ui_joinGameType.integer < 0 || ui_joinGameType.integer > uiInfo.numJoinGameTypes) {
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 0
LTI4 $739
ADDRGP4 ui_joinGameType+12
INDIRI4
ADDRGP4 uiInfo+17876
INDIRI4
LEI4 $734
LABELV $739
line 1064
;1064:		trap_Cvar_Set("ui_joinGameType", "0");
ADDRGP4 $740
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1065
;1065:	}
LABELV $734
line 1066
;1066:  Text_Paint(rect->x, rect->y, scale, color, uiInfo.joinGameTypes[ui_joinGameType.integer].gameType , 0, 0, textStyle, iMenuFont);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17880
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1067
;1067:}
LABELV $733
endproc UI_DrawJoinGameType 4 36
proc UI_TeamIndexFromName 12 8
line 1071
;1068:
;1069:
;1070:
;1071:static int UI_TeamIndexFromName(const char *name) {
line 1074
;1072:  int i;
;1073:
;1074:  if (name && *name) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $744
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $744
line 1075
;1075:    for (i = 0; i < uiInfo.teamCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $749
JUMPV
LABELV $746
line 1076
;1076:      if (Q_stricmp(name, uiInfo.teamList[i].teamName) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $751
line 1077
;1077:        return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $743
JUMPV
LABELV $751
line 1079
;1078:      }
;1079:    }
LABELV $747
line 1075
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $749
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
LTI4 $746
line 1080
;1080:  } 
LABELV $744
line 1082
;1081:
;1082:  return 0;
CNSTI4 0
RETI4
LABELV $743
endproc UI_TeamIndexFromName 12 8
proc UI_DrawClanLogo 48 20
line 1086
;1083:
;1084:}
;1085:
;1086:static void UI_DrawClanLogo(rectDef_t *rect, float scale, vec4_t color) {
line 1088
;1087:  int i;
;1088:  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1089
;1089:  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $755
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
GEI4 $755
line 1090
;1090:  	trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1092
;1091:
;1092:		if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $758
line 1093
;1093:      uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 16
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+14160+40
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1094
;1094:      uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 24
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 uiInfo+14160+44
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1095
;1095:      uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 36
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+14160+48
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 1096
;1096:		}
LABELV $758
line 1098
;1097:
;1098:  	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon);
ADDRLP4 16
ADDRFP4 0
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
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1099
;1099:    trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1100
;1100:  }
LABELV $755
line 1101
;1101:}
LABELV $754
endproc UI_DrawClanLogo 48 20
proc UI_DrawClanCinematic 32 24
line 1103
;1102:
;1103:static void UI_DrawClanCinematic(rectDef_t *rect, float scale, vec4_t color) {
line 1105
;1104:  int i;
;1105:  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1106
;1106:  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $779
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
GEI4 $779
line 1108
;1107:
;1108:		if (uiInfo.teamList[i].cinematic >= -2) {
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
INDIRI4
CNSTI4 -2
LTI4 $782
line 1109
;1109:			if (uiInfo.teamList[i].cinematic == -1) {
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $786
line 1110
;1110:				uiInfo.teamList[i].cinematic = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.teamList[i].imageName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $792
ARGP4
ADDRLP4 16
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 28
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+14160+52
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1111
;1111:			}
LABELV $786
line 1112
;1112:			if (uiInfo.teamList[i].cinematic >= 0) {
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
INDIRI4
CNSTI4 0
LTI4 $795
line 1113
;1113:			  trap_CIN_RunCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1114
;1114:				trap_CIN_SetExtents(uiInfo.teamList[i].cinematic, rect->x, rect->y, rect->w, rect->h);
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1115
;1115:	 			trap_CIN_DrawCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1116
;1116:			} else {
ADDRGP4 $783
JUMPV
LABELV $795
line 1117
;1117:			  	trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1118
;1118:				UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Metal);
ADDRLP4 16
ADDRFP4 0
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
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+44
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1119
;1119:				trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1120
;1120:				uiInfo.teamList[i].cinematic = -2;
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
CNSTI4 -2
ASGNI4
line 1121
;1121:			}
line 1122
;1122:		} else {
ADDRGP4 $783
JUMPV
LABELV $782
line 1123
;1123:	  	trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1124
;1124:			UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon);
ADDRLP4 16
ADDRFP4 0
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
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1125
;1125:			trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1126
;1126:		}
LABELV $783
line 1127
;1127:	}
LABELV $779
line 1129
;1128:
;1129:}
LABELV $778
endproc UI_DrawClanCinematic 32 24
proc UI_DrawPreviewCinematic 16 24
line 1131
;1130:
;1131:static void UI_DrawPreviewCinematic(rectDef_t *rect, float scale, vec4_t color) {
line 1132
;1132:	if (uiInfo.previewMovie > -2) {
ADDRGP4 uiInfo+36380
INDIRI4
CNSTI4 -2
LEI4 $812
line 1133
;1133:		uiInfo.previewMovie = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.movieList[uiInfo.movieIndex]), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $792
ARGP4
ADDRGP4 uiInfo+36376
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+35348
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 8
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRGP4 uiInfo+36380
ADDRLP4 8
INDIRI4
ASGNI4
line 1134
;1134:		if (uiInfo.previewMovie >= 0) {
ADDRGP4 uiInfo+36380
INDIRI4
CNSTI4 0
LTI4 $818
line 1135
;1135:		  trap_CIN_RunCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+36380
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1136
;1136:			trap_CIN_SetExtents(uiInfo.previewMovie, rect->x, rect->y, rect->w, rect->h);
ADDRGP4 uiInfo+36380
INDIRI4
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1137
;1137: 			trap_CIN_DrawCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+36380
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1138
;1138:		} else {
ADDRGP4 $819
JUMPV
LABELV $818
line 1139
;1139:			uiInfo.previewMovie = -2;
ADDRGP4 uiInfo+36380
CNSTI4 -2
ASGNI4
line 1140
;1140:		}
LABELV $819
line 1141
;1141:	} 
LABELV $812
line 1143
;1142:
;1143:}
LABELV $811
endproc UI_DrawPreviewCinematic 16 24
proc UI_DrawSkill 20 36
line 1145
;1144:
;1145:static void UI_DrawSkill(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1147
;1146:  int i;
;1147:	i = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $826
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1148
;1148:  if (i < 1 || i > numSkillLevels) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $829
ADDRLP4 0
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LEI4 $827
LABELV $829
line 1149
;1149:    i = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1150
;1150:  }
LABELV $827
line 1151
;1151:  Text_Paint(rect->x, rect->y, scale, color, (char *)UI_GetStripEdString("INGAMETEXT", (char *)skillLevels[i-1]),0, 0, textStyle, iMenuFont);
ADDRGP4 $206
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skillLevels-4
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
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
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1152
;1152:}
LABELV $825
endproc UI_DrawSkill 20 36
proc UI_DrawGenericNum 268 36
line 1156
;1153:
;1154:
;1155:static void UI_DrawGenericNum(rectDef_t *rect, float scale, vec4_t color, int textStyle, int val, int min, int max, int type,int iMenuFont) 
;1156:{
line 1160
;1157:	int i;
;1158:	char s[256];
;1159:
;1160:	i = val;
ADDRLP4 0
ADDRFP4 16
INDIRI4
ASGNI4
line 1161
;1161:	if (i < min || i > max) 
ADDRLP4 0
INDIRI4
ADDRFP4 20
INDIRI4
LTI4 $834
ADDRLP4 0
INDIRI4
ADDRFP4 24
INDIRI4
LEI4 $832
LABELV $834
line 1162
;1162:	{
line 1163
;1163:		i = min;
ADDRLP4 0
ADDRFP4 20
INDIRI4
ASGNI4
line 1164
;1164:	}
LABELV $832
line 1166
;1165:
;1166:	Com_sprintf(s, sizeof(s), "%i\0", val);
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $835
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1167
;1167:	Text_Paint(rect->x, rect->y, scale, color, s,0, 0, textStyle, iMenuFont);
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
INDIRF4
ARGF4
ADDRLP4 264
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 32
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1168
;1168:}
LABELV $831
endproc UI_DrawGenericNum 268 36
proc UI_DrawForceMastery 20 36
line 1171
;1169:
;1170:static void UI_DrawForceMastery(rectDef_t *rect, float scale, vec4_t color, int textStyle, int val, int min, int max, int iMenuFont)
;1171:{
line 1175
;1172:	int i;
;1173:	char *s;
;1174:
;1175:	i = val;
ADDRLP4 0
ADDRFP4 16
INDIRI4
ASGNI4
line 1176
;1176:	if (i < min || i > max) 
ADDRLP4 0
INDIRI4
ADDRFP4 20
INDIRI4
LTI4 $839
ADDRLP4 0
INDIRI4
ADDRFP4 24
INDIRI4
LEI4 $837
LABELV $839
line 1177
;1177:	{
line 1178
;1178:		i = min;
ADDRLP4 0
ADDRFP4 20
INDIRI4
ASGNI4
line 1179
;1179:	}
LABELV $837
line 1181
;1180:
;1181:	s = (char *)UI_GetStripEdString("INGAMETEXT", forceMasteryLevels[val]);
ADDRGP4 $206
ARGP4
ADDRFP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceMasteryLevels
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 1182
;1182:	Text_Paint(rect->x, rect->y, scale, color, s, 0, 0, textStyle, iMenuFont);
ADDRLP4 16
ADDRFP4 0
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
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1183
;1183:}
LABELV $836
endproc UI_DrawForceMastery 20 36
proc UI_DrawSkinColor 272 36
line 1187
;1184:
;1185:
;1186:static void UI_DrawSkinColor(rectDef_t *rect, float scale, vec4_t color, int textStyle, int val, int min, int max, int iMenuFont)
;1187:{
line 1191
;1188:	int i;
;1189:	char s[256];
;1190:
;1191:	i = val;
ADDRLP4 0
ADDRFP4 16
INDIRI4
ASGNI4
line 1192
;1192:	if (i < min || i > max) 
ADDRLP4 0
INDIRI4
ADDRFP4 20
INDIRI4
LTI4 $843
ADDRLP4 0
INDIRI4
ADDRFP4 24
INDIRI4
LEI4 $841
LABELV $843
line 1193
;1193:	{
line 1194
;1194:		i = min;
ADDRLP4 0
ADDRFP4 20
INDIRI4
ASGNI4
line 1195
;1195:	}
LABELV $841
line 1197
;1196:
;1197:	switch(val)
ADDRLP4 264
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 1
EQI4 $846
ADDRLP4 264
INDIRI4
CNSTI4 2
EQI4 $848
ADDRGP4 $844
JUMPV
line 1198
;1198:	{
LABELV $846
line 1200
;1199:	case TEAM_RED:
;1200:		Com_sprintf(s, sizeof(s), "Red\0");
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $847
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1201
;1201:		break;
ADDRGP4 $845
JUMPV
LABELV $848
line 1203
;1202:	case TEAM_BLUE:
;1203:		Com_sprintf(s, sizeof(s), "Blue\0");
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $849
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1204
;1204:		break;
ADDRGP4 $845
JUMPV
LABELV $844
line 1206
;1205:	default:
;1206:		Com_sprintf(s, sizeof(s), "Default\0");
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $850
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1207
;1207:		break;
LABELV $845
line 1210
;1208:	}
;1209:
;1210:	Text_Paint(rect->x, rect->y, scale, color, s,0, 0, textStyle, iMenuFont);
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 268
INDIRP4
INDIRF4
ARGF4
ADDRLP4 268
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1211
;1211:}
LABELV $840
endproc UI_DrawSkinColor 272 36
proc UI_DrawForceSide 1312 36
line 1214
;1212:
;1213:static void UI_DrawForceSide(rectDef_t *rect, float scale, vec4_t color, int textStyle, int val, int min, int max, int iMenuFont)
;1214:{
line 1221
;1215:	int i;
;1216:	char s[256];
;1217:	menuDef_t *menu;
;1218:	
;1219:	char info[MAX_INFO_VALUE];
;1220:
;1221:	i = val;
ADDRLP4 1028
ADDRFP4 16
INDIRI4
ASGNI4
line 1222
;1222:	if (i < min || i > max) 
ADDRLP4 1028
INDIRI4
ADDRFP4 20
INDIRI4
LTI4 $854
ADDRLP4 1028
INDIRI4
ADDRFP4 24
INDIRI4
LEI4 $852
LABELV $854
line 1223
;1223:	{
line 1224
;1224:		i = min;
ADDRLP4 1028
ADDRFP4 20
INDIRI4
ASGNI4
line 1225
;1225:	}
LABELV $852
line 1227
;1226:
;1227:	info[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1228
;1228:	trap_GetConfigString(CS_SERVERINFO, info, sizeof(info));
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1230
;1229:
;1230:	if (atoi( Info_ValueForKey( info, "g_forceBasedTeams" ) ))
ADDRLP4 4
ARGP4
ADDRGP4 $857
ARGP4
ADDRLP4 1292
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1292
INDIRP4
ARGP4
ADDRLP4 1296
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1296
INDIRI4
CNSTI4 0
EQI4 $855
line 1231
;1231:	{
line 1232
;1232:		switch((int)(trap_Cvar_VariableValue("ui_myteam")))
ADDRGP4 $860
ARGP4
ADDRLP4 1304
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1300
ADDRLP4 1304
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 1300
INDIRI4
CNSTI4 1
EQI4 $862
ADDRLP4 1300
INDIRI4
CNSTI4 2
EQI4 $863
ADDRGP4 $859
JUMPV
line 1233
;1233:		{
LABELV $862
line 1235
;1234:		case TEAM_RED:
;1235:			uiForceSide = FORCE_DARKSIDE;
ADDRGP4 uiForceSide
CNSTI4 2
ASGNI4
line 1236
;1236:			color[0] = 0.2;
ADDRFP4 8
INDIRP4
CNSTF4 1045220557
ASGNF4
line 1237
;1237:			color[1] = 0.2;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1045220557
ASGNF4
line 1238
;1238:			color[2] = 0.2;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1045220557
ASGNF4
line 1239
;1239:			break;
ADDRGP4 $859
JUMPV
LABELV $863
line 1241
;1240:		case TEAM_BLUE:
;1241:			uiForceSide = FORCE_LIGHTSIDE;
ADDRGP4 uiForceSide
CNSTI4 1
ASGNI4
line 1242
;1242:			color[0] = 0.2;
ADDRFP4 8
INDIRP4
CNSTF4 1045220557
ASGNF4
line 1243
;1243:			color[1] = 0.2;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1045220557
ASGNF4
line 1244
;1244:			color[2] = 0.2;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1045220557
ASGNF4
line 1245
;1245:			break;
line 1247
;1246:		default:
;1247:			break;
LABELV $859
line 1249
;1248:		}
;1249:	}
LABELV $855
line 1251
;1250:
;1251:	if (val == FORCE_LIGHTSIDE)
ADDRFP4 16
INDIRI4
CNSTI4 1
NEI4 $864
line 1252
;1252:	{
line 1253
;1253:		trap_SP_GetStringTextString("MENUS3_FORCEDESC_LIGHT",s, sizeof(s));
ADDRGP4 $866
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 1254
;1254:		menu = Menus_FindByName("forcealloc");
ADDRGP4 $867
ARGP4
ADDRLP4 1300
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1300
INDIRP4
ASGNP4
line 1255
;1255:		if (menu)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $868
line 1256
;1256:		{
line 1257
;1257:			Menu_ShowItemByName(menu, "lightpowers", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $870
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1258
;1258:			Menu_ShowItemByName(menu, "darkpowers", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $871
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1259
;1259:			Menu_ShowItemByName(menu, "darkpowers_team", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $872
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1261
;1260:
;1261:			Menu_ShowItemByName(menu, "lightpowers_team", qtrue);//(ui_gameType.integer >= GT_TEAM));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $873
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1263
;1262:
;1263:		}
LABELV $868
line 1264
;1264:		menu = Menus_FindByName("ingame_playerforce");
ADDRGP4 $874
ARGP4
ADDRLP4 1304
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1304
INDIRP4
ASGNP4
line 1265
;1265:		if (menu)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $865
line 1266
;1266:		{
line 1267
;1267:			Menu_ShowItemByName(menu, "lightpowers", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $870
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1268
;1268:			Menu_ShowItemByName(menu, "darkpowers", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $871
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1269
;1269:			Menu_ShowItemByName(menu, "darkpowers_team", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $872
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1271
;1270:
;1271:			Menu_ShowItemByName(menu, "lightpowers_team", qtrue);//(ui_gameType.integer >= GT_TEAM));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $873
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1272
;1272:		}
line 1273
;1273:	}
ADDRGP4 $865
JUMPV
LABELV $864
line 1275
;1274:	else
;1275:	{
line 1276
;1276:		trap_SP_GetStringTextString("MENUS3_FORCEDESC_DARK",s, sizeof(s));
ADDRGP4 $877
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 1277
;1277:		menu = Menus_FindByName("forcealloc");
ADDRGP4 $867
ARGP4
ADDRLP4 1300
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1300
INDIRP4
ASGNP4
line 1278
;1278:		if (menu)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $878
line 1279
;1279:		{
line 1280
;1280:			Menu_ShowItemByName(menu, "lightpowers", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $870
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1281
;1281:			Menu_ShowItemByName(menu, "lightpowers_team", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $873
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1282
;1282:			Menu_ShowItemByName(menu, "darkpowers", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $871
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1284
;1283:
;1284:			Menu_ShowItemByName(menu, "darkpowers_team", qtrue);//(ui_gameType.integer >= GT_TEAM));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $872
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1285
;1285:		}
LABELV $878
line 1286
;1286:		menu = Menus_FindByName("ingame_playerforce");
ADDRGP4 $874
ARGP4
ADDRLP4 1304
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1304
INDIRP4
ASGNP4
line 1287
;1287:		if (menu)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $880
line 1288
;1288:		{
line 1289
;1289:			Menu_ShowItemByName(menu, "lightpowers", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $870
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1290
;1290:			Menu_ShowItemByName(menu, "lightpowers_team", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $873
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1291
;1291:			Menu_ShowItemByName(menu, "darkpowers", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $871
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1293
;1292:
;1293:			Menu_ShowItemByName(menu, "darkpowers_team", qtrue);//(ui_gameType.integer >= GT_TEAM));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $872
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1294
;1294:		}
LABELV $880
line 1295
;1295:	}
LABELV $865
line 1297
;1296:
;1297:	Text_Paint(rect->x, rect->y, scale, color, s,0, 0, textStyle, iMenuFont);
ADDRLP4 1300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1300
INDIRP4
INDIRF4
ARGF4
ADDRLP4 1300
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1298
;1298:}
LABELV $851
endproc UI_DrawForceSide 1312 36
export UI_HasSetSaberOnly
proc UI_HasSetSaberOnly 1052 12
line 1301
;1299:
;1300:qboolean UI_HasSetSaberOnly( void )
;1301:{
line 1303
;1302:	char	info[MAX_INFO_STRING];
;1303:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1304
;1304:	int wDisable = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1305
;1305:	int	gametype = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 1307
;1306:
;1307:	gametype = atoi(Info_ValueForKey(info, "g_gametype"));
ADDRLP4 8
ARGP4
ADDRGP4 $883
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1040
INDIRI4
ASGNI4
line 1309
;1308:
;1309:	if ( gametype == GT_JEDIMASTER )
ADDRLP4 1032
INDIRI4
CNSTI4 2
NEI4 $884
line 1310
;1310:	{ //set to 0 
line 1311
;1311:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $882
JUMPV
LABELV $884
line 1314
;1312:	}
;1313:
;1314:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1316
;1315:
;1316:	if (gametype == GT_TOURNAMENT)
ADDRLP4 1032
INDIRI4
CNSTI4 3
NEI4 $886
line 1317
;1317:	{
line 1318
;1318:		wDisable = atoi(Info_ValueForKey(info, "g_duelWeaponDisable"));
ADDRLP4 8
ARGP4
ADDRGP4 $888
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1048
INDIRI4
ASGNI4
line 1319
;1319:	}
ADDRGP4 $891
JUMPV
LABELV $886
line 1321
;1320:	else
;1321:	{
line 1322
;1322:		wDisable = atoi(Info_ValueForKey(info, "g_weaponDisable"));
ADDRLP4 8
ARGP4
ADDRGP4 $889
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1048
INDIRI4
ASGNI4
line 1323
;1323:	}
ADDRGP4 $891
JUMPV
LABELV $890
line 1326
;1324:
;1325:	while (i < WP_NUM_WEAPONS)
;1326:	{
line 1327
;1327:		if (!(wDisable & (1 << i)) &&
ADDRLP4 1048
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
ADDRLP4 1048
INDIRI4
NEI4 $893
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $893
ADDRLP4 0
INDIRI4
ADDRLP4 1048
INDIRI4
EQI4 $893
line 1329
;1328:			i != WP_SABER && i != WP_NONE)
;1329:		{
line 1330
;1330:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $882
JUMPV
LABELV $893
line 1333
;1331:		}
;1332:
;1333:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1334
;1334:	}
LABELV $891
line 1325
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $890
line 1336
;1335:
;1336:	return qtrue;
CNSTI4 1
RETI4
LABELV $882
endproc UI_HasSetSaberOnly 1052 12
proc UI_AllForceDisabled 4 0
line 1340
;1337:}
;1338:
;1339:static qboolean UI_AllForceDisabled(int force)
;1340:{
line 1343
;1341:	int i;
;1342:
;1343:	if (force)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $896
line 1344
;1344:	{
line 1345
;1345:		for (i=0;i<NUM_FORCE_POWERS;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $898
line 1346
;1346:		{
line 1347
;1347:			if (!(force & (1<<i)))
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $902
line 1348
;1348:			{
line 1349
;1349:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $895
JUMPV
LABELV $902
line 1351
;1350:			}
;1351:		}
LABELV $899
line 1345
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $898
line 1353
;1352:
;1353:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $895
JUMPV
LABELV $896
line 1356
;1354:	}
;1355:
;1356:	return qfalse;
CNSTI4 0
RETI4
LABELV $895
endproc UI_AllForceDisabled 4 0
export UI_TrueJediEnabled
proc UI_TrueJediEnabled 1084 12
line 1360
;1357:}
;1358:
;1359:qboolean UI_TrueJediEnabled( void )
;1360:{
line 1362
;1361:	char	info[MAX_INFO_STRING];
;1362:	int		gametype = 0, disabledForce = 0, trueJedi = 0;
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRLP4 1028
CNSTI4 0
ASGNI4
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 1363
;1363:	qboolean saberOnly = qfalse, allForceDisabled = qfalse;
ADDRLP4 1036
CNSTI4 0
ASGNI4
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 1365
;1364:
;1365:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1370
;1366:
;1367:	//already have serverinfo at this point for stuff below. Don't bother trying to use ui_forcePowerDisable.
;1368:	//if (ui_forcePowerDisable.integer)
;1369:	//if (atoi(Info_ValueForKey(info, "g_forcePowerDisable")))
;1370:	disabledForce = atoi(Info_ValueForKey(info, "g_forcePowerDisable"));
ADDRLP4 0
ARGP4
ADDRGP4 $905
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1048
INDIRI4
ASGNI4
line 1371
;1371:	allForceDisabled = UI_AllForceDisabled(disabledForce);
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 UI_AllForceDisabled
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1052
INDIRI4
ASGNI4
line 1372
;1372:	gametype = atoi(Info_ValueForKey(info, "g_gametype"));
ADDRLP4 0
ARGP4
ADDRGP4 $883
ARGP4
ADDRLP4 1056
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1060
INDIRI4
ASGNI4
line 1373
;1373:	saberOnly = UI_HasSetSaberOnly();
ADDRLP4 1064
ADDRGP4 UI_HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1064
INDIRI4
ASGNI4
line 1375
;1374:
;1375:	if ( gametype == GT_HOLOCRON 
ADDRLP4 1024
INDIRI4
CNSTI4 1
EQI4 $910
ADDRLP4 1024
INDIRI4
CNSTI4 2
EQI4 $910
ADDRLP4 1072
CNSTI4 0
ASGNI4
ADDRLP4 1036
INDIRI4
ADDRLP4 1072
INDIRI4
NEI4 $910
ADDRLP4 1040
INDIRI4
ADDRLP4 1072
INDIRI4
EQI4 $906
LABELV $910
line 1379
;1376:		|| gametype == GT_JEDIMASTER 
;1377:		|| saberOnly 
;1378:		|| allForceDisabled )
;1379:	{
line 1380
;1380:		trueJedi = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 1381
;1381:	}
ADDRGP4 $907
JUMPV
LABELV $906
line 1383
;1382:	else
;1383:	{
line 1384
;1384:		trueJedi = atoi( Info_ValueForKey( info, "g_jediVmerc" ) );
ADDRLP4 0
ARGP4
ADDRGP4 $911
ARGP4
ADDRLP4 1076
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1080
INDIRI4
ASGNI4
line 1385
;1385:	}
LABELV $907
line 1386
;1386:	return (trueJedi != 0);
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $913
ADDRLP4 1076
CNSTI4 1
ASGNI4
ADDRGP4 $914
JUMPV
LABELV $913
ADDRLP4 1076
CNSTI4 0
ASGNI4
LABELV $914
ADDRLP4 1076
INDIRI4
RETI4
LABELV $904
endproc UI_TrueJediEnabled 1084 12
proc UI_DrawJediNonJedi 1296 36
line 1390
;1387:}
;1388:
;1389:static void UI_DrawJediNonJedi(rectDef_t *rect, float scale, vec4_t color, int textStyle, int val, int min, int max, int iMenuFont)
;1390:{
line 1397
;1391:	int i;
;1392:	char s[256];
;1393:	//menuDef_t *menu;
;1394:	
;1395:	char info[MAX_INFO_VALUE];
;1396:
;1397:	i = val;
ADDRLP4 0
ADDRFP4 16
INDIRI4
ASGNI4
line 1398
;1398:	if (i < min || i > max) 
ADDRLP4 0
INDIRI4
ADDRFP4 20
INDIRI4
LTI4 $918
ADDRLP4 0
INDIRI4
ADDRFP4 24
INDIRI4
LEI4 $916
LABELV $918
line 1399
;1399:	{
line 1400
;1400:		i = min;
ADDRLP4 0
ADDRFP4 20
INDIRI4
ASGNI4
line 1401
;1401:	}
LABELV $916
line 1403
;1402:
;1403:	info[0] = '\0';
ADDRLP4 260
CNSTI1 0
ASGNI1
line 1404
;1404:	trap_GetConfigString(CS_SERVERINFO, info, sizeof(info));
CNSTI4 0
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1406
;1405:
;1406:	if ( !UI_TrueJediEnabled() )
ADDRLP4 1288
ADDRGP4 UI_TrueJediEnabled
CALLI4
ASGNI4
ADDRLP4 1288
INDIRI4
CNSTI4 0
NEI4 $919
line 1407
;1407:	{//true jedi mode is not on, do not draw this button type
line 1408
;1408:		return;
ADDRGP4 $915
JUMPV
LABELV $919
line 1411
;1409:	}
;1410:
;1411:	if ( val == FORCE_NONJEDI )
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $921
line 1412
;1412:	{
line 1413
;1413:		trap_SP_GetStringTextString("MENUS0_NO",s, sizeof(s));
ADDRGP4 $923
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 1414
;1414:	}
ADDRGP4 $922
JUMPV
LABELV $921
line 1416
;1415:	else
;1416:	{
line 1417
;1417:		trap_SP_GetStringTextString("MENUS0_YES",s, sizeof(s));
ADDRGP4 $924
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 1418
;1418:	}
LABELV $922
line 1420
;1419:
;1420:	Text_Paint(rect->x, rect->y, scale, color, s,0, 0, textStyle, iMenuFont);
ADDRLP4 1292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1292
INDIRP4
INDIRF4
ARGF4
ADDRLP4 1292
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1421
;1421:}
LABELV $915
endproc UI_DrawJediNonJedi 1296 36
proc UI_DrawTeamName 32 36
line 1423
;1422:
;1423:static void UI_DrawTeamName(rectDef_t *rect, float scale, vec4_t color, qboolean blue, int textStyle, int iMenuFont) {
line 1425
;1424:  int i;
;1425:  i = UI_TeamIndexFromName(UI_Cvar_VariableString((blue) ? "ui_blueTeam" : "ui_redTeam"));
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $929
ADDRLP4 4
ADDRGP4 $926
ASGNP4
ADDRGP4 $930
JUMPV
LABELV $929
ADDRLP4 4
ADDRGP4 $927
ASGNP4
LABELV $930
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1426
;1426:  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $931
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
GEI4 $931
line 1427
;1427:    Text_Paint(rect->x, rect->y, scale, color, va("%s: %s", (blue) ? "Blue" : "Red", uiInfo.teamList[i].teamName),0, 0, textStyle, iMenuFont);
ADDRGP4 $934
ARGP4
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $939
ADDRLP4 20
ADDRGP4 $935
ASGNP4
ADDRGP4 $940
JUMPV
LABELV $939
ADDRLP4 20
ADDRGP4 $936
ASGNP4
LABELV $940
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1428
;1428:  }
LABELV $931
line 1429
;1429:}
LABELV $925
endproc UI_DrawTeamName 32 36
proc UI_DrawTeamMember 56 36
line 1432
;1430:
;1431:static void UI_DrawTeamMember(rectDef_t *rect, float scale, vec4_t color, qboolean blue, int num, int textStyle, int iMenuFont) 
;1432:{
line 1436
;1433:	// 0 - None
;1434:	// 1 - Human
;1435:	// 2..NumCharacters - Bot
;1436:	int value = trap_Cvar_VariableValue(va(blue ? "ui_blueteam%i" : "ui_redteam%i", num));
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $945
ADDRLP4 32
ADDRGP4 $942
ASGNP4
ADDRGP4 $946
JUMPV
LABELV $945
ADDRLP4 32
ADDRGP4 $943
ASGNP4
LABELV $946
ADDRLP4 32
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 40
INDIRF4
CVFI4 4
ASGNI4
line 1438
;1437:	const char *text;
;1438:	int maxcl = trap_Cvar_VariableValue( "sv_maxClients" );
ADDRGP4 $947
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 44
INDIRF4
CVFI4 4
ASGNI4
line 1440
;1439:	vec4_t finalColor;
;1440:	int numval = num;
ADDRLP4 20
ADDRFP4 16
INDIRI4
ASGNI4
line 1442
;1441:
;1442:	numval *= 2;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1444
;1443:
;1444:	if (blue)
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $948
line 1445
;1445:	{
line 1446
;1446:		numval -= 1;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1447
;1447:	}
LABELV $948
line 1449
;1448:
;1449:	finalColor[0] = color[0];
ADDRLP4 0
ADDRFP4 8
INDIRP4
INDIRF4
ASGNF4
line 1450
;1450:	finalColor[1] = color[1];
ADDRLP4 0+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1451
;1451:	finalColor[2] = color[2];
ADDRLP4 0+8
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 1452
;1452:	finalColor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1454
;1453:
;1454:	if (numval > maxcl)
ADDRLP4 20
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $953
line 1455
;1455:	{
line 1456
;1456:		finalColor[0] *= 0.2;
ADDRLP4 0
CNSTF4 1045220557
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 1457
;1457:		finalColor[1] *= 0.2;
ADDRLP4 0+4
CNSTF4 1045220557
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
line 1458
;1458:		finalColor[2] *= 0.2;
ADDRLP4 0+8
CNSTF4 1045220557
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 1460
;1459:
;1460:		value = -1;
ADDRLP4 16
CNSTI4 -1
ASGNI4
line 1461
;1461:	}
LABELV $953
line 1463
;1462:
;1463:	if (value <= 1) {
ADDRLP4 16
INDIRI4
CNSTI4 1
GTI4 $957
line 1464
;1464:		if (value == -1)
ADDRLP4 16
INDIRI4
CNSTI4 -1
NEI4 $959
line 1465
;1465:		{
line 1467
;1466:			//text = "Closed";
;1467:			text = UI_GetStripEdString("MENUS3", "CLOSED");
ADDRGP4 $961
ARGP4
ADDRGP4 $962
ARGP4
ADDRLP4 48
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 48
INDIRP4
ASGNP4
line 1468
;1468:		}
ADDRGP4 $958
JUMPV
LABELV $959
line 1470
;1469:		else
;1470:		{
line 1472
;1471:			//text = "Human";
;1472:			text = UI_GetStripEdString("MENUS3", "HUMAN");
ADDRGP4 $961
ARGP4
ADDRGP4 $963
ARGP4
ADDRLP4 48
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 48
INDIRP4
ASGNP4
line 1473
;1473:		}
line 1474
;1474:	} else {
ADDRGP4 $958
JUMPV
LABELV $957
line 1475
;1475:		value -= 2;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 1483
;1476:
;1477:		/*if (ui_actualNetGameType.integer >= GT_TEAM) {
;1478:			if (value >= uiInfo.characterCount) {
;1479:				value = 0;
;1480:			}
;1481:			text = uiInfo.characterList[value].name;
;1482:		} else {*/
;1483:			if (value >= UI_GetNumBots()) {
ADDRLP4 48
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $964
line 1484
;1484:				value = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 1485
;1485:			}
LABELV $964
line 1486
;1486:			text = UI_GetBotNameByNumber(value);
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 52
INDIRP4
ASGNP4
line 1488
;1487:		//}
;1488:	}
LABELV $958
line 1490
;1489:
;1490:  Text_Paint(rect->x, rect->y, scale, finalColor, text, 0, 0, textStyle, iMenuFont);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
INDIRF4
ARGF4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1491
;1491:}
LABELV $941
endproc UI_DrawTeamMember 56 36
proc UI_DrawEffects 4 20
line 1494
;1492:
;1493:static void UI_DrawEffects(rectDef_t *rect, float scale, vec4_t color) 
;1494:{
line 1495
;1495:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiSaberColorShaders[uiInfo.effectsColor]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 uiInfo+95196
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiSaberColorShaders
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1496
;1496:}
LABELV $966
endproc UI_DrawEffects 4 20
proc UI_DrawMapPreview 20 20
line 1498
;1497:
;1498:static void UI_DrawMapPreview(rectDef_t *rect, float scale, vec4_t color, qboolean net) {
line 1499
;1499:	int map = (net) ? ui_currentNetMap.integer : ui_currentMap.integer;
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $972
ADDRLP4 4
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $973
JUMPV
LABELV $972
ADDRLP4 4
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $973
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1500
;1500:	if (map < 0 || map > uiInfo.mapCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $977
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
LEI4 $974
LABELV $977
line 1501
;1501:		if (net) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $978
line 1502
;1502:			ui_currentNetMap.integer = 0;
ADDRGP4 ui_currentNetMap+12
CNSTI4 0
ASGNI4
line 1503
;1503:			trap_Cvar_Set("ui_currentNetMap", "0");
ADDRGP4 $981
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1504
;1504:		} else {
ADDRGP4 $979
JUMPV
LABELV $978
line 1505
;1505:			ui_currentMap.integer = 0;
ADDRGP4 ui_currentMap+12
CNSTI4 0
ASGNI4
line 1506
;1506:			trap_Cvar_Set("ui_currentMap", "0");
ADDRGP4 $983
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1507
;1507:		}
LABELV $979
line 1508
;1508:		map = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1509
;1509:	}
LABELV $974
line 1511
;1510:
;1511:	if (uiInfo.mapList[map].levelShot == -1) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+92
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $984
line 1512
;1512:		uiInfo.mapList[map].levelShot = trap_R_RegisterShaderNoMip(uiInfo.mapList[map].imageName);
ADDRLP4 12
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+20348+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+20348+92
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1513
;1513:	}
LABELV $984
line 1515
;1514:
;1515:	if (uiInfo.mapList[map].levelShot > 0) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+92
ADDP4
INDIRI4
CNSTI4 0
LEI4 $992
line 1516
;1516:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.mapList[map].levelShot);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+92
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1517
;1517:	} else {
ADDRGP4 $993
JUMPV
LABELV $992
line 1518
;1518:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, trap_R_RegisterShaderNoMip("menu/art/unknownmap"));
ADDRGP4 $998
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 16
ADDRFP4 0
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
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1519
;1519:	}
LABELV $993
line 1520
;1520:}						 
LABELV $968
endproc UI_DrawMapPreview 20 20
proc UI_DrawMapTimeToBeat 20 36
line 1523
;1521:
;1522:
;1523:static void UI_DrawMapTimeToBeat(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1525
;1524:	int minutes, seconds, time;
;1525:	if (ui_currentMap.integer < 0 || ui_currentMap.integer > uiInfo.mapCount) {
ADDRGP4 ui_currentMap+12
INDIRI4
CNSTI4 0
LTI4 $1005
ADDRGP4 ui_currentMap+12
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
LEI4 $1000
LABELV $1005
line 1526
;1526:		ui_currentMap.integer = 0;
ADDRGP4 ui_currentMap+12
CNSTI4 0
ASGNI4
line 1527
;1527:		trap_Cvar_Set("ui_currentMap", "0");
ADDRGP4 $983
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1528
;1528:	}
LABELV $1000
line 1530
;1529:
;1530:	time = uiInfo.mapList[ui_currentMap.integer].timeToBeat[uiInfo.gameTypes[ui_gameType.integer].gtEnum];
ADDRLP4 0
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+28
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1532
;1531:
;1532:	minutes = time / 60;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 1533
;1533:	seconds = time % 60;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 60
MODI4
ASGNI4
line 1535
;1534:
;1535:  Text_Paint(rect->x, rect->y, scale, color, va("%02i:%02i", minutes, seconds), 0, 0, textStyle, iMenuFont);
ADDRGP4 $1013
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
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
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1536
;1536:}
LABELV $999
endproc UI_DrawMapTimeToBeat 20 36
proc UI_DrawMapCinematic 28 24
line 1540
;1537:
;1538:
;1539:
;1540:static void UI_DrawMapCinematic(rectDef_t *rect, float scale, vec4_t color, qboolean net) {
line 1542
;1541:
;1542:	int map = (net) ? ui_currentNetMap.integer : ui_currentMap.integer; 
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1018
ADDRLP4 4
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $1019
JUMPV
LABELV $1018
ADDRLP4 4
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $1019
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1543
;1543:	if (map < 0 || map > uiInfo.mapCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1023
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
LEI4 $1020
LABELV $1023
line 1544
;1544:		if (net) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1024
line 1545
;1545:			ui_currentNetMap.integer = 0;
ADDRGP4 ui_currentNetMap+12
CNSTI4 0
ASGNI4
line 1546
;1546:			trap_Cvar_Set("ui_currentNetMap", "0");
ADDRGP4 $981
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1547
;1547:		} else {
ADDRGP4 $1025
JUMPV
LABELV $1024
line 1548
;1548:			ui_currentMap.integer = 0;
ADDRGP4 ui_currentMap+12
CNSTI4 0
ASGNI4
line 1549
;1549:			trap_Cvar_Set("ui_currentMap", "0");
ADDRGP4 $983
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1550
;1550:		}
LABELV $1025
line 1551
;1551:		map = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1552
;1552:	}
LABELV $1020
line 1554
;1553:
;1554:	if (uiInfo.mapList[map].cinematic >= -1) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
INDIRI4
CNSTI4 -1
LTI4 $1028
line 1555
;1555:		if (uiInfo.mapList[map].cinematic == -1) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1032
line 1556
;1556:			uiInfo.mapList[map].cinematic = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.mapList[map].mapLoadName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $792
ARGP4
ADDRLP4 12
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 24
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+20348+24
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1557
;1557:		}
LABELV $1032
line 1558
;1558:		if (uiInfo.mapList[map].cinematic >= 0) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
INDIRI4
CNSTI4 0
LTI4 $1040
line 1559
;1559:		  trap_CIN_RunCinematic(uiInfo.mapList[map].cinematic);
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1560
;1560:		  trap_CIN_SetExtents(uiInfo.mapList[map].cinematic, rect->x, rect->y, rect->w, rect->h);
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1561
;1561: 			trap_CIN_DrawCinematic(uiInfo.mapList[map].cinematic);
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1562
;1562:		} else {
ADDRGP4 $1029
JUMPV
LABELV $1040
line 1563
;1563:			uiInfo.mapList[map].cinematic = -2;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
CNSTI4 -2
ASGNI4
line 1564
;1564:		}
line 1565
;1565:	} else {
ADDRGP4 $1029
JUMPV
LABELV $1028
line 1566
;1566:		UI_DrawMapPreview(rect, scale, color, net);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_DrawMapPreview
CALLV
pop
line 1567
;1567:	}
LABELV $1029
line 1568
;1568:}
LABELV $1014
endproc UI_DrawMapCinematic 28 24
proc UI_SetForceDisabled 8 0
line 1571
;1569:
;1570:static void UI_SetForceDisabled(int force)
;1571:{
line 1572
;1572:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1574
;1573:
;1574:	if (force)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1053
line 1575
;1575:	{
ADDRGP4 $1056
JUMPV
LABELV $1055
line 1577
;1576:		while (i < NUM_FORCE_POWERS)
;1577:		{
line 1578
;1578:			if (force & (1 << i))
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1058
line 1579
;1579:			{
line 1580
;1580:				uiForcePowersDisabled[i] = qtrue;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersDisabled
ADDP4
CNSTI4 1
ASGNI4
line 1582
;1581:
;1582:				if (i != FP_LEVITATION && i != FP_SABERATTACK && i != FP_SABERDEFEND)
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $1060
ADDRLP4 0
INDIRI4
CNSTI4 15
EQI4 $1060
ADDRLP4 0
INDIRI4
CNSTI4 16
EQI4 $1060
line 1583
;1583:				{
line 1584
;1584:					uiForcePowersRank[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
CNSTI4 0
ASGNI4
line 1585
;1585:				}
ADDRGP4 $1059
JUMPV
LABELV $1060
line 1587
;1586:				else
;1587:				{
line 1588
;1588:					if (i == FP_LEVITATION)
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $1062
line 1589
;1589:					{
line 1590
;1590:						uiForcePowersRank[i] = 1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
CNSTI4 1
ASGNI4
line 1591
;1591:					}
ADDRGP4 $1059
JUMPV
LABELV $1062
line 1593
;1592:					else
;1593:					{
line 1594
;1594:						uiForcePowersRank[i] = 3;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
CNSTI4 3
ASGNI4
line 1595
;1595:					}
line 1596
;1596:				}
line 1597
;1597:			}
ADDRGP4 $1059
JUMPV
LABELV $1058
line 1599
;1598:			else
;1599:			{
line 1600
;1600:				uiForcePowersDisabled[i] = qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersDisabled
ADDP4
CNSTI4 0
ASGNI4
line 1601
;1601:			}
LABELV $1059
line 1602
;1602:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1603
;1603:		}
LABELV $1056
line 1576
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $1055
line 1604
;1604:	}
ADDRGP4 $1054
JUMPV
LABELV $1053
line 1606
;1605:	else
;1606:	{
line 1607
;1607:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1065
JUMPV
LABELV $1064
line 1610
;1608:
;1609:		while (i < NUM_FORCE_POWERS)
;1610:		{
line 1611
;1611:			uiForcePowersDisabled[i] = qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersDisabled
ADDP4
CNSTI4 0
ASGNI4
line 1612
;1612:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1613
;1613:		}
LABELV $1065
line 1609
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $1064
line 1614
;1614:	}
LABELV $1054
line 1615
;1615:}
LABELV $1052
endproc UI_SetForceDisabled 8 0
export UpdateForceStatus
proc UpdateForceStatus 1084 12
line 1618
;1616:
;1617:void UpdateForceStatus()
;1618:{
line 1635
;1619:	menuDef_t *menu;
;1620:
;1621:	// Currently we don't make a distinction between those that wish to play Jedi of lower than maximum skill.
;1622:/*	if (ui_forcePowerDisable.integer)
;1623:	{
;1624:		uiForceRank = 0;
;1625:		uiForceAvailable = 0;
;1626:		uiForceUsed = 0;
;1627:	}
;1628:	else
;1629:	{
;1630:		uiForceRank = uiMaxRank;
;1631:		uiForceUsed = 0;
;1632:		uiForceAvailable = forceMasteryPoints[uiForceRank];
;1633:	}
;1634:*/
;1635:	menu = Menus_FindByName("ingame_player");
ADDRGP4 $1068
ARGP4
ADDRLP4 4
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1636
;1636:	if (menu)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1069
line 1637
;1637:	{
line 1639
;1638:		char	info[MAX_INFO_STRING];
;1639:		int		disabledForce = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1640
;1640:		qboolean trueJedi = qfalse, allForceDisabled = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1642
;1641:
;1642:		trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 20
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1647
;1643:
;1644:		//already have serverinfo at this point for stuff below. Don't bother trying to use ui_forcePowerDisable.
;1645:		//if (ui_forcePowerDisable.integer)
;1646:		//if (atoi(Info_ValueForKey(info, "g_forcePowerDisable")))
;1647:		disabledForce = atoi(Info_ValueForKey(info, "g_forcePowerDisable"));
ADDRLP4 20
ARGP4
ADDRGP4 $905
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 1048
INDIRI4
ASGNI4
line 1648
;1648:		allForceDisabled = UI_AllForceDisabled(disabledForce);
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 UI_AllForceDisabled
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 1052
INDIRI4
ASGNI4
line 1649
;1649:		trueJedi = UI_TrueJediEnabled();
ADDRLP4 1056
ADDRGP4 UI_TrueJediEnabled
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1056
INDIRI4
ASGNI4
line 1651
;1650:
;1651:		if ( !trueJedi || allForceDisabled )
ADDRLP4 1060
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 1060
INDIRI4
EQI4 $1073
ADDRLP4 12
INDIRI4
ADDRLP4 1060
INDIRI4
EQI4 $1071
LABELV $1073
line 1652
;1652:		{
line 1653
;1653:			Menu_ShowItemByName(menu, "jedinonjedi", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1074
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1654
;1654:		}
ADDRGP4 $1072
JUMPV
LABELV $1071
line 1656
;1655:		else
;1656:		{
line 1657
;1657:			Menu_ShowItemByName(menu, "jedinonjedi", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1074
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1658
;1658:		}
LABELV $1072
line 1659
;1659:		if ( allForceDisabled == qtrue || (trueJedi && uiJediNonJedi == FORCE_NONJEDI) )
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $1077
ADDRLP4 1064
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 1064
INDIRI4
EQI4 $1075
ADDRGP4 uiJediNonJedi
INDIRI4
ADDRLP4 1064
INDIRI4
NEI4 $1075
LABELV $1077
line 1660
;1660:		{	// No force stuff
line 1661
;1661:			Menu_ShowItemByName(menu, "noforce", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1078
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1662
;1662:			Menu_ShowItemByName(menu, "yesforce", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1079
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1664
;1663:			// We don't want the saber explanation to say "configure saber attack 1" since we can't.
;1664:			Menu_ShowItemByName(menu, "sabernoneconfigme", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1080
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1665
;1665:		}
ADDRGP4 $1076
JUMPV
LABELV $1075
line 1667
;1666:		else
;1667:		{
line 1668
;1668:			UI_SetForceDisabled(disabledForce);
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 UI_SetForceDisabled
CALLV
pop
line 1669
;1669:			Menu_ShowItemByName(menu, "noforce", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1078
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1670
;1670:			Menu_ShowItemByName(menu, "yesforce", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1079
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1671
;1671:		}
LABELV $1076
line 1674
;1672:
;1673:		//Moved this to happen after it's done with force power disabling stuff
;1674:		if (uiForcePowersRank[FP_SABERATTACK] > 0 || ui_freeSaber.integer)
ADDRLP4 1068
CNSTI4 0
ASGNI4
ADDRGP4 uiForcePowersRank+60
INDIRI4
ADDRLP4 1068
INDIRI4
GTI4 $1085
ADDRGP4 ui_freeSaber+12
INDIRI4
ADDRLP4 1068
INDIRI4
EQI4 $1081
LABELV $1085
line 1675
;1675:		{	// Show lightsaber stuff.
line 1676
;1676:			Menu_ShowItemByName(menu, "nosaber", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1086
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1677
;1677:			Menu_ShowItemByName(menu, "yessaber", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1087
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1678
;1678:		}
ADDRGP4 $1082
JUMPV
LABELV $1081
line 1680
;1679:		else
;1680:		{
line 1681
;1681:			Menu_ShowItemByName(menu, "nosaber", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1086
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1682
;1682:			Menu_ShowItemByName(menu, "yessaber", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1087
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1683
;1683:		}
LABELV $1082
line 1686
;1684:
;1685:		// The leftmost button should be "apply" unless you are in spectator, where you can join any team.
;1686:		if ((int)(trap_Cvar_VariableValue("ui_myteam")) != TEAM_SPECTATOR)
ADDRGP4 $860
ARGP4
ADDRLP4 1072
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1072
INDIRF4
CVFI4 4
CNSTI4 3
EQI4 $1088
line 1687
;1687:		{
line 1688
;1688:			Menu_ShowItemByName(menu, "playerapply", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1090
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1689
;1689:			Menu_ShowItemByName(menu, "playerforcejoin", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1091
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1690
;1690:			Menu_ShowItemByName(menu, "playerforcered", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1092
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1691
;1691:			Menu_ShowItemByName(menu, "playerforceblue", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1093
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1692
;1692:			Menu_ShowItemByName(menu, "playerforcespectate", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1094
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1693
;1693:		}
ADDRGP4 $1089
JUMPV
LABELV $1088
line 1695
;1694:		else
;1695:		{
line 1697
;1696:			// Set or reset buttons based on choices
;1697:			if (atoi(Info_ValueForKey(info, "g_gametype")) >= GT_TEAM)
ADDRLP4 20
ARGP4
ADDRGP4 $883
ARGP4
ADDRLP4 1076
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 5
LTI4 $1095
line 1698
;1698:			{	// This is a team-based game.
line 1699
;1699:				Menu_ShowItemByName(menu, "playerforcespectate", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1094
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1702
;1700:				
;1701:				// This is disabled, always show both sides from spectator.
;1702:				if ( 0 && atoi(Info_ValueForKey(info, "g_forceBasedTeams")))
ADDRGP4 $1097
JUMPV
line 1703
;1703:				{	// Show red or blue based on what side is chosen.
line 1704
;1704:					if (uiForceSide==FORCE_LIGHTSIDE)
ADDRGP4 uiForceSide
INDIRI4
CNSTI4 1
NEI4 $1099
line 1705
;1705:					{
line 1706
;1706:						Menu_ShowItemByName(menu, "playerforcered", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1092
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1707
;1707:						Menu_ShowItemByName(menu, "playerforceblue", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1093
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1708
;1708:					}
ADDRGP4 $1096
JUMPV
LABELV $1099
line 1709
;1709:					else if (uiForceSide==FORCE_DARKSIDE)
ADDRGP4 uiForceSide
INDIRI4
CNSTI4 2
NEI4 $1101
line 1710
;1710:					{
line 1711
;1711:						Menu_ShowItemByName(menu, "playerforcered", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1092
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1712
;1712:						Menu_ShowItemByName(menu, "playerforceblue", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1093
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1713
;1713:					}
ADDRGP4 $1096
JUMPV
LABELV $1101
line 1715
;1714:					else
;1715:					{
line 1716
;1716:						Menu_ShowItemByName(menu, "playerforcered", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1092
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1717
;1717:						Menu_ShowItemByName(menu, "playerforceblue", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1093
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1718
;1718:					}
line 1719
;1719:				}
ADDRGP4 $1096
JUMPV
LABELV $1097
line 1721
;1720:				else
;1721:				{
line 1722
;1722:					Menu_ShowItemByName(menu, "playerforcered", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1092
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1723
;1723:					Menu_ShowItemByName(menu, "playerforceblue", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1093
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1724
;1724:				}
line 1725
;1725:			}
ADDRGP4 $1096
JUMPV
LABELV $1095
line 1727
;1726:			else
;1727:			{
line 1728
;1728:				Menu_ShowItemByName(menu, "playerforcered", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1092
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1729
;1729:				Menu_ShowItemByName(menu, "playerforceblue", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1093
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1730
;1730:			}
LABELV $1096
line 1732
;1731:
;1732:			Menu_ShowItemByName(menu, "playerapply", qfalse);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1090
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1733
;1733:			Menu_ShowItemByName(menu, "playerforcejoin", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1091
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1734
;1734:			Menu_ShowItemByName(menu, "playerforcespectate", qtrue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1094
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ShowItemByName
CALLV
pop
line 1735
;1735:		}
LABELV $1089
line 1736
;1736:	}
LABELV $1069
line 1739
;1737:
;1738:
;1739:	if ( !UI_TrueJediEnabled() )
ADDRLP4 8
ADDRGP4 UI_TrueJediEnabled
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1103
line 1740
;1740:	{// Take the current team and force a skin color based on it.
line 1741
;1741:		switch((int)(trap_Cvar_VariableValue("ui_myteam")))
ADDRGP4 $860
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $1108
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $1110
ADDRGP4 $1105
JUMPV
line 1742
;1742:		{
LABELV $1108
line 1744
;1743:		case TEAM_RED:
;1744:			uiSkinColor = TEAM_RED;
ADDRGP4 uiSkinColor
CNSTI4 1
ASGNI4
line 1745
;1745:			uiInfo.effectsColor = SABER_RED;
ADDRGP4 uiInfo+95196
CNSTI4 0
ASGNI4
line 1746
;1746:			break;
ADDRGP4 $1106
JUMPV
LABELV $1110
line 1748
;1747:		case TEAM_BLUE:
;1748:			uiSkinColor = TEAM_BLUE;
ADDRGP4 uiSkinColor
CNSTI4 2
ASGNI4
line 1749
;1749:			uiInfo.effectsColor = SABER_BLUE;
ADDRGP4 uiInfo+95196
CNSTI4 4
ASGNI4
line 1750
;1750:			break;
ADDRGP4 $1106
JUMPV
LABELV $1105
line 1752
;1751:		default:
;1752:			uiSkinColor = TEAM_FREE;
ADDRGP4 uiSkinColor
CNSTI4 0
ASGNI4
line 1753
;1753:			break;
LABELV $1106
line 1755
;1754:		}
;1755:	}
LABELV $1103
line 1756
;1756:}
LABELV $1067
endproc UpdateForceStatus 1084 12
data
align 4
LABELV updateModel
byte 4 1
align 4
LABELV q3Model
byte 4 0
code
proc UI_DrawNetSource 12 36
line 1807
;1757:
;1758:
;1759:
;1760:static qboolean updateModel = qtrue;
;1761:static qboolean q3Model = qfalse;
;1762:/*
;1763:
;1764:static void UI_DrawPlayerModel(rectDef_t *rect) {
;1765:  static playerInfo_t info;
;1766:  char model[MAX_QPATH];
;1767:  char team[256];
;1768:	char head[256];
;1769:	vec3_t	viewangles;
;1770:	vec3_t	moveangles;
;1771:
;1772:	  if (trap_Cvar_VariableValue("ui_Q3Model")) {
;1773:	  strcpy(model, UI_Cvar_VariableString("model"));
;1774:		strcpy(head, UI_Cvar_VariableString("headmodel"));
;1775:		if (!q3Model) {
;1776:			q3Model = qtrue;
;1777:			updateModel = qtrue;
;1778:		}
;1779:		team[0] = '\0';
;1780:	} else {
;1781:
;1782:		strcpy(team, UI_Cvar_VariableString("ui_teamName"));
;1783:		strcpy(model, UI_Cvar_VariableString("team_model"));
;1784:		strcpy(head, UI_Cvar_VariableString("team_headmodel"));
;1785:		if (q3Model) {
;1786:			q3Model = qfalse;
;1787:			updateModel = qtrue;
;1788:		}
;1789:	}
;1790:  if (updateModel) {
;1791:  	memset( &info, 0, sizeof(playerInfo_t) );
;1792:  	viewangles[YAW]   = 180 - 10;
;1793:  	viewangles[PITCH] = 0;
;1794:  	viewangles[ROLL]  = 0;
;1795:  	VectorClear( moveangles );
;1796:    UI_PlayerInfo_SetModel( &info, model, head, team);
;1797:    UI_PlayerInfo_SetInfo( &info, TORSO_WEAPONREADY3, TORSO_WEAPONREADY3, viewangles, vec3_origin, WP_BRYAR_PISTOL, qfalse );
;1798://		UI_RegisterClientModelname( &info, model, head, team);
;1799:    updateModel = qfalse;
;1800:  }
;1801:
;1802:  UI_DrawPlayer( rect->x, rect->y, rect->w, rect->h, &info, uiInfo.uiDC.realTime / 2);
;1803:
;1804:}
;1805:*/
;1806:static void UI_DrawNetSource(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) 
;1807:{
line 1808
;1808:	if (ui_netSource.integer < 0 || ui_netSource.integer > uiInfo.numGameTypes) 
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
LTI4 $1118
ADDRGP4 ui_netSource+12
INDIRI4
ADDRGP4 uiInfo+17744
INDIRI4
LEI4 $1113
LABELV $1118
line 1809
;1809:	{
line 1810
;1810:		ui_netSource.integer = 0;
ADDRGP4 ui_netSource+12
CNSTI4 0
ASGNI4
line 1811
;1811:	}
LABELV $1113
line 1813
;1812:
;1813:	trap_SP_GetStringTextString("MENUS3_SOURCE", holdSPString, sizeof(holdSPString) );
ADDRGP4 $1120
ARGP4
ADDRGP4 holdSPString
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 1814
;1814:	Text_Paint(rect->x, rect->y, scale, color, va("%s %s",holdSPString,
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 GetNetSourceString
CALLP4
ASGNP4
ADDRGP4 $1121
ARGP4
ADDRGP4 holdSPString
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1816
;1815:		 GetNetSourceString(ui_netSource.integer)), 0, 0, textStyle, iMenuFont);
;1816:}
LABELV $1112
endproc UI_DrawNetSource 12 36
proc UI_DrawNetMapPreview 8 20
line 1818
;1817:
;1818:static void UI_DrawNetMapPreview(rectDef_t *rect, float scale, vec4_t color) {
line 1820
;1819:
;1820:	if (uiInfo.serverStatus.currentServerPreview > 0) {
ADDRGP4 uiInfo+40740+10428
INDIRI4
CNSTI4 0
LEI4 $1124
line 1821
;1821:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.serverStatus.currentServerPreview);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 uiInfo+40740+10428
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1822
;1822:	} else {
ADDRGP4 $1125
JUMPV
LABELV $1124
line 1823
;1823:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, trap_R_RegisterShaderNoMip("menu/art/unknownmap"));
ADDRGP4 $998
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1824
;1824:	}
LABELV $1125
line 1825
;1825:}
LABELV $1123
endproc UI_DrawNetMapPreview 8 20
proc UI_DrawNetMapCinematic 4 20
line 1827
;1826:
;1827:static void UI_DrawNetMapCinematic(rectDef_t *rect, float scale, vec4_t color) {
line 1828
;1828:	if (ui_currentNetMap.integer < 0 || ui_currentNetMap.integer > uiInfo.mapCount) {
ADDRGP4 ui_currentNetMap+12
INDIRI4
CNSTI4 0
LTI4 $1136
ADDRGP4 ui_currentNetMap+12
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
LEI4 $1131
LABELV $1136
line 1829
;1829:		ui_currentNetMap.integer = 0;
ADDRGP4 ui_currentNetMap+12
CNSTI4 0
ASGNI4
line 1830
;1830:		trap_Cvar_Set("ui_currentNetMap", "0");
ADDRGP4 $981
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1831
;1831:	}
LABELV $1131
line 1833
;1832:
;1833:	if (uiInfo.serverStatus.currentServerCinematic >= 0) {
ADDRGP4 uiInfo+40740+10432
INDIRI4
CNSTI4 0
LTI4 $1138
line 1834
;1834:	  trap_CIN_RunCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+40740+10432
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1835
;1835:	  trap_CIN_SetExtents(uiInfo.serverStatus.currentServerCinematic, rect->x, rect->y, rect->w, rect->h);
ADDRGP4 uiInfo+40740+10432
INDIRI4
ARGI4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1836
;1836: 	  trap_CIN_DrawCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+40740+10432
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1837
;1837:	} else {
ADDRGP4 $1139
JUMPV
LABELV $1138
line 1838
;1838:		UI_DrawNetMapPreview(rect, scale, color);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawNetMapPreview
CALLV
pop
line 1839
;1839:	}
LABELV $1139
line 1840
;1840:}
LABELV $1130
endproc UI_DrawNetMapCinematic 4 20
proc UI_DrawNetFilter 8 36
line 1845
;1841:
;1842:
;1843:
;1844:static void UI_DrawNetFilter(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) 
;1845:{
line 1846
;1846:	if (ui_serverFilterType.integer < 0 || ui_serverFilterType.integer > numServerFilters) 
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
LTI4 $1153
ADDRGP4 ui_serverFilterType+12
INDIRI4
ADDRGP4 numServerFilters
INDIRI4
LEI4 $1149
LABELV $1153
line 1847
;1847:	{
line 1848
;1848:		ui_serverFilterType.integer = 0;
ADDRGP4 ui_serverFilterType+12
CNSTI4 0
ASGNI4
line 1849
;1849:	}
LABELV $1149
line 1851
;1850:
;1851:	trap_SP_GetStringTextString("MENUS3_GAME", holdSPString, sizeof(holdSPString));
ADDRGP4 $1155
ARGP4
ADDRGP4 holdSPString
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 1852
;1852:	Text_Paint(rect->x, rect->y, scale, color, va("%s %s",holdSPString,
ADDRGP4 $1121
ARGP4
ADDRGP4 holdSPString
ARGP4
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverFilters
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1854
;1853:		 serverFilters[ui_serverFilterType.integer].description), 0, 0, textStyle, iMenuFont);
;1854:}
LABELV $1148
endproc UI_DrawNetFilter 8 36
proc UI_DrawTier 20 36
line 1857
;1855:
;1856:
;1857:static void UI_DrawTier(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1859
;1858:  int i;
;1859:	i = trap_Cvar_VariableValue( "ui_currentTier" );
ADDRGP4 $1158
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1860
;1860:  if (i < 0 || i >= uiInfo.tierCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1162
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+33148
INDIRI4
LTI4 $1159
LABELV $1162
line 1861
;1861:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1862
;1862:  }
LABELV $1159
line 1863
;1863:  Text_Paint(rect->x, rect->y, scale, color, va("Tier: %s", uiInfo.tierList[i].tierName),0, 0, textStyle, iMenuFont);
ADDRGP4 $1163
ARGP4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+33152
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
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
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1864
;1864:}
LABELV $1157
endproc UI_DrawTier 20 36
proc UI_DrawTierMap 28 20
line 1866
;1865:
;1866:static void UI_DrawTierMap(rectDef_t *rect, int index) {
line 1868
;1867:  int i;
;1868:	i = trap_Cvar_VariableValue( "ui_currentTier" );
ADDRGP4 $1158
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1869
;1869:  if (i < 0 || i >= uiInfo.tierCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1169
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+33148
INDIRI4
LTI4 $1166
LABELV $1169
line 1870
;1870:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1871
;1871:  }
LABELV $1166
line 1873
;1872:
;1873:	if (uiInfo.tierList[i].mapHandles[index] == -1) {
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+33152+28
ADDP4
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1170
line 1874
;1874:		uiInfo.tierList[i].mapHandles[index] = trap_R_RegisterShaderNoMip(va("levelshots/%s", uiInfo.tierList[i].maps[index]));
ADDRGP4 $1176
ARGP4
ADDRLP4 12
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 16
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+33152+4
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+33152+28
ADDP4
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1875
;1875:	}
LABELV $1170
line 1877
;1876:												 
;1877:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.tierList[i].mapHandles[index]);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+33152+28
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1878
;1878:}
LABELV $1165
endproc UI_DrawTierMap 28 20
proc UI_EnglishMapName 8 8
line 1880
;1879:
;1880:static const char *UI_EnglishMapName(const char *map) {
line 1882
;1881:	int i;
;1882:	for (i = 0; i < uiInfo.mapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1185
JUMPV
LABELV $1182
line 1883
;1883:		if (Q_stricmp(map, uiInfo.mapList[i].mapLoadName) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1187
line 1884
;1884:			return uiInfo.mapList[i].mapName;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348
ADDP4
INDIRP4
RETP4
ADDRGP4 $1181
JUMPV
LABELV $1187
line 1886
;1885:		}
;1886:	}
LABELV $1183
line 1882
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1185
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
LTI4 $1182
line 1887
;1887:	return "";
ADDRGP4 $165
RETP4
LABELV $1181
endproc UI_EnglishMapName 8 8
proc UI_DrawTierMapName 32 36
line 1890
;1888:}
;1889:
;1890:static void UI_DrawTierMapName(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1892
;1891:  int i, j;
;1892:	i = trap_Cvar_VariableValue( "ui_currentTier" );
ADDRGP4 $1158
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 1893
;1893:  if (i < 0 || i >= uiInfo.tierCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1196
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+33148
INDIRI4
LTI4 $1193
LABELV $1196
line 1894
;1894:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1895
;1895:  }
LABELV $1193
line 1896
;1896:	j = trap_Cvar_VariableValue("ui_currentMap");
ADDRGP4 $983
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1897
;1897:	if (j < 0 || j > MAPS_PER_TIER) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1199
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $1197
LABELV $1199
line 1898
;1898:		j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1899
;1899:	}
LABELV $1197
line 1901
;1900:
;1901:  Text_Paint(rect->x, rect->y, scale, color, UI_EnglishMapName(uiInfo.tierList[i].maps[j]), 0, 0, textStyle, iMenuFont);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+33152+4
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 UI_EnglishMapName
CALLP4
ASGNP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1902
;1902:}
LABELV $1192
endproc UI_DrawTierMapName 32 36
proc UI_DrawTierGameType 28 36
line 1904
;1903:
;1904:static void UI_DrawTierGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 1906
;1905:  int i, j;
;1906:	i = trap_Cvar_VariableValue( "ui_currentTier" );
ADDRGP4 $1158
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 1907
;1907:  if (i < 0 || i >= uiInfo.tierCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1206
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+33148
INDIRI4
LTI4 $1203
LABELV $1206
line 1908
;1908:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1909
;1909:  }
LABELV $1203
line 1910
;1910:	j = trap_Cvar_VariableValue("ui_currentMap");
ADDRGP4 $983
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1911
;1911:	if (j < 0 || j > MAPS_PER_TIER) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1209
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $1207
LABELV $1209
line 1912
;1912:		j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1913
;1913:	}
LABELV $1207
line 1915
;1914:
;1915:  Text_Paint(rect->x, rect->y, scale, color, uiInfo.gameTypes[uiInfo.tierList[i].gameTypes[j]].gameType , 0, 0, textStyle,iMenuFont);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+33152+16
ADDP4
ADDP4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1916
;1916:}
LABELV $1202
endproc UI_DrawTierGameType 28 36
proc UI_AIFromName 8 8
line 1919
;1917:
;1918:
;1919:static const char *UI_AIFromName(const char *name) {
line 1921
;1920:	int j;
;1921:	for (j = 0; j < uiInfo.aliasCount; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1217
JUMPV
LABELV $1214
line 1922
;1922:		if (Q_stricmp(uiInfo.aliasList[j].name, name) == 0) {
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+13388
ADDP4
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
NEI4 $1219
line 1923
;1923:			return uiInfo.aliasList[j].ai;
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+13388+4
ADDP4
INDIRP4
RETP4
ADDRGP4 $1213
JUMPV
LABELV $1219
line 1925
;1924:		}
;1925:	}
LABELV $1215
line 1921
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1217
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+13384
INDIRI4
LTI4 $1214
line 1926
;1926:	return "Kyle";
ADDRGP4 $1224
RETP4
LABELV $1213
endproc UI_AIFromName 8 8
proc UI_NextOpponent 24 8
line 1961
;1927:}
;1928:
;1929:
;1930:/*
;1931:static qboolean updateOpponentModel = qtrue;
;1932:static void UI_DrawOpponent(rectDef_t *rect) {
;1933:  static playerInfo_t info2;
;1934:  char model[MAX_QPATH];
;1935:  char headmodel[MAX_QPATH];
;1936:  char team[256];
;1937:	vec3_t	viewangles;
;1938:	vec3_t	moveangles;
;1939:  
;1940:	if (updateOpponentModel) {
;1941:		
;1942:		strcpy(model, UI_Cvar_VariableString("ui_opponentModel"));
;1943:	  strcpy(headmodel, UI_Cvar_VariableString("ui_opponentModel"));
;1944:		team[0] = '\0';
;1945:
;1946:  	memset( &info2, 0, sizeof(playerInfo_t) );
;1947:  	viewangles[YAW]   = 180 - 10;
;1948:  	viewangles[PITCH] = 0;
;1949:  	viewangles[ROLL]  = 0;
;1950:  	VectorClear( moveangles );
;1951:    UI_PlayerInfo_SetModel( &info2, model, headmodel, "");
;1952:    UI_PlayerInfo_SetInfo( &info2, TORSO_WEAPONREADY3, TORSO_WEAPONREADY3, viewangles, vec3_origin, WP_BRYAR_PISTOL, qfalse );
;1953:		UI_RegisterClientModelname( &info2, model, headmodel, team);
;1954:    updateOpponentModel = qfalse;
;1955:  }
;1956:
;1957:  UI_DrawPlayer( rect->x, rect->y, rect->w, rect->h, &info2, uiInfo.uiDC.realTime / 2);
;1958:
;1959:}
;1960:*/
;1961:static void UI_NextOpponent() {
line 1962
;1962:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1226
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1963
;1963:  int j = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 16
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 1964
;1964:	i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1965
;1965:	if (i >= uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
LTI4 $1227
line 1966
;1966:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1967
;1967:	}
LABELV $1227
line 1968
;1968:	if (i == j) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1230
line 1969
;1969:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1970
;1970:		if ( i >= uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
LTI4 $1232
line 1971
;1971:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1972
;1972:		}
LABELV $1232
line 1973
;1973:	}
LABELV $1230
line 1974
;1974: 	trap_Cvar_Set( "ui_opponentName", uiInfo.teamList[i].teamName );
ADDRGP4 $1226
ARGP4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1975
;1975:}
LABELV $1225
endproc UI_NextOpponent 24 8
proc UI_PriorOpponent 24 8
line 1977
;1976:
;1977:static void UI_PriorOpponent() {
line 1978
;1978:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1226
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1979
;1979:  int j = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 16
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 1980
;1980:	i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1981
;1981:	if (i < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1237
line 1982
;1982:		i = uiInfo.teamCount - 1;
ADDRLP4 0
ADDRGP4 uiInfo+14156
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1983
;1983:	}
LABELV $1237
line 1984
;1984:	if (i == j) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1240
line 1985
;1985:		i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1986
;1986:		if ( i < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1242
line 1987
;1987:			i = uiInfo.teamCount - 1;
ADDRLP4 0
ADDRGP4 uiInfo+14156
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1988
;1988:		}
LABELV $1242
line 1989
;1989:	}
LABELV $1240
line 1990
;1990: 	trap_Cvar_Set( "ui_opponentName", uiInfo.teamList[i].teamName );
ADDRGP4 $1226
ARGP4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1991
;1991:}
LABELV $1236
endproc UI_PriorOpponent 24 8
proc UI_DrawPlayerLogo 44 20
line 1993
;1992:
;1993:static void	UI_DrawPlayerLogo(rectDef_t *rect, vec3_t color) {
line 1994
;1994:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1996
;1995:
;1996:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1247
line 1997
;1997:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1998
;1998:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 20
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+44
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1999
;1999:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 32
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+48
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2000
;2000:	}
LABELV $1247
line 2002
;2001:
;2002: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2003
;2003:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2004
;2004: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2005
;2005:}
LABELV $1246
endproc UI_DrawPlayerLogo 44 20
proc UI_DrawPlayerLogoMetal 44 20
line 2007
;2006:
;2007:static void	UI_DrawPlayerLogoMetal(rectDef_t *rect, vec3_t color) {
line 2008
;2008:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2009
;2009:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1266
line 2010
;2010:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2011
;2011:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 20
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+44
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2012
;2012:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 32
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+48
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2013
;2013:	}
LABELV $1266
line 2015
;2014:
;2015: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2016
;2016:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Metal );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+44
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2017
;2017: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2018
;2018:}
LABELV $1265
endproc UI_DrawPlayerLogoMetal 44 20
proc UI_DrawPlayerLogoName 44 20
line 2020
;2019:
;2020:static void	UI_DrawPlayerLogoName(rectDef_t *rect, vec3_t color) {
line 2021
;2021:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2022
;2022:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1285
line 2023
;2023:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2024
;2024:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 20
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+44
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2025
;2025:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 32
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+48
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2026
;2026:	}
LABELV $1285
line 2028
;2027:
;2028: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2029
;2029:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Name );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+48
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2030
;2030: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2031
;2031:}
LABELV $1284
endproc UI_DrawPlayerLogoName 44 20
proc UI_DrawOpponentLogo 44 20
line 2033
;2032:
;2033:static void	UI_DrawOpponentLogo(rectDef_t *rect, vec3_t color) {
line 2034
;2034:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1226
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2035
;2035:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1304
line 2036
;2036:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2037
;2037:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 20
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+44
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2038
;2038:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 32
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+48
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2039
;2039:	}
LABELV $1304
line 2041
;2040:
;2041: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2042
;2042:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2043
;2043: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2044
;2044:}
LABELV $1303
endproc UI_DrawOpponentLogo 44 20
proc UI_DrawOpponentLogoMetal 44 20
line 2046
;2045:
;2046:static void	UI_DrawOpponentLogoMetal(rectDef_t *rect, vec3_t color) {
line 2047
;2047:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1226
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2048
;2048:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1323
line 2049
;2049:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2050
;2050:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 20
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+44
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2051
;2051:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 32
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+48
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2052
;2052:	}
LABELV $1323
line 2054
;2053:
;2054: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2055
;2055:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Metal );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+44
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2056
;2056: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2057
;2057:}
LABELV $1322
endproc UI_DrawOpponentLogoMetal 44 20
proc UI_DrawOpponentLogoName 44 20
line 2059
;2058:
;2059:static void	UI_DrawOpponentLogoName(rectDef_t *rect, vec3_t color) {
line 2060
;2060:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1226
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2061
;2061:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+40
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1342
line 2062
;2062:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+14160+40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 2063
;2063:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 20
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+14160+44
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 2064
;2064:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 32
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+14160+48
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2065
;2065:	}
LABELV $1342
line 2067
;2066:
;2067: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2068
;2068:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Name );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+48
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2069
;2069: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2070
;2070:}
LABELV $1341
endproc UI_DrawOpponentLogoName 44 20
proc UI_DrawAllMapsSelection 16 36
line 2072
;2071:
;2072:static void UI_DrawAllMapsSelection(rectDef_t *rect, float scale, vec4_t color, int textStyle, qboolean net, int iMenuFont) {
line 2073
;2073:	int map = (net) ? ui_currentNetMap.integer : ui_currentMap.integer;
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $1364
ADDRLP4 4
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $1365
JUMPV
LABELV $1364
ADDRLP4 4
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $1365
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 2074
;2074:	if (map >= 0 && map < uiInfo.mapCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1366
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
GEI4 $1366
line 2075
;2075:	  Text_Paint(rect->x, rect->y, scale, color, uiInfo.mapList[map].mapName, 0, 0, textStyle, iMenuFont);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2076
;2076:	}
LABELV $1366
line 2077
;2077:}
LABELV $1360
endproc UI_DrawAllMapsSelection 16 36
proc UI_DrawOpponentName 8 36
line 2079
;2078:
;2079:static void UI_DrawOpponentName(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 2080
;2080:  Text_Paint(rect->x, rect->y, scale, color, UI_Cvar_VariableString("ui_opponentName"), 0, 0, textStyle, iMenuFont);
ADDRGP4 $1226
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2081
;2081:}
LABELV $1370
endproc UI_DrawOpponentName 8 36
proc UI_OwnerDrawWidth 156 12
line 2083
;2082:
;2083:static int UI_OwnerDrawWidth(int ownerDraw, float scale) {
line 2084
;2084:	int i, h, value, findex, iUse = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2086
;2085:	const char *text;
;2086:	const char *s = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2089
;2087:
;2088:
;2089:  switch (ownerDraw) {
ADDRLP4 28
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 200
LTI4 $1373
ADDRLP4 28
INDIRI4
CNSTI4 289
GTI4 $1373
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1475-800
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1475
address $1374
address $1373
address $1373
address $1407
address $1373
address $1408
address $1373
address $1411
address $1416
address $1421
address $1426
address $1426
address $1426
address $1426
address $1426
address $1437
address $1437
address $1437
address $1437
address $1437
address $1446
address $1373
address $1455
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1472
address $1373
address $1373
address $1468
address $1373
address $1373
address $1373
address $1373
address $1373
address $1373
address $1381
address $1398
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1402
address $1373
address $1373
address $1373
address $1426
address $1426
address $1426
address $1437
address $1437
address $1437
address $1373
address $1375
address $1373
address $1389
code
LABELV $1374
line 2091
;2090:    case UI_HANDICAP:
;2091:			  h = Com_Clamp( 5, 100, trap_Cvar_VariableValue("handicap") );
ADDRGP4 $695
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 36
INDIRF4
CVFI4 4
ASGNI4
line 2092
;2092:				i = 20 - h / 5;
ADDRLP4 4
CNSTI4 20
ADDRLP4 24
INDIRI4
CNSTI4 5
DIVI4
SUBI4
ASGNI4
line 2093
;2093:				s = handicapValues[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 handicapValues
ADDP4
INDIRP4
ASGNP4
line 2094
;2094:      break;
ADDRGP4 $1373
JUMPV
LABELV $1375
line 2096
;2095:    case UI_SKIN_COLOR:
;2096:		switch(uiSkinColor)
ADDRLP4 40
ADDRGP4 uiSkinColor
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 1
EQI4 $1378
ADDRLP4 40
INDIRI4
CNSTI4 2
EQI4 $1379
ADDRGP4 $1376
JUMPV
line 2097
;2097:		{
LABELV $1378
line 2099
;2098:		case TEAM_RED:
;2099:			s = "Red";
ADDRLP4 0
ADDRGP4 $936
ASGNP4
line 2100
;2100:			break;
ADDRGP4 $1373
JUMPV
LABELV $1379
line 2102
;2101:		case TEAM_BLUE:
;2102:			s = "Blue";
ADDRLP4 0
ADDRGP4 $935
ASGNP4
line 2103
;2103:			break;
ADDRGP4 $1373
JUMPV
LABELV $1376
line 2105
;2104:		default:
;2105:			s = "Default";
ADDRLP4 0
ADDRGP4 $1380
ASGNP4
line 2106
;2106:			break;
line 2108
;2107:		}
;2108:		break;
ADDRGP4 $1373
JUMPV
LABELV $1381
line 2110
;2109:    case UI_FORCE_SIDE:
;2110:		i = uiForceSide;
ADDRLP4 4
ADDRGP4 uiForceSide
INDIRI4
ASGNI4
line 2111
;2111:		if (i < 1 || i > 2) {
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $1384
ADDRLP4 4
INDIRI4
CNSTI4 2
LEI4 $1382
LABELV $1384
line 2112
;2112:			i = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2113
;2113:		}
LABELV $1382
line 2115
;2114:
;2115:		if (i == FORCE_LIGHTSIDE)
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $1385
line 2116
;2116:		{
line 2118
;2117://			s = "Light";
;2118:			s = (char *)UI_GetStripEdString("MENUS3", "FORCEDESC_LIGHT");
ADDRGP4 $961
ARGP4
ADDRGP4 $1387
ARGP4
ADDRLP4 48
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 48
INDIRP4
ASGNP4
line 2119
;2119:		}
ADDRGP4 $1373
JUMPV
LABELV $1385
line 2121
;2120:		else
;2121:		{
line 2123
;2122://			s = "Dark";
;2123:			s = (char *)UI_GetStripEdString("MENUS3", "FORCEDESC_DARK");
ADDRGP4 $961
ARGP4
ADDRGP4 $1388
ARGP4
ADDRLP4 48
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 48
INDIRP4
ASGNP4
line 2124
;2124:		}
line 2125
;2125:		break;
ADDRGP4 $1373
JUMPV
LABELV $1389
line 2127
;2126:    case UI_JEDI_NONJEDI:
;2127:		i = uiJediNonJedi;
ADDRLP4 4
ADDRGP4 uiJediNonJedi
INDIRI4
ASGNI4
line 2128
;2128:		if (i < 0 || i > 1)
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1392
ADDRLP4 4
INDIRI4
CNSTI4 1
LEI4 $1390
LABELV $1392
line 2129
;2129:		{
line 2130
;2130:			i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2131
;2131:		}
LABELV $1390
line 2133
;2132:
;2133:		if (i == FORCE_NONJEDI)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1393
line 2134
;2134:		{
line 2136
;2135://			s = "Non-Jedi";
;2136:			s = (char *)UI_GetStripEdString("MENUS0", "NO");
ADDRGP4 $1395
ARGP4
ADDRGP4 $1396
ARGP4
ADDRLP4 52
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 52
INDIRP4
ASGNP4
line 2137
;2137:		}
ADDRGP4 $1373
JUMPV
LABELV $1393
line 2139
;2138:		else
;2139:		{
line 2141
;2140://			s = "Jedi";
;2141:			s = (char *)UI_GetStripEdString("MENUS0", "YES");
ADDRGP4 $1395
ARGP4
ADDRGP4 $1397
ARGP4
ADDRLP4 52
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 52
INDIRP4
ASGNP4
line 2142
;2142:		}
line 2143
;2143:		break;
ADDRGP4 $1373
JUMPV
LABELV $1398
line 2145
;2144:    case UI_FORCE_RANK:
;2145:		i = uiForceRank;
ADDRLP4 4
ADDRGP4 uiForceRank
INDIRI4
ASGNI4
line 2146
;2146:		if (i < 1 || i > MAX_FORCE_RANK) {
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $1401
ADDRLP4 4
INDIRI4
CNSTI4 7
LEI4 $1399
LABELV $1401
line 2147
;2147:			i = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2148
;2148:		}
LABELV $1399
line 2150
;2149:
;2150:		s = (char *)UI_GetStripEdString("INGAMETEXT", forceMasteryLevels[i]);
ADDRGP4 $206
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceMasteryLevels
ADDP4
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
ASGNP4
line 2151
;2151:		break;
ADDRGP4 $1373
JUMPV
LABELV $1402
line 2170
;2152:	case UI_FORCE_RANK_HEAL:
;2153:	case UI_FORCE_RANK_LEVITATION:
;2154:	case UI_FORCE_RANK_SPEED:
;2155:	case UI_FORCE_RANK_PUSH:
;2156:	case UI_FORCE_RANK_PULL:
;2157:	case UI_FORCE_RANK_TELEPATHY:
;2158:	case UI_FORCE_RANK_GRIP:
;2159:	case UI_FORCE_RANK_LIGHTNING:
;2160:	case UI_FORCE_RANK_RAGE:
;2161:	case UI_FORCE_RANK_PROTECT:
;2162:	case UI_FORCE_RANK_ABSORB:
;2163:	case UI_FORCE_RANK_TEAM_HEAL:
;2164:	case UI_FORCE_RANK_TEAM_FORCE:
;2165:	case UI_FORCE_RANK_DRAIN:
;2166:	case UI_FORCE_RANK_SEE:
;2167:	case UI_FORCE_RANK_SABERATTACK:
;2168:	case UI_FORCE_RANK_SABERDEFEND:
;2169:	case UI_FORCE_RANK_SABERTHROW:
;2170:		findex = (ownerDraw - UI_FORCE_RANK)-1;
ADDRLP4 20
ADDRFP4 0
INDIRI4
CNSTI4 258
SUBI4
CNSTI4 1
SUBI4
ASGNI4
line 2172
;2171:		//this will give us the index as long as UI_FORCE_RANK is always one below the first force rank index
;2172:		i = uiForcePowersRank[findex];
ADDRLP4 4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
ASGNI4
line 2174
;2173:
;2174:		if (i < 0 || i > NUM_FORCE_POWER_LEVELS-1)
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1405
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $1403
LABELV $1405
line 2175
;2175:		{
line 2176
;2176:			i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2177
;2177:		}
LABELV $1403
line 2179
;2178:
;2179:		s = va("%i", uiForcePowersRank[findex]);
ADDRGP4 $1406
ARGP4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 64
INDIRP4
ASGNP4
line 2180
;2180:		break;
ADDRGP4 $1373
JUMPV
LABELV $1407
line 2182
;2181:    case UI_CLANNAME:
;2182:				s = UI_Cvar_VariableString("ui_teamName");
ADDRGP4 $697
ARGP4
ADDRLP4 68
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 68
INDIRP4
ASGNP4
line 2183
;2183:      break;
ADDRGP4 $1373
JUMPV
LABELV $1408
line 2185
;2184:    case UI_GAMETYPE:
;2185:				s = uiInfo.gameTypes[ui_gameType.integer].gameType;
ADDRLP4 0
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748
ADDP4
INDIRP4
ASGNP4
line 2186
;2186:      break;
ADDRGP4 $1373
JUMPV
LABELV $1411
line 2188
;2187:    case UI_SKILL:
;2188:				i = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $826
ARGP4
ADDRLP4 72
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 72
INDIRF4
CVFI4 4
ASGNI4
line 2189
;2189:				if (i < 1 || i > numSkillLevels) {
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $1414
ADDRLP4 4
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LEI4 $1412
LABELV $1414
line 2190
;2190:					i = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2191
;2191:				}
LABELV $1412
line 2192
;2192:			  s = (char *)UI_GetStripEdString("INGAMETEXT", (char *)skillLevels[i-1]);
ADDRGP4 $206
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skillLevels-4
ADDP4
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 80
INDIRP4
ASGNP4
line 2193
;2193:      break;
ADDRGP4 $1373
JUMPV
LABELV $1416
line 2195
;2194:    case UI_BLUETEAMNAME:
;2195:			  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_blueTeam"));
ADDRGP4 $926
ARGP4
ADDRLP4 84
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 88
INDIRI4
ASGNI4
line 2196
;2196:			  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1373
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
GEI4 $1373
line 2197
;2197:			    s = va("%s: %s", "Blue", uiInfo.teamList[i].teamName);
ADDRGP4 $934
ARGP4
ADDRGP4 $935
ARGP4
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+14160
ADDP4
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 96
INDIRP4
ASGNP4
line 2198
;2198:			  }
line 2199
;2199:      break;
ADDRGP4 $1373
JUMPV
LABELV $1421
line 2201
;2200:    case UI_REDTEAMNAME:
;2201:			  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_redTeam"));
ADDRGP4 $927
ARGP4
ADDRLP4 96
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 100
INDIRI4
ASGNI4
line 2202
;2202:			  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1373
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
GEI4 $1373
line 2203
;2203:			    s = va("%s: %s", "Red", uiInfo.teamList[i].teamName);
ADDRGP4 $934
ARGP4
ADDRGP4 $936
ARGP4
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+14160
ADDP4
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 108
INDIRP4
ASGNP4
line 2204
;2204:			  }
line 2205
;2205:      break;
ADDRGP4 $1373
JUMPV
LABELV $1426
line 2214
;2206:    case UI_BLUETEAM1:
;2207:		case UI_BLUETEAM2:
;2208:		case UI_BLUETEAM3:
;2209:		case UI_BLUETEAM4:
;2210:		case UI_BLUETEAM5:
;2211:		case UI_BLUETEAM6:
;2212:		case UI_BLUETEAM7:
;2213:		case UI_BLUETEAM8:
;2214:			if (ownerDraw <= UI_BLUETEAM5)
ADDRFP4 0
INDIRI4
CNSTI4 214
GTI4 $1427
line 2215
;2215:			{
line 2216
;2216:			  iUse = ownerDraw-UI_BLUETEAM1 + 1;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CNSTI4 210
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 2217
;2217:			}
ADDRGP4 $1428
JUMPV
LABELV $1427
line 2219
;2218:			else
;2219:			{
line 2220
;2220:			  iUse = ownerDraw-274; //unpleasent hack because I don't want to move up all the UI_BLAHTEAM# defines
ADDRLP4 8
ADDRFP4 0
INDIRI4
CNSTI4 274
SUBI4
ASGNI4
line 2221
;2221:			}
LABELV $1428
line 2223
;2222:
;2223:			value = trap_Cvar_VariableValue(va("ui_blueteam%i", iUse));
ADDRGP4 $942
ARGP4
ADDRLP4 8
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
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 112
INDIRF4
CVFI4 4
ASGNI4
line 2224
;2224:			if (value <= 1) {
ADDRLP4 12
INDIRI4
CNSTI4 1
GTI4 $1429
line 2225
;2225:				text = "Human";
ADDRLP4 16
ADDRGP4 $1431
ASGNP4
line 2226
;2226:			} else {
ADDRGP4 $1430
JUMPV
LABELV $1429
line 2227
;2227:				value -= 2;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2228
;2228:				if (value >= uiInfo.aliasCount) {
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+13384
INDIRI4
LTI4 $1432
line 2229
;2229:					value = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 2230
;2230:				}
LABELV $1432
line 2231
;2231:				text = uiInfo.aliasList[value].name;
ADDRLP4 16
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 uiInfo+13388
ADDP4
INDIRP4
ASGNP4
line 2232
;2232:			}
LABELV $1430
line 2233
;2233:			s = va("%i. %s", iUse, text);
ADDRGP4 $1436
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 116
INDIRP4
ASGNP4
line 2234
;2234:      break;
ADDRGP4 $1373
JUMPV
LABELV $1437
line 2243
;2235:    case UI_REDTEAM1:
;2236:		case UI_REDTEAM2:
;2237:		case UI_REDTEAM3:
;2238:		case UI_REDTEAM4:
;2239:		case UI_REDTEAM5:
;2240:		case UI_REDTEAM6:
;2241:		case UI_REDTEAM7:
;2242:		case UI_REDTEAM8:
;2243:			if (ownerDraw <= UI_REDTEAM5)
ADDRFP4 0
INDIRI4
CNSTI4 219
GTI4 $1438
line 2244
;2244:			{
line 2245
;2245:			  iUse = ownerDraw-UI_REDTEAM1 + 1;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CNSTI4 215
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 2246
;2246:			}
ADDRGP4 $1439
JUMPV
LABELV $1438
line 2248
;2247:			else
;2248:			{
line 2249
;2249:			  iUse = ownerDraw-277; //unpleasent hack because I don't want to move up all the UI_BLAHTEAM# defines
ADDRLP4 8
ADDRFP4 0
INDIRI4
CNSTI4 277
SUBI4
ASGNI4
line 2250
;2250:			}
LABELV $1439
line 2252
;2251:
;2252:			value = trap_Cvar_VariableValue(va("ui_redteam%i", iUse));
ADDRGP4 $943
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 120
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 124
INDIRF4
CVFI4 4
ASGNI4
line 2253
;2253:			if (value <= 1) {
ADDRLP4 12
INDIRI4
CNSTI4 1
GTI4 $1440
line 2254
;2254:				text = "Human";
ADDRLP4 16
ADDRGP4 $1431
ASGNP4
line 2255
;2255:			} else {
ADDRGP4 $1441
JUMPV
LABELV $1440
line 2256
;2256:				value -= 2;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2257
;2257:				if (value >= uiInfo.aliasCount) {
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+13384
INDIRI4
LTI4 $1442
line 2258
;2258:					value = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 2259
;2259:				}
LABELV $1442
line 2260
;2260:				text = uiInfo.aliasList[value].name;
ADDRLP4 16
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 uiInfo+13388
ADDP4
INDIRP4
ASGNP4
line 2261
;2261:			}
LABELV $1441
line 2262
;2262:			s = va("%i. %s", iUse, text);
ADDRGP4 $1436
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 128
INDIRP4
ASGNP4
line 2263
;2263:      break;
ADDRGP4 $1373
JUMPV
LABELV $1446
line 2265
;2264:		case UI_NETSOURCE:
;2265:			if (ui_netSource.integer < 0 || ui_netSource.integer > uiInfo.numJoinGameTypes) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
LTI4 $1452
ADDRGP4 ui_netSource+12
INDIRI4
ADDRGP4 uiInfo+17876
INDIRI4
LEI4 $1447
LABELV $1452
line 2266
;2266:				ui_netSource.integer = 0;
ADDRGP4 ui_netSource+12
CNSTI4 0
ASGNI4
line 2267
;2267:			}
LABELV $1447
line 2268
;2268:			trap_SP_GetStringTextString("MENUS3_SOURCE", holdSPString, sizeof(holdSPString));
ADDRGP4 $1120
ARGP4
ADDRGP4 holdSPString
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 2269
;2269:			s = va("%s %s", holdSPString, GetNetSourceString(ui_netSource.integer));
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 GetNetSourceString
CALLP4
ASGNP4
ADDRGP4 $1121
ARGP4
ADDRGP4 holdSPString
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 136
INDIRP4
ASGNP4
line 2270
;2270:			break;
ADDRGP4 $1373
JUMPV
LABELV $1455
line 2272
;2271:		case UI_NETFILTER:
;2272:			if (ui_serverFilterType.integer < 0 || ui_serverFilterType.integer > numServerFilters) {
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
LTI4 $1460
ADDRGP4 ui_serverFilterType+12
INDIRI4
ADDRGP4 numServerFilters
INDIRI4
LEI4 $1456
LABELV $1460
line 2273
;2273:				ui_serverFilterType.integer = 0;
ADDRGP4 ui_serverFilterType+12
CNSTI4 0
ASGNI4
line 2274
;2274:			}
LABELV $1456
line 2275
;2275:			trap_SP_GetStringTextString("MENUS3_GAME", holdSPString, sizeof(holdSPString));
ADDRGP4 $1155
ARGP4
ADDRGP4 holdSPString
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 2276
;2276:			s = va("%s %s", holdSPString, serverFilters[ui_serverFilterType.integer].description );
ADDRGP4 $1121
ARGP4
ADDRGP4 holdSPString
ARGP4
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverFilters
ADDP4
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 140
INDIRP4
ASGNP4
line 2277
;2277:			break;
ADDRGP4 $1373
JUMPV
line 2279
;2278:		case UI_TIER:
;2279:			break;
line 2281
;2280:		case UI_TIER_MAPNAME:
;2281:			break;
line 2283
;2282:		case UI_TIER_GAMETYPE:
;2283:			break;
line 2285
;2284:		case UI_ALLMAPS_SELECTION:
;2285:			break;
line 2287
;2286:		case UI_OPPONENT_NAME:
;2287:			break;
LABELV $1468
line 2289
;2288:		case UI_KEYBINDSTATUS:
;2289:			if (Display_KeyBindPending()) {
ADDRLP4 144
ADDRGP4 Display_KeyBindPending
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1373
line 2290
;2290:				s = UI_GetStripEdString("INGAMETEXT", "WAITING_FOR_NEW_KEY");
ADDRGP4 $206
ARGP4
ADDRGP4 $1471
ARGP4
ADDRLP4 148
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 148
INDIRP4
ASGNP4
line 2291
;2291:			} else {
line 2293
;2292:			//	s = "Press ENTER or CLICK to change, Press BACKSPACE to clear";
;2293:			}
line 2294
;2294:			break;
ADDRGP4 $1373
JUMPV
LABELV $1472
line 2296
;2295:		case UI_SERVERREFRESHDATE:
;2296:			s = UI_Cvar_VariableString(va("ui_lastServerRefresh_%i", ui_netSource.integer));
ADDRGP4 $1473
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 148
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 152
INDIRP4
ASGNP4
line 2297
;2297:			break;
line 2299
;2298:    default:
;2299:      break;
LABELV $1373
line 2302
;2300:  }
;2301:
;2302:	if (s) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1477
line 2303
;2303:		return Text_Width(s, scale, 0);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
RETI4
ADDRGP4 $1371
JUMPV
LABELV $1477
line 2305
;2304:	}
;2305:	return 0;
CNSTI4 0
RETI4
LABELV $1371
endproc UI_OwnerDrawWidth 156 12
proc UI_DrawBotName 20 36
line 2309
;2306:}
;2307:
;2308:static void UI_DrawBotName(rectDef_t *rect, float scale, vec4_t color, int textStyle,int iMenuFont) 
;2309:{
line 2310
;2310:	int value = uiInfo.botIndex;
ADDRLP4 0
ADDRGP4 uiInfo+11844
INDIRI4
ASGNI4
line 2312
;2311://	int game = trap_Cvar_VariableValue("g_gametype");
;2312:	const char *text = "";
ADDRLP4 4
ADDRGP4 $165
ASGNP4
line 2321
;2313:	/*
;2314:	if (game >= GT_TEAM) {
;2315:		if (value >= uiInfo.characterCount) {
;2316:			value = 0;
;2317:		}
;2318:		text = uiInfo.characterList[value].name;
;2319:	} else {
;2320:	*/
;2321:		if (value >= UI_GetNumBots()) {
ADDRLP4 8
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $1481
line 2322
;2322:			value = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2323
;2323:		}
LABELV $1481
line 2324
;2324:		text = UI_GetBotNameByNumber(value);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 2327
;2325:	//}
;2326://  Text_Paint(rect->x, rect->y, scale, color, text, 0, 0, textStyle);
;2327:  Text_Paint(rect->x, rect->y, scale, color, text, 0, 0, textStyle,iMenuFont);
ADDRLP4 16
ADDRFP4 0
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
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2328
;2328:}
LABELV $1479
endproc UI_DrawBotName 20 36
proc UI_DrawBotSkill 8 36
line 2331
;2329:
;2330:static void UI_DrawBotSkill(rectDef_t *rect, float scale, vec4_t color, int textStyle,int iMenuFont) 
;2331:{
line 2332
;2332:	if (uiInfo.skillIndex >= 0 && uiInfo.skillIndex < numSkillLevels) 
ADDRGP4 uiInfo+33792
INDIRI4
CNSTI4 0
LTI4 $1484
ADDRGP4 uiInfo+33792
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
GEI4 $1484
line 2333
;2333:	{
line 2334
;2334:		Text_Paint(rect->x, rect->y, scale, color, (char *)UI_GetStripEdString("INGAMETEXT", (char *)skillLevels[uiInfo.skillIndex]), 0, 0, textStyle,iMenuFont);
ADDRGP4 $206
ARGP4
ADDRGP4 uiInfo+33792
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skillLevels
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2335
;2335:	}
LABELV $1484
line 2336
;2336:}
LABELV $1483
endproc UI_DrawBotSkill 8 36
proc UI_DrawRedBlue 8 36
line 2339
;2337:
;2338:static void UI_DrawRedBlue(rectDef_t *rect, float scale, vec4_t color, int textStyle,int iMenuFont) 
;2339:{
line 2340
;2340:	Text_Paint(rect->x, rect->y, scale, color, (uiInfo.redBlue == 0) ? "Red" : "Blue", 0, 0, textStyle,iMenuFont);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 uiInfo+18008
INDIRI4
CNSTI4 0
NEI4 $1492
ADDRLP4 0
ADDRGP4 $936
ASGNP4
ADDRGP4 $1493
JUMPV
LABELV $1492
ADDRLP4 0
ADDRGP4 $935
ASGNP4
LABELV $1493
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2341
;2341:}
LABELV $1489
endproc UI_DrawRedBlue 8 36
proc UI_DrawCrosshair 4 20
line 2343
;2342:
;2343:static void UI_DrawCrosshair(rectDef_t *rect, float scale, vec4_t color) {
line 2344
;2344: 	trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2345
;2345:	if (uiInfo.currentCrosshair < 0 || uiInfo.currentCrosshair >= NUM_CROSSHAIRS) {
ADDRGP4 uiInfo+60856
INDIRI4
CNSTI4 0
LTI4 $1499
ADDRGP4 uiInfo+60856
INDIRI4
CNSTI4 10
LTI4 $1495
LABELV $1499
line 2346
;2346:		uiInfo.currentCrosshair = 0;
ADDRGP4 uiInfo+60856
CNSTI4 0
ASGNI4
line 2347
;2347:	}
LABELV $1495
line 2348
;2348:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.uiDC.Assets.crosshairShader[uiInfo.currentCrosshair]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 uiInfo+60856
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+260+168
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2349
;2349: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2350
;2350:}
LABELV $1494
endproc UI_DrawCrosshair 4 20
proc UI_BuildPlayerList 4176 12
line 2357
;2351:
;2352:/*
;2353:===============
;2354:UI_BuildPlayerList
;2355:===============
;2356:*/
;2357:static void UI_BuildPlayerList() {
line 2362
;2358:	uiClientState_t	cs;
;2359:	int		n, count, team, team2, playerTeamNumber;
;2360:	char	info[MAX_INFO_STRING];
;2361:
;2362:	trap_GetClientState( &cs );
ADDRLP4 1040
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 2363
;2363:	trap_GetConfigString( CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING );
ADDRLP4 1040+8
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 2364
;2364:	uiInfo.playerNumber = cs.clientNum;
ADDRGP4 uiInfo+18032
ADDRLP4 1040+8
INDIRI4
ASGNI4
line 2365
;2365:	uiInfo.teamLeader = atoi(Info_ValueForKey(info, "tl"));
ADDRLP4 4
ARGP4
ADDRGP4 $1509
ARGP4
ADDRLP4 4128
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4128
INDIRP4
ARGP4
ADDRLP4 4132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 uiInfo+18036
ADDRLP4 4132
INDIRI4
ASGNI4
line 2366
;2366:	team = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 4
ARGP4
ADDRGP4 $1510
ARGP4
ADDRLP4 4136
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4136
INDIRP4
ARGP4
ADDRLP4 4140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 4140
INDIRI4
ASGNI4
line 2367
;2367:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 2368
;2368:	count = atoi( Info_ValueForKey( info, "sv_maxclients" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $1511
ARGP4
ADDRLP4 4144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4144
INDIRP4
ARGP4
ADDRLP4 4148
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 4148
INDIRI4
ASGNI4
line 2369
;2369:	uiInfo.playerCount = 0;
ADDRGP4 uiInfo+18012
CNSTI4 0
ASGNI4
line 2370
;2370:	uiInfo.myTeamCount = 0;
ADDRGP4 uiInfo+18016
CNSTI4 0
ASGNI4
line 2371
;2371:	playerTeamNumber = 0;
ADDRLP4 4124
CNSTI4 0
ASGNI4
line 2372
;2372:	for( n = 0; n < count; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1517
JUMPV
LABELV $1514
line 2373
;2373:		trap_GetConfigString( CS_PLAYERS + n, info, MAX_INFO_STRING );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 2375
;2374:
;2375:		if (info[0]) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1518
line 2376
;2376:			Q_strncpyz( uiInfo.playerNames[uiInfo.playerCount], Info_ValueForKey( info, "n" ), MAX_NAME_LENGTH );
ADDRLP4 4
ARGP4
ADDRGP4 $1522
ARGP4
ADDRLP4 4152
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 uiInfo+18012
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+18040
ADDP4
ARGP4
ADDRLP4 4152
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2377
;2377:			Q_CleanStr( uiInfo.playerNames[uiInfo.playerCount] );
ADDRGP4 uiInfo+18012
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+18040
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 2378
;2378:			uiInfo.playerIndexes[uiInfo.playerCount] = n;
ADDRGP4 uiInfo+18012
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+20216
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2379
;2379:			uiInfo.playerCount++;
ADDRLP4 4156
ADDRGP4 uiInfo+18012
ASGNP4
ADDRLP4 4156
INDIRP4
ADDRLP4 4156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2380
;2380:			team2 = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 4
ARGP4
ADDRGP4 $1510
ARGP4
ADDRLP4 4160
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4160
INDIRP4
ARGP4
ADDRLP4 4164
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 4164
INDIRI4
ASGNI4
line 2381
;2381:			if (team2 == team && n != uiInfo.playerNumber) {
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
NEI4 $1528
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+18032
INDIRI4
EQI4 $1528
line 2382
;2382:				Q_strncpyz( uiInfo.teamNames[uiInfo.myTeamCount], Info_ValueForKey( info, "n" ), MAX_NAME_LENGTH );
ADDRLP4 4
ARGP4
ADDRGP4 $1522
ARGP4
ADDRLP4 4168
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 uiInfo+18016
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+19064
ADDP4
ARGP4
ADDRLP4 4168
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2383
;2383:				Q_CleanStr( uiInfo.teamNames[uiInfo.myTeamCount] );
ADDRGP4 uiInfo+18016
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+19064
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 2384
;2384:				uiInfo.teamClientNums[uiInfo.myTeamCount] = n;
ADDRGP4 uiInfo+18016
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+20088
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2385
;2385:				if (uiInfo.playerNumber == n) {
ADDRGP4 uiInfo+18032
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1537
line 2386
;2386:					playerTeamNumber = uiInfo.myTeamCount;
ADDRLP4 4124
ADDRGP4 uiInfo+18016
INDIRI4
ASGNI4
line 2387
;2387:				}
LABELV $1537
line 2388
;2388:				uiInfo.myTeamCount++;
ADDRLP4 4172
ADDRGP4 uiInfo+18016
ASGNP4
ADDRLP4 4172
INDIRP4
ADDRLP4 4172
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2389
;2389:			}
LABELV $1528
line 2390
;2390:		}
LABELV $1518
line 2391
;2391:	}
LABELV $1515
line 2372
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1517
ADDRLP4 0
INDIRI4
ADDRLP4 1028
INDIRI4
LTI4 $1514
line 2393
;2392:
;2393:	if (!uiInfo.teamLeader) {
ADDRGP4 uiInfo+18036
INDIRI4
CNSTI4 0
NEI4 $1542
line 2394
;2394:		trap_Cvar_Set("cg_selectedPlayer", va("%d", playerTeamNumber));
ADDRGP4 $702
ARGP4
ADDRLP4 4124
INDIRI4
ARGI4
ADDRLP4 4152
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1545
ARGP4
ADDRLP4 4152
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2395
;2395:	}
LABELV $1542
line 2397
;2396:
;2397:	n = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1545
ARGP4
ADDRLP4 4152
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4152
INDIRF4
CVFI4 4
ASGNI4
line 2398
;2398:	if (n < 0 || n > uiInfo.myTeamCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1549
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
LEI4 $1546
LABELV $1549
line 2399
;2399:		n = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2400
;2400:	}
LABELV $1546
line 2403
;2401:
;2402:
;2403:	if (n < uiInfo.myTeamCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
GEI4 $1550
line 2404
;2404:		trap_Cvar_Set("cg_selectedPlayerName", uiInfo.teamNames[n]);
ADDRGP4 $1553
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+19064
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2405
;2405:	}
ADDRGP4 $1551
JUMPV
LABELV $1550
line 2407
;2406:	else
;2407:	{
line 2408
;2408:		trap_Cvar_Set("cg_selectedPlayerName", "Everyone");
ADDRGP4 $1553
ARGP4
ADDRGP4 $1555
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2409
;2409:	}
LABELV $1551
line 2411
;2410:
;2411:	if (!team || team == TEAM_SPECTATOR || !uiInfo.teamLeader)
ADDRLP4 4164
CNSTI4 0
ASGNI4
ADDRLP4 1036
INDIRI4
ADDRLP4 4164
INDIRI4
EQI4 $1560
ADDRLP4 1036
INDIRI4
CNSTI4 3
EQI4 $1560
ADDRGP4 uiInfo+18036
INDIRI4
ADDRLP4 4164
INDIRI4
NEI4 $1556
LABELV $1560
line 2412
;2412:	{
line 2413
;2413:		n = uiInfo.myTeamCount;
ADDRLP4 0
ADDRGP4 uiInfo+18016
INDIRI4
ASGNI4
line 2414
;2414:		trap_Cvar_Set("cg_selectedPlayer", va("%d", n));
ADDRGP4 $702
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4168
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1545
ARGP4
ADDRLP4 4168
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2415
;2415:		trap_Cvar_Set("cg_selectedPlayerName", "N/A");
ADDRGP4 $1553
ARGP4
ADDRGP4 $178
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2416
;2416:	}
LABELV $1556
line 2417
;2417:}
LABELV $1504
endproc UI_BuildPlayerList 4176 12
proc UI_DrawSelectedPlayer 8 36
line 2420
;2418:
;2419:
;2420:static void UI_DrawSelectedPlayer(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) {
line 2421
;2421:	if (uiInfo.uiDC.realTime > uiInfo.playerRefresh) {
ADDRGP4 uiInfo+240
INDIRI4
ADDRGP4 uiInfo+18024
INDIRI4
LEI4 $1563
line 2422
;2422:		uiInfo.playerRefresh = uiInfo.uiDC.realTime + 3000;
ADDRGP4 uiInfo+18024
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 2423
;2423:		UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 2424
;2424:	}
LABELV $1563
line 2425
;2425:  Text_Paint(rect->x, rect->y, scale, color, UI_Cvar_VariableString("cg_selectedPlayerName"), 0, 0, textStyle, iMenuFont);
ADDRGP4 $1553
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2426
;2426:}
LABELV $1562
endproc UI_DrawSelectedPlayer 8 36
proc UI_DrawServerRefreshDate 80 36
line 2429
;2427:
;2428:static void UI_DrawServerRefreshDate(rectDef_t *rect, float scale, vec4_t color, int textStyle, int iMenuFont) 
;2429:{
line 2430
;2430:	if (uiInfo.serverStatus.refreshActive) 
ADDRGP4 uiInfo+40740+2212
INDIRI4
CNSTI4 0
EQI4 $1570
line 2431
;2431:	{
line 2433
;2432:		vec4_t lowLight, newColor;
;2433:		lowLight[0] = 0.8 * color[0]; 
ADDRLP4 0
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2434
;2434:		lowLight[1] = 0.8 * color[1]; 
ADDRLP4 0+4
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 2435
;2435:		lowLight[2] = 0.8 * color[2]; 
ADDRLP4 0+8
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 2436
;2436:		lowLight[3] = 0.8 * color[3]; 
ADDRLP4 0+12
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ASGNF4
line 2437
;2437:		LerpColor(color,lowLight,newColor,0.5+0.5*sin(uiInfo.uiDC.realTime / PULSE_DIVISOR));
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 32
ADDRGP4 sin
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
ARGP4
CNSTF4 1056964608
ADDRLP4 32
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 LerpColor
CALLV
pop
line 2439
;2438:
;2439:		trap_SP_GetStringTextString("INGAMETEXT_GETTINGINFOFORSERVERS", holdSPString, sizeof(holdSPString));
ADDRGP4 $1578
ARGP4
ADDRGP4 holdSPString
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 2440
;2440:		Text_Paint(rect->x, rect->y, scale, newColor, va((char *) holdSPString, trap_LAN_GetServerCount(ui_netSource.integer)), 0, 0, textStyle, iMenuFont);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRGP4 holdSPString
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 16
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2441
;2441:	} 
ADDRGP4 $1571
JUMPV
LABELV $1570
line 2443
;2442:	else 
;2443:	{
line 2445
;2444:		char buff[64];
;2445:		Q_strncpyz(buff, UI_Cvar_VariableString(va("ui_lastServerRefresh_%i", ui_netSource.integer)), 64);
ADDRGP4 $1473
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2446
;2446:		trap_SP_GetStringTextString("INGAMETEXT_SERVER_REFRESHTIME", holdSPString, sizeof(holdSPString));
ADDRGP4 $1581
ARGP4
ADDRGP4 holdSPString
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 2448
;2447:
;2448:		Text_Paint(rect->x, rect->y, scale, color, va("%s: %s", holdSPString, buff), 0, 0, textStyle, iMenuFont);
ADDRGP4 $934
ARGP4
ADDRGP4 holdSPString
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
INDIRF4
ARGF4
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2449
;2449:	}
LABELV $1571
line 2450
;2450:}
LABELV $1569
endproc UI_DrawServerRefreshDate 80 36
proc UI_DrawServerMOTD 24 36
line 2452
;2451:
;2452:static void UI_DrawServerMOTD(rectDef_t *rect, float scale, vec4_t color, int iMenuFont) {
line 2453
;2453:	if (uiInfo.serverStatus.motdLen) {
ADDRGP4 uiInfo+40740+10436
INDIRI4
CNSTI4 0
EQI4 $1583
line 2456
;2454:		float maxX;
;2455:	 
;2456:		if (uiInfo.serverStatus.motdWidth == -1) {
ADDRGP4 uiInfo+40740+10440
INDIRI4
CNSTI4 -1
NEI4 $1587
line 2457
;2457:			uiInfo.serverStatus.motdWidth = 0;
ADDRGP4 uiInfo+40740+10440
CNSTI4 0
ASGNI4
line 2458
;2458:			uiInfo.serverStatus.motdPaintX = rect->x + 1;
ADDRGP4 uiInfo+40740+10444
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 2459
;2459:			uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+40740+10448
CNSTI4 -1
ASGNI4
line 2460
;2460:		}
LABELV $1587
line 2462
;2461:
;2462:		if (uiInfo.serverStatus.motdOffset > uiInfo.serverStatus.motdLen) {
ADDRGP4 uiInfo+40740+10452
INDIRI4
ADDRGP4 uiInfo+40740+10436
INDIRI4
LEI4 $1597
line 2463
;2463:			uiInfo.serverStatus.motdOffset = 0;
ADDRGP4 uiInfo+40740+10452
CNSTI4 0
ASGNI4
line 2464
;2464:			uiInfo.serverStatus.motdPaintX = rect->x + 1;
ADDRGP4 uiInfo+40740+10444
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 2465
;2465:			uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+40740+10448
CNSTI4 -1
ASGNI4
line 2466
;2466:		}
LABELV $1597
line 2468
;2467:
;2468:		if (uiInfo.uiDC.realTime > uiInfo.serverStatus.motdTime) {
ADDRGP4 uiInfo+240
INDIRI4
ADDRGP4 uiInfo+40740+10456
INDIRI4
LEI4 $1609
line 2469
;2469:			uiInfo.serverStatus.motdTime = uiInfo.uiDC.realTime + 10;
ADDRGP4 uiInfo+40740+10456
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 2470
;2470:			if (uiInfo.serverStatus.motdPaintX <= rect->x + 2) {
ADDRGP4 uiInfo+40740+10444
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
GTF4 $1617
line 2471
;2471:				if (uiInfo.serverStatus.motdOffset < uiInfo.serverStatus.motdLen) {
ADDRGP4 uiInfo+40740+10452
INDIRI4
ADDRGP4 uiInfo+40740+10436
INDIRI4
GEI4 $1621
line 2472
;2472:					uiInfo.serverStatus.motdPaintX += Text_Width(&uiInfo.serverStatus.motd[uiInfo.serverStatus.motdOffset], scale, 1) - 1;
ADDRGP4 uiInfo+40740+10452
INDIRI4
ADDRGP4 uiInfo+40740+10460
ADDP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 8
ADDRGP4 uiInfo+40740+10444
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
line 2473
;2473:					uiInfo.serverStatus.motdOffset++;
ADDRLP4 12
ADDRGP4 uiInfo+40740+10452
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2474
;2474:				} else {
ADDRGP4 $1618
JUMPV
LABELV $1621
line 2475
;2475:					uiInfo.serverStatus.motdOffset = 0;
ADDRGP4 uiInfo+40740+10452
CNSTI4 0
ASGNI4
line 2476
;2476:					if (uiInfo.serverStatus.motdPaintX2 >= 0) {
ADDRGP4 uiInfo+40740+10448
INDIRI4
CNSTI4 0
LTI4 $1637
line 2477
;2477:						uiInfo.serverStatus.motdPaintX = uiInfo.serverStatus.motdPaintX2;
ADDRGP4 uiInfo+40740+10444
ADDRGP4 uiInfo+40740+10448
INDIRI4
ASGNI4
line 2478
;2478:					} else {
ADDRGP4 $1638
JUMPV
LABELV $1637
line 2479
;2479:						uiInfo.serverStatus.motdPaintX = rect->x + rect->w - 2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 uiInfo+40740+10444
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
line 2480
;2480:					}
LABELV $1638
line 2481
;2481:					uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+40740+10448
CNSTI4 -1
ASGNI4
line 2482
;2482:				}
line 2483
;2483:			} else {
ADDRGP4 $1618
JUMPV
LABELV $1617
line 2485
;2484:				//serverStatus.motdPaintX--;
;2485:				uiInfo.serverStatus.motdPaintX -= 2;
ADDRLP4 4
ADDRGP4 uiInfo+40740+10444
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2486
;2486:				if (uiInfo.serverStatus.motdPaintX2 >= 0) {
ADDRGP4 uiInfo+40740+10448
INDIRI4
CNSTI4 0
LTI4 $1651
line 2488
;2487:					//serverStatus.motdPaintX2--;
;2488:					uiInfo.serverStatus.motdPaintX2 -= 2;
ADDRLP4 8
ADDRGP4 uiInfo+40740+10448
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2489
;2489:				}
LABELV $1651
line 2490
;2490:			}
LABELV $1618
line 2491
;2491:		}
LABELV $1609
line 2493
;2492:
;2493:		maxX = rect->x + rect->w - 2;
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
line 2494
;2494:		Text_Paint_Limit(&maxX, uiInfo.serverStatus.motdPaintX, rect->y + rect->h - 3, scale, color, &uiInfo.serverStatus.motd[uiInfo.serverStatus.motdOffset], 0, 0, iMenuFont); 
ADDRLP4 0
ARGP4
ADDRGP4 uiInfo+40740+10444
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
ADDRGP4 uiInfo+40740+10452
INDIRI4
ADDRGP4 uiInfo+40740+10460
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint_Limit
CALLV
pop
line 2495
;2495:		if (uiInfo.serverStatus.motdPaintX2 >= 0) {
ADDRGP4 uiInfo+40740+10448
INDIRI4
CNSTI4 0
LTI4 $1663
line 2496
;2496:			float maxX2 = rect->x + rect->w - 2;
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
line 2497
;2497:			Text_Paint_Limit(&maxX2, uiInfo.serverStatus.motdPaintX2, rect->y + rect->h - 3, scale, color, uiInfo.serverStatus.motd, 0, uiInfo.serverStatus.motdOffset, iMenuFont); 
ADDRLP4 12
ARGP4
ADDRGP4 uiInfo+40740+10448
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
ADDRGP4 uiInfo+40740+10460
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 uiInfo+40740+10452
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint_Limit
CALLV
pop
line 2498
;2498:		}
LABELV $1663
line 2499
;2499:		if (uiInfo.serverStatus.motdOffset && maxX > 0) {
ADDRGP4 uiInfo+40740+10452
INDIRI4
CNSTI4 0
EQI4 $1673
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $1673
line 2501
;2500:			// if we have an offset ( we are skipping the first part of the string ) and we fit the string
;2501:			if (uiInfo.serverStatus.motdPaintX2 == -1) {
ADDRGP4 uiInfo+40740+10448
INDIRI4
CNSTI4 -1
NEI4 $1674
line 2502
;2502:						uiInfo.serverStatus.motdPaintX2 = rect->x + rect->w - 2;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 uiInfo+40740+10448
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
line 2503
;2503:			}
line 2504
;2504:		} else {
ADDRGP4 $1674
JUMPV
LABELV $1673
line 2505
;2505:			uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+40740+10448
CNSTI4 -1
ASGNI4
line 2506
;2506:		}
LABELV $1674
line 2508
;2507:
;2508:	}
LABELV $1583
line 2509
;2509:}
LABELV $1582
endproc UI_DrawServerMOTD 24 36
proc UI_DrawKeyBindStatus 12 36
line 2511
;2510:
;2511:static void UI_DrawKeyBindStatus(rectDef_t *rect, float scale, vec4_t color, int textStyle,int iMenuFont) {
line 2513
;2512://	int ofs = 0; TTimo: unused
;2513:	if (Display_KeyBindPending()) 
ADDRLP4 0
ADDRGP4 Display_KeyBindPending
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1686
line 2514
;2514:	{
line 2515
;2515:		Text_Paint(rect->x, rect->y, scale, color, UI_GetStripEdString("INGAMETEXT", "WAITING_FOR_NEW_KEY"), 0, 0, textStyle,iMenuFont);
ADDRGP4 $206
ARGP4
ADDRGP4 $1471
ARGP4
ADDRLP4 4
ADDRGP4 UI_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2516
;2516:	} else {
LABELV $1686
line 2518
;2517://		Text_Paint(rect->x, rect->y, scale, color, "Press ENTER or CLICK to change, Press BACKSPACE to clear", 0, 0, textStyle,iMenuFont);
;2518:	}
LABELV $1687
line 2519
;2519:}
LABELV $1685
endproc UI_DrawKeyBindStatus 12 36
proc UI_DrawGLInfo 4664 36
line 2522
;2520:
;2521:static void UI_DrawGLInfo(rectDef_t *rect, float scale, vec4_t color, int textStyle,int iMenuFont) 
;2522:{
line 2528
;2523:	char * eptr;
;2524:	char buff[4096];
;2525:	const char *lines[128];
;2526:	int y, numLines, i;
;2527:
;2528:	Text_Paint(rect->x + 2, rect->y, scale, color, va("GL_VENDOR: %s", uiInfo.uiDC.glconfig.vendor_string), 0, 30, textStyle,iMenuFont);
ADDRGP4 $1689
ARGP4
ADDRGP4 uiInfo+468+1024
ARGP4
ADDRLP4 4624
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4628
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 4628
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4624
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2529
;2529:	Text_Paint(rect->x + 2, rect->y + 15, scale, color, va("GL_VERSION: %s: %s", uiInfo.uiDC.glconfig.version_string,uiInfo.uiDC.glconfig.renderer_string), 0, 30, textStyle,iMenuFont);
ADDRGP4 $1692
ARGP4
ADDRGP4 uiInfo+468+2048
ARGP4
ADDRGP4 uiInfo+468
ARGP4
ADDRLP4 4632
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4636
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 4636
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1097859072
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4632
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2530
;2530:	Text_Paint(rect->x + 2, rect->y + 30, scale, color, va ("GL_PIXELFORMAT: color(%d-bits) Z(%d-bits) stencil(%d-bits)", uiInfo.uiDC.glconfig.colorBits, uiInfo.uiDC.glconfig.depthBits, uiInfo.uiDC.glconfig.stencilBits), 0, 30, textStyle,iMenuFont);
ADDRGP4 $1696
ARGP4
ADDRGP4 uiInfo+468+11272
INDIRI4
ARGI4
ADDRGP4 uiInfo+468+11276
INDIRI4
ARGI4
ADDRGP4 uiInfo+468+11280
INDIRI4
ARGI4
ADDRLP4 4640
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4644
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4644
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 4644
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1106247680
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4640
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2533
;2531:
;2532:	// build null terminated extension strings
;2533:	Q_strncpyz(buff, uiInfo.uiDC.glconfig.extensions_string, 4096);
ADDRLP4 528
ARGP4
ADDRGP4 uiInfo+468+3072
ARGP4
CNSTI4 4096
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2534
;2534:	eptr = buff;
ADDRLP4 0
ADDRLP4 528
ASGNP4
line 2535
;2535:	y = rect->y + 45;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1110704128
ADDF4
CVFI4 4
ASGNI4
line 2536
;2536:	numLines = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $1706
JUMPV
line 2538
;2537:	while ( y < rect->y + rect->h && *eptr )
;2538:	{
LABELV $1708
line 2540
;2539:		while ( *eptr && *eptr == ' ' )
;2540:			*eptr++ = '\0';
ADDRLP4 4648
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4648
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4648
INDIRP4
CNSTI1 0
ASGNI1
LABELV $1709
line 2539
ADDRLP4 4652
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4652
INDIRI4
CNSTI4 0
EQI4 $1711
ADDRLP4 4652
INDIRI4
CNSTI4 32
EQI4 $1708
LABELV $1711
line 2543
;2541:
;2542:		// track start of valid string
;2543:		if (*eptr && *eptr != ' ') 
ADDRLP4 4656
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4656
INDIRI4
CNSTI4 0
EQI4 $1715
ADDRLP4 4656
INDIRI4
CNSTI4 32
EQI4 $1715
line 2544
;2544:		{
line 2545
;2545:			lines[numLines++] = eptr;
ADDRLP4 4660
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
ADDRLP4 4660
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4660
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2546
;2546:		}
ADDRGP4 $1715
JUMPV
LABELV $1714
line 2549
;2547:
;2548:		while ( *eptr && *eptr != ' ' )
;2549:			eptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $1715
line 2548
ADDRLP4 4660
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4660
INDIRI4
CNSTI4 0
EQI4 $1717
ADDRLP4 4660
INDIRI4
CNSTI4 32
NEI4 $1714
LABELV $1717
line 2550
;2550:	}
LABELV $1706
line 2537
ADDRLP4 4648
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 4648
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4648
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
GEF4 $1718
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1709
LABELV $1718
line 2552
;2551:
;2552:	i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1720
JUMPV
LABELV $1719
line 2554
;2553:	while (i < numLines) 
;2554:	{
line 2555
;2555:		Text_Paint(rect->x + 2, y, scale, color, lines[i++], 0, 20, textStyle,iMenuFont);
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4652
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 4652
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4652
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 20
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2556
;2556:		if (i < numLines) 
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
GEI4 $1722
line 2557
;2557:		{
line 2558
;2558:			Text_Paint(rect->x + rect->w / 2, y, scale, color, lines[i++], 0, 20, textStyle,iMenuFont);
ADDRLP4 4660
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4660
INDIRP4
INDIRF4
ADDRLP4 4660
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4656
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 4656
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4656
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 20
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 2559
;2559:		}
LABELV $1722
line 2560
;2560:		y += 10;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 2561
;2561:		if (y > rect->y + rect->h - 11) 
ADDRLP4 4656
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 4656
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4656
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1093664768
SUBF4
LEF4 $1724
line 2562
;2562:		{
line 2563
;2563:			break;
ADDRGP4 $1721
JUMPV
LABELV $1724
line 2565
;2564:		}
;2565:	}
LABELV $1720
line 2553
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $1719
LABELV $1721
line 2568
;2566:
;2567:
;2568:}
LABELV $1688
endproc UI_DrawGLInfo 4664 36
proc UI_Version 16 36
line 2576
;2569:
;2570:/*
;2571:=================
;2572:UI_Version
;2573:=================
;2574:*/
;2575:static void UI_Version(rectDef_t *rect, float scale, vec4_t color, int iMenuFont) 
;2576:{
line 2579
;2577:	int width;
;2578:	
;2579:	width = uiInfo.uiDC.textWidth(Q3_VERSION, scale, iMenuFont);
ADDRGP4 $1728
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 uiInfo+20
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 2581
;2580:
;2581:	uiInfo.uiDC.drawText(rect->x - width, rect->y, scale, color, Q3_VERSION, 0, 0, 0, iMenuFont);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $1728
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 uiInfo+16
INDIRP4
CALLV
pop
line 2582
;2582:}
LABELV $1726
endproc UI_Version 16 36
proc UI_OwnerDraw 48 36
line 2592
;2583:
;2584:/*
;2585:=================
;2586:UI_OwnerDraw
;2587:=================
;2588:*/
;2589:// FIXME: table drive
;2590://
;2591:static void UI_OwnerDraw(float x, float y, float w, float h, float text_x, float text_y, int ownerDraw, int ownerDrawFlags, int align, float special, float scale, vec4_t color, qhandle_t shader, int textStyle,int iMenuFont) 
;2592:{
line 2595
;2593:	rectDef_t rect;
;2594:	int findex;
;2595:	int drawRank = 0, iUse = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
line 2597
;2596:
;2597:	rect.x = x + text_x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ADDRFP4 16
INDIRF4
ADDF4
ASGNF4
line 2598
;2598:	rect.y = y + text_y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
ADDRFP4 20
INDIRF4
ADDF4
ASGNF4
line 2599
;2599:	rect.w = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
ASGNF4
line 2600
;2600:	rect.h = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
ASGNF4
line 2602
;2601:
;2602:  switch (ownerDraw) 
ADDRLP4 28
ADDRFP4 24
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 200
LTI4 $1735
ADDRLP4 28
INDIRI4
CNSTI4 289
GTI4 $1735
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1801-800
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1801
address $1736
address $1747
address $1735
address $1749
address $1750
address $1753
address $1757
address $1761
address $1763
address $1764
address $1765
address $1765
address $1765
address $1765
address $1765
address $1768
address $1768
address $1768
address $1768
address $1768
address $1771
address $1772
address $1774
address $1775
address $1735
address $1777
address $1778
address $1779
address $1780
address $1783
address $1781
address $1784
address $1782
address $1785
address $1786
address $1787
address $1788
address $1790
address $1735
address $1791
address $1792
address $1793
address $1794
address $1795
address $1759
address $1754
address $1773
address $1796
address $1797
address $1798
address $1799
address $1751
address $1758
address $1756
address $1752
address $1760
address $1789
address $1738
address $1743
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1744
address $1800
address $1735
address $1755
address $1765
address $1765
address $1765
address $1768
address $1768
address $1768
address $1742
address $1737
address $1740
address $1739
code
line 2603
;2603:  {
LABELV $1736
line 2605
;2604:    case UI_HANDICAP:
;2605:      UI_DrawHandicap(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandicap
CALLV
pop
line 2606
;2606:      break;
ADDRGP4 $1735
JUMPV
LABELV $1737
line 2608
;2607:    case UI_SKIN_COLOR:
;2608:      UI_DrawSkinColor(&rect, scale, color, textStyle, uiSkinColor, TEAM_FREE, TEAM_BLUE, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 uiSkinColor
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawSkinColor
CALLV
pop
line 2609
;2609:      break;
ADDRGP4 $1735
JUMPV
LABELV $1738
line 2611
;2610:	case UI_FORCE_SIDE:
;2611:      UI_DrawForceSide(&rect, scale, color, textStyle, uiForceSide, 1, 2, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 uiForceSide
INDIRI4
ARGI4
CNSTI4 1
ARGI4
CNSTI4 2
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawForceSide
CALLV
pop
line 2612
;2612:      break;
ADDRGP4 $1735
JUMPV
LABELV $1739
line 2614
;2613:	case UI_JEDI_NONJEDI:
;2614:      UI_DrawJediNonJedi(&rect, scale, color, textStyle, uiJediNonJedi, 0, 1, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 uiJediNonJedi
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawJediNonJedi
CALLV
pop
line 2615
;2615:      break;
ADDRGP4 $1735
JUMPV
LABELV $1740
line 2617
;2616:    case UI_FORCE_POINTS:
;2617:      UI_DrawGenericNum(&rect, scale, color, textStyle, uiForceAvailable, 1, forceMasteryPoints[MAX_FORCE_RANK], ownerDraw,iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 uiForceAvailable
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 forceMasteryPoints+28
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawGenericNum
CALLV
pop
line 2618
;2618:      break;
ADDRGP4 $1735
JUMPV
LABELV $1742
line 2620
;2619:	case UI_FORCE_MASTERY_SET:
;2620:      UI_DrawForceMastery(&rect, scale, color, textStyle, uiForceRank, 0, MAX_FORCE_RANK, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 uiForceRank
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 7
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawForceMastery
CALLV
pop
line 2621
;2621:      break;
ADDRGP4 $1735
JUMPV
LABELV $1743
line 2623
;2622:    case UI_FORCE_RANK:
;2623:      UI_DrawForceMastery(&rect, scale, color, textStyle, uiForceRank, 0, MAX_FORCE_RANK, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 uiForceRank
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 7
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawForceMastery
CALLV
pop
line 2624
;2624:      break;
ADDRGP4 $1735
JUMPV
LABELV $1744
line 2658
;2625:	case UI_FORCE_RANK_HEAL:
;2626:	case UI_FORCE_RANK_LEVITATION:
;2627:	case UI_FORCE_RANK_SPEED:
;2628:	case UI_FORCE_RANK_PUSH:
;2629:	case UI_FORCE_RANK_PULL:
;2630:	case UI_FORCE_RANK_TELEPATHY:
;2631:	case UI_FORCE_RANK_GRIP:
;2632:	case UI_FORCE_RANK_LIGHTNING:
;2633:	case UI_FORCE_RANK_RAGE:
;2634:	case UI_FORCE_RANK_PROTECT:
;2635:	case UI_FORCE_RANK_ABSORB:
;2636:	case UI_FORCE_RANK_TEAM_HEAL:
;2637:	case UI_FORCE_RANK_TEAM_FORCE:
;2638:	case UI_FORCE_RANK_DRAIN:
;2639:	case UI_FORCE_RANK_SEE:
;2640:	case UI_FORCE_RANK_SABERATTACK:
;2641:	case UI_FORCE_RANK_SABERDEFEND:
;2642:	case UI_FORCE_RANK_SABERTHROW:
;2643:
;2644://		uiForceRank
;2645:/*
;2646:		uiForceUsed
;2647:		// Only fields for white stars
;2648:		if (uiForceUsed<3)
;2649:		{
;2650:		    Menu_ShowItemByName(menu, "lightpowers_team", qtrue);
;2651:		}
;2652:		else if (uiForceUsed<6)
;2653:		{
;2654:		    Menu_ShowItemByName(menu, "lightpowers_team", qtrue);
;2655:		}
;2656:*/
;2657:
;2658:		findex = (ownerDraw - UI_FORCE_RANK)-1;
ADDRLP4 24
ADDRFP4 24
INDIRI4
CNSTI4 258
SUBI4
CNSTI4 1
SUBI4
ASGNI4
line 2660
;2659:		//this will give us the index as long as UI_FORCE_RANK is always one below the first force rank index
;2660:		if (uiForcePowerDarkLight[findex] && uiForceSide != uiForcePowerDarkLight[findex])
ADDRLP4 32
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowerDarkLight
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $1745
ADDRGP4 uiForceSide
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $1745
line 2661
;2661:		{
line 2662
;2662:			color[0] *= 0.5;
ADDRLP4 36
ADDRFP4 44
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTF4 1056964608
ADDRLP4 36
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2663
;2663:			color[1] *= 0.5;
ADDRLP4 40
ADDRFP4 44
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTF4 1056964608
ADDRLP4 40
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2664
;2664:			color[2] *= 0.5;
ADDRLP4 44
ADDRFP4 44
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTF4 1056964608
ADDRLP4 44
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2665
;2665:		}
LABELV $1745
line 2666
;2666:/*		else if (uiForceRank < UI_ForceColorMinRank[bgForcePowerCost[findex][FORCE_LEVEL_1]])
ADDRLP4 20
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
ASGNI4
line 2674
;2667:		{
;2668:			color[0] *= 0.5;
;2669:			color[1] *= 0.5;
;2670:			color[2] *= 0.5;
;2671:		}
;2672:*/		drawRank = uiForcePowersRank[findex];
;2673:
;2674:		UI_DrawForceStars(&rect, scale, color, textStyle, findex, drawRank, 0, NUM_FORCE_POWER_LEVELS-1);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 UI_DrawForceStars
CALLV
pop
line 2675
;2675:		break;
ADDRGP4 $1735
JUMPV
LABELV $1747
line 2677
;2676:    case UI_EFFECTS:
;2677:      UI_DrawEffects(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawEffects
CALLV
pop
line 2678
;2678:      break;
ADDRGP4 $1735
JUMPV
line 2681
;2679:    case UI_PLAYERMODEL:
;2680:      //UI_DrawPlayerModel(&rect);
;2681:      break;
LABELV $1749
line 2683
;2682:    case UI_CLANNAME:
;2683:      UI_DrawClanName(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawClanName
CALLV
pop
line 2684
;2684:      break;
ADDRGP4 $1735
JUMPV
LABELV $1750
line 2686
;2685:    case UI_CLANLOGO:
;2686:      UI_DrawClanLogo(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawClanLogo
CALLV
pop
line 2687
;2687:      break;
ADDRGP4 $1735
JUMPV
LABELV $1751
line 2689
;2688:    case UI_CLANCINEMATIC:
;2689:      UI_DrawClanCinematic(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawClanCinematic
CALLV
pop
line 2690
;2690:      break;
ADDRGP4 $1735
JUMPV
LABELV $1752
line 2692
;2691:    case UI_PREVIEWCINEMATIC:
;2692:      UI_DrawPreviewCinematic(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPreviewCinematic
CALLV
pop
line 2693
;2693:      break;
ADDRGP4 $1735
JUMPV
LABELV $1753
line 2695
;2694:    case UI_GAMETYPE:
;2695:      UI_DrawGameType(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawGameType
CALLV
pop
line 2696
;2696:      break;
ADDRGP4 $1735
JUMPV
LABELV $1754
line 2698
;2697:    case UI_NETGAMETYPE:
;2698:      UI_DrawNetGameType(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawNetGameType
CALLV
pop
line 2699
;2699:      break;
ADDRGP4 $1735
JUMPV
LABELV $1755
line 2701
;2700:    case UI_AUTOSWITCHLIST:
;2701:      UI_DrawAutoSwitch(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawAutoSwitch
CALLV
pop
line 2702
;2702:      break;
ADDRGP4 $1735
JUMPV
LABELV $1756
line 2704
;2703:    case UI_JOINGAMETYPE:
;2704:	  UI_DrawJoinGameType(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawJoinGameType
CALLV
pop
line 2705
;2705:	  break;
ADDRGP4 $1735
JUMPV
LABELV $1757
line 2707
;2706:    case UI_MAPPREVIEW:
;2707:      UI_DrawMapPreview(&rect, scale, color, qtrue);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawMapPreview
CALLV
pop
line 2708
;2708:      break;
ADDRGP4 $1735
JUMPV
LABELV $1758
line 2710
;2709:    case UI_MAP_TIMETOBEAT:
;2710:      UI_DrawMapTimeToBeat(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawMapTimeToBeat
CALLV
pop
line 2711
;2711:      break;
ADDRGP4 $1735
JUMPV
LABELV $1759
line 2713
;2712:    case UI_MAPCINEMATIC:
;2713:      UI_DrawMapCinematic(&rect, scale, color, qfalse);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_DrawMapCinematic
CALLV
pop
line 2714
;2714:      break;
ADDRGP4 $1735
JUMPV
LABELV $1760
line 2716
;2715:    case UI_STARTMAPCINEMATIC:
;2716:      UI_DrawMapCinematic(&rect, scale, color, qtrue);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawMapCinematic
CALLV
pop
line 2717
;2717:      break;
ADDRGP4 $1735
JUMPV
LABELV $1761
line 2719
;2718:    case UI_SKILL:
;2719:      UI_DrawSkill(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawSkill
CALLV
pop
line 2720
;2720:      break;
ADDRGP4 $1735
JUMPV
line 2723
;2721:    case UI_TOTALFORCESTARS:
;2722://      UI_DrawTotalForceStars(&rect, scale, color, textStyle);
;2723:      break;
LABELV $1763
line 2725
;2724:    case UI_BLUETEAMNAME:
;2725:      UI_DrawTeamName(&rect, scale, color, qtrue, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamName
CALLV
pop
line 2726
;2726:      break;
ADDRGP4 $1735
JUMPV
LABELV $1764
line 2728
;2727:    case UI_REDTEAMNAME:
;2728:      UI_DrawTeamName(&rect, scale, color, qfalse, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamName
CALLV
pop
line 2729
;2729:      break;
ADDRGP4 $1735
JUMPV
LABELV $1765
line 2738
;2730:    case UI_BLUETEAM1:
;2731:		case UI_BLUETEAM2:
;2732:		case UI_BLUETEAM3:
;2733:		case UI_BLUETEAM4:
;2734:		case UI_BLUETEAM5:
;2735:		case UI_BLUETEAM6:
;2736:		case UI_BLUETEAM7:
;2737:		case UI_BLUETEAM8:
;2738:	if (ownerDraw <= UI_BLUETEAM5)
ADDRFP4 24
INDIRI4
CNSTI4 214
GTI4 $1766
line 2739
;2739:	{
line 2740
;2740:	  iUse = ownerDraw-UI_BLUETEAM1 + 1;
ADDRLP4 16
ADDRFP4 24
INDIRI4
CNSTI4 210
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 2741
;2741:	}
ADDRGP4 $1767
JUMPV
LABELV $1766
line 2743
;2742:	else
;2743:	{
line 2744
;2744:	  iUse = ownerDraw-274; //unpleasent hack because I don't want to move up all the UI_BLAHTEAM# defines
ADDRLP4 16
ADDRFP4 24
INDIRI4
CNSTI4 274
SUBI4
ASGNI4
line 2745
;2745:	}
LABELV $1767
line 2746
;2746:      UI_DrawTeamMember(&rect, scale, color, qtrue, iUse, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamMember
CALLV
pop
line 2747
;2747:      break;
ADDRGP4 $1735
JUMPV
LABELV $1768
line 2756
;2748:    case UI_REDTEAM1:
;2749:		case UI_REDTEAM2:
;2750:		case UI_REDTEAM3:
;2751:		case UI_REDTEAM4:
;2752:		case UI_REDTEAM5:
;2753:		case UI_REDTEAM6:
;2754:		case UI_REDTEAM7:
;2755:		case UI_REDTEAM8:
;2756:	if (ownerDraw <= UI_REDTEAM5)
ADDRFP4 24
INDIRI4
CNSTI4 219
GTI4 $1769
line 2757
;2757:	{
line 2758
;2758:	  iUse = ownerDraw-UI_REDTEAM1 + 1;
ADDRLP4 16
ADDRFP4 24
INDIRI4
CNSTI4 215
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 2759
;2759:	}
ADDRGP4 $1770
JUMPV
LABELV $1769
line 2761
;2760:	else
;2761:	{
line 2762
;2762:	  iUse = ownerDraw-277; //unpleasent hack because I don't want to move up all the UI_BLAHTEAM# defines
ADDRLP4 16
ADDRFP4 24
INDIRI4
CNSTI4 277
SUBI4
ASGNI4
line 2763
;2763:	}
LABELV $1770
line 2764
;2764:      UI_DrawTeamMember(&rect, scale, color, qfalse, iUse, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamMember
CALLV
pop
line 2765
;2765:      break;
ADDRGP4 $1735
JUMPV
LABELV $1771
line 2767
;2766:		case UI_NETSOURCE:
;2767:      UI_DrawNetSource(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawNetSource
CALLV
pop
line 2768
;2768:			break;
ADDRGP4 $1735
JUMPV
LABELV $1772
line 2770
;2769:    case UI_NETMAPPREVIEW:
;2770:      UI_DrawNetMapPreview(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawNetMapPreview
CALLV
pop
line 2771
;2771:      break;
ADDRGP4 $1735
JUMPV
LABELV $1773
line 2773
;2772:    case UI_NETMAPCINEMATIC:
;2773:      UI_DrawNetMapCinematic(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawNetMapCinematic
CALLV
pop
line 2774
;2774:      break;
ADDRGP4 $1735
JUMPV
LABELV $1774
line 2776
;2775:		case UI_NETFILTER:
;2776:      UI_DrawNetFilter(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawNetFilter
CALLV
pop
line 2777
;2777:			break;
ADDRGP4 $1735
JUMPV
LABELV $1775
line 2779
;2778:		case UI_TIER:
;2779:			UI_DrawTier(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawTier
CALLV
pop
line 2780
;2780:			break;
ADDRGP4 $1735
JUMPV
line 2783
;2781:		case UI_OPPONENTMODEL:
;2782:			//UI_DrawOpponent(&rect);
;2783:			break;
LABELV $1777
line 2785
;2784:		case UI_TIERMAP1:
;2785:			UI_DrawTierMap(&rect, 0);
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_DrawTierMap
CALLV
pop
line 2786
;2786:			break;
ADDRGP4 $1735
JUMPV
LABELV $1778
line 2788
;2787:		case UI_TIERMAP2:
;2788:			UI_DrawTierMap(&rect, 1);
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawTierMap
CALLV
pop
line 2789
;2789:			break;
ADDRGP4 $1735
JUMPV
LABELV $1779
line 2791
;2790:		case UI_TIERMAP3:
;2791:			UI_DrawTierMap(&rect, 2);
ADDRLP4 0
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 UI_DrawTierMap
CALLV
pop
line 2792
;2792:			break;
ADDRGP4 $1735
JUMPV
LABELV $1780
line 2794
;2793:		case UI_PLAYERLOGO:
;2794:			UI_DrawPlayerLogo(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPlayerLogo
CALLV
pop
line 2795
;2795:			break;
ADDRGP4 $1735
JUMPV
LABELV $1781
line 2797
;2796:		case UI_PLAYERLOGO_METAL:
;2797:			UI_DrawPlayerLogoMetal(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPlayerLogoMetal
CALLV
pop
line 2798
;2798:			break;
ADDRGP4 $1735
JUMPV
LABELV $1782
line 2800
;2799:		case UI_PLAYERLOGO_NAME:
;2800:			UI_DrawPlayerLogoName(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPlayerLogoName
CALLV
pop
line 2801
;2801:			break;
ADDRGP4 $1735
JUMPV
LABELV $1783
line 2803
;2802:		case UI_OPPONENTLOGO:
;2803:			UI_DrawOpponentLogo(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawOpponentLogo
CALLV
pop
line 2804
;2804:			break;
ADDRGP4 $1735
JUMPV
LABELV $1784
line 2806
;2805:		case UI_OPPONENTLOGO_METAL:
;2806:			UI_DrawOpponentLogoMetal(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawOpponentLogoMetal
CALLV
pop
line 2807
;2807:			break;
ADDRGP4 $1735
JUMPV
LABELV $1785
line 2809
;2808:		case UI_OPPONENTLOGO_NAME:
;2809:			UI_DrawOpponentLogoName(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawOpponentLogoName
CALLV
pop
line 2810
;2810:			break;
ADDRGP4 $1735
JUMPV
LABELV $1786
line 2812
;2811:		case UI_TIER_MAPNAME:
;2812:			UI_DrawTierMapName(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawTierMapName
CALLV
pop
line 2813
;2813:			break;
ADDRGP4 $1735
JUMPV
LABELV $1787
line 2815
;2814:		case UI_TIER_GAMETYPE:
;2815:			UI_DrawTierGameType(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawTierGameType
CALLV
pop
line 2816
;2816:			break;
ADDRGP4 $1735
JUMPV
LABELV $1788
line 2818
;2817:		case UI_ALLMAPS_SELECTION:
;2818:			UI_DrawAllMapsSelection(&rect, scale, color, textStyle, qtrue, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawAllMapsSelection
CALLV
pop
line 2819
;2819:			break;
ADDRGP4 $1735
JUMPV
LABELV $1789
line 2821
;2820:		case UI_MAPS_SELECTION:
;2821:			UI_DrawAllMapsSelection(&rect, scale, color, textStyle, qfalse, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawAllMapsSelection
CALLV
pop
line 2822
;2822:			break;
ADDRGP4 $1735
JUMPV
LABELV $1790
line 2824
;2823:		case UI_OPPONENT_NAME:
;2824:			UI_DrawOpponentName(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawOpponentName
CALLV
pop
line 2825
;2825:			break;
ADDRGP4 $1735
JUMPV
LABELV $1791
line 2827
;2826:		case UI_BOTNAME:
;2827:			UI_DrawBotName(&rect, scale, color, textStyle,iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawBotName
CALLV
pop
line 2828
;2828:			break;
ADDRGP4 $1735
JUMPV
LABELV $1792
line 2830
;2829:		case UI_BOTSKILL:
;2830:			UI_DrawBotSkill(&rect, scale, color, textStyle,iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawBotSkill
CALLV
pop
line 2831
;2831:			break;
ADDRGP4 $1735
JUMPV
LABELV $1793
line 2833
;2832:		case UI_REDBLUE:
;2833:			UI_DrawRedBlue(&rect, scale, color, textStyle,iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawRedBlue
CALLV
pop
line 2834
;2834:			break;
ADDRGP4 $1735
JUMPV
LABELV $1794
line 2836
;2835:		case UI_CROSSHAIR:
;2836:			UI_DrawCrosshair(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawCrosshair
CALLV
pop
line 2837
;2837:			break;
ADDRGP4 $1735
JUMPV
LABELV $1795
line 2839
;2838:		case UI_SELECTEDPLAYER:
;2839:			UI_DrawSelectedPlayer(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawSelectedPlayer
CALLV
pop
line 2840
;2840:			break;
ADDRGP4 $1735
JUMPV
LABELV $1796
line 2842
;2841:		case UI_SERVERREFRESHDATE:
;2842:			UI_DrawServerRefreshDate(&rect, scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawServerRefreshDate
CALLV
pop
line 2843
;2843:			break;
ADDRGP4 $1735
JUMPV
LABELV $1797
line 2845
;2844:		case UI_SERVERMOTD:
;2845:			UI_DrawServerMOTD(&rect, scale, color, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawServerMOTD
CALLV
pop
line 2846
;2846:			break;
ADDRGP4 $1735
JUMPV
LABELV $1798
line 2848
;2847:		case UI_GLINFO:
;2848:			UI_DrawGLInfo(&rect,scale, color, textStyle, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawGLInfo
CALLV
pop
line 2849
;2849:			break;
ADDRGP4 $1735
JUMPV
LABELV $1799
line 2851
;2850:		case UI_KEYBINDSTATUS:
;2851:			UI_DrawKeyBindStatus(&rect,scale, color, textStyle,iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_DrawKeyBindStatus
CALLV
pop
line 2852
;2852:			break;
ADDRGP4 $1735
JUMPV
LABELV $1800
line 2854
;2853:		case UI_VERSION:
;2854:			UI_Version(&rect, scale, color, iMenuFont);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 56
INDIRI4
ARGI4
ADDRGP4 UI_Version
CALLV
pop
line 2855
;2855:			break;
line 2857
;2856:    default:
;2857:      break;
LABELV $1735
line 2860
;2858:  }
;2859:
;2860:}
LABELV $1730
endproc UI_OwnerDraw 48 36
proc UI_OwnerDrawVisible 16 4
line 2862
;2861:
;2862:static qboolean UI_OwnerDrawVisible(int flags) {
line 2863
;2863:	qboolean vis = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $1805
JUMPV
LABELV $1804
line 2865
;2864:
;2865:	while (flags) {
line 2867
;2866:
;2867:		if (flags & UI_SHOW_FFA) {
ADDRFP4 0
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1807
line 2868
;2868:			if (trap_Cvar_VariableValue("g_gametype") != GT_FFA && trap_Cvar_VariableValue("g_gametype") != GT_HOLOCRON && trap_Cvar_VariableValue("g_gametype") != GT_JEDIMASTER) {
ADDRGP4 $883
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 0
EQF4 $1809
ADDRGP4 $883
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
EQF4 $1809
ADDRGP4 $883
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
INDIRF4
CNSTF4 1073741824
EQF4 $1809
line 2869
;2869:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2870
;2870:			}
LABELV $1809
line 2871
;2871:			flags &= ~UI_SHOW_FFA;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 2872
;2872:		}
LABELV $1807
line 2874
;2873:
;2874:		if (flags & UI_SHOW_NOTFFA) {
ADDRFP4 0
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1811
line 2875
;2875:			if (trap_Cvar_VariableValue("g_gametype") == GT_FFA || trap_Cvar_VariableValue("g_gametype") == GT_HOLOCRON || trap_Cvar_VariableValue("g_gametype") != GT_JEDIMASTER) {
ADDRGP4 $883
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 0
EQF4 $1816
ADDRGP4 $883
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
EQF4 $1816
ADDRGP4 $883
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
INDIRF4
CNSTF4 1073741824
EQF4 $1813
LABELV $1816
line 2876
;2876:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2877
;2877:			}
LABELV $1813
line 2878
;2878:			flags &= ~UI_SHOW_NOTFFA;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 2879
;2879:		}
LABELV $1811
line 2881
;2880:
;2881:		if (flags & UI_SHOW_LEADER) {
ADDRFP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1817
line 2883
;2882:			// these need to show when this client can give orders to a player or a group
;2883:			if (!uiInfo.teamLeader) {
ADDRGP4 uiInfo+18036
INDIRI4
CNSTI4 0
NEI4 $1819
line 2884
;2884:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2885
;2885:			} else {
ADDRGP4 $1820
JUMPV
LABELV $1819
line 2887
;2886:				// if showing yourself
;2887:				if (ui_selectedPlayer.integer < uiInfo.myTeamCount && uiInfo.teamClientNums[ui_selectedPlayer.integer] == uiInfo.playerNumber) { 
ADDRGP4 ui_selectedPlayer+12
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
GEI4 $1822
ADDRGP4 ui_selectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+20088
ADDP4
INDIRI4
ADDRGP4 uiInfo+18032
INDIRI4
NEI4 $1822
line 2888
;2888:					vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2889
;2889:				}
LABELV $1822
line 2890
;2890:			}
LABELV $1820
line 2891
;2891:			flags &= ~UI_SHOW_LEADER;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 2892
;2892:		} 
LABELV $1817
line 2893
;2893:		if (flags & UI_SHOW_NOTLEADER) {
ADDRFP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1829
line 2895
;2894:			// these need to show when this client is assigning their own status or they are NOT the leader
;2895:			if (uiInfo.teamLeader) {
ADDRGP4 uiInfo+18036
INDIRI4
CNSTI4 0
EQI4 $1831
line 2897
;2896:				// if not showing yourself
;2897:				if (!(ui_selectedPlayer.integer < uiInfo.myTeamCount && uiInfo.teamClientNums[ui_selectedPlayer.integer] == uiInfo.playerNumber)) { 
ADDRGP4 ui_selectedPlayer+12
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
GEI4 $1841
ADDRGP4 ui_selectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+20088
ADDP4
INDIRI4
ADDRGP4 uiInfo+18032
INDIRI4
EQI4 $1834
LABELV $1841
line 2898
;2898:					vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2899
;2899:				}
LABELV $1834
line 2901
;2900:				// these need to show when this client can give orders to a player or a group
;2901:			}
LABELV $1831
line 2902
;2902:			flags &= ~UI_SHOW_NOTLEADER;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 2903
;2903:		} 
LABELV $1829
line 2904
;2904:		if (flags & UI_SHOW_FAVORITESERVERS) {
ADDRFP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1842
line 2906
;2905:			// this assumes you only put this type of display flag on something showing in the proper context
;2906:			if (ui_netSource.integer != AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
EQI4 $1844
line 2907
;2907:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2908
;2908:			}
LABELV $1844
line 2909
;2909:			flags &= ~UI_SHOW_FAVORITESERVERS;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 2910
;2910:		} 
LABELV $1842
line 2911
;2911:		if (flags & UI_SHOW_NOTFAVORITESERVERS) {
ADDRFP4 0
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1847
line 2913
;2912:			// this assumes you only put this type of display flag on something showing in the proper context
;2913:			if (ui_netSource.integer == AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
NEI4 $1849
line 2914
;2914:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2915
;2915:			}
LABELV $1849
line 2916
;2916:			flags &= ~UI_SHOW_NOTFAVORITESERVERS;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 2917
;2917:		} 
LABELV $1847
line 2918
;2918:		if (flags & UI_SHOW_ANYTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1852
line 2919
;2919:			if (uiInfo.gameTypes[ui_gameType.integer].gtEnum <= GT_TEAM ) {
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
CNSTI4 5
GTI4 $1854
line 2920
;2920:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2921
;2921:			}
LABELV $1854
line 2922
;2922:			flags &= ~UI_SHOW_ANYTEAMGAME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 2923
;2923:		} 
LABELV $1852
line 2924
;2924:		if (flags & UI_SHOW_ANYNONTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1859
line 2925
;2925:			if (uiInfo.gameTypes[ui_gameType.integer].gtEnum > GT_TEAM ) {
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1861
line 2926
;2926:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2927
;2927:			}
LABELV $1861
line 2928
;2928:			flags &= ~UI_SHOW_ANYNONTEAMGAME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 2929
;2929:		} 
LABELV $1859
line 2930
;2930:		if (flags & UI_SHOW_NETANYTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $1866
line 2931
;2931:			if (uiInfo.gameTypes[ui_netGameType.integer].gtEnum <= GT_TEAM ) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
CNSTI4 5
GTI4 $1868
line 2932
;2932:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2933
;2933:			}
LABELV $1868
line 2934
;2934:			flags &= ~UI_SHOW_NETANYTEAMGAME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 2935
;2935:		} 
LABELV $1866
line 2936
;2936:		if (flags & UI_SHOW_NETANYNONTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1873
line 2937
;2937:			if (uiInfo.gameTypes[ui_netGameType.integer].gtEnum > GT_TEAM ) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1875
line 2938
;2938:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2939
;2939:			}
LABELV $1875
line 2940
;2940:			flags &= ~UI_SHOW_NETANYNONTEAMGAME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 2941
;2941:		} 
LABELV $1873
line 2942
;2942:		if (flags & UI_SHOW_NEWHIGHSCORE) {
ADDRFP4 0
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1880
line 2943
;2943:			if (uiInfo.newHighScoreTime < uiInfo.uiDC.realTime) {
ADDRGP4 uiInfo+11816
INDIRI4
ADDRGP4 uiInfo+240
INDIRI4
GEI4 $1882
line 2944
;2944:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2945
;2945:			} else {
ADDRGP4 $1883
JUMPV
LABELV $1882
line 2946
;2946:				if (uiInfo.soundHighScore) {
ADDRGP4 uiInfo+11836
INDIRI4
CNSTI4 0
EQI4 $1886
line 2947
;2947:					if (trap_Cvar_VariableValue("sv_killserver") == 0) {
ADDRGP4 $353
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $1889
line 2950
;2948:						// wait on server to go down before playing sound
;2949:						//trap_S_StartLocalSound(uiInfo.newHighScoreSound, CHAN_ANNOUNCER);
;2950:						uiInfo.soundHighScore = qfalse;
ADDRGP4 uiInfo+11836
CNSTI4 0
ASGNI4
line 2951
;2951:					}
LABELV $1889
line 2952
;2952:				}
LABELV $1886
line 2953
;2953:			}
LABELV $1883
line 2954
;2954:			flags &= ~UI_SHOW_NEWHIGHSCORE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -33
BANDI4
ASGNI4
line 2955
;2955:		} 
LABELV $1880
line 2956
;2956:		if (flags & UI_SHOW_NEWBESTTIME) {
ADDRFP4 0
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1892
line 2957
;2957:			if (uiInfo.newBestTime < uiInfo.uiDC.realTime) {
ADDRGP4 uiInfo+11820
INDIRI4
ADDRGP4 uiInfo+240
INDIRI4
GEI4 $1894
line 2958
;2958:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2959
;2959:			}
LABELV $1894
line 2960
;2960:			flags &= ~UI_SHOW_NEWBESTTIME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 2961
;2961:		} 
LABELV $1892
line 2962
;2962:		if (flags & UI_SHOW_DEMOAVAILABLE) {
ADDRFP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1898
line 2963
;2963:			if (!uiInfo.demoAvailable) {
ADDRGP4 uiInfo+11832
INDIRI4
CNSTI4 0
NEI4 $1900
line 2964
;2964:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2965
;2965:			}
LABELV $1900
line 2966
;2966:			flags &= ~UI_SHOW_DEMOAVAILABLE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -65
BANDI4
ASGNI4
line 2967
;2967:		} else {
ADDRGP4 $1899
JUMPV
LABELV $1898
line 2968
;2968:			flags = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 2969
;2969:		}
LABELV $1899
line 2970
;2970:	}
LABELV $1805
line 2865
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $1804
line 2971
;2971:  return vis;
ADDRLP4 0
INDIRI4
RETI4
LABELV $1803
endproc UI_OwnerDrawVisible 16 4
proc UI_Handicap_HandleKey 20 12
line 2974
;2972:}
;2973:
;2974:static qboolean UI_Handicap_HandleKey(int flags, float *special, int key) {
line 2975
;2975:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $1908
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $1908
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $1908
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $1904
LABELV $1908
line 2977
;2976:    int h;
;2977:    h = Com_Clamp( 5, 100, trap_Cvar_VariableValue("handicap") );
ADDRGP4 $695
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 2978
;2978:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $1909
line 2979
;2979:	    h -= 5;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 5
SUBI4
ASGNI4
line 2980
;2980:		} else {
ADDRGP4 $1910
JUMPV
LABELV $1909
line 2981
;2981:	    h += 5;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 2982
;2982:		}
LABELV $1910
line 2983
;2983:    if (h > 100) {
ADDRLP4 4
INDIRI4
CNSTI4 100
LEI4 $1911
line 2984
;2984:      h = 5;
ADDRLP4 4
CNSTI4 5
ASGNI4
line 2985
;2985:    } else if (h < 0) {
ADDRGP4 $1912
JUMPV
LABELV $1911
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1913
line 2986
;2986:			h = 100;
ADDRLP4 4
CNSTI4 100
ASGNI4
line 2987
;2987:		}
LABELV $1913
LABELV $1912
line 2988
;2988:  	trap_Cvar_Set( "handicap", va( "%i", h) );
ADDRGP4 $1406
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $695
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2989
;2989:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1903
JUMPV
LABELV $1904
line 2991
;2990:  }
;2991:  return qfalse;
CNSTI4 0
RETI4
LABELV $1903
endproc UI_Handicap_HandleKey 20 12
proc UI_Effects_HandleKey 20 8
line 2994
;2992:}
;2993:
;2994:static qboolean UI_Effects_HandleKey(int flags, float *special, int key) {
line 2995
;2995:	if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $1920
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $1920
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $1920
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $1916
LABELV $1920
line 2997
;2996:		
;2997:		if ( !UI_TrueJediEnabled() )
ADDRLP4 4
ADDRGP4 UI_TrueJediEnabled
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1921
line 2998
;2998:		{
line 2999
;2999:			int team = (int)(trap_Cvar_VariableValue("ui_myteam"));
ADDRGP4 $860
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 3001
;3000:					
;3001:			if (team == TEAM_RED || team==TEAM_BLUE)
ADDRLP4 16
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $1925
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $1923
LABELV $1925
line 3002
;3002:			{
line 3003
;3003:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1915
JUMPV
LABELV $1923
line 3005
;3004:			}
;3005:		}
LABELV $1921
line 3007
;3006:				
;3007:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $1926
line 3008
;3008:			uiInfo.effectsColor--;
ADDRLP4 8
ADDRGP4 uiInfo+95196
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3009
;3009:		} else {
ADDRGP4 $1927
JUMPV
LABELV $1926
line 3010
;3010:			uiInfo.effectsColor++;
ADDRLP4 8
ADDRGP4 uiInfo+95196
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3011
;3011:		}
LABELV $1927
line 3013
;3012:		
;3013:		if( uiInfo.effectsColor > 5 ) {
ADDRGP4 uiInfo+95196
INDIRI4
CNSTI4 5
LEI4 $1930
line 3014
;3014:			uiInfo.effectsColor = 0;
ADDRGP4 uiInfo+95196
CNSTI4 0
ASGNI4
line 3015
;3015:		} else if (uiInfo.effectsColor < 0) {
ADDRGP4 $1931
JUMPV
LABELV $1930
ADDRGP4 uiInfo+95196
INDIRI4
CNSTI4 0
GEI4 $1934
line 3016
;3016:			uiInfo.effectsColor = 5;
ADDRGP4 uiInfo+95196
CNSTI4 5
ASGNI4
line 3017
;3017:		}
LABELV $1934
LABELV $1931
line 3019
;3018:		
;3019:		trap_Cvar_SetValue( "color1", /*uitogamecode[uiInfo.effectsColor]*/uiInfo.effectsColor );
ADDRGP4 $1938
ARGP4
ADDRGP4 uiInfo+95196
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3020
;3020:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1915
JUMPV
LABELV $1916
line 3022
;3021:	}
;3022:	return qfalse;
CNSTI4 0
RETI4
LABELV $1915
endproc UI_Effects_HandleKey 20 8
proc UI_ClanName_HandleKey 16 8
line 3025
;3023:}
;3024:
;3025:static qboolean UI_ClanName_HandleKey(int flags, float *special, int key) {
line 3026
;3026:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $1945
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $1945
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $1945
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $1941
LABELV $1945
line 3028
;3027:    int i;
;3028:    i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 3029
;3029:		if (uiInfo.teamList[i].cinematic >= 0) {
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
INDIRI4
CNSTI4 0
LTI4 $1946
line 3030
;3030:		  trap_CIN_StopCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 3031
;3031:			uiInfo.teamList[i].cinematic = -1;
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
CNSTI4 -1
ASGNI4
line 3032
;3032:		}
LABELV $1946
line 3033
;3033:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $1954
line 3034
;3034:	    i--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3035
;3035:		} else {
ADDRGP4 $1955
JUMPV
LABELV $1954
line 3036
;3036:	    i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3037
;3037:		}
LABELV $1955
line 3038
;3038:    if (i >= uiInfo.teamCount) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
LTI4 $1956
line 3039
;3039:      i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3040
;3040:    } else if (i < 0) {
ADDRGP4 $1957
JUMPV
LABELV $1956
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1959
line 3041
;3041:			i = uiInfo.teamCount - 1;
ADDRLP4 4
ADDRGP4 uiInfo+14156
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3042
;3042:		}
LABELV $1959
LABELV $1957
line 3043
;3043:  	trap_Cvar_Set( "ui_teamName", uiInfo.teamList[i].teamName);
ADDRGP4 $697
ARGP4
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+14160
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3044
;3044:	UI_HeadCountByTeam();
ADDRGP4 UI_HeadCountByTeam
CALLI4
pop
line 3045
;3045:	UI_FeederSelection(FEEDER_HEADS, 0);
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 UI_FeederSelection
CALLI4
pop
line 3046
;3046:	updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 3047
;3047:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1940
JUMPV
LABELV $1941
line 3049
;3048:  }
;3049:  return qfalse;
CNSTI4 0
RETI4
LABELV $1940
endproc UI_ClanName_HandleKey 16 8
proc UI_GameType_HandleKey 24 16
line 3052
;3050:}
;3051:
;3052:static qboolean UI_GameType_HandleKey(int flags, float *special, int key, qboolean resetMap) {
line 3053
;3053:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $1968
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $1968
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $1968
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $1964
LABELV $1968
line 3054
;3054:		int oldCount = UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 UI_MapCountByGameType
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 3057
;3055:
;3056:		// hard coded mess here
;3057:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $1969
line 3058
;3058:			ui_gameType.integer--;
ADDRLP4 12
ADDRGP4 ui_gameType+12
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3059
;3059:			if (ui_gameType.integer == 2) {
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 2
NEI4 $1972
line 3060
;3060:				ui_gameType.integer = 1;
ADDRGP4 ui_gameType+12
CNSTI4 1
ASGNI4
line 3061
;3061:			} else if (ui_gameType.integer < 2) {
ADDRGP4 $1970
JUMPV
LABELV $1972
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 2
GEI4 $1970
line 3062
;3062:				ui_gameType.integer = uiInfo.numGameTypes - 1;
ADDRGP4 ui_gameType+12
ADDRGP4 uiInfo+17744
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3063
;3063:			}
line 3064
;3064:		} else {
ADDRGP4 $1970
JUMPV
LABELV $1969
line 3065
;3065:			ui_gameType.integer++;
ADDRLP4 12
ADDRGP4 ui_gameType+12
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3066
;3066:			if (ui_gameType.integer >= uiInfo.numGameTypes) {
ADDRGP4 ui_gameType+12
INDIRI4
ADDRGP4 uiInfo+17744
INDIRI4
LTI4 $1982
line 3067
;3067:				ui_gameType.integer = 1;
ADDRGP4 ui_gameType+12
CNSTI4 1
ASGNI4
line 3068
;3068:			} else if (ui_gameType.integer == 2) {
ADDRGP4 $1983
JUMPV
LABELV $1982
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 2
NEI4 $1987
line 3069
;3069:				ui_gameType.integer = 3;
ADDRGP4 ui_gameType+12
CNSTI4 3
ASGNI4
line 3070
;3070:			}
LABELV $1987
LABELV $1983
line 3071
;3071:		}
LABELV $1970
line 3073
;3072:    
;3073:		if (uiInfo.gameTypes[ui_gameType.integer].gtEnum == GT_TOURNAMENT) {
ADDRLP4 12
CNSTI4 3
ASGNI4
ADDRGP4 ui_gameType+12
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $1991
line 3074
;3074:			trap_Cvar_Set("ui_Q3Model", "1");
ADDRGP4 $1996
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3075
;3075:		} else {
ADDRGP4 $1992
JUMPV
LABELV $1991
line 3076
;3076:			trap_Cvar_Set("ui_Q3Model", "0");
ADDRGP4 $1996
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3077
;3077:		}
LABELV $1992
line 3079
;3078:
;3079:		trap_Cvar_Set("ui_gameType", va("%d", ui_gameType.integer));
ADDRGP4 $702
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1997
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3080
;3080:		UI_SetCapFragLimits(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_SetCapFragLimits
CALLV
pop
line 3081
;3081:		UI_LoadBestScores(uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 3082
;3082:		if (resetMap && oldCount != UI_MapCountByGameType(qtrue)) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $2005
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 UI_MapCountByGameType
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $2005
line 3083
;3083:	  	trap_Cvar_Set( "ui_currentMap", "0");
ADDRGP4 $983
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3084
;3084:			Menu_SetFeederSelection(NULL, FEEDER_MAPS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 3085
;3085:		}
LABELV $2005
line 3086
;3086:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1963
JUMPV
LABELV $1964
line 3088
;3087:  }
;3088:  return qfalse;
CNSTI4 0
RETI4
LABELV $1963
endproc UI_GameType_HandleKey 24 16
proc UI_NetGameType_HandleKey 12 16
line 3091
;3089:}
;3090:
;3091:static qboolean UI_NetGameType_HandleKey(int flags, float *special, int key) {
line 3092
;3092:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2012
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2012
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2012
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2008
LABELV $2012
line 3094
;3093:
;3094:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2013
line 3095
;3095:			ui_netGameType.integer--;
ADDRLP4 4
ADDRGP4 ui_netGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3096
;3096:		} else {
ADDRGP4 $2014
JUMPV
LABELV $2013
line 3097
;3097:			ui_netGameType.integer++;
ADDRLP4 4
ADDRGP4 ui_netGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3098
;3098:		}
LABELV $2014
line 3100
;3099:
;3100:    if (ui_netGameType.integer < 0) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 0
GEI4 $2017
line 3101
;3101:      ui_netGameType.integer = uiInfo.numGameTypes - 1;
ADDRGP4 ui_netGameType+12
ADDRGP4 uiInfo+17744
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3102
;3102:		} else if (ui_netGameType.integer >= uiInfo.numGameTypes) {
ADDRGP4 $2018
JUMPV
LABELV $2017
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRGP4 uiInfo+17744
INDIRI4
LTI4 $2022
line 3103
;3103:      ui_netGameType.integer = 0;
ADDRGP4 ui_netGameType+12
CNSTI4 0
ASGNI4
line 3104
;3104:    } 
LABELV $2022
LABELV $2018
line 3106
;3105:
;3106:  	trap_Cvar_Set( "ui_netGameType", va("%d", ui_netGameType.integer));
ADDRGP4 $702
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $716
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3107
;3107:  	trap_Cvar_Set( "ui_actualnetGameType", va("%d", uiInfo.gameTypes[ui_netGameType.integer].gtEnum));
ADDRGP4 $702
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2028
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3108
;3108:  	trap_Cvar_Set( "ui_currentNetMap", "0");
ADDRGP4 $981
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3109
;3109:		UI_MapCountByGameType(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 3110
;3110:		Menu_SetFeederSelection(NULL, FEEDER_ALLMAPS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 3111
;3111:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2007
JUMPV
LABELV $2008
line 3113
;3112:  }
;3113:  return qfalse;
CNSTI4 0
RETI4
LABELV $2007
endproc UI_NetGameType_HandleKey 12 16
proc UI_AutoSwitch_HandleKey 16 8
line 3116
;3114:}
;3115:
;3116:static qboolean UI_AutoSwitch_HandleKey(int flags, float *special, int key) {
line 3117
;3117:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2037
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2037
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2037
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2033
LABELV $2037
line 3118
;3118:	 int switchVal = trap_Cvar_VariableValue("cg_autoswitch");
ADDRGP4 $721
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 3120
;3119:
;3120:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2038
line 3121
;3121:			switchVal--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3122
;3122:		} else {
ADDRGP4 $2039
JUMPV
LABELV $2038
line 3123
;3123:			switchVal++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3124
;3124:		}
LABELV $2039
line 3126
;3125:
;3126:    if (switchVal < 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2040
line 3127
;3127:	{
line 3128
;3128:		switchVal = 2;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 3129
;3129:	}
ADDRGP4 $2041
JUMPV
LABELV $2040
line 3130
;3130:	else if (switchVal >= 3)
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $2042
line 3131
;3131:	{
line 3132
;3132:      switchVal = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3133
;3133:    } 
LABELV $2042
LABELV $2041
line 3135
;3134:
;3135:  	trap_Cvar_Set( "cg_autoswitch", va("%i", switchVal));
ADDRGP4 $1406
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $721
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3136
;3136:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2032
JUMPV
LABELV $2033
line 3138
;3137:  }
;3138:  return qfalse;
CNSTI4 0
RETI4
LABELV $2032
endproc UI_AutoSwitch_HandleKey 16 8
proc UI_JoinGameType_HandleKey 8 8
line 3141
;3139:}
;3140:
;3141:static qboolean UI_JoinGameType_HandleKey(int flags, float *special, int key) {
line 3142
;3142:	if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2049
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2049
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2049
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2045
LABELV $2049
line 3144
;3143:
;3144:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2050
line 3145
;3145:			ui_joinGameType.integer--;
ADDRLP4 4
ADDRGP4 ui_joinGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3146
;3146:		} else {
ADDRGP4 $2051
JUMPV
LABELV $2050
line 3147
;3147:			ui_joinGameType.integer++;
ADDRLP4 4
ADDRGP4 ui_joinGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3148
;3148:		}
LABELV $2051
line 3150
;3149:
;3150:		if (ui_joinGameType.integer < 0) {
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 0
GEI4 $2054
line 3151
;3151:			ui_joinGameType.integer = uiInfo.numJoinGameTypes - 1;
ADDRGP4 ui_joinGameType+12
ADDRGP4 uiInfo+17876
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3152
;3152:		} else if (ui_joinGameType.integer >= uiInfo.numJoinGameTypes) {
ADDRGP4 $2055
JUMPV
LABELV $2054
ADDRGP4 ui_joinGameType+12
INDIRI4
ADDRGP4 uiInfo+17876
INDIRI4
LTI4 $2059
line 3153
;3153:			ui_joinGameType.integer = 0;
ADDRGP4 ui_joinGameType+12
CNSTI4 0
ASGNI4
line 3154
;3154:		}
LABELV $2059
LABELV $2055
line 3156
;3155:
;3156:		trap_Cvar_Set( "ui_joinGameType", va("%d", ui_joinGameType.integer));
ADDRGP4 $702
ARGP4
ADDRGP4 ui_joinGameType+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $740
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3157
;3157:		UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 3158
;3158:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2044
JUMPV
LABELV $2045
line 3160
;3159:	}
;3160:	return qfalse;
CNSTI4 0
RETI4
LABELV $2044
endproc UI_JoinGameType_HandleKey 8 8
proc UI_Skill_HandleKey 16 8
line 3165
;3161:}
;3162:
;3163:
;3164:
;3165:static qboolean UI_Skill_HandleKey(int flags, float *special, int key) {
line 3166
;3166:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2070
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2070
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2070
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2066
LABELV $2070
line 3167
;3167:  	int i = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $826
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 3169
;3168:
;3169:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2071
line 3170
;3170:	    i--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3171
;3171:		} else {
ADDRGP4 $2072
JUMPV
LABELV $2071
line 3172
;3172:	    i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3173
;3173:		}
LABELV $2072
line 3175
;3174:
;3175:    if (i < 1) {
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $2073
line 3176
;3176:			i = numSkillLevels;
ADDRLP4 4
ADDRGP4 numSkillLevels
INDIRI4
ASGNI4
line 3177
;3177:		} else if (i > numSkillLevels) {
ADDRGP4 $2074
JUMPV
LABELV $2073
ADDRLP4 4
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LEI4 $2075
line 3178
;3178:      i = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 3179
;3179:    }
LABELV $2075
LABELV $2074
line 3181
;3180:
;3181:    trap_Cvar_Set("g_spSkill", va("%i", i));
ADDRGP4 $1406
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $826
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3182
;3182:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2065
JUMPV
LABELV $2066
line 3184
;3183:  }
;3184:  return qfalse;
CNSTI4 0
RETI4
LABELV $2065
endproc UI_Skill_HandleKey 16 8
proc UI_TeamName_HandleKey 24 8
line 3188
;3185:}
;3186:
;3187:
;3188:static qboolean UI_TeamName_HandleKey(int flags, float *special, int key, qboolean blue) {
line 3189
;3189:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2082
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2082
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2082
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2078
LABELV $2082
line 3191
;3190:    int i;
;3191:    i = UI_TeamIndexFromName(UI_Cvar_VariableString((blue) ? "ui_blueTeam" : "ui_redTeam"));
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $2084
ADDRLP4 8
ADDRGP4 $926
ASGNP4
ADDRGP4 $2085
JUMPV
LABELV $2084
ADDRLP4 8
ADDRGP4 $927
ASGNP4
LABELV $2085
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 3193
;3192:
;3193:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2086
line 3194
;3194:	    i--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3195
;3195:		} else {
ADDRGP4 $2087
JUMPV
LABELV $2086
line 3196
;3196:	    i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3197
;3197:		}
LABELV $2087
line 3199
;3198:
;3199:    if (i >= uiInfo.teamCount) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
LTI4 $2088
line 3200
;3200:      i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3201
;3201:    } else if (i < 0) {
ADDRGP4 $2089
JUMPV
LABELV $2088
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2091
line 3202
;3202:			i = uiInfo.teamCount - 1;
ADDRLP4 4
ADDRGP4 uiInfo+14156
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3203
;3203:		}
LABELV $2091
LABELV $2089
line 3205
;3204:
;3205:    trap_Cvar_Set( (blue) ? "ui_blueTeam" : "ui_redTeam", uiInfo.teamList[i].teamName);
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $2096
ADDRLP4 20
ADDRGP4 $926
ASGNP4
ADDRGP4 $2097
JUMPV
LABELV $2096
ADDRLP4 20
ADDRGP4 $927
ASGNP4
LABELV $2097
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+14160
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3207
;3206:
;3207:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2077
JUMPV
LABELV $2078
line 3209
;3208:  }
;3209:  return qfalse;
CNSTI4 0
RETI4
LABELV $2077
endproc UI_TeamName_HandleKey 24 8
proc UI_TeamMember_HandleKey 44 8
line 3212
;3210:}
;3211:
;3212:static qboolean UI_TeamMember_HandleKey(int flags, float *special, int key, qboolean blue, int num) {
line 3213
;3213:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2103
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2103
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2103
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2099
LABELV $2103
line 3217
;3214:		// 0 - None
;3215:		// 1 - Human
;3216:		// 2..NumCharacters - Bot
;3217:		char *cvar = va(blue ? "ui_blueteam%i" : "ui_redteam%i", num);
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $2105
ADDRLP4 20
ADDRGP4 $942
ASGNP4
ADDRGP4 $2106
JUMPV
LABELV $2105
ADDRLP4 20
ADDRGP4 $943
ASGNP4
LABELV $2106
ADDRLP4 20
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 24
INDIRP4
ASGNP4
line 3218
;3218:		int value = trap_Cvar_VariableValue(cvar);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 3219
;3219:		int maxcl = trap_Cvar_VariableValue( "sv_maxClients" );
ADDRGP4 $947
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 3220
;3220:		int numval = num;
ADDRLP4 8
ADDRFP4 16
INDIRI4
ASGNI4
line 3222
;3221:
;3222:		numval *= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 3224
;3223:
;3224:		if (blue)
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $2107
line 3225
;3225:		{
line 3226
;3226:			numval -= 1;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3227
;3227:		}
LABELV $2107
line 3229
;3228:
;3229:		if (numval > maxcl)
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $2109
line 3230
;3230:		{
line 3231
;3231:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2098
JUMPV
LABELV $2109
line 3234
;3232:		}
;3233:
;3234:		if (value < 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $2111
line 3235
;3235:		{
line 3236
;3236:			value = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 3237
;3237:		}
LABELV $2111
line 3239
;3238:
;3239:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2113
line 3240
;3240:			value--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3241
;3241:		} else {
ADDRGP4 $2114
JUMPV
LABELV $2113
line 3242
;3242:			value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3243
;3243:		}
LABELV $2114
line 3252
;3244:
;3245:		/*if (ui_actualNetGameType.integer >= GT_TEAM) {
;3246:			if (value >= uiInfo.characterCount + 2) {
;3247:				value = 0;
;3248:			} else if (value < 0) {
;3249:				value = uiInfo.characterCount + 2 - 1;
;3250:			}
;3251:		} else {*/
;3252:			if (value >= UI_GetNumBots() + 2) {
ADDRLP4 36
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 36
INDIRI4
CNSTI4 2
ADDI4
LTI4 $2115
line 3253
;3253:				value = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 3254
;3254:			} else if (value < 1) {
ADDRGP4 $2116
JUMPV
LABELV $2115
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $2117
line 3255
;3255:				value = UI_GetNumBots() + 2 - 1;
ADDRLP4 40
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 40
INDIRI4
CNSTI4 2
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 3256
;3256:			}
LABELV $2117
LABELV $2116
line 3259
;3257:		//}
;3258:
;3259:		trap_Cvar_Set(cvar, va("%i", value));
ADDRGP4 $1406
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3260
;3260:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2098
JUMPV
LABELV $2099
line 3262
;3261:  }
;3262:  return qfalse;
CNSTI4 0
RETI4
LABELV $2098
endproc UI_TeamMember_HandleKey 44 8
proc UI_NetSource_HandleKey 8 8
line 3265
;3263:}
;3264:
;3265:static qboolean UI_NetSource_HandleKey(int flags, float *special, int key) {
line 3266
;3266:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2124
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2124
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2124
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2120
LABELV $2124
line 3268
;3267:		
;3268:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2125
line 3269
;3269:			ui_netSource.integer--;
ADDRLP4 4
ADDRGP4 ui_netSource+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3270
;3270:		} else {
ADDRGP4 $2126
JUMPV
LABELV $2125
line 3271
;3271:			ui_netSource.integer++;
ADDRLP4 4
ADDRGP4 ui_netSource+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3272
;3272:		}
LABELV $2126
line 3274
;3273:    
;3274:		if (ui_netSource.integer >= numNetSources) {
ADDRGP4 ui_netSource+12
INDIRI4
ADDRGP4 numNetSources
INDIRI4
LTI4 $2129
line 3275
;3275:      ui_netSource.integer = 0;
ADDRGP4 ui_netSource+12
CNSTI4 0
ASGNI4
line 3276
;3276:    } else if (ui_netSource.integer < 0) {
ADDRGP4 $2130
JUMPV
LABELV $2129
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
GEI4 $2133
line 3277
;3277:      ui_netSource.integer = numNetSources - 1;
ADDRGP4 ui_netSource+12
ADDRGP4 numNetSources
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3278
;3278:		}
LABELV $2133
LABELV $2130
line 3280
;3279:
;3280:		UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 3281
;3281:		if (ui_netSource.integer != AS_GLOBAL) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 1
EQI4 $2137
line 3282
;3282:			UI_StartServerRefresh(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 3283
;3283:		}
LABELV $2137
line 3284
;3284:  	trap_Cvar_Set( "ui_netSource", va("%d", ui_netSource.integer));
ADDRGP4 $702
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2140
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3285
;3285:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2119
JUMPV
LABELV $2120
line 3287
;3286:  }
;3287:  return qfalse;
CNSTI4 0
RETI4
LABELV $2119
endproc UI_NetSource_HandleKey 8 8
proc UI_NetFilter_HandleKey 8 4
line 3290
;3288:}
;3289:
;3290:static qboolean UI_NetFilter_HandleKey(int flags, float *special, int key) {
line 3291
;3291:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2147
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2147
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2147
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2143
LABELV $2147
line 3293
;3292:
;3293:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2148
line 3294
;3294:			ui_serverFilterType.integer--;
ADDRLP4 4
ADDRGP4 ui_serverFilterType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3295
;3295:		} else {
ADDRGP4 $2149
JUMPV
LABELV $2148
line 3296
;3296:			ui_serverFilterType.integer++;
ADDRLP4 4
ADDRGP4 ui_serverFilterType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3297
;3297:		}
LABELV $2149
line 3299
;3298:
;3299:    if (ui_serverFilterType.integer >= numServerFilters) {
ADDRGP4 ui_serverFilterType+12
INDIRI4
ADDRGP4 numServerFilters
INDIRI4
LTI4 $2152
line 3300
;3300:      ui_serverFilterType.integer = 0;
ADDRGP4 ui_serverFilterType+12
CNSTI4 0
ASGNI4
line 3301
;3301:    } else if (ui_serverFilterType.integer < 0) {
ADDRGP4 $2153
JUMPV
LABELV $2152
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
GEI4 $2156
line 3302
;3302:      ui_serverFilterType.integer = numServerFilters - 1;
ADDRGP4 ui_serverFilterType+12
ADDRGP4 numServerFilters
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3303
;3303:		}
LABELV $2156
LABELV $2153
line 3304
;3304:		UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 3305
;3305:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2142
JUMPV
LABELV $2143
line 3307
;3306:  }
;3307:  return qfalse;
CNSTI4 0
RETI4
LABELV $2142
endproc UI_NetFilter_HandleKey 8 4
proc UI_OpponentName_HandleKey 4 0
line 3310
;3308:}
;3309:
;3310:static qboolean UI_OpponentName_HandleKey(int flags, float *special, int key) {
line 3311
;3311:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2165
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2165
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2165
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2161
LABELV $2165
line 3312
;3312:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2166
line 3313
;3313:			UI_PriorOpponent();
ADDRGP4 UI_PriorOpponent
CALLV
pop
line 3314
;3314:		} else {
ADDRGP4 $2167
JUMPV
LABELV $2166
line 3315
;3315:			UI_NextOpponent();
ADDRGP4 UI_NextOpponent
CALLV
pop
line 3316
;3316:		}
LABELV $2167
line 3317
;3317:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2160
JUMPV
LABELV $2161
line 3319
;3318:  }
;3319:  return qfalse;
CNSTI4 0
RETI4
LABELV $2160
endproc UI_OpponentName_HandleKey 4 0
proc UI_BotName_HandleKey 16 0
line 3322
;3320:}
;3321:
;3322:static qboolean UI_BotName_HandleKey(int flags, float *special, int key) {
line 3323
;3323:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2173
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2173
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2173
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2169
LABELV $2173
line 3325
;3324://		int game = trap_Cvar_VariableValue("g_gametype");
;3325:		int value = uiInfo.botIndex;
ADDRLP4 4
ADDRGP4 uiInfo+11844
INDIRI4
ASGNI4
line 3327
;3326:
;3327:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2175
line 3328
;3328:			value--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3329
;3329:		} else {
ADDRGP4 $2176
JUMPV
LABELV $2175
line 3330
;3330:			value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3331
;3331:		}
LABELV $2176
line 3342
;3332:
;3333:		/*
;3334:		if (game >= GT_TEAM) {
;3335:			if (value >= uiInfo.characterCount + 2) {
;3336:				value = 0;
;3337:			} else if (value < 0) {
;3338:				value = uiInfo.characterCount + 2 - 1;
;3339:			}
;3340:		} else {
;3341:		*/
;3342:			if (value >= UI_GetNumBots()/* + 2*/) {
ADDRLP4 8
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $2177
line 3343
;3343:				value = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3344
;3344:			} else if (value < 0) {
ADDRGP4 $2178
JUMPV
LABELV $2177
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2179
line 3345
;3345:				value = UI_GetNumBots()/* + 2*/ - 1;
ADDRLP4 12
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3346
;3346:			}
LABELV $2179
LABELV $2178
line 3348
;3347:		//}
;3348:		uiInfo.botIndex = value;
ADDRGP4 uiInfo+11844
ADDRLP4 4
INDIRI4
ASGNI4
line 3349
;3349:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2168
JUMPV
LABELV $2169
line 3351
;3350:  }
;3351:  return qfalse;
CNSTI4 0
RETI4
LABELV $2168
endproc UI_BotName_HandleKey 16 0
proc UI_BotSkill_HandleKey 8 0
line 3354
;3352:}
;3353:
;3354:static qboolean UI_BotSkill_HandleKey(int flags, float *special, int key) {
line 3355
;3355:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2187
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2187
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2187
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2183
LABELV $2187
line 3356
;3356:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2188
line 3357
;3357:			uiInfo.skillIndex--;
ADDRLP4 4
ADDRGP4 uiInfo+33792
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3358
;3358:		} else {
ADDRGP4 $2189
JUMPV
LABELV $2188
line 3359
;3359:			uiInfo.skillIndex++;
ADDRLP4 4
ADDRGP4 uiInfo+33792
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3360
;3360:		}
LABELV $2189
line 3361
;3361:		if (uiInfo.skillIndex >= numSkillLevels) {
ADDRGP4 uiInfo+33792
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LTI4 $2192
line 3362
;3362:			uiInfo.skillIndex = 0;
ADDRGP4 uiInfo+33792
CNSTI4 0
ASGNI4
line 3363
;3363:		} else if (uiInfo.skillIndex < 0) {
ADDRGP4 $2193
JUMPV
LABELV $2192
ADDRGP4 uiInfo+33792
INDIRI4
CNSTI4 0
GEI4 $2196
line 3364
;3364:			uiInfo.skillIndex = numSkillLevels-1;
ADDRGP4 uiInfo+33792
ADDRGP4 numSkillLevels
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3365
;3365:		}
LABELV $2196
LABELV $2193
line 3366
;3366:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2182
JUMPV
LABELV $2183
line 3368
;3367:  }
;3368:	return qfalse;
CNSTI4 0
RETI4
LABELV $2182
endproc UI_BotSkill_HandleKey 8 0
proc UI_RedBlue_HandleKey 8 0
line 3371
;3369:}
;3370:
;3371:static qboolean UI_RedBlue_HandleKey(int flags, float *special, int key) {
line 3372
;3372:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2205
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2205
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2205
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2201
LABELV $2205
line 3373
;3373:		uiInfo.redBlue ^= 1;
ADDRLP4 4
ADDRGP4 uiInfo+18008
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 3374
;3374:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2200
JUMPV
LABELV $2201
line 3376
;3375:	}
;3376:	return qfalse;
CNSTI4 0
RETI4
LABELV $2200
endproc UI_RedBlue_HandleKey 8 0
proc UI_Crosshair_HandleKey 8 8
line 3379
;3377:}
;3378:
;3379:static qboolean UI_Crosshair_HandleKey(int flags, float *special, int key) {
line 3380
;3380:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2212
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2212
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2212
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2208
LABELV $2212
line 3381
;3381:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2213
line 3382
;3382:			uiInfo.currentCrosshair--;
ADDRLP4 4
ADDRGP4 uiInfo+60856
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3383
;3383:		} else {
ADDRGP4 $2214
JUMPV
LABELV $2213
line 3384
;3384:			uiInfo.currentCrosshair++;
ADDRLP4 4
ADDRGP4 uiInfo+60856
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3385
;3385:		}
LABELV $2214
line 3387
;3386:
;3387:		if (uiInfo.currentCrosshair >= NUM_CROSSHAIRS) {
ADDRGP4 uiInfo+60856
INDIRI4
CNSTI4 10
LTI4 $2217
line 3388
;3388:			uiInfo.currentCrosshair = 0;
ADDRGP4 uiInfo+60856
CNSTI4 0
ASGNI4
line 3389
;3389:		} else if (uiInfo.currentCrosshair < 0) {
ADDRGP4 $2218
JUMPV
LABELV $2217
ADDRGP4 uiInfo+60856
INDIRI4
CNSTI4 0
GEI4 $2221
line 3390
;3390:			uiInfo.currentCrosshair = NUM_CROSSHAIRS - 1;
ADDRGP4 uiInfo+60856
CNSTI4 9
ASGNI4
line 3391
;3391:		}
LABELV $2221
LABELV $2218
line 3392
;3392:		trap_Cvar_Set("cg_drawCrosshair", va("%d", uiInfo.currentCrosshair)); 
ADDRGP4 $702
ARGP4
ADDRGP4 uiInfo+60856
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2225
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3393
;3393:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2207
JUMPV
LABELV $2208
line 3395
;3394:	}
;3395:	return qfalse;
CNSTI4 0
RETI4
LABELV $2207
endproc UI_Crosshair_HandleKey 8 8
proc UI_SelectedPlayer_HandleKey 16 8
line 3400
;3396:}
;3397:
;3398:
;3399:
;3400:static qboolean UI_SelectedPlayer_HandleKey(int flags, float *special, int key) {
line 3401
;3401:  if (key == A_MOUSE1 || key == A_MOUSE2 || key == A_ENTER || key == A_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 141
EQI4 $2232
ADDRLP4 0
INDIRI4
CNSTI4 142
EQI4 $2232
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $2232
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $2228
LABELV $2232
line 3404
;3402:		int selected;
;3403:
;3404:		UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 3405
;3405:		if (!uiInfo.teamLeader) {
ADDRGP4 uiInfo+18036
INDIRI4
CNSTI4 0
NEI4 $2233
line 3406
;3406:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2227
JUMPV
LABELV $2233
line 3408
;3407:		}
;3408:		selected = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1545
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 3410
;3409:		
;3410:		if (key == A_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 142
NEI4 $2236
line 3411
;3411:			selected--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3412
;3412:		} else {
ADDRGP4 $2237
JUMPV
LABELV $2236
line 3413
;3413:			selected++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3414
;3414:		}
LABELV $2237
line 3416
;3415:
;3416:		if (selected > uiInfo.myTeamCount) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
LEI4 $2238
line 3417
;3417:			selected = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3418
;3418:		} else if (selected < 0) {
ADDRGP4 $2239
JUMPV
LABELV $2238
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2241
line 3419
;3419:			selected = uiInfo.myTeamCount;
ADDRLP4 4
ADDRGP4 uiInfo+18016
INDIRI4
ASGNI4
line 3420
;3420:		}
LABELV $2241
LABELV $2239
line 3422
;3421:
;3422:		if (selected == uiInfo.myTeamCount) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
NEI4 $2244
line 3423
;3423:		 	trap_Cvar_Set( "cg_selectedPlayerName", "Everyone");
ADDRGP4 $1553
ARGP4
ADDRGP4 $1555
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3424
;3424:		} else {
ADDRGP4 $2245
JUMPV
LABELV $2244
line 3425
;3425:		 	trap_Cvar_Set( "cg_selectedPlayerName", uiInfo.teamNames[selected]);
ADDRGP4 $1553
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+19064
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3426
;3426:		}
LABELV $2245
line 3427
;3427:	 	trap_Cvar_Set( "cg_selectedPlayer", va("%d", selected));
ADDRGP4 $702
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1545
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3428
;3428:	}
LABELV $2228
line 3429
;3429:	return qfalse;
CNSTI4 0
RETI4
LABELV $2227
endproc UI_SelectedPlayer_HandleKey 16 8
proc UI_OwnerDrawHandleKey 80 28
line 3433
;3430:}
;3431:
;3432:
;3433:static qboolean UI_OwnerDrawHandleKey(int ownerDraw, int flags, float *special, int key) {
line 3434
;3434:	int findex, iUse = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3436
;3435:
;3436:  switch (ownerDraw) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 200
LTI4 $2250
ADDRLP4 8
INDIRI4
CNSTI4 289
GTI4 $2250
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2281-800
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2281
address $2251
address $2258
address $2250
address $2259
address $2250
address $2260
address $2250
address $2264
address $2265
address $2266
address $2267
address $2267
address $2267
address $2267
address $2267
address $2270
address $2270
address $2270
address $2270
address $2270
address $2273
address $2250
address $2274
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2275
address $2250
address $2276
address $2277
address $2278
address $2279
address $2280
address $2250
address $2261
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2250
address $2263
address $2250
address $2250
address $2250
address $2253
address $2250
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2257
address $2250
address $2250
address $2262
address $2267
address $2267
address $2267
address $2270
address $2270
address $2270
address $2255
address $2252
address $2250
address $2254
code
LABELV $2251
line 3438
;3437:    case UI_HANDICAP:
;3438:      return UI_Handicap_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 UI_Handicap_HandleKey
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3439
;3439:      break;
LABELV $2252
line 3441
;3440:    case UI_SKIN_COLOR:
;3441:      return UI_SkinColor_HandleKey(flags, special, key, uiSkinColor, TEAM_FREE, TEAM_BLUE, ownerDraw);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 uiSkinColor
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 UI_SkinColor_HandleKey
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3442
;3442:      break;
LABELV $2253
line 3444
;3443:    case UI_FORCE_SIDE:
;3444:      return UI_ForceSide_HandleKey(flags, special, key, uiForceSide, 1, 2, ownerDraw);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 uiForceSide
INDIRI4
ARGI4
CNSTI4 1
ARGI4
CNSTI4 2
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_ForceSide_HandleKey
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3445
;3445:      break;
LABELV $2254
line 3447
;3446:    case UI_JEDI_NONJEDI:
;3447:      return UI_JediNonJedi_HandleKey(flags, special, key, uiJediNonJedi, 0, 1, ownerDraw);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 uiJediNonJedi
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_JediNonJedi_HandleKey
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3448
;3448:      break;
LABELV $2255
line 3450
;3449:	case UI_FORCE_MASTERY_SET:
;3450:      return UI_ForceMaxRank_HandleKey(flags, special, key, uiForceRank, 1, MAX_FORCE_RANK, ownerDraw);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 uiForceRank
INDIRI4
ARGI4
CNSTI4 1
ARGI4
CNSTI4 7
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 UI_ForceMaxRank_HandleKey
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3451
;3451:      break;
line 3453
;3452:    case UI_FORCE_RANK:
;3453:		break;		
LABELV $2257
line 3472
;3454:	case UI_FORCE_RANK_HEAL:
;3455:	case UI_FORCE_RANK_LEVITATION:
;3456:	case UI_FORCE_RANK_SPEED:
;3457:	case UI_FORCE_RANK_PUSH:
;3458:	case UI_FORCE_RANK_PULL:
;3459:	case UI_FORCE_RANK_TELEPATHY:
;3460:	case UI_FORCE_RANK_GRIP:
;3461:	case UI_FORCE_RANK_LIGHTNING:
;3462:	case UI_FORCE_RANK_RAGE:
;3463:	case UI_FORCE_RANK_PROTECT:
;3464:	case UI_FORCE_RANK_ABSORB:
;3465:	case UI_FORCE_RANK_TEAM_HEAL:
;3466:	case UI_FORCE_RANK_TEAM_FORCE:
;3467:	case UI_FORCE_RANK_DRAIN:
;3468:	case UI_FORCE_RANK_SEE:
;3469:	case UI_FORCE_RANK_SABERATTACK:
;3470:	case UI_FORCE_RANK_SABERDEFEND:
;3471:	case UI_FORCE_RANK_SABERTHROW:
;3472:		findex = (ownerDraw - UI_FORCE_RANK)-1;
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 258
SUBI4
CNSTI4 1
SUBI4
ASGNI4
line 3474
;3473:		//this will give us the index as long as UI_FORCE_RANK is always one below the first force rank index
;3474:		return UI_ForcePowerRank_HandleKey(flags, special, key, uiForcePowersRank[findex], 0, NUM_FORCE_POWER_LEVELS-1, ownerDraw);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiForcePowersRank
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 UI_ForcePowerRank_HandleKey
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3475
;3475:		break;
LABELV $2258
line 3477
;3476:    case UI_EFFECTS:
;3477:      return UI_Effects_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 UI_Effects_HandleKey
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3478
;3478:      break;
LABELV $2259
line 3480
;3479:    case UI_CLANNAME:
;3480:      return UI_ClanName_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 UI_ClanName_HandleKey
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3481
;3481:      break;
LABELV $2260
line 3483
;3482:    case UI_GAMETYPE:
;3483:      return UI_GameType_HandleKey(flags, special, key, qtrue);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 44
ADDRGP4 UI_GameType_HandleKey
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3484
;3484:      break;
LABELV $2261
line 3486
;3485:    case UI_NETGAMETYPE:
;3486:      return UI_NetGameType_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 UI_NetGameType_HandleKey
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3487
;3487:      break;
LABELV $2262
line 3489
;3488:    case UI_AUTOSWITCHLIST:
;3489:      return UI_AutoSwitch_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 UI_AutoSwitch_HandleKey
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3490
;3490:      break;
LABELV $2263
line 3492
;3491:    case UI_JOINGAMETYPE:
;3492:      return UI_JoinGameType_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 UI_JoinGameType_HandleKey
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3493
;3493:      break;
LABELV $2264
line 3495
;3494:    case UI_SKILL:
;3495:      return UI_Skill_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 UI_Skill_HandleKey
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3496
;3496:      break;
LABELV $2265
line 3498
;3497:    case UI_BLUETEAMNAME:
;3498:      return UI_TeamName_HandleKey(flags, special, key, qtrue);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 64
ADDRGP4 UI_TeamName_HandleKey
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3499
;3499:      break;
LABELV $2266
line 3501
;3500:    case UI_REDTEAMNAME:
;3501:      return UI_TeamName_HandleKey(flags, special, key, qfalse);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 68
ADDRGP4 UI_TeamName_HandleKey
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3502
;3502:      break;
LABELV $2267
line 3511
;3503:    case UI_BLUETEAM1:
;3504:		case UI_BLUETEAM2:
;3505:		case UI_BLUETEAM3:
;3506:		case UI_BLUETEAM4:
;3507:		case UI_BLUETEAM5:
;3508:		case UI_BLUETEAM6:
;3509:		case UI_BLUETEAM7:
;3510:		case UI_BLUETEAM8:
;3511:	if (ownerDraw <= UI_BLUETEAM5)
ADDRFP4 0
INDIRI4
CNSTI4 214
GTI4 $2268
line 3512
;3512:	{
line 3513
;3513:	  iUse = ownerDraw-UI_BLUETEAM1 + 1;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 210
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 3514
;3514:	}
ADDRGP4 $2269
JUMPV
LABELV $2268
line 3516
;3515:	else
;3516:	{
line 3517
;3517:	  iUse = ownerDraw-274; //unpleasent hack because I don't want to move up all the UI_BLAHTEAM# defines
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 274
SUBI4
ASGNI4
line 3518
;3518:	}
LABELV $2269
line 3520
;3519:
;3520:      UI_TeamMember_HandleKey(flags, special, key, qtrue, iUse);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_TeamMember_HandleKey
CALLI4
pop
line 3521
;3521:      break;
ADDRGP4 $2250
JUMPV
LABELV $2270
line 3530
;3522:    case UI_REDTEAM1:
;3523:		case UI_REDTEAM2:
;3524:		case UI_REDTEAM3:
;3525:		case UI_REDTEAM4:
;3526:		case UI_REDTEAM5:
;3527:		case UI_REDTEAM6:
;3528:		case UI_REDTEAM7:
;3529:		case UI_REDTEAM8:
;3530:	if (ownerDraw <= UI_REDTEAM5)
ADDRFP4 0
INDIRI4
CNSTI4 219
GTI4 $2271
line 3531
;3531:	{
line 3532
;3532:	  iUse = ownerDraw-UI_REDTEAM1 + 1;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 215
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 3533
;3533:	}
ADDRGP4 $2272
JUMPV
LABELV $2271
line 3535
;3534:	else
;3535:	{
line 3536
;3536:	  iUse = ownerDraw-277; //unpleasent hack because I don't want to move up all the UI_BLAHTEAM# defines
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 277
SUBI4
ASGNI4
line 3537
;3537:	}
LABELV $2272
line 3538
;3538:      UI_TeamMember_HandleKey(flags, special, key, qfalse, iUse);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_TeamMember_HandleKey
CALLI4
pop
line 3539
;3539:      break;
ADDRGP4 $2250
JUMPV
LABELV $2273
line 3541
;3540:		case UI_NETSOURCE:
;3541:      UI_NetSource_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_NetSource_HandleKey
CALLI4
pop
line 3542
;3542:			break;
ADDRGP4 $2250
JUMPV
LABELV $2274
line 3544
;3543:		case UI_NETFILTER:
;3544:      UI_NetFilter_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_NetFilter_HandleKey
CALLI4
pop
line 3545
;3545:			break;
ADDRGP4 $2250
JUMPV
LABELV $2275
line 3547
;3546:		case UI_OPPONENT_NAME:
;3547:			UI_OpponentName_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_OpponentName_HandleKey
CALLI4
pop
line 3548
;3548:			break;
ADDRGP4 $2250
JUMPV
LABELV $2276
line 3550
;3549:		case UI_BOTNAME:
;3550:			return UI_BotName_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 UI_BotName_HandleKey
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3551
;3551:			break;
LABELV $2277
line 3553
;3552:		case UI_BOTSKILL:
;3553:			return UI_BotSkill_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 UI_BotSkill_HandleKey
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
RETI4
ADDRGP4 $2248
JUMPV
line 3554
;3554:			break;
LABELV $2278
line 3556
;3555:		case UI_REDBLUE:
;3556:			UI_RedBlue_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_RedBlue_HandleKey
CALLI4
pop
line 3557
;3557:			break;
ADDRGP4 $2250
JUMPV
LABELV $2279
line 3559
;3558:		case UI_CROSSHAIR:
;3559:			UI_Crosshair_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_Crosshair_HandleKey
CALLI4
pop
line 3560
;3560:			break;
ADDRGP4 $2250
JUMPV
LABELV $2280
line 3562
;3561:		case UI_SELECTEDPLAYER:
;3562:			UI_SelectedPlayer_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_SelectedPlayer_HandleKey
CALLI4
pop
line 3563
;3563:			break;
line 3565
;3564:    default:
;3565:      break;
LABELV $2250
line 3568
;3566:  }
;3567:
;3568:  return qfalse;
CNSTI4 0
RETI4
LABELV $2248
endproc UI_OwnerDrawHandleKey 80 28
proc UI_GetValue 0 0
line 3572
;3569:}
;3570:
;3571:
;3572:static float UI_GetValue(int ownerDraw) {
line 3573
;3573:  return 0;
CNSTF4 0
RETF4
LABELV $2283
endproc UI_GetValue 0 0
proc UI_ServersQsortCompare 4 20
line 3581
;3574:}
;3575:
;3576:/*
;3577:=================
;3578:UI_ServersQsortCompare
;3579:=================
;3580:*/
;3581:static int QDECL UI_ServersQsortCompare( const void *arg1, const void *arg2 ) {
line 3582
;3582:	return trap_LAN_CompareServers( ui_netSource.integer, uiInfo.serverStatus.sortKey, uiInfo.serverStatus.sortDir, *(int*)arg1, *(int*)arg2);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+40740+2200
INDIRI4
ARGI4
ADDRGP4 uiInfo+40740+2204
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 trap_LAN_CompareServers
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2284
endproc UI_ServersQsortCompare 4 20
export UI_ServersSort
proc UI_ServersSort 0 16
line 3591
;3583:}
;3584:
;3585:
;3586:/*
;3587:=================
;3588:UI_ServersSort
;3589:=================
;3590:*/
;3591:void UI_ServersSort(int column, qboolean force) {
line 3593
;3592:
;3593:	if ( !force ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $2291
line 3594
;3594:		if ( uiInfo.serverStatus.sortKey == column ) {
ADDRGP4 uiInfo+40740+2200
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $2293
line 3595
;3595:			return;
ADDRGP4 $2290
JUMPV
LABELV $2293
line 3597
;3596:		}
;3597:	}
LABELV $2291
line 3599
;3598:
;3599:	uiInfo.serverStatus.sortKey = column;
ADDRGP4 uiInfo+40740+2200
ADDRFP4 0
INDIRI4
ASGNI4
line 3600
;3600:	qsort( &uiInfo.serverStatus.displayServers[0], uiInfo.serverStatus.numDisplayServers, sizeof(int), UI_ServersQsortCompare);
ADDRGP4 uiInfo+40740+2220
ARGP4
ADDRGP4 uiInfo+40740+10412
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 UI_ServersQsortCompare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 3601
;3601:}
LABELV $2290
endproc UI_ServersSort 0 16
proc UI_LoadMods 2092 16
line 3648
;3602:
;3603:/*
;3604:static void UI_StartSinglePlayer() {
;3605:	int i,j, k, skill;
;3606:	char buff[1024];
;3607:	i = trap_Cvar_VariableValue( "ui_currentTier" );
;3608:  if (i < 0 || i >= tierCount) {
;3609:    i = 0;
;3610:  }
;3611:	j = trap_Cvar_VariableValue("ui_currentMap");
;3612:	if (j < 0 || j > MAPS_PER_TIER) {
;3613:		j = 0;
;3614:	}
;3615:
;3616: 	trap_Cvar_SetValue( "singleplayer", 1 );
;3617: 	trap_Cvar_SetValue( "g_gametype", Com_Clamp( 0, 7, tierList[i].gameTypes[j] ) );
;3618:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", tierList[i].maps[j] ) );
;3619:	skill = trap_Cvar_VariableValue( "g_spSkill" );
;3620:
;3621:	if (j == MAPS_PER_TIER-1) {
;3622:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
;3623:		Com_sprintf( buff, sizeof(buff), "wait ; addbot %s %i %s 250 %s\n", UI_AIFromName(teamList[k].teamMembers[0]), skill, "", teamList[k].teamMembers[0]);
;3624:	} else {
;3625:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
;3626:		for (i = 0; i < PLAYERS_PER_TEAM; i++) {
;3627:			Com_sprintf( buff, sizeof(buff), "wait ; addbot %s %i %s 250 %s\n", UI_AIFromName(teamList[k].teamMembers[i]), skill, "Blue", teamList[k].teamMembers[i]);
;3628:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
;3629:		}
;3630:
;3631:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
;3632:		for (i = 1; i < PLAYERS_PER_TEAM; i++) {
;3633:			Com_sprintf( buff, sizeof(buff), "wait ; addbot %s %i %s 250 %s\n", UI_AIFromName(teamList[k].teamMembers[i]), skill, "Red", teamList[k].teamMembers[i]);
;3634:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
;3635:		}
;3636:		trap_Cmd_ExecuteText( EXEC_APPEND, "wait 5; team Red\n" );
;3637:	}
;3638:	
;3639:
;3640:}
;3641:*/
;3642:
;3643:/*
;3644:===============
;3645:UI_LoadMods
;3646:===============
;3647:*/
;3648:static void UI_LoadMods() {
line 3656
;3649:	int		numdirs;
;3650:	char	dirlist[2048];
;3651:	char	*dirptr;
;3652:  char  *descptr;
;3653:	int		i;
;3654:	int		dirlen;
;3655:
;3656:	uiInfo.modCount = 0;
ADDRGP4 uiInfo+34308
CNSTI4 0
ASGNI4
line 3657
;3657:	numdirs = trap_FS_GetFileList( "$modlist", "", dirlist, sizeof(dirlist) );
ADDRGP4 $2305
ARGP4
ADDRGP4 $165
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 2068
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 2068
INDIRI4
ASGNI4
line 3658
;3658:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 20
ASGNP4
line 3659
;3659:	for( i = 0; i < numdirs; i++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $2309
JUMPV
LABELV $2306
line 3660
;3660:		dirlen = strlen( dirptr ) + 1;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 2072
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3661
;3661:    descptr = dirptr + dirlen;
ADDRLP4 4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 3662
;3662:		uiInfo.modList[uiInfo.modCount].modName = String_Alloc(dirptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRGP4 uiInfo+34308
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+33796
ADDP4
ADDRLP4 2076
INDIRP4
ASGNP4
line 3663
;3663:		uiInfo.modList[uiInfo.modCount].modDescr = String_Alloc(descptr);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 2080
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRGP4 uiInfo+34308
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+33796+4
ADDP4
ADDRLP4 2080
INDIRP4
ASGNP4
line 3664
;3664:    dirptr += dirlen + strlen(descptr) + 1;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 2084
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ADDRLP4 2084
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 3665
;3665:		uiInfo.modCount++;
ADDRLP4 2088
ADDRGP4 uiInfo+34308
ASGNP4
ADDRLP4 2088
INDIRP4
ADDRLP4 2088
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3666
;3666:		if (uiInfo.modCount >= MAX_MODS) {
ADDRGP4 uiInfo+34308
INDIRI4
CNSTI4 64
LTI4 $2316
line 3667
;3667:			break;
ADDRGP4 $2308
JUMPV
LABELV $2316
line 3669
;3668:		}
;3669:	}
LABELV $2307
line 3659
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2309
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $2306
LABELV $2308
line 3671
;3670:
;3671:}
LABELV $2303
endproc UI_LoadMods 2092 16
proc UI_LoadMovies 4124 16
line 3679
;3672:
;3673:
;3674:/*
;3675:===============
;3676:UI_LoadMovies
;3677:===============
;3678:*/
;3679:static void UI_LoadMovies() {
line 3684
;3680:	char	movielist[4096];
;3681:	char	*moviename;
;3682:	int		i, len;
;3683:
;3684:	uiInfo.movieCount = trap_FS_GetFileList( "video", "roq", movielist, 4096 );
ADDRGP4 $2321
ARGP4
ADDRGP4 $2322
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4108
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 uiInfo+36372
ADDRLP4 4108
INDIRI4
ASGNI4
line 3686
;3685:
;3686:	if (uiInfo.movieCount) {
ADDRGP4 uiInfo+36372
INDIRI4
CNSTI4 0
EQI4 $2323
line 3687
;3687:		if (uiInfo.movieCount > MAX_MOVIES) {
ADDRGP4 uiInfo+36372
INDIRI4
CNSTI4 256
LEI4 $2326
line 3688
;3688:			uiInfo.movieCount = MAX_MOVIES;
ADDRGP4 uiInfo+36372
CNSTI4 256
ASGNI4
line 3689
;3689:		}
LABELV $2326
line 3690
;3690:		moviename = movielist;
ADDRLP4 0
ADDRLP4 12
ASGNP4
line 3691
;3691:		for ( i = 0; i < uiInfo.movieCount; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $2333
JUMPV
LABELV $2330
line 3692
;3692:			len = strlen( moviename );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4112
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4112
INDIRI4
ASGNI4
line 3693
;3693:			if (!Q_stricmp(moviename +  len - 4,".roq")) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI4 -4
ADDP4
ARGP4
ADDRGP4 $2337
ARGP4
ADDRLP4 4116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4116
INDIRI4
CNSTI4 0
NEI4 $2335
line 3694
;3694:				moviename[len-4] = '\0';
ADDRLP4 4
INDIRI4
CNSTI4 4
SUBI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 3695
;3695:			}
LABELV $2335
line 3696
;3696:			Q_strupr(moviename);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 3697
;3697:			uiInfo.movieList[i] = String_Alloc(moviename);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4120
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+35348
ADDP4
ADDRLP4 4120
INDIRP4
ASGNP4
line 3698
;3698:			moviename += len + 1;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 3699
;3699:		}
LABELV $2331
line 3691
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2333
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+36372
INDIRI4
LTI4 $2330
line 3700
;3700:	}
LABELV $2323
line 3702
;3701:
;3702:}
LABELV $2319
endproc UI_LoadMovies 4124 16
proc UI_LoadDemos 4168 16
line 3711
;3703:
;3704:
;3705:
;3706:/*
;3707:===============
;3708:UI_LoadDemos
;3709:===============
;3710:*/
;3711:static void UI_LoadDemos() {
line 3717
;3712:	char	demolist[4096];
;3713:	char demoExt[32];
;3714:	char	*demoname;
;3715:	int		i, len;
;3716:
;3717:	Com_sprintf(demoExt, sizeof(demoExt), "dm_%d", (int)trap_Cvar_VariableValue("protocol"));
ADDRGP4 $2341
ARGP4
ADDRLP4 4140
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $2340
ARGP4
ADDRLP4 4140
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 3719
;3718:
;3719:	uiInfo.demoCount = trap_FS_GetFileList( "demos", demoExt, demolist, 4096 );
ADDRGP4 $2343
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 44
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4144
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 uiInfo+35340
ADDRLP4 4144
INDIRI4
ASGNI4
line 3721
;3720:
;3721:	Com_sprintf(demoExt, sizeof(demoExt), ".dm_%d", (int)trap_Cvar_VariableValue("protocol"));
ADDRGP4 $2341
ARGP4
ADDRLP4 4148
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $2344
ARGP4
ADDRLP4 4148
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 3723
;3722:
;3723:	if (uiInfo.demoCount) {
ADDRGP4 uiInfo+35340
INDIRI4
CNSTI4 0
EQI4 $2345
line 3724
;3724:		if (uiInfo.demoCount > MAX_DEMOS) {
ADDRGP4 uiInfo+35340
INDIRI4
CNSTI4 256
LEI4 $2348
line 3725
;3725:			uiInfo.demoCount = MAX_DEMOS;
ADDRGP4 uiInfo+35340
CNSTI4 256
ASGNI4
line 3726
;3726:		}
LABELV $2348
line 3727
;3727:		demoname = demolist;
ADDRLP4 0
ADDRLP4 44
ASGNP4
line 3728
;3728:		for ( i = 0; i < uiInfo.demoCount; i++ ) {
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRGP4 $2355
JUMPV
LABELV $2352
line 3729
;3729:			len = strlen( demoname );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4152
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 4152
INDIRI4
ASGNI4
line 3730
;3730:			if (!Q_stricmp(demoname +  len - strlen(demoExt), demoExt)) {
ADDRLP4 4
ARGP4
ADDRLP4 4156
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ADDRLP4 4156
INDIRI4
SUBP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 4160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4160
INDIRI4
CNSTI4 0
NEI4 $2357
line 3731
;3731:				demoname[len-strlen(demoExt)] = '\0';
ADDRLP4 4
ARGP4
ADDRLP4 4164
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 4164
INDIRI4
SUBI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 3732
;3732:			}
LABELV $2357
line 3733
;3733:			Q_strupr(demoname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 3734
;3734:			uiInfo.demoList[i] = String_Alloc(demoname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4164
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+34316
ADDP4
ADDRLP4 4164
INDIRP4
ASGNP4
line 3735
;3735:			demoname += len + 1;
ADDRLP4 0
ADDRLP4 36
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 3736
;3736:		}
LABELV $2353
line 3728
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2355
ADDRLP4 40
INDIRI4
ADDRGP4 uiInfo+35340
INDIRI4
LTI4 $2352
line 3737
;3737:	}
LABELV $2345
line 3739
;3738:
;3739:}
LABELV $2339
endproc UI_LoadDemos 4168 16
proc UI_SetNextMap 8 16
line 3742
;3740:
;3741:
;3742:static qboolean UI_SetNextMap(int actual, int index) {
line 3744
;3743:	int i;
;3744:	for (i = actual + 1; i < uiInfo.mapCount; i++) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $2364
JUMPV
LABELV $2361
line 3745
;3745:		if (uiInfo.mapList[i].active) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+96
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2366
line 3746
;3746:			Menu_SetFeederSelection(NULL, FEEDER_MAPS, index + 1, "skirmish");
CNSTP4 0
ARGP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ARGI4
ADDRGP4 $2370
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 3747
;3747:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2360
JUMPV
LABELV $2366
line 3749
;3748:		}
;3749:	}
LABELV $2362
line 3744
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2364
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
LTI4 $2361
line 3750
;3750:	return qfalse;
CNSTI4 0
RETI4
LABELV $2360
endproc UI_SetNextMap 8 16
proc UI_StartSkirmish 1180 32
line 3754
;3751:}
;3752:
;3753:
;3754:static void UI_StartSkirmish(qboolean next) {
line 3759
;3755:	int i, k, g, delay, temp;
;3756:	float skill;
;3757:	char buff[MAX_STRING_CHARS];
;3758:
;3759:	temp = trap_Cvar_VariableValue( "g_gametype" );
ADDRGP4 $883
ARGP4
ADDRLP4 1048
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1048
INDIRF4
CVFI4 4
ASGNI4
line 3760
;3760:	trap_Cvar_Set("ui_gameType", va("%i", temp));
ADDRGP4 $1406
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1997
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3762
;3761:
;3762:	if (next) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $2372
line 3764
;3763:		int actual;
;3764:		int index = trap_Cvar_VariableValue("ui_mapIndex");
ADDRGP4 $2374
ARGP4
ADDRLP4 1064
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1056
ADDRLP4 1064
INDIRF4
CVFI4 4
ASGNI4
line 3765
;3765:	 	UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 3766
;3766:		UI_SelectedMap(index, &actual);
ADDRLP4 1056
INDIRI4
ARGI4
ADDRLP4 1060
ARGP4
ADDRGP4 UI_SelectedMap
CALLP4
pop
line 3767
;3767:		if (UI_SetNextMap(actual, index)) {
ADDRLP4 1060
INDIRI4
ARGI4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRLP4 1068
ADDRGP4 UI_SetNextMap
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
EQI4 $2375
line 3768
;3768:		} else {
ADDRGP4 $2376
JUMPV
LABELV $2375
line 3769
;3769:			UI_GameType_HandleKey(0, 0, A_MOUSE1, qfalse);
ADDRLP4 1072
CNSTI4 0
ASGNI4
ADDRLP4 1072
INDIRI4
ARGI4
CNSTP4 0
ARGP4
CNSTI4 141
ARGI4
ADDRLP4 1072
INDIRI4
ARGI4
ADDRGP4 UI_GameType_HandleKey
CALLI4
pop
line 3770
;3770:			UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 3771
;3771:			Menu_SetFeederSelection(NULL, FEEDER_MAPS, 0, "skirmish");
CNSTP4 0
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 $2370
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 3772
;3772:		}
LABELV $2376
line 3773
;3773:	}
LABELV $2372
line 3775
;3774:
;3775:	g = uiInfo.gameTypes[ui_gameType.integer].gtEnum;
ADDRLP4 1040
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ASGNI4
line 3776
;3776:	trap_Cvar_SetValue( "g_gametype", g );
ADDRGP4 $883
ARGP4
ADDRLP4 1040
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3777
;3777:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", uiInfo.mapList[ui_currentMap.integer].mapLoadName) );
ADDRGP4 $2380
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3778
;3778:	skill = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $826
ARGP4
ADDRLP4 1060
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1044
ADDRLP4 1060
INDIRF4
ASGNF4
line 3779
;3779:	trap_Cvar_Set("ui_scoreMap", uiInfo.mapList[ui_currentMap.integer].mapName);
ADDRGP4 $2384
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3781
;3780:
;3781:	k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1226
ARGP4
ADDRLP4 1064
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1068
INDIRI4
ASGNI4
line 3783
;3782:
;3783:	trap_Cvar_Set("ui_singlePlayerActive", "1");
ADDRGP4 $2387
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3786
;3784:
;3785:	// set up sp overrides, will be replaced on postgame
;3786:	temp = trap_Cvar_VariableValue( "capturelimit" );
ADDRGP4 $704
ARGP4
ADDRLP4 1072
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1072
INDIRF4
CVFI4 4
ASGNI4
line 3787
;3787:	trap_Cvar_Set("ui_saveCaptureLimit", va("%i", temp));
ADDRGP4 $1406
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2388
ARGP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3788
;3788:	temp = trap_Cvar_VariableValue( "fraglimit" );
ADDRGP4 $705
ARGP4
ADDRLP4 1080
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1080
INDIRF4
CVFI4 4
ASGNI4
line 3789
;3789:	trap_Cvar_Set("ui_saveFragLimit", va("%i", temp));
ADDRGP4 $1406
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1084
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2389
ARGP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3790
;3790:	temp = trap_Cvar_VariableValue( "duel_fraglimit" );
ADDRGP4 $2390
ARGP4
ADDRLP4 1088
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1088
INDIRF4
CVFI4 4
ASGNI4
line 3791
;3791:	trap_Cvar_Set("ui_saveDuelLimit", va("%i", temp));
ADDRGP4 $1406
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1092
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2391
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3793
;3792:
;3793:	UI_SetCapFragLimits(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_SetCapFragLimits
CALLV
pop
line 3795
;3794:
;3795:	temp = trap_Cvar_VariableValue( "cg_drawTimer" );
ADDRGP4 $2392
ARGP4
ADDRLP4 1096
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1096
INDIRF4
CVFI4 4
ASGNI4
line 3796
;3796:	trap_Cvar_Set("ui_drawTimer", va("%i", temp));
ADDRGP4 $1406
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1100
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2393
ARGP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3797
;3797:	temp = trap_Cvar_VariableValue( "g_doWarmup" );
ADDRGP4 $2394
ARGP4
ADDRLP4 1104
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1104
INDIRF4
CVFI4 4
ASGNI4
line 3798
;3798:	trap_Cvar_Set("ui_doWarmup", va("%i", temp));
ADDRGP4 $1406
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1108
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2395
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3799
;3799:	temp = trap_Cvar_VariableValue( "g_friendlyFire" );
ADDRGP4 $2396
ARGP4
ADDRLP4 1112
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1112
INDIRF4
CVFI4 4
ASGNI4
line 3800
;3800:	trap_Cvar_Set("ui_friendlyFire", va("%i", temp));
ADDRGP4 $1406
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1116
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2397
ARGP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3801
;3801:	temp = trap_Cvar_VariableValue( "sv_maxClients" );
ADDRGP4 $947
ARGP4
ADDRLP4 1120
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1120
INDIRF4
CVFI4 4
ASGNI4
line 3802
;3802:	trap_Cvar_Set("ui_maxClients", va("%i", temp));
ADDRGP4 $1406
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1124
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2398
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3803
;3803:	temp = trap_Cvar_VariableValue( "g_warmup" );
ADDRGP4 $2399
ARGP4
ADDRLP4 1128
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1128
INDIRF4
CVFI4 4
ASGNI4
line 3804
;3804:	trap_Cvar_Set("ui_Warmup", va("%i", temp));
ADDRGP4 $1406
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1132
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2400
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3805
;3805:	temp = trap_Cvar_VariableValue( "sv_pure" );
ADDRGP4 $2401
ARGP4
ADDRLP4 1136
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1136
INDIRF4
CVFI4 4
ASGNI4
line 3806
;3806:	trap_Cvar_Set("ui_pure", va("%i", temp));
ADDRGP4 $1406
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1140
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2402
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3808
;3807:
;3808:	trap_Cvar_Set("cg_cameraOrbit", "0");
ADDRGP4 $350
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3809
;3809:	trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $352
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3810
;3810:	trap_Cvar_Set("cg_drawTimer", "1");
ADDRGP4 $2392
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3811
;3811:	trap_Cvar_Set("g_doWarmup", "1");
ADDRGP4 $2394
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3812
;3812:	trap_Cvar_Set("g_warmup", "15");
ADDRGP4 $2399
ARGP4
ADDRGP4 $691
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3813
;3813:	trap_Cvar_Set("sv_pure", "0");
ADDRGP4 $2401
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3814
;3814:	trap_Cvar_Set("g_friendlyFire", "0");
ADDRGP4 $2396
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3815
;3815:	trap_Cvar_Set("g_redTeam", UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 1144
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2403
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3816
;3816:	trap_Cvar_Set("g_blueTeam", UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1226
ARGP4
ADDRLP4 1148
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2404
ARGP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3818
;3817:
;3818:	if (trap_Cvar_VariableValue("ui_recordSPDemo")) {
ADDRGP4 $2407
ARGP4
ADDRLP4 1152
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1152
INDIRF4
CNSTF4 0
EQF4 $2405
line 3819
;3819:		Com_sprintf(buff, MAX_STRING_CHARS, "%s_%i", uiInfo.mapList[ui_currentMap.integer].mapLoadName, g);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2408
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 3820
;3820:		trap_Cvar_Set("ui_recordSPDemoName", buff);
ADDRGP4 $2412
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3821
;3821:	}
LABELV $2405
line 3823
;3822:
;3823:	delay = 500;
ADDRLP4 1036
CNSTI4 500
ASGNI4
line 3825
;3824:
;3825:	if (g == GT_TOURNAMENT) {
ADDRLP4 1040
INDIRI4
CNSTI4 3
NEI4 $2413
line 3826
;3826:		temp = uiInfo.mapList[ui_currentMap.integer].teamMembers * 2;
ADDRLP4 1028
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+16
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 3827
;3827:		trap_Cvar_Set("sv_maxClients", va("%d", temp));
ADDRGP4 $702
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1156
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $947
ARGP4
ADDRLP4 1156
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3828
;3828:		Com_sprintf( buff, sizeof(buff), "wait ; addbot %s %f "", %i \n", uiInfo.mapList[ui_currentMap.integer].opponentName, skill, delay);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2418
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+12
ADDP4
INDIRP4
ARGP4
ADDRLP4 1044
INDIRF4
ARGF4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 3829
;3829:		trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3830
;3830:	} else if (g == GT_HOLOCRON || g == GT_JEDIMASTER) {
ADDRGP4 $2414
JUMPV
LABELV $2413
ADDRLP4 1040
INDIRI4
CNSTI4 1
EQI4 $2424
ADDRLP4 1040
INDIRI4
CNSTI4 2
NEI4 $2422
LABELV $2424
line 3831
;3831:		temp = uiInfo.mapList[ui_currentMap.integer].teamMembers * 2;
ADDRLP4 1028
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+16
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 3832
;3832:		trap_Cvar_Set("sv_maxClients", va("%d", temp));
ADDRGP4 $702
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1160
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $947
ARGP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3833
;3833:		for (i =0; i < uiInfo.mapList[ui_currentMap.integer].teamMembers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2431
JUMPV
LABELV $2428
line 3834
;3834:			Com_sprintf( buff, sizeof(buff), "addbot %s %f %s %i %s\n", UI_AIFromName(uiInfo.teamList[k].teamMembers[i]), skill, (g == GT_HOLOCRON) ? "" : "Blue", delay, uiInfo.teamList[k].teamMembers[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 56
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1168
ADDRGP4 UI_AIFromName
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2435
ARGP4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRLP4 1044
INDIRF4
ARGF4
ADDRLP4 1040
INDIRI4
CNSTI4 1
NEI4 $2441
ADDRLP4 1164
ADDRGP4 $165
ASGNP4
ADDRGP4 $2442
JUMPV
LABELV $2441
ADDRLP4 1164
ADDRGP4 $935
ASGNP4
LABELV $2442
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 56
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3835
;3835:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3836
;3836:			delay += 500;
ADDRLP4 1036
ADDRLP4 1036
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3837
;3837:		}
LABELV $2429
line 3833
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2431
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+16
ADDP4
INDIRI4
LTI4 $2428
line 3838
;3838:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 1164
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 1168
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1168
INDIRI4
ASGNI4
line 3839
;3839:		for (i =0; i < uiInfo.mapList[ui_currentMap.integer].teamMembers-1; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2446
JUMPV
LABELV $2443
line 3840
;3840:			Com_sprintf( buff, sizeof(buff), "addbot %s %f %s %i %s\n", UI_AIFromName(uiInfo.teamList[k].teamMembers[i]), skill, (g == GT_HOLOCRON) ? "" : "Red", delay, uiInfo.teamList[k].teamMembers[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 56
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1176
ADDRGP4 UI_AIFromName
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2435
ARGP4
ADDRLP4 1176
INDIRP4
ARGP4
ADDRLP4 1044
INDIRF4
ARGF4
ADDRLP4 1040
INDIRI4
CNSTI4 1
NEI4 $2455
ADDRLP4 1172
ADDRGP4 $165
ASGNP4
ADDRGP4 $2456
JUMPV
LABELV $2455
ADDRLP4 1172
ADDRGP4 $936
ASGNP4
LABELV $2456
ADDRLP4 1172
INDIRP4
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 56
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3841
;3841:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3842
;3842:			delay += 500;
ADDRLP4 1036
ADDRLP4 1036
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3843
;3843:		}
LABELV $2444
line 3839
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2446
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
LTI4 $2443
line 3844
;3844:	} else {
ADDRGP4 $2423
JUMPV
LABELV $2422
line 3845
;3845:		temp = uiInfo.mapList[ui_currentMap.integer].teamMembers * 2;
ADDRLP4 1028
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+16
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 3846
;3846:		trap_Cvar_Set("sv_maxClients", va("%d", temp));
ADDRGP4 $702
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1160
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $947
ARGP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3847
;3847:		for (i =0; i < uiInfo.mapList[ui_currentMap.integer].teamMembers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2463
JUMPV
LABELV $2460
line 3848
;3848:			Com_sprintf( buff, sizeof(buff), "addbot %s %f %s %i %s\n", UI_AIFromName(uiInfo.teamList[k].teamMembers[i]), skill, (g == GT_FFA) ? "" : "Blue", delay, uiInfo.teamList[k].teamMembers[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 56
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1168
ADDRGP4 UI_AIFromName
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2435
ARGP4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRLP4 1044
INDIRF4
ARGF4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $2472
ADDRLP4 1164
ADDRGP4 $165
ASGNP4
ADDRGP4 $2473
JUMPV
LABELV $2472
ADDRLP4 1164
ADDRGP4 $935
ASGNP4
LABELV $2473
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 56
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3849
;3849:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3850
;3850:			delay += 500;
ADDRLP4 1036
ADDRLP4 1036
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3851
;3851:		}
LABELV $2461
line 3847
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2463
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+16
ADDP4
INDIRI4
LTI4 $2460
line 3852
;3852:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 1164
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 1168
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1168
INDIRI4
ASGNI4
line 3853
;3853:		for (i =0; i < uiInfo.mapList[ui_currentMap.integer].teamMembers-1; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2477
JUMPV
LABELV $2474
line 3854
;3854:			Com_sprintf( buff, sizeof(buff), "addbot %s %f %s %i %s\n", UI_AIFromName(uiInfo.teamList[k].teamMembers[i]), skill, (g == GT_FFA) ? "" : "Red", delay, uiInfo.teamList[k].teamMembers[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 56
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1176
ADDRGP4 UI_AIFromName
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2435
ARGP4
ADDRLP4 1176
INDIRP4
ARGP4
ADDRLP4 1044
INDIRF4
ARGF4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $2486
ADDRLP4 1172
ADDRGP4 $165
ASGNP4
ADDRGP4 $2487
JUMPV
LABELV $2486
ADDRLP4 1172
ADDRGP4 $936
ASGNP4
LABELV $2487
ADDRLP4 1172
INDIRP4
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 56
ADDRLP4 1032
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3855
;3855:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3856
;3856:			delay += 500;
ADDRLP4 1036
ADDRLP4 1036
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3857
;3857:		}
LABELV $2475
line 3853
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2477
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
LTI4 $2474
line 3858
;3858:	}
LABELV $2423
LABELV $2414
line 3859
;3859:	if (g >= GT_TEAM ) {
ADDRLP4 1040
INDIRI4
CNSTI4 5
LTI4 $2488
line 3860
;3860:		trap_Cmd_ExecuteText( EXEC_APPEND, "wait 5; team Red\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2490
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3861
;3861:	}
LABELV $2488
line 3862
;3862:}
LABELV $2371
endproc UI_StartSkirmish 1180 32
proc UI_Update 40 8
line 3864
;3863:
;3864:static void UI_Update(const char *name) {
line 3865
;3865:	int	val = trap_Cvar_VariableValue(name);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 3867
;3866:
;3867:	if (Q_stricmp(name, "s_khz") == 0) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2494
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2492
line 3868
;3868:	{
line 3869
;3869:		trap_Cmd_ExecuteText( EXEC_APPEND, "snd_restart\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2495
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3870
;3870:		return;
ADDRGP4 $2491
JUMPV
LABELV $2492
line 3873
;3871:	}
;3872:
;3873: 	if (Q_stricmp(name, "ui_SetName") == 0) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2498
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2496
line 3874
;3874:		trap_Cvar_Set( "name", UI_Cvar_VariableString("ui_Name"));
ADDRGP4 $2500
ARGP4
ADDRLP4 16
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2499
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3875
;3875: 	} else if (Q_stricmp(name, "ui_setRate") == 0) {
ADDRGP4 $2497
JUMPV
LABELV $2496
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2503
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $2501
line 3876
;3876:		float rate = trap_Cvar_VariableValue("rate");
ADDRGP4 $2504
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 24
INDIRF4
ASGNF4
line 3877
;3877:		if (rate >= 5000) {
ADDRLP4 20
INDIRF4
CNSTF4 1167867904
LTF4 $2505
line 3878
;3878:			trap_Cvar_Set("cl_maxpackets", "30");
ADDRGP4 $2507
ARGP4
ADDRGP4 $688
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3879
;3879:			trap_Cvar_Set("cl_packetdup", "1");
ADDRGP4 $2508
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3880
;3880:		} else if (rate >= 4000) {
ADDRGP4 $2502
JUMPV
LABELV $2505
ADDRLP4 20
INDIRF4
CNSTF4 1165623296
LTF4 $2509
line 3881
;3881:			trap_Cvar_Set("cl_maxpackets", "15");
ADDRGP4 $2507
ARGP4
ADDRGP4 $691
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3882
;3882:			trap_Cvar_Set("cl_packetdup", "2");		// favor less prediction errors when there's packet loss
ADDRGP4 $2508
ARGP4
ADDRGP4 $2511
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3883
;3883:		} else {
ADDRGP4 $2502
JUMPV
LABELV $2509
line 3884
;3884:			trap_Cvar_Set("cl_maxpackets", "15");
ADDRGP4 $2507
ARGP4
ADDRGP4 $691
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3885
;3885:			trap_Cvar_Set("cl_packetdup", "1");		// favor lower bandwidth
ADDRGP4 $2508
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3886
;3886:		}
line 3887
;3887: 	} 
ADDRGP4 $2502
JUMPV
LABELV $2501
line 3888
;3888:	else if (Q_stricmp(name, "ui_GetName") == 0) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2514
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $2512
line 3889
;3889:	{
line 3890
;3890:		trap_Cvar_Set( "ui_Name", UI_Cvar_VariableString("name"));
ADDRGP4 $2499
ARGP4
ADDRLP4 24
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2500
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3891
;3891:	}
ADDRGP4 $2513
JUMPV
LABELV $2512
line 3892
;3892:	else if (Q_stricmp(name, "ui_r_colorbits") == 0) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2517
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $2515
line 3893
;3893:	{
line 3894
;3894:		switch (val) 
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 32
CNSTI4 16
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $2522
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
GTI4 $2525
LABELV $2524
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2520
ADDRGP4 $2516
JUMPV
LABELV $2525
ADDRLP4 0
INDIRI4
CNSTI4 32
EQI4 $2523
ADDRGP4 $2516
JUMPV
line 3895
;3895:		{
LABELV $2520
line 3897
;3896:			case 0:
;3897:				trap_Cvar_SetValue( "ui_r_depthbits", 0 );
ADDRGP4 $2521
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3898
;3898:				break;
ADDRGP4 $2516
JUMPV
LABELV $2522
line 3901
;3899:
;3900:			case 16:
;3901:				trap_Cvar_SetValue( "ui_r_depthbits", 16 );
ADDRGP4 $2521
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3902
;3902:				break;
ADDRGP4 $2516
JUMPV
LABELV $2523
line 3905
;3903:
;3904:			case 32:
;3905:				trap_Cvar_SetValue( "ui_r_depthbits", 24 );
ADDRGP4 $2521
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3906
;3906:				break;
line 3908
;3907:		}
;3908:	} 
ADDRGP4 $2516
JUMPV
LABELV $2515
line 3909
;3909:	else if (Q_stricmp(name, "ui_r_lodbias") == 0) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2528
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $2526
line 3910
;3910:	{
line 3911
;3911:		switch (val) 
ADDRLP4 32
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2531
ADDRLP4 32
INDIRI4
CNSTI4 1
EQI4 $2533
ADDRLP4 32
INDIRI4
CNSTI4 2
EQI4 $2534
ADDRGP4 $2527
JUMPV
line 3912
;3912:		{
LABELV $2531
line 3914
;3913:			case 0:
;3914:				trap_Cvar_SetValue( "ui_r_subdivisions", 4 );
ADDRGP4 $2532
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3915
;3915:				break;
ADDRGP4 $2527
JUMPV
LABELV $2533
line 3917
;3916:			case 1:
;3917:				trap_Cvar_SetValue( "ui_r_subdivisions", 12 );
ADDRGP4 $2532
ARGP4
CNSTF4 1094713344
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3918
;3918:				break;
ADDRGP4 $2527
JUMPV
LABELV $2534
line 3921
;3919:
;3920:			case 2:
;3921:				trap_Cvar_SetValue( "ui_r_subdivisions", 20 );
ADDRGP4 $2532
ARGP4
CNSTF4 1101004800
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3922
;3922:				break;
line 3924
;3923:		}
;3924:	} 
ADDRGP4 $2527
JUMPV
LABELV $2526
line 3925
;3925:	else if (Q_stricmp(name, "ui_r_glCustom") == 0) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2537
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $2535
line 3926
;3926:	{
line 3927
;3927:		switch (val) 
ADDRLP4 36
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $2536
ADDRLP4 36
INDIRI4
CNSTI4 3
GTI4 $2536
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2553
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2553
address $2540
address $2549
address $2550
address $2552
code
line 3928
;3928:		{
LABELV $2540
line 3931
;3929:			case 0:	// high quality
;3930:
;3931:				trap_Cvar_SetValue( "ui_r_fullScreen", 1 );
ADDRGP4 $2541
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3932
;3932:				trap_Cvar_SetValue( "ui_r_subdivisions", 4 );
ADDRGP4 $2532
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3933
;3933:				trap_Cvar_SetValue( "ui_r_lodbias", 0 );
ADDRGP4 $2528
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3934
;3934:				trap_Cvar_SetValue( "ui_r_colorbits", 32 );
ADDRGP4 $2517
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3935
;3935:				trap_Cvar_SetValue( "ui_r_depthbits", 24 );
ADDRGP4 $2521
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3936
;3936:				trap_Cvar_SetValue( "ui_r_picmip", 0 );
ADDRGP4 $2542
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3937
;3937:				trap_Cvar_SetValue( "ui_r_mode", 4 );
ADDRGP4 $2543
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3938
;3938:				trap_Cvar_SetValue( "ui_r_texturebits", 32 );
ADDRGP4 $2544
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3939
;3939:				trap_Cvar_SetValue( "ui_r_fastSky", 0 );
ADDRGP4 $2545
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3940
;3940:				trap_Cvar_SetValue( "ui_r_inGameVideo", 1 );
ADDRGP4 $2546
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3942
;3941:				//trap_Cvar_SetValue( "ui_cg_shadows", 2 );//stencil
;3942:				trap_Cvar_Set( "ui_r_texturemode", "GL_LINEAR_MIPMAP_LINEAR" );
ADDRGP4 $2547
ARGP4
ADDRGP4 $2548
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3943
;3943:				break;
ADDRGP4 $2536
JUMPV
LABELV $2549
line 3946
;3944:
;3945:			case 1: // normal 
;3946:				trap_Cvar_SetValue( "ui_r_fullScreen", 1 );
ADDRGP4 $2541
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3947
;3947:				trap_Cvar_SetValue( "ui_r_subdivisions", 4 );
ADDRGP4 $2532
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3948
;3948:				trap_Cvar_SetValue( "ui_r_lodbias", 0 );
ADDRGP4 $2528
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3949
;3949:				trap_Cvar_SetValue( "ui_r_colorbits", 0 );
ADDRGP4 $2517
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3950
;3950:				trap_Cvar_SetValue( "ui_r_depthbits", 24 );
ADDRGP4 $2521
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3951
;3951:				trap_Cvar_SetValue( "ui_r_picmip", 1 );
ADDRGP4 $2542
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3952
;3952:				trap_Cvar_SetValue( "ui_r_mode", 3 );
ADDRGP4 $2543
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3953
;3953:				trap_Cvar_SetValue( "ui_r_texturebits", 0 );
ADDRGP4 $2544
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3954
;3954:				trap_Cvar_SetValue( "ui_r_fastSky", 0 );
ADDRGP4 $2545
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3955
;3955:				trap_Cvar_SetValue( "ui_r_inGameVideo", 1 );
ADDRGP4 $2546
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3957
;3956:				//trap_Cvar_SetValue( "ui_cg_shadows", 2 );
;3957:				trap_Cvar_Set( "ui_r_texturemode", "GL_LINEAR_MIPMAP_LINEAR" );
ADDRGP4 $2547
ARGP4
ADDRGP4 $2548
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3958
;3958:				break;
ADDRGP4 $2536
JUMPV
LABELV $2550
line 3962
;3959:
;3960:			case 2: // fast
;3961:
;3962:				trap_Cvar_SetValue( "ui_r_fullScreen", 1 );
ADDRGP4 $2541
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3963
;3963:				trap_Cvar_SetValue( "ui_r_subdivisions", 12 );
ADDRGP4 $2532
ARGP4
CNSTF4 1094713344
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3964
;3964:				trap_Cvar_SetValue( "ui_r_lodbias", 1 );
ADDRGP4 $2528
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3965
;3965:				trap_Cvar_SetValue( "ui_r_colorbits", 0 );
ADDRGP4 $2517
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3966
;3966:				trap_Cvar_SetValue( "ui_r_depthbits", 0 );
ADDRGP4 $2521
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3967
;3967:				trap_Cvar_SetValue( "ui_r_picmip", 2 );
ADDRGP4 $2542
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3968
;3968:				trap_Cvar_SetValue( "ui_r_mode", 3 );
ADDRGP4 $2543
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3969
;3969:				trap_Cvar_SetValue( "ui_r_texturebits", 0 );
ADDRGP4 $2544
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3970
;3970:				trap_Cvar_SetValue( "ui_r_fastSky", 1 );
ADDRGP4 $2545
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3971
;3971:				trap_Cvar_SetValue( "ui_r_inGameVideo", 0 );
ADDRGP4 $2546
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3973
;3972:				//trap_Cvar_SetValue( "ui_cg_shadows", 1 );
;3973:				trap_Cvar_Set( "ui_r_texturemode", "GL_LINEAR_MIPMAP_NEAREST" );
ADDRGP4 $2547
ARGP4
ADDRGP4 $2551
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3974
;3974:				break;
ADDRGP4 $2536
JUMPV
LABELV $2552
line 3978
;3975:
;3976:			case 3: // fastest
;3977:
;3978:				trap_Cvar_SetValue( "ui_r_fullScreen", 1 );
ADDRGP4 $2541
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3979
;3979:				trap_Cvar_SetValue( "ui_r_subdivisions", 20 );
ADDRGP4 $2532
ARGP4
CNSTF4 1101004800
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3980
;3980:				trap_Cvar_SetValue( "ui_r_lodbias", 2 );
ADDRGP4 $2528
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3981
;3981:				trap_Cvar_SetValue( "ui_r_colorbits", 16 );
ADDRGP4 $2517
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3982
;3982:				trap_Cvar_SetValue( "ui_r_depthbits", 16 );
ADDRGP4 $2521
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3983
;3983:				trap_Cvar_SetValue( "ui_r_mode", 3 );
ADDRGP4 $2543
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3984
;3984:				trap_Cvar_SetValue( "ui_r_picmip", 3 );
ADDRGP4 $2542
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3985
;3985:				trap_Cvar_SetValue( "ui_r_texturebits", 16 );
ADDRGP4 $2544
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3986
;3986:				trap_Cvar_SetValue( "ui_r_fastSky", 1 );
ADDRGP4 $2545
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3987
;3987:				trap_Cvar_SetValue( "ui_r_inGameVideo", 0 );
ADDRGP4 $2546
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3989
;3988:				//trap_Cvar_SetValue( "ui_cg_shadows", 0 );
;3989:				trap_Cvar_Set( "ui_r_texturemode", "GL_LINEAR_MIPMAP_NEAREST" );
ADDRGP4 $2547
ARGP4
ADDRGP4 $2551
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3990
;3990:			break;
line 3992
;3991:		}
;3992:	} 
ADDRGP4 $2536
JUMPV
LABELV $2535
line 3993
;3993:	else if (Q_stricmp(name, "ui_mousePitch") == 0) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2556
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $2554
line 3994
;3994:	{
line 3995
;3995:		if (val == 0) 
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2557
line 3996
;3996:		{
line 3997
;3997:			trap_Cvar_SetValue( "m_pitch", 0.022f );
ADDRGP4 $2559
ARGP4
CNSTF4 1018444120
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3998
;3998:		} 
ADDRGP4 $2558
JUMPV
LABELV $2557
line 4000
;3999:		else 
;4000:		{
line 4001
;4001:			trap_Cvar_SetValue( "m_pitch", -0.022f );
ADDRGP4 $2559
ARGP4
CNSTF4 3165927768
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4002
;4002:		}
LABELV $2558
line 4003
;4003:	}
LABELV $2554
LABELV $2536
LABELV $2527
LABELV $2516
LABELV $2513
LABELV $2502
LABELV $2497
line 4004
;4004:}
LABELV $2491
endproc UI_Update 40 8
data
export gUISelectedMap
align 4
LABELV gUISelectedMap
byte 4 0
code
proc UI_DeferMenuScript 32 8
line 4016
;4005:
;4006:int gUISelectedMap = 0;
;4007:
;4008:/*
;4009:===============
;4010:UI_DeferMenuScript
;4011:
;4012:Return true if the menu script should be deferred for later
;4013:===============
;4014:*/
;4015:static qboolean UI_DeferMenuScript ( char **args )
;4016:{
line 4020
;4017:	const char* name;
;4018:
;4019:	// Whats the reason for being deferred?
;4020:	if (!String_Parse( (char**)args, &name)) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2561
line 4021
;4021:	{
line 4022
;4022:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2560
JUMPV
LABELV $2561
line 4026
;4023:	}
;4024:
;4025:	// Handle the custom cases
;4026:	if ( !Q_stricmp ( name, "VideoSetup" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $2565
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2563
line 4027
;4027:	{
line 4032
;4028:		const char* warningMenuName;
;4029:		qboolean	deferred;
;4030:
;4031:		// No warning menu specified
;4032:		if ( !String_Parse( (char**)args, &warningMenuName) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $2566
line 4033
;4033:		{
line 4034
;4034:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2560
JUMPV
LABELV $2566
line 4038
;4035:		}
;4036:
;4037:		// Defer if the video options were modified
;4038:		deferred = trap_Cvar_VariableValue ( "ui_r_modified" ) ? qtrue : qfalse;
ADDRGP4 $2568
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 28
INDIRF4
CNSTF4 0
EQF4 $2570
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $2571
JUMPV
LABELV $2570
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $2571
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 4040
;4039:
;4040:		if ( deferred )
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2572
line 4041
;4041:		{
line 4043
;4042:			// Open the warning menu
;4043:			Menus_OpenByName(warningMenuName);
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 Menus_OpenByName
CALLV
pop
line 4044
;4044:		}
LABELV $2572
line 4046
;4045:
;4046:		return deferred;
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $2560
JUMPV
LABELV $2563
line 4048
;4047:	}
;4048:	else if ( !Q_stricmp ( name, "RulesBackout" ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $2576
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2574
line 4049
;4049:	{
line 4052
;4050:		qboolean deferred;
;4051:		
;4052:		deferred = trap_Cvar_VariableValue ( "ui_rules_backout" ) ? qtrue : qfalse ;
ADDRGP4 $2577
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 0
EQF4 $2579
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $2580
JUMPV
LABELV $2579
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $2580
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 4054
;4053:
;4054:		trap_Cvar_Set ( "ui_rules_backout", "0" );
ADDRGP4 $2577
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4056
;4055:
;4056:		return deferred;
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $2560
JUMPV
LABELV $2574
line 4059
;4057:	}
;4058:
;4059:	return qfalse;
CNSTI4 0
RETI4
LABELV $2560
endproc UI_DeferMenuScript 32 8
export UI_UpdateVideoSetup
proc UI_UpdateVideoSetup 60 8
line 4072
;4060:}
;4061:
;4062:/*
;4063:=================
;4064:UI_UpdateVideoSetup
;4065:
;4066:Copies the temporary user interface version of the video cvars into
;4067:their real counterparts.  This is to create a interface which allows 
;4068:you to discard your changes if you did something you didnt want
;4069:=================
;4070:*/
;4071:void UI_UpdateVideoSetup ( void )
;4072:{
line 4073
;4073:	trap_Cvar_Set ( "r_mode", UI_Cvar_VariableString ( "ui_r_mode" ) );
ADDRGP4 $2543
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2582
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4074
;4074:	trap_Cvar_Set ( "r_fullscreen", UI_Cvar_VariableString ( "ui_r_fullscreen" ) );
ADDRGP4 $2584
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2583
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4075
;4075:	trap_Cvar_Set ( "r_colorbits", UI_Cvar_VariableString ( "ui_r_colorbits" ) );
ADDRGP4 $2517
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2585
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4076
;4076:	trap_Cvar_Set ( "r_lodbias", UI_Cvar_VariableString ( "ui_r_lodbias" ) );
ADDRGP4 $2528
ARGP4
ADDRLP4 12
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2586
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4077
;4077:	trap_Cvar_Set ( "r_picmip", UI_Cvar_VariableString ( "ui_r_picmip" ) );
ADDRGP4 $2542
ARGP4
ADDRLP4 16
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2587
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4078
;4078:	trap_Cvar_Set ( "r_texturebits", UI_Cvar_VariableString ( "ui_r_texturebits" ) );
ADDRGP4 $2544
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2588
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4079
;4079:	trap_Cvar_Set ( "r_texturemode", UI_Cvar_VariableString ( "ui_r_texturemode" ) );
ADDRGP4 $2547
ARGP4
ADDRLP4 24
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2589
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4080
;4080:	trap_Cvar_Set ( "r_detailtextures", UI_Cvar_VariableString ( "ui_r_detailtextures" ) );
ADDRGP4 $2591
ARGP4
ADDRLP4 28
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2590
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4081
;4081:	trap_Cvar_Set ( "r_ext_compress_textures", UI_Cvar_VariableString ( "ui_r_ext_compress_textures" ) );
ADDRGP4 $2593
ARGP4
ADDRLP4 32
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2592
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4082
;4082:	trap_Cvar_Set ( "r_depthbits", UI_Cvar_VariableString ( "ui_r_depthbits" ) );
ADDRGP4 $2521
ARGP4
ADDRLP4 36
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2594
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4083
;4083:	trap_Cvar_Set ( "r_subdivisions", UI_Cvar_VariableString ( "ui_r_subdivisions" ) );
ADDRGP4 $2532
ARGP4
ADDRLP4 40
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2595
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4084
;4084:	trap_Cvar_Set ( "r_fastSky", UI_Cvar_VariableString ( "ui_r_fastSky" ) );
ADDRGP4 $2545
ARGP4
ADDRLP4 44
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2596
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4085
;4085:	trap_Cvar_Set ( "r_inGameVideo", UI_Cvar_VariableString ( "ui_r_inGameVideo" ) );
ADDRGP4 $2546
ARGP4
ADDRLP4 48
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2597
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4086
;4086:	trap_Cvar_Set ( "r_allowExtensions", UI_Cvar_VariableString ( "ui_r_allowExtensions" ) );
ADDRGP4 $2599
ARGP4
ADDRLP4 52
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2598
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4087
;4087:	trap_Cvar_Set ( "cg_shadows", UI_Cvar_VariableString ( "ui_cg_shadows" ) );
ADDRGP4 $2601
ARGP4
ADDRLP4 56
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2600
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4088
;4088:	trap_Cvar_Set ( "ui_r_modified", "0" );
ADDRGP4 $2568
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4090
;4089:
;4090:	trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $2602
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4091
;4091:}
LABELV $2581
endproc UI_UpdateVideoSetup 60 8
export UI_GetVideoSetup
proc UI_GetVideoSetup 60 16
line 4102
;4092:
;4093:/*
;4094:=================
;4095:UI_GetVideoSetup
;4096:
;4097:Retrieves the current actual video settings into the temporary user
;4098:interface versions of the cvars.
;4099:=================
;4100:*/
;4101:void UI_GetVideoSetup ( void )
;4102:{
line 4104
;4103:	// Make sure the cvars are registered as read only.
;4104:	trap_Cvar_Register ( NULL, "ui_r_glCustom",				"4", CVAR_ROM|CVAR_INTERNAL|CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $2537
ARGP4
ADDRGP4 $2604
ARGP4
CNSTI4 2113
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4106
;4105:
;4106:	trap_Cvar_Register ( NULL, "ui_r_mode",					"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2543
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4107
;4107:	trap_Cvar_Register ( NULL, "ui_r_fullscreen",			"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2584
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4108
;4108:	trap_Cvar_Register ( NULL, "ui_r_colorbits",			"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2517
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4109
;4109:	trap_Cvar_Register ( NULL, "ui_r_lodbias",				"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2528
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4110
;4110:	trap_Cvar_Register ( NULL, "ui_r_picmip",				"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2542
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4111
;4111:	trap_Cvar_Register ( NULL, "ui_r_texturebits",			"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2544
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4112
;4112:	trap_Cvar_Register ( NULL, "ui_r_texturemode",			"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2547
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4113
;4113:	trap_Cvar_Register ( NULL, "ui_r_detailtextures",		"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2591
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4114
;4114:	trap_Cvar_Register ( NULL, "ui_r_ext_compress_textures","0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2593
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4115
;4115:	trap_Cvar_Register ( NULL, "ui_r_depthbits",			"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2521
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4116
;4116:	trap_Cvar_Register ( NULL, "ui_r_subdivisions",			"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2532
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4117
;4117:	trap_Cvar_Register ( NULL, "ui_r_fastSky",				"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2545
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4118
;4118:	trap_Cvar_Register ( NULL, "ui_r_inGameVideo",			"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2546
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4119
;4119:	trap_Cvar_Register ( NULL, "ui_r_allowExtensions",		"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2599
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4120
;4120:	trap_Cvar_Register ( NULL, "ui_cg_shadows",				"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2601
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4121
;4121:	trap_Cvar_Register ( NULL, "ui_r_modified",				"0", CVAR_ROM|CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $2568
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2112
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 4124
;4122:	
;4123:	// Copy over the real video cvars into their temporary counterparts
;4124:	trap_Cvar_Set ( "ui_r_mode",		UI_Cvar_VariableString ( "r_mode" ) );
ADDRGP4 $2582
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2543
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4125
;4125:	trap_Cvar_Set ( "ui_r_colorbits",	UI_Cvar_VariableString ( "r_colorbits" ) );
ADDRGP4 $2585
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2517
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4126
;4126:	trap_Cvar_Set ( "ui_r_fullscreen",	UI_Cvar_VariableString ( "r_fullscreen" ) );
ADDRGP4 $2583
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2584
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4127
;4127:	trap_Cvar_Set ( "ui_r_lodbias",		UI_Cvar_VariableString ( "r_lodbias" ) );
ADDRGP4 $2586
ARGP4
ADDRLP4 12
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2528
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4128
;4128:	trap_Cvar_Set ( "ui_r_picmip",		UI_Cvar_VariableString ( "r_picmip" ) );
ADDRGP4 $2587
ARGP4
ADDRLP4 16
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2542
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4129
;4129:	trap_Cvar_Set ( "ui_r_texturebits", UI_Cvar_VariableString ( "r_texturebits" ) );
ADDRGP4 $2588
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2544
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4130
;4130:	trap_Cvar_Set ( "ui_r_texturemode", UI_Cvar_VariableString ( "r_texturemode" ) );
ADDRGP4 $2589
ARGP4
ADDRLP4 24
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2547
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4131
;4131:	trap_Cvar_Set ( "ui_r_detailtextures", UI_Cvar_VariableString ( "r_detailtextures" ) );
ADDRGP4 $2590
ARGP4
ADDRLP4 28
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2591
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4132
;4132:	trap_Cvar_Set ( "ui_r_ext_compress_textures", UI_Cvar_VariableString ( "r_ext_compress_textures" ) );
ADDRGP4 $2592
ARGP4
ADDRLP4 32
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2593
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4133
;4133:	trap_Cvar_Set ( "ui_r_depthbits", UI_Cvar_VariableString ( "r_depthbits" ) );
ADDRGP4 $2594
ARGP4
ADDRLP4 36
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2521
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4134
;4134:	trap_Cvar_Set ( "ui_r_subdivisions", UI_Cvar_VariableString ( "r_subdivisions" ) );
ADDRGP4 $2595
ARGP4
ADDRLP4 40
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2532
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4135
;4135:	trap_Cvar_Set ( "ui_r_fastSky", UI_Cvar_VariableString ( "r_fastSky" ) );
ADDRGP4 $2596
ARGP4
ADDRLP4 44
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2545
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4136
;4136:	trap_Cvar_Set ( "ui_r_inGameVideo", UI_Cvar_VariableString ( "r_inGameVideo" ) );
ADDRGP4 $2597
ARGP4
ADDRLP4 48
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2546
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4137
;4137:	trap_Cvar_Set ( "ui_r_allowExtensions", UI_Cvar_VariableString ( "r_allowExtensions" ) );
ADDRGP4 $2598
ARGP4
ADDRLP4 52
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2599
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4138
;4138:	trap_Cvar_Set ( "ui_cg_shadows", UI_Cvar_VariableString ( "cg_shadows" ) );
ADDRGP4 $2600
ARGP4
ADDRLP4 56
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2601
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4139
;4139:	trap_Cvar_Set ( "ui_r_modified", "0" );
ADDRGP4 $2568
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4140
;4140:}
LABELV $2603
endproc UI_GetVideoSetup 60 16
proc UI_RunMenuScript 1300 24
line 4143
;4141:
;4142:static void UI_RunMenuScript(char **args) 
;4143:{
line 4147
;4144:	const char *name, *name2;
;4145:	char buff[1024];
;4146:
;4147:	if (String_Parse(args, &name)) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1032
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $2606
line 4148
;4148:	{
line 4149
;4149:		if (Q_stricmp(name, "StartServer") == 0) 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2610
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $2608
line 4150
;4150:		{
line 4151
;4151:			int i, added = 0;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 4153
;4152:			float skill;
;4153:			int warmupTime = 0;
ADDRLP4 1048
CNSTI4 0
ASGNI4
line 4154
;4154:			int doWarmup = 0;
ADDRLP4 1056
CNSTI4 0
ASGNI4
line 4156
;4155:
;4156:			trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $352
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4157
;4157:			trap_Cvar_Set("cg_cameraOrbit", "0");
ADDRGP4 $350
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4158
;4158:			trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $2387
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4159
;4159:			trap_Cvar_SetValue( "dedicated", Com_Clamp( 0, 2, ui_dedicated.integer ) );
CNSTF4 0
ARGF4
CNSTF4 1073741824
ARGF4
ADDRGP4 ui_dedicated+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1060
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $2611
ARGP4
ADDRLP4 1060
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4160
;4160:			trap_Cvar_SetValue( "g_gametype", Com_Clamp( 0, 8, uiInfo.gameTypes[ui_netGameType.integer].gtEnum ) );
CNSTF4 0
ARGF4
CNSTF4 1090519040
ARGF4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1064
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $883
ARGP4
ADDRLP4 1064
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 4161
;4161:			trap_Cvar_Set("g_redTeam", UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 1068
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2403
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4162
;4162:			trap_Cvar_Set("g_blueTeam", UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1226
ARGP4
ADDRLP4 1072
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2404
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4163
;4163:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", uiInfo.mapList[ui_currentNetMap.integer].mapLoadName ) );
ADDRGP4 $2380
ARGP4
CNSTI4 100
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4164
;4164:			skill = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $826
ARGP4
ADDRLP4 1080
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1052
ADDRLP4 1080
INDIRF4
ASGNF4
line 4167
;4165:
;4166:			//Cap the warmup values in case the user tries a dumb setting.
;4167:			warmupTime = trap_Cvar_VariableValue( "g_warmup" );
ADDRGP4 $2399
ARGP4
ADDRLP4 1084
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1048
ADDRLP4 1084
INDIRF4
CVFI4 4
ASGNI4
line 4168
;4168:			doWarmup = trap_Cvar_VariableValue( "g_doWarmup" );
ADDRGP4 $2394
ARGP4
ADDRLP4 1088
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1056
ADDRLP4 1088
INDIRF4
CVFI4 4
ASGNI4
line 4170
;4169:
;4170:			if (doWarmup && warmupTime < 1)
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $2619
ADDRLP4 1048
INDIRI4
CNSTI4 1
GEI4 $2619
line 4171
;4171:			{
line 4172
;4172:				trap_Cvar_Set("g_doWarmup", "0");
ADDRGP4 $2394
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4173
;4173:			}
LABELV $2619
line 4174
;4174:			if (warmupTime < 5)
ADDRLP4 1048
INDIRI4
CNSTI4 5
GEI4 $2621
line 4175
;4175:			{
line 4176
;4176:				trap_Cvar_Set("g_warmup", "5");
ADDRGP4 $2399
ARGP4
ADDRGP4 $693
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4177
;4177:			}
LABELV $2621
line 4178
;4178:			if (warmupTime > 120)
ADDRLP4 1048
INDIRI4
CNSTI4 120
LEI4 $2623
line 4179
;4179:			{
line 4180
;4180:				trap_Cvar_Set("g_warmup", "120");
ADDRGP4 $2399
ARGP4
ADDRGP4 $2625
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4181
;4181:			}
LABELV $2623
line 4183
;4182:
;4183:			if (trap_Cvar_VariableValue( "g_gametype" ) == GT_TOURNAMENT)
ADDRGP4 $883
ARGP4
ADDRLP4 1092
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1092
INDIRF4
CNSTF4 1077936128
NEF4 $2626
line 4184
;4184:			{ //always set fraglimit 1 when starting a duel game
line 4185
;4185:				trap_Cvar_Set("fraglimit", "1");
ADDRGP4 $705
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4186
;4186:			}
LABELV $2626
line 4188
;4187:
;4188:			for (i = 0; i < PLAYERS_PER_TEAM; i++) 
ADDRLP4 1040
CNSTI4 0
ASGNI4
LABELV $2628
line 4189
;4189:			{
line 4190
;4190:				int bot = trap_Cvar_VariableValue( va("ui_blueteam%i", i+1));
ADDRGP4 $942
ARGP4
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 1108
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1096
ADDRLP4 1108
INDIRF4
CVFI4 4
ASGNI4
line 4191
;4191:				int maxcl = trap_Cvar_VariableValue( "sv_maxClients" );
ADDRGP4 $947
ARGP4
ADDRLP4 1112
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1100
ADDRLP4 1112
INDIRF4
CVFI4 4
ASGNI4
line 4193
;4192:
;4193:				if (bot > 1) 
ADDRLP4 1096
INDIRI4
CNSTI4 1
LEI4 $2632
line 4194
;4194:				{
line 4195
;4195:					int numval = i+1;
ADDRLP4 1116
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4197
;4196:
;4197:					numval *= 2;
ADDRLP4 1116
ADDRLP4 1116
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 4199
;4198:
;4199:					numval -= 1;
ADDRLP4 1116
ADDRLP4 1116
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4201
;4200:
;4201:					if (numval <= maxcl)
ADDRLP4 1116
INDIRI4
ADDRLP4 1100
INDIRI4
GTI4 $2634
line 4202
;4202:					{
line 4203
;4203:						if (ui_actualNetGameType.integer >= GT_TEAM) {
ADDRGP4 ui_actualNetGameType+12
INDIRI4
CNSTI4 5
LTI4 $2636
line 4204
;4204:							Com_sprintf( buff, sizeof(buff), "addbot %s %f %s\n", UI_GetBotNameByNumber(bot-2), skill, "Blue");
ADDRLP4 1096
INDIRI4
CNSTI4 2
SUBI4
ARGI4
ADDRLP4 1120
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2639
ARGP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRLP4 1052
INDIRF4
ARGF4
ADDRGP4 $935
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4205
;4205:						} else {
ADDRGP4 $2637
JUMPV
LABELV $2636
line 4206
;4206:							Com_sprintf( buff, sizeof(buff), "addbot %s %f \n", UI_GetBotNameByNumber(bot-2), skill);
ADDRLP4 1096
INDIRI4
CNSTI4 2
SUBI4
ARGI4
ADDRLP4 1120
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2640
ARGP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRLP4 1052
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 4207
;4207:						}
LABELV $2637
line 4208
;4208:						trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4209
;4209:						added++;
ADDRLP4 1044
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4210
;4210:					}
LABELV $2634
line 4211
;4211:				}
LABELV $2632
line 4212
;4212:				bot = trap_Cvar_VariableValue( va("ui_redteam%i", i+1));
ADDRGP4 $943
ARGP4
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1116
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRLP4 1120
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1096
ADDRLP4 1120
INDIRF4
CVFI4 4
ASGNI4
line 4213
;4213:				if (bot > 1) {
ADDRLP4 1096
INDIRI4
CNSTI4 1
LEI4 $2641
line 4214
;4214:					int numval = i+1;
ADDRLP4 1124
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4216
;4215:
;4216:					numval *= 2;
ADDRLP4 1124
ADDRLP4 1124
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 4218
;4217:
;4218:					if (numval <= maxcl)
ADDRLP4 1124
INDIRI4
ADDRLP4 1100
INDIRI4
GTI4 $2643
line 4219
;4219:					{
line 4220
;4220:						if (ui_actualNetGameType.integer >= GT_TEAM) {
ADDRGP4 ui_actualNetGameType+12
INDIRI4
CNSTI4 5
LTI4 $2645
line 4221
;4221:							Com_sprintf( buff, sizeof(buff), "addbot %s %f %s\n", UI_GetBotNameByNumber(bot-2), skill, "Red");
ADDRLP4 1096
INDIRI4
CNSTI4 2
SUBI4
ARGI4
ADDRLP4 1128
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2639
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1052
INDIRF4
ARGF4
ADDRGP4 $936
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4222
;4222:						} else {
ADDRGP4 $2646
JUMPV
LABELV $2645
line 4223
;4223:							Com_sprintf( buff, sizeof(buff), "addbot %s %f \n", UI_GetBotNameByNumber(bot-2), skill);
ADDRLP4 1096
INDIRI4
CNSTI4 2
SUBI4
ARGI4
ADDRLP4 1128
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2640
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1052
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 4224
;4224:						}
LABELV $2646
line 4225
;4225:						trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4226
;4226:						added++;
ADDRLP4 1044
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4227
;4227:					}
LABELV $2643
line 4228
;4228:				}
LABELV $2641
line 4229
;4229:				if (added >= maxcl)
ADDRLP4 1044
INDIRI4
ADDRLP4 1100
INDIRI4
LTI4 $2648
line 4230
;4230:				{ //this means the client filled up all their slots in the UI with bots. So stretch out an extra slot for them, and then stop adding bots.
line 4231
;4231:					trap_Cvar_Set("sv_maxClients", va("%i", added+1));
ADDRGP4 $1406
ARGP4
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1124
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $947
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4232
;4232:					break;
ADDRGP4 $2609
JUMPV
LABELV $2648
line 4234
;4233:				}
;4234:			}
LABELV $2629
line 4188
ADDRLP4 1040
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 8
LTI4 $2628
line 4235
;4235:		} else if (Q_stricmp(name, "updateSPMenu") == 0) {
ADDRGP4 $2609
JUMPV
LABELV $2608
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2652
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $2650
line 4236
;4236:			UI_SetCapFragLimits(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_SetCapFragLimits
CALLV
pop
line 4237
;4237:			UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 4238
;4238:			ui_mapIndex.integer = UI_GetIndexFromSelection(ui_currentMap.integer);
ADDRGP4 ui_currentMap+12
INDIRI4
ARGI4
ADDRLP4 1044
ADDRGP4 UI_GetIndexFromSelection
CALLI4
ASGNI4
ADDRGP4 ui_mapIndex+12
ADDRLP4 1044
INDIRI4
ASGNI4
line 4239
;4239:			trap_Cvar_Set("ui_mapIndex", va("%d", ui_mapIndex.integer));
ADDRGP4 $702
ARGP4
ADDRGP4 ui_mapIndex+12
INDIRI4
ARGI4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2374
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4240
;4240:			Menu_SetFeederSelection(NULL, FEEDER_MAPS, ui_mapIndex.integer, "skirmish");
CNSTP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ui_mapIndex+12
INDIRI4
ARGI4
ADDRGP4 $2370
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4241
;4241:			UI_GameType_HandleKey(0, 0, A_MOUSE1, qfalse);
ADDRLP4 1052
CNSTI4 0
ASGNI4
ADDRLP4 1052
INDIRI4
ARGI4
CNSTP4 0
ARGP4
CNSTI4 141
ARGI4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRGP4 UI_GameType_HandleKey
CALLI4
pop
line 4242
;4242:			UI_GameType_HandleKey(0, 0, A_MOUSE2, qfalse);
ADDRLP4 1056
CNSTI4 0
ASGNI4
ADDRLP4 1056
INDIRI4
ARGI4
CNSTP4 0
ARGP4
CNSTI4 142
ARGI4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRGP4 UI_GameType_HandleKey
CALLI4
pop
line 4243
;4243:		} else if (Q_stricmp(name, "resetDefaults") == 0) {
ADDRGP4 $2651
JUMPV
LABELV $2650
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2659
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $2657
line 4244
;4244:			trap_Cmd_ExecuteText( EXEC_APPEND, "cvar_restart\n");
CNSTI4 2
ARGI4
ADDRGP4 $2660
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4245
;4245:			trap_Cmd_ExecuteText( EXEC_APPEND, "exec mpdefault.cfg\n");
CNSTI4 2
ARGI4
ADDRGP4 $2661
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4246
;4246:			trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2662
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4247
;4247:			trap_Cvar_Set("com_introPlayed", "1" );
ADDRGP4 $2663
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4281
;4248:#ifdef USE_CD_KEY
;4249:		} else if (Q_stricmp(name, "getCDKey") == 0) {
;4250:			char out[17];
;4251:			trap_GetCDKey(buff, 17);
;4252:			trap_Cvar_Set("cdkey1", "");
;4253:			trap_Cvar_Set("cdkey2", "");
;4254:			trap_Cvar_Set("cdkey3", "");
;4255:			trap_Cvar_Set("cdkey4", "");
;4256:			if (strlen(buff) == CDKEY_LEN) {
;4257:				Q_strncpyz(out, buff, 5);
;4258:				trap_Cvar_Set("cdkey1", out);
;4259:				Q_strncpyz(out, buff + 4, 5);
;4260:				trap_Cvar_Set("cdkey2", out);
;4261:				Q_strncpyz(out, buff + 8, 5);
;4262:				trap_Cvar_Set("cdkey3", out);
;4263:				Q_strncpyz(out, buff + 12, 5);
;4264:				trap_Cvar_Set("cdkey4", out);
;4265:			}
;4266:
;4267:		} else if (Q_stricmp(name, "verifyCDKey") == 0) {
;4268:			buff[0] = '\0';
;4269:			Q_strcat(buff, 1024, UI_Cvar_VariableString("cdkey1")); 
;4270:			Q_strcat(buff, 1024, UI_Cvar_VariableString("cdkey2")); 
;4271:			Q_strcat(buff, 1024, UI_Cvar_VariableString("cdkey3")); 
;4272:			Q_strcat(buff, 1024, UI_Cvar_VariableString("cdkey4")); 
;4273:			trap_Cvar_Set("cdkey", buff);
;4274:			if (trap_VerifyCDKey(buff, UI_Cvar_VariableString("cdkeychecksum"))) {
;4275:				trap_Cvar_Set("ui_cdkeyvalid", "CD Key Appears to be valid.");
;4276:				trap_SetCDKey(buff);
;4277:			} else {
;4278:				trap_Cvar_Set("ui_cdkeyvalid", "CD Key does not appear to be valid.");
;4279:			}
;4280:#endif // USE_CD_KEY
;4281:		} else if (Q_stricmp(name, "loadArenas") == 0) {
ADDRGP4 $2658
JUMPV
LABELV $2657
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2666
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $2664
line 4282
;4282:			UI_LoadArenas();
ADDRGP4 UI_LoadArenas
CALLV
pop
line 4283
;4283:			UI_MapCountByGameType(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 4284
;4284:			Menu_SetFeederSelection(NULL, FEEDER_ALLMAPS, gUISelectedMap, "createserver");
CNSTP4 0
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 gUISelectedMap
INDIRI4
ARGI4
ADDRGP4 $2667
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4285
;4285:			uiForceRank = trap_Cvar_VariableValue("g_maxForceRank");
ADDRGP4 $2668
ARGP4
ADDRLP4 1052
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 uiForceRank
ADDRLP4 1052
INDIRF4
CVFI4 4
ASGNI4
line 4286
;4286:		} else if (Q_stricmp(name, "saveControls") == 0) {
ADDRGP4 $2665
JUMPV
LABELV $2664
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2671
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $2669
line 4287
;4287:			Controls_SetConfig(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 Controls_SetConfig
CALLV
pop
line 4288
;4288:		} else if (Q_stricmp(name, "loadControls") == 0) {
ADDRGP4 $2670
JUMPV
LABELV $2669
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2674
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $2672
line 4289
;4289:			Controls_GetConfig();
ADDRGP4 Controls_GetConfig
CALLV
pop
line 4290
;4290:		} else if (Q_stricmp(name, "clearError") == 0) {
ADDRGP4 $2673
JUMPV
LABELV $2672
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2677
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $2675
line 4291
;4291:			trap_Cvar_Set("com_errorMessage", "");
ADDRGP4 $2678
ARGP4
ADDRGP4 $165
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4292
;4292:		} else if (Q_stricmp(name, "loadGameInfo") == 0) {
ADDRGP4 $2676
JUMPV
LABELV $2675
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2681
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $2679
line 4296
;4293:#ifdef PRE_RELEASE_TADEMO
;4294:			UI_ParseGameInfo("demogameinfo.txt");
;4295:#else
;4296:			UI_ParseGameInfo("ui/jk2mp/gameinfo.txt");
ADDRGP4 $673
ARGP4
ADDRGP4 UI_ParseGameInfo
CALLV
pop
line 4298
;4297:#endif
;4298:			UI_LoadBestScores(uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 4299
;4299:		} else if (Q_stricmp(name, "resetScores") == 0) {
ADDRGP4 $2680
JUMPV
LABELV $2679
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2690
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $2688
line 4300
;4300:			UI_ClearScores();
ADDRGP4 UI_ClearScores
CALLV
pop
line 4301
;4301:		} else if (Q_stricmp(name, "RefreshServers") == 0) {
ADDRGP4 $2689
JUMPV
LABELV $2688
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2693
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $2691
line 4302
;4302:			UI_StartServerRefresh(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 4303
;4303:			UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 4304
;4304:		} else if (Q_stricmp(name, "RefreshFilter") == 0) {
ADDRGP4 $2692
JUMPV
LABELV $2691
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2696
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $2694
line 4305
;4305:			UI_StartServerRefresh(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 4306
;4306:			UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 4307
;4307:		} else if (Q_stricmp(name, "RunSPDemo") == 0) {
ADDRGP4 $2695
JUMPV
LABELV $2694
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2699
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $2697
line 4308
;4308:			if (uiInfo.demoAvailable) {
ADDRGP4 uiInfo+11832
INDIRI4
CNSTI4 0
EQI4 $2698
line 4309
;4309:			  trap_Cmd_ExecuteText( EXEC_APPEND, va("demo %s_%i\n", uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum));
ADDRGP4 $2703
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1084
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4310
;4310:			}
line 4311
;4311:		} else if (Q_stricmp(name, "LoadDemos") == 0) {
ADDRGP4 $2698
JUMPV
LABELV $2697
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2712
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $2710
line 4312
;4312:			UI_LoadDemos();
ADDRGP4 UI_LoadDemos
CALLV
pop
line 4313
;4313:		} else if (Q_stricmp(name, "LoadMovies") == 0) {
ADDRGP4 $2711
JUMPV
LABELV $2710
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2715
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $2713
line 4314
;4314:			UI_LoadMovies();
ADDRGP4 UI_LoadMovies
CALLV
pop
line 4315
;4315:		} else if (Q_stricmp(name, "LoadMods") == 0) {
ADDRGP4 $2714
JUMPV
LABELV $2713
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2718
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $2716
line 4316
;4316:			UI_LoadMods();
ADDRGP4 UI_LoadMods
CALLV
pop
line 4317
;4317:		} else if (Q_stricmp(name, "playMovie") == 0) {
ADDRGP4 $2717
JUMPV
LABELV $2716
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2721
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $2719
line 4318
;4318:			if (uiInfo.previewMovie >= 0) {
ADDRGP4 uiInfo+36380
INDIRI4
CNSTI4 0
LTI4 $2722
line 4319
;4319:			  trap_CIN_StopCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+36380
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 4320
;4320:			}
LABELV $2722
line 4321
;4321:			trap_Cmd_ExecuteText( EXEC_APPEND, va("cinematic %s.roq 2\n", uiInfo.movieList[uiInfo.movieIndex]));
ADDRGP4 $2726
ARGP4
ADDRGP4 uiInfo+36376
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+35348
ADDP4
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4322
;4322:		} else if (Q_stricmp(name, "RunMod") == 0) {
ADDRGP4 $2720
JUMPV
LABELV $2719
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2731
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $2729
line 4323
;4323:			trap_Cvar_Set( "fs_game", uiInfo.modList[uiInfo.modIndex].modName);
ADDRGP4 $2732
ARGP4
ADDRGP4 uiInfo+34312
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+33796
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4324
;4324:			trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $2602
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4325
;4325:		} else if (Q_stricmp(name, "RunDemo") == 0) {
ADDRGP4 $2730
JUMPV
LABELV $2729
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2737
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $2735
line 4326
;4326:			trap_Cmd_ExecuteText( EXEC_APPEND, va("demo \"%s\"\n", uiInfo.demoList[uiInfo.demoIndex]));
ADDRGP4 $2738
ARGP4
ADDRGP4 uiInfo+35344
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+34316
ADDP4
INDIRP4
ARGP4
ADDRLP4 1108
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4327
;4327:		} else if (Q_stricmp(name, "Quake3") == 0) {
ADDRGP4 $2736
JUMPV
LABELV $2735
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2743
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $2741
line 4328
;4328:			trap_Cvar_Set( "fs_game", "");
ADDRGP4 $2732
ARGP4
ADDRGP4 $165
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4329
;4329:			trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $2602
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4330
;4330:		} else if (Q_stricmp(name, "closeJoin") == 0) {
ADDRGP4 $2742
JUMPV
LABELV $2741
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2746
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $2744
line 4331
;4331:			if (uiInfo.serverStatus.refreshActive) {
ADDRGP4 uiInfo+40740+2212
INDIRI4
CNSTI4 0
EQI4 $2747
line 4332
;4332:				UI_StopServerRefresh();
ADDRGP4 UI_StopServerRefresh
CALLV
pop
line 4333
;4333:				uiInfo.serverStatus.nextDisplayRefresh = 0;
ADDRGP4 uiInfo+40740+10420
CNSTI4 0
ASGNI4
line 4334
;4334:				uiInfo.nextServerStatusRefresh = 0;
ADDRGP4 uiInfo+55524
CNSTI4 0
ASGNI4
line 4335
;4335:				uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+60852
CNSTI4 0
ASGNI4
line 4336
;4336:				UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 4337
;4337:			} else {
ADDRGP4 $2745
JUMPV
LABELV $2747
line 4338
;4338:				Menus_CloseByName("joinserver");
ADDRGP4 $2755
ARGP4
ADDRGP4 Menus_CloseByName
CALLV
pop
line 4339
;4339:				Menus_OpenByName("main");
ADDRGP4 $2756
ARGP4
ADDRGP4 Menus_OpenByName
CALLV
pop
line 4340
;4340:			}
line 4341
;4341:		} else if (Q_stricmp(name, "StopRefresh") == 0) {
ADDRGP4 $2745
JUMPV
LABELV $2744
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2759
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $2757
line 4342
;4342:			UI_StopServerRefresh();
ADDRGP4 UI_StopServerRefresh
CALLV
pop
line 4343
;4343:			uiInfo.serverStatus.nextDisplayRefresh = 0;
ADDRGP4 uiInfo+40740+10420
CNSTI4 0
ASGNI4
line 4344
;4344:			uiInfo.nextServerStatusRefresh = 0;
ADDRGP4 uiInfo+55524
CNSTI4 0
ASGNI4
line 4345
;4345:			uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+60852
CNSTI4 0
ASGNI4
line 4346
;4346:		} else if (Q_stricmp(name, "UpdateFilter") == 0) {
ADDRGP4 $2758
JUMPV
LABELV $2757
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2766
ARGP4
ADDRLP4 1120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $2764
line 4347
;4347:			if (ui_netSource.integer == AS_LOCAL) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $2767
line 4348
;4348:				UI_StartServerRefresh(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 4349
;4349:			}
LABELV $2767
line 4350
;4350:			UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 4351
;4351:			UI_FeederSelection(FEEDER_SERVERS, 0);
CNSTF4 1073741824
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 UI_FeederSelection
CALLI4
pop
line 4352
;4352:		} else if (Q_stricmp(name, "ServerStatus") == 0) {
ADDRGP4 $2765
JUMPV
LABELV $2764
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2772
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $2770
line 4353
;4353:			trap_LAN_GetServerAddressString(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], uiInfo.serverStatusAddress, sizeof(uiInfo.serverStatusAddress));
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+40740+2216
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
INDIRI4
ARGI4
ADDRGP4 uiInfo+52224
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 4354
;4354:			UI_BuildServerStatus(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 4355
;4355:		} else if (Q_stricmp(name, "FoundPlayerServerStatus") == 0) {
ADDRGP4 $2771
JUMPV
LABELV $2770
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2782
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $2780
line 4356
;4356:			Q_strncpyz(uiInfo.serverStatusAddress, uiInfo.foundPlayerServerAddresses[uiInfo.currentFoundPlayerServer], sizeof(uiInfo.serverStatusAddress));
ADDRGP4 uiInfo+52224
ARGP4
ADDRGP4 uiInfo+60844
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+58796
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4357
;4357:			UI_BuildServerStatus(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 4358
;4358:			Menu_SetFeederSelection(NULL, FEEDER_FINDPLAYER, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 14
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4359
;4359:		} else if (Q_stricmp(name, "FindPlayer") == 0) {
ADDRGP4 $2781
JUMPV
LABELV $2780
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2789
ARGP4
ADDRLP4 1132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $2787
line 4360
;4360:			UI_BuildFindPlayerList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildFindPlayerList
CALLV
pop
line 4362
;4361:			// clear the displayed server status info
;4362:			uiInfo.serverStatusInfo.numLines = 0;
ADDRGP4 uiInfo+52288+3232
CNSTI4 0
ASGNI4
line 4363
;4363:			Menu_SetFeederSelection(NULL, FEEDER_FINDPLAYER, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 14
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4364
;4364:		} else if (Q_stricmp(name, "JoinServer") == 0) {
ADDRGP4 $2788
JUMPV
LABELV $2787
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2794
ARGP4
ADDRLP4 1136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $2792
line 4365
;4365:			trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $352
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4366
;4366:			trap_Cvar_Set("cg_cameraOrbit", "0");
ADDRGP4 $350
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4367
;4367:			trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $2387
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4368
;4368:			if (uiInfo.serverStatus.currentServer >= 0 && uiInfo.serverStatus.currentServer < uiInfo.serverStatus.numDisplayServers) {
ADDRGP4 uiInfo+40740+2216
INDIRI4
CNSTI4 0
LTI4 $2793
ADDRGP4 uiInfo+40740+2216
INDIRI4
ADDRGP4 uiInfo+40740+10412
INDIRI4
GEI4 $2793
line 4369
;4369:				trap_LAN_GetServerAddressString(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], buff, 1024);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+40740+2216
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 4370
;4370:				trap_Cmd_ExecuteText( EXEC_APPEND, va( "connect %s\n", buff ) );
ADDRGP4 $2808
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1140
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4371
;4371:			}
line 4372
;4372:		} else if (Q_stricmp(name, "FoundPlayerJoinServer") == 0) {
ADDRGP4 $2793
JUMPV
LABELV $2792
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2811
ARGP4
ADDRLP4 1140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $2809
line 4373
;4373:			trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $2387
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4374
;4374:			if (uiInfo.currentFoundPlayerServer >= 0 && uiInfo.currentFoundPlayerServer < uiInfo.numFoundPlayerServers) {
ADDRGP4 uiInfo+60844
INDIRI4
CNSTI4 0
LTI4 $2810
ADDRGP4 uiInfo+60844
INDIRI4
ADDRGP4 uiInfo+60848
INDIRI4
GEI4 $2810
line 4375
;4375:				trap_Cmd_ExecuteText( EXEC_APPEND, va( "connect %s\n", uiInfo.foundPlayerServerAddresses[uiInfo.currentFoundPlayerServer] ) );
ADDRGP4 $2808
ARGP4
ADDRGP4 uiInfo+60844
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+58796
ADDP4
ARGP4
ADDRLP4 1144
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4376
;4376:			}
line 4377
;4377:		} else if (Q_stricmp(name, "Quit") == 0) {
ADDRGP4 $2810
JUMPV
LABELV $2809
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2821
ARGP4
ADDRLP4 1144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1144
INDIRI4
CNSTI4 0
NEI4 $2819
line 4378
;4378:			trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $2387
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4379
;4379:			trap_Cmd_ExecuteText( EXEC_NOW, "quit");
CNSTI4 0
ARGI4
ADDRGP4 $2822
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4380
;4380:		} else if (Q_stricmp(name, "Controls") == 0) {
ADDRGP4 $2820
JUMPV
LABELV $2819
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2825
ARGP4
ADDRLP4 1148
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
NEI4 $2823
line 4381
;4381:		  trap_Cvar_Set( "cl_paused", "1" );
ADDRGP4 $2826
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4382
;4382:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4383
;4383:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 4384
;4384:			Menus_ActivateByName("setup_menu2");
ADDRGP4 $2827
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 4385
;4385:		} 
ADDRGP4 $2824
JUMPV
LABELV $2823
line 4386
;4386:		else if (Q_stricmp(name, "Leave") == 0) 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2830
ARGP4
ADDRLP4 1152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $2828
line 4387
;4387:		{
line 4388
;4388:			trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2831
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4389
;4389:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4390
;4390:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 4391
;4391:			Menus_ActivateByName("main");
ADDRGP4 $2756
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 4392
;4392:		} 
ADDRGP4 $2829
JUMPV
LABELV $2828
line 4393
;4393:		else if (Q_stricmp(name, "getvideosetup") == 0) 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2834
ARGP4
ADDRLP4 1156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $2832
line 4394
;4394:		{
line 4395
;4395:			UI_GetVideoSetup ( );
ADDRGP4 UI_GetVideoSetup
CALLV
pop
line 4396
;4396:		}
ADDRGP4 $2833
JUMPV
LABELV $2832
line 4397
;4397:		else if (Q_stricmp(name, "updatevideosetup") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2837
ARGP4
ADDRLP4 1160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
NEI4 $2835
line 4398
;4398:		{
line 4399
;4399:			UI_UpdateVideoSetup ( );
ADDRGP4 UI_UpdateVideoSetup
CALLV
pop
line 4400
;4400:		}
ADDRGP4 $2836
JUMPV
LABELV $2835
line 4401
;4401:		else if (Q_stricmp(name, "ServerSort") == 0) 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2840
ARGP4
ADDRLP4 1164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
NEI4 $2838
line 4402
;4402:		{
line 4404
;4403:			int sortColumn;
;4404:			if (Int_Parse(args, &sortColumn)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1168
ARGP4
ADDRLP4 1172
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 1172
INDIRI4
CNSTI4 0
EQI4 $2839
line 4406
;4405:				// if same column we're already sorting on then flip the direction
;4406:				if (sortColumn == uiInfo.serverStatus.sortKey) {
ADDRLP4 1168
INDIRI4
ADDRGP4 uiInfo+40740+2200
INDIRI4
NEI4 $2843
line 4407
;4407:					uiInfo.serverStatus.sortDir = !uiInfo.serverStatus.sortDir;
ADDRGP4 uiInfo+40740+2204
INDIRI4
CNSTI4 0
NEI4 $2852
ADDRLP4 1176
CNSTI4 1
ASGNI4
ADDRGP4 $2853
JUMPV
LABELV $2852
ADDRLP4 1176
CNSTI4 0
ASGNI4
LABELV $2853
ADDRGP4 uiInfo+40740+2204
ADDRLP4 1176
INDIRI4
ASGNI4
line 4408
;4408:				}
LABELV $2843
line 4410
;4409:				// make sure we sort again
;4410:				UI_ServersSort(sortColumn, qtrue);
ADDRLP4 1168
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 UI_ServersSort
CALLV
pop
line 4411
;4411:			}
line 4412
;4412:		} else if (Q_stricmp(name, "nextSkirmish") == 0) {
ADDRGP4 $2839
JUMPV
LABELV $2838
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2856
ARGP4
ADDRLP4 1168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1168
INDIRI4
CNSTI4 0
NEI4 $2854
line 4413
;4413:			UI_StartSkirmish(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartSkirmish
CALLV
pop
line 4414
;4414:		} else if (Q_stricmp(name, "SkirmishStart") == 0) {
ADDRGP4 $2855
JUMPV
LABELV $2854
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2859
ARGP4
ADDRLP4 1172
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1172
INDIRI4
CNSTI4 0
NEI4 $2857
line 4415
;4415:			UI_StartSkirmish(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_StartSkirmish
CALLV
pop
line 4416
;4416:		} else if (Q_stricmp(name, "closeingame") == 0) {
ADDRGP4 $2858
JUMPV
LABELV $2857
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2862
ARGP4
ADDRLP4 1176
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 0
NEI4 $2860
line 4417
;4417:			trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 1180
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4418
;4418:			trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 4419
;4419:			trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2826
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4420
;4420:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 4421
;4421:		} else if (Q_stricmp(name, "voteMap") == 0) {
ADDRGP4 $2861
JUMPV
LABELV $2860
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2865
ARGP4
ADDRLP4 1180
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 0
NEI4 $2863
line 4422
;4422:			if (ui_currentNetMap.integer >=0 && ui_currentNetMap.integer < uiInfo.mapCount) {
ADDRGP4 ui_currentNetMap+12
INDIRI4
CNSTI4 0
LTI4 $2864
ADDRGP4 ui_currentNetMap+12
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
GEI4 $2864
line 4423
;4423:				trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote map %s\n",uiInfo.mapList[ui_currentNetMap.integer].mapLoadName) );
ADDRGP4 $2871
ARGP4
CNSTI4 100
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1184
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4424
;4424:			}
line 4425
;4425:		} else if (Q_stricmp(name, "voteKick") == 0) {
ADDRGP4 $2864
JUMPV
LABELV $2863
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2877
ARGP4
ADDRLP4 1184
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1184
INDIRI4
CNSTI4 0
NEI4 $2875
line 4426
;4426:			if (uiInfo.playerIndex >= 0 && uiInfo.playerIndex < uiInfo.playerCount) {
ADDRGP4 uiInfo+18028
INDIRI4
CNSTI4 0
LTI4 $2876
ADDRGP4 uiInfo+18028
INDIRI4
ADDRGP4 uiInfo+18012
INDIRI4
GEI4 $2876
line 4428
;4427:				//trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote kick \"%s\"\n",uiInfo.playerNames[uiInfo.playerIndex]) );
;4428:				trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote clientkick \"%i\"\n",uiInfo.playerIndexes[uiInfo.playerIndex]) );
ADDRGP4 $2883
ARGP4
ADDRGP4 uiInfo+18028
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+20216
ADDP4
INDIRI4
ARGI4
ADDRLP4 1188
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1188
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4429
;4429:			}
line 4430
;4430:		} else if (Q_stricmp(name, "voteGame") == 0) {
ADDRGP4 $2876
JUMPV
LABELV $2875
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2888
ARGP4
ADDRLP4 1188
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1188
INDIRI4
CNSTI4 0
NEI4 $2886
line 4431
;4431:			if (ui_netGameType.integer >= 0 && ui_netGameType.integer < uiInfo.numGameTypes) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 0
LTI4 $2887
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRGP4 uiInfo+17744
INDIRI4
GEI4 $2887
line 4432
;4432:				trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote g_gametype %i\n",uiInfo.gameTypes[ui_netGameType.integer].gtEnum) );
ADDRGP4 $2894
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1192
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4433
;4433:			}
line 4434
;4434:		} else if (Q_stricmp(name, "voteLeader") == 0) {
ADDRGP4 $2887
JUMPV
LABELV $2886
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2900
ARGP4
ADDRLP4 1192
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1192
INDIRI4
CNSTI4 0
NEI4 $2898
line 4435
;4435:			if (uiInfo.teamIndex >= 0 && uiInfo.teamIndex < uiInfo.myTeamCount) {
ADDRGP4 uiInfo+18020
INDIRI4
CNSTI4 0
LTI4 $2899
ADDRGP4 uiInfo+18020
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
GEI4 $2899
line 4436
;4436:				trap_Cmd_ExecuteText( EXEC_APPEND, va("callteamvote leader \"%s\"\n",uiInfo.teamNames[uiInfo.teamIndex]) );
ADDRGP4 $2906
ARGP4
ADDRGP4 uiInfo+18020
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+19064
ADDP4
ARGP4
ADDRLP4 1196
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4437
;4437:			}
line 4438
;4438:		} else if (Q_stricmp(name, "addBot") == 0) {
ADDRGP4 $2899
JUMPV
LABELV $2898
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2911
ARGP4
ADDRLP4 1196
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1196
INDIRI4
CNSTI4 0
NEI4 $2909
line 4439
;4439:			if (trap_Cvar_VariableValue("g_gametype") >= GT_TEAM) {
ADDRGP4 $883
ARGP4
ADDRLP4 1200
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1200
INDIRF4
CNSTF4 1084227584
LTF4 $2912
line 4440
;4440:				trap_Cmd_ExecuteText( EXEC_APPEND, va("addbot %s %i %s\n", UI_GetBotNameByNumber(uiInfo.botIndex), uiInfo.skillIndex+1, (uiInfo.redBlue == 0) ? "Red" : "Blue") );
ADDRGP4 uiInfo+11844
INDIRI4
ARGI4
ADDRLP4 1208
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRGP4 $2914
ARGP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRGP4 uiInfo+33792
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 uiInfo+18008
INDIRI4
CNSTI4 0
NEI4 $2919
ADDRLP4 1204
ADDRGP4 $936
ASGNP4
ADDRGP4 $2920
JUMPV
LABELV $2919
ADDRLP4 1204
ADDRGP4 $935
ASGNP4
LABELV $2920
ADDRLP4 1204
INDIRP4
ARGP4
ADDRLP4 1212
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4441
;4441:			} else {
ADDRGP4 $2910
JUMPV
LABELV $2912
line 4442
;4442:				trap_Cmd_ExecuteText( EXEC_APPEND, va("addbot %s %i %s\n", UI_GetBotNameByNumber(uiInfo.botIndex), uiInfo.skillIndex+1, (uiInfo.redBlue == 0) ? "Red" : "Blue") );
ADDRGP4 uiInfo+11844
INDIRI4
ARGI4
ADDRLP4 1208
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRGP4 $2914
ARGP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRGP4 uiInfo+33792
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 uiInfo+18008
INDIRI4
CNSTI4 0
NEI4 $2925
ADDRLP4 1204
ADDRGP4 $936
ASGNP4
ADDRGP4 $2926
JUMPV
LABELV $2925
ADDRLP4 1204
ADDRGP4 $935
ASGNP4
LABELV $2926
ADDRLP4 1204
INDIRP4
ARGP4
ADDRLP4 1212
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4443
;4443:			}
line 4444
;4444:		} else if (Q_stricmp(name, "addFavorite") == 0) 
ADDRGP4 $2910
JUMPV
LABELV $2909
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2929
ARGP4
ADDRLP4 1200
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1200
INDIRI4
CNSTI4 0
NEI4 $2927
line 4445
;4445:		{
line 4446
;4446:			if (ui_netSource.integer != AS_FAVORITES) 
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
EQI4 $2928
line 4447
;4447:			{
line 4452
;4448:				char name[MAX_NAME_LENGTH];
;4449:				char addr[MAX_NAME_LENGTH];
;4450:				int res;
;4451:
;4452:				trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], buff, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+40740+2216
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 4453
;4453:				name[0] = addr[0] = '\0';
ADDRLP4 1272
CNSTI1 0
ASGNI1
ADDRLP4 1204
ADDRLP4 1272
INDIRI1
ASGNI1
ADDRLP4 1236
ADDRLP4 1272
INDIRI1
ASGNI1
line 4454
;4454:				Q_strncpyz(name, 	Info_ValueForKey(buff, "hostname"), MAX_NAME_LENGTH);
ADDRLP4 0
ARGP4
ADDRGP4 $2938
ARGP4
ADDRLP4 1276
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1236
ARGP4
ADDRLP4 1276
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4455
;4455:				Q_strncpyz(addr, 	Info_ValueForKey(buff, "addr"), MAX_NAME_LENGTH);
ADDRLP4 0
ARGP4
ADDRGP4 $2939
ARGP4
ADDRLP4 1280
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1204
ARGP4
ADDRLP4 1280
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4456
;4456:				if (strlen(name) > 0 && strlen(addr) > 0) 
ADDRLP4 1236
ARGP4
ADDRLP4 1284
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1284
INDIRI4
CNSTI4 0
LEI4 $2928
ADDRLP4 1204
ARGP4
ADDRLP4 1288
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1288
INDIRI4
CNSTI4 0
LEI4 $2928
line 4457
;4457:				{
line 4458
;4458:					res = trap_LAN_AddServer(AS_FAVORITES, name, addr);
CNSTI4 2
ARGI4
ADDRLP4 1236
ARGP4
ADDRLP4 1204
ARGP4
ADDRLP4 1292
ADDRGP4 trap_LAN_AddServer
CALLI4
ASGNI4
ADDRLP4 1268
ADDRLP4 1292
INDIRI4
ASGNI4
line 4459
;4459:					if (res == 0) 
ADDRLP4 1268
INDIRI4
CNSTI4 0
NEI4 $2942
line 4460
;4460:					{
line 4462
;4461:						// server already in the list
;4462:						Com_Printf("Favorite already in list\n");
ADDRGP4 $2944
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4463
;4463:					}
ADDRGP4 $2928
JUMPV
LABELV $2942
line 4464
;4464:					else if (res == -1) 
ADDRLP4 1268
INDIRI4
CNSTI4 -1
NEI4 $2945
line 4465
;4465:					{
line 4467
;4466:						// list full
;4467:						Com_Printf("Favorite list full\n");
ADDRGP4 $2947
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4468
;4468:					}
ADDRGP4 $2928
JUMPV
LABELV $2945
line 4470
;4469:					else 
;4470:					{
line 4472
;4471:						// successfully added
;4472:						Com_Printf("Added favorite server %s\n", addr);
ADDRGP4 $2948
ARGP4
ADDRLP4 1204
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4478
;4473:
;4474:
;4475://						trap_SP_GetStringTextString((char *)va("%s_GETTINGINFOFORSERVERS",uiInfo.uiDC.Assets.stripedFile), holdSPString, sizeof(holdSPString));
;4476://						Text_Paint(rect->x, rect->y, scale, newColor, va((char *) holdSPString, trap_LAN_GetServerCount(ui_netSource.integer)), 0, 0, textStyle);
;4477:
;4478:					}
line 4479
;4479:				}
line 4480
;4480:			}
line 4481
;4481:		} 
ADDRGP4 $2928
JUMPV
LABELV $2927
line 4482
;4482:		else if (Q_stricmp(name, "deleteFavorite") == 0) 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2951
ARGP4
ADDRLP4 1204
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1204
INDIRI4
CNSTI4 0
NEI4 $2949
line 4483
;4483:		{
line 4484
;4484:			if (ui_netSource.integer == AS_FAVORITES) 
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
NEI4 $2950
line 4485
;4485:			{
line 4487
;4486:				char addr[MAX_NAME_LENGTH];
;4487:				trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], buff, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+40740+2216
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 4488
;4488:				addr[0] = '\0';
ADDRLP4 1208
CNSTI1 0
ASGNI1
line 4489
;4489:				Q_strncpyz(addr, 	Info_ValueForKey(buff, "addr"), MAX_NAME_LENGTH);
ADDRLP4 0
ARGP4
ADDRGP4 $2939
ARGP4
ADDRLP4 1240
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1208
ARGP4
ADDRLP4 1240
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4490
;4490:				if (strlen(addr) > 0) 
ADDRLP4 1208
ARGP4
ADDRLP4 1244
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1244
INDIRI4
CNSTI4 0
LEI4 $2950
line 4491
;4491:				{
line 4492
;4492:					trap_LAN_RemoveServer(AS_FAVORITES, addr);
CNSTI4 2
ARGI4
ADDRLP4 1208
ARGP4
ADDRGP4 trap_LAN_RemoveServer
CALLV
pop
line 4493
;4493:				}
line 4494
;4494:			}
line 4495
;4495:		} 
ADDRGP4 $2950
JUMPV
LABELV $2949
line 4496
;4496:		else if (Q_stricmp(name, "createFavorite") == 0) 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2964
ARGP4
ADDRLP4 1208
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1208
INDIRI4
CNSTI4 0
NEI4 $2962
line 4497
;4497:		{
line 4500
;4498:		//	if (ui_netSource.integer == AS_FAVORITES) 
;4499:		//rww - don't know why this check was here.. why would you want to only add new favorites when the filter was favorites?
;4500:			{
line 4505
;4501:				char name[MAX_NAME_LENGTH];
;4502:				char addr[MAX_NAME_LENGTH];
;4503:				int res;
;4504:
;4505:				name[0] = addr[0] = '\0';
ADDRLP4 1280
CNSTI1 0
ASGNI1
ADDRLP4 1212
ADDRLP4 1280
INDIRI1
ASGNI1
ADDRLP4 1244
ADDRLP4 1280
INDIRI1
ASGNI1
line 4506
;4506:				Q_strncpyz(name, 	UI_Cvar_VariableString("ui_favoriteName"), MAX_NAME_LENGTH);
ADDRGP4 $2965
ARGP4
ADDRLP4 1284
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1244
ARGP4
ADDRLP4 1284
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4507
;4507:				Q_strncpyz(addr, 	UI_Cvar_VariableString("ui_favoriteAddress"), MAX_NAME_LENGTH);
ADDRGP4 $2966
ARGP4
ADDRLP4 1288
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1212
ARGP4
ADDRLP4 1288
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4508
;4508:				if (/*strlen(name) > 0 &&*/ strlen(addr) > 0) {
ADDRLP4 1212
ARGP4
ADDRLP4 1292
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1292
INDIRI4
CNSTI4 0
LEI4 $2963
line 4509
;4509:					res = trap_LAN_AddServer(AS_FAVORITES, name, addr);
CNSTI4 2
ARGI4
ADDRLP4 1244
ARGP4
ADDRLP4 1212
ARGP4
ADDRLP4 1296
ADDRGP4 trap_LAN_AddServer
CALLI4
ASGNI4
ADDRLP4 1276
ADDRLP4 1296
INDIRI4
ASGNI4
line 4510
;4510:					if (res == 0) {
ADDRLP4 1276
INDIRI4
CNSTI4 0
NEI4 $2969
line 4512
;4511:						// server already in the list
;4512:						Com_Printf("Favorite already in list\n");
ADDRGP4 $2944
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4513
;4513:					}
ADDRGP4 $2963
JUMPV
LABELV $2969
line 4514
;4514:					else if (res == -1) {
ADDRLP4 1276
INDIRI4
CNSTI4 -1
NEI4 $2971
line 4516
;4515:						// list full
;4516:						Com_Printf("Favorite list full\n");
ADDRGP4 $2947
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4517
;4517:					}
ADDRGP4 $2963
JUMPV
LABELV $2971
line 4518
;4518:					else {
line 4520
;4519:						// successfully added
;4520:						Com_Printf("Added favorite server %s\n", addr);
ADDRGP4 $2948
ARGP4
ADDRLP4 1212
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4521
;4521:					}
line 4522
;4522:				}
line 4523
;4523:			}
line 4524
;4524:		} else if (Q_stricmp(name, "orders") == 0) {
ADDRGP4 $2963
JUMPV
LABELV $2962
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2975
ARGP4
ADDRLP4 1212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1212
INDIRI4
CNSTI4 0
NEI4 $2973
line 4526
;4525:			const char *orders;
;4526:			if (String_Parse(args, &orders)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1216
ARGP4
ADDRLP4 1220
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1220
INDIRI4
CNSTI4 0
EQI4 $2974
line 4527
;4527:				int selectedPlayer = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1545
ARGP4
ADDRLP4 1228
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1224
ADDRLP4 1228
INDIRF4
CVFI4 4
ASGNI4
line 4528
;4528:				if (selectedPlayer < uiInfo.myTeamCount) {
ADDRLP4 1224
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
GEI4 $2978
line 4529
;4529:					strcpy(buff, orders);
ADDRLP4 0
ARGP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 4530
;4530:					trap_Cmd_ExecuteText( EXEC_APPEND, va(buff, uiInfo.teamClientNums[selectedPlayer]) );
ADDRLP4 0
ARGP4
ADDRLP4 1224
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+20088
ADDP4
INDIRI4
ARGI4
ADDRLP4 1232
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1232
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4531
;4531:					trap_Cmd_ExecuteText( EXEC_APPEND, "\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2982
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4532
;4532:				} else {
ADDRGP4 $2979
JUMPV
LABELV $2978
line 4534
;4533:					int i;
;4534:					for (i = 0; i < uiInfo.myTeamCount; i++) {
ADDRLP4 1232
CNSTI4 0
ASGNI4
ADDRGP4 $2986
JUMPV
LABELV $2983
line 4535
;4535:						if (Q_stricmp(UI_Cvar_VariableString("name"), uiInfo.teamNames[i]) == 0) {
ADDRGP4 $2499
ARGP4
ADDRLP4 1236
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1236
INDIRP4
ARGP4
ADDRLP4 1232
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+19064
ADDP4
ARGP4
ADDRLP4 1240
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1240
INDIRI4
CNSTI4 0
NEI4 $2988
line 4536
;4536:							continue;
ADDRGP4 $2984
JUMPV
LABELV $2988
line 4538
;4537:						}
;4538:						strcpy(buff, orders);
ADDRLP4 0
ARGP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 4539
;4539:						trap_Cmd_ExecuteText( EXEC_APPEND, va(buff, uiInfo.teamNames[i]) );
ADDRLP4 0
ARGP4
ADDRLP4 1232
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+19064
ADDP4
ARGP4
ADDRLP4 1244
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1244
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4540
;4540:						trap_Cmd_ExecuteText( EXEC_APPEND, "\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2982
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4541
;4541:					}
LABELV $2984
line 4534
ADDRLP4 1232
ADDRLP4 1232
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2986
ADDRLP4 1232
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
LTI4 $2983
line 4542
;4542:				}
LABELV $2979
line 4543
;4543:				trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 1232
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4544
;4544:				trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 4545
;4545:				trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2826
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4546
;4546:				Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 4547
;4547:			}
line 4548
;4548:		} else if (Q_stricmp(name, "voiceOrdersTeam") == 0) {
ADDRGP4 $2974
JUMPV
LABELV $2973
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2994
ARGP4
ADDRLP4 1216
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1216
INDIRI4
CNSTI4 0
NEI4 $2992
line 4550
;4549:			const char *orders;
;4550:			if (String_Parse(args, &orders)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1220
ARGP4
ADDRLP4 1224
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1224
INDIRI4
CNSTI4 0
EQI4 $2993
line 4551
;4551:				int selectedPlayer = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1545
ARGP4
ADDRLP4 1232
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1228
ADDRLP4 1232
INDIRF4
CVFI4 4
ASGNI4
line 4552
;4552:				if (selectedPlayer == uiInfo.myTeamCount) {
ADDRLP4 1228
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
NEI4 $2997
line 4553
;4553:					trap_Cmd_ExecuteText( EXEC_APPEND, orders );
CNSTI4 2
ARGI4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4554
;4554:					trap_Cmd_ExecuteText( EXEC_APPEND, "\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2982
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4555
;4555:				}
LABELV $2997
line 4556
;4556:				trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 1236
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1236
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4557
;4557:				trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 4558
;4558:				trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2826
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4559
;4559:				Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 4560
;4560:			}
line 4561
;4561:		} else if (Q_stricmp(name, "voiceOrders") == 0) {
ADDRGP4 $2993
JUMPV
LABELV $2992
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3002
ARGP4
ADDRLP4 1220
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1220
INDIRI4
CNSTI4 0
NEI4 $3000
line 4563
;4562:			const char *orders;
;4563:			if (String_Parse(args, &orders)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1224
ARGP4
ADDRLP4 1228
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1228
INDIRI4
CNSTI4 0
EQI4 $3001
line 4564
;4564:				int selectedPlayer = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1545
ARGP4
ADDRLP4 1236
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1232
ADDRLP4 1236
INDIRF4
CVFI4 4
ASGNI4
line 4566
;4565:
;4566:				if (selectedPlayer == uiInfo.myTeamCount)
ADDRLP4 1232
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
NEI4 $3005
line 4567
;4567:				{
line 4568
;4568:					selectedPlayer = -1;
ADDRLP4 1232
CNSTI4 -1
ASGNI4
line 4569
;4569:					strcpy(buff, orders);
ADDRLP4 0
ARGP4
ADDRLP4 1224
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 4570
;4570:					trap_Cmd_ExecuteText( EXEC_APPEND, va(buff, selectedPlayer) );
ADDRLP4 0
ARGP4
ADDRLP4 1232
INDIRI4
ARGI4
ADDRLP4 1240
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1240
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4571
;4571:				}
ADDRGP4 $3006
JUMPV
LABELV $3005
line 4573
;4572:				else
;4573:				{
line 4574
;4574:					strcpy(buff, orders);
ADDRLP4 0
ARGP4
ADDRLP4 1224
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 4575
;4575:					trap_Cmd_ExecuteText( EXEC_APPEND, va(buff, uiInfo.teamClientNums[selectedPlayer]) );
ADDRLP4 0
ARGP4
ADDRLP4 1232
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+20088
ADDP4
INDIRI4
ARGI4
ADDRLP4 1240
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1240
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4576
;4576:				}
LABELV $3006
line 4577
;4577:				trap_Cmd_ExecuteText( EXEC_APPEND, "\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2982
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 4579
;4578:
;4579:				trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 1240
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1240
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4580
;4580:				trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 4581
;4581:				trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2826
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4582
;4582:				Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 4583
;4583:			}
line 4584
;4584:		}
ADDRGP4 $3001
JUMPV
LABELV $3000
line 4585
;4585:		else if (Q_stricmp(name, "setForce") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3011
ARGP4
ADDRLP4 1224
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1224
INDIRI4
CNSTI4 0
NEI4 $3009
line 4586
;4586:		{
line 4589
;4587:			const char *teamArg;
;4588:
;4589:			if (String_Parse(args, &teamArg))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1228
ARGP4
ADDRLP4 1232
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
EQI4 $3012
line 4590
;4590:			{
line 4591
;4591:				if ( Q_stricmp( "none", teamArg ) == 0 )
ADDRGP4 $3016
ARGP4
ADDRLP4 1228
INDIRP4
ARGP4
ADDRLP4 1236
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1236
INDIRI4
CNSTI4 0
NEI4 $3014
line 4592
;4592:				{
line 4593
;4593:					UI_UpdateClientForcePowers(NULL);
CNSTP4 0
ARGP4
ADDRGP4 UI_UpdateClientForcePowers
CALLV
pop
line 4594
;4594:				}
ADDRGP4 $3010
JUMPV
LABELV $3014
line 4595
;4595:				else if ( Q_stricmp( "same", teamArg ) == 0 )
ADDRGP4 $3019
ARGP4
ADDRLP4 1228
INDIRP4
ARGP4
ADDRLP4 1240
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1240
INDIRI4
CNSTI4 0
NEI4 $3017
line 4596
;4596:				{//stay on current team
line 4597
;4597:					int myTeam = (int)(trap_Cvar_VariableValue("ui_myteam"));
ADDRGP4 $860
ARGP4
ADDRLP4 1248
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1244
ADDRLP4 1248
INDIRF4
CVFI4 4
ASGNI4
line 4598
;4598:					if ( myTeam != TEAM_SPECTATOR )
ADDRLP4 1244
INDIRI4
CNSTI4 3
EQI4 $3020
line 4599
;4599:					{
line 4600
;4600:						UI_UpdateClientForcePowers(UI_TeamName(myTeam));//will cause him to respawn, if it's been 5 seconds since last one
ADDRLP4 1244
INDIRI4
ARGI4
ADDRLP4 1252
ADDRGP4 UI_TeamName
CALLP4
ASGNP4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRGP4 UI_UpdateClientForcePowers
CALLV
pop
line 4601
;4601:					}
ADDRGP4 $3010
JUMPV
LABELV $3020
line 4603
;4602:					else
;4603:					{
line 4604
;4604:						UI_UpdateClientForcePowers(NULL);//just update powers
CNSTP4 0
ARGP4
ADDRGP4 UI_UpdateClientForcePowers
CALLV
pop
line 4605
;4605:					}
line 4606
;4606:				}
ADDRGP4 $3010
JUMPV
LABELV $3017
line 4608
;4607:				else
;4608:				{
line 4609
;4609:					UI_UpdateClientForcePowers(teamArg);
ADDRLP4 1228
INDIRP4
ARGP4
ADDRGP4 UI_UpdateClientForcePowers
CALLV
pop
line 4610
;4610:				}
line 4611
;4611:			}
ADDRGP4 $3010
JUMPV
LABELV $3012
line 4613
;4612:			else
;4613:			{
line 4614
;4614:				UI_UpdateClientForcePowers(NULL);
CNSTP4 0
ARGP4
ADDRGP4 UI_UpdateClientForcePowers
CALLV
pop
line 4615
;4615:			}
line 4616
;4616:		}
ADDRGP4 $3010
JUMPV
LABELV $3009
line 4617
;4617:		else if (Q_stricmp(name, "saveTemplate") == 0) {
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3024
ARGP4
ADDRLP4 1228
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1228
INDIRI4
CNSTI4 0
NEI4 $3022
line 4618
;4618:			UI_SaveForceTemplate();
ADDRGP4 UI_SaveForceTemplate
CALLV
pop
line 4619
;4619:		} else if (Q_stricmp(name, "refreshForce") == 0) {
ADDRGP4 $3023
JUMPV
LABELV $3022
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3027
ARGP4
ADDRLP4 1232
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
NEI4 $3025
line 4620
;4620:			UI_UpdateForcePowers();
ADDRGP4 UI_UpdateForcePowers
CALLV
pop
line 4621
;4621:		} else if (Q_stricmp(name, "glCustom") == 0) {
ADDRGP4 $3026
JUMPV
LABELV $3025
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3030
ARGP4
ADDRLP4 1236
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1236
INDIRI4
CNSTI4 0
NEI4 $3028
line 4622
;4622:			trap_Cvar_Set("ui_r_glCustom", "4");
ADDRGP4 $2537
ARGP4
ADDRGP4 $2604
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4623
;4623:		} 
ADDRGP4 $3029
JUMPV
LABELV $3028
line 4624
;4624:		else if (Q_stricmp(name, "forcePowersDisable") == 0) 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3033
ARGP4
ADDRLP4 1240
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1240
INDIRI4
CNSTI4 0
NEI4 $3031
line 4625
;4625:		{
line 4628
;4626:			int	forcePowerDisable,i;
;4627:
;4628:			forcePowerDisable = trap_Cvar_VariableValue("g_forcePowerDisable");
ADDRGP4 $905
ARGP4
ADDRLP4 1252
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1248
ADDRLP4 1252
INDIRF4
CVFI4 4
ASGNI4
line 4631
;4629:
;4630:			// It was set to something, so might as well make sure it got all flags set.
;4631:			if (forcePowerDisable)
ADDRLP4 1248
INDIRI4
CNSTI4 0
EQI4 $3032
line 4632
;4632:			{
line 4633
;4633:				for (i=0;i<NUM_FORCE_POWERS;i++)
ADDRLP4 1244
CNSTI4 0
ASGNI4
LABELV $3036
line 4634
;4634:				{
line 4635
;4635:					forcePowerDisable |= (1<<i);
ADDRLP4 1248
ADDRLP4 1248
INDIRI4
CNSTI4 1
ADDRLP4 1244
INDIRI4
LSHI4
BORI4
ASGNI4
line 4636
;4636:				}
LABELV $3037
line 4633
ADDRLP4 1244
ADDRLP4 1244
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1244
INDIRI4
CNSTI4 18
LTI4 $3036
line 4638
;4637:
;4638:				trap_Cvar_Set("g_forcePowerDisable", va("%i",forcePowerDisable));
ADDRGP4 $1406
ARGP4
ADDRLP4 1248
INDIRI4
ARGI4
ADDRLP4 1256
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $905
ARGP4
ADDRLP4 1256
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4639
;4639:			}
line 4641
;4640:
;4641:		} 
ADDRGP4 $3032
JUMPV
LABELV $3031
line 4642
;4642:		else if (Q_stricmp(name, "weaponDisable") == 0) 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3042
ARGP4
ADDRLP4 1244
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1244
INDIRI4
CNSTI4 0
NEI4 $3040
line 4643
;4643:		{
line 4647
;4644:			int	weaponDisable,i;
;4645:			const char *cvarString;
;4646:
;4647:			if (ui_netGameType.integer == GT_TOURNAMENT)
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
NEI4 $3043
line 4648
;4648:			{
line 4649
;4649:				cvarString = "g_duelWeaponDisable";
ADDRLP4 1256
ADDRGP4 $888
ASGNP4
line 4650
;4650:			}
ADDRGP4 $3044
JUMPV
LABELV $3043
line 4652
;4651:			else
;4652:			{
line 4653
;4653:				cvarString = "g_weaponDisable";
ADDRLP4 1256
ADDRGP4 $889
ASGNP4
line 4654
;4654:			}
LABELV $3044
line 4656
;4655:
;4656:			weaponDisable = trap_Cvar_VariableValue(cvarString);
ADDRLP4 1256
INDIRP4
ARGP4
ADDRLP4 1260
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1252
ADDRLP4 1260
INDIRF4
CVFI4 4
ASGNI4
line 4659
;4657:
;4658:			// It was set to something, so might as well make sure it got all flags set.
;4659:			if (weaponDisable)
ADDRLP4 1252
INDIRI4
CNSTI4 0
EQI4 $3041
line 4660
;4660:			{
line 4661
;4661:				for (i=0;i<WP_NUM_WEAPONS;i++)
ADDRLP4 1248
CNSTI4 0
ASGNI4
LABELV $3048
line 4662
;4662:				{
line 4663
;4663:					if (i!=WP_SABER)
ADDRLP4 1248
INDIRI4
CNSTI4 2
EQI4 $3052
line 4664
;4664:					{
line 4665
;4665:						weaponDisable |= (1<<i);
ADDRLP4 1252
ADDRLP4 1252
INDIRI4
CNSTI4 1
ADDRLP4 1248
INDIRI4
LSHI4
BORI4
ASGNI4
line 4666
;4666:					}
LABELV $3052
line 4667
;4667:				}
LABELV $3049
line 4661
ADDRLP4 1248
ADDRLP4 1248
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1248
INDIRI4
CNSTI4 16
LTI4 $3048
line 4669
;4668:
;4669:				trap_Cvar_Set(cvarString, va("%i",weaponDisable));
ADDRGP4 $1406
ARGP4
ADDRLP4 1252
INDIRI4
ARGI4
ADDRLP4 1264
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1256
INDIRP4
ARGP4
ADDRLP4 1264
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4670
;4670:			}
line 4671
;4671:		} 
ADDRGP4 $3041
JUMPV
LABELV $3040
line 4672
;4672:		else if (Q_stricmp(name, "updateForceStatus") == 0)
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3056
ARGP4
ADDRLP4 1248
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1248
INDIRI4
CNSTI4 0
NEI4 $3054
line 4673
;4673:		{
line 4674
;4674:			UpdateForceStatus();
ADDRGP4 UpdateForceStatus
CALLV
pop
line 4675
;4675:		}
ADDRGP4 $3055
JUMPV
LABELV $3054
line 4676
;4676:		else if (Q_stricmp(name, "update") == 0) 
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $3059
ARGP4
ADDRLP4 1252
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1252
INDIRI4
CNSTI4 0
NEI4 $3057
line 4677
;4677:		{
line 4678
;4678:			if (String_Parse(args, &name2)) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1256
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1256
INDIRI4
CNSTI4 0
EQI4 $3058
line 4679
;4679:			{
line 4680
;4680:				UI_Update(name2);
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 UI_Update
CALLV
pop
line 4681
;4681:			}
line 4682
;4682:		}
ADDRGP4 $3058
JUMPV
LABELV $3057
line 4684
;4683:		else 
;4684:		{
line 4685
;4685:			Com_Printf("unknown UI script %s\n", name);
ADDRGP4 $3062
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4686
;4686:		}
LABELV $3058
LABELV $3055
LABELV $3041
LABELV $3032
LABELV $3029
LABELV $3026
LABELV $3023
LABELV $3010
LABELV $3001
LABELV $2993
LABELV $2974
LABELV $2963
LABELV $2950
LABELV $2928
LABELV $2910
LABELV $2899
LABELV $2887
LABELV $2876
LABELV $2864
LABELV $2861
LABELV $2858
LABELV $2855
LABELV $2839
LABELV $2836
LABELV $2833
LABELV $2829
LABELV $2824
LABELV $2820
LABELV $2810
LABELV $2793
LABELV $2788
LABELV $2781
LABELV $2771
LABELV $2765
LABELV $2758
LABELV $2745
LABELV $2742
LABELV $2736
LABELV $2730
LABELV $2720
LABELV $2717
LABELV $2714
LABELV $2711
LABELV $2698
LABELV $2695
LABELV $2692
LABELV $2689
LABELV $2680
LABELV $2676
LABELV $2673
LABELV $2670
LABELV $2665
LABELV $2658
LABELV $2651
LABELV $2609
line 4687
;4687:	}
LABELV $2606
line 4688
;4688:}
LABELV $2605
endproc UI_RunMenuScript 1300 24
proc UI_GetTeamColor 0 0
line 4690
;4689:
;4690:static void UI_GetTeamColor(vec4_t *color) {
line 4691
;4691:}
LABELV $3063
endproc UI_GetTeamColor 0 0
proc UI_MapCountByGameType 20 0
line 4698
;4692:
;4693:/*
;4694:==================
;4695:UI_MapCountByGameType
;4696:==================
;4697:*/
;4698:static int UI_MapCountByGameType(qboolean singlePlayer) {
line 4700
;4699:	int i, c, game;
;4700:	c = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 4701
;4701:	game = singlePlayer ? uiInfo.gameTypes[ui_gameType.integer].gtEnum : uiInfo.gameTypes[ui_netGameType.integer].gtEnum;
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $3072
ADDRLP4 12
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $3073
JUMPV
LABELV $3072
ADDRLP4 12
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ASGNI4
LABELV $3073
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 4702
;4702:	if (game == GT_SINGLE_PLAYER) {
ADDRLP4 4
INDIRI4
CNSTI4 4
NEI4 $3074
line 4703
;4703:		game++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4704
;4704:	} 
LABELV $3074
line 4705
;4705:	if (game == GT_TEAM) {
ADDRLP4 4
INDIRI4
CNSTI4 5
NEI4 $3076
line 4706
;4706:		game = GT_FFA;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4707
;4707:	}
LABELV $3076
line 4708
;4708:	if (game == GT_HOLOCRON || game == GT_JEDIMASTER) {
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $3080
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $3078
LABELV $3080
line 4709
;4709:		game = GT_FFA;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4710
;4710:	}
LABELV $3078
line 4712
;4711:
;4712:	for (i = 0; i < uiInfo.mapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3084
JUMPV
LABELV $3081
line 4713
;4713:		uiInfo.mapList[i].active = qfalse;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+96
ADDP4
CNSTI4 0
ASGNI4
line 4714
;4714:		if ( uiInfo.mapList[i].typeBits & (1 << game)) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+20
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $3088
line 4715
;4715:			if (singlePlayer) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $3092
line 4716
;4716:				if (!(uiInfo.mapList[i].typeBits & (1 << GT_SINGLE_PLAYER))) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+20
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $3094
line 4717
;4717:					continue;
ADDRGP4 $3082
JUMPV
LABELV $3094
line 4719
;4718:				}
;4719:			}
LABELV $3092
line 4720
;4720:			c++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4721
;4721:			uiInfo.mapList[i].active = qtrue;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+96
ADDP4
CNSTI4 1
ASGNI4
line 4722
;4722:		}
LABELV $3088
line 4723
;4723:	}
LABELV $3082
line 4712
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3084
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
LTI4 $3081
line 4724
;4724:	return c;
ADDRLP4 8
INDIRI4
RETI4
LABELV $3064
endproc UI_MapCountByGameType 20 0
export UI_hasSkinForBase
proc UI_hasSkinForBase 1028 20
line 4727
;4725:}
;4726:
;4727:qboolean UI_hasSkinForBase(const char *base, const char *team) {
line 4731
;4728:	char	test[1024];
;4729:	fileHandle_t	f;
;4730:	
;4731:	Com_sprintf( test, sizeof( test ), "models/players/%s/%s/lower_default.skin", base, team );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3101
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4732
;4732:	trap_FS_FOpenFile(test, &f, FS_READ);
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 4733
;4733:	if (f != 0) {
ADDRLP4 1024
INDIRI4
CNSTI4 0
EQI4 $3102
line 4734
;4734:		trap_FS_FCloseFile(f);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 4735
;4735:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3100
JUMPV
LABELV $3102
line 4737
;4736:	}
;4737:	Com_sprintf( test, sizeof( test ), "models/players/characters/%s/%s/lower_default.skin", base, team );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3104
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4738
;4738:	trap_FS_FOpenFile(test, &f, FS_READ);
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 4739
;4739:	if (f != 0) {
ADDRLP4 1024
INDIRI4
CNSTI4 0
EQI4 $3105
line 4740
;4740:		trap_FS_FCloseFile(f);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 4741
;4741:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3100
JUMPV
LABELV $3105
line 4743
;4742:	}
;4743:	return qfalse;
CNSTI4 0
RETI4
LABELV $3100
endproc UI_hasSkinForBase 1028 20
data
align 4
LABELV $3108
byte 4 0
code
proc UI_HeadCountByTeam 40 8
line 4751
;4744:}
;4745:
;4746:/*
;4747:==================
;4748:UI_MapCountByTeam
;4749:==================
;4750:*/
;4751:static int UI_HeadCountByTeam() {
line 4755
;4752:	static int init = 0;
;4753:	int i, j, k, c, tIndex;
;4754:	
;4755:	c = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 4756
;4756:	if (!init) {
ADDRGP4 $3108
INDIRI4
CNSTI4 0
NEI4 $3109
line 4757
;4757:		for (i = 0; i < uiInfo.characterCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3114
JUMPV
LABELV $3111
line 4758
;4758:			uiInfo.characterList[i].reference = 0;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+20
ADDP4
CNSTI4 0
ASGNI4
line 4759
;4759:			for (j = 0; j < uiInfo.teamCount; j++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $3121
JUMPV
LABELV $3118
line 4760
;4760:			  if (UI_hasSkinForBase(uiInfo.characterList[i].base, uiInfo.teamList[j].teamName)) {
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+12
ADDP4
INDIRP4
ARGP4
CNSTI4 56
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+14160
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_hasSkinForBase
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $3123
line 4761
;4761:					uiInfo.characterList[i].reference |= (1<<j);
ADDRLP4 24
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+20
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 8
INDIRI4
LSHI4
BORI4
ASGNI4
line 4762
;4762:			  }
LABELV $3123
line 4763
;4763:			}
LABELV $3119
line 4759
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3121
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
LTI4 $3118
line 4764
;4764:		}
LABELV $3112
line 4757
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3114
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+11840
INDIRI4
LTI4 $3111
line 4765
;4765:		init = 1;
ADDRGP4 $3108
CNSTI4 1
ASGNI4
line 4766
;4766:	}
LABELV $3109
line 4768
;4767:
;4768:	tIndex = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 4771
;4769:
;4770:	// do names
;4771:	for (i = 0; i < uiInfo.characterCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3133
JUMPV
LABELV $3130
line 4772
;4772:		uiInfo.characterList[i].active = qfalse;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+16
ADDP4
CNSTI4 0
ASGNI4
line 4773
;4773:		for(j = 0; j < TEAM_MEMBERS; j++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $3137
line 4774
;4774:			if (uiInfo.teamList[tIndex].teamMembers[j] != NULL) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 56
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+8
ADDP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3141
line 4775
;4775:				if (uiInfo.characterList[i].reference&(1<<tIndex)) {// && Q_stricmp(uiInfo.teamList[tIndex].teamMembers[j], uiInfo.characterList[i].name)==0) {
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+20
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 12
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $3145
line 4776
;4776:					uiInfo.characterList[i].active = qtrue;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+16
ADDP4
CNSTI4 1
ASGNI4
line 4777
;4777:					c++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4778
;4778:					break;
ADDRGP4 $3139
JUMPV
LABELV $3145
line 4780
;4779:				}
;4780:			}
LABELV $3141
line 4781
;4781:		}
LABELV $3138
line 4773
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 8
LTI4 $3137
LABELV $3139
line 4782
;4782:	}
LABELV $3131
line 4771
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3133
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+11840
INDIRI4
LTI4 $3130
line 4785
;4783:
;4784:	// and then aliases
;4785:	for(j = 0; j < TEAM_MEMBERS; j++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $3151
line 4786
;4786:		for(k = 0; k < uiInfo.aliasCount; k++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3158
JUMPV
LABELV $3155
line 4787
;4787:			if (uiInfo.aliasList[k].name != NULL) {
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+13388
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3160
line 4788
;4788:				if (Q_stricmp(uiInfo.teamList[tIndex].teamMembers[j], uiInfo.aliasList[k].name)==0) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 56
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+8
ADDP4
ADDP4
INDIRP4
ARGP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+13388
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $3163
line 4789
;4789:					for (i = 0; i < uiInfo.characterCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3171
JUMPV
LABELV $3168
line 4790
;4790:						if (uiInfo.characterList[i].headImage != -1 && uiInfo.characterList[i].reference&(1<<tIndex) && Q_stricmp(uiInfo.aliasList[k].ai, uiInfo.characterList[i].name)==0) {
ADDRLP4 32
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+11848+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $3173
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+11848+20
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 12
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $3173
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+13388+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+11848
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $3173
line 4791
;4791:							if (uiInfo.characterList[i].active == qfalse) {
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3170
line 4792
;4792:								uiInfo.characterList[i].active = qtrue;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+16
ADDP4
CNSTI4 1
ASGNI4
line 4793
;4793:								c++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4794
;4794:							}
line 4795
;4795:							break;
ADDRGP4 $3170
JUMPV
LABELV $3173
line 4797
;4796:						}
;4797:					}
LABELV $3169
line 4789
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3171
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+11840
INDIRI4
LTI4 $3168
LABELV $3170
line 4798
;4798:				}
LABELV $3163
line 4799
;4799:			}
LABELV $3160
line 4800
;4800:		}
LABELV $3156
line 4786
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3158
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+13384
INDIRI4
LTI4 $3155
line 4801
;4801:	}
LABELV $3152
line 4785
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 8
LTI4 $3151
line 4802
;4802:	return c;
ADDRLP4 16
INDIRI4
RETI4
LABELV $3107
endproc UI_HeadCountByTeam 40 8
proc UI_HeadCountByColor 24 8
line 4810
;4803:}
;4804:
;4805:/*
;4806:==================
;4807:UI_HeadCountByColor
;4808:==================
;4809:*/
;4810:static int UI_HeadCountByColor() {
line 4814
;4811:	int i, c;
;4812:	char *teamname;
;4813:
;4814:	c = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 4816
;4815:
;4816:	switch(uiSkinColor)
ADDRLP4 12
ADDRGP4 uiSkinColor
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $3193
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $3191
ADDRGP4 $3189
JUMPV
line 4817
;4817:	{
LABELV $3191
line 4819
;4818:		case TEAM_BLUE:
;4819:			teamname = "/blue";
ADDRLP4 4
ADDRGP4 $3192
ASGNP4
line 4820
;4820:			break;
ADDRGP4 $3190
JUMPV
LABELV $3193
line 4822
;4821:		case TEAM_RED:
;4822:			teamname = "/red";
ADDRLP4 4
ADDRGP4 $3194
ASGNP4
line 4823
;4823:			break;
ADDRGP4 $3190
JUMPV
LABELV $3189
line 4825
;4824:		default:
;4825:			teamname = "/default";
ADDRLP4 4
ADDRGP4 $3195
ASGNP4
line 4826
;4826:	}
LABELV $3190
line 4829
;4827:
;4828:	// Count each head with this color
;4829:	for (i=0; i<uiInfo.q3HeadCount; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3199
JUMPV
LABELV $3196
line 4830
;4830:	{
line 4831
;4831:		if (uiInfo.q3HeadNames[i] && strstr(uiInfo.q3HeadNames[i], teamname))
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+60872
ADDP4
CVPU4 4
CNSTU4 0
EQU4 $3201
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+60872
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3201
line 4832
;4832:		{
line 4833
;4833:			c++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4834
;4834:		}
LABELV $3201
line 4835
;4835:	}
LABELV $3197
line 4829
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3199
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+60868
INDIRI4
LTI4 $3196
line 4836
;4836:	return c;
ADDRLP4 8
INDIRI4
RETI4
LABELV $3188
endproc UI_HeadCountByColor 24 8
proc UI_InsertServerIntoDisplayList 16 0
line 4844
;4837:}
;4838:
;4839:/*
;4840:==================
;4841:UI_InsertServerIntoDisplayList
;4842:==================
;4843:*/
;4844:static void UI_InsertServerIntoDisplayList(int num, int position) {
line 4847
;4845:	int i;
;4846:
;4847:	if (position < 0 || position > uiInfo.serverStatus.numDisplayServers ) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3210
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+40740+10412
INDIRI4
LEI4 $3206
LABELV $3210
line 4848
;4848:		return;
ADDRGP4 $3205
JUMPV
LABELV $3206
line 4851
;4849:	}
;4850:	//
;4851:	uiInfo.serverStatus.numDisplayServers++;
ADDRLP4 8
ADDRGP4 uiInfo+40740+10412
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4852
;4852:	for (i = uiInfo.serverStatus.numDisplayServers; i > position; i--) {
ADDRLP4 0
ADDRGP4 uiInfo+40740+10412
INDIRI4
ASGNI4
ADDRGP4 $3216
JUMPV
LABELV $3213
line 4853
;4853:		uiInfo.serverStatus.displayServers[i] = uiInfo.serverStatus.displayServers[i-1];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+40740+2220
ADDP4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+40740+2220-4
ADDP4
INDIRI4
ASGNI4
line 4854
;4854:	}
LABELV $3214
line 4852
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $3216
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
GTI4 $3213
line 4855
;4855:	uiInfo.serverStatus.displayServers[position] = num;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 4856
;4856:}
LABELV $3205
endproc UI_InsertServerIntoDisplayList 16 0
proc UI_RemoveServerFromDisplayList 16 0
line 4863
;4857:
;4858:/*
;4859:==================
;4860:UI_RemoveServerFromDisplayList
;4861:==================
;4862:*/
;4863:static void UI_RemoveServerFromDisplayList(int num) {
line 4866
;4864:	int i, j;
;4865:
;4866:	for (i = 0; i < uiInfo.serverStatus.numDisplayServers; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3230
JUMPV
LABELV $3227
line 4867
;4867:		if (uiInfo.serverStatus.displayServers[i] == num) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3233
line 4868
;4868:			uiInfo.serverStatus.numDisplayServers--;
ADDRLP4 8
ADDRGP4 uiInfo+40740+10412
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4869
;4869:			for (j = i; j < uiInfo.serverStatus.numDisplayServers; j++) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $3242
JUMPV
LABELV $3239
line 4870
;4870:				uiInfo.serverStatus.displayServers[j] = uiInfo.serverStatus.displayServers[j+1];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+40740+2220
ADDP4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+40740+2220+4
ADDP4
INDIRI4
ASGNI4
line 4871
;4871:			}
LABELV $3240
line 4869
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3242
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+40740+10412
INDIRI4
LTI4 $3239
line 4872
;4872:			return;
ADDRGP4 $3226
JUMPV
LABELV $3233
line 4874
;4873:		}
;4874:	}
LABELV $3228
line 4866
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3230
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+40740+10412
INDIRI4
LTI4 $3227
line 4875
;4875:}
LABELV $3226
endproc UI_RemoveServerFromDisplayList 16 0
proc UI_BinaryServerInsertion 20 20
line 4882
;4876:
;4877:/*
;4878:==================
;4879:UI_BinaryServerInsertion
;4880:==================
;4881:*/
;4882:static void UI_BinaryServerInsertion(int num) {
line 4886
;4883:	int mid, offset, res, len;
;4884:
;4885:	// use binary search to insert server
;4886:	len = uiInfo.serverStatus.numDisplayServers;
ADDRLP4 12
ADDRGP4 uiInfo+40740+10412
INDIRI4
ASGNI4
line 4887
;4887:	mid = len;
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 4888
;4888:	offset = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 4889
;4889:	res = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3254
JUMPV
LABELV $3253
line 4890
;4890:	while(mid > 0) {
line 4891
;4891:		mid = len >> 1;
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 1
RSHI4
ASGNI4
line 4893
;4892:		//
;4893:		res = trap_LAN_CompareServers( ui_netSource.integer, uiInfo.serverStatus.sortKey,
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+40740+2200
INDIRI4
ARGI4
ADDRGP4 uiInfo+40740+2204
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 trap_LAN_CompareServers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 4896
;4894:					uiInfo.serverStatus.sortDir, num, uiInfo.serverStatus.displayServers[offset+mid]);
;4895:		// if equal
;4896:		if (res == 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3263
line 4897
;4897:			UI_InsertServerIntoDisplayList(num, offset+mid);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ARGI4
ADDRGP4 UI_InsertServerIntoDisplayList
CALLV
pop
line 4898
;4898:			return;
ADDRGP4 $3250
JUMPV
LABELV $3263
line 4901
;4899:		}
;4900:		// if larger
;4901:		else if (res == 1) {
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $3265
line 4902
;4902:			offset += mid;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 4903
;4903:			len -= mid;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 4904
;4904:		}
ADDRGP4 $3266
JUMPV
LABELV $3265
line 4906
;4905:		// if smaller
;4906:		else {
line 4907
;4907:			len -= mid;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 4908
;4908:		}
LABELV $3266
line 4909
;4909:	}
LABELV $3254
line 4890
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $3253
line 4910
;4910:	if (res == 1) {
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $3267
line 4911
;4911:		offset++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4912
;4912:	}
LABELV $3267
line 4913
;4913:	UI_InsertServerIntoDisplayList(num, offset);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 UI_InsertServerIntoDisplayList
CALLV
pop
line 4914
;4914:}
LABELV $3250
endproc UI_BinaryServerInsertion 20 20
bss
align 4
LABELV $3270
skip 4
code
proc UI_BuildServerDisplayList 1100 16
line 4921
;4915:
;4916:/*
;4917:==================
;4918:UI_BuildServerDisplayList
;4919:==================
;4920:*/
;4921:static void UI_BuildServerDisplayList(qboolean force) {
line 4927
;4922:	int i, count, clients, maxClients, ping, game, len, visible;
;4923:	char info[MAX_STRING_CHARS];
;4924://	qboolean startRefresh = qtrue; TTimo: unused
;4925:	static int numinvisible;
;4926:
;4927:	if (!(force || uiInfo.uiDC.realTime > uiInfo.serverStatus.nextDisplayRefresh)) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $3271
ADDRGP4 uiInfo+240
INDIRI4
ADDRGP4 uiInfo+40740+10420
INDIRI4
GTI4 $3271
line 4928
;4928:		return;
ADDRGP4 $3269
JUMPV
LABELV $3271
line 4931
;4929:	}
;4930:	// if we shouldn't reset
;4931:	if ( force == 2 ) {
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $3276
line 4932
;4932:		force = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 4933
;4933:	}
LABELV $3276
line 4936
;4934:
;4935:	// do motd updates here too
;4936:	trap_Cvar_VariableStringBuffer( "cl_motdString", uiInfo.serverStatus.motd, sizeof(uiInfo.serverStatus.motd) );
ADDRGP4 $3278
ARGP4
ADDRGP4 uiInfo+40740+10460
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 4937
;4937:	len = strlen(uiInfo.serverStatus.motd);
ADDRGP4 uiInfo+40740+10460
ARGP4
ADDRLP4 1056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1056
INDIRI4
ASGNI4
line 4938
;4938:	if (len == 0) {
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $3285
line 4939
;4939:		strcpy(uiInfo.serverStatus.motd, "Welcome to JK2MP!");
ADDRGP4 uiInfo+40740+10460
ARGP4
ADDRGP4 $3289
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 4940
;4940:		len = strlen(uiInfo.serverStatus.motd);
ADDRGP4 uiInfo+40740+10460
ARGP4
ADDRLP4 1060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1060
INDIRI4
ASGNI4
line 4941
;4941:	} 
LABELV $3285
line 4942
;4942:	if (len != uiInfo.serverStatus.motdLen) {
ADDRLP4 1052
INDIRI4
ADDRGP4 uiInfo+40740+10436
INDIRI4
EQI4 $3292
line 4943
;4943:		uiInfo.serverStatus.motdLen = len;
ADDRGP4 uiInfo+40740+10436
ADDRLP4 1052
INDIRI4
ASGNI4
line 4944
;4944:		uiInfo.serverStatus.motdWidth = -1;
ADDRGP4 uiInfo+40740+10440
CNSTI4 -1
ASGNI4
line 4945
;4945:	} 
LABELV $3292
line 4947
;4946:
;4947:	if (force) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $3300
line 4948
;4948:		numinvisible = 0;
ADDRGP4 $3270
CNSTI4 0
ASGNI4
line 4950
;4949:		// clear number of displayed servers
;4950:		uiInfo.serverStatus.numDisplayServers = 0;
ADDRGP4 uiInfo+40740+10412
CNSTI4 0
ASGNI4
line 4951
;4951:		uiInfo.serverStatus.numPlayersOnServers = 0;
ADDRGP4 uiInfo+40740+10416
CNSTI4 0
ASGNI4
line 4953
;4952:		// set list box index to zero
;4953:		Menu_SetFeederSelection(NULL, FEEDER_SERVERS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4955
;4954:		// mark all servers as visible so we store ping updates for them
;4955:		trap_LAN_MarkServerVisible(ui_netSource.integer, -1, qtrue);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 4956
;4956:	}
LABELV $3300
line 4959
;4957:
;4958:	// get the server count (comes from the master)
;4959:	count = trap_LAN_GetServerCount(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1060
INDIRI4
ASGNI4
line 4960
;4960:	if (count == -1 || (ui_netSource.integer == AS_LOCAL && count == 0) ) {
ADDRLP4 1036
INDIRI4
CNSTI4 -1
EQI4 $3311
ADDRLP4 1068
CNSTI4 0
ASGNI4
ADDRGP4 ui_netSource+12
INDIRI4
ADDRLP4 1068
INDIRI4
NEI4 $3308
ADDRLP4 1036
INDIRI4
ADDRLP4 1068
INDIRI4
NEI4 $3308
LABELV $3311
line 4962
;4961:		// still waiting on a response from the master
;4962:		uiInfo.serverStatus.numDisplayServers = 0;
ADDRGP4 uiInfo+40740+10412
CNSTI4 0
ASGNI4
line 4963
;4963:		uiInfo.serverStatus.numPlayersOnServers = 0;
ADDRGP4 uiInfo+40740+10416
CNSTI4 0
ASGNI4
line 4964
;4964:		uiInfo.serverStatus.nextDisplayRefresh = uiInfo.uiDC.realTime + 500;
ADDRGP4 uiInfo+40740+10420
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 4965
;4965:		return;
ADDRGP4 $3269
JUMPV
LABELV $3308
line 4968
;4966:	}
;4967:
;4968:	visible = qfalse;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 4969
;4969:	for (i = 0; i < count; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3322
JUMPV
LABELV $3319
line 4971
;4970:		// if we already got info for this server
;4971:		if (!trap_LAN_ServerIsVisible(ui_netSource.integer, i)) {
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1072
ADDRGP4 trap_LAN_ServerIsVisible
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $3323
line 4972
;4972:			continue;
ADDRGP4 $3320
JUMPV
LABELV $3323
line 4974
;4973:		}
;4974:		visible = qtrue;
ADDRLP4 1040
CNSTI4 1
ASGNI4
line 4976
;4975:		// get the ping for this server
;4976:		ping = trap_LAN_GetServerPing(ui_netSource.integer, i);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 trap_LAN_GetServerPing
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1076
INDIRI4
ASGNI4
line 4977
;4977:		if (ping > 0 || ui_netSource.integer == AS_FAVORITES) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GTI4 $3330
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
NEI4 $3327
LABELV $3330
line 4979
;4978:
;4979:			trap_LAN_GetServerInfo(ui_netSource.integer, i, info, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 4981
;4980:
;4981:			clients = atoi(Info_ValueForKey(info, "clients"));
ADDRLP4 8
ARGP4
ADDRGP4 $3332
ARGP4
ADDRLP4 1080
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRLP4 1084
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1084
INDIRI4
ASGNI4
line 4982
;4982:			uiInfo.serverStatus.numPlayersOnServers += clients;
ADDRLP4 1088
ADDRGP4 uiInfo+40740+10416
ASGNP4
ADDRLP4 1088
INDIRP4
ADDRLP4 1088
INDIRP4
INDIRI4
ADDRLP4 1032
INDIRI4
ADDI4
ASGNI4
line 4984
;4983:
;4984:			if (ui_browserShowEmpty.integer == 0) {
ADDRGP4 ui_browserShowEmpty+12
INDIRI4
CNSTI4 0
NEI4 $3335
line 4985
;4985:				if (clients == 0) {
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $3338
line 4986
;4986:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 4987
;4987:					continue;
ADDRGP4 $3320
JUMPV
LABELV $3338
line 4989
;4988:				}
;4989:			}
LABELV $3335
line 4991
;4990:
;4991:			if (ui_browserShowFull.integer == 0) {
ADDRGP4 ui_browserShowFull+12
INDIRI4
CNSTI4 0
NEI4 $3341
line 4992
;4992:				maxClients = atoi(Info_ValueForKey(info, "sv_maxclients"));
ADDRLP4 8
ARGP4
ADDRGP4 $1511
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 1096
INDIRI4
ASGNI4
line 4993
;4993:				if (clients == maxClients) {
ADDRLP4 1032
INDIRI4
ADDRLP4 1044
INDIRI4
NEI4 $3344
line 4994
;4994:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 4995
;4995:					continue;
ADDRGP4 $3320
JUMPV
LABELV $3344
line 4997
;4996:				}
;4997:			}
LABELV $3341
line 4999
;4998:
;4999:			if (uiInfo.joinGameTypes[ui_joinGameType.integer].gtEnum != -1) {
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17880+4
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $3347
line 5000
;5000:				game = atoi(Info_ValueForKey(info, "gametype"));
ADDRLP4 8
ARGP4
ADDRGP4 $3352
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 1096
INDIRI4
ASGNI4
line 5001
;5001:				if (game != uiInfo.joinGameTypes[ui_joinGameType.integer].gtEnum) {
ADDRLP4 1048
INDIRI4
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17880+4
ADDP4
INDIRI4
EQI4 $3353
line 5002
;5002:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 5003
;5003:					continue;
ADDRGP4 $3320
JUMPV
LABELV $3353
line 5005
;5004:				}
;5005:			}
LABELV $3347
line 5007
;5006:				
;5007:			if (ui_serverFilterType.integer > 0) {
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
LEI4 $3359
line 5008
;5008:				if (Q_stricmp(Info_ValueForKey(info, "game"), serverFilters[ui_serverFilterType.integer].basedir) != 0) {
ADDRLP4 8
ARGP4
ADDRGP4 $3364
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverFilters+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
EQI4 $3362
line 5009
;5009:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 5010
;5010:					continue;
ADDRGP4 $3320
JUMPV
LABELV $3362
line 5012
;5011:				}
;5012:			}
LABELV $3359
line 5014
;5013:			// make sure we never add a favorite server twice
;5014:			if (ui_netSource.integer == AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
NEI4 $3368
line 5015
;5015:				UI_RemoveServerFromDisplayList(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_RemoveServerFromDisplayList
CALLV
pop
line 5016
;5016:			}
LABELV $3368
line 5018
;5017:			// insert the server into the list
;5018:			UI_BinaryServerInsertion(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_BinaryServerInsertion
CALLV
pop
line 5020
;5019:			// done with this server
;5020:			if (ping > 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $3371
line 5021
;5021:				trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 5022
;5022:				numinvisible++;
ADDRLP4 1092
ADDRGP4 $3270
ASGNP4
ADDRLP4 1092
INDIRP4
ADDRLP4 1092
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5023
;5023:			}
LABELV $3371
line 5024
;5024:		}
LABELV $3327
line 5025
;5025:	}
LABELV $3320
line 4969
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3322
ADDRLP4 0
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $3319
line 5027
;5026:
;5027:	uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime;
ADDRGP4 uiInfo+40740+2192
ADDRGP4 uiInfo+240
INDIRI4
ASGNI4
line 5030
;5028:
;5029:	// if there were no servers visible for ping updates
;5030:	if (!visible) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $3377
line 5033
;5031://		UI_StopServerRefresh();
;5032://		uiInfo.serverStatus.nextDisplayRefresh = 0;
;5033:	}
LABELV $3377
line 5034
;5034:}
LABELV $3269
endproc UI_BuildServerDisplayList 1100 16
data
export serverStatusCvars
align 4
LABELV serverStatusCvars
address $3380
address $3381
address $3382
address $165
address $3383
address $3384
address $883
address $3385
address $3386
address $3387
address $3388
address $165
address $2341
address $165
address $3389
address $165
address $705
address $165
byte 4 0
byte 4 0
code
proc UI_SortServerStatusInfo 56 8
line 5059
;5035:
;5036:typedef struct
;5037:{
;5038:	char *name, *altName;
;5039:} serverStatusCvar_t;
;5040:
;5041:serverStatusCvar_t serverStatusCvars[] = {
;5042:	{"sv_hostname", "Name"},
;5043:	{"Address", ""},
;5044:	{"gamename", "Game name"},
;5045:	{"g_gametype", "Game type"},
;5046:	{"mapname", "Map"},
;5047:	{"version", ""},
;5048:	{"protocol", ""},
;5049:	{"timelimit", ""},
;5050:	{"fraglimit", ""},
;5051:	{NULL, NULL}
;5052:};
;5053:
;5054:/*
;5055:==================
;5056:UI_SortServerStatusInfo
;5057:==================
;5058:*/
;5059:static void UI_SortServerStatusInfo( serverStatusInfo_t *info ) {
line 5066
;5060:	int i, j, index;
;5061:	char *tmp1, *tmp2;
;5062:
;5063:	// FIXME: if "gamename" == "base" or "missionpack" then
;5064:	// replace the gametype number by FFA, CTF etc.
;5065:	//
;5066:	index = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 5067
;5067:	for (i = 0; serverStatusCvars[i].name; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $3394
JUMPV
LABELV $3391
line 5068
;5068:		for (j = 0; j < info->numLines; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3398
JUMPV
LABELV $3395
line 5069
;5069:			if ( !info->lines[j][1] || info->lines[j][1][0] ) {
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 24
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3401
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $3399
LABELV $3401
line 5070
;5070:				continue;
ADDRGP4 $3396
JUMPV
LABELV $3399
line 5072
;5071:			}
;5072:			if ( !Q_stricmp(serverStatusCvars[i].name, info->lines[j][0]) ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $3402
line 5074
;5073:				// swap lines
;5074:				tmp1 = info->lines[index][0];
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRP4
ASGNP4
line 5075
;5075:				tmp2 = info->lines[index][3];
ADDRLP4 16
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
line 5076
;5076:				info->lines[index][0] = info->lines[j][0];
ADDRLP4 32
CNSTI4 4
ASGNI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 4
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRLP4 36
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRLP4 36
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 5077
;5077:				info->lines[index][3] = info->lines[j][3];
ADDRLP4 40
CNSTI4 4
ASGNI4
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 48
CNSTI4 12
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 40
INDIRI4
LSHI4
ADDRLP4 44
INDIRP4
ADDP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
LSHI4
ADDRLP4 44
INDIRP4
ADDP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 5078
;5078:				info->lines[j][0] = tmp1;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
line 5079
;5079:				info->lines[j][3] = tmp2;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 5081
;5080:				//
;5081:				if ( strlen(serverStatusCvars[i].altName) ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $3404
line 5082
;5082:					info->lines[index][0] = serverStatusCvars[i].altName;
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars+4
ADDP4
INDIRP4
ASGNP4
line 5083
;5083:				}
LABELV $3404
line 5084
;5084:				index++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5085
;5085:			}
LABELV $3402
line 5086
;5086:		}
LABELV $3396
line 5068
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3398
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
LTI4 $3395
line 5087
;5087:	}
LABELV $3392
line 5067
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3394
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3391
line 5088
;5088:}
LABELV $3390
endproc UI_SortServerStatusInfo 56 8
proc UI_GetServerStatusInfo 168 16
line 5095
;5089:
;5090:/*
;5091:==================
;5092:UI_GetServerStatusInfo
;5093:==================
;5094:*/
;5095:static int UI_GetServerStatusInfo( const char *serverAddress, serverStatusInfo_t *info ) {
line 5099
;5096:	char *p, *score, *ping, *name;
;5097:	int i, len;
;5098:
;5099:	if (!info) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3409
line 5100
;5100:		trap_LAN_ServerStatus( serverAddress, NULL, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_ServerStatus
CALLI4
pop
line 5101
;5101:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3408
JUMPV
LABELV $3409
line 5103
;5102:	}
;5103:	memset(info, 0, sizeof(*info));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3236
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5104
;5104:	if ( trap_LAN_ServerStatus( serverAddress, info->text, sizeof(info->text)) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 2112
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 24
ADDRGP4 trap_LAN_ServerStatus
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $3411
line 5105
;5105:		Q_strncpyz(info->address, serverAddress, sizeof(info->address));
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5106
;5106:		p = info->text;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 2112
ADDP4
ASGNP4
line 5107
;5107:		info->numLines = 0;
ADDRFP4 4
INDIRP4
CNSTI4 3232
ADDP4
CNSTI4 0
ASGNI4
line 5108
;5108:		info->lines[info->numLines][0] = "Address";
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 28
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRGP4 $3382
ASGNP4
line 5109
;5109:		info->lines[info->numLines][1] = "";
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 4
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRGP4 $165
ASGNP4
line 5110
;5110:		info->lines[info->numLines][2] = "";
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 40
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $165
ASGNP4
line 5111
;5111:		info->lines[info->numLines][3] = info->address;
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 44
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 44
INDIRP4
ASGNP4
line 5112
;5112:		info->numLines++;
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 3232
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $3414
JUMPV
LABELV $3413
line 5114
;5113:		// get the cvars
;5114:		while (p && *p) {
line 5115
;5115:			p = strchr(p, '\\');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 52
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 52
INDIRP4
ASGNP4
line 5116
;5116:			if (!p) break;
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3416
ADDRGP4 $3415
JUMPV
LABELV $3416
line 5117
;5117:			*p++ = '\0';
ADDRLP4 56
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI1 0
ASGNI1
line 5118
;5118:			if (*p == '\\')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $3418
line 5119
;5119:				break;
ADDRGP4 $3415
JUMPV
LABELV $3418
line 5120
;5120:			info->lines[info->numLines][0] = p;
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 5121
;5121:			info->lines[info->numLines][1] = "";
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 4
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
LSHI4
ADDRLP4 64
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 68
INDIRI4
ADDP4
ADDRGP4 $165
ASGNP4
line 5122
;5122:			info->lines[info->numLines][2] = "";
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 72
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $165
ASGNP4
line 5123
;5123:			p = strchr(p, '\\');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 76
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 76
INDIRP4
ASGNP4
line 5124
;5124:			if (!p) break;
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3420
ADDRGP4 $3415
JUMPV
LABELV $3420
line 5125
;5125:			*p++ = '\0';
ADDRLP4 80
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 80
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI1 0
ASGNI1
line 5126
;5126:			info->lines[info->numLines][3] = p;
ADDRLP4 84
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 84
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 5128
;5127:
;5128:			info->numLines++;
ADDRLP4 88
ADDRFP4 4
INDIRP4
CNSTI4 3232
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5129
;5129:			if (info->numLines >= MAX_SERVERSTATUS_LINES)
ADDRFP4 4
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 128
LTI4 $3422
line 5130
;5130:				break;
ADDRGP4 $3415
JUMPV
LABELV $3422
line 5131
;5131:		}
LABELV $3414
line 5114
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3424
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3413
LABELV $3424
LABELV $3415
line 5133
;5132:		// get the player list
;5133:		if (info->numLines < MAX_SERVERSTATUS_LINES-3) {
ADDRFP4 4
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 125
GEI4 $3425
line 5135
;5134:			// empty line
;5135:			info->lines[info->numLines][0] = "";
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 56
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRGP4 $165
ASGNP4
line 5136
;5136:			info->lines[info->numLines][1] = "";
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
LSHI4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRGP4 $165
ASGNP4
line 5137
;5137:			info->lines[info->numLines][2] = "";
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 68
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $165
ASGNP4
line 5138
;5138:			info->lines[info->numLines][3] = "";
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 72
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRGP4 $165
ASGNP4
line 5139
;5139:			info->numLines++;
ADDRLP4 76
ADDRFP4 4
INDIRP4
CNSTI4 3232
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5141
;5140:			// header
;5141:			info->lines[info->numLines][0] = "num";
ADDRLP4 80
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 80
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRGP4 $3427
ASGNP4
line 5142
;5142:			info->lines[info->numLines][1] = "score";
ADDRLP4 84
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 88
CNSTI4 4
ASGNI4
ADDRLP4 84
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
LSHI4
ADDRLP4 84
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 88
INDIRI4
ADDP4
ADDRGP4 $3428
ASGNP4
line 5143
;5143:			info->lines[info->numLines][2] = "ping";
ADDRLP4 92
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 92
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $3429
ASGNP4
line 5144
;5144:			info->lines[info->numLines][3] = "name";
ADDRLP4 96
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 96
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRGP4 $2499
ASGNP4
line 5145
;5145:			info->numLines++;
ADDRLP4 100
ADDRFP4 4
INDIRP4
CNSTI4 3232
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5147
;5146:			// parse players
;5147:			i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 5148
;5148:			len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3431
JUMPV
LABELV $3430
line 5149
;5149:			while (p && *p) {
line 5150
;5150:				if (*p == '\\')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $3433
line 5151
;5151:					*p++ = '\0';
ADDRLP4 104
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 104
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI1 0
ASGNI1
LABELV $3433
line 5152
;5152:				if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3435
line 5153
;5153:					break;
ADDRGP4 $3432
JUMPV
LABELV $3435
line 5154
;5154:				score = p;
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
line 5155
;5155:				p = strchr(p, ' ');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 108
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 108
INDIRP4
ASGNP4
line 5156
;5156:				if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3437
line 5157
;5157:					break;
ADDRGP4 $3432
JUMPV
LABELV $3437
line 5158
;5158:				*p++ = '\0';
ADDRLP4 112
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 112
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI1 0
ASGNI1
line 5159
;5159:				ping = p;
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
line 5160
;5160:				p = strchr(p, ' ');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 116
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 116
INDIRP4
ASGNP4
line 5161
;5161:				if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3439
line 5162
;5162:					break;
ADDRGP4 $3432
JUMPV
LABELV $3439
line 5163
;5163:				*p++ = '\0';
ADDRLP4 120
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 120
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI1 0
ASGNI1
line 5164
;5164:				name = p;
ADDRLP4 20
ADDRLP4 0
INDIRP4
ASGNP4
line 5165
;5165:				Com_sprintf(&info->pings[len], sizeof(info->pings)-len, "%d", i);
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 3136
ADDP4
ADDP4
ARGP4
CNSTU4 96
ADDRLP4 4
INDIRI4
CVIU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 $702
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5166
;5166:				info->lines[info->numLines][0] = &info->pings[len];
ADDRLP4 128
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 128
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 128
INDIRP4
CNSTI4 3136
ADDP4
ADDP4
ASGNP4
line 5167
;5167:				len += strlen(&info->pings[len]) + 1;
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 3136
ADDP4
ADDP4
ARGP4
ADDRLP4 136
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ADDI4
ASGNI4
line 5168
;5168:				info->lines[info->numLines][1] = score;
ADDRLP4 140
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 144
CNSTI4 4
ASGNI4
ADDRLP4 140
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
ADDRLP4 144
INDIRI4
LSHI4
ADDRLP4 140
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 144
INDIRI4
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
line 5169
;5169:				info->lines[info->numLines][2] = ping;
ADDRLP4 148
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 148
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 5170
;5170:				info->lines[info->numLines][3] = name;
ADDRLP4 152
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 152
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 5171
;5171:				info->numLines++;
ADDRLP4 156
ADDRFP4 4
INDIRP4
CNSTI4 3232
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5172
;5172:				if (info->numLines >= MAX_SERVERSTATUS_LINES)
ADDRFP4 4
INDIRP4
CNSTI4 3232
ADDP4
INDIRI4
CNSTI4 128
LTI4 $3441
line 5173
;5173:					break;
ADDRGP4 $3432
JUMPV
LABELV $3441
line 5174
;5174:				p = strchr(p, '\\');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 160
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 160
INDIRP4
ASGNP4
line 5175
;5175:				if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3443
line 5176
;5176:					break;
ADDRGP4 $3432
JUMPV
LABELV $3443
line 5177
;5177:				*p++ = '\0';
ADDRLP4 164
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 164
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
CNSTI1 0
ASGNI1
line 5179
;5178:				//
;5179:				i++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5180
;5180:			}
LABELV $3431
line 5149
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3445
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3430
LABELV $3445
LABELV $3432
line 5181
;5181:		}
LABELV $3425
line 5182
;5182:		UI_SortServerStatusInfo( info );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 UI_SortServerStatusInfo
CALLV
pop
line 5183
;5183:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3408
JUMPV
LABELV $3411
line 5185
;5184:	}
;5185:	return qfalse;
CNSTI4 0
RETI4
LABELV $3408
endproc UI_GetServerStatusInfo 168 16
proc stristr 12 4
line 5193
;5186:}
;5187:
;5188:/*
;5189:==================
;5190:stristr
;5191:==================
;5192:*/
;5193:static char *stristr(char *str, char *charset) {
ADDRGP4 $3448
JUMPV
LABELV $3447
line 5196
;5194:	int i;
;5195:
;5196:	while(*str) {
line 5197
;5197:		for (i = 0; charset[i] && str[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3453
JUMPV
LABELV $3450
line 5198
;5198:			if (toupper(charset[i]) != toupper(str[i])) break;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $3454
ADDRGP4 $3452
JUMPV
LABELV $3454
line 5199
;5199:		}
LABELV $3451
line 5197
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3453
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
EQI4 $3456
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
NEI4 $3450
LABELV $3456
LABELV $3452
line 5200
;5200:		if (!charset[i]) return str;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3457
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $3446
JUMPV
LABELV $3457
line 5201
;5201:		str++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 5202
;5202:	}
LABELV $3448
line 5196
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3447
line 5203
;5203:	return NULL;
CNSTP4 0
RETP4
LABELV $3446
endproc stristr 12 4
bss
align 4
LABELV $3460
skip 4
align 4
LABELV $3461
skip 4
code
proc UI_BuildFindPlayerList 4328 24
line 5211
;5204:}
;5205:
;5206:/*
;5207:==================
;5208:UI_BuildFindPlayerList
;5209:==================
;5210:*/
;5211:static void UI_BuildFindPlayerList(qboolean force) {
line 5218
;5212:	static int numFound, numTimeOuts;
;5213:	int i, j, resend;
;5214:	serverStatusInfo_t info;
;5215:	char name[MAX_NAME_LENGTH+2];
;5216:	char infoString[MAX_STRING_CHARS];
;5217:
;5218:	if (!force) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $3462
line 5219
;5219:		if (!uiInfo.nextFindPlayerRefresh || uiInfo.nextFindPlayerRefresh > uiInfo.uiDC.realTime) {
ADDRGP4 uiInfo+60852
INDIRI4
CNSTI4 0
EQI4 $3469
ADDRGP4 uiInfo+60852
INDIRI4
ADDRGP4 uiInfo+240
INDIRI4
LEI4 $3463
LABELV $3469
line 5220
;5220:			return;
ADDRGP4 $3459
JUMPV
line 5222
;5221:		}
;5222:	}
LABELV $3462
line 5223
;5223:	else {
line 5224
;5224:		memset(&uiInfo.pendingServerStatus, 0, sizeof(uiInfo.pendingServerStatus));
ADDRGP4 uiInfo+55528
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2244
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5225
;5225:		uiInfo.numFoundPlayerServers = 0;
ADDRGP4 uiInfo+60848
CNSTI4 0
ASGNI4
line 5226
;5226:		uiInfo.currentFoundPlayerServer = 0;
ADDRGP4 uiInfo+60844
CNSTI4 0
ASGNI4
line 5227
;5227:		trap_Cvar_VariableStringBuffer( "ui_findPlayer", uiInfo.findPlayerName, sizeof(uiInfo.findPlayerName));
ADDRGP4 $3474
ARGP4
ADDRGP4 uiInfo+57772
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5228
;5228:		Q_CleanStr(uiInfo.findPlayerName);
ADDRGP4 uiInfo+57772
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 5230
;5229:		// should have a string of some length
;5230:		if (!strlen(uiInfo.findPlayerName)) {
ADDRGP4 uiInfo+57772
ARGP4
ADDRLP4 4308
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4308
INDIRI4
CNSTI4 0
NEI4 $3478
line 5231
;5231:			uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+60852
CNSTI4 0
ASGNI4
line 5232
;5232:			return;
ADDRGP4 $3459
JUMPV
LABELV $3478
line 5235
;5233:		}
;5234:		// set resend time
;5235:		resend = ui_serverStatusTimeOut.integer / 2 - 10;
ADDRLP4 4304
ADDRGP4 ui_serverStatusTimeOut+12
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 10
SUBI4
ASGNI4
line 5236
;5236:		if (resend < 50) {
ADDRLP4 4304
INDIRI4
CNSTI4 50
GEI4 $3483
line 5237
;5237:			resend = 50;
ADDRLP4 4304
CNSTI4 50
ASGNI4
line 5238
;5238:		}
LABELV $3483
line 5239
;5239:		trap_Cvar_Set("cl_serverStatusResendTime", va("%d", resend));
ADDRGP4 $702
ARGP4
ADDRLP4 4304
INDIRI4
ARGI4
ADDRLP4 4312
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $3485
ARGP4
ADDRLP4 4312
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5241
;5240:		// reset all server status requests
;5241:		trap_LAN_ServerStatus( NULL, NULL, 0);
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_ServerStatus
CALLI4
pop
line 5243
;5242:		//
;5243:		uiInfo.numFoundPlayerServers = 1;
ADDRGP4 uiInfo+60848
CNSTI4 1
ASGNI4
line 5244
;5244:		Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+59820-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3493
ARGP4
ADDRGP4 uiInfo+55528
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5247
;5245:						sizeof(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1]),
;5246:							"searching %d...", uiInfo.pendingServerStatus.num);
;5247:		numFound = 0;
ADDRGP4 $3460
CNSTI4 0
ASGNI4
line 5248
;5248:		numTimeOuts++;
ADDRLP4 4316
ADDRGP4 $3461
ASGNP4
ADDRLP4 4316
INDIRP4
ADDRLP4 4316
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5249
;5249:	}
LABELV $3463
line 5250
;5250:	for (i = 0; i < MAX_SERVERSTATUSREQUESTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $3495
line 5252
;5251:		// if this pending server is valid
;5252:		if (uiInfo.pendingServerStatus.server[i].valid) {
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3499
line 5254
;5253:			// try to get the server status for this server
;5254:			if (UI_GetServerStatusInfo( uiInfo.pendingServerStatus.server[i].adrstr, &info ) ) {
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 4308
ADDRGP4 UI_GetServerStatusInfo
CALLI4
ASGNI4
ADDRLP4 4308
INDIRI4
CNSTI4 0
EQI4 $3504
line 5256
;5255:				//
;5256:				numFound++;
ADDRLP4 4312
ADDRGP4 $3460
ASGNP4
ADDRLP4 4312
INDIRP4
ADDRLP4 4312
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5258
;5257:				// parse through the server status lines
;5258:				for (j = 0; j < info.numLines; j++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3511
JUMPV
LABELV $3508
line 5260
;5259:					// should have ping info
;5260:					if ( !info.lines[j][2] || !info.lines[j][2][0] ) {
ADDRLP4 4316
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
ADDRLP4 4316
INDIRI4
ADDRLP4 8+64+8
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3519
ADDRLP4 4316
INDIRI4
ADDRLP4 8+64+8
ADDP4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3513
LABELV $3519
line 5261
;5261:						continue;
ADDRGP4 $3509
JUMPV
LABELV $3513
line 5264
;5262:					}
;5263:					// clean string first
;5264:					Q_strncpyz(name, info.lines[j][3], sizeof(name));
ADDRLP4 3244
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 8+64+12
ADDP4
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5265
;5265:					Q_CleanStr(name);
ADDRLP4 3244
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 5267
;5266:					// if the player name is a substring
;5267:					if (stristr(name, uiInfo.findPlayerName)) {
ADDRLP4 3244
ARGP4
ADDRGP4 uiInfo+57772
ARGP4
ADDRLP4 4320
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 4320
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3522
line 5269
;5268:						// add to found server list if we have space (always leave space for a line with the number found)
;5269:						if (uiInfo.numFoundPlayerServers < MAX_FOUNDPLAYER_SERVERS-1) {
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 15
GEI4 $3525
line 5271
;5270:							//
;5271:							Q_strncpyz(uiInfo.foundPlayerServerAddresses[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+58796-64
ADDP4
ARGP4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5274
;5272:										uiInfo.pendingServerStatus.server[i].adrstr,
;5273:											sizeof(uiInfo.foundPlayerServerAddresses[0]));
;5274:							Q_strncpyz(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+59820-64
ADDP4
ARGP4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4+64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5277
;5275:										uiInfo.pendingServerStatus.server[i].name,
;5276:											sizeof(uiInfo.foundPlayerServerNames[0]));
;5277:							uiInfo.numFoundPlayerServers++;
ADDRLP4 4324
ADDRGP4 uiInfo+60848
ASGNP4
ADDRLP4 4324
INDIRP4
ADDRLP4 4324
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5278
;5278:						}
ADDRGP4 $3526
JUMPV
LABELV $3525
line 5279
;5279:						else {
line 5281
;5280:							// can't add any more so we're done
;5281:							uiInfo.pendingServerStatus.num = uiInfo.serverStatus.numDisplayServers;
ADDRGP4 uiInfo+55528
ADDRGP4 uiInfo+40740+10412
INDIRI4
ASGNI4
line 5282
;5282:						}
LABELV $3526
line 5283
;5283:					}
LABELV $3522
line 5284
;5284:				}
LABELV $3509
line 5258
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3511
ADDRLP4 4
INDIRI4
ADDRLP4 8+3232
INDIRI4
LTI4 $3508
line 5285
;5285:				Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+59820-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3551
ARGP4
ADDRGP4 uiInfo+55528
INDIRI4
ARGI4
ADDRGP4 $3460
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5289
;5286:								sizeof(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1]),
;5287:									"searching %d/%d...", uiInfo.pendingServerStatus.num, numFound);
;5288:				// retrieved the server status so reuse this spot
;5289:				uiInfo.pendingServerStatus.server[i].valid = qfalse;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4+136
ADDP4
CNSTI4 0
ASGNI4
line 5290
;5290:			}
LABELV $3504
line 5291
;5291:		}
LABELV $3499
line 5293
;5292:		// if empty pending slot or timed out
;5293:		if (!uiInfo.pendingServerStatus.server[i].valid ||
ADDRLP4 4308
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4308
INDIRI4
ADDRGP4 uiInfo+55528+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3566
ADDRLP4 4308
INDIRI4
ADDRGP4 uiInfo+55528+4+128
ADDP4
INDIRI4
ADDRGP4 uiInfo+240
INDIRI4
ADDRGP4 ui_serverStatusTimeOut+12
INDIRI4
SUBI4
GEI4 $3556
LABELV $3566
line 5294
;5294:			uiInfo.pendingServerStatus.server[i].startTime < uiInfo.uiDC.realTime - ui_serverStatusTimeOut.integer) {
line 5295
;5295:			if (uiInfo.pendingServerStatus.server[i].valid) {
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3567
line 5296
;5296:				numTimeOuts++;
ADDRLP4 4312
ADDRGP4 $3461
ASGNP4
ADDRLP4 4312
INDIRP4
ADDRLP4 4312
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5297
;5297:			}
LABELV $3567
line 5299
;5298:			// reset server status request for this address
;5299:			UI_GetServerStatusInfo( uiInfo.pendingServerStatus.server[i].adrstr, NULL );
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4
ADDP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 UI_GetServerStatusInfo
CALLI4
pop
line 5301
;5300:			// reuse pending slot
;5301:			uiInfo.pendingServerStatus.server[i].valid = qfalse;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4+136
ADDP4
CNSTI4 0
ASGNI4
line 5303
;5302:			// if we didn't try to get the status of all servers in the main browser yet
;5303:			if (uiInfo.pendingServerStatus.num < uiInfo.serverStatus.numDisplayServers) {
ADDRGP4 uiInfo+55528
INDIRI4
ADDRGP4 uiInfo+40740+10412
INDIRI4
GEI4 $3577
line 5304
;5304:				uiInfo.pendingServerStatus.server[i].startTime = uiInfo.uiDC.realTime;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4+128
ADDP4
ADDRGP4 uiInfo+240
INDIRI4
ASGNI4
line 5305
;5305:				trap_LAN_GetServerAddressString(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.pendingServerStatus.num],
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+55528
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
INDIRI4
ARGI4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 5307
;5306:							uiInfo.pendingServerStatus.server[i].adrstr, sizeof(uiInfo.pendingServerStatus.server[i].adrstr));
;5307:				trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.pendingServerStatus.num], infoString, sizeof(infoString));
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+55528
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 3278
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 5308
;5308:				Q_strncpyz(uiInfo.pendingServerStatus.server[i].name, Info_ValueForKey(infoString, "hostname"), sizeof(uiInfo.pendingServerStatus.server[0].name));
ADDRLP4 3278
ARGP4
ADDRGP4 $2938
ARGP4
ADDRLP4 4312
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4+64
ADDP4
ARGP4
ADDRLP4 4312
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5309
;5309:				uiInfo.pendingServerStatus.server[i].valid = qtrue;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4+136
ADDP4
CNSTI4 1
ASGNI4
line 5310
;5310:				uiInfo.pendingServerStatus.num++;
ADDRLP4 4316
ADDRGP4 uiInfo+55528
ASGNP4
ADDRLP4 4316
INDIRP4
ADDRLP4 4316
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5311
;5311:				Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+59820-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3551
ARGP4
ADDRGP4 uiInfo+55528
INDIRI4
ARGI4
ADDRGP4 $3460
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5314
;5312:								sizeof(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1]),
;5313:									"searching %d/%d...", uiInfo.pendingServerStatus.num, numFound);
;5314:			}
LABELV $3577
line 5315
;5315:		}
LABELV $3556
line 5316
;5316:	}
LABELV $3496
line 5250
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $3495
line 5317
;5317:	for (i = 0; i < MAX_SERVERSTATUSREQUESTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $3615
line 5318
;5318:		if (uiInfo.pendingServerStatus.server[i].valid) {
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+55528+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3619
line 5319
;5319:			break;
ADDRGP4 $3617
JUMPV
LABELV $3619
line 5321
;5320:		}
;5321:	}
LABELV $3616
line 5317
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $3615
LABELV $3617
line 5323
;5322:	// if still trying to retrieve server status info
;5323:	if (i < MAX_SERVERSTATUSREQUESTS) {
ADDRLP4 0
INDIRI4
CNSTI4 16
GEI4 $3624
line 5324
;5324:		uiInfo.nextFindPlayerRefresh = uiInfo.uiDC.realTime + 25;
ADDRGP4 uiInfo+60852
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
line 5325
;5325:	}
ADDRGP4 $3625
JUMPV
LABELV $3624
line 5326
;5326:	else {
line 5328
;5327:		// add a line that shows the number of servers found
;5328:		if (!uiInfo.numFoundPlayerServers) 
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 0
NEI4 $3628
line 5329
;5329:		{
line 5330
;5330:			Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1], sizeof(uiInfo.foundPlayerServerAddresses[0]), "no servers found");
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+59820-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3635
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5331
;5331:		}
ADDRGP4 $3629
JUMPV
LABELV $3628
line 5333
;5332:		else 
;5333:		{
line 5334
;5334:			trap_SP_GetStringTextString("MENUS3_SERVERS_FOUNDWITH", holdSPString, sizeof(holdSPString));
ADDRGP4 $3636
ARGP4
ADDRGP4 holdSPString
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 5335
;5335:			Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1], sizeof(uiInfo.foundPlayerServerAddresses[0]),
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+59820-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 holdSPString
ARGP4
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 2
NEI4 $3646
ADDRLP4 4308
ADDRGP4 $165
ASGNP4
ADDRGP4 $3647
JUMPV
LABELV $3646
ADDRLP4 4308
ADDRGP4 $3643
ASGNP4
LABELV $3647
ADDRLP4 4308
INDIRP4
ARGP4
ADDRGP4 uiInfo+57772
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5338
;5336:						holdSPString, uiInfo.numFoundPlayerServers-1,
;5337:						uiInfo.numFoundPlayerServers == 2 ? "":"s", uiInfo.findPlayerName);
;5338:		}
LABELV $3629
line 5339
;5339:		uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+60852
CNSTI4 0
ASGNI4
line 5341
;5340:		// show the server status info for the selected server
;5341:		UI_FeederSelection(FEEDER_FINDPLAYER, uiInfo.currentFoundPlayerServer);
CNSTF4 1096810496
ARGF4
ADDRGP4 uiInfo+60844
INDIRI4
ARGI4
ADDRGP4 UI_FeederSelection
CALLI4
pop
line 5342
;5342:	}
LABELV $3625
line 5343
;5343:}
LABELV $3459
endproc UI_BuildFindPlayerList 4328 24
proc UI_BuildServerStatus 8 16
line 5350
;5344:
;5345:/*
;5346:==================
;5347:UI_BuildServerStatus
;5348:==================
;5349:*/
;5350:static void UI_BuildServerStatus(qboolean force) {
line 5352
;5351:
;5352:	if (uiInfo.nextFindPlayerRefresh) {
ADDRGP4 uiInfo+60852
INDIRI4
CNSTI4 0
EQI4 $3651
line 5353
;5353:		return;
ADDRGP4 $3650
JUMPV
LABELV $3651
line 5355
;5354:	}
;5355:	if (!force) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $3654
line 5356
;5356:		if (!uiInfo.nextServerStatusRefresh || uiInfo.nextServerStatusRefresh > uiInfo.uiDC.realTime) {
ADDRGP4 uiInfo+55524
INDIRI4
CNSTI4 0
EQI4 $3661
ADDRGP4 uiInfo+55524
INDIRI4
ADDRGP4 uiInfo+240
INDIRI4
LEI4 $3655
LABELV $3661
line 5357
;5357:			return;
ADDRGP4 $3650
JUMPV
line 5359
;5358:		}
;5359:	}
LABELV $3654
line 5360
;5360:	else {
line 5361
;5361:		Menu_SetFeederSelection(NULL, FEEDER_SERVERSTATUS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 5362
;5362:		uiInfo.serverStatusInfo.numLines = 0;
ADDRGP4 uiInfo+52288+3232
CNSTI4 0
ASGNI4
line 5364
;5363:		// reset all server status requests
;5364:		trap_LAN_ServerStatus( NULL, NULL, 0);
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_ServerStatus
CALLI4
pop
line 5365
;5365:	}
LABELV $3655
line 5366
;5366:	if (uiInfo.serverStatus.currentServer < 0 || uiInfo.serverStatus.currentServer > uiInfo.serverStatus.numDisplayServers || uiInfo.serverStatus.numDisplayServers == 0) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 uiInfo+40740+2216
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $3675
ADDRGP4 uiInfo+40740+2216
INDIRI4
ADDRGP4 uiInfo+40740+10412
INDIRI4
GTI4 $3675
ADDRGP4 uiInfo+40740+10412
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $3664
LABELV $3675
line 5367
;5367:		return;
ADDRGP4 $3650
JUMPV
LABELV $3664
line 5369
;5368:	}
;5369:	if (UI_GetServerStatusInfo( uiInfo.serverStatusAddress, &uiInfo.serverStatusInfo ) ) {
ADDRGP4 uiInfo+52224
ARGP4
ADDRGP4 uiInfo+52288
ARGP4
ADDRLP4 4
ADDRGP4 UI_GetServerStatusInfo
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $3676
line 5370
;5370:		uiInfo.nextServerStatusRefresh = 0;
ADDRGP4 uiInfo+55524
CNSTI4 0
ASGNI4
line 5371
;5371:		UI_GetServerStatusInfo( uiInfo.serverStatusAddress, NULL );
ADDRGP4 uiInfo+52224
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 UI_GetServerStatusInfo
CALLI4
pop
line 5372
;5372:	}
ADDRGP4 $3677
JUMPV
LABELV $3676
line 5373
;5373:	else {
line 5374
;5374:		uiInfo.nextServerStatusRefresh = uiInfo.uiDC.realTime + 500;
ADDRGP4 uiInfo+55524
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 5375
;5375:	}
LABELV $3677
line 5376
;5376:}
LABELV $3650
endproc UI_BuildServerStatus 8 16
proc UI_FeederCount 20 4
line 5384
;5377:
;5378:/*
;5379:==================
;5380:UI_FeederCount
;5381:==================
;5382:*/
;5383:static int UI_FeederCount(float feederID) 
;5384:{
line 5385
;5385:	switch ( (int)feederID )
ADDRLP4 0
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $3685
ADDRLP4 0
INDIRI4
CNSTI4 16
GTI4 $3685
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $3729-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $3729
address $3697
address $3701
address $3685
address $3697
address $3685
address $3685
address $3709
address $3717
address $3725
address $3727
address $3685
address $3688
address $3704
address $3707
address $3695
address $3689
code
line 5386
;5386:	{
LABELV $3688
line 5391
;5387://		case FEEDER_HEADS:
;5388://			return UI_HeadCountByTeam();
;5389:
;5390:		case FEEDER_Q3HEADS:
;5391:			return UI_HeadCountByColor();
ADDRLP4 8
ADDRGP4 UI_HeadCountByColor
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3689
line 5394
;5392:
;5393:		case FEEDER_FORCECFG:
;5394:			if (uiForceSide == FORCE_LIGHTSIDE)
ADDRGP4 uiForceSide
INDIRI4
CNSTI4 1
NEI4 $3690
line 5395
;5395:			{
line 5396
;5396:				return uiInfo.forceConfigCount-uiInfo.forceConfigLightIndexBegin;
ADDRGP4 uiInfo+78284
INDIRI4
ADDRGP4 uiInfo+95192
INDIRI4
SUBI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3690
line 5399
;5397:			}
;5398:			else
;5399:			{
line 5400
;5400:				return uiInfo.forceConfigLightIndexBegin+1;
ADDRGP4 uiInfo+95192
INDIRI4
CNSTI4 1
ADDI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3695
line 5405
;5401:			}
;5402:			//return uiInfo.forceConfigCount;
;5403:
;5404:		case FEEDER_CINEMATICS:
;5405:			return uiInfo.movieCount;
ADDRGP4 uiInfo+36372
INDIRI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3697
line 5409
;5406:
;5407:		case FEEDER_MAPS:
;5408:		case FEEDER_ALLMAPS:
;5409:			return UI_MapCountByGameType(feederID == FEEDER_MAPS ? qtrue : qfalse);
ADDRFP4 0
INDIRF4
CNSTF4 1065353216
NEF4 $3699
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $3700
JUMPV
LABELV $3699
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $3700
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 UI_MapCountByGameType
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3701
line 5412
;5410:	
;5411:		case FEEDER_SERVERS:
;5412:			return uiInfo.serverStatus.numDisplayServers;
ADDRGP4 uiInfo+40740+10412
INDIRI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3704
line 5415
;5413:	
;5414:		case FEEDER_SERVERSTATUS:
;5415:			return uiInfo.serverStatusInfo.numLines;
ADDRGP4 uiInfo+52288+3232
INDIRI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3707
line 5418
;5416:	
;5417:		case FEEDER_FINDPLAYER:
;5418:			return uiInfo.numFoundPlayerServers;
ADDRGP4 uiInfo+60848
INDIRI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3709
line 5421
;5419:
;5420:		case FEEDER_PLAYER_LIST:
;5421:			if (uiInfo.uiDC.realTime > uiInfo.playerRefresh) 
ADDRGP4 uiInfo+240
INDIRI4
ADDRGP4 uiInfo+18024
INDIRI4
LEI4 $3710
line 5422
;5422:			{
line 5423
;5423:				uiInfo.playerRefresh = uiInfo.uiDC.realTime + 3000;
ADDRGP4 uiInfo+18024
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 5424
;5424:				UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 5425
;5425:			}
LABELV $3710
line 5426
;5426:			return uiInfo.playerCount;
ADDRGP4 uiInfo+18012
INDIRI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3717
line 5429
;5427:
;5428:		case FEEDER_TEAM_LIST:
;5429:			if (uiInfo.uiDC.realTime > uiInfo.playerRefresh) 
ADDRGP4 uiInfo+240
INDIRI4
ADDRGP4 uiInfo+18024
INDIRI4
LEI4 $3718
line 5430
;5430:			{
line 5431
;5431:				uiInfo.playerRefresh = uiInfo.uiDC.realTime + 3000;
ADDRGP4 uiInfo+18024
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 5432
;5432:				UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 5433
;5433:			}
LABELV $3718
line 5434
;5434:			return uiInfo.myTeamCount;
ADDRGP4 uiInfo+18016
INDIRI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3725
line 5437
;5435:
;5436:		case FEEDER_MODS:
;5437:			return uiInfo.modCount;
ADDRGP4 uiInfo+34308
INDIRI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3727
line 5440
;5438:	
;5439:		case FEEDER_DEMOS:
;5440:			return uiInfo.demoCount;
ADDRGP4 uiInfo+35340
INDIRI4
RETI4
ADDRGP4 $3684
JUMPV
LABELV $3685
line 5443
;5441:	}
;5442:
;5443:	return 0;
CNSTI4 0
RETI4
LABELV $3684
endproc UI_FeederCount 20 4
proc UI_SelectedMap 8 0
line 5446
;5444:}
;5445:
;5446:static const char *UI_SelectedMap(int index, int *actual) {
line 5448
;5447:	int i, c;
;5448:	c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 5449
;5449:	*actual = 0;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 5451
;5450:
;5451:	for (i = 0; i < uiInfo.mapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3735
JUMPV
LABELV $3732
line 5452
;5452:		if (uiInfo.mapList[i].active) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+96
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3737
line 5453
;5453:			if (c == index) {
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3741
line 5454
;5454:				*actual = i;
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 5455
;5455:				return uiInfo.mapList[i].mapName;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348
ADDP4
INDIRP4
RETP4
ADDRGP4 $3731
JUMPV
LABELV $3741
line 5456
;5456:			} else {
line 5457
;5457:				c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5458
;5458:			}
line 5459
;5459:		}
LABELV $3737
line 5460
;5460:	}
LABELV $3733
line 5451
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3735
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
LTI4 $3732
line 5461
;5461:	return "";
ADDRGP4 $165
RETP4
LABELV $3731
endproc UI_SelectedMap 8 0
proc UI_SelectedHead 8 0
line 5464
;5462:}
;5463:
;5464:static const char *UI_SelectedHead(int index, int *actual) {
line 5466
;5465:	int i, c;
;5466:	c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 5467
;5467:	*actual = 0;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 5468
;5468:	for (i = 0; i < uiInfo.characterCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3748
JUMPV
LABELV $3745
line 5469
;5469:		if (uiInfo.characterList[i].active) {
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3750
line 5470
;5470:			if (c == index) {
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3754
line 5471
;5471:				*actual = i;
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 5472
;5472:				return uiInfo.characterList[i].name;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+11848
ADDP4
INDIRP4
RETP4
ADDRGP4 $3744
JUMPV
LABELV $3754
line 5473
;5473:			} else {
line 5474
;5474:				c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5475
;5475:			}
line 5476
;5476:		}
LABELV $3750
line 5477
;5477:	}
LABELV $3746
line 5468
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3748
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+11840
INDIRI4
LTI4 $3745
line 5478
;5478:	return "";
ADDRGP4 $165
RETP4
LABELV $3744
endproc UI_SelectedHead 8 0
proc UI_SelectedTeamHead 24 8
line 5486
;5479:}
;5480:
;5481:/*
;5482:==================
;5483:UI_HeadCountByColor
;5484:==================
;5485:*/
;5486:static const char *UI_SelectedTeamHead(int index, int *actual) {
line 5488
;5487:	char *teamname;
;5488:	int i,c=0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 5490
;5489:
;5490:	switch(uiSkinColor)
ADDRLP4 12
ADDRGP4 uiSkinColor
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $3761
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $3760
ADDRGP4 $3758
JUMPV
line 5491
;5491:	{
LABELV $3760
line 5493
;5492:		case TEAM_BLUE:
;5493:			teamname = "/blue";
ADDRLP4 4
ADDRGP4 $3192
ASGNP4
line 5494
;5494:			break;
ADDRGP4 $3759
JUMPV
LABELV $3761
line 5496
;5495:		case TEAM_RED:
;5496:			teamname = "/red";
ADDRLP4 4
ADDRGP4 $3194
ASGNP4
line 5497
;5497:			break;
ADDRGP4 $3759
JUMPV
LABELV $3758
line 5499
;5498:		default:
;5499:			teamname = "/default";
ADDRLP4 4
ADDRGP4 $3195
ASGNP4
line 5500
;5500:			break;
LABELV $3759
line 5505
;5501:	}
;5502:
;5503:	// Count each head with this color
;5504:
;5505:	for (i=0; i<uiInfo.q3HeadCount; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3765
JUMPV
LABELV $3762
line 5506
;5506:	{
line 5507
;5507:		if (uiInfo.q3HeadNames[i] && strstr(uiInfo.q3HeadNames[i], teamname))
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+60872
ADDP4
CVPU4 4
CNSTU4 0
EQU4 $3767
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+60872
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3767
line 5508
;5508:		{
line 5509
;5509:			if (c==index)
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3771
line 5510
;5510:			{
line 5511
;5511:				*actual = i;
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 5512
;5512:				return uiInfo.q3HeadNames[i];
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60872
ADDP4
RETP4
ADDRGP4 $3757
JUMPV
LABELV $3771
line 5515
;5513:			}
;5514:			else
;5515:			{
line 5516
;5516:				c++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5517
;5517:			}
line 5518
;5518:		}
LABELV $3767
line 5519
;5519:	}
LABELV $3763
line 5505
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3765
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+60868
INDIRI4
LTI4 $3762
line 5520
;5520:	return "";
ADDRGP4 $165
RETP4
LABELV $3757
endproc UI_SelectedTeamHead 24 8
proc UI_GetIndexFromSelection 8 0
line 5524
;5521:}
;5522:
;5523:
;5524:static int UI_GetIndexFromSelection(int actual) {
line 5526
;5525:	int i, c;
;5526:	c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 5527
;5527:	for (i = 0; i < uiInfo.mapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3778
JUMPV
LABELV $3775
line 5528
;5528:		if (uiInfo.mapList[i].active) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+96
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3780
line 5529
;5529:			if (i == actual) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3784
line 5530
;5530:				return c;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $3774
JUMPV
LABELV $3784
line 5532
;5531:			}
;5532:				c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5533
;5533:		}
LABELV $3780
line 5534
;5534:	}
LABELV $3776
line 5527
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3778
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
LTI4 $3775
line 5535
;5535:  return 0;
CNSTI4 0
RETI4
LABELV $3774
endproc UI_GetIndexFromSelection 8 0
proc UI_UpdatePendingPings 0 4
line 5538
;5536:}
;5537:
;5538:static void UI_UpdatePendingPings() { 
line 5539
;5539:	trap_LAN_ResetPings(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ResetPings
CALLV
pop
line 5540
;5540:	uiInfo.serverStatus.refreshActive = qtrue;
ADDRGP4 uiInfo+40740+2212
CNSTI4 1
ASGNI4
line 5541
;5541:	uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+40740+2192
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 5543
;5542:
;5543:}
LABELV $3786
endproc UI_UpdatePendingPings 0 4
bss
align 1
LABELV $3794
skip 1024
align 1
LABELV $3795
skip 1024
align 1
LABELV $3796
skip 32
align 1
LABELV $3797
skip 32
data
align 4
LABELV $3798
byte 4 -1
align 4
LABELV $3799
byte 4 0
code
proc UI_FeederItemText 112 20
line 5546
;5544:
;5545:static const char *UI_FeederItemText(float feederID, int index, int column, 
;5546:									 qhandle_t *handle1, qhandle_t *handle2, qhandle_t *handle3) {
line 5553
;5547:	static char info[MAX_STRING_CHARS];
;5548:	static char hostname[1024];
;5549:	static char clientBuff[32];
;5550:	static char needPass[32];
;5551:	static int lastColumn = -1;
;5552:	static int lastTime = 0;
;5553:	*handle1 = *handle2 = *handle3 = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 5554
;5554:	if (feederID == FEEDER_HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $3800
line 5556
;5555:		int actual;
;5556:		return UI_SelectedHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 UI_SelectedHead
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3800
line 5557
;5557:	} else if (feederID == FEEDER_Q3HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $3802
line 5559
;5558:		int actual;
;5559:		return UI_SelectedTeamHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 UI_SelectedTeamHead
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3802
line 5560
;5560:	} else if (feederID == FEEDER_FORCECFG) {
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
NEF4 $3804
line 5561
;5561:		if (index >= 0 && index < uiInfo.forceConfigCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3805
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78284
INDIRI4
GEI4 $3805
line 5562
;5562:			if (index == 0)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $3809
line 5563
;5563:			{ //always show "custom"
line 5564
;5564:				return uiInfo.forceConfigNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 uiInfo+78292
ADDP4
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3809
line 5567
;5565:			}
;5566:			else
;5567:			{
line 5568
;5568:				if (uiForceSide == FORCE_LIGHTSIDE)
ADDRGP4 uiForceSide
INDIRI4
CNSTI4 1
NEI4 $3812
line 5569
;5569:				{
line 5570
;5570:					index += uiInfo.forceConfigLightIndexBegin;
ADDRFP4 4
ADDRFP4 4
INDIRI4
ADDRGP4 uiInfo+95192
INDIRI4
ADDI4
ASGNI4
line 5571
;5571:					if (index < 0)
ADDRFP4 4
INDIRI4
CNSTI4 0
GEI4 $3815
line 5572
;5572:					{
line 5573
;5573:						return NULL;
CNSTP4 0
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3815
line 5575
;5574:					}
;5575:					if (index >= uiInfo.forceConfigCount)
ADDRFP4 4
INDIRI4
ADDRGP4 uiInfo+78284
INDIRI4
LTI4 $3817
line 5576
;5576:					{
line 5577
;5577:						return NULL;
CNSTP4 0
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3817
line 5579
;5578:					}
;5579:					return uiInfo.forceConfigNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 uiInfo+78292
ADDP4
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3812
line 5581
;5580:				}
;5581:				else if (uiForceSide == FORCE_DARKSIDE)
ADDRGP4 uiForceSide
INDIRI4
CNSTI4 2
NEI4 $3821
line 5582
;5582:				{
line 5583
;5583:					index += uiInfo.forceConfigDarkIndexBegin;
ADDRFP4 4
ADDRFP4 4
INDIRI4
ADDRGP4 uiInfo+95188
INDIRI4
ADDI4
ASGNI4
line 5584
;5584:					if (index < 0)
ADDRFP4 4
INDIRI4
CNSTI4 0
GEI4 $3824
line 5585
;5585:					{
line 5586
;5586:						return NULL;
CNSTP4 0
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3824
line 5588
;5587:					}
;5588:					if (index > uiInfo.forceConfigLightIndexBegin)
ADDRFP4 4
INDIRI4
ADDRGP4 uiInfo+95192
INDIRI4
LEI4 $3826
line 5589
;5589:					{ //dark gets read in before light
line 5590
;5590:						return NULL;
CNSTP4 0
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3826
line 5592
;5591:					}
;5592:					if (index >= uiInfo.forceConfigCount)
ADDRFP4 4
INDIRI4
ADDRGP4 uiInfo+78284
INDIRI4
LTI4 $3829
line 5593
;5593:					{
line 5594
;5594:						return NULL;
CNSTP4 0
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3829
line 5596
;5595:					}
;5596:					return uiInfo.forceConfigNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 uiInfo+78292
ADDP4
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3821
line 5599
;5597:				}
;5598:				else
;5599:				{
line 5600
;5600:					return NULL;
CNSTP4 0
RETP4
ADDRGP4 $3793
JUMPV
line 5604
;5601:				}
;5602:			}
;5603:		}
;5604:	} else if (feederID == FEEDER_MAPS || feederID == FEEDER_ALLMAPS) {
LABELV $3804
ADDRLP4 4
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
EQF4 $3835
ADDRLP4 4
INDIRF4
CNSTF4 1082130432
NEF4 $3833
LABELV $3835
line 5606
;5605:		int actual;
;5606:		return UI_SelectedMap(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 12
ADDRGP4 UI_SelectedMap
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3833
line 5607
;5607:	} else if (feederID == FEEDER_SERVERS) {
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
NEF4 $3836
line 5608
;5608:		if (index >= 0 && index < uiInfo.serverStatus.numDisplayServers) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $3837
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+40740+10412
INDIRI4
GEI4 $3837
line 5610
;5609:			int ping, game;
;5610:			if (lastColumn != column || lastTime > uiInfo.uiDC.realTime + 5000) {
ADDRGP4 $3798
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $3845
ADDRGP4 $3799
INDIRI4
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 5000
ADDI4
LEI4 $3842
LABELV $3845
line 5611
;5611:				trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[index], info, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
INDIRI4
ARGI4
ADDRGP4 $3794
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 5612
;5612:				lastColumn = column;
ADDRGP4 $3798
ADDRFP4 8
INDIRI4
ASGNI4
line 5613
;5613:				lastTime = uiInfo.uiDC.realTime;
ADDRGP4 $3799
ADDRGP4 uiInfo+240
INDIRI4
ASGNI4
line 5614
;5614:			}
LABELV $3842
line 5615
;5615:			ping = atoi(Info_ValueForKey(info, "ping"));
ADDRGP4 $3794
ARGP4
ADDRGP4 $3429
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 5616
;5616:			if (ping == -1) {
ADDRLP4 12
INDIRI4
CNSTI4 -1
NEI4 $3850
line 5619
;5617:				// if we ever see a ping that is out of date, do a server refresh
;5618:				// UI_UpdatePendingPings();
;5619:			}
LABELV $3850
line 5620
;5620:			switch (column) {
ADDRLP4 28
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $3837
ADDRLP4 28
INDIRI4
CNSTI4 4
GTI4 $3837
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $3909
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $3909
address $3854
address $3895
address $3896
address $3898
address $3905
code
LABELV $3854
line 5622
;5621:				case SORT_HOST : 
;5622:					if (ping <= 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
GTI4 $3855
line 5623
;5623:						return Info_ValueForKey(info, "addr");
ADDRGP4 $3794
ARGP4
ADDRGP4 $2939
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3855
line 5624
;5624:					} else {
line 5625
;5625:						int gametype = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 5627
;5626:						//check for password
;5627:						if ( atoi(Info_ValueForKey(info, "needpass")) )
ADDRGP4 $3794
ARGP4
ADDRGP4 $3859
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $3857
line 5628
;5628:						{
line 5629
;5629:							*handle3 = trap_R_RegisterShaderNoMip( "gfx/menus/needpass" );
ADDRGP4 $3860
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 44
INDIRI4
ASGNI4
line 5630
;5630:						}
LABELV $3857
line 5632
;5631:						//check for saberonly and restricted force powers
;5632:						gametype = atoi(Info_ValueForKey(info, "gametype"));
ADDRGP4 $3794
ARGP4
ADDRGP4 $3352
ARGP4
ADDRLP4 44
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 48
INDIRI4
ASGNI4
line 5633
;5633:						if ( gametype != GT_JEDIMASTER )
ADDRLP4 32
INDIRI4
CNSTI4 2
EQI4 $3861
line 5634
;5634:						{
line 5635
;5635:							qboolean saberOnly = qtrue;
ADDRLP4 56
CNSTI4 1
ASGNI4
line 5636
;5636:							qboolean restrictedForce = qfalse;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 5637
;5637:							qboolean allForceDisabled = qfalse;
ADDRLP4 64
CNSTI4 0
ASGNI4
line 5638
;5638:							int wDisable, i = 0;
ADDRLP4 52
CNSTI4 0
ASGNI4
line 5641
;5639:
;5640:							//check force
;5641:							restrictedForce = atoi(Info_ValueForKey(info, "fdisable"));
ADDRGP4 $3794
ARGP4
ADDRGP4 $3863
ARGP4
ADDRLP4 72
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 76
INDIRI4
ASGNI4
line 5642
;5642:							if ( UI_AllForceDisabled( restrictedForce ) )
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 UI_AllForceDisabled
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $3864
line 5643
;5643:							{//all force powers are disabled
line 5644
;5644:								allForceDisabled = qtrue;
ADDRLP4 64
CNSTI4 1
ASGNI4
line 5645
;5645:								*handle2 = trap_R_RegisterShaderNoMip( "gfx/menus/noforce" );
ADDRGP4 $3866
ARGP4
ADDRLP4 84
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 84
INDIRI4
ASGNI4
line 5646
;5646:							}
ADDRGP4 $3865
JUMPV
LABELV $3864
line 5647
;5647:							else if ( restrictedForce )
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $3867
line 5648
;5648:							{//at least one force power is disabled
line 5649
;5649:								*handle2 = trap_R_RegisterShaderNoMip( "gfx/menus/forcerestrict" );
ADDRGP4 $3869
ARGP4
ADDRLP4 84
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 84
INDIRI4
ASGNI4
line 5650
;5650:							}
LABELV $3867
LABELV $3865
line 5653
;5651:							
;5652:							//check weaps
;5653:							wDisable = atoi(Info_ValueForKey(info, "wdisable"));
ADDRGP4 $3794
ARGP4
ADDRGP4 $3870
ARGP4
ADDRLP4 84
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 88
INDIRI4
ASGNI4
ADDRGP4 $3872
JUMPV
LABELV $3871
line 5656
;5654:
;5655:							while ( i < WP_NUM_WEAPONS )
;5656:							{
line 5657
;5657:								if ( !(wDisable & (1 << i)) && i != WP_SABER && i != WP_NONE )
ADDRLP4 92
ADDRLP4 52
INDIRI4
ASGNI4
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDRLP4 92
INDIRI4
LSHI4
BANDI4
ADDRLP4 96
INDIRI4
NEI4 $3874
ADDRLP4 92
INDIRI4
CNSTI4 2
EQI4 $3874
ADDRLP4 92
INDIRI4
ADDRLP4 96
INDIRI4
EQI4 $3874
line 5658
;5658:								{
line 5659
;5659:									saberOnly = qfalse;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 5660
;5660:								}
LABELV $3874
line 5662
;5661:
;5662:								i++;
ADDRLP4 52
ADDRLP4 52
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5663
;5663:							}
LABELV $3872
line 5655
ADDRLP4 52
INDIRI4
CNSTI4 16
LTI4 $3871
line 5664
;5664:							if ( saberOnly )
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $3876
line 5665
;5665:							{
line 5666
;5666:								*handle1 = trap_R_RegisterShaderNoMip( "gfx/menus/saberonly" );
ADDRGP4 $3878
ARGP4
ADDRLP4 92
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 92
INDIRI4
ASGNI4
line 5667
;5667:							}
ADDRGP4 $3877
JUMPV
LABELV $3876
line 5668
;5668:							else if ( atoi(Info_ValueForKey(info, "truejedi")) != 0 )
ADDRGP4 $3794
ARGP4
ADDRGP4 $3881
ARGP4
ADDRLP4 92
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $3879
line 5669
;5669:							{
line 5670
;5670:								if ( gametype != GT_HOLOCRON 
ADDRLP4 100
ADDRLP4 32
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 1
EQI4 $3882
ADDRLP4 100
INDIRI4
CNSTI4 2
EQI4 $3882
ADDRLP4 104
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRI4
ADDRLP4 104
INDIRI4
NEI4 $3882
ADDRLP4 64
INDIRI4
ADDRLP4 104
INDIRI4
NEI4 $3882
line 5674
;5671:									&& gametype != GT_JEDIMASTER 
;5672:									&& !saberOnly 
;5673:									&& !allForceDisabled )
;5674:								{//truejedi is on and allowed in this mode
line 5675
;5675:									*handle1 = trap_R_RegisterShaderNoMip( "gfx/menus/truejedi" );
ADDRGP4 $3884
ARGP4
ADDRLP4 108
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 108
INDIRI4
ASGNI4
line 5676
;5676:								}
LABELV $3882
line 5677
;5677:							}
LABELV $3879
LABELV $3877
line 5678
;5678:						}
LABELV $3861
line 5679
;5679:						if ( ui_netSource.integer == AS_LOCAL ) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $3885
line 5680
;5680:							Com_sprintf( hostname, sizeof(hostname), "%s [%s]",
ADDRGP4 $3794
ARGP4
ADDRGP4 $2938
ARGP4
ADDRLP4 52
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3794
ARGP4
ADDRGP4 $3889
ARGP4
ADDRLP4 56
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $3795
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3888
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netnames
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5683
;5681:											Info_ValueForKey(info, "hostname"),
;5682:											netnames[atoi(Info_ValueForKey(info, "nettype"))] );
;5683:							return hostname;
ADDRGP4 $3795
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3885
line 5685
;5684:						}
;5685:						else {
line 5686
;5686:							if (atoi(Info_ValueForKey(info, "sv_allowAnonymous")) != 0) {				// anonymous server
ADDRGP4 $3794
ARGP4
ADDRGP4 $3892
ARGP4
ADDRLP4 52
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $3890
line 5687
;5687:								Com_sprintf( hostname, sizeof(hostname), "(A) %s",
ADDRGP4 $3794
ARGP4
ADDRGP4 $2938
ARGP4
ADDRLP4 60
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3795
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3893
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5689
;5688:												Info_ValueForKey(info, "hostname"));
;5689:							} else {
ADDRGP4 $3891
JUMPV
LABELV $3890
line 5690
;5690:								Com_sprintf( hostname, sizeof(hostname), "%s",
ADDRGP4 $3794
ARGP4
ADDRGP4 $2938
ARGP4
ADDRLP4 60
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3795
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3894
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5692
;5691:												Info_ValueForKey(info, "hostname"));
;5692:							}
LABELV $3891
line 5693
;5693:							return hostname;
ADDRGP4 $3795
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3895
line 5697
;5694:						}
;5695:					}
;5696:				case SORT_MAP : 
;5697:					return Info_ValueForKey(info, "mapname");
ADDRGP4 $3794
ARGP4
ADDRGP4 $3386
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3896
line 5699
;5698:				case SORT_CLIENTS : 
;5699:					Com_sprintf( clientBuff, sizeof(clientBuff), "%s (%s)", Info_ValueForKey(info, "clients"), Info_ValueForKey(info, "sv_maxclients"));
ADDRGP4 $3794
ARGP4
ADDRGP4 $3332
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3794
ARGP4
ADDRGP4 $1511
ARGP4
ADDRLP4 40
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3796
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $3897
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5700
;5700:					return clientBuff;
ADDRGP4 $3796
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3898
line 5702
;5701:				case SORT_GAME : 
;5702:					game = atoi(Info_ValueForKey(info, "gametype"));
ADDRGP4 $3794
ARGP4
ADDRGP4 $3352
ARGP4
ADDRLP4 44
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 48
INDIRI4
ASGNI4
line 5703
;5703:					if (game >= 0 && game < numTeamArenaGameTypes) {
ADDRLP4 52
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
LTI4 $3899
ADDRLP4 52
INDIRI4
ADDRGP4 numTeamArenaGameTypes
INDIRI4
GEI4 $3899
line 5704
;5704:						strcpy(needPass,teamArenaGameTypes[game]);
ADDRGP4 $3797
ARGP4
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 teamArenaGameTypes
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 5705
;5705:					} else {
ADDRGP4 $3900
JUMPV
LABELV $3899
line 5706
;5706:						if (ping <= 0)
ADDRLP4 12
INDIRI4
CNSTI4 0
GTI4 $3901
line 5707
;5707:						{
line 5708
;5708:							strcpy(needPass,"Inactive");
ADDRGP4 $3797
ARGP4
ADDRGP4 $3903
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 5709
;5709:						}
LABELV $3901
line 5710
;5710:						strcpy(needPass,"Unknown");
ADDRGP4 $3797
ARGP4
ADDRGP4 $3904
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 5711
;5711:					}
LABELV $3900
line 5713
;5712:
;5713:					return needPass;
ADDRGP4 $3797
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3905
line 5715
;5714:				case SORT_PING : 
;5715:					if (ping <= 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
GTI4 $3906
line 5716
;5716:						return "...";
ADDRGP4 $3908
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3906
line 5717
;5717:					} else {
line 5718
;5718:						return Info_ValueForKey(info, "ping");
ADDRGP4 $3794
ARGP4
ADDRGP4 $3429
ARGP4
ADDRLP4 56
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
line 5721
;5719:					}
;5720:			}
;5721:		}
line 5722
;5722:	} else if (feederID == FEEDER_SERVERSTATUS) {
LABELV $3836
ADDRFP4 0
INDIRF4
CNSTF4 1095761920
NEF4 $3910
line 5723
;5723:		if ( index >= 0 && index < uiInfo.serverStatusInfo.numLines ) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $3911
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+52288+3232
INDIRI4
GEI4 $3911
line 5724
;5724:			if ( column >= 0 && column < 4 ) {
ADDRLP4 12
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $3911
ADDRLP4 12
INDIRI4
CNSTI4 4
GEI4 $3911
line 5725
;5725:				return uiInfo.serverStatusInfo.lines[index][column];
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 uiInfo+52288+64
ADDP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
line 5727
;5726:			}
;5727:		}
line 5728
;5728:	} else if (feederID == FEEDER_FINDPLAYER) {
LABELV $3910
ADDRFP4 0
INDIRF4
CNSTF4 1096810496
NEF4 $3920
line 5729
;5729:		if ( index >= 0 && index < uiInfo.numFoundPlayerServers ) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $3921
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+60848
INDIRI4
GEI4 $3921
line 5731
;5730:			//return uiInfo.foundPlayerServerAddresses[index];
;5731:			return uiInfo.foundPlayerServerNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+59820
ADDP4
RETP4
ADDRGP4 $3793
JUMPV
line 5733
;5732:		}
;5733:	} else if (feederID == FEEDER_PLAYER_LIST) {
LABELV $3920
ADDRFP4 0
INDIRF4
CNSTF4 1088421888
NEF4 $3926
line 5734
;5734:		if (index >= 0 && index < uiInfo.playerCount) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $3927
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+18012
INDIRI4
GEI4 $3927
line 5735
;5735:			return uiInfo.playerNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+18040
ADDP4
RETP4
ADDRGP4 $3793
JUMPV
line 5737
;5736:		}
;5737:	} else if (feederID == FEEDER_TEAM_LIST) {
LABELV $3926
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
NEF4 $3932
line 5738
;5738:		if (index >= 0 && index < uiInfo.myTeamCount) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $3933
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+18016
INDIRI4
GEI4 $3933
line 5739
;5739:			return uiInfo.teamNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+19064
ADDP4
RETP4
ADDRGP4 $3793
JUMPV
line 5741
;5740:		}
;5741:	} else if (feederID == FEEDER_MODS) {
LABELV $3932
ADDRFP4 0
INDIRF4
CNSTF4 1091567616
NEF4 $3938
line 5742
;5742:		if (index >= 0 && index < uiInfo.modCount) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $3939
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+34308
INDIRI4
GEI4 $3939
line 5743
;5743:			if (uiInfo.modList[index].modDescr && *uiInfo.modList[index].modDescr) {
ADDRLP4 12
ADDRFP4 4
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+33796+4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3943
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+33796+4
ADDP4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $3943
line 5744
;5744:				return uiInfo.modList[index].modDescr;
ADDRFP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+33796+4
ADDP4
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3943
line 5745
;5745:			} else {
line 5746
;5746:				return uiInfo.modList[index].modName;
ADDRFP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+33796
ADDP4
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
line 5749
;5747:			}
;5748:		}
;5749:	} else if (feederID == FEEDER_CINEMATICS) {
LABELV $3938
ADDRFP4 0
INDIRF4
CNSTF4 1097859072
NEF4 $3952
line 5750
;5750:		if (index >= 0 && index < uiInfo.movieCount) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $3953
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+36372
INDIRI4
GEI4 $3953
line 5751
;5751:			return uiInfo.movieList[index];
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+35348
ADDP4
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
line 5753
;5752:		}
;5753:	} else if (feederID == FEEDER_DEMOS) {
LABELV $3952
ADDRFP4 0
INDIRF4
CNSTF4 1092616192
NEF4 $3958
line 5754
;5754:		if (index >= 0 && index < uiInfo.demoCount) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $3960
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+35340
INDIRI4
GEI4 $3960
line 5755
;5755:			return uiInfo.demoList[index];
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+34316
ADDP4
INDIRP4
RETP4
ADDRGP4 $3793
JUMPV
LABELV $3960
line 5757
;5756:		}
;5757:	} 
LABELV $3958
LABELV $3953
LABELV $3939
LABELV $3933
LABELV $3927
LABELV $3921
LABELV $3911
LABELV $3837
LABELV $3805
line 5758
;5758:	return "";
ADDRGP4 $165
RETP4
LABELV $3793
endproc UI_FeederItemText 112 20
proc UI_FeederItemImage 296 16
line 5762
;5759:}
;5760:
;5761:
;5762:static qhandle_t UI_FeederItemImage(float feederID, int index) {
line 5763
;5763:	if (feederID == FEEDER_HEADS) 
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $3965
line 5764
;5764:	{
line 5766
;5765:		int actual;
;5766:		UI_SelectedHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_SelectedHead
CALLP4
pop
line 5767
;5767:		index = actual;
ADDRFP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 5768
;5768:		if (index >= 0 && index < uiInfo.characterCount) 
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3966
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+11840
INDIRI4
GEI4 $3966
line 5769
;5769:		{
line 5770
;5770:			if (uiInfo.characterList[index].headImage == -1) 
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+8
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $3970
line 5771
;5771:			{
line 5772
;5772:				uiInfo.characterList[index].headImage = trap_R_RegisterShaderNoMip(uiInfo.characterList[index].imageName);
ADDRLP4 8
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+11848+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+11848+8
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 5773
;5773:			}
LABELV $3970
line 5774
;5774:			return uiInfo.characterList[index].headImage;
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+8
ADDP4
INDIRI4
RETI4
ADDRGP4 $3964
JUMPV
line 5776
;5775:		}
;5776:	} 
LABELV $3965
line 5777
;5777:	else if (feederID == FEEDER_Q3HEADS) 
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $3980
line 5778
;5778:	{
line 5780
;5779:		int actual;
;5780:		UI_SelectedTeamHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_SelectedTeamHead
CALLP4
pop
line 5781
;5781:		index = actual;
ADDRFP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 5783
;5782:
;5783:		if (index >= 0 && index < uiInfo.q3HeadCount)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3981
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+60868
INDIRI4
GEI4 $3981
line 5784
;5784:		{ //we want it to load them as it draws them, like the TA feeder
line 5786
;5785:		      //return uiInfo.q3HeadIcons[index];
;5786:			int selModel = trap_Cvar_VariableValue("ui_selectedModelIndex");
ADDRGP4 $3985
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 5788
;5787:
;5788:			if (selModel != -1)
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $3986
line 5789
;5789:			{
line 5790
;5790:				if (uiInfo.q3SelectedHead != selModel)
ADDRGP4 uiInfo+78280
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $3988
line 5791
;5791:				{
line 5792
;5792:					uiInfo.q3SelectedHead = selModel;
ADDRGP4 uiInfo+78280
ADDRLP4 8
INDIRI4
ASGNI4
line 5794
;5793:					//UI_FeederSelection(FEEDER_Q3HEADS, uiInfo.q3SelectedHead);
;5794:					Menu_SetFeederSelection(NULL, FEEDER_Q3HEADS, selModel, NULL);
CNSTP4 0
ARGP4
CNSTI4 12
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 5795
;5795:				}
LABELV $3988
line 5796
;5796:			}
LABELV $3986
line 5798
;5797:
;5798:			if (!uiInfo.q3HeadIcons[index])
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+77256
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3992
line 5799
;5799:			{ //this isn't the best way of doing this I guess, but I didn't want a whole seperate string array
line 5803
;5800:			  //for storing shader names. I can't just replace q3HeadNames with the shader name, because we
;5801:			  //print what's in q3HeadNames and the icon name would look funny.
;5802:				char iconNameFromSkinName[256];
;5803:				int i = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5806
;5804:				int skinPlace;
;5805:
;5806:				i = strlen(uiInfo.q3HeadNames[index]);
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60872
ADDP4
ARGP4
ADDRLP4 280
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 280
INDIRI4
ASGNI4
ADDRGP4 $3997
JUMPV
LABELV $3996
line 5809
;5807:
;5808:				while (uiInfo.q3HeadNames[index][i] != '/')
;5809:				{
line 5810
;5810:					i--;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 5811
;5811:				}
LABELV $3997
line 5808
ADDRLP4 16
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60872
ADDP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $3996
line 5813
;5812:
;5813:				i++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5814
;5814:				skinPlace = i; //remember that this is where the skin name begins
ADDRLP4 20
ADDRLP4 16
INDIRI4
ASGNI4
line 5817
;5815:
;5816:				//now, build a full path out of what's in q3HeadNames, into iconNameFromSkinName
;5817:				Com_sprintf(iconNameFromSkinName, sizeof(iconNameFromSkinName), "models/players/%s", uiInfo.q3HeadNames[index]);
ADDRLP4 24
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $4000
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60872
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5819
;5818:
;5819:				i = strlen(iconNameFromSkinName);
ADDRLP4 24
ARGP4
ADDRLP4 284
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 284
INDIRI4
ASGNI4
ADDRGP4 $4003
JUMPV
LABELV $4002
line 5822
;5820:
;5821:				while (iconNameFromSkinName[i] != '/')
;5822:				{
line 5823
;5823:					i--;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 5824
;5824:				}
LABELV $4003
line 5821
ADDRLP4 16
INDIRI4
ADDRLP4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $4002
line 5826
;5825:				
;5826:				i++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5827
;5827:				iconNameFromSkinName[i] = 0; //terminate, and append..
ADDRLP4 16
INDIRI4
ADDRLP4 24
ADDP4
CNSTI1 0
ASGNI1
line 5828
;5828:				Q_strcat(iconNameFromSkinName, 256, "icon_");
ADDRLP4 24
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $4005
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 5831
;5829:
;5830:				//and now, for the final step, append the skin name from q3HeadNames onto the end of iconNameFromSkinName
;5831:				i = strlen(iconNameFromSkinName);
ADDRLP4 24
ARGP4
ADDRLP4 288
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 288
INDIRI4
ASGNI4
ADDRGP4 $4007
JUMPV
LABELV $4006
line 5834
;5832:
;5833:				while (uiInfo.q3HeadNames[index][skinPlace])
;5834:				{
line 5835
;5835:					iconNameFromSkinName[i] = uiInfo.q3HeadNames[index][skinPlace];
ADDRLP4 16
INDIRI4
ADDRLP4 24
ADDP4
ADDRLP4 20
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60872
ADDP4
ADDP4
INDIRI1
ASGNI1
line 5836
;5836:					i++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5837
;5837:					skinPlace++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5838
;5838:				}
LABELV $4007
line 5833
ADDRLP4 20
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60872
ADDP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4006
line 5839
;5839:				iconNameFromSkinName[i] = 0;
ADDRLP4 16
INDIRI4
ADDRLP4 24
ADDP4
CNSTI1 0
ASGNI1
line 5842
;5840:
;5841:				//and now we are ready to register (thankfully this will only happen once)
;5842:				uiInfo.q3HeadIcons[index] = trap_R_RegisterShaderNoMip(iconNameFromSkinName);
ADDRLP4 24
ARGP4
ADDRLP4 292
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+77256
ADDP4
ADDRLP4 292
INDIRI4
ASGNI4
line 5843
;5843:			}
LABELV $3992
line 5844
;5844:			return uiInfo.q3HeadIcons[index];
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+77256
ADDP4
INDIRI4
RETI4
ADDRGP4 $3964
JUMPV
line 5846
;5845:		}
;5846:    }
LABELV $3980
line 5847
;5847:	else if (feederID == FEEDER_ALLMAPS || feederID == FEEDER_MAPS) 
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
EQF4 $4015
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
NEF4 $4013
LABELV $4015
line 5848
;5848:	{
line 5850
;5849:		int actual;
;5850:		UI_SelectedMap(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 UI_SelectedMap
CALLP4
pop
line 5851
;5851:		index = actual;
ADDRFP4 4
ADDRLP4 4
INDIRI4
ASGNI4
line 5852
;5852:		if (index >= 0 && index < uiInfo.mapCount) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $4016
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
GEI4 $4016
line 5853
;5853:			if (uiInfo.mapList[index].levelShot == -1) {
CNSTI4 100
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+92
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $4019
line 5854
;5854:				uiInfo.mapList[index].levelShot = trap_R_RegisterShaderNoMip(uiInfo.mapList[index].imageName);
ADDRLP4 12
CNSTI4 100
ADDRFP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+20348+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+20348+92
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 5855
;5855:			}
LABELV $4019
line 5856
;5856:			return uiInfo.mapList[index].levelShot;
CNSTI4 100
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+92
ADDP4
INDIRI4
RETI4
ADDRGP4 $3964
JUMPV
LABELV $4016
line 5858
;5857:		}
;5858:	}
LABELV $4013
LABELV $3981
LABELV $3966
line 5859
;5859:  return 0;
CNSTI4 0
RETI4
LABELV $3964
endproc UI_FeederItemImage 296 16
bss
align 1
LABELV $4030
skip 1024
export UI_FeederSelection
code
proc UI_FeederSelection 52 24
line 5862
;5860:}
;5861:
;5862:qboolean UI_FeederSelection(float feederID, int index) {
line 5864
;5863:	static char info[MAX_STRING_CHARS];
;5864:	if (feederID == FEEDER_HEADS) 
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $4031
line 5865
;5865:	{
line 5867
;5866:		int actual;
;5867:		UI_SelectedHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_SelectedHead
CALLP4
pop
line 5868
;5868:		index = actual;
ADDRFP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 5869
;5869:		if (index >= 0 && index < uiInfo.characterCount) 
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4032
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+11840
INDIRI4
GEI4 $4032
line 5870
;5870:		{
line 5871
;5871:			trap_Cvar_Set( "team_model", va("%s", uiInfo.characterList[index].base));
ADDRGP4 $3894
ARGP4
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+11848+12
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $4036
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5873
;5872:			//trap_Cvar_Set( "team_headmodel", va("*%s", uiInfo.characterList[index].name)); 
;5873:			updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 5874
;5874:		}
line 5875
;5875:	} 
ADDRGP4 $4032
JUMPV
LABELV $4031
line 5876
;5876:	else if (feederID == FEEDER_Q3HEADS) 
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $4039
line 5877
;5877:	{
line 5879
;5878:		int actual;
;5879:		UI_SelectedTeamHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_SelectedTeamHead
CALLP4
pop
line 5880
;5880:		uiInfo.q3SelectedHead = index;
ADDRGP4 uiInfo+78280
ADDRFP4 4
INDIRI4
ASGNI4
line 5881
;5881:		trap_Cvar_Set("ui_selectedModelIndex", va("%i", index));
ADDRGP4 $1406
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $3985
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5882
;5882:		index = actual;
ADDRFP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 5883
;5883:		if (index >= 0 && index < uiInfo.q3HeadCount) 
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $4040
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+60868
INDIRI4
GEI4 $4040
line 5884
;5884:		{
line 5885
;5885:			trap_Cvar_Set( "model", uiInfo.q3HeadNames[index]);
ADDRGP4 $4045
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60872
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5889
;5886:			//trap_Cvar_Set( "headmodel", uiInfo.q3HeadNames[index]);
;5887:
;5888:			//Update team_model for now here also, because we're using a different team skin system
;5889:			trap_Cvar_Set( "team_model", uiInfo.q3HeadNames[index]);
ADDRGP4 $4036
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60872
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5892
;5890:			//trap_Cvar_Set( "team_headmodel", uiInfo.q3HeadNames[index]); 
;5891:
;5892:			updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 5893
;5893:		}
line 5894
;5894:	} 
ADDRGP4 $4040
JUMPV
LABELV $4039
line 5895
;5895:	else if (feederID == FEEDER_FORCECFG) 
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
NEF4 $4048
line 5896
;5896:	{
line 5897
;5897:		int newindex = index;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 5899
;5898:
;5899:		if (uiForceSide == FORCE_LIGHTSIDE)
ADDRGP4 uiForceSide
INDIRI4
CNSTI4 1
NEI4 $4050
line 5900
;5900:		{
line 5901
;5901:			newindex += uiInfo.forceConfigLightIndexBegin;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+95192
INDIRI4
ADDI4
ASGNI4
line 5902
;5902:			if (newindex >= uiInfo.forceConfigCount)
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+78284
INDIRI4
LTI4 $4051
line 5903
;5903:			{
line 5904
;5904:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4029
JUMPV
line 5906
;5905:			}
;5906:		}
LABELV $4050
line 5908
;5907:		else
;5908:		{ //else dark
line 5909
;5909:			newindex += uiInfo.forceConfigDarkIndexBegin;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+95188
INDIRI4
ADDI4
ASGNI4
line 5910
;5910:			if (newindex >= uiInfo.forceConfigCount || newindex > uiInfo.forceConfigLightIndexBegin)
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78284
INDIRI4
GEI4 $4061
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+95192
INDIRI4
LEI4 $4057
LABELV $4061
line 5911
;5911:			{ //dark gets read in before light
line 5912
;5912:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4029
JUMPV
LABELV $4057
line 5914
;5913:			}
;5914:		}
LABELV $4051
line 5916
;5915:
;5916:		if (index >= 0 && index < uiInfo.forceConfigCount) 
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $4049
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78284
INDIRI4
GEI4 $4049
line 5917
;5917:		{
line 5918
;5918:				UI_ForceConfigHandle(uiInfo.forceConfigSelected, index);
ADDRGP4 uiInfo+78288
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ForceConfigHandle
CALLV
pop
line 5919
;5919:				uiInfo.forceConfigSelected = index;
ADDRGP4 uiInfo+78288
ADDRFP4 4
INDIRI4
ASGNI4
line 5920
;5920:		}
line 5921
;5921:	} 
ADDRGP4 $4049
JUMPV
LABELV $4048
line 5922
;5922:	else if (feederID == FEEDER_MAPS || feederID == FEEDER_ALLMAPS) 
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
EQF4 $4069
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
NEF4 $4067
LABELV $4069
line 5923
;5923:	{
line 5925
;5924:		int actual, map;
;5925:		const char *checkValid = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 5927
;5926:
;5927:		map = (feederID == FEEDER_ALLMAPS) ? ui_currentNetMap.integer : ui_currentMap.integer;
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
NEF4 $4073
ADDRLP4 16
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $4074
JUMPV
LABELV $4073
ADDRLP4 16
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $4074
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 5928
;5928:		if (uiInfo.mapList[map].cinematic >= 0) {
CNSTI4 100
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
INDIRI4
CNSTI4 0
LTI4 $4075
line 5929
;5929:		  trap_CIN_StopCinematic(uiInfo.mapList[map].cinematic);
CNSTI4 100
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 5930
;5930:		  uiInfo.mapList[map].cinematic = -1;
CNSTI4 100
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
CNSTI4 -1
ASGNI4
line 5931
;5931:		}
LABELV $4075
line 5932
;5932:		checkValid = UI_SelectedMap(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 20
ADDRGP4 UI_SelectedMap
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 5934
;5933:
;5934:		if (!checkValid || !checkValid[0])
ADDRLP4 24
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4085
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4083
LABELV $4085
line 5935
;5935:		{ //this isn't a valid map to select, so reselect the current
line 5936
;5936:			index = ui_mapIndex.integer;
ADDRFP4 4
ADDRGP4 ui_mapIndex+12
INDIRI4
ASGNI4
line 5937
;5937:			UI_SelectedMap(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 UI_SelectedMap
CALLP4
pop
line 5938
;5938:		}
LABELV $4083
line 5940
;5939:
;5940:		trap_Cvar_Set("ui_mapIndex", va("%d", index));
ADDRGP4 $702
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2374
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5941
;5941:		gUISelectedMap = index;
ADDRGP4 gUISelectedMap
ADDRFP4 4
INDIRI4
ASGNI4
line 5942
;5942:		ui_mapIndex.integer = index;
ADDRGP4 ui_mapIndex+12
ADDRFP4 4
INDIRI4
ASGNI4
line 5944
;5943:
;5944:		if (feederID == FEEDER_MAPS) {
ADDRFP4 0
INDIRF4
CNSTF4 1065353216
NEF4 $4088
line 5945
;5945:			ui_currentMap.integer = actual;
ADDRGP4 ui_currentMap+12
ADDRLP4 8
INDIRI4
ASGNI4
line 5946
;5946:			trap_Cvar_Set("ui_currentMap", va("%d", actual));
ADDRGP4 $702
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $983
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5947
;5947:		uiInfo.mapList[ui_currentMap.integer].cinematic = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.mapList[ui_currentMap.integer].mapLoadName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $792
ARGP4
ADDRLP4 36
CNSTI4 100
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 48
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 5948
;5948:			UI_LoadBestScores(uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 5951
;5949:			//trap_Cvar_Set("ui_opponentModel", uiInfo.mapList[ui_currentMap.integer].opponentName);
;5950:			//updateOpponentModel = qtrue;
;5951:		} else {
ADDRGP4 $4068
JUMPV
LABELV $4088
line 5952
;5952:			ui_currentNetMap.integer = actual;
ADDRGP4 ui_currentNetMap+12
ADDRLP4 8
INDIRI4
ASGNI4
line 5953
;5953:			trap_Cvar_Set("ui_currentNetMap", va("%d", actual));
ADDRGP4 $702
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $981
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5954
;5954:		uiInfo.mapList[ui_currentNetMap.integer].cinematic = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.mapList[ui_currentNetMap.integer].mapLoadName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $792
ARGP4
ADDRLP4 36
CNSTI4 100
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 48
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 5955
;5955:		}
line 5957
;5956:
;5957:	} else if (feederID == FEEDER_SERVERS) {
ADDRGP4 $4068
JUMPV
LABELV $4067
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
NEF4 $4110
line 5958
;5958:		const char *mapName = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 5959
;5959:		uiInfo.serverStatus.currentServer = index;
ADDRGP4 uiInfo+40740+2216
ADDRFP4 4
INDIRI4
ASGNI4
line 5960
;5960:		trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[index], info, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+40740+2220
ADDP4
INDIRI4
ARGI4
ADDRGP4 $4030
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 5961
;5961:		uiInfo.serverStatus.currentServerPreview = trap_R_RegisterShaderNoMip(va("levelshots/%s", Info_ValueForKey(info, "mapname")));
ADDRGP4 $4030
ARGP4
ADDRGP4 $3386
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $1176
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+40740+10428
ADDRLP4 16
INDIRI4
ASGNI4
line 5962
;5962:		if (uiInfo.serverStatus.currentServerCinematic >= 0) {
ADDRGP4 uiInfo+40740+10432
INDIRI4
CNSTI4 0
LTI4 $4119
line 5963
;5963:		  trap_CIN_StopCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+40740+10432
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 5964
;5964:			uiInfo.serverStatus.currentServerCinematic = -1;
ADDRGP4 uiInfo+40740+10432
CNSTI4 -1
ASGNI4
line 5965
;5965:		}
LABELV $4119
line 5966
;5966:		mapName = Info_ValueForKey(info, "mapname");
ADDRGP4 $4030
ARGP4
ADDRGP4 $3386
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 5967
;5967:		if (mapName && *mapName) {
ADDRLP4 24
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4111
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $4111
line 5968
;5968:			uiInfo.serverStatus.currentServerCinematic = trap_CIN_PlayCinematic(va("%s.roq", mapName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $792
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 36
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRGP4 uiInfo+40740+10432
ADDRLP4 36
INDIRI4
ASGNI4
line 5969
;5969:		}
line 5970
;5970:	} else if (feederID == FEEDER_SERVERSTATUS) {
ADDRGP4 $4111
JUMPV
LABELV $4110
ADDRFP4 0
INDIRF4
CNSTF4 1095761920
NEF4 $4131
line 5972
;5971:		//
;5972:	} else if (feederID == FEEDER_FINDPLAYER) {
ADDRGP4 $4132
JUMPV
LABELV $4131
ADDRFP4 0
INDIRF4
CNSTF4 1096810496
NEF4 $4133
line 5973
;5973:	  uiInfo.currentFoundPlayerServer = index;
ADDRGP4 uiInfo+60844
ADDRFP4 4
INDIRI4
ASGNI4
line 5975
;5974:	  //
;5975:	  if ( index < uiInfo.numFoundPlayerServers-1) {
ADDRFP4 4
INDIRI4
ADDRGP4 uiInfo+60848
INDIRI4
CNSTI4 1
SUBI4
GEI4 $4134
line 5977
;5976:			// build a new server status for this server
;5977:			Q_strncpyz(uiInfo.serverStatusAddress, uiInfo.foundPlayerServerAddresses[uiInfo.currentFoundPlayerServer], sizeof(uiInfo.serverStatusAddress));
ADDRGP4 uiInfo+52224
ARGP4
ADDRGP4 uiInfo+60844
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+58796
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5978
;5978:			Menu_SetFeederSelection(NULL, FEEDER_SERVERSTATUS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 5979
;5979:			UI_BuildServerStatus(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 5980
;5980:	  }
line 5981
;5981:	} else if (feederID == FEEDER_PLAYER_LIST) {
ADDRGP4 $4134
JUMPV
LABELV $4133
ADDRFP4 0
INDIRF4
CNSTF4 1088421888
NEF4 $4143
line 5982
;5982:		uiInfo.playerIndex = index;
ADDRGP4 uiInfo+18028
ADDRFP4 4
INDIRI4
ASGNI4
line 5983
;5983:	} else if (feederID == FEEDER_TEAM_LIST) {
ADDRGP4 $4144
JUMPV
LABELV $4143
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
NEF4 $4146
line 5984
;5984:		uiInfo.teamIndex = index;
ADDRGP4 uiInfo+18020
ADDRFP4 4
INDIRI4
ASGNI4
line 5985
;5985:	} else if (feederID == FEEDER_MODS) {
ADDRGP4 $4147
JUMPV
LABELV $4146
ADDRFP4 0
INDIRF4
CNSTF4 1091567616
NEF4 $4149
line 5986
;5986:		uiInfo.modIndex = index;
ADDRGP4 uiInfo+34312
ADDRFP4 4
INDIRI4
ASGNI4
line 5987
;5987:	} else if (feederID == FEEDER_CINEMATICS) {
ADDRGP4 $4150
JUMPV
LABELV $4149
ADDRFP4 0
INDIRF4
CNSTF4 1097859072
NEF4 $4152
line 5988
;5988:		uiInfo.movieIndex = index;
ADDRGP4 uiInfo+36376
ADDRFP4 4
INDIRI4
ASGNI4
line 5989
;5989:		if (uiInfo.previewMovie >= 0) {
ADDRGP4 uiInfo+36380
INDIRI4
CNSTI4 0
LTI4 $4155
line 5990
;5990:		  trap_CIN_StopCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+36380
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 5991
;5991:		}
LABELV $4155
line 5992
;5992:		uiInfo.previewMovie = -1;
ADDRGP4 uiInfo+36380
CNSTI4 -1
ASGNI4
line 5993
;5993:	} else if (feederID == FEEDER_DEMOS) {
ADDRGP4 $4153
JUMPV
LABELV $4152
ADDRFP4 0
INDIRF4
CNSTF4 1092616192
NEF4 $4160
line 5994
;5994:		uiInfo.demoIndex = index;
ADDRGP4 uiInfo+35344
ADDRFP4 4
INDIRI4
ASGNI4
line 5995
;5995:	}
LABELV $4160
LABELV $4153
LABELV $4150
LABELV $4147
LABELV $4144
LABELV $4134
LABELV $4132
LABELV $4111
LABELV $4068
LABELV $4049
LABELV $4040
LABELV $4032
line 5997
;5996:
;5997:	return qtrue;
CNSTI4 1
RETI4
LABELV $4029
endproc UI_FeederSelection 52 24
proc GameType_Parse 28 8
line 6001
;5998:}
;5999:
;6000:
;6001:static qboolean GameType_Parse(char **p, qboolean join) {
line 6004
;6002:	char *token;
;6003:
;6004:	token = COM_ParseExt((const char **)p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 6006
;6005:
;6006:	if (token[0] != '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $4164
line 6007
;6007:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4163
JUMPV
LABELV $4164
line 6010
;6008:	}
;6009:
;6010:	if (join) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $4166
line 6011
;6011:		uiInfo.numJoinGameTypes = 0;
ADDRGP4 uiInfo+17876
CNSTI4 0
ASGNI4
line 6012
;6012:	} else {
ADDRGP4 $4171
JUMPV
LABELV $4166
line 6013
;6013:		uiInfo.numGameTypes = 0;
ADDRGP4 uiInfo+17744
CNSTI4 0
ASGNI4
line 6014
;6014:	}
ADDRGP4 $4171
JUMPV
LABELV $4170
line 6016
;6015:
;6016:	while ( 1 ) {
line 6017
;6017:		token = COM_ParseExt((const char **)p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 6019
;6018:
;6019:		if (Q_stricmp(token, "}") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $446
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $4173
line 6020
;6020:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $4163
JUMPV
LABELV $4173
line 6023
;6021:		}
;6022:
;6023:		if ( !token || token[0] == 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4177
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4175
LABELV $4177
line 6024
;6024:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4163
JUMPV
LABELV $4175
line 6027
;6025:		}
;6026:
;6027:		if (token[0] == '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $4178
line 6029
;6028:			// two tokens per line, character name and sex
;6029:			if (join) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $4180
line 6030
;6030:				if (!String_Parse(p, &uiInfo.joinGameTypes[uiInfo.numJoinGameTypes].gameType) || !Int_Parse(p, &uiInfo.joinGameTypes[uiInfo.numJoinGameTypes].gtEnum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+17876
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17880
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $4189
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+17876
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17880+4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $4181
LABELV $4189
line 6031
;6031:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4163
JUMPV
line 6033
;6032:				}
;6033:			} else {
LABELV $4180
line 6034
;6034:				if (!String_Parse(p, &uiInfo.gameTypes[uiInfo.numGameTypes].gameType) || !Int_Parse(p, &uiInfo.gameTypes[uiInfo.numGameTypes].gtEnum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+17744
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $4197
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+17744
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $4190
LABELV $4197
line 6035
;6035:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4163
JUMPV
LABELV $4190
line 6037
;6036:				}
;6037:			}
LABELV $4181
line 6039
;6038:    
;6039:			if (join) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $4198
line 6040
;6040:				if (uiInfo.numJoinGameTypes < MAX_GAMETYPES) {
ADDRGP4 uiInfo+17876
INDIRI4
CNSTI4 16
GEI4 $4200
line 6041
;6041:					uiInfo.numJoinGameTypes++;
ADDRLP4 20
ADDRGP4 uiInfo+17876
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6042
;6042:				} else {
ADDRGP4 $4199
JUMPV
LABELV $4200
line 6043
;6043:					Com_Printf("Too many net game types, last one replace!\n");
ADDRGP4 $4204
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 6044
;6044:				}		
line 6045
;6045:			} else {
ADDRGP4 $4199
JUMPV
LABELV $4198
line 6046
;6046:				if (uiInfo.numGameTypes < MAX_GAMETYPES) {
ADDRGP4 uiInfo+17744
INDIRI4
CNSTI4 16
GEI4 $4205
line 6047
;6047:					uiInfo.numGameTypes++;
ADDRLP4 20
ADDRGP4 uiInfo+17744
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6048
;6048:				} else {
ADDRGP4 $4206
JUMPV
LABELV $4205
line 6049
;6049:					Com_Printf("Too many game types, last one replace!\n");
ADDRGP4 $4209
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 6050
;6050:				}		
LABELV $4206
line 6051
;6051:			}
LABELV $4199
line 6053
;6052:     
;6053:			token = COM_ParseExt((const char **)p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 6054
;6054:			if (token[0] != '}') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
EQI4 $4210
line 6055
;6055:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4163
JUMPV
LABELV $4210
line 6057
;6056:			}
;6057:		}
LABELV $4178
line 6058
;6058:	}
LABELV $4171
line 6016
ADDRGP4 $4170
JUMPV
line 6059
;6059:	return qfalse;
CNSTI4 0
RETI4
LABELV $4163
endproc GameType_Parse 28 8
proc MapList_Parse 52 8
line 6062
;6060:}
;6061:
;6062:static qboolean MapList_Parse(char **p) {
line 6065
;6063:	char *token;
;6064:
;6065:	token = COM_ParseExt((const char **)p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 6067
;6066:
;6067:	if (token[0] != '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $4213
line 6068
;6068:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4212
JUMPV
LABELV $4213
line 6071
;6069:	}
;6070:
;6071:	uiInfo.mapCount = 0;
ADDRGP4 uiInfo+20344
CNSTI4 0
ASGNI4
ADDRGP4 $4217
JUMPV
LABELV $4216
line 6073
;6072:
;6073:	while ( 1 ) {
line 6074
;6074:		token = COM_ParseExt((const char **)p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 6076
;6075:
;6076:		if (Q_stricmp(token, "}") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $446
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $4219
line 6077
;6077:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $4212
JUMPV
LABELV $4219
line 6080
;6078:		}
;6079:
;6080:		if ( !token || token[0] == 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4223
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4221
LABELV $4223
line 6081
;6081:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4212
JUMPV
LABELV $4221
line 6084
;6082:		}
;6083:
;6084:		if (token[0] == '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $4224
line 6085
;6085:			if (!String_Parse(p, &uiInfo.mapList[uiInfo.mapCount].mapName) || !String_Parse(p, &uiInfo.mapList[uiInfo.mapCount].mapLoadName) 
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRGP4 uiInfo+20344
INDIRI4
MULI4
ADDRGP4 uiInfo+20348
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $4237
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRGP4 uiInfo+20344
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $4237
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRGP4 uiInfo+20344
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+16
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $4226
LABELV $4237
line 6086
;6086:				||!Int_Parse(p, &uiInfo.mapList[uiInfo.mapCount].teamMembers) ) {
line 6087
;6087:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4212
JUMPV
LABELV $4226
line 6090
;6088:			}
;6089:
;6090:			if (!String_Parse(p, &uiInfo.mapList[uiInfo.mapCount].opponentName)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRGP4 uiInfo+20344
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+12
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $4238
line 6091
;6091:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4212
JUMPV
LABELV $4238
line 6094
;6092:			}
;6093:
;6094:			uiInfo.mapList[uiInfo.mapCount].typeBits = 0;
CNSTI4 100
ADDRGP4 uiInfo+20344
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+20
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $4247
JUMPV
LABELV $4246
line 6096
;6095:
;6096:			while (1) {
line 6097
;6097:				token = COM_ParseExt((const char **)p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 36
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
line 6098
;6098:				if (token[0] >= '0' && token[0] <= '9') {
ADDRLP4 40
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 48
LTI4 $4248
ADDRLP4 40
INDIRI4
CNSTI4 57
GTI4 $4248
line 6099
;6099:					uiInfo.mapList[uiInfo.mapCount].typeBits |= (1 << (token[0] - 0x030));
ADDRLP4 44
CNSTI4 100
ADDRGP4 uiInfo+20344
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+20
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
LSHI4
BORI4
ASGNI4
line 6100
;6100:					if (!Int_Parse(p, &uiInfo.mapList[uiInfo.mapCount].timeToBeat[token[0] - 0x30])) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 2
LSHI4
CNSTI4 192
SUBI4
CNSTI4 100
ADDRGP4 uiInfo+20344
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+28
ADDP4
ADDP4
ARGP4
ADDRLP4 48
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $4250
line 6101
;6101:						return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $4212
JUMPV
line 6103
;6102:					}
;6103:				} else {
line 6104
;6104:					break;
LABELV $4250
line 6106
;6105:				} 
;6106:			}
LABELV $4247
line 6096
ADDRGP4 $4246
JUMPV
LABELV $4248
line 6113
;6107:
;6108:			//mapList[mapCount].imageName = String_Alloc(va("levelshots/%s", mapList[mapCount].mapLoadName));
;6109:			//if (uiInfo.mapCount == 0) {
;6110:			  // only load the first cinematic, selection loads the others
;6111:  			//  uiInfo.mapList[uiInfo.mapCount].cinematic = trap_CIN_PlayCinematic(va("%s.roq",uiInfo.mapList[uiInfo.mapCount].mapLoadName), qfalse, qfalse, qtrue, 0, 0, 0, 0);
;6112:			//}
;6113:  		uiInfo.mapList[uiInfo.mapCount].cinematic = -1;
CNSTI4 100
ADDRGP4 uiInfo+20344
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
CNSTI4 -1
ASGNI4
line 6114
;6114:			uiInfo.mapList[uiInfo.mapCount].levelShot = trap_R_RegisterShaderNoMip(va("levelshots/%s_small", uiInfo.mapList[uiInfo.mapCount].mapLoadName));
ADDRGP4 $4265
ARGP4
ADDRLP4 36
CNSTI4 100
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+20344
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+92
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 6116
;6115:
;6116:			if (uiInfo.mapCount < MAX_MAPS) {
ADDRGP4 uiInfo+20344
INDIRI4
CNSTI4 128
GEI4 $4269
line 6117
;6117:				uiInfo.mapCount++;
ADDRLP4 48
ADDRGP4 uiInfo+20344
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6118
;6118:			} else {
ADDRGP4 $4270
JUMPV
LABELV $4269
line 6119
;6119:				Com_Printf("Too many maps, last one replaced!\n");
ADDRGP4 $4273
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 6120
;6120:			}
LABELV $4270
line 6121
;6121:		}
LABELV $4224
line 6122
;6122:	}
LABELV $4217
line 6073
ADDRGP4 $4216
JUMPV
line 6123
;6123:	return qfalse;
CNSTI4 0
RETI4
LABELV $4212
endproc MapList_Parse 52 8
proc UI_ParseGameInfo 44 8
line 6126
;6124:}
;6125:
;6126:static void UI_ParseGameInfo(const char *teamFile) {
line 6129
;6127:	char	*token;
;6128:	char *p;
;6129:	char *buff = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 6132
;6130:	//int mode = 0; TTimo: unused
;6131:
;6132:	buff = GetMenuBuffer(teamFile);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 GetMenuBuffer
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 6133
;6133:	if (!buff) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $4275
line 6134
;6134:		return;
ADDRGP4 $4274
JUMPV
LABELV $4275
line 6137
;6135:	}
;6136:
;6137:	p = buff;
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $4278
JUMPV
LABELV $4277
line 6139
;6138:
;6139:	while ( 1 ) {
line 6140
;6140:		token = COM_ParseExt( (const char **)(&p), qtrue );
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 6141
;6141:		if( !token || token[0] == 0 || token[0] == '}') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4283
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $4283
ADDRLP4 24
INDIRI4
CNSTI4 125
NEI4 $4280
LABELV $4283
line 6142
;6142:			break;
ADDRGP4 $4279
JUMPV
LABELV $4280
line 6145
;6143:		}
;6144:
;6145:		if ( Q_stricmp( token, "}" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $446
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $4284
line 6146
;6146:			break;
ADDRGP4 $4279
JUMPV
LABELV $4284
line 6149
;6147:		}
;6148:
;6149:		if (Q_stricmp(token, "gametypes") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4288
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $4286
line 6151
;6150:
;6151:			if (GameType_Parse(&p, qfalse)) {
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 GameType_Parse
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $4279
line 6152
;6152:				continue;
ADDRGP4 $4278
JUMPV
line 6153
;6153:			} else {
line 6154
;6154:				break;
LABELV $4286
line 6158
;6155:			}
;6156:		}
;6157:
;6158:		if (Q_stricmp(token, "joingametypes") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4293
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $4291
line 6160
;6159:
;6160:			if (GameType_Parse(&p, qtrue)) {
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 40
ADDRGP4 GameType_Parse
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $4279
line 6161
;6161:				continue;
ADDRGP4 $4278
JUMPV
line 6162
;6162:			} else {
line 6163
;6163:				break;
LABELV $4291
line 6167
;6164:			}
;6165:		}
;6166:
;6167:		if (Q_stricmp(token, "maps") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4298
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $4296
line 6169
;6168:			// start a new menu
;6169:			MapList_Parse(&p);
ADDRLP4 4
ARGP4
ADDRGP4 MapList_Parse
CALLI4
pop
line 6170
;6170:		}
LABELV $4296
line 6172
;6171:
;6172:	}
LABELV $4278
line 6139
ADDRGP4 $4277
JUMPV
LABELV $4279
line 6173
;6173:}
LABELV $4274
endproc UI_ParseGameInfo 44 8
proc UI_Pause 4 8
line 6175
;6174:
;6175:static void UI_Pause(qboolean b) {
line 6176
;6176:	if (b) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $4300
line 6178
;6177:		// pause the game and set the ui keycatcher
;6178:	  trap_Cvar_Set( "cl_paused", "1" );
ADDRGP4 $2826
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6179
;6179:		trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6180
;6180:	} else {
ADDRGP4 $4301
JUMPV
LABELV $4300
line 6182
;6181:		// unpause the game and clear the ui keycatcher
;6182:		trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6183
;6183:		trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 6184
;6184:		trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2826
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6185
;6185:	}
LABELV $4301
line 6186
;6186:}
LABELV $4299
endproc UI_Pause 4 8
proc UI_PlayCinematic 4 24
line 6188
;6187:
;6188:static int UI_PlayCinematic(const char *name, float x, float y, float w, float h) {
line 6189
;6189:  return trap_CIN_PlayCinematic(name, x, y, w, h, (CIN_loop | CIN_silent));
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 12
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 16
INDIRF4
CVFI4 4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 0
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $4302
endproc UI_PlayCinematic 4 24
proc UI_StopCinematic 20 4
line 6192
;6190:}
;6191:
;6192:static void UI_StopCinematic(int handle) {
line 6193
;6193:	if (handle >= 0) {
ADDRFP4 0
INDIRI4
CNSTI4 0
LTI4 $4304
line 6194
;6194:	  trap_CIN_StopCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 6195
;6195:	} else {
ADDRGP4 $4305
JUMPV
LABELV $4304
line 6196
;6196:		handle = abs(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 abs
CALLI4
ASGNI4
ADDRFP4 0
ADDRLP4 0
INDIRI4
ASGNI4
line 6197
;6197:		if (handle == UI_MAPCINEMATIC) {
ADDRFP4 0
INDIRI4
CNSTI4 244
NEI4 $4306
line 6198
;6198:			if (uiInfo.mapList[ui_currentMap.integer].cinematic >= 0) {
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
INDIRI4
CNSTI4 0
LTI4 $4307
line 6199
;6199:			  trap_CIN_StopCinematic(uiInfo.mapList[ui_currentMap.integer].cinematic);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 6200
;6200:			  uiInfo.mapList[ui_currentMap.integer].cinematic = -1;
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+24
ADDP4
CNSTI4 -1
ASGNI4
line 6201
;6201:			}
line 6202
;6202:		} else if (handle == UI_NETMAPCINEMATIC) {
ADDRGP4 $4307
JUMPV
LABELV $4306
ADDRFP4 0
INDIRI4
CNSTI4 246
NEI4 $4319
line 6203
;6203:			if (uiInfo.serverStatus.currentServerCinematic >= 0) {
ADDRGP4 uiInfo+40740+10432
INDIRI4
CNSTI4 0
LTI4 $4320
line 6204
;6204:			  trap_CIN_StopCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+40740+10432
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 6205
;6205:				uiInfo.serverStatus.currentServerCinematic = -1;
ADDRGP4 uiInfo+40740+10432
CNSTI4 -1
ASGNI4
line 6206
;6206:			}
line 6207
;6207:		} else if (handle == UI_CLANCINEMATIC) {
ADDRGP4 $4320
JUMPV
LABELV $4319
ADDRFP4 0
INDIRI4
CNSTI4 251
NEI4 $4329
line 6208
;6208:		  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $697
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 6209
;6209:		  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 16
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $4331
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+14156
INDIRI4
GEI4 $4331
line 6210
;6210:				if (uiInfo.teamList[i].cinematic >= 0) {
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
INDIRI4
CNSTI4 0
LTI4 $4334
line 6211
;6211:				  trap_CIN_StopCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 6212
;6212:					uiInfo.teamList[i].cinematic = -1;
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+14160+52
ADDP4
CNSTI4 -1
ASGNI4
line 6213
;6213:				}
LABELV $4334
line 6214
;6214:			}
LABELV $4331
line 6215
;6215:		}
LABELV $4329
LABELV $4320
LABELV $4307
line 6216
;6216:	}
LABELV $4305
line 6217
;6217:}
LABELV $4303
endproc UI_StopCinematic 20 4
proc UI_DrawCinematic 0 20
line 6219
;6218:
;6219:static void UI_DrawCinematic(int handle, float x, float y, float w, float h) {
line 6220
;6220:	trap_CIN_SetExtents(handle, x, y, w, h);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 12
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 16
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 6221
;6221:  trap_CIN_DrawCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 6222
;6222:}
LABELV $4342
endproc UI_DrawCinematic 0 20
proc UI_RunCinematicFrame 0 4
line 6224
;6223:
;6224:static void UI_RunCinematicFrame(int handle) {
line 6225
;6225:  trap_CIN_RunCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 6226
;6226:}
LABELV $4343
endproc UI_RunCinematicFrame 0 4
export UI_LoadForceConfig_List
proc UI_LoadForceConfig_List 2208 16
line 6236
;6227:
;6228:
;6229:/*
;6230:=================
;6231:UI_LoadForceConfig_List
;6232:=================
;6233:Looks in the directory for force config files (.fcf) and loads the name in
;6234:*/
;6235:void UI_LoadForceConfig_List( void )
;6236:{
line 6237
;6237:	int			numfiles = 0;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 6240
;6238:	char		filelist[2048];
;6239:	char		configname[128];
;6240:	char		*fileptr = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 6241
;6241:	int			j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 6242
;6242:	int			filelen = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 6243
;6243:	qboolean	lightSearch = qfalse;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 6245
;6244:
;6245:	uiInfo.forceConfigCount = 0;
ADDRGP4 uiInfo+78284
CNSTI4 0
ASGNI4
line 6246
;6246:	Com_sprintf( uiInfo.forceConfigNames[uiInfo.forceConfigCount], sizeof(uiInfo.forceConfigNames[uiInfo.forceConfigCount]), "Custom");
ADDRGP4 uiInfo+78284
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 uiInfo+78292
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $4350
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 6247
;6247:	uiInfo.forceConfigCount++;
ADDRLP4 2196
ADDRGP4 uiInfo+78284
ASGNP4
ADDRLP4 2196
INDIRP4
ADDRLP4 2196
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $4352
line 6251
;6248:	//Always reserve index 0 as the "custom" config
;6249:
;6250:nextSearch:
;6251:	if (lightSearch)
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $4353
line 6252
;6252:	{ //search light side folder
line 6253
;6253:		numfiles = trap_FS_GetFileList("forcecfg/light", "fcf", filelist, 2048 );
ADDRGP4 $4355
ARGP4
ADDRGP4 $4356
ARGP4
ADDRLP4 148
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 2200
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 2200
INDIRI4
ASGNI4
line 6254
;6254:		uiInfo.forceConfigLightIndexBegin = uiInfo.forceConfigCount-1;
ADDRGP4 uiInfo+95192
ADDRGP4 uiInfo+78284
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 6255
;6255:	}
ADDRGP4 $4354
JUMPV
LABELV $4353
line 6257
;6256:	else
;6257:	{ //search dark side folder
line 6258
;6258:		numfiles = trap_FS_GetFileList("forcecfg/dark", "fcf", filelist, 2048 );
ADDRGP4 $4359
ARGP4
ADDRGP4 $4356
ARGP4
ADDRLP4 148
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 2200
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 2200
INDIRI4
ASGNI4
line 6259
;6259:		uiInfo.forceConfigDarkIndexBegin = uiInfo.forceConfigCount-1;
ADDRGP4 uiInfo+95188
ADDRGP4 uiInfo+78284
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 6260
;6260:	}
LABELV $4354
line 6262
;6261:
;6262:	fileptr = filelist;
ADDRLP4 0
ADDRLP4 148
ASGNP4
line 6264
;6263:
;6264:	for (j=0; j<numfiles && uiInfo.forceConfigCount < MAX_FORCE_CONFIGS;j++,fileptr+=filelen+1)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $4365
JUMPV
LABELV $4362
line 6265
;6265:	{
line 6266
;6266:		filelen = strlen(fileptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2200
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 2200
INDIRI4
ASGNI4
line 6267
;6267:		COM_StripExtension(fileptr, configname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 COM_StripExtension
CALLV
pop
line 6269
;6268:
;6269:		if (lightSearch)
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $4367
line 6270
;6270:		{
line 6271
;6271:			uiInfo.forceConfigSide[uiInfo.forceConfigCount] = qtrue; //light side config
ADDRGP4 uiInfo+78284
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+94676
ADDP4
CNSTI4 1
ASGNI4
line 6272
;6272:		}
ADDRGP4 $4368
JUMPV
LABELV $4367
line 6274
;6273:		else
;6274:		{
line 6275
;6275:			uiInfo.forceConfigSide[uiInfo.forceConfigCount] = qfalse; //dark side config
ADDRGP4 uiInfo+78284
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+94676
ADDP4
CNSTI4 0
ASGNI4
line 6276
;6276:		}
LABELV $4368
line 6278
;6277:
;6278:		Com_sprintf( uiInfo.forceConfigNames[uiInfo.forceConfigCount], sizeof(uiInfo.forceConfigNames[uiInfo.forceConfigCount]), configname);
ADDRGP4 uiInfo+78284
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 uiInfo+78292
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 6279
;6279:		uiInfo.forceConfigCount++;
ADDRLP4 2204
ADDRGP4 uiInfo+78284
ASGNP4
ADDRLP4 2204
INDIRP4
ADDRLP4 2204
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6280
;6280:	}
LABELV $4363
line 6264
ADDRLP4 2200
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 2200
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ADDRLP4 2200
INDIRI4
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
LABELV $4365
ADDRLP4 4
INDIRI4
ADDRLP4 144
INDIRI4
GEI4 $4378
ADDRGP4 uiInfo+78284
INDIRI4
CNSTI4 128
LTI4 $4362
LABELV $4378
line 6282
;6281:
;6282:	if (!lightSearch)
ADDRLP4 140
INDIRI4
CNSTI4 0
NEI4 $4379
line 6283
;6283:	{
line 6284
;6284:		lightSearch = qtrue;
ADDRLP4 140
CNSTI4 1
ASGNI4
line 6285
;6285:		goto nextSearch;
ADDRGP4 $4352
JUMPV
LABELV $4379
line 6287
;6286:	}
;6287:}
LABELV $4344
endproc UI_LoadForceConfig_List 2208 16
proc UI_BuildQ3Model_List 6320 20
line 6296
;6288:
;6289:
;6290:/*
;6291:=================
;6292:PlayerModel_BuildList
;6293:=================
;6294:*/
;6295:static void UI_BuildQ3Model_List( void )
;6296:{
line 6309
;6297:	int		numdirs;
;6298:	int		numfiles;
;6299:	char	dirlist[2048];
;6300:	char	filelist[2048];
;6301:	char	skinname[64];
;6302:	char*	dirptr;
;6303:	char*	fileptr;
;6304:	int		i;
;6305:	int		j, k, p, s;
;6306:	int		dirlen;
;6307:	int		filelen;
;6308:
;6309:	uiInfo.q3HeadCount = 0;
ADDRGP4 uiInfo+60868
CNSTI4 0
ASGNI4
line 6312
;6310:
;6311:	// iterate directory of all player models
;6312:	numdirs = trap_FS_GetFileList("models/players", "/", dirlist, 2048 );
ADDRGP4 $4383
ARGP4
ADDRGP4 $4384
ARGP4
ADDRLP4 2156
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 4204
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 2152
ADDRLP4 4204
INDIRI4
ASGNI4
line 6313
;6313:	dirptr  = dirlist;
ADDRLP4 76
ADDRLP4 2156
ASGNP4
line 6314
;6314:	for (i=0; i<numdirs && uiInfo.q3HeadCount < MAX_PLAYERMODELS; i++,dirptr+=dirlen+1)
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRGP4 $4388
JUMPV
LABELV $4385
line 6315
;6315:	{
line 6316
;6316:		int f = 0;
ADDRLP4 4208
CNSTI4 0
ASGNI4
line 6319
;6317:		char fpath[2048];
;6318:
;6319:		dirlen = strlen(dirptr);
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 6260
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 96
ADDRLP4 6260
INDIRI4
ASGNI4
line 6321
;6320:		
;6321:		if (dirlen && dirptr[dirlen-1]=='/') dirptr[dirlen-1]='\0';
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $4390
ADDRLP4 96
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 76
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $4390
ADDRLP4 96
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 76
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $4390
line 6323
;6322:
;6323:		if (!strcmp(dirptr,".") || !strcmp(dirptr,".."))
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 $4394
ARGP4
ADDRLP4 6268
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6268
INDIRI4
CNSTI4 0
EQI4 $4396
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 $4395
ARGP4
ADDRLP4 6272
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6272
INDIRI4
CNSTI4 0
NEI4 $4392
LABELV $4396
line 6324
;6324:			continue;
ADDRGP4 $4386
JUMPV
LABELV $4392
line 6327
;6325:			
;6326:
;6327:		numfiles = trap_FS_GetFileList( va("models/players/%s",dirptr), "skin", filelist, 2048 );
ADDRGP4 $4000
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 6276
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 6276
INDIRP4
ARGP4
ADDRGP4 $4397
ARGP4
ADDRLP4 104
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 6280
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 92
ADDRLP4 6280
INDIRI4
ASGNI4
line 6328
;6328:		fileptr  = filelist;
ADDRLP4 80
ADDRLP4 104
ASGNP4
line 6329
;6329:		for (j=0; j<numfiles && uiInfo.q3HeadCount < MAX_PLAYERMODELS;j++,fileptr+=filelen+1)
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRGP4 $4401
JUMPV
LABELV $4398
line 6330
;6330:		{
line 6331
;6331:			int skinLen = 0;
ADDRLP4 6284
CNSTI4 0
ASGNI4
line 6333
;6332:
;6333:			filelen = strlen(fileptr);
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 6288
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 6288
INDIRI4
ASGNI4
line 6335
;6334:
;6335:			COM_StripExtension(fileptr,skinname);
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 COM_StripExtension
CALLV
pop
line 6337
;6336:
;6337:			skinLen = strlen(skinname);
ADDRLP4 4
ARGP4
ADDRLP4 6292
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 6284
ADDRLP4 6292
INDIRI4
ASGNI4
line 6338
;6338:			k = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $4404
JUMPV
LABELV $4403
line 6340
;6339:			while (k < skinLen && skinname[k] && skinname[k] != '_')
;6340:			{
line 6341
;6341:				k++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6342
;6342:			}
LABELV $4404
line 6339
ADDRLP4 0
INDIRI4
ADDRLP4 6284
INDIRI4
GEI4 $4407
ADDRLP4 6300
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 6300
INDIRI4
CNSTI4 0
EQI4 $4407
ADDRLP4 6300
INDIRI4
CNSTI4 95
NEI4 $4403
LABELV $4407
line 6343
;6343:			if (skinname[k] == '_')
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 95
NEI4 $4408
line 6344
;6344:			{
line 6345
;6345:				p = 0;
ADDRLP4 72
CNSTI4 0
ASGNI4
ADDRGP4 $4411
JUMPV
LABELV $4410
line 6348
;6346:
;6347:				while (skinname[k])
;6348:				{
line 6349
;6349:					skinname[p] = skinname[k];
ADDRLP4 72
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
ASGNI1
line 6350
;6350:					k++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6351
;6351:					p++;
ADDRLP4 72
ADDRLP4 72
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6352
;6352:				}
LABELV $4411
line 6347
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4410
line 6353
;6353:				skinname[p] = '\0';
ADDRLP4 72
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 6354
;6354:			}
LABELV $4408
line 6356
;6355:
;6356:			Com_sprintf(fpath, 2048, "models/players/%s/icon%s.jpg", dirptr, skinname);
ADDRLP4 4212
ARGP4
CNSTI4 2048
ARGI4
ADDRGP4 $4413
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 6358
;6357:
;6358:			trap_FS_FOpenFile(fpath, &f, FS_READ);
ADDRLP4 4212
ARGP4
ADDRLP4 4208
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 6360
;6359:
;6360:			if (f)
ADDRLP4 4208
INDIRI4
CNSTI4 0
EQI4 $4414
line 6361
;6361:			{ //if it exists
line 6362
;6362:				qboolean iconExists = qfalse;
ADDRLP4 6304
CNSTI4 0
ASGNI4
line 6364
;6363:
;6364:				trap_FS_FCloseFile(f);
ADDRLP4 4208
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 6366
;6365:
;6366:				if (skinname[0] == '_')
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 95
NEI4 $4416
line 6367
;6367:				{ //change character to append properly
line 6368
;6368:					skinname[0] = '/';
ADDRLP4 4
CNSTI1 47
ASGNI1
line 6369
;6369:				}
LABELV $4416
line 6371
;6370:
;6371:				s = 0;
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $4419
JUMPV
LABELV $4418
line 6374
;6372:
;6373:				while (s < uiInfo.q3HeadCount)
;6374:				{ //check for dupes
line 6375
;6375:					if (!Q_stricmp(va("%s%s", dirptr, skinname), uiInfo.q3HeadNames[s]))
ADDRGP4 $4424
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 6308
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 6308
INDIRP4
ARGP4
ADDRLP4 68
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60872
ADDP4
ARGP4
ADDRLP4 6312
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6312
INDIRI4
CNSTI4 0
NEI4 $4422
line 6376
;6376:					{
line 6377
;6377:						iconExists = qtrue;
ADDRLP4 6304
CNSTI4 1
ASGNI4
line 6378
;6378:						break;
ADDRGP4 $4420
JUMPV
LABELV $4422
line 6380
;6379:					}
;6380:					s++;
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6381
;6381:				}
LABELV $4419
line 6373
ADDRLP4 68
INDIRI4
ADDRGP4 uiInfo+60868
INDIRI4
LTI4 $4418
LABELV $4420
line 6383
;6382:
;6383:				if (iconExists)
ADDRLP4 6304
INDIRI4
CNSTI4 0
EQI4 $4426
line 6384
;6384:				{
line 6385
;6385:					continue;
ADDRGP4 $4399
JUMPV
LABELV $4426
line 6388
;6386:				}
;6387:
;6388:				Com_sprintf( uiInfo.q3HeadNames[uiInfo.q3HeadCount], sizeof(uiInfo.q3HeadNames[uiInfo.q3HeadCount]), va("%s%s", dirptr, skinname));
ADDRGP4 $4424
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 6308
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 uiInfo+60868
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60872
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 6308
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 6389
;6389:				uiInfo.q3HeadIcons[uiInfo.q3HeadCount++] = 0;//trap_R_RegisterShaderNoMip(fpath);
ADDRLP4 6316
ADDRGP4 uiInfo+60868
ASGNP4
ADDRLP4 6312
ADDRLP4 6316
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 6316
INDIRP4
ADDRLP4 6312
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 6312
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+77256
ADDP4
CNSTI4 0
ASGNI4
line 6391
;6390:				//rww - we are now registering them as they are drawn like the TA feeder, so as to decrease UI load time.
;6391:			}
LABELV $4414
line 6393
;6392:
;6393:			if (uiInfo.q3HeadCount >= MAX_PLAYERMODELS)
ADDRGP4 uiInfo+60868
INDIRI4
CNSTI4 256
LTI4 $4434
line 6394
;6394:			{
line 6395
;6395:				return;
ADDRGP4 $4381
JUMPV
LABELV $4434
line 6397
;6396:			}
;6397:		}
LABELV $4399
line 6329
ADDRLP4 6284
CNSTI4 1
ASGNI4
ADDRLP4 84
ADDRLP4 84
INDIRI4
ADDRLP4 6284
INDIRI4
ADDI4
ASGNI4
ADDRLP4 80
ADDRLP4 88
INDIRI4
ADDRLP4 6284
INDIRI4
ADDI4
ADDRLP4 80
INDIRP4
ADDP4
ASGNP4
LABELV $4401
ADDRLP4 84
INDIRI4
ADDRLP4 92
INDIRI4
GEI4 $4437
ADDRGP4 uiInfo+60868
INDIRI4
CNSTI4 256
LTI4 $4398
LABELV $4437
line 6398
;6398:	}	
LABELV $4386
line 6314
ADDRLP4 4208
CNSTI4 1
ASGNI4
ADDRLP4 100
ADDRLP4 100
INDIRI4
ADDRLP4 4208
INDIRI4
ADDI4
ASGNI4
ADDRLP4 76
ADDRLP4 96
INDIRI4
ADDRLP4 4208
INDIRI4
ADDI4
ADDRLP4 76
INDIRP4
ADDP4
ASGNP4
LABELV $4388
ADDRLP4 100
INDIRI4
ADDRLP4 2152
INDIRI4
GEI4 $4438
ADDRGP4 uiInfo+60868
INDIRI4
CNSTI4 256
LTI4 $4385
LABELV $4438
line 6400
;6399:
;6400:}
LABELV $4381
endproc UI_BuildQ3Model_List 6320 20
export _UI_Init
proc _UI_Init 52 16
line 6409
;6401:
;6402:
;6403:
;6404:/*
;6405:=================
;6406:UI_Init
;6407:=================
;6408:*/
;6409:void _UI_Init( qboolean inGameLoad ) {
line 6414
;6410:	int i;
;6411:	const char *menuSet;
;6412:	int start;
;6413:
;6414:	uiInfo.inGameLoad = inGameLoad;
ADDRGP4 uiInfo+95200
ADDRFP4 0
INDIRI4
ASGNI4
line 6416
;6415:
;6416:	UI_UpdateForcePowers();
ADDRGP4 UI_UpdateForcePowers
CALLV
pop
line 6418
;6417:
;6418:	UI_RegisterCvars();
ADDRGP4 UI_RegisterCvars
CALLV
pop
line 6419
;6419:	UI_InitMemory();
ADDRGP4 UI_InitMemory
CALLV
pop
line 6422
;6420:
;6421:	// cache redundant calulations
;6422:	trap_GetGlconfig( &uiInfo.uiDC.glconfig );
ADDRGP4 uiInfo+468
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 6425
;6423:
;6424:	// for 640x480 virtualized screen
;6425:	uiInfo.uiDC.yscale = uiInfo.uiDC.glconfig.vidHeight * (1.0/480.0);
ADDRGP4 uiInfo+228
CNSTF4 990414985
ADDRGP4 uiInfo+468+11308
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 6426
;6426:	uiInfo.uiDC.xscale = uiInfo.uiDC.glconfig.vidWidth * (1.0/640.0);
ADDRGP4 uiInfo+232
CNSTF4 986500301
ADDRGP4 uiInfo+468+11304
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 6427
;6427:	if ( uiInfo.uiDC.glconfig.vidWidth * 480 > uiInfo.uiDC.glconfig.vidHeight * 640 ) {
CNSTI4 480
ADDRGP4 uiInfo+468+11304
INDIRI4
MULI4
CNSTI4 640
ADDRGP4 uiInfo+468+11308
INDIRI4
MULI4
LEI4 $4448
line 6429
;6428:		// wide screen
;6429:		uiInfo.uiDC.bias = 0.5 * ( uiInfo.uiDC.glconfig.vidWidth - ( uiInfo.uiDC.glconfig.vidHeight * (640.0/480.0) ) );
ADDRGP4 uiInfo+236
CNSTF4 1056964608
ADDRGP4 uiInfo+468+11304
INDIRI4
CVIF4 4
CNSTF4 1068149419
ADDRGP4 uiInfo+468+11308
INDIRI4
CVIF4 4
MULF4
SUBF4
MULF4
ASGNF4
line 6430
;6430:	}
ADDRGP4 $4449
JUMPV
LABELV $4448
line 6431
;6431:	else {
line 6433
;6432:		// no wide screen
;6433:		uiInfo.uiDC.bias = 0;
ADDRGP4 uiInfo+236
CNSTF4 0
ASGNF4
line 6434
;6434:	}
LABELV $4449
line 6438
;6435:
;6436:
;6437:  //UI_Load();
;6438:	uiInfo.uiDC.registerShaderNoMip = &trap_R_RegisterShaderNoMip;
ADDRGP4 uiInfo
ADDRGP4 trap_R_RegisterShaderNoMip
ASGNP4
line 6439
;6439:	uiInfo.uiDC.setColor = &UI_SetColor;
ADDRGP4 uiInfo+4
ADDRGP4 UI_SetColor
ASGNP4
line 6440
;6440:	uiInfo.uiDC.drawHandlePic = &UI_DrawHandlePic;
ADDRGP4 uiInfo+8
ADDRGP4 UI_DrawHandlePic
ASGNP4
line 6441
;6441:	uiInfo.uiDC.drawStretchPic = &trap_R_DrawStretchPic;
ADDRGP4 uiInfo+12
ADDRGP4 trap_R_DrawStretchPic
ASGNP4
line 6442
;6442:	uiInfo.uiDC.drawText = &Text_Paint;
ADDRGP4 uiInfo+16
ADDRGP4 Text_Paint
ASGNP4
line 6443
;6443:	uiInfo.uiDC.textWidth = &Text_Width;
ADDRGP4 uiInfo+20
ADDRGP4 Text_Width
ASGNP4
line 6444
;6444:	uiInfo.uiDC.textHeight = &Text_Height;
ADDRGP4 uiInfo+24
ADDRGP4 Text_Height
ASGNP4
line 6445
;6445:	uiInfo.uiDC.registerModel = &trap_R_RegisterModel;
ADDRGP4 uiInfo+28
ADDRGP4 trap_R_RegisterModel
ASGNP4
line 6446
;6446:	uiInfo.uiDC.modelBounds = &trap_R_ModelBounds;
ADDRGP4 uiInfo+32
ADDRGP4 trap_R_ModelBounds
ASGNP4
line 6447
;6447:	uiInfo.uiDC.fillRect = &UI_FillRect;
ADDRGP4 uiInfo+36
ADDRGP4 UI_FillRect
ASGNP4
line 6448
;6448:	uiInfo.uiDC.drawRect = &_UI_DrawRect;
ADDRGP4 uiInfo+40
ADDRGP4 _UI_DrawRect
ASGNP4
line 6449
;6449:	uiInfo.uiDC.drawSides = &_UI_DrawSides;
ADDRGP4 uiInfo+44
ADDRGP4 _UI_DrawSides
ASGNP4
line 6450
;6450:	uiInfo.uiDC.drawTopBottom = &_UI_DrawTopBottom;
ADDRGP4 uiInfo+48
ADDRGP4 _UI_DrawTopBottom
ASGNP4
line 6451
;6451:	uiInfo.uiDC.clearScene = &trap_R_ClearScene;
ADDRGP4 uiInfo+52
ADDRGP4 trap_R_ClearScene
ASGNP4
line 6452
;6452:	uiInfo.uiDC.drawSides = &_UI_DrawSides;
ADDRGP4 uiInfo+44
ADDRGP4 _UI_DrawSides
ASGNP4
line 6453
;6453:	uiInfo.uiDC.addRefEntityToScene = &trap_R_AddRefEntityToScene;
ADDRGP4 uiInfo+56
ADDRGP4 trap_R_AddRefEntityToScene
ASGNP4
line 6454
;6454:	uiInfo.uiDC.renderScene = &trap_R_RenderScene;
ADDRGP4 uiInfo+60
ADDRGP4 trap_R_RenderScene
ASGNP4
line 6455
;6455:	uiInfo.uiDC.RegisterFont = &trap_R_RegisterFont;
ADDRGP4 uiInfo+64
ADDRGP4 trap_R_RegisterFont
ASGNP4
line 6456
;6456:	uiInfo.uiDC.Font_StrLenPixels = trap_R_Font_StrLenPixels;
ADDRGP4 uiInfo+68
ADDRGP4 trap_R_Font_StrLenPixels
ASGNP4
line 6457
;6457:	uiInfo.uiDC.Font_StrLenChars = trap_R_Font_StrLenChars;
ADDRGP4 uiInfo+72
ADDRGP4 trap_R_Font_StrLenChars
ASGNP4
line 6458
;6458:	uiInfo.uiDC.Font_HeightPixels = trap_R_Font_HeightPixels;
ADDRGP4 uiInfo+76
ADDRGP4 trap_R_Font_HeightPixels
ASGNP4
line 6459
;6459:	uiInfo.uiDC.Font_DrawString = trap_R_Font_DrawString;
ADDRGP4 uiInfo+80
ADDRGP4 trap_R_Font_DrawString
ASGNP4
line 6460
;6460:	uiInfo.uiDC.Language_IsAsian = trap_Language_IsAsian;
ADDRGP4 uiInfo+84
ADDRGP4 trap_Language_IsAsian
ASGNP4
line 6461
;6461:	uiInfo.uiDC.Language_UsesSpaces = trap_Language_UsesSpaces;
ADDRGP4 uiInfo+88
ADDRGP4 trap_Language_UsesSpaces
ASGNP4
line 6462
;6462:	uiInfo.uiDC.AnyLanguage_ReadCharFromString = trap_AnyLanguage_ReadCharFromString;
ADDRGP4 uiInfo+92
ADDRGP4 trap_AnyLanguage_ReadCharFromString
ASGNP4
line 6463
;6463:	uiInfo.uiDC.ownerDrawItem = &UI_OwnerDraw;
ADDRGP4 uiInfo+96
ADDRGP4 UI_OwnerDraw
ASGNP4
line 6464
;6464:	uiInfo.uiDC.getValue = &UI_GetValue;
ADDRGP4 uiInfo+100
ADDRGP4 UI_GetValue
ASGNP4
line 6465
;6465:	uiInfo.uiDC.ownerDrawVisible = &UI_OwnerDrawVisible;
ADDRGP4 uiInfo+104
ADDRGP4 UI_OwnerDrawVisible
ASGNP4
line 6466
;6466:	uiInfo.uiDC.runScript = &UI_RunMenuScript;
ADDRGP4 uiInfo+108
ADDRGP4 UI_RunMenuScript
ASGNP4
line 6467
;6467:	uiInfo.uiDC.deferScript = &UI_DeferMenuScript;
ADDRGP4 uiInfo+112
ADDRGP4 UI_DeferMenuScript
ASGNP4
line 6468
;6468:	uiInfo.uiDC.getTeamColor = &UI_GetTeamColor;
ADDRGP4 uiInfo+116
ADDRGP4 UI_GetTeamColor
ASGNP4
line 6469
;6469:	uiInfo.uiDC.setCVar = trap_Cvar_Set;
ADDRGP4 uiInfo+128
ADDRGP4 trap_Cvar_Set
ASGNP4
line 6470
;6470:	uiInfo.uiDC.getCVarString = trap_Cvar_VariableStringBuffer;
ADDRGP4 uiInfo+120
ADDRGP4 trap_Cvar_VariableStringBuffer
ASGNP4
line 6471
;6471:	uiInfo.uiDC.getCVarValue = trap_Cvar_VariableValue;
ADDRGP4 uiInfo+124
ADDRGP4 trap_Cvar_VariableValue
ASGNP4
line 6472
;6472:	uiInfo.uiDC.drawTextWithCursor = &Text_PaintWithCursor;
ADDRGP4 uiInfo+132
ADDRGP4 Text_PaintWithCursor
ASGNP4
line 6473
;6473:	uiInfo.uiDC.setOverstrikeMode = &trap_Key_SetOverstrikeMode;
ADDRGP4 uiInfo+136
ADDRGP4 trap_Key_SetOverstrikeMode
ASGNP4
line 6474
;6474:	uiInfo.uiDC.getOverstrikeMode = &trap_Key_GetOverstrikeMode;
ADDRGP4 uiInfo+140
ADDRGP4 trap_Key_GetOverstrikeMode
ASGNP4
line 6475
;6475:	uiInfo.uiDC.startLocalSound = &trap_S_StartLocalSound;
ADDRGP4 uiInfo+144
ADDRGP4 trap_S_StartLocalSound
ASGNP4
line 6476
;6476:	uiInfo.uiDC.ownerDrawHandleKey = &UI_OwnerDrawHandleKey;
ADDRGP4 uiInfo+148
ADDRGP4 UI_OwnerDrawHandleKey
ASGNP4
line 6477
;6477:	uiInfo.uiDC.feederCount = &UI_FeederCount;
ADDRGP4 uiInfo+152
ADDRGP4 UI_FeederCount
ASGNP4
line 6478
;6478:	uiInfo.uiDC.feederItemImage = &UI_FeederItemImage;
ADDRGP4 uiInfo+160
ADDRGP4 UI_FeederItemImage
ASGNP4
line 6479
;6479:	uiInfo.uiDC.feederItemText = &UI_FeederItemText;
ADDRGP4 uiInfo+156
ADDRGP4 UI_FeederItemText
ASGNP4
line 6480
;6480:	uiInfo.uiDC.feederSelection = &UI_FeederSelection;
ADDRGP4 uiInfo+164
ADDRGP4 UI_FeederSelection
ASGNP4
line 6481
;6481:	uiInfo.uiDC.setBinding = &trap_Key_SetBinding;
ADDRGP4 uiInfo+176
ADDRGP4 trap_Key_SetBinding
ASGNP4
line 6482
;6482:	uiInfo.uiDC.getBindingBuf = &trap_Key_GetBindingBuf;
ADDRGP4 uiInfo+172
ADDRGP4 trap_Key_GetBindingBuf
ASGNP4
line 6483
;6483:	uiInfo.uiDC.keynumToStringBuf = &trap_Key_KeynumToStringBuf;
ADDRGP4 uiInfo+168
ADDRGP4 trap_Key_KeynumToStringBuf
ASGNP4
line 6484
;6484:	uiInfo.uiDC.executeText = &trap_Cmd_ExecuteText;
ADDRGP4 uiInfo+180
ADDRGP4 trap_Cmd_ExecuteText
ASGNP4
line 6485
;6485:	uiInfo.uiDC.Error = &Com_Error; 
ADDRGP4 uiInfo+184
ADDRGP4 Com_Error
ASGNP4
line 6486
;6486:	uiInfo.uiDC.Print = &Com_Printf; 
ADDRGP4 uiInfo+188
ADDRGP4 Com_Printf
ASGNP4
line 6487
;6487:	uiInfo.uiDC.Pause = &UI_Pause;
ADDRGP4 uiInfo+192
ADDRGP4 UI_Pause
ASGNP4
line 6488
;6488:	uiInfo.uiDC.ownerDrawWidth = &UI_OwnerDrawWidth;
ADDRGP4 uiInfo+196
ADDRGP4 UI_OwnerDrawWidth
ASGNP4
line 6489
;6489:	uiInfo.uiDC.registerSound = &trap_S_RegisterSound;
ADDRGP4 uiInfo+200
ADDRGP4 trap_S_RegisterSound
ASGNP4
line 6490
;6490:	uiInfo.uiDC.startBackgroundTrack = &trap_S_StartBackgroundTrack;
ADDRGP4 uiInfo+204
ADDRGP4 trap_S_StartBackgroundTrack
ASGNP4
line 6491
;6491:	uiInfo.uiDC.stopBackgroundTrack = &trap_S_StopBackgroundTrack;
ADDRGP4 uiInfo+208
ADDRGP4 trap_S_StopBackgroundTrack
ASGNP4
line 6492
;6492:	uiInfo.uiDC.playCinematic = &UI_PlayCinematic;
ADDRGP4 uiInfo+212
ADDRGP4 UI_PlayCinematic
ASGNP4
line 6493
;6493:	uiInfo.uiDC.stopCinematic = &UI_StopCinematic;
ADDRGP4 uiInfo+216
ADDRGP4 UI_StopCinematic
ASGNP4
line 6494
;6494:	uiInfo.uiDC.drawCinematic = &UI_DrawCinematic;
ADDRGP4 uiInfo+220
ADDRGP4 UI_DrawCinematic
ASGNP4
line 6495
;6495:	uiInfo.uiDC.runCinematicFrame = &UI_RunCinematicFrame;
ADDRGP4 uiInfo+224
ADDRGP4 UI_RunCinematicFrame
ASGNP4
line 6497
;6496:
;6497:	for (i=0; i<10; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $4517
line 6498
;6498:	{
line 6499
;6499:		if (!trap_SP_Register(va("menus%d",i)))	//, /*SP_REGISTER_REQUIRED|*/SP_REGISTER_MENU))
ADDRGP4 $4523
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_SP_Register
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $4521
line 6500
;6500:			break;
ADDRGP4 $4519
JUMPV
LABELV $4521
line 6501
;6501:	}
LABELV $4518
line 6497
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $4517
LABELV $4519
line 6504
;6502:
;6503:
;6504:	Init_Display(&uiInfo.uiDC);
ADDRGP4 uiInfo
ARGP4
ADDRGP4 Init_Display
CALLV
pop
line 6506
;6505:
;6506:	String_Init();
ADDRGP4 String_Init
CALLV
pop
line 6508
;6507:  
;6508:	uiInfo.uiDC.cursor	= trap_R_RegisterShaderNoMip( "menu/art/3_cursor2" );
ADDRGP4 $4525
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+11808
ADDRLP4 12
INDIRI4
ASGNI4
line 6509
;6509:	uiInfo.uiDC.whiteShader = trap_R_RegisterShaderNoMip( "white" );
ADDRGP4 $4527
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+11800
ADDRLP4 16
INDIRI4
ASGNI4
line 6511
;6510:
;6511:	AssetCache();
ADDRGP4 AssetCache
CALLV
pop
line 6513
;6512:
;6513:	start = trap_Milliseconds();
ADDRLP4 20
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 6515
;6514:
;6515:  uiInfo.teamCount = 0;
ADDRGP4 uiInfo+14156
CNSTI4 0
ASGNI4
line 6516
;6516:  uiInfo.characterCount = 0;
ADDRGP4 uiInfo+11840
CNSTI4 0
ASGNI4
line 6517
;6517:  uiInfo.aliasCount = 0;
ADDRGP4 uiInfo+13384
CNSTI4 0
ASGNI4
line 6525
;6518:
;6519:#ifdef PRE_RELEASE_TADEMO
;6520://	UI_ParseTeamInfo("demoteaminfo.txt");
;6521:	UI_ParseGameInfo("demogameinfo.txt");
;6522:#else
;6523://	UI_ParseTeamInfo("ui/jk2mp/teaminfo.txt");
;6524://	UI_LoadTeams();
;6525:	UI_ParseGameInfo("ui/jk2mp/gameinfo.txt");
ADDRGP4 $673
ARGP4
ADDRGP4 UI_ParseGameInfo
CALLV
pop
line 6529
;6526:#endif
;6527:
;6528:
;6529:	menuSet = UI_Cvar_VariableString("ui_menuFilesMP");
ADDRGP4 $669
ARGP4
ADDRLP4 24
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 6530
;6530:	if (menuSet == NULL || menuSet[0] == '\0') {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4533
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4531
LABELV $4533
line 6531
;6531:		menuSet = "ui/jk2mpmenus.txt";
ADDRLP4 4
ADDRGP4 $636
ASGNP4
line 6532
;6532:	}
LABELV $4531
line 6535
;6533:
;6534:#if 1
;6535:	if (inGameLoad)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $4534
line 6536
;6536:	{
line 6537
;6537:		UI_LoadMenus("ui/jk2mpingame.txt", qtrue);
ADDRGP4 $668
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 6538
;6538:	}
ADDRGP4 $4535
JUMPV
LABELV $4534
line 6540
;6539:	else
;6540:	{
line 6541
;6541:		UI_LoadMenus(menuSet, qtrue);
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 6542
;6542:	}
LABELV $4535
line 6548
;6543:#else //this was adding quite a giant amount of time to the load time
;6544:	UI_LoadMenus(menuSet, qtrue);
;6545:	UI_LoadMenus("ui/jk2mpingame.txt", qtrue);
;6546:#endif
;6547:	
;6548:	Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6550
;6549:
;6550:	trap_LAN_LoadCachedServers();
ADDRGP4 trap_LAN_LoadCachedServers
CALLV
pop
line 6551
;6551:	UI_LoadBestScores(uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20348+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+17748+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 6553
;6552:
;6553:	UI_BuildQ3Model_List();
ADDRGP4 UI_BuildQ3Model_List
CALLV
pop
line 6554
;6554:	UI_LoadBots();
ADDRGP4 UI_LoadBots
CALLV
pop
line 6556
;6555:
;6556:	UI_LoadForceConfig_List();
ADDRGP4 UI_LoadForceConfig_List
CALLV
pop
line 6558
;6557:
;6558:	UI_InitForceShaders();
ADDRGP4 UI_InitForceShaders
CALLV
pop
line 6561
;6559:
;6560:	// sets defaults for ui temp cvars
;6561:	uiInfo.effectsColor = /*gamecodetoui[*/(int)trap_Cvar_VariableValue("color1");//-1];
ADDRGP4 $1938
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 uiInfo+95196
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 6562
;6562:	uiInfo.currentCrosshair = (int)trap_Cvar_VariableValue("cg_drawCrosshair");
ADDRGP4 $2225
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 uiInfo+60856
ADDRLP4 36
INDIRF4
CVFI4 4
ASGNI4
line 6563
;6563:	trap_Cvar_Set("ui_mousePitch", (trap_Cvar_VariableValue("m_pitch") >= 0) ? "0" : "1");
ADDRGP4 $2559
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 0
LTF4 $4545
ADDRLP4 40
ADDRGP4 $351
ASGNP4
ADDRGP4 $4546
JUMPV
LABELV $4545
ADDRLP4 40
ADDRGP4 $354
ASGNP4
LABELV $4546
ADDRGP4 $2556
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6565
;6564:
;6565:	uiInfo.serverStatus.currentServerCinematic = -1;
ADDRGP4 uiInfo+40740+10432
CNSTI4 -1
ASGNI4
line 6566
;6566:	uiInfo.previewMovie = -1;
ADDRGP4 uiInfo+36380
CNSTI4 -1
ASGNI4
line 6568
;6567:
;6568:	trap_Cvar_Register(NULL, "debug_protocol", "", 0 );
CNSTP4 0
ARGP4
ADDRGP4 $4550
ARGP4
ADDRGP4 $165
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 6569
;6569:	trap_Cvar_Register(NULL, "ui_hidelang",	"0", CVAR_INTERNAL );
CNSTP4 0
ARGP4
ADDRGP4 $4551
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 2048
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 6571
;6570:
;6571:	trap_Cvar_Set("ui_actualNetGameType", va("%d", ui_netGameType.integer));
ADDRGP4 $702
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $717
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6572
;6572:}
LABELV $4439
endproc _UI_Init 52 16
export _UI_KeyEvent
proc _UI_KeyEvent 16 12
line 6580
;6573:
;6574:
;6575:/*
;6576:=================
;6577:UI_KeyEvent
;6578:=================
;6579:*/
;6580:void _UI_KeyEvent( int key, qboolean down ) {
line 6582
;6581:
;6582:  if (Menu_Count() > 0) {
ADDRLP4 0
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $4554
line 6583
;6583:    menuDef_t *menu = Menu_GetFocused();
ADDRLP4 8
ADDRGP4 Menu_GetFocused
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 6584
;6584:		if (menu) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4556
line 6585
;6585:			if (key == A_ESCAPE && down && !Menus_AnyFullScreenVisible()) {
ADDRFP4 0
INDIRI4
CNSTI4 27
NEI4 $4558
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $4558
ADDRLP4 12
ADDRGP4 Menus_AnyFullScreenVisible
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $4558
line 6586
;6586:				Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6587
;6587:			} else {
ADDRGP4 $4557
JUMPV
LABELV $4558
line 6588
;6588:				Menu_HandleKey(menu, key, down );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Menu_HandleKey
CALLV
pop
line 6589
;6589:			}
line 6590
;6590:		} else {
ADDRGP4 $4557
JUMPV
LABELV $4556
line 6591
;6591:			trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 12
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6592
;6592:			trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 6593
;6593:			trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2826
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6594
;6594:		}
LABELV $4557
line 6595
;6595:  }
LABELV $4554
line 6600
;6596:
;6597:  //if ((s > 0) && (s != menu_null_sound)) {
;6598:	//  trap_S_StartLocalSound( s, CHAN_LOCAL_SOUND );
;6599:  //}
;6600:}
LABELV $4553
endproc _UI_KeyEvent 16 12
export _UI_MouseEvent
proc _UI_MouseEvent 12 12
line 6608
;6601:
;6602:/*
;6603:=================
;6604:UI_MouseEvent
;6605:=================
;6606:*/
;6607:void _UI_MouseEvent( int dx, int dy )
;6608:{
line 6610
;6609:	// update mouse screen position
;6610:	uiInfo.uiDC.cursorx += dx;
ADDRLP4 0
ADDRGP4 uiInfo+248
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
line 6611
;6611:	if (uiInfo.uiDC.cursorx < 0)
ADDRGP4 uiInfo+248
INDIRI4
CNSTI4 0
GEI4 $4562
line 6612
;6612:		uiInfo.uiDC.cursorx = 0;
ADDRGP4 uiInfo+248
CNSTI4 0
ASGNI4
ADDRGP4 $4563
JUMPV
LABELV $4562
line 6613
;6613:	else if (uiInfo.uiDC.cursorx > SCREEN_WIDTH)
ADDRGP4 uiInfo+248
INDIRI4
CNSTI4 640
LEI4 $4566
line 6614
;6614:		uiInfo.uiDC.cursorx = SCREEN_WIDTH;
ADDRGP4 uiInfo+248
CNSTI4 640
ASGNI4
LABELV $4566
LABELV $4563
line 6616
;6615:
;6616:	uiInfo.uiDC.cursory += dy;
ADDRLP4 4
ADDRGP4 uiInfo+252
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 6617
;6617:	if (uiInfo.uiDC.cursory < 0)
ADDRGP4 uiInfo+252
INDIRI4
CNSTI4 0
GEI4 $4571
line 6618
;6618:		uiInfo.uiDC.cursory = 0;
ADDRGP4 uiInfo+252
CNSTI4 0
ASGNI4
ADDRGP4 $4572
JUMPV
LABELV $4571
line 6619
;6619:	else if (uiInfo.uiDC.cursory > SCREEN_HEIGHT)
ADDRGP4 uiInfo+252
INDIRI4
CNSTI4 480
LEI4 $4575
line 6620
;6620:		uiInfo.uiDC.cursory = SCREEN_HEIGHT;
ADDRGP4 uiInfo+252
CNSTI4 480
ASGNI4
LABELV $4575
LABELV $4572
line 6622
;6621:
;6622:  if (Menu_Count() > 0) {
ADDRLP4 8
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LEI4 $4579
line 6625
;6623:    //menuDef_t *menu = Menu_GetFocused();
;6624:    //Menu_HandleMouseMove(menu, uiInfo.uiDC.cursorx, uiInfo.uiDC.cursory);
;6625:		Display_MouseMove(NULL, uiInfo.uiDC.cursorx, uiInfo.uiDC.cursory);
CNSTP4 0
ARGP4
ADDRGP4 uiInfo+248
INDIRI4
ARGI4
ADDRGP4 uiInfo+252
INDIRI4
ARGI4
ADDRGP4 Display_MouseMove
CALLI4
pop
line 6626
;6626:  }
LABELV $4579
line 6628
;6627:
;6628:}
LABELV $4560
endproc _UI_MouseEvent 12 12
export UI_LoadNonIngame
proc UI_LoadNonIngame 12 8
line 6630
;6629:
;6630:void UI_LoadNonIngame() {
line 6631
;6631:	const char *menuSet = UI_Cvar_VariableString("ui_menuFilesMP");
ADDRGP4 $669
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 6632
;6632:	if (menuSet == NULL || menuSet[0] == '\0') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4586
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4584
LABELV $4586
line 6633
;6633:		menuSet = "ui/jk2mpmenus.txt";
ADDRLP4 0
ADDRGP4 $636
ASGNP4
line 6634
;6634:	}
LABELV $4584
line 6635
;6635:	UI_LoadMenus(menuSet, qfalse);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 6636
;6636:	uiInfo.inGameLoad = qfalse;
ADDRGP4 uiInfo+95200
CNSTI4 0
ASGNI4
line 6637
;6637:}
LABELV $4583
endproc UI_LoadNonIngame 12 8
export _UI_SetActiveMenu
proc _UI_SetActiveMenu 304 12
line 6639
;6638:
;6639:void _UI_SetActiveMenu( uiMenuCommand_t menu ) {
line 6644
;6640:	char buf[256];
;6641:
;6642:	// this should be the ONLY way the menu system is brought up
;6643:	// enusure minumum menu data is cached
;6644:  if (Menu_Count() > 0) {
ADDRLP4 256
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
LEI4 $4589
line 6646
;6645:		vec3_t v;
;6646:		v[0] = v[1] = v[2] = 0;
ADDRLP4 272
CNSTF4 0
ASGNF4
ADDRLP4 260+8
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 260
ADDRLP4 272
INDIRF4
ASGNF4
line 6647
;6647:	  switch ( menu ) {
ADDRLP4 276
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
LTI4 $4593
ADDRLP4 276
INDIRI4
CNSTI4 6
GTI4 $4593
ADDRLP4 276
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $4625
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $4625
address $4596
address $4597
address $4621
address $4623
address $4614
address $4616
address $4624
code
LABELV $4596
line 6649
;6648:	  case UIMENU_NONE:
;6649:			trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 284
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6650
;6650:			trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 6651
;6651:			trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2826
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6652
;6652:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6654
;6653:
;6654:		  return;
ADDRGP4 $4588
JUMPV
LABELV $4597
line 6656
;6655:	  case UIMENU_MAIN:
;6656:		{
line 6657
;6657:			qboolean active = qfalse;
ADDRLP4 288
CNSTI4 0
ASGNI4
line 6660
;6658:
;6659:			//trap_Cvar_Set( "sv_killserver", "1" );
;6660:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6663
;6661:			//trap_S_StartLocalSound( trap_S_RegisterSound("sound/misc/menu_background.wav", qfalse) , CHAN_LOCAL_SOUND );
;6662:			//trap_S_StartBackgroundTrack("sound/misc/menu_background.wav", NULL);
;6663:			if (uiInfo.inGameLoad) 
ADDRGP4 uiInfo+95200
INDIRI4
CNSTI4 0
EQI4 $4598
line 6664
;6664:			{
line 6666
;6665://				UI_LoadNonIngame();
;6666:			}
LABELV $4598
line 6668
;6667:			
;6668:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6669
;6669:			Menus_ActivateByName("main");
ADDRGP4 $2756
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6670
;6670:			trap_Cvar_VariableStringBuffer("com_errorMessage", buf, sizeof(buf));
ADDRGP4 $2678
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 6672
;6671:			
;6672:			if (strlen(buf)) 
ADDRLP4 0
ARGP4
ADDRLP4 292
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $4601
line 6673
;6673:			{
line 6674
;6674:				if (!ui_singlePlayerActive.integer) 
ADDRGP4 ui_singlePlayerActive+12
INDIRI4
CNSTI4 0
NEI4 $4603
line 6675
;6675:				{
line 6676
;6676:					Menus_ActivateByName("error_popmenu");
ADDRGP4 $4606
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6677
;6677:					active = qtrue;
ADDRLP4 288
CNSTI4 1
ASGNI4
line 6678
;6678:				} 
ADDRGP4 $4604
JUMPV
LABELV $4603
line 6680
;6679:				else 
;6680:				{
line 6681
;6681:					trap_Cvar_Set("com_errorMessage", "");
ADDRGP4 $2678
ARGP4
ADDRGP4 $165
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6682
;6682:				}
LABELV $4604
line 6683
;6683:			}
LABELV $4601
line 6685
;6684:
;6685:			if ( !active && (int)trap_Cvar_VariableValue ( "com_othertasks" ) )
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $4588
ADDRGP4 $4609
ARGP4
ADDRLP4 296
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 296
INDIRF4
CVFI4 4
CNSTI4 0
EQI4 $4588
line 6686
;6686:			{
line 6687
;6687:				trap_Cvar_Set("com_othertasks", "0");
ADDRGP4 $4609
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6688
;6688:				if ( !(int)trap_Cvar_VariableValue ( "com_ignoreothertasks" ) )
ADDRGP4 $4612
ARGP4
ADDRLP4 300
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 300
INDIRF4
CVFI4 4
CNSTI4 0
NEI4 $4588
line 6689
;6689:				{
line 6690
;6690:					Menus_ActivateByName("backgroundtask_popmenu");
ADDRGP4 $4613
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6691
;6691:					active = qtrue;
ADDRLP4 288
CNSTI4 1
ASGNI4
line 6692
;6692:				}
line 6693
;6693:			}
line 6695
;6694:
;6695:			return;
ADDRGP4 $4588
JUMPV
LABELV $4614
line 6699
;6696:		}
;6697:
;6698:	  case UIMENU_TEAM:
;6699:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6700
;6700:      Menus_ActivateByName("team");
ADDRGP4 $4615
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6701
;6701:		  return;
ADDRGP4 $4588
JUMPV
LABELV $4616
line 6704
;6702:	  case UIMENU_POSTGAME:
;6703:			//trap_Cvar_Set( "sv_killserver", "1" );
;6704:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6705
;6705:			if (uiInfo.inGameLoad) {
ADDRGP4 uiInfo+95200
INDIRI4
CNSTI4 0
EQI4 $4617
line 6707
;6706://				UI_LoadNonIngame();
;6707:			}
LABELV $4617
line 6708
;6708:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6709
;6709:			Menus_ActivateByName("endofgame");
ADDRGP4 $4620
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6711
;6710:		  //UI_ConfirmMenu( "Bad CD Key", NULL, NeedCDKeyAction );
;6711:		  return;
ADDRGP4 $4588
JUMPV
LABELV $4621
line 6713
;6712:	  case UIMENU_INGAME:
;6713:		  trap_Cvar_Set( "cl_paused", "1" );
ADDRGP4 $2826
ARGP4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 6714
;6714:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6715
;6715:			UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 6716
;6716:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6717
;6717:			Menus_ActivateByName("ingame");
ADDRGP4 $4622
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6718
;6718:		  return;
ADDRGP4 $4588
JUMPV
LABELV $4623
line 6721
;6719:	  case UIMENU_PLAYERCONFIG:
;6720:		 // trap_Cvar_Set( "cl_paused", "1" );
;6721:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6722
;6722:			UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 6723
;6723:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6724
;6724:			Menus_ActivateByName("ingame_player");
ADDRGP4 $1068
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6725
;6725:			UpdateForceUsed();
ADDRGP4 UpdateForceUsed
CALLV
pop
line 6726
;6726:		  return;
ADDRGP4 $4588
JUMPV
LABELV $4624
line 6729
;6727:	  case UIMENU_PLAYERFORCE:
;6728:		 // trap_Cvar_Set( "cl_paused", "1" );
;6729:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 6730
;6730:			UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 6731
;6731:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 6732
;6732:			Menus_ActivateByName("ingame_playerforce");
ADDRGP4 $874
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 6733
;6733:			UpdateForceUsed();
ADDRGP4 UpdateForceUsed
CALLV
pop
line 6734
;6734:		  return;
LABELV $4593
line 6736
;6735:	  }
;6736:  }
LABELV $4589
line 6737
;6737:}
LABELV $4588
endproc _UI_SetActiveMenu 304 12
export _UI_IsFullscreen
proc _UI_IsFullscreen 4 0
line 6739
;6738:
;6739:qboolean _UI_IsFullscreen( void ) {
line 6740
;6740:	return Menus_AnyFullScreenVisible();
ADDRLP4 0
ADDRGP4 Menus_AnyFullScreenVisible
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $4626
endproc _UI_IsFullscreen 4 0
proc UI_ReadableSize 16 16
line 6749
;6741:}
;6742:
;6743:
;6744:
;6745:static connstate_t	lastConnState;
;6746:static char			lastLoadingText[MAX_INFO_VALUE];
;6747:
;6748:static void UI_ReadableSize ( char *buf, int bufsize, int value )
;6749:{
line 6750
;6750:	if (value > 1024*1024*1024 ) { // gigs
ADDRFP4 8
INDIRI4
CNSTI4 1073741824
LEI4 $4628
line 6751
;6751:		Com_sprintf( buf, bufsize, "%d", value / (1024*1024*1024) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $702
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1073741824
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6752
;6752:		Com_sprintf( buf+strlen(buf), bufsize-strlen(buf), ".%02d GB", 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRGP4 $4630
ARGP4
ADDRLP4 12
CNSTI4 1073741824
ASGNI4
CNSTI4 100
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
MODI4
MULI4
ADDRLP4 12
INDIRI4
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6754
;6753:			(value % (1024*1024*1024))*100 / (1024*1024*1024) );
;6754:	} else if (value > 1024*1024 ) { // megs
ADDRGP4 $4629
JUMPV
LABELV $4628
ADDRFP4 8
INDIRI4
CNSTI4 1048576
LEI4 $4631
line 6755
;6755:		Com_sprintf( buf, bufsize, "%d", value / (1024*1024) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $702
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1048576
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6756
;6756:		Com_sprintf( buf+strlen(buf), bufsize-strlen(buf), ".%02d MB", 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRGP4 $4633
ARGP4
ADDRLP4 12
CNSTI4 1048576
ASGNI4
CNSTI4 100
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
MODI4
MULI4
ADDRLP4 12
INDIRI4
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6758
;6757:			(value % (1024*1024))*100 / (1024*1024) );
;6758:	} else if (value > 1024 ) { // kilos
ADDRGP4 $4632
JUMPV
LABELV $4631
ADDRFP4 8
INDIRI4
CNSTI4 1024
LEI4 $4634
line 6759
;6759:		Com_sprintf( buf, bufsize, "%d KB", value / 1024 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4636
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1024
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6760
;6760:	} else { // bytes
ADDRGP4 $4635
JUMPV
LABELV $4634
line 6761
;6761:		Com_sprintf( buf, bufsize, "%d bytes", value );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4637
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6762
;6762:	}
LABELV $4635
LABELV $4632
LABELV $4629
line 6763
;6763:}
LABELV $4627
endproc UI_ReadableSize 16 16
proc UI_PrintTime 8 20
line 6766
;6764:
;6765:// Assumes time is in msec
;6766:static void UI_PrintTime ( char *buf, int bufsize, int time ) {
line 6767
;6767:	time /= 1000;  // change to seconds
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 6769
;6768:
;6769:	if (time > 3600) { // in the hours range
ADDRFP4 8
INDIRI4
CNSTI4 3600
LEI4 $4639
line 6770
;6770:		Com_sprintf( buf, bufsize, "%d hr %2d min", time / 3600, (time % 3600) / 60 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4641
ARGP4
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 3600
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
DIVI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
CNSTI4 60
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6771
;6771:	} else if (time > 60) { // mins
ADDRGP4 $4640
JUMPV
LABELV $4639
ADDRFP4 8
INDIRI4
CNSTI4 60
LEI4 $4642
line 6772
;6772:		Com_sprintf( buf, bufsize, "%2d min %2d sec", time / 60, time % 60 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4644
ARGP4
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 60
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
DIVI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6773
;6773:	} else  { // secs
ADDRGP4 $4643
JUMPV
LABELV $4642
line 6774
;6774:		Com_sprintf( buf, bufsize, "%2d sec", time );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4645
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 6775
;6775:	}
LABELV $4643
LABELV $4640
line 6776
;6776:}
LABELV $4638
endproc UI_PrintTime 8 20
export Text_PaintCenter
proc Text_PaintCenter 8 36
line 6778
;6777:
;6778:void Text_PaintCenter(float x, float y, float scale, vec4_t color, const char *text, float adjust, int iMenuFont) {
line 6779
;6779:	int len = Text_Width(text, scale, iMenuFont);
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 6780
;6780:	Text_Paint(x - len / 2, y, scale, color, text, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE, iMenuFont);
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 6
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 6781
;6781:}
LABELV $4646
endproc Text_PaintCenter 8 36
lit
align 4
LABELV $4648
byte 4 0
byte 4 0
byte 4 0
byte 4 1056964608
code
proc UI_DisplayDownloadInfo 1444 28
line 6784
;6782:
;6783:
;6784:static void UI_DisplayDownloadInfo( const char *downloadName, float centerPoint, float yStart, float scale, int iMenuFont) {
line 6798
;6785:	char sDownLoading[256];
;6786:	char sEstimatedTimeLeft[256];
;6787:	char sTransferRate[256];
;6788:	char sOf[20];
;6789:	char sCopied[256];
;6790:	char sSec[20];
;6791:	//
;6792:	int downloadSize, downloadCount, downloadTime;
;6793:	char dlSizeBuf[64], totalSizeBuf[64], xferRateBuf[64], dlTimeBuf[64];
;6794:	int xferRate;
;6795:	int leftWidth;
;6796:	const char *s;
;6797:
;6798:	vec4_t colorLtGreyAlpha = {0, 0, 0, .5};
ADDRLP4 1176
ADDRGP4 $4648
INDIRB
ASGNB 16
line 6800
;6799:
;6800:	UI_FillRect( 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, colorLtGreyAlpha );
ADDRLP4 1360
CNSTF4 0
ASGNF4
ADDRLP4 1360
INDIRF4
ARGF4
ADDRLP4 1360
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 1176
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 6802
;6801:
;6802:	s = GetCRDelineatedString("MENUS3","DOWNLOAD_STUFF", 0);	// "Downloading:"
ADDRGP4 $961
ARGP4
ADDRGP4 $4649
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1364
ADDRGP4 GetCRDelineatedString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1364
INDIRP4
ASGNP4
line 6803
;6803:	strcpy(sDownLoading,s?s:"");
ADDRLP4 152
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4651
ADDRLP4 1368
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $4652
JUMPV
LABELV $4651
ADDRLP4 1368
ADDRGP4 $165
ASGNP4
LABELV $4652
ADDRLP4 1368
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 6804
;6804:	s = GetCRDelineatedString("MENUS3","DOWNLOAD_STUFF", 1);	// "Estimated time left:"
ADDRGP4 $961
ARGP4
ADDRGP4 $4649
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1372
ADDRGP4 GetCRDelineatedString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1372
INDIRP4
ASGNP4
line 6805
;6805:	strcpy(sEstimatedTimeLeft,s?s:"");
ADDRLP4 408
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4654
ADDRLP4 1376
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $4655
JUMPV
LABELV $4654
ADDRLP4 1376
ADDRGP4 $165
ASGNP4
LABELV $4655
ADDRLP4 1376
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 6806
;6806:	s = GetCRDelineatedString("MENUS3","DOWNLOAD_STUFF", 2);	// "Transfer rate:"
ADDRGP4 $961
ARGP4
ADDRGP4 $4649
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 1380
ADDRGP4 GetCRDelineatedString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1380
INDIRP4
ASGNP4
line 6807
;6807:	strcpy(sTransferRate,s?s:"");
ADDRLP4 664
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4657
ADDRLP4 1384
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $4658
JUMPV
LABELV $4657
ADDRLP4 1384
ADDRGP4 $165
ASGNP4
LABELV $4658
ADDRLP4 1384
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 6808
;6808:	s = GetCRDelineatedString("MENUS3","DOWNLOAD_STUFF", 3);	// "of"
ADDRGP4 $961
ARGP4
ADDRGP4 $4649
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 1388
ADDRGP4 GetCRDelineatedString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1388
INDIRP4
ASGNP4
line 6809
;6809:	strcpy(sOf,s?s:"");
ADDRLP4 1192
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4660
ADDRLP4 1392
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $4661
JUMPV
LABELV $4660
ADDRLP4 1392
ADDRGP4 $165
ASGNP4
LABELV $4661
ADDRLP4 1392
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 6810
;6810:	s = GetCRDelineatedString("MENUS3","DOWNLOAD_STUFF", 4);	// "copied"
ADDRGP4 $961
ARGP4
ADDRGP4 $4649
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 1396
ADDRGP4 GetCRDelineatedString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1396
INDIRP4
ASGNP4
line 6811
;6811:	strcpy(sCopied,s?s:"");
ADDRLP4 920
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4663
ADDRLP4 1400
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $4664
JUMPV
LABELV $4663
ADDRLP4 1400
ADDRGP4 $165
ASGNP4
LABELV $4664
ADDRLP4 1400
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 6812
;6812:	s = GetCRDelineatedString("MENUS3","DOWNLOAD_STUFF", 5);	// "sec."
ADDRGP4 $961
ARGP4
ADDRGP4 $4649
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 1404
ADDRGP4 GetCRDelineatedString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1404
INDIRP4
ASGNP4
line 6813
;6813:	strcpy(sSec,s?s:"");
ADDRLP4 1212
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4666
ADDRLP4 1408
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $4667
JUMPV
LABELV $4666
ADDRLP4 1408
ADDRGP4 $165
ASGNP4
LABELV $4667
ADDRLP4 1408
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 6815
;6814:
;6815:	downloadSize = trap_Cvar_VariableValue( "cl_downloadSize" );
ADDRGP4 $4668
ARGP4
ADDRLP4 1412
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 1412
INDIRF4
CVFI4 4
ASGNI4
line 6816
;6816:	downloadCount = trap_Cvar_VariableValue( "cl_downloadCount" );
ADDRGP4 $4669
ARGP4
ADDRLP4 1416
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 1416
INDIRF4
CVFI4 4
ASGNI4
line 6817
;6817:	downloadTime = trap_Cvar_VariableValue( "cl_downloadTime" );
ADDRGP4 $4670
ARGP4
ADDRLP4 1420
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 1420
INDIRF4
CVFI4 4
ASGNI4
line 6819
;6818:
;6819:	leftWidth = 320;
ADDRLP4 12
CNSTI4 320
ASGNI4
line 6821
;6820:
;6821:	UI_SetColor(colorWhite);
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 6823
;6822:
;6823:	Text_PaintCenter(centerPoint, yStart + 112, scale, colorWhite, sDownLoading, 0, iMenuFont);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1121976320
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 152
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6824
;6824:	Text_PaintCenter(centerPoint, yStart + 192, scale, colorWhite, sEstimatedTimeLeft, 0, iMenuFont);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1128267776
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 408
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6825
;6825:	Text_PaintCenter(centerPoint, yStart + 248, scale, colorWhite, sTransferRate, 0, iMenuFont);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1131937792
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 664
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6827
;6826:
;6827:	if (downloadSize > 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $4671
line 6828
;6828:		s = va( "%s (%d%%)", downloadName, downloadCount * 100 / downloadSize );
ADDRGP4 $4673
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRI4
DIVI4
ARGI4
ADDRLP4 1424
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1424
INDIRP4
ASGNP4
line 6829
;6829:	} else {
ADDRGP4 $4672
JUMPV
LABELV $4671
line 6830
;6830:		s = downloadName;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 6831
;6831:	}
LABELV $4672
line 6833
;6832:
;6833:	Text_PaintCenter(centerPoint, yStart+136, scale, colorWhite, s, 0, iMenuFont);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1124597760
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6835
;6834:
;6835:	UI_ReadableSize( dlSizeBuf,		sizeof dlSizeBuf,		downloadCount );
ADDRLP4 16
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 6836
;6836:	UI_ReadableSize( totalSizeBuf,	sizeof totalSizeBuf,	downloadSize );
ADDRLP4 80
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 6838
;6837:
;6838:	if (downloadCount < 4096 || !downloadTime) {
ADDRLP4 8
INDIRI4
CNSTI4 4096
LTI4 $4676
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $4674
LABELV $4676
line 6839
;6839:		Text_PaintCenter(leftWidth, yStart+216, scale, colorWhite, "estimating", 0, iMenuFont);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1129840640
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $4677
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6840
;6840:		Text_PaintCenter(leftWidth, yStart+160, scale, colorWhite, va("(%s %s %s %s)", dlSizeBuf, sOf, totalSizeBuf, sCopied), 0, iMenuFont);
ADDRGP4 $4678
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 1192
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 920
ARGP4
ADDRLP4 1424
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1126170624
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 1424
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6841
;6841:	} else {
ADDRGP4 $4675
JUMPV
LABELV $4674
line 6842
;6842:		if ((uiInfo.uiDC.realTime - downloadTime) / 1000) {
ADDRGP4 uiInfo+240
INDIRI4
ADDRLP4 144
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
CNSTI4 0
EQI4 $4679
line 6843
;6843:			xferRate = downloadCount / ((uiInfo.uiDC.realTime - downloadTime) / 1000);
ADDRLP4 148
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+240
INDIRI4
ADDRLP4 144
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
DIVI4
ASGNI4
line 6844
;6844:		} else {
ADDRGP4 $4680
JUMPV
LABELV $4679
line 6845
;6845:			xferRate = 0;
ADDRLP4 148
CNSTI4 0
ASGNI4
line 6846
;6846:		}
LABELV $4680
line 6847
;6847:		UI_ReadableSize( xferRateBuf, sizeof xferRateBuf, xferRate );
ADDRLP4 1232
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 148
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 6850
;6848:
;6849:		// Extrapolate estimated completion time
;6850:		if (downloadSize && xferRate) {
ADDRLP4 1424
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 1424
INDIRI4
EQI4 $4683
ADDRLP4 148
INDIRI4
ADDRLP4 1424
INDIRI4
EQI4 $4683
line 6851
;6851:			int n = downloadSize / xferRate; // estimated time for entire d/l in secs
ADDRLP4 1428
ADDRLP4 4
INDIRI4
ADDRLP4 148
INDIRI4
DIVI4
ASGNI4
line 6854
;6852:
;6853:			// We do it in K (/1024) because we'd overflow around 4MB
;6854:			UI_PrintTime ( dlTimeBuf, sizeof dlTimeBuf, 
ADDRLP4 1296
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 1432
ADDRLP4 1428
INDIRI4
ASGNI4
ADDRLP4 1436
CNSTI4 1024
ASGNI4
CNSTI4 1000
ADDRLP4 1432
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 1436
INDIRI4
DIVI4
ADDRLP4 1432
INDIRI4
MULI4
ADDRLP4 4
INDIRI4
ADDRLP4 1436
INDIRI4
DIVI4
DIVI4
SUBI4
MULI4
ARGI4
ADDRGP4 UI_PrintTime
CALLV
pop
line 6857
;6855:				(n - (((downloadCount/1024) * n) / (downloadSize/1024))) * 1000);
;6856:
;6857:			Text_PaintCenter(leftWidth, yStart+216, scale, colorWhite, dlTimeBuf, 0, iMenuFont);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1129840640
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 1296
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6858
;6858:			Text_PaintCenter(leftWidth, yStart+160, scale, colorWhite, va("(%s %s %s %s)", dlSizeBuf, sOf, totalSizeBuf, sCopied), 0, iMenuFont);
ADDRGP4 $4678
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 1192
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 920
ARGP4
ADDRLP4 1440
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1126170624
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 1440
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6859
;6859:		} else {
ADDRGP4 $4684
JUMPV
LABELV $4683
line 6860
;6860:			Text_PaintCenter(leftWidth, yStart+216, scale, colorWhite, "estimating", 0, iMenuFont);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1129840640
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $4677
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6861
;6861:			if (downloadSize) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $4685
line 6862
;6862:				Text_PaintCenter(leftWidth, yStart+160, scale, colorWhite, va("(%s %s %s %s)", dlSizeBuf, sOf, totalSizeBuf, sCopied), 0, iMenuFont);
ADDRGP4 $4678
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 1192
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 920
ARGP4
ADDRLP4 1428
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1126170624
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 1428
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6863
;6863:			} else {
ADDRGP4 $4686
JUMPV
LABELV $4685
line 6864
;6864:				Text_PaintCenter(leftWidth, yStart+160, scale, colorWhite, va("(%s %s)", dlSizeBuf, sCopied), 0, iMenuFont);
ADDRGP4 $4687
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 920
ARGP4
ADDRLP4 1428
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1126170624
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 1428
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6865
;6865:			}
LABELV $4686
line 6866
;6866:		}
LABELV $4684
line 6868
;6867:
;6868:		if (xferRate) {
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $4688
line 6869
;6869:			Text_PaintCenter(leftWidth, yStart+272, scale, colorWhite, va("%s/%s", xferRateBuf,sSec), 0, iMenuFont);
ADDRGP4 $4690
ARGP4
ADDRLP4 1232
ARGP4
ADDRLP4 1212
ARGP4
ADDRLP4 1428
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1132986368
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 1428
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6870
;6870:		}
LABELV $4688
line 6871
;6871:	}
LABELV $4675
line 6872
;6872:}
LABELV $4647
endproc UI_DisplayDownloadInfo 1444 28
export UI_DrawConnectScreen
proc UI_DrawConnectScreen 5688 28
line 6882
;6873:
;6874:/*
;6875:========================
;6876:UI_DrawConnectScreen
;6877:
;6878:This will also be overlaid on the cgame info screen during loading
;6879:to prevent it from blinking away too rapidly on local or lan games.
;6880:========================
;6881:*/
;6882:void UI_DrawConnectScreen( qboolean overlay ) {
line 6891
;6883:	const char *s;
;6884:	uiClientState_t	cstate;
;6885:	char			info[MAX_INFO_VALUE];
;6886:	char text[256];
;6887:	float centerPoint, yStart, scale;
;6888:
;6889:	char sStripEdTemp[256];
;6890:
;6891:	menuDef_t *menu = Menus_FindByName("Connect");
ADDRGP4 $4692
ARGP4
ADDRLP4 4640
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 4376
ADDRLP4 4640
INDIRP4
ASGNP4
line 6894
;6892:
;6893:
;6894:	if ( !overlay && menu ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $4693
ADDRLP4 4376
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4693
line 6895
;6895:		Menu_Paint(menu, qtrue);
ADDRLP4 4376
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_Paint
CALLV
pop
line 6896
;6896:	}
LABELV $4693
line 6898
;6897:
;6898:	if (!overlay) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $4695
line 6899
;6899:		centerPoint = 320;
ADDRLP4 3340
CNSTF4 1134559232
ASGNF4
line 6900
;6900:		yStart = 130;
ADDRLP4 3348
CNSTF4 1124204544
ASGNF4
line 6901
;6901:		scale = 1.0f;	// -ste
ADDRLP4 3344
CNSTF4 1065353216
ASGNF4
line 6902
;6902:	} else {
ADDRGP4 $4696
JUMPV
LABELV $4695
line 6903
;6903:		centerPoint = 320;
ADDRLP4 3340
CNSTF4 1134559232
ASGNF4
line 6904
;6904:		yStart = 32;
ADDRLP4 3348
CNSTF4 1107296256
ASGNF4
line 6905
;6905:		scale = 1.0f;	// -ste
ADDRLP4 3344
CNSTF4 1065353216
ASGNF4
line 6906
;6906:		return;
ADDRGP4 $4691
JUMPV
LABELV $4696
line 6910
;6907:	}
;6908:
;6909:	// see what information we should display
;6910:	trap_GetClientState( &cstate );
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 6913
;6911:
;6912:
;6913:	info[0] = '\0';
ADDRLP4 3352
CNSTI1 0
ASGNI1
line 6914
;6914:	if( trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) ) ) {
CNSTI4 0
ARGI4
ADDRLP4 3352
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4644
ADDRGP4 trap_GetConfigString
CALLI4
ASGNI4
ADDRLP4 4644
INDIRI4
CNSTI4 0
EQI4 $4697
line 6915
;6915:		trap_SP_GetStringTextString("MENUS3_LOADING_MAPNAME", sStripEdTemp, sizeof(sStripEdTemp));
ADDRGP4 $4699
ARGP4
ADDRLP4 3084
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 6916
;6916:		Text_PaintCenter(centerPoint, yStart, scale, colorWhite, va( /*"Loading %s"*/sStripEdTemp, Info_ValueForKey( info, "mapname" )), 0, FONT_MEDIUM);
ADDRLP4 3352
ARGP4
ADDRGP4 $3386
ARGP4
ADDRLP4 4648
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3084
ARGP4
ADDRLP4 4648
INDIRP4
ARGP4
ADDRLP4 4652
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 3340
INDIRF4
ARGF4
ADDRLP4 3348
INDIRF4
ARGF4
ADDRLP4 3344
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4652
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6917
;6917:	}
LABELV $4697
line 6919
;6918:
;6919:	if (!Q_stricmp(cstate.servername,"localhost")) {
ADDRLP4 0+12
ARGP4
ADDRGP4 $4703
ARGP4
ADDRLP4 4648
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4648
INDIRI4
CNSTI4 0
NEI4 $4700
line 6920
;6920:		trap_SP_GetStringTextString("MENUS3_STARTING_UP", sStripEdTemp, sizeof(sStripEdTemp));
ADDRGP4 $4704
ARGP4
ADDRLP4 3084
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 6921
;6921:		Text_PaintCenter(centerPoint, yStart + 48, scale, colorWhite, sStripEdTemp, ITEM_TEXTSTYLE_SHADOWEDMORE, FONT_MEDIUM);
ADDRLP4 3340
INDIRF4
ARGF4
ADDRLP4 3348
INDIRF4
CNSTF4 1111490560
ADDF4
ARGF4
ADDRLP4 3344
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 3084
ARGP4
CNSTF4 1086324736
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6922
;6922:	} else {
ADDRGP4 $4701
JUMPV
LABELV $4700
line 6923
;6923:		trap_SP_GetStringTextString("MENUS3_CONNECTING_TO", sStripEdTemp, sizeof(sStripEdTemp));
ADDRGP4 $4705
ARGP4
ADDRLP4 3084
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 6924
;6924:		strcpy(text, va(/*"Connecting to %s"*/sStripEdTemp, cstate.servername));
ADDRLP4 3084
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 4652
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4380
ARGP4
ADDRLP4 4652
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 6925
;6925:		Text_PaintCenter(centerPoint, yStart + 48, scale, colorWhite,text , ITEM_TEXTSTYLE_SHADOWEDMORE, FONT_MEDIUM);
ADDRLP4 3340
INDIRF4
ARGF4
ADDRLP4 3348
INDIRF4
CNSTF4 1111490560
ADDF4
ARGF4
ADDRLP4 3344
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4380
ARGP4
CNSTF4 1086324736
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6926
;6926:	}
LABELV $4701
line 6931
;6927:
;6928:	//UI_DrawProportionalString( 320, 96, "Press Esc to abort", UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, menu_text_color );
;6929:
;6930:	// display global MOTD at bottom
;6931:	Text_PaintCenter(centerPoint, 425, scale, colorWhite, Info_ValueForKey( cstate.updateInfoString, "motd" ), 0, FONT_MEDIUM);
ADDRLP4 0+1036
ARGP4
ADDRGP4 $4708
ARGP4
ADDRLP4 4652
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3340
INDIRF4
ARGF4
CNSTF4 1137999872
ARGF4
ADDRLP4 3344
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4652
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6933
;6932:	// print any server info (server full, bad version, etc)
;6933:	if ( cstate.connState < CA_CONNECTED ) {
ADDRLP4 0
INDIRI4
CNSTI4 5
GEI4 $4709
line 6934
;6934:		Text_PaintCenter(centerPoint, yStart + 176, scale, colorWhite, cstate.messageString, 0, FONT_MEDIUM);
ADDRLP4 3340
INDIRF4
ARGF4
ADDRLP4 3348
INDIRF4
CNSTF4 1127219200
ADDF4
ARGF4
ADDRLP4 3344
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0+2060
ARGP4
CNSTF4 0
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6935
;6935:	}
LABELV $4709
line 6937
;6936:
;6937:	if ( lastConnState > cstate.connState ) {
ADDRGP4 lastConnState
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $4712
line 6938
;6938:		lastLoadingText[0] = '\0';
ADDRGP4 lastLoadingText
CNSTI1 0
ASGNI1
line 6939
;6939:	}
LABELV $4712
line 6940
;6940:	lastConnState = cstate.connState;
ADDRGP4 lastConnState
ADDRLP4 0
INDIRI4
ASGNI4
line 6942
;6941:
;6942:	switch ( cstate.connState ) {
ADDRLP4 4656
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 4656
INDIRI4
CNSTI4 3
LTI4 $4691
ADDRLP4 4656
INDIRI4
CNSTI4 7
GTI4 $4691
ADDRLP4 4656
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $4730-12
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $4730
address $4717
address $4720
address $4723
address $4691
address $4691
code
LABELV $4717
line 6944
;6943:	case CA_CONNECTING:
;6944:		{
line 6945
;6945:			trap_SP_GetStringTextString("MENUS3_AWAITING_CONNECTION", sStripEdTemp, sizeof(sStripEdTemp));
ADDRGP4 $4718
ARGP4
ADDRLP4 3084
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 6946
;6946:			s = va(/*"Awaiting connection...%i"*/sStripEdTemp, cstate.connectPacketCount);
ADDRLP4 3084
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 4664
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4636
ADDRLP4 4664
INDIRP4
ASGNP4
line 6947
;6947:		}
line 6948
;6948:		break;
ADDRGP4 $4715
JUMPV
LABELV $4720
line 6950
;6949:	case CA_CHALLENGING:
;6950:		{
line 6951
;6951:			trap_SP_GetStringTextString("MENUS3_AWAITING_CHALLENGE", sStripEdTemp, sizeof(sStripEdTemp));
ADDRGP4 $4721
ARGP4
ADDRLP4 3084
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 6952
;6952:			s = va(/*"Awaiting challenge...%i"*/sStripEdTemp, cstate.connectPacketCount);
ADDRLP4 3084
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 4664
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4636
ADDRLP4 4664
INDIRP4
ASGNP4
line 6953
;6953:		}
line 6954
;6954:		break;
ADDRGP4 $4715
JUMPV
LABELV $4723
line 6955
;6955:	case CA_CONNECTED: {
line 6958
;6956:		char downloadName[MAX_INFO_VALUE];
;6957:
;6958:			trap_Cvar_VariableStringBuffer( "cl_downloadName", downloadName, sizeof(downloadName) );
ADDRGP4 $4724
ARGP4
ADDRLP4 4664
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 6959
;6959:			if (*downloadName) {
ADDRLP4 4664
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $4725
line 6960
;6960:				UI_DisplayDownloadInfo( downloadName, centerPoint, yStart, scale, FONT_MEDIUM );
ADDRLP4 4664
ARGP4
ADDRLP4 3340
INDIRF4
ARGF4
ADDRLP4 3348
INDIRF4
ARGF4
ADDRLP4 3344
INDIRF4
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 UI_DisplayDownloadInfo
CALLV
pop
line 6961
;6961:				return;
ADDRGP4 $4691
JUMPV
LABELV $4725
line 6963
;6962:			}
;6963:		}
line 6964
;6964:		trap_SP_GetStringTextString("MENUS3_AWAITING_GAMESTATE", sStripEdTemp, sizeof(sStripEdTemp));
ADDRGP4 $4727
ARGP4
ADDRLP4 3084
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_SP_GetStringTextString
CALLI4
pop
line 6965
;6965:		s = /*"Awaiting gamestate..."*/sStripEdTemp;
ADDRLP4 4636
ADDRLP4 3084
ASGNP4
line 6966
;6966:		break;
line 6968
;6967:	case CA_LOADING:
;6968:		return;
line 6970
;6969:	case CA_PRIMED:
;6970:		return;
line 6972
;6971:	default:
;6972:		return;
LABELV $4715
line 6975
;6973:	}
;6974:
;6975:	if (Q_stricmp(cstate.servername,"localhost")) {
ADDRLP4 0+12
ARGP4
ADDRGP4 $4703
ARGP4
ADDRLP4 4664
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4664
INDIRI4
CNSTI4 0
EQI4 $4732
line 6976
;6976:		Text_PaintCenter(centerPoint, yStart + 80, scale, colorWhite, s, 0, FONT_MEDIUM);
ADDRLP4 3340
INDIRF4
ARGF4
ADDRLP4 3348
INDIRF4
CNSTF4 1117782016
ADDF4
ARGF4
ADDRLP4 3344
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4636
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 6977
;6977:	}
LABELV $4732
line 6980
;6978:
;6979:	// password required / connection rejected information goes here
;6980:}
LABELV $4691
endproc UI_DrawConnectScreen 5688 28
data
align 4
LABELV cvarTable
address ui_ffa_fraglimit
address $4736
address $690
byte 4 1
address ui_ffa_timelimit
address $4737
address $351
byte 4 1
address ui_tourney_fraglimit
address $4738
address $351
byte 4 1
address ui_tourney_timelimit
address $4739
address $691
byte 4 1
address ui_selectedModelIndex
address $3985
address $4740
byte 4 1
address ui_team_fraglimit
address $4741
address $351
byte 4 1
address ui_team_timelimit
address $4742
address $690
byte 4 1
address ui_team_friendly
address $4743
address $354
byte 4 1
address ui_ctf_capturelimit
address $4744
address $4745
byte 4 1
address ui_ctf_timelimit
address $4746
address $688
byte 4 1
address ui_ctf_friendly
address $4747
address $351
byte 4 1
address ui_arenasFile
address $4748
address $165
byte 4 80
address ui_botsFile
address $4749
address $165
byte 4 80
address ui_spScores1
address $4750
address $165
byte 4 65
address ui_spScores2
address $4751
address $165
byte 4 65
address ui_spScores3
address $4752
address $165
byte 4 65
address ui_spScores4
address $4753
address $165
byte 4 65
address ui_spScores5
address $4754
address $165
byte 4 65
address ui_spAwards
address $4755
address $165
byte 4 65
address ui_spVideos
address $4756
address $165
byte 4 65
address ui_spSkill
address $826
address $2511
byte 4 1
address ui_spSelection
address $4757
address $165
byte 4 64
address ui_browserMaster
address $4758
address $351
byte 4 1
address ui_browserGameType
address $4759
address $351
byte 4 1
address ui_browserSortKey
address $4760
address $2604
byte 4 1
address ui_browserShowFull
address $4761
address $354
byte 4 1
address ui_browserShowEmpty
address $4762
address $354
byte 4 1
address ui_drawCrosshair
address $2225
address $354
byte 4 1
address ui_drawCrosshairNames
address $4763
address $354
byte 4 1
address ui_marks
address $4764
address $354
byte 4 1
address ui_server1
address $4765
address $165
byte 4 1
address ui_server2
address $4766
address $165
byte 4 1
address ui_server3
address $4767
address $165
byte 4 1
address ui_server4
address $4768
address $165
byte 4 1
address ui_server5
address $4769
address $165
byte 4 1
address ui_server6
address $4770
address $165
byte 4 1
address ui_server7
address $4771
address $165
byte 4 1
address ui_server8
address $4772
address $165
byte 4 1
address ui_server9
address $4773
address $165
byte 4 1
address ui_server10
address $4774
address $165
byte 4 1
address ui_server11
address $4775
address $165
byte 4 1
address ui_server12
address $4776
address $165
byte 4 1
address ui_server13
address $4777
address $165
byte 4 1
address ui_server14
address $4778
address $165
byte 4 1
address ui_server15
address $4779
address $165
byte 4 1
address ui_server16
address $4780
address $165
byte 4 1
address ui_cdkeychecked
address $4781
address $351
byte 4 64
address ui_debug
address $4782
address $351
byte 4 256
address ui_initialized
address $4783
address $351
byte 4 256
address ui_teamName
address $697
address $4784
byte 4 1
address ui_opponentName
address $1226
address $4785
byte 4 1
address ui_rankChange
address $410
address $351
byte 4 1
address ui_freeSaber
address $4786
address $351
byte 4 1
address ui_forcePowerDisable
address $4787
address $351
byte 4 1
address ui_redteam
address $4788
address $4784
byte 4 1
address ui_blueteam
address $4789
address $4785
byte 4 1
address ui_dedicated
address $4790
address $351
byte 4 1
address ui_gameType
address $4791
address $351
byte 4 1
address ui_joinGameType
address $4792
address $351
byte 4 1
address ui_netGameType
address $4793
address $351
byte 4 1
address ui_actualNetGameType
address $4794
address $4795
byte 4 1
address ui_redteam1
address $4796
address $354
byte 4 1
address ui_redteam2
address $4797
address $354
byte 4 1
address ui_redteam3
address $4798
address $354
byte 4 1
address ui_redteam4
address $4799
address $354
byte 4 1
address ui_redteam5
address $4800
address $354
byte 4 1
address ui_redteam6
address $4801
address $354
byte 4 1
address ui_redteam7
address $4802
address $354
byte 4 1
address ui_redteam8
address $4803
address $354
byte 4 1
address ui_blueteam1
address $4804
address $354
byte 4 1
address ui_blueteam2
address $4805
address $354
byte 4 1
address ui_blueteam3
address $4806
address $354
byte 4 1
address ui_blueteam4
address $4807
address $354
byte 4 1
address ui_blueteam5
address $4808
address $354
byte 4 1
address ui_blueteam6
address $4809
address $354
byte 4 1
address ui_blueteam7
address $4810
address $354
byte 4 1
address ui_blueteam8
address $4811
address $354
byte 4 1
address ui_netSource
address $2140
address $351
byte 4 1
address ui_menuFiles
address $669
address $636
byte 4 1
address ui_currentTier
address $1158
address $351
byte 4 1
address ui_currentMap
address $983
address $351
byte 4 1
address ui_currentNetMap
address $981
address $351
byte 4 1
address ui_mapIndex
address $2374
address $351
byte 4 1
address ui_currentOpponent
address $4812
address $351
byte 4 1
address ui_selectedPlayer
address $1545
address $351
byte 4 1
address ui_selectedPlayerName
address $1553
address $165
byte 4 1
address ui_lastServerRefresh_0
address $4813
address $165
byte 4 1
address ui_lastServerRefresh_1
address $4814
address $165
byte 4 1
address ui_lastServerRefresh_2
address $4815
address $165
byte 4 1
address ui_lastServerRefresh_3
address $4816
address $165
byte 4 1
address ui_singlePlayerActive
address $2387
address $351
byte 4 0
address ui_scoreAccuracy
address $4817
address $351
byte 4 1
address ui_scoreImpressives
address $4818
address $351
byte 4 1
address ui_scoreExcellents
address $4819
address $351
byte 4 1
address ui_scoreCaptures
address $4820
address $351
byte 4 1
address ui_scoreDefends
address $4821
address $351
byte 4 1
address ui_scoreAssists
address $4822
address $351
byte 4 1
address ui_scoreGauntlets
address $4823
address $351
byte 4 1
address ui_scoreScore
address $4824
address $351
byte 4 1
address ui_scorePerfect
address $4825
address $351
byte 4 1
address ui_scoreTeam
address $4826
address $4827
byte 4 1
address ui_scoreBase
address $4828
address $351
byte 4 1
address ui_scoreTime
address $4829
address $4830
byte 4 1
address ui_scoreTimeBonus
address $4831
address $351
byte 4 1
address ui_scoreSkillBonus
address $4832
address $351
byte 4 1
address ui_scoreShutoutBonus
address $4833
address $351
byte 4 1
address ui_fragLimit
address $703
address $692
byte 4 0
address ui_captureLimit
address $701
address $693
byte 4 0
address ui_smallFont
address $4834
address $4835
byte 4 1
address ui_bigFont
address $4836
address $4837
byte 4 1
address ui_findPlayer
address $3474
address $1224
byte 4 1
address ui_Q3Model
address $4838
address $351
byte 4 1
address ui_recordSPDemo
address $2407
address $351
byte 4 1
address ui_realWarmUp
address $2399
address $690
byte 4 1
address ui_realCaptureLimit
address $704
address $4745
byte 4 1029
address ui_serverStatusTimeOut
address $4839
address $4840
byte 4 1
address s_language
address $4841
address $4842
byte 4 1025
align 4
LABELV cvarTableSize
byte 4 117
export UI_RegisterCvars
code
proc UI_RegisterCvars 12 16
line 7261
;6981:
;6982:
;6983:/*
;6984:================
;6985:cvars
;6986:================
;6987:*/
;6988:
;6989:typedef struct {
;6990:	vmCvar_t	*vmCvar;
;6991:	char		*cvarName;
;6992:	char		*defaultString;
;6993:	int			cvarFlags;
;6994:} cvarTable_t;
;6995:
;6996:vmCvar_t	ui_ffa_fraglimit;
;6997:vmCvar_t	ui_ffa_timelimit;
;6998:
;6999:vmCvar_t	ui_tourney_fraglimit;
;7000:vmCvar_t	ui_tourney_timelimit;
;7001:
;7002:vmCvar_t	ui_selectedModelIndex;
;7003:
;7004:vmCvar_t	ui_team_fraglimit;
;7005:vmCvar_t	ui_team_timelimit;
;7006:vmCvar_t	ui_team_friendly;
;7007:
;7008:vmCvar_t	ui_ctf_capturelimit;
;7009:vmCvar_t	ui_ctf_timelimit;
;7010:vmCvar_t	ui_ctf_friendly;
;7011:
;7012:vmCvar_t	ui_arenasFile;
;7013:vmCvar_t	ui_botsFile;
;7014:vmCvar_t	ui_spScores1;
;7015:vmCvar_t	ui_spScores2;
;7016:vmCvar_t	ui_spScores3;
;7017:vmCvar_t	ui_spScores4;
;7018:vmCvar_t	ui_spScores5;
;7019:vmCvar_t	ui_spAwards;
;7020:vmCvar_t	ui_spVideos;
;7021:vmCvar_t	ui_spSkill;
;7022:
;7023:vmCvar_t	ui_spSelection;
;7024:
;7025:vmCvar_t	ui_browserMaster;
;7026:vmCvar_t	ui_browserGameType;
;7027:vmCvar_t	ui_browserSortKey;
;7028:vmCvar_t	ui_browserShowFull;
;7029:vmCvar_t	ui_browserShowEmpty;
;7030:
;7031:vmCvar_t	ui_drawCrosshair;
;7032:vmCvar_t	ui_drawCrosshairNames;
;7033:vmCvar_t	ui_marks;
;7034:
;7035:vmCvar_t	ui_server1;
;7036:vmCvar_t	ui_server2;
;7037:vmCvar_t	ui_server3;
;7038:vmCvar_t	ui_server4;
;7039:vmCvar_t	ui_server5;
;7040:vmCvar_t	ui_server6;
;7041:vmCvar_t	ui_server7;
;7042:vmCvar_t	ui_server8;
;7043:vmCvar_t	ui_server9;
;7044:vmCvar_t	ui_server10;
;7045:vmCvar_t	ui_server11;
;7046:vmCvar_t	ui_server12;
;7047:vmCvar_t	ui_server13;
;7048:vmCvar_t	ui_server14;
;7049:vmCvar_t	ui_server15;
;7050:vmCvar_t	ui_server16;
;7051:
;7052:vmCvar_t	ui_cdkeychecked;
;7053:
;7054:vmCvar_t	ui_redteam;
;7055:vmCvar_t	ui_redteam1;
;7056:vmCvar_t	ui_redteam2;
;7057:vmCvar_t	ui_redteam3;
;7058:vmCvar_t	ui_redteam4;
;7059:vmCvar_t	ui_redteam5;
;7060:vmCvar_t	ui_redteam6;
;7061:vmCvar_t	ui_redteam7;
;7062:vmCvar_t	ui_redteam8;
;7063:vmCvar_t	ui_blueteam;
;7064:vmCvar_t	ui_blueteam1;
;7065:vmCvar_t	ui_blueteam2;
;7066:vmCvar_t	ui_blueteam3;
;7067:vmCvar_t	ui_blueteam4;
;7068:vmCvar_t	ui_blueteam5;
;7069:vmCvar_t	ui_blueteam6;
;7070:vmCvar_t	ui_blueteam7;
;7071:vmCvar_t	ui_blueteam8;
;7072:vmCvar_t	ui_teamName;
;7073:vmCvar_t	ui_dedicated;
;7074:vmCvar_t	ui_gameType;
;7075:vmCvar_t	ui_netGameType;
;7076:vmCvar_t	ui_actualNetGameType;
;7077:vmCvar_t	ui_joinGameType;
;7078:vmCvar_t	ui_netSource;
;7079:vmCvar_t	ui_serverFilterType;
;7080:vmCvar_t	ui_opponentName;
;7081:vmCvar_t	ui_menuFiles;
;7082:vmCvar_t	ui_currentTier;
;7083:vmCvar_t	ui_currentMap;
;7084:vmCvar_t	ui_currentNetMap;
;7085:vmCvar_t	ui_mapIndex;
;7086:vmCvar_t	ui_currentOpponent;
;7087:vmCvar_t	ui_selectedPlayer;
;7088:vmCvar_t	ui_selectedPlayerName;
;7089:vmCvar_t	ui_lastServerRefresh_0;
;7090:vmCvar_t	ui_lastServerRefresh_1;
;7091:vmCvar_t	ui_lastServerRefresh_2;
;7092:vmCvar_t	ui_lastServerRefresh_3;
;7093:vmCvar_t	ui_singlePlayerActive;
;7094:vmCvar_t	ui_scoreAccuracy;
;7095:vmCvar_t	ui_scoreImpressives;
;7096:vmCvar_t	ui_scoreExcellents;
;7097:vmCvar_t	ui_scoreCaptures;
;7098:vmCvar_t	ui_scoreDefends;
;7099:vmCvar_t	ui_scoreAssists;
;7100:vmCvar_t	ui_scoreGauntlets;
;7101:vmCvar_t	ui_scoreScore;
;7102:vmCvar_t	ui_scorePerfect;
;7103:vmCvar_t	ui_scoreTeam;
;7104:vmCvar_t	ui_scoreBase;
;7105:vmCvar_t	ui_scoreTimeBonus;
;7106:vmCvar_t	ui_scoreSkillBonus;
;7107:vmCvar_t	ui_scoreShutoutBonus;
;7108:vmCvar_t	ui_scoreTime;
;7109:vmCvar_t	ui_captureLimit;
;7110:vmCvar_t	ui_fragLimit;
;7111:vmCvar_t	ui_smallFont;
;7112:vmCvar_t	ui_bigFont;
;7113:vmCvar_t	ui_findPlayer;
;7114:vmCvar_t	ui_Q3Model;
;7115:vmCvar_t	ui_hudFiles;
;7116:vmCvar_t	ui_recordSPDemo;
;7117:vmCvar_t	ui_realCaptureLimit;
;7118:vmCvar_t	ui_realWarmUp;
;7119:vmCvar_t	ui_serverStatusTimeOut;
;7120:vmCvar_t	s_language;
;7121:
;7122:// bk001129 - made static to avoid aliasing
;7123:static cvarTable_t		cvarTable[] = {
;7124:	{ &ui_ffa_fraglimit, "ui_ffa_fraglimit", "20", CVAR_ARCHIVE },
;7125:	{ &ui_ffa_timelimit, "ui_ffa_timelimit", "0", CVAR_ARCHIVE },
;7126:
;7127:	{ &ui_tourney_fraglimit, "ui_tourney_fraglimit", "0", CVAR_ARCHIVE },
;7128:	{ &ui_tourney_timelimit, "ui_tourney_timelimit", "15", CVAR_ARCHIVE },
;7129:
;7130:	{ &ui_selectedModelIndex, "ui_selectedModelIndex", "16", CVAR_ARCHIVE },
;7131:
;7132:	{ &ui_team_fraglimit, "ui_team_fraglimit", "0", CVAR_ARCHIVE },
;7133:	{ &ui_team_timelimit, "ui_team_timelimit", "20", CVAR_ARCHIVE },
;7134:	{ &ui_team_friendly, "ui_team_friendly",  "1", CVAR_ARCHIVE },
;7135:
;7136:	{ &ui_ctf_capturelimit, "ui_ctf_capturelimit", "8", CVAR_ARCHIVE },
;7137:	{ &ui_ctf_timelimit, "ui_ctf_timelimit", "30", CVAR_ARCHIVE },
;7138:	{ &ui_ctf_friendly, "ui_ctf_friendly",  "0", CVAR_ARCHIVE },
;7139:
;7140:	{ &ui_arenasFile, "g_arenasFile", "", CVAR_INIT|CVAR_ROM },
;7141:	{ &ui_botsFile, "g_botsFile", "", CVAR_INIT|CVAR_ROM },
;7142:	{ &ui_spScores1, "g_spScores1", "", CVAR_ARCHIVE | CVAR_ROM },
;7143:	{ &ui_spScores2, "g_spScores2", "", CVAR_ARCHIVE | CVAR_ROM },
;7144:	{ &ui_spScores3, "g_spScores3", "", CVAR_ARCHIVE | CVAR_ROM },
;7145:	{ &ui_spScores4, "g_spScores4", "", CVAR_ARCHIVE | CVAR_ROM },
;7146:	{ &ui_spScores5, "g_spScores5", "", CVAR_ARCHIVE | CVAR_ROM },
;7147:	{ &ui_spAwards, "g_spAwards", "", CVAR_ARCHIVE | CVAR_ROM },
;7148:	{ &ui_spVideos, "g_spVideos", "", CVAR_ARCHIVE | CVAR_ROM },
;7149:	{ &ui_spSkill, "g_spSkill", "2", CVAR_ARCHIVE },
;7150:
;7151:	{ &ui_spSelection, "ui_spSelection", "", CVAR_ROM },
;7152:
;7153:	{ &ui_browserMaster, "ui_browserMaster", "0", CVAR_ARCHIVE },
;7154:	{ &ui_browserGameType, "ui_browserGameType", "0", CVAR_ARCHIVE },
;7155:	{ &ui_browserSortKey, "ui_browserSortKey", "4", CVAR_ARCHIVE },
;7156:	{ &ui_browserShowFull, "ui_browserShowFull", "1", CVAR_ARCHIVE },
;7157:	{ &ui_browserShowEmpty, "ui_browserShowEmpty", "1", CVAR_ARCHIVE },
;7158:
;7159:	{ &ui_drawCrosshair, "cg_drawCrosshair", "1", CVAR_ARCHIVE },
;7160:	{ &ui_drawCrosshairNames, "cg_drawCrosshairNames", "1", CVAR_ARCHIVE },
;7161:	{ &ui_marks, "cg_marks", "1", CVAR_ARCHIVE },
;7162:
;7163:	{ &ui_server1, "server1", "", CVAR_ARCHIVE },
;7164:	{ &ui_server2, "server2", "", CVAR_ARCHIVE },
;7165:	{ &ui_server3, "server3", "", CVAR_ARCHIVE },
;7166:	{ &ui_server4, "server4", "", CVAR_ARCHIVE },
;7167:	{ &ui_server5, "server5", "", CVAR_ARCHIVE },
;7168:	{ &ui_server6, "server6", "", CVAR_ARCHIVE },
;7169:	{ &ui_server7, "server7", "", CVAR_ARCHIVE },
;7170:	{ &ui_server8, "server8", "", CVAR_ARCHIVE },
;7171:	{ &ui_server9, "server9", "", CVAR_ARCHIVE },
;7172:	{ &ui_server10, "server10", "", CVAR_ARCHIVE },
;7173:	{ &ui_server11, "server11", "", CVAR_ARCHIVE },
;7174:	{ &ui_server12, "server12", "", CVAR_ARCHIVE },
;7175:	{ &ui_server13, "server13", "", CVAR_ARCHIVE },
;7176:	{ &ui_server14, "server14", "", CVAR_ARCHIVE },
;7177:	{ &ui_server15, "server15", "", CVAR_ARCHIVE },
;7178:	{ &ui_server16, "server16", "", CVAR_ARCHIVE },
;7179:	{ &ui_cdkeychecked, "ui_cdkeychecked", "0", CVAR_ROM },
;7180:	{ &ui_debug, "ui_debug", "0", CVAR_TEMP },
;7181:	{ &ui_initialized, "ui_initialized", "0", CVAR_TEMP },
;7182:	{ &ui_teamName, "ui_teamName", "Empire", CVAR_ARCHIVE },
;7183:	{ &ui_opponentName, "ui_opponentName", "Rebellion", CVAR_ARCHIVE },
;7184:	{ &ui_rankChange, "ui_rankChange", "0", CVAR_ARCHIVE },
;7185:	{ &ui_freeSaber, "ui_freeSaber", "0", CVAR_ARCHIVE },
;7186:	{ &ui_forcePowerDisable, "ui_forcePowerDisable", "0", CVAR_ARCHIVE },
;7187:	{ &ui_redteam, "ui_redteam", "Empire", CVAR_ARCHIVE },
;7188:	{ &ui_blueteam, "ui_blueteam", "Rebellion", CVAR_ARCHIVE },
;7189:	{ &ui_dedicated, "ui_dedicated", "0", CVAR_ARCHIVE },
;7190:	{ &ui_gameType, "ui_gametype", "0", CVAR_ARCHIVE },
;7191:	{ &ui_joinGameType, "ui_joinGametype", "0", CVAR_ARCHIVE },
;7192:	{ &ui_netGameType, "ui_netGametype", "0", CVAR_ARCHIVE },
;7193:	{ &ui_actualNetGameType, "ui_actualNetGametype", "3", CVAR_ARCHIVE },
;7194:	{ &ui_redteam1, "ui_redteam1", "1", CVAR_ARCHIVE }, //rww - these used to all default to 0 (closed).. I changed them to 1 (human)
;7195:	{ &ui_redteam2, "ui_redteam2", "1", CVAR_ARCHIVE },
;7196:	{ &ui_redteam3, "ui_redteam3", "1", CVAR_ARCHIVE },
;7197:	{ &ui_redteam4, "ui_redteam4", "1", CVAR_ARCHIVE },
;7198:	{ &ui_redteam5, "ui_redteam5", "1", CVAR_ARCHIVE },
;7199:	{ &ui_redteam6, "ui_redteam6", "1", CVAR_ARCHIVE },
;7200:	{ &ui_redteam7, "ui_redteam7", "1", CVAR_ARCHIVE },
;7201:	{ &ui_redteam8, "ui_redteam8", "1", CVAR_ARCHIVE },
;7202:	{ &ui_blueteam1, "ui_blueteam1", "1", CVAR_ARCHIVE },
;7203:	{ &ui_blueteam2, "ui_blueteam2", "1", CVAR_ARCHIVE },
;7204:	{ &ui_blueteam3, "ui_blueteam3", "1", CVAR_ARCHIVE },
;7205:	{ &ui_blueteam4, "ui_blueteam4", "1", CVAR_ARCHIVE },
;7206:	{ &ui_blueteam5, "ui_blueteam5", "1", CVAR_ARCHIVE },
;7207:	{ &ui_blueteam6, "ui_blueteam6", "1", CVAR_ARCHIVE },
;7208:	{ &ui_blueteam7, "ui_blueteam7", "1", CVAR_ARCHIVE },
;7209:	{ &ui_blueteam8, "ui_blueteam8", "1", CVAR_ARCHIVE },
;7210:	{ &ui_netSource, "ui_netSource", "0", CVAR_ARCHIVE },
;7211:	{ &ui_menuFiles, "ui_menuFilesMP", "ui/jk2mpmenus.txt", CVAR_ARCHIVE },
;7212:	{ &ui_currentTier, "ui_currentTier", "0", CVAR_ARCHIVE },
;7213:	{ &ui_currentMap, "ui_currentMap", "0", CVAR_ARCHIVE },
;7214:	{ &ui_currentNetMap, "ui_currentNetMap", "0", CVAR_ARCHIVE },
;7215:	{ &ui_mapIndex, "ui_mapIndex", "0", CVAR_ARCHIVE },
;7216:	{ &ui_currentOpponent, "ui_currentOpponent", "0", CVAR_ARCHIVE },
;7217:	{ &ui_selectedPlayer, "cg_selectedPlayer", "0", CVAR_ARCHIVE},
;7218:	{ &ui_selectedPlayerName, "cg_selectedPlayerName", "", CVAR_ARCHIVE},
;7219:	{ &ui_lastServerRefresh_0, "ui_lastServerRefresh_0", "", CVAR_ARCHIVE},
;7220:	{ &ui_lastServerRefresh_1, "ui_lastServerRefresh_1", "", CVAR_ARCHIVE},
;7221:	{ &ui_lastServerRefresh_2, "ui_lastServerRefresh_2", "", CVAR_ARCHIVE},
;7222:	{ &ui_lastServerRefresh_3, "ui_lastServerRefresh_3", "", CVAR_ARCHIVE},
;7223:	{ &ui_singlePlayerActive, "ui_singlePlayerActive", "0", 0},
;7224:	{ &ui_scoreAccuracy, "ui_scoreAccuracy", "0", CVAR_ARCHIVE},
;7225:	{ &ui_scoreImpressives, "ui_scoreImpressives", "0", CVAR_ARCHIVE},
;7226:	{ &ui_scoreExcellents, "ui_scoreExcellents", "0", CVAR_ARCHIVE},
;7227:	{ &ui_scoreCaptures, "ui_scoreCaptures", "0", CVAR_ARCHIVE},
;7228:	{ &ui_scoreDefends, "ui_scoreDefends", "0", CVAR_ARCHIVE},
;7229:	{ &ui_scoreAssists, "ui_scoreAssists", "0", CVAR_ARCHIVE},
;7230:	{ &ui_scoreGauntlets, "ui_scoreGauntlets", "0",CVAR_ARCHIVE},
;7231:	{ &ui_scoreScore, "ui_scoreScore", "0", CVAR_ARCHIVE},
;7232:	{ &ui_scorePerfect, "ui_scorePerfect", "0", CVAR_ARCHIVE},
;7233:	{ &ui_scoreTeam, "ui_scoreTeam", "0 to 0", CVAR_ARCHIVE},
;7234:	{ &ui_scoreBase, "ui_scoreBase", "0", CVAR_ARCHIVE},
;7235:	{ &ui_scoreTime, "ui_scoreTime", "00:00", CVAR_ARCHIVE},
;7236:	{ &ui_scoreTimeBonus, "ui_scoreTimeBonus", "0", CVAR_ARCHIVE},
;7237:	{ &ui_scoreSkillBonus, "ui_scoreSkillBonus", "0", CVAR_ARCHIVE},
;7238:	{ &ui_scoreShutoutBonus, "ui_scoreShutoutBonus", "0", CVAR_ARCHIVE},
;7239:	{ &ui_fragLimit, "ui_fragLimit", "10", 0},
;7240:	{ &ui_captureLimit, "ui_captureLimit", "5", 0},
;7241:	{ &ui_smallFont, "ui_smallFont", "0.25", CVAR_ARCHIVE},
;7242:	{ &ui_bigFont, "ui_bigFont", "0.4", CVAR_ARCHIVE},
;7243:	{ &ui_findPlayer, "ui_findPlayer", "Kyle", CVAR_ARCHIVE},
;7244:	{ &ui_Q3Model, "ui_q3model", "0", CVAR_ARCHIVE},
;7245:	{ &ui_recordSPDemo, "ui_recordSPDemo", "0", CVAR_ARCHIVE},
;7246:	{ &ui_realWarmUp, "g_warmup", "20", CVAR_ARCHIVE},
;7247:	{ &ui_realCaptureLimit, "capturelimit", "8", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART},
;7248:	{ &ui_serverStatusTimeOut, "ui_serverStatusTimeOut", "7000", CVAR_ARCHIVE},
;7249:	{ &s_language, "s_language", "english", CVAR_ARCHIVE | CVAR_NORESTART},
;7250:};
;7251:
;7252:// bk001129 - made static to avoid aliasing
;7253:static int		cvarTableSize = sizeof(cvarTable) / sizeof(cvarTable[0]);
;7254:
;7255:
;7256:/*
;7257:=================
;7258:UI_RegisterCvars
;7259:=================
;7260:*/
;7261:void UI_RegisterCvars( void ) {
line 7265
;7262:	int			i;
;7263:	cvarTable_t	*cv;
;7264:
;7265:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $4847
JUMPV
LABELV $4844
line 7266
;7266:		trap_Cvar_Register( cv->vmCvar, cv->cvarName, cv->defaultString, cv->cvarFlags );
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7267
;7267:	}
LABELV $4845
line 7265
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $4847
ADDRLP4 4
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $4844
line 7268
;7268:}
LABELV $4843
endproc UI_RegisterCvars 12 16
export UI_UpdateCvars
proc UI_UpdateCvars 8 4
line 7275
;7269:
;7270:/*
;7271:=================
;7272:UI_UpdateCvars
;7273:=================
;7274:*/
;7275:void UI_UpdateCvars( void ) {
line 7279
;7276:	int			i;
;7277:	cvarTable_t	*cv;
;7278:
;7279:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $4852
JUMPV
LABELV $4849
line 7280
;7280:		trap_Cvar_Update( cv->vmCvar );
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 7281
;7281:	}
LABELV $4850
line 7279
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $4852
ADDRLP4 0
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $4849
line 7282
;7282:}
LABELV $4848
endproc UI_UpdateCvars 8 4
proc UI_StopServerRefresh 12 12
line 7291
;7283:
;7284:
;7285:/*
;7286:=================
;7287:ArenaServers_StopRefresh
;7288:=================
;7289:*/
;7290:static void UI_StopServerRefresh( void )
;7291:{
line 7294
;7292:	int count;
;7293:
;7294:	if (!uiInfo.serverStatus.refreshActive) {
ADDRGP4 uiInfo+40740+2212
INDIRI4
CNSTI4 0
NEI4 $4854
line 7296
;7295:		// not currently refreshing
;7296:		return;
ADDRGP4 $4853
JUMPV
LABELV $4854
line 7298
;7297:	}
;7298:	uiInfo.serverStatus.refreshActive = qfalse;
ADDRGP4 uiInfo+40740+2212
CNSTI4 0
ASGNI4
line 7299
;7299:	Com_Printf("%d servers listed in browser with %d players.\n",
ADDRGP4 $4860
ARGP4
ADDRGP4 uiInfo+40740+10412
INDIRI4
ARGI4
ADDRGP4 uiInfo+40740+10416
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 7302
;7300:					uiInfo.serverStatus.numDisplayServers,
;7301:					uiInfo.serverStatus.numPlayersOnServers);
;7302:	count = trap_LAN_GetServerCount(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 7303
;7303:	if (count - uiInfo.serverStatus.numDisplayServers > 0) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+40740+10412
INDIRI4
SUBI4
CNSTI4 0
LEI4 $4866
line 7304
;7304:		Com_Printf("%d servers not listed due to packet loss or pings higher than %d\n",
ADDRGP4 $4873
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $4870
ARGP4
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+40740+10412
INDIRI4
SUBI4
ARGI4
ADDRLP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 7307
;7305:						count - uiInfo.serverStatus.numDisplayServers,
;7306:						(int) trap_Cvar_VariableValue("cl_maxPing"));
;7307:	}
LABELV $4866
line 7309
;7308:
;7309:}
LABELV $4853
endproc UI_StopServerRefresh 12 12
proc UI_DoServerRefresh 8 4
line 7318
;7310:
;7311:
;7312:/*
;7313:=================
;7314:UI_DoServerRefresh
;7315:=================
;7316:*/
;7317:static void UI_DoServerRefresh( void )
;7318:{
line 7319
;7319:	qboolean wait = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 7321
;7320:
;7321:	if (!uiInfo.serverStatus.refreshActive) {
ADDRGP4 uiInfo+40740+2212
INDIRI4
CNSTI4 0
NEI4 $4875
line 7322
;7322:		return;
ADDRGP4 $4874
JUMPV
LABELV $4875
line 7324
;7323:	}
;7324:	if (ui_netSource.integer != AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
EQI4 $4879
line 7325
;7325:		if (ui_netSource.integer == AS_LOCAL) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $4882
line 7326
;7326:			if (!trap_LAN_GetServerCount(ui_netSource.integer)) {
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $4883
line 7327
;7327:				wait = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 7328
;7328:			}
line 7329
;7329:		} else {
ADDRGP4 $4883
JUMPV
LABELV $4882
line 7330
;7330:			if (trap_LAN_GetServerCount(ui_netSource.integer) < 0) {
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $4888
line 7331
;7331:				wait = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 7332
;7332:			}
LABELV $4888
line 7333
;7333:		}
LABELV $4883
line 7334
;7334:	}
LABELV $4879
line 7336
;7335:
;7336:	if (uiInfo.uiDC.realTime < uiInfo.serverStatus.refreshtime) {
ADDRGP4 uiInfo+240
INDIRI4
ADDRGP4 uiInfo+40740+2192
INDIRI4
GEI4 $4891
line 7337
;7337:		if (wait) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $4896
line 7338
;7338:			return;
ADDRGP4 $4874
JUMPV
LABELV $4896
line 7340
;7339:		}
;7340:	}
LABELV $4891
line 7343
;7341:
;7342:	// if still trying to retrieve pings
;7343:	if (trap_LAN_UpdateVisiblePings(ui_netSource.integer)) {
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_UpdateVisiblePings
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $4898
line 7344
;7344:		uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+40740+2192
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 7345
;7345:	} else if (!wait) {
ADDRGP4 $4899
JUMPV
LABELV $4898
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $4904
line 7347
;7346:		// get the last servers in the list
;7347:		UI_BuildServerDisplayList(2);
CNSTI4 2
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 7349
;7348:		// stop the refresh
;7349:		UI_StopServerRefresh();
ADDRGP4 UI_StopServerRefresh
CALLV
pop
line 7350
;7350:	}
LABELV $4904
LABELV $4899
line 7352
;7351:	//
;7352:	UI_BuildServerDisplayList(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 7353
;7353:}
LABELV $4874
endproc UI_DoServerRefresh 8 4
proc UI_StartServerRefresh 72 24
line 7361
;7354:
;7355:/*
;7356:=================
;7357:UI_StartServerRefresh
;7358:=================
;7359:*/
;7360:static void UI_StartServerRefresh(qboolean full)
;7361:{
line 7366
;7362:	int		i;
;7363:	char	*ptr;
;7364:
;7365:	qtime_t q;
;7366:	trap_RealTime(&q);
ADDRLP4 0
ARGP4
ADDRGP4 trap_RealTime
CALLI4
pop
line 7367
;7367: 	trap_Cvar_Set( va("ui_lastServerRefresh_%i", ui_netSource.integer), va("%s-%i, %i @ %i:%2i", GetMonthAbbrevString(q.tm_mon),q.tm_mday, 1900+q.tm_year,q.tm_hour,q.tm_min));
ADDRGP4 $1473
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 GetMonthAbbrevString
CALLP4
ASGNP4
ADDRGP4 $4908
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 0+12
INDIRI4
ARGI4
ADDRLP4 0+20
INDIRI4
CNSTI4 1900
ADDI4
ARGI4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 7369
;7368:
;7369:	if (!full) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $4914
line 7370
;7370:		UI_UpdatePendingPings();
ADDRGP4 UI_UpdatePendingPings
CALLV
pop
line 7371
;7371:		return;
ADDRGP4 $4906
JUMPV
LABELV $4914
line 7374
;7372:	}
;7373:
;7374:	uiInfo.serverStatus.refreshActive = qtrue;
ADDRGP4 uiInfo+40740+2212
CNSTI4 1
ASGNI4
line 7375
;7375:	uiInfo.serverStatus.nextDisplayRefresh = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+40740+10420
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 7377
;7376:	// clear number of displayed servers
;7377:	uiInfo.serverStatus.numDisplayServers = 0;
ADDRGP4 uiInfo+40740+10412
CNSTI4 0
ASGNI4
line 7378
;7378:	uiInfo.serverStatus.numPlayersOnServers = 0;
ADDRGP4 uiInfo+40740+10416
CNSTI4 0
ASGNI4
line 7380
;7379:	// mark all servers as visible so we store ping updates for them
;7380:	trap_LAN_MarkServerVisible(ui_netSource.integer, -1, qtrue);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 7382
;7381:	// reset all the pings
;7382:	trap_LAN_ResetPings(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ResetPings
CALLV
pop
line 7384
;7383:	//
;7384:	if( ui_netSource.integer == AS_LOCAL ) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $4927
line 7385
;7385:		trap_Cmd_ExecuteText( EXEC_NOW, "localservers\n" );
CNSTI4 0
ARGI4
ADDRGP4 $4930
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 7386
;7386:		uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+40740+2192
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 7387
;7387:		return;
ADDRGP4 $4906
JUMPV
LABELV $4927
line 7390
;7388:	}
;7389:
;7390:	uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 5000;
ADDRGP4 uiInfo+40740+2192
ADDRGP4 uiInfo+240
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 7391
;7391:	if( ui_netSource.integer == AS_GLOBAL || ui_netSource.integer == AS_MPLAYER ) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 1
EQI4 $4941
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $4937
LABELV $4941
line 7392
;7392:		if( ui_netSource.integer == AS_GLOBAL ) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 1
NEI4 $4942
line 7393
;7393:			i = 0;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 7394
;7394:		}
ADDRGP4 $4943
JUMPV
LABELV $4942
line 7395
;7395:		else {
line 7396
;7396:			i = 1;
ADDRLP4 40
CNSTI4 1
ASGNI4
line 7397
;7397:		}
LABELV $4943
line 7399
;7398:
;7399:		ptr = UI_Cvar_VariableString("debug_protocol");
ADDRGP4 $4550
ARGP4
ADDRLP4 56
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 56
INDIRP4
ASGNP4
line 7400
;7400:		if (strlen(ptr)) {
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $4945
line 7401
;7401:			trap_Cmd_ExecuteText( EXEC_NOW, va( "globalservers %d %s\n", i, ptr));
ADDRGP4 $4947
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 7402
;7402:		}
ADDRGP4 $4946
JUMPV
LABELV $4945
line 7403
;7403:		else {
line 7404
;7404:			trap_Cmd_ExecuteText( EXEC_NOW, va( "globalservers %d %d\n", i, (int)trap_Cvar_VariableValue( "protocol" ) ) );
ADDRGP4 $2341
ARGP4
ADDRLP4 64
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $4948
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 64
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 7405
;7405:		}
LABELV $4946
line 7406
;7406:	}
LABELV $4937
line 7407
;7407:}
LABELV $4906
endproc UI_StartServerRefresh 72 24
bss
export s_language
align 4
LABELV s_language
skip 272
export ui_realWarmUp
align 4
LABELV ui_realWarmUp
skip 272
export ui_realCaptureLimit
align 4
LABELV ui_realCaptureLimit
skip 272
export ui_recordSPDemo
align 4
LABELV ui_recordSPDemo
skip 272
export ui_hudFiles
align 4
LABELV ui_hudFiles
skip 272
export ui_Q3Model
align 4
LABELV ui_Q3Model
skip 272
export ui_findPlayer
align 4
LABELV ui_findPlayer
skip 272
export ui_scoreCaptures
align 4
LABELV ui_scoreCaptures
skip 272
export ui_teamName
align 4
LABELV ui_teamName
skip 272
export ui_blueteam8
align 4
LABELV ui_blueteam8
skip 272
export ui_blueteam7
align 4
LABELV ui_blueteam7
skip 272
export ui_blueteam6
align 4
LABELV ui_blueteam6
skip 272
export ui_blueteam5
align 4
LABELV ui_blueteam5
skip 272
export ui_blueteam4
align 4
LABELV ui_blueteam4
skip 272
export ui_blueteam3
align 4
LABELV ui_blueteam3
skip 272
export ui_blueteam2
align 4
LABELV ui_blueteam2
skip 272
export ui_blueteam1
align 4
LABELV ui_blueteam1
skip 272
export ui_blueteam
align 4
LABELV ui_blueteam
skip 272
export ui_redteam8
align 4
LABELV ui_redteam8
skip 272
export ui_redteam7
align 4
LABELV ui_redteam7
skip 272
export ui_redteam6
align 4
LABELV ui_redteam6
skip 272
export ui_redteam5
align 4
LABELV ui_redteam5
skip 272
export ui_redteam4
align 4
LABELV ui_redteam4
skip 272
export ui_redteam3
align 4
LABELV ui_redteam3
skip 272
export ui_redteam2
align 4
LABELV ui_redteam2
skip 272
export ui_redteam1
align 4
LABELV ui_redteam1
skip 272
export ui_redteam
align 4
LABELV ui_redteam
skip 272
align 1
LABELV lastLoadingText
skip 1024
align 4
LABELV lastConnState
skip 4
import FPMessageTime
export parsedFPMessage
align 1
LABELV parsedFPMessage
skip 1024
export ui_rankChange
align 4
LABELV ui_rankChange
skip 272
export startTime
align 4
LABELV startTime
skip 4
import ProcessNewUI
import UpdateForceUsed
import Menu_ShowItemByName
export ui_initialized
align 4
LABELV ui_initialized
skip 272
export ui_debug
align 4
LABELV ui_debug
skip 272
import UI_ForceConfigHandle
import UI_ForcePowerRank_HandleKey
import UI_ForceMaxRank_HandleKey
import UI_JediNonJedi_HandleKey
import UI_ForceSide_HandleKey
import UI_SkinColor_HandleKey
import UI_UpdateForcePowers
import UI_SaveForceTemplate
import UI_UpdateClientForcePowers
import UI_DrawForceStars
import UI_DrawTotalForceStars
import UI_ReadLegalForce
import UI_InitForceShaders
import ui_forcePowerDisable
import ui_freeSaber
import uiSaberColorShaders
import uiForcePowerDarkLight
import uiForcePowersRank
import uiForcePowersDisabled
import gTouchedForce
import uiForceAvailable
import uiForceUsed
import uiMaxRank
import uiForceRank
import uiJediNonJedi
import uiForceSide
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
export uiInfo
align 4
LABELV uiInfo
skip 95204
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
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_MainMenu
import MainMenu_Cache
import UI_LoadArenas
import UI_ClearScores
import UI_AdjustTimeByGame
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
export ui_serverStatusTimeOut
align 4
LABELV ui_serverStatusTimeOut
skip 272
export ui_bigFont
align 4
LABELV ui_bigFont
skip 272
export ui_smallFont
align 4
LABELV ui_smallFont
skip 272
export ui_scoreTime
align 4
LABELV ui_scoreTime
skip 272
export ui_scoreShutoutBonus
align 4
LABELV ui_scoreShutoutBonus
skip 272
export ui_scoreSkillBonus
align 4
LABELV ui_scoreSkillBonus
skip 272
export ui_scoreTimeBonus
align 4
LABELV ui_scoreTimeBonus
skip 272
export ui_scoreBase
align 4
LABELV ui_scoreBase
skip 272
export ui_scoreTeam
align 4
LABELV ui_scoreTeam
skip 272
export ui_scorePerfect
align 4
LABELV ui_scorePerfect
skip 272
export ui_scoreScore
align 4
LABELV ui_scoreScore
skip 272
export ui_scoreGauntlets
align 4
LABELV ui_scoreGauntlets
skip 272
export ui_scoreAssists
align 4
LABELV ui_scoreAssists
skip 272
export ui_scoreDefends
align 4
LABELV ui_scoreDefends
skip 272
export ui_scoreExcellents
align 4
LABELV ui_scoreExcellents
skip 272
export ui_scoreImpressives
align 4
LABELV ui_scoreImpressives
skip 272
export ui_scoreAccuracy
align 4
LABELV ui_scoreAccuracy
skip 272
export ui_singlePlayerActive
align 4
LABELV ui_singlePlayerActive
skip 272
export ui_lastServerRefresh_3
align 4
LABELV ui_lastServerRefresh_3
skip 272
export ui_lastServerRefresh_2
align 4
LABELV ui_lastServerRefresh_2
skip 272
export ui_lastServerRefresh_1
align 4
LABELV ui_lastServerRefresh_1
skip 272
export ui_lastServerRefresh_0
align 4
LABELV ui_lastServerRefresh_0
skip 272
export ui_selectedPlayerName
align 4
LABELV ui_selectedPlayerName
skip 272
export ui_selectedPlayer
align 4
LABELV ui_selectedPlayer
skip 272
export ui_currentOpponent
align 4
LABELV ui_currentOpponent
skip 272
export ui_mapIndex
align 4
LABELV ui_mapIndex
skip 272
export ui_currentNetMap
align 4
LABELV ui_currentNetMap
skip 272
export ui_currentMap
align 4
LABELV ui_currentMap
skip 272
export ui_currentTier
align 4
LABELV ui_currentTier
skip 272
export ui_menuFiles
align 4
LABELV ui_menuFiles
skip 272
export ui_opponentName
align 4
LABELV ui_opponentName
skip 272
export ui_dedicated
align 4
LABELV ui_dedicated
skip 272
export ui_serverFilterType
align 4
LABELV ui_serverFilterType
skip 272
export ui_netSource
align 4
LABELV ui_netSource
skip 272
export ui_joinGameType
align 4
LABELV ui_joinGameType
skip 272
export ui_actualNetGameType
align 4
LABELV ui_actualNetGameType
skip 272
export ui_netGameType
align 4
LABELV ui_netGameType
skip 272
export ui_gameType
align 4
LABELV ui_gameType
skip 272
export ui_fragLimit
align 4
LABELV ui_fragLimit
skip 272
export ui_captureLimit
align 4
LABELV ui_captureLimit
skip 272
export ui_cdkeychecked
align 4
LABELV ui_cdkeychecked
skip 272
import ui_cdkey
export ui_server16
align 4
LABELV ui_server16
skip 272
export ui_server15
align 4
LABELV ui_server15
skip 272
export ui_server14
align 4
LABELV ui_server14
skip 272
export ui_server13
align 4
LABELV ui_server13
skip 272
export ui_server12
align 4
LABELV ui_server12
skip 272
export ui_server11
align 4
LABELV ui_server11
skip 272
export ui_server10
align 4
LABELV ui_server10
skip 272
export ui_server9
align 4
LABELV ui_server9
skip 272
export ui_server8
align 4
LABELV ui_server8
skip 272
export ui_server7
align 4
LABELV ui_server7
skip 272
export ui_server6
align 4
LABELV ui_server6
skip 272
export ui_server5
align 4
LABELV ui_server5
skip 272
export ui_server4
align 4
LABELV ui_server4
skip 272
export ui_server3
align 4
LABELV ui_server3
skip 272
export ui_server2
align 4
LABELV ui_server2
skip 272
export ui_server1
align 4
LABELV ui_server1
skip 272
export ui_marks
align 4
LABELV ui_marks
skip 272
export ui_drawCrosshairNames
align 4
LABELV ui_drawCrosshairNames
skip 272
export ui_drawCrosshair
align 4
LABELV ui_drawCrosshair
skip 272
export ui_browserShowEmpty
align 4
LABELV ui_browserShowEmpty
skip 272
export ui_browserShowFull
align 4
LABELV ui_browserShowFull
skip 272
export ui_browserSortKey
align 4
LABELV ui_browserSortKey
skip 272
export ui_browserGameType
align 4
LABELV ui_browserGameType
skip 272
export ui_browserMaster
align 4
LABELV ui_browserMaster
skip 272
export ui_spSelection
align 4
LABELV ui_spSelection
skip 272
export ui_spSkill
align 4
LABELV ui_spSkill
skip 272
export ui_spVideos
align 4
LABELV ui_spVideos
skip 272
export ui_spAwards
align 4
LABELV ui_spAwards
skip 272
export ui_spScores5
align 4
LABELV ui_spScores5
skip 272
export ui_spScores4
align 4
LABELV ui_spScores4
skip 272
export ui_spScores3
align 4
LABELV ui_spScores3
skip 272
export ui_spScores2
align 4
LABELV ui_spScores2
skip 272
export ui_spScores1
align 4
LABELV ui_spScores1
skip 272
export ui_botsFile
align 4
LABELV ui_botsFile
skip 272
export ui_arenasFile
align 4
LABELV ui_arenasFile
skip 272
export ui_ctf_friendly
align 4
LABELV ui_ctf_friendly
skip 272
export ui_ctf_timelimit
align 4
LABELV ui_ctf_timelimit
skip 272
export ui_ctf_capturelimit
align 4
LABELV ui_ctf_capturelimit
skip 272
export ui_team_friendly
align 4
LABELV ui_team_friendly
skip 272
export ui_team_timelimit
align 4
LABELV ui_team_timelimit
skip 272
export ui_team_fraglimit
align 4
LABELV ui_team_fraglimit
skip 272
export ui_selectedModelIndex
align 4
LABELV ui_selectedModelIndex
skip 272
export ui_tourney_timelimit
align 4
LABELV ui_tourney_timelimit
skip 272
export ui_tourney_fraglimit
align 4
LABELV ui_tourney_fraglimit
skip 272
export ui_ffa_timelimit
align 4
LABELV ui_ffa_timelimit
skip 272
export ui_ffa_fraglimit
align 4
LABELV ui_ffa_fraglimit
skip 272
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
LABELV $4948
char 1 103
char 1 108
char 1 111
char 1 98
char 1 97
char 1 108
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 115
char 1 32
char 1 37
char 1 100
char 1 32
char 1 37
char 1 100
char 1 10
char 1 0
align 1
LABELV $4947
char 1 103
char 1 108
char 1 111
char 1 98
char 1 97
char 1 108
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 115
char 1 32
char 1 37
char 1 100
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $4930
char 1 108
char 1 111
char 1 99
char 1 97
char 1 108
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 115
char 1 10
char 1 0
align 1
LABELV $4908
char 1 37
char 1 115
char 1 45
char 1 37
char 1 105
char 1 44
char 1 32
char 1 37
char 1 105
char 1 32
char 1 64
char 1 32
char 1 37
char 1 105
char 1 58
char 1 37
char 1 50
char 1 105
char 1 0
align 1
LABELV $4873
char 1 99
char 1 108
char 1 95
char 1 109
char 1 97
char 1 120
char 1 80
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $4870
char 1 37
char 1 100
char 1 32
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 115
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 108
char 1 105
char 1 115
char 1 116
char 1 101
char 1 100
char 1 32
char 1 100
char 1 117
char 1 101
char 1 32
char 1 116
char 1 111
char 1 32
char 1 112
char 1 97
char 1 99
char 1 107
char 1 101
char 1 116
char 1 32
char 1 108
char 1 111
char 1 115
char 1 115
char 1 32
char 1 111
char 1 114
char 1 32
char 1 112
char 1 105
char 1 110
char 1 103
char 1 115
char 1 32
char 1 104
char 1 105
char 1 103
char 1 104
char 1 101
char 1 114
char 1 32
char 1 116
char 1 104
char 1 97
char 1 110
char 1 32
char 1 37
char 1 100
char 1 10
char 1 0
align 1
LABELV $4860
char 1 37
char 1 100
char 1 32
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 115
char 1 32
char 1 108
char 1 105
char 1 115
char 1 116
char 1 101
char 1 100
char 1 32
char 1 105
char 1 110
char 1 32
char 1 98
char 1 114
char 1 111
char 1 119
char 1 115
char 1 101
char 1 114
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 32
char 1 37
char 1 100
char 1 32
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 115
char 1 46
char 1 10
char 1 0
align 1
LABELV $4842
char 1 101
char 1 110
char 1 103
char 1 108
char 1 105
char 1 115
char 1 104
char 1 0
align 1
LABELV $4841
char 1 115
char 1 95
char 1 108
char 1 97
char 1 110
char 1 103
char 1 117
char 1 97
char 1 103
char 1 101
char 1 0
align 1
LABELV $4840
char 1 55
char 1 48
char 1 48
char 1 48
char 1 0
align 1
LABELV $4839
char 1 117
char 1 105
char 1 95
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 83
char 1 116
char 1 97
char 1 116
char 1 117
char 1 115
char 1 84
char 1 105
char 1 109
char 1 101
char 1 79
char 1 117
char 1 116
char 1 0
align 1
LABELV $4838
char 1 117
char 1 105
char 1 95
char 1 113
char 1 51
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $4837
char 1 48
char 1 46
char 1 52
char 1 0
align 1
LABELV $4836
char 1 117
char 1 105
char 1 95
char 1 98
char 1 105
char 1 103
char 1 70
char 1 111
char 1 110
char 1 116
char 1 0
align 1
LABELV $4835
char 1 48
char 1 46
char 1 50
char 1 53
char 1 0
align 1
LABELV $4834
char 1 117
char 1 105
char 1 95
char 1 115
char 1 109
char 1 97
char 1 108
char 1 108
char 1 70
char 1 111
char 1 110
char 1 116
char 1 0
align 1
LABELV $4833
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 83
char 1 104
char 1 117
char 1 116
char 1 111
char 1 117
char 1 116
char 1 66
char 1 111
char 1 110
char 1 117
char 1 115
char 1 0
align 1
LABELV $4832
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 83
char 1 107
char 1 105
char 1 108
char 1 108
char 1 66
char 1 111
char 1 110
char 1 117
char 1 115
char 1 0
align 1
LABELV $4831
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 84
char 1 105
char 1 109
char 1 101
char 1 66
char 1 111
char 1 110
char 1 117
char 1 115
char 1 0
align 1
LABELV $4830
char 1 48
char 1 48
char 1 58
char 1 48
char 1 48
char 1 0
align 1
LABELV $4829
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 84
char 1 105
char 1 109
char 1 101
char 1 0
align 1
LABELV $4828
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 66
char 1 97
char 1 115
char 1 101
char 1 0
align 1
LABELV $4827
char 1 48
char 1 32
char 1 116
char 1 111
char 1 32
char 1 48
char 1 0
align 1
LABELV $4826
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 84
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $4825
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 80
char 1 101
char 1 114
char 1 102
char 1 101
char 1 99
char 1 116
char 1 0
align 1
LABELV $4824
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 83
char 1 99
char 1 111
char 1 114
char 1 101
char 1 0
align 1
LABELV $4823
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 71
char 1 97
char 1 117
char 1 110
char 1 116
char 1 108
char 1 101
char 1 116
char 1 115
char 1 0
align 1
LABELV $4822
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 65
char 1 115
char 1 115
char 1 105
char 1 115
char 1 116
char 1 115
char 1 0
align 1
LABELV $4821
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 68
char 1 101
char 1 102
char 1 101
char 1 110
char 1 100
char 1 115
char 1 0
align 1
LABELV $4820
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 67
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 115
char 1 0
align 1
LABELV $4819
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 69
char 1 120
char 1 99
char 1 101
char 1 108
char 1 108
char 1 101
char 1 110
char 1 116
char 1 115
char 1 0
align 1
LABELV $4818
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 73
char 1 109
char 1 112
char 1 114
char 1 101
char 1 115
char 1 115
char 1 105
char 1 118
char 1 101
char 1 115
char 1 0
align 1
LABELV $4817
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 65
char 1 99
char 1 99
char 1 117
char 1 114
char 1 97
char 1 99
char 1 121
char 1 0
align 1
LABELV $4816
char 1 117
char 1 105
char 1 95
char 1 108
char 1 97
char 1 115
char 1 116
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 82
char 1 101
char 1 102
char 1 114
char 1 101
char 1 115
char 1 104
char 1 95
char 1 51
char 1 0
align 1
LABELV $4815
char 1 117
char 1 105
char 1 95
char 1 108
char 1 97
char 1 115
char 1 116
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 82
char 1 101
char 1 102
char 1 114
char 1 101
char 1 115
char 1 104
char 1 95
char 1 50
char 1 0
align 1
LABELV $4814
char 1 117
char 1 105
char 1 95
char 1 108
char 1 97
char 1 115
char 1 116
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 82
char 1 101
char 1 102
char 1 114
char 1 101
char 1 115
char 1 104
char 1 95
char 1 49
char 1 0
align 1
LABELV $4813
char 1 117
char 1 105
char 1 95
char 1 108
char 1 97
char 1 115
char 1 116
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 82
char 1 101
char 1 102
char 1 114
char 1 101
char 1 115
char 1 104
char 1 95
char 1 48
char 1 0
align 1
LABELV $4812
char 1 117
char 1 105
char 1 95
char 1 99
char 1 117
char 1 114
char 1 114
char 1 101
char 1 110
char 1 116
char 1 79
char 1 112
char 1 112
char 1 111
char 1 110
char 1 101
char 1 110
char 1 116
char 1 0
align 1
LABELV $4811
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 56
char 1 0
align 1
LABELV $4810
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 55
char 1 0
align 1
LABELV $4809
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 54
char 1 0
align 1
LABELV $4808
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 53
char 1 0
align 1
LABELV $4807
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 52
char 1 0
align 1
LABELV $4806
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 51
char 1 0
align 1
LABELV $4805
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 50
char 1 0
align 1
LABELV $4804
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 49
char 1 0
align 1
LABELV $4803
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 56
char 1 0
align 1
LABELV $4802
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 55
char 1 0
align 1
LABELV $4801
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 54
char 1 0
align 1
LABELV $4800
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 53
char 1 0
align 1
LABELV $4799
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 52
char 1 0
align 1
LABELV $4798
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 51
char 1 0
align 1
LABELV $4797
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 50
char 1 0
align 1
LABELV $4796
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 49
char 1 0
align 1
LABELV $4795
char 1 51
char 1 0
align 1
LABELV $4794
char 1 117
char 1 105
char 1 95
char 1 97
char 1 99
char 1 116
char 1 117
char 1 97
char 1 108
char 1 78
char 1 101
char 1 116
char 1 71
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $4793
char 1 117
char 1 105
char 1 95
char 1 110
char 1 101
char 1 116
char 1 71
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $4792
char 1 117
char 1 105
char 1 95
char 1 106
char 1 111
char 1 105
char 1 110
char 1 71
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $4791
char 1 117
char 1 105
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
LABELV $4790
char 1 117
char 1 105
char 1 95
char 1 100
char 1 101
char 1 100
char 1 105
char 1 99
char 1 97
char 1 116
char 1 101
char 1 100
char 1 0
align 1
LABELV $4789
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $4788
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $4787
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
LABELV $4786
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
LABELV $4785
char 1 82
char 1 101
char 1 98
char 1 101
char 1 108
char 1 108
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $4784
char 1 69
char 1 109
char 1 112
char 1 105
char 1 114
char 1 101
char 1 0
align 1
LABELV $4783
char 1 117
char 1 105
char 1 95
char 1 105
char 1 110
char 1 105
char 1 116
char 1 105
char 1 97
char 1 108
char 1 105
char 1 122
char 1 101
char 1 100
char 1 0
align 1
LABELV $4782
char 1 117
char 1 105
char 1 95
char 1 100
char 1 101
char 1 98
char 1 117
char 1 103
char 1 0
align 1
LABELV $4781
char 1 117
char 1 105
char 1 95
char 1 99
char 1 100
char 1 107
char 1 101
char 1 121
char 1 99
char 1 104
char 1 101
char 1 99
char 1 107
char 1 101
char 1 100
char 1 0
align 1
LABELV $4780
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 49
char 1 54
char 1 0
align 1
LABELV $4779
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 49
char 1 53
char 1 0
align 1
LABELV $4778
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 49
char 1 52
char 1 0
align 1
LABELV $4777
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 49
char 1 51
char 1 0
align 1
LABELV $4776
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 49
char 1 50
char 1 0
align 1
LABELV $4775
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 49
char 1 49
char 1 0
align 1
LABELV $4774
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 49
char 1 48
char 1 0
align 1
LABELV $4773
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 57
char 1 0
align 1
LABELV $4772
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 56
char 1 0
align 1
LABELV $4771
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 55
char 1 0
align 1
LABELV $4770
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 54
char 1 0
align 1
LABELV $4769
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 53
char 1 0
align 1
LABELV $4768
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 52
char 1 0
align 1
LABELV $4767
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 51
char 1 0
align 1
LABELV $4766
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 50
char 1 0
align 1
LABELV $4765
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 49
char 1 0
align 1
LABELV $4764
char 1 99
char 1 103
char 1 95
char 1 109
char 1 97
char 1 114
char 1 107
char 1 115
char 1 0
align 1
LABELV $4763
char 1 99
char 1 103
char 1 95
char 1 100
char 1 114
char 1 97
char 1 119
char 1 67
char 1 114
char 1 111
char 1 115
char 1 115
char 1 104
char 1 97
char 1 105
char 1 114
char 1 78
char 1 97
char 1 109
char 1 101
char 1 115
char 1 0
align 1
LABELV $4762
char 1 117
char 1 105
char 1 95
char 1 98
char 1 114
char 1 111
char 1 119
char 1 115
char 1 101
char 1 114
char 1 83
char 1 104
char 1 111
char 1 119
char 1 69
char 1 109
char 1 112
char 1 116
char 1 121
char 1 0
align 1
LABELV $4761
char 1 117
char 1 105
char 1 95
char 1 98
char 1 114
char 1 111
char 1 119
char 1 115
char 1 101
char 1 114
char 1 83
char 1 104
char 1 111
char 1 119
char 1 70
char 1 117
char 1 108
char 1 108
char 1 0
align 1
LABELV $4760
char 1 117
char 1 105
char 1 95
char 1 98
char 1 114
char 1 111
char 1 119
char 1 115
char 1 101
char 1 114
char 1 83
char 1 111
char 1 114
char 1 116
char 1 75
char 1 101
char 1 121
char 1 0
align 1
LABELV $4759
char 1 117
char 1 105
char 1 95
char 1 98
char 1 114
char 1 111
char 1 119
char 1 115
char 1 101
char 1 114
char 1 71
char 1 97
char 1 109
char 1 101
char 1 84
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $4758
char 1 117
char 1 105
char 1 95
char 1 98
char 1 114
char 1 111
char 1 119
char 1 115
char 1 101
char 1 114
char 1 77
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $4757
char 1 117
char 1 105
char 1 95
char 1 115
char 1 112
char 1 83
char 1 101
char 1 108
char 1 101
char 1 99
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $4756
char 1 103
char 1 95
char 1 115
char 1 112
char 1 86
char 1 105
char 1 100
char 1 101
char 1 111
char 1 115
char 1 0
align 1
LABELV $4755
char 1 103
char 1 95
char 1 115
char 1 112
char 1 65
char 1 119
char 1 97
char 1 114
char 1 100
char 1 115
char 1 0
align 1
LABELV $4754
char 1 103
char 1 95
char 1 115
char 1 112
char 1 83
char 1 99
char 1 111
char 1 114
char 1 101
char 1 115
char 1 53
char 1 0
align 1
LABELV $4753
char 1 103
char 1 95
char 1 115
char 1 112
char 1 83
char 1 99
char 1 111
char 1 114
char 1 101
char 1 115
char 1 52
char 1 0
align 1
LABELV $4752
char 1 103
char 1 95
char 1 115
char 1 112
char 1 83
char 1 99
char 1 111
char 1 114
char 1 101
char 1 115
char 1 51
char 1 0
align 1
LABELV $4751
char 1 103
char 1 95
char 1 115
char 1 112
char 1 83
char 1 99
char 1 111
char 1 114
char 1 101
char 1 115
char 1 50
char 1 0
align 1
LABELV $4750
char 1 103
char 1 95
char 1 115
char 1 112
char 1 83
char 1 99
char 1 111
char 1 114
char 1 101
char 1 115
char 1 49
char 1 0
align 1
LABELV $4749
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
LABELV $4748
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
LABELV $4747
char 1 117
char 1 105
char 1 95
char 1 99
char 1 116
char 1 102
char 1 95
char 1 102
char 1 114
char 1 105
char 1 101
char 1 110
char 1 100
char 1 108
char 1 121
char 1 0
align 1
LABELV $4746
char 1 117
char 1 105
char 1 95
char 1 99
char 1 116
char 1 102
char 1 95
char 1 116
char 1 105
char 1 109
char 1 101
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $4745
char 1 56
char 1 0
align 1
LABELV $4744
char 1 117
char 1 105
char 1 95
char 1 99
char 1 116
char 1 102
char 1 95
char 1 99
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $4743
char 1 117
char 1 105
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 102
char 1 114
char 1 105
char 1 101
char 1 110
char 1 100
char 1 108
char 1 121
char 1 0
align 1
LABELV $4742
char 1 117
char 1 105
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 116
char 1 105
char 1 109
char 1 101
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $4741
char 1 117
char 1 105
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 102
char 1 114
char 1 97
char 1 103
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $4740
char 1 49
char 1 54
char 1 0
align 1
LABELV $4739
char 1 117
char 1 105
char 1 95
char 1 116
char 1 111
char 1 117
char 1 114
char 1 110
char 1 101
char 1 121
char 1 95
char 1 116
char 1 105
char 1 109
char 1 101
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $4738
char 1 117
char 1 105
char 1 95
char 1 116
char 1 111
char 1 117
char 1 114
char 1 110
char 1 101
char 1 121
char 1 95
char 1 102
char 1 114
char 1 97
char 1 103
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $4737
char 1 117
char 1 105
char 1 95
char 1 102
char 1 102
char 1 97
char 1 95
char 1 116
char 1 105
char 1 109
char 1 101
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $4736
char 1 117
char 1 105
char 1 95
char 1 102
char 1 102
char 1 97
char 1 95
char 1 102
char 1 114
char 1 97
char 1 103
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $4727
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 65
char 1 87
char 1 65
char 1 73
char 1 84
char 1 73
char 1 78
char 1 71
char 1 95
char 1 71
char 1 65
char 1 77
char 1 69
char 1 83
char 1 84
char 1 65
char 1 84
char 1 69
char 1 0
align 1
LABELV $4724
char 1 99
char 1 108
char 1 95
char 1 100
char 1 111
char 1 119
char 1 110
char 1 108
char 1 111
char 1 97
char 1 100
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $4721
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 65
char 1 87
char 1 65
char 1 73
char 1 84
char 1 73
char 1 78
char 1 71
char 1 95
char 1 67
char 1 72
char 1 65
char 1 76
char 1 76
char 1 69
char 1 78
char 1 71
char 1 69
char 1 0
align 1
LABELV $4718
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 65
char 1 87
char 1 65
char 1 73
char 1 84
char 1 73
char 1 78
char 1 71
char 1 95
char 1 67
char 1 79
char 1 78
char 1 78
char 1 69
char 1 67
char 1 84
char 1 73
char 1 79
char 1 78
char 1 0
align 1
LABELV $4708
char 1 109
char 1 111
char 1 116
char 1 100
char 1 0
align 1
LABELV $4705
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 67
char 1 79
char 1 78
char 1 78
char 1 69
char 1 67
char 1 84
char 1 73
char 1 78
char 1 71
char 1 95
char 1 84
char 1 79
char 1 0
align 1
LABELV $4704
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 83
char 1 84
char 1 65
char 1 82
char 1 84
char 1 73
char 1 78
char 1 71
char 1 95
char 1 85
char 1 80
char 1 0
align 1
LABELV $4703
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
LABELV $4699
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 76
char 1 79
char 1 65
char 1 68
char 1 73
char 1 78
char 1 71
char 1 95
char 1 77
char 1 65
char 1 80
char 1 78
char 1 65
char 1 77
char 1 69
char 1 0
align 1
LABELV $4692
char 1 67
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 0
align 1
LABELV $4690
char 1 37
char 1 115
char 1 47
char 1 37
char 1 115
char 1 0
align 1
LABELV $4687
char 1 40
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 41
char 1 0
align 1
LABELV $4678
char 1 40
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 41
char 1 0
align 1
LABELV $4677
char 1 101
char 1 115
char 1 116
char 1 105
char 1 109
char 1 97
char 1 116
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $4673
char 1 37
char 1 115
char 1 32
char 1 40
char 1 37
char 1 100
char 1 37
char 1 37
char 1 41
char 1 0
align 1
LABELV $4670
char 1 99
char 1 108
char 1 95
char 1 100
char 1 111
char 1 119
char 1 110
char 1 108
char 1 111
char 1 97
char 1 100
char 1 84
char 1 105
char 1 109
char 1 101
char 1 0
align 1
LABELV $4669
char 1 99
char 1 108
char 1 95
char 1 100
char 1 111
char 1 119
char 1 110
char 1 108
char 1 111
char 1 97
char 1 100
char 1 67
char 1 111
char 1 117
char 1 110
char 1 116
char 1 0
align 1
LABELV $4668
char 1 99
char 1 108
char 1 95
char 1 100
char 1 111
char 1 119
char 1 110
char 1 108
char 1 111
char 1 97
char 1 100
char 1 83
char 1 105
char 1 122
char 1 101
char 1 0
align 1
LABELV $4649
char 1 68
char 1 79
char 1 87
char 1 78
char 1 76
char 1 79
char 1 65
char 1 68
char 1 95
char 1 83
char 1 84
char 1 85
char 1 70
char 1 70
char 1 0
align 1
LABELV $4645
char 1 37
char 1 50
char 1 100
char 1 32
char 1 115
char 1 101
char 1 99
char 1 0
align 1
LABELV $4644
char 1 37
char 1 50
char 1 100
char 1 32
char 1 109
char 1 105
char 1 110
char 1 32
char 1 37
char 1 50
char 1 100
char 1 32
char 1 115
char 1 101
char 1 99
char 1 0
align 1
LABELV $4641
char 1 37
char 1 100
char 1 32
char 1 104
char 1 114
char 1 32
char 1 37
char 1 50
char 1 100
char 1 32
char 1 109
char 1 105
char 1 110
char 1 0
align 1
LABELV $4637
char 1 37
char 1 100
char 1 32
char 1 98
char 1 121
char 1 116
char 1 101
char 1 115
char 1 0
align 1
LABELV $4636
char 1 37
char 1 100
char 1 32
char 1 75
char 1 66
char 1 0
align 1
LABELV $4633
char 1 46
char 1 37
char 1 48
char 1 50
char 1 100
char 1 32
char 1 77
char 1 66
char 1 0
align 1
LABELV $4630
char 1 46
char 1 37
char 1 48
char 1 50
char 1 100
char 1 32
char 1 71
char 1 66
char 1 0
align 1
LABELV $4622
char 1 105
char 1 110
char 1 103
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $4620
char 1 101
char 1 110
char 1 100
char 1 111
char 1 102
char 1 103
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $4615
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $4613
char 1 98
char 1 97
char 1 99
char 1 107
char 1 103
char 1 114
char 1 111
char 1 117
char 1 110
char 1 100
char 1 116
char 1 97
char 1 115
char 1 107
char 1 95
char 1 112
char 1 111
char 1 112
char 1 109
char 1 101
char 1 110
char 1 117
char 1 0
align 1
LABELV $4612
char 1 99
char 1 111
char 1 109
char 1 95
char 1 105
char 1 103
char 1 110
char 1 111
char 1 114
char 1 101
char 1 111
char 1 116
char 1 104
char 1 101
char 1 114
char 1 116
char 1 97
char 1 115
char 1 107
char 1 115
char 1 0
align 1
LABELV $4609
char 1 99
char 1 111
char 1 109
char 1 95
char 1 111
char 1 116
char 1 104
char 1 101
char 1 114
char 1 116
char 1 97
char 1 115
char 1 107
char 1 115
char 1 0
align 1
LABELV $4606
char 1 101
char 1 114
char 1 114
char 1 111
char 1 114
char 1 95
char 1 112
char 1 111
char 1 112
char 1 109
char 1 101
char 1 110
char 1 117
char 1 0
align 1
LABELV $4551
char 1 117
char 1 105
char 1 95
char 1 104
char 1 105
char 1 100
char 1 101
char 1 108
char 1 97
char 1 110
char 1 103
char 1 0
align 1
LABELV $4550
char 1 100
char 1 101
char 1 98
char 1 117
char 1 103
char 1 95
char 1 112
char 1 114
char 1 111
char 1 116
char 1 111
char 1 99
char 1 111
char 1 108
char 1 0
align 1
LABELV $4527
char 1 119
char 1 104
char 1 105
char 1 116
char 1 101
char 1 0
align 1
LABELV $4525
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 51
char 1 95
char 1 99
char 1 117
char 1 114
char 1 115
char 1 111
char 1 114
char 1 50
char 1 0
align 1
LABELV $4523
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 37
char 1 100
char 1 0
align 1
LABELV $4424
char 1 37
char 1 115
char 1 37
char 1 115
char 1 0
align 1
LABELV $4413
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 115
char 1 47
char 1 37
char 1 115
char 1 47
char 1 105
char 1 99
char 1 111
char 1 110
char 1 37
char 1 115
char 1 46
char 1 106
char 1 112
char 1 103
char 1 0
align 1
LABELV $4397
char 1 115
char 1 107
char 1 105
char 1 110
char 1 0
align 1
LABELV $4395
char 1 46
char 1 46
char 1 0
align 1
LABELV $4394
char 1 46
char 1 0
align 1
LABELV $4384
char 1 47
char 1 0
align 1
LABELV $4383
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 115
char 1 0
align 1
LABELV $4359
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
char 1 0
align 1
LABELV $4356
char 1 102
char 1 99
char 1 102
char 1 0
align 1
LABELV $4355
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
char 1 0
align 1
LABELV $4350
char 1 67
char 1 117
char 1 115
char 1 116
char 1 111
char 1 109
char 1 0
align 1
LABELV $4298
char 1 109
char 1 97
char 1 112
char 1 115
char 1 0
align 1
LABELV $4293
char 1 106
char 1 111
char 1 105
char 1 110
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 115
char 1 0
align 1
LABELV $4288
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 115
char 1 0
align 1
LABELV $4273
char 1 84
char 1 111
char 1 111
char 1 32
char 1 109
char 1 97
char 1 110
char 1 121
char 1 32
char 1 109
char 1 97
char 1 112
char 1 115
char 1 44
char 1 32
char 1 108
char 1 97
char 1 115
char 1 116
char 1 32
char 1 111
char 1 110
char 1 101
char 1 32
char 1 114
char 1 101
char 1 112
char 1 108
char 1 97
char 1 99
char 1 101
char 1 100
char 1 33
char 1 10
char 1 0
align 1
LABELV $4265
char 1 108
char 1 101
char 1 118
char 1 101
char 1 108
char 1 115
char 1 104
char 1 111
char 1 116
char 1 115
char 1 47
char 1 37
char 1 115
char 1 95
char 1 115
char 1 109
char 1 97
char 1 108
char 1 108
char 1 0
align 1
LABELV $4209
char 1 84
char 1 111
char 1 111
char 1 32
char 1 109
char 1 97
char 1 110
char 1 121
char 1 32
char 1 103
char 1 97
char 1 109
char 1 101
char 1 32
char 1 116
char 1 121
char 1 112
char 1 101
char 1 115
char 1 44
char 1 32
char 1 108
char 1 97
char 1 115
char 1 116
char 1 32
char 1 111
char 1 110
char 1 101
char 1 32
char 1 114
char 1 101
char 1 112
char 1 108
char 1 97
char 1 99
char 1 101
char 1 33
char 1 10
char 1 0
align 1
LABELV $4204
char 1 84
char 1 111
char 1 111
char 1 32
char 1 109
char 1 97
char 1 110
char 1 121
char 1 32
char 1 110
char 1 101
char 1 116
char 1 32
char 1 103
char 1 97
char 1 109
char 1 101
char 1 32
char 1 116
char 1 121
char 1 112
char 1 101
char 1 115
char 1 44
char 1 32
char 1 108
char 1 97
char 1 115
char 1 116
char 1 32
char 1 111
char 1 110
char 1 101
char 1 32
char 1 114
char 1 101
char 1 112
char 1 108
char 1 97
char 1 99
char 1 101
char 1 33
char 1 10
char 1 0
align 1
LABELV $4045
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $4036
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
LABELV $4005
char 1 105
char 1 99
char 1 111
char 1 110
char 1 95
char 1 0
align 1
LABELV $4000
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 115
char 1 47
char 1 37
char 1 115
char 1 0
align 1
LABELV $3985
char 1 117
char 1 105
char 1 95
char 1 115
char 1 101
char 1 108
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 77
char 1 111
char 1 100
char 1 101
char 1 108
char 1 73
char 1 110
char 1 100
char 1 101
char 1 120
char 1 0
align 1
LABELV $3908
char 1 46
char 1 46
char 1 46
char 1 0
align 1
LABELV $3904
char 1 85
char 1 110
char 1 107
char 1 110
char 1 111
char 1 119
char 1 110
char 1 0
align 1
LABELV $3903
char 1 73
char 1 110
char 1 97
char 1 99
char 1 116
char 1 105
char 1 118
char 1 101
char 1 0
align 1
LABELV $3897
char 1 37
char 1 115
char 1 32
char 1 40
char 1 37
char 1 115
char 1 41
char 1 0
align 1
LABELV $3894
char 1 37
char 1 115
char 1 0
align 1
LABELV $3893
char 1 40
char 1 65
char 1 41
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $3892
char 1 115
char 1 118
char 1 95
char 1 97
char 1 108
char 1 108
char 1 111
char 1 119
char 1 65
char 1 110
char 1 111
char 1 110
char 1 121
char 1 109
char 1 111
char 1 117
char 1 115
char 1 0
align 1
LABELV $3889
char 1 110
char 1 101
char 1 116
char 1 116
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $3888
char 1 37
char 1 115
char 1 32
char 1 91
char 1 37
char 1 115
char 1 93
char 1 0
align 1
LABELV $3884
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 116
char 1 114
char 1 117
char 1 101
char 1 106
char 1 101
char 1 100
char 1 105
char 1 0
align 1
LABELV $3881
char 1 116
char 1 114
char 1 117
char 1 101
char 1 106
char 1 101
char 1 100
char 1 105
char 1 0
align 1
LABELV $3878
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 111
char 1 110
char 1 108
char 1 121
char 1 0
align 1
LABELV $3870
char 1 119
char 1 100
char 1 105
char 1 115
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $3869
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 114
char 1 101
char 1 115
char 1 116
char 1 114
char 1 105
char 1 99
char 1 116
char 1 0
align 1
LABELV $3866
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 110
char 1 111
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 0
align 1
LABELV $3863
char 1 102
char 1 100
char 1 105
char 1 115
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $3860
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 110
char 1 101
char 1 101
char 1 100
char 1 112
char 1 97
char 1 115
char 1 115
char 1 0
align 1
LABELV $3859
char 1 110
char 1 101
char 1 101
char 1 100
char 1 112
char 1 97
char 1 115
char 1 115
char 1 0
align 1
LABELV $3643
char 1 115
char 1 0
align 1
LABELV $3636
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 83
char 1 95
char 1 70
char 1 79
char 1 85
char 1 78
char 1 68
char 1 87
char 1 73
char 1 84
char 1 72
char 1 0
align 1
LABELV $3635
char 1 110
char 1 111
char 1 32
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 115
char 1 32
char 1 102
char 1 111
char 1 117
char 1 110
char 1 100
char 1 0
align 1
LABELV $3551
char 1 115
char 1 101
char 1 97
char 1 114
char 1 99
char 1 104
char 1 105
char 1 110
char 1 103
char 1 32
char 1 37
char 1 100
char 1 47
char 1 37
char 1 100
char 1 46
char 1 46
char 1 46
char 1 0
align 1
LABELV $3493
char 1 115
char 1 101
char 1 97
char 1 114
char 1 99
char 1 104
char 1 105
char 1 110
char 1 103
char 1 32
char 1 37
char 1 100
char 1 46
char 1 46
char 1 46
char 1 0
align 1
LABELV $3485
char 1 99
char 1 108
char 1 95
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 83
char 1 116
char 1 97
char 1 116
char 1 117
char 1 115
char 1 82
char 1 101
char 1 115
char 1 101
char 1 110
char 1 100
char 1 84
char 1 105
char 1 109
char 1 101
char 1 0
align 1
LABELV $3474
char 1 117
char 1 105
char 1 95
char 1 102
char 1 105
char 1 110
char 1 100
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 0
align 1
LABELV $3429
char 1 112
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $3428
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 0
align 1
LABELV $3427
char 1 110
char 1 117
char 1 109
char 1 0
align 1
LABELV $3389
char 1 116
char 1 105
char 1 109
char 1 101
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $3388
char 1 118
char 1 101
char 1 114
char 1 115
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $3387
char 1 77
char 1 97
char 1 112
char 1 0
align 1
LABELV $3386
char 1 109
char 1 97
char 1 112
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $3385
char 1 71
char 1 97
char 1 109
char 1 101
char 1 32
char 1 116
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $3384
char 1 71
char 1 97
char 1 109
char 1 101
char 1 32
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $3383
char 1 103
char 1 97
char 1 109
char 1 101
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $3382
char 1 65
char 1 100
char 1 100
char 1 114
char 1 101
char 1 115
char 1 115
char 1 0
align 1
LABELV $3381
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $3380
char 1 115
char 1 118
char 1 95
char 1 104
char 1 111
char 1 115
char 1 116
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $3364
char 1 103
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $3352
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
LABELV $3332
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 115
char 1 0
align 1
LABELV $3289
char 1 87
char 1 101
char 1 108
char 1 99
char 1 111
char 1 109
char 1 101
char 1 32
char 1 116
char 1 111
char 1 32
char 1 74
char 1 75
char 1 50
char 1 77
char 1 80
char 1 33
char 1 0
align 1
LABELV $3278
char 1 99
char 1 108
char 1 95
char 1 109
char 1 111
char 1 116
char 1 100
char 1 83
char 1 116
char 1 114
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $3195
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
LABELV $3194
char 1 47
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $3192
char 1 47
char 1 98
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $3104
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 115
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 97
char 1 99
char 1 116
char 1 101
char 1 114
char 1 115
char 1 47
char 1 37
char 1 115
char 1 47
char 1 37
char 1 115
char 1 47
char 1 108
char 1 111
char 1 119
char 1 101
char 1 114
char 1 95
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 46
char 1 115
char 1 107
char 1 105
char 1 110
char 1 0
align 1
LABELV $3101
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 115
char 1 47
char 1 37
char 1 115
char 1 47
char 1 37
char 1 115
char 1 47
char 1 108
char 1 111
char 1 119
char 1 101
char 1 114
char 1 95
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 46
char 1 115
char 1 107
char 1 105
char 1 110
char 1 0
align 1
LABELV $3062
char 1 117
char 1 110
char 1 107
char 1 110
char 1 111
char 1 119
char 1 110
char 1 32
char 1 85
char 1 73
char 1 32
char 1 115
char 1 99
char 1 114
char 1 105
char 1 112
char 1 116
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $3059
char 1 117
char 1 112
char 1 100
char 1 97
char 1 116
char 1 101
char 1 0
align 1
LABELV $3056
char 1 117
char 1 112
char 1 100
char 1 97
char 1 116
char 1 101
char 1 70
char 1 111
char 1 114
char 1 99
char 1 101
char 1 83
char 1 116
char 1 97
char 1 116
char 1 117
char 1 115
char 1 0
align 1
LABELV $3042
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 68
char 1 105
char 1 115
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $3033
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
char 1 115
char 1 68
char 1 105
char 1 115
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $3030
char 1 103
char 1 108
char 1 67
char 1 117
char 1 115
char 1 116
char 1 111
char 1 109
char 1 0
align 1
LABELV $3027
char 1 114
char 1 101
char 1 102
char 1 114
char 1 101
char 1 115
char 1 104
char 1 70
char 1 111
char 1 114
char 1 99
char 1 101
char 1 0
align 1
LABELV $3024
char 1 115
char 1 97
char 1 118
char 1 101
char 1 84
char 1 101
char 1 109
char 1 112
char 1 108
char 1 97
char 1 116
char 1 101
char 1 0
align 1
LABELV $3019
char 1 115
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $3016
char 1 110
char 1 111
char 1 110
char 1 101
char 1 0
align 1
LABELV $3011
char 1 115
char 1 101
char 1 116
char 1 70
char 1 111
char 1 114
char 1 99
char 1 101
char 1 0
align 1
LABELV $3002
char 1 118
char 1 111
char 1 105
char 1 99
char 1 101
char 1 79
char 1 114
char 1 100
char 1 101
char 1 114
char 1 115
char 1 0
align 1
LABELV $2994
char 1 118
char 1 111
char 1 105
char 1 99
char 1 101
char 1 79
char 1 114
char 1 100
char 1 101
char 1 114
char 1 115
char 1 84
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $2982
char 1 10
char 1 0
align 1
LABELV $2975
char 1 111
char 1 114
char 1 100
char 1 101
char 1 114
char 1 115
char 1 0
align 1
LABELV $2966
char 1 117
char 1 105
char 1 95
char 1 102
char 1 97
char 1 118
char 1 111
char 1 114
char 1 105
char 1 116
char 1 101
char 1 65
char 1 100
char 1 100
char 1 114
char 1 101
char 1 115
char 1 115
char 1 0
align 1
LABELV $2965
char 1 117
char 1 105
char 1 95
char 1 102
char 1 97
char 1 118
char 1 111
char 1 114
char 1 105
char 1 116
char 1 101
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $2964
char 1 99
char 1 114
char 1 101
char 1 97
char 1 116
char 1 101
char 1 70
char 1 97
char 1 118
char 1 111
char 1 114
char 1 105
char 1 116
char 1 101
char 1 0
align 1
LABELV $2951
char 1 100
char 1 101
char 1 108
char 1 101
char 1 116
char 1 101
char 1 70
char 1 97
char 1 118
char 1 111
char 1 114
char 1 105
char 1 116
char 1 101
char 1 0
align 1
LABELV $2948
char 1 65
char 1 100
char 1 100
char 1 101
char 1 100
char 1 32
char 1 102
char 1 97
char 1 118
char 1 111
char 1 114
char 1 105
char 1 116
char 1 101
char 1 32
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $2947
char 1 70
char 1 97
char 1 118
char 1 111
char 1 114
char 1 105
char 1 116
char 1 101
char 1 32
char 1 108
char 1 105
char 1 115
char 1 116
char 1 32
char 1 102
char 1 117
char 1 108
char 1 108
char 1 10
char 1 0
align 1
LABELV $2944
char 1 70
char 1 97
char 1 118
char 1 111
char 1 114
char 1 105
char 1 116
char 1 101
char 1 32
char 1 97
char 1 108
char 1 114
char 1 101
char 1 97
char 1 100
char 1 121
char 1 32
char 1 105
char 1 110
char 1 32
char 1 108
char 1 105
char 1 115
char 1 116
char 1 10
char 1 0
align 1
LABELV $2939
char 1 97
char 1 100
char 1 100
char 1 114
char 1 0
align 1
LABELV $2938
char 1 104
char 1 111
char 1 115
char 1 116
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $2929
char 1 97
char 1 100
char 1 100
char 1 70
char 1 97
char 1 118
char 1 111
char 1 114
char 1 105
char 1 116
char 1 101
char 1 0
align 1
LABELV $2914
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
char 1 105
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $2911
char 1 97
char 1 100
char 1 100
char 1 66
char 1 111
char 1 116
char 1 0
align 1
LABELV $2906
char 1 99
char 1 97
char 1 108
char 1 108
char 1 116
char 1 101
char 1 97
char 1 109
char 1 118
char 1 111
char 1 116
char 1 101
char 1 32
char 1 108
char 1 101
char 1 97
char 1 100
char 1 101
char 1 114
char 1 32
char 1 34
char 1 37
char 1 115
char 1 34
char 1 10
char 1 0
align 1
LABELV $2900
char 1 118
char 1 111
char 1 116
char 1 101
char 1 76
char 1 101
char 1 97
char 1 100
char 1 101
char 1 114
char 1 0
align 1
LABELV $2894
char 1 99
char 1 97
char 1 108
char 1 108
char 1 118
char 1 111
char 1 116
char 1 101
char 1 32
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
char 1 105
char 1 10
char 1 0
align 1
LABELV $2888
char 1 118
char 1 111
char 1 116
char 1 101
char 1 71
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $2883
char 1 99
char 1 97
char 1 108
char 1 108
char 1 118
char 1 111
char 1 116
char 1 101
char 1 32
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
char 1 34
char 1 37
char 1 105
char 1 34
char 1 10
char 1 0
align 1
LABELV $2877
char 1 118
char 1 111
char 1 116
char 1 101
char 1 75
char 1 105
char 1 99
char 1 107
char 1 0
align 1
LABELV $2871
char 1 99
char 1 97
char 1 108
char 1 108
char 1 118
char 1 111
char 1 116
char 1 101
char 1 32
char 1 109
char 1 97
char 1 112
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $2865
char 1 118
char 1 111
char 1 116
char 1 101
char 1 77
char 1 97
char 1 112
char 1 0
align 1
LABELV $2862
char 1 99
char 1 108
char 1 111
char 1 115
char 1 101
char 1 105
char 1 110
char 1 103
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $2859
char 1 83
char 1 107
char 1 105
char 1 114
char 1 109
char 1 105
char 1 115
char 1 104
char 1 83
char 1 116
char 1 97
char 1 114
char 1 116
char 1 0
align 1
LABELV $2856
char 1 110
char 1 101
char 1 120
char 1 116
char 1 83
char 1 107
char 1 105
char 1 114
char 1 109
char 1 105
char 1 115
char 1 104
char 1 0
align 1
LABELV $2840
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 83
char 1 111
char 1 114
char 1 116
char 1 0
align 1
LABELV $2837
char 1 117
char 1 112
char 1 100
char 1 97
char 1 116
char 1 101
char 1 118
char 1 105
char 1 100
char 1 101
char 1 111
char 1 115
char 1 101
char 1 116
char 1 117
char 1 112
char 1 0
align 1
LABELV $2834
char 1 103
char 1 101
char 1 116
char 1 118
char 1 105
char 1 100
char 1 101
char 1 111
char 1 115
char 1 101
char 1 116
char 1 117
char 1 112
char 1 0
align 1
LABELV $2831
char 1 100
char 1 105
char 1 115
char 1 99
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 10
char 1 0
align 1
LABELV $2830
char 1 76
char 1 101
char 1 97
char 1 118
char 1 101
char 1 0
align 1
LABELV $2827
char 1 115
char 1 101
char 1 116
char 1 117
char 1 112
char 1 95
char 1 109
char 1 101
char 1 110
char 1 117
char 1 50
char 1 0
align 1
LABELV $2826
char 1 99
char 1 108
char 1 95
char 1 112
char 1 97
char 1 117
char 1 115
char 1 101
char 1 100
char 1 0
align 1
LABELV $2825
char 1 67
char 1 111
char 1 110
char 1 116
char 1 114
char 1 111
char 1 108
char 1 115
char 1 0
align 1
LABELV $2822
char 1 113
char 1 117
char 1 105
char 1 116
char 1 0
align 1
LABELV $2821
char 1 81
char 1 117
char 1 105
char 1 116
char 1 0
align 1
LABELV $2811
char 1 70
char 1 111
char 1 117
char 1 110
char 1 100
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 74
char 1 111
char 1 105
char 1 110
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 0
align 1
LABELV $2808
char 1 99
char 1 111
char 1 110
char 1 110
char 1 101
char 1 99
char 1 116
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $2794
char 1 74
char 1 111
char 1 105
char 1 110
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 0
align 1
LABELV $2789
char 1 70
char 1 105
char 1 110
char 1 100
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 0
align 1
LABELV $2782
char 1 70
char 1 111
char 1 117
char 1 110
char 1 100
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 83
char 1 116
char 1 97
char 1 116
char 1 117
char 1 115
char 1 0
align 1
LABELV $2772
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 83
char 1 116
char 1 97
char 1 116
char 1 117
char 1 115
char 1 0
align 1
LABELV $2766
char 1 85
char 1 112
char 1 100
char 1 97
char 1 116
char 1 101
char 1 70
char 1 105
char 1 108
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $2759
char 1 83
char 1 116
char 1 111
char 1 112
char 1 82
char 1 101
char 1 102
char 1 114
char 1 101
char 1 115
char 1 104
char 1 0
align 1
LABELV $2756
char 1 109
char 1 97
char 1 105
char 1 110
char 1 0
align 1
LABELV $2755
char 1 106
char 1 111
char 1 105
char 1 110
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 0
align 1
LABELV $2746
char 1 99
char 1 108
char 1 111
char 1 115
char 1 101
char 1 74
char 1 111
char 1 105
char 1 110
char 1 0
align 1
LABELV $2743
char 1 81
char 1 117
char 1 97
char 1 107
char 1 101
char 1 51
char 1 0
align 1
LABELV $2738
char 1 100
char 1 101
char 1 109
char 1 111
char 1 32
char 1 34
char 1 37
char 1 115
char 1 34
char 1 10
char 1 0
align 1
LABELV $2737
char 1 82
char 1 117
char 1 110
char 1 68
char 1 101
char 1 109
char 1 111
char 1 0
align 1
LABELV $2732
char 1 102
char 1 115
char 1 95
char 1 103
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $2731
char 1 82
char 1 117
char 1 110
char 1 77
char 1 111
char 1 100
char 1 0
align 1
LABELV $2726
char 1 99
char 1 105
char 1 110
char 1 101
char 1 109
char 1 97
char 1 116
char 1 105
char 1 99
char 1 32
char 1 37
char 1 115
char 1 46
char 1 114
char 1 111
char 1 113
char 1 32
char 1 50
char 1 10
char 1 0
align 1
LABELV $2721
char 1 112
char 1 108
char 1 97
char 1 121
char 1 77
char 1 111
char 1 118
char 1 105
char 1 101
char 1 0
align 1
LABELV $2718
char 1 76
char 1 111
char 1 97
char 1 100
char 1 77
char 1 111
char 1 100
char 1 115
char 1 0
align 1
LABELV $2715
char 1 76
char 1 111
char 1 97
char 1 100
char 1 77
char 1 111
char 1 118
char 1 105
char 1 101
char 1 115
char 1 0
align 1
LABELV $2712
char 1 76
char 1 111
char 1 97
char 1 100
char 1 68
char 1 101
char 1 109
char 1 111
char 1 115
char 1 0
align 1
LABELV $2703
char 1 100
char 1 101
char 1 109
char 1 111
char 1 32
char 1 37
char 1 115
char 1 95
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $2699
char 1 82
char 1 117
char 1 110
char 1 83
char 1 80
char 1 68
char 1 101
char 1 109
char 1 111
char 1 0
align 1
LABELV $2696
char 1 82
char 1 101
char 1 102
char 1 114
char 1 101
char 1 115
char 1 104
char 1 70
char 1 105
char 1 108
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $2693
char 1 82
char 1 101
char 1 102
char 1 114
char 1 101
char 1 115
char 1 104
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 115
char 1 0
align 1
LABELV $2690
char 1 114
char 1 101
char 1 115
char 1 101
char 1 116
char 1 83
char 1 99
char 1 111
char 1 114
char 1 101
char 1 115
char 1 0
align 1
LABELV $2681
char 1 108
char 1 111
char 1 97
char 1 100
char 1 71
char 1 97
char 1 109
char 1 101
char 1 73
char 1 110
char 1 102
char 1 111
char 1 0
align 1
LABELV $2678
char 1 99
char 1 111
char 1 109
char 1 95
char 1 101
char 1 114
char 1 114
char 1 111
char 1 114
char 1 77
char 1 101
char 1 115
char 1 115
char 1 97
char 1 103
char 1 101
char 1 0
align 1
LABELV $2677
char 1 99
char 1 108
char 1 101
char 1 97
char 1 114
char 1 69
char 1 114
char 1 114
char 1 111
char 1 114
char 1 0
align 1
LABELV $2674
char 1 108
char 1 111
char 1 97
char 1 100
char 1 67
char 1 111
char 1 110
char 1 116
char 1 114
char 1 111
char 1 108
char 1 115
char 1 0
align 1
LABELV $2671
char 1 115
char 1 97
char 1 118
char 1 101
char 1 67
char 1 111
char 1 110
char 1 116
char 1 114
char 1 111
char 1 108
char 1 115
char 1 0
align 1
LABELV $2668
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
LABELV $2667
char 1 99
char 1 114
char 1 101
char 1 97
char 1 116
char 1 101
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 0
align 1
LABELV $2666
char 1 108
char 1 111
char 1 97
char 1 100
char 1 65
char 1 114
char 1 101
char 1 110
char 1 97
char 1 115
char 1 0
align 1
LABELV $2663
char 1 99
char 1 111
char 1 109
char 1 95
char 1 105
char 1 110
char 1 116
char 1 114
char 1 111
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 100
char 1 0
align 1
LABELV $2662
char 1 118
char 1 105
char 1 100
char 1 95
char 1 114
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 10
char 1 0
align 1
LABELV $2661
char 1 101
char 1 120
char 1 101
char 1 99
char 1 32
char 1 109
char 1 112
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 46
char 1 99
char 1 102
char 1 103
char 1 10
char 1 0
align 1
LABELV $2660
char 1 99
char 1 118
char 1 97
char 1 114
char 1 95
char 1 114
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 10
char 1 0
align 1
LABELV $2659
char 1 114
char 1 101
char 1 115
char 1 101
char 1 116
char 1 68
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 115
char 1 0
align 1
LABELV $2652
char 1 117
char 1 112
char 1 100
char 1 97
char 1 116
char 1 101
char 1 83
char 1 80
char 1 77
char 1 101
char 1 110
char 1 117
char 1 0
align 1
LABELV $2640
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
char 1 10
char 1 0
align 1
LABELV $2639
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
char 1 10
char 1 0
align 1
LABELV $2625
char 1 49
char 1 50
char 1 48
char 1 0
align 1
LABELV $2611
char 1 100
char 1 101
char 1 100
char 1 105
char 1 99
char 1 97
char 1 116
char 1 101
char 1 100
char 1 0
align 1
LABELV $2610
char 1 83
char 1 116
char 1 97
char 1 114
char 1 116
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 0
align 1
LABELV $2604
char 1 52
char 1 0
align 1
LABELV $2602
char 1 118
char 1 105
char 1 100
char 1 95
char 1 114
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 59
char 1 0
align 1
LABELV $2601
char 1 117
char 1 105
char 1 95
char 1 99
char 1 103
char 1 95
char 1 115
char 1 104
char 1 97
char 1 100
char 1 111
char 1 119
char 1 115
char 1 0
align 1
LABELV $2600
char 1 99
char 1 103
char 1 95
char 1 115
char 1 104
char 1 97
char 1 100
char 1 111
char 1 119
char 1 115
char 1 0
align 1
LABELV $2599
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 97
char 1 108
char 1 108
char 1 111
char 1 119
char 1 69
char 1 120
char 1 116
char 1 101
char 1 110
char 1 115
char 1 105
char 1 111
char 1 110
char 1 115
char 1 0
align 1
LABELV $2598
char 1 114
char 1 95
char 1 97
char 1 108
char 1 108
char 1 111
char 1 119
char 1 69
char 1 120
char 1 116
char 1 101
char 1 110
char 1 115
char 1 105
char 1 111
char 1 110
char 1 115
char 1 0
align 1
LABELV $2597
char 1 114
char 1 95
char 1 105
char 1 110
char 1 71
char 1 97
char 1 109
char 1 101
char 1 86
char 1 105
char 1 100
char 1 101
char 1 111
char 1 0
align 1
LABELV $2596
char 1 114
char 1 95
char 1 102
char 1 97
char 1 115
char 1 116
char 1 83
char 1 107
char 1 121
char 1 0
align 1
LABELV $2595
char 1 114
char 1 95
char 1 115
char 1 117
char 1 98
char 1 100
char 1 105
char 1 118
char 1 105
char 1 115
char 1 105
char 1 111
char 1 110
char 1 115
char 1 0
align 1
LABELV $2594
char 1 114
char 1 95
char 1 100
char 1 101
char 1 112
char 1 116
char 1 104
char 1 98
char 1 105
char 1 116
char 1 115
char 1 0
align 1
LABELV $2593
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 101
char 1 120
char 1 116
char 1 95
char 1 99
char 1 111
char 1 109
char 1 112
char 1 114
char 1 101
char 1 115
char 1 115
char 1 95
char 1 116
char 1 101
char 1 120
char 1 116
char 1 117
char 1 114
char 1 101
char 1 115
char 1 0
align 1
LABELV $2592
char 1 114
char 1 95
char 1 101
char 1 120
char 1 116
char 1 95
char 1 99
char 1 111
char 1 109
char 1 112
char 1 114
char 1 101
char 1 115
char 1 115
char 1 95
char 1 116
char 1 101
char 1 120
char 1 116
char 1 117
char 1 114
char 1 101
char 1 115
char 1 0
align 1
LABELV $2591
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 100
char 1 101
char 1 116
char 1 97
char 1 105
char 1 108
char 1 116
char 1 101
char 1 120
char 1 116
char 1 117
char 1 114
char 1 101
char 1 115
char 1 0
align 1
LABELV $2590
char 1 114
char 1 95
char 1 100
char 1 101
char 1 116
char 1 97
char 1 105
char 1 108
char 1 116
char 1 101
char 1 120
char 1 116
char 1 117
char 1 114
char 1 101
char 1 115
char 1 0
align 1
LABELV $2589
char 1 114
char 1 95
char 1 116
char 1 101
char 1 120
char 1 116
char 1 117
char 1 114
char 1 101
char 1 109
char 1 111
char 1 100
char 1 101
char 1 0
align 1
LABELV $2588
char 1 114
char 1 95
char 1 116
char 1 101
char 1 120
char 1 116
char 1 117
char 1 114
char 1 101
char 1 98
char 1 105
char 1 116
char 1 115
char 1 0
align 1
LABELV $2587
char 1 114
char 1 95
char 1 112
char 1 105
char 1 99
char 1 109
char 1 105
char 1 112
char 1 0
align 1
LABELV $2586
char 1 114
char 1 95
char 1 108
char 1 111
char 1 100
char 1 98
char 1 105
char 1 97
char 1 115
char 1 0
align 1
LABELV $2585
char 1 114
char 1 95
char 1 99
char 1 111
char 1 108
char 1 111
char 1 114
char 1 98
char 1 105
char 1 116
char 1 115
char 1 0
align 1
LABELV $2584
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 102
char 1 117
char 1 108
char 1 108
char 1 115
char 1 99
char 1 114
char 1 101
char 1 101
char 1 110
char 1 0
align 1
LABELV $2583
char 1 114
char 1 95
char 1 102
char 1 117
char 1 108
char 1 108
char 1 115
char 1 99
char 1 114
char 1 101
char 1 101
char 1 110
char 1 0
align 1
LABELV $2582
char 1 114
char 1 95
char 1 109
char 1 111
char 1 100
char 1 101
char 1 0
align 1
LABELV $2577
char 1 117
char 1 105
char 1 95
char 1 114
char 1 117
char 1 108
char 1 101
char 1 115
char 1 95
char 1 98
char 1 97
char 1 99
char 1 107
char 1 111
char 1 117
char 1 116
char 1 0
align 1
LABELV $2576
char 1 82
char 1 117
char 1 108
char 1 101
char 1 115
char 1 66
char 1 97
char 1 99
char 1 107
char 1 111
char 1 117
char 1 116
char 1 0
align 1
LABELV $2568
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 109
char 1 111
char 1 100
char 1 105
char 1 102
char 1 105
char 1 101
char 1 100
char 1 0
align 1
LABELV $2565
char 1 86
char 1 105
char 1 100
char 1 101
char 1 111
char 1 83
char 1 101
char 1 116
char 1 117
char 1 112
char 1 0
align 1
LABELV $2559
char 1 109
char 1 95
char 1 112
char 1 105
char 1 116
char 1 99
char 1 104
char 1 0
align 1
LABELV $2556
char 1 117
char 1 105
char 1 95
char 1 109
char 1 111
char 1 117
char 1 115
char 1 101
char 1 80
char 1 105
char 1 116
char 1 99
char 1 104
char 1 0
align 1
LABELV $2551
char 1 71
char 1 76
char 1 95
char 1 76
char 1 73
char 1 78
char 1 69
char 1 65
char 1 82
char 1 95
char 1 77
char 1 73
char 1 80
char 1 77
char 1 65
char 1 80
char 1 95
char 1 78
char 1 69
char 1 65
char 1 82
char 1 69
char 1 83
char 1 84
char 1 0
align 1
LABELV $2548
char 1 71
char 1 76
char 1 95
char 1 76
char 1 73
char 1 78
char 1 69
char 1 65
char 1 82
char 1 95
char 1 77
char 1 73
char 1 80
char 1 77
char 1 65
char 1 80
char 1 95
char 1 76
char 1 73
char 1 78
char 1 69
char 1 65
char 1 82
char 1 0
align 1
LABELV $2547
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 116
char 1 101
char 1 120
char 1 116
char 1 117
char 1 114
char 1 101
char 1 109
char 1 111
char 1 100
char 1 101
char 1 0
align 1
LABELV $2546
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 105
char 1 110
char 1 71
char 1 97
char 1 109
char 1 101
char 1 86
char 1 105
char 1 100
char 1 101
char 1 111
char 1 0
align 1
LABELV $2545
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 102
char 1 97
char 1 115
char 1 116
char 1 83
char 1 107
char 1 121
char 1 0
align 1
LABELV $2544
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 116
char 1 101
char 1 120
char 1 116
char 1 117
char 1 114
char 1 101
char 1 98
char 1 105
char 1 116
char 1 115
char 1 0
align 1
LABELV $2543
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 109
char 1 111
char 1 100
char 1 101
char 1 0
align 1
LABELV $2542
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 112
char 1 105
char 1 99
char 1 109
char 1 105
char 1 112
char 1 0
align 1
LABELV $2541
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 102
char 1 117
char 1 108
char 1 108
char 1 83
char 1 99
char 1 114
char 1 101
char 1 101
char 1 110
char 1 0
align 1
LABELV $2537
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 103
char 1 108
char 1 67
char 1 117
char 1 115
char 1 116
char 1 111
char 1 109
char 1 0
align 1
LABELV $2532
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 115
char 1 117
char 1 98
char 1 100
char 1 105
char 1 118
char 1 105
char 1 115
char 1 105
char 1 111
char 1 110
char 1 115
char 1 0
align 1
LABELV $2528
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 108
char 1 111
char 1 100
char 1 98
char 1 105
char 1 97
char 1 115
char 1 0
align 1
LABELV $2521
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 100
char 1 101
char 1 112
char 1 116
char 1 104
char 1 98
char 1 105
char 1 116
char 1 115
char 1 0
align 1
LABELV $2517
char 1 117
char 1 105
char 1 95
char 1 114
char 1 95
char 1 99
char 1 111
char 1 108
char 1 111
char 1 114
char 1 98
char 1 105
char 1 116
char 1 115
char 1 0
align 1
LABELV $2514
char 1 117
char 1 105
char 1 95
char 1 71
char 1 101
char 1 116
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $2511
char 1 50
char 1 0
align 1
LABELV $2508
char 1 99
char 1 108
char 1 95
char 1 112
char 1 97
char 1 99
char 1 107
char 1 101
char 1 116
char 1 100
char 1 117
char 1 112
char 1 0
align 1
LABELV $2507
char 1 99
char 1 108
char 1 95
char 1 109
char 1 97
char 1 120
char 1 112
char 1 97
char 1 99
char 1 107
char 1 101
char 1 116
char 1 115
char 1 0
align 1
LABELV $2504
char 1 114
char 1 97
char 1 116
char 1 101
char 1 0
align 1
LABELV $2503
char 1 117
char 1 105
char 1 95
char 1 115
char 1 101
char 1 116
char 1 82
char 1 97
char 1 116
char 1 101
char 1 0
align 1
LABELV $2500
char 1 117
char 1 105
char 1 95
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $2499
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $2498
char 1 117
char 1 105
char 1 95
char 1 83
char 1 101
char 1 116
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $2495
char 1 115
char 1 110
char 1 100
char 1 95
char 1 114
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 10
char 1 0
align 1
LABELV $2494
char 1 115
char 1 95
char 1 107
char 1 104
char 1 122
char 1 0
align 1
LABELV $2490
char 1 119
char 1 97
char 1 105
char 1 116
char 1 32
char 1 53
char 1 59
char 1 32
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 82
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $2435
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
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $2418
char 1 119
char 1 97
char 1 105
char 1 116
char 1 32
char 1 59
char 1 32
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
char 1 44
char 1 32
char 1 37
char 1 105
char 1 32
char 1 10
char 1 0
align 1
LABELV $2412
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 99
char 1 111
char 1 114
char 1 100
char 1 83
char 1 80
char 1 68
char 1 101
char 1 109
char 1 111
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $2408
char 1 37
char 1 115
char 1 95
char 1 37
char 1 105
char 1 0
align 1
LABELV $2407
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 99
char 1 111
char 1 114
char 1 100
char 1 83
char 1 80
char 1 68
char 1 101
char 1 109
char 1 111
char 1 0
align 1
LABELV $2404
char 1 103
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 84
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $2403
char 1 103
char 1 95
char 1 114
char 1 101
char 1 100
char 1 84
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $2402
char 1 117
char 1 105
char 1 95
char 1 112
char 1 117
char 1 114
char 1 101
char 1 0
align 1
LABELV $2401
char 1 115
char 1 118
char 1 95
char 1 112
char 1 117
char 1 114
char 1 101
char 1 0
align 1
LABELV $2400
char 1 117
char 1 105
char 1 95
char 1 87
char 1 97
char 1 114
char 1 109
char 1 117
char 1 112
char 1 0
align 1
LABELV $2399
char 1 103
char 1 95
char 1 119
char 1 97
char 1 114
char 1 109
char 1 117
char 1 112
char 1 0
align 1
LABELV $2398
char 1 117
char 1 105
char 1 95
char 1 109
char 1 97
char 1 120
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 115
char 1 0
align 1
LABELV $2397
char 1 117
char 1 105
char 1 95
char 1 102
char 1 114
char 1 105
char 1 101
char 1 110
char 1 100
char 1 108
char 1 121
char 1 70
char 1 105
char 1 114
char 1 101
char 1 0
align 1
LABELV $2396
char 1 103
char 1 95
char 1 102
char 1 114
char 1 105
char 1 101
char 1 110
char 1 100
char 1 108
char 1 121
char 1 70
char 1 105
char 1 114
char 1 101
char 1 0
align 1
LABELV $2395
char 1 117
char 1 105
char 1 95
char 1 100
char 1 111
char 1 87
char 1 97
char 1 114
char 1 109
char 1 117
char 1 112
char 1 0
align 1
LABELV $2394
char 1 103
char 1 95
char 1 100
char 1 111
char 1 87
char 1 97
char 1 114
char 1 109
char 1 117
char 1 112
char 1 0
align 1
LABELV $2393
char 1 117
char 1 105
char 1 95
char 1 100
char 1 114
char 1 97
char 1 119
char 1 84
char 1 105
char 1 109
char 1 101
char 1 114
char 1 0
align 1
LABELV $2392
char 1 99
char 1 103
char 1 95
char 1 100
char 1 114
char 1 97
char 1 119
char 1 84
char 1 105
char 1 109
char 1 101
char 1 114
char 1 0
align 1
LABELV $2391
char 1 117
char 1 105
char 1 95
char 1 115
char 1 97
char 1 118
char 1 101
char 1 68
char 1 117
char 1 101
char 1 108
char 1 76
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $2390
char 1 100
char 1 117
char 1 101
char 1 108
char 1 95
char 1 102
char 1 114
char 1 97
char 1 103
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $2389
char 1 117
char 1 105
char 1 95
char 1 115
char 1 97
char 1 118
char 1 101
char 1 70
char 1 114
char 1 97
char 1 103
char 1 76
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $2388
char 1 117
char 1 105
char 1 95
char 1 115
char 1 97
char 1 118
char 1 101
char 1 67
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 76
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $2387
char 1 117
char 1 105
char 1 95
char 1 115
char 1 105
char 1 110
char 1 103
char 1 108
char 1 101
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 65
char 1 99
char 1 116
char 1 105
char 1 118
char 1 101
char 1 0
align 1
LABELV $2384
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 77
char 1 97
char 1 112
char 1 0
align 1
LABELV $2380
char 1 119
char 1 97
char 1 105
char 1 116
char 1 32
char 1 59
char 1 32
char 1 119
char 1 97
char 1 105
char 1 116
char 1 32
char 1 59
char 1 32
char 1 109
char 1 97
char 1 112
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $2374
char 1 117
char 1 105
char 1 95
char 1 109
char 1 97
char 1 112
char 1 73
char 1 110
char 1 100
char 1 101
char 1 120
char 1 0
align 1
LABELV $2370
char 1 115
char 1 107
char 1 105
char 1 114
char 1 109
char 1 105
char 1 115
char 1 104
char 1 0
align 1
LABELV $2344
char 1 46
char 1 100
char 1 109
char 1 95
char 1 37
char 1 100
char 1 0
align 1
LABELV $2343
char 1 100
char 1 101
char 1 109
char 1 111
char 1 115
char 1 0
align 1
LABELV $2341
char 1 112
char 1 114
char 1 111
char 1 116
char 1 111
char 1 99
char 1 111
char 1 108
char 1 0
align 1
LABELV $2340
char 1 100
char 1 109
char 1 95
char 1 37
char 1 100
char 1 0
align 1
LABELV $2337
char 1 46
char 1 114
char 1 111
char 1 113
char 1 0
align 1
LABELV $2322
char 1 114
char 1 111
char 1 113
char 1 0
align 1
LABELV $2321
char 1 118
char 1 105
char 1 100
char 1 101
char 1 111
char 1 0
align 1
LABELV $2305
char 1 36
char 1 109
char 1 111
char 1 100
char 1 108
char 1 105
char 1 115
char 1 116
char 1 0
align 1
LABELV $2225
char 1 99
char 1 103
char 1 95
char 1 100
char 1 114
char 1 97
char 1 119
char 1 67
char 1 114
char 1 111
char 1 115
char 1 115
char 1 104
char 1 97
char 1 105
char 1 114
char 1 0
align 1
LABELV $2140
char 1 117
char 1 105
char 1 95
char 1 110
char 1 101
char 1 116
char 1 83
char 1 111
char 1 117
char 1 114
char 1 99
char 1 101
char 1 0
align 1
LABELV $2028
char 1 117
char 1 105
char 1 95
char 1 97
char 1 99
char 1 116
char 1 117
char 1 97
char 1 108
char 1 110
char 1 101
char 1 116
char 1 71
char 1 97
char 1 109
char 1 101
char 1 84
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $1997
char 1 117
char 1 105
char 1 95
char 1 103
char 1 97
char 1 109
char 1 101
char 1 84
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $1996
char 1 117
char 1 105
char 1 95
char 1 81
char 1 51
char 1 77
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $1938
char 1 99
char 1 111
char 1 108
char 1 111
char 1 114
char 1 49
char 1 0
align 1
LABELV $1728
char 1 74
char 1 75
char 1 50
char 1 77
char 1 80
char 1 58
char 1 32
char 1 118
char 1 49
char 1 46
char 1 48
char 1 51
char 1 97
char 1 0
align 1
LABELV $1696
char 1 71
char 1 76
char 1 95
char 1 80
char 1 73
char 1 88
char 1 69
char 1 76
char 1 70
char 1 79
char 1 82
char 1 77
char 1 65
char 1 84
char 1 58
char 1 32
char 1 99
char 1 111
char 1 108
char 1 111
char 1 114
char 1 40
char 1 37
char 1 100
char 1 45
char 1 98
char 1 105
char 1 116
char 1 115
char 1 41
char 1 32
char 1 90
char 1 40
char 1 37
char 1 100
char 1 45
char 1 98
char 1 105
char 1 116
char 1 115
char 1 41
char 1 32
char 1 115
char 1 116
char 1 101
char 1 110
char 1 99
char 1 105
char 1 108
char 1 40
char 1 37
char 1 100
char 1 45
char 1 98
char 1 105
char 1 116
char 1 115
char 1 41
char 1 0
align 1
LABELV $1692
char 1 71
char 1 76
char 1 95
char 1 86
char 1 69
char 1 82
char 1 83
char 1 73
char 1 79
char 1 78
char 1 58
char 1 32
char 1 37
char 1 115
char 1 58
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $1689
char 1 71
char 1 76
char 1 95
char 1 86
char 1 69
char 1 78
char 1 68
char 1 79
char 1 82
char 1 58
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $1581
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
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 95
char 1 82
char 1 69
char 1 70
char 1 82
char 1 69
char 1 83
char 1 72
char 1 84
char 1 73
char 1 77
char 1 69
char 1 0
align 1
LABELV $1578
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
char 1 71
char 1 69
char 1 84
char 1 84
char 1 73
char 1 78
char 1 71
char 1 73
char 1 78
char 1 70
char 1 79
char 1 70
char 1 79
char 1 82
char 1 83
char 1 69
char 1 82
char 1 86
char 1 69
char 1 82
char 1 83
char 1 0
align 1
LABELV $1555
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
LABELV $1553
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
LABELV $1545
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
LABELV $1522
char 1 110
char 1 0
align 1
LABELV $1511
char 1 115
char 1 118
char 1 95
char 1 109
char 1 97
char 1 120
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 115
char 1 0
align 1
LABELV $1510
char 1 116
char 1 0
align 1
LABELV $1509
char 1 116
char 1 108
char 1 0
align 1
LABELV $1473
char 1 117
char 1 105
char 1 95
char 1 108
char 1 97
char 1 115
char 1 116
char 1 83
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 82
char 1 101
char 1 102
char 1 114
char 1 101
char 1 115
char 1 104
char 1 95
char 1 37
char 1 105
char 1 0
align 1
LABELV $1471
char 1 87
char 1 65
char 1 73
char 1 84
char 1 73
char 1 78
char 1 71
char 1 95
char 1 70
char 1 79
char 1 82
char 1 95
char 1 78
char 1 69
char 1 87
char 1 95
char 1 75
char 1 69
char 1 89
char 1 0
align 1
LABELV $1436
char 1 37
char 1 105
char 1 46
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $1431
char 1 72
char 1 117
char 1 109
char 1 97
char 1 110
char 1 0
align 1
LABELV $1406
char 1 37
char 1 105
char 1 0
align 1
LABELV $1397
char 1 89
char 1 69
char 1 83
char 1 0
align 1
LABELV $1396
char 1 78
char 1 79
char 1 0
align 1
LABELV $1395
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 48
char 1 0
align 1
LABELV $1388
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 68
char 1 69
char 1 83
char 1 67
char 1 95
char 1 68
char 1 65
char 1 82
char 1 75
char 1 0
align 1
LABELV $1387
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 68
char 1 69
char 1 83
char 1 67
char 1 95
char 1 76
char 1 73
char 1 71
char 1 72
char 1 84
char 1 0
align 1
LABELV $1380
char 1 68
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 0
align 1
LABELV $1226
char 1 117
char 1 105
char 1 95
char 1 111
char 1 112
char 1 112
char 1 111
char 1 110
char 1 101
char 1 110
char 1 116
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $1224
char 1 75
char 1 121
char 1 108
char 1 101
char 1 0
align 1
LABELV $1176
char 1 108
char 1 101
char 1 118
char 1 101
char 1 108
char 1 115
char 1 104
char 1 111
char 1 116
char 1 115
char 1 47
char 1 37
char 1 115
char 1 0
align 1
LABELV $1163
char 1 84
char 1 105
char 1 101
char 1 114
char 1 58
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $1158
char 1 117
char 1 105
char 1 95
char 1 99
char 1 117
char 1 114
char 1 114
char 1 101
char 1 110
char 1 116
char 1 84
char 1 105
char 1 101
char 1 114
char 1 0
align 1
LABELV $1155
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 71
char 1 65
char 1 77
char 1 69
char 1 0
align 1
LABELV $1121
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $1120
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 83
char 1 79
char 1 85
char 1 82
char 1 67
char 1 69
char 1 0
align 1
LABELV $1094
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
LABELV $1093
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
char 1 98
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $1092
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
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $1091
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
char 1 106
char 1 111
char 1 105
char 1 110
char 1 0
align 1
LABELV $1090
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 97
char 1 112
char 1 112
char 1 108
char 1 121
char 1 0
align 1
LABELV $1087
char 1 121
char 1 101
char 1 115
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 0
align 1
LABELV $1086
char 1 110
char 1 111
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 0
align 1
LABELV $1080
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 110
char 1 111
char 1 110
char 1 101
char 1 99
char 1 111
char 1 110
char 1 102
char 1 105
char 1 103
char 1 109
char 1 101
char 1 0
align 1
LABELV $1079
char 1 121
char 1 101
char 1 115
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 0
align 1
LABELV $1078
char 1 110
char 1 111
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 0
align 1
LABELV $1074
char 1 106
char 1 101
char 1 100
char 1 105
char 1 110
char 1 111
char 1 110
char 1 106
char 1 101
char 1 100
char 1 105
char 1 0
align 1
LABELV $1068
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
char 1 0
align 1
LABELV $1013
char 1 37
char 1 48
char 1 50
char 1 105
char 1 58
char 1 37
char 1 48
char 1 50
char 1 105
char 1 0
align 1
LABELV $998
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 117
char 1 110
char 1 107
char 1 110
char 1 111
char 1 119
char 1 110
char 1 109
char 1 97
char 1 112
char 1 0
align 1
LABELV $983
char 1 117
char 1 105
char 1 95
char 1 99
char 1 117
char 1 114
char 1 114
char 1 101
char 1 110
char 1 116
char 1 77
char 1 97
char 1 112
char 1 0
align 1
LABELV $981
char 1 117
char 1 105
char 1 95
char 1 99
char 1 117
char 1 114
char 1 114
char 1 101
char 1 110
char 1 116
char 1 78
char 1 101
char 1 116
char 1 77
char 1 97
char 1 112
char 1 0
align 1
LABELV $963
char 1 72
char 1 85
char 1 77
char 1 65
char 1 78
char 1 0
align 1
LABELV $962
char 1 67
char 1 76
char 1 79
char 1 83
char 1 69
char 1 68
char 1 0
align 1
LABELV $961
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 0
align 1
LABELV $947
char 1 115
char 1 118
char 1 95
char 1 109
char 1 97
char 1 120
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 115
char 1 0
align 1
LABELV $943
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 116
char 1 101
char 1 97
char 1 109
char 1 37
char 1 105
char 1 0
align 1
LABELV $942
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 116
char 1 101
char 1 97
char 1 109
char 1 37
char 1 105
char 1 0
align 1
LABELV $936
char 1 82
char 1 101
char 1 100
char 1 0
align 1
LABELV $935
char 1 66
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $934
char 1 37
char 1 115
char 1 58
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $927
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 100
char 1 84
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $926
char 1 117
char 1 105
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 84
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $924
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 48
char 1 95
char 1 89
char 1 69
char 1 83
char 1 0
align 1
LABELV $923
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 48
char 1 95
char 1 78
char 1 79
char 1 0
align 1
LABELV $911
char 1 103
char 1 95
char 1 106
char 1 101
char 1 100
char 1 105
char 1 86
char 1 109
char 1 101
char 1 114
char 1 99
char 1 0
align 1
LABELV $905
char 1 103
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
LABELV $889
char 1 103
char 1 95
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 68
char 1 105
char 1 115
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $888
char 1 103
char 1 95
char 1 100
char 1 117
char 1 101
char 1 108
char 1 87
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 68
char 1 105
char 1 115
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $883
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
LABELV $877
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 68
char 1 69
char 1 83
char 1 67
char 1 95
char 1 68
char 1 65
char 1 82
char 1 75
char 1 0
align 1
LABELV $874
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
LABELV $873
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 115
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $872
char 1 100
char 1 97
char 1 114
char 1 107
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 115
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $871
char 1 100
char 1 97
char 1 114
char 1 107
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 115
char 1 0
align 1
LABELV $870
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 115
char 1 0
align 1
LABELV $867
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 97
char 1 108
char 1 108
char 1 111
char 1 99
char 1 0
align 1
LABELV $866
char 1 77
char 1 69
char 1 78
char 1 85
char 1 83
char 1 51
char 1 95
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 68
char 1 69
char 1 83
char 1 67
char 1 95
char 1 76
char 1 73
char 1 71
char 1 72
char 1 84
char 1 0
align 1
LABELV $860
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
LABELV $857
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
LABELV $850
char 1 68
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 0
char 1 0
align 1
LABELV $849
char 1 66
char 1 108
char 1 117
char 1 101
char 1 0
char 1 0
align 1
LABELV $847
char 1 82
char 1 101
char 1 100
char 1 0
char 1 0
align 1
LABELV $835
char 1 37
char 1 105
char 1 0
char 1 0
align 1
LABELV $826
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
LABELV $792
char 1 37
char 1 115
char 1 46
char 1 114
char 1 111
char 1 113
char 1 0
align 1
LABELV $773
char 1 37
char 1 115
char 1 95
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $768
char 1 37
char 1 115
char 1 95
char 1 109
char 1 101
char 1 116
char 1 97
char 1 108
char 1 0
align 1
LABELV $740
char 1 117
char 1 105
char 1 95
char 1 106
char 1 111
char 1 105
char 1 110
char 1 71
char 1 97
char 1 109
char 1 101
char 1 84
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $730
char 1 65
char 1 85
char 1 84
char 1 79
char 1 83
char 1 87
char 1 73
char 1 84
char 1 67
char 1 72
char 1 48
char 1 0
align 1
LABELV $728
char 1 65
char 1 85
char 1 84
char 1 79
char 1 83
char 1 87
char 1 73
char 1 84
char 1 67
char 1 72
char 1 51
char 1 0
align 1
LABELV $726
char 1 65
char 1 85
char 1 84
char 1 79
char 1 83
char 1 87
char 1 73
char 1 84
char 1 67
char 1 72
char 1 50
char 1 0
align 1
LABELV $722
char 1 65
char 1 85
char 1 84
char 1 79
char 1 83
char 1 87
char 1 73
char 1 84
char 1 67
char 1 72
char 1 49
char 1 0
align 1
LABELV $721
char 1 99
char 1 103
char 1 95
char 1 97
char 1 117
char 1 116
char 1 111
char 1 115
char 1 119
char 1 105
char 1 116
char 1 99
char 1 104
char 1 0
align 1
LABELV $717
char 1 117
char 1 105
char 1 95
char 1 97
char 1 99
char 1 116
char 1 117
char 1 97
char 1 108
char 1 78
char 1 101
char 1 116
char 1 71
char 1 97
char 1 109
char 1 101
char 1 84
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $716
char 1 117
char 1 105
char 1 95
char 1 110
char 1 101
char 1 116
char 1 71
char 1 97
char 1 109
char 1 101
char 1 84
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $705
char 1 102
char 1 114
char 1 97
char 1 103
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $704
char 1 99
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $703
char 1 117
char 1 105
char 1 95
char 1 102
char 1 114
char 1 97
char 1 103
char 1 76
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $702
char 1 37
char 1 100
char 1 0
align 1
LABELV $701
char 1 117
char 1 105
char 1 95
char 1 99
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 76
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $697
char 1 117
char 1 105
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $695
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
LABELV $693
char 1 53
char 1 0
align 1
LABELV $692
char 1 49
char 1 48
char 1 0
align 1
LABELV $691
char 1 49
char 1 53
char 1 0
align 1
LABELV $690
char 1 50
char 1 48
char 1 0
align 1
LABELV $689
char 1 50
char 1 53
char 1 0
align 1
LABELV $688
char 1 51
char 1 48
char 1 0
align 1
LABELV $687
char 1 51
char 1 53
char 1 0
align 1
LABELV $686
char 1 52
char 1 48
char 1 0
align 1
LABELV $685
char 1 52
char 1 53
char 1 0
align 1
LABELV $684
char 1 53
char 1 48
char 1 0
align 1
LABELV $683
char 1 53
char 1 53
char 1 0
align 1
LABELV $682
char 1 54
char 1 48
char 1 0
align 1
LABELV $681
char 1 54
char 1 53
char 1 0
align 1
LABELV $680
char 1 55
char 1 48
char 1 0
align 1
LABELV $679
char 1 55
char 1 53
char 1 0
align 1
LABELV $678
char 1 56
char 1 48
char 1 0
align 1
LABELV $677
char 1 56
char 1 53
char 1 0
align 1
LABELV $676
char 1 57
char 1 48
char 1 0
align 1
LABELV $675
char 1 57
char 1 53
char 1 0
align 1
LABELV $674
char 1 78
char 1 111
char 1 110
char 1 101
char 1 0
align 1
LABELV $673
char 1 117
char 1 105
char 1 47
char 1 106
char 1 107
char 1 50
char 1 109
char 1 112
char 1 47
char 1 103
char 1 97
char 1 109
char 1 101
char 1 105
char 1 110
char 1 102
char 1 111
char 1 46
char 1 116
char 1 120
char 1 116
char 1 0
align 1
LABELV $669
char 1 117
char 1 105
char 1 95
char 1 109
char 1 101
char 1 110
char 1 117
char 1 70
char 1 105
char 1 108
char 1 101
char 1 115
char 1 77
char 1 80
char 1 0
align 1
LABELV $668
char 1 117
char 1 105
char 1 47
char 1 106
char 1 107
char 1 50
char 1 109
char 1 112
char 1 105
char 1 110
char 1 103
char 1 97
char 1 109
char 1 101
char 1 46
char 1 116
char 1 120
char 1 116
char 1 0
align 1
LABELV $661
char 1 85
char 1 73
char 1 32
char 1 109
char 1 101
char 1 110
char 1 117
char 1 32
char 1 108
char 1 111
char 1 97
char 1 100
char 1 32
char 1 116
char 1 105
char 1 109
char 1 101
char 1 32
char 1 61
char 1 32
char 1 37
char 1 100
char 1 32
char 1 109
char 1 105
char 1 108
char 1 108
char 1 105
char 1 32
char 1 115
char 1 101
char 1 99
char 1 111
char 1 110
char 1 100
char 1 115
char 1 10
char 1 0
align 1
LABELV $658
char 1 108
char 1 111
char 1 97
char 1 100
char 1 109
char 1 101
char 1 110
char 1 117
char 1 0
align 1
LABELV $639
char 1 94
char 1 49
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 32
char 1 109
char 1 101
char 1 110
char 1 117
char 1 32
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
char 1 117
char 1 105
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 46
char 1 116
char 1 120
char 1 116
char 1 44
char 1 32
char 1 117
char 1 110
char 1 97
char 1 98
char 1 108
char 1 101
char 1 32
char 1 116
char 1 111
char 1 32
char 1 99
char 1 111
char 1 110
char 1 116
char 1 105
char 1 110
char 1 117
char 1 101
char 1 33
char 1 10
char 1 0
align 1
LABELV $636
char 1 117
char 1 105
char 1 47
char 1 106
char 1 107
char 1 50
char 1 109
char 1 112
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 46
char 1 116
char 1 120
char 1 116
char 1 0
align 1
LABELV $635
char 1 94
char 1 51
char 1 109
char 1 101
char 1 110
char 1 117
char 1 32
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
char 1 44
char 1 32
char 1 117
char 1 115
char 1 105
char 1 110
char 1 103
char 1 32
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 10
char 1 0
align 1
LABELV $632
char 1 117
char 1 105
char 1 47
char 1 106
char 1 107
char 1 50
char 1 109
char 1 112
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 100
char 1 101
char 1 102
char 1 46
char 1 104
char 1 0
align 1
LABELV $612
char 1 109
char 1 101
char 1 110
char 1 117
char 1 100
char 1 101
char 1 102
char 1 0
align 1
LABELV $606
char 1 97
char 1 115
char 1 115
char 1 101
char 1 116
char 1 71
char 1 108
char 1 111
char 1 98
char 1 97
char 1 108
char 1 68
char 1 101
char 1 102
char 1 0
align 1
LABELV $592
char 1 80
char 1 97
char 1 114
char 1 115
char 1 105
char 1 110
char 1 103
char 1 32
char 1 109
char 1 101
char 1 110
char 1 117
char 1 32
char 1 102
char 1 105
char 1 108
char 1 101
char 1 58
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $580
char 1 115
char 1 104
char 1 97
char 1 100
char 1 111
char 1 119
char 1 67
char 1 111
char 1 108
char 1 111
char 1 114
char 1 0
align 1
LABELV $572
char 1 115
char 1 104
char 1 97
char 1 100
char 1 111
char 1 119
char 1 89
char 1 0
align 1
LABELV $564
char 1 115
char 1 104
char 1 97
char 1 100
char 1 111
char 1 119
char 1 88
char 1 0
align 1
LABELV $556
char 1 102
char 1 97
char 1 100
char 1 101
char 1 65
char 1 109
char 1 111
char 1 117
char 1 110
char 1 116
char 1 0
align 1
LABELV $548
char 1 102
char 1 97
char 1 100
char 1 101
char 1 67
char 1 121
char 1 99
char 1 108
char 1 101
char 1 0
align 1
LABELV $540
char 1 102
char 1 97
char 1 100
char 1 101
char 1 67
char 1 108
char 1 97
char 1 109
char 1 112
char 1 0
align 1
LABELV $532
char 1 109
char 1 101
char 1 110
char 1 117
char 1 66
char 1 117
char 1 122
char 1 122
char 1 83
char 1 111
char 1 117
char 1 110
char 1 100
char 1 0
align 1
LABELV $524
char 1 105
char 1 116
char 1 101
char 1 109
char 1 70
char 1 111
char 1 99
char 1 117
char 1 115
char 1 83
char 1 111
char 1 117
char 1 110
char 1 100
char 1 0
align 1
LABELV $516
char 1 109
char 1 101
char 1 110
char 1 117
char 1 69
char 1 120
char 1 105
char 1 116
char 1 83
char 1 111
char 1 117
char 1 110
char 1 100
char 1 0
align 1
LABELV $508
char 1 109
char 1 101
char 1 110
char 1 117
char 1 69
char 1 110
char 1 116
char 1 101
char 1 114
char 1 83
char 1 111
char 1 117
char 1 110
char 1 100
char 1 0
align 1
LABELV $500
char 1 103
char 1 114
char 1 97
char 1 100
char 1 105
char 1 101
char 1 110
char 1 116
char 1 98
char 1 97
char 1 114
char 1 0
align 1
LABELV $492
char 1 66
char 1 97
char 1 100
char 1 32
char 1 49
char 1 115
char 1 116
char 1 32
char 1 112
char 1 97
char 1 114
char 1 97
char 1 109
char 1 101
char 1 116
char 1 101
char 1 114
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 107
char 1 101
char 1 121
char 1 119
char 1 111
char 1 114
char 1 100
char 1 32
char 1 39
char 1 99
char 1 117
char 1 114
char 1 115
char 1 111
char 1 114
char 1 39
char 1 0
align 1
LABELV $487
char 1 99
char 1 117
char 1 114
char 1 115
char 1 111
char 1 114
char 1 0
align 1
LABELV $483
char 1 66
char 1 97
char 1 100
char 1 32
char 1 49
char 1 115
char 1 116
char 1 32
char 1 112
char 1 97
char 1 114
char 1 97
char 1 109
char 1 101
char 1 116
char 1 101
char 1 114
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 107
char 1 101
char 1 121
char 1 119
char 1 111
char 1 114
char 1 100
char 1 32
char 1 39
char 1 115
char 1 116
char 1 114
char 1 105
char 1 112
char 1 101
char 1 100
char 1 70
char 1 105
char 1 108
char 1 101
char 1 39
char 1 0
align 1
LABELV $482
char 1 94
char 1 51
char 1 0
align 1
LABELV $479
char 1 115
char 1 116
char 1 114
char 1 105
char 1 112
char 1 101
char 1 100
char 1 70
char 1 105
char 1 108
char 1 101
char 1 0
align 1
LABELV $470
char 1 98
char 1 105
char 1 103
char 1 70
char 1 111
char 1 110
char 1 116
char 1 0
align 1
LABELV $461
char 1 115
char 1 109
char 1 97
char 1 108
char 1 108
char 1 70
char 1 111
char 1 110
char 1 116
char 1 0
align 1
LABELV $450
char 1 102
char 1 111
char 1 110
char 1 116
char 1 0
align 1
LABELV $446
char 1 125
char 1 0
align 1
LABELV $437
char 1 123
char 1 0
align 1
LABELV $430
char 1 94
char 1 49
char 1 109
char 1 101
char 1 110
char 1 117
char 1 32
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
LABELV $427
char 1 94
char 1 49
char 1 109
char 1 101
char 1 110
char 1 117
char 1 32
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
char 1 44
char 1 32
char 1 117
char 1 115
char 1 105
char 1 110
char 1 103
char 1 32
char 1 100
char 1 101
char 1 102
char 1 97
char 1 117
char 1 108
char 1 116
char 1 10
char 1 0
align 1
LABELV $410
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
LABELV $392
char 1 83
char 1 69
char 1 84
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
LABELV $359
char 1 37
char 1 115
char 1 95
char 1 37
char 1 115
char 1 0
align 1
LABELV $354
char 1 49
char 1 0
align 1
LABELV $353
char 1 115
char 1 118
char 1 95
char 1 107
char 1 105
char 1 108
char 1 108
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 0
align 1
LABELV $352
char 1 99
char 1 103
char 1 95
char 1 116
char 1 104
char 1 105
char 1 114
char 1 100
char 1 80
char 1 101
char 1 114
char 1 115
char 1 111
char 1 110
char 1 0
align 1
LABELV $351
char 1 48
char 1 0
align 1
LABELV $350
char 1 99
char 1 103
char 1 95
char 1 99
char 1 97
char 1 109
char 1 101
char 1 114
char 1 97
char 1 79
char 1 114
char 1 98
char 1 105
char 1 116
char 1 0
align 1
LABELV $336
char 1 37
char 1 99
char 1 0
align 1
LABELV $282
char 1 103
char 1 102
char 1 120
char 1 47
char 1 50
char 1 100
char 1 47
char 1 99
char 1 114
char 1 111
char 1 115
char 1 115
char 1 104
char 1 97
char 1 105
char 1 114
char 1 37
char 1 99
char 1 0
align 1
LABELV $275
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 110
char 1 101
char 1 119
char 1 47
char 1 115
char 1 108
char 1 105
char 1 100
char 1 101
char 1 114
char 1 116
char 1 104
char 1 117
char 1 109
char 1 98
char 1 0
align 1
LABELV $272
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 110
char 1 101
char 1 119
char 1 47
char 1 115
char 1 108
char 1 105
char 1 100
char 1 101
char 1 114
char 1 0
align 1
LABELV $269
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 115
char 1 99
char 1 114
char 1 111
char 1 108
char 1 108
char 1 98
char 1 97
char 1 114
char 1 95
char 1 116
char 1 104
char 1 117
char 1 109
char 1 98
char 1 46
char 1 116
char 1 103
char 1 97
char 1 0
align 1
LABELV $266
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 115
char 1 99
char 1 114
char 1 111
char 1 108
char 1 108
char 1 98
char 1 97
char 1 114
char 1 95
char 1 97
char 1 114
char 1 114
char 1 111
char 1 119
char 1 95
char 1 114
char 1 105
char 1 103
char 1 104
char 1 116
char 1 46
char 1 116
char 1 103
char 1 97
char 1 0
align 1
LABELV $263
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 115
char 1 99
char 1 114
char 1 111
char 1 108
char 1 108
char 1 98
char 1 97
char 1 114
char 1 95
char 1 97
char 1 114
char 1 114
char 1 111
char 1 119
char 1 95
char 1 108
char 1 101
char 1 102
char 1 116
char 1 46
char 1 116
char 1 103
char 1 97
char 1 0
align 1
LABELV $260
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 115
char 1 99
char 1 114
char 1 111
char 1 108
char 1 108
char 1 98
char 1 97
char 1 114
char 1 95
char 1 97
char 1 114
char 1 114
char 1 111
char 1 119
char 1 95
char 1 117
char 1 112
char 1 95
char 1 97
char 1 46
char 1 116
char 1 103
char 1 97
char 1 0
align 1
LABELV $257
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 115
char 1 99
char 1 114
char 1 111
char 1 108
char 1 108
char 1 98
char 1 97
char 1 114
char 1 95
char 1 97
char 1 114
char 1 114
char 1 111
char 1 119
char 1 95
char 1 100
char 1 119
char 1 110
char 1 95
char 1 97
char 1 46
char 1 116
char 1 103
char 1 97
char 1 0
align 1
LABELV $254
char 1 103
char 1 102
char 1 120
char 1 47
char 1 109
char 1 101
char 1 110
char 1 117
char 1 115
char 1 47
char 1 115
char 1 99
char 1 114
char 1 111
char 1 108
char 1 108
char 1 98
char 1 97
char 1 114
char 1 46
char 1 116
char 1 103
char 1 97
char 1 0
align 1
LABELV $251
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 102
char 1 120
char 1 95
char 1 119
char 1 104
char 1 105
char 1 116
char 1 101
char 1 0
align 1
LABELV $247
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 102
char 1 120
char 1 95
char 1 112
char 1 117
char 1 114
char 1 112
char 1 108
char 1 101
char 1 0
align 1
LABELV $243
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 102
char 1 120
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $239
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 102
char 1 120
char 1 95
char 1 103
char 1 114
char 1 110
char 1 0
align 1
LABELV $235
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 102
char 1 120
char 1 95
char 1 121
char 1 101
char 1 108
char 1 0
align 1
LABELV $231
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 102
char 1 120
char 1 95
char 1 111
char 1 114
char 1 97
char 1 110
char 1 103
char 1 101
char 1 0
align 1
LABELV $227
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 102
char 1 120
char 1 95
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $224
char 1 109
char 1 101
char 1 110
char 1 117
char 1 47
char 1 97
char 1 114
char 1 116
char 1 47
char 1 102
char 1 120
char 1 95
char 1 98
char 1 97
char 1 115
char 1 101
char 1 0
align 1
LABELV $221
char 1 117
char 1 105
char 1 47
char 1 97
char 1 115
char 1 115
char 1 101
char 1 116
char 1 115
char 1 47
char 1 103
char 1 114
char 1 97
char 1 100
char 1 105
char 1 101
char 1 110
char 1 116
char 1 98
char 1 97
char 1 114
char 1 50
char 1 46
char 1 116
char 1 103
char 1 97
char 1 0
align 1
LABELV $214
char 1 63
char 1 63
char 1 0
align 1
LABELV $213
char 1 78
char 1 69
char 1 84
char 1 95
char 1 83
char 1 79
char 1 85
char 1 82
char 1 67
char 1 69
char 1 83
char 1 0
align 1
LABELV $208
char 1 74
char 1 97
char 1 110
char 1 0
align 1
LABELV $207
char 1 77
char 1 79
char 1 78
char 1 84
char 1 72
char 1 83
char 1 0
align 1
LABELV $206
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
LABELV $195
char 1 70
char 1 82
char 1 69
char 1 69
char 1 0
align 1
LABELV $194
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
LABELV $191
char 1 66
char 1 76
char 1 85
char 1 69
char 1 0
align 1
LABELV $188
char 1 82
char 1 69
char 1 68
char 1 0
align 1
LABELV $184
char 1 73
char 1 80
char 1 88
char 1 0
align 1
LABELV $183
char 1 85
char 1 68
char 1 80
char 1 0
align 1
LABELV $182
char 1 63
char 1 63
char 1 63
char 1 0
align 1
LABELV $181
char 1 84
char 1 69
char 1 65
char 1 77
char 1 84
char 1 79
char 1 85
char 1 82
char 1 78
char 1 65
char 1 77
char 1 69
char 1 78
char 1 84
char 1 0
align 1
LABELV $180
char 1 67
char 1 84
char 1 89
char 1 0
align 1
LABELV $179
char 1 67
char 1 84
char 1 70
char 1 0
align 1
LABELV $178
char 1 78
char 1 47
char 1 65
char 1 0
align 1
LABELV $177
char 1 84
char 1 69
char 1 65
char 1 77
char 1 32
char 1 70
char 1 70
char 1 65
char 1 0
align 1
LABELV $176
char 1 83
char 1 80
char 1 0
align 1
LABELV $175
char 1 68
char 1 85
char 1 69
char 1 76
char 1 0
align 1
LABELV $174
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
LABELV $173
char 1 72
char 1 79
char 1 76
char 1 79
char 1 67
char 1 82
char 1 79
char 1 78
char 1 0
align 1
LABELV $172
char 1 70
char 1 70
char 1 65
char 1 0
align 1
LABELV $171
char 1 83
char 1 75
char 1 73
char 1 76
char 1 76
char 1 53
char 1 0
align 1
LABELV $170
char 1 83
char 1 75
char 1 73
char 1 76
char 1 76
char 1 52
char 1 0
align 1
LABELV $169
char 1 83
char 1 75
char 1 73
char 1 76
char 1 76
char 1 51
char 1 0
align 1
LABELV $168
char 1 83
char 1 75
char 1 73
char 1 76
char 1 76
char 1 50
char 1 0
align 1
LABELV $167
char 1 83
char 1 75
char 1 73
char 1 76
char 1 76
char 1 49
char 1 0
align 1
LABELV $166
char 1 74
char 1 101
char 1 100
char 1 105
char 1 32
char 1 75
char 1 110
char 1 105
char 1 103
char 1 104
char 1 116
char 1 32
char 1 50
char 1 0
align 1
LABELV $165
char 1 0
align 1
LABELV $164
char 1 65
char 1 108
char 1 108
char 1 0
