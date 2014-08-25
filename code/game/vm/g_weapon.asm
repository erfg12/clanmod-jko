export touch_NULL
code
proc touch_NULL 0 0
file "../g_weapon.c"
line 106
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_weapon.c 
;4:// perform the server side effects of a weapon firing
;5:
;6:#include "g_local.h"
;7:#include "be_aas.h"
;8:
;9:static	float	s_quadFactor;
;10:static	vec3_t	forward, right, up;
;11:static	vec3_t	muzzle;
;12:
;13:// Bryar Pistol
;14://--------
;15:#define BRYAR_PISTOL_VEL			1600
;16:#define BRYAR_PISTOL_DAMAGE			10
;17:#define BRYAR_CHARGE_UNIT			200.0f	// bryar charging gives us one more unit every 200ms--if you change this, you'll have to do the same in bg_pmove
;18:#define BRYAR_ALT_SIZE				1.0f
;19:
;20:// E11 Blaster
;21://---------
;22:#define BLASTER_SPREAD				1.6f//1.2f
;23:#define BLASTER_VELOCITY			2300
;24:#define BLASTER_DAMAGE				20
;25:
;26:// Tenloss Disruptor
;27://----------
;28:#define DISRUPTOR_MAIN_DAMAGE			30 //40
;29:#define DISRUPTOR_NPC_MAIN_DAMAGE_CUT	0.25f
;30:
;31:#define DISRUPTOR_ALT_DAMAGE			100 //125
;32:#define DISRUPTOR_NPC_ALT_DAMAGE_CUT	0.2f
;33:#define DISRUPTOR_ALT_TRACES			3		// can go through a max of 3 damageable(sp?) entities
;34:#define DISRUPTOR_CHARGE_UNIT			50.0f	// distruptor charging gives us one more unit every 50ms--if you change this, you'll have to do the same in bg_pmove
;35:
;36:// Wookiee Bowcaster
;37://----------
;38:#define	BOWCASTER_DAMAGE			50
;39:#define	BOWCASTER_VELOCITY			1300
;40:#define BOWCASTER_SPLASH_DAMAGE		0
;41:#define BOWCASTER_SPLASH_RADIUS		0
;42:#define BOWCASTER_SIZE				2
;43:
;44:#define BOWCASTER_ALT_SPREAD		5.0f
;45:#define BOWCASTER_VEL_RANGE			0.3f
;46:#define BOWCASTER_CHARGE_UNIT		200.0f	// bowcaster charging gives us one more unit every 200ms--if you change this, you'll have to do the same in bg_pmove
;47:
;48:// Heavy Repeater
;49://----------
;50:#define REPEATER_SPREAD				1.4f
;51:#define	REPEATER_DAMAGE				14
;52:#define	REPEATER_VELOCITY			1600
;53:
;54:#define REPEATER_ALT_SIZE				3	// half of bbox size
;55:#define	REPEATER_ALT_DAMAGE				60
;56:#define REPEATER_ALT_SPLASH_DAMAGE		60
;57:#define REPEATER_ALT_SPLASH_RADIUS		128
;58:#define	REPEATER_ALT_VELOCITY			1100
;59:
;60:// DEMP2
;61://----------
;62:#define	DEMP2_DAMAGE				35
;63:#define	DEMP2_VELOCITY				1800
;64:#define	DEMP2_SIZE					2		// half of bbox size
;65:
;66:#define DEMP2_ALT_DAMAGE			8 //12		// does 12, 36, 84 at each of the 3 charge levels.
;67:#define DEMP2_CHARGE_UNIT			700.0f	// demp2 charging gives us one more unit every 700ms--if you change this, you'll have to do the same in bg_weapons
;68:#define DEMP2_ALT_RANGE				4096
;69:#define DEMP2_ALT_SPLASHRADIUS		256
;70:
;71:// Golan Arms Flechette
;72://---------
;73:#define FLECHETTE_SHOTS				5
;74:#define FLECHETTE_SPREAD			4.0f
;75:#define FLECHETTE_DAMAGE			12//15
;76:#define FLECHETTE_VEL				3500
;77:#define FLECHETTE_SIZE				1
;78:#define FLECHETTE_MINE_RADIUS_CHECK	256
;79:#define FLECHETTE_ALT_DAMAGE		60
;80:#define FLECHETTE_ALT_SPLASH_DAM	60
;81:#define FLECHETTE_ALT_SPLASH_RAD	128
;82:
;83:// Personal Rocket Launcher
;84://---------
;85:#define	ROCKET_VELOCITY				900
;86:#define	ROCKET_DAMAGE				100
;87:#define	ROCKET_SPLASH_DAMAGE		100
;88:#define	ROCKET_SPLASH_RADIUS		160
;89:#define ROCKET_SIZE					3
;90:#define ROCKET_ALT_THINK_TIME		100
;91:
;92:// Stun Baton
;93://--------------
;94:#define STUN_BATON_DAMAGE			20
;95:#define STUN_BATON_ALT_DAMAGE		20
;96:#define STUN_BATON_RANGE			8
;97:
;98:
;99:extern qboolean G_BoxInBounds( vec3_t point, vec3_t mins, vec3_t maxs, vec3_t boundsMins, vec3_t boundsMaxs );
;100:
;101:static void WP_FireEmplaced( gentity_t *ent, qboolean altFire );
;102:
;103:void laserTrapStick( gentity_t *ent, vec3_t endpos, vec3_t normal );
;104:
;105:void touch_NULL( gentity_t *ent, gentity_t *other, trace_t *trace )
;106:{
line 108
;107:
;108:}
LABELV $79
endproc touch_NULL 0 0
export W_TraceSetStart
proc W_TraceSetStart 1140 28
line 115
;109:
;110:void laserTrapExplode( gentity_t *self );
;111:
;112://-----------------------------------------------------------------------------
;113:void W_TraceSetStart( gentity_t *ent, vec3_t start, vec3_t mins, vec3_t maxs )
;114://-----------------------------------------------------------------------------
;115:{
line 122
;116:	//make sure our start point isn't on the other side of a wall
;117:	trace_t	tr;
;118:	vec3_t	entMins;
;119:	vec3_t	entMaxs;
;120:	vec3_t	eyePoint;
;121:
;122:	VectorAdd( ent->r.currentOrigin, ent->r.mins, entMins );
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
ADDRLP4 1116
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 1116
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1080+4
ADDRLP4 1116
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 1116
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080+8
ADDRLP4 1120
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 1120
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDF4
ASGNF4
line 123
;123:	VectorAdd( ent->r.currentOrigin, ent->r.maxs, entMaxs );
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092
ADDRLP4 1124
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 1124
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1124
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 1124
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092+8
ADDRLP4 1128
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 1128
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
ASGNF4
line 125
;124:
;125:	if ( G_BoxInBounds( start, mins, maxs, entMins, entMaxs ) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1132
ADDRGP4 G_BoxInBounds
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
EQI4 $85
line 126
;126:	{
line 127
;127:		return;
ADDRGP4 $80
JUMPV
LABELV $85
line 130
;128:	}
;129:
;130:	if ( !ent->client )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $87
line 131
;131:	{
line 132
;132:		return;
ADDRGP4 $80
JUMPV
LABELV $87
line 135
;133:	}
;134:
;135:	VectorCopy( ent->s.pos.trBase, eyePoint);
ADDRLP4 1104
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 136
;136:	eyePoint[2] += ent->client->ps.viewheight;
ADDRLP4 1104+8
ADDRLP4 1104+8
INDIRF4
ADDRFP4 0
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
line 138
;137:		
;138:	trap_Trace( &tr, eyePoint, mins, maxs, start, ent->s.number, MASK_SOLID|CONTENTS_SHOTCLIP );
ADDRLP4 0
ARGP4
ADDRLP4 1104
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 129
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 140
;139:
;140:	if ( tr.startsolid || tr.allsolid )
ADDRLP4 1136
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1136
INDIRI4
NEI4 $93
ADDRLP4 0
INDIRI4
ADDRLP4 1136
INDIRI4
EQI4 $90
LABELV $93
line 141
;141:	{
line 142
;142:		return;
ADDRGP4 $80
JUMPV
LABELV $90
line 145
;143:	}
;144:
;145:	if ( tr.fraction < 1.0f )
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $94
line 146
;146:	{
line 147
;147:		VectorCopy( tr.endpos, start );
ADDRFP4 4
INDIRP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 148
;148:	}
LABELV $94
line 149
;149:}
LABELV $80
endproc W_TraceSetStart 1140 28
proc WP_FireBryarPistol 20 24
line 169
;150:
;151:
;152:/*
;153:----------------------------------------------
;154:	PLAYER WEAPONS
;155:----------------------------------------------
;156:*/
;157:
;158:/*
;159:======================================================================
;160:
;161:BRYAR PISTOL
;162:
;163:======================================================================
;164:*/
;165:
;166://----------------------------------------------
;167:static void WP_FireBryarPistol( gentity_t *ent, qboolean altFire )
;168://---------------------------------------------------------
;169:{
line 170
;170:	int damage = BRYAR_PISTOL_DAMAGE;
ADDRLP4 8
CNSTI4 10
ASGNI4
line 173
;171:	int count;
;172:
;173:	gentity_t	*missile = CreateMissile( muzzle, forward, BRYAR_PISTOL_VEL, 10000, ent, altFire );
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
CNSTF4 1153957888
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 175
;174:
;175:	missile->classname = "bryar_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $99
ASGNP4
line 176
;176:	missile->s.weapon = WP_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 3
ASGNI4
line 178
;177:
;178:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $100
line 179
;179:	{
line 180
;180:		float boxSize = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 182
;181:
;182:		count = ( level.time - ent->client->ps.weaponChargeTime ) / BRYAR_CHARGE_UNIT;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1128792064
DIVF4
CVFI4 4
ASGNI4
line 184
;183:
;184:		if ( count < 1 )
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $103
line 185
;185:		{
line 186
;186:			count = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 187
;187:		}
ADDRGP4 $104
JUMPV
LABELV $103
line 188
;188:		else if ( count > 5 )
ADDRLP4 4
INDIRI4
CNSTI4 5
LEI4 $105
line 189
;189:		{
line 190
;190:			count = 5;
ADDRLP4 4
CNSTI4 5
ASGNI4
line 191
;191:		}
LABELV $105
LABELV $104
line 193
;192:
;193:		if (count > 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
LEI4 $107
line 194
;194:		{
line 195
;195:			damage *= (count*1.7);
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1071225242
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
MULF4
CVFI4 4
ASGNI4
line 196
;196:		}
ADDRGP4 $108
JUMPV
LABELV $107
line 198
;197:		else
;198:		{
line 199
;199:			damage *= (count*1.5);
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1069547520
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
MULF4
CVFI4 4
ASGNI4
line 200
;200:		}
LABELV $108
line 202
;201:
;202:		missile->s.generic1 = count; // The missile will then render according to the charge level.
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 205
;203://		missile->count = count;		// The single player stores the charge in count, which isn't accessible on the client
;204:
;205:		boxSize = BRYAR_ALT_SIZE*(count*0.5);
ADDRLP4 16
CNSTF4 1065353216
CNSTF4 1056964608
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
MULF4
ASGNF4
line 207
;206:
;207:		VectorSet( missile->r.maxs, boxSize, boxSize, boxSize );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
line 208
;208:		VectorSet( missile->r.mins, -boxSize, -boxSize, -boxSize );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 16
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
ADDRLP4 16
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 16
INDIRF4
NEGF4
ASGNF4
line 209
;209:	}
LABELV $100
line 211
;210:
;211:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 212
;212:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 213
;213:	if (altFire)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $109
line 214
;214:	{
line 215
;215:		missile->methodOfDeath = MOD_BRYAR_PISTOL_ALT;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 5
ASGNI4
line 216
;216:	}
ADDRGP4 $110
JUMPV
LABELV $109
line 218
;217:	else
;218:	{
line 219
;219:		missile->methodOfDeath = MOD_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 4
ASGNI4
line 220
;220:	}
LABELV $110
line 221
;221:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 225
;222:
;223:	// we don't want it to bounce forever
;224:	// NOTENOTE These don't bounce yet.
;225:	missile->bounceCount = 8;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 8
ASGNI4
line 226
;226:}
LABELV $98
endproc WP_FireBryarPistol 20 24
export WP_FireTurretMissile
proc WP_FireTurretMissile 8 24
line 239
;227:
;228:/*
;229:======================================================================
;230:
;231:GENERIC
;232:
;233:======================================================================
;234:*/
;235:
;236://---------------------------------------------------------
;237:void WP_FireTurretMissile( gentity_t *ent, vec3_t start, vec3_t dir, qboolean altFire, int damage, int velocity, int mod, gentity_t *ignore )
;238://---------------------------------------------------------
;239:{
line 242
;240:	gentity_t *missile;
;241:
;242:	missile = CreateMissile( start, dir, velocity, 10000, ent, altFire );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
CVIF4 4
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 244
;243:
;244:	missile->classname = "generic_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $112
ASGNP4
line 245
;245:	missile->s.weapon = WP_TURRET;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 15
ASGNI4
line 247
;246:
;247:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 248
;248:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 249
;249:	missile->methodOfDeath = mod;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRFP4 24
INDIRI4
ASGNI4
line 250
;250:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 252
;251:
;252:	if (ignore)
ADDRFP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $113
line 253
;253:	{
line 254
;254:		missile->passThroughNum = ignore->s.number+1;
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRFP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 255
;255:	}
LABELV $113
line 259
;256:
;257:	// we don't want it to bounce forever
;258:	// NOTENOTE These don't bounce yet.
;259:	missile->bounceCount = 8;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 8
ASGNI4
line 260
;260:}
LABELV $111
endproc WP_FireTurretMissile 8 24
export WP_FireGenericBlasterMissile
proc WP_FireGenericBlasterMissile 8 24
line 267
;261:
;262://Currently only the seeker drone uses this, but it might be useful for other things as well.
;263:
;264://---------------------------------------------------------
;265:void WP_FireGenericBlasterMissile( gentity_t *ent, vec3_t start, vec3_t dir, qboolean altFire, int damage, int velocity, int mod )
;266://---------------------------------------------------------
;267:{
line 270
;268:	gentity_t *missile;
;269:
;270:	missile = CreateMissile( start, dir, velocity, 10000, ent, altFire );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
CVIF4 4
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 272
;271:
;272:	missile->classname = "generic_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $112
ASGNP4
line 273
;273:	missile->s.weapon = WP_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 3
ASGNI4
line 275
;274:
;275:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 276
;276:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 277
;277:	missile->methodOfDeath = mod;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRFP4 24
INDIRI4
ASGNI4
line 278
;278:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 282
;279:
;280:	// we don't want it to bounce forever
;281:	// NOTENOTE These don't bounce yet.
;282:	missile->bounceCount = 8;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 8
ASGNI4
line 283
;283:}
LABELV $115
endproc WP_FireGenericBlasterMissile 8 24
export WP_FireBlasterMissile
proc WP_FireBlasterMissile 16 24
line 296
;284:
;285:/*
;286:======================================================================
;287:
;288:BLASTER
;289:
;290:======================================================================
;291:*/
;292:
;293://---------------------------------------------------------
;294:void WP_FireBlasterMissile( gentity_t *ent, vec3_t start, vec3_t dir, qboolean altFire )
;295://---------------------------------------------------------
;296:{
line 297
;297:	int velocity	= BLASTER_VELOCITY;
ADDRLP4 8
CNSTI4 2300
ASGNI4
line 298
;298:	int	damage		= BLASTER_DAMAGE;
ADDRLP4 4
CNSTI4 20
ASGNI4
line 301
;299:	gentity_t *missile;
;300:
;301:	if (ent->s.eType == ET_GRAPPLE)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $117
line 302
;302:	{ //animent
line 303
;303:		damage = 10;
ADDRLP4 4
CNSTI4 10
ASGNI4
line 304
;304:	}
LABELV $117
line 312
;305:	// NOTENOTE Vehicle models are not yet implemented
;306:/*	if ( ent->client && ent->client->ps.vehicleModel != 0 )
;307:	{
;308:		velocity = 10000;
;309:	}
;310:*/
;311:	
;312:	missile = CreateMissile( start, dir, velocity, 10000, ent, altFire );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 314
;313:
;314:	missile->classname = "blaster_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $119
ASGNP4
line 315
;315:	missile->s.weapon = WP_BLASTER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 4
ASGNI4
line 324
;316:
;317:	// NOTENOTE Vehicle models are not yet implemented
;318:/*	if ( ent->client && ent->client->ps.vehicleModel != 0 )
;319:	{
;320:		damage = 250;
;321:	}
;322:	*/
;323:
;324:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 325
;325:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 326
;326:	missile->methodOfDeath = MOD_BLASTER;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 6
ASGNI4
line 327
;327:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 331
;328:
;329:	// we don't want it to bounce forever
;330:	// NOTENOTE These don't bounce yet.
;331:	missile->bounceCount = 8;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 8
ASGNI4
line 332
;332:}
LABELV $116
endproc WP_FireBlasterMissile 16 24
export WP_FireEmplacedMissile
proc WP_FireEmplacedMissile 16 24
line 337
;333:
;334://---------------------------------------------------------
;335:void WP_FireEmplacedMissile( gentity_t *ent, vec3_t start, vec3_t dir, qboolean altFire, gentity_t *ignore )
;336://---------------------------------------------------------
;337:{
line 338
;338:	int velocity	= BLASTER_VELOCITY;
ADDRLP4 4
CNSTI4 2300
ASGNI4
line 339
;339:	int	damage		= BLASTER_DAMAGE;
ADDRLP4 8
CNSTI4 20
ASGNI4
line 349
;340:	gentity_t *missile;
;341:
;342:	// NOTENOTE Vehicle models are not yet implemented
;343:/*	if ( ent->client && ent->client->ps.vehicleModel != 0 )
;344:	{
;345:		velocity = 10000;
;346:	}
;347:*/
;348:	
;349:	missile = CreateMissile( start, dir, velocity, 10000, ent, altFire );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 351
;350:
;351:	missile->classname = "emplaced_gun_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $121
ASGNP4
line 352
;352:	missile->s.weapon = WP_TURRET;//WP_EMPLACED_GUN;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 15
ASGNI4
line 361
;353:
;354:	// NOTENOTE Vehicle models are not yet implemented
;355:/*	if ( ent->client && ent->client->ps.vehicleModel != 0 )
;356:	{
;357:		damage = 250;
;358:	}
;359:	*/
;360:
;361:	missile->activator = ignore;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRFP4 16
INDIRP4
ASGNP4
line 363
;362:
;363:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 364
;364:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 365
;365:	missile->methodOfDeath = MOD_BLASTER;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 6
ASGNI4
line 366
;366:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 368
;367:
;368:	if (ignore)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $122
line 369
;369:	{
line 370
;370:		missile->passThroughNum = ignore->s.number+1;
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRFP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 371
;371:	}
LABELV $122
line 375
;372:
;373:	// we don't want it to bounce forever
;374:	// NOTENOTE These don't bounce yet.
;375:	missile->bounceCount = 8;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 8
ASGNI4
line 376
;376:}
LABELV $120
endproc WP_FireEmplacedMissile 16 24
proc WP_FireBlaster 32 16
line 381
;377:
;378://---------------------------------------------------------
;379:static void WP_FireBlaster( gentity_t *ent, qboolean altFire )
;380://---------------------------------------------------------
;381:{
line 384
;382:	vec3_t	dir, angs;
;383:
;384:	vectoangles( forward, angs );
ADDRGP4 forward
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 386
;385:
;386:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $125
line 387
;387:	{
line 389
;388:		// add some slop to the alt-fire direction
;389:		angs[PITCH] += crandom() * BLASTER_SPREAD;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1070386381
CNSTF4 1073741824
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 390
;390:		angs[YAW]	+= crandom() * BLASTER_SPREAD;
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1070386381
CNSTF4 1073741824
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 391
;391:	}
LABELV $125
line 393
;392:
;393:	AngleVectors( angs, dir, NULL, NULL );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
CNSTP4 0
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 396
;394:
;395:	// FIXME: if temp_org does not have clear trace to inside the bbox, don't shoot!
;396:	WP_FireBlasterMissile( ent, muzzle, dir, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBlasterMissile
CALLV
pop
line 397
;397:}
LABELV $124
endproc WP_FireBlaster 32 16
proc WP_DisruptorMainFire 1200 32
line 413
;398:
;399:
;400:
;401:int G_GetHitLocation(gentity_t *target, vec3_t ppoint);
;402:
;403:/*
;404:======================================================================
;405:
;406:DISRUPTOR
;407:
;408:======================================================================
;409:*/
;410://---------------------------------------------------------
;411:static void WP_DisruptorMainFire( gentity_t *ent )
;412://---------------------------------------------------------
;413:{
line 414
;414:	int			damage = DISRUPTOR_MAIN_DAMAGE;
ADDRLP4 1128
CNSTI4 30
ASGNI4
line 415
;415:	qboolean	render_impact = qtrue;
ADDRLP4 1124
CNSTI4 1
ASGNI4
line 419
;416:	vec3_t		start, end	/*, spot*/	;
;417:	trace_t		tr;
;418:	gentity_t	*traceEnt, *tent;
;419:	float		/*dist, */shotRange = 8192;
ADDRLP4 1120
CNSTF4 1174405120
ASGNF4
line 422
;420:	int			ignore, traces;
;421:
;422:	memset(&tr, 0, sizeof(tr)); //to shut the compiler up
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1080
ARGI4
ADDRGP4 memset
CALLP4
pop
line 424
;423:
;424:	VectorCopy( ent->client->ps.origin, start );
ADDRLP4 1084
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 425
;425:	start[2] += ent->client->ps.viewheight;//By eyes
ADDRLP4 1084+8
ADDRLP4 1084+8
INDIRF4
ADDRFP4 0
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
line 427
;426:
;427:	VectorMA( start, shotRange, forward, end );
ADDRLP4 1104
ADDRLP4 1084
INDIRF4
ADDRGP4 forward
INDIRF4
ADDRLP4 1120
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1104+4
ADDRLP4 1084+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
ADDRLP4 1120
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1104+8
ADDRLP4 1084+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
ADDRLP4 1120
INDIRF4
MULF4
ADDF4
ASGNF4
line 431
;428:
;429://	trap_Trace( &tr, start, NULL, NULL, end, ent->s.number, MASK_SHOT);
;430:
;431:	ignore = ent->s.number;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 432
;432:	traces = 0;
ADDRLP4 1100
CNSTI4 0
ASGNI4
ADDRGP4 $137
JUMPV
LABELV $136
line 434
;433:	while ( traces < 10 )
;434:	{//need to loop this in case we hit a Jedi who dodges the shot
line 435
;435:		trap_Trace( &tr, start, NULL, NULL, end, ignore, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRLP4 1084
ARGP4
ADDRLP4 1136
CNSTP4 0
ASGNP4
ADDRLP4 1136
INDIRP4
ARGP4
ADDRLP4 1136
INDIRP4
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1096
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 437
;436:
;437:		traceEnt = &g_entities[tr.entityNum];
ADDRLP4 0
CNSTI4 852
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 439
;438:
;439:		if (traceEnt && traceEnt->client && traceEnt->client->ps.duelInProgress &&
ADDRLP4 1144
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1144
INDIRU4
EQU4 $140
ADDRLP4 1148
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1148
INDIRP4
CVPU4 4
ADDRLP4 1144
INDIRU4
EQU4 $140
ADDRLP4 1148
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $140
ADDRLP4 1148
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $140
line 441
;440:			traceEnt->client->ps.duelIndex != ent->s.number)
;441:		{
line 442
;442:			VectorCopy( tr.endpos, start );
ADDRLP4 1084
ADDRLP4 4+12
INDIRB
ASGNB 12
line 443
;443:			ignore = tr.entityNum;
ADDRLP4 1096
ADDRLP4 4+52
INDIRI4
ASGNI4
line 444
;444:			traces++;
ADDRLP4 1100
ADDRLP4 1100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 445
;445:			continue;
ADDRGP4 $137
JUMPV
LABELV $140
line 448
;446:		}
;447:
;448:		if ( Jedi_DodgeEvasion( traceEnt, ent, &tr, G_GetHitLocation(traceEnt, tr.endpos) ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1152
ADDRGP4 G_GetHitLocation
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1152
INDIRI4
ARGI4
ADDRLP4 1156
ADDRGP4 Jedi_DodgeEvasion
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
EQI4 $144
line 449
;449:		{//act like we didn't even hit him
line 450
;450:			VectorCopy( tr.endpos, start );
ADDRLP4 1084
ADDRLP4 4+12
INDIRB
ASGNB 12
line 451
;451:			ignore = tr.entityNum;
ADDRLP4 1096
ADDRLP4 4+52
INDIRI4
ASGNI4
line 452
;452:			traces++;
ADDRLP4 1100
ADDRLP4 1100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 453
;453:			continue;
ADDRGP4 $137
JUMPV
LABELV $144
line 455
;454:		}
;455:		else if (traceEnt && traceEnt->client && traceEnt->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] >= FORCE_LEVEL_3)
ADDRLP4 1164
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1164
INDIRU4
EQU4 $138
ADDRLP4 1168
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1168
INDIRP4
CVPU4 4
ADDRLP4 1164
INDIRU4
EQU4 $138
ADDRLP4 1168
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 3
LTI4 $138
line 456
;456:		{
line 457
;457:			if (WP_SaberCanBlock(traceEnt, tr.endpos, 0, MOD_DISRUPTOR, qtrue, 0))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1172
CNSTI4 0
ASGNI4
ADDRLP4 1172
INDIRI4
ARGI4
CNSTI4 7
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 1172
INDIRI4
ARGI4
ADDRLP4 1176
ADDRGP4 WP_SaberCanBlock
CALLI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 0
EQI4 $138
line 458
;458:			{ //broadcast and stop the shot because it was blocked
line 459
;459:				gentity_t *te = NULL;
ADDRLP4 1180
CNSTP4 0
ASGNP4
line 461
;460:
;461:				tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_MAIN_SHOT );
ADDRLP4 4+12
ARGP4
CNSTI4 31
ARGI4
ADDRLP4 1184
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1116
ADDRLP4 1184
INDIRP4
ASGNP4
line 462
;462:				VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 1116
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 463
;463:				tent->s.eventParm = ent->s.number;
ADDRLP4 1116
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 465
;464:
;465:				te = G_TempEntity( tr.endpos, EV_SABER_BLOCK );
ADDRLP4 4+12
ARGP4
CNSTI4 28
ARGI4
ADDRLP4 1188
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1180
ADDRLP4 1188
INDIRP4
ASGNP4
line 466
;466:				VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 1180
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 4+12
INDIRB
ASGNB 12
line 467
;467:				VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 1180
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 4+24
INDIRB
ASGNB 12
line 468
;468:				if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 1196
CNSTF4 0
ASGNF4
ADDRLP4 1180
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 1196
INDIRF4
NEF4 $158
ADDRLP4 1180
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 1196
INDIRF4
NEF4 $158
ADDRLP4 1180
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 1196
INDIRF4
NEF4 $158
line 469
;469:				{
line 470
;470:					te->s.angles[1] = 1;
ADDRLP4 1180
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 471
;471:				}
LABELV $158
line 472
;472:				te->s.eventParm = 0;
ADDRLP4 1180
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 474
;473:
;474:				return;
ADDRGP4 $128
JUMPV
line 476
;475:			}
;476:		}
line 478
;477:		//a Jedi is not dodging this shot
;478:		break;
LABELV $137
line 433
ADDRLP4 1100
INDIRI4
CNSTI4 10
LTI4 $136
LABELV $138
line 481
;479:	}
;480:
;481:	if ( tr.surfaceFlags & SURF_NOIMPACT ) 
ADDRLP4 4+44
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $160
line 482
;482:	{
line 483
;483:		render_impact = qfalse;
ADDRLP4 1124
CNSTI4 0
ASGNI4
line 484
;484:	}
LABELV $160
line 487
;485:
;486:	// always render a shot beam, doing this the old way because I don't much feel like overriding the effect.
;487:	tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_MAIN_SHOT );
ADDRLP4 4+12
ARGP4
CNSTI4 31
ARGI4
ADDRLP4 1136
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1116
ADDRLP4 1136
INDIRP4
ASGNP4
line 488
;488:	VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 1116
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 489
;489:	tent->s.eventParm = ent->s.number;
ADDRLP4 1116
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 491
;490:
;491:	traceEnt = &g_entities[tr.entityNum];
ADDRLP4 0
CNSTI4 852
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 493
;492:
;493:	if ( render_impact )
ADDRLP4 1124
INDIRI4
CNSTI4 0
EQI4 $165
line 494
;494:	{
line 495
;495:		if ( tr.entityNum < ENTITYNUM_WORLD && traceEnt->takedamage )
ADDRLP4 4+52
INDIRI4
CNSTI4 1022
GEI4 $167
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $167
line 496
;496:		{
line 500
;497:			// Create a simple impact type mark that doesn't last long in the world
;498://			G_PlayEffect( G_EffectIndex( "disruptor/flesh_impact" ), tr.endpos, tr.plane.normal );
;499:
;500:			if ( traceEnt->client && LogAccuracyHit( traceEnt, ent )) 
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $170
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1144
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 1144
INDIRI4
CNSTI4 0
EQI4 $170
line 501
;501:			{
line 502
;502:				ent->client->accuracy_hits++;
ADDRLP4 1148
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1844
ADDP4
ASGNP4
ADDRLP4 1148
INDIRP4
ADDRLP4 1148
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 503
;503:			} 
LABELV $170
line 505
;504:
;505:			G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, DAMAGE_NORMAL, MOD_DISRUPTOR );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1128
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 507
;506:			
;507:			tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_HIT );
ADDRLP4 4+12
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1152
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1116
ADDRLP4 1152
INDIRP4
ASGNP4
line 508
;508:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 1156
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 1116
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 1156
INDIRI4
ASGNI4
line 509
;509:			if (traceEnt->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $168
line 510
;510:			{
line 511
;511:				tent->s.weapon = 1;
ADDRLP4 1116
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 1
ASGNI4
line 512
;512:			}
line 513
;513:		}
ADDRGP4 $168
JUMPV
LABELV $167
line 515
;514:		else 
;515:		{
line 517
;516:			 // Hmmm, maybe don't make any marks on things that could break
;517:			tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_SNIPER_MISS );
ADDRLP4 4+12
ARGP4
CNSTI4 33
ARGI4
ADDRLP4 1140
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1116
ADDRLP4 1140
INDIRP4
ASGNP4
line 518
;518:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 1144
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 1116
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 1144
INDIRI4
ASGNI4
line 519
;519:			tent->s.weapon = 1;
ADDRLP4 1116
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 1
ASGNI4
line 520
;520:		}
LABELV $168
line 521
;521:	}
LABELV $165
line 522
;522:}
LABELV $128
endproc WP_DisruptorMainFire 1200 32
export WP_DisruptorAltFire
proc WP_DisruptorAltFire 1252 32
line 528
;523:
;524:
;525://---------------------------------------------------------
;526:void WP_DisruptorAltFire( gentity_t *ent )
;527://---------------------------------------------------------
;528:{
line 529
;529:	int			damage = 0, skip;
ADDRLP4 1140
CNSTI4 0
ASGNI4
line 530
;530:	qboolean	render_impact = qtrue;
ADDRLP4 1124
CNSTI4 1
ASGNI4
line 535
;531:	vec3_t		start, end;
;532:	vec3_t		muzzle2;
;533:	trace_t		tr;
;534:	gentity_t	*traceEnt, *tent;
;535:	float		shotRange = 8192;
ADDRLP4 1116
CNSTF4 1174405120
ASGNF4
line 540
;536:	// float	dist, shotDist;
;537:	// vec3_t	spot, dir;
;538:	int			i;
;539:	int			count;
;540:	int			traces = DISRUPTOR_ALT_TRACES;
ADDRLP4 1132
CNSTI4 3
ASGNI4
line 541
;541:	qboolean	fullCharge = qfalse;
ADDRLP4 1128
CNSTI4 0
ASGNI4
line 543
;542:
;543:	damage = DISRUPTOR_ALT_DAMAGE-30;
ADDRLP4 1140
CNSTI4 70
ASGNI4
line 554
;544:
;545:	/*
;546:	if (ent->client->ps.zoomMode == 1 &&
;547:		ent->client->ps.zoomLocked)
;548:	{ //Scale the additional 25 damage based on the zoomFov for the client.
;549:	  //In this instance, zoomFov 1 is minimum zoom while zoomFov 50 is maximum.
;550:		damage += ent->client->ps.zoomFov/2;
;551:	}
;552:	*/
;553:
;554:	VectorCopy( muzzle, muzzle2 ); // making a backup copy
ADDRLP4 1144
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 556
;555:
;556:	if (ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $180
line 557
;557:	{
line 558
;558:		VectorCopy( ent->client->ps.origin, start );
ADDRLP4 1088
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 559
;559:		start[2] += ent->client->ps.viewheight;//By eyes
ADDRLP4 1088+8
ADDRLP4 1088+8
INDIRF4
ADDRFP4 0
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
line 561
;560:
;561:		count = ( level.time - ent->client->ps.weaponChargeTime ) / DISRUPTOR_CHARGE_UNIT;
ADDRLP4 1136
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1112014848
DIVF4
CVFI4 4
ASGNI4
line 562
;562:	}
ADDRGP4 $181
JUMPV
LABELV $180
line 564
;563:	else
;564:	{
line 565
;565:		VectorCopy( ent->r.currentOrigin, start );
ADDRLP4 1088
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 566
;566:		start[2] += 24;
ADDRLP4 1088+8
ADDRLP4 1088+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 568
;567:
;568:		count = ( 100 ) / DISRUPTOR_CHARGE_UNIT;
ADDRLP4 1136
CNSTI4 2
ASGNI4
line 569
;569:	}
LABELV $181
line 571
;570:
;571:	count *= 2;
ADDRLP4 1136
ADDRLP4 1136
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 573
;572:
;573:	if ( count < 1 )
ADDRLP4 1136
INDIRI4
CNSTI4 1
GEI4 $185
line 574
;574:	{
line 575
;575:		count = 1;
ADDRLP4 1136
CNSTI4 1
ASGNI4
line 576
;576:	}
ADDRGP4 $186
JUMPV
LABELV $185
line 577
;577:	else if ( count >= 60 )
ADDRLP4 1136
INDIRI4
CNSTI4 60
LTI4 $187
line 578
;578:	{
line 579
;579:		count = 60;
ADDRLP4 1136
CNSTI4 60
ASGNI4
line 580
;580:		fullCharge = qtrue;
ADDRLP4 1128
CNSTI4 1
ASGNI4
line 581
;581:	}
LABELV $187
LABELV $186
line 584
;582:
;583:	// more powerful charges go through more things
;584:	if ( count < 10 )
ADDRLP4 1136
INDIRI4
CNSTI4 10
GEI4 $189
line 585
;585:	{
line 586
;586:		traces = 1;
ADDRLP4 1132
CNSTI4 1
ASGNI4
line 587
;587:	}
ADDRGP4 $190
JUMPV
LABELV $189
line 588
;588:	else if ( count < 20 )
ADDRLP4 1136
INDIRI4
CNSTI4 20
GEI4 $191
line 589
;589:	{
line 590
;590:		traces = 2;
ADDRLP4 1132
CNSTI4 2
ASGNI4
line 591
;591:	}
LABELV $191
LABELV $190
line 593
;592:
;593:	damage += count;
ADDRLP4 1140
ADDRLP4 1140
INDIRI4
ADDRLP4 1136
INDIRI4
ADDI4
ASGNI4
line 595
;594:
;595:	skip = ent->s.number;
ADDRLP4 1112
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 597
;596:
;597:	for (i = 0; i < traces; i++ )
ADDRLP4 1120
CNSTI4 0
ASGNI4
ADDRGP4 $196
JUMPV
LABELV $193
line 598
;598:	{
line 599
;599:		VectorMA( start, shotRange, forward, end );
ADDRLP4 1100
ADDRLP4 1088
INDIRF4
ADDRGP4 forward
INDIRF4
ADDRLP4 1116
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 1088+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
ADDRLP4 1116
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1100+8
ADDRLP4 1088+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
ADDRLP4 1116
INDIRF4
MULF4
ADDF4
ASGNF4
line 601
;600:
;601:		trap_Trace ( &tr, start, NULL, NULL, end, skip, MASK_SHOT);
ADDRLP4 4
ARGP4
ADDRLP4 1088
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
ADDRLP4 1100
ARGP4
ADDRLP4 1112
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 603
;602:
;603:		if ( tr.surfaceFlags & SURF_NOIMPACT ) 
ADDRLP4 4+44
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $203
line 604
;604:		{
line 605
;605:			render_impact = qfalse;
ADDRLP4 1124
CNSTI4 0
ASGNI4
line 606
;606:		}
LABELV $203
line 608
;607:
;608:		traceEnt = &g_entities[tr.entityNum];
ADDRLP4 0
CNSTI4 852
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 610
;609:
;610:		if (traceEnt && traceEnt->client && traceEnt->client->ps.duelInProgress &&
ADDRLP4 1168
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1168
INDIRU4
EQU4 $207
ADDRLP4 1172
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1172
INDIRP4
CVPU4 4
ADDRLP4 1168
INDIRU4
EQU4 $207
ADDRLP4 1172
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $207
ADDRLP4 1172
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $207
line 612
;611:			traceEnt->client->ps.duelIndex != ent->s.number)
;612:		{
line 613
;613:			skip = tr.entityNum;
ADDRLP4 1112
ADDRLP4 4+52
INDIRI4
ASGNI4
line 614
;614:			VectorCopy(tr.endpos, start);
ADDRLP4 1088
ADDRLP4 4+12
INDIRB
ASGNB 12
line 615
;615:			continue;
ADDRGP4 $194
JUMPV
LABELV $207
line 618
;616:		}
;617:
;618:		if (Jedi_DodgeEvasion(traceEnt, ent, &tr, G_GetHitLocation(traceEnt, tr.endpos)))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1176
ADDRGP4 G_GetHitLocation
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1176
INDIRI4
ARGI4
ADDRLP4 1180
ADDRGP4 Jedi_DodgeEvasion
CALLI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 0
EQI4 $211
line 619
;619:		{
line 620
;620:			skip = tr.entityNum;
ADDRLP4 1112
ADDRLP4 4+52
INDIRI4
ASGNI4
line 621
;621:			VectorCopy(tr.endpos, start);
ADDRLP4 1088
ADDRLP4 4+12
INDIRB
ASGNB 12
line 622
;622:			continue;
ADDRGP4 $194
JUMPV
LABELV $211
line 624
;623:		}
;624:		else if (traceEnt && traceEnt->client && traceEnt->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] >= FORCE_LEVEL_3)
ADDRLP4 1188
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1188
INDIRU4
EQU4 $216
ADDRLP4 1192
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1192
INDIRP4
CVPU4 4
ADDRLP4 1188
INDIRU4
EQU4 $216
ADDRLP4 1192
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 3
LTI4 $216
line 625
;625:		{
line 626
;626:			if (WP_SaberCanBlock(traceEnt, tr.endpos, 0, MOD_DISRUPTOR_SNIPER, qtrue, 0))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1196
CNSTI4 0
ASGNI4
ADDRLP4 1196
INDIRI4
ARGI4
CNSTI4 9
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 1196
INDIRI4
ARGI4
ADDRLP4 1200
ADDRGP4 WP_SaberCanBlock
CALLI4
ASGNI4
ADDRLP4 1200
INDIRI4
CNSTI4 0
EQI4 $218
line 627
;627:			{ //broadcast and stop the shot because it was blocked
line 628
;628:				gentity_t *te = NULL;
ADDRLP4 1204
CNSTP4 0
ASGNP4
line 630
;629:
;630:				tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_SNIPER_SHOT );
ADDRLP4 4+12
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 1208
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1208
INDIRP4
ASGNP4
line 631
;631:				VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 1084
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 632
;632:				tent->s.shouldtarget = fullCharge;
ADDRLP4 1084
INDIRP4
CNSTI4 268
ADDP4
ADDRLP4 1128
INDIRI4
ASGNI4
line 633
;633:				tent->s.eventParm = ent->s.number;
ADDRLP4 1084
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 635
;634:
;635:				te = G_TempEntity( tr.endpos, EV_SABER_BLOCK );
ADDRLP4 4+12
ARGP4
CNSTI4 28
ARGI4
ADDRLP4 1212
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1204
ADDRLP4 1212
INDIRP4
ASGNP4
line 636
;636:				VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 1204
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 4+12
INDIRB
ASGNB 12
line 637
;637:				VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 1204
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 4+24
INDIRB
ASGNB 12
line 638
;638:				if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 1220
CNSTF4 0
ASGNF4
ADDRLP4 1204
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 1220
INDIRF4
NEF4 $225
ADDRLP4 1204
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 1220
INDIRF4
NEF4 $225
ADDRLP4 1204
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 1220
INDIRF4
NEF4 $225
line 639
;639:				{
line 640
;640:					te->s.angles[1] = 1;
ADDRLP4 1204
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 641
;641:				}
LABELV $225
line 642
;642:				te->s.eventParm = 0;
ADDRLP4 1204
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 644
;643:
;644:				return;
ADDRGP4 $179
JUMPV
LABELV $218
line 646
;645:			}
;646:		}
LABELV $216
line 649
;647:
;648:		// always render a shot beam, doing this the old way because I don't much feel like overriding the effect.
;649:		tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_SNIPER_SHOT );
ADDRLP4 4+12
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 1196
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1196
INDIRP4
ASGNP4
line 650
;650:		VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 1084
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 651
;651:		tent->s.shouldtarget = fullCharge;
ADDRLP4 1084
INDIRP4
CNSTI4 268
ADDP4
ADDRLP4 1128
INDIRI4
ASGNI4
line 652
;652:		tent->s.eventParm = ent->s.number;
ADDRLP4 1084
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 655
;653:
;654:		// If the beam hits a skybox, etc. it would look foolish to add impact effects
;655:		if ( render_impact ) 
ADDRLP4 1124
INDIRI4
CNSTI4 0
EQI4 $195
line 656
;656:		{
line 657
;657:			if ( traceEnt->takedamage && traceEnt->client )
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $230
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $230
line 658
;658:			{
line 659
;659:				tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 1084
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 663
;660:
;661:				// Create a simple impact type mark
;662://				G_PlayEffect( G_EffectIndex( "disruptor/alt_hit" ), tr.endpos, tr.plane.normal );
;663:				tent = G_TempEntity(tr.endpos, EV_MISSILE_MISS);
ADDRLP4 4+12
ARGP4
CNSTI4 74
ARGI4
ADDRLP4 1204
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1204
INDIRP4
ASGNP4
line 664
;664:				tent->s.eventParm = DirToByte(tr.plane.normal);
ADDRLP4 4+24
ARGP4
ADDRLP4 1208
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 1084
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 1208
INDIRI4
ASGNI4
line 665
;665:				tent->s.eFlags |= EF_ALT_FIRING;
ADDRLP4 1212
ADDRLP4 1084
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 1212
INDIRP4
ADDRLP4 1212
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 667
;666:	
;667:				if ( LogAccuracyHit( traceEnt, ent )) 
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1216
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 1216
INDIRI4
CNSTI4 0
EQI4 $231
line 668
;668:				{
line 669
;669:					if (ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $231
line 670
;670:					{
line 671
;671:						ent->client->accuracy_hits++;
ADDRLP4 1220
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1844
ADDP4
ASGNP4
ADDRLP4 1220
INDIRP4
ADDRLP4 1220
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 672
;672:					}
line 673
;673:				}
line 674
;674:			} 
ADDRGP4 $231
JUMPV
LABELV $230
line 676
;675:			else 
;676:			{
line 677
;677:				 if ( traceEnt->r.svFlags & SVF_GLASS_BRUSH 
ADDRLP4 1208
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 134217728
BANDI4
ADDRLP4 1208
INDIRI4
NEI4 $241
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 1208
INDIRI4
NEI4 $241
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 6
NEI4 $238
LABELV $241
line 680
;678:						|| traceEnt->takedamage 
;679:						|| traceEnt->s.eType == ET_MOVER )
;680:				 {
line 682
;681:					//rww - is there some reason this was doing nothing?
;682:					if ( traceEnt->takedamage )
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $195
line 683
;683:					{
line 684
;684:						G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, 
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1140
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 9
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 687
;685:								DAMAGE_NO_KNOCKBACK/*|DAMAGE_HALF_ARMOR_REDUCTION*/, MOD_DISRUPTOR_SNIPER );
;686:
;687:						tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_HIT );
ADDRLP4 4+12
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1216
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1216
INDIRP4
ASGNP4
line 688
;688:						tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 1220
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 1084
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 1220
INDIRI4
ASGNI4
line 689
;689:					}
line 690
;690:				 }
ADDRGP4 $195
JUMPV
LABELV $238
line 692
;691:				 else
;692:				 {
line 694
;693:					 // Hmmm, maybe don't make any marks on things that could break
;694:					tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_SNIPER_MISS );
ADDRLP4 4+12
ARGP4
CNSTI4 33
ARGI4
ADDRLP4 1212
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1212
INDIRP4
ASGNP4
line 695
;695:					tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 1216
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 1084
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 1216
INDIRI4
ASGNI4
line 696
;696:				 }
line 697
;697:				break; // and don't try any more traces
ADDRGP4 $195
JUMPV
LABELV $231
line 700
;698:			}
;699:
;700:			if ( traceEnt->takedamage )
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $229
line 701
;701:			{
line 703
;702:				vec3_t preAng;
;703:				int preHealth = traceEnt->health;
ADDRLP4 1204
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ASGNI4
line 704
;704:				int preLegs = 0;
ADDRLP4 1208
CNSTI4 0
ASGNI4
line 705
;705:				int preTorso = 0;
ADDRLP4 1212
CNSTI4 0
ASGNI4
line 707
;706:
;707:				if (traceEnt->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $251
line 708
;708:				{
line 709
;709:					preLegs = traceEnt->client->ps.legsAnim;
ADDRLP4 1208
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 710
;710:					preTorso = traceEnt->client->ps.torsoAnim;
ADDRLP4 1212
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
line 711
;711:					VectorCopy(traceEnt->client->ps.viewangles, preAng);
ADDRLP4 1216
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 712
;712:				}
LABELV $251
line 714
;713:
;714:				G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, DAMAGE_NO_KNOCKBACK, MOD_DISRUPTOR_SNIPER );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1228
INDIRP4
ARGP4
ADDRLP4 1228
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1140
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 9
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 716
;715:
;716:				if (traceEnt->client && preHealth > 0 && traceEnt->health <= 0 && fullCharge)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $254
ADDRLP4 1236
CNSTI4 0
ASGNI4
ADDRLP4 1204
INDIRI4
ADDRLP4 1236
INDIRI4
LEI4 $254
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 1236
INDIRI4
GTI4 $254
ADDRLP4 1128
INDIRI4
ADDRLP4 1236
INDIRI4
EQI4 $254
line 717
;717:				{ //was killed by a fully charged sniper shot, so disintegrate
line 718
;718:					VectorCopy(preAng, traceEnt->client->ps.viewangles);
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 1216
INDIRB
ASGNB 12
line 720
;719:
;720:					traceEnt->client->ps.eFlags |= EF_DISINTEGRATION;
ADDRLP4 1240
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 1240
INDIRP4
ADDRLP4 1240
INDIRP4
INDIRI4
CNSTI4 33554432
BORI4
ASGNI4
line 721
;721:					VectorCopy(tr.endpos, traceEnt->client->ps.lastHitLoc);
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1368
ADDP4
ADDRLP4 4+12
INDIRB
ASGNB 12
line 723
;722:
;723:					traceEnt->client->ps.legsAnim = preLegs;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 1208
INDIRI4
ASGNI4
line 724
;724:					traceEnt->client->ps.torsoAnim = preTorso;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
ADDRLP4 1212
INDIRI4
ASGNI4
line 726
;725:
;726:					traceEnt->r.contents = 0;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 728
;727:
;728:					VectorClear(traceEnt->client->ps.velocity);
ADDRLP4 1244
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1248
CNSTF4 0
ASGNF4
ADDRLP4 1244
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 1248
INDIRF4
ASGNF4
ADDRLP4 1244
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1248
INDIRF4
ASGNF4
ADDRLP4 1244
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1248
INDIRF4
ASGNF4
line 729
;729:				}
LABELV $254
line 731
;730:
;731:				tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_HIT );
ADDRLP4 4+12
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1240
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1240
INDIRP4
ASGNP4
line 732
;732:				tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 1244
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 1084
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 1244
INDIRI4
ASGNI4
line 733
;733:				if (traceEnt->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $229
line 734
;734:				{
line 735
;735:					tent->s.weapon = 1;
ADDRLP4 1084
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 1
ASGNI4
line 736
;736:				}
line 737
;737:			}
line 738
;738:		}
line 740
;739:		else // not rendering impact, must be a skybox or other similar thing?
;740:		{
line 741
;741:			break; // don't try anymore traces
LABELV $229
line 745
;742:		}
;743:
;744:		// Get ready for an attempt to trace through another person
;745:		VectorCopy( tr.endpos, muzzle );
ADDRGP4 muzzle
ADDRLP4 4+12
INDIRB
ASGNB 12
line 746
;746:		VectorCopy( tr.endpos, start );
ADDRLP4 1088
ADDRLP4 4+12
INDIRB
ASGNB 12
line 747
;747:		skip = tr.entityNum;
ADDRLP4 1112
ADDRLP4 4+52
INDIRI4
ASGNI4
line 748
;748:	}
LABELV $194
line 597
ADDRLP4 1120
ADDRLP4 1120
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $196
ADDRLP4 1120
INDIRI4
ADDRLP4 1132
INDIRI4
LTI4 $193
LABELV $195
line 749
;749:}
LABELV $179
endproc WP_DisruptorAltFire 1252 32
proc WP_FireDisruptor 20 4
line 755
;750:
;751:
;752://---------------------------------------------------------
;753:static void WP_FireDisruptor( gentity_t *ent, qboolean altFire )
;754://---------------------------------------------------------
;755:{
line 756
;756:	if (!ent || !ent->client || ent->client->ps.zoomMode != 1)
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
EQU4 $268
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $268
ADDRLP4 8
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
EQI4 $265
LABELV $268
line 757
;757:	{ //do not ever let it do the alt fire when not zoomed
line 758
;758:		altFire = qfalse;
ADDRFP4 4
CNSTI4 0
ASGNI4
line 759
;759:	}
LABELV $265
line 761
;760:
;761:	if (ent && ent->s.eType == ET_GRAPPLE && !ent->client)
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
EQU4 $269
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $269
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
NEU4 $269
line 762
;762:	{ //special case for animents
line 763
;763:		WP_DisruptorAltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_DisruptorAltFire
CALLV
pop
line 764
;764:		return;
ADDRGP4 $264
JUMPV
LABELV $269
line 767
;765:	}
;766:
;767:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $271
line 768
;768:	{
line 769
;769:		WP_DisruptorAltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_DisruptorAltFire
CALLV
pop
line 770
;770:	}
ADDRGP4 $272
JUMPV
LABELV $271
line 772
;771:	else
;772:	{
line 773
;773:		WP_DisruptorMainFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_DisruptorMainFire
CALLV
pop
line 774
;774:	}
LABELV $272
line 775
;775:}
LABELV $264
endproc WP_FireDisruptor 20 4
proc WP_BowcasterAltFire 28 24
line 787
;776:
;777:
;778:/*
;779:======================================================================
;780:
;781:BOWCASTER
;782:
;783:======================================================================
;784:*/
;785:
;786:static void WP_BowcasterAltFire( gentity_t *ent )
;787:{
line 788
;788:	int	damage	= BOWCASTER_DAMAGE;
ADDRLP4 4
CNSTI4 50
ASGNI4
line 790
;789:
;790:	gentity_t *missile = CreateMissile( muzzle, forward, BOWCASTER_VELOCITY, 10000, ent, qfalse);
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
CNSTF4 1151500288
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 792
;791:
;792:	missile->classname = "bowcaster_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $274
ASGNP4
line 793
;793:	missile->s.weapon = WP_BOWCASTER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 6
ASGNI4
line 795
;794:
;795:	VectorSet( missile->r.maxs, BOWCASTER_SIZE, BOWCASTER_SIZE, BOWCASTER_SIZE );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1073741824
ASGNF4
line 796
;796:	VectorScale( missile->r.maxs, -1, missile->r.mins );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ASGNF4
line 798
;797:
;798:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 799
;799:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 800
;800:	missile->methodOfDeath = MOD_BOWCASTER;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 10
ASGNI4
line 801
;801:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 805
;802://	missile->splashDamage = BOWCASTER_SPLASH_DAMAGE;
;803://	missile->splashRadius = BOWCASTER_SPLASH_RADIUS;
;804:
;805:	missile->s.eFlags |= EF_BOUNCE;
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 806
;806:	missile->bounceCount = 3;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 3
ASGNI4
line 807
;807:}
LABELV $273
endproc WP_BowcasterAltFire 28 24
proc WP_BowcasterMainFire 80 24
line 812
;808:
;809://---------------------------------------------------------
;810:static void WP_BowcasterMainFire( gentity_t *ent )
;811://---------------------------------------------------------
;812:{
line 813
;813:	int			damage	= BOWCASTER_DAMAGE, count;
ADDRLP4 40
CNSTI4 50
ASGNI4
line 819
;814:	float		vel;
;815:	vec3_t		angs, dir;
;816:	gentity_t	*missile;
;817:	int i;
;818:
;819:	if (!ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $276
line 820
;820:	{
line 821
;821:		count = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 822
;822:	}
ADDRGP4 $277
JUMPV
LABELV $276
line 824
;823:	else
;824:	{
line 825
;825:		count = ( level.time - ent->client->ps.weaponChargeTime ) / BOWCASTER_CHARGE_UNIT;
ADDRLP4 20
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1128792064
DIVF4
CVFI4 4
ASGNI4
line 826
;826:	}
LABELV $277
line 828
;827:
;828:	if ( count < 1 )
ADDRLP4 20
INDIRI4
CNSTI4 1
GEI4 $279
line 829
;829:	{
line 830
;830:		count = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 831
;831:	}
ADDRGP4 $280
JUMPV
LABELV $279
line 832
;832:	else if ( count > 5 )
ADDRLP4 20
INDIRI4
CNSTI4 5
LEI4 $281
line 833
;833:	{
line 834
;834:		count = 5;
ADDRLP4 20
CNSTI4 5
ASGNI4
line 835
;835:	}
LABELV $281
LABELV $280
line 837
;836:
;837:	if ( !(count & 1 ))
ADDRLP4 20
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $283
line 838
;838:	{
line 840
;839:		// if we aren't odd, knock us down a level
;840:		count--;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 841
;841:	}
LABELV $283
line 844
;842:
;843:	//scale the damage down based on how many are about to be fired
;844:	if (count <= 1)
ADDRLP4 20
INDIRI4
CNSTI4 1
GTI4 $285
line 845
;845:	{
line 846
;846:		damage = 50;
ADDRLP4 40
CNSTI4 50
ASGNI4
line 847
;847:	}
ADDRGP4 $286
JUMPV
LABELV $285
line 848
;848:	else if (count == 2)
ADDRLP4 20
INDIRI4
CNSTI4 2
NEI4 $287
line 849
;849:	{
line 850
;850:		damage = 45;
ADDRLP4 40
CNSTI4 45
ASGNI4
line 851
;851:	}
ADDRGP4 $288
JUMPV
LABELV $287
line 852
;852:	else if (count == 3)
ADDRLP4 20
INDIRI4
CNSTI4 3
NEI4 $289
line 853
;853:	{
line 854
;854:		damage = 40;
ADDRLP4 40
CNSTI4 40
ASGNI4
line 855
;855:	}
ADDRGP4 $290
JUMPV
LABELV $289
line 856
;856:	else if (count == 4)
ADDRLP4 20
INDIRI4
CNSTI4 4
NEI4 $291
line 857
;857:	{
line 858
;858:		damage = 35;
ADDRLP4 40
CNSTI4 35
ASGNI4
line 859
;859:	}
ADDRGP4 $292
JUMPV
LABELV $291
line 861
;860:	else
;861:	{
line 862
;862:		damage = 30;
ADDRLP4 40
CNSTI4 30
ASGNI4
line 863
;863:	}
LABELV $292
LABELV $290
LABELV $288
LABELV $286
line 865
;864:
;865:	for (i = 0; i < count; i++ )
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $296
JUMPV
LABELV $293
line 866
;866:	{
line 868
;867:		// create a range of different velocities
;868:		vel = BOWCASTER_VELOCITY * ( crandom() * BOWCASTER_VEL_RANGE + 1.0f );
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
CNSTF4 1151500288
CNSTF4 1050253722
CNSTF4 1073741824
ADDRLP4 44
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 870
;869:
;870:		vectoangles( forward, angs );
ADDRGP4 forward
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 873
;871:
;872:		// add some slop to the alt-fire direction
;873:		angs[PITCH] += crandom() * BOWCASTER_ALT_SPREAD * 0.2f;
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1045220557
CNSTF4 1084227584
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
MULF4
MULF4
ADDF4
ASGNF4
line 874
;874:		angs[YAW]	+= ((i+0.5f) * BOWCASTER_ALT_SPREAD - count * 0.5f * BOWCASTER_ALT_SPREAD );
ADDRLP4 52
CNSTF4 1084227584
ASGNF4
ADDRLP4 56
CNSTF4 1056964608
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 52
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDRLP4 56
INDIRF4
ADDF4
MULF4
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRF4
ADDRLP4 20
INDIRI4
CVIF4 4
MULF4
MULF4
SUBF4
ADDF4
ASGNF4
line 876
;875:		
;876:		AngleVectors( angs, dir, NULL, NULL );
ADDRLP4 4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 60
CNSTP4 0
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 878
;877:
;878:		missile = CreateMissile( muzzle, dir, vel, 10000, ent, qtrue );
ADDRGP4 muzzle
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 64
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 64
INDIRP4
ASGNP4
line 880
;879:
;880:		missile->classname = "bowcaster_alt_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $298
ASGNP4
line 881
;881:		missile->s.weapon = WP_BOWCASTER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 6
ASGNI4
line 883
;882:
;883:		VectorSet( missile->r.maxs, BOWCASTER_SIZE, BOWCASTER_SIZE, BOWCASTER_SIZE );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1073741824
ASGNF4
line 884
;884:		VectorScale( missile->r.maxs, -1, missile->r.mins );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ASGNF4
line 886
;885:
;886:		missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 887
;887:		missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 888
;888:		missile->methodOfDeath = MOD_BOWCASTER;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 10
ASGNI4
line 889
;889:		missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 894
;890://		missile->splashDamage = BOWCASTER_SPLASH_DAMAGE;
;891://		missile->splashRadius = BOWCASTER_SPLASH_RADIUS;
;892:
;893:		// we don't want it to bounce
;894:		missile->bounceCount = 0;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 0
ASGNI4
line 895
;895:	}
LABELV $294
line 865
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $296
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $293
line 896
;896:}
LABELV $275
endproc WP_BowcasterMainFire 80 24
proc WP_FireBowcaster 0 4
line 901
;897:
;898://---------------------------------------------------------
;899:static void WP_FireBowcaster( gentity_t *ent, qboolean altFire )
;900://---------------------------------------------------------
;901:{
line 902
;902:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $300
line 903
;903:	{
line 904
;904:		WP_BowcasterAltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_BowcasterAltFire
CALLV
pop
line 905
;905:	}
ADDRGP4 $301
JUMPV
LABELV $300
line 907
;906:	else
;907:	{
line 908
;908:		WP_BowcasterMainFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_BowcasterMainFire
CALLV
pop
line 909
;909:	}
LABELV $301
line 910
;910:}
LABELV $299
endproc WP_FireBowcaster 0 4
proc WP_RepeaterMainFire 12 24
line 925
;911:
;912:
;913:
;914:/*
;915:======================================================================
;916:
;917:REPEATER
;918:
;919:======================================================================
;920:*/
;921:
;922://---------------------------------------------------------
;923:static void WP_RepeaterMainFire( gentity_t *ent, vec3_t dir )
;924://---------------------------------------------------------
;925:{
line 926
;926:	int	damage	= REPEATER_DAMAGE;
ADDRLP4 4
CNSTI4 14
ASGNI4
line 928
;927:
;928:	gentity_t *missile = CreateMissile( muzzle, dir, REPEATER_VELOCITY, 10000, ent, qfalse );
ADDRGP4 muzzle
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTF4 1153957888
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 930
;929:
;930:	missile->classname = "repeater_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $303
ASGNP4
line 931
;931:	missile->s.weapon = WP_REPEATER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 7
ASGNI4
line 933
;932:
;933:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 934
;934:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 935
;935:	missile->methodOfDeath = MOD_REPEATER;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 11
ASGNI4
line 936
;936:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 939
;937:
;938:	// we don't want it to bounce forever
;939:	missile->bounceCount = 8;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 8
ASGNI4
line 940
;940:}
LABELV $302
endproc WP_RepeaterMainFire 12 24
proc WP_RepeaterAltFire 28 24
line 945
;941:
;942://---------------------------------------------------------
;943:static void WP_RepeaterAltFire( gentity_t *ent )
;944://---------------------------------------------------------
;945:{
line 946
;946:	int	damage	= REPEATER_ALT_DAMAGE;
ADDRLP4 4
CNSTI4 60
ASGNI4
line 948
;947:
;948:	gentity_t *missile = CreateMissile( muzzle, forward, REPEATER_ALT_VELOCITY, 10000, ent, qtrue );
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
CNSTF4 1149861888
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 950
;949:
;950:	missile->classname = "repeater_alt_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $305
ASGNP4
line 951
;951:	missile->s.weapon = WP_REPEATER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 7
ASGNI4
line 954
;952://	missile->mass = 10;		// NOTENOTE No mass yet
;953:
;954:	VectorSet( missile->r.maxs, REPEATER_ALT_SIZE, REPEATER_ALT_SIZE, REPEATER_ALT_SIZE );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1077936128
ASGNF4
line 955
;955:	VectorScale( missile->r.maxs, -1, missile->r.mins );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ASGNF4
line 956
;956:	missile->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 957
;957:	missile->s.pos.trDelta[2] += 40.0f; //give a slight boost in the upward direction
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTF4 1109393408
ADDF4
ASGNF4
line 958
;958:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 959
;959:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 960
;960:	missile->methodOfDeath = MOD_REPEATER_ALT;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 12
ASGNI4
line 961
;961:	missile->splashMethodOfDeath = MOD_REPEATER_ALT_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 13
ASGNI4
line 962
;962:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 963
;963:	missile->splashDamage = REPEATER_ALT_SPLASH_DAMAGE;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 60
ASGNI4
line 964
;964:	missile->splashRadius = REPEATER_ALT_SPLASH_RADIUS;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTI4 128
ASGNI4
line 967
;965:
;966:	// we don't want it to bounce forever
;967:	missile->bounceCount = 8;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 8
ASGNI4
line 968
;968:}
LABELV $304
endproc WP_RepeaterAltFire 28 24
proc WP_FireRepeater 36 16
line 973
;969:
;970://---------------------------------------------------------
;971:static void WP_FireRepeater( gentity_t *ent, qboolean altFire )
;972://---------------------------------------------------------
;973:{
line 976
;974:	vec3_t	dir, angs;
;975:
;976:	vectoangles( forward, angs );
ADDRGP4 forward
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 978
;977:
;978:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $307
line 979
;979:	{
line 980
;980:		WP_RepeaterAltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_RepeaterAltFire
CALLV
pop
line 981
;981:	}
ADDRGP4 $308
JUMPV
LABELV $307
line 983
;982:	else
;983:	{
line 985
;984:		// add some slop to the alt-fire direction
;985:		angs[PITCH] += crandom() * REPEATER_SPREAD;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1068708659
CNSTF4 1073741824
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 986
;986:		angs[YAW]	+= crandom() * REPEATER_SPREAD;
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1068708659
CNSTF4 1073741824
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 988
;987:
;988:		AngleVectors( angs, dir, NULL, NULL );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 32
CNSTP4 0
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 991
;989:
;990:		// NOTENOTE if temp_org does not have clear trace to inside the bbox, don't shoot!
;991:		WP_RepeaterMainFire( ent, dir );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 WP_RepeaterMainFire
CALLV
pop
line 992
;992:	}
LABELV $308
line 993
;993:}
LABELV $306
endproc WP_FireRepeater 36 16
proc WP_DEMP2_MainFire 24 24
line 1005
;994:
;995:
;996:/*
;997:======================================================================
;998:
;999:DEMP2
;1000:
;1001:======================================================================
;1002:*/
;1003:
;1004:static void WP_DEMP2_MainFire( gentity_t *ent )
;1005:{
line 1006
;1006:	int	damage	= DEMP2_DAMAGE;
ADDRLP4 4
CNSTI4 35
ASGNI4
line 1008
;1007:
;1008:	gentity_t *missile = CreateMissile( muzzle, forward, DEMP2_VELOCITY, 10000, ent, qfalse);
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
CNSTF4 1155596288
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1010
;1009:
;1010:	missile->classname = "demp2_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $311
ASGNP4
line 1011
;1011:	missile->s.weapon = WP_DEMP2;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 8
ASGNI4
line 1013
;1012:
;1013:	VectorSet( missile->r.maxs, DEMP2_SIZE, DEMP2_SIZE, DEMP2_SIZE );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1073741824
ASGNF4
line 1014
;1014:	VectorScale( missile->r.maxs, -1, missile->r.mins );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ASGNF4
line 1015
;1015:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1016
;1016:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 1017
;1017:	missile->methodOfDeath = MOD_DEMP2;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 14
ASGNI4
line 1019
;1018:	//rww - Don't want this blockable, do we?
;1019:	missile->clipmask = MASK_SHOT;// | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 769
ASGNI4
line 1022
;1020:
;1021:	// we don't want it to ever bounce
;1022:	missile->bounceCount = 0;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 0
ASGNI4
line 1023
;1023:}
LABELV $310
endproc WP_DEMP2_MainFire 24 24
export DEMP2_AltRadiusDamage
proc DEMP2_AltRadiusDamage 8324 32
line 1028
;1024:
;1025:static gentity_t *ent_list[MAX_GENTITIES];
;1026:
;1027:void DEMP2_AltRadiusDamage( gentity_t *ent )
;1028:{
line 1029
;1029:	float		frac = ( level.time - ent->bolt_Head ) / 800.0f; // / 1600.0f; // synchronize with demp2 effect
ADDRLP4 8268
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1145569280
DIVF4
ASGNF4
line 1034
;1030:	float		dist, radius, fact;
;1031:	gentity_t	*gent;
;1032:	int			iEntityList[MAX_GENTITIES];
;1033:	gentity_t	*entityList[MAX_GENTITIES];
;1034:	gentity_t	*myOwner = NULL;
ADDRLP4 44
CNSTP4 0
ASGNP4
line 1039
;1035:	int			numListedEntities, i, e;
;1036:	vec3_t		mins, maxs;
;1037:	vec3_t		v, dir;
;1038:
;1039:	if (ent->r.ownerNum >= 0 &&
ADDRLP4 8276
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8276
INDIRI4
CNSTI4 0
LTI4 $314
ADDRLP4 8276
INDIRI4
CNSTI4 32
GEI4 $314
line 1041
;1040:		ent->r.ownerNum < MAX_CLIENTS)
;1041:	{
line 1042
;1042:		myOwner = &g_entities[ent->r.ownerNum];
ADDRLP4 44
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
line 1043
;1043:	}
LABELV $314
line 1045
;1044:
;1045:	if (!myOwner || !myOwner->inuse || !myOwner->client)
ADDRLP4 8284
CNSTU4 0
ASGNU4
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRLP4 8284
INDIRU4
EQU4 $319
ADDRLP4 44
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $319
ADDRLP4 44
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8284
INDIRU4
NEU4 $316
LABELV $319
line 1046
;1046:	{
line 1047
;1047:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1048
;1048:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1049
;1049:		return;
ADDRGP4 $312
JUMPV
LABELV $316
line 1052
;1050:	}
;1051:
;1052:	frac *= frac * frac; // yes, this is completely ridiculous...but it causes the shell to grow slowly then "explode" at the end
ADDRLP4 8268
ADDRLP4 8268
INDIRF4
ADDRLP4 8268
INDIRF4
ADDRLP4 8268
INDIRF4
MULF4
MULF4
ASGNF4
line 1054
;1053:	
;1054:	radius = frac * 200.0f; // 200 is max radius...the model is aprox. 100 units tall...the fx draw code mults. this by 2.
ADDRLP4 32
CNSTF4 1128792064
ADDRLP4 8268
INDIRF4
MULF4
ASGNF4
line 1056
;1055:
;1056:	fact = ent->count*0.6;
ADDRLP4 8272
CNSTF4 1058642330
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1058
;1057:
;1058:	if (fact < 1)
ADDRLP4 8272
INDIRF4
CNSTF4 1065353216
GEF4 $321
line 1059
;1059:	{
line 1060
;1060:		fact = 1;
ADDRLP4 8272
CNSTF4 1065353216
ASGNF4
line 1061
;1061:	}
LABELV $321
line 1063
;1062:
;1063:	radius *= fact;
ADDRLP4 32
ADDRLP4 32
INDIRF4
ADDRLP4 8272
INDIRF4
MULF4
ASGNF4
line 1065
;1064:
;1065:	for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $323
line 1066
;1066:	{
line 1067
;1067:		mins[i] = ent->r.currentOrigin[i] - radius;
ADDRLP4 8292
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8292
INDIRI4
ADDRLP4 8244
ADDP4
ADDRLP4 8292
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
ADDRLP4 32
INDIRF4
SUBF4
ASGNF4
line 1068
;1068:		maxs[i] = ent->r.currentOrigin[i] + radius;
ADDRLP4 8296
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8296
INDIRI4
ADDRLP4 8256
ADDP4
ADDRLP4 8296
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ASGNF4
line 1069
;1069:	}
LABELV $324
line 1065
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $323
line 1071
;1070:
;1071:	numListedEntities = trap_EntitiesInBox( mins, maxs, iEntityList, MAX_GENTITIES );
ADDRLP4 8244
ARGP4
ADDRLP4 8256
ARGP4
ADDRLP4 4148
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 8292
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 48
ADDRLP4 8292
INDIRI4
ASGNI4
line 1073
;1072:
;1073:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $328
JUMPV
LABELV $327
line 1075
;1074:	while (i < numListedEntities)
;1075:	{
line 1076
;1076:		entityList[i] = &g_entities[iEntityList[i]];
ADDRLP4 8296
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8296
INDIRI4
ADDRLP4 52
ADDP4
CNSTI4 852
ADDRLP4 8296
INDIRI4
ADDRLP4 4148
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1077
;1077:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1078
;1078:	}
LABELV $328
line 1074
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $327
line 1080
;1079:
;1080:	for ( e = 0 ; e < numListedEntities ; e++ ) 
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 $333
JUMPV
LABELV $330
line 1081
;1081:	{
line 1082
;1082:		gent = entityList[ e ];
ADDRLP4 4
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 52
ADDP4
INDIRP4
ASGNP4
line 1084
;1083:
;1084:		if ( !gent || !gent->takedamage || !gent->r.contents )
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $337
ADDRLP4 8300
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 8300
INDIRI4
EQI4 $337
ADDRLP4 4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
ADDRLP4 8300
INDIRI4
NEI4 $334
LABELV $337
line 1085
;1085:		{
line 1086
;1086:			continue;
ADDRGP4 $331
JUMPV
LABELV $334
line 1090
;1087:		}
;1088:
;1089:		// find the distance from the edge of the bounding box
;1090:		for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $338
line 1091
;1091:		{
line 1092
;1092:			if ( ent->r.currentOrigin[i] < gent->r.absmin[i] ) 
ADDRLP4 8304
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8304
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
ADDRLP4 8304
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
GEF4 $342
line 1093
;1093:			{
line 1094
;1094:				v[i] = gent->r.absmin[i] - ent->r.currentOrigin[i];
ADDRLP4 8308
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8308
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 8308
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
ADDRLP4 8308
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1095
;1095:			} 
ADDRGP4 $343
JUMPV
LABELV $342
line 1096
;1096:			else if ( ent->r.currentOrigin[i] > gent->r.absmax[i] ) 
ADDRLP4 8308
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8308
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
ADDRLP4 8308
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
LEF4 $344
line 1097
;1097:			{
line 1098
;1098:				v[i] = ent->r.currentOrigin[i] - gent->r.absmax[i];
ADDRLP4 8312
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8312
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 8312
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
ADDRLP4 8312
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1099
;1099:			} 
ADDRGP4 $345
JUMPV
LABELV $344
line 1101
;1100:			else 
;1101:			{
line 1102
;1102:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 1103
;1103:			}
LABELV $345
LABELV $343
line 1104
;1104:		}
LABELV $339
line 1090
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $338
line 1107
;1105:
;1106:		// shape is an ellipsoid, so cut vertical distance in half`
;1107:		v[2] *= 0.5f;
ADDRLP4 8+8
CNSTF4 1056964608
ADDRLP4 8+8
INDIRF4
MULF4
ASGNF4
line 1109
;1108:
;1109:		dist = VectorLength( v );
ADDRLP4 8
ARGP4
ADDRLP4 8304
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 8304
INDIRF4
ASGNF4
line 1111
;1110:
;1111:		if ( dist >= radius ) 
ADDRLP4 40
INDIRF4
ADDRLP4 32
INDIRF4
LTF4 $347
line 1112
;1112:		{
line 1114
;1113:			// shockwave hasn't hit them yet
;1114:			continue;
ADDRGP4 $331
JUMPV
LABELV $347
line 1118
;1115:		}
;1116:
;1117:		//if ( dist < ent->bolt_LArm )
;1118:		if (dist+(16*ent->count) < ent->bolt_LArm)
ADDRLP4 8308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRF4
ADDRLP4 8308
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 4
LSHI4
CVIF4 4
ADDF4
ADDRLP4 8308
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
CVIF4 4
GEF4 $349
line 1119
;1119:		{
line 1121
;1120:			// shockwave has already hit this thing...
;1121:			continue;
ADDRGP4 $331
JUMPV
LABELV $349
line 1124
;1122:		}
;1123:
;1124:		VectorCopy( gent->r.currentOrigin, v );
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 1125
;1125:		VectorSubtract( v, ent->r.currentOrigin, dir);
ADDRLP4 8312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 8
INDIRF4
ADDRLP4 8312
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 8+4
INDIRF4
ADDRLP4 8312
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 8+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1128
;1126:
;1127:		// push the center of mass higher than the origin so players get knocked into the air more
;1128:		dir[2] += 12;
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
CNSTF4 1094713344
ADDF4
ASGNF4
line 1130
;1129:
;1130:		if (gent != myOwner)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRP4
CVPU4 4
EQU4 $356
line 1131
;1131:		{
line 1132
;1132:			G_Damage( gent, myOwner, myOwner, dir, ent->r.currentOrigin, ent->damage, DAMAGE_DEATH_KNOCKBACK, ent->splashMethodOfDeath );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 8320
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8320
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 8320
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ARGI4
CNSTI4 128
ARGI4
ADDRLP4 8320
INDIRP4
CNSTI4 708
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1133
;1133:		}
LABELV $356
line 1134
;1134:	}
LABELV $331
line 1080
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $333
ADDRLP4 36
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $330
line 1137
;1135:
;1136:	// store the last fraction so that next time around we can test against those things that fall between that last point and where the current shockwave edge is
;1137:	ent->bolt_LArm = radius;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 1139
;1138:
;1139:	if ( frac < 1.0f )
ADDRLP4 8268
INDIRF4
CNSTF4 1065353216
GEF4 $358
line 1140
;1140:	{
line 1142
;1141:		// shock is still happening so continue letting it expand
;1142:		ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 1143
;1143:	}
ADDRGP4 $359
JUMPV
LABELV $358
line 1145
;1144:	else
;1145:	{ //don't just leave the entity around
line 1146
;1146:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1147
;1147:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1148
;1148:	}
LABELV $359
line 1149
;1149:}
LABELV $312
endproc DEMP2_AltRadiusDamage 8324 32
export DEMP2_AltDetonate
proc DEMP2_AltDetonate 24 12
line 1154
;1150:
;1151://---------------------------------------------------------
;1152:void DEMP2_AltDetonate( gentity_t *ent )
;1153://---------------------------------------------------------
;1154:{
line 1157
;1155:	gentity_t *efEnt;
;1156:
;1157:	G_SetOrigin( ent, ent->r.currentOrigin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1158
;1158:	if (!ent->pos1[0] && !ent->pos1[1] && !ent->pos1[2])
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $363
ADDRLP4 8
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $363
ADDRLP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $363
line 1159
;1159:	{ //don't play effect with a 0'd out directional vector
line 1160
;1160:		ent->pos1[1] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
CNSTF4 1065353216
ASGNF4
line 1161
;1161:	}
LABELV $363
line 1163
;1162:	//Let's just save ourself some bandwidth and play both the effect and sphere spawn in 1 event
;1163:	efEnt = G_PlayEffect( EFFECT_EXPLOSION_DEMP2ALT, ent->r.currentOrigin, ent->pos1 );
CNSTI4 9
ARGI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 548
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 G_PlayEffect
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1165
;1164:
;1165:	if (efEnt)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $365
line 1166
;1166:	{
line 1167
;1167:		efEnt->s.weapon = ent->count*2;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1168
;1168:	}
LABELV $365
line 1170
;1169:
;1170:	ent->bolt_Head = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1171
;1171:	ent->bolt_LArm = 0;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
CNSTI4 0
ASGNI4
line 1172
;1172:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 1173
;1173:	ent->think = DEMP2_AltRadiusDamage;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 DEMP2_AltRadiusDamage
ASGNP4
line 1174
;1174:	ent->s.eType = ET_GENERAL; // make us a missile no longer
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1175
;1175:}
LABELV $362
endproc DEMP2_AltDetonate 24 12
proc WP_DEMP2_AltFire 1152 28
line 1180
;1176:
;1177://---------------------------------------------------------
;1178:static void WP_DEMP2_AltFire( gentity_t *ent )
;1179://---------------------------------------------------------
;1180:{
line 1181
;1181:	int		damage	= DEMP2_ALT_DAMAGE;
ADDRLP4 32
CNSTI4 8
ASGNI4
line 1188
;1182:	int		count, origcount;
;1183:	float	fact;
;1184:	vec3_t	start, end;
;1185:	trace_t	tr;
;1186:	gentity_t *missile;
;1187:
;1188:	VectorCopy( muzzle, start );
ADDRLP4 8
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 1190
;1189:
;1190:	VectorMA( start, DEMP2_ALT_RANGE, forward, end );
ADDRLP4 1124
CNSTF4 1166016512
ASGNF4
ADDRLP4 20
ADDRLP4 8
INDIRF4
ADDRLP4 1124
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 8+4
INDIRF4
ADDRLP4 1124
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 8+8
INDIRF4
CNSTF4 1166016512
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1192
;1191:
;1192:	count = ( level.time - ent->client->ps.weaponChargeTime ) / DEMP2_CHARGE_UNIT;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1143930880
DIVF4
CVFI4 4
ASGNI4
line 1194
;1193:
;1194:	origcount = count;
ADDRLP4 1120
ADDRLP4 4
INDIRI4
ASGNI4
line 1196
;1195:
;1196:	if ( count < 1 )
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $377
line 1197
;1197:	{
line 1198
;1198:		count = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1199
;1199:	}
ADDRGP4 $378
JUMPV
LABELV $377
line 1200
;1200:	else if ( count > 3 )
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $379
line 1201
;1201:	{
line 1202
;1202:		count = 3;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 1203
;1203:	}
LABELV $379
LABELV $378
line 1205
;1204:
;1205:	fact = count*0.8;
ADDRLP4 36
CNSTF4 1061997773
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1206
;1206:	if (fact < 1)
ADDRLP4 36
INDIRF4
CNSTF4 1065353216
GEF4 $381
line 1207
;1207:	{
line 1208
;1208:		fact = 1;
ADDRLP4 36
CNSTF4 1065353216
ASGNF4
line 1209
;1209:	}
LABELV $381
line 1210
;1210:	damage *= fact;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1212
;1211:
;1212:	if (!origcount)
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $383
line 1213
;1213:	{ //this was just a tap-fire
line 1214
;1214:		damage = 1;
ADDRLP4 32
CNSTI4 1
ASGNI4
line 1215
;1215:	}
LABELV $383
line 1219
;1216:
;1217:	//damage *= ( 1 + ( count * ( count - 1 )));// yields damage of 12,36,84...gives a higher bonus for longer charge
;1218:
;1219:	trap_Trace( &tr, start, NULL, NULL, end, ent->s.number, MASK_SHOT);
ADDRLP4 40
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1128
CNSTP4 0
ASGNP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1224
;1220:
;1221:	// we treat the trace fraction like it's a time value, meaning that the shot can travel a whopping 4096 units in 1 second
;1222:
;1223:	//missile = CreateMissile( start, forward, DEMP2_ALT_RANGE, tr.fraction * 1000/*time*/, ent, qtrue );
;1224:	missile = G_Spawn();
ADDRLP4 1132
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1132
INDIRP4
ASGNP4
line 1225
;1225:	G_SetOrigin(missile, tr.endpos);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 40+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1228
;1226:	//rww - I guess it's rather pointless making it a missile anyway, at least for MP.
;1227:
;1228:	VectorCopy( tr.plane.normal, missile->pos1 );
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 40+24
INDIRB
ASGNB 12
line 1230
;1229:
;1230:	missile->count = count;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1232
;1231:
;1232:	missile->classname = "demp2_alt_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $387
ASGNP4
line 1233
;1233:	missile->s.weapon = WP_DEMP2;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 8
ASGNI4
line 1235
;1234:
;1235:	missile->think = DEMP2_AltDetonate;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 DEMP2_AltDetonate
ASGNP4
line 1236
;1236:	missile->nextthink = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1238
;1237:
;1238:	missile->splashDamage = missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1239
;1239:	missile->splashMethodOfDeath = missile->methodOfDeath = MOD_DEMP2;
ADDRLP4 1148
CNSTI4 14
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRLP4 1148
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRLP4 1148
INDIRI4
ASGNI4
line 1240
;1240:	missile->splashRadius = DEMP2_ALT_SPLASHRADIUS;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTI4 256
ASGNI4
line 1242
;1241:
;1242:	missile->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1244
;1243:
;1244:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 1245
;1245:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 1248
;1246:
;1247:	// we don't want it to ever bounce
;1248:	missile->bounceCount = 0;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 0
ASGNI4
line 1249
;1249:}
LABELV $369
endproc WP_DEMP2_AltFire 1152 28
proc WP_FireDEMP2 0 4
line 1254
;1250:
;1251://---------------------------------------------------------
;1252:static void WP_FireDEMP2( gentity_t *ent, qboolean altFire )
;1253://---------------------------------------------------------
;1254:{
line 1255
;1255:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $390
line 1256
;1256:	{
line 1257
;1257:		WP_DEMP2_AltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_DEMP2_AltFire
CALLV
pop
line 1258
;1258:	}
ADDRGP4 $391
JUMPV
LABELV $390
line 1260
;1259:	else
;1260:	{
line 1261
;1261:		WP_DEMP2_MainFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_DEMP2_MainFire
CALLV
pop
line 1262
;1262:	}
LABELV $391
line 1263
;1263:}
LABELV $389
endproc WP_FireDEMP2 0 4
proc WP_FlechetteMainFire 60 24
line 1278
;1264:
;1265:
;1266:
;1267:/*
;1268:======================================================================
;1269:
;1270:FLECHETTE
;1271:
;1272:======================================================================
;1273:*/
;1274:
;1275://---------------------------------------------------------
;1276:static void WP_FlechetteMainFire( gentity_t *ent )
;1277://---------------------------------------------------------
;1278:{
line 1283
;1279:	vec3_t		fwd, angs;
;1280:	gentity_t	*missile;
;1281:	int i;
;1282:
;1283:	for (i = 0; i < FLECHETTE_SHOTS; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $393
line 1284
;1284:	{
line 1285
;1285:		vectoangles( forward, angs );
ADDRGP4 forward
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1287
;1286:
;1287:		if ( i == 0 )
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $397
line 1288
;1288:		{
line 1290
;1289:			// do nothing on the first shot, this one will hit the crosshairs
;1290:		}
ADDRGP4 $398
JUMPV
LABELV $397
line 1292
;1291:		else
;1292:		{
line 1293
;1293:			angs[PITCH] += crandom() * FLECHETTE_SPREAD;
ADDRLP4 32
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1082130432
CNSTF4 1073741824
ADDRLP4 32
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 1294
;1294:			angs[YAW]	+= crandom() * FLECHETTE_SPREAD;
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8+4
ADDRLP4 8+4
INDIRF4
CNSTF4 1082130432
CNSTF4 1073741824
ADDRLP4 36
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 1295
;1295:		}
LABELV $398
line 1297
;1296:
;1297:		AngleVectors( angs, fwd, NULL, NULL );
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 32
CNSTP4 0
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1299
;1298:
;1299:		missile = CreateMissile( muzzle, fwd, FLECHETTE_VEL, 10000, ent, qfalse);
ADDRGP4 muzzle
ARGP4
ADDRLP4 20
ARGP4
CNSTF4 1163575296
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
line 1301
;1300:
;1301:		missile->classname = "flech_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $400
ASGNP4
line 1302
;1302:		missile->s.weapon = WP_FLECHETTE;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 9
ASGNI4
line 1304
;1303:
;1304:		VectorSet( missile->r.maxs, FLECHETTE_SIZE, FLECHETTE_SIZE, FLECHETTE_SIZE );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1065353216
ASGNF4
line 1305
;1305:		VectorScale( missile->r.maxs, -1, missile->r.mins );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ASGNF4
line 1307
;1306:
;1307:		missile->damage = FLECHETTE_DAMAGE;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 12
ASGNI4
line 1308
;1308:		missile->dflags = DAMAGE_DEATH_KNOCKBACK;// | DAMAGE_EXTRA_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 1309
;1309:		missile->methodOfDeath = MOD_FLECHETTE;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 16
ASGNI4
line 1310
;1310:		missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262913
ASGNI4
line 1313
;1311:
;1312:		// we don't want it to bounce forever
;1313:		missile->bounceCount = Q_irand(5,8);
CNSTI4 5
ARGI4
CNSTI4 8
ARGI4
ADDRLP4 52
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 1315
;1314:
;1315:		missile->s.eFlags |= EF_BOUNCE_SHRAPNEL;
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1316
;1316:	}
LABELV $394
line 1283
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 5
LTI4 $393
line 1317
;1317:}
LABELV $392
endproc WP_FlechetteMainFire 60 24
export prox_mine_think
proc prox_mine_think 32 20
line 1322
;1318:
;1319://---------------------------------------------------------
;1320:void prox_mine_think( gentity_t *ent )
;1321://---------------------------------------------------------
;1322:{
line 1324
;1323:	int			count, i;
;1324:	qboolean	blow = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1327
;1325:
;1326:	// if it isn't time to auto-explode, do a small proximity check
;1327:	if ( ent->delay > level.time )
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $402
line 1328
;1328:	{
line 1329
;1329:		count = G_RadiusList( ent->r.currentOrigin, FLECHETTE_MINE_RADIUS_CHECK, ent, qtrue, ent_list );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTF4 1132462080
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ent_list
ARGP4
ADDRLP4 16
ADDRGP4 G_RadiusList
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 1331
;1330:
;1331:		for ( i = 0; i < count; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $408
JUMPV
LABELV $405
line 1332
;1332:		{
line 1333
;1333:			if ( ent_list[i]->client && ent_list[i]->health > 0 && ent->activator && ent_list[i]->s.number != ent->activator->s.number )
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ent_list
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRLP4 20
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $409
ADDRLP4 20
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
LEI4 $409
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $409
ADDRLP4 20
INDIRP4
INDIRI4
ADDRLP4 28
INDIRP4
INDIRI4
EQI4 $409
line 1334
;1334:			{
line 1335
;1335:				blow = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1336
;1336:				break;
ADDRGP4 $403
JUMPV
LABELV $409
line 1338
;1337:			}
;1338:		}
LABELV $406
line 1331
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $408
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $405
line 1339
;1339:	}
ADDRGP4 $403
JUMPV
LABELV $402
line 1341
;1340:	else
;1341:	{
line 1343
;1342:		// well, we must die now
;1343:		blow = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1344
;1344:	}
LABELV $403
line 1346
;1345:
;1346:	if ( blow )
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $411
line 1347
;1347:	{
line 1349
;1348:		//G_Sound( ent, G_SoundIndex( "sound/weapons/flechette/warning.wav" ));
;1349:		ent->think = laserTrapExplode;//thinkF_WP_Explode;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 laserTrapExplode
ASGNP4
line 1350
;1350:		ent->nextthink = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1351
;1351:	}
ADDRGP4 $412
JUMPV
LABELV $411
line 1353
;1352:	else
;1353:	{
line 1355
;1354:		// we probably don't need to do this thinking logic very often...maybe this is fast enough?
;1355:		ent->nextthink = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1356
;1356:	}
LABELV $412
line 1357
;1357:}
LABELV $401
endproc prox_mine_think 32 20
proc WP_TraceSetStart 1132 28
line 1362
;1358:
;1359://-----------------------------------------------------------------------------
;1360:static void WP_TraceSetStart( gentity_t *ent, vec3_t start, vec3_t mins, vec3_t maxs )
;1361://-----------------------------------------------------------------------------
;1362:{
line 1368
;1363:	//make sure our start point isn't on the other side of a wall
;1364:	trace_t	tr;
;1365:	vec3_t	entMins;
;1366:	vec3_t	entMaxs;
;1367:
;1368:	VectorAdd( ent->r.currentOrigin, ent->r.mins, entMins );
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
ADDRLP4 1104
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 1104
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1080+4
ADDRLP4 1104
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 1104
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080+8
ADDRLP4 1108
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 1108
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1369
;1369:	VectorAdd( ent->r.currentOrigin, ent->r.maxs, entMaxs );
ADDRLP4 1112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092
ADDRLP4 1112
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 1112
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1112
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 1112
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092+8
ADDRLP4 1116
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 1116
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1371
;1370:
;1371:	if ( G_BoxInBounds( start, mins, maxs, entMins, entMaxs ) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1120
ADDRGP4 G_BoxInBounds
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
EQI4 $420
line 1372
;1372:	{
line 1373
;1373:		return;
ADDRGP4 $415
JUMPV
LABELV $420
line 1376
;1374:	}
;1375:
;1376:	if ( !ent->client )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $422
line 1377
;1377:	{
line 1378
;1378:		return;
ADDRGP4 $415
JUMPV
LABELV $422
line 1381
;1379:	}
;1380:
;1381:	trap_Trace( &tr, ent->client->ps.origin, mins, maxs, start, ent->s.number, MASK_SOLID|CONTENTS_SHOTCLIP );
ADDRLP4 0
ARGP4
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1124
INDIRP4
INDIRI4
ARGI4
CNSTI4 129
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1383
;1382:
;1383:	if ( tr.startsolid || tr.allsolid )
ADDRLP4 1128
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1128
INDIRI4
NEI4 $427
ADDRLP4 0
INDIRI4
ADDRLP4 1128
INDIRI4
EQI4 $424
LABELV $427
line 1384
;1384:	{
line 1385
;1385:		return;
ADDRGP4 $415
JUMPV
LABELV $424
line 1388
;1386:	}
;1387:
;1388:	if ( tr.fraction < 1.0f )
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $428
line 1389
;1389:	{
line 1390
;1390:		VectorCopy( tr.endpos, start );
ADDRFP4 4
INDIRP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1391
;1391:	}
LABELV $428
line 1392
;1392:}
LABELV $415
endproc WP_TraceSetStart 1132 28
export WP_ExplosiveDie
proc WP_ExplosiveDie 0 4
line 1395
;1393:
;1394:void WP_ExplosiveDie(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;1395:{
line 1396
;1396:	laserTrapExplode(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 laserTrapExplode
CALLV
pop
line 1397
;1397:}
LABELV $432
endproc WP_ExplosiveDie 0 4
export WP_flechette_alt_blow
proc WP_flechette_alt_blow 0 4
line 1402
;1398:
;1399://----------------------------------------------
;1400:void WP_flechette_alt_blow( gentity_t *ent )
;1401://----------------------------------------------
;1402:{
line 1409
;1403:	/*BG_EvaluateTrajectory( &ent->s.pos, level.time, ent->r.currentOrigin ); // Not sure if this is even necessary, but correct origins are cool?
;1404:
;1405:	G_RadiusDamage( ent->r.currentOrigin, &g_entities[ent->r.ownerNum], ent->splashDamage, ent->splashRadius, NULL, MOD_FLECHETTE_ALT_SPLASH );
;1406:	G_PlayEffect( "flechette/alt_blow", ent->currentOrigin );
;1407:	G_FreeEntity( ent );*/
;1408:
;1409:	ent->s.pos.trDelta[0] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1065353216
ASGNF4
line 1410
;1410:	ent->s.pos.trDelta[1] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 1411
;1411:	ent->s.pos.trDelta[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 0
ASGNF4
line 1413
;1412:
;1413:	laserTrapExplode(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 laserTrapExplode
CALLV
pop
line 1414
;1414:}
LABELV $433
endproc WP_flechette_alt_blow 0 4
proc WP_CreateFlechetteBouncyThing 20 24
line 1419
;1415:
;1416://------------------------------------------------------------------------------
;1417:static void WP_CreateFlechetteBouncyThing( vec3_t start, vec3_t fwd, gentity_t *self )
;1418://------------------------------------------------------------------------------
;1419:{
line 1420
;1420:	gentity_t	*missile = CreateMissile( start, fwd, 700 + random() * 700, 1500 + random() * 2000, self, qtrue );
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTF4 1143930880
ADDRLP4 4
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1143930880
ADDF4
ARGF4
CNSTF4 1157234688
ADDRLP4 8
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1153138688
ADDF4
CVFI4 4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 1422
;1421:	
;1422:	missile->think = WP_flechette_alt_blow;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 WP_flechette_alt_blow
ASGNP4
line 1424
;1423:
;1424:	missile->activator = self;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1426
;1425:
;1426:	missile->s.weapon = WP_FLECHETTE;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 9
ASGNI4
line 1427
;1427:	missile->classname = "flech_alt";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $435
ASGNP4
line 1428
;1428:	missile->mass = 4;
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
CNSTF4 1082130432
ASGNF4
line 1431
;1429:
;1430:	// How 'bout we give this thing a size...
;1431:	VectorSet( missile->r.mins, -3.0f, -3.0f, -3.0f );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3225419776
ASGNF4
line 1432
;1432:	VectorSet( missile->r.maxs, 3.0f, 3.0f, 3.0f );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1077936128
ASGNF4
line 1433
;1433:	missile->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 769
ASGNI4
line 1435
;1434:
;1435:	missile->touch = touch_NULL;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 touch_NULL
ASGNP4
line 1438
;1436:
;1437:	// normal ones bounce, alt ones explode on impact
;1438:	missile->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1440
;1439:
;1440:	missile->s.eFlags |= (EF_BOUNCE_HALF|EF_ALT_FIRING);
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 544
BORI4
ASGNI4
line 1442
;1441:
;1442:	missile->bounceCount = 50;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 50
ASGNI4
line 1444
;1443:
;1444:	missile->damage = FLECHETTE_ALT_DAMAGE;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 60
ASGNI4
line 1445
;1445:	missile->dflags = 0;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 1446
;1446:	missile->splashDamage = FLECHETTE_ALT_SPLASH_DAM;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 60
ASGNI4
line 1447
;1447:	missile->splashRadius = FLECHETTE_ALT_SPLASH_RAD;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTI4 128
ASGNI4
line 1449
;1448:
;1449:	missile->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 1451
;1450:
;1451:	missile->methodOfDeath = MOD_FLECHETTE_ALT_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 17
ASGNI4
line 1452
;1452:	missile->splashMethodOfDeath = MOD_FLECHETTE_ALT_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 17
ASGNI4
line 1455
;1453:	//missile->splashMethodOfDeath = MOD_UNKNOWN;//MOD_THERMAL_SPLASH;
;1454:
;1455:	VectorCopy( start, missile->pos2 );
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1456
;1456:}
LABELV $434
endproc WP_CreateFlechetteBouncyThing 20 24
proc WP_FlechetteAltFire 72 16
line 1461
;1457:
;1458://---------------------------------------------------------
;1459:static void WP_FlechetteAltFire( gentity_t *self )
;1460://---------------------------------------------------------
;1461:{
line 1465
;1462:	vec3_t 	dir, fwd, start, angs;
;1463:	int i;
;1464:
;1465:	vectoangles( forward, angs );
ADDRGP4 forward
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1466
;1466:	VectorCopy( muzzle, start );
ADDRLP4 28
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 1468
;1467:
;1468:	WP_TraceSetStart( self, start, vec3_origin, vec3_origin );//make sure our start point isn't on the other side of a wall
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 52
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 WP_TraceSetStart
CALLV
pop
line 1470
;1469:
;1470:	for ( i = 0; i < 2; i++ )
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $437
line 1471
;1471:	{
line 1472
;1472:		VectorCopy( angs, dir );
ADDRLP4 0
ADDRLP4 40
INDIRB
ASGNB 12
line 1474
;1473:
;1474:		dir[PITCH] -= random() * 4 + 8; // make it fly upwards
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
ADDRLP4 56
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1090519040
ADDF4
SUBF4
ASGNF4
line 1475
;1475:		dir[YAW] += crandom() * 2;
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 64
CNSTF4 1073741824
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 64
INDIRF4
ADDRLP4 64
INDIRF4
ADDRLP4 60
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 1476
;1476:		AngleVectors( dir, fwd, NULL, NULL );
ADDRLP4 0
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 68
CNSTP4 0
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1478
;1477:
;1478:		WP_CreateFlechetteBouncyThing( start, fwd, self );
ADDRLP4 28
ARGP4
ADDRLP4 16
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_CreateFlechetteBouncyThing
CALLV
pop
line 1479
;1479:	}
LABELV $438
line 1470
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
LTI4 $437
line 1480
;1480:}
LABELV $436
endproc WP_FlechetteAltFire 72 16
proc WP_FireFlechette 0 4
line 1485
;1481:
;1482://---------------------------------------------------------
;1483:static void WP_FireFlechette( gentity_t *ent, qboolean altFire )
;1484://---------------------------------------------------------
;1485:{
line 1486
;1486:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $443
line 1487
;1487:	{
line 1489
;1488:		//WP_FlechetteProxMine( ent );
;1489:		WP_FlechetteAltFire(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_FlechetteAltFire
CALLV
pop
line 1490
;1490:	}
ADDRGP4 $444
JUMPV
LABELV $443
line 1492
;1491:	else
;1492:	{
line 1493
;1493:		WP_FlechetteMainFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_FlechetteMainFire
CALLV
pop
line 1494
;1494:	}
LABELV $444
line 1495
;1495:}
LABELV $442
endproc WP_FireFlechette 0 4
lit
align 4
LABELV $446
byte 4 0
byte 4 0
byte 4 1065353216
export rocketThink
code
proc rocketThink 124 12
line 1510
;1496:
;1497:
;1498:
;1499:/*
;1500:======================================================================
;1501:
;1502:ROCKET LAUNCHER
;1503:
;1504:======================================================================
;1505:*/
;1506:
;1507://---------------------------------------------------------
;1508:void rocketThink( gentity_t *ent )
;1509://---------------------------------------------------------
;1510:{
line 1512
;1511:	vec3_t newdir, targetdir, 
;1512:			up={0,0,1}, right; 
ADDRLP4 56
ADDRGP4 $446
INDIRB
ASGNB 12
line 1516
;1513:	vec3_t	org;
;1514:	float dot, dot2, dis;
;1515:	int i;
;1516:	float vel = ROCKET_VELOCITY;
ADDRLP4 40
CNSTF4 1147207680
ASGNF4
line 1518
;1517:
;1518:	if (!ent->enemy || !ent->enemy->client || ent->enemy->health < 1)
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
CNSTU4 0
ASGNU4
ADDRLP4 80
INDIRP4
CVPU4 4
ADDRLP4 84
INDIRU4
EQU4 $450
ADDRLP4 80
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 84
INDIRU4
EQU4 $450
ADDRLP4 80
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $447
LABELV $450
line 1519
;1519:	{
line 1520
;1520:		ent->nextthink = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1521
;1521:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1522
;1522:		return;
ADDRGP4 $445
JUMPV
LABELV $447
line 1525
;1523:	}
;1524:
;1525:	if ( ent->enemy && ent->enemy->inuse )
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $452
ADDRLP4 88
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $452
line 1526
;1526:	{	
line 1527
;1527:		VectorCopy( ent->enemy->r.currentOrigin, org );
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 1528
;1528:		org[2] += (ent->enemy->r.mins[2] + ent->enemy->r.maxs[2]) * 0.5f;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28+8
ADDRLP4 28+8
INDIRF4
CNSTF4 1056964608
ADDRLP4 92
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 1530
;1529:
;1530:		VectorSubtract( org, ent->r.currentOrigin, targetdir );
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 28+4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 28+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1531
;1531:		VectorNormalize( targetdir );
ADDRLP4 16
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1534
;1532:
;1533:		// Now the rocket can't do a 180 in space, so we'll limit the turn to about 45 degrees.
;1534:		dot = DotProduct( targetdir, ent->movedir );
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 16
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
MULF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1537
;1535:
;1536:		// a dot of 1.0 means right-on-target.
;1537:		if ( dot < 0.0f )
ADDRLP4 68
INDIRF4
CNSTF4 0
GEF4 $461
line 1538
;1538:		{	
line 1540
;1539:			// Go in the direction opposite, start a 180.
;1540:			CrossProduct( ent->movedir, up, right );
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 1541
;1541:			dot2 = DotProduct( targetdir, right );
ADDRLP4 76
ADDRLP4 16
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 44+4
INDIRF4
MULF4
ADDF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 44+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1543
;1542:
;1543:			if ( dot2 > 0 )
ADDRLP4 76
INDIRF4
CNSTF4 0
LEF4 $467
line 1544
;1544:			{	
line 1546
;1545:				// Turn 45 degrees right.
;1546:				VectorMA( ent->movedir, 0.4f, right, newdir );
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
CNSTF4 1053609165
ASGNF4
ADDRLP4 4
ADDRLP4 104
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 104
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 44+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
CNSTF4 1053609165
ADDRLP4 44+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1547
;1547:			}
ADDRGP4 $468
JUMPV
LABELV $467
line 1549
;1548:			else
;1549:			{	
line 1551
;1550:				// Turn 45 degrees left.
;1551:				VectorMA(ent->movedir, -0.4f, right, newdir);
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
CNSTF4 3201092813
ASGNF4
ADDRLP4 4
ADDRLP4 104
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 104
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 44+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
CNSTF4 3201092813
ADDRLP4 44+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1552
;1552:			}
LABELV $468
line 1555
;1553:
;1554:			// Yeah we've adjusted horizontally, but let's split the difference vertically, so we kinda try to move towards it.
;1555:			newdir[2] = ( targetdir[2] + ent->movedir[2] ) * 0.5;
ADDRLP4 4+8
CNSTF4 1056964608
ADDRLP4 16+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDF4
MULF4
ASGNF4
line 1558
;1556:
;1557:			// let's also slow down a lot
;1558:			vel *= 0.5f;
ADDRLP4 40
CNSTF4 1056964608
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
line 1559
;1559:		}
ADDRGP4 $462
JUMPV
LABELV $461
line 1560
;1560:		else if ( dot < 0.70f )
ADDRLP4 68
INDIRF4
CNSTF4 1060320051
GEF4 $479
line 1561
;1561:		{	
line 1563
;1562:			// Still a bit off, so we turn a bit softer
;1563:			VectorMA( ent->movedir, 0.5f, targetdir, newdir );
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
CNSTF4 1056964608
ASGNF4
ADDRLP4 4
ADDRLP4 104
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 104
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1564
;1564:		}
ADDRGP4 $480
JUMPV
LABELV $479
line 1566
;1565:		else
;1566:		{	
line 1568
;1567:			// getting close, so turn a bit harder
;1568:			VectorMA( ent->movedir, 0.9f, targetdir, newdir );
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
CNSTF4 1063675494
ASGNF4
ADDRLP4 4
ADDRLP4 104
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 104
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
CNSTF4 1063675494
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1569
;1569:		}
LABELV $480
LABELV $462
line 1572
;1570:
;1571:		// add crazy drunkenness
;1572:		for (i = 0; i < 3; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $489
line 1573
;1573:		{
line 1574
;1574:			newdir[i] += crandom() * ent->random * 0.25f;
ADDRLP4 104
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 108
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRF4
CNSTF4 1048576000
CNSTF4 1073741824
ADDRLP4 104
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
MULF4
ADDF4
ASGNF4
line 1575
;1575:		}
LABELV $490
line 1572
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $489
line 1578
;1576:
;1577:		// decay the randomness
;1578:		ent->random *= 0.9f;
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTF4 1063675494
ADDRLP4 104
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1581
;1579:
;1580:		// Try to crash into the ground if we get close enough to do splash damage
;1581:		dis = Distance( ent->r.currentOrigin, org );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 108
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 72
ADDRLP4 108
INDIRF4
ASGNF4
line 1583
;1582:
;1583:		if ( dis < 128 )
ADDRLP4 72
INDIRF4
CNSTF4 1124073472
GEF4 $493
line 1584
;1584:		{
line 1586
;1585:			// the closer we get, the more we push the rocket down, heh heh.
;1586:			newdir[2] -= (1.0f - (dis / 128.0f)) * 0.6f;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1058642330
CNSTF4 1065353216
ADDRLP4 72
INDIRF4
CNSTF4 1124073472
DIVF4
SUBF4
MULF4
SUBF4
ASGNF4
line 1587
;1587:		}
LABELV $493
line 1589
;1588:
;1589:		VectorNormalize( newdir );
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1591
;1590:
;1591:		VectorScale( newdir, vel * 0.5f, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRLP4 40
INDIRF4
MULF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 4+4
INDIRF4
CNSTF4 1056964608
ADDRLP4 40
INDIRF4
MULF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 4+8
INDIRF4
CNSTF4 1056964608
ADDRLP4 40
INDIRF4
MULF4
MULF4
ASGNF4
line 1592
;1592:		VectorCopy( newdir, ent->movedir );
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 1593
;1593:		SnapVector( ent->s.pos.trDelta );			// save net bandwidth
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 1594
;1594:		VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 112
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 1595
;1595:		ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1596
;1596:	}
LABELV $452
line 1598
;1597:
;1598:	ent->nextthink = level.time + ROCKET_ALT_THINK_TIME;	// Nothing at all spectacular happened, continue.
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1599
;1599:	return;
LABELV $445
endproc rocketThink 124 12
proc WP_FireRocket 40 24
line 1605
;1600:}
;1601:
;1602://---------------------------------------------------------
;1603:static void WP_FireRocket( gentity_t *ent, qboolean altFire )
;1604://---------------------------------------------------------
;1605:{
line 1606
;1606:	int	damage	= ROCKET_DAMAGE;
ADDRLP4 16
CNSTI4 100
ASGNI4
line 1607
;1607:	int	vel = ROCKET_VELOCITY;
ADDRLP4 8
CNSTI4 900
ASGNI4
line 1608
;1608:	int dif = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1612
;1609:	float rTime;
;1610:	gentity_t *missile;
;1611:
;1612:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $501
line 1613
;1613:	{
line 1614
;1614:		vel *= 0.5f;
ADDRLP4 8
CNSTF4 1056964608
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1615
;1615:	}
LABELV $501
line 1617
;1616:
;1617:	missile = CreateMissile( muzzle, forward, vel, 10000, ent, altFire );
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1619
;1618:
;1619:	if (ent->client && ent->client->ps.rocketLockIndex != MAX_CLIENTS)
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $503
ADDRLP4 24
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
CNSTI4 32
EQI4 $503
line 1620
;1620:	{
line 1621
;1621:		rTime = ent->client->ps.rocketLockTime;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 588
ADDP4
INDIRF4
ASGNF4
line 1623
;1622:
;1623:		if (rTime == -1)
ADDRLP4 12
INDIRF4
CNSTF4 3212836864
NEF4 $505
line 1624
;1624:		{
line 1625
;1625:			rTime = ent->client->ps.rocketLastValidTime;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 584
ADDP4
INDIRF4
ASGNF4
line 1626
;1626:		}
LABELV $505
line 1627
;1627:		dif = ( level.time - rTime ) / ( 1200.0f / 16.0f );
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
SUBF4
CNSTF4 1117126656
DIVF4
CVFI4 4
ASGNI4
line 1629
;1628:
;1629:		if (dif < 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $508
line 1630
;1630:		{
line 1631
;1631:			dif = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1632
;1632:		}
LABELV $508
line 1635
;1633:
;1634:		//It's 10 even though it locks client-side at 8, because we want them to have a sturdy lock first, and because there's a slight difference in time between server and client
;1635:		if ( dif >= 10/* || random() * dif > 2 || random() > 0.97f*/ && rTime != -1 )
ADDRLP4 4
INDIRI4
CNSTI4 10
LTI4 $510
ADDRLP4 12
INDIRF4
CNSTF4 3212836864
EQF4 $510
line 1636
;1636:		{
line 1637
;1637:			missile->enemy = &g_entities[ent->client->ps.rocketLockIndex];
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1639
;1638:
;1639:			if (missile->enemy && missile->enemy->client && missile->enemy->health > 0 && !OnSameTeam(ent, missile->enemy))
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
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
EQU4 $512
ADDRLP4 28
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $512
ADDRLP4 28
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
LEI4 $512
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $512
line 1640
;1640:			{ //if enemy became invalid, died, or is on the same team, then don't seek it
line 1641
;1641:				missile->think = rocketThink;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 rocketThink
ASGNP4
line 1642
;1642:				missile->nextthink = level.time + ROCKET_ALT_THINK_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1643
;1643:			}
LABELV $512
line 1644
;1644:		}
LABELV $510
line 1646
;1645:
;1646:		ent->client->ps.rocketLockIndex = MAX_CLIENTS;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 32
ASGNI4
line 1647
;1647:		ent->client->ps.rocketLockTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
line 1648
;1648:		ent->client->ps.rocketTargetTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 592
ADDP4
CNSTF4 0
ASGNF4
line 1649
;1649:	}
LABELV $503
line 1651
;1650:
;1651:	missile->classname = "rocket_proj";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $515
ASGNP4
line 1652
;1652:	missile->s.weapon = WP_ROCKET_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 10
ASGNI4
line 1658
;1653:
;1654:	// NOTENOTE No mass yet.
;1655://	missile->mass = 10;
;1656:
;1657:	// Make it easier to hit things
;1658:	VectorSet( missile->r.maxs, ROCKET_SIZE, ROCKET_SIZE, ROCKET_SIZE );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1077936128
ASGNF4
line 1659
;1659:	VectorScale( missile->r.maxs, -1, missile->r.mins );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ASGNF4
line 1661
;1660:
;1661:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1662
;1662:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 128
ASGNI4
line 1663
;1663:	if (altFire)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $516
line 1664
;1664:	{
line 1665
;1665:		missile->methodOfDeath = MOD_ROCKET_HOMING;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 20
ASGNI4
line 1666
;1666:		missile->splashMethodOfDeath = MOD_ROCKET_HOMING_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 21
ASGNI4
line 1667
;1667:	}
ADDRGP4 $517
JUMPV
LABELV $516
line 1669
;1668:	else
;1669:	{
line 1670
;1670:		missile->methodOfDeath = MOD_ROCKET;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 18
ASGNI4
line 1671
;1671:		missile->splashMethodOfDeath = MOD_ROCKET_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 19
ASGNI4
line 1672
;1672:	}
LABELV $517
line 1675
;1673:	
;1674:	//rww - We don't want rockets to be deflected, do we?
;1675:	missile->clipmask = MASK_SHOT;// | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 769
ASGNI4
line 1676
;1676:	missile->splashDamage = ROCKET_SPLASH_DAMAGE;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 100
ASGNI4
line 1677
;1677:	missile->splashRadius = ROCKET_SPLASH_RADIUS;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTI4 160
ASGNI4
line 1680
;1678:
;1679:	// we don't want it to ever bounce
;1680:	missile->bounceCount = 0;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 0
ASGNI4
line 1681
;1681:}
LABELV $500
endproc WP_FireRocket 40 24
lit
align 4
LABELV $524
byte 4 0
byte 4 0
byte 4 1065353216
export thermalDetonatorExplode
code
proc thermalDetonatorExplode 40 24
line 1711
;1682:
;1683:/*
;1684:======================================================================
;1685:
;1686:THERMAL DETONATOR
;1687:
;1688:======================================================================
;1689:*/
;1690:
;1691:#define TD_DAMAGE			70 //only do 70 on a direct impact
;1692:#define TD_SPLASH_RAD		128
;1693:#define TD_SPLASH_DAM		90
;1694:#define TD_VELOCITY			900
;1695:#define TD_MIN_CHARGE		0.15f
;1696:#define TD_TIME				3000//6000
;1697:#define TD_ALT_TIME			3000
;1698:
;1699:#define TD_ALT_DAMAGE		60//100
;1700:#define TD_ALT_SPLASH_RAD	128
;1701:#define TD_ALT_SPLASH_DAM	50//90
;1702:#define TD_ALT_VELOCITY		600
;1703:#define TD_ALT_MIN_CHARGE	0.15f
;1704:#define TD_ALT_TIME			3000
;1705:
;1706:void thermalThinkStandard(gentity_t *ent);
;1707:
;1708://---------------------------------------------------------
;1709:void thermalDetonatorExplode( gentity_t *ent )
;1710://---------------------------------------------------------
;1711:{
line 1712
;1712:	if ( !ent->count )
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
NEI4 $519
line 1713
;1713:	{
line 1714
;1714:		G_Sound( ent, CHAN_VOICE, G_SoundIndex( "sound/weapons/thermal/warning.wav" ) );
ADDRGP4 $521
ARGP4
ADDRLP4 0
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1715
;1715:		ent->count = 1;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 1
ASGNI4
line 1716
;1716:		ent->bolt_Head = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1717
;1717:		ent->think = thermalThinkStandard;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 thermalThinkStandard
ASGNP4
line 1718
;1718:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1719
;1719:		ent->r.svFlags |= SVF_BROADCAST;//so everyone hears/sees the explosion?
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1720
;1720:	}
ADDRGP4 $520
JUMPV
LABELV $519
line 1722
;1721:	else
;1722:	{
line 1724
;1723:		vec3_t	origin;
;1724:		vec3_t	dir={0,0,1};
ADDRLP4 12
ADDRGP4 $524
INDIRB
ASGNB 12
line 1726
;1725:
;1726:		BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1727
;1727:		origin[2] += 8;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1728
;1728:		SnapVector( origin );
ADDRLP4 0
ADDRLP4 0
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 1729
;1729:		G_SetOrigin( ent, origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1732
;1730:
;1731://		VectorSet( pos, ent->r.currentOrigin[0], ent->r.currentOrigin[1], ent->r.currentOrigin[2] + 8 );
;1732:		ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1733
;1733:		G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( dir ) );
ADDRLP4 12
ARGP4
ADDRLP4 24
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 74
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1734
;1734:		ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 1
ASGNI4
line 1736
;1735:
;1736:		if (G_RadiusDamage( ent->r.currentOrigin, ent->parent,  ent->splashDamage, ent->splashRadius, 
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 696
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 700
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 708
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 G_RadiusDamage
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $531
line 1738
;1737:				ent, ent->splashMethodOfDeath))
;1738:		{
line 1739
;1739:			g_entities[ent->r.ownerNum].client->accuracy_hits++;
ADDRLP4 36
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1844
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1740
;1740:		}
LABELV $531
line 1742
;1741:
;1742:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1743
;1743:	}
LABELV $520
line 1744
;1744:}
LABELV $518
endproc thermalDetonatorExplode 40 24
export thermalThinkStandard
proc thermalThinkStandard 0 4
line 1747
;1745:
;1746:void thermalThinkStandard(gentity_t *ent)
;1747:{
line 1748
;1748:	if (ent->bolt_Head < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $535
line 1749
;1749:	{
line 1750
;1750:		ent->think = thermalDetonatorExplode;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 thermalDetonatorExplode
ASGNP4
line 1751
;1751:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1752
;1752:		return;
ADDRGP4 $534
JUMPV
LABELV $535
line 1755
;1753:	}
;1754:
;1755:	G_RunObject(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 1756
;1756:	ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1757
;1757:}
LABELV $534
endproc thermalThinkStandard 0 4
export WP_FireThermalDetonator
proc WP_FireThermalDetonator 56 16
line 1762
;1758:
;1759://---------------------------------------------------------
;1760:gentity_t *WP_FireThermalDetonator( gentity_t *ent, qboolean altFire )
;1761://---------------------------------------------------------
;1762:{
line 1765
;1763:	gentity_t	*bolt;
;1764:	vec3_t		dir, start;
;1765:	float chargeAmount = 1.0f; // default of full charge
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1767
;1766:	
;1767:	VectorCopy( forward, dir );
ADDRLP4 20
ADDRGP4 forward
INDIRB
ASGNB 12
line 1768
;1768:	VectorCopy( muzzle, start );
ADDRLP4 8
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 1770
;1769:
;1770:	bolt = G_Spawn();
ADDRLP4 32
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
ASGNP4
line 1772
;1771:	
;1772:	bolt->physicsObject = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 1774
;1773:
;1774:	bolt->classname = "thermal_detonator";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $541
ASGNP4
line 1775
;1775:	bolt->think = thermalThinkStandard;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 thermalThinkStandard
ASGNP4
line 1776
;1776:	bolt->nextthink = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1777
;1777:	bolt->touch = touch_NULL;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 touch_NULL
ASGNP4
line 1781
;1778://	bolt->mass = 10;		// NOTENOTE No mass implementation yet
;1779:
;1780:	// How 'bout we give this thing a size...
;1781:	VectorSet( bolt->r.mins, -3.0f, -3.0f, -3.0f );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3225419776
ASGNF4
line 1782
;1782:	VectorSet( bolt->r.maxs, 3.0f, 3.0f, 3.0f );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1077936128
ASGNF4
line 1783
;1783:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 769
ASGNI4
line 1785
;1784:
;1785:	W_TraceSetStart( ent, start, bolt->r.mins, bolt->r.maxs );//make sure our start point isn't on the other side of a wall
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRGP4 W_TraceSetStart
CALLV
pop
line 1787
;1786:
;1787:	if ( ent->client )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $543
line 1788
;1788:	{
line 1789
;1789:		chargeAmount = level.time - ent->client->ps.weaponChargeTime;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 1790
;1790:	}
LABELV $543
line 1793
;1791:
;1792:	// get charge amount
;1793:	chargeAmount = chargeAmount / (float)TD_VELOCITY;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1147207680
DIVF4
ASGNF4
line 1795
;1794:
;1795:	if ( chargeAmount > 1.0f )
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
LEF4 $546
line 1796
;1796:	{
line 1797
;1797:		chargeAmount = 1.0f;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1798
;1798:	}
ADDRGP4 $547
JUMPV
LABELV $546
line 1799
;1799:	else if ( chargeAmount < TD_MIN_CHARGE )
ADDRLP4 4
INDIRF4
CNSTF4 1041865114
GEF4 $548
line 1800
;1800:	{
line 1801
;1801:		chargeAmount = TD_MIN_CHARGE;
ADDRLP4 4
CNSTF4 1041865114
ASGNF4
line 1802
;1802:	}
LABELV $548
LABELV $547
line 1805
;1803:
;1804:	// normal ones bounce, alt ones explode on impact
;1805:	bolt->bolt_Head = level.time + TD_TIME; // How long 'til she blows
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1806
;1806:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1807
;1807:	bolt->parent = ent;
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1808
;1808:	bolt->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1809
;1809:	VectorScale( dir, TD_VELOCITY * chargeAmount, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 20
INDIRF4
CNSTF4 1147207680
ADDRLP4 4
INDIRF4
MULF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 20+4
INDIRF4
CNSTF4 1147207680
ADDRLP4 4
INDIRF4
MULF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 20+8
INDIRF4
CNSTF4 1147207680
ADDRLP4 4
INDIRF4
MULF4
MULF4
ASGNF4
line 1811
;1810:
;1811:	if ( ent->health >= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
LTI4 $553
line 1812
;1812:	{
line 1813
;1813:		bolt->s.pos.trDelta[2] += 120;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1814
;1814:	}
LABELV $553
line 1816
;1815:
;1816:	if ( !altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $555
line 1817
;1817:	{
line 1819
;1818:		//bolt->alt_fire = qtrue;
;1819:		bolt->s.eFlags |= EF_BOUNCE_HALF;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1820
;1820:	}
LABELV $555
line 1822
;1821:
;1822:	bolt->s.loopSound = G_SoundIndex( "sound/weapons/thermal/thermloop.wav" );
ADDRGP4 $557
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1824
;1823:
;1824:	bolt->damage = TD_DAMAGE;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 70
ASGNI4
line 1825
;1825:	bolt->dflags = 0;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 1826
;1826:	bolt->splashDamage = TD_SPLASH_DAM;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 90
ASGNI4
line 1827
;1827:	bolt->splashRadius = TD_SPLASH_RAD;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTI4 128
ASGNI4
line 1829
;1828:
;1829:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1830
;1830:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 1831
;1831:	bolt->s.weapon = WP_THERMAL;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 11
ASGNI4
line 1833
;1832:
;1833:	bolt->methodOfDeath = MOD_THERMAL;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 22
ASGNI4
line 1834
;1834:	bolt->splashMethodOfDeath = MOD_THERMAL_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 23
ASGNI4
line 1836
;1835:
;1836:	bolt->s.pos.trTime = level.time;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1837
;1837:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 8
INDIRB
ASGNB 12
line 1839
;1838:	
;1839:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 1840
;1840:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 8
INDIRB
ASGNB 12
line 1842
;1841:
;1842:	VectorCopy( start, bolt->pos2 );
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRLP4 8
INDIRB
ASGNB 12
line 1844
;1843:
;1844:	bolt->bounceCount = -5;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 -5
ASGNI4
line 1846
;1845:
;1846:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $540
endproc WP_FireThermalDetonator 56 16
export WP_DropThermal
proc WP_DropThermal 4 16
line 1850
;1847:}
;1848:
;1849:gentity_t *WP_DropThermal( gentity_t *ent )
;1850:{
line 1851
;1851:	AngleVectors( ent->client->ps.viewangles, forward, right, up );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1852
;1852:	return (WP_FireThermalDetonator( ent, qfalse ));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ADDRGP4 WP_FireThermalDetonator
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $559
endproc WP_DropThermal 4 16
export laserTrapExplode
proc laserTrapExplode 16 24
line 1873
;1853:}
;1854:
;1855:
;1856:/*
;1857:======================================================================
;1858:
;1859:LASER TRAP / TRIP MINE
;1860:
;1861:======================================================================
;1862:*/
;1863:#define LT_DAMAGE			100
;1864:#define LT_SPLASH_RAD		256.0f
;1865:#define LT_SPLASH_DAM		105
;1866:#define LT_VELOCITY			900.0f
;1867:#define LT_SIZE				1.5f
;1868:#define LT_ALT_TIME			2000
;1869:#define	LT_ACTIVATION_DELAY	1000
;1870:#define	LT_DELAY_TIME		50
;1871:
;1872:void laserTrapExplode( gentity_t *self )
;1873:{
line 1876
;1874:	vec3_t v;
;1875:	//FIXME: damage some along line?
;1876:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 1878
;1877:
;1878:	if (self->activator)
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $561
line 1879
;1879:	{
line 1880
;1880:		G_RadiusDamage( self->r.currentOrigin, self->activator, self->splashDamage, self->splashRadius, self, MOD_TRIP_MINE_SPLASH/*MOD_LT_SPLASH*/ );
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
CNSTI4 732
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 696
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 700
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 24
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 1881
;1881:	}
LABELV $561
line 1884
;1882:	//FIXME: clear me from owner's list of tripmines?
;1883:
;1884:	if (self->s.weapon != WP_FLECHETTE)
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 9
EQI4 $563
line 1885
;1885:	{
line 1886
;1886:		G_AddEvent( self, EV_MISSILE_MISS, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 74
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1887
;1887:	}
LABELV $563
line 1889
;1888:
;1889:	VectorCopy(self->s.pos.trDelta, v);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1892
;1890:	//Explode outward from the surface
;1891:
;1892:	if (self->s.time == -2)
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 -2
NEI4 $565
line 1893
;1893:	{
line 1894
;1894:		v[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1895
;1895:		v[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1896
;1896:		v[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1897
;1897:	}
LABELV $565
line 1899
;1898:
;1899:	if (self->s.weapon == WP_FLECHETTE)
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 9
NEI4 $569
line 1900
;1900:	{
line 1901
;1901:		G_PlayEffect(EFFECT_EXPLOSION_FLECHETTE, self->r.currentOrigin, v);
CNSTI4 7
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 1902
;1902:	}
ADDRGP4 $570
JUMPV
LABELV $569
line 1904
;1903:	else
;1904:	{
line 1905
;1905:		G_PlayEffect(EFFECT_EXPLOSION_TRIPMINE, self->r.currentOrigin, v);
CNSTI4 5
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 1906
;1906:	}
LABELV $570
line 1908
;1907:
;1908:	self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1909
;1909:	self->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1910
;1910:}
LABELV $560
endproc laserTrapExplode 16 24
export laserTrapDelayedExplode
proc laserTrapDelayedExplode 12 0
line 1913
;1911:
;1912:void laserTrapDelayedExplode( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath )
;1913:{
line 1914
;1914:	self->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1915
;1915:	self->think = laserTrapExplode;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 laserTrapExplode
ASGNP4
line 1916
;1916:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1917
;1917:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 1918
;1918:	if ( attacker && !attacker->s.number )
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $574
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $574
line 1919
;1919:	{
line 1921
;1920:		//less damage when shot by player
;1921:		self->splashDamage /= 3;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 3
DIVI4
ASGNI4
line 1922
;1922:		self->splashRadius /= 3;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 3
DIVI4
ASGNI4
line 1924
;1923:		//FIXME: different effect?
;1924:	}
LABELV $574
line 1925
;1925:}
LABELV $572
endproc laserTrapDelayedExplode 12 0
export touchLaserTrap
proc touchLaserTrap 8 12
line 1928
;1926:
;1927:void touchLaserTrap( gentity_t *ent, gentity_t *other, trace_t *trace )
;1928:{
line 1931
;1929:	// if the guy that touches this grenade can take damage, he's about to.
;1930:	//if ( other->takedamage )
;1931:	if (other && other->s.number < 1022)
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $577
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1022
GEI4 $577
line 1932
;1932:	{ //just explode if we hit any entity. This way we don't have things happening like tripmines floating
line 1934
;1933:	  //in the air after getting stuck to a moving door
;1934:		if ( ent->activator != other )
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
EQU4 $578
line 1935
;1935:		{
line 1936
;1936:			ent->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
CNSTP4 0
ASGNP4
line 1937
;1937:			ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1938
;1938:			ent->think = laserTrapExplode;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 laserTrapExplode
ASGNP4
line 1939
;1939:			VectorCopy(trace->plane.normal, ent->s.pos.trDelta);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1940
;1940:		}
line 1941
;1941:	}
ADDRGP4 $578
JUMPV
LABELV $577
line 1943
;1942:	else
;1943:	{
line 1944
;1944:		ent->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
CNSTP4 0
ASGNP4
line 1945
;1945:		if (trace->entityNum != ENTITYNUM_NONE)
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $582
line 1946
;1946:		{
line 1947
;1947:			ent->enemy = &g_entities[trace->entityNum];
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 852
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1948
;1948:		}
LABELV $582
line 1949
;1949:		laserTrapStick(ent, trace->endpos, trace->plane.normal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 laserTrapStick
CALLV
pop
line 1950
;1950:	}
LABELV $578
line 1951
;1951:}
LABELV $576
endproc touchLaserTrap 8 12
export laserTrapThink
proc laserTrapThink 1116 28
line 1954
;1952:
;1953:void laserTrapThink ( gentity_t *ent )
;1954:{
line 1960
;1955:	gentity_t	*traceEnt;
;1956:	vec3_t		end;
;1957:	trace_t		tr;
;1958:
;1959:	//G_RunObject(ent);
;1960:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1963
;1961:
;1962:	//turn on the beam effect
;1963:	if ( !(ent->s.eFlags&EF_FIRING) )
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
NEI4 $585
line 1964
;1964:	{//arm me
line 1965
;1965:		G_Sound( ent, CHAN_VOICE, G_SoundIndex( "sound/weapons/laser_trap/warning.wav" ) );
ADDRGP4 $587
ARGP4
ADDRLP4 1096
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 1096
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1966
;1966:		ent->s.eFlags |= EF_FIRING;
ADDRLP4 1100
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 1100
INDIRP4
ADDRLP4 1100
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 1967
;1967:	}
LABELV $585
line 1968
;1968:	ent->think = laserTrapThink;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 laserTrapThink
ASGNP4
line 1969
;1969:	ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1972
;1970:
;1971:	// Find the main impact point
;1972:	VectorMA ( ent->s.pos.trBase, 1024, ent->movedir, end );
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1100
CNSTF4 1149239296
ASGNF4
ADDRLP4 0
ADDRLP4 1096
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1100
INDIRF4
ADDRLP4 1096
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 1096
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 1100
INDIRF4
ADDRLP4 1096
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 1104
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1149239296
ADDRLP4 1104
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1973
;1973:	trap_Trace ( &tr, ent->r.currentOrigin, NULL, NULL, end, ent->s.number, MASK_SHOT);
ADDRLP4 12
ARGP4
ADDRLP4 1108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1112
CNSTP4 0
ASGNP4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1108
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1975
;1974:	
;1975:	traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 1092
CNSTI4 852
ADDRLP4 12+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1977
;1976:
;1977:	ent->s.time = -1; //let all clients know to draw a beam from this guy
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 -1
ASGNI4
line 1979
;1978:
;1979:	if ( traceEnt->client || tr.startsolid )
ADDRLP4 1092
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $595
ADDRLP4 12+4
INDIRI4
CNSTI4 0
EQI4 $592
LABELV $595
line 1980
;1980:	{
line 1982
;1981:		//go boom
;1982:		ent->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
CNSTP4 0
ASGNP4
line 1983
;1983:		ent->nextthink = level.time + LT_DELAY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 1984
;1984:		ent->think = laserTrapExplode;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 laserTrapExplode
ASGNP4
line 1985
;1985:	}
LABELV $592
line 1986
;1986:}
LABELV $584
endproc laserTrapThink 1116 28
export laserTrapStick
proc laserTrapStick 32 12
line 1989
;1987:
;1988:void laserTrapStick( gentity_t *ent, vec3_t endpos, vec3_t normal )
;1989:{
line 1994
;1990:	//vec3_t	org;
;1991:
;1992:	// Back away from the wall
;1993:	//VectorMA( endpos, -1, normal, org );
;1994:	G_SetOrigin( ent, endpos );//org );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1995
;1995:	VectorCopy( normal, ent->pos1 );
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 1997
;1996:
;1997:	VectorClear( ent->s.apos.trDelta );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 1999
;1998:	// This will orient the object to face in the direction of the normal
;1999:	VectorCopy( normal, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 2001
;2000:	//VectorScale( normal, -1, ent->s.pos.trDelta );
;2001:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2005
;2002:	
;2003:	
;2004:	//This does nothing, cg_missile makes assumptions about direction of travel controlling angles
;2005:	vectoangles( normal, ent->s.apos.trBase );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2006
;2006:	VectorClear( ent->s.apos.trDelta );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 2007
;2007:	ent->s.apos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 2008
;2008:	VectorCopy( ent->s.apos.trBase, ent->s.angles );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 2009
;2009:	VectorCopy( ent->s.angles, ent->r.currentAngles );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 2012
;2010:	
;2011:
;2012:	G_Sound( ent, CHAN_VOICE, G_SoundIndex( "sound/weapons/laser_trap/stick.wav" ) );
ADDRGP4 $599
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2013
;2013:	if ( ent->count )
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
EQI4 $600
line 2014
;2014:	{//a tripwire
line 2016
;2015:		//add draw line flag
;2016:		VectorCopy( normal, ent->movedir );
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 2017
;2017:		ent->think = laserTrapThink;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 laserTrapThink
ASGNP4
line 2018
;2018:		ent->nextthink = level.time + LT_ACTIVATION_DELAY;//delay the activation
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2019
;2019:		ent->touch = touch_NULL;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 touch_NULL
ASGNP4
line 2021
;2020:		//make it shootable
;2021:		ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 2022
;2022:		ent->health = 5;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 5
ASGNI4
line 2023
;2023:		ent->die = laserTrapDelayedExplode;
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRGP4 laserTrapDelayedExplode
ASGNP4
line 2026
;2024:
;2025:		//shove the box through the wall
;2026:		VectorSet( ent->r.mins, -LT_SIZE*2, -LT_SIZE*2, -LT_SIZE*2 );
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3225419776
ASGNF4
line 2027
;2027:		VectorSet( ent->r.maxs, LT_SIZE*2, LT_SIZE*2, LT_SIZE*2 );
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1077936128
ASGNF4
line 2030
;2028:
;2029:		//so that the owner can blow it up with projectiles
;2030:		ent->r.svFlags |= SVF_OWNERNOTSHARED;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 2031
;2031:	}
ADDRGP4 $601
JUMPV
LABELV $600
line 2033
;2032:	else
;2033:	{
line 2034
;2034:		ent->touch = touchLaserTrap;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 touchLaserTrap
ASGNP4
line 2035
;2035:		ent->think = laserTrapExplode;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 laserTrapExplode
ASGNP4
line 2036
;2036:		ent->nextthink = level.time + LT_ALT_TIME; // How long 'til she blows
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2037
;2037:	}
LABELV $601
line 2038
;2038:}
LABELV $597
endproc laserTrapStick 32 12
export TrapThink
proc TrapThink 0 4
line 2041
;2039:
;2040:void TrapThink(gentity_t *ent)
;2041:{
line 2042
;2042:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 2044
;2043:
;2044:	G_RunObject(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 2045
;2045:}
LABELV $604
endproc TrapThink 0 4
export CreateLaserTrap
proc CreateLaserTrap 28 4
line 2048
;2046:
;2047:void CreateLaserTrap( gentity_t *laserTrap, vec3_t start, gentity_t *owner )
;2048:{
line 2049
;2049:	laserTrap->classname = "laserTrap";
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $607
ASGNP4
line 2050
;2050:	laserTrap->s.eFlags = EF_BOUNCE_HALF;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 2051
;2051:	laserTrap->s.eFlags |= EF_MISSILE_STICK;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2097152
BORI4
ASGNI4
line 2052
;2052:	laserTrap->splashDamage = LT_SPLASH_DAM;//*2;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 105
ASGNI4
line 2053
;2053:	laserTrap->splashRadius = LT_SPLASH_RAD;//*2;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTI4 256
ASGNI4
line 2054
;2054:	laserTrap->damage = LT_DAMAGE;//*DMG_VAR;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 100
ASGNI4
line 2055
;2055:	laserTrap->methodOfDeath = MOD_TRIP_MINE_SPLASH;//MOD_TRIP_WIRE;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 24
ASGNI4
line 2056
;2056:	laserTrap->splashMethodOfDeath = MOD_TRIP_MINE_SPLASH;//MOD_TRIP_WIRE;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 24
ASGNI4
line 2057
;2057:	laserTrap->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 2058
;2058:	laserTrap->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 2059
;2059:	laserTrap->s.weapon = WP_TRIP_MINE;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 12
ASGNI4
line 2060
;2060:	laserTrap->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 2061
;2061:	laserTrap->r.contents = MASK_SHOT;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 769
ASGNI4
line 2062
;2062:	laserTrap->parent = owner;
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 2063
;2063:	laserTrap->activator = owner;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 2064
;2064:	laserTrap->r.ownerNum = owner->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 2065
;2065:	VectorSet( laserTrap->r.mins, -LT_SIZE, -LT_SIZE, -LT_SIZE );
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3217031168
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3217031168
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3217031168
ASGNF4
line 2066
;2066:	VectorSet( laserTrap->r.maxs, LT_SIZE, LT_SIZE, LT_SIZE );
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1069547520
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1069547520
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1069547520
ASGNF4
line 2067
;2067:	laserTrap->clipmask = MASK_SHOT;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 769
ASGNI4
line 2068
;2068:	laserTrap->s.solid = 2;
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 2069
;2069:	laserTrap->s.modelindex = G_ModelIndex( "models/weapons2/laser_trap/laser_trap_w.glm" );
ADDRGP4 $608
ARGP4
ADDRLP4 4
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 2070
;2070:	laserTrap->s.modelGhoul2 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 2071
;2071:	laserTrap->s.g2radius = 40;
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 40
ASGNI4
line 2073
;2072:
;2073:	laserTrap->s.genericenemyindex = owner->s.number+1024;
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
CNSTI4 1024
ADDI4
ASGNI4
line 2075
;2074:
;2075:	laserTrap->health = 1;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 1
ASGNI4
line 2077
;2076:
;2077:	laserTrap->s.time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 0
ASGNI4
line 2079
;2078:
;2079:	laserTrap->s.pos.trTime = level.time;		// move a bit on the very first frame
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2080
;2080:	VectorCopy( start, laserTrap->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2081
;2081:	SnapVector( laserTrap->s.pos.trBase );			// save net bandwidth
ADDRLP4 8
ADDRFP4 0
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
ADDRFP4 0
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
ADDRFP4 0
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
line 2083
;2082:	
;2083:	SnapVector( laserTrap->s.pos.trDelta );			// save net bandwidth
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 36
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
ADDRFP4 0
INDIRP4
CNSTI4 40
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
ADDRFP4 0
INDIRP4
CNSTI4 44
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
line 2084
;2084:	VectorCopy (start, laserTrap->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2086
;2085:
;2086:	laserTrap->s.apos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 5
ASGNI4
line 2087
;2087:	laserTrap->s.apos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2088
;2088:	laserTrap->s.apos.trBase[YAW] = rand()%360;
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 2089
;2089:	laserTrap->s.apos.trBase[PITCH] = rand()%360;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 2090
;2090:	laserTrap->s.apos.trBase[ROLL] = rand()%360;
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 16
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 2092
;2091:
;2092:	if (rand()%10 < 5)
ADDRLP4 20
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GEI4 $611
line 2093
;2093:	{
line 2094
;2094:		laserTrap->s.apos.trBase[YAW] = -laserTrap->s.apos.trBase[YAW];
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
NEGF4
ASGNF4
line 2095
;2095:	}
LABELV $611
line 2097
;2096:
;2097:	VectorCopy( start, laserTrap->pos2 );
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2098
;2098:	laserTrap->touch = touchLaserTrap;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 touchLaserTrap
ASGNP4
line 2099
;2099:	laserTrap->think = TrapThink;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 TrapThink
ASGNP4
line 2100
;2100:	laserTrap->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 2101
;2101:}
LABELV $606
endproc CreateLaserTrap 28 4
lit
align 4
LABELV $615
byte 4 1023
skip 4092
export WP_PlaceLaserTrap
code
proc WP_PlaceLaserTrap 4156 12
line 2104
;2102:
;2103:void WP_PlaceLaserTrap( gentity_t *ent, qboolean alt_fire )
;2104:{
line 2106
;2105:	gentity_t	*laserTrap;
;2106:	gentity_t	*found = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2108
;2107:	vec3_t		dir, start;
;2108:	int			trapcount = 0;
ADDRLP4 4120
CNSTI4 0
ASGNI4
line 2109
;2109:	int			foundLaserTraps[MAX_GENTITIES] = {ENTITYNUM_NONE};
ADDRLP4 8
ADDRGP4 $615
INDIRB
ASGNB 4096
line 2117
;2110:	int			trapcount_org;
;2111:	int			lowestTimeStamp;
;2112:	int			removeMe;
;2113:	int			i;
;2114:
;2115:	//FIXME: surface must be within 64
;2116:
;2117:	VectorCopy( forward, dir );
ADDRLP4 4124
ADDRGP4 forward
INDIRB
ASGNB 12
line 2118
;2118:	VectorCopy( muzzle, start );
ADDRLP4 4136
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 2120
;2119:
;2120:	laserTrap = G_Spawn();
ADDRLP4 4148
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4148
INDIRP4
ASGNP4
ADDRGP4 $617
JUMPV
LABELV $616
line 2125
;2121:	
;2122:	//limit to 10 placed at any one time
;2123:	//see how many there are now
;2124:	while ( (found = G_Find( found, FOFS(classname), "laserTrap" )) != NULL )
;2125:	{
line 2126
;2126:		if ( found->parent != ent )
ADDRLP4 4
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $619
line 2127
;2127:		{
line 2128
;2128:			continue;
ADDRGP4 $617
JUMPV
LABELV $619
line 2130
;2129:		}
;2130:		foundLaserTraps[trapcount++] = found->s.number;
ADDRLP4 4152
ADDRLP4 4120
INDIRI4
ASGNI4
ADDRLP4 4120
ADDRLP4 4152
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4152
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRP4
INDIRI4
ASGNI4
line 2131
;2131:	}
LABELV $617
line 2124
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $607
ARGP4
ADDRLP4 4152
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 4152
INDIRP4
ASGNP4
ADDRLP4 4152
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $616
line 2133
;2132:	//now remove first ones we find until there are only 9 left
;2133:	found = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2134
;2134:	trapcount_org = trapcount;
ADDRLP4 4112
ADDRLP4 4120
INDIRI4
ASGNI4
line 2135
;2135:	lowestTimeStamp = level.time;
ADDRLP4 4104
ADDRGP4 level+32
INDIRI4
ASGNI4
ADDRGP4 $623
JUMPV
LABELV $622
line 2137
;2136:	while ( trapcount > 9 )
;2137:	{
line 2138
;2138:		removeMe = -1;
ADDRLP4 4116
CNSTI4 -1
ASGNI4
line 2139
;2139:		for ( i = 0; i < trapcount_org; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $628
JUMPV
LABELV $625
line 2140
;2140:		{
line 2141
;2141:			if ( foundLaserTraps[i] == ENTITYNUM_NONE )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $629
line 2142
;2142:			{
line 2143
;2143:				continue;
ADDRGP4 $626
JUMPV
LABELV $629
line 2145
;2144:			}
;2145:			found = &g_entities[foundLaserTraps[i]];
ADDRLP4 4
CNSTI4 852
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2146
;2146:			if ( laserTrap && found->setTime < lowestTimeStamp )
ADDRLP4 4108
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $631
ADDRLP4 4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRLP4 4104
INDIRI4
GEI4 $631
line 2147
;2147:			{
line 2148
;2148:				removeMe = i;
ADDRLP4 4116
ADDRLP4 0
INDIRI4
ASGNI4
line 2149
;2149:				lowestTimeStamp = found->setTime;
ADDRLP4 4104
ADDRLP4 4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ASGNI4
line 2150
;2150:			}
LABELV $631
line 2151
;2151:		}
LABELV $626
line 2139
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $628
ADDRLP4 0
INDIRI4
ADDRLP4 4112
INDIRI4
LTI4 $625
line 2152
;2152:		if ( removeMe != -1 )
ADDRLP4 4116
INDIRI4
CNSTI4 -1
EQI4 $624
line 2153
;2153:		{
line 2155
;2154:			//remove it... or blow it?
;2155:			if ( &g_entities[foundLaserTraps[removeMe]] == NULL )
CNSTI4 852
ADDRLP4 4116
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
CNSTU4 0
NEU4 $635
line 2156
;2156:			{
line 2157
;2157:				break;
ADDRGP4 $624
JUMPV
LABELV $635
line 2160
;2158:			}
;2159:			else
;2160:			{
line 2161
;2161:				G_FreeEntity( &g_entities[foundLaserTraps[removeMe]] );
CNSTI4 852
ADDRLP4 4116
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 2162
;2162:			}
line 2163
;2163:			foundLaserTraps[removeMe] = ENTITYNUM_NONE;
ADDRLP4 4116
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTI4 1023
ASGNI4
line 2164
;2164:			trapcount--;
ADDRLP4 4120
ADDRLP4 4120
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2165
;2165:		}
line 2167
;2166:		else
;2167:		{
line 2168
;2168:			break;
LABELV $634
line 2170
;2169:		}
;2170:	}
LABELV $623
line 2136
ADDRLP4 4120
INDIRI4
CNSTI4 9
GTI4 $622
LABELV $624
line 2173
;2171:
;2172:	//now make the new one
;2173:	CreateLaserTrap( laserTrap, start, ent );
ADDRLP4 4108
INDIRP4
ARGP4
ADDRLP4 4136
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CreateLaserTrap
CALLV
pop
line 2176
;2174:
;2175:	//set player-created-specific fields
;2176:	laserTrap->setTime = level.time;//remember when we placed it
ADDRLP4 4108
INDIRP4
CNSTI4 628
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2178
;2177:
;2178:	if (!alt_fire)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $638
line 2179
;2179:	{//tripwire
line 2180
;2180:		laserTrap->count = 1;
ADDRLP4 4108
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 1
ASGNI4
line 2181
;2181:	}
LABELV $638
line 2184
;2182:
;2183:	//move it
;2184:	laserTrap->s.pos.trType = TR_GRAVITY;
ADDRLP4 4108
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 2186
;2185:
;2186:	if (alt_fire)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $640
line 2187
;2187:	{
line 2188
;2188:		VectorScale( dir, 512, laserTrap->s.pos.trDelta );
ADDRLP4 4108
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1140850688
ADDRLP4 4124
INDIRF4
MULF4
ASGNF4
ADDRLP4 4108
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1140850688
ADDRLP4 4124+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4108
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1140850688
ADDRLP4 4124+8
INDIRF4
MULF4
ASGNF4
line 2189
;2189:	}
ADDRGP4 $641
JUMPV
LABELV $640
line 2191
;2190:	else
;2191:	{
line 2192
;2192:		VectorScale( dir, 256, laserTrap->s.pos.trDelta );
ADDRLP4 4108
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1132462080
ADDRLP4 4124
INDIRF4
MULF4
ASGNF4
ADDRLP4 4108
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1132462080
ADDRLP4 4124+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4108
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1132462080
ADDRLP4 4124+8
INDIRF4
MULF4
ASGNF4
line 2193
;2193:	}
LABELV $641
line 2195
;2194:
;2195:	trap_LinkEntity(laserTrap);
ADDRLP4 4108
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2196
;2196:}
LABELV $614
endproc WP_PlaceLaserTrap 4156 12
export VectorNPos
proc VectorNPos 4 0
line 2207
;2197:
;2198:
;2199:/*
;2200:======================================================================
;2201:
;2202:DET PACK
;2203:
;2204:======================================================================
;2205:*/
;2206:void VectorNPos(vec3_t in, vec3_t out)
;2207:{
line 2208
;2208:	if (in[0] < 0) { out[0] = -in[0]; } else { out[0] = in[0]; }
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 0
GEF4 $647
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
NEGF4
ASGNF4
ADDRGP4 $648
JUMPV
LABELV $647
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
LABELV $648
line 2209
;2209:	if (in[1] < 0) { out[1] = -in[1]; } else { out[1] = in[1]; }
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $649
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
NEGF4
ASGNF4
ADDRGP4 $650
JUMPV
LABELV $649
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ASGNF4
LABELV $650
line 2210
;2210:	if (in[2] < 0) { out[2] = -in[2]; } else { out[2] = in[2]; }
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 0
GEF4 $651
ADDRLP4 0
CNSTI4 8
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
NEGF4
ASGNF4
ADDRGP4 $652
JUMPV
LABELV $651
ADDRLP4 0
CNSTI4 8
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ASGNF4
LABELV $652
line 2211
;2211:}
LABELV $646
endproc VectorNPos 4 0
export charge_stick
proc charge_stick 68 24
line 2216
;2212:
;2213:void DetPackBlow(gentity_t *self);
;2214:
;2215:void charge_stick (gentity_t *self, gentity_t *other, trace_t *trace)
;2216:{
line 2219
;2217:	gentity_t	*tent;
;2218:
;2219:	if (other && other->s.number < 1022 &&
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
EQU4 $654
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1022
GEI4 $654
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $656
ADDRLP4 4
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
NEI4 $654
LABELV $656
line 2221
;2220:		(other->client || !other->s.weapon))
;2221:	{
line 2224
;2222:		vec3_t vNor, tN;
;2223:
;2224:		VectorCopy(trace->plane.normal, vNor);
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2225
;2225:		VectorNormalize(vNor);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2226
;2226:		VectorNPos(self->s.pos.trDelta, tN);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 VectorNPos
CALLV
pop
line 2227
;2227:		self->s.pos.trDelta[0] += vNor[0]*(tN[0]*(((float)Q_irand(1, 10))*0.1));
CNSTI4 1
ARGI4
CNSTI4 10
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
ADDRLP4 12
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1036831949
ADDRLP4 36
INDIRI4
CVIF4 4
MULF4
MULF4
MULF4
ADDF4
ASGNF4
line 2228
;2228:		self->s.pos.trDelta[1] += vNor[1]*(tN[1]*(((float)Q_irand(1, 10))*0.1));
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 44
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 24+4
INDIRF4
CNSTF4 1036831949
ADDRLP4 44
INDIRI4
CVIF4 4
MULF4
MULF4
MULF4
ADDF4
ASGNF4
line 2229
;2229:		self->s.pos.trDelta[2] += vNor[1]*(tN[2]*(((float)Q_irand(1, 10))*0.1));
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 52
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 24+8
INDIRF4
CNSTF4 1036831949
ADDRLP4 52
INDIRI4
CVIF4 4
MULF4
MULF4
MULF4
ADDF4
ASGNF4
line 2231
;2230:
;2231:		vectoangles(vNor, self->s.angles);
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2232
;2232:		vectoangles(vNor, self->s.apos.trBase);
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2233
;2233:		self->touch = charge_stick;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 charge_stick
ASGNP4
line 2234
;2234:		return;
ADDRGP4 $653
JUMPV
LABELV $654
line 2236
;2235:	}
;2236:	else if (other && other->s.number < 1022)
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $661
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1022
GEI4 $661
line 2237
;2237:	{
line 2240
;2238:		vec3_t v;
;2239:
;2240:		self->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
CNSTP4 0
ASGNP4
line 2241
;2241:		self->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
CNSTP4 0
ASGNP4
line 2242
;2242:		self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 0
ASGNI4
line 2244
;2243:
;2244:		self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 2246
;2245:
;2246:		VectorClear(self->s.apos.trDelta);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
CNSTF4 0
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
line 2247
;2247:		self->s.apos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 2249
;2248:
;2249:		G_RadiusDamage( self->r.currentOrigin, self->parent, self->splashDamage, self->splashRadius, self, MOD_DET_PACK_SPLASH );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 696
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
INDIRP4
CNSTI4 700
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
INDIRP4
ARGP4
CNSTI4 26
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 2250
;2250:		VectorCopy(trace->plane.normal, v);
ADDRLP4 16
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2251
;2251:		VectorCopy(v, self->pos2);
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 2252
;2252:		self->count = -1;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 -1
ASGNI4
line 2253
;2253:		G_PlayEffect(EFFECT_EXPLOSION_DETPACK, self->r.currentOrigin, v);
CNSTI4 6
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 2255
;2254:
;2255:		self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 2256
;2256:		self->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2257
;2257:		return;
ADDRGP4 $653
JUMPV
LABELV $661
line 2263
;2258:	}
;2259:
;2260:	//self->s.eType = ET_GENERAL;
;2261:	//FIXME: once on ground, shouldn't explode if touched by someone?
;2262:	//FIXME: if owner touches it again, pick it up?  Or if he "uses" it?
;2263:	self->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
CNSTP4 0
ASGNP4
line 2264
;2264:	self->think = DetPackBlow;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 DetPackBlow
ASGNP4
line 2265
;2265:	self->nextthink = level.time + 30000;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 2267
;2266:
;2267:	VectorClear(self->s.apos.trDelta);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 2268
;2268:	self->s.apos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 2270
;2269:
;2270:	self->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 2271
;2271:	VectorCopy( self->r.currentOrigin, self->s.origin );
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
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2272
;2272:	VectorCopy( self->r.currentOrigin, self->s.pos.trBase );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2273
;2273:	VectorClear( self->s.pos.trDelta );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 32
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 32
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 32
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
line 2275
;2274:
;2275:	VectorClear( self->s.apos.trDelta );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
CNSTF4 0
ASGNF4
ADDRLP4 40
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 40
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 40
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 44
INDIRF4
ASGNF4
line 2277
;2276:
;2277:	VectorNormalize(trace->plane.normal);
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2279
;2278:
;2279:	vectoangles(trace->plane.normal, self->s.angles);
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2280
;2280:	VectorCopy(self->s.angles, self->r.currentAngles );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 2281
;2281:	VectorCopy(self->s.angles, self->s.apos.trBase);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 2283
;2282:
;2283:	VectorCopy(trace->plane.normal, self->pos2);
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2284
;2284:	self->count = -1;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 -1
ASGNI4
line 2286
;2285:
;2286:	G_Sound(self, CHAN_VOICE, G_SoundIndex("sound/weapons/detpack/stick.wav"));
ADDRGP4 $665
ARGP4
ADDRLP4 56
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2288
;2287:		
;2288:	tent = G_TempEntity( self->r.currentOrigin, EV_MISSILE_MISS );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 74
ARGI4
ADDRLP4 60
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 60
INDIRP4
ASGNP4
line 2289
;2289:	tent->s.weapon = 0;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 0
ASGNI4
line 2290
;2290:	tent->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 2291
;2291:	tent->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 2294
;2292:
;2293:	//so that the owner can blow it up with projectiles
;2294:	self->r.svFlags |= SVF_OWNERNOTSHARED;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 2295
;2295:}
LABELV $653
endproc charge_stick 68 24
export DetPackBlow
proc DetPackBlow 16 24
line 2298
;2296:
;2297:void DetPackBlow(gentity_t *self)
;2298:{
line 2302
;2299:	vec3_t v;
;2300:
;2301:	//self->touch = NULL;
;2302:	self->pain = 0;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
CNSTP4 0
ASGNP4
line 2303
;2303:	self->die = 0;
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
CNSTP4 0
ASGNP4
line 2304
;2304:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 2306
;2305:
;2306:	G_RadiusDamage( self->r.currentOrigin, self->parent, self->splashDamage, self->splashRadius, self, MOD_DET_PACK_SPLASH );
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
CNSTI4 536
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 696
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 700
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 26
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 2307
;2307:	v[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2308
;2308:	v[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 2309
;2309:	v[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 2311
;2310:
;2311:	if (self->count == -1)
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $669
line 2312
;2312:	{
line 2313
;2313:		VectorCopy(self->pos2, v);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRB
ASGNB 12
line 2314
;2314:	}
LABELV $669
line 2316
;2315:
;2316:	G_PlayEffect(EFFECT_EXPLOSION_DETPACK, self->r.currentOrigin, v);
CNSTI4 6
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 2318
;2317:
;2318:	self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 2319
;2319:	self->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2320
;2320:}
LABELV $666
endproc DetPackBlow 16 24
export DetPackPain
proc DetPackPain 4 8
line 2323
;2321:
;2322:void DetPackPain(gentity_t *self, gentity_t *attacker, int damage)
;2323:{
line 2324
;2324:	self->think = DetPackBlow;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 DetPackBlow
ASGNP4
line 2325
;2325:	self->nextthink = level.time + Q_irand(50, 100);
CNSTI4 50
ARGI4
CNSTI4 100
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
line 2326
;2326:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 2327
;2327:}
LABELV $672
endproc DetPackPain 4 8
export DetPackDie
proc DetPackDie 4 8
line 2330
;2328:
;2329:void DetPackDie(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;2330:{
line 2331
;2331:	self->think = DetPackBlow;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 DetPackBlow
ASGNP4
line 2332
;2332:	self->nextthink = level.time + Q_irand(50, 100);
CNSTI4 50
ARGI4
CNSTI4 100
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
line 2333
;2333:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 2334
;2334:}
LABELV $674
endproc DetPackDie 4 8
export drop_charge
proc drop_charge 32 8
line 2337
;2335:
;2336:void drop_charge (gentity_t *self, vec3_t start, vec3_t dir) 
;2337:{
line 2340
;2338:	gentity_t	*bolt;
;2339:
;2340:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2342
;2341:
;2342:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 2343
;2343:	bolt->classname = "detpack";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $677
ASGNP4
line 2344
;2344:	bolt->nextthink = level.time + FRAMETIME;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 2345
;2345:	bolt->think = G_RunObject;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_RunObject
ASGNP4
line 2346
;2346:	bolt->s.eType = ET_GENERAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 2347
;2347:	bolt->s.g2radius = 100;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 100
ASGNI4
line 2348
;2348:	bolt->s.modelGhoul2 = 1;
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 2349
;2349:	bolt->s.modelindex = G_ModelIndex("models/weapons2/detpack/det_pack_proj.glm"); // w.md3");
ADDRGP4 $679
ARGP4
ADDRLP4 8
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 2352
;2350:
;2351:	//bolt->playerTeam = self->client->playerTeam;
;2352:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 2353
;2353:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 2354
;2354:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 100
ASGNI4
line 2355
;2355:	bolt->splashDamage = 200;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 200
ASGNI4
line 2356
;2356:	bolt->splashRadius = 200;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTI4 200
ASGNI4
line 2357
;2357:	bolt->methodOfDeath = MOD_DET_PACK_SPLASH;//MOD_EXPLOSIVE;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 26
ASGNI4
line 2358
;2358:	bolt->splashMethodOfDeath = MOD_DET_PACK_SPLASH;//MOD_EXPLOSIVE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 26
ASGNI4
line 2359
;2359:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 769
ASGNI4
line 2360
;2360:	bolt->s.solid = 2;
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 2361
;2361:	bolt->r.contents = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 769
ASGNI4
line 2362
;2362:	bolt->touch = charge_stick;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 charge_stick
ASGNP4
line 2364
;2363:
;2364:	bolt->physicsObject = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 2366
;2365:
;2366:	bolt->s.genericenemyindex = self->s.number+1024;
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 1024
ADDI4
ASGNI4
line 2371
;2367:	//rww - so client prediction knows we own this and won't hit it
;2368:
;2369://	VectorSet( bolt->r.mins, -3, -3, -3 );
;2370://	VectorSet( bolt->r.maxs, 3, 3, 3 );
;2371:	VectorSet( bolt->r.mins, -2, -2, -2 );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3221225472
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3221225472
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3221225472
ASGNF4
line 2372
;2372:	VectorSet( bolt->r.maxs, 2, 2, 2 );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1073741824
ASGNF4
line 2374
;2373:
;2374:	bolt->health = 1;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 1
ASGNI4
line 2375
;2375:	bolt->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 2376
;2376:	bolt->pain = DetPackPain;
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 DetPackPain
ASGNP4
line 2377
;2377:	bolt->die = DetPackDie;
ADDRLP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRGP4 DetPackDie
ASGNP4
line 2379
;2378:
;2379:	bolt->s.weapon = WP_DET_PACK;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 13
ASGNI4
line 2381
;2380:
;2381:	bolt->setTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2383
;2382:
;2383:	G_SetOrigin(bolt, start);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 2384
;2384:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 2385
;2385:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2386
;2386:	VectorScale(dir, 300, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 2387
;2387:	bolt->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2389
;2388:
;2389:	bolt->s.apos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 5
ASGNI4
line 2390
;2390:	bolt->s.apos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2391
;2391:	bolt->s.apos.trBase[YAW] = rand()%360;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 2392
;2392:	bolt->s.apos.trBase[PITCH] = rand()%360;
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 16
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 2393
;2393:	bolt->s.apos.trBase[ROLL] = rand()%360;
ADDRLP4 20
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 20
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 2395
;2394:
;2395:	if (rand()%10 < 5)
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GEI4 $683
line 2396
;2396:	{
line 2397
;2397:		bolt->s.apos.trBase[YAW] = -bolt->s.apos.trBase[YAW];
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
NEGF4
ASGNF4
line 2398
;2398:	}
LABELV $683
line 2400
;2399:
;2400:	vectoangles(dir, bolt->s.angles);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2401
;2401:	VectorCopy(bolt->s.angles, bolt->s.apos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 2402
;2402:	VectorSet(bolt->s.apos.trDelta, 300, 0, 0 );
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
CNSTF4 1133903872
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
CNSTF4 0
ASGNF4
line 2403
;2403:	bolt->s.apos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2405
;2404:
;2405:	trap_LinkEntity(bolt);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2406
;2406:}
LABELV $676
endproc drop_charge 32 8
export BlowDetpacks
proc BlowDetpacks 16 12
line 2409
;2407:
;2408:void BlowDetpacks(gentity_t *ent)
;2409:{
line 2410
;2410:	gentity_t *found = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2412
;2411:
;2412:	if ( ent->client->ps.hasDetPackPlanted )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
EQI4 $687
line 2413
;2413:	{
ADDRGP4 $690
JUMPV
LABELV $689
line 2415
;2414:		while ( (found = G_Find( found, FOFS(classname), "detpack") ) != NULL )
;2415:		{//loop through all ents and blow the crap out of them!
line 2416
;2416:			if ( found->parent == ent )
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $692
line 2417
;2417:			{
line 2418
;2418:				VectorCopy( found->r.currentOrigin, found->s.origin );
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2419
;2419:				found->think = DetPackBlow;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 DetPackBlow
ASGNP4
line 2420
;2420:				found->nextthink = level.time + 100 + random() * 200;
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
CNSTF4 1128792064
ADDRLP4 8
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2421
;2421:				G_Sound( found, CHAN_BODY, G_SoundIndex("sound/weapons/detpack/warning.wav") );
ADDRGP4 $695
ARGP4
ADDRLP4 12
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2422
;2422:			}
LABELV $692
line 2423
;2423:		}
LABELV $690
line 2414
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $677
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $689
line 2424
;2424:		ent->client->ps.hasDetPackPlanted = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 0
ASGNI4
line 2425
;2425:	}
LABELV $687
line 2426
;2426:}
LABELV $686
endproc BlowDetpacks 16 12
export CheatsOn
proc CheatsOn 0 0
line 2429
;2427:
;2428:qboolean CheatsOn(void) 
;2429:{
line 2430
;2430:	if ( !g_cheats.integer )
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $697
line 2431
;2431:	{
line 2432
;2432:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $696
JUMPV
LABELV $697
line 2434
;2433:	}
;2434:	return qtrue;
CNSTI4 1
RETI4
LABELV $696
endproc CheatsOn 0 0
lit
align 4
LABELV $701
byte 4 1023
skip 4092
export WP_DropDetPack
code
proc WP_DropDetPack 4140 20
line 2438
;2435:}
;2436:
;2437:void WP_DropDetPack( gentity_t *ent, qboolean alt_fire )
;2438:{
line 2439
;2439:	gentity_t	*found = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2440
;2440:	int			trapcount = 0;
ADDRLP4 4116
CNSTI4 0
ASGNI4
line 2441
;2441:	int			foundDetPacks[MAX_GENTITIES] = {ENTITYNUM_NONE};
ADDRLP4 8
ADDRGP4 $701
INDIRB
ASGNB 4096
line 2447
;2442:	int			trapcount_org;
;2443:	int			lowestTimeStamp;
;2444:	int			removeMe;
;2445:	int			i;
;2446:
;2447:	if ( !ent || !ent->client )
ADDRLP4 4120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4124
CNSTU4 0
ASGNU4
ADDRLP4 4120
INDIRP4
CVPU4 4
ADDRLP4 4124
INDIRU4
EQU4 $704
ADDRLP4 4120
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4124
INDIRU4
NEU4 $706
LABELV $704
line 2448
;2448:	{
line 2449
;2449:		return;
ADDRGP4 $700
JUMPV
LABELV $705
line 2455
;2450:	}
;2451:
;2452:	//limit to 10 placed at any one time
;2453:	//see how many there are now
;2454:	while ( (found = G_Find( found, FOFS(classname), "detpack" )) != NULL )
;2455:	{
line 2456
;2456:		if ( found->parent != ent )
ADDRLP4 4
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $708
line 2457
;2457:		{
line 2458
;2458:			continue;
ADDRGP4 $706
JUMPV
LABELV $708
line 2460
;2459:		}
;2460:		foundDetPacks[trapcount++] = found->s.number;
ADDRLP4 4128
ADDRLP4 4116
INDIRI4
ASGNI4
ADDRLP4 4116
ADDRLP4 4128
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4128
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRP4
INDIRI4
ASGNI4
line 2461
;2461:	}
LABELV $706
line 2454
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRGP4 $677
ARGP4
ADDRLP4 4128
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 4128
INDIRP4
ASGNP4
ADDRLP4 4128
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $705
line 2463
;2462:	//now remove first ones we find until there are only 9 left
;2463:	found = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2464
;2464:	trapcount_org = trapcount;
ADDRLP4 4108
ADDRLP4 4116
INDIRI4
ASGNI4
line 2465
;2465:	lowestTimeStamp = level.time;
ADDRLP4 4104
ADDRGP4 level+32
INDIRI4
ASGNI4
ADDRGP4 $712
JUMPV
LABELV $711
line 2467
;2466:	while ( trapcount > 9 )
;2467:	{
line 2468
;2468:		removeMe = -1;
ADDRLP4 4112
CNSTI4 -1
ASGNI4
line 2469
;2469:		for ( i = 0; i < trapcount_org; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $717
JUMPV
LABELV $714
line 2470
;2470:		{
line 2471
;2471:			if ( foundDetPacks[i] == ENTITYNUM_NONE )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $718
line 2472
;2472:			{
line 2473
;2473:				continue;
ADDRGP4 $715
JUMPV
LABELV $718
line 2475
;2474:			}
;2475:			found = &g_entities[foundDetPacks[i]];
ADDRLP4 4
CNSTI4 852
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2476
;2476:			if ( found->setTime < lowestTimeStamp )
ADDRLP4 4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRLP4 4104
INDIRI4
GEI4 $720
line 2477
;2477:			{
line 2478
;2478:				removeMe = i;
ADDRLP4 4112
ADDRLP4 0
INDIRI4
ASGNI4
line 2479
;2479:				lowestTimeStamp = found->setTime;
ADDRLP4 4104
ADDRLP4 4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ASGNI4
line 2480
;2480:			}
LABELV $720
line 2481
;2481:		}
LABELV $715
line 2469
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $717
ADDRLP4 0
INDIRI4
ADDRLP4 4108
INDIRI4
LTI4 $714
line 2482
;2482:		if ( removeMe != -1 )
ADDRLP4 4112
INDIRI4
CNSTI4 -1
EQI4 $713
line 2483
;2483:		{
line 2485
;2484:			//remove it... or blow it?
;2485:			if ( &g_entities[foundDetPacks[removeMe]] == NULL )
CNSTI4 852
ADDRLP4 4112
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
CNSTU4 0
NEU4 $724
line 2486
;2486:			{
line 2487
;2487:				break;
ADDRGP4 $713
JUMPV
LABELV $724
line 2490
;2488:			}
;2489:			else
;2490:			{
line 2491
;2491:				if (!CheatsOn())
ADDRLP4 4132
ADDRGP4 CheatsOn
CALLI4
ASGNI4
ADDRLP4 4132
INDIRI4
CNSTI4 0
NEI4 $726
line 2492
;2492:				{ //Let them have unlimited if cheats are enabled
line 2493
;2493:					G_FreeEntity( &g_entities[foundDetPacks[removeMe]] );
CNSTI4 852
ADDRLP4 4112
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 2494
;2494:				}
LABELV $726
line 2495
;2495:			}
line 2496
;2496:			foundDetPacks[removeMe] = ENTITYNUM_NONE;
ADDRLP4 4112
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTI4 1023
ASGNI4
line 2497
;2497:			trapcount--;
ADDRLP4 4116
ADDRLP4 4116
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2498
;2498:		}
line 2500
;2499:		else
;2500:		{
line 2501
;2501:			break;
LABELV $723
line 2503
;2502:		}
;2503:	}
LABELV $712
line 2466
ADDRLP4 4116
INDIRI4
CNSTI4 9
GTI4 $711
LABELV $713
line 2505
;2504:
;2505:	if ( alt_fire  )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $728
line 2506
;2506:	{
line 2507
;2507:		BlowDetpacks(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BlowDetpacks
CALLV
pop
line 2508
;2508:	}
ADDRGP4 $729
JUMPV
LABELV $728
line 2510
;2509:	else
;2510:	{
line 2511
;2511:		AngleVectors( ent->client->ps.viewangles, forward, right, up );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2513
;2512:
;2513:		CalcMuzzlePoint( ent, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 2515
;2514:
;2515:		VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2516
;2516:		VectorMA( muzzle, -4, forward, muzzle );
ADDRLP4 4132
ADDRGP4 muzzle
ASGNP4
ADDRLP4 4136
CNSTF4 3229614080
ASGNF4
ADDRLP4 4132
INDIRP4
ADDRLP4 4132
INDIRP4
INDIRF4
ADDRLP4 4136
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 muzzle+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 4136
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 muzzle+8
ADDRGP4 muzzle+8
INDIRF4
CNSTF4 3229614080
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2517
;2517:		drop_charge( ent, muzzle, forward );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 drop_charge
CALLV
pop
line 2519
;2518:
;2519:		ent->client->ps.hasDetPackPlanted = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 1
ASGNI4
line 2520
;2520:	}
LABELV $729
line 2521
;2521:}
LABELV $700
endproc WP_DropDetPack 4140 20
export WP_FireStunBaton
proc WP_FireStunBaton 1172 32
line 2528
;2522:
;2523:
;2524://---------------------------------------------------------
;2525:// FireStunBaton
;2526://---------------------------------------------------------
;2527:void WP_FireStunBaton( gentity_t *ent, qboolean alt_fire )
;2528:{
line 2534
;2529:	gentity_t	*tr_ent;
;2530:	trace_t		tr;
;2531:	vec3_t		mins, maxs, end;
;2532:	vec3_t		muzzleStun;
;2533:
;2534:	if (!ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $737
line 2535
;2535:	{
line 2536
;2536:		VectorCopy(ent->r.currentOrigin, muzzleStun);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2537
;2537:		muzzleStun[2] += 8;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 2538
;2538:	}
ADDRGP4 $738
JUMPV
LABELV $737
line 2540
;2539:	else
;2540:	{
line 2541
;2541:		VectorCopy(ent->client->ps.origin, muzzleStun);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2542
;2542:		muzzleStun[2] += ent->client->ps.viewheight-6;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 6
SUBI4
CVIF4 4
ADDF4
ASGNF4
line 2543
;2543:	}
LABELV $738
line 2545
;2544:
;2545:	muzzleStun[0] += forward[0]*20;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1101004800
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
line 2546
;2546:	muzzleStun[1] += forward[1]*20;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1101004800
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2547
;2547:	muzzleStun[2] += forward[2]*20;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1101004800
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2549
;2548:
;2549:	muzzleStun[0] += right[0]*4;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
ADDRGP4 right
INDIRF4
MULF4
ADDF4
ASGNF4
line 2550
;2550:	muzzleStun[1] += right[1]*4;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2551
;2551:	muzzleStun[2] += right[2]*4;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1082130432
ADDRGP4 right+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2553
;2552:
;2553:	VectorMA( muzzleStun, STUN_BATON_RANGE, forward, end );
ADDRLP4 1132
CNSTF4 1090519040
ASGNF4
ADDRLP4 1120
ADDRLP4 0
INDIRF4
ADDRLP4 1132
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1120+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 1132
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1120+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1090519040
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2555
;2554:
;2555:	VectorSet( maxs, 6, 6, 6 );
ADDRLP4 1136
CNSTF4 1086324736
ASGNF4
ADDRLP4 16
ADDRLP4 1136
INDIRF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 1136
INDIRF4
ASGNF4
ADDRLP4 16+8
CNSTF4 1086324736
ASGNF4
line 2556
;2556:	VectorScale( maxs, -1, mins );
ADDRLP4 1140
CNSTF4 3212836864
ASGNF4
ADDRLP4 1108
ADDRLP4 1140
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
ADDRLP4 1108+4
ADDRLP4 1140
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 1108+8
CNSTF4 3212836864
ADDRLP4 16+8
INDIRF4
MULF4
ASGNF4
line 2558
;2557:
;2558:	trap_Trace ( &tr, muzzleStun, mins, maxs, end, ent->s.number, MASK_SHOT );
ADDRLP4 28
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1108
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 1120
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2560
;2559:
;2560:	if ( tr.entityNum >= ENTITYNUM_WORLD )
ADDRLP4 28+52
INDIRI4
CNSTI4 1022
LTI4 $761
line 2561
;2561:	{
line 2562
;2562:		return;
ADDRGP4 $736
JUMPV
LABELV $761
line 2565
;2563:	}
;2564:
;2565:	tr_ent = &g_entities[tr.entityNum];
ADDRLP4 12
CNSTI4 852
ADDRLP4 28+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2567
;2566:
;2567:	if (tr_ent && tr_ent->takedamage && tr_ent->client)
ADDRLP4 1148
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 1148
INDIRU4
EQU4 $765
ADDRLP4 12
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $765
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1148
INDIRU4
EQU4 $765
line 2568
;2568:	{
line 2569
;2569:		if (tr_ent->client->ps.duelInProgress &&
ADDRLP4 1152
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1152
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $767
ADDRLP4 1152
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $767
line 2571
;2570:			tr_ent->client->ps.duelIndex != ent->s.number)
;2571:		{
line 2572
;2572:			return;
ADDRGP4 $736
JUMPV
LABELV $767
line 2575
;2573:		}
;2574:
;2575:		if (ent->client &&
ADDRLP4 1156
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $769
ADDRLP4 1156
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $769
ADDRLP4 1156
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
INDIRI4
EQI4 $769
line 2578
;2576:			ent->client->ps.duelInProgress &&
;2577:			ent->client->ps.duelIndex != tr_ent->s.number)
;2578:		{
line 2579
;2579:			return;
ADDRGP4 $736
JUMPV
LABELV $769
line 2581
;2580:		}
;2581:	}
LABELV $765
line 2583
;2582:
;2583:	if ( tr_ent && tr_ent->takedamage )
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $771
ADDRLP4 12
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $771
line 2584
;2584:	{
line 2585
;2585:		G_PlayEffect( EFFECT_STUNHIT, tr.endpos, tr.plane.normal );
CNSTI4 8
ARGI4
ADDRLP4 28+12
ARGP4
ADDRLP4 28+24
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 2588
;2586:
;2587:		// TEMP!
;2588:		G_Sound( tr_ent, CHAN_WEAPON, G_SoundIndex( va("sound/weapons/melee/punch%d", Q_irand(1, 4)) ) );
CNSTI4 1
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 1156
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRGP4 $775
ARGP4
ADDRLP4 1156
INDIRI4
ARGI4
ADDRLP4 1160
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 1164
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 1164
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2590
;2589:
;2590:		G_Damage( tr_ent, ent, ent, forward, tr.endpos, STUN_BATON_DAMAGE, (DAMAGE_NO_KNOCKBACK|DAMAGE_HALF_ABSORB), MOD_STUN_BATON );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 1168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 28+12
ARGP4
CNSTI4 20
ARGI4
CNSTI4 1028
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 2593
;2591:		//alt-fire?
;2592:
;2593:		if (tr_ent->client)
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $777
line 2594
;2594:		{ //if it's a player then use the shock effect
line 2595
;2595:			tr_ent->client->ps.electrifyTime = level.time + 700;
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 700
ADDI4
ASGNI4
line 2596
;2596:		}
LABELV $777
line 2597
;2597:	}
LABELV $771
line 2598
;2598:}
LABELV $736
endproc WP_FireStunBaton 1172 32
export SnapVectorTowards
proc SnapVectorTowards 12 0
line 2618
;2599:
;2600:
;2601:////////////////////////////////////////////////////////////////////////////
;2602:////////////////////////////////////////////////////////////////////////////
;2603:////////////////////////////////////////////////////////////////////////////
;2604:////////////////////////////////////////////////////////////////////////////
;2605:////////////////////////////////////////////////////////////////////////////
;2606:
;2607:
;2608:/*
;2609:======================
;2610:SnapVectorTowards
;2611:
;2612:Round a vector to integers for more efficient network
;2613:transmission, but make sure that it rounds towards a given point
;2614:rather than blindly truncating.  This prevents it from truncating 
;2615:into a wall.
;2616:======================
;2617:*/
;2618:void SnapVectorTowards( vec3_t v, vec3_t to ) {
line 2621
;2619:	int		i;
;2620:
;2621:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $781
line 2622
;2622:		if ( to[i] <= v[i] ) {
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
GTF4 $785
line 2623
;2623:			v[i] = (int)v[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
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
line 2624
;2624:		} else {
ADDRGP4 $786
JUMPV
LABELV $785
line 2625
;2625:			v[i] = (int)v[i] + 1;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CNSTI4 1
ADDI4
CVIF4 4
ASGNF4
line 2626
;2626:		}
LABELV $786
line 2627
;2627:	}
LABELV $782
line 2621
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $781
line 2628
;2628:}
LABELV $780
endproc SnapVectorTowards 12 0
export LogAccuracyHit
proc LogAccuracyHit 4 8
line 2639
;2629:
;2630:
;2631://======================================================================
;2632:
;2633:
;2634:/*
;2635:===============
;2636:LogAccuracyHit
;2637:===============
;2638:*/
;2639:qboolean LogAccuracyHit( gentity_t *target, gentity_t *attacker ) {
line 2640
;2640:	if( !target->takedamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
NEI4 $788
line 2641
;2641:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $787
JUMPV
LABELV $788
line 2644
;2642:	}
;2643:
;2644:	if ( target == attacker ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $790
line 2645
;2645:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $787
JUMPV
LABELV $790
line 2648
;2646:	}
;2647:
;2648:	if( !target->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $792
line 2649
;2649:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $787
JUMPV
LABELV $792
line 2652
;2650:	}
;2651:
;2652:	if( !attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $794
line 2653
;2653:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $787
JUMPV
LABELV $794
line 2656
;2654:	}
;2655:
;2656:	if( target->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $796
line 2657
;2657:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $787
JUMPV
LABELV $796
line 2660
;2658:	}
;2659:
;2660:	if ( OnSameTeam( target, attacker ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $798
line 2661
;2661:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $787
JUMPV
LABELV $798
line 2664
;2662:	}
;2663:
;2664:	return qtrue;
CNSTI4 1
RETI4
LABELV $787
endproc LogAccuracyHit 4 8
export CalcMuzzlePoint
proc CalcMuzzlePoint 64 0
line 2676
;2665:}
;2666:
;2667:
;2668:/*
;2669:===============
;2670:CalcMuzzlePoint
;2671:
;2672:set muzzle location relative to pivoting eye
;2673:===============
;2674:*/
;2675:void CalcMuzzlePoint ( gentity_t *ent, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) 
;2676:{
line 2680
;2677:	int weapontype;
;2678:	vec3_t muzzleOffPoint;
;2679:
;2680:	weapontype = ent->s.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 2681
;2681:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2683
;2682:
;2683:	VectorCopy(WP_MuzzlePoint[weapontype], muzzleOffPoint);
ADDRLP4 0
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 WP_MuzzlePoint
ADDP4
INDIRB
ASGNB 12
line 2685
;2684:
;2685:	if (ent->client->ps.usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $801
line 2686
;2686:	{
line 2687
;2687:		gentity_t *headEnt = &g_entities[ent->client->damageBoxHandle_Head];
ADDRLP4 16
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
ASGNP4
line 2689
;2688:
;2689:		VectorClear(muzzleOffPoint);
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 2690
;2690:		muzzleOffPoint[0] = 16;
ADDRLP4 0
CNSTF4 1098907648
ASGNF4
line 2691
;2691:		muzzleOffPoint[2] = 128;
ADDRLP4 0+8
CNSTF4 1124073472
ASGNF4
line 2693
;2692:
;2693:		if (headEnt && headEnt->s.number >= MAX_CLIENTS)
ADDRLP4 24
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $806
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 32
LTI4 $806
line 2694
;2694:		{
line 2695
;2695:			if (headEnt->bolt_Waist)
ADDRLP4 16
INDIRP4
CNSTI4 804
ADDP4
INDIRI4
CNSTI4 0
EQI4 $808
line 2696
;2696:			{
line 2697
;2697:				muzzleOffPoint[1] = 3;
ADDRLP4 0+4
CNSTF4 1077936128
ASGNF4
line 2698
;2698:			}
ADDRGP4 $809
JUMPV
LABELV $808
line 2700
;2699:			else
;2700:			{
line 2701
;2701:				muzzleOffPoint[1] = -4;
ADDRLP4 0+4
CNSTF4 3229614080
ASGNF4
line 2702
;2702:			}
LABELV $809
line 2703
;2703:		}
LABELV $806
line 2704
;2704:	}
LABELV $801
line 2707
;2705:
;2706:#if 1
;2707:	if (weapontype > WP_NONE && weapontype < WP_NUM_WEAPONS)
ADDRLP4 12
INDIRI4
CNSTI4 0
LEI4 $812
ADDRLP4 12
INDIRI4
CNSTI4 16
GEI4 $812
line 2708
;2708:	{	// Use the table to generate the muzzlepoint;
line 2709
;2709:		{	// Crouching.  Use the add-to-Z method to adjust vertically.
line 2710
;2710:			VectorMA(muzzlePoint, muzzleOffPoint[0], forward, muzzlePoint);
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24
CNSTI4 4
ASGNI4
ADDRLP4 28
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32
CNSTI4 8
ASGNI4
ADDRLP4 36
ADDRFP4 16
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2711
;2711:			VectorMA(muzzlePoint, muzzleOffPoint[1], right, muzzlePoint);
ADDRLP4 40
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 44
CNSTI4 4
ASGNI4
ADDRLP4 48
ADDRFP4 16
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 52
CNSTI4 8
ASGNI4
ADDRLP4 56
ADDRFP4 16
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2712
;2712:			muzzlePoint[2] += ent->client->ps.viewheight + muzzleOffPoint[2];
ADDRLP4 60
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0+8
INDIRF4
ADDF4
ADDF4
ASGNF4
line 2714
;2713:			// VectorMA(muzzlePoint, ent->client->ps.viewheight + WP_MuzzlePoint[weapontype][2], up, muzzlePoint);
;2714:		}
line 2715
;2715:	}
LABELV $812
line 2724
;2716:#else	// Test code
;2717:	muzzlePoint[2] += ent->client->ps.viewheight;//By eyes
;2718:	muzzlePoint[2] += g_debugUp.value;
;2719:	VectorMA( muzzlePoint, g_debugForward.value, forward, muzzlePoint);
;2720:	VectorMA( muzzlePoint, g_debugRight.value, right, muzzlePoint);
;2721:#endif
;2722:
;2723:	// snap to integer coordinates for more efficient network bandwidth usage
;2724:	SnapVector( muzzlePoint );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 24
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 28
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2725
;2725:}
LABELV $800
endproc CalcMuzzlePoint 64 0
export CalcMuzzlePointOrigin
proc CalcMuzzlePointOrigin 36 0
line 2734
;2726:
;2727:/*
;2728:===============
;2729:CalcMuzzlePointOrigin
;2730:
;2731:set muzzle location relative to pivoting eye
;2732:===============
;2733:*/
;2734:void CalcMuzzlePointOrigin ( gentity_t *ent, vec3_t origin, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
line 2735
;2735:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2736
;2736:	muzzlePoint[2] += ent->client->ps.viewheight;
ADDRLP4 0
ADDRFP4 20
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 0
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
line 2737
;2737:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
ADDRLP4 4
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 12
ADDRFP4 20
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 8
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRLP4 20
ADDRFP4 20
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2739
;2738:	// snap to integer coordinates for more efficient network bandwidth usage
;2739:	SnapVector( muzzlePoint );
ADDRLP4 24
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 28
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 32
ADDRFP4 20
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2740
;2740:}
LABELV $818
endproc CalcMuzzlePointOrigin 36 0
export FireWeapon
proc FireWeapon 16 20
line 2749
;2741:
;2742:
;2743:
;2744:/*
;2745:===============
;2746:FireWeapon
;2747:===============
;2748:*/
;2749:void FireWeapon( gentity_t *ent, qboolean altFire ) {
line 2750
;2750:	if (ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $820
line 2751
;2751:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 2752
;2752:	} else {
ADDRGP4 $821
JUMPV
LABELV $820
line 2753
;2753:		s_quadFactor = 1;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 2754
;2754:	}
LABELV $821
line 2757
;2755:
;2756:	// track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked
;2757:	if( ent->s.weapon != WP_SABER && ent->s.weapon != WP_STUN_BATON ) 
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $823
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $823
line 2758
;2758:	{
line 2759
;2759:		if( ent->s.weapon == WP_FLECHETTE ) {
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 9
NEI4 $825
line 2760
;2760:			ent->client->accuracy_shots += FLECHETTE_SHOTS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1840
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 2761
;2761:		} else {
ADDRGP4 $826
JUMPV
LABELV $825
line 2762
;2762:			ent->client->accuracy_shots++;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1840
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
line 2763
;2763:		}
LABELV $826
line 2764
;2764:	}
LABELV $823
line 2767
;2765:
;2766:	// set aiming directions
;2767:	if (ent->s.weapon == WP_EMPLACED_GUN)
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 14
NEI4 $827
line 2768
;2768:	{
line 2771
;2769:		vec3_t viewAngCap;
;2770:
;2771:		VectorCopy(ent->client->ps.viewangles, viewAngCap);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 2772
;2772:		if (viewAngCap[PITCH] > 40)
ADDRLP4 4
INDIRF4
CNSTF4 1109393408
LEF4 $829
line 2773
;2773:		{
line 2774
;2774:			viewAngCap[PITCH] = 40;
ADDRLP4 4
CNSTF4 1109393408
ASGNF4
line 2775
;2775:		}
LABELV $829
line 2776
;2776:		AngleVectors( viewAngCap, forward, right, up );
ADDRLP4 4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2777
;2777:	}
ADDRGP4 $828
JUMPV
LABELV $827
line 2779
;2778:	else
;2779:	{
line 2780
;2780:		AngleVectors( ent->client->ps.viewangles, forward, right, up );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2781
;2781:	}
LABELV $828
line 2783
;2782:
;2783:	if (ent->client->ps.usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $831
line 2784
;2784:	{
line 2785
;2785:		gentity_t *headEnt = &g_entities[ent->client->damageBoxHandle_Head];
ADDRLP4 4
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
ASGNP4
line 2787
;2786:
;2787:		if (headEnt && headEnt->s.number >= MAX_CLIENTS)
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $833
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
LTI4 $833
line 2788
;2788:		{
line 2789
;2789:			if (altFire)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $835
line 2790
;2790:			{
line 2791
;2791:				headEnt->bolt_Waist = 0;
ADDRLP4 4
INDIRP4
CNSTI4 804
ADDP4
CNSTI4 0
ASGNI4
line 2792
;2792:			}
ADDRGP4 $836
JUMPV
LABELV $835
line 2794
;2793:			else
;2794:			{
line 2795
;2795:				headEnt->bolt_Waist = 1;
ADDRLP4 4
INDIRP4
CNSTI4 804
ADDP4
CNSTI4 1
ASGNI4
line 2796
;2796:			}
LABELV $836
line 2797
;2797:		}
LABELV $833
line 2798
;2798:	}
LABELV $831
line 2801
;2799:
;2800://	CalcMuzzlePointOrigin ( ent, ent->client->oldOrigin, forward, right, up, muzzle );
;2801:	CalcMuzzlePoint ( ent, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 2803
;2802:
;2803:	if (ent->client->ps.usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $837
line 2804
;2804:	{
line 2805
;2805:		WP_FireBryarPistol( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 WP_FireBryarPistol
CALLV
pop
line 2806
;2806:		return;
ADDRGP4 $819
JUMPV
LABELV $837
line 2810
;2807:	}
;2808:
;2809:	// fire the specific weapon
;2810:	switch( ent->s.weapon ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $840
ADDRLP4 4
INDIRI4
CNSTI4 14
GTI4 $840
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $856-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $856
address $842
address $840
address $844
address $845
address $846
address $847
address $848
address $849
address $850
address $851
address $852
address $853
address $854
address $855
code
LABELV $842
line 2812
;2811:	case WP_STUN_BATON:
;2812:		WP_FireStunBaton( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireStunBaton
CALLV
pop
line 2813
;2813:		break;
ADDRGP4 $840
JUMPV
line 2816
;2814:
;2815:	case WP_SABER:
;2816:		break;
LABELV $844
line 2819
;2817:
;2818:	case WP_BRYAR_PISTOL:
;2819:		WP_FireBryarPistol( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBryarPistol
CALLV
pop
line 2820
;2820:		break;
ADDRGP4 $840
JUMPV
LABELV $845
line 2823
;2821:
;2822:	case WP_BLASTER:
;2823:		WP_FireBlaster( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBlaster
CALLV
pop
line 2824
;2824:		break;
ADDRGP4 $840
JUMPV
LABELV $846
line 2827
;2825:
;2826:	case WP_DISRUPTOR:
;2827:		WP_FireDisruptor( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireDisruptor
CALLV
pop
line 2828
;2828:		break;
ADDRGP4 $840
JUMPV
LABELV $847
line 2831
;2829:
;2830:	case WP_BOWCASTER:
;2831:		WP_FireBowcaster( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBowcaster
CALLV
pop
line 2832
;2832:		break;
ADDRGP4 $840
JUMPV
LABELV $848
line 2835
;2833:
;2834:	case WP_REPEATER:
;2835:		WP_FireRepeater( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireRepeater
CALLV
pop
line 2836
;2836:		break;
ADDRGP4 $840
JUMPV
LABELV $849
line 2839
;2837:
;2838:	case WP_DEMP2:
;2839:		WP_FireDEMP2( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireDEMP2
CALLV
pop
line 2840
;2840:		break;
ADDRGP4 $840
JUMPV
LABELV $850
line 2843
;2841:
;2842:	case WP_FLECHETTE:
;2843:		WP_FireFlechette( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireFlechette
CALLV
pop
line 2844
;2844:		break;
ADDRGP4 $840
JUMPV
LABELV $851
line 2847
;2845:
;2846:	case WP_ROCKET_LAUNCHER:
;2847:		WP_FireRocket( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireRocket
CALLV
pop
line 2848
;2848:		break;
ADDRGP4 $840
JUMPV
LABELV $852
line 2851
;2849:
;2850:	case WP_THERMAL:
;2851:		WP_FireThermalDetonator( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireThermalDetonator
CALLP4
pop
line 2852
;2852:		break;
ADDRGP4 $840
JUMPV
LABELV $853
line 2855
;2853:
;2854:	case WP_TRIP_MINE:
;2855:		WP_PlaceLaserTrap( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_PlaceLaserTrap
CALLV
pop
line 2856
;2856:		break;
ADDRGP4 $840
JUMPV
LABELV $854
line 2859
;2857:
;2858:	case WP_DET_PACK:
;2859:		WP_DropDetPack( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_DropDetPack
CALLV
pop
line 2860
;2860:		break;
ADDRGP4 $840
JUMPV
LABELV $855
line 2863
;2861:
;2862:	case WP_EMPLACED_GUN:
;2863:		WP_FireEmplaced( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireEmplaced
CALLV
pop
line 2864
;2864:		break;
line 2867
;2865:	default:
;2866:// FIXME		G_Error( "Bad ent->s.weapon" );
;2867:		break;
LABELV $840
line 2870
;2868:	}
;2869:
;2870:	G_LogWeaponFire(ent->s.number, ent->s.weapon);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_LogWeaponFire
CALLV
pop
line 2871
;2871:}
LABELV $819
endproc FireWeapon 16 20
export AnimEntCalcMuzzlePoint
proc AnimEntCalcMuzzlePoint 64 0
line 2874
;2872:
;2873:void AnimEntCalcMuzzlePoint ( gentity_t *ent, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) 
;2874:{
line 2878
;2875:	int weapontype;
;2876:	vec3_t muzzleOffPoint;
;2877:
;2878:	weapontype = ent->s.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 2879
;2879:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2881
;2880:
;2881:	VectorCopy(WP_MuzzlePoint[weapontype], muzzleOffPoint);
ADDRLP4 0
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 WP_MuzzlePoint
ADDP4
INDIRB
ASGNB 12
line 2883
;2882:
;2883:	if (weapontype > WP_NONE && weapontype < WP_NUM_WEAPONS)
ADDRLP4 12
INDIRI4
CNSTI4 0
LEI4 $859
ADDRLP4 12
INDIRI4
CNSTI4 16
GEI4 $859
line 2884
;2884:	{	// Use the table to generate the muzzlepoint;
line 2885
;2885:		{	// Crouching.  Use the add-to-Z method to adjust vertically.
line 2886
;2886:			VectorMA(muzzlePoint, muzzleOffPoint[0], forward, muzzlePoint);
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24
CNSTI4 4
ASGNI4
ADDRLP4 28
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32
CNSTI4 8
ASGNI4
ADDRLP4 36
ADDRFP4 16
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2887
;2887:			VectorMA(muzzlePoint, muzzleOffPoint[1], right, muzzlePoint);
ADDRLP4 40
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 44
CNSTI4 4
ASGNI4
ADDRLP4 48
ADDRFP4 16
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 52
CNSTI4 8
ASGNI4
ADDRLP4 56
ADDRFP4 16
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2888
;2888:			muzzlePoint[2] += 24 + muzzleOffPoint[2];
ADDRLP4 60
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 0+8
INDIRF4
CNSTF4 1103101952
ADDF4
ADDF4
ASGNF4
line 2889
;2889:		}
line 2890
;2890:	}
LABELV $859
line 2893
;2891:
;2892:	// snap to integer coordinates for more efficient network bandwidth usage
;2893:	SnapVector( muzzlePoint );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 24
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 28
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2894
;2894:}
LABELV $858
endproc AnimEntCalcMuzzlePoint 64 0
export AnimEntFireWeapon
proc AnimEntFireWeapon 20 20
line 2897
;2895:
;2896:void AnimEntFireWeapon( gentity_t *ent, qboolean altFire )
;2897:{
line 2899
;2898:	vec3_t modifiedAngles;
;2899:	VectorCopy(ent->s.apos.trBase, modifiedAngles);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 2901
;2900://	modifiedAngles[PITCH] = -modifiedAngles[PITCH];
;2901:	if (modifiedAngles[PITCH] < -180)
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
GEF4 $866
line 2902
;2902:	{
line 2903
;2903:		modifiedAngles[PITCH] += 90;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 2904
;2904:	}
LABELV $866
line 2905
;2905:	AngleVectors( modifiedAngles, forward, right, up );
ADDRLP4 0
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2907
;2906:
;2907:	AnimEntCalcMuzzlePoint ( ent, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 AnimEntCalcMuzzlePoint
CALLV
pop
line 2913
;2908:
;2909:	//rww - NOTE: I have only tested the bryar, blaster, and disruptor for weapon firing.
;2910:	//Other routines will likely have a client pointer reference in them and cause a crash.
;2911:
;2912:	// fire the specific weapon
;2913:	switch( ent->s.weapon )
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
LTI4 $869
ADDRLP4 12
INDIRI4
CNSTI4 14
GTI4 $869
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $885-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $885
address $871
address $869
address $873
address $874
address $875
address $876
address $877
address $878
address $879
address $880
address $881
address $882
address $883
address $884
code
line 2914
;2914:	{
LABELV $871
line 2916
;2915:	case WP_STUN_BATON:
;2916:		WP_FireStunBaton( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireStunBaton
CALLV
pop
line 2917
;2917:		break;
ADDRGP4 $869
JUMPV
line 2920
;2918:
;2919:	case WP_SABER:
;2920:		break;
LABELV $873
line 2923
;2921:
;2922:	case WP_BRYAR_PISTOL:
;2923:		WP_FireBryarPistol( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBryarPistol
CALLV
pop
line 2924
;2924:		break;
ADDRGP4 $869
JUMPV
LABELV $874
line 2927
;2925:
;2926:	case WP_BLASTER:
;2927:		WP_FireBlaster( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBlaster
CALLV
pop
line 2928
;2928:		break;
ADDRGP4 $869
JUMPV
LABELV $875
line 2931
;2929:
;2930:	case WP_DISRUPTOR:
;2931:		WP_FireDisruptor( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireDisruptor
CALLV
pop
line 2932
;2932:		break;
ADDRGP4 $869
JUMPV
LABELV $876
line 2935
;2933:
;2934:	case WP_BOWCASTER:
;2935:		WP_FireBowcaster( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBowcaster
CALLV
pop
line 2936
;2936:		break;
ADDRGP4 $869
JUMPV
LABELV $877
line 2939
;2937:
;2938:	case WP_REPEATER:
;2939:		WP_FireRepeater( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireRepeater
CALLV
pop
line 2940
;2940:		break;
ADDRGP4 $869
JUMPV
LABELV $878
line 2943
;2941:
;2942:	case WP_DEMP2:
;2943:		WP_FireDEMP2( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireDEMP2
CALLV
pop
line 2944
;2944:		break;
ADDRGP4 $869
JUMPV
LABELV $879
line 2947
;2945:
;2946:	case WP_FLECHETTE:
;2947:		WP_FireFlechette( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireFlechette
CALLV
pop
line 2948
;2948:		break;
ADDRGP4 $869
JUMPV
LABELV $880
line 2951
;2949:
;2950:	case WP_ROCKET_LAUNCHER:
;2951:		WP_FireRocket( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireRocket
CALLV
pop
line 2952
;2952:		break;
ADDRGP4 $869
JUMPV
LABELV $881
line 2955
;2953:
;2954:	case WP_THERMAL:
;2955:		WP_FireThermalDetonator( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireThermalDetonator
CALLP4
pop
line 2956
;2956:		break;
ADDRGP4 $869
JUMPV
LABELV $882
line 2959
;2957:
;2958:	case WP_TRIP_MINE:
;2959:		WP_PlaceLaserTrap( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_PlaceLaserTrap
CALLV
pop
line 2960
;2960:		break;
ADDRGP4 $869
JUMPV
LABELV $883
line 2963
;2961:
;2962:	case WP_DET_PACK:
;2963:		WP_DropDetPack( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_DropDetPack
CALLV
pop
line 2964
;2964:		break;
ADDRGP4 $869
JUMPV
LABELV $884
line 2967
;2965:
;2966:	case WP_EMPLACED_GUN:
;2967:		WP_FireEmplaced( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireEmplaced
CALLV
pop
line 2968
;2968:		break;
line 2970
;2969:	default:
;2970:		break;
LABELV $869
line 2972
;2971:	}
;2972:}
LABELV $865
endproc AnimEntFireWeapon 20 20
proc WP_FireEmplaced 64 20
line 2977
;2973:
;2974://---------------------------------------------------------
;2975:static void WP_FireEmplaced( gentity_t *ent, qboolean altFire )
;2976://---------------------------------------------------------
;2977:{
line 2983
;2978:	vec3_t	dir, angs, gunpoint; //g2r , gunaxis;
;2979:	vec3_t	right;
;2980:	gentity_t *gun;
;2981://	mdxaBone_t matrix;
;2982:
;2983:	if (!ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $888
line 2984
;2984:	{
line 2985
;2985:		return;
ADDRGP4 $887
JUMPV
LABELV $888
line 2988
;2986:	}
;2987:
;2988:	if (!ent->client->ps.emplacedIndex)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
CNSTI4 0
NEI4 $890
line 2989
;2989:	{
line 2990
;2990:		return;
ADDRGP4 $887
JUMPV
LABELV $890
line 2993
;2991:	}
;2992:
;2993:	gun = &g_entities[ent->client->ps.emplacedIndex];
ADDRLP4 0
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2995
;2994:
;2995:	if (!gun)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $892
line 2996
;2996:	{
line 2997
;2997:		return;
ADDRGP4 $887
JUMPV
LABELV $892
line 3000
;2998:	}
;2999:
;3000:	VectorCopy(/*ent->client->ps.origin*/gun->s.origin, gunpoint);
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 3001
;3001:	gunpoint[2] += 46;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1110966272
ADDF4
ASGNF4
line 3003
;3002:
;3003:	AngleVectors(ent->client->ps.viewangles, NULL, right, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 52
CNSTP4 0
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3005
;3004:
;3005:	if (gun->bolt_Waist)
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRI4
CNSTI4 0
EQI4 $895
line 3006
;3006:	{
line 3007
;3007:		gunpoint[0] += right[0]*10;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1092616192
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
line 3008
;3008:		gunpoint[1] += right[1]*10;
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
CNSTF4 1092616192
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3009
;3009:		gunpoint[2] += right[2]*10;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1092616192
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3011
;3010:
;3011:		gun->bolt_Waist = 0;
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
CNSTI4 0
ASGNI4
line 3012
;3012:		G_AddEvent(gun, EV_FIRE_WEAPON, 0);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 24
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 3013
;3013:	}
ADDRGP4 $896
JUMPV
LABELV $895
line 3015
;3014:	else
;3015:	{
line 3016
;3016:		gunpoint[0] -= right[0]*10;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1092616192
ADDRLP4 16
INDIRF4
MULF4
SUBF4
ASGNF4
line 3017
;3017:		gunpoint[1] -= right[1]*10;
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
CNSTF4 1092616192
ADDRLP4 16+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 3018
;3018:		gunpoint[2] -= right[2]*10;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1092616192
ADDRLP4 16+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 3019
;3019:		gun->bolt_Waist = 1;
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
CNSTI4 1
ASGNI4
line 3020
;3020:		G_AddEvent(gun, EV_FIRE_WEAPON, 1);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 24
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 3021
;3021:	}
LABELV $896
line 3023
;3022:
;3023:	vectoangles( forward, angs );
ADDRGP4 forward
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3025
;3024:
;3025:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $905
line 3026
;3026:	{
line 3028
;3027:		// add some slop to the alt-fire direction
;3028:		angs[PITCH] += crandom() * BLASTER_SPREAD;
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 28
INDIRF4
CNSTF4 1070386381
CNSTF4 1073741824
ADDRLP4 56
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 3029
;3029:		angs[YAW]	+= crandom() * BLASTER_SPREAD;
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28+4
ADDRLP4 28+4
INDIRF4
CNSTF4 1070386381
CNSTF4 1073741824
ADDRLP4 60
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 3030
;3030:	}
LABELV $905
line 3032
;3031:
;3032:	AngleVectors( angs, dir, NULL, NULL );
ADDRLP4 28
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 56
CNSTP4 0
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3036
;3033:
;3034:	// FIXME: if temp_org does not have clear trace to inside the bbox, don't shoot!
;3035:	//WP_FireEmplacedMissile( ent, gunpoint, dir, altFire, gun );
;3036:	WP_FireEmplacedMissile( gun, gunpoint, dir, altFire, ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 40
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_FireEmplacedMissile
CALLV
pop
line 3038
;3037:	//WP_FireTurretMissile(gun, gunpoint, dir, altFire, 15, 2000, MOD_BLASTER, ent);
;3038:}
LABELV $887
endproc WP_FireEmplaced 64 20
export emplaced_gun_use
proc emplaced_gun_use 108 16
line 3051
;3039:
;3040:#define EMPLACED_CANRESPAWN 1
;3041:
;3042://----------------------------------------------------------
;3043:
;3044:/*QUAKED emplaced_gun (0 0 1) (-30 -20 8) (30 20 60) CANRESPAWN
;3045:
;3046: count - if CANRESPAWN spawnflag, decides how long it is before gun respawns (in ms)
;3047:*/
;3048: 
;3049://----------------------------------------------------------
;3050:void emplaced_gun_use( gentity_t *self, gentity_t *other, trace_t *trace )
;3051:{
line 3055
;3052:	vec3_t fwd1, fwd2;
;3053:	float dot;
;3054:	int oldWeapon;
;3055:	gentity_t *activator = other;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
line 3056
;3056:	float zoffset = 50;
ADDRLP4 64
CNSTF4 1112014848
ASGNF4
line 3059
;3057:	vec3_t anglesToOwner;
;3058:	vec3_t vLen;
;3059:	float ownLen = 0;
ADDRLP4 56
CNSTF4 0
ASGNF4
line 3061
;3060:
;3061:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $909
line 3062
;3062:	{
line 3064
;3063:		// can't use a dead gun.
;3064:		return;
ADDRGP4 $908
JUMPV
LABELV $909
line 3067
;3065:	}
;3066:
;3067:	if (self->activator)
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $911
line 3068
;3068:	{
line 3069
;3069:		return;
ADDRGP4 $908
JUMPV
LABELV $911
line 3072
;3070:	}
;3071:
;3072:	if (!activator->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $913
line 3073
;3073:	{
line 3074
;3074:		return;
ADDRGP4 $908
JUMPV
LABELV $913
line 3077
;3075:	}
;3076:
;3077:	if (activator->client->ps.emplacedTime > level.time)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 600
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $915
line 3078
;3078:	{
line 3079
;3079:		return;
ADDRGP4 $908
JUMPV
LABELV $915
line 3082
;3080:	}
;3081:
;3082:	if (activator->client->ps.weaponTime > 0)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $918
line 3083
;3083:	{
line 3084
;3084:		return;
ADDRGP4 $908
JUMPV
LABELV $918
line 3087
;3085:	}
;3086:
;3087:	if (activator->client->ps.origin[2] > self->s.origin[2]+zoffset-8)
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
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 64
INDIRF4
ADDF4
CNSTF4 1090519040
SUBF4
LEF4 $920
line 3088
;3088:	{
line 3089
;3089:		return;
ADDRGP4 $908
JUMPV
LABELV $920
line 3092
;3090:	} //can't use it from the top
;3091:
;3092:	if (activator->client->ps.pm_flags & PMF_DUCKED)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $922
line 3093
;3093:	{
line 3094
;3094:		return;
ADDRGP4 $908
JUMPV
LABELV $922
line 3097
;3095:	}
;3096:
;3097:	if (activator->client->ps.isJediMaster)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $924
line 3098
;3098:	{ //;O
line 3099
;3099:		return;
ADDRGP4 $908
JUMPV
LABELV $924
line 3102
;3100:	}
;3101:
;3102:	VectorSubtract(self->s.origin, activator->client->ps.origin, vLen);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 44
ADDRLP4 68
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44+4
ADDRLP4 68
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3103
;3103:	ownLen = VectorLength(vLen);
ADDRLP4 44
ARGP4
ADDRLP4 76
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 76
INDIRF4
ASGNF4
line 3105
;3104:
;3105:	if (ownLen > 64)
ADDRLP4 56
INDIRF4
CNSTF4 1115684864
LEF4 $928
line 3106
;3106:	{
line 3107
;3107:		return;
ADDRGP4 $908
JUMPV
LABELV $928
line 3111
;3108:	}
;3109:
;3110:	// Let's get some direction vectors for the users
;3111:	AngleVectors( activator->client->ps.viewangles, fwd1, NULL, NULL );
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 80
CNSTP4 0
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3114
;3112:
;3113:	// Get the guns direction vector
;3114:	AngleVectors( self->pos1, fwd2, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 84
CNSTP4 0
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3116
;3115:
;3116:	dot = DotProduct( fwd1, fwd2 );
ADDRLP4 40
ADDRLP4 4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3119
;3117:
;3118:	// Must be reasonably facing the way the gun points ( 110 degrees or so ), otherwise we don't allow to use it.
;3119:	if ( dot < -0.2f )
ADDRLP4 40
INDIRF4
CNSTF4 3192704205
GEF4 $934
line 3120
;3120:	{
line 3121
;3121:		return;
ADDRGP4 $908
JUMPV
LABELV $934
line 3124
;3122:	}
;3123:
;3124:	VectorSubtract(self->s.origin, activator->client->ps.origin, fwd1);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 88
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 88
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3125
;3125:	VectorNormalize(fwd1);
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3127
;3126:
;3127:	dot = DotProduct( fwd1, fwd2 );
ADDRLP4 40
ADDRLP4 4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3130
;3128:
;3129:	// Must be reasonably facing the way the gun points ( 110 degrees or so ), otherwise we don't allow to use it.
;3130:	if ( dot < /*-0.2f*/0.6f/*0.8f*/ )
ADDRLP4 40
INDIRF4
CNSTF4 1058642330
GEF4 $942
line 3131
;3131:	{
line 3132
;3132:		return;
ADDRGP4 $908
JUMPV
LABELV $942
line 3135
;3133:	}
;3134:
;3135:	self->boltpoint1 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 1
ASGNI4
line 3140
;3136:
;3137:	// don't allow using it again for half a second
;3138://	if ( activator->s.number == 0 && self->delay + 500 < level.time )
;3139://	{
;3140:		oldWeapon = activator->s.weapon;
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 3143
;3141:
;3142:		// swap the users weapon with the emplaced gun and add the ammo the gun has to the player
;3143:		activator->client->ps.weapon = self->s.weapon;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 3144
;3144:		activator->client->ps.weaponstate = WEAPON_READY;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 3145
;3145:		activator->client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_EMPLACED_GUN );
ADDRLP4 96
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 3149
;3146:
;3147:		//SnapVector(self->s.origin);
;3148:
;3149:		VectorCopy(activator->client->ps.origin, self->s.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3151
;3150:
;3151:		activator->client->ps.emplacedIndex = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 596
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 3153
;3152:
;3153:		self->s.emplacedOwner = activator->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 3154
;3154:		self->s.activeForcePass = NUM_FORCE_POWERS+1;
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTI4 19
ASGNI4
line 3157
;3155:
;3156:		// the gun will track which weapon we used to have
;3157:		self->s.weapon = oldWeapon;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRLP4 60
INDIRI4
ASGNI4
line 3161
;3158:
;3159:		// Lock the player
;3160://		activator->client->ps.eFlags |= EF_LOCKED_TO_WEAPON;
;3161:		activator->r.ownerNum = self->s.number; // kind of dumb, but when we are locked to the weapon, we are owned by it.
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 3162
;3162:		self->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 3187
;3163://		self->delay = level.time; // can't disconnect from the thing for half a second
;3164:
;3165:		// Let the client know that we want to start our emplaced camera clamping
;3166:		// FIXME:  if you are in the gun and you switch/restart maps, emplacedClamp will still be 1 and since
;3167:		//	you can't change it from the console, you are stuck with really bad viewangles
;3168://		char	temp[32];
;3169://		gi.cvar_set("cl_emplacedClamp", "1");
;3170://		sprintf( temp, "%f", self->pos1[0] );
;3171://		gi.cvar_set("cl_emplacedPitch", temp );
;3172://		sprintf( temp, "%f", self->pos1[1] );
;3173://		gi.cvar_set("cl_emplacedYaw", temp );
;3174:
;3175:		// Let the gun be considered an enemy
;3176://		self->svFlags |= SVF_NONNPC_ENEMY;
;3177:
;3178:		// move the player to the center of the gun and make player not solid
;3179://		activator->contents = 0;
;3180://		VectorCopy( self->currentOrigin, activator->client->ps.origin );
;3181:
;3182:		// FIXME: trying to force the gun to look forward, but it seems to pick up the players viewangles....and
;3183:		//	since you usually go up to the side of the gun to use it, you end up starting with a really annoying
;3184:		//	set of viewangles.
;3185:		//G_SetAngles( activator, self->s.angles );
;3186:
;3187:		VectorSubtract(self->r.currentOrigin, activator->client->ps.origin, anglesToOwner);
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 28
ADDRLP4 100
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 104
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 100
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 104
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
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3188
;3188:		vectoangles(anglesToOwner, anglesToOwner);
ADDRLP4 28
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3198
;3189:
;3190:		//SetClientViewAngle(activator, /*self->s.angles*/anglesToOwner);
;3191:
;3192://		VectorCopy(activator->s.angles, self->pos1);
;3193:
;3194:		// Overriding these may be a bad thing....
;3195://		gi.cvar_set("cg_thirdPersonRange", "20");
;3196://		gi.cvar_set("cg_thirdPersonVertOffset", "35");
;3197://	}
;3198:}
LABELV $908
endproc emplaced_gun_use 108 16
export emplaced_gun_realuse
proc emplaced_gun_realuse 0 12
line 3201
;3199:
;3200:void emplaced_gun_realuse( gentity_t *self, gentity_t *other, gentity_t *activator )
;3201:{
line 3202
;3202:	emplaced_gun_use(self, other, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 emplaced_gun_use
CALLV
pop
line 3203
;3203:}
LABELV $946
endproc emplaced_gun_realuse 0 12
export emplaced_gun_pain
proc emplaced_gun_pain 0 0
line 3207
;3204:
;3205://----------------------------------------------------------
;3206:void emplaced_gun_pain( gentity_t *self, gentity_t *attacker, int damage )
;3207:{
line 3208
;3208:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $948
line 3209
;3209:	{
line 3211
;3210:		// play pain effect?
;3211:	}
LABELV $948
line 3213
;3212:	else
;3213:	{
line 3221
;3214://		if ( self->paintarget )
;3215://		{
;3216://			G_UseTargets2( self, self->activator, self->paintarget );
;3217://		}
;3218:
;3219:		//Don't do script if dead
;3220://		G_ActivateBehavior( self, BSET_PAIN );
;3221:	}
LABELV $949
line 3222
;3222:}
LABELV $947
endproc emplaced_gun_pain 0 0
export emplaced_gun_update
proc emplaced_gun_update 104 24
line 3228
;3223:
;3224:#define EMPLACED_GUN_HEALTH 800
;3225:
;3226://----------------------------------------------------------
;3227:void emplaced_gun_update(gentity_t *self)
;3228:{
line 3231
;3229:	vec3_t	smokeOrg, puffAngle;
;3230:	int oldWeap;
;3231:	float ownLen = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 3233
;3232:
;3233:	if (self->health < 1 && !self->bolt_Head)
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $951
ADDRLP4 32
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 0
NEI4 $951
line 3234
;3234:	{
line 3235
;3235:		if (self->spawnflags & EMPLACED_CANRESPAWN)
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $952
line 3236
;3236:		{
line 3237
;3237:			self->bolt_Head = level.time + 4000 + self->count;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 4000
ADDI4
ADDRLP4 36
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ADDI4
ASGNI4
line 3238
;3238:		}
line 3239
;3239:	}
ADDRGP4 $952
JUMPV
LABELV $951
line 3240
;3240:	else if (self->health < 1 && self->bolt_Head < level.time)
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $956
ADDRLP4 36
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $956
line 3241
;3241:	{
line 3242
;3242:		self->s.time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 0
ASGNI4
line 3243
;3243:		self->boltpoint4 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 0
ASGNI4
line 3244
;3244:		self->boltpoint3 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 0
ASGNI4
line 3245
;3245:		self->health = EMPLACED_GUN_HEALTH*0.4;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 320
ASGNI4
line 3246
;3246:	}
LABELV $956
LABELV $952
line 3248
;3247:
;3248:	if (self->boltpoint4 && self->boltpoint4 < 2 && self->s.time < level.time)
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $959
ADDRLP4 44
INDIRI4
CNSTI4 2
GEI4 $959
ADDRLP4 40
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $959
line 3249
;3249:	{
line 3252
;3250:		vec3_t explOrg;
;3251:
;3252:		VectorSet( puffAngle, 0, 0, 1 );
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 0
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 3254
;3253:
;3254:		VectorCopy(self->r.currentOrigin, explOrg);
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 3255
;3255:		explOrg[2] += 16;
ADDRLP4 48+8
ADDRLP4 48+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 3258
;3256:
;3257:		//G_PlayEffect(EFFECT_EXPLOSION, explOrg, /*self->r.currentAngles*/puffAngle);
;3258:		G_PlayEffect(EFFECT_EXPLOSION_DETPACK, explOrg, /*self->r.currentAngles*/puffAngle);
CNSTI4 6
ARGI4
ADDRLP4 48
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 3260
;3259:
;3260:		self->boltpoint3 = level.time + Q_irand(2500, 3500);
CNSTI4 2500
ARGI4
CNSTI4 3500
ARGI4
ADDRLP4 64
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 64
INDIRI4
ADDI4
ASGNI4
line 3262
;3261:
;3262:		G_RadiusDamage(self->r.currentOrigin, self, self->splashDamage, self->splashRadius, self, MOD_UNKNOWN);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 696
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 68
INDIRP4
CNSTI4 700
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 3264
;3263:
;3264:		self->s.time = -1;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 -1
ASGNI4
line 3266
;3265:
;3266:		self->boltpoint4 = 2;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 2
ASGNI4
line 3267
;3267:	}
LABELV $959
line 3269
;3268:
;3269:	if (self->boltpoint3 > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $966
line 3270
;3270:	{
line 3271
;3271:		if (self->boltpoint2 < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $969
line 3272
;3272:		{
line 3273
;3273:			VectorSet( puffAngle, 0, 0, 1 );
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 0
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 3274
;3274:			VectorCopy(self->r.currentOrigin, smokeOrg);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 3276
;3275:
;3276:			smokeOrg[2] += 60;
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 3279
;3277:
;3278:			//What.. was I thinking?
;3279:			G_PlayEffect(EFFECT_SMOKE, smokeOrg, puffAngle);
CNSTI4 1
ARGI4
ADDRLP4 20
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 3281
;3280:
;3281:			self->boltpoint2 = level.time + Q_irand(250, 400);
CNSTI4 250
ARGI4
CNSTI4 400
ARGI4
ADDRLP4 52
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 52
INDIRI4
ADDI4
ASGNI4
line 3285
;3282:			//This would be much better if we checked a value on the entity on the client
;3283:			//and then spawned smoke there instead of sending over a bunch of events. But
;3284:			//this will do for now, an event every 250-400ms isn't too bad.
;3285:		}
LABELV $969
line 3286
;3286:	}
LABELV $966
line 3288
;3287:
;3288:	if (self->activator && self->activator->client && self->activator->inuse)
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 732
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
EQU4 $976
ADDRLP4 48
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
EQU4 $976
ADDRLP4 48
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $976
line 3289
;3289:	{
line 3291
;3290:		vec3_t vLen;
;3291:		VectorSubtract(self->s.origin, self->activator->client->ps.origin, vLen);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
CNSTI4 732
ADDP4
ASGNP4
ADDRLP4 76
CNSTI4 408
ASGNI4
ADDRLP4 56
ADDRLP4 68
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 68
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56+8
ADDRLP4 80
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3292
;3292:		ownLen = VectorLength(vLen);
ADDRLP4 56
ARGP4
ADDRLP4 84
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 84
INDIRF4
ASGNF4
line 3294
;3293:
;3294:		if (!(self->activator->client->pers.cmd.buttons & BUTTON_USE) && self->boltpoint1)
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRLP4 88
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 92
INDIRI4
NEI4 $980
ADDRLP4 88
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $980
line 3295
;3295:		{
line 3296
;3296:			self->boltpoint1 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 0
ASGNI4
line 3297
;3297:		}
LABELV $980
line 3299
;3298:
;3299:		if ((self->activator->client->pers.cmd.buttons & BUTTON_USE) && !self->boltpoint1)
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRLP4 96
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 100
INDIRI4
EQI4 $982
ADDRLP4 96
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
ADDRLP4 100
INDIRI4
NEI4 $982
line 3300
;3300:		{
line 3301
;3301:			self->activator->client->ps.emplacedIndex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 596
ADDP4
CNSTI4 0
ASGNI4
line 3302
;3302:			self->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 3303
;3303:			return;
ADDRGP4 $950
JUMPV
LABELV $982
line 3305
;3304:		}
;3305:	}
LABELV $976
line 3307
;3306:
;3307:	if ((self->activator && self->activator->client) &&
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
ASGNP4
ADDRLP4 64
CNSTU4 0
ASGNU4
ADDRLP4 60
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
EQU4 $985
ADDRLP4 68
ADDRLP4 60
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
EQU4 $985
ADDRLP4 72
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $989
ADDRLP4 68
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ADDRLP4 56
INDIRP4
INDIRI4
NEI4 $989
ADDRLP4 56
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
NEI4 $989
ADDRLP4 12
INDIRF4
CNSTF4 1115684864
LEF4 $985
LABELV $989
line 3309
;3308:		(!self->activator->inuse || self->activator->client->ps.emplacedIndex != self->s.number ||	self->boltpoint4 || ownLen > 64))
;3309:	{
line 3310
;3310:		if (self->activator->client->ps.stats[STAT_WEAPONS] & ( 1 << WP_EMPLACED_GUN ))
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $990
line 3311
;3311:		{
line 3312
;3312:			self->activator->client->ps.stats[STAT_WEAPONS] -= ( 1 << WP_EMPLACED_GUN );
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 16384
SUBI4
ASGNI4
line 3313
;3313:		}
LABELV $990
line 3315
;3314:		//VectorCopy(self->s.origin2, self->activator->client->ps.origin);
;3315:		oldWeap = self->activator->client->ps.weapon;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 3316
;3316:		self->activator->client->ps.weapon = self->s.weapon;
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 3317
;3317:		self->s.weapon = oldWeap;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 3318
;3318:		self->activator->r.ownerNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 396
ADDP4
CNSTI4 1023
ASGNI4
line 3319
;3319:		self->activator->client->ps.emplacedTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 600
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 3320
;3320:		self->activator->client->ps.emplacedIndex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 596
ADDP4
CNSTI4 0
ASGNI4
line 3321
;3321:		self->activator = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTP4 0
ASGNP4
line 3323
;3322:
;3323:		self->s.activeForcePass = 0;
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTI4 0
ASGNI4
line 3324
;3324:	}
ADDRGP4 $986
JUMPV
LABELV $985
line 3325
;3325:	else if (self->activator && self->activator->client)
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80
CNSTU4 0
ASGNU4
ADDRLP4 76
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $993
ADDRLP4 76
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $993
line 3326
;3326:	{
line 3327
;3327:		self->activator->client->ps.weapon = WP_EMPLACED_GUN;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 14
ASGNI4
line 3328
;3328:		self->activator->client->ps.weaponstate = WEAPON_READY;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 3329
;3329:	}
LABELV $993
LABELV $986
line 3330
;3330:	self->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 3331
;3331:}
LABELV $950
endproc emplaced_gun_update 104 24
export emplaced_gun_die
proc emplaced_gun_die 0 0
line 3335
;3332:
;3333://----------------------------------------------------------
;3334:void emplaced_gun_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod )
;3335:{
line 3336
;3336:	if (self->boltpoint4)
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
CNSTI4 0
EQI4 $997
line 3337
;3337:	{
line 3338
;3338:		return;
ADDRGP4 $996
JUMPV
LABELV $997
line 3341
;3339:	}
;3340:
;3341:	self->boltpoint4 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 1
ASGNI4
line 3343
;3342:
;3343:	self->s.time = level.time + 3000;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 3345
;3344:
;3345:	self->bolt_Head = 0;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 0
ASGNI4
line 3346
;3346:}
LABELV $996
endproc emplaced_gun_die 0 0
lit
align 1
LABELV $1001
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
char 1 116
char 1 117
char 1 114
char 1 114
char 1 101
char 1 116
char 1 95
char 1 99
char 1 104
char 1 97
char 1 105
char 1 114
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
export SP_emplaced_gun
code
proc SP_emplaced_gun 1172 28
line 3349
;3347:
;3348:void SP_emplaced_gun( gentity_t *ent )
;3349:{
line 3351
;3350:	//char name[] = "models/map_objects/imp_mine/turret_chair.glm";
;3351:	char name[] = "models/map_objects/mp/turret_chair.glm";
ADDRLP4 1092
ADDRGP4 $1001
INDIRB
ASGNB 39
line 3355
;3352:	vec3_t down;
;3353:	trace_t tr;
;3354:
;3355:	RegisterItem( BG_FindItemForWeapon(WP_BLASTER) );
CNSTI4 4
ARGI4
ADDRLP4 1132
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 3358
;3356:	//Emplaced gun uses many of the same assets as the blaster, so just precache it
;3357:
;3358:	ent->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1
ASGNI4
line 3359
;3359:	ent->s.solid = SOLID_BBOX;
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 3361
;3360:
;3361:	ent->bolt_Head = 0;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 0
ASGNI4
line 3363
;3362:
;3363:	VectorSet( ent->r.mins, -30, -20, 8 );
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3253731328
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3248488448
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 1090519040
ASGNF4
line 3364
;3364:	VectorSet( ent->r.maxs, 30, 20, 60 );
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1106247680
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1101004800
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1114636288
ASGNF4
line 3366
;3365:
;3366:	VectorCopy(ent->s.origin, down);
ADDRLP4 1080
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 3368
;3367:
;3368:	down[2] -= 1024;
ADDRLP4 1080+8
ADDRLP4 1080+8
INDIRF4
CNSTF4 1149239296
SUBF4
ASGNF4
line 3370
;3369:
;3370:	trap_Trace(&tr, ent->s.origin, ent->r.mins, ent->r.maxs, down, ent->s.number, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 1136
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1136
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1136
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 3372
;3371:
;3372:	if (tr.fraction != 1 && !tr.allsolid && !tr.startsolid)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $1003
ADDRLP4 1140
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1140
INDIRI4
NEI4 $1003
ADDRLP4 0+4
INDIRI4
ADDRLP4 1140
INDIRI4
NEI4 $1003
line 3373
;3373:	{
line 3374
;3374:		VectorCopy(tr.endpos, ent->s.origin);
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 3375
;3375:	}
LABELV $1003
line 3377
;3376:
;3377:	ent->spawnflags |= 4; // deadsolid
ADDRLP4 1144
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
ASGNP4
ADDRLP4 1144
INDIRP4
ADDRLP4 1144
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 3379
;3378:
;3379:	ent->health = EMPLACED_GUN_HEALTH;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 800
ASGNI4
line 3381
;3380:
;3381:	if (ent->spawnflags & EMPLACED_CANRESPAWN)
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1008
line 3382
;3382:	{ //make it somewhat easier to kill if it can respawn
line 3383
;3383:		ent->health *= 0.4;
ADDRLP4 1148
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ASGNP4
ADDRLP4 1148
INDIRP4
CNSTF4 1053609165
ADDRLP4 1148
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 3384
;3384:	}
LABELV $1008
line 3386
;3385:
;3386:	ent->boltpoint4 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 0
ASGNI4
line 3388
;3387:
;3388:	ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 3389
;3389:	ent->pain = emplaced_gun_pain;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 emplaced_gun_pain
ASGNP4
line 3390
;3390:	ent->die = emplaced_gun_die;
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRGP4 emplaced_gun_die
ASGNP4
line 3393
;3391:
;3392:	// being caught in this thing when it blows would be really bad.
;3393:	ent->splashDamage = 80;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 80
ASGNI4
line 3394
;3394:	ent->splashRadius = 128;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTI4 128
ASGNI4
line 3400
;3395:
;3396://	G_EffectIndex( "emplaced/explode" );
;3397://	G_EffectIndex( "emplaced/dead_smoke" );
;3398:
;3399:	// amount of ammo that this little poochie has
;3400:	G_SpawnInt( "count", "600", &ent->count );
ADDRGP4 $1010
ARGP4
ADDRGP4 $1011
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3402
;3401:
;3402:	ent->s.modelindex = G_ModelIndex( name );
ADDRLP4 1092
ARGP4
ADDRLP4 1148
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 1148
INDIRI4
ASGNI4
line 3403
;3403:	ent->s.modelGhoul2 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 3404
;3404:	ent->s.g2radius = 110;
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 110
ASGNI4
line 3415
;3405:	//trap_G2API_InitGhoul2Model( ent->s.ghoul2, name, ent->s.modelindex );
;3406://g2r	trap_G2API_InitGhoul2Model( &ent->s, name, ent->s.modelindex, 0, 0, 0, 0 );
;3407:
;3408:	// Activate our tags and bones
;3409://	ent->headBolt = gi.G2API_AddBolt( &ent->s.ghoul2[0], "*seat" );
;3410://	ent->handLBolt = gi.G2API_AddBolt( &ent->s.ghoul2[0], "*flash01" );
;3411://	ent->handRBolt = gi.G2API_AddBolt( &ent->s.ghoul2[0], "*flash02" );
;3412://	gi.G2API_SetBoneAngles( &ent->s.ghoul2[0], "swivel_bone", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_Y, POSITIVE_Z, POSITIVE_X, NULL); 
;3413:
;3414://	RegisterItem( FindItemForWeapon( WP_EMPLACED_GUN ));
;3415:	ent->s.weapon = WP_EMPLACED_GUN;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 14
ASGNI4
line 3419
;3416:
;3417://	SnapVector(ent->s.origin);
;3418:
;3419:	G_SetOrigin( ent, ent->s.origin );
ADDRLP4 1152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1152
INDIRP4
ARGP4
ADDRLP4 1152
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 3424
;3420:	
;3421:	//G_SetAngles( ent, ent->s.angles );
;3422:
;3423:	// store base angles for later
;3424:	VectorCopy( ent->s.angles, ent->pos1 );
ADDRLP4 1156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 1156
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 3425
;3425:	VectorCopy( ent->s.angles, ent->r.currentAngles );
ADDRLP4 1160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1160
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 1160
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 3426
;3426:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
ADDRLP4 1164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 1164
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 3428
;3427:
;3428:	ent->think = emplaced_gun_update;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 emplaced_gun_update
ASGNP4
line 3429
;3429:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 3432
;3430:
;3431://	ent->e_UseFunc = useF_emplaced_gun_use;
;3432:	ent->use = emplaced_gun_realuse;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDRGP4 emplaced_gun_realuse
ASGNP4
line 3435
;3433:	//ent->touch = emplaced_gun_use;
;3434:
;3435:	ent->r.svFlags |= SVF_PLAYER_USABLE;
ADDRLP4 1168
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1168
INDIRP4
ADDRLP4 1168
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 3437
;3436:
;3437:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 3439
;3438:
;3439:	ent->s.owner = MAX_CLIENTS+1;
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 33
ASGNI4
line 3440
;3440:	ent->s.shouldtarget = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
CNSTI4 1
ASGNI4
line 3441
;3441:	ent->s.teamowner = 0;
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
CNSTI4 0
ASGNI4
line 3455
;3442:
;3443:	/*
;3444:	angswiv[ROLL] = 0;
;3445:	angswiv[PITCH] = 0;
;3446:	angswiv[YAW] = 70;
;3447:	trap_G2API_SetBoneAngles(ent->s.ghoul2, 0, "swivel_bone", angswiv, BONE_ANGLES_REPLACE, POSITIVE_Z, NEGATIVE_X, NEGATIVE_Y, NULL, 0, level.time);
;3448:	*/
;3449:
;3450:
;3451://g2r	ent->s.trickedentindex = trap_G2API_AddBolt(ent->s.ghoul2, 0, "*seat");
;3452://g2r	ent->s.bolt1 = trap_G2API_AddBolt(ent->s.ghoul2, 0, "*flash01");
;3453://g2r	ent->s.bolt2 = trap_G2API_AddBolt(ent->s.ghoul2, 0, "*flash02");
;3454:
;3455:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 3456
;3456:}
LABELV $1000
endproc SP_emplaced_gun 1172 28
bss
align 4
LABELV ent_list
skip 4096
import G_GetHitLocation
import G_BoxInBounds
align 4
LABELV muzzle
skip 12
align 4
LABELV up
skip 12
align 4
LABELV right
skip 12
align 4
LABELV forward
skip 12
align 4
LABELV s_quadFactor
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
import G_CreateExampleAnimEnt
import G_PlayerBecomeATST
import ATST_ManageDamageBoxes
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
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
LABELV $1011
char 1 54
char 1 48
char 1 48
char 1 0
align 1
LABELV $1010
char 1 99
char 1 111
char 1 117
char 1 110
char 1 116
char 1 0
align 1
LABELV $775
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
char 1 109
char 1 101
char 1 108
char 1 101
char 1 101
char 1 47
char 1 112
char 1 117
char 1 110
char 1 99
char 1 104
char 1 37
char 1 100
char 1 0
align 1
LABELV $695
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
char 1 119
char 1 97
char 1 114
char 1 110
char 1 105
char 1 110
char 1 103
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $679
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
LABELV $677
char 1 100
char 1 101
char 1 116
char 1 112
char 1 97
char 1 99
char 1 107
char 1 0
align 1
LABELV $665
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
char 1 0
align 1
LABELV $608
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
LABELV $607
char 1 108
char 1 97
char 1 115
char 1 101
char 1 114
char 1 84
char 1 114
char 1 97
char 1 112
char 1 0
align 1
LABELV $599
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
char 1 115
char 1 116
char 1 105
char 1 99
char 1 107
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $587
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
char 1 119
char 1 97
char 1 114
char 1 110
char 1 105
char 1 110
char 1 103
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $557
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
char 1 108
char 1 111
char 1 111
char 1 112
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $541
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 95
char 1 100
char 1 101
char 1 116
char 1 111
char 1 110
char 1 97
char 1 116
char 1 111
char 1 114
char 1 0
align 1
LABELV $521
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
char 1 116
char 1 104
char 1 101
char 1 114
char 1 109
char 1 97
char 1 108
char 1 47
char 1 119
char 1 97
char 1 114
char 1 110
char 1 105
char 1 110
char 1 103
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $515
char 1 114
char 1 111
char 1 99
char 1 107
char 1 101
char 1 116
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $435
char 1 102
char 1 108
char 1 101
char 1 99
char 1 104
char 1 95
char 1 97
char 1 108
char 1 116
char 1 0
align 1
LABELV $400
char 1 102
char 1 108
char 1 101
char 1 99
char 1 104
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $387
char 1 100
char 1 101
char 1 109
char 1 112
char 1 50
char 1 95
char 1 97
char 1 108
char 1 116
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $311
char 1 100
char 1 101
char 1 109
char 1 112
char 1 50
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $305
char 1 114
char 1 101
char 1 112
char 1 101
char 1 97
char 1 116
char 1 101
char 1 114
char 1 95
char 1 97
char 1 108
char 1 116
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $303
char 1 114
char 1 101
char 1 112
char 1 101
char 1 97
char 1 116
char 1 101
char 1 114
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $298
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
char 1 97
char 1 108
char 1 116
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $274
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
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $121
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
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $119
char 1 98
char 1 108
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $112
char 1 103
char 1 101
char 1 110
char 1 101
char 1 114
char 1 105
char 1 99
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
align 1
LABELV $99
char 1 98
char 1 114
char 1 121
char 1 97
char 1 114
char 1 95
char 1 112
char 1 114
char 1 111
char 1 106
char 1 0
