export SP_info_camp
code
proc SP_info_camp 4 8
file "../g_misc.c"
line 24
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_misc.c
;4:
;5:#include "g_local.h"
;6:
;7:#include "ai_main.h" //for the g2animents
;8:
;9:#define HOLOCRON_RESPAWN_TIME 30000
;10:#define MAX_AMMO_GIVE 2
;11:#define STATION_RECHARGE_TIME 3000//800
;12:
;13:void HolocronThink(gentity_t *ent);
;14:extern vmCvar_t g_MaxHolocronCarry;
;15:
;16:/*QUAKED func_group (0 0 0) ?
;17:Used to group brushes together just for editor convenience.  They are turned into normal brushes by the utilities.
;18:*/
;19:
;20:
;21:/*QUAKED info_camp (0 0.5 0) (-4 -4 -4) (4 4 4)
;22:Used as a positional target for calculations in the utilities (spotlights, etc), but removed during gameplay.
;23:*/
;24:void SP_info_camp( gentity_t *self ) {
line 25
;25:	G_SetOrigin( self, self->s.origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 26
;26:}
LABELV $81
endproc SP_info_camp 4 8
export SP_info_null
proc SP_info_null 0 4
line 32
;27:
;28:
;29:/*QUAKED info_null (0 0.5 0) (-4 -4 -4) (4 4 4)
;30:Used as a positional target for calculations in the utilities (spotlights, etc), but removed during gameplay.
;31:*/
;32:void SP_info_null( gentity_t *self ) {
line 33
;33:	G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 34
;34:}
LABELV $82
endproc SP_info_null 0 4
export SP_info_notnull
proc SP_info_notnull 4 8
line 41
;35:
;36:
;37:/*QUAKED info_notnull (0 0.5 0) (-4 -4 -4) (4 4 4)
;38:Used as a positional target for in-game calculation, like jumppad targets.
;39:target_position does the same thing
;40:*/
;41:void SP_info_notnull( gentity_t *self ){
line 42
;42:	G_SetOrigin( self, self->s.origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 43
;43:}
LABELV $83
endproc SP_info_notnull 4 8
export SP_light
proc SP_light 0 4
line 53
;44:
;45:
;46:/*QUAKED light (0 1 0) (-8 -8 -8) (8 8 8) linear
;47:Non-displayed light.
;48:"light" overrides the default 300 intensity.
;49:Linear checbox gives linear falloff instead of inverse square
;50:Lights pointed at a target will be spotlights.
;51:"radius" overrides the default 64 unit radius of a spotlight at the target point.
;52:*/
;53:void SP_light( gentity_t *self ) {
line 54
;54:	G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 55
;55:}
LABELV $84
endproc SP_light 0 4
export TeleportPlayer
proc TeleportPlayer 40 16
line 67
;56:
;57:
;58:
;59:/*
;60:=================================================================================
;61:
;62:TELEPORTERS
;63:
;64:=================================================================================
;65:*/
;66:
;67:void TeleportPlayer( gentity_t *player, vec3_t origin, vec3_t angles ) {
line 72
;68:	gentity_t	*tent;
;69:
;70:	// use temp events at source and destination to prevent the effect
;71:	// from getting dropped by a second player event
;72:	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 3
EQI4 $86
line 73
;73:		tent = G_TempEntity( player->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 60
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 74
;74:		tent->s.clientNum = player->s.clientNum;
ADDRLP4 8
CNSTI4 220
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 76
;75:
;76:		tent = G_TempEntity( origin, EV_PLAYER_TELEPORT_IN );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 12
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 77
;77:		tent->s.clientNum = player->s.clientNum;
ADDRLP4 16
CNSTI4 220
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 78
;78:	}
LABELV $86
line 81
;79:
;80:	// unlink to make sure it can't possibly interfere with G_KillBox
;81:	trap_UnlinkEntity (player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 83
;82:
;83:	VectorCopy ( origin, player->client->ps.origin );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 84
;84:	player->client->ps.origin[2] += 1;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 87
;85:
;86:	// spit the player out
;87:	AngleVectors( angles, player->client->ps.velocity, NULL, NULL );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 88
;88:	VectorScale( player->client->ps.velocity, 400, player->client->ps.velocity );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTF4 1137180672
ADDRLP4 12
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTF4 1137180672
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTF4 1137180672
ADDRLP4 20
INDIRP4
INDIRF4
MULF4
ASGNF4
line 89
;89:	player->client->ps.pm_time = 160;		// hold time
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 160
ASGNI4
line 90
;90:	player->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 93
;91:
;92:	// toggle the teleport bit so the client knows to not lerp
;93:	player->client->ps.eFlags ^= EF_TELEPORT_BIT;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 96
;94:
;95:	// set angles
;96:	SetClientViewAngle( player, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 99
;97:
;98:	// kill anything at the destination
;99:	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 3
EQI4 $88
line 100
;100:		G_KillBox (player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
line 101
;101:	}
LABELV $88
line 104
;102:
;103:	// save results of pmove
;104:	BG_PlayerStateToEntityState( &player->client->ps, &player->s, qtrue );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 107
;105:
;106:	// use the precise origin for linking
;107:	VectorCopy( player->client->ps.origin, player->r.currentOrigin );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 109
;108:
;109:	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 3
EQI4 $90
line 110
;110:		trap_LinkEntity (player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 111
;111:	}
LABELV $90
line 112
;112:}
LABELV $85
endproc TeleportPlayer 40 16
export SP_misc_teleporter_dest
proc SP_misc_teleporter_dest 0 0
line 120
;113:
;114:
;115:/*QUAKED misc_teleporter_dest (1 0 0) (-32 -32 -24) (32 32 -16)
;116:Point teleporters at these.
;117:Now that we don't have teleport destination pads, this is just
;118:an info_notnull
;119:*/
;120:void SP_misc_teleporter_dest( gentity_t *ent ) {
line 121
;121:}
LABELV $92
endproc SP_misc_teleporter_dest 0 0
export SP_misc_model
proc SP_misc_model 0 4
line 129
;122:
;123:
;124://===========================================================
;125:
;126:/*QUAKED misc_model (1 0 0) (-16 -16 -16) (16 16 16)
;127:"model"		arbitrary .md3 file to display
;128:*/
;129:void SP_misc_model( gentity_t *ent ) {
line 140
;130:
;131:#if 0
;132:	ent->s.modelindex = G_ModelIndex( ent->model );
;133:	VectorSet (ent->mins, -16, -16, -16);
;134:	VectorSet (ent->maxs, 16, 16, 16);
;135:	trap_LinkEntity (ent);
;136:
;137:	G_SetOrigin( ent, ent->s.origin );
;138:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
;139:#else
;140:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 142
;141:#endif
;142:}
LABELV $93
endproc SP_misc_model 0 4
export SP_misc_G2model
proc SP_misc_G2model 0 4
line 148
;143:
;144:
;145:/*QUAKED misc_G2model (1 0 0) (-16 -16 -16) (16 16 16)
;146:"model"		arbitrary .glm file to display
;147:*/
;148:void SP_misc_G2model( gentity_t *ent ) {
line 162
;149:
;150:#if 0
;151:	char name1[200] = "models/players/kyle/modelmp.glm";
;152:	trap_G2API_InitGhoul2Model(&ent->s, name1, G_ModelIndex( name1 ), 0, 0, 0, 0);
;153:	trap_G2API_SetBoneAnim(ent->s.ghoul2, 0, "model_root", 0, 12, BONE_ANIM_OVERRIDE_LOOP, 1.0f, level.time, -1, -1);
;154:	ent->s.radius = 150;
;155://	VectorSet (ent->mins, -16, -16, -16);
;156://	VectorSet (ent->maxs, 16, 16, 16);
;157:	trap_LinkEntity (ent);
;158:
;159:	G_SetOrigin( ent, ent->s.origin );
;160:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
;161:#else
;162:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 164
;163:#endif
;164:}
LABELV $94
endproc SP_misc_G2model 0 4
export locateCamera
proc locateCamera 52 8
line 168
;165:
;166://===========================================================
;167:
;168:void locateCamera( gentity_t *ent ) {
line 173
;169:	vec3_t		dir;
;170:	gentity_t	*target;
;171:	gentity_t	*owner;
;172:
;173:	owner = G_PickTarget( ent->target );
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 174
;174:	if ( !owner ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $96
line 175
;175:		G_Printf( "Couldn't find target for misc_partal_surface\n" );
ADDRGP4 $98
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 176
;176:		G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 177
;177:		return;
ADDRGP4 $95
JUMPV
LABELV $96
line 179
;178:	}
;179:	ent->r.ownerNum = owner->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 182
;180:
;181:	// frame holds the rotate speed
;182:	if ( owner->spawnflags & 1 ) {
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $99
line 183
;183:		ent->s.frame = 25;
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 25
ASGNI4
line 184
;184:	} else if ( owner->spawnflags & 2 ) {
ADDRGP4 $100
JUMPV
LABELV $99
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $101
line 185
;185:		ent->s.frame = 75;
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 75
ASGNI4
line 186
;186:	}
LABELV $101
LABELV $100
line 189
;187:
;188:	// swing camera ?
;189:	if ( owner->spawnflags & 4 ) {
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $103
line 191
;190:		// set to 0 for no rotation at all
;191:		ent->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 0
ASGNI4
line 192
;192:	}
ADDRGP4 $104
JUMPV
LABELV $103
line 193
;193:	else {
line 194
;194:		ent->s.powerups = 1;
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 1
ASGNI4
line 195
;195:	}
LABELV $104
line 198
;196:
;197:	// clientNum holds the rotate offset
;198:	ent->s.clientNum = owner->s.clientNum;
ADDRLP4 24
CNSTI4 220
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 200
;199:
;200:	VectorCopy( owner->s.origin, ent->s.origin2 );
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 203
;201:
;202:	// see if the portal_camera has a target
;203:	target = G_PickTarget( owner->target );
ADDRLP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRP4
ASGNP4
line 204
;204:	if ( target ) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $105
line 205
;205:		VectorSubtract( target->s.origin, owner->s.origin, dir );
ADDRLP4 36
CNSTI4 92
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
CNSTI4 96
ASGNI4
ADDRLP4 4+4
ADDRLP4 16
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
CNSTI4 100
ASGNI4
ADDRLP4 4+8
ADDRLP4 16
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 206
;206:		VectorNormalize( dir );
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 207
;207:	} else {
ADDRGP4 $106
JUMPV
LABELV $105
line 208
;208:		G_SetMovedir( owner->s.angles, dir );
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 209
;209:	}
LABELV $106
line 211
;210:
;211:	ent->s.eventParm = DirToByte( dir );
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 212
;212:}
LABELV $95
endproc locateCamera 52 8
export SP_misc_portal_surface
proc SP_misc_portal_surface 20 4
line 218
;213:
;214:/*QUAKED misc_portal_surface (0 0 1) (-8 -8 -8) (8 8 8)
;215:The portal surface nearest this entity will show a view from the targeted misc_portal_camera, or a mirror view if untargeted.
;216:This must be within 64 world units of the surface!
;217:*/
;218:void SP_misc_portal_surface(gentity_t *ent) {
line 219
;219:	VectorClear( ent->r.mins );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 220
;220:	VectorClear( ent->r.maxs );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 336
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 332
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 221
;221:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 223
;222:
;223:	ent->r.svFlags = SVF_PORTAL;
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 64
ASGNI4
line 224
;224:	ent->s.eType = ET_PORTAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 8
ASGNI4
line 226
;225:
;226:	if ( !ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $110
line 227
;227:		VectorCopy( ent->s.origin, ent->s.origin2 );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 228
;228:	} else {
ADDRGP4 $111
JUMPV
LABELV $110
line 229
;229:		ent->think = locateCamera;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 locateCamera
ASGNP4
line 230
;230:		ent->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 231
;231:	}
LABELV $111
line 232
;232:}
LABELV $109
endproc SP_misc_portal_surface 20 4
export SP_misc_portal_camera
proc SP_misc_portal_camera 20 12
line 238
;233:
;234:/*QUAKED misc_portal_camera (0 0 1) (-8 -8 -8) (8 8 8) slowrotate fastrotate noswing
;235:The target for a misc_portal_director.  You can set either angles or target another entity to determine the direction of view.
;236:"roll" an angle modifier to orient the camera around the target vector;
;237:*/
;238:void SP_misc_portal_camera(gentity_t *ent) {
line 241
;239:	float	roll;
;240:
;241:	VectorClear( ent->r.mins );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 320
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 242
;242:	VectorClear( ent->r.maxs );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 336
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 332
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
line 243
;243:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 245
;244:
;245:	G_SpawnFloat( "roll", "0", &roll );
ADDRGP4 $114
ARGP4
ADDRGP4 $115
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 247
;246:
;247:	ent->s.clientNum = roll/360.0 * 256;
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
CNSTF4 1132462080
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
CVFI4 4
ASGNI4
line 248
;248:}
LABELV $113
endproc SP_misc_portal_camera 20 12
export HolocronRespawn
proc HolocronRespawn 4 0
line 294
;249:
;250:/*QUAKED misc_holocron (0 0 1) (-8 -8 -8) (8 8 8)
;251:count	Set to type of holocron (based on force power value)
;252:	HEAL = 0
;253:	JUMP = 1
;254:	SPEED = 2
;255:	PUSH = 3
;256:	PULL = 4
;257:	TELEPATHY = 5
;258:	GRIP = 6
;259:	LIGHTNING = 7
;260:	RAGE = 8
;261:	PROTECT = 9
;262:	ABSORB = 10
;263:	TEAM HEAL = 11
;264:	TEAM FORCE = 12
;265:	DRAIN = 13
;266:	SEE = 14
;267:	SABERATTACK = 15
;268:	SABERDEFEND = 16
;269:	SABERTHROW = 17
;270:*/
;271:
;272:/*char *holocronTypeModels[] = {
;273:	"models/chunks/rock/rock_big.md3",//FP_HEAL,
;274:	"models/chunks/rock/rock_big.md3",//FP_LEVITATION,
;275:	"models/chunks/rock/rock_big.md3",//FP_SPEED,
;276:	"models/chunks/rock/rock_big.md3",//FP_PUSH,
;277:	"models/chunks/rock/rock_big.md3",//FP_PULL,
;278:	"models/chunks/rock/rock_big.md3",//FP_TELEPATHY,
;279:	"models/chunks/rock/rock_big.md3",//FP_GRIP,
;280:	"models/chunks/rock/rock_big.md3",//FP_LIGHTNING,
;281:	"models/chunks/rock/rock_big.md3",//FP_RAGE,
;282:	"models/chunks/rock/rock_big.md3",//FP_PROTECT,
;283:	"models/chunks/rock/rock_big.md3",//FP_ABSORB,
;284:	"models/chunks/rock/rock_big.md3",//FP_TEAM_HEAL,
;285:	"models/chunks/rock/rock_big.md3",//FP_TEAM_FORCE,
;286:	"models/chunks/rock/rock_big.md3",//FP_DRAIN,
;287:	"models/chunks/rock/rock_big.md3",//FP_SEE
;288:	"models/chunks/rock/rock_big.md3",//FP_SABERATTACK
;289:	"models/chunks/rock/rock_big.md3",//FP_SABERDEFEND
;290:	"models/chunks/rock/rock_big.md3"//FP_SABERTHROW
;291:};*/
;292:
;293:void HolocronRespawn(gentity_t *self)
;294:{
line 295
;295:	self->s.modelindex = (self->count - 128);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 128
SUBI4
ASGNI4
line 296
;296:}
LABELV $116
endproc HolocronRespawn 4 0
export HolocronPopOut
proc HolocronPopOut 12 8
line 299
;297:
;298:void HolocronPopOut(gentity_t *self)
;299:{
line 300
;300:	if (Q_irand(1, 10) < 5)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 0
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
GEI4 $118
line 301
;301:	{
line 302
;302:		self->s.pos.trDelta[0] = 150 + Q_irand(1, 100);
CNSTI4 1
ARGI4
CNSTI4 100
ARGI4
ADDRLP4 4
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 150
ADDI4
CVIF4 4
ASGNF4
line 303
;303:	}
ADDRGP4 $119
JUMPV
LABELV $118
line 305
;304:	else
;305:	{
line 306
;306:		self->s.pos.trDelta[0] = -150 - Q_irand(1, 100);
CNSTI4 1
ARGI4
CNSTI4 100
ARGI4
ADDRLP4 4
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTI4 -150
ADDRLP4 4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 307
;307:	}
LABELV $119
line 308
;308:	if (Q_irand(1, 10) < 5)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 4
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 5
GEI4 $120
line 309
;309:	{
line 310
;310:		self->s.pos.trDelta[1] = 150 + Q_irand(1, 100);
CNSTI4 1
ARGI4
CNSTI4 100
ARGI4
ADDRLP4 8
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 150
ADDI4
CVIF4 4
ASGNF4
line 311
;311:	}
ADDRGP4 $121
JUMPV
LABELV $120
line 313
;312:	else
;313:	{
line 314
;314:		self->s.pos.trDelta[1] = -150 - Q_irand(1, 100);
CNSTI4 1
ARGI4
CNSTI4 100
ARGI4
ADDRLP4 8
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTI4 -150
ADDRLP4 8
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 315
;315:	}
LABELV $121
line 316
;316:	self->s.pos.trDelta[2] = 150 + Q_irand(1, 100);
CNSTI4 1
ARGI4
CNSTI4 100
ARGI4
ADDRLP4 8
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 150
ADDI4
CVIF4 4
ASGNF4
line 317
;317:}
LABELV $117
endproc HolocronPopOut 12 8
export HolocronTouch
proc HolocronTouch 44 12
line 320
;318:
;319:void HolocronTouch(gentity_t *self, gentity_t *other, trace_t *trace)
;320:{
line 321
;321:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 322
;322:	int othercarrying = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 323
;323:	float time_lowest = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 324
;324:	int index_lowest = -1;
ADDRLP4 4
CNSTI4 -1
ASGNI4
line 325
;325:	int hasall = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 326
;326:	int forceReselect = WP_NONE;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 328
;327:
;328:	if (trace)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $123
line 329
;329:	{
line 330
;330:		self->s.groundEntityNum = trace->entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ASGNI4
line 331
;331:	}
LABELV $123
line 333
;332:
;333:	if (!other || !other->client || other->health < 1)
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
EQU4 $128
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $128
ADDRLP4 24
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $125
LABELV $128
line 334
;334:	{
line 335
;335:		return;
ADDRGP4 $122
JUMPV
LABELV $125
line 338
;336:	}
;337:
;338:	if (!self->s.modelindex)
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 0
NEI4 $129
line 339
;339:	{
line 340
;340:		return;
ADDRGP4 $122
JUMPV
LABELV $129
line 343
;341:	}
;342:
;343:	if (self->enemy)
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $131
line 344
;344:	{
line 345
;345:		return;
ADDRGP4 $122
JUMPV
LABELV $131
line 348
;346:	}
;347:
;348:	if (other->client->ps.holocronsCarried[self->count])
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
INDIRF4
CNSTF4 0
EQF4 $133
line 349
;349:	{
line 350
;350:		return;
ADDRGP4 $122
JUMPV
LABELV $133
line 353
;351:	}
;352:
;353:	if (other->client->ps.holocronCantTouch == self->s.number && other->client->ps.holocronCantTouchTime > level.time)
ADDRLP4 32
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $139
ADDRLP4 32
INDIRP4
CNSTI4 720
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $139
line 354
;354:	{
line 355
;355:		return;
ADDRGP4 $122
JUMPV
LABELV $138
line 359
;356:	}
;357:
;358:	while (i < NUM_FORCE_POWERS)
;359:	{
line 360
;360:		if (other->client->ps.holocronsCarried[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
INDIRF4
CNSTF4 0
EQF4 $141
line 361
;361:		{
line 362
;362:			othercarrying++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 364
;363:
;364:			if (index_lowest == -1 || other->client->ps.holocronsCarried[i] < time_lowest)
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $145
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $142
LABELV $145
line 365
;365:			{
line 366
;366:				index_lowest = i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 367
;367:				time_lowest = other->client->ps.holocronsCarried[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
INDIRF4
ASGNF4
line 368
;368:			}
line 369
;369:		}
ADDRGP4 $142
JUMPV
LABELV $141
line 370
;370:		else if (i != self->count)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
EQI4 $146
line 371
;371:		{
line 372
;372:			hasall = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 373
;373:		}
LABELV $146
LABELV $142
line 374
;374:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 375
;375:	}
LABELV $139
line 358
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $138
line 377
;376:
;377:	if (hasall)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $148
line 378
;378:	{ //once we pick up this holocron we'll have all of them, so give us super special best prize!
line 380
;379:		//G_Printf("You deserve a pat on the back.\n");
;380:	}
LABELV $148
line 382
;381:
;382:	if (!(other->client->ps.fd.forcePowersActive & (1 << other->client->ps.fd.forcePowerSelected)))
ADDRLP4 36
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 36
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $150
line 383
;383:	{ //If the player isn't using his currently selected force power, select this one
line 384
;384:		if (self->count != FP_SABERATTACK && self->count != FP_SABERDEFEND && self->count != FP_SABERTHROW && self->count != FP_LEVITATION)
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 15
EQI4 $152
ADDRLP4 40
INDIRI4
CNSTI4 16
EQI4 $152
ADDRLP4 40
INDIRI4
CNSTI4 17
EQI4 $152
ADDRLP4 40
INDIRI4
CNSTI4 1
EQI4 $152
line 385
;385:		{
line 386
;386:			other->client->ps.fd.forcePowerSelected = self->count;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ASGNI4
line 387
;387:		}
LABELV $152
line 388
;388:	}
LABELV $150
line 390
;389:
;390:	if (g_MaxHolocronCarry.integer && othercarrying >= g_MaxHolocronCarry.integer)
ADDRGP4 g_MaxHolocronCarry+12
INDIRI4
CNSTI4 0
EQI4 $154
ADDRLP4 12
INDIRI4
ADDRGP4 g_MaxHolocronCarry+12
INDIRI4
LTI4 $154
line 391
;391:	{ //make the oldest holocron carried by the player pop out to make room for this one
line 392
;392:		other->client->ps.holocronsCarried[index_lowest] = 0;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 407
;393:
;394:		/*
;395:		if (index_lowest == FP_SABERATTACK && !HasSetSaberOnly())
;396:		{ //you lost your saberattack holocron, so no more saber for you
;397:			other->client->ps.stats[STAT_WEAPONS] |= (1 << WP_STUN_BATON);
;398:			other->client->ps.stats[STAT_WEAPONS] &= ~(1 << WP_SABER);
;399:
;400:			if (other->client->ps.weapon == WP_SABER)
;401:			{
;402:				forceReselect = WP_SABER;
;403:			}
;404:		}
;405:		*/
;406:		//NOTE: No longer valid as we are now always giving a force level 1 saber attack level in holocron
;407:	}
LABELV $154
line 410
;408:
;409:	//G_Sound(other, CHAN_AUTO, G_SoundIndex("sound/weapons/w_pkup.wav"));
;410:	G_AddEvent( other, EV_ITEM_PICKUP, self->s.number );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 20
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 412
;411:
;412:	other->client->ps.holocronsCarried[self->count] = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 413
;413:	self->s.modelindex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 0
ASGNI4
line 414
;414:	self->enemy = other;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 416
;415:
;416:	self->pos2[0] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTF4 1065353216
ASGNF4
line 417
;417:	self->pos2[1] = level.time + HOLOCRON_RESPAWN_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
CVIF4 4
ASGNF4
line 432
;418:
;419:	/*
;420:	if (self->count == FP_SABERATTACK && !HasSetSaberOnly())
;421:	{ //player gets a saber
;422:		other->client->ps.stats[STAT_WEAPONS] |= (1 << WP_SABER);
;423:		other->client->ps.stats[STAT_WEAPONS] &= ~(1 << WP_STUN_BATON);
;424:
;425:		if (other->client->ps.weapon == WP_STUN_BATON)
;426:		{
;427:			forceReselect = WP_STUN_BATON;
;428:		}
;429:	}
;430:	*/
;431:
;432:	if (forceReselect != WP_NONE)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $160
line 433
;433:	{
line 434
;434:		G_AddEvent(other, EV_NOAMMO, forceReselect);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 22
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 435
;435:	}
LABELV $160
line 438
;436:
;437:	//G_Printf("DON'T TOUCH ME\n");
;438:}
LABELV $122
endproc HolocronTouch 44 12
export HolocronThink
proc HolocronThink 64 4
line 441
;439:
;440:void HolocronThink(gentity_t *ent)
;441:{
line 442
;442:	if (ent->pos2[0] && (!ent->enemy || !ent->enemy->client || ent->enemy->health < 1))
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
CNSTF4 0
EQF4 $163
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 728
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
EQU4 $166
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $166
ADDRLP4 4
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $163
LABELV $166
line 443
;443:	{
line 444
;444:		if (ent->enemy && ent->enemy->client)
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
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
EQU4 $164
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $164
line 445
;445:		{
line 446
;446:			HolocronRespawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 HolocronRespawn
CALLV
pop
line 447
;447:			VectorCopy(ent->enemy->client->ps.origin, ent->s.pos.trBase);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 448
;448:			VectorCopy(ent->enemy->client->ps.origin, ent->s.origin);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 449
;449:			VectorCopy(ent->enemy->client->ps.origin, ent->r.currentOrigin);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 451
;450:			//copy to person carrying's origin before popping out of them
;451:			HolocronPopOut(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 HolocronPopOut
CALLV
pop
line 452
;452:			ent->enemy->client->ps.holocronsCarried[ent->count] = 0;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 453
;453:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTP4 0
ASGNP4
line 455
;454:			
;455:			goto justthink;
ADDRGP4 $169
JUMPV
line 457
;456:		}
;457:	}
LABELV $163
line 458
;458:	else if (ent->pos2[0] && ent->enemy && ent->enemy->client)
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
CNSTF4 0
EQF4 $170
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 728
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
EQU4 $170
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $170
line 459
;459:	{
line 460
;460:		ent->pos2[1] = level.time + HOLOCRON_RESPAWN_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
CVIF4 4
ASGNF4
line 461
;461:	}
LABELV $170
LABELV $164
line 463
;462:
;463:	if (ent->enemy && ent->enemy->client)
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 728
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
EQU4 $173
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $173
line 464
;464:	{
line 465
;465:		if (!ent->enemy->client->ps.holocronsCarried[ent->count])
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
INDIRF4
CNSTF4 0
NEF4 $175
line 466
;466:		{
line 467
;467:			ent->enemy->client->ps.holocronCantTouch = ent->s.number;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 716
ADDP4
ADDRLP4 36
INDIRP4
INDIRI4
ASGNI4
line 468
;468:			ent->enemy->client->ps.holocronCantTouchTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
CVIF4 4
ASGNF4
line 470
;469:
;470:			HolocronRespawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 HolocronRespawn
CALLV
pop
line 471
;471:			VectorCopy(ent->enemy->client->ps.origin, ent->s.pos.trBase);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 472
;472:			VectorCopy(ent->enemy->client->ps.origin, ent->s.origin);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 473
;473:			VectorCopy(ent->enemy->client->ps.origin, ent->r.currentOrigin);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 475
;474:			//copy to person carrying's origin before popping out of them
;475:			HolocronPopOut(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 HolocronPopOut
CALLV
pop
line 476
;476:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTP4 0
ASGNP4
line 478
;477:
;478:			goto justthink;
ADDRGP4 $169
JUMPV
LABELV $175
line 481
;479:		}
;480:
;481:		if (!ent->enemy->inuse || (ent->enemy->client && ent->enemy->client->ps.fallingToDeath))
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $180
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
CNSTU4 0
EQU4 $178
ADDRLP4 44
INDIRP4
CNSTI4 1352
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $178
LABELV $180
line 482
;482:		{
line 483
;483:			if (ent->enemy->inuse && ent->enemy->client)
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $181
ADDRLP4 48
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $181
line 484
;484:			{
line 485
;485:				ent->enemy->client->ps.holocronBits &= ~(1 << ent->count);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 52
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 52
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 486
;486:				ent->enemy->client->ps.holocronsCarried[ent->count] = 0;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 60
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 487
;487:			}
LABELV $181
line 488
;488:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTP4 0
ASGNP4
line 489
;489:			HolocronRespawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 HolocronRespawn
CALLV
pop
line 490
;490:			VectorCopy(ent->s.origin2, ent->s.pos.trBase);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 491
;491:			VectorCopy(ent->s.origin2, ent->s.origin);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 492
;492:			VectorCopy(ent->s.origin2, ent->r.currentOrigin);
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 494
;493:
;494:			ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 496
;495:
;496:			ent->pos2[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTF4 0
ASGNF4
line 498
;497:
;498:			trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 500
;499:
;500:			goto justthink;
ADDRGP4 $169
JUMPV
LABELV $178
line 502
;501:		}
;502:	}
LABELV $173
line 504
;503:
;504:	if (ent->pos2[0] && ent->pos2[1] < level.time)
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
CNSTF4 0
EQF4 $184
ADDRLP4 32
INDIRP4
CNSTI4 564
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $184
line 505
;505:	{ //isn't in original place and has been there for (HOLOCRON_RESPAWN_TIME) seconds without being picked up, so respawn
line 506
;506:		VectorCopy(ent->s.origin2, ent->s.pos.trBase);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 507
;507:		VectorCopy(ent->s.origin2, ent->s.origin);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 508
;508:		VectorCopy(ent->s.origin2, ent->r.currentOrigin);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 510
;509:
;510:		ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 512
;511:
;512:		ent->pos2[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTF4 0
ASGNF4
line 514
;513:
;514:		trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 515
;515:	}
LABELV $184
LABELV $169
line 518
;516:
;517:justthink:
;518:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 520
;519:
;520:	if (ent->s.pos.trDelta[0] || ent->s.pos.trDelta[1] || ent->s.pos.trDelta[2])
ADDRLP4 36
ADDRFP4 0
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
NEF4 $192
ADDRLP4 36
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 40
INDIRF4
NEF4 $192
ADDRLP4 36
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ADDRLP4 40
INDIRF4
EQF4 $189
LABELV $192
line 521
;521:	{
line 522
;522:		G_RunObject(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 523
;523:	}
LABELV $189
line 524
;524:}
LABELV $162
endproc HolocronThink 64 4
export SP_misc_holocron
proc SP_misc_holocron 1132 28
line 527
;525:
;526:void SP_misc_holocron(gentity_t *ent)
;527:{
line 531
;528:	vec3_t dest;
;529:	trace_t tr;
;530:
;531:	if (g_gametype.integer != GT_HOLOCRON)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $194
line 532
;532:	{
line 533
;533:		G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 534
;534:		return;
ADDRGP4 $193
JUMPV
LABELV $194
line 537
;535:	}
;536:
;537:	if (HasSetSaberOnly())
ADDRLP4 1092
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
EQI4 $197
line 538
;538:	{
line 539
;539:		if (ent->count == FP_SABERATTACK ||
ADDRLP4 1096
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 15
EQI4 $202
ADDRLP4 1096
INDIRI4
CNSTI4 16
EQI4 $202
ADDRLP4 1096
INDIRI4
CNSTI4 17
NEI4 $199
LABELV $202
line 542
;540:			ent->count == FP_SABERDEFEND ||
;541:			ent->count == FP_SABERTHROW)
;542:		{ //having saber holocrons in saber only mode is pointless
line 543
;543:			G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 544
;544:			return;
ADDRGP4 $193
JUMPV
LABELV $199
line 546
;545:		}
;546:	}
LABELV $197
line 548
;547:
;548:	ent->s.isJediMaster = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
CNSTI4 1
ASGNI4
line 550
;549:
;550:	VectorSet( ent->r.maxs, 8, 8, 8 );
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1090519040
ASGNF4
line 551
;551:	VectorSet( ent->r.mins, -8, -8, -8 );
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3238002688
ASGNF4
line 553
;552:
;553:	ent->s.origin[2] += 0.1;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 1096
INDIRP4
ADDRLP4 1096
INDIRP4
INDIRF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 554
;554:	ent->r.maxs[2] -= 0.1;
ADDRLP4 1100
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
ASGNP4
ADDRLP4 1100
INDIRP4
ADDRLP4 1100
INDIRP4
INDIRF4
CNSTF4 1036831949
SUBF4
ASGNF4
line 556
;555:
;556:	VectorSet( dest, ent->s.origin[0], ent->s.origin[1], ent->s.origin[2] - 4096 );
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1104
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 1104
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 557
;557:	trap_Trace( &tr, ent->s.origin, ent->r.mins, ent->r.maxs, dest, ent->s.number, MASK_SOLID );
ADDRLP4 12
ARGP4
ADDRLP4 1108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 1108
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1108
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1108
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 558
;558:	if ( tr.startsolid )
ADDRLP4 12+4
INDIRI4
CNSTI4 0
EQI4 $205
line 559
;559:	{
line 560
;560:		G_Printf ("SP_misc_holocron: misc_holocron startsolid at %s\n", vtos(ent->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 1112
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $208
ARGP4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 561
;561:		G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 562
;562:		return;
ADDRGP4 $193
JUMPV
LABELV $205
line 566
;563:	}
;564:
;565:	//add the 0.1 back after the trace
;566:	ent->r.maxs[2] += 0.1;
ADDRLP4 1112
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
ASGNP4
ADDRLP4 1112
INDIRP4
ADDRLP4 1112
INDIRP4
INDIRF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 571
;567:
;568:	// allow to ride movers
;569://	ent->s.groundEntityNum = tr.entityNum;
;570:
;571:	G_SetOrigin( ent, tr.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 573
;572:
;573:	if (ent->count < 0)
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
GEI4 $210
line 574
;574:	{
line 575
;575:		ent->count = 0;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 0
ASGNI4
line 576
;576:	}
LABELV $210
line 578
;577:
;578:	if (ent->count >= NUM_FORCE_POWERS)
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 18
LTI4 $212
line 579
;579:	{
line 580
;580:		ent->count = NUM_FORCE_POWERS-1;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 17
ASGNI4
line 581
;581:	}
LABELV $212
line 593
;582:/*
;583:	if (g_forcePowerDisable.integer &&
;584:		(g_forcePowerDisable.integer & (1 << ent->count)))
;585:	{
;586:		G_FreeEntity(ent);
;587:		return;
;588:	}
;589:*/
;590:	//No longer doing this, causing too many complaints about accidentally setting no force powers at all
;591:	//and starting a holocron game (making it basically just FFA)
;592:
;593:	ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTP4 0
ASGNP4
line 595
;594:
;595:	ent->s.eFlags = EF_BOUNCE_HALF;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 597
;596:
;597:	ent->s.modelindex = (ent->count - 128);//G_ModelIndex(holocronTypeModels[ent->count]);
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 1116
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 128
SUBI4
ASGNI4
line 598
;598:	ent->s.eType = ET_HOLOCRON;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 5
ASGNI4
line 599
;599:	ent->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 600
;600:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 602
;601:
;602:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1024
ASGNI4
line 603
;603:	ent->clipmask = MASK_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 1
ASGNI4
line 605
;604:
;605:	ent->s.trickedentindex4 = ent->count;
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1120
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 1120
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ASGNI4
line 607
;606:
;607:	if (forcePowerDarkLight[ent->count] == FORCE_DARKSIDE)
ADDRLP4 1124
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ADDRLP4 1124
INDIRI4
LSHI4
ADDRGP4 forcePowerDarkLight
ADDP4
INDIRI4
ADDRLP4 1124
INDIRI4
NEI4 $215
line 608
;608:	{
line 609
;609:		ent->s.trickedentindex3 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 1
ASGNI4
line 610
;610:	}
ADDRGP4 $216
JUMPV
LABELV $215
line 611
;611:	else if (forcePowerDarkLight[ent->count] == FORCE_LIGHTSIDE)
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forcePowerDarkLight
ADDP4
INDIRI4
CNSTI4 1
NEI4 $217
line 612
;612:	{
line 613
;613:		ent->s.trickedentindex3 = 2;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 2
ASGNI4
line 614
;614:	}
ADDRGP4 $218
JUMPV
LABELV $217
line 616
;615:	else
;616:	{
line 617
;617:		ent->s.trickedentindex3 = 3;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 3
ASGNI4
line 618
;618:	}
LABELV $218
LABELV $216
line 620
;619:
;620:	ent->physicsObject = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 622
;621:
;622:	VectorCopy(ent->s.pos.trBase, ent->s.origin2); //remember the spawn spot
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 1128
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 624
;623:
;624:	ent->touch = HolocronTouch;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 HolocronTouch
ASGNP4
line 626
;625:
;626:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 628
;627:
;628:	ent->think = HolocronThink;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 HolocronThink
ASGNP4
line 629
;629:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 630
;630:}
LABELV $193
endproc SP_misc_holocron 1132 28
export Use_Shooter
proc Use_Shooter 64 16
line 640
;631:
;632:/*
;633:======================================================================
;634:
;635:  SHOOTERS
;636:
;637:======================================================================
;638:*/
;639:
;640:void Use_Shooter( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 646
;641:	vec3_t		dir;
;642:	float		deg;
;643:	vec3_t		up, right;
;644:
;645:	// see if we have a target
;646:	if ( ent->enemy ) {
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $221
line 647
;647:		VectorSubtract( ent->enemy->r.currentOrigin, ent->s.origin, dir );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 728
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 44
INDIRP4
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 44
INDIRP4
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 48
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 648
;648:		VectorNormalize( dir );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 649
;649:	} else {
ADDRGP4 $222
JUMPV
LABELV $221
line 650
;650:		VectorCopy( ent->movedir, dir );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRB
ASGNB 12
line 651
;651:	}
LABELV $222
line 654
;652:
;653:	// randomize a bit
;654:	PerpendicularVector( up, dir );
ADDRLP4 16
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 655
;655:	CrossProduct( up, dir, right );
ADDRLP4 16
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 657
;656:
;657:	deg = crandom() * ent->random;
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
CNSTF4 1073741824
ADDRLP4 40
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRF4
MULF4
ASGNF4
line 658
;658:	VectorMA( dir, deg, up, dir );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 660
;659:
;660:	deg = crandom() * ent->random;
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
CNSTF4 1073741824
ADDRLP4 48
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRF4
MULF4
ASGNF4
line 661
;661:	VectorMA( dir, deg, right, dir );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 663
;662:
;663:	VectorNormalize( dir );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 665
;664:
;665:	switch ( ent->s.weapon ) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 4
EQI4 $240
ADDRGP4 $237
JUMPV
LABELV $240
line 667
;666:	case WP_BLASTER:
;667:		WP_FireBlasterMissile( ent, ent->s.origin, dir, qfalse );
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 WP_FireBlasterMissile
CALLV
pop
line 668
;668:		break;
LABELV $237
LABELV $238
line 671
;669:	}
;670:
;671:	G_AddEvent( ent, EV_FIRE_WEAPON, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 24
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 672
;672:}
LABELV $220
endproc Use_Shooter 64 16
proc InitShooter_Finish 8 4
line 675
;673:
;674:
;675:static void InitShooter_Finish( gentity_t *ent ) {
line 676
;676:	ent->enemy = G_PickTarget( ent->target );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 677
;677:	ent->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
CNSTP4 0
ASGNP4
line 678
;678:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 0
ASGNI4
line 679
;679:}
LABELV $241
endproc InitShooter_Finish 8 4
export InitShooter
proc InitShooter 16 8
line 681
;680:
;681:void InitShooter( gentity_t *ent, int weapon ) {
line 682
;682:	ent->use = Use_Shooter;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDRGP4 Use_Shooter
ASGNP4
line 683
;683:	ent->s.weapon = weapon;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 685
;684:
;685:	RegisterItem( BG_FindItemForWeapon( weapon ) );
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 687
;686:
;687:	G_SetMovedir( ent->s.angles, ent->movedir );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 612
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 689
;688:
;689:	if ( !ent->random ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRF4
CNSTF4 0
NEF4 $243
line 690
;690:		ent->random = 1.0;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTF4 1065353216
ASGNF4
line 691
;691:	}
LABELV $243
line 692
;692:	ent->random = sin( M_PI * ent->random / 180 );
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ASGNP4
CNSTF4 1078530011
ADDRLP4 8
INDIRP4
INDIRF4
MULF4
CNSTF4 1127481344
DIVF4
ARGF4
ADDRLP4 12
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 694
;693:	// target might be a moving object, so we can't set movedir for it
;694:	if ( ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $245
line 695
;695:		ent->think = InitShooter_Finish;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 InitShooter_Finish
ASGNP4
line 696
;696:		ent->nextthink = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 697
;697:	}
LABELV $245
line 698
;698:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 699
;699:}
LABELV $242
endproc InitShooter 16 8
export SP_shooter_blaster
proc SP_shooter_blaster 0 8
line 705
;700:
;701:/*QUAKED shooter_blaster (1 0 0) (-16 -16 -16) (16 16 16)
;702:Fires at either the target or the current direction.
;703:"random" is the number of degrees of deviance from the taget. (1.0 default)
;704:*/
;705:void SP_shooter_blaster( gentity_t *ent ) {
line 706
;706:	InitShooter( ent, WP_BLASTER);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 InitShooter
CALLV
pop
line 707
;707:}
LABELV $248
endproc SP_shooter_blaster 0 8
export check_recharge
proc check_recharge 8 0
line 710
;708:
;709:void check_recharge(gentity_t *ent)
;710:{
line 711
;711:	if (ent->fly_sound_debounce_time < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $250
line 712
;712:	{
line 713
;713:		ent->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 714
;714:	}
LABELV $250
line 716
;715:
;716:	if (ent->count < ent->boltpoint4)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
GEI4 $253
line 717
;717:	{
line 718
;718:		ent->count++;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 719
;719:	}
LABELV $253
line 721
;720:
;721:	ent->nextthink = level.time + ent->bolt_Head;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ADDI4
ASGNI4
line 722
;722:}
LABELV $249
endproc check_recharge 8 0
export EnergyShieldStationSettings
proc EnergyShieldStationSettings 0 12
line 730
;723:
;724:/*
;725:================
;726:EnergyShieldStationSettings
;727:================
;728:*/
;729:void EnergyShieldStationSettings(gentity_t *ent)
;730:{
line 731
;731:	G_SpawnInt( "count", "0", &ent->count );
ADDRGP4 $257
ARGP4
ADDRGP4 $115
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 733
;732:
;733:	if (!ent->count)
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
NEI4 $258
line 734
;734:	{
line 735
;735:		ent->count = 50; 
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 50
ASGNI4
line 736
;736:	}
LABELV $258
line 738
;737:
;738:	G_SpawnInt("chargerate", "0", &ent->bolt_Head);
ADDRGP4 $260
ARGP4
ADDRGP4 $115
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 740
;739:
;740:	if (!ent->bolt_Head)
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 0
NEI4 $261
line 741
;741:	{
line 742
;742:		ent->bolt_Head = STATION_RECHARGE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 3000
ASGNI4
line 743
;743:	}
LABELV $261
line 744
;744:}
LABELV $256
endproc EnergyShieldStationSettings 0 12
export shield_power_converter_use
proc shield_power_converter_use 32 12
line 752
;745:
;746:/*
;747:================
;748:shield_power_converter_use
;749:================
;750:*/
;751:void shield_power_converter_use( gentity_t *self, gentity_t *other, gentity_t *activator)
;752:{
line 754
;753:	int dif,add;
;754:	int stop = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 756
;755:
;756:	if (!activator || !activator->client)
ADDRLP4 12
ADDRFP4 8
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
EQU4 $266
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
NEU4 $264
LABELV $266
line 757
;757:	{
line 758
;758:		return;
ADDRGP4 $263
JUMPV
LABELV $264
line 761
;759:	}
;760:
;761:	if (self->setTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $267
line 762
;762:	{
line 763
;763:		if (!self->s.loopSound)
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 0
NEI4 $270
line 764
;764:		{
line 765
;765:			self->s.loopSound = G_SoundIndex("sound/interface/shieldcon_run.wav");
ADDRGP4 $272
ARGP4
ADDRLP4 20
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 766
;766:		}
LABELV $270
line 767
;767:		self->setTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 769
;768:
;769:		dif = activator->client->ps.stats[STAT_MAX_HEALTH] - activator->client->ps.stats[STAT_ARMOR];
ADDRLP4 20
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
SUBI4
ASGNI4
line 771
;770:
;771:		if (dif > 0)					// Already at full armor?
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $274
line 772
;772:		{
line 773
;773:			if (dif >MAX_AMMO_GIVE)
ADDRLP4 4
INDIRI4
CNSTI4 2
LEI4 $276
line 774
;774:			{
line 775
;775:				add = MAX_AMMO_GIVE;
ADDRLP4 8
CNSTI4 2
ASGNI4
line 776
;776:			}
ADDRGP4 $277
JUMPV
LABELV $276
line 778
;777:			else
;778:			{
line 779
;779:				add = dif;
ADDRLP4 8
ADDRLP4 4
INDIRI4
ASGNI4
line 780
;780:			}
LABELV $277
line 782
;781:
;782:			if (self->count<add)
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
GEI4 $278
line 783
;783:			{
line 784
;784:				add = self->count;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ASGNI4
line 785
;785:			}
LABELV $278
line 787
;786:
;787:			self->count -= add;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 788
;788:			if (self->count <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
GTI4 $280
line 789
;789:			{
line 790
;790:				self->setTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
CNSTI4 0
ASGNI4
line 791
;791:			}
LABELV $280
line 792
;792:			stop = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 794
;793:
;794:			self->fly_sound_debounce_time = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 796
;795:
;796:			activator->client->ps.stats[STAT_ARMOR] += add;
ADDRLP4 28
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 236
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 797
;797:		}
LABELV $274
line 798
;798:	}
LABELV $267
line 800
;799:
;800:	if (stop || self->count <= 0)
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $285
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
GTI4 $283
LABELV $285
line 801
;801:	{
line 802
;802:		if (self->s.loopSound && self->setTime < level.time)
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 0
EQI4 $286
ADDRLP4 24
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $286
line 803
;803:		{
line 804
;804:			G_Sound(self, CHAN_AUTO, G_SoundIndex("sound/interface/shieldcon_done.mp3"));
ADDRGP4 $289
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 805
;805:		}
LABELV $286
line 806
;806:		self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 807
;807:		if (self->setTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $290
line 808
;808:		{
line 809
;809:			self->setTime = level.time + self->bolt_Head+100;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 628
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ADDI4
CNSTI4 100
ADDI4
ASGNI4
line 810
;810:		}
LABELV $290
line 811
;811:	}
LABELV $283
line 812
;812:}
LABELV $263
endproc shield_power_converter_use 32 12
export SP_misc_shield_floor_unit
proc SP_misc_shield_floor_unit 1136 28
line 817
;813:
;814://QED comment is in bg_misc
;815://------------------------------------------------------------
;816:void SP_misc_shield_floor_unit( gentity_t *ent )
;817:{
line 821
;818:	vec3_t dest;
;819:	trace_t tr;
;820:
;821:	if (g_gametype.integer != GT_CTF &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $295
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
EQI4 $295
line 823
;822:		g_gametype.integer != GT_CTY)
;823:	{
line 824
;824:		G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 825
;825:		return;
ADDRGP4 $294
JUMPV
LABELV $295
line 828
;826:	}
;827:
;828:	VectorSet( ent->r.mins, -16, -16, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 0
ASGNF4
line 829
;829:	VectorSet( ent->r.maxs, 16, 16, 40 );
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1109393408
ASGNF4
line 831
;830:
;831:	ent->s.origin[2] += 0.1;
ADDRLP4 1092
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 1092
INDIRP4
ADDRLP4 1092
INDIRP4
INDIRF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 832
;832:	ent->r.maxs[2] -= 0.1;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
ASGNP4
ADDRLP4 1096
INDIRP4
ADDRLP4 1096
INDIRP4
INDIRF4
CNSTF4 1036831949
SUBF4
ASGNF4
line 834
;833:
;834:	VectorSet( dest, ent->s.origin[0], ent->s.origin[1], ent->s.origin[2] - 4096 );
ADDRLP4 1100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1100
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 1100
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 835
;835:	trap_Trace( &tr, ent->s.origin, ent->r.mins, ent->r.maxs, dest, ent->s.number, MASK_SOLID );
ADDRLP4 12
ARGP4
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1104
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 1104
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1104
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1104
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 836
;836:	if ( tr.startsolid )
ADDRLP4 12+4
INDIRI4
CNSTI4 0
EQI4 $301
line 837
;837:	{
line 838
;838:		G_Printf ("SP_misc_shield_floor_unit: misc_shield_floor_unit startsolid at %s\n", vtos(ent->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 1108
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $304
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 839
;839:		G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 840
;840:		return;
ADDRGP4 $294
JUMPV
LABELV $301
line 844
;841:	}
;842:
;843:	//add the 0.1 back after the trace
;844:	ent->r.maxs[2] += 0.1;
ADDRLP4 1108
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
ASGNP4
ADDRLP4 1108
INDIRP4
ADDRLP4 1108
INDIRP4
INDIRF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 847
;845:
;846:	// allow to ride movers
;847:	ent->s.groundEntityNum = tr.entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRLP4 12+52
INDIRI4
ASGNI4
line 849
;848:
;849:	G_SetOrigin( ent, tr.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 851
;850:
;851:	if (!ent->health)
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
NEI4 $307
line 852
;852:	{
line 853
;853:		ent->health = 60;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 60
ASGNI4
line 854
;854:	}
LABELV $307
line 856
;855:
;856:	if (!ent->model || !ent->model[0])
ADDRLP4 1112
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1112
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $311
ADDRLP4 1112
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $309
LABELV $311
line 857
;857:	{
line 858
;858:		ent->model = "/models/items/a_shield_converter.md3";
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
ADDRGP4 $312
ASGNP4
line 859
;859:	}
LABELV $309
line 861
;860:
;861:	ent->s.modelindex = G_ModelIndex( ent->model );
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 476
ADDP4
INDIRP4
ARGP4
ADDRLP4 1120
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 1116
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 1120
INDIRI4
ASGNI4
line 863
;862:
;863:	ent->s.eFlags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 864
;864:	ent->r.svFlags |= SVF_PLAYER_USABLE;
ADDRLP4 1124
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1124
INDIRP4
ADDRLP4 1124
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 865
;865:	ent->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1
ASGNI4
line 866
;866:	ent->clipmask = MASK_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 1
ASGNI4
line 868
;867:
;868:	EnergyShieldStationSettings(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 EnergyShieldStationSettings
CALLV
pop
line 870
;869:
;870:	ent->boltpoint4 = ent->count; //initial value
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 780
ADDP4
ADDRLP4 1128
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ASGNI4
line 871
;871:	ent->think = check_recharge;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 check_recharge
ASGNP4
line 872
;872:	ent->nextthink = level.time + STATION_RECHARGE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 874
;873:
;874:	ent->use = shield_power_converter_use;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDRGP4 shield_power_converter_use
ASGNP4
line 876
;875:
;876:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
ADDRLP4 1132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 1132
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 877
;877:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 879
;878:
;879:	G_SoundIndex("sound/interface/shieldcon_run.wav");
ADDRGP4 $272
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 880
;880:	G_SoundIndex("sound/interface/shieldcon_done.mp3");
ADDRGP4 $289
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 881
;881:	G_SoundIndex("sound/interface/shieldcon_empty.mp3");
ADDRGP4 $314
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 882
;882:}
LABELV $294
endproc SP_misc_shield_floor_unit 1136 28
export SP_misc_model_shield_power_converter
proc SP_misc_model_shield_power_converter 28 8
line 893
;883:
;884:
;885:/*QUAKED misc_model_shield_power_converter (1 0 0) (-16 -16 -16) (16 16 16)
;886:#MODELNAME="models/items/psd_big.md3"
;887:Gives shield energy when used.
;888:
;889:"count" - the amount of ammo given when used (default 100)
;890:*/
;891://------------------------------------------------------------
;892:void SP_misc_model_shield_power_converter( gentity_t *ent )
;893:{
line 894
;894:	if (!ent->health)
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
NEI4 $316
line 895
;895:	{
line 896
;896:		ent->health = 60;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 60
ASGNI4
line 897
;897:	}
LABELV $316
line 899
;898:
;899:	VectorSet (ent->r.mins, -16, -16, -16);
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3246391296
ASGNF4
line 900
;900:	VectorSet (ent->r.maxs, 16, 16, 16);
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1098907648
ASGNF4
line 902
;901:
;902:	ent->s.modelindex = G_ModelIndex( ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 904
;903:
;904:	ent->s.eFlags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 905
;905:	ent->r.svFlags |= SVF_PLAYER_USABLE;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 906
;906:	ent->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1
ASGNI4
line 907
;907:	ent->clipmask = MASK_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 1
ASGNI4
line 909
;908:
;909:	EnergyShieldStationSettings(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 EnergyShieldStationSettings
CALLV
pop
line 911
;910:
;911:	ent->boltpoint4 = ent->count; //initial value
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 780
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ASGNI4
line 912
;912:	ent->think = check_recharge;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 check_recharge
ASGNP4
line 913
;913:	ent->nextthink = level.time + STATION_RECHARGE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 915
;914:
;915:	ent->use = shield_power_converter_use;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDRGP4 shield_power_converter_use
ASGNP4
line 917
;916:
;917:	G_SetOrigin( ent, ent->s.origin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 918
;918:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 919
;919:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 921
;920:
;921:	G_SoundIndex("sound/movers/objects/useshieldstation.wav");
ADDRGP4 $319
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 923
;922:
;923:	ent->s.modelindex2 = G_ModelIndex("/models/items/psd_big.md3");	// Precache model
ADDRGP4 $320
ARGP4
ADDRLP4 24
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 924
;924:}
LABELV $315
endproc SP_misc_model_shield_power_converter 28 8
export EnergyAmmoStationSettings
proc EnergyAmmoStationSettings 0 12
line 933
;925:
;926:
;927:/*
;928:================
;929:EnergyAmmoShieldStationSettings
;930:================
;931:*/
;932:void EnergyAmmoStationSettings(gentity_t *ent)
;933:{
line 934
;934:	G_SpawnInt( "count", "0", &ent->count );
ADDRGP4 $257
ARGP4
ADDRGP4 $115
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 936
;935:
;936:	if (!ent->count)
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
NEI4 $322
line 937
;937:	{
line 938
;938:		ent->count = 100; 
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 100
ASGNI4
line 939
;939:	}
LABELV $322
line 940
;940:}
LABELV $321
endproc EnergyAmmoStationSettings 0 12
export ammo_power_converter_use
proc ammo_power_converter_use 52 4
line 948
;941:
;942:/*
;943:================
;944:ammo_power_converter_use
;945:================
;946:*/
;947:void ammo_power_converter_use( gentity_t *self, gentity_t *other, gentity_t *activator)
;948:{
line 952
;949:	int			add,highest;
;950:	qboolean	overcharge;
;951:	int			difBlaster,difPowerCell,difMetalBolts;
;952:	int			stop = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 954
;953:
;954:	if (!activator || !activator->client)
ADDRLP4 28
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 32
CNSTU4 0
ASGNU4
ADDRLP4 28
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $327
ADDRLP4 28
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
NEU4 $325
LABELV $327
line 955
;955:	{
line 956
;956:		return;
ADDRGP4 $324
JUMPV
LABELV $325
line 959
;957:	}
;958:
;959:	if (self->setTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $328
line 960
;960:	{
line 961
;961:		overcharge = qfalse;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 963
;962:
;963:		if (!self->s.loopSound)
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 0
NEI4 $331
line 964
;964:		{
line 965
;965:			self->s.loopSound = G_SoundIndex("sound/player/pickupshield.wav");
ADDRGP4 $333
ARGP4
ADDRLP4 36
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 966
;966:		}
LABELV $331
line 968
;967:
;968:		self->setTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 970
;969:
;970:		if (self->count)	// Has it got any power left?
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
EQI4 $335
line 971
;971:		{
line 972
;972:			if (self->count > MAX_AMMO_GIVE)
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 2
LEI4 $337
line 973
;973:			{
line 974
;974:				add = MAX_AMMO_GIVE;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 975
;975:			}
ADDRGP4 $338
JUMPV
LABELV $337
line 976
;976:			else if (self->count<0)
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
GEI4 $339
line 977
;977:			{
line 978
;978:				add = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 979
;979:			}
ADDRGP4 $340
JUMPV
LABELV $339
line 981
;980:			else
;981:			{
line 982
;982:				add = self->count;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ASGNI4
line 983
;983:			}
LABELV $340
LABELV $338
line 985
;984:
;985:			activator->client->ps.ammo[AMMO_BLASTER] += add;
ADDRLP4 36
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 416
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 986
;986:			activator->client->ps.ammo[AMMO_POWERCELL] += add;
ADDRLP4 40
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 420
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 987
;987:			activator->client->ps.ammo[AMMO_METAL_BOLTS] += add;
ADDRLP4 44
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 989
;988:
;989:			self->count -= add;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 990
;990:			stop = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 992
;991:
;992:			self->fly_sound_debounce_time = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 994
;993:
;994:			difBlaster = activator->client->ps.ammo[AMMO_BLASTER] - ammoData[AMMO_BLASTER].max;
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
ADDRGP4 ammoData+8
INDIRI4
SUBI4
ASGNI4
line 995
;995:			difPowerCell = activator->client->ps.ammo[AMMO_POWERCELL] - ammoData[AMMO_POWERCELL].max;
ADDRLP4 16
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ADDRGP4 ammoData+12
INDIRI4
SUBI4
ASGNI4
line 996
;996:			difMetalBolts = activator->client->ps.ammo[AMMO_METAL_BOLTS] - ammoData[AMMO_METAL_BOLTS].max;
ADDRLP4 20
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ADDRGP4 ammoData+16
INDIRI4
SUBI4
ASGNI4
line 999
;997:
;998:			// Find the highest one
;999:			highest = difBlaster;
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 1000
;1000:			if (difPowerCell>difBlaster)
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $345
line 1001
;1001:			{
line 1002
;1002:				highest = difPowerCell;
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 1003
;1003:			}
LABELV $345
line 1005
;1004:
;1005:			if (difMetalBolts > highest)
ADDRLP4 20
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $347
line 1006
;1006:			{
line 1007
;1007:				highest = difMetalBolts;
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 1008
;1008:			}
LABELV $347
line 1009
;1009:		}
LABELV $335
line 1010
;1010:	}
LABELV $328
line 1012
;1011:
;1012:	if (stop)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $349
line 1013
;1013:	{
line 1014
;1014:		self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 1015
;1015:	}
LABELV $349
line 1016
;1016:}
LABELV $324
endproc ammo_power_converter_use 52 4
export SP_misc_model_ammo_power_converter
proc SP_misc_model_ammo_power_converter 24 8
line 1027
;1017:
;1018:
;1019:/*QUAKED misc_model_ammo_power_converter (1 0 0) (-16 -16 -16) (16 16 16)
;1020:#MODELNAME="models/items/power_converter.md3"
;1021:Gives ammo energy when used.
;1022:
;1023:"count" - the amount of ammo given when used (default 100)
;1024:*/
;1025://------------------------------------------------------------
;1026:void SP_misc_model_ammo_power_converter( gentity_t *ent )
;1027:{
line 1028
;1028:	if (!ent->health)
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
NEI4 $352
line 1029
;1029:	{
line 1030
;1030:		ent->health = 60;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 60
ASGNI4
line 1031
;1031:	}
LABELV $352
line 1033
;1032:
;1033:	VectorSet (ent->r.mins, -16, -16, -16);
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3246391296
ASGNF4
line 1034
;1034:	VectorSet (ent->r.maxs, 16, 16, 16);
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1098907648
ASGNF4
line 1036
;1035:
;1036:	ent->s.modelindex = G_ModelIndex( ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1038
;1037:
;1038:	ent->s.eFlags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 1039
;1039:	ent->r.svFlags |= SVF_PLAYER_USABLE;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1040
;1040:	ent->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1
ASGNI4
line 1041
;1041:	ent->clipmask = MASK_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 1
ASGNI4
line 1043
;1042:
;1043:	ent->use = ammo_power_converter_use;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDRGP4 ammo_power_converter_use
ASGNP4
line 1045
;1044:
;1045:	EnergyAmmoStationSettings(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 EnergyAmmoStationSettings
CALLV
pop
line 1047
;1046:
;1047:	ent->boltpoint4 = ent->count; //initial value
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 780
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ASGNI4
line 1048
;1048:	ent->think = check_recharge;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 check_recharge
ASGNP4
line 1049
;1049:	ent->nextthink = level.time + STATION_RECHARGE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1051
;1050:
;1051:	G_SetOrigin( ent, ent->s.origin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1052
;1052:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1053
;1053:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1055
;1054:
;1055:	G_SoundIndex("sound/movers/objects/useshieldstation.wav");
ADDRGP4 $319
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1056
;1056:}
LABELV $351
endproc SP_misc_model_ammo_power_converter 24 8
export EnergyHealthStationSettings
proc EnergyHealthStationSettings 0 12
line 1064
;1057:
;1058:/*
;1059:================
;1060:EnergyHealthStationSettings
;1061:================
;1062:*/
;1063:void EnergyHealthStationSettings(gentity_t *ent)
;1064:{
line 1065
;1065:	G_SpawnInt( "count", "0", &ent->count );
ADDRGP4 $257
ARGP4
ADDRGP4 $115
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1067
;1066:
;1067:	if (!ent->count)
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
NEI4 $356
line 1068
;1068:	{
line 1069
;1069:		ent->count = 100; 
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 100
ASGNI4
line 1070
;1070:	}
LABELV $356
line 1071
;1071:}
LABELV $355
endproc EnergyHealthStationSettings 0 12
export health_power_converter_use
proc health_power_converter_use 32 4
line 1079
;1072:
;1073:/*
;1074:================
;1075:health_power_converter_use
;1076:================
;1077:*/
;1078:void health_power_converter_use( gentity_t *self, gentity_t *other, gentity_t *activator)
;1079:{
line 1081
;1080:	int dif,add;
;1081:	int stop = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1083
;1082:
;1083:	if (!activator || !activator->client)
ADDRLP4 12
ADDRFP4 8
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
EQU4 $361
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
NEU4 $359
LABELV $361
line 1084
;1084:	{
line 1085
;1085:		return;
ADDRGP4 $358
JUMPV
LABELV $359
line 1088
;1086:	}
;1087:
;1088:	if (self->setTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $362
line 1089
;1089:	{
line 1090
;1090:		if (!self->s.loopSound)
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 0
NEI4 $365
line 1091
;1091:		{
line 1092
;1092:			self->s.loopSound = G_SoundIndex("sound/player/pickuphealth.wav");
ADDRGP4 $367
ARGP4
ADDRLP4 20
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1093
;1093:		}
LABELV $365
line 1094
;1094:		self->setTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1096
;1095:
;1096:		dif = activator->client->ps.stats[STAT_MAX_HEALTH] - activator->health;
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1098
;1097:
;1098:		if (dif > 0)					// Already at full armor?
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $369
line 1099
;1099:		{
line 1100
;1100:			if (dif >MAX_AMMO_GIVE)
ADDRLP4 4
INDIRI4
CNSTI4 2
LEI4 $371
line 1101
;1101:			{
line 1102
;1102:				add = MAX_AMMO_GIVE;
ADDRLP4 8
CNSTI4 2
ASGNI4
line 1103
;1103:			}
ADDRGP4 $372
JUMPV
LABELV $371
line 1105
;1104:			else
;1105:			{
line 1106
;1106:				add = dif;
ADDRLP4 8
ADDRLP4 4
INDIRI4
ASGNI4
line 1107
;1107:			}
LABELV $372
line 1109
;1108:
;1109:			if (self->count<add)
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
GEI4 $373
line 1110
;1110:			{
line 1111
;1111:				add = self->count;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ASGNI4
line 1112
;1112:			}
LABELV $373
line 1114
;1113:
;1114:			self->count -= add;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1115
;1115:			stop = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1117
;1116:
;1117:			self->fly_sound_debounce_time = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 1119
;1118:
;1119:			activator->health += add;
ADDRLP4 28
ADDRFP4 8
INDIRP4
CNSTI4 676
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 1120
;1120:		}
LABELV $369
line 1121
;1121:	}
LABELV $362
line 1123
;1122:
;1123:	if (stop)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $376
line 1124
;1124:	{
line 1125
;1125:		self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 1126
;1126:	}
LABELV $376
line 1127
;1127:}
LABELV $358
endproc health_power_converter_use 32 4
export SP_misc_model_health_power_converter
proc SP_misc_model_health_power_converter 24 8
line 1138
;1128:
;1129:
;1130:/*QUAKED misc_model_health_power_converter (1 0 0) (-16 -16 -16) (16 16 16)
;1131:#MODELNAME="models/items/power_converter.md3"
;1132:Gives ammo energy when used.
;1133:
;1134:"count" - the amount of ammo given when used (default 100)
;1135:*/
;1136://------------------------------------------------------------
;1137:void SP_misc_model_health_power_converter( gentity_t *ent )
;1138:{
line 1139
;1139:	if (!ent->health)
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
NEI4 $379
line 1140
;1140:	{
line 1141
;1141:		ent->health = 60;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 60
ASGNI4
line 1142
;1142:	}
LABELV $379
line 1144
;1143:
;1144:	VectorSet (ent->r.mins, -16, -16, -16);
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3246391296
ASGNF4
line 1145
;1145:	VectorSet (ent->r.maxs, 16, 16, 16);
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1098907648
ASGNF4
line 1147
;1146:
;1147:	ent->s.modelindex = G_ModelIndex( ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1149
;1148:
;1149:	ent->s.eFlags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 1150
;1150:	ent->r.svFlags |= SVF_PLAYER_USABLE;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1151
;1151:	ent->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1
ASGNI4
line 1152
;1152:	ent->clipmask = MASK_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 1
ASGNI4
line 1154
;1153:
;1154:	ent->use = health_power_converter_use;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDRGP4 health_power_converter_use
ASGNP4
line 1156
;1155:
;1156:	EnergyHealthStationSettings(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 EnergyHealthStationSettings
CALLV
pop
line 1158
;1157:
;1158:	ent->boltpoint4 = ent->count; //initial value
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 780
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ASGNI4
line 1159
;1159:	ent->think = check_recharge;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 check_recharge
ASGNP4
line 1160
;1160:	ent->nextthink = level.time + STATION_RECHARGE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1162
;1161:
;1162:	G_SetOrigin( ent, ent->s.origin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1163
;1163:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1164
;1164:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1166
;1165:
;1166:	G_SoundIndex("sound/movers/objects/useshieldstation.wav");
ADDRGP4 $319
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1167
;1167:}
LABELV $378
endproc SP_misc_model_health_power_converter 24 8
export DmgBoxHit
proc DmgBoxHit 0 0
line 1170
;1168:
;1169:void DmgBoxHit( gentity_t *self, gentity_t *other, trace_t *trace )
;1170:{
line 1171
;1171:	return;
LABELV $382
endproc DmgBoxHit 0 0
export DmgBoxUpdateSelf
proc DmgBoxUpdateSelf 24 4
line 1175
;1172:}
;1173:
;1174:void DmgBoxUpdateSelf(gentity_t *self)
;1175:{
line 1176
;1176:	gentity_t *owner = &g_entities[self->r.ownerNum];
ADDRLP4 0
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1178
;1177:
;1178:	if (!owner || !owner->client || !owner->inuse)
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $387
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $387
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $384
LABELV $387
line 1179
;1179:	{
line 1180
;1180:		goto killMe;
ADDRGP4 $388
JUMPV
LABELV $384
line 1183
;1181:	}
;1182:
;1183:	if (self->damageRedirect == DAMAGEREDIRECT_HEAD &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
CNSTI4 1
NEI4 $389
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1824
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
INDIRI4
EQI4 $389
line 1185
;1184:		owner->client->damageBoxHandle_Head != self->s.number)
;1185:	{
line 1186
;1186:		goto killMe;
ADDRGP4 $388
JUMPV
LABELV $389
line 1189
;1187:	}
;1188:
;1189:	if (self->damageRedirect == DAMAGEREDIRECT_RLEG &&
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
CNSTI4 2
NEI4 $391
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
INDIRI4
EQI4 $391
line 1191
;1190:		owner->client->damageBoxHandle_RLeg != self->s.number)
;1191:	{
line 1192
;1192:		goto killMe;
ADDRGP4 $388
JUMPV
LABELV $391
line 1195
;1193:	}
;1194:
;1195:	if (self->damageRedirect == DAMAGEREDIRECT_LLEG &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
CNSTI4 3
NEI4 $393
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1832
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
INDIRI4
EQI4 $393
line 1197
;1196:		owner->client->damageBoxHandle_LLeg != self->s.number)
;1197:	{
line 1198
;1198:		goto killMe;
ADDRGP4 $388
JUMPV
LABELV $393
line 1201
;1199:	}
;1200:
;1201:	if (owner->health < 1)
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $395
line 1202
;1202:	{
line 1203
;1203:		goto killMe;
ADDRGP4 $388
JUMPV
LABELV $395
line 1208
;1204:	}
;1205:
;1206:	//G_TestLine(self->r.currentOrigin, owner->client->ps.origin, 0x0000ff, 100);
;1207:
;1208:	trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1210
;1209:
;1210:	self->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1211
;1211:	return;
ADDRGP4 $383
JUMPV
LABELV $388
line 1214
;1212:
;1213:killMe:
;1214:	self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1215
;1215:	self->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1216
;1216:}
LABELV $383
endproc DmgBoxUpdateSelf 24 4
export DmgBoxAbsorb_Die
proc DmgBoxAbsorb_Die 0 0
line 1219
;1217:
;1218:void DmgBoxAbsorb_Die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod )
;1219:{
line 1220
;1220:	self->health = 1;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 1
ASGNI4
line 1221
;1221:}
LABELV $399
endproc DmgBoxAbsorb_Die 0 0
export DmgBoxAbsorb_Pain
proc DmgBoxAbsorb_Pain 0 0
line 1224
;1222:
;1223:void DmgBoxAbsorb_Pain(gentity_t *self, gentity_t *attacker, int damage)
;1224:{
line 1225
;1225:	self->health = 1;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 1
ASGNI4
line 1226
;1226:}
LABELV $400
endproc DmgBoxAbsorb_Pain 0 0
export CreateNewDamageBox
proc CreateNewDamageBox 16 0
line 1229
;1227:
;1228:gentity_t *CreateNewDamageBox( gentity_t *ent )
;1229:{
line 1234
;1230:	gentity_t *dmgBox;
;1231:
;1232:	//We do not want the client to have any real knowledge of the entity whatsoever. It will only
;1233:	//ever be used on the server.
;1234:	dmgBox = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1235
;1235:	dmgBox->classname = "dmg_box";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $402
ASGNP4
line 1237
;1236:			
;1237:	dmgBox->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 1238
;1238:	dmgBox->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1240
;1239:
;1240:	dmgBox->clipmask = 0;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 0
ASGNI4
line 1241
;1241:	dmgBox->r.contents = MASK_PLAYERSOLID;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 273
ASGNI4
line 1243
;1242:
;1243:	dmgBox->mass = 5000;
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
CNSTF4 1167867904
ASGNF4
line 1245
;1244:
;1245:	dmgBox->s.eFlags |= EF_NODRAW;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 1246
;1246:	dmgBox->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1248
;1247:
;1248:	dmgBox->touch = DmgBoxHit;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 DmgBoxHit
ASGNP4
line 1250
;1249:
;1250:	dmgBox->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 1252
;1251:
;1252:	dmgBox->health = 1;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 1
ASGNI4
line 1254
;1253:
;1254:	dmgBox->pain = DmgBoxAbsorb_Pain;
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 DmgBoxAbsorb_Pain
ASGNP4
line 1255
;1255:	dmgBox->die = DmgBoxAbsorb_Die;
ADDRLP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRGP4 DmgBoxAbsorb_Die
ASGNP4
line 1257
;1256:
;1257:	dmgBox->think = DmgBoxUpdateSelf;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 DmgBoxUpdateSelf
ASGNP4
line 1258
;1258:	dmgBox->nextthink = level.time + 50;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 1260
;1259:
;1260:	return dmgBox;
ADDRLP4 0
INDIRP4
RETP4
LABELV $401
endproc CreateNewDamageBox 16 0
export ATST_ManageDamageBoxes
proc ATST_ManageDamageBoxes 92 16
line 1264
;1261:}
;1262:
;1263:void ATST_ManageDamageBoxes(gentity_t *ent)
;1264:{
line 1268
;1265:	vec3_t headOrg, lLegOrg, rLegOrg;
;1266:	vec3_t fwd, right, up, flatAngle;
;1267:
;1268:	if (!ent->client->damageBoxHandle_Head)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1824
ADDP4
INDIRI4
CNSTI4 0
NEI4 $405
line 1269
;1269:	{
line 1270
;1270:		gentity_t *dmgBox = CreateNewDamageBox(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 CreateNewDamageBox
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 88
INDIRP4
ASGNP4
line 1272
;1271:
;1272:		if (dmgBox)
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $407
line 1273
;1273:		{
line 1274
;1274:			VectorSet( dmgBox->r.mins, ATST_MINS0, ATST_MINS1, ATST_MINS2 );
ADDRLP4 84
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3256877056
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3256877056
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3250585600
ASGNF4
line 1275
;1275:			VectorSet( dmgBox->r.maxs, ATST_MAXS0, ATST_MAXS1, ATST_HEADSIZE );
ADDRLP4 84
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1109393408
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1109393408
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1119092736
ASGNF4
line 1277
;1276:
;1277:			ent->client->damageBoxHandle_Head = dmgBox->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1824
ADDP4
ADDRLP4 84
INDIRP4
INDIRI4
ASGNI4
line 1278
;1278:			dmgBox->damageRedirect = DAMAGEREDIRECT_HEAD;
ADDRLP4 84
INDIRP4
CNSTI4 828
ADDP4
CNSTI4 1
ASGNI4
line 1279
;1279:			dmgBox->damageRedirectTo = ent->s.number;
ADDRLP4 84
INDIRP4
CNSTI4 832
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1280
;1280:		}
LABELV $407
line 1281
;1281:	}
LABELV $405
line 1282
;1282:	if (!ent->client->damageBoxHandle_RLeg)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
CNSTI4 0
NEI4 $409
line 1283
;1283:	{
line 1284
;1284:		gentity_t *dmgBox = CreateNewDamageBox(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 CreateNewDamageBox
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 88
INDIRP4
ASGNP4
line 1286
;1285:
;1286:		if (dmgBox)
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $411
line 1287
;1287:		{
line 1288
;1288:			VectorSet( dmgBox->r.mins, ATST_MINS0/4, ATST_MINS1/4, ATST_MINS2 );
ADDRLP4 84
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3250585600
ASGNF4
line 1289
;1289:			VectorSet( dmgBox->r.maxs, ATST_MAXS0/4, ATST_MAXS1/4, ATST_MAXS2-ATST_HEADSIZE );
ADDRLP4 84
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1126039552
ASGNF4
line 1291
;1290:
;1291:			ent->client->damageBoxHandle_RLeg = dmgBox->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1828
ADDP4
ADDRLP4 84
INDIRP4
INDIRI4
ASGNI4
line 1292
;1292:			dmgBox->damageRedirect = DAMAGEREDIRECT_RLEG;
ADDRLP4 84
INDIRP4
CNSTI4 828
ADDP4
CNSTI4 2
ASGNI4
line 1293
;1293:			dmgBox->damageRedirectTo = ent->s.number;
ADDRLP4 84
INDIRP4
CNSTI4 832
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1294
;1294:		}
LABELV $411
line 1295
;1295:	}
LABELV $409
line 1296
;1296:	if (!ent->client->damageBoxHandle_LLeg)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1832
ADDP4
INDIRI4
CNSTI4 0
NEI4 $413
line 1297
;1297:	{
line 1298
;1298:		gentity_t *dmgBox = CreateNewDamageBox(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 CreateNewDamageBox
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 88
INDIRP4
ASGNP4
line 1300
;1299:
;1300:		if (dmgBox)
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $415
line 1301
;1301:		{
line 1302
;1302:			VectorSet( dmgBox->r.mins, ATST_MINS0/4, ATST_MINS1/4, ATST_MINS2 );
ADDRLP4 84
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3250585600
ASGNF4
line 1303
;1303:			VectorSet( dmgBox->r.maxs, ATST_MAXS0/4, ATST_MAXS1/4, ATST_MAXS2-ATST_HEADSIZE );
ADDRLP4 84
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1126039552
ASGNF4
line 1305
;1304:
;1305:			ent->client->damageBoxHandle_LLeg = dmgBox->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1832
ADDP4
ADDRLP4 84
INDIRP4
INDIRI4
ASGNI4
line 1306
;1306:			dmgBox->damageRedirect = DAMAGEREDIRECT_LLEG;
ADDRLP4 84
INDIRP4
CNSTI4 828
ADDP4
CNSTI4 3
ASGNI4
line 1307
;1307:			dmgBox->damageRedirectTo = ent->s.number;
ADDRLP4 84
INDIRP4
CNSTI4 832
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1308
;1308:		}
LABELV $415
line 1309
;1309:	}
LABELV $413
line 1311
;1310:
;1311:	if (!ent->client->damageBoxHandle_Head ||
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRLP4 84
INDIRP4
CNSTI4 1824
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $420
ADDRLP4 84
INDIRP4
CNSTI4 1832
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $420
ADDRLP4 84
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
NEI4 $417
LABELV $420
line 1314
;1312:		!ent->client->damageBoxHandle_LLeg ||
;1313:		!ent->client->damageBoxHandle_RLeg)
;1314:	{
line 1315
;1315:		return;
ADDRGP4 $404
JUMPV
LABELV $417
line 1318
;1316:	}
;1317:
;1318:	VectorCopy(ent->client->ps.origin, headOrg);
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1319
;1319:	headOrg[2] += (ATST_MAXS2-ATST_HEADSIZE);
ADDRLP4 48+8
ADDRLP4 48+8
INDIRF4
CNSTF4 1126039552
ADDF4
ASGNF4
line 1321
;1320:
;1321:	VectorCopy(ent->client->ps.viewangles, flatAngle);
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 1322
;1322:	flatAngle[PITCH] = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
line 1323
;1323:	flatAngle[ROLL] = 0;
ADDRLP4 36+8
CNSTF4 0
ASGNF4
line 1325
;1324:
;1325:	AngleVectors(flatAngle, fwd, right, up);
ADDRLP4 36
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 72
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1327
;1326:
;1327:	VectorCopy(ent->client->ps.origin, lLegOrg);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1328
;1328:	VectorCopy(ent->client->ps.origin, rLegOrg);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1330
;1329:
;1330:	lLegOrg[0] -= right[0]*32;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1107296256
ADDRLP4 0
INDIRF4
MULF4
SUBF4
ASGNF4
line 1331
;1331:	lLegOrg[1] -= right[1]*32;
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1107296256
ADDRLP4 0+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 1332
;1332:	lLegOrg[2] -= right[2]*32;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1107296256
ADDRLP4 0+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 1334
;1333:
;1334:	rLegOrg[0] += right[0]*32;
ADDRLP4 24
ADDRLP4 24
INDIRF4
CNSTF4 1107296256
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 1335
;1335:	rLegOrg[1] += right[1]*32;
ADDRLP4 24+4
ADDRLP4 24+4
INDIRF4
CNSTF4 1107296256
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1336
;1336:	rLegOrg[2] += right[2]*32;
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1107296256
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1338
;1337:
;1338:	G_SetOrigin(&g_entities[ent->client->damageBoxHandle_Head], headOrg);
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1824
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1339
;1339:	G_SetOrigin(&g_entities[ent->client->damageBoxHandle_LLeg], lLegOrg);
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1832
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1340
;1340:	G_SetOrigin(&g_entities[ent->client->damageBoxHandle_RLeg], rLegOrg);
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1828
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1341
;1341:}
LABELV $404
endproc ATST_ManageDamageBoxes 92 16
export G_PlayerBecomeATST
proc G_PlayerBecomeATST 8 0
line 1344
;1342:
;1343:int G_PlayerBecomeATST(gentity_t *ent)
;1344:{
line 1345
;1345:	if (!ent || !ent->client)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $434
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $432
LABELV $434
line 1346
;1346:	{
line 1347
;1347:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $432
line 1350
;1348:	}
;1349:
;1350:	if (ent->client->ps.weaponTime > 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $435
line 1351
;1351:	{
line 1352
;1352:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $435
line 1355
;1353:	}
;1354:
;1355:	if (ent->client->ps.forceHandExtend != HANDEXTEND_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $437
line 1356
;1356:	{
line 1357
;1357:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $437
line 1360
;1358:	}
;1359:
;1360:	if (ent->client->ps.zoomMode)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $439
line 1361
;1361:	{
line 1362
;1362:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $431
JUMPV
LABELV $439
line 1365
;1363:	}
;1364:
;1365:	if (ent->client->ps.usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $441
line 1366
;1366:	{
line 1367
;1367:		ent->client->ps.usingATST = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
CNSTI4 0
ASGNI4
line 1368
;1368:		ent->client->ps.forceHandExtend = HANDEXTEND_WEAPONREADY;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 6
ASGNI4
line 1369
;1369:	}
ADDRGP4 $442
JUMPV
LABELV $441
line 1371
;1370:	else
;1371:	{
line 1372
;1372:		ent->client->ps.usingATST = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
CNSTI4 1
ASGNI4
line 1373
;1373:	}
LABELV $442
line 1375
;1374:
;1375:	ent->client->ps.weaponTime = 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 1000
ASGNI4
line 1377
;1376:
;1377:	return 1;
CNSTI4 1
RETI4
LABELV $431
endproc G_PlayerBecomeATST 8 0
export fx_runner_think
proc fx_runner_think 16 12
line 1397
;1378:}
;1379:
;1380:/*QUAKED fx_runner (0 0 1) (-8 -8 -8) (8 8 8) STARTOFF ONESHOT
;1381:	STARTOFF - effect starts off, toggles on/off when used
;1382:	ONESHOT - effect fires only when used
;1383:
;1384:    "angles"   - 3-float vector, angle the effect should play (unless fxTarget is supplied)
;1385:	"fxFile"   - name of the effect file to play
;1386:	"fxTarget" - aim the effect toward this object, otherwise defaults to up
;1387:	"target"   - uses its target when the fx gets triggered
;1388:	"delay"    - how often to call the effect, don't over-do this ( default 400 )
;1389:			     note that it has to send an event each time it plays, so don't kill bandwidth or I will cry
;1390:	"random"   - random amount of time to add to delay, ( default 0, 200 = 0ms to 200ms )
;1391:*/
;1392:#define FX_RUNNER_RESERVED 0x800000
;1393:#define FX_ENT_RADIUS 8 //32
;1394:
;1395://----------------------------------------------------------
;1396:void fx_runner_think( gentity_t *ent )
;1397:{
line 1399
;1398:	// call the effect with the desired position and orientation
;1399:	G_AddEvent( ent, EV_PLAY_EFFECT_ID, ent->bolt_Head );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1401
;1400:
;1401:	ent->nextthink = level.time + ent->delay + random() * ent->random;
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDI4
CVIF4 4
ADDRLP4 4
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1403
;1402:
;1403:	if ( ent->target )
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $445
line 1404
;1404:	{
line 1406
;1405:		// let our target know that we have spawned an effect
;1406:		G_UseTargets( ent, ent );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1407
;1407:	}
LABELV $445
line 1408
;1408:}
LABELV $443
endproc fx_runner_think 16 12
export fx_runner_use
proc fx_runner_use 4 8
line 1412
;1409:
;1410://----------------------------------------------------------
;1411:void fx_runner_use( gentity_t *self, gentity_t *other, gentity_t *activator )
;1412:{
line 1413
;1413:	if ( self->spawnflags & 2 ) // ONESHOT
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $448
line 1414
;1414:	{
line 1417
;1415:		// call the effect with the desired position and orientation, as a safety thing,
;1416:		//	make sure we aren't thinking at all.
;1417:		fx_runner_think( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 fx_runner_think
CALLV
pop
line 1418
;1418:		self->nextthink = -1;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 -1
ASGNI4
line 1420
;1419:
;1420:		if ( self->target )
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $449
line 1421
;1421:		{
line 1423
;1422:			// let our target know that we have spawned an effect
;1423:			G_UseTargets( self, self );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1424
;1424:		}
line 1425
;1425:	}
ADDRGP4 $449
JUMPV
LABELV $448
line 1427
;1426:	else
;1427:	{
line 1429
;1428:		// ensure we are working with the right think function
;1429:		self->think = fx_runner_think;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 fx_runner_think
ASGNP4
line 1432
;1430:
;1431:		// toggle our state
;1432:		if ( self->nextthink == -1 )
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $452
line 1433
;1433:		{
line 1436
;1434:			// NOTE: we fire the effect immediately on use, the fx_runner_think func will set
;1435:			//	up the nextthink time.
;1436:			fx_runner_think( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 fx_runner_think
CALLV
pop
line 1437
;1437:		}
ADDRGP4 $453
JUMPV
LABELV $452
line 1439
;1438:		else
;1439:		{
line 1441
;1440:			// turn off for now
;1441:			self->nextthink = -1;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 -1
ASGNI4
line 1442
;1442:		}
LABELV $453
line 1443
;1443:	}
LABELV $449
line 1444
;1444:}
LABELV $447
endproc fx_runner_use 4 8
export fx_runner_link
proc fx_runner_link 44 12
line 1448
;1445:
;1446://----------------------------------------------------------
;1447:void fx_runner_link( gentity_t *ent )
;1448:{
line 1451
;1449:	vec3_t	dir;
;1450:
;1451:	if ( ent->roffname && ent->roffname[0] )
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $455
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $455
line 1452
;1452:	{
line 1454
;1453:		// try to use the target to override the orientation
;1454:		gentity_t	*target = NULL;
ADDRLP4 16
CNSTP4 0
ASGNP4
line 1456
;1455:
;1456:		target = G_Find( target, FOFS(targetname), ent->roffname );
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 588
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
ASGNP4
line 1458
;1457:
;1458:		if ( !target )
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $457
line 1459
;1459:		{
line 1461
;1460:			// Bah, no good, dump a warning, but continue on and use the UP vector
;1461:			Com_Printf( "fx_runner_link: target specified but not found: %s\n", ent->roffname );
ADDRGP4 $459
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1462
;1462:			Com_Printf( "  -assuming UP orientation.\n" );
ADDRGP4 $460
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1463
;1463:		}
ADDRGP4 $458
JUMPV
LABELV $457
line 1465
;1464:		else
;1465:		{
line 1467
;1466:			// Our target is valid so let's override the default UP vector
;1467:			VectorSubtract( target->s.origin, ent->s.origin, dir );
ADDRLP4 28
CNSTI4 92
ASGNI4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
CNSTI4 96
ASGNI4
ADDRLP4 0+4
ADDRLP4 16
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
CNSTI4 100
ASGNI4
ADDRLP4 0+8
ADDRLP4 16
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1468
;1468:			VectorNormalize( dir );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1469
;1469:			vectoangles( dir, ent->s.angles );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1470
;1470:		}
LABELV $458
line 1471
;1471:	}
LABELV $455
line 1474
;1472:
;1473:	// don't really do anything with this right now other than do a check to warn the designers if the target is bogus
;1474:	if ( ent->target )
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $463
line 1475
;1475:	{
line 1476
;1476:		gentity_t	*target = NULL;
ADDRLP4 16
CNSTP4 0
ASGNP4
line 1478
;1477:
;1478:		target = G_Find( target, FOFS(targetname), ent->target );
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 588
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
ASGNP4
line 1480
;1479:
;1480:		if ( !target )
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $465
line 1481
;1481:		{
line 1483
;1482:			// Target is bogus, but we can still continue
;1483:			Com_Printf( "fx_runner_link: target was specified but is not valid: %s\n", ent->target );
ADDRGP4 $467
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1484
;1484:		}
LABELV $465
line 1485
;1485:	}
LABELV $463
line 1487
;1486:
;1487:	G_SetAngles( ent, ent->s.angles );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 G_SetAngles
CALLV
pop
line 1489
;1488:
;1489:	if ( ent->spawnflags & 1 || ent->spawnflags & 2 ) // STARTOFF || ONESHOT
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 24
INDIRI4
NEI4 $470
ADDRLP4 20
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 24
INDIRI4
EQI4 $468
LABELV $470
line 1490
;1490:	{
line 1492
;1491:		// We won't even consider thinking until we are used
;1492:		ent->nextthink = -1;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 -1
ASGNI4
line 1493
;1493:	}
ADDRGP4 $469
JUMPV
LABELV $468
line 1495
;1494:	else
;1495:	{
line 1497
;1496:		// Let's get to work right now!
;1497:		ent->think = fx_runner_think;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 fx_runner_think
ASGNP4
line 1498
;1498:		ent->nextthink = level.time + 100; // wait a small bit, then start working
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1499
;1499:	}
LABELV $469
line 1500
;1500:}
LABELV $454
endproc fx_runner_link 44 12
export SP_fx_runner
proc SP_fx_runner 36 12
line 1504
;1501:
;1502://----------------------------------------------------------
;1503:void SP_fx_runner( gentity_t *ent )
;1504:{
line 1508
;1505:	char		*fxFile;
;1506:
;1507:	// Get our defaults
;1508:	G_SpawnInt( "delay", "400", &ent->delay );
ADDRGP4 $473
ARGP4
ADDRGP4 $474
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1509
;1509:	G_SpawnFloat( "random", "0", &ent->random );
ADDRGP4 $475
ARGP4
ADDRGP4 $115
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1511
;1510:
;1511:	if (!ent->s.angles[0] && !ent->s.angles[1] && !ent->s.angles[2])
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $476
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $476
ADDRLP4 4
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $476
line 1512
;1512:	{
line 1514
;1513:		// didn't have angles, so give us the default of up
;1514:		VectorSet( ent->s.angles, -90, 0, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 3266576384
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 0
ASGNF4
line 1515
;1515:	}
LABELV $476
line 1518
;1516:
;1517:	// make us useable if we can be targeted
;1518:	if ( ent->targetname )
ADDRFP4 0
INDIRP4
CNSTI4 588
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $478
line 1519
;1519:	{
line 1520
;1520:		ent->use = fx_runner_use;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDRGP4 fx_runner_use
ASGNP4
line 1521
;1521:	}
LABELV $478
line 1523
;1522:
;1523:	G_SpawnString( "fxFile", "", &fxFile );
ADDRGP4 $480
ARGP4
ADDRGP4 $481
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1525
;1524:
;1525:	G_SpawnString( "fxTarget", "", &ent->roffname );
ADDRGP4 $482
ARGP4
ADDRGP4 $481
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1527
;1526:
;1527:	if ( !fxFile || !fxFile[0] )
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $485
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $483
LABELV $485
line 1528
;1528:	{
line 1529
;1529:		Com_Printf( S_COLOR_RED"ERROR: fx_runner %s at %s has no fxFile specified\n", ent->targetname, vtos(ent->s.origin) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $486
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 588
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1530
;1530:		G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1531
;1531:		return;
ADDRGP4 $472
JUMPV
LABELV $483
line 1536
;1532:	}
;1533:
;1534:	// Try and associate an effect file, unfortunately we won't know if this worked or not 
;1535:	//	until the CGAME trys to register it...
;1536:	ent->bolt_Head = G_EffectIndex( fxFile );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_EffectIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1540
;1537:	//It is dirty, yes. But no one likes adding things to the entity structure.
;1538:
;1539:	// Give us a bit of time to spawn in the other entities, since we may have to target one of 'em
;1540:	ent->think = fx_runner_link; 
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 fx_runner_link
ASGNP4
line 1541
;1541:	ent->nextthink = level.time + 300;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 1544
;1542:
;1543:	// Save our position and link us up!
;1544:	G_SetOrigin( ent, ent->s.origin );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1546
;1545:
;1546:	VectorSet( ent->r.maxs, FX_ENT_RADIUS, FX_ENT_RADIUS, FX_ENT_RADIUS );
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1090519040
ASGNF4
line 1547
;1547:	VectorScale( ent->r.maxs, -1, ent->r.mins );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3212836864
ADDRLP4 24
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3212836864
ADDRLP4 28
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3212836864
ADDRLP4 32
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ASGNF4
line 1549
;1548:
;1549:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1550
;1550:}
LABELV $472
endproc SP_fx_runner 36 12
data
export gAnimEntTypes
align 4
LABELV gAnimEntTypes
byte 4 0
export animEntRoot
align 4
LABELV animEntRoot
byte 4 0
export ExampleAnimEntCustomData
code
proc ExampleAnimEntCustomData 8 0
line 1609
;1551:
;1552://rww - here starts the main example g2animent stuff
;1553:#define ANIMENT_TYPE_STORMTROOPER			0
;1554:#define ANIMENT_TYPE_RODIAN					1
;1555:#define ANIMENT_TYPE_JAN					2
;1556:#define ANIMENT_TYPE_CUSTOM					3
;1557:#define	MAX_ANIMENTS						4
;1558:
;1559:#define TROOPER_PAIN_SOUNDS 4
;1560:#define TROOPER_DEATH_SOUNDS 3
;1561:#define TROOPER_ALERT_SOUNDS 5
;1562:int gTrooperSound_Pain[TROOPER_PAIN_SOUNDS];
;1563:int gTrooperSound_Death[TROOPER_DEATH_SOUNDS];
;1564:int gTrooperSound_Alert[TROOPER_ALERT_SOUNDS];
;1565:
;1566:#define RODIAN_PAIN_SOUNDS 4
;1567:#define RODIAN_DEATH_SOUNDS 3
;1568:#define RODIAN_ALERT_SOUNDS 5
;1569:int gRodianSound_Pain[RODIAN_PAIN_SOUNDS];
;1570:int gRodianSound_Death[RODIAN_DEATH_SOUNDS];
;1571:int gRodianSound_Alert[RODIAN_ALERT_SOUNDS];
;1572:
;1573:#define JAN_PAIN_SOUNDS 4
;1574:#define JAN_DEATH_SOUNDS 3
;1575:#define JAN_ALERT_SOUNDS 5
;1576:int gJanSound_Pain[JAN_PAIN_SOUNDS];
;1577:int gJanSound_Death[JAN_DEATH_SOUNDS];
;1578:int gJanSound_Alert[JAN_ALERT_SOUNDS];
;1579:
;1580:int G_PickDeathAnim( gentity_t *self, vec3_t point, int damage, int mod, int hitLoc );
;1581:void AnimEntFireWeapon( gentity_t *ent, qboolean altFire );
;1582:int GetNearestVisibleWP(vec3_t org, int ignore);
;1583:int InFieldOfVision(vec3_t viewangles, float fov, vec3_t angles);
;1584:extern float gBotEdit;
;1585:
;1586:#define ANIMENT_ALIGNED_UNKNOWN		0
;1587:#define ANIMENT_ALIGNED_BAD			1
;1588:#define ANIMENT_ALIGNED_GOOD		2
;1589:
;1590:#define ANIMENT_CUSTOMSOUND_PAIN	0
;1591:#define ANIMENT_CUSTOMSOUND_DEATH	1
;1592:#define ANIMENT_CUSTOMSOUND_ALERT	2
;1593:
;1594:int gAnimEntTypes = 0;
;1595:
;1596:typedef struct animentCustomInfo_s
;1597:{
;1598:	int							aeAlignment;
;1599:	int							aeIndex;
;1600:	int							aeWeapon;
;1601:	char						*modelPath;
;1602:	char						*soundPath;
;1603:	void						*next;
;1604:} animentCustomInfo_t;
;1605:
;1606:animentCustomInfo_t *animEntRoot = NULL;
;1607:
;1608:animentCustomInfo_t *ExampleAnimEntCustomData(gentity_t *self)
;1609:{
line 1610
;1610:	animentCustomInfo_t *iter = animEntRoot;
ADDRLP4 0
ADDRGP4 animEntRoot
INDIRP4
ASGNP4
line 1611
;1611:	int safetyCheck = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $490
JUMPV
LABELV $489
line 1614
;1612:
;1613:	while (iter && safetyCheck < 30000)
;1614:	{
line 1615
;1615:		if (iter->aeIndex == self->waterlevel)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
NEI4 $492
line 1616
;1616:		{
line 1617
;1617:			return iter;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $488
JUMPV
LABELV $492
line 1620
;1618:		}
;1619:
;1620:		iter = iter->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRP4
ASGNP4
line 1621
;1621:		safetyCheck++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1622
;1622:	}
LABELV $490
line 1613
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $494
ADDRLP4 4
INDIRI4
CNSTI4 30000
LTI4 $489
LABELV $494
line 1624
;1623:
;1624:	return NULL;
CNSTP4 0
RETP4
LABELV $488
endproc ExampleAnimEntCustomData 8 0
export ExampleAnimEntCustomDataExists
proc ExampleAnimEntCustomDataExists 20 8
line 1629
;1625:}
;1626:
;1627:animentCustomInfo_t *ExampleAnimEntCustomDataExists(gentity_t *self, int alignment, int weapon, char *modelname,
;1628:												   char *soundpath)
;1629:{
line 1630
;1630:	animentCustomInfo_t *iter = animEntRoot;
ADDRLP4 0
ADDRGP4 animEntRoot
INDIRP4
ASGNP4
line 1631
;1631:	int safetyCheck = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $497
JUMPV
LABELV $496
line 1634
;1632:
;1633:	while (iter && safetyCheck < 30000)
;1634:	{
line 1635
;1635:		if (iter->aeAlignment == alignment &&
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $499
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $499
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $499
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $499
line 1639
;1636:			iter->aeWeapon == weapon &&
;1637:			!Q_stricmp(iter->modelPath, modelname) &&
;1638:			!Q_stricmp(iter->soundPath, soundpath))
;1639:		{
line 1640
;1640:			return iter;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $495
JUMPV
LABELV $499
line 1643
;1641:		}
;1642:
;1643:		iter = iter->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRP4
ASGNP4
line 1644
;1644:		safetyCheck++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1645
;1645:	}
LABELV $497
line 1633
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $501
ADDRLP4 4
INDIRI4
CNSTI4 30000
LTI4 $496
LABELV $501
line 1647
;1646:
;1647:	return NULL;
CNSTP4 0
RETP4
LABELV $495
endproc ExampleAnimEntCustomDataExists 20 8
export ExampleAnimEntCustomDataEntry
proc ExampleAnimEntCustomDataEntry 56 20
line 1651
;1648:}
;1649:
;1650:void ExampleAnimEntCustomDataEntry(gentity_t *self, int alignment, int weapon, char *modelname, char *soundpath)
;1651:{
line 1652
;1652:	animentCustomInfo_t *find = ExampleAnimEntCustomDataExists(self, alignment, weapon, modelname, soundpath);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 ExampleAnimEntCustomDataExists
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 1653
;1653:	animentCustomInfo_t *lastValid = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 1654
;1654:	int safetyCheck = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1656
;1655:
;1656:	if (find)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $503
line 1657
;1657:	{ //data for this guy already exists. Set our waterlevel (aeIndex) to use this.
line 1658
;1658:		self->waterlevel = find->aeIndex;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1659
;1659:		return;
ADDRGP4 $502
JUMPV
LABELV $503
line 1662
;1660:	}
;1661:
;1662:	find = animEntRoot;
ADDRLP4 0
ADDRGP4 animEntRoot
INDIRP4
ASGNP4
ADDRGP4 $506
JUMPV
LABELV $505
line 1665
;1663:
;1664:	while (find && safetyCheck < 30000)
;1665:	{ //find the next null pointer
line 1666
;1666:		lastValid = find;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
line 1667
;1667:		find = find->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRP4
ASGNP4
line 1668
;1668:		safetyCheck++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1669
;1669:	}
LABELV $506
line 1664
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $508
ADDRLP4 4
INDIRI4
CNSTI4 30000
LTI4 $505
LABELV $508
line 1671
;1670:
;1671:	if (!find)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $509
line 1672
;1672:	{
line 1673
;1673:		find = BG_Alloc(sizeof(animentCustomInfo_t));
CNSTI4 24
ARGI4
ADDRLP4 16
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 1675
;1674:
;1675:		if (!find)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $511
line 1676
;1676:		{ //careful not to exceed the BG_Alloc limit!
line 1677
;1677:			return;
ADDRGP4 $502
JUMPV
LABELV $511
line 1680
;1678:		}
;1679:
;1680:		find->aeAlignment = alignment;
ADDRLP4 0
INDIRP4
ADDRFP4 4
INDIRI4
ASGNI4
line 1681
;1681:		self->waterlevel = gAnimEntTypes;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ADDRGP4 gAnimEntTypes
INDIRI4
ASGNI4
line 1682
;1682:		find->aeIndex = self->waterlevel;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ASGNI4
line 1683
;1683:		find->aeWeapon = weapon;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1684
;1684:		find->next = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTP4 0
ASGNP4
line 1686
;1685:
;1686:		find->modelPath = BG_Alloc(strlen(modelname)+1);
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 24
INDIRP4
ASGNP4
line 1687
;1687:		find->soundPath = BG_Alloc(strlen(soundpath)+1);
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 32
INDIRP4
ASGNP4
line 1689
;1688:
;1689:		if (!find->modelPath || !find->soundPath)
ADDRLP4 40
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $515
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
NEU4 $513
LABELV $515
line 1690
;1690:		{
line 1691
;1691:			find->aeIndex = -1;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 -1
ASGNI4
line 1692
;1692:			return;
ADDRGP4 $502
JUMPV
LABELV $513
line 1695
;1693:		}
;1694:
;1695:		strcpy(find->modelPath, modelname);
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1696
;1696:		strcpy(find->soundPath, soundpath);
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1698
;1697:
;1698:		find->modelPath[strlen(modelname)] = 0;
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1699
;1699:		find->soundPath[strlen(modelname)] = 0;
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1701
;1700:
;1701:		if (lastValid)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $516
line 1702
;1702:		{
line 1703
;1703:			lastValid->next = find;
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1704
;1704:		}
LABELV $516
line 1706
;1705:
;1706:		if (!animEntRoot)
ADDRGP4 animEntRoot
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $518
line 1707
;1707:		{
line 1708
;1708:			animEntRoot = find;
ADDRGP4 animEntRoot
ADDRLP4 0
INDIRP4
ASGNP4
line 1709
;1709:		}
LABELV $518
line 1711
;1710:
;1711:		gAnimEntTypes++;
ADDRLP4 52
ADDRGP4 gAnimEntTypes
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1712
;1712:	}
LABELV $509
line 1713
;1713:}
LABELV $502
endproc ExampleAnimEntCustomDataEntry 56 20
export AnimEntCustomSoundPrecache
proc AnimEntCustomSoundPrecache 48 8
line 1716
;1714:
;1715:void AnimEntCustomSoundPrecache(animentCustomInfo_t *aeInfo)
;1716:{
line 1717
;1717:	if (!aeInfo)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $521
line 1718
;1718:	{
line 1719
;1719:		return;
ADDRGP4 $520
JUMPV
LABELV $521
line 1722
;1720:	}
;1721:
;1722:	G_SoundIndex(va("%s/pain25", aeInfo->soundPath));
ADDRGP4 $523
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
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
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1723
;1723:	G_SoundIndex(va("%s/pain50", aeInfo->soundPath));
ADDRGP4 $524
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1724
;1724:	G_SoundIndex(va("%s/pain75", aeInfo->soundPath));
ADDRGP4 $525
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1725
;1725:	G_SoundIndex(va("%s/pain100", aeInfo->soundPath));
ADDRGP4 $526
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1727
;1726:
;1727:	G_SoundIndex(va("%s/death1", aeInfo->soundPath));
ADDRGP4 $527
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
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
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1728
;1728:	G_SoundIndex(va("%s/death2", aeInfo->soundPath));
ADDRGP4 $528
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
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
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1729
;1729:	G_SoundIndex(va("%s/death3", aeInfo->soundPath));
ADDRGP4 $529
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
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
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1731
;1730:
;1731:	G_SoundIndex(va("%s/detected1", aeInfo->soundPath));
ADDRGP4 $530
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
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
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1732
;1732:	G_SoundIndex(va("%s/detected2", aeInfo->soundPath));
ADDRGP4 $531
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1733
;1733:	G_SoundIndex(va("%s/detected3", aeInfo->soundPath));
ADDRGP4 $532
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
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
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1734
;1734:	G_SoundIndex(va("%s/detected4", aeInfo->soundPath));
ADDRGP4 $533
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
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
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1735
;1735:	G_SoundIndex(va("%s/detected5", aeInfo->soundPath));
ADDRGP4 $534
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1736
;1736:}
LABELV $520
endproc AnimEntCustomSoundPrecache 48 8
export ExampleAnimEntCustomSound
proc ExampleAnimEntCustomSound 116 12
line 1739
;1737:
;1738:void ExampleAnimEntCustomSound(gentity_t *self, int soundType)
;1739:{
line 1740
;1740:	animentCustomInfo_t *aeInfo = ExampleAnimEntCustomData(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 ExampleAnimEntCustomData
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
ASGNP4
line 1742
;1741:	int customSounds[16];
;1742:	int numSounds = 0;
ADDRLP4 68
CNSTI4 0
ASGNI4
line 1744
;1743:
;1744:	if (!aeInfo)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $536
line 1745
;1745:	{
line 1746
;1746:		return;
ADDRGP4 $535
JUMPV
LABELV $536
line 1749
;1747:	}
;1748:
;1749:	if (soundType == ANIMENT_CUSTOMSOUND_PAIN)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $538
line 1750
;1750:	{
line 1751
;1751:		customSounds[0] = G_SoundIndex(va("%s/pain25", aeInfo->soundPath));
ADDRGP4 $523
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 80
INDIRI4
ASGNI4
line 1752
;1752:		customSounds[1] = G_SoundIndex(va("%s/pain50", aeInfo->soundPath));
ADDRGP4 $524
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 4+4
ADDRLP4 88
INDIRI4
ASGNI4
line 1753
;1753:		customSounds[2] = G_SoundIndex(va("%s/pain75", aeInfo->soundPath));
ADDRGP4 $525
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 4+8
ADDRLP4 96
INDIRI4
ASGNI4
line 1754
;1754:		customSounds[3] = G_SoundIndex(va("%s/pain100", aeInfo->soundPath));
ADDRGP4 $526
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 4+12
ADDRLP4 104
INDIRI4
ASGNI4
line 1755
;1755:		numSounds = 4;
ADDRLP4 68
CNSTI4 4
ASGNI4
line 1756
;1756:	}
ADDRGP4 $539
JUMPV
LABELV $538
line 1757
;1757:	else if (soundType == ANIMENT_CUSTOMSOUND_DEATH)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $543
line 1758
;1758:	{
line 1759
;1759:		customSounds[0] = G_SoundIndex(va("%s/death1", aeInfo->soundPath));
ADDRGP4 $527
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 80
INDIRI4
ASGNI4
line 1760
;1760:		customSounds[1] = G_SoundIndex(va("%s/death2", aeInfo->soundPath));
ADDRGP4 $528
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 4+4
ADDRLP4 88
INDIRI4
ASGNI4
line 1761
;1761:		customSounds[2] = G_SoundIndex(va("%s/death3", aeInfo->soundPath));
ADDRGP4 $529
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 4+8
ADDRLP4 96
INDIRI4
ASGNI4
line 1762
;1762:		numSounds = 3;
ADDRLP4 68
CNSTI4 3
ASGNI4
line 1763
;1763:	}
ADDRGP4 $544
JUMPV
LABELV $543
line 1764
;1764:	else if (soundType == ANIMENT_CUSTOMSOUND_ALERT)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $547
line 1765
;1765:	{
line 1766
;1766:		customSounds[0] = G_SoundIndex(va("%s/detected1", aeInfo->soundPath));
ADDRGP4 $530
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 80
INDIRI4
ASGNI4
line 1767
;1767:		customSounds[1] = G_SoundIndex(va("%s/detected2", aeInfo->soundPath));
ADDRGP4 $531
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 4+4
ADDRLP4 88
INDIRI4
ASGNI4
line 1768
;1768:		customSounds[2] = G_SoundIndex(va("%s/detected3", aeInfo->soundPath));
ADDRGP4 $532
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 4+8
ADDRLP4 96
INDIRI4
ASGNI4
line 1769
;1769:		customSounds[3] = G_SoundIndex(va("%s/detected4", aeInfo->soundPath));
ADDRGP4 $533
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 4+12
ADDRLP4 104
INDIRI4
ASGNI4
line 1770
;1770:		customSounds[4] = G_SoundIndex(va("%s/detected5", aeInfo->soundPath));
ADDRGP4 $534
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 4+16
ADDRLP4 112
INDIRI4
ASGNI4
line 1771
;1771:		numSounds = 5;
ADDRLP4 68
CNSTI4 5
ASGNI4
line 1772
;1772:	}
LABELV $547
LABELV $544
LABELV $539
line 1774
;1773:
;1774:	if (!numSounds)
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $553
line 1775
;1775:	{
line 1776
;1776:		return;
ADDRGP4 $535
JUMPV
LABELV $553
line 1779
;1777:	}
;1778:
;1779:	G_Sound(self, CHAN_AUTO, customSounds[Q_irand(0, numSounds-1)]);
CNSTI4 0
ARGI4
ADDRLP4 68
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 76
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1780
;1780:}
LABELV $535
endproc ExampleAnimEntCustomSound 116 12
export ExampleAnimEntAlignment
proc ExampleAnimEntAlignment 8 4
line 1783
;1781:
;1782:int ExampleAnimEntAlignment(gentity_t *self)
;1783:{
line 1784
;1784:	if (self->watertype == ANIMENT_TYPE_STORMTROOPER)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
NEI4 $556
line 1785
;1785:	{
line 1786
;1786:		return ANIMENT_ALIGNED_BAD;
CNSTI4 1
RETI4
ADDRGP4 $555
JUMPV
LABELV $556
line 1789
;1787:	}
;1788:	
;1789:	if (self->watertype == ANIMENT_TYPE_RODIAN)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 1
NEI4 $558
line 1790
;1790:	{
line 1791
;1791:		return ANIMENT_ALIGNED_BAD;
CNSTI4 1
RETI4
ADDRGP4 $555
JUMPV
LABELV $558
line 1794
;1792:	}
;1793:
;1794:	if (self->watertype == ANIMENT_TYPE_JAN)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 2
NEI4 $560
line 1795
;1795:	{
line 1796
;1796:		return ANIMENT_ALIGNED_GOOD;
CNSTI4 2
RETI4
ADDRGP4 $555
JUMPV
LABELV $560
line 1799
;1797:	}
;1798:	
;1799:	if (self->watertype == ANIMENT_TYPE_CUSTOM)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 3
NEI4 $562
line 1800
;1800:	{
line 1801
;1801:		animentCustomInfo_t *aeInfo = ExampleAnimEntCustomData(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 ExampleAnimEntCustomData
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1803
;1802:
;1803:		if (aeInfo)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $564
line 1804
;1804:		{
line 1805
;1805:			return aeInfo->aeAlignment;
ADDRLP4 0
INDIRP4
INDIRI4
RETI4
ADDRGP4 $555
JUMPV
LABELV $564
line 1807
;1806:		}
;1807:	}
LABELV $562
line 1809
;1808:
;1809:	return ANIMENT_ALIGNED_UNKNOWN;
CNSTI4 0
RETI4
LABELV $555
endproc ExampleAnimEntAlignment 8 4
export ExampleAnimEntAlertOthers
proc ExampleAnimEntAlertOthers 32 8
line 1813
;1810:}
;1811:
;1812:void ExampleAnimEntAlertOthers(gentity_t *self)
;1813:{
line 1815
;1814:	//alert all the other animents in the area
;1815:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $568
JUMPV
LABELV $567
line 1818
;1816:
;1817:	while (i < MAX_GENTITIES)
;1818:	{
line 1819
;1819:		if (g_entities[i].inuse &&
ADDRLP4 4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $570
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $570
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $570
line 1822
;1820:			g_entities[i].s.eType == ET_GRAPPLE &&
;1821:			g_entities[i].health > 0)
;1822:		{
line 1823
;1823:			if (g_entities[i].bolt_Motion == ENTITYNUM_NONE && trap_InPVS(self->r.currentOrigin, g_entities[i].r.currentOrigin) &&
ADDRLP4 12
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+808
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $575
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+296+72
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $575
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $575
line 1825
;1824:				ExampleAnimEntAlignment(self) == ExampleAnimEntAlignment(&g_entities[i]))
;1825:			{
line 1826
;1826:				g_entities[i].bolt_Motion = self->bolt_Motion;
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+808
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ASGNI4
line 1827
;1827:				g_entities[i].speed = level.time + 4000; //4 seconds til we forget about the enemy
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+608
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 4000
ADDI4
CVIF4 4
ASGNF4
line 1828
;1828:				g_entities[i].bolt_RArm = level.time + Q_irand(500, 1000);
CNSTI4 500
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 28
ADDRGP4 Q_irand
CALLI4
ASGNI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+792
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 28
INDIRI4
ADDI4
ASGNI4
line 1829
;1829:			}
LABELV $575
line 1830
;1830:		}
LABELV $570
line 1832
;1831:
;1832:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1833
;1833:	}
LABELV $568
line 1817
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $567
line 1834
;1834:}
LABELV $566
endproc ExampleAnimEntAlertOthers 32 8
export ExampleAnimEnt_Die
proc ExampleAnimEnt_Die 52 20
line 1837
;1835:
;1836:void ExampleAnimEnt_Die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod )
;1837:{
line 1838
;1838:	self->s.torsoAnim = G_PickDeathAnim(self, self->pos1, damage, mod, HL_NONE);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 G_PickDeathAnim
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 284
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1840
;1839:
;1840:	if (self->s.torsoAnim < 0 || self->s.torsoAnim >= MAX_TOTALANIMATIONS)
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $588
ADDRLP4 8
INDIRI4
CNSTI4 1211
LTI4 $586
LABELV $588
line 1841
;1841:	{ //?! (bad)
line 1842
;1842:		self->s.torsoAnim = BOTH_DEATH1;
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
CNSTI4 1
ASGNI4
line 1843
;1843:	}
LABELV $586
line 1845
;1844:
;1845:	self->s.legsAnim = self->s.torsoAnim;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 280
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ASGNI4
line 1846
;1846:	self->health = 1;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 1
ASGNI4
line 1847
;1847:	self->s.eFlags |= EF_DEAD;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1848
;1848:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 1849
;1849:	self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 1851
;1850:
;1851:	if (self->watertype == ANIMENT_TYPE_STORMTROOPER)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
NEI4 $589
line 1852
;1852:	{
line 1853
;1853:		G_Sound(self, CHAN_AUTO, gTrooperSound_Death[Q_irand(0, TROOPER_DEATH_SOUNDS-1)]);
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 20
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gTrooperSound_Death
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1854
;1854:	}
ADDRGP4 $590
JUMPV
LABELV $589
line 1855
;1855:	else if (self->watertype == ANIMENT_TYPE_RODIAN)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 1
NEI4 $591
line 1856
;1856:	{
line 1857
;1857:		G_Sound(self, CHAN_AUTO, gRodianSound_Death[Q_irand(0, RODIAN_DEATH_SOUNDS-1)]);
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 20
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gRodianSound_Death
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1858
;1858:	}
ADDRGP4 $592
JUMPV
LABELV $591
line 1859
;1859:	else if (self->watertype == ANIMENT_TYPE_JAN)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 2
NEI4 $593
line 1860
;1860:	{
line 1861
;1861:		G_Sound(self, CHAN_AUTO, gJanSound_Death[Q_irand(0, JAN_DEATH_SOUNDS-1)]);
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 20
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gJanSound_Death
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1862
;1862:	}
ADDRGP4 $594
JUMPV
LABELV $593
line 1863
;1863:	else if (self->watertype == ANIMENT_TYPE_CUSTOM)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 3
NEI4 $595
line 1864
;1864:	{
line 1865
;1865:		ExampleAnimEntCustomSound(self, ANIMENT_CUSTOMSOUND_DEATH);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ExampleAnimEntCustomSound
CALLV
pop
line 1866
;1866:	}
LABELV $595
LABELV $594
LABELV $592
LABELV $590
line 1868
;1867:
;1868:	if (mod == MOD_SABER)
ADDRFP4 16
INDIRI4
CNSTI4 3
NEI4 $597
line 1869
;1869:	{ //Set the velocity up a bit to make the limb fly up more than it otherwise would.
line 1871
;1870:		vec3_t preDelta;
;1871:		VectorCopy(self->s.pos.trDelta, preDelta);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1873
;1872:
;1873:		if (Q_irand(1, 10) < 5)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 32
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 5
GEI4 $599
line 1874
;1874:		{
line 1875
;1875:			self->s.pos.trDelta[0] += Q_irand(10, 40);
CNSTI4 10
ARGI4
CNSTI4 40
ARGI4
ADDRLP4 36
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 36
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1876
;1876:		}
ADDRGP4 $600
JUMPV
LABELV $599
line 1878
;1877:		else
;1878:		{
line 1879
;1879:			self->s.pos.trDelta[0] -= Q_irand(10, 40);
CNSTI4 10
ARGI4
CNSTI4 40
ARGI4
ADDRLP4 36
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 36
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 1880
;1880:		}
LABELV $600
line 1881
;1881:		if (Q_irand(1, 10) < 5)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 36
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 5
GEI4 $601
line 1882
;1882:		{
line 1883
;1883:			self->s.pos.trDelta[1] += Q_irand(10, 40);
CNSTI4 10
ARGI4
ADDRLP4 40
CNSTI4 40
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 44
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1884
;1884:		}
ADDRGP4 $602
JUMPV
LABELV $601
line 1886
;1885:		else
;1886:		{
line 1887
;1887:			self->s.pos.trDelta[1] -= Q_irand(10, 40);
CNSTI4 10
ARGI4
ADDRLP4 40
CNSTI4 40
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 44
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 1888
;1888:		}
LABELV $602
line 1889
;1889:		self->s.pos.trDelta[2] += 100;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
CNSTF4 1120403456
ADDF4
ASGNF4
line 1890
;1890:		G_CheckForDismemberment(self, self->pos1, damage, self->s.torsoAnim);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 548
ADDP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_CheckForDismemberment
CALLV
pop
line 1892
;1891:		
;1892:		VectorCopy(preDelta, self->s.pos.trDelta);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 1893
;1893:	}
LABELV $597
line 1895
;1894:
;1895:	if (self->bolt_Motion == ENTITYNUM_NONE &&
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $603
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $605
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $603
LABELV $605
line 1897
;1896:		(attacker->client || attacker->s.eType == ET_GRAPPLE))
;1897:	{
line 1898
;1898:		self->bolt_Motion = attacker->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1899
;1899:	}
LABELV $603
line 1901
;1900:
;1901:	if (self->bolt_Motion != ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $606
line 1902
;1902:	{
line 1903
;1903:		ExampleAnimEntAlertOthers(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ExampleAnimEntAlertOthers
CALLV
pop
line 1904
;1904:	}
LABELV $606
line 1906
;1905:
;1906:	trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1908
;1907:
;1908:	self->bolt_Head = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 1909
;1909:}
LABELV $585
endproc ExampleAnimEnt_Die 52 20
export ExampleAnimEnt_Pain
proc ExampleAnimEnt_Pain 36 12
line 1912
;1910:
;1911:void ExampleAnimEnt_Pain(gentity_t *self, gentity_t *attacker, int damage)
;1912:{
line 1913
;1913:	int painAnim = (BOTH_PAIN1 + Q_irand(0, 3));
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 8
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 97
ADDI4
ASGNI4
line 1914
;1914:	int animLen = (bgGlobalAnimations[painAnim].numFrames * fabs(bgGlobalAnimations[painAnim].frameLerp))-50;
ADDRLP4 12
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 bgGlobalAnimations+12
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
MULF4
CNSTF4 1112014848
SUBF4
CVFI4 4
ASGNI4
ADDRGP4 $613
JUMPV
LABELV $612
line 1917
;1915:
;1916:	while (painAnim == self->s.torsoAnim)
;1917:	{
line 1918
;1918:		painAnim = (BOTH_PAIN1 + Q_irand(0, 3));
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 20
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
CNSTI4 97
ADDI4
ASGNI4
line 1919
;1919:	}
LABELV $613
line 1916
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
EQI4 $612
line 1921
;1920:
;1921:	self->s.torsoAnim = painAnim;
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1922
;1922:	self->s.legsAnim = painAnim;
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1923
;1923:	self->bolt_LArm = level.time + animLen;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1925
;1924:
;1925:	if (self->watertype == ANIMENT_TYPE_STORMTROOPER)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
NEI4 $616
line 1926
;1926:	{
line 1927
;1927:		G_Sound(self, CHAN_AUTO, gTrooperSound_Pain[Q_irand(0, TROOPER_PAIN_SOUNDS-1)]);
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 20
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gTrooperSound_Pain
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1928
;1928:	}
ADDRGP4 $617
JUMPV
LABELV $616
line 1929
;1929:	else if (self->watertype == ANIMENT_TYPE_RODIAN)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 1
NEI4 $618
line 1930
;1930:	{
line 1931
;1931:		G_Sound(self, CHAN_AUTO, gRodianSound_Pain[Q_irand(0, RODIAN_PAIN_SOUNDS-1)]);
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 20
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gRodianSound_Pain
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1932
;1932:	}
ADDRGP4 $619
JUMPV
LABELV $618
line 1933
;1933:	else if (self->watertype == ANIMENT_TYPE_JAN)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 2
NEI4 $620
line 1934
;1934:	{
line 1935
;1935:		G_Sound(self, CHAN_AUTO, gJanSound_Pain[Q_irand(0, JAN_PAIN_SOUNDS-1)]);
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 20
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gJanSound_Pain
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1936
;1936:	}
ADDRGP4 $621
JUMPV
LABELV $620
line 1937
;1937:	else if (self->watertype == ANIMENT_TYPE_CUSTOM)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 3
NEI4 $622
line 1938
;1938:	{
line 1939
;1939:		ExampleAnimEntCustomSound(self, ANIMENT_CUSTOMSOUND_PAIN);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 ExampleAnimEntCustomSound
CALLV
pop
line 1940
;1940:	}
LABELV $622
LABELV $621
LABELV $619
LABELV $617
line 1942
;1941:
;1942:	if (attacker && (attacker->client || attacker->s.eType == ET_GRAPPLE) && self->bolt_Motion == ENTITYNUM_NONE)
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $624
ADDRLP4 20
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
NEU4 $626
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $624
LABELV $626
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $624
line 1943
;1943:	{
line 1944
;1944:		if (attacker->s.number >= MAX_CLIENTS || (ExampleAnimEntAlignment(self) != ANIMENT_ALIGNED_GOOD && !(attacker->r.svFlags & SVF_BOT)))
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 32
GEI4 $629
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $627
ADDRFP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $627
LABELV $629
line 1945
;1945:		{
line 1946
;1946:			self->bolt_Motion = attacker->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 1947
;1947:			self->speed = level.time + 4000; //4 seconds til we forget about the enemy
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 4000
ADDI4
CVIF4 4
ASGNF4
line 1948
;1948:			ExampleAnimEntAlertOthers(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ExampleAnimEntAlertOthers
CALLV
pop
line 1949
;1949:			self->bolt_RArm = level.time + Q_irand(500, 1000);
CNSTI4 500
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 32
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 32
INDIRI4
ADDI4
ASGNI4
line 1950
;1950:		}
LABELV $627
line 1951
;1951:	}
LABELV $624
line 1952
;1952:}
LABELV $609
endproc ExampleAnimEnt_Pain 36 12
export ExampleAnimEntTouch
proc ExampleAnimEntTouch 0 0
line 1955
;1953:
;1954:void ExampleAnimEntTouch(gentity_t *self, gentity_t *other, trace_t *trace)
;1955:{
line 1957
;1956:
;1957:}
LABELV $632
endproc ExampleAnimEntTouch 0 0
export ExampleAnimEntMove
proc ExampleAnimEntMove 1232 28
line 1962
;1958:
;1959://We can use this method of movement without horrible choppiness, because
;1960://we are smoothing out the lerpOrigin on the client when rendering this eType.
;1961:int ExampleAnimEntMove(gentity_t *self, vec3_t moveTo, float stepSize)
;1962:{
line 1967
;1963:	trace_t tr;
;1964:	vec3_t stepTo;
;1965:	vec3_t stepSub;
;1966:	vec3_t stepGoal;
;1967:	int didMove = 0;
ADDRLP4 1116
CNSTI4 0
ASGNI4
line 1969
;1968:
;1969:	if (self->s.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $634
line 1970
;1970:	{
line 1971
;1971:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $633
JUMPV
LABELV $634
line 1974
;1972:	}
;1973:
;1974:	VectorCopy(moveTo, stepTo);
ADDRLP4 1104
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1975
;1975:	stepTo[2] = self->r.currentOrigin[2];
ADDRLP4 1104+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ASGNF4
line 1977
;1976:
;1977:	VectorSubtract(stepTo, self->r.currentOrigin, stepSub);
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
ADDRLP4 1104
INDIRF4
ADDRLP4 1120
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1080+4
ADDRLP4 1104+4
INDIRF4
ADDRLP4 1120
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1080+8
ADDRLP4 1104+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1979
;1978:
;1979:	if (VectorLength(stepSub) < 32)
ADDRLP4 1080
ARGP4
ADDRLP4 1124
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1124
INDIRF4
CNSTF4 1107296256
GEF4 $641
line 1980
;1980:	{
line 1981
;1981:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $633
JUMPV
LABELV $641
line 1984
;1982:	}
;1983:
;1984:	VectorNormalize(stepSub);
ADDRLP4 1080
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1986
;1985:
;1986:	stepGoal[0] = self->r.currentOrigin[0] + stepSub[0]*stepSize;
ADDRLP4 1092
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 1080
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1987
;1987:	stepGoal[1] = self->r.currentOrigin[1] + stepSub[1]*stepSize;
ADDRLP4 1092+4
ADDRFP4 0
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 1080+4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1988
;1988:	stepGoal[2] = self->r.currentOrigin[2] + stepSub[2]*stepSize;
ADDRLP4 1092+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 1080+8
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1990
;1989:
;1990:	trap_Trace(&tr, self->r.currentOrigin, self->r.mins, self->r.maxs, stepGoal, self->s.number, self->clipmask);
ADDRLP4 0
ARGP4
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1128
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1128
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1128
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1128
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1992
;1991:
;1992:	if (!tr.startsolid && !tr.allsolid && tr.fraction)
ADDRLP4 1132
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1132
INDIRI4
NEI4 $647
ADDRLP4 0
INDIRI4
ADDRLP4 1132
INDIRI4
NEI4 $647
ADDRLP4 0+8
INDIRF4
CNSTF4 0
EQF4 $647
line 1993
;1993:	{
line 1995
;1994:		vec3_t vecSub;
;1995:		VectorSubtract(self->r.currentOrigin, tr.endpos, vecSub);
ADDRLP4 1148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1136
ADDRLP4 1148
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1136+4
ADDRLP4 1148
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1136+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 0+12+8
INDIRF4
SUBF4
ASGNF4
line 1997
;1996:
;1997:		if (VectorLength(vecSub) > (stepSize/2))
ADDRLP4 1136
ARGP4
ADDRLP4 1152
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1152
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1073741824
DIVF4
LEF4 $658
line 1998
;1998:		{
line 1999
;1999:			self->r.currentOrigin[0] = tr.endpos[0];
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0+12
INDIRF4
ASGNF4
line 2000
;2000:			self->r.currentOrigin[1] = tr.endpos[1];
ADDRFP4 0
INDIRP4
CNSTI4 372
ADDP4
ADDRLP4 0+12+4
INDIRF4
ASGNF4
line 2001
;2001:			self->s.pos.trBase[0] = tr.endpos[0];
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0+12
INDIRF4
ASGNF4
line 2002
;2002:			self->s.pos.trBase[1] = tr.endpos[1];
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 0+12+4
INDIRF4
ASGNF4
line 2003
;2003:			self->s.origin[0] = tr.endpos[0];
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+12
INDIRF4
ASGNF4
line 2004
;2004:			self->s.origin[1] = tr.endpos[1];
ADDRFP4 0
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 0+12+4
INDIRF4
ASGNF4
line 2005
;2005:			trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2006
;2006:			didMove = 1;
ADDRLP4 1116
CNSTI4 1
ASGNI4
line 2007
;2007:		}
LABELV $658
line 2008
;2008:	}
LABELV $647
line 2010
;2009:	
;2010:	if (didMove != 1)
ADDRLP4 1116
INDIRI4
CNSTI4 1
EQI4 $669
line 2011
;2011:	{ //stair check
line 2017
;2012:		vec3_t trFrom;
;2013:		vec3_t trTo;
;2014:		vec3_t trDir;
;2015:		vec3_t vecMeasure;
;2016:
;2017:		VectorCopy(tr.endpos, trFrom);
ADDRLP4 1160
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2018
;2018:		trFrom[2] += 16;
ADDRLP4 1160+8
ADDRLP4 1160+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 2020
;2019:
;2020:		VectorSubtract(/*tr.endpos*/stepGoal, self->r.currentOrigin, trDir);
ADDRLP4 1184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1148
ADDRLP4 1092
INDIRF4
ADDRLP4 1184
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1148+4
ADDRLP4 1092+4
INDIRF4
ADDRLP4 1184
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1148+8
ADDRLP4 1092+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2021
;2021:		VectorNormalize(trDir);
ADDRLP4 1148
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2022
;2022:		trTo[0] = tr.endpos[0] + trDir[0]*2;
ADDRLP4 1136
ADDRLP4 0+12
INDIRF4
CNSTF4 1073741824
ADDRLP4 1148
INDIRF4
MULF4
ADDF4
ASGNF4
line 2023
;2023:		trTo[1] = tr.endpos[1] + trDir[1]*2;
ADDRLP4 1136+4
ADDRLP4 0+12+4
INDIRF4
CNSTF4 1073741824
ADDRLP4 1148+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2024
;2024:		trTo[2] = tr.endpos[2] + trDir[2]*2;
ADDRLP4 1136+8
ADDRLP4 0+12+8
INDIRF4
CNSTF4 1073741824
ADDRLP4 1148+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2025
;2025:		trTo[2] += 16;
ADDRLP4 1136+8
ADDRLP4 1136+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 2027
;2026:
;2027:		VectorSubtract(trFrom, trTo, vecMeasure);
ADDRLP4 1172
ADDRLP4 1160
INDIRF4
ADDRLP4 1136
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1172+4
ADDRLP4 1160+4
INDIRF4
ADDRLP4 1136+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1172+8
ADDRLP4 1160+8
INDIRF4
ADDRLP4 1136+8
INDIRF4
SUBF4
ASGNF4
line 2029
;2028:
;2029:		if (VectorLength(vecMeasure) > 1)
ADDRLP4 1172
ARGP4
ADDRLP4 1188
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1188
INDIRF4
CNSTF4 1065353216
LEF4 $693
line 2030
;2030:		{
line 2031
;2031:			trap_Trace(&tr, trFrom, self->r.mins, self->r.maxs, trTo, self->s.number, self->clipmask);
ADDRLP4 0
ARGP4
ADDRLP4 1160
ARGP4
ADDRLP4 1192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1192
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1192
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 1136
ARGP4
ADDRLP4 1192
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1192
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2033
;2032:
;2033:			if (!tr.startsolid && !tr.allsolid && tr.fraction == 1)
ADDRLP4 1196
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1196
INDIRI4
NEI4 $695
ADDRLP4 0
INDIRI4
ADDRLP4 1196
INDIRI4
NEI4 $695
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $695
line 2034
;2034:			{ //clear trace here, probably up a step
line 2037
;2035:				vec3_t trDown;
;2036:				vec3_t trUp;
;2037:				VectorCopy(tr.endpos, trUp);
ADDRLP4 1212
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2038
;2038:				VectorCopy(tr.endpos, trDown);
ADDRLP4 1200
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2039
;2039:				trDown[2] -= 16;
ADDRLP4 1200+8
ADDRLP4 1200+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 2041
;2040:
;2041:				trap_Trace(&tr, trFrom, self->r.mins, self->r.maxs, trTo, self->s.number, self->clipmask);
ADDRLP4 0
ARGP4
ADDRLP4 1160
ARGP4
ADDRLP4 1224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1224
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1224
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 1136
ARGP4
ADDRLP4 1224
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1224
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2043
;2042:
;2043:				if (!tr.startsolid && !tr.allsolid)
ADDRLP4 1228
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1228
INDIRI4
NEI4 $702
ADDRLP4 0
INDIRI4
ADDRLP4 1228
INDIRI4
NEI4 $702
line 2044
;2044:				{ //plop us down on the step after moving up
line 2045
;2045:					VectorCopy(tr.endpos, self->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2046
;2046:					VectorCopy(tr.endpos, self->s.pos.trBase);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2047
;2047:					VectorCopy(tr.endpos, self->s.origin);
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2048
;2048:					trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2049
;2049:					didMove = 1;
ADDRLP4 1116
CNSTI4 1
ASGNI4
line 2050
;2050:				}
LABELV $702
line 2051
;2051:			}
LABELV $695
line 2052
;2052:		}
LABELV $693
line 2053
;2053:	}
LABELV $669
line 2055
;2054:
;2055:	return didMove;
ADDRLP4 1116
INDIRI4
RETI4
LABELV $633
endproc ExampleAnimEntMove 1232 28
export ExampleAnimEntYaw
proc ExampleAnimEntYaw 28 8
line 2059
;2056:}
;2057:
;2058:float ExampleAnimEntYaw(gentity_t *self, float idealYaw, float yawSpeed)
;2059:{
line 2060
;2060:	float curYaw = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2061
;2061:	float diffYaw = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 2063
;2062:
;2063:	curYaw = AngleNormalize360(self->s.apos.trBase[YAW]);
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 AngleNormalize360
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 2065
;2064:
;2065:	diffYaw = AngleSubtract( curYaw, idealYaw );
ADDRLP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 12
INDIRF4
ASGNF4
line 2067
;2066:
;2067:	if ( fabs(diffYaw) > 0.25f )
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 16
INDIRF4
CNSTF4 1048576000
LEF4 $709
line 2068
;2068:	{
line 2069
;2069:		if ( fabs(diffYaw) > yawSpeed )
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 20
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $711
line 2070
;2070:		{
line 2072
;2071:			// cap max speed
;2072:			curYaw += (diffYaw > 0.0f) ? -yawSpeed : yawSpeed;
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $714
ADDRLP4 24
ADDRFP4 8
INDIRF4
NEGF4
ASGNF4
ADDRGP4 $715
JUMPV
LABELV $714
ADDRLP4 24
ADDRFP4 8
INDIRF4
ASGNF4
LABELV $715
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
line 2073
;2073:		}
ADDRGP4 $712
JUMPV
LABELV $711
line 2075
;2074:		else
;2075:		{
line 2077
;2076:			// small enough
;2077:			curYaw -= diffYaw;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
line 2078
;2078:		}
LABELV $712
line 2079
;2079:	}
LABELV $709
line 2081
;2080:
;2081:	return curYaw;
ADDRLP4 0
INDIRF4
RETF4
LABELV $708
endproc ExampleAnimEntYaw 28 8
export ExampleAnimEntLook
proc ExampleAnimEntLook 28 12
line 2085
;2082:}
;2083:
;2084:void ExampleAnimEntLook(gentity_t *self, vec3_t lookTo)
;2085:{
line 2088
;2086:	vec3_t lookSub;
;2087:
;2088:	VectorSubtract(lookTo, self->r.currentOrigin, lookSub);
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2089
;2089:	VectorNormalize(lookSub);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2090
;2090:	vectoangles(lookSub, lookSub);
ADDRLP4 0
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2092
;2091:
;2092:	if (lookSub[PITCH] < -180)
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
GEF4 $719
line 2093
;2093:	{
line 2094
;2094:		lookSub[PITCH] -= 90;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1119092736
SUBF4
ASGNF4
line 2095
;2095:	}
LABELV $719
line 2098
;2096:
;2097:	//VectorCopy(lookSub, self->s.apos.trBase);
;2098:	self->s.apos.trBase[PITCH] = lookSub[PITCH];
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 2099
;2099:	self->s.apos.trBase[ROLL] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
CNSTF4 0
ASGNF4
line 2100
;2100:	self->s.apos.trBase[YAW] = ExampleAnimEntYaw(self, lookSub[YAW], 20);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRF4
ARGF4
CNSTF4 1101004800
ARGF4
ADDRLP4 24
ADDRGP4 ExampleAnimEntYaw
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
line 2101
;2101:}
LABELV $716
endproc ExampleAnimEntLook 28 12
export ExampleAnimEntClearLOS
proc ExampleAnimEntClearLOS 1112 28
line 2104
;2102:
;2103:qboolean ExampleAnimEntClearLOS(gentity_t *self, vec3_t point)
;2104:{
line 2107
;2105:	trace_t tr;
;2106:
;2107:	trap_Trace(&tr, self->r.currentOrigin, 0, 0, point, self->s.number, self->clipmask);
ADDRLP4 0
ARGP4
ADDRLP4 1080
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
INDIRP4
CNSTI4 368
ADDP4
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
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1080
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1080
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2109
;2108:
;2109:	if (ExampleAnimEntAlignment(self) == ANIMENT_ALIGNED_GOOD)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1088
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 2
NEI4 $723
line 2110
;2110:	{
line 2111
;2111:		if (tr.fraction == 1 ||
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $733
ADDRLP4 1092
CNSTI4 852
ASGNI4
ADDRLP4 1092
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $734
ADDRLP4 1092
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1096
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 2
NEI4 $733
LABELV $734
ADDRLP4 1100
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 32
GEI4 $725
ADDRLP4 0+52
INDIRI4
ADDRLP4 1100
INDIRI4
NEI4 $725
LABELV $733
line 2114
;2112:			(g_entities[tr.entityNum].s.eType == ET_GRAPPLE && ExampleAnimEntAlignment(&g_entities[tr.entityNum]) != ANIMENT_ALIGNED_GOOD) ||
;2113:			(self->bolt_Motion < MAX_CLIENTS && tr.entityNum == self->bolt_Motion))
;2114:		{ //clear LOS, or would be hitting a bad animent, so fire.
line 2115
;2115:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $722
JUMPV
LABELV $725
line 2117
;2116:		}
;2117:		else if (g_entities[tr.entityNum].inuse && g_entities[tr.entityNum].client && (g_entities[tr.entityNum].r.svFlags & SVF_BOT))
ADDRLP4 1104
CNSTI4 852
ASGNI4
ADDRLP4 1108
CNSTI4 0
ASGNI4
ADDRLP4 1104
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 1108
INDIRI4
EQI4 $724
ADDRLP4 1104
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $724
ADDRLP4 1104
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 1108
INDIRI4
EQI4 $724
line 2118
;2118:		{
line 2119
;2119:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $722
JUMPV
line 2121
;2120:		}
;2121:	}
LABELV $723
line 2123
;2122:	else
;2123:	{
line 2124
;2124:		if (tr.fraction == 1 ||
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $752
ADDRLP4 0+52
INDIRI4
CNSTI4 32
LTI4 $752
ADDRLP4 1092
CNSTI4 852
ASGNI4
ADDRLP4 1092
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $744
ADDRLP4 1092
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1096
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 1
EQI4 $744
LABELV $752
line 2127
;2125:			tr.entityNum < MAX_CLIENTS ||
;2126:			(g_entities[tr.entityNum].s.eType == ET_GRAPPLE && ExampleAnimEntAlignment(&g_entities[tr.entityNum]) != ANIMENT_ALIGNED_BAD))
;2127:		{ //clear LOS, or would be hitting a client (they're all bad!), so fire.
line 2128
;2128:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $722
JUMPV
LABELV $744
line 2130
;2129:		}
;2130:	}
LABELV $724
line 2132
;2131:
;2132:	return qfalse;
CNSTI4 0
RETI4
LABELV $722
endproc ExampleAnimEntClearLOS 1112 28
export ExampleAnimEntWeaponHandling
proc ExampleAnimEntWeaponHandling 8 12
line 2136
;2133:}
;2134:
;2135:void ExampleAnimEntWeaponHandling(gentity_t *self)
;2136:{
line 2137
;2137:	if (self->bolt_RArm > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $754
line 2138
;2138:	{
line 2139
;2139:		return;
ADDRGP4 $753
JUMPV
LABELV $754
line 2142
;2140:	}
;2141:
;2142:	if (self->boltpoint4)
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
CNSTI4 0
EQI4 $757
line 2143
;2143:	{
line 2144
;2144:		if (self->s.weapon == WP_DISRUPTOR)
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 5
NEI4 $759
line 2145
;2145:		{
line 2146
;2146:			AnimEntFireWeapon(self, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AnimEntFireWeapon
CALLV
pop
line 2147
;2147:			G_AddEvent(self, EV_FIRE_WEAPON, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 24
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2148
;2148:			self->bolt_RArm = level.time + Q_irand(1500, 2500);
CNSTI4 1500
ARGI4
CNSTI4 2500
ARGI4
ADDRLP4 0
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 2149
;2149:		}
ADDRGP4 $760
JUMPV
LABELV $759
line 2151
;2150:		else
;2151:		{
line 2152
;2152:			AnimEntFireWeapon(self, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 AnimEntFireWeapon
CALLV
pop
line 2153
;2153:			G_AddEvent(self, EV_FIRE_WEAPON, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 24
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2155
;2154:
;2155:			if (self->s.weapon == WP_REPEATER)
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 7
NEI4 $762
line 2156
;2156:			{
line 2157
;2157:				self->bolt_RArm = level.time + Q_irand(1, 500);
CNSTI4 1
ARGI4
CNSTI4 500
ARGI4
ADDRLP4 0
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 2158
;2158:			}
ADDRGP4 $763
JUMPV
LABELV $762
line 2159
;2159:			else if (ExampleAnimEntAlignment(self) == ANIMENT_ALIGNED_GOOD)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $765
line 2160
;2160:			{
line 2161
;2161:				self->bolt_RArm = level.time + Q_irand(200, 400);
CNSTI4 200
ARGI4
CNSTI4 400
ARGI4
ADDRLP4 4
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 2162
;2162:			}
ADDRGP4 $766
JUMPV
LABELV $765
line 2164
;2163:			else
;2164:			{
line 2165
;2165:				self->bolt_RArm = level.time + Q_irand(700, 1000);
CNSTI4 700
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 4
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 2166
;2166:			}
LABELV $766
LABELV $763
line 2167
;2167:		}
LABELV $760
line 2168
;2168:	}
LABELV $757
line 2169
;2169:}
LABELV $753
endproc ExampleAnimEntWeaponHandling 8 12
export ExampleAnimEntWayValidCheck
proc ExampleAnimEntWayValidCheck 1096 28
line 2172
;2170:
;2171:qboolean ExampleAnimEntWayValidCheck(gentity_t *self)
;2172:{
line 2176
;2173:	wpobject_t *currentWP;
;2174:	trace_t tr;
;2175:
;2176:	if (self->bolt_Waist < 0 ||
ADDRLP4 1084
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
LTI4 $772
ADDRLP4 1084
INDIRI4
ADDRGP4 gWPNum
INDIRI4
LTI4 $770
LABELV $772
line 2178
;2177:		self->bolt_Waist >= gWPNum)
;2178:	{
line 2179
;2179:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $769
JUMPV
LABELV $770
line 2182
;2180:	}
;2181:
;2182:	if (self->boltpoint1 < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $773
line 2183
;2183:	{
line 2184
;2184:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $769
JUMPV
LABELV $773
line 2187
;2185:	}
;2186:
;2187:	if (self->boltpoint2 < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $776
line 2188
;2188:	{
line 2189
;2189:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $769
JUMPV
LABELV $776
line 2192
;2190:	}
;2191:
;2192:	currentWP = gWPArray[self->bolt_Waist];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2194
;2193:
;2194:	if (!currentWP)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $779
line 2195
;2195:	{
line 2196
;2196:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $769
JUMPV
LABELV $779
line 2199
;2197:	}
;2198:
;2199:	trap_Trace(&tr, self->r.currentOrigin, 0, 0, currentWP->origin, self->s.number, self->clipmask);
ADDRLP4 4
ARGP4
ADDRLP4 1088
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088
INDIRP4
CNSTI4 368
ADDP4
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
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1088
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1088
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2201
;2200:
;2201:	if (tr.fraction == 1)
ADDRLP4 4+8
INDIRF4
CNSTF4 1065353216
NEF4 $781
line 2202
;2202:	{ //allow one second for time you cannot see the point. If we go beyond that, kill the connection.
line 2203
;2203:		self->boltpoint2 = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2204
;2204:	}
LABELV $781
line 2206
;2205:
;2206:	return qtrue;
CNSTI4 1
RETI4
LABELV $769
endproc ExampleAnimEntWayValidCheck 1096 28
export ExampleAnimEntNavigation
proc ExampleAnimEntNavigation 48 8
line 2212
;2207:}
;2208:
;2209://Simple nav routine utilizing bot path data
;2210://bolt_Waist represents our current indexed waypoint
;2211:void ExampleAnimEntNavigation(gentity_t *self, vec3_t goalPos)
;2212:{
line 2213
;2213:	if (self->bolt_Waist == -1 ||
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $788
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 ExampleAnimEntWayValidCheck
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $786
LABELV $788
line 2215
;2214:		!ExampleAnimEntWayValidCheck(self))
;2215:	{
line 2216
;2216:		int wpIndex = GetNearestVisibleWP(self->r.currentOrigin, self->s.number);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 2218
;2217:
;2218:		if (wpIndex >= 0 && wpIndex < gWPNum)
ADDRLP4 20
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $789
ADDRLP4 20
INDIRI4
ADDRGP4 gWPNum
INDIRI4
GEI4 $789
line 2219
;2219:		{
line 2220
;2220:			self->bolt_Waist = wpIndex;
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 2221
;2221:			self->boltpoint1 = level.time + 10000; //10 seconds to get to the point
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 2222
;2222:			self->boltpoint2 = level.time + 1000; //initialize the 1 second allowed visibility
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2223
;2223:		}
ADDRGP4 $790
JUMPV
LABELV $789
line 2225
;2224:		else
;2225:		{
line 2226
;2226:			self->bolt_Waist = -1;
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
CNSTI4 -1
ASGNI4
line 2227
;2227:		}
LABELV $790
line 2228
;2228:	}
LABELV $786
line 2230
;2229:
;2230:	if (self->bolt_Waist != -1)
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $793
line 2231
;2231:	{ //we have a point to go to
line 2232
;2232:		wpobject_t *currentWP = gWPArray[self->bolt_Waist];
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2234
;2233:
;2234:		if (currentWP)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $794
line 2235
;2235:		{
line 2237
;2236:			vec3_t subLen;
;2237:			float vecLen = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 2239
;2238:
;2239:			VectorCopy(currentWP->origin, goalPos);
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRP4
INDIRB
ASGNB 12
line 2240
;2240:			VectorSubtract(self->r.currentOrigin, currentWP->origin, subLen);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 28
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2241
;2241:			vecLen = VectorLength(subLen);
ADDRLP4 16
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 36
INDIRF4
ASGNF4
line 2243
;2242:
;2243:			if (vecLen <= 40)
ADDRLP4 12
INDIRF4
CNSTF4 1109393408
GTF4 $794
line 2244
;2244:			{
line 2245
;2245:				int desiredIndex = -20;
ADDRLP4 40
CNSTI4 -20
ASGNI4
line 2247
;2246:
;2247:				if (!self->boltpoint3)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 0
NEI4 $801
line 2248
;2248:				{
line 2249
;2249:					desiredIndex = currentWP->index+1;
ADDRLP4 40
ADDRLP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2250
;2250:				}
ADDRGP4 $802
JUMPV
LABELV $801
line 2252
;2251:				else
;2252:				{
line 2253
;2253:					desiredIndex = currentWP->index-1;
ADDRLP4 40
ADDRLP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2254
;2254:				}
LABELV $802
line 2256
;2255:
;2256:				if (desiredIndex != -20)
ADDRLP4 40
INDIRI4
CNSTI4 -20
EQI4 $803
line 2257
;2257:				{
line 2258
;2258:					if (desiredIndex < 0)
ADDRLP4 40
INDIRI4
CNSTI4 0
GEI4 $805
line 2259
;2259:					{
line 2260
;2260:						self->boltpoint3 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 0
ASGNI4
line 2261
;2261:						desiredIndex = currentWP->index+1;
ADDRLP4 40
ADDRLP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2262
;2262:					}
LABELV $805
line 2263
;2263:					if (desiredIndex >= gWPNum)
ADDRLP4 40
INDIRI4
ADDRGP4 gWPNum
INDIRI4
LTI4 $807
line 2264
;2264:					{
line 2265
;2265:						self->boltpoint3 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 1
ASGNI4
line 2266
;2266:						desiredIndex = currentWP->index-1;
ADDRLP4 40
ADDRLP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2267
;2267:					}
LABELV $807
line 2268
;2268:				}
LABELV $803
line 2270
;2269:
;2270:				if (desiredIndex != -1 && desiredIndex >= 0 && desiredIndex < gWPNum)
ADDRLP4 44
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 -1
EQI4 $794
ADDRLP4 44
INDIRI4
CNSTI4 0
LTI4 $794
ADDRLP4 44
INDIRI4
ADDRGP4 gWPNum
INDIRI4
GEI4 $794
line 2271
;2271:				{
line 2272
;2272:					currentWP = gWPArray[desiredIndex];
ADDRLP4 8
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2274
;2273:
;2274:					if (currentWP)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $794
line 2275
;2275:					{
line 2276
;2276:						self->bolt_Waist = desiredIndex;
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2277
;2277:						self->boltpoint1 = level.time + 10000; //every time we grab a new point, set the allowed travel-to time again
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 2278
;2278:						VectorCopy(currentWP->origin, goalPos);
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRP4
INDIRB
ASGNB 12
line 2279
;2279:					}
line 2280
;2280:				}
line 2281
;2281:			}
line 2282
;2282:		}
line 2283
;2283:	}
ADDRGP4 $794
JUMPV
LABELV $793
line 2285
;2284:	else
;2285:	{ //We have no place to go. Run toward the origin mindlessly.
line 2286
;2286:		VectorClear(goalPos);
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 2287
;2287:	}
LABELV $794
line 2288
;2288:}
LABELV $785
endproc ExampleAnimEntNavigation 48 8
export ExampleAnimEntEnemyHandling
proc ExampleAnimEntEnemyHandling 92 12
line 2291
;2289:
;2290:void ExampleAnimEntEnemyHandling(gentity_t *self, float enDist)
;2291:{
line 2292
;2292:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2293
;2293:	int bestIndex = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 2294
;2294:	float minDist = enDist;
ADDRLP4 4
ADDRFP4 4
INDIRF4
ASGNF4
line 2296
;2295:
;2296:	if (ExampleAnimEntAlignment(self) == ANIMENT_ALIGNED_GOOD)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
NEI4 $859
line 2297
;2297:	{
ADDRGP4 $818
JUMPV
LABELV $817
line 2299
;2298:		while (i < MAX_GENTITIES)
;2299:		{
line 2300
;2300:			if (g_entities[i].inuse && (g_entities[i].s.eType == ET_GRAPPLE || (g_entities[i].client && (g_entities[i].r.svFlags & SVF_BOT))) && ExampleAnimEntAlignment(&g_entities[i]) != ANIMENT_ALIGNED_GOOD && g_entities[i].health > 0 && !(g_entities[i].s.eFlags & EF_DEAD))
ADDRLP4 16
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $820
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
EQI4 $829
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $820
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 20
INDIRI4
EQI4 $820
LABELV $829
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 2
EQI4 $820
ADDRLP4 28
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $820
ADDRLP4 28
INDIRI4
ADDRGP4 g_entities+8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 32
INDIRI4
NEI4 $820
line 2301
;2301:			{
line 2305
;2302:				vec3_t checkLen;
;2303:				float fCheckLen;
;2304:
;2305:				VectorSubtract(self->r.currentOrigin, g_entities[i].r.currentOrigin, checkLen);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
ADDRLP4 52
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 56
INDIRI4
ADDRGP4 g_entities+296+72
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 52
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 56
INDIRI4
ADDRGP4 g_entities+296+72+4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+72+8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2307
;2306:
;2307:				fCheckLen = VectorLength(checkLen);
ADDRLP4 36
ARGP4
ADDRLP4 60
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 60
INDIRF4
ASGNF4
line 2309
;2308:
;2309:				if (fCheckLen < (minDist - 128))
ADDRLP4 48
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1124073472
SUBF4
GEF4 $840
line 2310
;2310:				{
line 2312
;2311:					vec3_t enAngles;
;2312:					VectorSubtract(g_entities[i].r.currentOrigin, self->r.currentOrigin, enAngles);
ADDRLP4 76
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 76
INDIRI4
ADDRGP4 g_entities+296+72
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 76
INDIRI4
ADDRGP4 g_entities+296+72+4
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+8
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+72+8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2313
;2313:					vectoangles(enAngles, enAngles);
ADDRLP4 64
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2314
;2314:					if ((InFieldOfVision(self->s.apos.trBase, 120, enAngles) || self->s.genericenemyindex > level.time) && ExampleAnimEntClearLOS(self, g_entities[i].r.currentOrigin))
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
CNSTF4 1123024896
ARGF4
ADDRLP4 64
ARGP4
ADDRLP4 84
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $857
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $852
LABELV $857
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+72
ADDP4
ARGP4
ADDRLP4 88
ADDRGP4 ExampleAnimEntClearLOS
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $852
line 2315
;2315:					{
line 2316
;2316:						minDist = fCheckLen;
ADDRLP4 4
ADDRLP4 48
INDIRF4
ASGNF4
line 2317
;2317:						bestIndex = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 2318
;2318:					}
LABELV $852
line 2319
;2319:				}
LABELV $840
line 2320
;2320:			}
LABELV $820
line 2321
;2321:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2322
;2322:		}
LABELV $818
line 2298
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $817
line 2323
;2323:	}
ADDRGP4 $816
JUMPV
line 2325
;2324:	else
;2325:	{
LABELV $858
line 2327
;2326:		while (i < MAX_CLIENTS)
;2327:		{
line 2328
;2328:			if (g_entities[i].inuse && g_entities[i].client && !(g_entities[i].r.svFlags & SVF_BOT) && g_entities[i].health > 0 && !(g_entities[i].s.eFlags & EF_DEAD) && g_entities[i].client->sess.sessionTeam != TEAM_SPECTATOR)
ADDRLP4 16
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $861
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $861
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 20
INDIRI4
NEI4 $861
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
LEI4 $861
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 20
INDIRI4
NEI4 $861
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 3
EQI4 $861
line 2329
;2329:			{
line 2333
;2330:				vec3_t checkLen;
;2331:				float fCheckLen;
;2332:
;2333:				VectorSubtract(self->r.currentOrigin, g_entities[i].client->ps.origin, checkLen);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 24
ADDRLP4 40
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 44
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 40
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 44
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
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
SUBF4
ASGNF4
line 2335
;2334:
;2335:				fCheckLen = VectorLength(checkLen);
ADDRLP4 24
ARGP4
ADDRLP4 48
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 48
INDIRF4
ASGNF4
line 2337
;2336:
;2337:				if (fCheckLen < (minDist - 128))
ADDRLP4 36
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1124073472
SUBF4
GEF4 $875
line 2338
;2338:				{
line 2340
;2339:					vec3_t enAngles;
;2340:					VectorSubtract(g_entities[i].client->ps.origin, self->r.currentOrigin, enAngles);
ADDRLP4 64
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 64
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 68
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 64
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 68
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 52+8
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
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2341
;2341:					vectoangles(enAngles, enAngles);
ADDRLP4 52
ARGP4
ADDRLP4 52
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2342
;2342:					if ((InFieldOfVision(self->s.apos.trBase, 120, enAngles) || self->s.genericenemyindex > level.time) && ExampleAnimEntClearLOS(self, g_entities[i].client->ps.origin))
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
CNSTF4 1123024896
ARGF4
ADDRLP4 52
ARGP4
ADDRLP4 72
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $886
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $882
LABELV $886
ADDRFP4 0
INDIRP4
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
ADDRLP4 76
ADDRGP4 ExampleAnimEntClearLOS
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $882
line 2343
;2343:					{
line 2344
;2344:						minDist = fCheckLen;
ADDRLP4 4
ADDRLP4 36
INDIRF4
ASGNF4
line 2345
;2345:						bestIndex = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 2346
;2346:					}
LABELV $882
line 2347
;2347:				}
LABELV $875
line 2348
;2348:			}
LABELV $861
line 2349
;2349:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2350
;2350:		}
LABELV $859
line 2326
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $858
line 2352
;2351:
;2352:		if (bestIndex == -1)
ADDRLP4 8
INDIRI4
CNSTI4 -1
NEI4 $887
line 2353
;2353:		{
line 2354
;2354:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $890
JUMPV
LABELV $889
line 2357
;2355:
;2356:			while (i < MAX_GENTITIES)
;2357:			{
line 2358
;2358:				if (g_entities[i].inuse && g_entities[i].s.eType == ET_GRAPPLE && ExampleAnimEntAlignment(&g_entities[i]) != ANIMENT_ALIGNED_BAD && g_entities[i].health > 0 && !(g_entities[i].s.eFlags & EF_DEAD))
ADDRLP4 16
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $892
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $892
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $892
ADDRLP4 28
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $892
ADDRLP4 28
INDIRI4
ADDRGP4 g_entities+8
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
BANDI4
ADDRLP4 32
INDIRI4
NEI4 $892
line 2359
;2359:				{
line 2363
;2360:					vec3_t checkLen;
;2361:					float fCheckLen;
;2362:
;2363:					VectorSubtract(self->r.currentOrigin, g_entities[i].r.currentOrigin, checkLen);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
ADDRLP4 52
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 56
INDIRI4
ADDRGP4 g_entities+296+72
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 52
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 56
INDIRI4
ADDRGP4 g_entities+296+72+4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+72+8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2365
;2364:
;2365:					fCheckLen = VectorLength(checkLen);
ADDRLP4 36
ARGP4
ADDRLP4 60
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 60
INDIRF4
ASGNF4
line 2367
;2366:
;2367:					if (fCheckLen < (minDist - 128))
ADDRLP4 48
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1124073472
SUBF4
GEF4 $908
line 2368
;2368:					{
line 2370
;2369:						vec3_t enAngles;
;2370:						VectorSubtract(g_entities[i].r.currentOrigin, self->r.currentOrigin, enAngles);
ADDRLP4 76
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 76
INDIRI4
ADDRGP4 g_entities+296+72
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 76
INDIRI4
ADDRGP4 g_entities+296+72+4
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+8
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+72+8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2371
;2371:						vectoangles(enAngles, enAngles);
ADDRLP4 64
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2372
;2372:						if ((InFieldOfVision(self->s.apos.trBase, 120, enAngles) || self->s.genericenemyindex > level.time) && ExampleAnimEntClearLOS(self, g_entities[i].r.currentOrigin))
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
CNSTF4 1123024896
ARGF4
ADDRLP4 64
ARGP4
ADDRLP4 84
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $925
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $920
LABELV $925
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+72
ADDP4
ARGP4
ADDRLP4 88
ADDRGP4 ExampleAnimEntClearLOS
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $920
line 2373
;2373:						{
line 2374
;2374:							minDist = fCheckLen;
ADDRLP4 4
ADDRLP4 48
INDIRF4
ASGNF4
line 2375
;2375:							bestIndex = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 2376
;2376:						}
LABELV $920
line 2377
;2377:					}
LABELV $908
line 2378
;2378:				}
LABELV $892
line 2379
;2379:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2380
;2380:			}
LABELV $890
line 2356
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $889
line 2381
;2381:		}
LABELV $887
line 2382
;2382:	}
LABELV $816
line 2384
;2383:
;2384:	if (bestIndex != -1)
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $926
line 2385
;2385:	{
line 2386
;2386:		self->bolt_Motion = bestIndex;
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 2387
;2387:		enDist = minDist;
ADDRFP4 4
ADDRLP4 4
INDIRF4
ASGNF4
line 2388
;2388:		self->speed = level.time + 4000; //4 seconds til we forget about the enemy
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 4000
ADDI4
CVIF4 4
ASGNF4
line 2389
;2389:		ExampleAnimEntAlertOthers(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ExampleAnimEntAlertOthers
CALLV
pop
line 2390
;2390:		self->bolt_RArm = level.time + Q_irand(500, 1000);
CNSTI4 500
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 16
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ASGNI4
line 2392
;2391:
;2392:		if (self->watertype == ANIMENT_TYPE_STORMTROOPER)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
NEI4 $930
line 2393
;2393:		{
line 2394
;2394:			G_Sound(self, CHAN_AUTO, gTrooperSound_Alert[Q_irand(0, TROOPER_ALERT_SOUNDS-1)]);
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 20
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gTrooperSound_Alert
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2395
;2395:		}
ADDRGP4 $931
JUMPV
LABELV $930
line 2396
;2396:		else if (self->watertype == ANIMENT_TYPE_RODIAN)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 1
NEI4 $932
line 2397
;2397:		{
line 2398
;2398:			G_Sound(self, CHAN_AUTO, gRodianSound_Alert[Q_irand(0, RODIAN_ALERT_SOUNDS-1)]);
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 20
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gRodianSound_Alert
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2399
;2399:		}
ADDRGP4 $933
JUMPV
LABELV $932
line 2400
;2400:		else if (self->watertype == ANIMENT_TYPE_JAN)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 2
NEI4 $934
line 2401
;2401:		{
line 2402
;2402:			G_Sound(self, CHAN_AUTO, gJanSound_Alert[Q_irand(0, JAN_ALERT_SOUNDS-1)]);
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 20
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gJanSound_Alert
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2403
;2403:		}
ADDRGP4 $935
JUMPV
LABELV $934
line 2404
;2404:		else if (self->watertype == ANIMENT_TYPE_CUSTOM)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 3
NEI4 $936
line 2405
;2405:		{
line 2406
;2406:			ExampleAnimEntCustomSound(self, ANIMENT_CUSTOMSOUND_ALERT);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 ExampleAnimEntCustomSound
CALLV
pop
line 2407
;2407:		}
LABELV $936
LABELV $935
LABELV $933
LABELV $931
line 2408
;2408:	}
LABELV $926
line 2409
;2409:}
LABELV $814
endproc ExampleAnimEntEnemyHandling 92 12
export ExampleAnimEntUpdateSelf
proc ExampleAnimEntUpdateSelf 176 16
line 2412
;2410:
;2411:void ExampleAnimEntUpdateSelf(gentity_t *self)
;2412:{
line 2415
;2413:	vec3_t preserveAngles;
;2414:
;2415:	if (gBotEdit || !gWPNum)
ADDRGP4 gBotEdit
INDIRF4
CNSTF4 0
NEF4 $941
ADDRGP4 gWPNum
INDIRI4
CNSTI4 0
NEI4 $939
LABELV $941
line 2416
;2416:	{
line 2417
;2417:		if (!(self->s.eFlags & EF_DEAD))
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $942
line 2418
;2418:		{
line 2419
;2419:			if (self->bolt_LArm < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $943
line 2420
;2420:			{
line 2421
;2421:				self->s.torsoAnim = BOTH_ATTACK3;
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
CNSTI4 120
ASGNI4
line 2422
;2422:				self->s.legsAnim = BOTH_STAND3;
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
CNSTI4 576
ASGNI4
line 2423
;2423:			}
line 2424
;2424:		}
ADDRGP4 $943
JUMPV
LABELV $942
line 2426
;2425:		else
;2426:		{
line 2427
;2427:			if (self->bolt_Head < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $947
line 2428
;2428:			{
line 2429
;2429:				self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 2430
;2430:				self->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2431
;2431:				return;
ADDRGP4 $938
JUMPV
LABELV $947
line 2433
;2432:			}
;2433:		}
LABELV $943
line 2435
;2434:
;2435:		VectorCopy(self->s.apos.trBase, preserveAngles);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 2436
;2436:		G_RunObject(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 2437
;2437:		VectorCopy(preserveAngles, self->s.apos.trBase);
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 2438
;2438:		return;
ADDRGP4 $938
JUMPV
LABELV $939
line 2441
;2439:	}
;2440:
;2441:	if (!(self->s.eFlags & EF_DEAD))
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $951
line 2442
;2442:	{
line 2443
;2443:		if (self->bolt_LArm < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $952
line 2444
;2444:		{
line 2446
;2445:			vec3_t goalPos;
;2446:			int didMove = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2447
;2447:			float enDist = 999999999;
ADDRLP4 16
CNSTF4 1315859240
ASGNF4
line 2448
;2448:			float runSpeed = 18;
ADDRLP4 24
CNSTF4 1099956224
ASGNF4
line 2450
;2449:			vec3_t enemyOrigin;
;2450:			qboolean hasEnemyLOS = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 2451
;2451:			int originalEnemyIndex = self->bolt_Motion;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ASGNI4
line 2453
;2452:
;2453:			if (self->bolt_Motion != ENTITYNUM_NONE &&
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 1023
EQI4 $956
ADDRLP4 60
CNSTI4 852
ADDRLP4 56
INDIRI4
MULI4
ASGNI4
ADDRLP4 60
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $956
ADDRLP4 60
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $956
line 2456
;2454:				g_entities[self->bolt_Motion].inuse &&
;2455:				g_entities[self->bolt_Motion].client)
;2456:			{
line 2457
;2457:				if (g_entities[self->bolt_Motion].client->sess.sessionTeam == TEAM_SPECTATOR)
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 3
NEI4 $960
line 2458
;2458:				{
line 2459
;2459:					self->bolt_Motion = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 1023
ASGNI4
line 2460
;2460:				}
LABELV $960
line 2461
;2461:			}
LABELV $956
line 2463
;2462:
;2463:			if (self->bolt_Motion < MAX_CLIENTS &&
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 32
GEI4 $963
ADDRLP4 68
CNSTI4 852
ADDRLP4 64
INDIRI4
MULI4
ASGNI4
ADDRLP4 68
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $967
ADDRLP4 68
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $963
LABELV $967
line 2466
;2464:				(!g_entities[self->bolt_Motion].inuse ||
;2465:				!g_entities[self->bolt_Motion].client))
;2466:			{
line 2467
;2467:				self->bolt_Motion = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 1023
ASGNI4
line 2468
;2468:			}
LABELV $963
line 2470
;2469:
;2470:			if (self->bolt_Motion != ENTITYNUM_NONE &&
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 1023
EQI4 $968
ADDRLP4 76
CNSTI4 852
ADDRLP4 72
INDIRI4
MULI4
ASGNI4
ADDRLP4 76
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $968
ADDRLP4 76
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $973
ADDRLP4 76
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $968
LABELV $973
line 2473
;2471:				g_entities[self->bolt_Motion].inuse &&
;2472:				(g_entities[self->bolt_Motion].client || g_entities[self->bolt_Motion].s.eType == ET_GRAPPLE))
;2473:			{
line 2474
;2474:				if (g_entities[self->bolt_Motion].health < 1 ||
ADDRLP4 80
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 84
CNSTI4 1
ASGNI4
ADDRLP4 80
INDIRI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
LTI4 $978
ADDRLP4 80
INDIRI4
ADDRGP4 g_entities+8
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
BANDI4
CNSTI4 0
EQI4 $974
LABELV $978
line 2476
;2475:					(g_entities[self->bolt_Motion].s.eFlags & EF_DEAD))
;2476:				{
line 2477
;2477:					self->bolt_Motion = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 1023
ASGNI4
line 2478
;2478:				}
LABELV $974
line 2479
;2479:			}
LABELV $968
line 2481
;2480:
;2481:			if (gWPNum > 0)
ADDRGP4 gWPNum
INDIRI4
CNSTI4 0
LEI4 $979
line 2482
;2482:			{
line 2483
;2483:				if (self->bolt_Motion != ENTITYNUM_NONE &&
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 1023
EQI4 $981
ADDRLP4 84
CNSTI4 852
ADDRLP4 80
INDIRI4
MULI4
ASGNI4
ADDRLP4 84
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $981
ADDRLP4 84
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $981
line 2486
;2484:					g_entities[self->bolt_Motion].inuse &&
;2485:					g_entities[self->bolt_Motion].client)
;2486:				{
line 2488
;2487:					vec3_t enSubVec;
;2488:					VectorSubtract(self->r.currentOrigin, g_entities[self->bolt_Motion].client->ps.origin, enSubVec);
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
CNSTI4 852
ASGNI4
ADDRLP4 108
ADDRLP4 100
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
ADDRLP4 88
ADDRLP4 100
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 104
INDIRI4
ADDRLP4 108
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 88+4
ADDRLP4 100
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 104
INDIRI4
ADDRLP4 108
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88+8
ADDRLP4 112
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
CNSTI4 852
ADDRLP4 112
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2490
;2489:	
;2490:					enDist = VectorLength(enSubVec);
ADDRLP4 88
ARGP4
ADDRLP4 116
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 116
INDIRF4
ASGNF4
line 2492
;2491:
;2492:					VectorCopy(g_entities[self->bolt_Motion].client->ps.origin, enemyOrigin);
ADDRLP4 44
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2494
;2493:
;2494:					if (g_entities[self->bolt_Motion].client->pers.cmd.upmove < 0)
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1410
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $991
line 2495
;2495:					{
line 2496
;2496:						enemyOrigin[2] -= 8;
ADDRLP4 44+8
ADDRLP4 44+8
INDIRF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 2497
;2497:					}
ADDRGP4 $992
JUMPV
LABELV $991
line 2499
;2498:					else
;2499:					{
line 2500
;2500:						enemyOrigin[2] += 8;
ADDRLP4 44+8
ADDRLP4 44+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 2501
;2501:					}
LABELV $992
line 2503
;2502:
;2503:					hasEnemyLOS = ExampleAnimEntClearLOS(self, enemyOrigin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 120
ADDRGP4 ExampleAnimEntClearLOS
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 120
INDIRI4
ASGNI4
line 2504
;2504:				}
ADDRGP4 $982
JUMPV
LABELV $981
line 2505
;2505:				else if (self->bolt_Motion != ENTITYNUM_NONE &&
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 1023
EQI4 $996
ADDRLP4 92
CNSTI4 852
ADDRLP4 88
INDIRI4
MULI4
ASGNI4
ADDRLP4 92
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $996
ADDRLP4 92
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $996
line 2508
;2506:					g_entities[self->bolt_Motion].inuse &&
;2507:					g_entities[self->bolt_Motion].s.eType == ET_GRAPPLE)
;2508:				{
line 2510
;2509:					vec3_t enSubVec;
;2510:					VectorSubtract(self->r.currentOrigin, g_entities[self->bolt_Motion].r.currentOrigin, enSubVec);
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
CNSTI4 852
ASGNI4
ADDRLP4 116
ADDRLP4 108
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
ADDRLP4 96
ADDRLP4 108
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 112
INDIRI4
ADDRLP4 116
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+72
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 96+4
ADDRLP4 108
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 112
INDIRI4
ADDRLP4 116
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+72+4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96+8
ADDRLP4 120
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
CNSTI4 852
ADDRLP4 120
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+72+8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2512
;2511:	
;2512:					enDist = VectorLength(enSubVec);
ADDRLP4 96
ARGP4
ADDRLP4 124
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 124
INDIRF4
ASGNF4
line 2514
;2513:
;2514:					VectorCopy(g_entities[self->bolt_Motion].r.currentOrigin, enemyOrigin);
ADDRLP4 44
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+72
ADDP4
INDIRB
ASGNB 12
line 2516
;2515:
;2516:					hasEnemyLOS = ExampleAnimEntClearLOS(self, enemyOrigin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 128
ADDRGP4 ExampleAnimEntClearLOS
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 128
INDIRI4
ASGNI4
line 2517
;2517:				}
LABELV $996
LABELV $982
line 2519
;2518:
;2519:				if (hasEnemyLOS && enDist < 512 && self->splashRadius < level.time)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1012
ADDRLP4 16
INDIRF4
CNSTF4 1140850688
GEF4 $1012
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1012
line 2520
;2520:				{
line 2521
;2521:					if (rand()%10 <= 8)
ADDRLP4 96
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 10
MODI4
CNSTI4 8
GTI4 $1015
line 2522
;2522:					{
line 2523
;2523:						if (self->splashMethodOfDeath)
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1017
line 2524
;2524:						{
line 2525
;2525:							self->splashMethodOfDeath = 0;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 0
ASGNI4
line 2526
;2526:						}
ADDRGP4 $1018
JUMPV
LABELV $1017
line 2528
;2527:						else
;2528:						{
line 2529
;2529:							self->splashMethodOfDeath = 1;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 1
ASGNI4
line 2530
;2530:						}
LABELV $1018
line 2531
;2531:					}
LABELV $1015
line 2533
;2532:
;2533:					if (self->watertype == ANIMENT_TYPE_RODIAN)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1019
line 2534
;2534:					{ //these guys stand still more often because they are "snipers"
line 2535
;2535:						if (rand()%10 <= 7)
ADDRLP4 100
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 10
MODI4
CNSTI4 7
GTI4 $1021
line 2536
;2536:						{
line 2537
;2537:							self->splashMethodOfDeath = 1;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 1
ASGNI4
line 2538
;2538:						}
LABELV $1021
line 2539
;2539:					}
LABELV $1019
line 2541
;2540:
;2541:					self->splashRadius = level.time + Q_irand(2000, 5000);
CNSTI4 2000
ARGI4
CNSTI4 5000
ARGI4
ADDRLP4 100
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 100
INDIRI4
ADDI4
ASGNI4
line 2542
;2542:				}
LABELV $1012
line 2544
;2543:
;2544:				if (hasEnemyLOS && (enDist < 512 || self->watertype == ANIMENT_TYPE_RODIAN) && self->splashMethodOfDeath)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1024
ADDRLP4 16
INDIRF4
CNSTF4 1140850688
LTF4 $1026
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1024
LABELV $1026
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1024
line 2545
;2545:				{
line 2546
;2546:					VectorCopy(self->r.currentOrigin, goalPos);
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2547
;2547:				}
ADDRGP4 $980
JUMPV
LABELV $1024
line 2549
;2548:				else
;2549:				{
line 2550
;2550:					ExampleAnimEntNavigation(self, goalPos);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 ExampleAnimEntNavigation
CALLV
pop
line 2551
;2551:				}
line 2552
;2552:			}
ADDRGP4 $980
JUMPV
LABELV $979
line 2554
;2553:			else
;2554:			{ //No path data? Eh. Just run toward the origin mindlessly.
line 2555
;2555:				VectorClear(goalPos);
ADDRLP4 80
CNSTF4 0
ASGNF4
ADDRLP4 32+8
ADDRLP4 80
INDIRF4
ASGNF4
ADDRLP4 32+4
ADDRLP4 80
INDIRF4
ASGNF4
ADDRLP4 32
ADDRLP4 80
INDIRF4
ASGNF4
line 2556
;2556:			}
LABELV $980
line 2558
;2557:
;2558:			if (self->bolt_Motion == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1029
line 2559
;2559:			{
line 2560
;2560:				if (ExampleAnimEntAlignment(self) == ANIMENT_ALIGNED_GOOD)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 2
NEI4 $1031
line 2561
;2561:				{
line 2562
;2562:					runSpeed = 18;
ADDRLP4 24
CNSTF4 1099956224
ASGNF4
line 2563
;2563:				}
ADDRGP4 $1032
JUMPV
LABELV $1031
line 2565
;2564:				else
;2565:				{
line 2566
;2566:					runSpeed = 6;
ADDRLP4 24
CNSTF4 1086324736
ASGNF4
line 2567
;2567:				}
LABELV $1032
line 2568
;2568:			}
LABELV $1029
line 2570
;2569:
;2570:			didMove = ExampleAnimEntMove(self, goalPos, runSpeed);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 80
ADDRGP4 ExampleAnimEntMove
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 80
INDIRI4
ASGNI4
line 2572
;2571:
;2572:			if (self->bolt_Motion != ENTITYNUM_NONE &&
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 1023
EQI4 $1033
ADDRLP4 88
CNSTI4 852
ADDRLP4 84
INDIRI4
MULI4
ASGNI4
ADDRLP4 88
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1033
ADDRLP4 88
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1033
line 2575
;2573:				g_entities[self->bolt_Motion].inuse &&
;2574:				g_entities[self->bolt_Motion].client)
;2575:			{
line 2576
;2576:				if (self->speed < level.time || g_entities[self->bolt_Motion].health < 1)
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LTF4 $1041
CNSTI4 852
ADDRLP4 92
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1037
LABELV $1041
line 2577
;2577:				{
line 2578
;2578:					self->bolt_Motion = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 1023
ASGNI4
line 2579
;2579:				}
ADDRGP4 $1034
JUMPV
LABELV $1037
line 2581
;2580:				else
;2581:				{
line 2582
;2582:					if (self->bolt_Motion != originalEnemyIndex)
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $1034
line 2583
;2583:					{
line 2585
;2584:						vec3_t enSubVec;
;2585:						VectorSubtract(self->r.currentOrigin, g_entities[self->bolt_Motion].client->ps.origin, enSubVec);
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
CNSTI4 852
ASGNI4
ADDRLP4 116
ADDRLP4 108
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
ADDRLP4 96
ADDRLP4 108
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 112
INDIRI4
ADDRLP4 116
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 96+4
ADDRLP4 108
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 112
INDIRI4
ADDRLP4 116
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96+8
ADDRLP4 120
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
CNSTI4 852
ADDRLP4 120
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2587
;2586:	
;2587:						enDist = VectorLength(enSubVec);
ADDRLP4 96
ARGP4
ADDRLP4 124
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 124
INDIRF4
ASGNF4
line 2588
;2588:					}
line 2589
;2589:				}
line 2590
;2590:			}
ADDRGP4 $1034
JUMPV
LABELV $1033
line 2591
;2591:			else if (self->bolt_Motion != ENTITYNUM_NONE &&
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 1023
EQI4 $1049
ADDRLP4 96
CNSTI4 852
ADDRLP4 92
INDIRI4
MULI4
ASGNI4
ADDRLP4 96
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1049
ADDRLP4 96
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1049
line 2594
;2592:				g_entities[self->bolt_Motion].inuse &&
;2593:				g_entities[self->bolt_Motion].s.eType == ET_GRAPPLE)
;2594:			{
line 2595
;2595:				if (self->speed < level.time || g_entities[self->bolt_Motion].health < 1)
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LTF4 $1057
CNSTI4 852
ADDRLP4 100
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1053
LABELV $1057
line 2596
;2596:				{
line 2597
;2597:					self->bolt_Motion = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 1023
ASGNI4
line 2598
;2598:				}
ADDRGP4 $1054
JUMPV
LABELV $1053
line 2600
;2599:				else
;2600:				{
line 2601
;2601:					if (self->bolt_Motion != originalEnemyIndex)
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $1058
line 2602
;2602:					{
line 2604
;2603:						vec3_t enSubVec;
;2604:						VectorSubtract(self->r.currentOrigin, g_entities[self->bolt_Motion].r.currentOrigin, enSubVec);
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
CNSTI4 852
ASGNI4
ADDRLP4 124
ADDRLP4 116
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
ADDRLP4 104
ADDRLP4 116
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 120
INDIRI4
ADDRLP4 124
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+72
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 104+4
ADDRLP4 116
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 120
INDIRI4
ADDRLP4 124
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+72+4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104+8
ADDRLP4 128
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
CNSTI4 852
ADDRLP4 128
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+72+8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2606
;2605:	
;2606:						enDist = VectorLength(enSubVec);
ADDRLP4 104
ARGP4
ADDRLP4 132
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 132
INDIRF4
ASGNF4
line 2607
;2607:					}
LABELV $1058
line 2608
;2608:				}
LABELV $1054
line 2609
;2609:			}
LABELV $1049
LABELV $1034
line 2611
;2610:
;2611:			ExampleAnimEntEnemyHandling(self, enDist);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 ExampleAnimEntEnemyHandling
CALLV
pop
line 2613
;2612:
;2613:			if (self->bolt_Motion != ENTITYNUM_NONE &&
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 1023
EQI4 $1070
ADDRLP4 104
CNSTI4 852
ADDRLP4 100
INDIRI4
MULI4
ASGNI4
ADDRLP4 104
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1070
ADDRLP4 104
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1075
ADDRLP4 104
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1070
LABELV $1075
line 2616
;2614:				g_entities[self->bolt_Motion].inuse &&
;2615:				(g_entities[self->bolt_Motion].client || g_entities[self->bolt_Motion].s.eType == ET_GRAPPLE))
;2616:			{
line 2619
;2617:				vec3_t enOrigin;
;2618:
;2619:				if (g_entities[self->bolt_Motion].client)
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1076
line 2620
;2620:				{
line 2621
;2621:					VectorCopy(g_entities[self->bolt_Motion].client->ps.origin, enOrigin);
ADDRLP4 108
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2622
;2622:				}
ADDRGP4 $1077
JUMPV
LABELV $1076
line 2624
;2623:				else
;2624:				{
line 2625
;2625:					VectorCopy(g_entities[self->bolt_Motion].r.currentOrigin, enOrigin);
ADDRLP4 108
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+72
ADDP4
INDIRB
ASGNB 12
line 2626
;2626:				}
LABELV $1077
line 2628
;2627:
;2628:				if (originalEnemyIndex != self->bolt_Motion)
ADDRLP4 28
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
EQI4 $1082
line 2629
;2629:				{
line 2630
;2630:					VectorCopy(enOrigin, enemyOrigin);
ADDRLP4 44
ADDRLP4 108
INDIRB
ASGNB 12
line 2632
;2631:
;2632:					if (g_entities[self->bolt_Motion].client)
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1084
line 2633
;2633:					{
line 2634
;2634:						if (g_entities[self->bolt_Motion].client->pers.cmd.upmove < 0)
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1410
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $1087
line 2635
;2635:						{
line 2636
;2636:							enemyOrigin[2] -= 8;
ADDRLP4 44+8
ADDRLP4 44+8
INDIRF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 2637
;2637:						}
ADDRGP4 $1088
JUMPV
LABELV $1087
line 2639
;2638:						else
;2639:						{
line 2640
;2640:							enemyOrigin[2] += 8;
ADDRLP4 44+8
ADDRLP4 44+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 2641
;2641:						}
LABELV $1088
line 2642
;2642:					}
LABELV $1084
line 2644
;2643:
;2644:					hasEnemyLOS = ExampleAnimEntClearLOS(self, enemyOrigin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 120
ADDRGP4 ExampleAnimEntClearLOS
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 120
INDIRI4
ASGNI4
line 2645
;2645:				}
LABELV $1082
line 2647
;2646:
;2647:				if (hasEnemyLOS)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1092
line 2648
;2648:				{
line 2654
;2649:					vec3_t enAngles;
;2650:					vec3_t enAimOrg;
;2651:					vec3_t selfAimOrg;
;2652:					vec3_t myZeroPitchAngles;
;2653:
;2654:					VectorCopy(enOrigin, enAimOrg);
ADDRLP4 132
ADDRLP4 108
INDIRB
ASGNB 12
line 2655
;2655:					VectorCopy(self->r.currentOrigin, selfAimOrg);
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2656
;2656:					enAimOrg[2] = selfAimOrg[2];
ADDRLP4 132+8
ADDRLP4 144+8
INDIRF4
ASGNF4
line 2658
;2657:
;2658:					VectorSubtract(enAimOrg, selfAimOrg, enAngles);
ADDRLP4 120
ADDRLP4 132
INDIRF4
ADDRLP4 144
INDIRF4
SUBF4
ASGNF4
ADDRLP4 120+4
ADDRLP4 132+4
INDIRF4
ADDRLP4 144+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 120+8
ADDRLP4 132+8
INDIRF4
ADDRLP4 144+8
INDIRF4
SUBF4
ASGNF4
line 2659
;2659:					vectoangles(enAngles, enAngles);
ADDRLP4 120
ARGP4
ADDRLP4 120
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2661
;2660:
;2661:					VectorCopy(self->s.apos.trBase, myZeroPitchAngles);
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 2662
;2662:					myZeroPitchAngles[PITCH] = 0;
ADDRLP4 156
CNSTF4 0
ASGNF4
line 2663
;2663:					if (InFieldOfVision(myZeroPitchAngles, 50, enAngles))
ADDRLP4 156
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 120
ARGP4
ADDRLP4 168
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
EQI4 $1102
line 2664
;2664:					{
line 2665
;2665:						self->boltpoint4 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 1
ASGNI4
line 2666
;2666:					}
LABELV $1102
line 2667
;2667:					self->speed = level.time + 4000; //4 seconds til we forget about the enemy
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 4000
ADDI4
CVIF4 4
ASGNF4
line 2668
;2668:				}
ADDRGP4 $1093
JUMPV
LABELV $1092
line 2670
;2669:				else
;2670:				{
line 2671
;2671:					self->boltpoint4 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 0
ASGNI4
line 2672
;2672:				}
LABELV $1093
line 2673
;2673:				ExampleAnimEntLook(self, enemyOrigin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 ExampleAnimEntLook
CALLV
pop
line 2674
;2674:			}
ADDRGP4 $1071
JUMPV
LABELV $1070
line 2676
;2675:			else
;2676:			{
line 2677
;2677:				self->boltpoint4 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 0
ASGNI4
line 2678
;2678:				ExampleAnimEntLook(self, goalPos);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 ExampleAnimEntLook
CALLV
pop
line 2679
;2679:			}
LABELV $1071
line 2681
;2680:
;2681:			if (!didMove)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1105
line 2682
;2682:			{ //not just didMove 2, this means we're actually probably stuck
line 2686
;2683:				vec3_t aFwd, aRight;
;2684:				vec3_t newGoalPos;
;2685:
;2686:				AngleVectors(self->s.apos.trBase, aFwd, aRight, 0);
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 120
ARGP4
ADDRLP4 132
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2687
;2687:				newGoalPos[0] = self->r.currentOrigin[0] + aRight[0]*64 - aFwd[0]*64;
ADDRLP4 144
CNSTF4 1115684864
ASGNF4
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 144
INDIRF4
ADDRLP4 132
INDIRF4
MULF4
ADDF4
ADDRLP4 144
INDIRF4
ADDRLP4 120
INDIRF4
MULF4
SUBF4
ASGNF4
line 2688
;2688:				newGoalPos[1] = self->r.currentOrigin[1] + aRight[1]*64 - aFwd[1]*64;
ADDRLP4 148
CNSTF4 1115684864
ASGNF4
ADDRLP4 108+4
ADDRFP4 0
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 148
INDIRF4
ADDRLP4 132+4
INDIRF4
MULF4
ADDF4
ADDRLP4 148
INDIRF4
ADDRLP4 120+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 2689
;2689:				newGoalPos[2] = self->r.currentOrigin[2] + aRight[2]*64 - aFwd[2]*64;
ADDRLP4 152
CNSTF4 1115684864
ASGNF4
ADDRLP4 108+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 152
INDIRF4
ADDRLP4 132+8
INDIRF4
MULF4
ADDF4
ADDRLP4 152
INDIRF4
ADDRLP4 120+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 2692
;2690:
;2691:				//Try moving to the right of the direction we're looking, to get around stuff
;2692:				didMove = ExampleAnimEntMove(self, newGoalPos, 18);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 108
ARGP4
CNSTF4 1099956224
ARGF4
ADDRLP4 156
ADDRGP4 ExampleAnimEntMove
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 156
INDIRI4
ASGNI4
line 2694
;2693:
;2694:				if (!didMove)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1113
line 2695
;2695:				{ //still? Try to the left.
line 2696
;2696:					newGoalPos[0] = self->r.currentOrigin[0] - aRight[0]*64 - aFwd[0]*64;
ADDRLP4 160
CNSTF4 1115684864
ASGNF4
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 160
INDIRF4
ADDRLP4 132
INDIRF4
MULF4
SUBF4
ADDRLP4 160
INDIRF4
ADDRLP4 120
INDIRF4
MULF4
SUBF4
ASGNF4
line 2697
;2697:					newGoalPos[1] = self->r.currentOrigin[1] - aRight[1]*64 - aFwd[1]*64;
ADDRLP4 164
CNSTF4 1115684864
ASGNF4
ADDRLP4 108+4
ADDRFP4 0
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 164
INDIRF4
ADDRLP4 132+4
INDIRF4
MULF4
SUBF4
ADDRLP4 164
INDIRF4
ADDRLP4 120+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 2698
;2698:					newGoalPos[2] = self->r.currentOrigin[2] - aRight[2]*64 - aFwd[2]*64;
ADDRLP4 168
CNSTF4 1115684864
ASGNF4
ADDRLP4 108+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 168
INDIRF4
ADDRLP4 132+8
INDIRF4
MULF4
SUBF4
ADDRLP4 168
INDIRF4
ADDRLP4 120+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 2700
;2699:
;2700:					didMove = ExampleAnimEntMove(self, newGoalPos, 18);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 108
ARGP4
CNSTF4 1099956224
ARGF4
ADDRLP4 172
ADDRGP4 ExampleAnimEntMove
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 172
INDIRI4
ASGNI4
line 2701
;2701:				}
LABELV $1113
line 2702
;2702:			}
LABELV $1105
line 2704
;2703:
;2704:			if (didMove == 1)
ADDRLP4 12
INDIRI4
CNSTI4 1
NEI4 $1121
line 2705
;2705:			{
line 2706
;2706:				if (self->bolt_Motion == ENTITYNUM_NONE && ExampleAnimEntAlignment(self) != ANIMENT_ALIGNED_GOOD)
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1123
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 2
EQI4 $1123
line 2707
;2707:				{ //Good guys are always on "alert"
line 2708
;2708:					self->s.torsoAnim = BOTH_WALK1;
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
CNSTI4 822
ASGNI4
line 2709
;2709:					self->s.legsAnim = BOTH_WALK1;
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
CNSTI4 822
ASGNI4
line 2710
;2710:				}
ADDRGP4 $1122
JUMPV
LABELV $1123
line 2712
;2711:				else
;2712:				{
line 2713
;2713:					self->s.torsoAnim = BOTH_ATTACK3;
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
CNSTI4 120
ASGNI4
line 2714
;2714:					self->s.legsAnim = BOTH_RUN2;
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
CNSTI4 836
ASGNI4
line 2715
;2715:				}
line 2716
;2716:			}
ADDRGP4 $1122
JUMPV
LABELV $1121
line 2718
;2717:			else
;2718:			{
line 2719
;2719:				self->s.torsoAnim = BOTH_ATTACK3;
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
CNSTI4 120
ASGNI4
line 2720
;2720:				self->s.legsAnim = BOTH_STAND3;
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
CNSTI4 576
ASGNI4
line 2721
;2721:			}
LABELV $1122
line 2723
;2722:
;2723:			ExampleAnimEntWeaponHandling(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ExampleAnimEntWeaponHandling
CALLV
pop
line 2724
;2724:		}
line 2725
;2725:	}
ADDRGP4 $952
JUMPV
LABELV $951
line 2727
;2726:	else
;2727:	{
line 2728
;2728:		if (self->bolt_Head < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1125
line 2729
;2729:		{
line 2730
;2730:			self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 2731
;2731:			self->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2732
;2732:			return;
ADDRGP4 $938
JUMPV
LABELV $1125
line 2734
;2733:		}
;2734:	}
LABELV $952
line 2736
;2735:
;2736:	VectorCopy(self->s.apos.trBase, preserveAngles);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 2737
;2737:	G_RunObject(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 2738
;2738:	VectorCopy(preserveAngles, self->s.apos.trBase);
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 2739
;2739:}
LABELV $938
endproc ExampleAnimEntUpdateSelf 176 16
export G_SpawnExampleAnimEnt
proc G_SpawnExampleAnimEnt 84 20
line 2742
;2740:
;2741:void G_SpawnExampleAnimEnt(vec3_t pos, int aeType, animentCustomInfo_t *aeInfo)
;2742:{
line 2747
;2743:	gentity_t *animEnt;
;2744:	vec3_t playerMins;
;2745:	vec3_t playerMaxs;
;2746:
;2747:	VectorSet(playerMins, -15, -15, DEFAULT_MINS_2);
ADDRLP4 28
CNSTF4 3245342720
ASGNF4
ADDRLP4 4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 4+8
CNSTF4 3250585600
ASGNF4
line 2748
;2748:	VectorSet(playerMaxs, 15, 15, DEFAULT_MAXS_2);
ADDRLP4 32
CNSTF4 1097859072
ASGNF4
ADDRLP4 16
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 16+8
CNSTF4 1109393408
ASGNF4
line 2750
;2749:
;2750:	if (aeType == ANIMENT_TYPE_STORMTROOPER)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1134
line 2751
;2751:	{
line 2752
;2752:		if (!gTrooperSound_Pain[0])
ADDRGP4 gTrooperSound_Pain
INDIRI4
CNSTI4 0
NEI4 $1135
line 2753
;2753:		{
line 2754
;2754:			gTrooperSound_Pain[0] = G_SoundIndex("sound/chars/st1/misc/pain25");
ADDRGP4 $1138
ARGP4
ADDRLP4 36
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Pain
ADDRLP4 36
INDIRI4
ASGNI4
line 2755
;2755:			gTrooperSound_Pain[1] = G_SoundIndex("sound/chars/st1/misc/pain50");
ADDRGP4 $1140
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Pain+4
ADDRLP4 40
INDIRI4
ASGNI4
line 2756
;2756:			gTrooperSound_Pain[2] = G_SoundIndex("sound/chars/st1/misc/pain75");
ADDRGP4 $1142
ARGP4
ADDRLP4 44
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Pain+8
ADDRLP4 44
INDIRI4
ASGNI4
line 2757
;2757:			gTrooperSound_Pain[3] = G_SoundIndex("sound/chars/st1/misc/pain100");
ADDRGP4 $1144
ARGP4
ADDRLP4 48
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Pain+12
ADDRLP4 48
INDIRI4
ASGNI4
line 2759
;2758:
;2759:			gTrooperSound_Death[0] = G_SoundIndex("sound/chars/st1/misc/death1");
ADDRGP4 $1145
ARGP4
ADDRLP4 52
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Death
ADDRLP4 52
INDIRI4
ASGNI4
line 2760
;2760:			gTrooperSound_Death[1] = G_SoundIndex("sound/chars/st1/misc/death2");
ADDRGP4 $1147
ARGP4
ADDRLP4 56
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Death+4
ADDRLP4 56
INDIRI4
ASGNI4
line 2761
;2761:			gTrooperSound_Death[2] = G_SoundIndex("sound/chars/st1/misc/death3");
ADDRGP4 $1149
ARGP4
ADDRLP4 60
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Death+8
ADDRLP4 60
INDIRI4
ASGNI4
line 2763
;2762:
;2763:			gTrooperSound_Alert[0] = G_SoundIndex("sound/chars/st1/misc/detected1");
ADDRGP4 $1150
ARGP4
ADDRLP4 64
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Alert
ADDRLP4 64
INDIRI4
ASGNI4
line 2764
;2764:			gTrooperSound_Alert[1] = G_SoundIndex("sound/chars/st1/misc/detected2");
ADDRGP4 $1152
ARGP4
ADDRLP4 68
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Alert+4
ADDRLP4 68
INDIRI4
ASGNI4
line 2765
;2765:			gTrooperSound_Alert[2] = G_SoundIndex("sound/chars/st1/misc/detected3");
ADDRGP4 $1154
ARGP4
ADDRLP4 72
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Alert+8
ADDRLP4 72
INDIRI4
ASGNI4
line 2766
;2766:			gTrooperSound_Alert[3] = G_SoundIndex("sound/chars/st1/misc/detected4");
ADDRGP4 $1156
ARGP4
ADDRLP4 76
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Alert+12
ADDRLP4 76
INDIRI4
ASGNI4
line 2767
;2767:			gTrooperSound_Alert[4] = G_SoundIndex("sound/chars/st1/misc/detected5");
ADDRGP4 $1158
ARGP4
ADDRLP4 80
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Alert+16
ADDRLP4 80
INDIRI4
ASGNI4
line 2768
;2768:		}
line 2769
;2769:	}
ADDRGP4 $1135
JUMPV
LABELV $1134
line 2770
;2770:	else if (aeType == ANIMENT_TYPE_RODIAN)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $1159
line 2771
;2771:	{
line 2772
;2772:		if (!gRodianSound_Pain[0])
ADDRGP4 gRodianSound_Pain
INDIRI4
CNSTI4 0
NEI4 $1160
line 2773
;2773:		{
line 2774
;2774:			gRodianSound_Pain[0] = G_SoundIndex("sound/chars/rodian1/misc/pain25");
ADDRGP4 $1163
ARGP4
ADDRLP4 36
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Pain
ADDRLP4 36
INDIRI4
ASGNI4
line 2775
;2775:			gRodianSound_Pain[1] = G_SoundIndex("sound/chars/rodian1/misc/pain50");
ADDRGP4 $1165
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Pain+4
ADDRLP4 40
INDIRI4
ASGNI4
line 2776
;2776:			gRodianSound_Pain[2] = G_SoundIndex("sound/chars/rodian1/misc/pain75");
ADDRGP4 $1167
ARGP4
ADDRLP4 44
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Pain+8
ADDRLP4 44
INDIRI4
ASGNI4
line 2777
;2777:			gRodianSound_Pain[3] = G_SoundIndex("sound/chars/rodian1/misc/pain100");
ADDRGP4 $1169
ARGP4
ADDRLP4 48
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Pain+12
ADDRLP4 48
INDIRI4
ASGNI4
line 2779
;2778:
;2779:			gRodianSound_Death[0] = G_SoundIndex("sound/chars/rodian1/misc/death1");
ADDRGP4 $1170
ARGP4
ADDRLP4 52
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Death
ADDRLP4 52
INDIRI4
ASGNI4
line 2780
;2780:			gRodianSound_Death[1] = G_SoundIndex("sound/chars/rodian1/misc/death2");
ADDRGP4 $1172
ARGP4
ADDRLP4 56
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Death+4
ADDRLP4 56
INDIRI4
ASGNI4
line 2781
;2781:			gRodianSound_Death[2] = G_SoundIndex("sound/chars/rodian1/misc/death3");
ADDRGP4 $1174
ARGP4
ADDRLP4 60
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Death+8
ADDRLP4 60
INDIRI4
ASGNI4
line 2783
;2782:
;2783:			gRodianSound_Alert[0] = G_SoundIndex("sound/chars/rodian1/misc/detected1");
ADDRGP4 $1175
ARGP4
ADDRLP4 64
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Alert
ADDRLP4 64
INDIRI4
ASGNI4
line 2784
;2784:			gRodianSound_Alert[1] = G_SoundIndex("sound/chars/rodian1/misc/detected2");
ADDRGP4 $1177
ARGP4
ADDRLP4 68
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Alert+4
ADDRLP4 68
INDIRI4
ASGNI4
line 2785
;2785:			gRodianSound_Alert[2] = G_SoundIndex("sound/chars/rodian1/misc/detected3");
ADDRGP4 $1179
ARGP4
ADDRLP4 72
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Alert+8
ADDRLP4 72
INDIRI4
ASGNI4
line 2786
;2786:			gRodianSound_Alert[3] = G_SoundIndex("sound/chars/rodian1/misc/detected4");
ADDRGP4 $1181
ARGP4
ADDRLP4 76
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Alert+12
ADDRLP4 76
INDIRI4
ASGNI4
line 2787
;2787:			gRodianSound_Alert[4] = G_SoundIndex("sound/chars/rodian1/misc/detected5");
ADDRGP4 $1183
ARGP4
ADDRLP4 80
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Alert+16
ADDRLP4 80
INDIRI4
ASGNI4
line 2788
;2788:		}
line 2789
;2789:	}
ADDRGP4 $1160
JUMPV
LABELV $1159
line 2790
;2790:	else if (aeType == ANIMENT_TYPE_JAN)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $1184
line 2791
;2791:	{
line 2792
;2792:		if (!gJanSound_Pain[0])
ADDRGP4 gJanSound_Pain
INDIRI4
CNSTI4 0
NEI4 $1186
line 2793
;2793:		{
line 2794
;2794:			gJanSound_Pain[0] = G_SoundIndex("sound/chars/jan/misc/pain25");
ADDRGP4 $1188
ARGP4
ADDRLP4 36
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Pain
ADDRLP4 36
INDIRI4
ASGNI4
line 2795
;2795:			gJanSound_Pain[1] = G_SoundIndex("sound/chars/jan/misc/pain50");
ADDRGP4 $1190
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Pain+4
ADDRLP4 40
INDIRI4
ASGNI4
line 2796
;2796:			gJanSound_Pain[2] = G_SoundIndex("sound/chars/jan/misc/pain75");
ADDRGP4 $1192
ARGP4
ADDRLP4 44
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Pain+8
ADDRLP4 44
INDIRI4
ASGNI4
line 2797
;2797:			gJanSound_Pain[3] = G_SoundIndex("sound/chars/jan/misc/pain100");
ADDRGP4 $1194
ARGP4
ADDRLP4 48
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Pain+12
ADDRLP4 48
INDIRI4
ASGNI4
line 2799
;2798:
;2799:			gJanSound_Death[0] = G_SoundIndex("sound/chars/jan/misc/death1");
ADDRGP4 $1195
ARGP4
ADDRLP4 52
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Death
ADDRLP4 52
INDIRI4
ASGNI4
line 2800
;2800:			gJanSound_Death[1] = G_SoundIndex("sound/chars/jan/misc/death2");
ADDRGP4 $1197
ARGP4
ADDRLP4 56
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Death+4
ADDRLP4 56
INDIRI4
ASGNI4
line 2801
;2801:			gJanSound_Death[2] = G_SoundIndex("sound/chars/jan/misc/death3");
ADDRGP4 $1199
ARGP4
ADDRLP4 60
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Death+8
ADDRLP4 60
INDIRI4
ASGNI4
line 2803
;2802:
;2803:			gJanSound_Alert[0] = G_SoundIndex("sound/chars/jan/misc/detected1");
ADDRGP4 $1200
ARGP4
ADDRLP4 64
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Alert
ADDRLP4 64
INDIRI4
ASGNI4
line 2804
;2804:			gJanSound_Alert[1] = G_SoundIndex("sound/chars/jan/misc/detected2");
ADDRGP4 $1202
ARGP4
ADDRLP4 68
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Alert+4
ADDRLP4 68
INDIRI4
ASGNI4
line 2805
;2805:			gJanSound_Alert[2] = G_SoundIndex("sound/chars/jan/misc/detected3");
ADDRGP4 $1204
ARGP4
ADDRLP4 72
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Alert+8
ADDRLP4 72
INDIRI4
ASGNI4
line 2806
;2806:			gJanSound_Alert[3] = G_SoundIndex("sound/chars/jan/misc/detected4");
ADDRGP4 $1206
ARGP4
ADDRLP4 76
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Alert+12
ADDRLP4 76
INDIRI4
ASGNI4
line 2807
;2807:			gJanSound_Alert[4] = G_SoundIndex("sound/chars/jan/misc/detected5");
ADDRGP4 $1208
ARGP4
ADDRLP4 80
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Alert+16
ADDRLP4 80
INDIRI4
ASGNI4
line 2808
;2808:		}
LABELV $1186
line 2809
;2809:	}
LABELV $1184
LABELV $1160
LABELV $1135
line 2811
;2810:
;2811:	animEnt = G_Spawn();
ADDRLP4 36
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
line 2813
;2812:
;2813:	animEnt->watertype = aeType; //set the animent type
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 2815
;2814:
;2815:	if (aeType == ANIMENT_TYPE_CUSTOM && aeInfo)
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $1209
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1209
line 2816
;2816:	{
line 2817
;2817:		ExampleAnimEntCustomDataEntry(animEnt, aeInfo->aeAlignment, aeInfo->aeWeapon, aeInfo->modelPath, aeInfo->soundPath);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRGP4 ExampleAnimEntCustomDataEntry
CALLV
pop
line 2818
;2818:		AnimEntCustomSoundPrecache(aeInfo);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 AnimEntCustomSoundPrecache
CALLV
pop
line 2819
;2819:	}
LABELV $1209
line 2821
;2820:
;2821:	animEnt->s.eType = ET_GRAPPLE; //ET_GRAPPLE is the reserved special type for G2 anim ents.
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 13
ASGNI4
line 2823
;2822:
;2823:	if (animEnt->watertype == ANIMENT_TYPE_STORMTROOPER)
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1211
line 2824
;2824:	{
line 2825
;2825:		animEnt->s.modelindex = G_ModelIndex( "models/players/stormtrooper/model.glm" );
ADDRGP4 $1213
ARGP4
ADDRLP4 40
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2826
;2826:	}
ADDRGP4 $1212
JUMPV
LABELV $1211
line 2827
;2827:	else if (animEnt->watertype == ANIMENT_TYPE_RODIAN)
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1214
line 2828
;2828:	{
line 2829
;2829:		animEnt->s.modelindex = G_ModelIndex( "models/players/rodian/model.glm" );
ADDRGP4 $1216
ARGP4
ADDRLP4 40
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2830
;2830:	}
ADDRGP4 $1215
JUMPV
LABELV $1214
line 2831
;2831:	else if (animEnt->watertype == ANIMENT_TYPE_JAN)
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1217
line 2832
;2832:	{
line 2833
;2833:		animEnt->s.modelindex = G_ModelIndex( "models/players/jan/model.glm" );
ADDRGP4 $1219
ARGP4
ADDRLP4 40
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2834
;2834:	}
ADDRGP4 $1218
JUMPV
LABELV $1217
line 2835
;2835:	else if (animEnt->watertype == ANIMENT_TYPE_CUSTOM)
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1220
line 2836
;2836:	{
line 2837
;2837:		animentCustomInfo_t *aeInfo = ExampleAnimEntCustomData(animEnt);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 ExampleAnimEntCustomData
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRP4
ASGNP4
line 2839
;2838:
;2839:		if (aeInfo)
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1222
line 2840
;2840:		{
line 2841
;2841:			animEnt->s.modelindex = G_ModelIndex(aeInfo->modelPath);
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 2842
;2842:		}
ADDRGP4 $1221
JUMPV
LABELV $1222
line 2844
;2843:		else
;2844:		{
line 2845
;2845:			animEnt->s.modelindex = G_ModelIndex( "models/players/stormtrooper/model.glm" );
ADDRGP4 $1213
ARGP4
ADDRLP4 48
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 2846
;2846:		}
line 2847
;2847:	}
ADDRGP4 $1221
JUMPV
LABELV $1220
line 2849
;2848:	else
;2849:	{
line 2850
;2850:		G_Error("Unknown AnimEnt type!\n");
ADDRGP4 $1224
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 2851
;2851:	}
LABELV $1221
LABELV $1218
LABELV $1215
LABELV $1212
line 2853
;2852:
;2853:	animEnt->s.g2radius = 100;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 100
ASGNI4
line 2855
;2854:
;2855:	if (animEnt->watertype == ANIMENT_TYPE_STORMTROOPER)
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1225
line 2856
;2856:	{
line 2857
;2857:		animEnt->s.weapon = WP_BLASTER; //This will tell the client to stick a blaster in the model's hands upon model init.
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 4
ASGNI4
line 2858
;2858:	}
ADDRGP4 $1226
JUMPV
LABELV $1225
line 2859
;2859:	else if (animEnt->watertype == ANIMENT_TYPE_RODIAN)
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1227
line 2860
;2860:	{
line 2861
;2861:		animEnt->s.weapon = WP_DISRUPTOR; //These guys get disruptors instead of blasters.
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 5
ASGNI4
line 2862
;2862:	}
ADDRGP4 $1228
JUMPV
LABELV $1227
line 2863
;2863:	else if (animEnt->watertype == ANIMENT_TYPE_JAN)
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1229
line 2864
;2864:	{
line 2865
;2865:		animEnt->s.weapon = WP_BLASTER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 4
ASGNI4
line 2866
;2866:	}
ADDRGP4 $1230
JUMPV
LABELV $1229
line 2867
;2867:	else if (animEnt->watertype == ANIMENT_TYPE_CUSTOM)
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1231
line 2868
;2868:	{
line 2869
;2869:		animentCustomInfo_t *aeInfo = ExampleAnimEntCustomData(animEnt);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 ExampleAnimEntCustomData
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRP4
ASGNP4
line 2871
;2870:
;2871:		if (aeInfo)
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1233
line 2872
;2872:		{
line 2873
;2873:			animEnt->s.weapon = aeInfo->aeWeapon;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 2874
;2874:		}
ADDRGP4 $1234
JUMPV
LABELV $1233
line 2876
;2875:		else
;2876:		{
line 2877
;2877:			animEnt->s.weapon = WP_BLASTER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 4
ASGNI4
line 2878
;2878:		}
LABELV $1234
line 2879
;2879:	}
LABELV $1231
LABELV $1230
LABELV $1228
LABELV $1226
line 2881
;2880:
;2881:	animEnt->s.modelGhoul2 = 1; //Deal with it like any other ghoul2 ent, as far as killing instances.
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 2883
;2882:
;2883:	G_SetOrigin(animEnt, pos);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 2885
;2884:
;2885:	animEnt->classname = "g2animent";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $1235
ASGNP4
line 2887
;2886:			
;2887:	VectorCopy (playerMins, animEnt->r.mins);
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 2888
;2888:	VectorCopy (playerMaxs, animEnt->r.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 2890
;2889:
;2890:	animEnt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 2892
;2891:
;2892:	animEnt->clipmask = MASK_PLAYERSOLID;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 273
ASGNI4
line 2893
;2893:	animEnt->r.contents = MASK_PLAYERSOLID;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 273
ASGNI4
line 2895
;2894:
;2895:	animEnt->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 2897
;2896:
;2897:	animEnt->health = 60;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 60
ASGNI4
line 2899
;2898:
;2899:	animEnt->s.owner = MAX_CLIENTS+1;
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 33
ASGNI4
line 2900
;2900:	animEnt->s.shouldtarget = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 268
ADDP4
CNSTI4 1
ASGNI4
line 2901
;2901:	animEnt->s.teamowner = 0;
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
CNSTI4 0
ASGNI4
line 2903
;2902:
;2903:	trap_LinkEntity(animEnt);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2905
;2904:
;2905:	animEnt->pain = ExampleAnimEnt_Pain;
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 ExampleAnimEnt_Pain
ASGNP4
line 2906
;2906:	animEnt->die = ExampleAnimEnt_Die;
ADDRLP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRGP4 ExampleAnimEnt_Die
ASGNP4
line 2908
;2907:
;2908:	animEnt->touch = ExampleAnimEntTouch;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 ExampleAnimEntTouch
ASGNP4
line 2910
;2909:
;2910:	animEnt->think = ExampleAnimEntUpdateSelf;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 ExampleAnimEntUpdateSelf
ASGNP4
line 2911
;2911:	animEnt->nextthink = level.time + 50;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 2913
;2912:
;2913:	animEnt->s.torsoAnim = BOTH_ATTACK3;
ADDRLP4 0
INDIRP4
CNSTI4 284
ADDP4
CNSTI4 120
ASGNI4
line 2914
;2914:	animEnt->s.legsAnim = BOTH_STAND3;
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
CNSTI4 576
ASGNI4
line 2917
;2915:
;2916:	//initialize the "AI" values
;2917:	animEnt->bolt_Waist = -1; //the waypoint index
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
CNSTI4 -1
ASGNI4
line 2918
;2918:	animEnt->bolt_Motion = ENTITYNUM_NONE; //the enemy index
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 1023
ASGNI4
line 2919
;2919:	animEnt->splashMethodOfDeath = 0; //don't stand still while you have an enemy
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 0
ASGNI4
line 2920
;2920:	animEnt->splashRadius = 0; //timer for randomly deciding to stand still
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTI4 0
ASGNI4
line 2921
;2921:	animEnt->boltpoint3 = 0; //running forward on the trail
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 0
ASGNI4
line 2922
;2922:}
LABELV $1129
endproc G_SpawnExampleAnimEnt 84 20
data
export gEscaping
align 4
LABELV gEscaping
byte 4 0
export gEscapeTime
align 4
LABELV gEscapeTime
byte 4 0
export AESpawner_CountAnimEnts
code
proc AESpawner_CountAnimEnts 12 0
line 2929
;2923:
;2924:qboolean gEscaping = qfalse;
;2925:int gEscapeTime = 0;
;2926:
;2927:#ifdef ANIMENT_SPAWNER
;2928:int AESpawner_CountAnimEnts(gentity_t *spawner, qboolean onlySameType)
;2929:{
line 2930
;2930:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2931
;2931:	int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1239
JUMPV
LABELV $1238
line 2934
;2932:
;2933:	while (i < MAX_GENTITIES)
;2934:	{
line 2935
;2935:		if (g_entities[i].inuse && g_entities[i].s.eType == ET_GRAPPLE)
ADDRLP4 8
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1241
ADDRLP4 8
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1241
line 2936
;2936:		{
line 2937
;2937:			if (!onlySameType)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1245
line 2938
;2938:			{
line 2939
;2939:				count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2940
;2940:			}
ADDRGP4 $1246
JUMPV
LABELV $1245
line 2942
;2941:			else
;2942:			{
line 2943
;2943:				if (spawner->watertype == g_entities[i].watertype)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+744
ADDP4
INDIRI4
NEI4 $1247
line 2944
;2944:				{
line 2945
;2945:					if (spawner->watertype == ANIMENT_TYPE_CUSTOM)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1250
line 2946
;2946:					{
line 2947
;2947:						if (spawner->waterlevel == g_entities[i].waterlevel)
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+748
ADDP4
INDIRI4
NEI4 $1251
line 2948
;2948:						{ //only count it if it's the same custom type template, indicated by equal "waterlevel" value.
line 2949
;2949:							count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2950
;2950:						}
line 2951
;2951:					}
ADDRGP4 $1251
JUMPV
LABELV $1250
line 2953
;2952:					else
;2953:					{
line 2954
;2954:						count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2955
;2955:					}
LABELV $1251
line 2956
;2956:				}
LABELV $1247
line 2957
;2957:			}
LABELV $1246
line 2958
;2958:		}
LABELV $1241
line 2959
;2959:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2960
;2960:	}
LABELV $1239
line 2933
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $1238
line 2962
;2961:
;2962:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $1237
endproc AESpawner_CountAnimEnts 12 0
export AESpawner_NoClientInPVS
proc AESpawner_NoClientInPVS 12 8
line 2966
;2963:}
;2964:
;2965:qboolean AESpawner_NoClientInPVS(gentity_t *ent)
;2966:{
line 2967
;2967:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1257
JUMPV
LABELV $1256
line 2970
;2968:
;2969:	while (i < MAX_CLIENTS)
;2970:	{
line 2971
;2971:		if (g_entities[i].inuse &&
ADDRLP4 4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1259
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1259
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1259
line 2974
;2972:			g_entities[i].client &&
;2973:			trap_InPVS(ent->s.origin, g_entities[i].client->ps.origin))
;2974:		{
line 2975
;2975:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1255
JUMPV
LABELV $1259
line 2978
;2976:		}
;2977:
;2978:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2979
;2979:	}
LABELV $1257
line 2969
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1256
line 2981
;2980:
;2981:	return qtrue;
CNSTI4 1
RETI4
LABELV $1255
endproc AESpawner_NoClientInPVS 12 8
export AESpawner_PassAnimEntPVSCheck
proc AESpawner_PassAnimEntPVSCheck 16 8
line 2985
;2982:}
;2983:
;2984:qboolean AESpawner_PassAnimEntPVSCheck(gentity_t *ent)
;2985:{
line 2986
;2986:	int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2987
;2987:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2989
;2988:
;2989:	if (!ent->bolt_LArm)
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1268
line 2990
;2990:	{ //unlimited
line 2991
;2991:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1264
JUMPV
LABELV $1267
line 2995
;2992:	}
;2993:
;2994:	while (i < MAX_GENTITIES)
;2995:	{
line 2996
;2996:		if (g_entities[i].inuse && g_entities[i].s.eType == ET_GRAPPLE &&
ADDRLP4 8
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1270
ADDRLP4 8
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1270
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
ADDRGP4 g_entities+296+72
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1270
line 2998
;2997:			trap_InPVS(ent->r.currentOrigin, g_entities[i].r.currentOrigin))
;2998:		{
line 2999
;2999:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3000
;3000:		}
LABELV $1270
line 3002
;3001:
;3002:		if (count >= ent->bolt_LArm)
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
LTI4 $1276
line 3003
;3003:		{ //too many in this pvs..
line 3004
;3004:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1264
JUMPV
LABELV $1276
line 3006
;3005:		}
;3006:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3007
;3007:	}
LABELV $1268
line 2994
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $1267
line 3009
;3008:
;3009:	return qtrue;
CNSTI4 1
RETI4
LABELV $1264
endproc AESpawner_PassAnimEntPVSCheck 16 8
export AESpawner_Think
proc AESpawner_Think 1144 28
line 3013
;3010:}
;3011:
;3012:void AESpawner_Think(gentity_t *ent)
;3013:{
line 3015
;3014:	int animEntCount;
;3015:	animentCustomInfo_t *aeInfo = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 3017
;3016:
;3017:	if (gBotEdit)
ADDRGP4 gBotEdit
INDIRF4
CNSTF4 0
EQF4 $1279
line 3018
;3018:	{
line 3019
;3019:		ent->nextthink = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 3020
;3020:		return;
ADDRGP4 $1278
JUMPV
LABELV $1279
line 3023
;3021:	}
;3022:
;3023:	if (!ent->bolt_LLeg)
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1282
line 3024
;3024:	{
line 3025
;3025:		animEntCount = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 3026
;3026:	}
ADDRGP4 $1283
JUMPV
LABELV $1282
line 3028
;3027:	else
;3028:	{
line 3029
;3029:		qboolean onlySameType = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3031
;3030:
;3031:		if (ent->bolt_RLeg)
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1284
line 3032
;3032:		{
line 3033
;3033:			onlySameType = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 3034
;3034:		}
LABELV $1284
line 3035
;3035:		animEntCount = AESpawner_CountAnimEnts(ent, onlySameType);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 AESpawner_CountAnimEnts
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 3036
;3036:	}
LABELV $1283
line 3038
;3037:
;3038:	if (animEntCount < ent->bolt_LLeg)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
GEI4 $1286
line 3039
;3039:	{
line 3044
;3040:		trace_t tr;
;3041:		vec3_t playerMins;
;3042:		vec3_t playerMaxs;
;3043:
;3044:		VectorSet(playerMins, -15, -15, DEFAULT_MINS_2);
ADDRLP4 1112
CNSTF4 3245342720
ASGNF4
ADDRLP4 8
ADDRLP4 1112
INDIRF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 1112
INDIRF4
ASGNF4
ADDRLP4 8+8
CNSTF4 3250585600
ASGNF4
line 3045
;3045:		VectorSet(playerMaxs, 15, 15, DEFAULT_MAXS_2);
ADDRLP4 1116
CNSTF4 1097859072
ASGNF4
ADDRLP4 20
ADDRLP4 1116
INDIRF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 1116
INDIRF4
ASGNF4
ADDRLP4 20+8
CNSTF4 1109393408
ASGNF4
line 3047
;3046:
;3047:		trap_Trace(&tr, ent->s.origin, playerMins, playerMaxs, ent->s.origin, ent->s.number, MASK_PLAYERSOLID);
ADDRLP4 32
ARGP4
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
ADDRLP4 1120
INDIRP4
CNSTI4 92
ADDP4
ASGNP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 1120
INDIRP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 3049
;3048:
;3049:		if (tr.fraction == 1)
ADDRLP4 32+8
INDIRF4
CNSTF4 1065353216
NEF4 $1292
line 3050
;3050:		{
line 3051
;3051:			if (ent->bolt_Head || AESpawner_NoClientInPVS(ent))
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1297
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1132
ADDRGP4 AESpawner_NoClientInPVS
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
EQI4 $1295
LABELV $1297
line 3052
;3052:			{
line 3053
;3053:				if (AESpawner_PassAnimEntPVSCheck(ent))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1136
ADDRGP4 AESpawner_PassAnimEntPVSCheck
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 0
EQI4 $1298
line 3054
;3054:				{
line 3055
;3055:					if (ent->watertype == ANIMENT_TYPE_CUSTOM)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1300
line 3056
;3056:					{
line 3057
;3057:						aeInfo = ExampleAnimEntCustomData(ent); //we can get this info from the spawner, because it has its waterlevel set too.
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1140
ADDRGP4 ExampleAnimEntCustomData
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1140
INDIRP4
ASGNP4
line 3058
;3058:					}
LABELV $1300
line 3059
;3059:					G_SpawnExampleAnimEnt(ent->s.origin, ent->watertype, aeInfo);
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 1140
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_SpawnExampleAnimEnt
CALLV
pop
line 3060
;3060:				}
LABELV $1298
line 3061
;3061:			}
LABELV $1295
line 3062
;3062:		}
LABELV $1292
line 3063
;3063:	}
LABELV $1286
line 3065
;3064:
;3065:	ent->nextthink = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 3066
;3066:}
LABELV $1278
endproc AESpawner_Think 1144 28
export SP_misc_animent_spawner
proc SP_misc_animent_spawner 48 20
line 3069
;3067:
;3068:void SP_misc_animent_spawner(gentity_t *ent)
;3069:{
line 3070
;3070:	if (g_gametype.integer != GT_SINGLE_PLAYER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $1304
line 3071
;3071:	{
line 3072
;3072:		G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 3073
;3073:		return;
ADDRGP4 $1303
JUMPV
LABELV $1304
line 3076
;3074:	}
;3075:
;3076:	G_SpawnInt( "spawninpvs", "0", &ent->bolt_Head );
ADDRGP4 $1307
ARGP4
ADDRGP4 $115
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3078
;3077:	//If this is non-0, the spawner will spawn even if a client is in the PVS
;3078:	G_SpawnInt( "othersinpvs", "3", &ent->bolt_LArm);
ADDRGP4 $1308
ARGP4
ADDRGP4 $1309
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3081
;3079:	//Don't spawn more than this many animents in the PVS of this spawner.
;3080:	//If 0, the amount is unlimited.
;3081:	G_SpawnInt( "totalspawn", "12", &ent->bolt_LLeg);
ADDRGP4 $1310
ARGP4
ADDRGP4 $1311
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3084
;3082:	//Only spawn if less than or equal to this many ents active globally.
;3083:	//0 is unlimited, but that could cause horrible disaster.
;3084:	G_SpawnInt( "spawntype", "0", &ent->watertype);
ADDRGP4 $1312
ARGP4
ADDRGP4 $115
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3086
;3085:	//Spawn type. 0 is stormtrooper, 1 is rodian.
;3086:	G_SpawnInt( "sametype", "1", &ent->bolt_RLeg);
ADDRGP4 $1313
ARGP4
ADDRGP4 $1314
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3091
;3087:	//If 1, only counts other animates of the same type for deciding whether or not to spawn (as opposed to all types).
;3088:	//Default is 1.
;3089:
;3090:	//Just precache the assets now
;3091:	if (ent->watertype == ANIMENT_TYPE_STORMTROOPER)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1315
line 3092
;3092:	{
line 3093
;3093:		gTrooperSound_Pain[0] = G_SoundIndex("sound/chars/st1/misc/pain25");
ADDRGP4 $1138
ARGP4
ADDRLP4 0
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Pain
ADDRLP4 0
INDIRI4
ASGNI4
line 3094
;3094:		gTrooperSound_Pain[1] = G_SoundIndex("sound/chars/st1/misc/pain50");
ADDRGP4 $1140
ARGP4
ADDRLP4 4
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Pain+4
ADDRLP4 4
INDIRI4
ASGNI4
line 3095
;3095:		gTrooperSound_Pain[2] = G_SoundIndex("sound/chars/st1/misc/pain75");
ADDRGP4 $1142
ARGP4
ADDRLP4 8
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Pain+8
ADDRLP4 8
INDIRI4
ASGNI4
line 3096
;3096:		gTrooperSound_Pain[3] = G_SoundIndex("sound/chars/st1/misc/pain100");
ADDRGP4 $1144
ARGP4
ADDRLP4 12
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Pain+12
ADDRLP4 12
INDIRI4
ASGNI4
line 3098
;3097:
;3098:		gTrooperSound_Death[0] = G_SoundIndex("sound/chars/st1/misc/death1");
ADDRGP4 $1145
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Death
ADDRLP4 16
INDIRI4
ASGNI4
line 3099
;3099:		gTrooperSound_Death[1] = G_SoundIndex("sound/chars/st1/misc/death2");
ADDRGP4 $1147
ARGP4
ADDRLP4 20
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Death+4
ADDRLP4 20
INDIRI4
ASGNI4
line 3100
;3100:		gTrooperSound_Death[2] = G_SoundIndex("sound/chars/st1/misc/death3");
ADDRGP4 $1149
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Death+8
ADDRLP4 24
INDIRI4
ASGNI4
line 3102
;3101:
;3102:		gTrooperSound_Alert[0] = G_SoundIndex("sound/chars/st1/misc/detected1");
ADDRGP4 $1150
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Alert
ADDRLP4 28
INDIRI4
ASGNI4
line 3103
;3103:		gTrooperSound_Alert[1] = G_SoundIndex("sound/chars/st1/misc/detected2");
ADDRGP4 $1152
ARGP4
ADDRLP4 32
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Alert+4
ADDRLP4 32
INDIRI4
ASGNI4
line 3104
;3104:		gTrooperSound_Alert[2] = G_SoundIndex("sound/chars/st1/misc/detected3");
ADDRGP4 $1154
ARGP4
ADDRLP4 36
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Alert+8
ADDRLP4 36
INDIRI4
ASGNI4
line 3105
;3105:		gTrooperSound_Alert[3] = G_SoundIndex("sound/chars/st1/misc/detected4");
ADDRGP4 $1156
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Alert+12
ADDRLP4 40
INDIRI4
ASGNI4
line 3106
;3106:		gTrooperSound_Alert[4] = G_SoundIndex("sound/chars/st1/misc/detected5");
ADDRGP4 $1158
ARGP4
ADDRLP4 44
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Alert+16
ADDRLP4 44
INDIRI4
ASGNI4
line 3108
;3107:
;3108:		G_ModelIndex( "models/players/stormtrooper/model.glm" );
ADDRGP4 $1213
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 3109
;3109:	}
ADDRGP4 $1316
JUMPV
LABELV $1315
line 3110
;3110:	else if (ent->watertype == ANIMENT_TYPE_RODIAN)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1326
line 3111
;3111:	{
line 3112
;3112:		gRodianSound_Pain[0] = G_SoundIndex("sound/chars/rodian1/misc/pain25");
ADDRGP4 $1163
ARGP4
ADDRLP4 0
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Pain
ADDRLP4 0
INDIRI4
ASGNI4
line 3113
;3113:		gRodianSound_Pain[1] = G_SoundIndex("sound/chars/rodian1/misc/pain50");
ADDRGP4 $1165
ARGP4
ADDRLP4 4
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Pain+4
ADDRLP4 4
INDIRI4
ASGNI4
line 3114
;3114:		gRodianSound_Pain[2] = G_SoundIndex("sound/chars/rodian1/misc/pain75");
ADDRGP4 $1167
ARGP4
ADDRLP4 8
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Pain+8
ADDRLP4 8
INDIRI4
ASGNI4
line 3115
;3115:		gRodianSound_Pain[3] = G_SoundIndex("sound/chars/rodian1/misc/pain100");
ADDRGP4 $1169
ARGP4
ADDRLP4 12
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Pain+12
ADDRLP4 12
INDIRI4
ASGNI4
line 3117
;3116:
;3117:		gRodianSound_Death[0] = G_SoundIndex("sound/chars/rodian1/misc/death1");
ADDRGP4 $1170
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Death
ADDRLP4 16
INDIRI4
ASGNI4
line 3118
;3118:		gRodianSound_Death[1] = G_SoundIndex("sound/chars/rodian1/misc/death2");
ADDRGP4 $1172
ARGP4
ADDRLP4 20
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Death+4
ADDRLP4 20
INDIRI4
ASGNI4
line 3119
;3119:		gRodianSound_Death[2] = G_SoundIndex("sound/chars/rodian1/misc/death3");
ADDRGP4 $1174
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Death+8
ADDRLP4 24
INDIRI4
ASGNI4
line 3121
;3120:
;3121:		gRodianSound_Alert[0] = G_SoundIndex("sound/chars/rodian1/misc/detected1");
ADDRGP4 $1175
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Alert
ADDRLP4 28
INDIRI4
ASGNI4
line 3122
;3122:		gRodianSound_Alert[1] = G_SoundIndex("sound/chars/rodian1/misc/detected2");
ADDRGP4 $1177
ARGP4
ADDRLP4 32
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Alert+4
ADDRLP4 32
INDIRI4
ASGNI4
line 3123
;3123:		gRodianSound_Alert[2] = G_SoundIndex("sound/chars/rodian1/misc/detected3");
ADDRGP4 $1179
ARGP4
ADDRLP4 36
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Alert+8
ADDRLP4 36
INDIRI4
ASGNI4
line 3124
;3124:		gRodianSound_Alert[3] = G_SoundIndex("sound/chars/rodian1/misc/detected4");
ADDRGP4 $1181
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Alert+12
ADDRLP4 40
INDIRI4
ASGNI4
line 3125
;3125:		gRodianSound_Alert[4] = G_SoundIndex("sound/chars/rodian1/misc/detected5");
ADDRGP4 $1183
ARGP4
ADDRLP4 44
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Alert+16
ADDRLP4 44
INDIRI4
ASGNI4
line 3127
;3126:
;3127:		G_ModelIndex( "models/players/rodian/model.glm" );
ADDRGP4 $1216
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 3128
;3128:	}
ADDRGP4 $1327
JUMPV
LABELV $1326
line 3129
;3129:	else if (ent->watertype == ANIMENT_TYPE_JAN)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1337
line 3130
;3130:	{
line 3131
;3131:		gJanSound_Pain[0] = G_SoundIndex("sound/chars/jan/misc/pain25");
ADDRGP4 $1188
ARGP4
ADDRLP4 0
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Pain
ADDRLP4 0
INDIRI4
ASGNI4
line 3132
;3132:		gJanSound_Pain[1] = G_SoundIndex("sound/chars/jan/misc/pain50");
ADDRGP4 $1190
ARGP4
ADDRLP4 4
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Pain+4
ADDRLP4 4
INDIRI4
ASGNI4
line 3133
;3133:		gJanSound_Pain[2] = G_SoundIndex("sound/chars/jan/misc/pain75");
ADDRGP4 $1192
ARGP4
ADDRLP4 8
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Pain+8
ADDRLP4 8
INDIRI4
ASGNI4
line 3134
;3134:		gJanSound_Pain[3] = G_SoundIndex("sound/chars/jan/misc/pain100");
ADDRGP4 $1194
ARGP4
ADDRLP4 12
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Pain+12
ADDRLP4 12
INDIRI4
ASGNI4
line 3136
;3135:
;3136:		gJanSound_Death[0] = G_SoundIndex("sound/chars/jan/misc/death1");
ADDRGP4 $1195
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Death
ADDRLP4 16
INDIRI4
ASGNI4
line 3137
;3137:		gJanSound_Death[1] = G_SoundIndex("sound/chars/jan/misc/death2");
ADDRGP4 $1197
ARGP4
ADDRLP4 20
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Death+4
ADDRLP4 20
INDIRI4
ASGNI4
line 3138
;3138:		gJanSound_Death[2] = G_SoundIndex("sound/chars/jan/misc/death3");
ADDRGP4 $1199
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Death+8
ADDRLP4 24
INDIRI4
ASGNI4
line 3140
;3139:
;3140:		gJanSound_Alert[0] = G_SoundIndex("sound/chars/jan/misc/detected1");
ADDRGP4 $1200
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Alert
ADDRLP4 28
INDIRI4
ASGNI4
line 3141
;3141:		gJanSound_Alert[1] = G_SoundIndex("sound/chars/jan/misc/detected2");
ADDRGP4 $1202
ARGP4
ADDRLP4 32
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Alert+4
ADDRLP4 32
INDIRI4
ASGNI4
line 3142
;3142:		gJanSound_Alert[2] = G_SoundIndex("sound/chars/jan/misc/detected3");
ADDRGP4 $1204
ARGP4
ADDRLP4 36
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Alert+8
ADDRLP4 36
INDIRI4
ASGNI4
line 3143
;3143:		gJanSound_Alert[3] = G_SoundIndex("sound/chars/jan/misc/detected4");
ADDRGP4 $1206
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Alert+12
ADDRLP4 40
INDIRI4
ASGNI4
line 3144
;3144:		gJanSound_Alert[4] = G_SoundIndex("sound/chars/jan/misc/detected5");
ADDRGP4 $1208
ARGP4
ADDRLP4 44
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Alert+16
ADDRLP4 44
INDIRI4
ASGNI4
line 3146
;3145:
;3146:		G_ModelIndex( "models/players/jan/model.glm" );
ADDRGP4 $1219
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 3147
;3147:	}
ADDRGP4 $1338
JUMPV
LABELV $1337
line 3148
;3148:	else if (ent->watertype == ANIMENT_TYPE_CUSTOM)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1348
line 3149
;3149:	{
line 3150
;3150:		int alignment = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 3151
;3151:		int weapon = 3;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 3156
;3152:		char *model;
;3153:		char *soundpath;
;3154:		animentCustomInfo_t *aeInfo;
;3155:
;3156:		G_SpawnInt( "ae_aligned", "1", &alignment );
ADDRGP4 $1350
ARGP4
ADDRGP4 $1314
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3158
;3157:		//Alignedment - 1 is bad, 2 is good.
;3158:		G_SpawnInt( "ae_weapon", "3", &weapon);
ADDRGP4 $1351
ARGP4
ADDRGP4 $1309
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3160
;3159:		//Weapon - Same values as normal weapons.
;3160:		G_SpawnString( "ae_model", "models/players/stormtrooper/model.glm", &model);
ADDRGP4 $1352
ARGP4
ADDRGP4 $1213
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 3162
;3161:		//Model to use
;3162:		G_SpawnString( "ae_soundpath", "sound/chars/jan/misc", &soundpath);
ADDRGP4 $1353
ARGP4
ADDRGP4 $1354
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 3165
;3163:		//Sound path to use
;3164:
;3165:		ExampleAnimEntCustomDataEntry(ent, alignment, weapon, model, soundpath);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 ExampleAnimEntCustomDataEntry
CALLV
pop
line 3167
;3166:
;3167:		aeInfo = ExampleAnimEntCustomData(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 ExampleAnimEntCustomData
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 3169
;3168:
;3169:		if (aeInfo)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1355
line 3170
;3170:		{
line 3171
;3171:			AnimEntCustomSoundPrecache(aeInfo);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 AnimEntCustomSoundPrecache
CALLV
pop
line 3172
;3172:			G_ModelIndex( aeInfo->modelPath );
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 3173
;3173:		}
LABELV $1355
line 3174
;3174:	}
LABELV $1348
LABELV $1338
LABELV $1327
LABELV $1316
line 3176
;3175:
;3176:	ent->think = AESpawner_Think;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 AESpawner_Think
ASGNP4
line 3177
;3177:	ent->nextthink = level.time + Q_irand(50, 500);
CNSTI4 50
ARGI4
CNSTI4 500
ARGI4
ADDRLP4 0
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 3178
;3178:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 3179
;3179:}
LABELV $1303
endproc SP_misc_animent_spawner 48 20
export Use_Target_Screenshake
proc Use_Target_Screenshake 8 20
line 3182
;3180:
;3181:void Use_Target_Screenshake( gentity_t *ent, gentity_t *other, gentity_t *activator )
;3182:{
line 3183
;3183:	qboolean bGlobal = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3185
;3184:
;3185:	if (ent->bolt_LArm)
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1359
line 3186
;3186:	{
line 3187
;3187:		bGlobal = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 3188
;3188:	}
LABELV $1359
line 3190
;3189:
;3190:	G_ScreenShake(ent->s.origin, NULL, ent->speed, ent->bolt_Head, bGlobal);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_ScreenShake
CALLP4
pop
line 3191
;3191:}
LABELV $1358
endproc Use_Target_Screenshake 8 20
export SP_target_screenshake
proc SP_target_screenshake 0 12
line 3194
;3192:
;3193:void SP_target_screenshake(gentity_t *ent)
;3194:{
line 3195
;3195:	if (g_gametype.integer != GT_SINGLE_PLAYER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $1362
line 3196
;3196:	{
line 3197
;3197:		G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 3198
;3198:		return;
ADDRGP4 $1361
JUMPV
LABELV $1362
line 3201
;3199:	}
;3200:
;3201:	G_SpawnFloat( "intensity", "10", &ent->speed );
ADDRGP4 $1365
ARGP4
ADDRGP4 $1366
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 3203
;3202:	//intensity of the shake
;3203:	G_SpawnInt( "duration", "800", &ent->bolt_Head );
ADDRGP4 $1367
ARGP4
ADDRGP4 $1368
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3205
;3204:	//duration of the shake
;3205:	G_SpawnInt( "globalshake", "1", &ent->bolt_LArm );
ADDRGP4 $1369
ARGP4
ADDRGP4 $1314
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3208
;3206:	//non-0 if shake should be global (all clients). Otherwise, only in the PVS.
;3207:
;3208:	ent->use = Use_Target_Screenshake;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDRGP4 Use_Target_Screenshake
ASGNP4
line 3209
;3209:}
LABELV $1361
endproc SP_target_screenshake 0 12
export Use_Target_Escapetrig
proc Use_Target_Escapetrig 16 12
line 3214
;3210:
;3211:void LogExit( const char *string );
;3212:
;3213:void Use_Target_Escapetrig( gentity_t *ent, gentity_t *other, gentity_t *activator )
;3214:{
line 3215
;3215:	if (!ent->bolt_LArm)
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1371
line 3216
;3216:	{
line 3217
;3217:		gEscaping = qtrue;
ADDRGP4 gEscaping
CNSTI4 1
ASGNI4
line 3218
;3218:		gEscapeTime = level.time + ent->bolt_Head;
ADDRGP4 gEscapeTime
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ADDI4
ASGNI4
line 3219
;3219:	}
ADDRGP4 $1372
JUMPV
LABELV $1371
line 3220
;3220:	else if (gEscaping)
ADDRGP4 gEscaping
INDIRI4
CNSTI4 0
EQI4 $1374
line 3221
;3221:	{
line 3222
;3222:		int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3223
;3223:		gEscaping = qfalse;
ADDRGP4 gEscaping
CNSTI4 0
ASGNI4
ADDRGP4 $1377
JUMPV
LABELV $1376
line 3225
;3224:		while (i < MAX_CLIENTS)
;3225:		{ //all of the survivors get 100 points!
line 3226
;3226:			if (g_entities[i].inuse && g_entities[i].client && g_entities[i].health > 0 &&
ADDRLP4 4
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1379
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1379
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $1379
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1379
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 8
INDIRI4
NEI4 $1379
line 3229
;3227:				g_entities[i].client->sess.sessionTeam != TEAM_SPECTATOR &&
;3228:				!(g_entities[i].client->ps.pm_flags & PMF_FOLLOW))
;3229:			{
line 3230
;3230:				AddScore(&g_entities[i], g_entities[i].client->ps.origin, 100);
ADDRLP4 12
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 100
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 3231
;3231:			}
LABELV $1379
line 3232
;3232:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3233
;3233:		}
LABELV $1377
line 3224
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1376
line 3234
;3234:		if (activator && activator->inuse && activator->client)
ADDRLP4 4
ADDRFP4 8
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
EQU4 $1387
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1387
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $1387
line 3235
;3235:		{ //the one who escaped gets 500
line 3236
;3236:			AddScore(activator, activator->client->ps.origin, 500);
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 500
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 3237
;3237:		}
LABELV $1387
line 3239
;3238:
;3239:		LogExit("Escaped!");
ADDRGP4 $1389
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 3240
;3240:	}
LABELV $1374
LABELV $1372
line 3241
;3241:}
LABELV $1370
endproc Use_Target_Escapetrig 16 12
export SP_target_escapetrig
proc SP_target_escapetrig 0 12
line 3244
;3242:
;3243:void SP_target_escapetrig(gentity_t *ent)
;3244:{
line 3245
;3245:	if (g_gametype.integer != GT_SINGLE_PLAYER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $1391
line 3246
;3246:	{
line 3247
;3247:		G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 3248
;3248:		return;
ADDRGP4 $1390
JUMPV
LABELV $1391
line 3251
;3249:	}
;3250:
;3251:	G_SpawnInt( "escapetime", "60000", &ent->bolt_Head);
ADDRGP4 $1394
ARGP4
ADDRGP4 $1395
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3253
;3252:	//time given (in ms) for the escape
;3253:	G_SpawnInt( "escapegoal", "0", &ent->bolt_LArm);
ADDRGP4 $1396
ARGP4
ADDRGP4 $115
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3256
;3254:	//if non-0, when used, will end an ongoing escape instead of start it
;3255:
;3256:	ent->use = Use_Target_Escapetrig;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDRGP4 Use_Target_Escapetrig
ASGNP4
line 3257
;3257:}
LABELV $1390
endproc SP_target_escapetrig 0 12
export G_CreateExampleAnimEnt
proc G_CreateExampleAnimEnt 2116 16
line 3262
;3258:
;3259:#endif
;3260:
;3261:void G_CreateExampleAnimEnt(gentity_t *ent)
;3262:{
line 3266
;3263:	vec3_t fwd, fwdPos;
;3264:	animentCustomInfo_t aeInfo;
;3265:	char	arg[MAX_STRING_CHARS];
;3266:	int		iArg = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 3267
;3267:	int		argNum = trap_Argc();
ADDRLP4 1080
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 52
ADDRLP4 1080
INDIRI4
ASGNI4
line 3269
;3268:
;3269:	memset(&aeInfo, 0, sizeof(aeInfo));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 24
ARGI4
ADDRGP4 memset
CALLP4
pop
line 3271
;3270:
;3271:	if (argNum > 1)
ADDRLP4 52
INDIRI4
CNSTI4 1
LEI4 $1398
line 3272
;3272:	{
line 3273
;3273:		trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 56
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3275
;3274:
;3275:		iArg = atoi(arg);
ADDRLP4 56
ARGP4
ADDRLP4 1084
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 1084
INDIRI4
ASGNI4
line 3277
;3276:
;3277:		if (iArg < 0)
ADDRLP4 24
INDIRI4
CNSTI4 0
GEI4 $1400
line 3278
;3278:		{
line 3279
;3279:			iArg = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 3280
;3280:		}
LABELV $1400
line 3281
;3281:		if (iArg >= MAX_ANIMENTS)
ADDRLP4 24
INDIRI4
CNSTI4 4
LTI4 $1402
line 3282
;3282:		{
line 3283
;3283:			iArg = MAX_ANIMENTS-1;
ADDRLP4 24
CNSTI4 3
ASGNI4
line 3284
;3284:		}
LABELV $1402
line 3285
;3285:	}
LABELV $1398
line 3287
;3286:
;3287:	AngleVectors(ent->client->ps.viewangles, fwd, 0, 0);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 28
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
ADDRGP4 AngleVectors
CALLV
pop
line 3289
;3288:
;3289:	fwdPos[0] = ent->client->ps.origin[0] + fwd[0]*128;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 1124073472
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ASGNF4
line 3290
;3290:	fwdPos[1] = ent->client->ps.origin[1] + fwd[1]*128;
ADDRLP4 40+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 1124073472
ADDRLP4 28+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3291
;3291:	fwdPos[2] = ent->client->ps.origin[2] + fwd[2]*128;
ADDRLP4 40+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1124073472
ADDRLP4 28+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3293
;3292:
;3293:	if (iArg == ANIMENT_TYPE_CUSTOM)
ADDRLP4 24
INDIRI4
CNSTI4 3
NEI4 $1408
line 3294
;3294:	{
line 3297
;3295:		char arg2[MAX_STRING_CHARS];
;3296:
;3297:		if (argNum > 2)
ADDRLP4 52
INDIRI4
CNSTI4 2
LEI4 $1410
line 3298
;3298:		{
line 3299
;3299:			trap_Argv( 2, arg, sizeof( arg ) );
CNSTI4 2
ARGI4
ADDRLP4 56
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3300
;3300:			aeInfo.aeAlignment = atoi(arg);
ADDRLP4 56
ARGP4
ADDRLP4 2112
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2112
INDIRI4
ASGNI4
line 3301
;3301:		}
ADDRGP4 $1411
JUMPV
LABELV $1410
line 3303
;3302:		else
;3303:		{
line 3304
;3304:			aeInfo.aeAlignment = ANIMENT_ALIGNED_BAD;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 3305
;3305:		}
LABELV $1411
line 3307
;3306:
;3307:		if (argNum > 3)
ADDRLP4 52
INDIRI4
CNSTI4 3
LEI4 $1412
line 3308
;3308:		{
line 3309
;3309:			trap_Argv( 3, arg, sizeof( arg ) );
CNSTI4 3
ARGI4
ADDRLP4 56
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3310
;3310:			aeInfo.aeWeapon = atoi(arg);
ADDRLP4 56
ARGP4
ADDRLP4 2112
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 2112
INDIRI4
ASGNI4
line 3311
;3311:		}
ADDRGP4 $1413
JUMPV
LABELV $1412
line 3313
;3312:		else
;3313:		{
line 3314
;3314:			aeInfo.aeWeapon = WP_BRYAR_PISTOL;
ADDRLP4 0+8
CNSTI4 3
ASGNI4
line 3315
;3315:		}
LABELV $1413
line 3317
;3316:
;3317:		if (argNum > 4)
ADDRLP4 52
INDIRI4
CNSTI4 4
LEI4 $1416
line 3318
;3318:		{
line 3319
;3319:			trap_Argv( 4, arg, sizeof( arg ) );
CNSTI4 4
ARGI4
ADDRLP4 56
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3320
;3320:			aeInfo.modelPath = arg;
ADDRLP4 0+12
ADDRLP4 56
ASGNP4
line 3321
;3321:		}
ADDRGP4 $1417
JUMPV
LABELV $1416
line 3323
;3322:		else
;3323:		{
line 3324
;3324:			aeInfo.modelPath = "models/players/stormtrooper/model.glm";
ADDRLP4 0+12
ADDRGP4 $1213
ASGNP4
line 3325
;3325:		}
LABELV $1417
line 3327
;3326:
;3327:		if (argNum > 5)
ADDRLP4 52
INDIRI4
CNSTI4 5
LEI4 $1420
line 3328
;3328:		{
line 3329
;3329:			trap_Argv( 5, arg2, sizeof( arg2 ) );
CNSTI4 5
ARGI4
ADDRLP4 1088
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3330
;3330:			aeInfo.soundPath = arg2;
ADDRLP4 0+16
ADDRLP4 1088
ASGNP4
line 3331
;3331:		}
ADDRGP4 $1421
JUMPV
LABELV $1420
line 3333
;3332:		else
;3333:		{
line 3334
;3334:			aeInfo.soundPath = "sound/chars/jan/misc";
ADDRLP4 0+16
ADDRGP4 $1354
ASGNP4
line 3335
;3335:		}
LABELV $1421
line 3336
;3336:	}
LABELV $1408
line 3338
;3337:
;3338:	G_SpawnExampleAnimEnt(fwdPos, iArg, &aeInfo);
ADDRLP4 40
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnExampleAnimEnt
CALLV
pop
line 3339
;3339:}
LABELV $1397
endproc G_CreateExampleAnimEnt 2116 16
import LogExit
import AnimEntFireWeapon
import G_PickDeathAnim
bss
export gJanSound_Alert
align 4
LABELV gJanSound_Alert
skip 20
export gJanSound_Death
align 4
LABELV gJanSound_Death
skip 12
export gJanSound_Pain
align 4
LABELV gJanSound_Pain
skip 16
export gRodianSound_Alert
align 4
LABELV gRodianSound_Alert
skip 20
export gRodianSound_Death
align 4
LABELV gRodianSound_Death
skip 12
export gRodianSound_Pain
align 4
LABELV gRodianSound_Pain
skip 16
export gTrooperSound_Alert
align 4
LABELV gTrooperSound_Alert
skip 20
export gTrooperSound_Death
align 4
LABELV gTrooperSound_Death
skip 12
export gTrooperSound_Pain
align 4
LABELV gTrooperSound_Pain
skip 16
import g_MaxHolocronCarry
import floattime
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
import eFlagBlue
import eFlagRed
import oFlagBlue
import flagBlue
import oFlagRed
import flagRed
import bot_wp_visconnect
import bot_wp_distconnect
import bot_wp_clearweight
import bot_wp_edit
import bot_wp_info
import bot_camp
import bot_attachments
import bot_honorableduelacceptance
import bot_forgimmick
import bot_forcepowers
import ConcatArgs
import GetBestIdleGoal
import GetNearestVisibleWP
import BotIsAChickenWuss
import OrgVisibleBox
import BotWaypointRender
import StandardBotAI
import BotDoChat
import BotUtilizePersonality
import NumBots
import BotResetState
import B_Free
import B_Alloc
import B_TempFree
import B_TempAlloc
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
LABELV $1396
char 1 101
char 1 115
char 1 99
char 1 97
char 1 112
char 1 101
char 1 103
char 1 111
char 1 97
char 1 108
char 1 0
align 1
LABELV $1395
char 1 54
char 1 48
char 1 48
char 1 48
char 1 48
char 1 0
align 1
LABELV $1394
char 1 101
char 1 115
char 1 99
char 1 97
char 1 112
char 1 101
char 1 116
char 1 105
char 1 109
char 1 101
char 1 0
align 1
LABELV $1389
char 1 69
char 1 115
char 1 99
char 1 97
char 1 112
char 1 101
char 1 100
char 1 33
char 1 0
align 1
LABELV $1369
char 1 103
char 1 108
char 1 111
char 1 98
char 1 97
char 1 108
char 1 115
char 1 104
char 1 97
char 1 107
char 1 101
char 1 0
align 1
LABELV $1368
char 1 56
char 1 48
char 1 48
char 1 0
align 1
LABELV $1367
char 1 100
char 1 117
char 1 114
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $1366
char 1 49
char 1 48
char 1 0
align 1
LABELV $1365
char 1 105
char 1 110
char 1 116
char 1 101
char 1 110
char 1 115
char 1 105
char 1 116
char 1 121
char 1 0
align 1
LABELV $1354
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 106
char 1 97
char 1 110
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 0
align 1
LABELV $1353
char 1 97
char 1 101
char 1 95
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 112
char 1 97
char 1 116
char 1 104
char 1 0
align 1
LABELV $1352
char 1 97
char 1 101
char 1 95
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $1351
char 1 97
char 1 101
char 1 95
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 0
align 1
LABELV $1350
char 1 97
char 1 101
char 1 95
char 1 97
char 1 108
char 1 105
char 1 103
char 1 110
char 1 101
char 1 100
char 1 0
align 1
LABELV $1314
char 1 49
char 1 0
align 1
LABELV $1313
char 1 115
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $1312
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 116
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $1311
char 1 49
char 1 50
char 1 0
align 1
LABELV $1310
char 1 116
char 1 111
char 1 116
char 1 97
char 1 108
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 0
align 1
LABELV $1309
char 1 51
char 1 0
align 1
LABELV $1308
char 1 111
char 1 116
char 1 104
char 1 101
char 1 114
char 1 115
char 1 105
char 1 110
char 1 112
char 1 118
char 1 115
char 1 0
align 1
LABELV $1307
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 105
char 1 110
char 1 112
char 1 118
char 1 115
char 1 0
align 1
LABELV $1235
char 1 103
char 1 50
char 1 97
char 1 110
char 1 105
char 1 109
char 1 101
char 1 110
char 1 116
char 1 0
align 1
LABELV $1224
char 1 85
char 1 110
char 1 107
char 1 110
char 1 111
char 1 119
char 1 110
char 1 32
char 1 65
char 1 110
char 1 105
char 1 109
char 1 69
char 1 110
char 1 116
char 1 32
char 1 116
char 1 121
char 1 112
char 1 101
char 1 33
char 1 10
char 1 0
align 1
LABELV $1219
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
char 1 106
char 1 97
char 1 110
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
LABELV $1216
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
char 1 114
char 1 111
char 1 100
char 1 105
char 1 97
char 1 110
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
LABELV $1213
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
char 1 115
char 1 116
char 1 111
char 1 114
char 1 109
char 1 116
char 1 114
char 1 111
char 1 111
char 1 112
char 1 101
char 1 114
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
LABELV $1208
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 106
char 1 97
char 1 110
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 53
char 1 0
align 1
LABELV $1206
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 106
char 1 97
char 1 110
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 52
char 1 0
align 1
LABELV $1204
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 106
char 1 97
char 1 110
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 51
char 1 0
align 1
LABELV $1202
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 106
char 1 97
char 1 110
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 50
char 1 0
align 1
LABELV $1200
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 106
char 1 97
char 1 110
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 49
char 1 0
align 1
LABELV $1199
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 106
char 1 97
char 1 110
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 51
char 1 0
align 1
LABELV $1197
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 106
char 1 97
char 1 110
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 50
char 1 0
align 1
LABELV $1195
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 106
char 1 97
char 1 110
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 49
char 1 0
align 1
LABELV $1194
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 106
char 1 97
char 1 110
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 112
char 1 97
char 1 105
char 1 110
char 1 49
char 1 48
char 1 48
char 1 0
align 1
LABELV $1192
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 106
char 1 97
char 1 110
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 112
char 1 97
char 1 105
char 1 110
char 1 55
char 1 53
char 1 0
align 1
LABELV $1190
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 106
char 1 97
char 1 110
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 112
char 1 97
char 1 105
char 1 110
char 1 53
char 1 48
char 1 0
align 1
LABELV $1188
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 106
char 1 97
char 1 110
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 112
char 1 97
char 1 105
char 1 110
char 1 50
char 1 53
char 1 0
align 1
LABELV $1183
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 114
char 1 111
char 1 100
char 1 105
char 1 97
char 1 110
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 53
char 1 0
align 1
LABELV $1181
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 114
char 1 111
char 1 100
char 1 105
char 1 97
char 1 110
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 52
char 1 0
align 1
LABELV $1179
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 114
char 1 111
char 1 100
char 1 105
char 1 97
char 1 110
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 51
char 1 0
align 1
LABELV $1177
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 114
char 1 111
char 1 100
char 1 105
char 1 97
char 1 110
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 50
char 1 0
align 1
LABELV $1175
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 114
char 1 111
char 1 100
char 1 105
char 1 97
char 1 110
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 49
char 1 0
align 1
LABELV $1174
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 114
char 1 111
char 1 100
char 1 105
char 1 97
char 1 110
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 51
char 1 0
align 1
LABELV $1172
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 114
char 1 111
char 1 100
char 1 105
char 1 97
char 1 110
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 50
char 1 0
align 1
LABELV $1170
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 114
char 1 111
char 1 100
char 1 105
char 1 97
char 1 110
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 49
char 1 0
align 1
LABELV $1169
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 114
char 1 111
char 1 100
char 1 105
char 1 97
char 1 110
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 112
char 1 97
char 1 105
char 1 110
char 1 49
char 1 48
char 1 48
char 1 0
align 1
LABELV $1167
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 114
char 1 111
char 1 100
char 1 105
char 1 97
char 1 110
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 112
char 1 97
char 1 105
char 1 110
char 1 55
char 1 53
char 1 0
align 1
LABELV $1165
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 114
char 1 111
char 1 100
char 1 105
char 1 97
char 1 110
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 112
char 1 97
char 1 105
char 1 110
char 1 53
char 1 48
char 1 0
align 1
LABELV $1163
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 114
char 1 111
char 1 100
char 1 105
char 1 97
char 1 110
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 112
char 1 97
char 1 105
char 1 110
char 1 50
char 1 53
char 1 0
align 1
LABELV $1158
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 115
char 1 116
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 53
char 1 0
align 1
LABELV $1156
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 115
char 1 116
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 52
char 1 0
align 1
LABELV $1154
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 115
char 1 116
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 51
char 1 0
align 1
LABELV $1152
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 115
char 1 116
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 50
char 1 0
align 1
LABELV $1150
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 115
char 1 116
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 49
char 1 0
align 1
LABELV $1149
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 115
char 1 116
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 51
char 1 0
align 1
LABELV $1147
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 115
char 1 116
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 50
char 1 0
align 1
LABELV $1145
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 115
char 1 116
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 49
char 1 0
align 1
LABELV $1144
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 115
char 1 116
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 112
char 1 97
char 1 105
char 1 110
char 1 49
char 1 48
char 1 48
char 1 0
align 1
LABELV $1142
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 115
char 1 116
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 112
char 1 97
char 1 105
char 1 110
char 1 55
char 1 53
char 1 0
align 1
LABELV $1140
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 115
char 1 116
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 112
char 1 97
char 1 105
char 1 110
char 1 53
char 1 48
char 1 0
align 1
LABELV $1138
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 99
char 1 104
char 1 97
char 1 114
char 1 115
char 1 47
char 1 115
char 1 116
char 1 49
char 1 47
char 1 109
char 1 105
char 1 115
char 1 99
char 1 47
char 1 112
char 1 97
char 1 105
char 1 110
char 1 50
char 1 53
char 1 0
align 1
LABELV $534
char 1 37
char 1 115
char 1 47
char 1 100
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 53
char 1 0
align 1
LABELV $533
char 1 37
char 1 115
char 1 47
char 1 100
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 52
char 1 0
align 1
LABELV $532
char 1 37
char 1 115
char 1 47
char 1 100
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 51
char 1 0
align 1
LABELV $531
char 1 37
char 1 115
char 1 47
char 1 100
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 50
char 1 0
align 1
LABELV $530
char 1 37
char 1 115
char 1 47
char 1 100
char 1 101
char 1 116
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 49
char 1 0
align 1
LABELV $529
char 1 37
char 1 115
char 1 47
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 51
char 1 0
align 1
LABELV $528
char 1 37
char 1 115
char 1 47
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 50
char 1 0
align 1
LABELV $527
char 1 37
char 1 115
char 1 47
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 49
char 1 0
align 1
LABELV $526
char 1 37
char 1 115
char 1 47
char 1 112
char 1 97
char 1 105
char 1 110
char 1 49
char 1 48
char 1 48
char 1 0
align 1
LABELV $525
char 1 37
char 1 115
char 1 47
char 1 112
char 1 97
char 1 105
char 1 110
char 1 55
char 1 53
char 1 0
align 1
LABELV $524
char 1 37
char 1 115
char 1 47
char 1 112
char 1 97
char 1 105
char 1 110
char 1 53
char 1 48
char 1 0
align 1
LABELV $523
char 1 37
char 1 115
char 1 47
char 1 112
char 1 97
char 1 105
char 1 110
char 1 50
char 1 53
char 1 0
align 1
LABELV $486
char 1 94
char 1 49
char 1 69
char 1 82
char 1 82
char 1 79
char 1 82
char 1 58
char 1 32
char 1 102
char 1 120
char 1 95
char 1 114
char 1 117
char 1 110
char 1 110
char 1 101
char 1 114
char 1 32
char 1 37
char 1 115
char 1 32
char 1 97
char 1 116
char 1 32
char 1 37
char 1 115
char 1 32
char 1 104
char 1 97
char 1 115
char 1 32
char 1 110
char 1 111
char 1 32
char 1 102
char 1 120
char 1 70
char 1 105
char 1 108
char 1 101
char 1 32
char 1 115
char 1 112
char 1 101
char 1 99
char 1 105
char 1 102
char 1 105
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $482
char 1 102
char 1 120
char 1 84
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 0
align 1
LABELV $481
char 1 0
align 1
LABELV $480
char 1 102
char 1 120
char 1 70
char 1 105
char 1 108
char 1 101
char 1 0
align 1
LABELV $475
char 1 114
char 1 97
char 1 110
char 1 100
char 1 111
char 1 109
char 1 0
align 1
LABELV $474
char 1 52
char 1 48
char 1 48
char 1 0
align 1
LABELV $473
char 1 100
char 1 101
char 1 108
char 1 97
char 1 121
char 1 0
align 1
LABELV $467
char 1 102
char 1 120
char 1 95
char 1 114
char 1 117
char 1 110
char 1 110
char 1 101
char 1 114
char 1 95
char 1 108
char 1 105
char 1 110
char 1 107
char 1 58
char 1 32
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 32
char 1 119
char 1 97
char 1 115
char 1 32
char 1 115
char 1 112
char 1 101
char 1 99
char 1 105
char 1 102
char 1 105
char 1 101
char 1 100
char 1 32
char 1 98
char 1 117
char 1 116
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 118
char 1 97
char 1 108
char 1 105
char 1 100
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $460
char 1 32
char 1 32
char 1 45
char 1 97
char 1 115
char 1 115
char 1 117
char 1 109
char 1 105
char 1 110
char 1 103
char 1 32
char 1 85
char 1 80
char 1 32
char 1 111
char 1 114
char 1 105
char 1 101
char 1 110
char 1 116
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 46
char 1 10
char 1 0
align 1
LABELV $459
char 1 102
char 1 120
char 1 95
char 1 114
char 1 117
char 1 110
char 1 110
char 1 101
char 1 114
char 1 95
char 1 108
char 1 105
char 1 110
char 1 107
char 1 58
char 1 32
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 32
char 1 115
char 1 112
char 1 101
char 1 99
char 1 105
char 1 102
char 1 105
char 1 101
char 1 100
char 1 32
char 1 98
char 1 117
char 1 116
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
LABELV $402
char 1 100
char 1 109
char 1 103
char 1 95
char 1 98
char 1 111
char 1 120
char 1 0
align 1
LABELV $367
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
LABELV $333
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
LABELV $320
char 1 47
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
char 1 100
char 1 95
char 1 98
char 1 105
char 1 103
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $319
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
char 1 117
char 1 115
char 1 101
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 115
char 1 116
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $314
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 105
char 1 110
char 1 116
char 1 101
char 1 114
char 1 102
char 1 97
char 1 99
char 1 101
char 1 47
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 99
char 1 111
char 1 110
char 1 95
char 1 101
char 1 109
char 1 112
char 1 116
char 1 121
char 1 46
char 1 109
char 1 112
char 1 51
char 1 0
align 1
LABELV $312
char 1 47
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
char 1 97
char 1 95
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
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
char 1 46
char 1 109
char 1 100
char 1 51
char 1 0
align 1
LABELV $304
char 1 83
char 1 80
char 1 95
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
char 1 58
char 1 32
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
char 1 32
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 115
char 1 111
char 1 108
char 1 105
char 1 100
char 1 32
char 1 97
char 1 116
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $289
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 105
char 1 110
char 1 116
char 1 101
char 1 114
char 1 102
char 1 97
char 1 99
char 1 101
char 1 47
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 99
char 1 111
char 1 110
char 1 95
char 1 100
char 1 111
char 1 110
char 1 101
char 1 46
char 1 109
char 1 112
char 1 51
char 1 0
align 1
LABELV $272
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 105
char 1 110
char 1 116
char 1 101
char 1 114
char 1 102
char 1 97
char 1 99
char 1 101
char 1 47
char 1 115
char 1 104
char 1 105
char 1 101
char 1 108
char 1 100
char 1 99
char 1 111
char 1 110
char 1 95
char 1 114
char 1 117
char 1 110
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $260
char 1 99
char 1 104
char 1 97
char 1 114
char 1 103
char 1 101
char 1 114
char 1 97
char 1 116
char 1 101
char 1 0
align 1
LABELV $257
char 1 99
char 1 111
char 1 117
char 1 110
char 1 116
char 1 0
align 1
LABELV $208
char 1 83
char 1 80
char 1 95
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
char 1 58
char 1 32
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
char 1 32
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 115
char 1 111
char 1 108
char 1 105
char 1 100
char 1 32
char 1 97
char 1 116
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $115
char 1 48
char 1 0
align 1
LABELV $114
char 1 114
char 1 111
char 1 108
char 1 108
char 1 0
align 1
LABELV $98
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
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 109
char 1 105
char 1 115
char 1 99
char 1 95
char 1 112
char 1 97
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
char 1 10
char 1 0
