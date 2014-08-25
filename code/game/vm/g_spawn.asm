export G_SpawnString
code
proc G_SpawnString 8 8
file "../g_spawn.c"
line 6
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:
;6:qboolean	G_SpawnString( const char *key, const char *defaultString, char **out ) {
line 9
;7:	int		i;
;8:
;9:	if ( !level.spawning ) {
ADDRGP4 level+4384
INDIRI4
CNSTI4 0
NEI4 $79
line 10
;10:		*out = (char *)defaultString;
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
ASGNP4
line 12
;11://		G_Error( "G_SpawnString() called while not spawning" );
;12:	}
LABELV $79
line 14
;13:
;14:	for ( i = 0 ; i < level.numSpawnVars ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $85
JUMPV
LABELV $82
line 15
;15:		if ( !Q_stricmp( key, level.spawnVars[i][0] ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+4392
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
NEI4 $87
line 16
;16:			*out = level.spawnVars[i][1];
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+4392+4
ADDP4
INDIRP4
ASGNP4
line 17
;17:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $78
JUMPV
LABELV $87
line 19
;18:		}
;19:	}
LABELV $83
line 14
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $85
ADDRLP4 0
INDIRI4
ADDRGP4 level+4388
INDIRI4
LTI4 $82
line 21
;20:
;21:	*out = (char *)defaultString;
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
ASGNP4
line 22
;22:	return qfalse;
CNSTI4 0
RETI4
LABELV $78
endproc G_SpawnString 8 8
export G_SpawnFloat
proc G_SpawnFloat 16 12
line 25
;23:}
;24:
;25:qboolean	G_SpawnFloat( const char *key, const char *defaultString, float *out ) {
line 29
;26:	char		*s;
;27:	qboolean	present;
;28:
;29:	present = G_SpawnString( key, defaultString, &s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 30
;30:	*out = atof( s );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 31
;31:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $92
endproc G_SpawnFloat 16 12
export G_SpawnInt
proc G_SpawnInt 16 12
line 34
;32:}
;33:
;34:qboolean	G_SpawnInt( const char *key, const char *defaultString, int *out ) {
line 38
;35:	char		*s;
;36:	qboolean	present;
;37:
;38:	present = G_SpawnString( key, defaultString, &s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 39
;39:	*out = atoi( s );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 40
;40:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $93
endproc G_SpawnInt 16 12
export G_SpawnVector
proc G_SpawnVector 16 20
line 43
;41:}
;42:
;43:qboolean	G_SpawnVector( const char *key, const char *defaultString, float *out ) {
line 47
;44:	char		*s;
;45:	qboolean	present;
;46:
;47:	present = G_SpawnString( key, defaultString, &s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 48
;48:	sscanf( s, "%f %f %f", &out[0], &out[1], &out[2] );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $95
ARGP4
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 49
;49:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $94
endproc G_SpawnVector 16 20
data
export fields
align 4
LABELV fields
address $98
byte 4 416
byte 4 2
skip 4
address $99
byte 4 424
byte 4 0
skip 4
address $100
byte 4 428
byte 4 2
skip 4
address $101
byte 4 432
byte 4 2
skip 4
address $102
byte 4 92
byte 4 4
skip 4
address $103
byte 4 476
byte 4 2
skip 4
address $104
byte 4 480
byte 4 2
skip 4
address $105
byte 4 420
byte 4 0
skip 4
address $106
byte 4 608
byte 4 1
skip 4
address $107
byte 4 584
byte 4 2
skip 4
address $108
byte 4 588
byte 4 2
skip 4
address $109
byte 4 572
byte 4 2
skip 4
address $110
byte 4 592
byte 4 2
skip 4
address $111
byte 4 756
byte 4 1
skip 4
address $112
byte 4 760
byte 4 1
skip 4
address $113
byte 4 712
byte 4 0
skip 4
address $114
byte 4 676
byte 4 0
skip 4
address $115
byte 4 0
byte 4 9
skip 4
address $116
byte 4 688
byte 4 0
skip 4
address $117
byte 4 116
byte 4 4
skip 4
address $118
byte 4 116
byte 4 5
skip 4
address $119
byte 4 596
byte 4 2
skip 4
address $120
byte 4 600
byte 4 2
skip 4
byte 4 0
skip 12
export SP_item_botroam
code
proc SP_item_botroam 0 0
line 195
;50:}
;51:
;52:
;53:
;54://
;55:// fields are needed for spawning from the entity string
;56://
;57:typedef enum {
;58:	F_INT, 
;59:	F_FLOAT,
;60:	F_LSTRING,			// string on disk, pointer in memory, TAG_LEVEL
;61:	F_GSTRING,			// string on disk, pointer in memory, TAG_GAME
;62:	F_VECTOR,
;63:	F_ANGLEHACK,
;64:	F_ENTITY,			// index on disk, pointer in memory
;65:	F_ITEM,				// index on disk, pointer in memory
;66:	F_CLIENT,			// index on disk, pointer in memory
;67:	F_IGNORE
;68:} fieldtype_t;
;69:
;70:typedef struct
;71:{
;72:	char	*name;
;73:	int		ofs;
;74:	fieldtype_t	type;
;75:	int		flags;
;76:} field_t;
;77:
;78:field_t fields[] = {
;79:	{"classname", FOFS(classname), F_LSTRING},
;80:	{"teamnodmg", FOFS(teamnodmg), F_INT},
;81:	{"roffname", FOFS(roffname), F_LSTRING},
;82:	{"rofftarget", FOFS(rofftarget), F_LSTRING},
;83:	{"origin", FOFS(s.origin), F_VECTOR},
;84:	{"model", FOFS(model), F_LSTRING},
;85:	{"model2", FOFS(model2), F_LSTRING},
;86:	{"spawnflags", FOFS(spawnflags), F_INT},
;87:	{"speed", FOFS(speed), F_FLOAT},
;88:	{"target", FOFS(target), F_LSTRING},
;89:	{"targetname", FOFS(targetname), F_LSTRING},
;90:	{"message", FOFS(message), F_LSTRING},
;91:	{"team", FOFS(team), F_LSTRING},
;92:	{"wait", FOFS(wait), F_FLOAT},
;93:	{"random", FOFS(random), F_FLOAT},
;94:	{"count", FOFS(count), F_INT},
;95:	{"health", FOFS(health), F_INT},
;96:	{"light", 0, F_IGNORE},
;97:	{"dmg", FOFS(damage), F_INT},
;98:	{"angles", FOFS(s.angles), F_VECTOR},
;99:	{"angle", FOFS(s.angles), F_ANGLEHACK},
;100:	{"targetShaderName", FOFS(targetShaderName), F_LSTRING},
;101:	{"targetShaderNewName", FOFS(targetShaderNewName), F_LSTRING},
;102:
;103:	{NULL}
;104:};
;105:
;106:
;107:typedef struct {
;108:	char	*name;
;109:	void	(*spawn)(gentity_t *ent);
;110:} spawn_t;
;111:
;112:void SP_info_player_start (gentity_t *ent);
;113:void SP_info_player_deathmatch (gentity_t *ent);
;114:void SP_info_player_imperial (gentity_t *ent);
;115:void SP_info_player_rebel (gentity_t *ent);
;116:void SP_info_player_intermission (gentity_t *ent);
;117:void SP_info_jedimaster_start (gentity_t *ent);
;118:void SP_info_firstplace(gentity_t *ent);
;119:void SP_info_secondplace(gentity_t *ent);
;120:void SP_info_thirdplace(gentity_t *ent);
;121:void SP_info_podium(gentity_t *ent);
;122:
;123:void SP_info_saga_objective (gentity_t *ent);
;124:
;125:void SP_func_plat (gentity_t *ent);
;126:void SP_func_static (gentity_t *ent);
;127:void SP_func_rotating (gentity_t *ent);
;128:void SP_func_bobbing (gentity_t *ent);
;129:void SP_func_pendulum( gentity_t *ent );
;130:void SP_func_button (gentity_t *ent);
;131:void SP_func_door (gentity_t *ent);
;132:void SP_func_train (gentity_t *ent);
;133:void SP_func_timer (gentity_t *self);
;134:void SP_func_breakable (gentity_t *ent);
;135:void SP_func_glass (gentity_t *ent);
;136:void SP_func_usable( gentity_t *ent);
;137:
;138:void SP_trigger_always (gentity_t *ent);
;139:void SP_trigger_multiple (gentity_t *ent);
;140:void SP_trigger_push (gentity_t *ent);
;141:void SP_trigger_teleport (gentity_t *ent);
;142:void SP_trigger_hurt (gentity_t *ent);
;143:
;144:void SP_target_remove_powerups( gentity_t *ent );
;145:void SP_target_give (gentity_t *ent);
;146:void SP_target_delay (gentity_t *ent);
;147:void SP_target_speaker (gentity_t *ent);
;148:void SP_target_print (gentity_t *ent);
;149:void SP_target_laser (gentity_t *self);
;150:void SP_target_character (gentity_t *ent);
;151:void SP_target_score( gentity_t *ent );
;152:void SP_target_teleporter( gentity_t *ent );
;153:void SP_target_relay (gentity_t *ent);
;154:void SP_target_kill (gentity_t *ent);
;155:void SP_target_position (gentity_t *ent);
;156:void SP_target_location (gentity_t *ent);
;157:void SP_target_push (gentity_t *ent);
;158:
;159:void SP_light (gentity_t *self);
;160:void SP_info_null (gentity_t *self);
;161:void SP_info_notnull (gentity_t *self);
;162:void SP_info_camp (gentity_t *self);
;163:void SP_path_corner (gentity_t *self);
;164:
;165:void SP_misc_teleporter_dest (gentity_t *self);
;166:void SP_misc_model(gentity_t *ent);
;167:void SP_misc_G2model(gentity_t *ent);
;168:void SP_misc_portal_camera(gentity_t *ent);
;169:void SP_misc_portal_surface(gentity_t *ent);
;170:
;171:void SP_misc_shield_floor_unit( gentity_t *ent );
;172:void SP_misc_model_shield_power_converter( gentity_t *ent );
;173:void SP_misc_model_ammo_power_converter( gentity_t *ent );
;174:void SP_misc_model_health_power_converter( gentity_t *ent );
;175:
;176:void SP_fx_runner( gentity_t *ent );
;177:
;178:#ifdef ANIMENT_SPAWNER
;179:void SP_misc_animent_spawner(gentity_t *ent);
;180:void SP_target_screenshake(gentity_t *ent);
;181:void SP_target_escapetrig(gentity_t *ent);
;182:#endif
;183:
;184:void SP_misc_holocron(gentity_t *ent);
;185:
;186:void SP_shooter_blaster( gentity_t *ent );
;187:
;188:void SP_team_CTF_redplayer( gentity_t *ent );
;189:void SP_team_CTF_blueplayer( gentity_t *ent );
;190:
;191:void SP_team_CTF_redspawn( gentity_t *ent );
;192:void SP_team_CTF_bluespawn( gentity_t *ent );
;193:
;194:void SP_item_botroam( gentity_t *ent )
;195:{
line 196
;196:}
LABELV $122
endproc SP_item_botroam 0 0
data
export spawns
align 4
LABELV spawns
address $123
address SP_info_player_start
address $124
address SP_info_player_deathmatch
address $125
address SP_info_player_imperial
address $126
address SP_info_player_rebel
address $127
address SP_info_player_intermission
address $128
address SP_info_jedimaster_start
address $129
address SP_info_null
address $130
address SP_info_notnull
address $131
address SP_info_camp
address $132
address SP_info_saga_objective
address $133
address SP_func_plat
address $134
address SP_func_button
address $135
address SP_func_door
address $136
address SP_func_static
address $137
address SP_func_rotating
address $138
address SP_func_bobbing
address $139
address SP_func_pendulum
address $140
address SP_func_train
address $141
address SP_info_null
address $142
address SP_func_timer
address $143
address SP_func_breakable
address $144
address SP_func_glass
address $145
address SP_func_usable
address $146
address SP_trigger_always
address $147
address SP_trigger_multiple
address $148
address SP_trigger_push
address $149
address SP_trigger_teleport
address $150
address SP_trigger_hurt
address $151
address SP_target_give
address $152
address SP_target_remove_powerups
address $153
address SP_target_delay
address $154
address SP_target_speaker
address $155
address SP_target_print
address $156
address SP_target_laser
address $157
address SP_target_score
address $158
address SP_target_teleporter
address $159
address SP_target_relay
address $160
address SP_target_kill
address $161
address SP_target_position
address $162
address SP_target_location
address $163
address SP_target_push
address $115
address SP_light
address $164
address SP_path_corner
address $165
address SP_misc_teleporter_dest
address $166
address SP_misc_model
address $167
address SP_misc_G2model
address $168
address SP_misc_portal_surface
address $169
address SP_misc_portal_camera
address $170
address SP_misc_shield_floor_unit
address $171
address SP_misc_model_shield_power_converter
address $172
address SP_misc_model_ammo_power_converter
address $173
address SP_misc_model_health_power_converter
address $174
address SP_fx_runner
address $175
address SP_misc_animent_spawner
address $176
address SP_target_screenshake
address $177
address SP_target_escapetrig
address $178
address SP_misc_holocron
address $179
address SP_shooter_blaster
address $180
address SP_team_CTF_redplayer
address $181
address SP_team_CTF_blueplayer
address $182
address SP_team_CTF_redspawn
address $183
address SP_team_CTF_bluespawn
address $184
address SP_item_botroam
address $185
address SP_emplaced_gun
byte 4 0
byte 4 0
export G_CallSpawn
code
proc G_CallSpawn 12 8
line 302
;197:
;198:void SP_emplaced_gun( gentity_t *ent );
;199:
;200:spawn_t	spawns[] = {
;201:	// info entities don't do anything at all, but provide positional
;202:	// information for things controlled by other processes
;203:	{"info_player_start", SP_info_player_start},
;204:	{"info_player_deathmatch", SP_info_player_deathmatch},
;205:	{"info_player_imperial", SP_info_player_imperial},
;206:	{"info_player_rebel", SP_info_player_rebel},
;207:	{"info_player_intermission", SP_info_player_intermission},
;208:	{"info_jedimaster_start", SP_info_jedimaster_start},
;209:	{"info_null", SP_info_null},
;210:	{"info_notnull", SP_info_notnull},		// use target_position instead
;211:	{"info_camp", SP_info_camp},
;212:
;213:	{"info_saga_objective", SP_info_saga_objective},
;214:
;215:	{"func_plat", SP_func_plat},
;216:	{"func_button", SP_func_button},
;217:	{"func_door", SP_func_door},
;218:	{"func_static", SP_func_static},
;219:	{"func_rotating", SP_func_rotating},
;220:	{"func_bobbing", SP_func_bobbing},
;221:	{"func_pendulum", SP_func_pendulum},
;222:	{"func_train", SP_func_train},
;223:	{"func_group", SP_info_null},
;224:	{"func_timer", SP_func_timer},			// rename trigger_timer?
;225:	{"func_breakable", SP_func_breakable},
;226:	{"func_glass", SP_func_glass},
;227:	{"func_usable", SP_func_usable},
;228:
;229:	// Triggers are brush objects that cause an effect when contacted
;230:	// by a living player, usually involving firing targets.
;231:	// While almost everything could be done with
;232:	// a single trigger class and different targets, triggered effects
;233:	// could not be client side predicted (push and teleport).
;234:	{"trigger_always", SP_trigger_always},
;235:	{"trigger_multiple", SP_trigger_multiple},
;236:	{"trigger_push", SP_trigger_push},
;237:	{"trigger_teleport", SP_trigger_teleport},
;238:	{"trigger_hurt", SP_trigger_hurt},
;239:
;240:	// targets perform no action by themselves, but must be triggered
;241:	// by another entity
;242:	{"target_give", SP_target_give},
;243:	{"target_remove_powerups", SP_target_remove_powerups},
;244:	{"target_delay", SP_target_delay},
;245:	{"target_speaker", SP_target_speaker},
;246:	{"target_print", SP_target_print},
;247:	{"target_laser", SP_target_laser},
;248:	{"target_score", SP_target_score},
;249:	{"target_teleporter", SP_target_teleporter},
;250:	{"target_relay", SP_target_relay},
;251:	{"target_kill", SP_target_kill},
;252:	{"target_position", SP_target_position},
;253:	{"target_location", SP_target_location},
;254:	{"target_push", SP_target_push},
;255:
;256:	{"light", SP_light},
;257:	{"path_corner", SP_path_corner},
;258:
;259:	{"misc_teleporter_dest", SP_misc_teleporter_dest},
;260:	{"misc_model", SP_misc_model},
;261:	{"misc_G2model", SP_misc_G2model},
;262:	{"misc_portal_surface", SP_misc_portal_surface},
;263:	{"misc_portal_camera", SP_misc_portal_camera},
;264:
;265:	{"misc_shield_floor_unit", SP_misc_shield_floor_unit},
;266:	{"misc_model_shield_power_converter", SP_misc_model_shield_power_converter},
;267:	{"misc_model_ammo_power_converter", SP_misc_model_ammo_power_converter},
;268:	{"misc_model_health_power_converter", SP_misc_model_health_power_converter},
;269:
;270:	{"fx_runner", SP_fx_runner},
;271:#ifdef ANIMENT_SPAWNER
;272:	{"misc_animent_spawner", SP_misc_animent_spawner},
;273:	{"target_screenshake", SP_target_screenshake},
;274:	{"target_escapetrig", SP_target_escapetrig},
;275:#endif
;276:
;277:	{"misc_holocron", SP_misc_holocron},
;278:
;279:	{"shooter_blaster", SP_shooter_blaster},
;280:
;281:	{"team_CTF_redplayer", SP_team_CTF_redplayer},
;282:	{"team_CTF_blueplayer", SP_team_CTF_blueplayer},
;283:
;284:	{"team_CTF_redspawn", SP_team_CTF_redspawn},
;285:	{"team_CTF_bluespawn", SP_team_CTF_bluespawn},
;286:
;287:	{"item_botroam", SP_item_botroam},
;288:
;289:	{"emplaced_gun", SP_emplaced_gun},
;290:
;291:	{0, 0}
;292:};
;293:
;294:/*
;295:===============
;296:G_CallSpawn
;297:
;298:Finds the spawn function for the entity and calls it,
;299:returning qfalse if not found
;300:===============
;301:*/
;302:qboolean G_CallSpawn( gentity_t *ent ) {
line 306
;303:	spawn_t	*s;
;304:	gitem_t	*item;
;305:
;306:	if ( !ent->classname ) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $187
line 307
;307:		G_Printf ("G_CallSpawn: NULL classname\n");
ADDRGP4 $189
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 308
;308:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $186
JUMPV
LABELV $187
line 312
;309:	}
;310:
;311:	// check item spawn functions
;312:	for ( item=bg_itemlist+1 ; item->classname ; item++ ) {
ADDRLP4 4
ADDRGP4 bg_itemlist+52
ASGNP4
ADDRGP4 $193
JUMPV
LABELV $190
line 313
;313:		if ( !strcmp(item->classname, ent->classname) ) {
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $195
line 314
;314:			G_SpawnItem( ent, item );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 315
;315:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $186
JUMPV
LABELV $195
line 317
;316:		}
;317:	}
LABELV $191
line 312
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
LABELV $193
ADDRLP4 4
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $190
line 320
;318:
;319:	// check normal spawn functions
;320:	for ( s=spawns ; s->name ; s++ ) {
ADDRLP4 0
ADDRGP4 spawns
ASGNP4
ADDRGP4 $200
JUMPV
LABELV $197
line 321
;321:		if ( !strcmp(s->name, ent->classname) ) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $201
line 323
;322:			// found it
;323:			s->spawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 324
;324:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $186
JUMPV
LABELV $201
line 326
;325:		}
;326:	}
LABELV $198
line 320
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
LABELV $200
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $197
line 327
;327:	G_Printf ("%s doesn't have a spawn function\n", ent->classname);
ADDRGP4 $203
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 328
;328:	return qfalse;
CNSTI4 0
RETI4
LABELV $186
endproc G_CallSpawn 12 8
export G_NewString
proc G_NewString 32 4
line 339
;329:}
;330:
;331:/*
;332:=============
;333:G_NewString
;334:
;335:Builds a copy of the string, translating \n to real linefeeds
;336:so message texts can be multi-line
;337:=============
;338:*/
;339:char *G_NewString( const char *string ) {
line 343
;340:	char	*newb, *new_p;
;341:	int		i,l;
;342:	
;343:	l = strlen(string) + 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 345
;344:
;345:	newb = G_Alloc( l );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 347
;346:
;347:	new_p = newb;
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 350
;348:
;349:	// turn \n into a real linefeed
;350:	for ( i=0 ; i< l ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $208
JUMPV
LABELV $205
line 351
;351:		if (string[i] == '\\' && i < l-1) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $209
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $209
line 352
;352:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 353
;353:			if (string[i] == 'n') {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 110
NEI4 $211
line 354
;354:				*new_p++ = '\n';
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI1 10
ASGNI1
line 355
;355:			} else {
ADDRGP4 $210
JUMPV
LABELV $211
line 356
;356:				*new_p++ = '\\';
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI1 92
ASGNI1
line 357
;357:			}
line 358
;358:		} else {
ADDRGP4 $210
JUMPV
LABELV $209
line 359
;359:			*new_p++ = string[i];
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 360
;360:		}
LABELV $210
line 361
;361:	}
LABELV $206
line 350
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $208
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $205
line 363
;362:	
;363:	return newb;
ADDRLP4 12
INDIRP4
RETP4
LABELV $204
endproc G_NewString 32 4
export G_ParseField
proc G_ParseField 60 20
line 377
;364:}
;365:
;366:
;367:
;368:
;369:/*
;370:===============
;371:G_ParseField
;372:
;373:Takes a key/value pair and sets the binary values
;374:in a gentity
;375:===============
;376:*/
;377:void G_ParseField( const char *key, const char *value, gentity_t *ent ) {
line 383
;378:	field_t	*f;
;379:	byte	*b;
;380:	float	v;
;381:	vec3_t	vec;
;382:
;383:	for ( f=fields ; f->name ; f++ ) {
ADDRLP4 0
ADDRGP4 fields
ASGNP4
ADDRGP4 $217
JUMPV
LABELV $214
line 384
;384:		if ( !Q_stricmp(f->name, key) ) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $218
line 386
;385:			// found it
;386:			b = (byte *)ent;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 388
;387:
;388:			switch( f->type ) {
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $213
ADDRLP4 28
INDIRI4
CNSTI4 9
GTI4 $213
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $233
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $233
address $229
address $230
address $223
address $213
address $224
address $231
address $213
address $213
address $213
address $213
code
LABELV $223
line 390
;389:			case F_LSTRING:
;390:				*(char **)(b+f->ofs) = G_NewString (value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 G_NewString
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 36
INDIRP4
ASGNP4
line 391
;391:				break;
ADDRGP4 $213
JUMPV
LABELV $224
line 393
;392:			case F_VECTOR:
;393:				sscanf (value, "%f %f %f", &vec[0], &vec[1], &vec[2]);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $95
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 8+4
ARGP4
ADDRLP4 8+8
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 394
;394:				((float *)(b+f->ofs))[0] = vec[0];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 395
;395:				((float *)(b+f->ofs))[1] = vec[1];
ADDRLP4 40
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRLP4 8+4
INDIRF4
ASGNF4
line 396
;396:				((float *)(b+f->ofs))[2] = vec[2];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 8+8
INDIRF4
ASGNF4
line 397
;397:				break;
ADDRGP4 $213
JUMPV
LABELV $229
line 399
;398:			case F_INT:
;399:				*(int *)(b+f->ofs) = atoi(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 400
;400:				break;
ADDRGP4 $213
JUMPV
LABELV $230
line 402
;401:			case F_FLOAT:
;402:				*(float *)(b+f->ofs) = atof(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
line 403
;403:				break;
ADDRGP4 $213
JUMPV
LABELV $231
line 405
;404:			case F_ANGLEHACK:
;405:				v = atof(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 52
INDIRF4
ASGNF4
line 406
;406:				((float *)(b+f->ofs))[0] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTF4 0
ASGNF4
line 407
;407:				((float *)(b+f->ofs))[1] = v;
ADDRLP4 56
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 408
;408:				((float *)(b+f->ofs))[2] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 409
;409:				break;
line 412
;410:			default:
;411:			case F_IGNORE:
;412:				break;
line 414
;413:			}
;414:			return;
ADDRGP4 $213
JUMPV
LABELV $218
line 416
;415:		}
;416:	}
LABELV $215
line 383
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $217
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $214
line 417
;417:}
LABELV $213
endproc G_ParseField 60 20
data
align 4
LABELV $235
address $236
address $237
address $238
address $239
address $240
address $110
address $241
address $242
address $243
export G_SpawnGEntityFromSpawnVars
code
proc G_SpawnGEntityFromSpawnVars 40 12
line 430
;418:
;419:
;420:
;421:
;422:/*
;423:===================
;424:G_SpawnGEntityFromSpawnVars
;425:
;426:Spawn an entity and fill in all of the level fields from
;427:level.spawnVars[], then call the class specfic spawn function
;428:===================
;429:*/
;430:void G_SpawnGEntityFromSpawnVars( void ) {
line 437
;431:	int			i;
;432:	gentity_t	*ent;
;433:	char		*s, *value, *gametypeName;
;434:	static char *gametypeNames[] = {"ffa", "holocron", "jedimaster", "duel", "single", "team", "saga", "ctf", "cty"};
;435:
;436:	// get the next free entity
;437:	ent = G_Spawn();
ADDRLP4 20
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 439
;438:
;439:	for ( i = 0 ; i < level.numSpawnVars ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $247
JUMPV
LABELV $244
line 440
;440:		G_ParseField( level.spawnVars[i][0], level.spawnVars[i][1], ent );
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 level+4392
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
ADDRGP4 level+4392+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_ParseField
CALLV
pop
line 441
;441:	}
LABELV $245
line 439
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $247
ADDRLP4 0
INDIRI4
ADDRGP4 level+4388
INDIRI4
LTI4 $244
line 444
;442:
;443:	// check for "notsingle" flag
;444:	if ( g_gametype.integer == GT_SINGLE_PLAYER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $252
line 445
;445:		G_SpawnInt( "notsingle", "0", &i );
ADDRGP4 $255
ARGP4
ADDRGP4 $256
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 446
;446:		if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $257
line 447
;447:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 448
;448:			return;
ADDRGP4 $234
JUMPV
LABELV $257
line 450
;449:		}
;450:	}
LABELV $252
line 452
;451:	// check for "notteam" flag (GT_FFA, GT_TOURNAMENT, GT_SINGLE_PLAYER)
;452:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $259
line 453
;453:		G_SpawnInt( "notteam", "0", &i );
ADDRGP4 $262
ARGP4
ADDRGP4 $256
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 454
;454:		if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $260
line 455
;455:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 456
;456:			return;
ADDRGP4 $234
JUMPV
line 458
;457:		}
;458:	} else {
LABELV $259
line 459
;459:		G_SpawnInt( "notfree", "0", &i );
ADDRGP4 $265
ARGP4
ADDRGP4 $256
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 460
;460:		if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $266
line 461
;461:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 462
;462:			return;
ADDRGP4 $234
JUMPV
LABELV $266
line 464
;463:		}
;464:	}
LABELV $260
line 466
;465:
;466:	G_SpawnInt( "notta", "0", &i );
ADDRGP4 $268
ARGP4
ADDRGP4 $256
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 467
;467:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $269
line 468
;468:		G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 469
;469:		return;
ADDRGP4 $234
JUMPV
LABELV $269
line 472
;470:	}
;471:
;472:	if( G_SpawnString( "gametype", NULL, &value ) ) {
ADDRGP4 $273
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 24
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $271
line 473
;473:		if( g_gametype.integer >= GT_FFA && g_gametype.integer < GT_MAX_GAME_TYPE ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
LTI4 $274
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
GEI4 $274
line 474
;474:			gametypeName = gametypeNames[g_gametype.integer];
ADDRLP4 16
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $235
ADDP4
INDIRP4
ASGNP4
line 476
;475:
;476:			s = strstr( value, gametypeName );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
ASGNP4
line 477
;477:			if( !s ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $279
line 478
;478:				G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 479
;479:				return;
ADDRGP4 $234
JUMPV
LABELV $279
line 481
;480:			}
;481:		}
LABELV $274
line 482
;482:	}
LABELV $271
line 485
;483:
;484:	// move editor origin to pos
;485:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 486
;486:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 4
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 489
;487:
;488:	// if we didn't get a classname, don't bother spawning anything
;489:	if ( !G_CallSpawn( ent ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 G_CallSpawn
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $281
line 490
;490:		G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 491
;491:	}
LABELV $281
line 492
;492:}
LABELV $234
endproc G_SpawnGEntityFromSpawnVars 40 12
export G_AddSpawnVarToken
proc G_AddSpawnVarToken 16 12
line 501
;493:
;494:
;495:
;496:/*
;497:====================
;498:G_AddSpawnVarToken
;499:====================
;500:*/
;501:char *G_AddSpawnVarToken( const char *string ) {
line 505
;502:	int		l;
;503:	char	*dest;
;504:
;505:	l = strlen( string );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 506
;506:	if ( level.numSpawnVarChars + l + 1 > MAX_SPAWN_VARS_CHARS ) {
ADDRGP4 level+4904
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 1
ADDI4
CNSTI4 4096
LEI4 $284
line 507
;507:		G_Error( "G_AddSpawnVarToken: MAX_SPAWN_CHARS" );
ADDRGP4 $287
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 508
;508:	}
LABELV $284
line 510
;509:
;510:	dest = level.spawnVarChars + level.numSpawnVarChars;
ADDRLP4 4
ADDRGP4 level+4904
INDIRI4
ADDRGP4 level+4908
ADDP4
ASGNP4
line 511
;511:	memcpy( dest, string, l+1 );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 513
;512:
;513:	level.numSpawnVarChars += l + 1;
ADDRLP4 12
ADDRGP4 level+4904
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDI4
ASGNI4
line 515
;514:
;515:	return dest;
ADDRLP4 4
INDIRP4
RETP4
LABELV $283
endproc G_AddSpawnVarToken 16 12
export G_ParseSpawnVars
proc G_ParseSpawnVars 2072 8
line 528
;516:}
;517:
;518:/*
;519:====================
;520:G_ParseSpawnVars
;521:
;522:Parses a brace bounded set of key / value pairs out of the
;523:level's entity strings into level.spawnVars[]
;524:
;525:This does not actually spawn an entity.
;526:====================
;527:*/
;528:qboolean G_ParseSpawnVars( void ) {
line 532
;529:	char		keyname[MAX_TOKEN_CHARS];
;530:	char		com_token[MAX_TOKEN_CHARS];
;531:
;532:	level.numSpawnVars = 0;
ADDRGP4 level+4388
CNSTI4 0
ASGNI4
line 533
;533:	level.numSpawnVarChars = 0;
ADDRGP4 level+4904
CNSTI4 0
ASGNI4
line 536
;534:
;535:	// parse the opening brace
;536:	if ( !trap_GetEntityToken( com_token, sizeof( com_token ) ) ) {
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2048
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2048
INDIRI4
CNSTI4 0
NEI4 $294
line 538
;537:		// end of spawn string
;538:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $291
JUMPV
LABELV $294
line 540
;539:	}
;540:	if ( com_token[0] != '{' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $300
line 541
;541:		G_Error( "G_ParseSpawnVars: found %s when expecting {",com_token );
ADDRGP4 $298
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 542
;542:	}
ADDRGP4 $300
JUMPV
LABELV $299
line 545
;543:
;544:	// go through all the key / value pairs
;545:	while ( 1 ) {	
line 547
;546:		// parse key
;547:		if ( !trap_GetEntityToken( keyname, sizeof( keyname ) ) ) {
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2052
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2052
INDIRI4
CNSTI4 0
NEI4 $302
line 548
;548:			G_Error( "G_ParseSpawnVars: EOF without closing brace" );
ADDRGP4 $304
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 549
;549:		}
LABELV $302
line 551
;550:
;551:		if ( keyname[0] == '}' ) {
ADDRLP4 1024
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $305
line 552
;552:			break;
ADDRGP4 $301
JUMPV
LABELV $305
line 556
;553:		}
;554:		
;555:		// parse value	
;556:		if ( !trap_GetEntityToken( com_token, sizeof( com_token ) ) ) {
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2056
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 0
NEI4 $307
line 557
;557:			G_Error( "G_ParseSpawnVars: EOF without closing brace" );
ADDRGP4 $304
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 558
;558:		}
LABELV $307
line 560
;559:
;560:		if ( com_token[0] == '}' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $309
line 561
;561:			G_Error( "G_ParseSpawnVars: closing brace without data" );
ADDRGP4 $311
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 562
;562:		}
LABELV $309
line 563
;563:		if ( level.numSpawnVars == MAX_SPAWN_VARS ) {
ADDRGP4 level+4388
INDIRI4
CNSTI4 64
NEI4 $312
line 564
;564:			G_Error( "G_ParseSpawnVars: MAX_SPAWN_VARS" );
ADDRGP4 $315
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 565
;565:		}
LABELV $312
line 566
;566:		level.spawnVars[ level.numSpawnVars ][0] = G_AddSpawnVarToken( keyname );
ADDRLP4 1024
ARGP4
ADDRLP4 2060
ADDRGP4 G_AddSpawnVarToken
CALLP4
ASGNP4
ADDRGP4 level+4388
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+4392
ADDP4
ADDRLP4 2060
INDIRP4
ASGNP4
line 567
;567:		level.spawnVars[ level.numSpawnVars ][1] = G_AddSpawnVarToken( com_token );
ADDRLP4 0
ARGP4
ADDRLP4 2064
ADDRGP4 G_AddSpawnVarToken
CALLP4
ASGNP4
ADDRGP4 level+4388
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+4392+4
ADDP4
ADDRLP4 2064
INDIRP4
ASGNP4
line 568
;568:		level.numSpawnVars++;
ADDRLP4 2068
ADDRGP4 level+4388
ASGNP4
ADDRLP4 2068
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 569
;569:	}
LABELV $300
line 545
ADDRGP4 $299
JUMPV
LABELV $301
line 571
;570:
;571:	return qtrue;
CNSTI4 1
RETI4
LABELV $291
endproc G_ParseSpawnVars 2072 8
data
align 4
LABELV defaultStyles
address $322
address $322
address $322
address $323
address $323
address $323
address $324
address $324
address $324
address $325
address $325
address $325
address $326
address $326
address $326
address $327
address $327
address $327
address $328
address $328
address $328
address $329
address $329
address $329
address $330
address $330
address $330
address $331
address $331
address $331
address $332
address $332
address $332
address $333
address $333
address $333
address $334
address $334
address $334
address $335
address $336
address $337
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
address $338
export precachedKyle
align 4
LABELV precachedKyle
byte 4 0
export SP_worldspawn
code
proc SP_worldspawn 76 28
line 759
;572:}
;573:
;574:
;575:static	char *defaultStyles[32][3] = 
;576:{
;577:	{	// 0 normal
;578:		"z",
;579:		"z",
;580:		"z"
;581:	},
;582:	{	// 1 FLICKER (first variety)
;583:		"mmnmmommommnonmmonqnmmo",
;584:		"mmnmmommommnonmmonqnmmo",
;585:		"mmnmmommommnonmmonqnmmo"
;586:	},
;587:	{	// 2 SLOW STRONG PULSE
;588:		"abcdefghijklmnopqrstuvwxyzyxwvutsrqponmlkjihgfedcb",
;589:		"abcdefghijklmnopqrstuvwxyzyxwvutsrqponmlkjihgfedcb",
;590:		"abcdefghijklmnopqrstuvwxyzyxwvutsrqponmlkjihgfedcb"
;591:	},
;592:	{	// 3 CANDLE (first variety)
;593:		"mmmmmaaaaammmmmaaaaaabcdefgabcdefg",
;594:		"mmmmmaaaaammmmmaaaaaabcdefgabcdefg",
;595:		"mmmmmaaaaammmmmaaaaaabcdefgabcdefg"
;596:	},
;597:	{	// 4 FAST STROBE
;598:		"mamamamamama",
;599:		"mamamamamama",
;600:		"mamamamamama"
;601:	},
;602:	{	// 5 GENTLE PULSE 1
;603:		"jklmnopqrstuvwxyzyxwvutsrqponmlkj",
;604:		"jklmnopqrstuvwxyzyxwvutsrqponmlkj",
;605:		"jklmnopqrstuvwxyzyxwvutsrqponmlkj"
;606:	},
;607:	{	// 6 FLICKER (second variety)
;608:		"nmonqnmomnmomomno",
;609:		"nmonqnmomnmomomno",
;610:		"nmonqnmomnmomomno"
;611:	},
;612:	{	// 7 CANDLE (second variety)
;613:		"mmmaaaabcdefgmmmmaaaammmaamm",
;614:		"mmmaaaabcdefgmmmmaaaammmaamm",
;615:		"mmmaaaabcdefgmmmmaaaammmaamm"
;616:	},
;617:	{	// 8 CANDLE (third variety)
;618:		"mmmaaammmaaammmabcdefaaaammmmabcdefmmmaaaa",
;619:		"mmmaaammmaaammmabcdefaaaammmmabcdefmmmaaaa",
;620:		"mmmaaammmaaammmabcdefaaaammmmabcdefmmmaaaa"
;621:	},
;622:	{	// 9 SLOW STROBE (fourth variety)
;623:		"aaaaaaaazzzzzzzz",
;624:		"aaaaaaaazzzzzzzz",
;625:		"aaaaaaaazzzzzzzz"
;626:	},
;627:	{	// 10 FLUORESCENT FLICKER
;628:		"mmamammmmammamamaaamammma",
;629:		"mmamammmmammamamaaamammma",
;630:		"mmamammmmammamamaaamammma"
;631:	},
;632:	{	// 11 SLOW PULSE NOT FADE TO BLACK
;633:		"abcdefghijklmnopqrrqponmlkjihgfedcba",
;634:		"abcdefghijklmnopqrrqponmlkjihgfedcba",
;635:		"abcdefghijklmnopqrrqponmlkjihgfedcba"
;636:	},
;637:	{	// 12 FAST PULSE FOR JEREMY
;638:		"mkigegik",
;639:		"mkigegik",
;640:		"mkigegik"
;641:	},
;642:	{	// 13 Test Blending
;643:		"abcdefghijklmqrstuvwxyz",
;644:		"zyxwvutsrqmlkjihgfedcba",
;645:		"aammbbzzccllcckkffyyggp"
;646:	},
;647:	{	// 14
;648:		"",
;649:		"",
;650:		""
;651:	},
;652:	{	// 15
;653:		"",
;654:		"",
;655:		""
;656:	},
;657:	{	// 16
;658:		"",
;659:		"",
;660:		""
;661:	},
;662:	{	// 17
;663:		"",
;664:		"",
;665:		""
;666:	},
;667:	{	// 18
;668:		"",
;669:		"",
;670:		""
;671:	},
;672:	{	// 19
;673:		"",
;674:		"",
;675:		""
;676:	},
;677:	{	// 20
;678:		"",
;679:		"",
;680:		""
;681:	},
;682:	{	// 21
;683:		"",
;684:		"",
;685:		""
;686:	},
;687:	{	// 22
;688:		"",
;689:		"",
;690:		""
;691:	},
;692:	{	// 23
;693:		"",
;694:		"",
;695:		""
;696:	},
;697:	{	// 24
;698:		"",
;699:		"",
;700:		""
;701:	},
;702:	{	// 25
;703:		"",
;704:		"",
;705:		""
;706:	},
;707:	{	// 26
;708:		"",
;709:		"",
;710:		""
;711:	},
;712:	{	// 27
;713:		"",
;714:		"",
;715:		""
;716:	},
;717:	{	// 28
;718:		"",
;719:		"",
;720:		""
;721:	},
;722:	{	// 29
;723:		"",
;724:		"",
;725:		""
;726:	},
;727:	{	// 30
;728:		"",
;729:		"",
;730:		""
;731:	},
;732:	{	// 31
;733:		"",
;734:		"",
;735:		""
;736:	}
;737:};
;738:
;739:void *precachedKyle = 0;
;740:
;741:/*QUAKED worldspawn (0 0 0) ?
;742:
;743:Every map should have exactly one worldspawn.
;744:"music"		music wav file
;745:"gravity"	800 is default gravity
;746:"message"	Text to print during connection process
;747:
;748:BSP Options
;749:"gridsize"     size of lighting grid to "X Y Z". default="64 64 128"
;750:"ambient"      scale of global light (from _color)
;751:"fog"          shader name of the global fog texture - must include the full path, such as "textures/rj/fog1"
;752:"distancecull" value for vis for the maximum viewing distance
;753:"chopsize"     value for bsp on the maximum polygon / portal size
;754:"ls_Xr"	override lightstyle X with this pattern for Red.
;755:"ls_Xg"	green (valid patterns are "a-z")
;756:"ls_Xb"	blue (a is OFF, z is ON)
;757:*/
;758:void SP_worldspawn( void ) 
;759:{
line 764
;760:	char		*text, temp[32];
;761:	int			i;
;762:	int			lengthRed, lengthBlue, lengthGreen;
;763:
;764:	G_SpawnString( "classname", "", &text );
ADDRGP4 $98
ARGP4
ADDRGP4 $338
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 765
;765:	if ( Q_stricmp( text, "worldspawn" ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $342
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $340
line 766
;766:		G_Error( "SP_worldspawn: The first entity isn't 'worldspawn'" );
ADDRGP4 $343
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 767
;767:	}
LABELV $340
line 771
;768:
;769:	//The server will precache the standard model and animations, so that there is no hit
;770:	//when the first client connnects.
;771:	if (!BGPAFtextLoaded)
ADDRGP4 BGPAFtextLoaded
INDIRI4
CNSTI4 0
NEI4 $344
line 772
;772:	{
line 773
;773:		BG_ParseAnimationFile("models/players/_humanoid/animation.cfg");
ADDRGP4 $346
ARGP4
ADDRGP4 BG_ParseAnimationFile
CALLI4
pop
line 774
;774:	}
LABELV $344
line 776
;775:
;776:	if (!precachedKyle)
ADDRGP4 precachedKyle
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $347
line 777
;777:	{
line 778
;778:		trap_G2API_InitGhoul2Model(&precachedKyle, "models/players/kyle/model.glm", 0, 0, -20, 0, 0);
ADDRGP4 precachedKyle
ARGP4
ADDRGP4 $349
ARGP4
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
CNSTI4 -20
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
pop
line 779
;779:	}
LABELV $347
line 781
;780:
;781:	if (!g2SaberInstance)
ADDRGP4 g2SaberInstance
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $350
line 782
;782:	{
line 783
;783:		trap_G2API_InitGhoul2Model(&g2SaberInstance, "models/weapons2/saber/saber_w.glm", 0, 0, -20, 0, 0);
ADDRGP4 g2SaberInstance
ARGP4
ADDRGP4 $352
ARGP4
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
CNSTI4 -20
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_G2API_InitGhoul2Model
CALLI4
pop
line 785
;784:
;785:		if (g2SaberInstance)
ADDRGP4 g2SaberInstance
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $353
line 786
;786:		{
line 788
;787:			// indicate we will be bolted to model 0 (ie the player) on bolt 0 (always the right hand) when we get copied
;788:			trap_G2API_SetBoltInfo(g2SaberInstance, 0, 0);
ADDRGP4 g2SaberInstance
INDIRP4
ARGP4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoltInfo
CALLV
pop
line 790
;789:			// now set up the gun bolt on it
;790:			trap_G2API_AddBolt(g2SaberInstance, 0, "*flash");
ADDRGP4 g2SaberInstance
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $355
ARGP4
ADDRGP4 trap_G2API_AddBolt
CALLI4
pop
line 791
;791:		}
LABELV $353
line 792
;792:	}
LABELV $350
line 795
;793:
;794:	// make some data visible to connecting client
;795:	trap_SetConfigstring( CS_GAME_VERSION, GAME_VERSION );
CNSTI4 20
ARGI4
ADDRGP4 $356
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 797
;796:
;797:	trap_SetConfigstring( CS_LEVEL_START_TIME, va("%i", level.startTime ) );
ADDRGP4 $357
ARGP4
ADDRGP4 level+40
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 21
ARGI4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 799
;798:
;799:	G_SpawnString( "music", "", &text );
ADDRGP4 $359
ARGP4
ADDRGP4 $338
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 800
;800:	trap_SetConfigstring( CS_MUSIC, text );
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 802
;801:
;802:	G_SpawnString( "message", "", &text );
ADDRGP4 $109
ARGP4
ADDRGP4 $338
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 803
;803:	trap_SetConfigstring( CS_MESSAGE, text );				// map specific message
CNSTI4 3
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 805
;804:
;805:	trap_SetConfigstring( CS_MOTD, g_motd.string );		// message of the day
CNSTI4 4
ARGI4
ADDRGP4 g_motd+16
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 807
;806:
;807:	G_SpawnString( "gravity", "800", &text );
ADDRGP4 $361
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 808
;808:	trap_Cvar_Set( "g_gravity", text );
ADDRGP4 $363
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 810
;809:
;810:	G_SpawnString( "enableDust", "0", &text );
ADDRGP4 $364
ARGP4
ADDRGP4 $256
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 811
;811:	trap_Cvar_Set( "g_enableDust", text );
ADDRGP4 $365
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 813
;812:
;813:	G_SpawnString( "enableBreath", "0", &text );
ADDRGP4 $366
ARGP4
ADDRGP4 $256
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 814
;814:	trap_Cvar_Set( "g_enableBreath", text );
ADDRGP4 $367
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 816
;815:
;816:	g_entities[ENTITYNUM_WORLD].s.number = ENTITYNUM_WORLD;
ADDRGP4 g_entities+870744
CNSTI4 1022
ASGNI4
line 817
;817:	g_entities[ENTITYNUM_WORLD].classname = "worldspawn";
ADDRGP4 g_entities+870744+416
ADDRGP4 $342
ASGNP4
line 820
;818:
;819:	// see if we want a warmup time
;820:	trap_SetConfigstring( CS_WARMUP, "" );
CNSTI4 5
ARGI4
ADDRGP4 $338
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 821
;821:	if ( g_restarted.integer ) {
ADDRGP4 g_restarted+12
INDIRI4
CNSTI4 0
EQI4 $371
line 822
;822:		trap_Cvar_Set( "g_restarted", "0" );
ADDRGP4 $374
ARGP4
ADDRGP4 $256
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 823
;823:		level.warmupTime = 0;
ADDRGP4 level+16
CNSTI4 0
ASGNI4
line 824
;824:	} else if ( g_doWarmup.integer && g_gametype.integer != GT_TOURNAMENT ) { // Turn it on
ADDRGP4 $372
JUMPV
LABELV $371
ADDRGP4 g_doWarmup+12
INDIRI4
CNSTI4 0
EQI4 $376
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $376
line 825
;825:		level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 826
;826:		trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
ADDRGP4 $357
ARGP4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 827
;827:		G_LogPrintf( "Warmup:\n" );
ADDRGP4 $382
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 828
;828:	}
LABELV $376
LABELV $372
line 830
;829:
;830:	trap_SetConfigstring(CS_LIGHT_STYLES+(LS_STYLES_START*3)+0, defaultStyles[0][0]);
CNSTI4 832
ARGI4
ADDRGP4 defaultStyles
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 831
;831:	trap_SetConfigstring(CS_LIGHT_STYLES+(LS_STYLES_START*3)+1, defaultStyles[0][1]);
CNSTI4 833
ARGI4
ADDRGP4 defaultStyles+4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 832
;832:	trap_SetConfigstring(CS_LIGHT_STYLES+(LS_STYLES_START*3)+2, defaultStyles[0][2]);
CNSTI4 834
ARGI4
ADDRGP4 defaultStyles+8
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 834
;833:	
;834:	for(i=1;i<LS_NUM_STYLES;i++)
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $385
line 835
;835:	{
line 836
;836:		Com_sprintf(temp, sizeof(temp), "ls_%dr", i);
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $389
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 837
;837:		G_SpawnString(temp, defaultStyles[i][0], &text);
ADDRLP4 8
ARGP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 defaultStyles
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 838
;838:		lengthRed = strlen(text);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 60
INDIRI4
ASGNI4
line 839
;839:		trap_SetConfigstring(CS_LIGHT_STYLES+((i+LS_STYLES_START)*3)+0, text);
CNSTI4 3
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 832
ADDI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 841
;840:
;841:		Com_sprintf(temp, sizeof(temp), "ls_%dg", i);
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $390
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 842
;842:		G_SpawnString(temp, defaultStyles[i][1], &text);
ADDRLP4 8
ARGP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 defaultStyles+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 843
;843:		lengthGreen = strlen(text);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 64
INDIRI4
ASGNI4
line 844
;844:		trap_SetConfigstring(CS_LIGHT_STYLES+((i+LS_STYLES_START)*3)+1, text);
CNSTI4 3
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 832
ADDI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 846
;845:
;846:		Com_sprintf(temp, sizeof(temp), "ls_%db", i);
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $392
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 847
;847:		G_SpawnString(temp, defaultStyles[i][2], &text);
ADDRLP4 8
ARGP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 defaultStyles+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 848
;848:		lengthBlue = strlen(text);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 48
ADDRLP4 68
INDIRI4
ASGNI4
line 849
;849:		trap_SetConfigstring(CS_LIGHT_STYLES+((i+LS_STYLES_START)*3)+2, text);
CNSTI4 3
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 832
ADDI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 851
;850:
;851:		if (lengthRed != lengthGreen || lengthGreen != lengthBlue)
ADDRLP4 44
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $396
ADDRLP4 40
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $394
LABELV $396
line 852
;852:		{
line 853
;853:			Com_Error(ERR_DROP, "Style %d has inconsistent lengths: R %d, G %d, B %d", 
CNSTI4 1
ARGI4
ADDRGP4 $397
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 855
;854:				i, lengthRed, lengthGreen, lengthBlue);
;855:		}
LABELV $394
line 856
;856:	}		
LABELV $386
line 834
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $385
line 857
;857:}
LABELV $339
endproc SP_worldspawn 76 28
export G_SpawnEntitiesFromString
proc G_SpawnEntitiesFromString 8 4
line 867
;858:
;859:
;860:/*
;861:==============
;862:G_SpawnEntitiesFromString
;863:
;864:Parses textual entity definitions out of an entstring and spawns gentities.
;865:==============
;866:*/
;867:void G_SpawnEntitiesFromString( void ) {
line 869
;868:	// allow calls to G_Spawn*()
;869:	level.spawning = qtrue;
ADDRGP4 level+4384
CNSTI4 1
ASGNI4
line 870
;870:	level.numSpawnVars = 0;
ADDRGP4 level+4388
CNSTI4 0
ASGNI4
line 875
;871:
;872:	// the worldspawn is not an actual entity, but it still
;873:	// has a "spawn" function to perform any global setup
;874:	// needed by a level (setting configstrings or cvars, etc)
;875:	if ( !G_ParseSpawnVars() ) {
ADDRLP4 0
ADDRGP4 G_ParseSpawnVars
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $401
line 876
;876:		G_Error( "SpawnEntities: no entities" );
ADDRGP4 $403
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 877
;877:	}
LABELV $401
line 878
;878:	SP_worldspawn();
ADDRGP4 SP_worldspawn
CALLV
pop
ADDRGP4 $405
JUMPV
LABELV $404
line 881
;879:
;880:	// parse ents
;881:	while( G_ParseSpawnVars() ) {
line 882
;882:		G_SpawnGEntityFromSpawnVars();
ADDRGP4 G_SpawnGEntityFromSpawnVars
CALLV
pop
line 883
;883:	}	
LABELV $405
line 881
ADDRLP4 4
ADDRGP4 G_ParseSpawnVars
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $404
line 885
;884:
;885:	level.spawning = qfalse;			// any future calls to G_Spawn*() will be errors
ADDRGP4 level+4384
CNSTI4 0
ASGNI4
line 886
;886:}
LABELV $398
endproc G_SpawnEntitiesFromString 8 4
import SP_emplaced_gun
import SP_team_CTF_bluespawn
import SP_team_CTF_redspawn
import SP_team_CTF_blueplayer
import SP_team_CTF_redplayer
import SP_shooter_blaster
import SP_misc_holocron
import SP_target_escapetrig
import SP_target_screenshake
import SP_misc_animent_spawner
import SP_fx_runner
import SP_misc_model_health_power_converter
import SP_misc_model_ammo_power_converter
import SP_misc_model_shield_power_converter
import SP_misc_shield_floor_unit
import SP_misc_portal_surface
import SP_misc_portal_camera
import SP_misc_G2model
import SP_misc_model
import SP_misc_teleporter_dest
import SP_path_corner
import SP_info_camp
import SP_info_notnull
import SP_info_null
import SP_light
import SP_target_push
import SP_target_location
import SP_target_position
import SP_target_kill
import SP_target_relay
import SP_target_teleporter
import SP_target_score
import SP_target_character
import SP_target_laser
import SP_target_print
import SP_target_speaker
import SP_target_delay
import SP_target_give
import SP_target_remove_powerups
import SP_trigger_hurt
import SP_trigger_teleport
import SP_trigger_push
import SP_trigger_multiple
import SP_trigger_always
import SP_func_usable
import SP_func_glass
import SP_func_breakable
import SP_func_timer
import SP_func_train
import SP_func_door
import SP_func_button
import SP_func_pendulum
import SP_func_bobbing
import SP_func_rotating
import SP_func_static
import SP_func_plat
import SP_info_saga_objective
import SP_info_podium
import SP_info_thirdplace
import SP_info_secondplace
import SP_info_firstplace
import SP_info_jedimaster_start
import SP_info_player_intermission
import SP_info_player_rebel
import SP_info_player_imperial
import SP_info_player_deathmatch
import SP_info_player_start
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
import gEscapeTime
import gEscaping
import g2SaberInstance
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
LABELV $403
char 1 83
char 1 112
char 1 97
char 1 119
char 1 110
char 1 69
char 1 110
char 1 116
char 1 105
char 1 116
char 1 105
char 1 101
char 1 115
char 1 58
char 1 32
char 1 110
char 1 111
char 1 32
char 1 101
char 1 110
char 1 116
char 1 105
char 1 116
char 1 105
char 1 101
char 1 115
char 1 0
align 1
LABELV $397
char 1 83
char 1 116
char 1 121
char 1 108
char 1 101
char 1 32
char 1 37
char 1 100
char 1 32
char 1 104
char 1 97
char 1 115
char 1 32
char 1 105
char 1 110
char 1 99
char 1 111
char 1 110
char 1 115
char 1 105
char 1 115
char 1 116
char 1 101
char 1 110
char 1 116
char 1 32
char 1 108
char 1 101
char 1 110
char 1 103
char 1 116
char 1 104
char 1 115
char 1 58
char 1 32
char 1 82
char 1 32
char 1 37
char 1 100
char 1 44
char 1 32
char 1 71
char 1 32
char 1 37
char 1 100
char 1 44
char 1 32
char 1 66
char 1 32
char 1 37
char 1 100
char 1 0
align 1
LABELV $392
char 1 108
char 1 115
char 1 95
char 1 37
char 1 100
char 1 98
char 1 0
align 1
LABELV $390
char 1 108
char 1 115
char 1 95
char 1 37
char 1 100
char 1 103
char 1 0
align 1
LABELV $389
char 1 108
char 1 115
char 1 95
char 1 37
char 1 100
char 1 114
char 1 0
align 1
LABELV $382
char 1 87
char 1 97
char 1 114
char 1 109
char 1 117
char 1 112
char 1 58
char 1 10
char 1 0
align 1
LABELV $374
char 1 103
char 1 95
char 1 114
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 101
char 1 100
char 1 0
align 1
LABELV $367
char 1 103
char 1 95
char 1 101
char 1 110
char 1 97
char 1 98
char 1 108
char 1 101
char 1 66
char 1 114
char 1 101
char 1 97
char 1 116
char 1 104
char 1 0
align 1
LABELV $366
char 1 101
char 1 110
char 1 97
char 1 98
char 1 108
char 1 101
char 1 66
char 1 114
char 1 101
char 1 97
char 1 116
char 1 104
char 1 0
align 1
LABELV $365
char 1 103
char 1 95
char 1 101
char 1 110
char 1 97
char 1 98
char 1 108
char 1 101
char 1 68
char 1 117
char 1 115
char 1 116
char 1 0
align 1
LABELV $364
char 1 101
char 1 110
char 1 97
char 1 98
char 1 108
char 1 101
char 1 68
char 1 117
char 1 115
char 1 116
char 1 0
align 1
LABELV $363
char 1 103
char 1 95
char 1 103
char 1 114
char 1 97
char 1 118
char 1 105
char 1 116
char 1 121
char 1 0
align 1
LABELV $362
char 1 56
char 1 48
char 1 48
char 1 0
align 1
LABELV $361
char 1 103
char 1 114
char 1 97
char 1 118
char 1 105
char 1 116
char 1 121
char 1 0
align 1
LABELV $359
char 1 109
char 1 117
char 1 115
char 1 105
char 1 99
char 1 0
align 1
LABELV $357
char 1 37
char 1 105
char 1 0
align 1
LABELV $356
char 1 98
char 1 97
char 1 115
char 1 101
char 1 106
char 1 107
char 1 45
char 1 49
char 1 0
align 1
LABELV $355
char 1 42
char 1 102
char 1 108
char 1 97
char 1 115
char 1 104
char 1 0
align 1
LABELV $352
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
LABELV $349
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
char 1 107
char 1 121
char 1 108
char 1 101
char 1 47
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 46
char 1 103
char 1 108
char 1 109
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
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 115
char 1 47
char 1 95
char 1 104
char 1 117
char 1 109
char 1 97
char 1 110
char 1 111
char 1 105
char 1 100
char 1 47
char 1 97
char 1 110
char 1 105
char 1 109
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 46
char 1 99
char 1 102
char 1 103
char 1 0
align 1
LABELV $343
char 1 83
char 1 80
char 1 95
char 1 119
char 1 111
char 1 114
char 1 108
char 1 100
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 58
char 1 32
char 1 84
char 1 104
char 1 101
char 1 32
char 1 102
char 1 105
char 1 114
char 1 115
char 1 116
char 1 32
char 1 101
char 1 110
char 1 116
char 1 105
char 1 116
char 1 121
char 1 32
char 1 105
char 1 115
char 1 110
char 1 39
char 1 116
char 1 32
char 1 39
char 1 119
char 1 111
char 1 114
char 1 108
char 1 100
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 39
char 1 0
align 1
LABELV $342
char 1 119
char 1 111
char 1 114
char 1 108
char 1 100
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 0
align 1
LABELV $338
char 1 0
align 1
LABELV $337
char 1 97
char 1 97
char 1 109
char 1 109
char 1 98
char 1 98
char 1 122
char 1 122
char 1 99
char 1 99
char 1 108
char 1 108
char 1 99
char 1 99
char 1 107
char 1 107
char 1 102
char 1 102
char 1 121
char 1 121
char 1 103
char 1 103
char 1 112
char 1 0
align 1
LABELV $336
char 1 122
char 1 121
char 1 120
char 1 119
char 1 118
char 1 117
char 1 116
char 1 115
char 1 114
char 1 113
char 1 109
char 1 108
char 1 107
char 1 106
char 1 105
char 1 104
char 1 103
char 1 102
char 1 101
char 1 100
char 1 99
char 1 98
char 1 97
char 1 0
align 1
LABELV $335
char 1 97
char 1 98
char 1 99
char 1 100
char 1 101
char 1 102
char 1 103
char 1 104
char 1 105
char 1 106
char 1 107
char 1 108
char 1 109
char 1 113
char 1 114
char 1 115
char 1 116
char 1 117
char 1 118
char 1 119
char 1 120
char 1 121
char 1 122
char 1 0
align 1
LABELV $334
char 1 109
char 1 107
char 1 105
char 1 103
char 1 101
char 1 103
char 1 105
char 1 107
char 1 0
align 1
LABELV $333
char 1 97
char 1 98
char 1 99
char 1 100
char 1 101
char 1 102
char 1 103
char 1 104
char 1 105
char 1 106
char 1 107
char 1 108
char 1 109
char 1 110
char 1 111
char 1 112
char 1 113
char 1 114
char 1 114
char 1 113
char 1 112
char 1 111
char 1 110
char 1 109
char 1 108
char 1 107
char 1 106
char 1 105
char 1 104
char 1 103
char 1 102
char 1 101
char 1 100
char 1 99
char 1 98
char 1 97
char 1 0
align 1
LABELV $332
char 1 109
char 1 109
char 1 97
char 1 109
char 1 97
char 1 109
char 1 109
char 1 109
char 1 109
char 1 97
char 1 109
char 1 109
char 1 97
char 1 109
char 1 97
char 1 109
char 1 97
char 1 97
char 1 97
char 1 109
char 1 97
char 1 109
char 1 109
char 1 109
char 1 97
char 1 0
align 1
LABELV $331
char 1 97
char 1 97
char 1 97
char 1 97
char 1 97
char 1 97
char 1 97
char 1 97
char 1 122
char 1 122
char 1 122
char 1 122
char 1 122
char 1 122
char 1 122
char 1 122
char 1 0
align 1
LABELV $330
char 1 109
char 1 109
char 1 109
char 1 97
char 1 97
char 1 97
char 1 109
char 1 109
char 1 109
char 1 97
char 1 97
char 1 97
char 1 109
char 1 109
char 1 109
char 1 97
char 1 98
char 1 99
char 1 100
char 1 101
char 1 102
char 1 97
char 1 97
char 1 97
char 1 97
char 1 109
char 1 109
char 1 109
char 1 109
char 1 97
char 1 98
char 1 99
char 1 100
char 1 101
char 1 102
char 1 109
char 1 109
char 1 109
char 1 97
char 1 97
char 1 97
char 1 97
char 1 0
align 1
LABELV $329
char 1 109
char 1 109
char 1 109
char 1 97
char 1 97
char 1 97
char 1 97
char 1 98
char 1 99
char 1 100
char 1 101
char 1 102
char 1 103
char 1 109
char 1 109
char 1 109
char 1 109
char 1 97
char 1 97
char 1 97
char 1 97
char 1 109
char 1 109
char 1 109
char 1 97
char 1 97
char 1 109
char 1 109
char 1 0
align 1
LABELV $328
char 1 110
char 1 109
char 1 111
char 1 110
char 1 113
char 1 110
char 1 109
char 1 111
char 1 109
char 1 110
char 1 109
char 1 111
char 1 109
char 1 111
char 1 109
char 1 110
char 1 111
char 1 0
align 1
LABELV $327
char 1 106
char 1 107
char 1 108
char 1 109
char 1 110
char 1 111
char 1 112
char 1 113
char 1 114
char 1 115
char 1 116
char 1 117
char 1 118
char 1 119
char 1 120
char 1 121
char 1 122
char 1 121
char 1 120
char 1 119
char 1 118
char 1 117
char 1 116
char 1 115
char 1 114
char 1 113
char 1 112
char 1 111
char 1 110
char 1 109
char 1 108
char 1 107
char 1 106
char 1 0
align 1
LABELV $326
char 1 109
char 1 97
char 1 109
char 1 97
char 1 109
char 1 97
char 1 109
char 1 97
char 1 109
char 1 97
char 1 109
char 1 97
char 1 0
align 1
LABELV $325
char 1 109
char 1 109
char 1 109
char 1 109
char 1 109
char 1 97
char 1 97
char 1 97
char 1 97
char 1 97
char 1 109
char 1 109
char 1 109
char 1 109
char 1 109
char 1 97
char 1 97
char 1 97
char 1 97
char 1 97
char 1 97
char 1 98
char 1 99
char 1 100
char 1 101
char 1 102
char 1 103
char 1 97
char 1 98
char 1 99
char 1 100
char 1 101
char 1 102
char 1 103
char 1 0
align 1
LABELV $324
char 1 97
char 1 98
char 1 99
char 1 100
char 1 101
char 1 102
char 1 103
char 1 104
char 1 105
char 1 106
char 1 107
char 1 108
char 1 109
char 1 110
char 1 111
char 1 112
char 1 113
char 1 114
char 1 115
char 1 116
char 1 117
char 1 118
char 1 119
char 1 120
char 1 121
char 1 122
char 1 121
char 1 120
char 1 119
char 1 118
char 1 117
char 1 116
char 1 115
char 1 114
char 1 113
char 1 112
char 1 111
char 1 110
char 1 109
char 1 108
char 1 107
char 1 106
char 1 105
char 1 104
char 1 103
char 1 102
char 1 101
char 1 100
char 1 99
char 1 98
char 1 0
align 1
LABELV $323
char 1 109
char 1 109
char 1 110
char 1 109
char 1 109
char 1 111
char 1 109
char 1 109
char 1 111
char 1 109
char 1 109
char 1 110
char 1 111
char 1 110
char 1 109
char 1 109
char 1 111
char 1 110
char 1 113
char 1 110
char 1 109
char 1 109
char 1 111
char 1 0
align 1
LABELV $322
char 1 122
char 1 0
align 1
LABELV $315
char 1 71
char 1 95
char 1 80
char 1 97
char 1 114
char 1 115
char 1 101
char 1 83
char 1 112
char 1 97
char 1 119
char 1 110
char 1 86
char 1 97
char 1 114
char 1 115
char 1 58
char 1 32
char 1 77
char 1 65
char 1 88
char 1 95
char 1 83
char 1 80
char 1 65
char 1 87
char 1 78
char 1 95
char 1 86
char 1 65
char 1 82
char 1 83
char 1 0
align 1
LABELV $311
char 1 71
char 1 95
char 1 80
char 1 97
char 1 114
char 1 115
char 1 101
char 1 83
char 1 112
char 1 97
char 1 119
char 1 110
char 1 86
char 1 97
char 1 114
char 1 115
char 1 58
char 1 32
char 1 99
char 1 108
char 1 111
char 1 115
char 1 105
char 1 110
char 1 103
char 1 32
char 1 98
char 1 114
char 1 97
char 1 99
char 1 101
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 111
char 1 117
char 1 116
char 1 32
char 1 100
char 1 97
char 1 116
char 1 97
char 1 0
align 1
LABELV $304
char 1 71
char 1 95
char 1 80
char 1 97
char 1 114
char 1 115
char 1 101
char 1 83
char 1 112
char 1 97
char 1 119
char 1 110
char 1 86
char 1 97
char 1 114
char 1 115
char 1 58
char 1 32
char 1 69
char 1 79
char 1 70
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 111
char 1 117
char 1 116
char 1 32
char 1 99
char 1 108
char 1 111
char 1 115
char 1 105
char 1 110
char 1 103
char 1 32
char 1 98
char 1 114
char 1 97
char 1 99
char 1 101
char 1 0
align 1
LABELV $298
char 1 71
char 1 95
char 1 80
char 1 97
char 1 114
char 1 115
char 1 101
char 1 83
char 1 112
char 1 97
char 1 119
char 1 110
char 1 86
char 1 97
char 1 114
char 1 115
char 1 58
char 1 32
char 1 102
char 1 111
char 1 117
char 1 110
char 1 100
char 1 32
char 1 37
char 1 115
char 1 32
char 1 119
char 1 104
char 1 101
char 1 110
char 1 32
char 1 101
char 1 120
char 1 112
char 1 101
char 1 99
char 1 116
char 1 105
char 1 110
char 1 103
char 1 32
char 1 123
char 1 0
align 1
LABELV $287
char 1 71
char 1 95
char 1 65
char 1 100
char 1 100
char 1 83
char 1 112
char 1 97
char 1 119
char 1 110
char 1 86
char 1 97
char 1 114
char 1 84
char 1 111
char 1 107
char 1 101
char 1 110
char 1 58
char 1 32
char 1 77
char 1 65
char 1 88
char 1 95
char 1 83
char 1 80
char 1 65
char 1 87
char 1 78
char 1 95
char 1 67
char 1 72
char 1 65
char 1 82
char 1 83
char 1 0
align 1
LABELV $273
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
LABELV $268
char 1 110
char 1 111
char 1 116
char 1 116
char 1 97
char 1 0
align 1
LABELV $265
char 1 110
char 1 111
char 1 116
char 1 102
char 1 114
char 1 101
char 1 101
char 1 0
align 1
LABELV $262
char 1 110
char 1 111
char 1 116
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $256
char 1 48
char 1 0
align 1
LABELV $255
char 1 110
char 1 111
char 1 116
char 1 115
char 1 105
char 1 110
char 1 103
char 1 108
char 1 101
char 1 0
align 1
LABELV $243
char 1 99
char 1 116
char 1 121
char 1 0
align 1
LABELV $242
char 1 99
char 1 116
char 1 102
char 1 0
align 1
LABELV $241
char 1 115
char 1 97
char 1 103
char 1 97
char 1 0
align 1
LABELV $240
char 1 115
char 1 105
char 1 110
char 1 103
char 1 108
char 1 101
char 1 0
align 1
LABELV $239
char 1 100
char 1 117
char 1 101
char 1 108
char 1 0
align 1
LABELV $238
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
LABELV $237
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
LABELV $236
char 1 102
char 1 102
char 1 97
char 1 0
align 1
LABELV $203
char 1 37
char 1 115
char 1 32
char 1 100
char 1 111
char 1 101
char 1 115
char 1 110
char 1 39
char 1 116
char 1 32
char 1 104
char 1 97
char 1 118
char 1 101
char 1 32
char 1 97
char 1 32
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 32
char 1 102
char 1 117
char 1 110
char 1 99
char 1 116
char 1 105
char 1 111
char 1 110
char 1 10
char 1 0
align 1
LABELV $189
char 1 71
char 1 95
char 1 67
char 1 97
char 1 108
char 1 108
char 1 83
char 1 112
char 1 97
char 1 119
char 1 110
char 1 58
char 1 32
char 1 78
char 1 85
char 1 76
char 1 76
char 1 32
char 1 99
char 1 108
char 1 97
char 1 115
char 1 115
char 1 110
char 1 97
char 1 109
char 1 101
char 1 10
char 1 0
align 1
LABELV $185
char 1 101
char 1 109
char 1 112
char 1 108
char 1 97
char 1 99
char 1 101
char 1 100
char 1 95
char 1 103
char 1 117
char 1 110
char 1 0
align 1
LABELV $184
char 1 105
char 1 116
char 1 101
char 1 109
char 1 95
char 1 98
char 1 111
char 1 116
char 1 114
char 1 111
char 1 97
char 1 109
char 1 0
align 1
LABELV $183
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
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 0
align 1
LABELV $182
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
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 0
align 1
LABELV $181
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
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 0
align 1
LABELV $180
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
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 0
align 1
LABELV $179
char 1 115
char 1 104
char 1 111
char 1 111
char 1 116
char 1 101
char 1 114
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
LABELV $178
char 1 109
char 1 105
char 1 115
char 1 99
char 1 95
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
LABELV $177
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 95
char 1 101
char 1 115
char 1 99
char 1 97
char 1 112
char 1 101
char 1 116
char 1 114
char 1 105
char 1 103
char 1 0
align 1
LABELV $176
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 95
char 1 115
char 1 99
char 1 114
char 1 101
char 1 101
char 1 110
char 1 115
char 1 104
char 1 97
char 1 107
char 1 101
char 1 0
align 1
LABELV $175
char 1 109
char 1 105
char 1 115
char 1 99
char 1 95
char 1 97
char 1 110
char 1 105
char 1 109
char 1 101
char 1 110
char 1 116
char 1 95
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 101
char 1 114
char 1 0
align 1
LABELV $174
char 1 102
char 1 120
char 1 95
char 1 114
char 1 117
char 1 110
char 1 110
char 1 101
char 1 114
char 1 0
align 1
LABELV $173
char 1 109
char 1 105
char 1 115
char 1 99
char 1 95
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 95
char 1 104
char 1 101
char 1 97
char 1 108
char 1 116
char 1 104
char 1 95
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 95
char 1 99
char 1 111
char 1 110
char 1 118
char 1 101
char 1 114
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $172
char 1 109
char 1 105
char 1 115
char 1 99
char 1 95
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 95
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
char 1 111
char 1 110
char 1 118
char 1 101
char 1 114
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $171
char 1 109
char 1 105
char 1 115
char 1 99
char 1 95
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 95
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 95
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 95
char 1 99
char 1 111
char 1 110
char 1 118
char 1 101
char 1 114
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $170
char 1 109
char 1 105
char 1 115
char 1 99
char 1 95
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 95
char 1 102
char 1 108
char 1 111
char 1 111
char 1 114
char 1 95
char 1 117
char 1 110
char 1 105
char 1 116
char 1 0
align 1
LABELV $169
char 1 109
char 1 105
char 1 115
char 1 99
char 1 95
char 1 112
char 1 111
char 1 114
char 1 116
char 1 97
char 1 108
char 1 95
char 1 99
char 1 97
char 1 109
char 1 101
char 1 114
char 1 97
char 1 0
align 1
LABELV $168
char 1 109
char 1 105
char 1 115
char 1 99
char 1 95
char 1 112
char 1 111
char 1 114
char 1 116
char 1 97
char 1 108
char 1 95
char 1 115
char 1 117
char 1 114
char 1 102
char 1 97
char 1 99
char 1 101
char 1 0
align 1
LABELV $167
char 1 109
char 1 105
char 1 115
char 1 99
char 1 95
char 1 71
char 1 50
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $166
char 1 109
char 1 105
char 1 115
char 1 99
char 1 95
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $165
char 1 109
char 1 105
char 1 115
char 1 99
char 1 95
char 1 116
char 1 101
char 1 108
char 1 101
char 1 112
char 1 111
char 1 114
char 1 116
char 1 101
char 1 114
char 1 95
char 1 100
char 1 101
char 1 115
char 1 116
char 1 0
align 1
LABELV $164
char 1 112
char 1 97
char 1 116
char 1 104
char 1 95
char 1 99
char 1 111
char 1 114
char 1 110
char 1 101
char 1 114
char 1 0
align 1
LABELV $163
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 95
char 1 112
char 1 117
char 1 115
char 1 104
char 1 0
align 1
LABELV $162
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 95
char 1 108
char 1 111
char 1 99
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $161
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 95
char 1 112
char 1 111
char 1 115
char 1 105
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $160
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 95
char 1 107
char 1 105
char 1 108
char 1 108
char 1 0
align 1
LABELV $159
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 95
char 1 114
char 1 101
char 1 108
char 1 97
char 1 121
char 1 0
align 1
LABELV $158
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 95
char 1 116
char 1 101
char 1 108
char 1 101
char 1 112
char 1 111
char 1 114
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $157
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 0
align 1
LABELV $156
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 95
char 1 108
char 1 97
char 1 115
char 1 101
char 1 114
char 1 0
align 1
LABELV $155
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 95
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 0
align 1
LABELV $154
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 95
char 1 115
char 1 112
char 1 101
char 1 97
char 1 107
char 1 101
char 1 114
char 1 0
align 1
LABELV $153
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 95
char 1 100
char 1 101
char 1 108
char 1 97
char 1 121
char 1 0
align 1
LABELV $152
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 95
char 1 114
char 1 101
char 1 109
char 1 111
char 1 118
char 1 101
char 1 95
char 1 112
char 1 111
char 1 119
char 1 101
char 1 114
char 1 117
char 1 112
char 1 115
char 1 0
align 1
LABELV $151
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 95
char 1 103
char 1 105
char 1 118
char 1 101
char 1 0
align 1
LABELV $150
char 1 116
char 1 114
char 1 105
char 1 103
char 1 103
char 1 101
char 1 114
char 1 95
char 1 104
char 1 117
char 1 114
char 1 116
char 1 0
align 1
LABELV $149
char 1 116
char 1 114
char 1 105
char 1 103
char 1 103
char 1 101
char 1 114
char 1 95
char 1 116
char 1 101
char 1 108
char 1 101
char 1 112
char 1 111
char 1 114
char 1 116
char 1 0
align 1
LABELV $148
char 1 116
char 1 114
char 1 105
char 1 103
char 1 103
char 1 101
char 1 114
char 1 95
char 1 112
char 1 117
char 1 115
char 1 104
char 1 0
align 1
LABELV $147
char 1 116
char 1 114
char 1 105
char 1 103
char 1 103
char 1 101
char 1 114
char 1 95
char 1 109
char 1 117
char 1 108
char 1 116
char 1 105
char 1 112
char 1 108
char 1 101
char 1 0
align 1
LABELV $146
char 1 116
char 1 114
char 1 105
char 1 103
char 1 103
char 1 101
char 1 114
char 1 95
char 1 97
char 1 108
char 1 119
char 1 97
char 1 121
char 1 115
char 1 0
align 1
LABELV $145
char 1 102
char 1 117
char 1 110
char 1 99
char 1 95
char 1 117
char 1 115
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $144
char 1 102
char 1 117
char 1 110
char 1 99
char 1 95
char 1 103
char 1 108
char 1 97
char 1 115
char 1 115
char 1 0
align 1
LABELV $143
char 1 102
char 1 117
char 1 110
char 1 99
char 1 95
char 1 98
char 1 114
char 1 101
char 1 97
char 1 107
char 1 97
char 1 98
char 1 108
char 1 101
char 1 0
align 1
LABELV $142
char 1 102
char 1 117
char 1 110
char 1 99
char 1 95
char 1 116
char 1 105
char 1 109
char 1 101
char 1 114
char 1 0
align 1
LABELV $141
char 1 102
char 1 117
char 1 110
char 1 99
char 1 95
char 1 103
char 1 114
char 1 111
char 1 117
char 1 112
char 1 0
align 1
LABELV $140
char 1 102
char 1 117
char 1 110
char 1 99
char 1 95
char 1 116
char 1 114
char 1 97
char 1 105
char 1 110
char 1 0
align 1
LABELV $139
char 1 102
char 1 117
char 1 110
char 1 99
char 1 95
char 1 112
char 1 101
char 1 110
char 1 100
char 1 117
char 1 108
char 1 117
char 1 109
char 1 0
align 1
LABELV $138
char 1 102
char 1 117
char 1 110
char 1 99
char 1 95
char 1 98
char 1 111
char 1 98
char 1 98
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $137
char 1 102
char 1 117
char 1 110
char 1 99
char 1 95
char 1 114
char 1 111
char 1 116
char 1 97
char 1 116
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $136
char 1 102
char 1 117
char 1 110
char 1 99
char 1 95
char 1 115
char 1 116
char 1 97
char 1 116
char 1 105
char 1 99
char 1 0
align 1
LABELV $135
char 1 102
char 1 117
char 1 110
char 1 99
char 1 95
char 1 100
char 1 111
char 1 111
char 1 114
char 1 0
align 1
LABELV $134
char 1 102
char 1 117
char 1 110
char 1 99
char 1 95
char 1 98
char 1 117
char 1 116
char 1 116
char 1 111
char 1 110
char 1 0
align 1
LABELV $133
char 1 102
char 1 117
char 1 110
char 1 99
char 1 95
char 1 112
char 1 108
char 1 97
char 1 116
char 1 0
align 1
LABELV $132
char 1 105
char 1 110
char 1 102
char 1 111
char 1 95
char 1 115
char 1 97
char 1 103
char 1 97
char 1 95
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
LABELV $131
char 1 105
char 1 110
char 1 102
char 1 111
char 1 95
char 1 99
char 1 97
char 1 109
char 1 112
char 1 0
align 1
LABELV $130
char 1 105
char 1 110
char 1 102
char 1 111
char 1 95
char 1 110
char 1 111
char 1 116
char 1 110
char 1 117
char 1 108
char 1 108
char 1 0
align 1
LABELV $129
char 1 105
char 1 110
char 1 102
char 1 111
char 1 95
char 1 110
char 1 117
char 1 108
char 1 108
char 1 0
align 1
LABELV $128
char 1 105
char 1 110
char 1 102
char 1 111
char 1 95
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
char 1 95
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 0
align 1
LABELV $127
char 1 105
char 1 110
char 1 102
char 1 111
char 1 95
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 95
char 1 105
char 1 110
char 1 116
char 1 101
char 1 114
char 1 109
char 1 105
char 1 115
char 1 115
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $126
char 1 105
char 1 110
char 1 102
char 1 111
char 1 95
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 95
char 1 114
char 1 101
char 1 98
char 1 101
char 1 108
char 1 0
align 1
LABELV $125
char 1 105
char 1 110
char 1 102
char 1 111
char 1 95
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 95
char 1 105
char 1 109
char 1 112
char 1 101
char 1 114
char 1 105
char 1 97
char 1 108
char 1 0
align 1
LABELV $124
char 1 105
char 1 110
char 1 102
char 1 111
char 1 95
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 95
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 109
char 1 97
char 1 116
char 1 99
char 1 104
char 1 0
align 1
LABELV $123
char 1 105
char 1 110
char 1 102
char 1 111
char 1 95
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 95
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 0
align 1
LABELV $120
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 83
char 1 104
char 1 97
char 1 100
char 1 101
char 1 114
char 1 78
char 1 101
char 1 119
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $119
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 83
char 1 104
char 1 97
char 1 100
char 1 101
char 1 114
char 1 78
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $118
char 1 97
char 1 110
char 1 103
char 1 108
char 1 101
char 1 0
align 1
LABELV $117
char 1 97
char 1 110
char 1 103
char 1 108
char 1 101
char 1 115
char 1 0
align 1
LABELV $116
char 1 100
char 1 109
char 1 103
char 1 0
align 1
LABELV $115
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 0
align 1
LABELV $114
char 1 104
char 1 101
char 1 97
char 1 108
char 1 116
char 1 104
char 1 0
align 1
LABELV $113
char 1 99
char 1 111
char 1 117
char 1 110
char 1 116
char 1 0
align 1
LABELV $112
char 1 114
char 1 97
char 1 110
char 1 100
char 1 111
char 1 109
char 1 0
align 1
LABELV $111
char 1 119
char 1 97
char 1 105
char 1 116
char 1 0
align 1
LABELV $110
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $109
char 1 109
char 1 101
char 1 115
char 1 115
char 1 97
char 1 103
char 1 101
char 1 0
align 1
LABELV $108
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $107
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 0
align 1
LABELV $106
char 1 115
char 1 112
char 1 101
char 1 101
char 1 100
char 1 0
align 1
LABELV $105
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 102
char 1 108
char 1 97
char 1 103
char 1 115
char 1 0
align 1
LABELV $104
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 50
char 1 0
align 1
LABELV $103
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $102
char 1 111
char 1 114
char 1 105
char 1 103
char 1 105
char 1 110
char 1 0
align 1
LABELV $101
char 1 114
char 1 111
char 1 102
char 1 102
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 0
align 1
LABELV $100
char 1 114
char 1 111
char 1 102
char 1 102
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $99
char 1 116
char 1 101
char 1 97
char 1 109
char 1 110
char 1 111
char 1 100
char 1 109
char 1 103
char 1 0
align 1
LABELV $98
char 1 99
char 1 108
char 1 97
char 1 115
char 1 115
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $95
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 32
char 1 37
char 1 102
char 1 0
