export ObjectDie
code
proc ObjectDie 0 8
file "../g_combat.c"
line 14
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_combat.c
;4:
;5:#include "g_local.h"
;6:
;7://rww - pd
;8:void BotDamageNotification(gclient_t *bot, gentity_t *attacker);
;9://end rww
;10:
;11:void ThrowSaberToAttacker(gentity_t *self, gentity_t *attacker);
;12:
;13:void ObjectDie (gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath )
;14:{
line 15
;15:	if(self->target)
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $79
line 16
;16:	{
line 17
;17:		G_UseTargets(self, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 18
;18:	}
LABELV $79
line 21
;19:
;20:	//remove my script_targetname
;21:	G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 22
;22:}
LABELV $78
endproc ObjectDie 0 8
export G_GetHitLocation
proc G_GetHitLocation 172 16
line 152
;23:
;24:/*
;25:int G_GetHitLocFromSurfName( gentity_t *ent, const char *surfName, vec3_t point )
;26:{
;27:	if ( !surfName || !surfName[0] )
;28:	{
;29:		return HL_NONE;
;30:	}
;31:	if ( !Q_strncmp( "hips", surfName, 4 ) )
;32:	{//FIXME: test properly for legs
;33:		if ( Q_irand( 0, 1 ) )
;34:		{
;35:			return HL_WAIST;
;36:		}
;37:		else if ( Q_irand( 0, 1 ) )
;38:		{
;39:			return HL_LEG_RT;
;40:		}
;41:		else
;42:		{
;43:			return HL_LEG_LT;
;44:		}
;45:	}
;46:	else if ( !Q_strncmp( "torso", surfName, 5 ) )
;47:	{
;48:		if ( !ent->client )
;49:		{
;50:			return HL_CHEST;
;51:		}
;52:		else
;53:		{
;54:			vec3_t	t_fwd, t_rt, t_up, dirToImpact;
;55:			float frontSide, rightSide, upSide;
;56:			AngleVectors( ent->client->renderInfo.torsoAngles, t_fwd, t_rt, t_up );
;57:			VectorSubtract( point, ent->client->renderInfo.torsoPoint, dirToImpact );
;58:			frontSide = DotProduct( t_fwd, dirToImpact );
;59:			rightSide = DotProduct( t_rt, dirToImpact );
;60:			upSide = DotProduct( t_up, dirToImpact );
;61:			if ( upSide < 0 )
;62:			{//hit at waist
;63:				return HL_WAIST;
;64:			}
;65:			else
;66:			{//hit on upper torso
;67:				if ( rightSide > 10 )
;68:				{
;69:					return HL_ARM_RT;
;70:				}
;71:				else if ( rightSide < -10 )
;72:				{
;73:					return HL_ARM_LT;
;74:				}
;75:				else if ( rightSide > 4 )
;76:				{
;77:					if ( frontSide > 0 )
;78:					{
;79:						return HL_CHEST_RT;
;80:					}
;81:					else
;82:					{
;83:						return HL_BACK_RT;
;84:					}
;85:				}
;86:				else if ( rightSide < -4 )
;87:				{
;88:					if ( frontSide > 0 )
;89:					{
;90:						return HL_CHEST_LT;
;91:					}
;92:					else
;93:					{
;94:						return HL_BACK_LT;
;95:					}
;96:				}
;97:				else if ( upSide > 6 )
;98:				{
;99:					return HL_HEAD;
;100:				}
;101:				else if ( frontSide > 0 )
;102:				{
;103:					return HL_CHEST;
;104:				}
;105:				else
;106:				{
;107:					return HL_BACK;
;108:				}
;109:			}
;110:		}
;111:	}
;112:	else if ( !Q_strncmp( "head", surfName, 4 ) )
;113:	{
;114:		return HL_HEAD;
;115:	}
;116:	else if ( !Q_strncmp( "r_arm", surfName, 5 ) )
;117:	{
;118:		return HL_ARM_RT;
;119:	}
;120:	else if ( !Q_strncmp( "l_arm", surfName, 5 ) )
;121:	{
;122:		return HL_ARM_LT;
;123:	}
;124:	else if ( !Q_strncmp( "r_leg", surfName, 5 ) )
;125:	{
;126:		if ( ent->client && DistanceSquared( ent->client->renderInfo.crotchPoint, point ) > 144 )
;127:		{//not close enough to the pelvis to be a dismemberment hit and we don't dismember at the ankle or knee
;128:			return HL_FOOT_RT;
;129:		}
;130:		return HL_LEG_RT;
;131:	}
;132:	else if ( !Q_strncmp( "l_leg", surfName, 5 ) )
;133:	{
;134:		if ( ent->client && DistanceSquared( ent->client->renderInfo.crotchPoint, point ) > 144 )
;135:		{//not close enough to the pelvis to be a dismemberment hit and we don't dismember at the ankle or knee
;136:			return HL_FOOT_LT;
;137:		}
;138:		return HL_LEG_LT;
;139:	}
;140:	else if ( !Q_strncmp( "r_hand", surfName, 6 ) )
;141:	{
;142:		return HL_HAND_RT;
;143:	}
;144:	else if ( !Q_strncmp( "l_hand", surfName, 6 ) )
;145:	{
;146:		return HL_HAND_LT;
;147:	}
;148:	return HL_NONE;
;149:}
;150:*/
;151:int G_GetHitLocation(gentity_t *target, vec3_t ppoint)
;152:{
line 162
;153:	vec3_t			point, point_dir;
;154:	vec3_t			forward, right, up;
;155:	vec3_t			tangles, tcenter;
;156:	float			tradius;
;157:	float			udot, fdot, rdot;
;158:	int				Vertical, Forward, Lateral;
;159:	int				HitLoc;
;160:
;161:	// Get target forward, right and up.
;162:	if(target->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $82
line 163
;163:	{
line 165
;164:		// Ignore player's pitch and roll.
;165:		VectorSet(tangles, 0, target->r.currentAngles[YAW], 0);
ADDRLP4 88
CNSTF4 0
ASGNF4
ADDRLP4 88+4
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRF4
ASGNF4
ADDRLP4 88+8
CNSTF4 0
ASGNF4
line 166
;166:	}
LABELV $82
line 168
;167:
;168:	AngleVectors(tangles, forward, right, up);
ADDRLP4 88
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 52
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 171
;169:
;170:	// Get center of target.
;171:	VectorAdd(target->r.absmin, target->r.absmax, tcenter);
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 116
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDRLP4 116
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 116
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDRLP4 116
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 120
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDRLP4 120
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDF4
ASGNF4
line 172
;172:	VectorScale(tcenter, 0.5, tcenter);
ADDRLP4 124
CNSTF4 1056964608
ASGNF4
ADDRLP4 12
ADDRLP4 124
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 124
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+8
CNSTF4 1056964608
ADDRLP4 12+8
INDIRF4
MULF4
ASGNF4
line 175
;173:
;174:	// Get radius width of target.
;175:	tradius = (fabs(target->r.maxs[0]) + fabs(target->r.maxs[1]) + fabs(target->r.mins[0]) + fabs(target->r.mins[1]))/4;
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ARGF4
ADDRLP4 128
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ARGF4
ADDRLP4 132
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ARGF4
ADDRLP4 136
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ARGF4
ADDRLP4 140
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 112
ADDRLP4 128
INDIRF4
ADDRLP4 132
INDIRF4
ADDF4
ADDRLP4 136
INDIRF4
ADDF4
ADDRLP4 140
INDIRF4
ADDF4
CNSTF4 1082130432
DIVF4
ASGNF4
line 178
;176:
;177:	// Get impact point.
;178:	if(ppoint && !VectorCompare(ppoint, vec3_origin))
ADDRLP4 144
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $92
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 148
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $92
line 179
;179:	{
line 180
;180:		VectorCopy(ppoint, point);
ADDRLP4 68
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 181
;181:	}
ADDRGP4 $93
JUMPV
LABELV $92
line 183
;182:	else
;183:	{
line 184
;184:		return HL_NONE;
CNSTI4 0
RETI4
ADDRGP4 $81
JUMPV
LABELV $93
line 206
;185:	}
;186:
;187:/*
;188://get impact dir
;189:	if(pdir && !VectorCompare(pdir, vec3_origin))
;190:	{
;191:		VectorCopy(pdir, dir);
;192:	}
;193:	else
;194:	{
;195:		return;
;196:	}
;197:
;198://put point at controlled distance from center
;199:	VectorSubtract(point, tcenter, tempvec);
;200:	tempvec[2] = 0;
;201:	hdist = VectorLength(tempvec);
;202:
;203:	VectorMA(point, hdist - tradius, dir, point);
;204:	//now a point on the surface of a cylinder with a radius of tradius
;205:*/	
;206:	VectorSubtract(point, tcenter, point_dir);
ADDRLP4 0
ADDRLP4 68
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 68+4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 68+8
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 207
;207:	VectorNormalize(point_dir);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 210
;208:
;209:	// Get bottom to top (vertical) position index
;210:	udot = DotProduct(up, point_dir);
ADDRLP4 80
ADDRLP4 52
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 52+4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 52+8
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 211
;211:	if(udot>.800)
ADDRLP4 80
INDIRF4
CNSTF4 1061997773
LEF4 $104
line 212
;212:	{
line 213
;213:		Vertical = 4;
ADDRLP4 100
CNSTI4 4
ASGNI4
line 214
;214:	}
ADDRGP4 $105
JUMPV
LABELV $104
line 215
;215:	else if(udot>.400)
ADDRLP4 80
INDIRF4
CNSTF4 1053609165
LEF4 $106
line 216
;216:	{
line 217
;217:		Vertical = 3;
ADDRLP4 100
CNSTI4 3
ASGNI4
line 218
;218:	}
ADDRGP4 $107
JUMPV
LABELV $106
line 219
;219:	else if(udot>-.333)
ADDRLP4 80
INDIRF4
CNSTF4 3198844666
LEF4 $108
line 220
;220:	{
line 221
;221:		Vertical = 2;
ADDRLP4 100
CNSTI4 2
ASGNI4
line 222
;222:	}
ADDRGP4 $109
JUMPV
LABELV $108
line 223
;223:	else if(udot>-.666)
ADDRLP4 80
INDIRF4
CNSTF4 3207233274
LEF4 $110
line 224
;224:	{
line 225
;225:		Vertical = 1;
ADDRLP4 100
CNSTI4 1
ASGNI4
line 226
;226:	}
ADDRGP4 $111
JUMPV
LABELV $110
line 228
;227:	else
;228:	{
line 229
;229:		Vertical = 0;
ADDRLP4 100
CNSTI4 0
ASGNI4
line 230
;230:	}
LABELV $111
LABELV $109
LABELV $107
LABELV $105
line 233
;231:
;232:	// Get back to front (forward) position index.
;233:	fdot = DotProduct(forward, point_dir);
ADDRLP4 84
ADDRLP4 28
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 28+4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 28+8
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 234
;234:	if(fdot>.666)
ADDRLP4 84
INDIRF4
CNSTF4 1059749626
LEF4 $116
line 235
;235:	{
line 236
;236:		Forward = 4;
ADDRLP4 104
CNSTI4 4
ASGNI4
line 237
;237:	}
ADDRGP4 $117
JUMPV
LABELV $116
line 238
;238:	else if(fdot>.333)
ADDRLP4 84
INDIRF4
CNSTF4 1051361018
LEF4 $118
line 239
;239:	{
line 240
;240:		Forward = 3;
ADDRLP4 104
CNSTI4 3
ASGNI4
line 241
;241:	}
ADDRGP4 $119
JUMPV
LABELV $118
line 242
;242:	else if(fdot>-.333)
ADDRLP4 84
INDIRF4
CNSTF4 3198844666
LEF4 $120
line 243
;243:	{
line 244
;244:		Forward = 2;
ADDRLP4 104
CNSTI4 2
ASGNI4
line 245
;245:	}
ADDRGP4 $121
JUMPV
LABELV $120
line 246
;246:	else if(fdot>-.666)
ADDRLP4 84
INDIRF4
CNSTF4 3207233274
LEF4 $122
line 247
;247:	{
line 248
;248:		Forward = 1;
ADDRLP4 104
CNSTI4 1
ASGNI4
line 249
;249:	}
ADDRGP4 $123
JUMPV
LABELV $122
line 251
;250:	else
;251:	{
line 252
;252:		Forward = 0;
ADDRLP4 104
CNSTI4 0
ASGNI4
line 253
;253:	}
LABELV $123
LABELV $121
LABELV $119
LABELV $117
line 256
;254:
;255:	// Get left to right (lateral) position index.
;256:	rdot = DotProduct(right, point_dir);
ADDRLP4 64
ADDRLP4 40
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 257
;257:	if(rdot>.666)
ADDRLP4 64
INDIRF4
CNSTF4 1059749626
LEF4 $128
line 258
;258:	{
line 259
;259:		Lateral = 4;
ADDRLP4 108
CNSTI4 4
ASGNI4
line 260
;260:	}
ADDRGP4 $129
JUMPV
LABELV $128
line 261
;261:	else if(rdot>.333)
ADDRLP4 64
INDIRF4
CNSTF4 1051361018
LEF4 $130
line 262
;262:	{
line 263
;263:		Lateral = 3;
ADDRLP4 108
CNSTI4 3
ASGNI4
line 264
;264:	}
ADDRGP4 $131
JUMPV
LABELV $130
line 265
;265:	else if(rdot>-.333)
ADDRLP4 64
INDIRF4
CNSTF4 3198844666
LEF4 $132
line 266
;266:	{
line 267
;267:		Lateral = 2;
ADDRLP4 108
CNSTI4 2
ASGNI4
line 268
;268:	}
ADDRGP4 $133
JUMPV
LABELV $132
line 269
;269:	else if(rdot>-.666)
ADDRLP4 64
INDIRF4
CNSTF4 3207233274
LEF4 $134
line 270
;270:	{
line 271
;271:		Lateral = 1;
ADDRLP4 108
CNSTI4 1
ASGNI4
line 272
;272:	}
ADDRGP4 $135
JUMPV
LABELV $134
line 274
;273:	else
;274:	{
line 275
;275:		Lateral = 0;
ADDRLP4 108
CNSTI4 0
ASGNI4
line 276
;276:	}
LABELV $135
LABELV $133
LABELV $131
LABELV $129
line 278
;277:
;278:	HitLoc = Vertical * 25 + Forward * 5 + Lateral;
ADDRLP4 24
CNSTI4 25
ADDRLP4 100
INDIRI4
MULI4
CNSTI4 5
ADDRLP4 104
INDIRI4
MULI4
ADDI4
ADDRLP4 108
INDIRI4
ADDI4
ASGNI4
line 280
;279:
;280:	if(HitLoc <= 10)
ADDRLP4 24
INDIRI4
CNSTI4 10
GTI4 $136
line 281
;281:	{
line 283
;282:		// Feet.
;283:		if ( rdot > 0 )
ADDRLP4 64
INDIRF4
CNSTF4 0
LEF4 $138
line 284
;284:		{
line 285
;285:			return HL_FOOT_RT;
CNSTI4 1
RETI4
ADDRGP4 $81
JUMPV
LABELV $138
line 288
;286:		}
;287:		else
;288:		{
line 289
;289:			return HL_FOOT_LT;
CNSTI4 2
RETI4
ADDRGP4 $81
JUMPV
LABELV $136
line 292
;290:		}
;291:	}
;292:	else if(HitLoc <= 50)
ADDRLP4 24
INDIRI4
CNSTI4 50
GTI4 $140
line 293
;293:	{
line 295
;294:		// Legs.
;295:		if ( rdot > 0 )
ADDRLP4 64
INDIRF4
CNSTF4 0
LEF4 $142
line 296
;296:		{
line 297
;297:			return HL_LEG_RT;
CNSTI4 3
RETI4
ADDRGP4 $81
JUMPV
LABELV $142
line 300
;298:		}
;299:		else
;300:		{
line 301
;301:			return HL_LEG_LT;
CNSTI4 4
RETI4
ADDRGP4 $81
JUMPV
LABELV $140
line 304
;302:		}
;303:	}
;304:	else if(HitLoc == 56||HitLoc == 60||HitLoc == 61||HitLoc == 65||HitLoc == 66||HitLoc == 70)
ADDRLP4 24
INDIRI4
CNSTI4 56
EQI4 $150
ADDRLP4 24
INDIRI4
CNSTI4 60
EQI4 $150
ADDRLP4 24
INDIRI4
CNSTI4 61
EQI4 $150
ADDRLP4 24
INDIRI4
CNSTI4 65
EQI4 $150
ADDRLP4 24
INDIRI4
CNSTI4 66
EQI4 $150
ADDRLP4 24
INDIRI4
CNSTI4 70
NEI4 $144
LABELV $150
line 305
;305:	{
line 307
;306:		// Hands.
;307:		if ( rdot > 0 )
ADDRLP4 64
INDIRF4
CNSTF4 0
LEF4 $151
line 308
;308:		{
line 309
;309:			return HL_HAND_RT;
CNSTI4 14
RETI4
ADDRGP4 $81
JUMPV
LABELV $151
line 312
;310:		}
;311:		else
;312:		{
line 313
;313:			return HL_HAND_LT;
CNSTI4 15
RETI4
ADDRGP4 $81
JUMPV
LABELV $144
line 316
;314:		}
;315:	}
;316:	else if(HitLoc == 83||HitLoc == 87||HitLoc == 88||HitLoc == 92||HitLoc == 93||HitLoc == 97)
ADDRLP4 24
INDIRI4
CNSTI4 83
EQI4 $159
ADDRLP4 24
INDIRI4
CNSTI4 87
EQI4 $159
ADDRLP4 24
INDIRI4
CNSTI4 88
EQI4 $159
ADDRLP4 24
INDIRI4
CNSTI4 92
EQI4 $159
ADDRLP4 24
INDIRI4
CNSTI4 93
EQI4 $159
ADDRLP4 24
INDIRI4
CNSTI4 97
NEI4 $153
LABELV $159
line 317
;317:	{
line 319
;318:		// Arms.
;319:		if ( rdot > 0 )
ADDRLP4 64
INDIRF4
CNSTF4 0
LEF4 $160
line 320
;320:		{
line 321
;321:			return HL_ARM_RT;
CNSTI4 12
RETI4
ADDRGP4 $81
JUMPV
LABELV $160
line 324
;322:		}
;323:		else
;324:		{
line 325
;325:			return HL_ARM_LT;
CNSTI4 13
RETI4
ADDRGP4 $81
JUMPV
LABELV $153
line 328
;326:		}
;327:	}
;328:	else if((HitLoc >= 107 && HitLoc <= 109)||(HitLoc >= 112 && HitLoc <= 114)||(HitLoc >= 117 && HitLoc <= 119))
ADDRLP4 24
INDIRI4
CNSTI4 107
LTI4 $165
ADDRLP4 24
INDIRI4
CNSTI4 109
LEI4 $166
LABELV $165
ADDRLP4 24
INDIRI4
CNSTI4 112
LTI4 $167
ADDRLP4 24
INDIRI4
CNSTI4 114
LEI4 $166
LABELV $167
ADDRLP4 24
INDIRI4
CNSTI4 117
LTI4 $162
ADDRLP4 24
INDIRI4
CNSTI4 119
GTI4 $162
LABELV $166
line 329
;329:	{
line 331
;330:		// Head.
;331:		return HL_HEAD;
CNSTI4 16
RETI4
ADDRGP4 $81
JUMPV
LABELV $162
line 334
;332:	}
;333:	else
;334:	{
line 335
;335:		if(udot < 0.3)
ADDRLP4 80
INDIRF4
CNSTF4 1050253722
GEF4 $168
line 336
;336:		{
line 337
;337:			return HL_WAIST;
CNSTI4 5
RETI4
ADDRGP4 $81
JUMPV
LABELV $168
line 339
;338:		}
;339:		else if(fdot < 0)
ADDRLP4 84
INDIRF4
CNSTF4 0
GEF4 $170
line 340
;340:		{
line 341
;341:			if(rdot > 0.4)
ADDRLP4 64
INDIRF4
CNSTF4 1053609165
LEF4 $172
line 342
;342:			{
line 343
;343:				return HL_BACK_RT;
CNSTI4 6
RETI4
ADDRGP4 $81
JUMPV
LABELV $172
line 345
;344:			}
;345:			else if(rdot < -0.4)
ADDRLP4 64
INDIRF4
CNSTF4 3201092813
GEF4 $174
line 346
;346:			{
line 347
;347:				return HL_BACK_LT;
CNSTI4 7
RETI4
ADDRGP4 $81
JUMPV
LABELV $174
line 349
;348:			}
;349:			else if(fdot < 0)
ADDRLP4 84
INDIRF4
CNSTF4 0
GEF4 $171
line 350
;350:			{
line 351
;351:				return HL_BACK;
CNSTI4 8
RETI4
ADDRGP4 $81
JUMPV
line 353
;352:			}
;353:		}
LABELV $170
line 355
;354:		else
;355:		{
line 356
;356:			if(rdot > 0.3)
ADDRLP4 64
INDIRF4
CNSTF4 1050253722
LEF4 $178
line 357
;357:			{
line 358
;358:				return HL_CHEST_RT;
CNSTI4 9
RETI4
ADDRGP4 $81
JUMPV
LABELV $178
line 360
;359:			}
;360:			else if(rdot < -0.3)
ADDRLP4 64
INDIRF4
CNSTF4 3197737370
GEF4 $180
line 361
;361:			{
line 362
;362:				return HL_CHEST_LT;
CNSTI4 10
RETI4
ADDRGP4 $81
JUMPV
LABELV $180
line 364
;363:			}
;364:			else if(fdot < 0)
ADDRLP4 84
INDIRF4
CNSTF4 0
GEF4 $182
line 365
;365:			{
line 366
;366:				return HL_CHEST;
CNSTI4 11
RETI4
ADDRGP4 $81
JUMPV
LABELV $182
line 368
;367:			}
;368:		}
LABELV $171
line 369
;369:	}
line 370
;370:	return HL_NONE;
CNSTI4 0
RETI4
LABELV $81
endproc G_GetHitLocation 172 16
export ExplodeDeath
proc ExplodeDeath 40 24
line 475
;371:}
;372:
;373:/*
;374:int G_PickPainAnim( gentity_t *self, vec3_t point, int damage )
;375:{
;376:	switch( G_GetHitLocation( self, point ) )
;377:	{
;378:	case HL_FOOT_RT:
;379:		return BOTH_PAIN12;
;380:		//PAIN12 = right foot
;381:		break;
;382:	case HL_FOOT_LT:
;383:		return -1;
;384:		break;
;385:	case HL_LEG_RT:
;386:		if ( !Q_irand( 0, 1 ) )
;387:		{
;388:			return BOTH_PAIN11;
;389:		}
;390:		else
;391:		{
;392:			return BOTH_PAIN13;
;393:		}
;394:		//PAIN11 = twitch right leg
;395:		//PAIN13 = right knee
;396:		break;
;397:	case HL_LEG_LT:
;398:		return BOTH_PAIN14;
;399:		//PAIN14 = twitch left leg
;400:		break;
;401:	case HL_BACK_RT:
;402:		return BOTH_PAIN7;
;403:		//PAIN7 = med left shoulder
;404:		break;
;405:	case HL_BACK_LT:
;406:		return Q_irand( BOTH_PAIN15, BOTH_PAIN16 );
;407:		//PAIN15 = med right shoulder
;408:		//PAIN16 = twitch right shoulder
;409:		break;
;410:	case HL_BACK:
;411:		if ( !Q_irand( 0, 1 ) )
;412:		{
;413:			return BOTH_PAIN1;
;414:		}
;415:		else
;416:		{
;417:			return BOTH_PAIN5;
;418:		}
;419:		//PAIN1 = back
;420:		//PAIN5 = same as 1
;421:		break;
;422:	case HL_CHEST_RT:
;423:		return BOTH_PAIN3;
;424:		//PAIN3 = long, right shoulder
;425:		break;
;426:	case HL_CHEST_LT:
;427:		return BOTH_PAIN2;
;428:		//PAIN2 = long, left shoulder
;429:		break;
;430:	case HL_WAIST:
;431:	case HL_CHEST:
;432:		if ( !Q_irand( 0, 3 ) )
;433:		{
;434:			return BOTH_PAIN6;
;435:		}
;436:		else if ( !Q_irand( 0, 2 ) )
;437:		{
;438:			return BOTH_PAIN8;
;439:		}
;440:		else if ( !Q_irand( 0, 1 ) )
;441:		{
;442:			return BOTH_PAIN17;
;443:		}
;444:		else
;445:		{
;446:			return BOTH_PAIN19;
;447:		}
;448:		//PAIN6 = gut
;449:		//PAIN8 = chest
;450:		//PAIN17 = twitch crotch
;451:		//PAIN19 = med crotch
;452:		break;
;453:	case HL_ARM_RT:
;454:	case HL_HAND_RT:
;455:		return BOTH_PAIN9;
;456:		//PAIN9 = twitch right arm
;457:		break;
;458:	case HL_ARM_LT:
;459:	case HL_HAND_LT:
;460:		return BOTH_PAIN10;
;461:		//PAIN10 = twitch left arm
;462:		break;
;463:	case HL_HEAD:
;464:		return BOTH_PAIN4;
;465:		//PAIN4 = head
;466:		break;
;467:	default:
;468:		return -1;
;469:		break;
;470:	}
;471:}
;472:*/
;473:
;474:void ExplodeDeath( gentity_t *self ) 
;475:{
line 479
;476://	gentity_t	*tent;
;477:	vec3_t		forward;
;478:
;479:	self->takedamage = qfalse;//stop chain reaction runaway loops
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 481
;480:
;481:	self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 483
;482:
;483:	VectorCopy( self->r.currentOrigin, self->s.pos.trBase );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 486
;484:
;485://	tent = G_TempEntity( self->s.origin, EV_FX_EXPLOSION );
;486:	AngleVectors(self->s.angles, forward, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
CNSTP4 0
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 496
;487:
;488:/*	
;489:	if ( self->fxID > 0 )
;490:	{
;491:		G_PlayEffect( self->fxID, self->r.currentOrigin, forward );
;492:	}
;493:	else
;494:	*/
;495:
;496:	{
line 499
;497://		CG_SurfaceExplosion( self->r.currentOrigin, forward, 20.0f, 12.0f, ((self->spawnflags&4)==qfalse) );	//FIXME: This needs to be consistent to all exploders!
;498://		G_Sound(self, self->sounds );
;499:	}
line 501
;500:	
;501:	if(self->splashDamage > 0 && self->splashRadius > 0)
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 696
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $185
ADDRLP4 20
INDIRP4
CNSTI4 700
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $185
line 502
;502:	{
line 503
;503:		gentity_t *attacker = self;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
line 504
;504:		if ( self->parent )
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $187
line 505
;505:		{
line 506
;506:			attacker = self->parent;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
line 507
;507:		}
LABELV $187
line 508
;508:		G_RadiusDamage( self->r.currentOrigin, attacker, self->splashDamage, self->splashRadius, 
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 36
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 696
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 700
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 510
;509:				attacker, MOD_UNKNOWN );
;510:	}
LABELV $185
line 512
;511:
;512:	ObjectDie( self, self, self, 20, 0 );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 20
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 ObjectDie
CALLV
pop
line 513
;513:}
LABELV $184
endproc ExplodeDeath 40 24
export ScorePlum
proc ScorePlum 12 8
line 521
;514:
;515:
;516:/*
;517:============
;518:ScorePlum
;519:============
;520:*/
;521:void ScorePlum( gentity_t *ent, vec3_t origin, int score ) {
line 524
;522:	gentity_t *plum;
;523:
;524:	plum = G_TempEntity( origin, EV_SCOREPLUM );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 86
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 526
;525:	// only send this temp entity to a single client
;526:	plum->r.svFlags |= SVF_SINGLECLIENT;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 527
;527:	plum->r.singleClient = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 308
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 529
;528:	//
;529:	plum->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 530
;530:	plum->s.time = score;
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 531
;531:}
LABELV $189
endproc ScorePlum 12 8
export AddScore
proc AddScore 8 0
line 540
;532:
;533:/*
;534:============
;535:AddScore
;536:
;537:Adds score to both the client and his team
;538:============
;539:*/
;540:void AddScore( gentity_t *ent, vec3_t origin, int score ) {
line 541
;541:	if ( !ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $191
line 542
;542:		return;
ADDRGP4 $190
JUMPV
LABELV $191
line 545
;543:	}
;544:	// no scoring during pre-match warmup
;545:	if ( level.warmupTime ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $193
line 546
;546:		return;
ADDRGP4 $190
JUMPV
LABELV $193
line 551
;547:	}
;548:	// show score plum
;549:	//ScorePlum(ent, origin, score);
;550:	//
;551:	ent->client->ps.persistant[PERS_SCORE] += score;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 280
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
line 552
;552:	if ( g_gametype.integer == GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
NEI4 $196
line 553
;553:		level.teamScores[ ent->client->ps.persistant[PERS_TEAM] ] += score;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
LABELV $196
line 554
;554:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 555
;555:}
LABELV $190
endproc AddScore 8 0
export TossClientWeapon
proc TossClientWeapon 92 12
line 565
;556:
;557:/*
;558:=================
;559:TossClientItems
;560:
;561:rww - Toss the weapon away from the player in the specified direction
;562:=================
;563:*/
;564:void TossClientWeapon(gentity_t *self, vec3_t direction, float speed)
;565:{
line 569
;566:	vec3_t vel;
;567:	gitem_t *item;
;568:	gentity_t *launched;
;569:	int weapon = self->s.weapon;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 572
;570:	int ammoSub;
;571:
;572:	if (weapon <= WP_BRYAR_PISTOL)
ADDRLP4 0
INDIRI4
CNSTI4 3
GTI4 $201
line 573
;573:	{ //can't have this
line 574
;574:		return;
ADDRGP4 $200
JUMPV
LABELV $201
line 577
;575:	}
;576:
;577:	if (weapon == WP_EMPLACED_GUN ||
ADDRLP4 0
INDIRI4
CNSTI4 14
EQI4 $205
ADDRLP4 0
INDIRI4
CNSTI4 15
NEI4 $203
LABELV $205
line 579
;578:		weapon == WP_TURRET)
;579:	{
line 580
;580:		return;
ADDRGP4 $200
JUMPV
LABELV $203
line 584
;581:	}
;582:
;583:	// find the item type for this weapon
;584:	item = BG_FindItemForWeapon( weapon );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 32
INDIRP4
ASGNP4
line 586
;585:
;586:	ammoSub = (self->client->ps.ammo[weaponData[weapon].ammoIndex] - bg_itemlist[BG_GetItemIndexByTag(weapon, IT_WEAPON)].quantity);
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 40
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRLP4 44
CNSTI4 408
ASGNI4
ADDRLP4 24
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDP4
INDIRI4
CNSTI4 52
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 bg_itemlist+32
ADDP4
INDIRI4
SUBI4
ASGNI4
line 588
;587:
;588:	if (ammoSub < 0)
ADDRLP4 24
INDIRI4
CNSTI4 0
GEI4 $207
line 589
;589:	{
line 590
;590:		int ammoQuan = item->quantity;
ADDRLP4 48
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 591
;591:		ammoQuan -= (-ammoSub);
ADDRLP4 48
ADDRLP4 48
INDIRI4
ADDRLP4 24
INDIRI4
NEGI4
SUBI4
ASGNI4
line 593
;592:
;593:		if (ammoQuan <= 0)
ADDRLP4 48
INDIRI4
CNSTI4 0
GTI4 $209
line 594
;594:		{ //no ammo
line 595
;595:			return;
ADDRGP4 $200
JUMPV
LABELV $209
line 597
;596:		}
;597:	}
LABELV $207
line 599
;598:
;599:	vel[0] = direction[0]*speed;
ADDRLP4 8
ADDRFP4 4
INDIRP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
line 600
;600:	vel[1] = direction[1]*speed;
ADDRLP4 8+4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
line 601
;601:	vel[2] = direction[2]*speed;
ADDRLP4 8+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
line 603
;602:
;603:	launched = LaunchItem(item, self->client->ps.origin, vel);
ADDRLP4 20
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 48
ADDRGP4 LaunchItem
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 48
INDIRP4
ASGNP4
line 605
;604:
;605:	launched->s.generic1 = self->s.number;
ADDRLP4 4
INDIRP4
CNSTI4 292
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 606
;606:	launched->s.powerups = level.time + 1500;
ADDRLP4 4
INDIRP4
CNSTI4 272
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 608
;607:
;608:	launched->count = bg_itemlist[BG_GetItemIndexByTag(weapon, IT_WEAPON)].quantity;
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 52
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 52
ADDRLP4 52
INDIRI4
MULI4
ADDRGP4 bg_itemlist+32
ADDP4
INDIRI4
ASGNI4
line 610
;609:
;610:	self->client->ps.ammo[weaponData[weapon].ammoIndex] -= bg_itemlist[BG_GetItemIndexByTag(weapon, IT_WEAPON)].quantity;
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 60
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRLP4 64
CNSTI4 408
ASGNI4
ADDRLP4 68
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 52
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 bg_itemlist+32
ADDP4
INDIRI4
SUBI4
ASGNI4
line 612
;611:
;612:	if (self->client->ps.ammo[weaponData[weapon].ammoIndex] < 0)
ADDRLP4 72
CNSTI4 408
ASGNI4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ADDP4
INDIRI4
CNSTI4 0
GEI4 $216
line 613
;613:	{
line 614
;614:		launched->count -= (-self->client->ps.ammo[weaponData[weapon].ammoIndex]);
ADDRLP4 76
ADDRLP4 4
INDIRP4
CNSTI4 712
ADDP4
ASGNP4
ADDRLP4 80
CNSTI4 408
ASGNI4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ADDP4
INDIRI4
NEGI4
SUBI4
ASGNI4
line 615
;615:		self->client->ps.ammo[weaponData[weapon].ammoIndex] = 0;
ADDRLP4 84
CNSTI4 408
ASGNI4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 616
;616:	}
LABELV $216
line 618
;617:
;618:	if ((self->client->ps.ammo[weaponData[weapon].ammoIndex] < 1 && weapon != WP_DET_PACK) ||
ADDRLP4 80
CNSTI4 408
ASGNI4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ADDP4
INDIRI4
CNSTI4 1
GEI4 $221
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $220
LABELV $221
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $218
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $218
ADDRLP4 0
INDIRI4
CNSTI4 12
EQI4 $218
LABELV $220
line 620
;619:		(weapon != WP_THERMAL && weapon != WP_DET_PACK && weapon != WP_TRIP_MINE))
;620:	{
line 621
;621:		self->client->ps.stats[STAT_WEAPONS] &= ~(1 << weapon);
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 623
;622:
;623:		self->s.weapon = 0;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 0
ASGNI4
line 624
;624:		self->client->ps.weapon = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 626
;625:
;626:		G_AddEvent(self, EV_NOAMMO, weapon);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 22
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 627
;627:	}
LABELV $218
line 628
;628:}
LABELV $200
endproc TossClientWeapon 92 12
export TossClientItems
proc TossClientItems 44 12
line 637
;629:
;630:/*
;631:=================
;632:TossClientItems
;633:
;634:Toss the weapon and powerups for the killed player
;635:=================
;636:*/
;637:void TossClientItems( gentity_t *self ) {
line 645
;638:	gitem_t		*item;
;639:	int			weapon;
;640:	float		angle;
;641:	int			i;
;642:	gentity_t	*drop;
;643:
;644:	// drop the weapon if not a gauntlet or machinegun
;645:	weapon = self->s.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 651
;646:
;647:	// make a special check to see if they are changing to a new
;648:	// weapon that isn't the mg or gauntlet.  Without this, a client
;649:	// can pick up a weapon, be killed, and not drop the weapon because
;650:	// their weapon change hasn't completed yet and they are still holding the MG.
;651:	if ( weapon == WP_BRYAR_PISTOL) {
ADDRLP4 12
INDIRI4
CNSTI4 3
NEI4 $223
line 652
;652:		if ( self->client->ps.weaponstate == WEAPON_DROPPING ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 2
NEI4 $225
line 653
;653:			weapon = self->client->pers.cmd.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1404
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 654
;654:		}
LABELV $225
line 655
;655:		if ( !( self->client->ps.stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 12
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $227
line 656
;656:			weapon = WP_NONE;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 657
;657:		}
LABELV $227
line 658
;658:	}
LABELV $223
line 660
;659:
;660:	self->s.bolt2 = weapon;
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 662
;661:
;662:	if ( weapon > WP_BRYAR_PISTOL && 
ADDRLP4 12
INDIRI4
CNSTI4 3
LEI4 $229
ADDRLP4 12
INDIRI4
CNSTI4 14
EQI4 $229
ADDRLP4 12
INDIRI4
CNSTI4 15
EQI4 $229
ADDRLP4 24
CNSTI4 408
ASGNI4
CNSTI4 56
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 weaponData
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $229
line 665
;663:		weapon != WP_EMPLACED_GUN &&
;664:		weapon != WP_TURRET &&
;665:		self->client->ps.ammo[ weaponData[weapon].ammoIndex ] ) {
line 669
;666:		gentity_t *te;
;667:
;668:		// find the item type for this weapon
;669:		item = BG_FindItemForWeapon( weapon );
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
ASGNP4
line 672
;670:
;671:		// tell all clients to remove the weapon model on this guy until he respawns
;672:		te = G_TempEntity( vec3_origin, EV_DESTROY_WEAPON_MODEL );
ADDRGP4 vec3_origin
ARGP4
CNSTI4 91
ARGI4
ADDRLP4 36
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 36
INDIRP4
ASGNP4
line 673
;673:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 40
ADDRLP4 28
INDIRP4
CNSTI4 304
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
line 674
;674:		te->s.eventParm = self->s.number;
ADDRLP4 28
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 677
;675:
;676:		// spawn the item
;677:		Drop_Item( self, item, 0 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Drop_Item
CALLP4
pop
line 678
;678:	}
LABELV $229
line 681
;679:
;680:	// drop all the powerups if not in teamplay
;681:	if ( g_gametype.integer != GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
EQI4 $231
line 682
;682:		angle = 45;
ADDRLP4 16
CNSTF4 1110704128
ASGNF4
line 683
;683:		for ( i = 1 ; i < PW_NUM_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $234
line 684
;684:			if ( self->client->ps.powerups[ i ] > level.time ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $238
line 685
;685:				item = BG_FindItemForPowerup( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
ASGNP4
line 686
;686:				if ( !item ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $241
line 687
;687:					continue;
ADDRGP4 $235
JUMPV
LABELV $241
line 689
;688:				}
;689:				drop = Drop_Item( self, item, angle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 Drop_Item
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 691
;690:				// decide how many seconds it has left
;691:				drop->count = ( self->client->ps.powerups[ i ] - level.time ) / 1000;
ADDRLP4 4
INDIRP4
CNSTI4 712
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 692
;692:				if ( drop->count < 1 ) {
ADDRLP4 4
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 1
GEI4 $244
line 693
;693:					drop->count = 1;
ADDRLP4 4
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 1
ASGNI4
line 694
;694:				}
LABELV $244
line 695
;695:				angle += 45;
ADDRLP4 16
ADDRLP4 16
INDIRF4
CNSTF4 1110704128
ADDF4
ASGNF4
line 696
;696:			}
LABELV $238
line 697
;697:		}
LABELV $235
line 683
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $234
line 698
;698:	}
LABELV $231
line 699
;699:}
LABELV $222
endproc TossClientItems 44 12
export LookAtKiller
proc LookAtKiller 52 4
line 707
;700:
;701:
;702:/*
;703:==================
;704:LookAtKiller
;705:==================
;706:*/
;707:void LookAtKiller( gentity_t *self, gentity_t *inflictor, gentity_t *attacker ) {
line 711
;708:	vec3_t		dir;
;709:	vec3_t		angles;
;710:
;711:	if ( attacker && attacker != self ) {
ADDRLP4 24
ADDRFP4 8
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 24
INDIRU4
CNSTU4 0
EQU4 $247
ADDRLP4 24
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $247
line 712
;712:		VectorSubtract (attacker->s.pos.trBase, self->s.pos.trBase, dir);
ADDRLP4 28
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 24
ASGNI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
CNSTI4 28
ASGNI4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
CNSTI4 32
ASGNI4
ADDRLP4 0+8
ADDRFP4 8
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 713
;713:	} else if ( inflictor && inflictor != self ) {
ADDRGP4 $248
JUMPV
LABELV $247
ADDRLP4 28
ADDRFP4 4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 28
INDIRU4
CNSTU4 0
EQU4 $251
ADDRLP4 28
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $251
line 714
;714:		VectorSubtract (inflictor->s.pos.trBase, self->s.pos.trBase, dir);
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 24
ASGNI4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
CNSTI4 28
ASGNI4
ADDRLP4 0+4
ADDRLP4 32
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
CNSTI4 32
ASGNI4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 715
;715:	} else {
ADDRGP4 $252
JUMPV
LABELV $251
line 716
;716:		self->client->ps.stats[STAT_DEAD_YAW] = self->s.angles[YAW];
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 240
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 717
;717:		return;
ADDRGP4 $246
JUMPV
LABELV $252
LABELV $248
line 720
;718:	}
;719:
;720:	self->client->ps.stats[STAT_DEAD_YAW] = vectoyaw ( dir );
ADDRLP4 0
ARGP4
ADDRLP4 32
ADDRGP4 vectoyaw
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 240
ADDP4
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 722
;721:
;722:	angles[YAW] = vectoyaw ( dir );
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 vectoyaw
CALLF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 36
INDIRF4
ASGNF4
line 723
;723:	angles[PITCH] = 0; 
ADDRLP4 12
CNSTF4 0
ASGNF4
line 724
;724:	angles[ROLL] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 725
;725:}
LABELV $246
endproc LookAtKiller 52 4
export GibEntity
proc GibEntity 0 12
line 732
;726:
;727:/*
;728:==================
;729:GibEntity
;730:==================
;731:*/
;732:void GibEntity( gentity_t *self, int killer ) {
line 733
;733:	G_AddEvent( self, EV_GIB_PLAYER, killer );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 85
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 734
;734:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 735
;735:	self->s.eType = ET_INVISIBLE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 12
ASGNI4
line 736
;736:	self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 737
;737:}
LABELV $257
endproc GibEntity 0 12
export BodyRid
proc BodyRid 0 4
line 740
;738:
;739:void BodyRid(gentity_t *ent)
;740:{
line 741
;741:	trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 742
;742:	ent->physicsObject = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 0
ASGNI4
line 743
;743:}
LABELV $258
endproc BodyRid 0 4
export body_die
proc body_die 16 0
line 750
;744:
;745:/*
;746:==================
;747:body_die
;748:==================
;749:*/
;750:void body_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 752
;751:	// NOTENOTE No gibbing right now, this is star wars.
;752:	qboolean doDisint = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 754
;753:
;754:	if (self->health < (GIB_HEALTH+1))
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 -39
GEI4 $260
line 755
;755:	{
line 756
;756:		self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 -39
ASGNI4
line 758
;757:
;758:		if (self->client && (level.time - self->client->respawnTime) < 2000)
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $262
ADDRGP4 level+32
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1860
ADDP4
INDIRI4
SUBI4
CNSTI4 2000
GEI4 $262
line 759
;759:		{
line 760
;760:			doDisint = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 761
;761:		}
ADDRGP4 $263
JUMPV
LABELV $262
line 763
;762:		else
;763:		{
line 764
;764:			doDisint = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 765
;765:		}
LABELV $263
line 766
;766:	}
LABELV $260
line 768
;767:
;768:	if (self->client && (self->client->ps.eFlags & EF_DISINTEGRATION))
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $265
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $265
line 769
;769:	{
line 770
;770:		return;
ADDRGP4 $259
JUMPV
LABELV $265
line 772
;771:	}
;772:	else if (self->s.eFlags & EF_DISINTEGRATION)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $267
line 773
;773:	{
line 774
;774:		return;
ADDRGP4 $259
JUMPV
LABELV $267
line 777
;775:	}
;776:
;777:	if (doDisint)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $269
line 778
;778:	{
line 779
;779:		if (self->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $271
line 780
;780:		{
line 781
;781:			self->client->ps.eFlags |= EF_DISINTEGRATION;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 33554432
BORI4
ASGNI4
line 782
;782:			VectorCopy(self->client->ps.origin, self->client->ps.lastHitLoc);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1368
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 783
;783:		}
ADDRGP4 $259
JUMPV
LABELV $271
line 785
;784:		else
;785:		{
line 786
;786:			self->s.eFlags |= EF_DISINTEGRATION;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 33554432
BORI4
ASGNI4
line 787
;787:			VectorCopy(self->r.currentOrigin, self->s.origin2);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 790
;788:
;789:			//since it's the corpse entity, tell it to "remove" itself
;790:			self->think = BodyRid;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 BodyRid
ASGNP4
line 791
;791:			self->nextthink = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 792
;792:		}
line 793
;793:		return;
LABELV $269
line 795
;794:	}
;795:}
LABELV $259
endproc body_die 16 0
data
export modNames
align 4
LABELV modNames
address $274
address $275
address $276
address $277
address $278
address $279
address $280
address $281
address $282
address $283
address $284
address $285
address $286
address $287
address $288
address $289
address $290
address $291
address $292
address $293
address $294
address $295
address $296
address $297
address $298
address $299
address $300
address $301
address $302
address $303
address $304
address $305
address $306
address $307
address $308
address $309
address $310
address $311
export CheckAlmostCapture
code
proc CheckAlmostCapture 0 0
line 846
;796:
;797:
;798:// these are just for logging, the client prints its own messages
;799:char	*modNames[] = {
;800:	"MOD_UNKNOWN",
;801:	"MOD_STUN_BATON",
;802:	"MOD_MELEE",
;803:	"MOD_SABER",
;804:	"MOD_BRYAR_PISTOL",
;805:	"MOD_BRYAR_PISTOL_ALT",
;806:	"MOD_BLASTER",
;807:	"MOD_DISRUPTOR",
;808:	"MOD_DISRUPTOR_SPLASH",
;809:	"MOD_DISRUPTOR_SNIPER",
;810:	"MOD_BOWCASTER",
;811:	"MOD_REPEATER",
;812:	"MOD_REPEATER_ALT",
;813:	"MOD_REPEATER_ALT_SPLASH",
;814:	"MOD_DEMP2",
;815:	"MOD_DEMP2_ALT",
;816:	"MOD_FLECHETTE",
;817:	"MOD_FLECHETTE_ALT_SPLASH",
;818:	"MOD_ROCKET",
;819:	"MOD_ROCKET_SPLASH",
;820:	"MOD_ROCKET_HOMING",
;821:	"MOD_ROCKET_HOMING_SPLASH",
;822:	"MOD_THERMAL",
;823:	"MOD_THERMAL_SPLASH",
;824:	"MOD_TRIP_MINE_SPLASH",
;825:	"MOD_TIMED_MINE_SPLASH",
;826:	"MOD_DET_PACK_SPLASH",
;827:	"MOD_FORCE_DARK",
;828:	"MOD_SENTRY",
;829:	"MOD_WATER",
;830:	"MOD_SLIME",
;831:	"MOD_LAVA",
;832:	"MOD_CRUSH",
;833:	"MOD_TELEFRAG",
;834:	"MOD_FALLING",
;835:	"MOD_SUICIDE",
;836:	"MOD_TARGET_LASER",
;837:	"MOD_TRIGGER_HURT"
;838:};
;839:
;840:
;841:/*
;842:==================
;843:CheckAlmostCapture
;844:==================
;845:*/
;846:void CheckAlmostCapture( gentity_t *self, gentity_t *attacker ) {
line 891
;847:#if 0
;848:	gentity_t	*ent;
;849:	vec3_t		dir;
;850:	char		*classname;
;851:
;852:	// if this player was carrying a flag
;853:	if ( self->client->ps.powerups[PW_REDFLAG] ||
;854:		self->client->ps.powerups[PW_BLUEFLAG] ||
;855:		self->client->ps.powerups[PW_NEUTRALFLAG] ) {
;856:		// get the goal flag this player should have been going for
;857:		if ( g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY ) {
;858:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
;859:				classname = "team_CTF_blueflag";
;860:			}
;861:			else {
;862:				classname = "team_CTF_redflag";
;863:			}
;864:		}
;865:		else {
;866:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
;867:				classname = "team_CTF_redflag";
;868:			}
;869:			else {
;870:				classname = "team_CTF_blueflag";
;871:			}
;872:		}
;873:		ent = NULL;
;874:		do
;875:		{
;876:			ent = G_Find(ent, FOFS(classname), classname);
;877:		} while (ent && (ent->flags & FL_DROPPED_ITEM));
;878:		// if we found the destination flag and it's not picked up
;879:		if (ent && !(ent->r.svFlags & SVF_NOCLIENT) ) {
;880:			// if the player was *very* close
;881:			VectorSubtract( self->client->ps.origin, ent->s.origin, dir );
;882:			if ( VectorLength(dir) < 200 ) {
;883:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
;884:				if ( attacker->client ) {
;885:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
;886:				}
;887:			}
;888:		}
;889:	}
;890:#endif
;891:}
LABELV $312
endproc CheckAlmostCapture 0 0
export G_InKnockDown
proc G_InKnockDown 8 0
line 894
;892:
;893:qboolean G_InKnockDown( playerState_t *ps )
;894:{
line 895
;895:	switch ( (ps->legsAnim&~ANIM_TOGGLEBIT) )
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 924
LTI4 $314
ADDRLP4 0
INDIRI4
CNSTI4 942
GTI4 $314
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $319-3696
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $319
address $317
address $317
address $317
address $317
address $317
address $318
address $318
address $318
address $318
address $318
address $314
address $314
address $318
address $318
address $318
address $318
address $318
address $318
address $318
code
line 896
;896:	{
LABELV $317
line 902
;897:	case BOTH_KNOCKDOWN1:
;898:	case BOTH_KNOCKDOWN2:
;899:	case BOTH_KNOCKDOWN3:
;900:	case BOTH_KNOCKDOWN4:
;901:	case BOTH_KNOCKDOWN5:
;902:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $313
JUMPV
line 903
;903:		break;
LABELV $318
line 916
;904:	case BOTH_GETUP1:
;905:	case BOTH_GETUP2:
;906:	case BOTH_GETUP3:
;907:	case BOTH_GETUP4:
;908:	case BOTH_GETUP5:
;909:	case BOTH_FORCE_GETUP_F1:
;910:	case BOTH_FORCE_GETUP_F2:
;911:	case BOTH_FORCE_GETUP_B1:
;912:	case BOTH_FORCE_GETUP_B2:
;913:	case BOTH_FORCE_GETUP_B3:
;914:	case BOTH_FORCE_GETUP_B4:
;915:	case BOTH_FORCE_GETUP_B5:
;916:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $313
JUMPV
line 917
;917:		break;
LABELV $314
line 919
;918:	}
;919:	return qfalse;
CNSTI4 0
RETI4
LABELV $313
endproc G_InKnockDown 8 0
proc G_CheckSpecialDeathAnim 64 16
line 923
;920:}
;921:
;922:static int G_CheckSpecialDeathAnim( gentity_t *self, vec3_t point, int damage, int mod, int hitLoc )
;923:{
line 924
;924:	int deathAnim = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 926
;925:
;926:	if ( BG_InRoll( &self->client->ps, self->client->ps.legsAnim ) )
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $322
line 927
;927:	{
line 928
;928:		deathAnim = BOTH_DEATH_ROLL;		//# Death anim from a roll
ADDRLP4 0
CNSTI4 37
ASGNI4
line 929
;929:	}
ADDRGP4 $323
JUMPV
LABELV $322
line 930
;930:	else if ( BG_FlippingAnim( self->client->ps.legsAnim ) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $324
line 931
;931:	{
line 932
;932:		deathAnim = BOTH_DEATH_FLIP;		//# Death anim from a flip
ADDRLP4 0
CNSTI4 38
ASGNI4
line 933
;933:	}
ADDRGP4 $325
JUMPV
LABELV $324
line 934
;934:	else if ( G_InKnockDown( &self->client->ps ) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_InKnockDown
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $326
line 935
;935:	{//since these happen a lot, let's handle them case by case
line 936
;936:		int animLength = bgGlobalAnimations[self->client->ps.legsAnim&~ANIM_TOGGLEBIT].numFrames * fabs(bgGlobalAnimations[self->client->ps.legsAnim&~ANIM_TOGGLEBIT].frameLerp);
ADDRLP4 24
CNSTI4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 bgGlobalAnimations+12
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 24
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 28
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 937
;937:		switch ( self->client->ps.legsAnim&~ANIM_TOGGLEBIT )
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 924
LTI4 $330
ADDRLP4 32
INDIRI4
CNSTI4 943
GTI4 $330
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $493-3696
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $493
address $333
address $338
address $343
address $348
address $357
address $360
address $371
address $382
address $393
address $404
address $418
address $409
address $481
address $488
address $427
address $440
address $451
address $456
address $461
address $468
code
line 938
;938:		{
LABELV $333
line 940
;939:		case BOTH_KNOCKDOWN1:
;940:			if ( animLength - self->client->ps.legsTimer > 100 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 100
LEI4 $331
line 941
;941:			{//on our way down
line 942
;942:				if ( self->client->ps.legsTimer > 600 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 600
LEI4 $336
line 943
;943:				{//still partially up
line 944
;944:					deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 945
;945:				}
ADDRGP4 $331
JUMPV
LABELV $336
line 947
;946:				else
;947:				{//down
line 948
;948:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 949
;949:				}
line 950
;950:			}
line 951
;951:			break;
ADDRGP4 $331
JUMPV
LABELV $338
line 953
;952:		case BOTH_KNOCKDOWN2:
;953:			if ( animLength - self->client->ps.legsTimer > 700 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 700
LEI4 $331
line 954
;954:			{//on our way down
line 955
;955:				if ( self->client->ps.legsTimer > 600 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 600
LEI4 $341
line 956
;956:				{//still partially up
line 957
;957:					deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 958
;958:				}
ADDRGP4 $331
JUMPV
LABELV $341
line 960
;959:				else
;960:				{//down
line 961
;961:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 962
;962:				}
line 963
;963:			}
line 964
;964:			break;
ADDRGP4 $331
JUMPV
LABELV $343
line 966
;965:		case BOTH_KNOCKDOWN3:
;966:			if ( animLength - self->client->ps.legsTimer > 100 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 100
LEI4 $331
line 967
;967:			{//on our way down
line 968
;968:				if ( self->client->ps.legsTimer > 1300 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1300
LEI4 $346
line 969
;969:				{//still partially up
line 970
;970:					deathAnim = BOTH_DEATH_FALLING_DN;
ADDRLP4 0
CNSTI4 44
ASGNI4
line 971
;971:				}
ADDRGP4 $331
JUMPV
LABELV $346
line 973
;972:				else
;973:				{//down
line 974
;974:					deathAnim = BOTH_DEATH_LYING_DN;
ADDRLP4 0
CNSTI4 43
ASGNI4
line 975
;975:				}
line 976
;976:			}
line 977
;977:			break;
ADDRGP4 $331
JUMPV
LABELV $348
line 979
;978:		case BOTH_KNOCKDOWN4:
;979:			if ( animLength - self->client->ps.legsTimer > 300 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 300
LEI4 $349
line 980
;980:			{//on our way down
line 981
;981:				if ( self->client->ps.legsTimer > 350 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 350
LEI4 $351
line 982
;982:				{//still partially up
line 983
;983:					deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 984
;984:				}
ADDRGP4 $331
JUMPV
LABELV $351
line 986
;985:				else
;986:				{//down
line 987
;987:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 988
;988:				}
line 989
;989:			}
ADDRGP4 $331
JUMPV
LABELV $349
line 991
;990:			else
;991:			{//crouch death
line 993
;992:				vec3_t fwd;
;993:				float thrown = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 995
;994:
;995:				AngleVectors( self->client->ps.viewangles, fwd, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 44
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
line 996
;996:				thrown = DotProduct( fwd, self->client->ps.velocity );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 998
;997:
;998:				if ( thrown < -150 )
ADDRLP4 40
INDIRF4
CNSTF4 3272998912
GEF4 $355
line 999
;999:				{
line 1000
;1000:					deathAnim = BOTH_DEATHBACKWARD1;	//# Death anim when crouched and thrown back
ADDRLP4 0
CNSTI4 29
ASGNI4
line 1001
;1001:				}
ADDRGP4 $331
JUMPV
LABELV $355
line 1003
;1002:				else
;1003:				{
line 1004
;1004:					deathAnim = BOTH_DEATH_CROUCHED;	//# Death anim when crouched
ADDRLP4 0
CNSTI4 46
ASGNI4
line 1005
;1005:				}
line 1006
;1006:			}
line 1007
;1007:			break;
ADDRGP4 $331
JUMPV
LABELV $357
line 1009
;1008:		case BOTH_KNOCKDOWN5:
;1009:			if ( self->client->ps.legsTimer < 750 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 750
GEI4 $331
line 1010
;1010:			{//flat
line 1011
;1011:				deathAnim = BOTH_DEATH_LYING_DN;
ADDRLP4 0
CNSTI4 43
ASGNI4
line 1012
;1012:			}
line 1013
;1013:			break;
ADDRGP4 $331
JUMPV
LABELV $360
line 1015
;1014:		case BOTH_GETUP1:
;1015:			if ( self->client->ps.legsTimer < 350 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 350
GEI4 $361
line 1016
;1016:			{//standing up
line 1017
;1017:			}
ADDRGP4 $331
JUMPV
LABELV $361
line 1018
;1018:			else if ( self->client->ps.legsTimer < 800 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 800
GEI4 $363
line 1019
;1019:			{//crouching
line 1021
;1020:				vec3_t fwd;
;1021:				float thrown = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1023
;1022:
;1023:				AngleVectors( self->client->ps.viewangles, fwd, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 44
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
line 1024
;1024:				thrown = DotProduct( fwd, self->client->ps.velocity );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1025
;1025:				if ( thrown < -150 )
ADDRLP4 40
INDIRF4
CNSTF4 3272998912
GEF4 $367
line 1026
;1026:				{
line 1027
;1027:					deathAnim = BOTH_DEATHBACKWARD1;	//# Death anim when crouched and thrown back
ADDRLP4 0
CNSTI4 29
ASGNI4
line 1028
;1028:				}
ADDRGP4 $331
JUMPV
LABELV $367
line 1030
;1029:				else
;1030:				{
line 1031
;1031:					deathAnim = BOTH_DEATH_CROUCHED;	//# Death anim when crouched
ADDRLP4 0
CNSTI4 46
ASGNI4
line 1032
;1032:				}
line 1033
;1033:			}
ADDRGP4 $331
JUMPV
LABELV $363
line 1035
;1034:			else
;1035:			{//lying down
line 1036
;1036:				if ( animLength - self->client->ps.legsTimer > 450 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 450
LEI4 $369
line 1037
;1037:				{//partially up
line 1038
;1038:					deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 1039
;1039:				}
ADDRGP4 $331
JUMPV
LABELV $369
line 1041
;1040:				else
;1041:				{//down
line 1042
;1042:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 1043
;1043:				}
line 1044
;1044:			}
line 1045
;1045:			break;
ADDRGP4 $331
JUMPV
LABELV $371
line 1047
;1046:		case BOTH_GETUP2:
;1047:			if ( self->client->ps.legsTimer < 150 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 150
GEI4 $372
line 1048
;1048:			{//standing up
line 1049
;1049:			}
ADDRGP4 $331
JUMPV
LABELV $372
line 1050
;1050:			else if ( self->client->ps.legsTimer < 850 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 850
GEI4 $374
line 1051
;1051:			{//crouching
line 1053
;1052:				vec3_t fwd;
;1053:				float thrown = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1055
;1054:
;1055:				AngleVectors( self->client->ps.viewangles, fwd, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 44
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
line 1056
;1056:				thrown = DotProduct( fwd, self->client->ps.velocity );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1058
;1057:
;1058:				if ( thrown < -150 )
ADDRLP4 40
INDIRF4
CNSTF4 3272998912
GEF4 $378
line 1059
;1059:				{
line 1060
;1060:					deathAnim = BOTH_DEATHBACKWARD1;	//# Death anim when crouched and thrown back
ADDRLP4 0
CNSTI4 29
ASGNI4
line 1061
;1061:				}
ADDRGP4 $331
JUMPV
LABELV $378
line 1063
;1062:				else
;1063:				{
line 1064
;1064:					deathAnim = BOTH_DEATH_CROUCHED;	//# Death anim when crouched
ADDRLP4 0
CNSTI4 46
ASGNI4
line 1065
;1065:				}
line 1066
;1066:			}
ADDRGP4 $331
JUMPV
LABELV $374
line 1068
;1067:			else
;1068:			{//lying down
line 1069
;1069:				if ( animLength - self->client->ps.legsTimer > 500 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 500
LEI4 $380
line 1070
;1070:				{//partially up
line 1071
;1071:					deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 1072
;1072:				}
ADDRGP4 $331
JUMPV
LABELV $380
line 1074
;1073:				else
;1074:				{//down
line 1075
;1075:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 1076
;1076:				}
line 1077
;1077:			}
line 1078
;1078:			break;
ADDRGP4 $331
JUMPV
LABELV $382
line 1080
;1079:		case BOTH_GETUP3:
;1080:			if ( self->client->ps.legsTimer < 250 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 250
GEI4 $383
line 1081
;1081:			{//standing up
line 1082
;1082:			}
ADDRGP4 $331
JUMPV
LABELV $383
line 1083
;1083:			else if ( self->client->ps.legsTimer < 600 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 600
GEI4 $385
line 1084
;1084:			{//crouching
line 1086
;1085:				vec3_t fwd;
;1086:				float thrown = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1087
;1087:				AngleVectors( self->client->ps.viewangles, fwd, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 44
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
line 1088
;1088:				thrown = DotProduct( fwd, self->client->ps.velocity );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1090
;1089:
;1090:				if ( thrown < -150 )
ADDRLP4 40
INDIRF4
CNSTF4 3272998912
GEF4 $389
line 1091
;1091:				{
line 1092
;1092:					deathAnim = BOTH_DEATHBACKWARD1;	//# Death anim when crouched and thrown back
ADDRLP4 0
CNSTI4 29
ASGNI4
line 1093
;1093:				}
ADDRGP4 $331
JUMPV
LABELV $389
line 1095
;1094:				else
;1095:				{
line 1096
;1096:					deathAnim = BOTH_DEATH_CROUCHED;	//# Death anim when crouched
ADDRLP4 0
CNSTI4 46
ASGNI4
line 1097
;1097:				}
line 1098
;1098:			}
ADDRGP4 $331
JUMPV
LABELV $385
line 1100
;1099:			else
;1100:			{//lying down
line 1101
;1101:				if ( animLength - self->client->ps.legsTimer > 150 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 150
LEI4 $391
line 1102
;1102:				{//partially up
line 1103
;1103:					deathAnim = BOTH_DEATH_FALLING_DN;
ADDRLP4 0
CNSTI4 44
ASGNI4
line 1104
;1104:				}
ADDRGP4 $331
JUMPV
LABELV $391
line 1106
;1105:				else
;1106:				{//down
line 1107
;1107:					deathAnim = BOTH_DEATH_LYING_DN;
ADDRLP4 0
CNSTI4 43
ASGNI4
line 1108
;1108:				}
line 1109
;1109:			}
line 1110
;1110:			break;
ADDRGP4 $331
JUMPV
LABELV $393
line 1112
;1111:		case BOTH_GETUP4:
;1112:			if ( self->client->ps.legsTimer < 250 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 250
GEI4 $394
line 1113
;1113:			{//standing up
line 1114
;1114:			}
ADDRGP4 $331
JUMPV
LABELV $394
line 1115
;1115:			else if ( self->client->ps.legsTimer < 600 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 600
GEI4 $396
line 1116
;1116:			{//crouching
line 1118
;1117:				vec3_t fwd;
;1118:				float thrown = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1120
;1119:
;1120:				AngleVectors( self->client->ps.viewangles, fwd, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 44
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
line 1121
;1121:				thrown = DotProduct( fwd, self->client->ps.velocity );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1123
;1122:
;1123:				if ( thrown < -150 )
ADDRLP4 40
INDIRF4
CNSTF4 3272998912
GEF4 $400
line 1124
;1124:				{
line 1125
;1125:					deathAnim = BOTH_DEATHBACKWARD1;	//# Death anim when crouched and thrown back
ADDRLP4 0
CNSTI4 29
ASGNI4
line 1126
;1126:				}
ADDRGP4 $331
JUMPV
LABELV $400
line 1128
;1127:				else
;1128:				{
line 1129
;1129:					deathAnim = BOTH_DEATH_CROUCHED;	//# Death anim when crouched
ADDRLP4 0
CNSTI4 46
ASGNI4
line 1130
;1130:				}
line 1131
;1131:			}
ADDRGP4 $331
JUMPV
LABELV $396
line 1133
;1132:			else
;1133:			{//lying down
line 1134
;1134:				if ( animLength - self->client->ps.legsTimer > 850 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 850
LEI4 $402
line 1135
;1135:				{//partially up
line 1136
;1136:					deathAnim = BOTH_DEATH_FALLING_DN;
ADDRLP4 0
CNSTI4 44
ASGNI4
line 1137
;1137:				}
ADDRGP4 $331
JUMPV
LABELV $402
line 1139
;1138:				else
;1139:				{//down
line 1140
;1140:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 1141
;1141:				}
line 1142
;1142:			}
line 1143
;1143:			break;
ADDRGP4 $331
JUMPV
LABELV $404
line 1145
;1144:		case BOTH_GETUP5:
;1145:			if ( self->client->ps.legsTimer > 850 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 850
LEI4 $331
line 1146
;1146:			{//lying down
line 1147
;1147:				if ( animLength - self->client->ps.legsTimer > 1500 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 1500
LEI4 $407
line 1148
;1148:				{//partially up
line 1149
;1149:					deathAnim = BOTH_DEATH_FALLING_DN;
ADDRLP4 0
CNSTI4 44
ASGNI4
line 1150
;1150:				}
ADDRGP4 $331
JUMPV
LABELV $407
line 1152
;1151:				else
;1152:				{//down
line 1153
;1153:					deathAnim = BOTH_DEATH_LYING_DN;
ADDRLP4 0
CNSTI4 43
ASGNI4
line 1154
;1154:				}
line 1155
;1155:			}
line 1156
;1156:			break;
ADDRGP4 $331
JUMPV
LABELV $409
line 1158
;1157:		case BOTH_GETUP_CROUCH_B1:
;1158:			if ( self->client->ps.legsTimer < 800 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 800
GEI4 $410
line 1159
;1159:			{//crouching
line 1161
;1160:				vec3_t fwd;
;1161:				float thrown = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1163
;1162:
;1163:				AngleVectors( self->client->ps.viewangles, fwd, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 44
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
line 1164
;1164:				thrown = DotProduct( fwd, self->client->ps.velocity );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1166
;1165:
;1166:				if ( thrown < -150 )
ADDRLP4 40
INDIRF4
CNSTF4 3272998912
GEF4 $414
line 1167
;1167:				{
line 1168
;1168:					deathAnim = BOTH_DEATHBACKWARD1;	//# Death anim when crouched and thrown back
ADDRLP4 0
CNSTI4 29
ASGNI4
line 1169
;1169:				}
ADDRGP4 $331
JUMPV
LABELV $414
line 1171
;1170:				else
;1171:				{
line 1172
;1172:					deathAnim = BOTH_DEATH_CROUCHED;	//# Death anim when crouched
ADDRLP4 0
CNSTI4 46
ASGNI4
line 1173
;1173:				}
line 1174
;1174:			}
ADDRGP4 $331
JUMPV
LABELV $410
line 1176
;1175:			else
;1176:			{//lying down
line 1177
;1177:				if ( animLength - self->client->ps.legsTimer > 400 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 400
LEI4 $416
line 1178
;1178:				{//partially up
line 1179
;1179:					deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 1180
;1180:				}
ADDRGP4 $331
JUMPV
LABELV $416
line 1182
;1181:				else
;1182:				{//down
line 1183
;1183:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 1184
;1184:				}
line 1185
;1185:			}
line 1186
;1186:			break;
ADDRGP4 $331
JUMPV
LABELV $418
line 1188
;1187:		case BOTH_GETUP_CROUCH_F1:
;1188:			if ( self->client->ps.legsTimer < 800 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 800
GEI4 $419
line 1189
;1189:			{//crouching
line 1191
;1190:				vec3_t fwd;
;1191:				float thrown = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1193
;1192:
;1193:				AngleVectors( self->client->ps.viewangles, fwd, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 44
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
line 1194
;1194:				thrown = DotProduct( fwd, self->client->ps.velocity );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1196
;1195:
;1196:				if ( thrown < -150 )
ADDRLP4 40
INDIRF4
CNSTF4 3272998912
GEF4 $423
line 1197
;1197:				{
line 1198
;1198:					deathAnim = BOTH_DEATHBACKWARD1;	//# Death anim when crouched and thrown back
ADDRLP4 0
CNSTI4 29
ASGNI4
line 1199
;1199:				}
ADDRGP4 $331
JUMPV
LABELV $423
line 1201
;1200:				else
;1201:				{
line 1202
;1202:					deathAnim = BOTH_DEATH_CROUCHED;	//# Death anim when crouched
ADDRLP4 0
CNSTI4 46
ASGNI4
line 1203
;1203:				}
line 1204
;1204:			}
ADDRGP4 $331
JUMPV
LABELV $419
line 1206
;1205:			else
;1206:			{//lying down
line 1207
;1207:				if ( animLength - self->client->ps.legsTimer > 150 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 150
LEI4 $425
line 1208
;1208:				{//partially up
line 1209
;1209:					deathAnim = BOTH_DEATH_FALLING_DN;
ADDRLP4 0
CNSTI4 44
ASGNI4
line 1210
;1210:				}
ADDRGP4 $331
JUMPV
LABELV $425
line 1212
;1211:				else
;1212:				{//down
line 1213
;1213:					deathAnim = BOTH_DEATH_LYING_DN;
ADDRLP4 0
CNSTI4 43
ASGNI4
line 1214
;1214:				}
line 1215
;1215:			}
line 1216
;1216:			break;
ADDRGP4 $331
JUMPV
LABELV $427
line 1218
;1217:		case BOTH_FORCE_GETUP_B1:
;1218:			if ( self->client->ps.legsTimer < 325 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 325
GEI4 $428
line 1219
;1219:			{//standing up
line 1220
;1220:			}
ADDRGP4 $331
JUMPV
LABELV $428
line 1221
;1221:			else if ( self->client->ps.legsTimer < 725 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 725
GEI4 $430
line 1222
;1222:			{//spinning up
line 1223
;1223:				deathAnim = BOTH_DEATH_SPIN_180;	//# Death anim when facing backwards
ADDRLP4 0
CNSTI4 41
ASGNI4
line 1224
;1224:			}
ADDRGP4 $331
JUMPV
LABELV $430
line 1225
;1225:			else if ( self->client->ps.legsTimer < 900 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 900
GEI4 $432
line 1226
;1226:			{//crouching
line 1228
;1227:				vec3_t fwd;
;1228:				float thrown = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1230
;1229:
;1230:				AngleVectors( self->client->ps.viewangles, fwd, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 44
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
line 1231
;1231:				thrown = DotProduct( fwd, self->client->ps.velocity );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1233
;1232:
;1233:				if ( thrown < -150 )
ADDRLP4 40
INDIRF4
CNSTF4 3272998912
GEF4 $436
line 1234
;1234:				{
line 1235
;1235:					deathAnim = BOTH_DEATHBACKWARD1;	//# Death anim when crouched and thrown back
ADDRLP4 0
CNSTI4 29
ASGNI4
line 1236
;1236:				}
ADDRGP4 $331
JUMPV
LABELV $436
line 1238
;1237:				else
;1238:				{
line 1239
;1239:					deathAnim = BOTH_DEATH_CROUCHED;	//# Death anim when crouched
ADDRLP4 0
CNSTI4 46
ASGNI4
line 1240
;1240:				}
line 1241
;1241:			}
ADDRGP4 $331
JUMPV
LABELV $432
line 1243
;1242:			else
;1243:			{//lying down
line 1244
;1244:				if ( animLength - self->client->ps.legsTimer > 50 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 50
LEI4 $438
line 1245
;1245:				{//partially up
line 1246
;1246:					deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 1247
;1247:				}
ADDRGP4 $331
JUMPV
LABELV $438
line 1249
;1248:				else
;1249:				{//down
line 1250
;1250:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 1251
;1251:				}
line 1252
;1252:			}
line 1253
;1253:			break;
ADDRGP4 $331
JUMPV
LABELV $440
line 1255
;1254:		case BOTH_FORCE_GETUP_B2:
;1255:			if ( self->client->ps.legsTimer < 575 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 575
GEI4 $441
line 1256
;1256:			{//standing up
line 1257
;1257:			}
ADDRGP4 $331
JUMPV
LABELV $441
line 1258
;1258:			else if ( self->client->ps.legsTimer < 875 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 875
GEI4 $443
line 1259
;1259:			{//spinning up
line 1260
;1260:				deathAnim = BOTH_DEATH_SPIN_180;	//# Death anim when facing backwards
ADDRLP4 0
CNSTI4 41
ASGNI4
line 1261
;1261:			}
ADDRGP4 $331
JUMPV
LABELV $443
line 1262
;1262:			else if ( self->client->ps.legsTimer < 900 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 900
GEI4 $445
line 1263
;1263:			{//crouching
line 1265
;1264:				vec3_t fwd;
;1265:				float thrown = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1267
;1266:
;1267:				AngleVectors( self->client->ps.viewangles, fwd, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 44
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
line 1268
;1268:				thrown = DotProduct( fwd, self->client->ps.velocity );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1270
;1269:
;1270:				if ( thrown < -150 )
ADDRLP4 40
INDIRF4
CNSTF4 3272998912
GEF4 $449
line 1271
;1271:				{
line 1272
;1272:					deathAnim = BOTH_DEATHBACKWARD1;	//# Death anim when crouched and thrown back
ADDRLP4 0
CNSTI4 29
ASGNI4
line 1273
;1273:				}
ADDRGP4 $331
JUMPV
LABELV $449
line 1275
;1274:				else
;1275:				{
line 1276
;1276:					deathAnim = BOTH_DEATH_CROUCHED;	//# Death anim when crouched
ADDRLP4 0
CNSTI4 46
ASGNI4
line 1277
;1277:				}
line 1278
;1278:			}
ADDRGP4 $331
JUMPV
LABELV $445
line 1280
;1279:			else
;1280:			{//lying down
line 1282
;1281:				//partially up
;1282:				deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 1283
;1283:			}
line 1284
;1284:			break;
ADDRGP4 $331
JUMPV
LABELV $451
line 1286
;1285:		case BOTH_FORCE_GETUP_B3:
;1286:			if ( self->client->ps.legsTimer < 150 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 150
GEI4 $452
line 1287
;1287:			{//standing up
line 1288
;1288:			}
ADDRGP4 $331
JUMPV
LABELV $452
line 1289
;1289:			else if ( self->client->ps.legsTimer < 775 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 775
GEI4 $454
line 1290
;1290:			{//flipping
line 1291
;1291:				deathAnim = BOTH_DEATHBACKWARD2; //backflip
ADDRLP4 0
CNSTI4 30
ASGNI4
line 1292
;1292:			}
ADDRGP4 $331
JUMPV
LABELV $454
line 1294
;1293:			else
;1294:			{//lying down
line 1296
;1295:				//partially up
;1296:				deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 1297
;1297:			}
line 1298
;1298:			break;
ADDRGP4 $331
JUMPV
LABELV $456
line 1300
;1299:		case BOTH_FORCE_GETUP_B4:
;1300:			if ( self->client->ps.legsTimer < 325 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 325
GEI4 $457
line 1301
;1301:			{//standing up
line 1302
;1302:			}
ADDRGP4 $331
JUMPV
LABELV $457
line 1304
;1303:			else
;1304:			{//lying down
line 1305
;1305:				if ( animLength - self->client->ps.legsTimer > 150 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 150
LEI4 $459
line 1306
;1306:				{//partially up
line 1307
;1307:					deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 1308
;1308:				}
ADDRGP4 $331
JUMPV
LABELV $459
line 1310
;1309:				else
;1310:				{//down
line 1311
;1311:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 1312
;1312:				}
line 1313
;1313:			}
line 1314
;1314:			break;
ADDRGP4 $331
JUMPV
LABELV $461
line 1316
;1315:		case BOTH_FORCE_GETUP_B5:
;1316:			if ( self->client->ps.legsTimer < 550 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 550
GEI4 $462
line 1317
;1317:			{//standing up
line 1318
;1318:			}
ADDRGP4 $331
JUMPV
LABELV $462
line 1319
;1319:			else if ( self->client->ps.legsTimer < 1025 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1025
GEI4 $464
line 1320
;1320:			{//kicking up
line 1321
;1321:				deathAnim = BOTH_DEATHBACKWARD2; //backflip
ADDRLP4 0
CNSTI4 30
ASGNI4
line 1322
;1322:			}
ADDRGP4 $331
JUMPV
LABELV $464
line 1324
;1323:			else
;1324:			{//lying down
line 1325
;1325:				if ( animLength - self->client->ps.legsTimer > 50 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 50
LEI4 $466
line 1326
;1326:				{//partially up
line 1327
;1327:					deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 1328
;1328:				}
ADDRGP4 $331
JUMPV
LABELV $466
line 1330
;1329:				else
;1330:				{//down
line 1331
;1331:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 1332
;1332:				}
line 1333
;1333:			}
line 1334
;1334:			break;
ADDRGP4 $331
JUMPV
LABELV $468
line 1336
;1335:		case BOTH_FORCE_GETUP_B6:
;1336:			if ( self->client->ps.legsTimer < 225 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 225
GEI4 $469
line 1337
;1337:			{//standing up
line 1338
;1338:			}
ADDRGP4 $331
JUMPV
LABELV $469
line 1339
;1339:			else if ( self->client->ps.legsTimer < 425 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 425
GEI4 $471
line 1340
;1340:			{//crouching up
line 1342
;1341:				vec3_t fwd;
;1342:				float thrown = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1344
;1343:
;1344:				AngleVectors( self->client->ps.viewangles, fwd, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 44
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
line 1345
;1345:				thrown = DotProduct( fwd, self->client->ps.velocity );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1347
;1346:
;1347:				if ( thrown < -150 )
ADDRLP4 40
INDIRF4
CNSTF4 3272998912
GEF4 $475
line 1348
;1348:				{
line 1349
;1349:					deathAnim = BOTH_DEATHBACKWARD1;	//# Death anim when crouched and thrown back
ADDRLP4 0
CNSTI4 29
ASGNI4
line 1350
;1350:				}
ADDRGP4 $331
JUMPV
LABELV $475
line 1352
;1351:				else
;1352:				{
line 1353
;1353:					deathAnim = BOTH_DEATH_CROUCHED;	//# Death anim when crouched
ADDRLP4 0
CNSTI4 46
ASGNI4
line 1354
;1354:				}
line 1355
;1355:			}
ADDRGP4 $331
JUMPV
LABELV $471
line 1356
;1356:			else if ( self->client->ps.legsTimer < 825 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 825
GEI4 $477
line 1357
;1357:			{//flipping up
line 1358
;1358:				deathAnim = BOTH_DEATHFORWARD3; //backflip
ADDRLP4 0
CNSTI4 28
ASGNI4
line 1359
;1359:			}
ADDRGP4 $331
JUMPV
LABELV $477
line 1361
;1360:			else
;1361:			{//lying down
line 1362
;1362:				if ( animLength - self->client->ps.legsTimer > 225 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 225
LEI4 $479
line 1363
;1363:				{//partially up
line 1364
;1364:					deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 1365
;1365:				}
ADDRGP4 $331
JUMPV
LABELV $479
line 1367
;1366:				else
;1367:				{//down
line 1368
;1368:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 1369
;1369:				}
line 1370
;1370:			}
line 1371
;1371:			break;
ADDRGP4 $331
JUMPV
LABELV $481
line 1373
;1372:		case BOTH_FORCE_GETUP_F1:
;1373:			if ( self->client->ps.legsTimer < 275 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 275
GEI4 $482
line 1374
;1374:			{//standing up
line 1375
;1375:			}
ADDRGP4 $331
JUMPV
LABELV $482
line 1376
;1376:			else if ( self->client->ps.legsTimer < 750 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 750
GEI4 $484
line 1377
;1377:			{//flipping
line 1378
;1378:				deathAnim = BOTH_DEATH14;
ADDRLP4 0
CNSTI4 14
ASGNI4
line 1379
;1379:			}
ADDRGP4 $331
JUMPV
LABELV $484
line 1381
;1380:			else
;1381:			{//lying down
line 1382
;1382:				if ( animLength - self->client->ps.legsTimer > 100 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 100
LEI4 $486
line 1383
;1383:				{//partially up
line 1384
;1384:					deathAnim = BOTH_DEATH_FALLING_DN;
ADDRLP4 0
CNSTI4 44
ASGNI4
line 1385
;1385:				}
ADDRGP4 $331
JUMPV
LABELV $486
line 1387
;1386:				else
;1387:				{//down
line 1388
;1388:					deathAnim = BOTH_DEATH_LYING_DN;
ADDRLP4 0
CNSTI4 43
ASGNI4
line 1389
;1389:				}
line 1390
;1390:			}
line 1391
;1391:			break;
ADDRGP4 $331
JUMPV
LABELV $488
line 1393
;1392:		case BOTH_FORCE_GETUP_F2:
;1393:			if ( self->client->ps.legsTimer < 1200 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1200
GEI4 $489
line 1394
;1394:			{//standing
line 1395
;1395:			}
ADDRGP4 $331
JUMPV
LABELV $489
line 1397
;1396:			else
;1397:			{//lying down
line 1398
;1398:				if ( animLength - self->client->ps.legsTimer > 225 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 225
LEI4 $491
line 1399
;1399:				{//partially up
line 1400
;1400:					deathAnim = BOTH_DEATH_FALLING_DN;
ADDRLP4 0
CNSTI4 44
ASGNI4
line 1401
;1401:				}
ADDRGP4 $331
JUMPV
LABELV $491
line 1403
;1402:				else
;1403:				{//down
line 1404
;1404:					deathAnim = BOTH_DEATH_LYING_DN;
ADDRLP4 0
CNSTI4 43
ASGNI4
line 1405
;1405:				}
line 1406
;1406:			}
line 1407
;1407:			break;
LABELV $330
LABELV $331
line 1409
;1408:		}
;1409:	}
LABELV $326
LABELV $325
LABELV $323
line 1411
;1410:
;1411:	return deathAnim;
ADDRLP4 0
INDIRI4
RETI4
LABELV $321
endproc G_CheckSpecialDeathAnim 64 16
export G_PickDeathAnim
proc G_PickDeathAnim 92 20
line 1415
;1412:}
;1413:
;1414:int G_PickDeathAnim( gentity_t *self, vec3_t point, int damage, int mod, int hitLoc )
;1415:{//FIXME: play dead flop anims on body if in an appropriate _DEAD anim when this func is called
line 1416
;1416:	int deathAnim = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 1418
;1417:	int max_health;
;1418:	int legAnim = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1421
;1419:	vec3_t objVelocity;
;1420:
;1421:	if (!self || !self->client)
ADDRLP4 24
ADDRFP4 0
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
EQU4 $498
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
NEU4 $496
LABELV $498
line 1422
;1422:	{
line 1423
;1423:		if (!self || self->s.eType != ET_GRAPPLE)
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $501
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
EQI4 $499
LABELV $501
line 1424
;1424:		{ //g2animent
line 1425
;1425:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $495
JUMPV
LABELV $499
line 1427
;1426:		}
;1427:	}
LABELV $496
line 1429
;1428:
;1429:	if (self->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $502
line 1430
;1430:	{
line 1431
;1431:		max_health = self->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1432
;1432:	}
ADDRGP4 $503
JUMPV
LABELV $502
line 1434
;1433:	else
;1434:	{
line 1435
;1435:		max_health = 60;
ADDRLP4 8
CNSTI4 60
ASGNI4
line 1436
;1436:	}
LABELV $503
line 1438
;1437:
;1438:	if (self->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $504
line 1439
;1439:	{
line 1440
;1440:		VectorCopy(self->client->ps.velocity, objVelocity);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 1441
;1441:	}
ADDRGP4 $505
JUMPV
LABELV $504
line 1443
;1442:	else
;1443:	{
line 1444
;1444:		VectorCopy(self->s.pos.trDelta, objVelocity);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1445
;1445:	}
LABELV $505
line 1447
;1446:
;1447:	if ( hitLoc == HL_NONE )
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $506
line 1448
;1448:	{
line 1449
;1449:		hitLoc = G_GetHitLocation( self, point );//self->hitLoc
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 G_GetHitLocation
CALLI4
ASGNI4
ADDRFP4 16
ADDRLP4 32
INDIRI4
ASGNI4
line 1450
;1450:	}
LABELV $506
line 1452
;1451:
;1452:	if (self->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $508
line 1453
;1453:	{
line 1454
;1454:		legAnim = self->client->ps.legsAnim;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 1455
;1455:	}
ADDRGP4 $509
JUMPV
LABELV $508
line 1457
;1456:	else
;1457:	{
line 1458
;1458:		legAnim = self->s.legsAnim;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ASGNI4
line 1459
;1459:	}
LABELV $509
line 1461
;1460:
;1461:	if (gGAvoidDismember)
ADDRGP4 gGAvoidDismember
INDIRI4
CNSTI4 0
EQI4 $510
line 1462
;1462:	{
line 1463
;1463:		return BOTH_RIGHTHANDCHOPPEDOFF;
CNSTI4 952
RETI4
ADDRGP4 $495
JUMPV
LABELV $510
line 1467
;1464:	}
;1465:
;1466:	//dead flops
;1467:	switch( legAnim&~ANIM_TOGGLEBIT )
ADDRLP4 32
ADDRLP4 4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 1
LTI4 $512
ADDRLP4 32
INDIRI4
CNSTI4 79
GTI4 $512
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $519-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $519
address $515
address $515
address $518
address $518
address $518
address $518
address $518
address $515
address $518
address $516
address $518
address $518
address $515
address $515
address $516
address $515
address $518
address $518
address $518
address $512
address $512
address $512
address $512
address $512
address $512
address $518
address $518
address $512
address $518
address $518
address $518
address $518
address $518
address $518
address $518
address $518
address $512
address $512
address $512
address $512
address $512
address $512
address $512
address $512
address $512
address $512
address $515
address $515
address $518
address $518
address $518
address $518
address $518
address $515
address $518
address $516
address $518
address $518
address $515
address $515
address $516
address $515
address $518
address $518
address $518
address $512
address $512
address $512
address $512
address $512
address $512
address $516
address $516
address $515
address $515
address $518
address $518
address $518
address $517
code
line 1468
;1468:	{
LABELV $515
line 1483
;1469:	case BOTH_DEATH1:		//# First Death anim
;1470:	case BOTH_DEAD1:
;1471:	case BOTH_DEATH2:			//# Second Death anim
;1472:	case BOTH_DEAD2:
;1473:	case BOTH_DEATH8:			//# 
;1474:	case BOTH_DEAD8:
;1475:	case BOTH_DEATH13:			//# 
;1476:	case BOTH_DEAD13:
;1477:	case BOTH_DEATH14:			//# 
;1478:	case BOTH_DEAD14:
;1479:	case BOTH_DEATH16:			//# 
;1480:	case BOTH_DEAD16:
;1481:	case BOTH_DEADBACKWARD1:		//# First thrown backward death finished pose
;1482:	case BOTH_DEADBACKWARD2:		//# Second thrown backward death finished pose
;1483:		deathAnim = -2;
ADDRLP4 0
CNSTI4 -2
ASGNI4
LABELV $516
line 1504
;1484:		/*
;1485:		if ( PM_FinishedCurrentLegsAnim( self ) )
;1486:		{//done with the anim
;1487:			deathAnim = BOTH_DEADFLOP2;
;1488:		}
;1489:		else
;1490:		{
;1491:			deathAnim = -2;
;1492:		}
;1493:		break;
;1494:	case BOTH_DEADFLOP2:
;1495:		deathAnim = BOTH_DEADFLOP2;
;1496:		break;
;1497:		*/
;1498:	case BOTH_DEATH10:			//# 
;1499:	case BOTH_DEAD10:
;1500:	case BOTH_DEATH15:			//# 
;1501:	case BOTH_DEAD15:
;1502:	case BOTH_DEADFORWARD1:		//# First thrown forward death finished pose
;1503:	case BOTH_DEADFORWARD2:		//# Second thrown forward death finished pose
;1504:		deathAnim = -2;
ADDRLP4 0
CNSTI4 -2
ASGNI4
LABELV $517
line 1517
;1505:		/*
;1506:		if ( PM_FinishedCurrentLegsAnim( self ) )
;1507:		{//done with the anim
;1508:			deathAnim = BOTH_DEADFLOP1;
;1509:		}
;1510:		else
;1511:		{
;1512:			deathAnim = -2;
;1513:		}
;1514:		break;
;1515:		*/
;1516:	case BOTH_DEADFLOP1:
;1517:		deathAnim = -2;
ADDRLP4 0
CNSTI4 -2
ASGNI4
line 1519
;1518:		//deathAnim = BOTH_DEADFLOP1;
;1519:		break;
ADDRGP4 $513
JUMPV
LABELV $518
line 1555
;1520:	case BOTH_DEAD3:				//# Third Death finished pose
;1521:	case BOTH_DEAD4:				//# Fourth Death finished pose
;1522:	case BOTH_DEAD5:				//# Fifth Death finished pose
;1523:	case BOTH_DEAD6:				//# Sixth Death finished pose
;1524:	case BOTH_DEAD7:				//# Seventh Death finished pose
;1525:	case BOTH_DEAD9:				//# 
;1526:	case BOTH_DEAD11:			//#
;1527:	case BOTH_DEAD12:			//# 
;1528:	case BOTH_DEAD17:			//# 
;1529:	case BOTH_DEAD18:			//# 
;1530:	case BOTH_DEAD19:			//# 
;1531:	case BOTH_LYINGDEAD1:		//# Killed lying down death finished pose
;1532:	case BOTH_STUMBLEDEAD1:		//# Stumble forward death finished pose
;1533:	case BOTH_FALLDEAD1LAND:		//# Fall forward and splat death finished pose
;1534:	case BOTH_DEATH3:			//# Third Death anim
;1535:	case BOTH_DEATH4:			//# Fourth Death anim
;1536:	case BOTH_DEATH5:			//# Fifth Death anim
;1537:	case BOTH_DEATH6:			//# Sixth Death anim
;1538:	case BOTH_DEATH7:			//# Seventh Death anim
;1539:	case BOTH_DEATH9:			//# 
;1540:	case BOTH_DEATH11:			//#
;1541:	case BOTH_DEATH12:			//# 
;1542:	case BOTH_DEATH17:			//# 
;1543:	case BOTH_DEATH18:			//# 
;1544:	case BOTH_DEATH19:			//# 
;1545:	case BOTH_DEATHFORWARD1:		//# First Death in which they get thrown forward
;1546:	case BOTH_DEATHFORWARD2:		//# Second Death in which they get thrown forward
;1547:	case BOTH_DEATHBACKWARD1:	//# First Death in which they get thrown backward
;1548:	case BOTH_DEATHBACKWARD2:	//# Second Death in which they get thrown backward
;1549:	case BOTH_DEATH1IDLE:		//# Idle while close to death
;1550:	case BOTH_LYINGDEATH1:		//# Death to play when killed lying down
;1551:	case BOTH_STUMBLEDEATH1:		//# Stumble forward and fall face first death
;1552:	case BOTH_FALLDEATH1:		//# Fall forward off a high cliff and splat death - start
;1553:	case BOTH_FALLDEATH1INAIR:	//# Fall forward off a high cliff and splat death - loop
;1554:	case BOTH_FALLDEATH1LAND:	//# Fall forward off a high cliff and splat death - hit bottom
;1555:		deathAnim = -2;
ADDRLP4 0
CNSTI4 -2
ASGNI4
line 1556
;1556:		break;
LABELV $512
LABELV $513
line 1558
;1557:	}
;1558:	if ( deathAnim == -1 )
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $521
line 1559
;1559:	{
line 1560
;1560:		if (self->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $523
line 1561
;1561:		{
line 1562
;1562:			deathAnim = G_CheckSpecialDeathAnim( self, point, damage, mod, hitLoc );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 G_CheckSpecialDeathAnim
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 40
INDIRI4
ASGNI4
line 1563
;1563:		}
LABELV $523
line 1565
;1564:
;1565:		if (deathAnim == -1)
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $525
line 1566
;1566:		{
line 1568
;1567:			//death anims
;1568:			switch( hitLoc )
ADDRLP4 40
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 1
LTI4 $528
ADDRLP4 40
INDIRI4
CNSTI4 16
GTI4 $528
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $598-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $598
address $529
address $529
address $536
address $541
address $583
address $553
address $568
address $546
address $553
address $568
address $583
address $553
address $568
address $553
address $568
address $595
code
line 1569
;1569:			{
LABELV $529
line 1572
;1570:			case HL_FOOT_RT:
;1571:			case HL_FOOT_LT:
;1572:				if ( mod == MOD_SABER && !Q_irand( 0, 2 ) )
ADDRFP4 12
INDIRI4
CNSTI4 3
NEI4 $530
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 44
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $530
line 1573
;1573:				{
line 1574
;1574:					return BOTH_DEATH10;//chest: back flip
CNSTI4 10
RETI4
ADDRGP4 $495
JUMPV
LABELV $530
line 1576
;1575:				}
;1576:				else if ( !Q_irand( 0, 2 ) )
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 48
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $532
line 1577
;1577:				{
line 1578
;1578:					deathAnim = BOTH_DEATH4;//back: forward
ADDRLP4 0
CNSTI4 4
ASGNI4
line 1579
;1579:				}
ADDRGP4 $528
JUMPV
LABELV $532
line 1580
;1580:				else if ( !Q_irand( 0, 1 ) )
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 52
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $534
line 1581
;1581:				{
line 1582
;1582:					deathAnim = BOTH_DEATH5;//same as 4
ADDRLP4 0
CNSTI4 5
ASGNI4
line 1583
;1583:				}
ADDRGP4 $528
JUMPV
LABELV $534
line 1585
;1584:				else
;1585:				{
line 1586
;1586:					deathAnim = BOTH_DEATH15;//back: forward
ADDRLP4 0
CNSTI4 15
ASGNI4
line 1587
;1587:				}
line 1588
;1588:				break;
ADDRGP4 $528
JUMPV
LABELV $536
line 1590
;1589:			case HL_LEG_RT:
;1590:				if ( !Q_irand( 0, 2 ) )
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 56
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $537
line 1591
;1591:				{
line 1592
;1592:					deathAnim = BOTH_DEATH4;//back: forward
ADDRLP4 0
CNSTI4 4
ASGNI4
line 1593
;1593:				}
ADDRGP4 $528
JUMPV
LABELV $537
line 1594
;1594:				else if ( !Q_irand( 0, 1 ) )
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 60
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $539
line 1595
;1595:				{
line 1596
;1596:					deathAnim = BOTH_DEATH5;//same as 4
ADDRLP4 0
CNSTI4 5
ASGNI4
line 1597
;1597:				}
ADDRGP4 $528
JUMPV
LABELV $539
line 1599
;1598:				else
;1599:				{
line 1600
;1600:					deathAnim = BOTH_DEATH15;//back: forward
ADDRLP4 0
CNSTI4 15
ASGNI4
line 1601
;1601:				}
line 1602
;1602:				break;
ADDRGP4 $528
JUMPV
LABELV $541
line 1604
;1603:			case HL_LEG_LT:
;1604:				if ( !Q_irand( 0, 2 ) )
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 64
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $542
line 1605
;1605:				{
line 1606
;1606:					deathAnim = BOTH_DEATH4;//back: forward
ADDRLP4 0
CNSTI4 4
ASGNI4
line 1607
;1607:				}
ADDRGP4 $528
JUMPV
LABELV $542
line 1608
;1608:				else if ( !Q_irand( 0, 1 ) )
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 68
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $544
line 1609
;1609:				{
line 1610
;1610:					deathAnim = BOTH_DEATH5;//same as 4
ADDRLP4 0
CNSTI4 5
ASGNI4
line 1611
;1611:				}
ADDRGP4 $528
JUMPV
LABELV $544
line 1613
;1612:				else
;1613:				{
line 1614
;1614:					deathAnim = BOTH_DEATH15;//back: forward
ADDRLP4 0
CNSTI4 15
ASGNI4
line 1615
;1615:				}
line 1616
;1616:				break;
ADDRGP4 $528
JUMPV
LABELV $546
line 1618
;1617:			case HL_BACK:
;1618:				if ( !VectorLengthSquared( objVelocity ) )
ADDRLP4 12
ARGP4
ADDRLP4 72
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 72
INDIRF4
CNSTF4 0
NEF4 $547
line 1619
;1619:				{
line 1620
;1620:					deathAnim = BOTH_DEATH17;//head/back: croak
ADDRLP4 0
CNSTI4 17
ASGNI4
line 1621
;1621:				}
ADDRGP4 $528
JUMPV
LABELV $547
line 1623
;1622:				else
;1623:				{
line 1624
;1624:					if ( !Q_irand( 0, 2 ) )
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 76
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $549
line 1625
;1625:					{
line 1626
;1626:						deathAnim = BOTH_DEATH4;//back: forward
ADDRLP4 0
CNSTI4 4
ASGNI4
line 1627
;1627:					}
ADDRGP4 $528
JUMPV
LABELV $549
line 1628
;1628:					else if ( !Q_irand( 0, 1 ) )
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 80
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $551
line 1629
;1629:					{
line 1630
;1630:						deathAnim = BOTH_DEATH5;//same as 4
ADDRLP4 0
CNSTI4 5
ASGNI4
line 1631
;1631:					}
ADDRGP4 $528
JUMPV
LABELV $551
line 1633
;1632:					else
;1633:					{
line 1634
;1634:						deathAnim = BOTH_DEATH15;//back: forward
ADDRLP4 0
CNSTI4 15
ASGNI4
line 1635
;1635:					}
line 1636
;1636:				}
line 1637
;1637:				break;
ADDRGP4 $528
JUMPV
LABELV $553
line 1642
;1638:			case HL_CHEST_RT:
;1639:			case HL_ARM_RT:
;1640:			case HL_HAND_RT:
;1641:			case HL_BACK_RT:
;1642:				if ( damage <= max_health*0.25 )
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1048576000
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
GTF4 $554
line 1643
;1643:				{
line 1644
;1644:					deathAnim = BOTH_DEATH9;//chest right: snap, fall forward
ADDRLP4 0
CNSTI4 9
ASGNI4
line 1645
;1645:				}
ADDRGP4 $528
JUMPV
LABELV $554
line 1646
;1646:				else if ( damage <= max_health*0.5 )
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
GTF4 $556
line 1647
;1647:				{
line 1648
;1648:					deathAnim = BOTH_DEATH3;//chest right: back
ADDRLP4 0
CNSTI4 3
ASGNI4
line 1649
;1649:				}
ADDRGP4 $528
JUMPV
LABELV $556
line 1650
;1650:				else if ( damage <= max_health*0.75 )
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1061158912
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
GTF4 $558
line 1651
;1651:				{
line 1652
;1652:					deathAnim = BOTH_DEATH6;//chest right: spin
ADDRLP4 0
CNSTI4 6
ASGNI4
line 1653
;1653:				}
ADDRGP4 $528
JUMPV
LABELV $558
line 1655
;1654:				else 
;1655:				{
line 1657
;1656:					//TEMP HACK: play spinny deaths less often
;1657:					if ( Q_irand( 0, 1 ) )
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 76
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $560
line 1658
;1658:					{
line 1659
;1659:						deathAnim = BOTH_DEATH8;//chest right: spin high
ADDRLP4 0
CNSTI4 8
ASGNI4
line 1660
;1660:					}
ADDRGP4 $528
JUMPV
LABELV $560
line 1662
;1661:					else
;1662:					{
line 1663
;1663:						switch ( Q_irand( 0, 2 ) )
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 84
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 84
INDIRI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $565
ADDRLP4 80
INDIRI4
CNSTI4 1
EQI4 $566
ADDRLP4 80
INDIRI4
CNSTI4 2
EQI4 $567
ADDRGP4 $562
JUMPV
line 1664
;1664:						{
LABELV $562
LABELV $565
line 1667
;1665:						default:
;1666:						case 0:
;1667:							deathAnim = BOTH_DEATH9;//chest right: snap, fall forward
ADDRLP4 0
CNSTI4 9
ASGNI4
line 1668
;1668:							break;
ADDRGP4 $528
JUMPV
LABELV $566
line 1670
;1669:						case 1:
;1670:							deathAnim = BOTH_DEATH3;//chest right: back
ADDRLP4 0
CNSTI4 3
ASGNI4
line 1671
;1671:							break;
ADDRGP4 $528
JUMPV
LABELV $567
line 1673
;1672:						case 2:
;1673:							deathAnim = BOTH_DEATH6;//chest right: spin
ADDRLP4 0
CNSTI4 6
ASGNI4
line 1674
;1674:							break;
line 1676
;1675:						}
;1676:					}
line 1677
;1677:				}
line 1678
;1678:				break;
ADDRGP4 $528
JUMPV
LABELV $568
line 1683
;1679:			case HL_CHEST_LT:
;1680:			case HL_ARM_LT:
;1681:			case HL_HAND_LT:
;1682:			case HL_BACK_LT:
;1683:				if ( damage <= max_health*0.25 )
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1048576000
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
GTF4 $569
line 1684
;1684:				{
line 1685
;1685:					deathAnim = BOTH_DEATH11;//chest left: snap, fall forward
ADDRLP4 0
CNSTI4 11
ASGNI4
line 1686
;1686:				}
ADDRGP4 $528
JUMPV
LABELV $569
line 1687
;1687:				else if ( damage <= max_health*0.5 )
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
GTF4 $571
line 1688
;1688:				{
line 1689
;1689:					deathAnim = BOTH_DEATH7;//chest left: back
ADDRLP4 0
CNSTI4 7
ASGNI4
line 1690
;1690:				}
ADDRGP4 $528
JUMPV
LABELV $571
line 1691
;1691:				else if ( damage <= max_health*0.75 )
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1061158912
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
GTF4 $573
line 1692
;1692:				{
line 1693
;1693:					deathAnim = BOTH_DEATH12;//chest left: spin
ADDRLP4 0
CNSTI4 12
ASGNI4
line 1694
;1694:				}
ADDRGP4 $528
JUMPV
LABELV $573
line 1696
;1695:				else
;1696:				{
line 1698
;1697:					//TEMP HACK: play spinny deaths less often
;1698:					if ( Q_irand( 0, 1 ) )
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 76
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $575
line 1699
;1699:					{
line 1700
;1700:						deathAnim = BOTH_DEATH14;//chest left: spin high
ADDRLP4 0
CNSTI4 14
ASGNI4
line 1701
;1701:					}
ADDRGP4 $528
JUMPV
LABELV $575
line 1703
;1702:					else
;1703:					{
line 1704
;1704:						switch ( Q_irand( 0, 2 ) )
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 84
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 84
INDIRI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $580
ADDRLP4 80
INDIRI4
CNSTI4 1
EQI4 $581
ADDRLP4 80
INDIRI4
CNSTI4 2
EQI4 $582
ADDRGP4 $577
JUMPV
line 1705
;1705:						{
LABELV $577
LABELV $580
line 1708
;1706:						default:
;1707:						case 0:
;1708:							deathAnim = BOTH_DEATH11;//chest left: snap, fall forward
ADDRLP4 0
CNSTI4 11
ASGNI4
line 1709
;1709:							break;
ADDRGP4 $528
JUMPV
LABELV $581
line 1711
;1710:						case 1:
;1711:							deathAnim = BOTH_DEATH7;//chest left: back
ADDRLP4 0
CNSTI4 7
ASGNI4
line 1712
;1712:							break;
ADDRGP4 $528
JUMPV
LABELV $582
line 1714
;1713:						case 2:
;1714:							deathAnim = BOTH_DEATH12;//chest left: spin
ADDRLP4 0
CNSTI4 12
ASGNI4
line 1715
;1715:							break;
line 1717
;1716:						}
;1717:					}
line 1718
;1718:				}
line 1719
;1719:				break;
ADDRGP4 $528
JUMPV
LABELV $583
line 1722
;1720:			case HL_CHEST:
;1721:			case HL_WAIST:
;1722:				if ( damage <= max_health*0.25 || !VectorLengthSquared( objVelocity ) )
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1048576000
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
LEF4 $586
ADDRLP4 12
ARGP4
ADDRLP4 76
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 76
INDIRF4
CNSTF4 0
NEF4 $584
LABELV $586
line 1723
;1723:				{
line 1724
;1724:					if ( !Q_irand( 0, 1 ) )
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 80
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $587
line 1725
;1725:					{
line 1726
;1726:						deathAnim = BOTH_DEATH18;//gut: fall right
ADDRLP4 0
CNSTI4 18
ASGNI4
line 1727
;1727:					}
ADDRGP4 $528
JUMPV
LABELV $587
line 1729
;1728:					else
;1729:					{
line 1730
;1730:						deathAnim = BOTH_DEATH19;//gut: fall left
ADDRLP4 0
CNSTI4 19
ASGNI4
line 1731
;1731:					}
line 1732
;1732:				}
ADDRGP4 $528
JUMPV
LABELV $584
line 1733
;1733:				else if ( damage <= max_health*0.5 )
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
GTF4 $589
line 1734
;1734:				{
line 1735
;1735:					deathAnim = BOTH_DEATH2;//chest: backward short
ADDRLP4 0
CNSTI4 2
ASGNI4
line 1736
;1736:				}
ADDRGP4 $528
JUMPV
LABELV $589
line 1737
;1737:				else if ( damage <= max_health*0.75 )
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1061158912
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
GTF4 $591
line 1738
;1738:				{
line 1739
;1739:					if ( !Q_irand( 0, 1 ) )
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 80
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $593
line 1740
;1740:					{
line 1741
;1741:						deathAnim = BOTH_DEATH1;//chest: backward med
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1742
;1742:					}
ADDRGP4 $528
JUMPV
LABELV $593
line 1744
;1743:					else
;1744:					{
line 1745
;1745:						deathAnim = BOTH_DEATH16;//same as 1
ADDRLP4 0
CNSTI4 16
ASGNI4
line 1746
;1746:					}
line 1747
;1747:				}
ADDRGP4 $528
JUMPV
LABELV $591
line 1749
;1748:				else
;1749:				{
line 1750
;1750:					deathAnim = BOTH_DEATH10;//chest: back flip
ADDRLP4 0
CNSTI4 10
ASGNI4
line 1751
;1751:				}
line 1752
;1752:				break;
ADDRGP4 $528
JUMPV
LABELV $595
line 1754
;1753:			case HL_HEAD:
;1754:				if ( damage <= max_health*0.5 )
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
GTF4 $596
line 1755
;1755:				{
line 1756
;1756:					deathAnim = BOTH_DEATH17;//head/back: croak
ADDRLP4 0
CNSTI4 17
ASGNI4
line 1757
;1757:				}
ADDRGP4 $528
JUMPV
LABELV $596
line 1759
;1758:				else
;1759:				{
line 1760
;1760:					deathAnim = BOTH_DEATH13;//head: stumble, fall back
ADDRLP4 0
CNSTI4 13
ASGNI4
line 1761
;1761:				}
line 1762
;1762:				break;
line 1764
;1763:			default:
;1764:				break;
LABELV $528
line 1766
;1765:			}
;1766:		}
LABELV $525
line 1767
;1767:	}
LABELV $521
line 1768
;1768:	return deathAnim;
ADDRLP4 0
INDIRI4
RETI4
LABELV $495
endproc G_PickDeathAnim 92 20
export G_GetJediMaster
proc G_GetJediMaster 24 0
line 1772
;1769:}
;1770:
;1771:gentity_t *G_GetJediMaster(void)
;1772:{
line 1773
;1773:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $602
JUMPV
LABELV $601
line 1777
;1774:	gentity_t *ent;
;1775:
;1776:	while (i < MAX_CLIENTS)
;1777:	{
line 1778
;1778:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 852
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1780
;1779:
;1780:		if (ent && ent->inuse && ent->client && ent->client->ps.isJediMaster)
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $604
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $604
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
ADDRLP4 12
INDIRU4
EQU4 $604
ADDRLP4 20
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $604
line 1781
;1781:		{
line 1782
;1782:			return ent;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $600
JUMPV
LABELV $604
line 1785
;1783:		}
;1784:
;1785:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1786
;1786:	}
LABELV $602
line 1776
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $601
line 1788
;1787:
;1788:	return NULL;
CNSTP4 0
RETP4
LABELV $600
endproc G_GetJediMaster 24 0
bss
align 4
LABELV $765
skip 4
export player_die
code
proc player_die 164 28
line 1797
;1789:}
;1790:
;1791:/*
;1792:==================
;1793:player_die
;1794:==================
;1795:*/
;1796:extern stringID_table_t animTable[MAX_ANIMATIONS+1];
;1797:void player_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 1804
;1798:	gentity_t	*ent;
;1799:	int			anim;
;1800:	int			contents;
;1801:	int			killer;
;1802:	int			i;
;1803:	char		*killerName, *obit;
;1804:	qboolean	wasJediMaster = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1806
;1805:
;1806:	if ( self->client->ps.pm_type == PM_DEAD ) {
ADDRLP4 32
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $607
line 1807
;1807:		return;
ADDRGP4 $606
JUMPV
LABELV $607
line 1810
;1808:	}
;1809:
;1810:	if ( level.intermissiontime ) {
ADDRGP4 level+9008
INDIRI4
CNSTI4 0
EQI4 $609
line 1811
;1811:		return;
ADDRGP4 $606
JUMPV
LABELV $609
line 1814
;1812:	}
;1813:
;1814:	if (g_slowmoDuelEnd.integer && g_gametype.integer == GT_TOURNAMENT && attacker && attacker->inuse && attacker->client)
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 g_slowmoDuelEnd+12
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $612
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $612
ADDRLP4 40
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 44
CNSTU4 0
ASGNU4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRU4
EQU4 $612
ADDRLP4 40
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $612
ADDRLP4 40
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRU4
EQU4 $612
line 1815
;1815:	{
line 1816
;1816:		if (!gDoSlowMoDuel)
ADDRGP4 gDoSlowMoDuel
INDIRI4
CNSTI4 0
NEI4 $616
line 1817
;1817:		{
line 1818
;1818:			gDoSlowMoDuel = qtrue;
ADDRGP4 gDoSlowMoDuel
CNSTI4 1
ASGNI4
line 1819
;1819:			gSlowMoDuelTime = level.time;
ADDRGP4 gSlowMoDuelTime
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1820
;1820:		}
LABELV $616
line 1821
;1821:	}
LABELV $612
line 1823
;1822:
;1823:	if (inflictor && inflictor->activator && !inflictor->client && !attacker->client &&
ADDRLP4 48
ADDRFP4 4
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
EQU4 $619
ADDRLP4 56
ADDRLP4 48
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
EQU4 $619
ADDRLP4 60
CNSTI4 408
ASGNI4
ADDRLP4 48
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
NEU4 $619
ADDRFP4 8
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
NEU4 $619
ADDRLP4 56
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
EQU4 $619
ADDRLP4 56
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $619
ADDRLP4 48
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 15
NEI4 $619
line 1826
;1824:		inflictor->activator->client && inflictor->activator->inuse &&
;1825:		inflictor->s.weapon == WP_TURRET)
;1826:	{
line 1827
;1827:		attacker = inflictor->activator;
ADDRFP4 8
ADDRFP4 4
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
ASGNP4
line 1828
;1828:	}
LABELV $619
line 1830
;1829:
;1830:	if (self->client && self->client->ps.isJediMaster)
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $621
ADDRLP4 64
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $621
line 1831
;1831:	{
line 1832
;1832:		wasJediMaster = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 1833
;1833:	}
LABELV $621
line 1836
;1834:
;1835:	//if he was charging or anything else, kill the sound
;1836:	G_MuteSound(self->s.number, CHAN_WEAPON);
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 1838
;1837:
;1838:	BlowDetpacks(self); //blow detpacks if they're planted
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BlowDetpacks
CALLV
pop
line 1840
;1839:
;1840:	self->client->ps.fd.forceDeactivateAll = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1196
ADDP4
CNSTI4 1
ASGNI4
line 1842
;1841:
;1842:	if ((self == attacker || !attacker->client) &&
ADDRLP4 68
ADDRFP4 8
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRP4
CVPU4 4
EQU4 $626
ADDRLP4 68
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $623
LABELV $626
ADDRLP4 72
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 32
EQI4 $629
ADDRLP4 72
INDIRI4
CNSTI4 34
EQI4 $629
ADDRLP4 72
INDIRI4
CNSTI4 37
EQI4 $629
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $623
LABELV $629
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $623
line 1845
;1843:		(meansOfDeath == MOD_CRUSH || meansOfDeath == MOD_FALLING || meansOfDeath == MOD_TRIGGER_HURT || meansOfDeath == MOD_UNKNOWN) &&
;1844:		self->client->ps.otherKillerTime > level.time)
;1845:	{
line 1846
;1846:		attacker = &g_entities[self->client->ps.otherKiller];
ADDRFP4 8
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1847
;1847:	}
LABELV $623
line 1850
;1848:
;1849:	// check for an almost capture
;1850:	CheckAlmostCapture( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostCapture
CALLV
pop
line 1852
;1851:
;1852:	self->client->ps.pm_type = PM_DEAD;
ADDRLP4 76
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
line 1854
;1853:
;1854:	if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $630
line 1855
;1855:		killer = attacker->s.number;
ADDRLP4 4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1856
;1856:		if ( attacker->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $632
line 1857
;1857:			killerName = attacker->client->pers.netname;
ADDRLP4 20
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ASGNP4
line 1858
;1858:		} else {
ADDRGP4 $631
JUMPV
LABELV $632
line 1859
;1859:			killerName = "<non-client>";
ADDRLP4 20
ADDRGP4 $634
ASGNP4
line 1860
;1860:		}
line 1861
;1861:	} else {
ADDRGP4 $631
JUMPV
LABELV $630
line 1862
;1862:		killer = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 1863
;1863:		killerName = "<world>";
ADDRLP4 20
ADDRGP4 $635
ASGNP4
line 1864
;1864:	}
LABELV $631
line 1866
;1865:
;1866:	if ( killer < 0 || killer >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $638
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $636
LABELV $638
line 1867
;1867:		killer = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 1868
;1868:		killerName = "<world>";
ADDRLP4 20
ADDRGP4 $635
ASGNP4
line 1869
;1869:	}
LABELV $636
line 1871
;1870:
;1871:	if ( meansOfDeath < 0 || meansOfDeath >= sizeof( modNames ) / sizeof( modNames[0] ) ) {
ADDRLP4 84
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
LTI4 $641
ADDRLP4 84
INDIRI4
CVIU4 4
CNSTU4 38
LTU4 $639
LABELV $641
line 1872
;1872:		obit = "<bad obituary>";
ADDRLP4 28
ADDRGP4 $642
ASGNP4
line 1873
;1873:	} else {
ADDRGP4 $640
JUMPV
LABELV $639
line 1874
;1874:		obit = modNames[ meansOfDeath ];
ADDRLP4 28
ADDRFP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 modNames
ADDP4
INDIRP4
ASGNP4
line 1875
;1875:	}
LABELV $640
line 1877
;1876:
;1877:	G_LogPrintf("Kill: %i %i %i: %s killed %s by %s\n", 
ADDRGP4 $643
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1881
;1878:		killer, self->s.number, meansOfDeath, killerName, 
;1879:		self->client->pers.netname, obit );
;1880:
;1881:	if ( g_austrian.integer 
ADDRGP4 g_austrian+12
INDIRI4
CNSTI4 0
EQI4 $644
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $644
ADDRGP4 level+80
INDIRI4
CNSTI4 2
LTI4 $644
line 1884
;1882:		&& g_gametype.integer == GT_TOURNAMENT 
;1883:		&& level.numPlayingClients >= 2 )
;1884:	{
line 1885
;1885:		int spawnTime = (level.clients[level.sortedClients[0]].respawnTime > level.clients[level.sortedClients[1]].respawnTime) ? level.clients[level.sortedClients[0]].respawnTime : level.clients[level.sortedClients[1]].respawnTime;
ADDRLP4 100
CNSTI4 3024
ASGNI4
ADDRLP4 104
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 108
CNSTI4 1860
ASGNI4
ADDRLP4 100
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 104
INDIRP4
ADDP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRI4
ADDRLP4 100
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 104
INDIRP4
ADDP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRI4
LEI4 $656
ADDRLP4 96
CNSTI4 3024
ADDRGP4 level+84
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1860
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $657
JUMPV
LABELV $656
ADDRLP4 96
CNSTI4 3024
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1860
ADDP4
INDIRI4
ASGNI4
LABELV $657
ADDRLP4 92
ADDRLP4 96
INDIRI4
ASGNI4
line 1886
;1886:		G_LogPrintf("Duel Kill Details:\n");
ADDRGP4 $658
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1887
;1887:		G_LogPrintf("Kill Time: %d\n", level.time-spawnTime );
ADDRGP4 $659
ARGP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 92
INDIRI4
SUBI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1888
;1888:		G_LogPrintf("victim: %s, hits on enemy %d\n", self->client->pers.netname, self->client->ps.persistant[PERS_HITS] );
ADDRGP4 $661
ARGP4
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 112
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1889
;1889:		if ( attacker && attacker->client )
ADDRLP4 116
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 120
CNSTU4 0
ASGNU4
ADDRLP4 116
INDIRP4
CVPU4 4
ADDRLP4 120
INDIRU4
EQU4 $662
ADDRLP4 116
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 120
INDIRU4
EQU4 $662
line 1890
;1890:		{
line 1891
;1891:			G_LogPrintf("killer: %s, hits on enemy %d, health: %d\n", attacker->client->pers.netname, attacker->client->ps.persistant[PERS_HITS], attacker->health );
ADDRGP4 $664
ARGP4
ADDRLP4 124
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 128
ADDRLP4 124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 128
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 124
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1893
;1892:			//also - if MOD_SABER, list the animation and saber style
;1893:			if ( meansOfDeath == MOD_SABER )
ADDRFP4 16
INDIRI4
CNSTI4 3
NEI4 $665
line 1894
;1894:			{
line 1895
;1895:				G_LogPrintf("killer saber style: %d, killer saber anim %s\n", attacker->client->ps.fd.saberAnimLevel, animTable[(attacker->client->ps.torsoAnim&~ANIM_TOGGLEBIT)].name );
ADDRGP4 $667
ARGP4
ADDRLP4 132
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 3
LSHI4
ADDRGP4 animTable
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1896
;1896:			}
LABELV $665
line 1897
;1897:		}
LABELV $662
line 1898
;1898:	}
LABELV $644
line 1900
;1899:
;1900:	G_LogWeaponKill(killer, meansOfDeath);
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_LogWeaponKill
CALLV
pop
line 1901
;1901:	G_LogWeaponDeath(self->s.number, self->s.weapon);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
INDIRI4
ARGI4
ADDRLP4 92
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_LogWeaponDeath
CALLV
pop
line 1902
;1902:	if (attacker && attacker->client && attacker->inuse)
ADDRLP4 96
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 100
CNSTU4 0
ASGNU4
ADDRLP4 96
INDIRP4
CVPU4 4
ADDRLP4 100
INDIRU4
EQU4 $668
ADDRLP4 96
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 100
INDIRU4
EQU4 $668
ADDRLP4 96
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $668
line 1903
;1903:	{
line 1904
;1904:		G_LogWeaponFrag(killer, self->s.number);
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 G_LogWeaponFrag
CALLV
pop
line 1905
;1905:	}
LABELV $668
line 1908
;1906:
;1907:	// broadcast the death event to everyone
;1908:	ent = G_TempEntity( self->r.currentOrigin, EV_OBITUARY );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 81
ARGI4
ADDRLP4 104
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 104
INDIRP4
ASGNP4
line 1909
;1909:	ent->s.eventParm = meansOfDeath;
ADDRLP4 8
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 1910
;1910:	ent->s.otherEntityNum = self->s.number;
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1911
;1911:	ent->s.otherEntityNum2 = killer;
ADDRLP4 8
INDIRP4
CNSTI4 188
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1912
;1912:	ent->r.svFlags = SVF_BROADCAST;	// send to everyone
ADDRLP4 8
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 32
ASGNI4
line 1913
;1913:	ent->s.isJediMaster = wasJediMaster;
ADDRLP4 8
INDIRP4
CNSTI4 244
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1915
;1914:
;1915:	self->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1917
;1916:
;1917:	self->client->ps.persistant[PERS_KILLED]++;
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1919
;1918:
;1919:	if (self == attacker)
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
NEU4 $670
line 1920
;1920:	{
line 1921
;1921:		self->client->ps.fd.suicides++;
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1236
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1922
;1922:	}
LABELV $670
line 1924
;1923:
;1924:	if (attacker && attacker->client) {
ADDRLP4 112
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 116
CNSTU4 0
ASGNU4
ADDRLP4 112
INDIRP4
CVPU4 4
ADDRLP4 116
INDIRU4
EQU4 $672
ADDRLP4 112
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 116
INDIRU4
EQU4 $672
line 1925
;1925:		attacker->client->lastkilled_client = self->s.number;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1848
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1927
;1926:
;1927:		if ( attacker == self || OnSameTeam (self, attacker ) ) {
ADDRLP4 120
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CVPU4 4
ADDRLP4 124
INDIRP4
CVPU4 4
EQU4 $676
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $674
LABELV $676
line 1928
;1928:			if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $677
line 1929
;1929:			{ //in duel, if you kill yourself, the person you are dueling against gets a kill for it
line 1930
;1930:				int otherClNum = -1;
ADDRLP4 132
CNSTI4 -1
ASGNI4
line 1931
;1931:				if (level.sortedClients[0] == self->s.number)
ADDRGP4 level+84
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $680
line 1932
;1932:				{
line 1933
;1933:					otherClNum = level.sortedClients[1];
ADDRLP4 132
ADDRGP4 level+84+4
INDIRI4
ASGNI4
line 1934
;1934:				}
ADDRGP4 $681
JUMPV
LABELV $680
line 1935
;1935:				else if (level.sortedClients[1] == self->s.number)
ADDRGP4 level+84+4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $685
line 1936
;1936:				{
line 1937
;1937:					otherClNum = level.sortedClients[0];
ADDRLP4 132
ADDRGP4 level+84
INDIRI4
ASGNI4
line 1938
;1938:				}
LABELV $685
LABELV $681
line 1940
;1939:
;1940:				if (otherClNum >= 0 && otherClNum < MAX_CLIENTS &&
ADDRLP4 136
ADDRLP4 132
INDIRI4
ASGNI4
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRLP4 136
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $690
ADDRLP4 136
INDIRI4
CNSTI4 32
GEI4 $690
ADDRLP4 144
CNSTI4 852
ADDRLP4 136
INDIRI4
MULI4
ASGNI4
ADDRLP4 144
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
EQI4 $690
ADDRLP4 144
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $690
ADDRLP4 136
INDIRI4
ADDRFP4 8
INDIRP4
INDIRI4
EQI4 $690
line 1943
;1941:					g_entities[otherClNum].inuse && g_entities[otherClNum].client &&
;1942:					otherClNum != attacker->s.number)
;1943:				{
line 1944
;1944:					AddScore( &g_entities[otherClNum], self->r.currentOrigin, 1 );
CNSTI4 852
ADDRLP4 132
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 1945
;1945:				}
ADDRGP4 $678
JUMPV
LABELV $690
line 1947
;1946:				else
;1947:				{
line 1948
;1948:					AddScore( attacker, self->r.currentOrigin, -1 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 1949
;1949:				}
line 1950
;1950:			}
ADDRGP4 $678
JUMPV
LABELV $677
line 1952
;1951:			else
;1952:			{
line 1953
;1953:				AddScore( attacker, self->r.currentOrigin, -1 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 1954
;1954:			}
LABELV $678
line 1955
;1955:			if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $673
line 1956
;1956:			{
line 1957
;1957:				if (self->client && self->client->ps.isJediMaster)
ADDRLP4 132
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $673
ADDRLP4 132
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $673
line 1958
;1958:				{ //killed ourself so return the saber to the original position
line 1961
;1959:				  //(to avoid people jumping off ledges and making the saber
;1960:				  //unreachable for 60 seconds)
;1961:					ThrowSaberToAttacker(self, NULL);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 ThrowSaberToAttacker
CALLV
pop
line 1962
;1962:					self->client->ps.isJediMaster = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 0
ASGNI4
line 1963
;1963:				}
line 1964
;1964:			}
line 1965
;1965:		} else {
ADDRGP4 $673
JUMPV
LABELV $674
line 1966
;1966:			if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $699
line 1967
;1967:			{
line 1968
;1968:				if ((attacker->client && attacker->client->ps.isJediMaster) ||
ADDRLP4 132
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $705
ADDRLP4 132
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
NEI4 $704
LABELV $705
ADDRLP4 136
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $702
ADDRLP4 136
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $702
LABELV $704
line 1970
;1969:					(self->client && self->client->ps.isJediMaster))
;1970:				{
line 1971
;1971:					AddScore( attacker, self->r.currentOrigin, 1 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 1973
;1972:					
;1973:					if (self->client && self->client->ps.isJediMaster)
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $700
ADDRLP4 140
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $700
line 1974
;1974:					{
line 1975
;1975:						ThrowSaberToAttacker(self, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ThrowSaberToAttacker
CALLV
pop
line 1976
;1976:						self->client->ps.isJediMaster = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 0
ASGNI4
line 1977
;1977:					}
line 1978
;1978:				}
ADDRGP4 $700
JUMPV
LABELV $702
line 1980
;1979:				else
;1980:				{
line 1981
;1981:					gentity_t *jmEnt = G_GetJediMaster();
ADDRLP4 144
ADDRGP4 G_GetJediMaster
CALLP4
ASGNP4
ADDRLP4 140
ADDRLP4 144
INDIRP4
ASGNP4
line 1983
;1982:
;1983:					if (jmEnt && jmEnt->client)
ADDRLP4 148
ADDRLP4 140
INDIRP4
ASGNP4
ADDRLP4 152
CNSTU4 0
ASGNU4
ADDRLP4 148
INDIRP4
CVPU4 4
ADDRLP4 152
INDIRU4
EQU4 $700
ADDRLP4 148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 152
INDIRU4
EQU4 $700
line 1984
;1984:					{
line 1985
;1985:						AddScore( jmEnt, self->r.currentOrigin, 1 );
ADDRLP4 140
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 1986
;1986:					}
line 1987
;1987:				}
line 1988
;1988:			}
ADDRGP4 $700
JUMPV
LABELV $699
line 1990
;1989:			else
;1990:			{
line 1991
;1991:				AddScore( attacker, self->r.currentOrigin, 1 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 1992
;1992:			}
LABELV $700
line 1994
;1993:
;1994:			if( meansOfDeath == MOD_STUN_BATON ) {
ADDRFP4 16
INDIRI4
CNSTI4 1
NEI4 $710
line 1997
;1995:				
;1996:				// play humiliation on player
;1997:				attacker->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
ADDRLP4 132
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 332
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2000
;1998:
;1999:				// add the sprite over the player's head
;2000:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 136
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 2001
;2001:				attacker->client->ps.eFlags |= EF_AWARD_GAUNTLET;
ADDRLP4 140
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 2002
;2002:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1872
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2005
;2003:
;2004:				// also play humiliation on target
;2005:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_GAUNTLETREWARD;
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 300
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 2006
;2006:			}
LABELV $710
line 2010
;2007:
;2008:			// check for two kills in a short amount of time
;2009:			// if this is close enough to the last kill, give a reward sound
;2010:			if ( level.time - attacker->client->lastKillTime < CARNAGE_REWARD_TIME ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1880
ADDP4
INDIRI4
SUBI4
CNSTI4 3000
GEI4 $713
line 2012
;2011:				// play excellent on player
;2012:				attacker->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
ADDRLP4 132
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 320
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2015
;2013:
;2014:				// add the sprite over the player's head
;2015:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 136
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 2016
;2016:				attacker->client->ps.eFlags |= EF_AWARD_EXCELLENT;
ADDRLP4 140
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 2017
;2017:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1872
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2018
;2018:			}
LABELV $713
line 2019
;2019:			attacker->client->lastKillTime = level.time;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1880
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2021
;2020:
;2021:		}
line 2022
;2022:	} else {
ADDRGP4 $673
JUMPV
LABELV $672
line 2023
;2023:		if (self->client && self->client->ps.isJediMaster)
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $718
ADDRLP4 120
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $718
line 2024
;2024:		{ //killed ourself so return the saber to the original position
line 2027
;2025:		  //(to avoid people jumping off ledges and making the saber
;2026:		  //unreachable for 60 seconds)
;2027:			ThrowSaberToAttacker(self, NULL);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 ThrowSaberToAttacker
CALLV
pop
line 2028
;2028:			self->client->ps.isJediMaster = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 0
ASGNI4
line 2029
;2029:		}
LABELV $718
line 2031
;2030:
;2031:		if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $720
line 2032
;2032:		{ //in duel, if you kill yourself, the person you are dueling against gets a kill for it
line 2033
;2033:			int otherClNum = -1;
ADDRLP4 124
CNSTI4 -1
ASGNI4
line 2034
;2034:			if (level.sortedClients[0] == self->s.number)
ADDRGP4 level+84
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $723
line 2035
;2035:			{
line 2036
;2036:				otherClNum = level.sortedClients[1];
ADDRLP4 124
ADDRGP4 level+84+4
INDIRI4
ASGNI4
line 2037
;2037:			}
ADDRGP4 $724
JUMPV
LABELV $723
line 2038
;2038:			else if (level.sortedClients[1] == self->s.number)
ADDRGP4 level+84+4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $728
line 2039
;2039:			{
line 2040
;2040:				otherClNum = level.sortedClients[0];
ADDRLP4 124
ADDRGP4 level+84
INDIRI4
ASGNI4
line 2041
;2041:			}
LABELV $728
LABELV $724
line 2043
;2042:
;2043:			if (otherClNum >= 0 && otherClNum < MAX_CLIENTS &&
ADDRLP4 128
ADDRLP4 124
INDIRI4
ASGNI4
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRLP4 128
INDIRI4
ADDRLP4 132
INDIRI4
LTI4 $733
ADDRLP4 128
INDIRI4
CNSTI4 32
GEI4 $733
ADDRLP4 136
CNSTI4 852
ADDRLP4 128
INDIRI4
MULI4
ASGNI4
ADDRLP4 136
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 132
INDIRI4
EQI4 $733
ADDRLP4 136
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $733
ADDRLP4 128
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $733
line 2046
;2044:				g_entities[otherClNum].inuse && g_entities[otherClNum].client &&
;2045:				otherClNum != self->s.number)
;2046:			{
line 2047
;2047:				AddScore( &g_entities[otherClNum], self->r.currentOrigin, 1 );
CNSTI4 852
ADDRLP4 124
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 2048
;2048:			}
ADDRGP4 $721
JUMPV
LABELV $733
line 2050
;2049:			else
;2050:			{
line 2051
;2051:				AddScore( self, self->r.currentOrigin, -1 );
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 2052
;2052:			}
line 2053
;2053:		}
ADDRGP4 $721
JUMPV
LABELV $720
line 2055
;2054:		else
;2055:		{
line 2056
;2056:			AddScore( self, self->r.currentOrigin, -1 );
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 2057
;2057:		}
LABELV $721
line 2058
;2058:	}
LABELV $673
line 2061
;2059:
;2060:	// Add team bonuses
;2061:	Team_FragBonuses(self, inflictor, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Team_FragBonuses
CALLV
pop
line 2064
;2062:
;2063:	// if I committed suicide, the flag does not fall, it returns.
;2064:	if (meansOfDeath == MOD_SUICIDE) {
ADDRFP4 16
INDIRI4
CNSTI4 35
NEI4 $737
line 2065
;2065:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 368
ADDP4
INDIRI4
CNSTI4 0
EQI4 $739
line 2066
;2066:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 2067
;2067:			self->client->ps.powerups[PW_NEUTRALFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 368
ADDP4
CNSTI4 0
ASGNI4
line 2068
;2068:		}
ADDRGP4 $740
JUMPV
LABELV $739
line 2069
;2069:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
CNSTI4 0
EQI4 $741
line 2070
;2070:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 2071
;2071:			self->client->ps.powerups[PW_REDFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 360
ADDP4
CNSTI4 0
ASGNI4
line 2072
;2072:		}
ADDRGP4 $742
JUMPV
LABELV $741
line 2073
;2073:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $743
line 2074
;2074:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 2075
;2075:			self->client->ps.powerups[PW_BLUEFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 364
ADDP4
CNSTI4 0
ASGNI4
line 2076
;2076:		}
LABELV $743
LABELV $742
LABELV $740
line 2077
;2077:	}
LABELV $737
line 2080
;2078:
;2079:	// if client is in a nodrop area, don't drop anything (but return CTF flags!)
;2080:	contents = trap_PointContents( self->r.currentOrigin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 120
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 120
INDIRI4
ASGNI4
line 2081
;2081:	if ( !( contents & CONTENTS_NODROP ) && !self->client->ps.fallingToDeath) {
ADDRLP4 124
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 124
INDIRI4
NEI4 $745
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1352
ADDP4
INDIRI4
ADDRLP4 124
INDIRI4
NEI4 $745
line 2082
;2082:		TossClientItems( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 2083
;2083:	}
ADDRGP4 $746
JUMPV
LABELV $745
line 2084
;2084:	else {
line 2085
;2085:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 368
ADDP4
INDIRI4
CNSTI4 0
EQI4 $747
line 2086
;2086:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 2087
;2087:		}
ADDRGP4 $748
JUMPV
LABELV $747
line 2088
;2088:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
CNSTI4 0
EQI4 $749
line 2089
;2089:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 2090
;2090:		}
ADDRGP4 $750
JUMPV
LABELV $749
line 2091
;2091:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $751
line 2092
;2092:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 2093
;2093:		}
LABELV $751
LABELV $750
LABELV $748
line 2094
;2094:	}
LABELV $746
line 2096
;2095:
;2096:	Cmd_Score_f( self );		// show scores
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 2099
;2097:	// send updated scores to any clients that are following this one,
;2098:	// or they would get stale scoreboards
;2099:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $756
JUMPV
LABELV $753
line 2102
;2100:		gclient_t	*client;
;2101:
;2102:		client = &level.clients[i];
ADDRLP4 128
CNSTI4 3024
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 2103
;2103:		if ( client->pers.connected != CON_CONNECTED ) {
ADDRLP4 128
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $758
line 2104
;2104:			continue;
ADDRGP4 $754
JUMPV
LABELV $758
line 2106
;2105:		}
;2106:		if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 128
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 3
EQI4 $760
line 2107
;2107:			continue;
ADDRGP4 $754
JUMPV
LABELV $760
line 2109
;2108:		}
;2109:		if ( client->sess.spectatorClient == self->s.number ) {
ADDRLP4 128
INDIRP4
CNSTI4 1648
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $762
line 2110
;2110:			Cmd_Score_f( g_entities + i );
CNSTI4 852
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 2111
;2111:		}
LABELV $762
line 2112
;2112:	}
LABELV $754
line 2099
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $756
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $753
line 2114
;2113:
;2114:	self->takedamage = qtrue;	// can still be gibbed
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 2116
;2115:
;2116:	self->s.weapon = WP_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 0
ASGNI4
line 2117
;2117:	self->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 0
ASGNI4
line 2118
;2118:	self->r.contents = CONTENTS_CORPSE;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 512
ASGNI4
line 2119
;2119:	self->client->ps.zoomMode = 0;	// Turn off zooming when we die
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1332
ADDP4
CNSTI4 0
ASGNI4
line 2121
;2120:
;2121:	self->s.angles[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 0
ASGNF4
line 2122
;2122:	self->s.angles[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 0
ASGNF4
line 2123
;2123:	LookAtKiller (self, inflictor, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 LookAtKiller
CALLV
pop
line 2125
;2124:
;2125:	VectorCopy( self->s.angles, self->client->ps.viewangles );
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 128
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 2127
;2126:
;2127:	self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 2129
;2128:
;2129:	self->r.maxs[2] = -8;
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 3238002688
ASGNF4
line 2133
;2130:
;2131:	// don't allow respawn until the death anim is done
;2132:	// g_forcerespawn may force spawning at some later time
;2133:	self->client->respawnTime = level.time + 1700;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1860
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1700
ADDI4
ASGNI4
line 2136
;2134:
;2135:	// remove powerups
;2136:	memset( self->client->ps.powerups, 0, sizeof(self->client->ps.powerups) );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2148
;2137:
;2138:	// NOTENOTE No gib deaths right now, this is star wars.
;2139:	/*
;2140:	// never gib in a nodrop
;2141:	if ( (self->health <= GIB_HEALTH && !(contents & CONTENTS_NODROP) && g_blood.integer) || meansOfDeath == MOD_SUICIDE) 
;2142:	{
;2143:		// gib death
;2144:		GibEntity( self, killer );
;2145:	} 
;2146:	else 
;2147:	*/
;2148:	{
line 2153
;2149:		// normal death
;2150:		
;2151:		static int i;
;2152:
;2153:		switch ( i ) {
ADDRLP4 132
ADDRGP4 $765
INDIRI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $768
ADDRLP4 132
INDIRI4
CNSTI4 1
EQI4 $769
ADDRLP4 132
INDIRI4
CNSTI4 2
EQI4 $770
ADDRGP4 $766
JUMPV
LABELV $768
line 2155
;2154:		case 0:
;2155:			anim = BOTH_DEATH1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 2156
;2156:			break;
ADDRGP4 $767
JUMPV
LABELV $769
line 2158
;2157:		case 1:
;2158:			anim = BOTH_DEATH2;
ADDRLP4 12
CNSTI4 2
ASGNI4
line 2159
;2159:			break;
ADDRGP4 $767
JUMPV
LABELV $770
LABELV $766
line 2162
;2160:		case 2:
;2161:		default:
;2162:			anim = BOTH_DEATH3;
ADDRLP4 12
CNSTI4 3
ASGNI4
line 2163
;2163:			break;
LABELV $767
line 2166
;2164:		}
;2165:		
;2166:		anim = G_PickDeathAnim(self, self->pos1, damage, meansOfDeath, HL_NONE);
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRLP4 136
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
ADDRLP4 140
ADDRGP4 G_PickDeathAnim
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 140
INDIRI4
ASGNI4
line 2168
;2167:
;2168:		if (anim < 1)
ADDRLP4 12
INDIRI4
CNSTI4 1
GEI4 $771
line 2169
;2169:		{
line 2170
;2170:			anim = BOTH_DEATH1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 2171
;2171:		}
LABELV $771
line 2173
;2172:
;2173:		if (meansOfDeath == MOD_SABER)
ADDRFP4 16
INDIRI4
CNSTI4 3
NEI4 $773
line 2174
;2174:		{
line 2175
;2175:			G_CheckForDismemberment(self, self->pos1, damage, anim);
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 548
ADDP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_CheckForDismemberment
CALLV
pop
line 2176
;2176:		}
LABELV $773
line 2180
;2177:
;2178:		// for the no-blood option, we need to prevent the health
;2179:		// from going to gib level
;2180:		if ( self->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $775
line 2181
;2181:			self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 -39
ASGNI4
line 2182
;2182:		}
LABELV $775
line 2184
;2183:
;2184:		self->client->respawnTime = level.time + 1000;//((self->client->animations[anim].numFrames*40)/(50.0f / self->client->animations[anim].frameLerp))+300;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1860
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2186
;2185:
;2186:		self->client->ps.legsAnim = 
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ASGNP4
ADDRLP4 148
CNSTI4 2048
ASGNI4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
ADDRLP4 148
INDIRI4
BANDI4
ADDRLP4 148
INDIRI4
BXORI4
ADDRLP4 12
INDIRI4
BORI4
ASGNI4
line 2188
;2187:			( ( self->client->ps.legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;2188:		self->client->ps.torsoAnim = 
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 156
CNSTI4 2048
ASGNI4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
ADDRLP4 156
INDIRI4
BANDI4
ADDRLP4 156
INDIRI4
BXORI4
ADDRLP4 12
INDIRI4
BORI4
ASGNI4
line 2196
;2189:			( ( self->client->ps.torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;2190://		self->client->ps.pm_flags |= PMF_UPDATE_ANIM;		// Make sure the pmove sets up the GHOUL2 anims.
;2191:
;2192:		//rww - do this on respawn, not death
;2193:		//CopyToBodyQue (self);
;2194:
;2195:		//G_AddEvent( self, EV_DEATH1 + i, killer );
;2196:		if (wasJediMaster)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $778
line 2197
;2197:		{
line 2198
;2198:			G_AddEvent( self, EV_DEATH1 + i, 1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $765
INDIRI4
CNSTI4 78
ADDI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2199
;2199:		}
ADDRGP4 $779
JUMPV
LABELV $778
line 2201
;2200:		else
;2201:		{
line 2202
;2202:			G_AddEvent( self, EV_DEATH1 + i, 0 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $765
INDIRI4
CNSTI4 78
ADDI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2203
;2203:		}
LABELV $779
line 2206
;2204:
;2205:		// the body can still be gibbed
;2206:		self->die = body_die;
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRGP4 body_die
ASGNP4
line 2209
;2207:
;2208:		//It won't gib, it will disintegrate (because this is Star Wars).
;2209:		self->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 2212
;2210:
;2211:		// globally cycle through the different death animations
;2212:		i = ( i + 1 ) % 3;
ADDRLP4 160
ADDRGP4 $765
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 3
MODI4
ASGNI4
line 2213
;2213:	}
line 2215
;2214:
;2215:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2217
;2216:
;2217:}
LABELV $606
endproc player_die 164 28
export CheckArmor
proc CheckArmor 16 4
line 2226
;2218:
;2219:
;2220:/*
;2221:================
;2222:CheckArmor
;2223:================
;2224:*/
;2225:int CheckArmor (gentity_t *ent, int damage, int dflags)
;2226:{
line 2231
;2227:	gclient_t	*client;
;2228:	int			save;
;2229:	int			count;
;2230:
;2231:	if (!damage)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $781
line 2232
;2232:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $780
JUMPV
LABELV $781
line 2234
;2233:
;2234:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 2236
;2235:
;2236:	if (!client)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $783
line 2237
;2237:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $780
JUMPV
LABELV $783
line 2239
;2238:
;2239:	if (dflags & DAMAGE_NO_ARMOR)
ADDRFP4 8
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $785
line 2240
;2240:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $780
JUMPV
LABELV $785
line 2243
;2241:
;2242:	// armor
;2243:	count = client->ps.stats[STAT_ARMOR];
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 2245
;2244:
;2245:	if (dflags & DAMAGE_HALF_ABSORB)
ADDRFP4 8
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $787
line 2246
;2246:	{	// Half the damage gets absorbed by the shields, rather than 100%
line 2247
;2247:		save = ceil( damage * ARMOR_PROTECTION );
CNSTF4 1056964608
ADDRFP4 4
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 12
ADDRGP4 ceil
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 2248
;2248:	}
ADDRGP4 $788
JUMPV
LABELV $787
line 2250
;2249:	else
;2250:	{	// All the damage gets absorbed by the shields.
line 2251
;2251:		save = damage;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 2252
;2252:	}
LABELV $788
line 2255
;2253:
;2254:	// save is the most damage that the armor is elibigle to protect, of course, but it's limited by the total armor.
;2255:	if (save >= count)
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $789
line 2256
;2256:		save = count;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $789
line 2258
;2257:
;2258:	if (!save)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $791
line 2259
;2259:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $780
JUMPV
LABELV $791
line 2261
;2260:
;2261:	if (dflags & DAMAGE_HALF_ARMOR_REDUCTION)		// Armor isn't whittled so easily by sniper shots.
ADDRFP4 8
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $793
line 2262
;2262:	{
line 2263
;2263:		client->ps.stats[STAT_ARMOR] -= (int)(save*ARMOR_REDUCTION_FACTOR);
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 236
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTF4 1056964608
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
CVFI4 4
SUBI4
ASGNI4
line 2264
;2264:	}
ADDRGP4 $794
JUMPV
LABELV $793
line 2266
;2265:	else
;2266:	{
line 2267
;2267:		client->ps.stats[STAT_ARMOR] -= save;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 236
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 2268
;2268:	}
LABELV $794
line 2270
;2269:
;2270:	return save;
ADDRLP4 0
INDIRI4
RETI4
LABELV $780
endproc CheckArmor 16 4
export G_ApplyKnockback
proc G_ApplyKnockback 48 0
line 2275
;2271:}
;2272:
;2273:
;2274:void G_ApplyKnockback( gentity_t *targ, vec3_t newDir, float knockback )
;2275:{
line 2279
;2276:	vec3_t	kvel;
;2277:	float	mass;
;2278:
;2279:	if (targ && targ->client && targ->client->ps.usingATST)
ADDRLP4 16
ADDRFP4 0
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
EQU4 $796
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
EQU4 $796
ADDRLP4 24
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $796
line 2280
;2280:	{
line 2281
;2281:		return;
ADDRGP4 $795
JUMPV
LABELV $796
line 2284
;2282:	}
;2283:
;2284:	if ( targ->physicsBounce > 0 )	//overide the mass
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
CNSTF4 0
LEF4 $798
line 2285
;2285:		mass = targ->physicsBounce;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $799
JUMPV
LABELV $798
line 2287
;2286:	else
;2287:		mass = 200;
ADDRLP4 12
CNSTF4 1128792064
ASGNF4
LABELV $799
line 2289
;2288:
;2289:	if ( g_gravity.value > 0 )
ADDRGP4 g_gravity+8
INDIRF4
CNSTF4 0
LEF4 $800
line 2290
;2290:	{
line 2291
;2291:		VectorScale( newDir, g_knockback.value * (float)knockback / mass * 0.8, kvel );
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTF4 1061997773
ASGNF4
ADDRLP4 36
ADDRFP4 8
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
DIVF4
MULF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
DIVF4
MULF4
MULF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1061997773
ADDRGP4 g_knockback+8
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
DIVF4
MULF4
MULF4
ASGNF4
line 2292
;2292:		kvel[2] = newDir[2] * g_knockback.value * (float)knockback / mass * 1.5;
ADDRLP4 0+8
CNSTF4 1069547520
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
MULF4
ADDRFP4 8
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
DIVF4
MULF4
ASGNF4
line 2293
;2293:	}
ADDRGP4 $801
JUMPV
LABELV $800
line 2295
;2294:	else
;2295:	{
line 2296
;2296:		VectorScale( newDir, g_knockback.value * (float)knockback / mass, kvel );
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
ADDRFP4 8
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
DIVF4
MULF4
ASGNF4
line 2297
;2297:	}
LABELV $801
line 2299
;2298:
;2299:	if ( targ->client )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $815
line 2300
;2300:	{
line 2301
;2301:		VectorAdd( targ->client->ps.velocity, kvel, targ->client->ps.velocity );
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 2302
;2302:	}
ADDRGP4 $816
JUMPV
LABELV $815
line 2303
;2303:	else if ( targ->s.pos.trType != TR_STATIONARY && targ->s.pos.trType != TR_LINEAR_STOP )
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $819
ADDRLP4 28
INDIRI4
CNSTI4 3
EQI4 $819
line 2304
;2304:	{
line 2305
;2305:		VectorAdd( targ->s.pos.trDelta, kvel, targ->s.pos.trDelta );
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
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
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 2306
;2306:		VectorCopy( targ->r.currentOrigin, targ->s.pos.trBase );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2307
;2307:		targ->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2308
;2308:	}
LABELV $819
LABELV $816
line 2312
;2309:
;2310:	// set the timer so that the other client can't cancel
;2311:	// out the movement immediately
;2312:	if ( targ->client && !targ->client->ps.pm_time ) 
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $824
ADDRLP4 32
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $824
line 2313
;2313:	{
line 2316
;2314:		int		t;
;2315:
;2316:		t = knockback * 2;
ADDRLP4 36
CNSTF4 1073741824
ADDRFP4 8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 2317
;2317:		if ( t < 50 ) {
ADDRLP4 36
INDIRI4
CNSTI4 50
GEI4 $826
line 2318
;2318:			t = 50;
ADDRLP4 36
CNSTI4 50
ASGNI4
line 2319
;2319:		}
LABELV $826
line 2320
;2320:		if ( t > 200 ) {
ADDRLP4 36
INDIRI4
CNSTI4 200
LEI4 $828
line 2321
;2321:			t = 200;
ADDRLP4 36
CNSTI4 200
ASGNI4
line 2322
;2322:		}
LABELV $828
line 2323
;2323:		targ->client->ps.pm_time = t;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 2324
;2324:		targ->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 2325
;2325:	}
LABELV $824
line 2326
;2326:}
LABELV $795
endproc G_ApplyKnockback 48 0
export RaySphereIntersections
proc RaySphereIntersections 96 4
line 2333
;2327:
;2328:/*
;2329:================
;2330:RaySphereIntersections
;2331:================
;2332:*/
;2333:int RaySphereIntersections( vec3_t origin, float radius, vec3_t point, vec3_t dir, vec3_t intersections[2] ) {
line 2342
;2334:	float b, c, d, t;
;2335:
;2336:	//	| origin - (point + t * dir) | = radius
;2337:	//	a = dir[0]^2 + dir[1]^2 + dir[2]^2;
;2338:	//	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
;2339:	//	c = (point[0] - origin[0])^2 + (point[1] - origin[1])^2 + (point[2] - origin[2])^2 - radius^2;
;2340:
;2341:	// normalize dir so a = 1
;2342:	VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2343
;2343:	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
ADDRLP4 16
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 4
ASGNI4
ADDRLP4 32
CNSTI4 8
ASGNI4
ADDRLP4 4
CNSTF4 1073741824
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
INDIRF4
SUBF4
MULF4
ADDRLP4 16
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
MULF4
ASGNF4
line 2344
;2344:	c = (point[0] - origin[0]) * (point[0] - origin[0]) +
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 40
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
CNSTI4 4
ASGNI4
ADDRLP4 52
ADDRLP4 36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56
CNSTI4 8
ASGNI4
ADDRLP4 60
ADDRLP4 36
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 44
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDRLP4 52
INDIRF4
ADDRLP4 52
INDIRF4
MULF4
ADDF4
ADDRLP4 60
INDIRF4
ADDRLP4 60
INDIRF4
MULF4
ADDF4
ADDRLP4 64
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
SUBF4
ASGNF4
line 2349
;2345:		(point[1] - origin[1]) * (point[1] - origin[1]) +
;2346:		(point[2] - origin[2]) * (point[2] - origin[2]) -
;2347:		radius * radius;
;2348:
;2349:	d = b * b - 4 * c;
ADDRLP4 8
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
CNSTF4 1082130432
ADDRLP4 12
INDIRF4
MULF4
SUBF4
ASGNF4
line 2350
;2350:	if (d > 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $831
line 2351
;2351:		t = (- b + sqrt(d)) / 2;
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
ADDRLP4 72
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2352
;2352:		VectorMA(point, t, dir, intersections[0]);
ADDRFP4 16
INDIRP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76
CNSTI4 4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2353
;2353:		t = (- b - sqrt(d)) / 2;
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 84
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
ADDRLP4 84
INDIRF4
SUBF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2354
;2354:		VectorMA(point, t, dir, intersections[1]);
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
CNSTI4 4
ASGNI4
ADDRFP4 16
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 92
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2355
;2355:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $830
JUMPV
LABELV $831
line 2357
;2356:	}
;2357:	else if (d == 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
NEF4 $833
line 2358
;2358:		t = (- b ) / 2;
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2359
;2359:		VectorMA(point, t, dir, intersections[0]);
ADDRFP4 16
INDIRP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 72
CNSTI4 4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2360
;2360:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $830
JUMPV
LABELV $833
line 2362
;2361:	}
;2362:	return 0;
CNSTI4 0
RETI4
LABELV $830
endproc RaySphereIntersections 96 4
export LimbTouch
proc LimbTouch 0 0
line 2366
;2363:}
;2364:
;2365:void LimbTouch( gentity_t *self, gentity_t *other, trace_t *trace )
;2366:{
line 2367
;2367:}
LABELV $835
endproc LimbTouch 0 0
export LimbThink
proc LimbThink 12 4
line 2370
;2368:
;2369:void LimbThink( gentity_t *ent )
;2370:{
line 2371
;2371:	if (ent->speed < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $837
line 2372
;2372:	{
line 2373
;2373:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 2374
;2374:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2375
;2375:		return;
ADDRGP4 $836
JUMPV
LABELV $837
line 2378
;2376:	}
;2377:
;2378:	if (ent->s.pos.trType != TR_GRAVITY)
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 5
EQI4 $841
line 2379
;2379:	{
line 2380
;2380:		int addamt = (ent->speed - level.time);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
line 2382
;2381:
;2382:		if (addamt > 5000)
ADDRLP4 0
INDIRI4
CNSTI4 5000
LEI4 $844
line 2383
;2383:		{
line 2384
;2384:			addamt = 5000;
ADDRLP4 0
CNSTI4 5000
ASGNI4
line 2385
;2385:		}
LABELV $844
line 2386
;2386:		if (addamt < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $846
line 2387
;2387:		{
line 2388
;2388:			addamt = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2389
;2389:		}
LABELV $846
line 2391
;2390:
;2391:		VectorClear(ent->s.pos.trDelta);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 2392
;2392:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 2393
;2393:		ent->nextthink = level.time + addamt;
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
line 2394
;2394:		return;
ADDRGP4 $836
JUMPV
LABELV $841
line 2397
;2395:	}
;2396:
;2397:	G_RunMissile(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunMissile
CALLV
pop
line 2399
;2398:
;2399:	G_RunObject(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 2400
;2400:}
LABELV $836
endproc LimbThink 12 4
data
export hitLocName
align 4
LABELV hitLocName
address $849
address $850
address $851
address $852
address $853
address $854
address $855
address $856
address $857
address $858
address $859
address $860
address $861
address $862
address $863
address $864
address $865
address $866
address $867
address $868
address $869
address $870
address $871
export G_GetDismemberLoc
code
proc G_GetDismemberLoc 184 16
line 2433
;2401:
;2402:
;2403:char *hitLocName[HL_MAX] = 
;2404:{
;2405:	"none",	//HL_NONE = 0,
;2406:	"right foot",	//HL_FOOT_RT,
;2407:	"left foot",	//HL_FOOT_LT,
;2408:	"right leg",	//HL_LEG_RT,
;2409:	"left leg",	//HL_LEG_LT,
;2410:	"waist",	//HL_WAIST,
;2411:	"back right shoulder",	//HL_BACK_RT,
;2412:	"back left shoulder",	//HL_BACK_LT,
;2413:	"back",	//HL_BACK,
;2414:	"front right shouler",	//HL_CHEST_RT,
;2415:	"front left shoulder",	//HL_CHEST_LT,
;2416:	"chest",	//HL_CHEST,
;2417:	"right arm",	//HL_ARM_RT,
;2418:	"left arm",	//HL_ARM_LT,
;2419:	"right hand",	//HL_HAND_RT,
;2420:	"left hand",	//HL_HAND_LT,
;2421:	"head",	//HL_HEAD
;2422:	"generic1",	//HL_GENERIC1,
;2423:	"generic2",	//HL_GENERIC2,
;2424:	"generic3",	//HL_GENERIC3,
;2425:	"generic4",	//HL_GENERIC4,
;2426:	"generic5",	//HL_GENERIC5,
;2427:	"generic6"	//HL_GENERIC6
;2428:};
;2429:
;2430:void G_G2PlayerAngles( gentity_t *ent, vec3_t legs[3], vec3_t legsAngles);
;2431:
;2432:void G_GetDismemberLoc(gentity_t *self, vec3_t boltPoint, int limbType)
;2433:{ //Just get the general area without using server-side ghoul2
line 2436
;2434:	vec3_t fwd, right, up;
;2435:
;2436:	AngleVectors(self->r.currentAngles, fwd, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 380
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2438
;2437:
;2438:	VectorCopy(self->r.currentOrigin, boltPoint);
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2440
;2439:
;2440:	switch (limbType)
ADDRLP4 36
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 10
LTI4 $872
ADDRLP4 36
INDIRI4
CNSTI4 16
GTI4 $872
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $906-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $906
address $875
address $878
address $881
address $886
address $891
address $896
address $901
code
line 2441
;2441:	{
LABELV $875
line 2443
;2442:	case G2_MODELPART_HEAD:
;2443:		boltPoint[0] += up[0]*24;
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
CNSTF4 1103101952
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2444
;2444:		boltPoint[1] += up[1]*24;
ADDRLP4 44
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
CNSTF4 1103101952
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2445
;2445:		boltPoint[2] += up[2]*24;
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
CNSTF4 1103101952
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2446
;2446:		break;
ADDRGP4 $872
JUMPV
LABELV $878
line 2448
;2447:	case G2_MODELPART_WAIST:
;2448:		boltPoint[0] += up[0]*4;
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2449
;2449:		boltPoint[1] += up[1]*4;
ADDRLP4 56
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2450
;2450:		boltPoint[2] += up[2]*4;
ADDRLP4 60
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2451
;2451:		break;
ADDRGP4 $872
JUMPV
LABELV $881
line 2453
;2452:	case G2_MODELPART_LARM:
;2453:		boltPoint[0] += up[0]*18;
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
CNSTF4 1099956224
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2454
;2454:		boltPoint[1] += up[1]*18;
ADDRLP4 68
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
CNSTF4 1099956224
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2455
;2455:		boltPoint[2] += up[2]*18;
ADDRLP4 72
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
CNSTF4 1099956224
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2457
;2456:
;2457:		boltPoint[0] -= right[0]*10;
ADDRLP4 76
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12
INDIRF4
MULF4
SUBF4
ASGNF4
line 2458
;2458:		boltPoint[1] -= right[1]*10;
ADDRLP4 80
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 2459
;2459:		boltPoint[2] -= right[2]*10;
ADDRLP4 84
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 2460
;2460:		break;
ADDRGP4 $872
JUMPV
LABELV $886
line 2462
;2461:	case G2_MODELPART_RARM:
;2462:		boltPoint[0] += up[0]*18;
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
CNSTF4 1099956224
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2463
;2463:		boltPoint[1] += up[1]*18;
ADDRLP4 92
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRF4
CNSTF4 1099956224
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2464
;2464:		boltPoint[2] += up[2]*18;
ADDRLP4 96
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRF4
CNSTF4 1099956224
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2466
;2465:
;2466:		boltPoint[0] += right[0]*10;
ADDRLP4 100
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 2467
;2467:		boltPoint[1] += right[1]*10;
ADDRLP4 104
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2468
;2468:		boltPoint[2] += right[2]*10;
ADDRLP4 108
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2469
;2469:		break;
ADDRGP4 $872
JUMPV
LABELV $891
line 2471
;2470:	case G2_MODELPART_RHAND:
;2471:		boltPoint[0] += up[0]*8;
ADDRLP4 112
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
CNSTF4 1090519040
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2472
;2472:		boltPoint[1] += up[1]*8;
ADDRLP4 116
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRF4
CNSTF4 1090519040
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2473
;2473:		boltPoint[2] += up[2]*8;
ADDRLP4 120
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRF4
CNSTF4 1090519040
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2475
;2474:
;2475:		boltPoint[0] += right[0]*10;
ADDRLP4 124
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 2476
;2476:		boltPoint[1] += right[1]*10;
ADDRLP4 128
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2477
;2477:		boltPoint[2] += right[2]*10;
ADDRLP4 132
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2478
;2478:		break;
ADDRGP4 $872
JUMPV
LABELV $896
line 2480
;2479:	case G2_MODELPART_LLEG:
;2480:		boltPoint[0] -= up[0]*4;
ADDRLP4 136
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 0
INDIRF4
MULF4
SUBF4
ASGNF4
line 2481
;2481:		boltPoint[1] -= up[1]*4;
ADDRLP4 140
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 0+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 2482
;2482:		boltPoint[2] -= up[2]*4;
ADDRLP4 144
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 0+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 2484
;2483:
;2484:		boltPoint[0] -= right[0]*10;
ADDRLP4 148
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12
INDIRF4
MULF4
SUBF4
ASGNF4
line 2485
;2485:		boltPoint[1] -= right[1]*10;
ADDRLP4 152
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 2486
;2486:		boltPoint[2] -= right[2]*10;
ADDRLP4 156
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 2487
;2487:		break;
ADDRGP4 $872
JUMPV
LABELV $901
line 2489
;2488:	case G2_MODELPART_RLEG:
;2489:		boltPoint[0] -= up[0]*4;
ADDRLP4 160
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 0
INDIRF4
MULF4
SUBF4
ASGNF4
line 2490
;2490:		boltPoint[1] -= up[1]*4;
ADDRLP4 164
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 0+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 2491
;2491:		boltPoint[2] -= up[2]*4;
ADDRLP4 168
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 0+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 2493
;2492:
;2493:		boltPoint[0] += right[0]*10;
ADDRLP4 172
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 2494
;2494:		boltPoint[1] += right[1]*10;
ADDRLP4 176
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2495
;2495:		boltPoint[2] += right[2]*10;
ADDRLP4 180
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 180
INDIRP4
ADDRLP4 180
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2496
;2496:		break;
line 2498
;2497:	default:
;2498:		break;
line 2501
;2499:	}
;2500:
;2501:	return;
LABELV $872
endproc G_GetDismemberLoc 184 16
export G_GetDismemberBolt
proc G_GetDismemberBolt 160 36
line 2505
;2502:}
;2503:
;2504:void G_GetDismemberBolt(gentity_t *self, vec3_t boltPoint, int limbType)
;2505:{
line 2506
;2506:	int useBolt = self->bolt_Head;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ASGNI4
line 2510
;2507:	vec3_t properOrigin, properAngles, addVel;
;2508:	vec3_t legAxis[3];
;2509:	mdxaBone_t	boltMatrix;
;2510:	float fVSpeed = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 2512
;2511:
;2512:	switch (limbType)
ADDRLP4 128
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 10
LTI4 $909
ADDRLP4 128
INDIRI4
CNSTI4 16
GTI4 $909
ADDRLP4 128
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $919-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $919
address $911
address $912
address $913
address $914
address $915
address $917
address $918
code
line 2513
;2513:	{
LABELV $911
line 2515
;2514:	case G2_MODELPART_HEAD:
;2515:		useBolt = self->bolt_Head;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ASGNI4
line 2516
;2516:		break;
ADDRGP4 $910
JUMPV
LABELV $912
line 2518
;2517:	case G2_MODELPART_WAIST:
;2518:		useBolt = self->bolt_Waist;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRI4
ASGNI4
line 2519
;2519:		break;
ADDRGP4 $910
JUMPV
LABELV $913
line 2521
;2520:	case G2_MODELPART_LARM:
;2521:		useBolt = self->bolt_LArm;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
ASGNI4
line 2522
;2522:		break;
ADDRGP4 $910
JUMPV
LABELV $914
line 2524
;2523:	case G2_MODELPART_RARM:
;2524:		useBolt = self->bolt_RArm;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ASGNI4
line 2525
;2525:		break;
ADDRGP4 $910
JUMPV
LABELV $915
line 2527
;2526:	case G2_MODELPART_RHAND:
;2527:		useBolt = trap_G2API_AddBolt(self->client->ghoul2, 0, "rhand");
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 2940
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $916
ARGP4
ADDRLP4 132
ADDRGP4 trap_G2API_AddBolt
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 132
INDIRI4
ASGNI4
line 2528
;2528:		break;
ADDRGP4 $910
JUMPV
LABELV $917
line 2530
;2529:	case G2_MODELPART_LLEG:
;2530:		useBolt = self->bolt_LLeg;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
ASGNI4
line 2531
;2531:		break;
ADDRGP4 $910
JUMPV
LABELV $918
line 2533
;2532:	case G2_MODELPART_RLEG:
;2533:		useBolt = self->bolt_RLeg;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
ASGNI4
line 2534
;2534:		break;
ADDRGP4 $910
JUMPV
LABELV $909
line 2536
;2535:	default:
;2536:		useBolt = self->bolt_Head;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ASGNI4
line 2537
;2537:		break;
LABELV $910
line 2540
;2538:	}
;2539:
;2540:	VectorCopy(self->client->ps.origin, properOrigin);
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2541
;2541:	VectorCopy(self->client->ps.viewangles, properAngles);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 2544
;2542:
;2543:	//try to predict the origin based on velocity so it's more like what the client is seeing
;2544:	VectorCopy(self->client->ps.velocity, addVel);
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2545
;2545:	VectorNormalize(addVel);
ADDRLP4 76
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2547
;2546:
;2547:	if (self->client->ps.velocity[0] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
GEF4 $921
line 2548
;2548:	{
line 2549
;2549:		fVSpeed += (-self->client->ps.velocity[0]);
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRFP4 0
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
line 2550
;2550:	}
ADDRGP4 $922
JUMPV
LABELV $921
line 2552
;2551:	else
;2552:	{
line 2553
;2553:		fVSpeed += self->client->ps.velocity[0];
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2554
;2554:	}
LABELV $922
line 2555
;2555:	if (self->client->ps.velocity[1] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CNSTF4 0
GEF4 $923
line 2556
;2556:	{
line 2557
;2557:		fVSpeed += (-self->client->ps.velocity[1]);
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRFP4 0
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
line 2558
;2558:	}
ADDRGP4 $924
JUMPV
LABELV $923
line 2560
;2559:	else
;2560:	{
line 2561
;2561:		fVSpeed += self->client->ps.velocity[1];
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2562
;2562:	}
LABELV $924
line 2563
;2563:	if (self->client->ps.velocity[2] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
GEF4 $925
line 2564
;2564:	{
line 2565
;2565:		fVSpeed += (-self->client->ps.velocity[2]);
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRFP4 0
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
line 2566
;2566:	}
ADDRGP4 $926
JUMPV
LABELV $925
line 2568
;2567:	else
;2568:	{
line 2569
;2569:		fVSpeed += self->client->ps.velocity[2];
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2570
;2570:	}
LABELV $926
line 2572
;2571:
;2572:	fVSpeed *= 0.08;
ADDRLP4 12
CNSTF4 1034147594
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 2574
;2573:
;2574:	properOrigin[0] += addVel[0]*fVSpeed;
ADDRLP4 64
ADDRLP4 64
INDIRF4
ADDRLP4 76
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 2575
;2575:	properOrigin[1] += addVel[1]*fVSpeed;
ADDRLP4 64+4
ADDRLP4 64+4
INDIRF4
ADDRLP4 76+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 2576
;2576:	properOrigin[2] += addVel[2]*fVSpeed;
ADDRLP4 64+8
ADDRLP4 64+8
INDIRF4
ADDRLP4 76+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 2578
;2577:
;2578:	properAngles[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2579
;2579:	properAngles[1] = self->client->ps.viewangles[YAW];
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 2580
;2580:	properAngles[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2582
;2581:
;2582:	AnglesToAxis( properAngles, legAxis );
ADDRLP4 0
ARGP4
ADDRLP4 92
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2583
;2583:	G_G2PlayerAngles( self, legAxis, properAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_G2PlayerAngles
CALLV
pop
line 2585
;2584:
;2585:	trap_G2API_GetBoltMatrix(self->client->ghoul2, 0, useBolt, &boltMatrix, properAngles, properOrigin, level.time, NULL, vec3_origin);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 2940
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 88
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 2587
;2586:
;2587:	boltPoint[0] = boltMatrix.matrix[0][3];
ADDRFP4 4
INDIRP4
ADDRLP4 16+12
INDIRF4
ASGNF4
line 2588
;2588:	boltPoint[1] = boltMatrix.matrix[1][3];
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16+16+12
INDIRF4
ASGNF4
line 2589
;2589:	boltPoint[2] = boltMatrix.matrix[2][3];
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 16+32+12
INDIRF4
ASGNF4
line 2591
;2590:
;2591:	trap_G2API_GetBoltMatrix(self->client->ghoul2, 1, 0, &boltMatrix, properAngles, properOrigin, level.time, NULL, vec3_origin);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 2940
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 2593
;2592:
;2593:	if (self->client && limbType == G2_MODELPART_RHAND)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $940
ADDRFP4 8
INDIRI4
CNSTI4 14
NEI4 $940
line 2594
;2594:	{ //Make some saber hit sparks over the severed wrist area
line 2598
;2595:		vec3_t boltAngles;
;2596:		gentity_t *te;
;2597:
;2598:		boltAngles[0] = -boltMatrix.matrix[0][1];
ADDRLP4 136
ADDRLP4 16+4
INDIRF4
NEGF4
ASGNF4
line 2599
;2599:		boltAngles[1] = -boltMatrix.matrix[1][1];
ADDRLP4 136+4
ADDRLP4 16+16+4
INDIRF4
NEGF4
ASGNF4
line 2600
;2600:		boltAngles[2] = -boltMatrix.matrix[2][1];
ADDRLP4 136+8
ADDRLP4 16+32+4
INDIRF4
NEGF4
ASGNF4
line 2602
;2601:
;2602:		te = G_TempEntity( boltPoint, EV_SABER_HIT );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 27
ARGI4
ADDRLP4 148
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 132
ADDRLP4 148
INDIRP4
ASGNP4
line 2604
;2603:
;2604:		VectorCopy(boltPoint, te->s.origin);
ADDRLP4 132
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2605
;2605:		VectorCopy(boltAngles, te->s.angles);
ADDRLP4 132
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 136
INDIRB
ASGNB 12
line 2607
;2606:		
;2607:		if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 156
CNSTF4 0
ASGNF4
ADDRLP4 132
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 156
INDIRF4
NEF4 $949
ADDRLP4 132
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 156
INDIRF4
NEF4 $949
ADDRLP4 132
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 156
INDIRF4
NEF4 $949
line 2608
;2608:		{ //don't let it play with no direction
line 2609
;2609:			te->s.angles[1] = 1;
ADDRLP4 132
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 2610
;2610:		}
LABELV $949
line 2612
;2611:
;2612:		te->s.eventParm = 16; //lots of sparks
ADDRLP4 132
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 16
ASGNI4
line 2613
;2613:	}
LABELV $940
line 2614
;2614:}
LABELV $908
endproc G_GetDismemberBolt 160 36
export G_Dismember
proc G_Dismember 88 8
line 2617
;2615:
;2616:void G_Dismember( gentity_t *ent, vec3_t point, int limbType, float limbRollBase, float limbPitchBase, int deathAnim )
;2617:{
line 2621
;2618:	vec3_t	dir, newPoint, vel;
;2619:	gentity_t *limb;
;2620:
;2621:	VectorCopy( point, newPoint );
ADDRLP4 28
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2622
;2622:	limb = G_Spawn();
ADDRLP4 40
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
ASGNP4
line 2623
;2623:	limb->classname = "playerlimb";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $952
ASGNP4
line 2624
;2624:	G_SetOrigin( limb, newPoint );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 2625
;2625:	VectorCopy( newPoint, limb->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 28
INDIRB
ASGNB 12
line 2626
;2626:	limb->think = LimbThink;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 LimbThink
ASGNP4
line 2627
;2627:	limb->touch = LimbTouch;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 LimbTouch
ASGNP4
line 2628
;2628:	limb->speed = level.time + Q_irand(4000, 8000);
CNSTI4 4000
ARGI4
CNSTI4 8000
ARGI4
ADDRLP4 44
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 2629
;2629:	limb->nextthink = level.time + FRAMETIME;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 2632
;2630:
;2631:	//need size, contents, clipmask
;2632:	limb->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 2633
;2633:	limb->clipmask = MASK_SOLID;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 1
ASGNI4
line 2634
;2634:	limb->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1024
ASGNI4
line 2635
;2635:	VectorSet( limb->r.mins, -6.0f, -6.0f, -9.0f );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3233808384
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3233808384
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3239051264
ASGNF4
line 2636
;2636:	VectorSet( limb->r.maxs, 6.0f, 6.0f, 6.0f );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1086324736
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1086324736
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1086324736
ASGNF4
line 2641
;2637://	VectorClear(limb->r.mins);
;2638://	VectorClear(limb->r.maxs);
;2639:
;2640:	//move it
;2641:	limb->s.eType = ET_GENERAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 2642
;2642:	limb->s.weapon = G2_MODEL_PART;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 50
ASGNI4
line 2644
;2643:
;2644:	if (limbType == G2_MODELPART_HEAD)
ADDRFP4 8
INDIRI4
CNSTI4 10
NEI4 $955
line 2645
;2645:	{
line 2646
;2646:		limb->bounceCount = 2;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 2
ASGNI4
line 2647
;2647:	}
ADDRGP4 $956
JUMPV
LABELV $955
line 2649
;2648:	else
;2649:	{
line 2650
;2650:		limb->bounceCount = 1;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 1
ASGNI4
line 2651
;2651:	}
LABELV $956
line 2652
;2652:	limb->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 2653
;2653:	limb->s.pos.trTime = level.time;								// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2654
;2654:	VectorSubtract( point, ent->r.currentOrigin, dir );
ADDRLP4 48
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
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
line 2655
;2655:	VectorNormalize( dir );
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2656
;2656:	if (ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $960
line 2657
;2657:	{
line 2658
;2658:		VectorCopy(ent->client->ps.velocity, vel);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2659
;2659:	}
ADDRGP4 $961
JUMPV
LABELV $960
line 2661
;2660:	else
;2661:	{
line 2662
;2662:		VectorCopy(ent->s.pos.trDelta, vel);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 2663
;2663:	}
LABELV $961
line 2664
;2664:	VectorMA( vel, 100, dir, limb->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 16
INDIRF4
CNSTF4 1120403456
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16+4
INDIRF4
CNSTF4 1120403456
ADDRLP4 4+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 16+8
INDIRF4
CNSTF4 1120403456
ADDRLP4 4+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2667
;2665:
;2666:	//add some vertical velocity
;2667:	if (limbType == G2_MODELPART_HEAD ||
ADDRLP4 56
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 10
EQI4 $968
ADDRLP4 56
INDIRI4
CNSTI4 11
NEI4 $966
LABELV $968
line 2669
;2668:		limbType == G2_MODELPART_WAIST)
;2669:	{
line 2670
;2670:		limb->s.pos.trDelta[2] += 100;
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
CNSTF4 1120403456
ADDF4
ASGNF4
line 2671
;2671:	}
LABELV $966
line 2674
;2672:
;2673:	//make it bounce some
;2674:	limb->s.eFlags |= EF_BOUNCE_HALF;
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 2677
;2675:	//no trDuration?
;2676:	//spin it
;2677:	VectorClear( limb->s.apos.trBase );
ADDRLP4 68
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 68
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 68
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 68
INDIRF4
ASGNF4
line 2683
;2678:	/*
;2679:	limb->s.apos.trBase[0] = limbPitchBase;
;2680:	limb->s.apos.trBase[1] = ent->client->ps.viewangles[1];
;2681:	limb->s.apos.trBase[2] = limbRollBase;
;2682:	*/
;2683:	if (ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $969
line 2684
;2684:	{
line 2685
;2685:		limb->s.apos.trBase[1] = ent->client->ps.viewangles[1];
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 2686
;2686:	}
ADDRGP4 $970
JUMPV
LABELV $969
line 2688
;2687:	else
;2688:	{
line 2689
;2689:		limb->s.apos.trBase[1] = ent->r.currentAngles[1];
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRF4
ASGNF4
line 2690
;2690:	}
LABELV $970
line 2692
;2691:
;2692:	VectorClear( limb->s.apos.trDelta );
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 76
INDIRF4
ASGNF4
line 2706
;2693:
;2694:	/*
;2695:	limb->s.apos.trDelta[0] = Q_irand( -300, 300 );
;2696:	limb->s.apos.trDelta[2] = Q_irand( -300, 300 );
;2697:	limb->s.apos.trDelta[1] = Q_irand( -300, 300 );
;2698:
;2699:	if (limbType == G2_MODELPART_WAIST)
;2700:	{
;2701:		limb->s.apos.trDelta[0] = Q_irand( -60, 60 );
;2702:		limb->s.apos.trDelta[2] = Q_irand( -60, 60 );
;2703:		limb->s.apos.trDelta[1] = Q_irand( -60, 60 );
;2704:	}
;2705:	*/
;2706:	VectorClear(limb->s.apos.trDelta);
ADDRLP4 84
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 84
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 84
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 84
INDIRF4
ASGNF4
line 2708
;2707:
;2708:	limb->s.apos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2709
;2709:	limb->s.apos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 2
ASGNI4
line 2711
;2710:
;2711:	limb->s.modelGhoul2 = limbType;
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 2712
;2712:	limb->s.g2radius = 200;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 200
ASGNI4
line 2713
;2713:	if (ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $972
line 2714
;2714:	{
line 2715
;2715:		limb->s.modelindex = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 2716
;2716:		limb->s.modelindex2 = deathAnim;
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
ADDRFP4 20
INDIRI4
ASGNI4
line 2717
;2717:	}
ADDRGP4 $973
JUMPV
LABELV $972
line 2719
;2718:	else
;2719:	{
line 2720
;2720:		limb->s.modelindex = -1;
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 -1
ASGNI4
line 2721
;2721:		limb->s.otherEntityNum2 = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 2722
;2722:	}
LABELV $973
line 2724
;2723:
;2724:	trap_LinkEntity( limb );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2725
;2725:}
LABELV $951
endproc G_Dismember 88 8
export DismembermentTest
proc DismembermentTest 16 24
line 2728
;2726:
;2727:void DismembermentTest(gentity_t *self)
;2728:{
line 2729
;2729:	int sect = G2_MODELPART_HEAD;
ADDRLP4 0
CNSTI4 10
ASGNI4
line 2731
;2730:	vec3_t boltPoint;
;2731:	G_GetDismemberBolt(self, boltPoint, sect);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_GetDismemberBolt
CALLV
pop
line 2732
;2732:	G_Dismember( self, boltPoint, sect, 90, 0, BOTH_DEATH1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTF4 1119092736
ARGF4
CNSTF4 0
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 G_Dismember
CALLV
pop
line 2733
;2733:}
LABELV $974
endproc DismembermentTest 16 24
export DismembermentByNum
proc DismembermentByNum 20 24
line 2736
;2734:
;2735:void DismembermentByNum(gentity_t *self, int num)
;2736:{
line 2737
;2737:	int sect = G2_MODELPART_HEAD;
ADDRLP4 0
CNSTI4 10
ASGNI4
line 2740
;2738:	vec3_t boltPoint;
;2739:
;2740:	switch (num)
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $977
ADDRLP4 16
INDIRI4
CNSTI4 6
GTI4 $977
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $985
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $985
address $978
address $979
address $980
address $981
address $982
address $983
address $984
code
line 2741
;2741:	{
LABELV $978
line 2743
;2742:	case 0:
;2743:		sect = G2_MODELPART_HEAD;
ADDRLP4 0
CNSTI4 10
ASGNI4
line 2744
;2744:		break;
ADDRGP4 $977
JUMPV
LABELV $979
line 2746
;2745:	case 1:
;2746:		sect = G2_MODELPART_WAIST;
ADDRLP4 0
CNSTI4 11
ASGNI4
line 2747
;2747:		break;
ADDRGP4 $977
JUMPV
LABELV $980
line 2749
;2748:	case 2:
;2749:		sect = G2_MODELPART_LARM;
ADDRLP4 0
CNSTI4 12
ASGNI4
line 2750
;2750:		break;
ADDRGP4 $977
JUMPV
LABELV $981
line 2752
;2751:	case 3:
;2752:		sect = G2_MODELPART_RARM;
ADDRLP4 0
CNSTI4 13
ASGNI4
line 2753
;2753:		break;
ADDRGP4 $977
JUMPV
LABELV $982
line 2755
;2754:	case 4:
;2755:		sect = G2_MODELPART_RHAND;
ADDRLP4 0
CNSTI4 14
ASGNI4
line 2756
;2756:		break;
ADDRGP4 $977
JUMPV
LABELV $983
line 2758
;2757:	case 5:
;2758:		sect = G2_MODELPART_LLEG;
ADDRLP4 0
CNSTI4 15
ASGNI4
line 2759
;2759:		break;
ADDRGP4 $977
JUMPV
LABELV $984
line 2761
;2760:	case 6:
;2761:		sect = G2_MODELPART_RLEG;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 2762
;2762:		break;
line 2764
;2763:	default:
;2764:		break;
LABELV $977
line 2767
;2765:	}
;2766:
;2767:	G_GetDismemberBolt(self, boltPoint, sect);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_GetDismemberBolt
CALLV
pop
line 2768
;2768:	G_Dismember( self, boltPoint, sect, 90, 0, BOTH_DEATH1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTF4 1119092736
ARGF4
CNSTF4 0
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 G_Dismember
CALLV
pop
line 2769
;2769:}
LABELV $975
endproc DismembermentByNum 20 24
lit
align 4
LABELV $987
byte 4 0
byte 4 0
byte 4 0
export G_GetHitQuad
code
proc G_GetHitQuad 68 16
line 2772
;2770:
;2771:int G_GetHitQuad( gentity_t *self, vec3_t hitloc )
;2772:{
line 2773
;2773:	vec3_t diff, fwdangles={0,0,0}, right;
ADDRLP4 36
ADDRGP4 $987
INDIRB
ASGNB 12
line 2777
;2774:	vec3_t clEye;
;2775:	float rightdot;
;2776:	float zdiff;
;2777:	int hitLoc = -1;
ADDRLP4 48
CNSTI4 -1
ASGNI4
line 2779
;2778:
;2779:	if (self->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $988
line 2780
;2780:	{
line 2781
;2781:		VectorCopy(self->client->ps.origin, clEye);
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
line 2782
;2782:		clEye[2] += self->client->ps.viewheight;
ADDRLP4 12+8
ADDRLP4 12+8
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
line 2783
;2783:	}
ADDRGP4 $989
JUMPV
LABELV $988
line 2785
;2784:	else
;2785:	{
line 2786
;2786:		VectorCopy(self->s.pos.trBase, clEye);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2787
;2787:		clEye[2] += 16;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 2788
;2788:	}
LABELV $989
line 2790
;2789:
;2790:	VectorSubtract( hitloc, clEye, diff );
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 60
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 2791
;2791:	diff[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2792
;2792:	VectorNormalize( diff );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2794
;2793:
;2794:	if (self->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $997
line 2795
;2795:	{
line 2796
;2796:		fwdangles[1] = self->client->ps.viewangles[1];
ADDRLP4 36+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 2797
;2797:	}
ADDRGP4 $998
JUMPV
LABELV $997
line 2799
;2798:	else
;2799:	{
line 2800
;2800:		fwdangles[1] = self->s.apos.trBase[1];
ADDRLP4 36+4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ASGNF4
line 2801
;2801:	}
LABELV $998
line 2803
;2802:	// Ultimately we might care if the shot was ahead or behind, but for now, just quadrant is fine.
;2803:	AngleVectors( fwdangles, NULL, right, NULL );
ADDRLP4 36
ARGP4
ADDRLP4 64
CNSTP4 0
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2805
;2804:
;2805:	rightdot = DotProduct(right, diff);
ADDRLP4 56
ADDRLP4 24
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 24+4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 24+8
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2806
;2806:	zdiff = hitloc[2] - clEye[2];
ADDRLP4 52
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 2808
;2807:	
;2808:	if ( zdiff > 0 )
ADDRLP4 52
INDIRF4
CNSTF4 0
LEF4 $1006
line 2809
;2809:	{
line 2810
;2810:		if ( rightdot > 0.3 )
ADDRLP4 56
INDIRF4
CNSTF4 1050253722
LEF4 $1008
line 2811
;2811:		{
line 2812
;2812:			hitLoc = G2_MODELPART_RARM;
ADDRLP4 48
CNSTI4 13
ASGNI4
line 2813
;2813:		}
ADDRGP4 $1007
JUMPV
LABELV $1008
line 2814
;2814:		else if ( rightdot < -0.3 )
ADDRLP4 56
INDIRF4
CNSTF4 3197737370
GEF4 $1010
line 2815
;2815:		{
line 2816
;2816:			hitLoc = G2_MODELPART_LARM;
ADDRLP4 48
CNSTI4 12
ASGNI4
line 2817
;2817:		}
ADDRGP4 $1007
JUMPV
LABELV $1010
line 2819
;2818:		else
;2819:		{
line 2820
;2820:			hitLoc = G2_MODELPART_HEAD;
ADDRLP4 48
CNSTI4 10
ASGNI4
line 2821
;2821:		}
line 2822
;2822:	}
ADDRGP4 $1007
JUMPV
LABELV $1006
line 2823
;2823:	else if ( zdiff > -20 )
ADDRLP4 52
INDIRF4
CNSTF4 3248488448
LEF4 $1012
line 2824
;2824:	{
line 2825
;2825:		if ( rightdot > 0.1 )
ADDRLP4 56
INDIRF4
CNSTF4 1036831949
LEF4 $1014
line 2826
;2826:		{
line 2827
;2827:			hitLoc = G2_MODELPART_RARM;
ADDRLP4 48
CNSTI4 13
ASGNI4
line 2828
;2828:		}
ADDRGP4 $1013
JUMPV
LABELV $1014
line 2829
;2829:		else if ( rightdot < -0.1 )
ADDRLP4 56
INDIRF4
CNSTF4 3184315597
GEF4 $1016
line 2830
;2830:		{
line 2831
;2831:			hitLoc = G2_MODELPART_LARM;
ADDRLP4 48
CNSTI4 12
ASGNI4
line 2832
;2832:		}
ADDRGP4 $1013
JUMPV
LABELV $1016
line 2834
;2833:		else
;2834:		{
line 2835
;2835:			hitLoc = G2_MODELPART_HEAD;
ADDRLP4 48
CNSTI4 10
ASGNI4
line 2836
;2836:		}
line 2837
;2837:	}
ADDRGP4 $1013
JUMPV
LABELV $1012
line 2839
;2838:	else
;2839:	{
line 2840
;2840:		if ( rightdot >= 0 )
ADDRLP4 56
INDIRF4
CNSTF4 0
LTF4 $1018
line 2841
;2841:		{
line 2842
;2842:			hitLoc = G2_MODELPART_RLEG;
ADDRLP4 48
CNSTI4 16
ASGNI4
line 2843
;2843:		}
ADDRGP4 $1019
JUMPV
LABELV $1018
line 2845
;2844:		else
;2845:		{
line 2846
;2846:			hitLoc = G2_MODELPART_LLEG;
ADDRLP4 48
CNSTI4 15
ASGNI4
line 2847
;2847:		}
LABELV $1019
line 2848
;2848:	}
LABELV $1013
LABELV $1007
line 2850
;2849:
;2850:	return hitLoc;
ADDRLP4 48
INDIRI4
RETI4
LABELV $986
endproc G_GetHitQuad 68 16
data
export gGAvoidDismember
align 4
LABELV gGAvoidDismember
byte 4 0
export G_CheckForDismemberment
code
proc G_CheckForDismemberment 36 24
line 2856
;2851:}
;2852:
;2853:int gGAvoidDismember = 0;
;2854:
;2855:void G_CheckForDismemberment(gentity_t *ent, vec3_t point, int damage, int deathAnim)
;2856:{
line 2857
;2857:	int hitLoc, hitLocUse = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 2859
;2858:	vec3_t boltPoint;
;2859:	int dismember = g_dismember.integer;
ADDRLP4 8
ADDRGP4 g_dismember+12
INDIRI4
ASGNI4
line 2861
;2860:
;2861:	if (!dismember)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1022
line 2862
;2862:	{
line 2863
;2863:		return;
ADDRGP4 $1020
JUMPV
LABELV $1022
line 2866
;2864:	}
;2865:
;2866:	if (gGAvoidDismember == 1)
ADDRGP4 gGAvoidDismember
INDIRI4
CNSTI4 1
NEI4 $1024
line 2867
;2867:	{
line 2868
;2868:		return;
ADDRGP4 $1020
JUMPV
LABELV $1024
line 2871
;2869:	}
;2870:
;2871:	if (!gGAvoidDismember != 2)
ADDRGP4 gGAvoidDismember
INDIRI4
CNSTI4 0
NEI4 $1029
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $1030
JUMPV
LABELV $1029
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $1030
ADDRLP4 24
INDIRI4
CNSTI4 2
EQI4 $1026
line 2872
;2872:	{ //this means do the dismemberment regardless of randomness and damage
line 2873
;2873:		if (Q_irand(0, 100) > dismember)
CNSTI4 0
ARGI4
CNSTI4 100
ARGI4
ADDRLP4 28
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $1031
line 2874
;2874:		{
line 2875
;2875:			return;
ADDRGP4 $1020
JUMPV
LABELV $1031
line 2878
;2876:		}
;2877:
;2878:		if (damage < 20)
ADDRFP4 8
INDIRI4
CNSTI4 20
GEI4 $1033
line 2879
;2879:		{
line 2880
;2880:			return;
ADDRGP4 $1020
JUMPV
LABELV $1033
line 2882
;2881:		}
;2882:	}
LABELV $1026
line 2884
;2883:
;2884:	if (gGAvoidDismember == 2)
ADDRGP4 gGAvoidDismember
INDIRI4
CNSTI4 2
NEI4 $1035
line 2885
;2885:	{
line 2886
;2886:		hitLoc = HL_HAND_RT;
ADDRLP4 4
CNSTI4 14
ASGNI4
line 2887
;2887:	}
ADDRGP4 $1036
JUMPV
LABELV $1035
line 2889
;2888:	else
;2889:	{
line 2890
;2890:		hitLoc = G_GetHitLocation( ent, point );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 G_GetHitLocation
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
ASGNI4
line 2891
;2891:	}
LABELV $1036
line 2893
;2892:
;2893:	switch(hitLoc)
ADDRLP4 28
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
LTI4 $1037
ADDRLP4 28
INDIRI4
CNSTI4 16
GTI4 $1037
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1046-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1046
address $1039
address $1040
address $1039
address $1040
address $1041
address $1037
address $1037
address $1037
address $1037
address $1037
address $1037
address $1042
address $1044
address $1043
address $1044
address $1045
code
line 2894
;2894:	{
LABELV $1039
line 2897
;2895:	case HL_FOOT_RT:
;2896:	case HL_LEG_RT:
;2897:		hitLocUse = G2_MODELPART_RLEG;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 2898
;2898:		break;
ADDRGP4 $1038
JUMPV
LABELV $1040
line 2901
;2899:	case HL_FOOT_LT:
;2900:	case HL_LEG_LT:
;2901:		hitLocUse = G2_MODELPART_LLEG;
ADDRLP4 0
CNSTI4 15
ASGNI4
line 2902
;2902:		break;
ADDRGP4 $1038
JUMPV
LABELV $1041
line 2905
;2903:		
;2904:	case HL_WAIST:
;2905:		hitLocUse = G2_MODELPART_WAIST;
ADDRLP4 0
CNSTI4 11
ASGNI4
line 2906
;2906:		break;
ADDRGP4 $1038
JUMPV
LABELV $1042
line 2917
;2907:		/*
;2908:	case HL_BACK_RT:
;2909:	case HL_BACK_LT:
;2910:	case HL_BACK:
;2911:	case HL_CHEST_RT:
;2912:	case HL_CHEST_LT:
;2913:	case HL_CHEST:
;2914:		break;
;2915:		*/
;2916:	case HL_ARM_RT:
;2917:		hitLocUse = G2_MODELPART_RARM;
ADDRLP4 0
CNSTI4 13
ASGNI4
line 2918
;2918:		break;
ADDRGP4 $1038
JUMPV
LABELV $1043
line 2920
;2919:	case HL_HAND_RT:
;2920:		hitLocUse = G2_MODELPART_RHAND;
ADDRLP4 0
CNSTI4 14
ASGNI4
line 2921
;2921:		break;
ADDRGP4 $1038
JUMPV
LABELV $1044
line 2924
;2922:	case HL_ARM_LT:
;2923:	case HL_HAND_LT:
;2924:		hitLocUse = G2_MODELPART_LARM;
ADDRLP4 0
CNSTI4 12
ASGNI4
line 2925
;2925:		break;
ADDRGP4 $1038
JUMPV
LABELV $1045
line 2927
;2926:	case HL_HEAD:
;2927:		hitLocUse = G2_MODELPART_HEAD;
ADDRLP4 0
CNSTI4 10
ASGNI4
line 2928
;2928:		break;
ADDRGP4 $1038
JUMPV
LABELV $1037
line 2930
;2929:	default:
;2930:		hitLocUse = G_GetHitQuad(ent, point);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 G_GetHitQuad
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 32
INDIRI4
ASGNI4
line 2931
;2931:		break;
LABELV $1038
line 2934
;2932:	}
;2933:
;2934:	if (hitLocUse == -1)
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $1048
line 2935
;2935:	{
line 2936
;2936:		return;
ADDRGP4 $1020
JUMPV
LABELV $1048
line 2939
;2937:	}
;2938:
;2939:	if (ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1050
line 2940
;2940:	{
line 2941
;2941:		G_GetDismemberBolt(ent, boltPoint, hitLocUse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_GetDismemberBolt
CALLV
pop
line 2942
;2942:		if ( g_austrian.integer 
ADDRGP4 g_austrian+12
INDIRI4
CNSTI4 0
EQI4 $1051
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $1051
line 2944
;2943:			&& g_gametype.integer == GT_TOURNAMENT )
;2944:		{
line 2945
;2945:			G_LogPrintf( "Duel Dismemberment: %s dismembered at %s\n", ent->client->pers.netname, hitLocName[hitLoc] );
ADDRGP4 $1056
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 hitLocName
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 2946
;2946:		}
line 2947
;2947:	}
ADDRGP4 $1051
JUMPV
LABELV $1050
line 2949
;2948:	else
;2949:	{
line 2950
;2950:		G_GetDismemberLoc(ent, boltPoint, hitLocUse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_GetDismemberLoc
CALLV
pop
line 2951
;2951:	}
LABELV $1051
line 2952
;2952:	G_Dismember(ent, boltPoint, hitLocUse, 90, 0, deathAnim);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTF4 1119092736
ARGF4
CNSTF4 0
ARGF4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 G_Dismember
CALLV
pop
line 2953
;2953:}
LABELV $1020
endproc G_CheckForDismemberment 36 24
export G_ThereIsAMaster
proc G_ThereIsAMaster 20 0
line 2956
;2954:
;2955:qboolean G_ThereIsAMaster(void)
;2956:{
line 2957
;2957:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1059
JUMPV
LABELV $1058
line 2961
;2958:	gentity_t *ent;
;2959:
;2960:	while (i < MAX_CLIENTS)
;2961:	{
line 2962
;2962:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 852
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2964
;2963:
;2964:		if (ent && ent->client && ent->client->ps.isJediMaster)
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $1061
ADDRLP4 16
ADDRLP4 0
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
EQU4 $1061
ADDRLP4 16
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1061
line 2965
;2965:		{
line 2966
;2966:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1057
JUMPV
LABELV $1061
line 2969
;2967:		}
;2968:
;2969:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2970
;2970:	}
LABELV $1059
line 2960
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1058
line 2972
;2971:
;2972:	return qfalse;
CNSTI4 0
RETI4
LABELV $1057
endproc G_ThereIsAMaster 20 0
export G_Damage
proc G_Damage 212 32
line 3002
;2973:}
;2974:
;2975:/*
;2976:============
;2977:T_Damage
;2978:
;2979:targ		entity that is being damaged
;2980:inflictor	entity that is causing the damage
;2981:attacker	entity that caused the inflictor to damage targ
;2982:	example: targ=monster, inflictor=rocket, attacker=player
;2983:
;2984:dir			direction of the attack for knockback
;2985:point		point at which the damage is being inflicted, used for headshots
;2986:damage		amount of damage being inflicted
;2987:knockback	force to be applied against targ as a result of the damage
;2988:
;2989:inflictor, attacker, dir, and point can be NULL for environmental effects
;2990:
;2991:dflags		these flags are used to control how T_Damage works
;2992:	DAMAGE_RADIUS			damage was indirect (from a nearby explosion)
;2993:	DAMAGE_NO_ARMOR			armor does not protect from this damage
;2994:	DAMAGE_NO_KNOCKBACK		do not affect velocity, just view angles
;2995:	DAMAGE_NO_PROTECTION	kills godmode, armor, everything
;2996:	DAMAGE_HALF_ABSORB		half shields, half health
;2997:	DAMAGE_HALF_ARMOR_REDUCTION		Any damage that shields incur is halved
;2998:============
;2999:*/
;3000:
;3001:void G_Damage( gentity_t *targ, gentity_t *inflictor, gentity_t *attacker,
;3002:			   vec3_t dir, vec3_t point, int damage, int dflags, int mod ) {
line 3009
;3003:	gclient_t	*client;
;3004:	int			take;
;3005:	int			save;
;3006:	int			asave;
;3007:	int			knockback;
;3008:	int			max;
;3009:	int			subamt = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 3010
;3010:	float		famt = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 3011
;3011:	float		hamt = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
line 3012
;3012:	float		shieldAbsorbed = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 3014
;3013:
;3014:	if (targ && targ->damageRedirect)
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1064
ADDRLP4 40
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1064
line 3015
;3015:	{
line 3016
;3016:		G_Damage(&g_entities[targ->damageRedirectTo], inflictor, attacker, dir, point, damage, dflags, mod);
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
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
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 3017
;3017:		return;
ADDRGP4 $1063
JUMPV
LABELV $1064
line 3020
;3018:	}
;3019:
;3020:	if (!targ->takedamage) {
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1066
line 3021
;3021:		return;
ADDRGP4 $1063
JUMPV
LABELV $1066
line 3024
;3022:	}
;3023:
;3024:	if (targ && targ->client && targ->client->ps.duelInProgress)
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
CNSTU4 0
ASGNU4
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRLP4 48
INDIRU4
EQU4 $1068
ADDRLP4 52
ADDRLP4 44
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CVPU4 4
ADDRLP4 48
INDIRU4
EQU4 $1068
ADDRLP4 52
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1068
line 3025
;3025:	{
line 3026
;3026:		if (attacker && attacker->client && attacker->s.number != targ->client->ps.duelIndex)
ADDRLP4 56
ADDRFP4 8
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
EQU4 $1070
ADDRLP4 64
CNSTI4 408
ASGNI4
ADDRLP4 56
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 60
INDIRU4
EQU4 $1070
ADDRLP4 56
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
EQI4 $1070
line 3027
;3027:		{
line 3028
;3028:			return;
ADDRGP4 $1063
JUMPV
LABELV $1070
line 3030
;3029:		}
;3030:		else if (attacker && attacker->client && !(mod == MOD_SABER || mod == MOD_FALLING))
ADDRLP4 68
ADDRFP4 8
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
EQU4 $1072
ADDRLP4 68
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $1072
ADDRLP4 76
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 3
EQI4 $1072
ADDRLP4 76
INDIRI4
CNSTI4 34
EQI4 $1072
line 3031
;3031:		{
line 3032
;3032:			return;
ADDRGP4 $1063
JUMPV
LABELV $1072
line 3034
;3033:		}
;3034:	}
LABELV $1068
line 3035
;3035:	if (attacker && attacker->client && attacker->client->ps.duelInProgress)
ADDRLP4 56
ADDRFP4 8
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
EQU4 $1074
ADDRLP4 64
ADDRLP4 56
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRLP4 60
INDIRU4
EQU4 $1074
ADDRLP4 64
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1074
line 3036
;3036:	{
line 3037
;3037:		if (targ && targ->client && targ->s.number != attacker->client->ps.duelIndex)
ADDRLP4 68
ADDRFP4 0
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
EQU4 $1076
ADDRLP4 76
CNSTI4 408
ASGNI4
ADDRLP4 68
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $1076
ADDRLP4 68
INDIRP4
INDIRI4
ADDRFP4 8
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
EQI4 $1076
line 3038
;3038:		{
line 3039
;3039:			return;
ADDRGP4 $1063
JUMPV
LABELV $1076
line 3041
;3040:		}
;3041:		else if (targ && targ->client && !(mod == MOD_SABER || mod == MOD_FALLING))
ADDRLP4 80
ADDRFP4 0
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
EQU4 $1078
ADDRLP4 80
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 84
INDIRU4
EQU4 $1078
ADDRLP4 88
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 3
EQI4 $1078
ADDRLP4 88
INDIRI4
CNSTI4 34
EQI4 $1078
line 3042
;3042:		{
line 3043
;3043:			return;
ADDRGP4 $1063
JUMPV
LABELV $1078
line 3045
;3044:		}
;3045:	}
LABELV $1074
line 3047
;3046:
;3047:	if (targ && targ->client && (targ->client->ps.fd.forcePowersActive & (1 << FP_RAGE)))
ADDRLP4 68
ADDRFP4 0
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
EQU4 $1080
ADDRLP4 76
ADDRLP4 68
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $1080
ADDRLP4 76
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1080
line 3048
;3048:	{
line 3049
;3049:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 3050
;3050:	}
LABELV $1080
line 3054
;3051:
;3052:	// the intermission has allready been qualified for, so don't
;3053:	// allow any extra scoring
;3054:	if ( level.intermissionQueued ) {
ADDRGP4 level+9004
INDIRI4
CNSTI4 0
EQI4 $1082
line 3055
;3055:		return;
ADDRGP4 $1063
JUMPV
LABELV $1082
line 3057
;3056:	}
;3057:	if ( !inflictor ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1085
line 3058
;3058:		inflictor = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 4
ADDRGP4 g_entities+870744
ASGNP4
line 3059
;3059:	}
LABELV $1085
line 3060
;3060:	if ( !attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1088
line 3061
;3061:		attacker = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 8
ADDRGP4 g_entities+870744
ASGNP4
line 3062
;3062:	}
LABELV $1088
line 3067
;3063:
;3064:	// shootable doors / buttons don't actually have any health
;3065:
;3066:	//if boltpoint4 == 1 then it's glass or a breakable and those do have health
;3067:	if ( targ->s.eType == ET_MOVER && targ->boltpoint4 != 1 ) {
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 6
NEI4 $1091
ADDRLP4 80
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1091
line 3068
;3068:		if ( targ->use && targ->moverState == MOVER_POS1 ) {
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1063
ADDRLP4 84
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1063
line 3069
;3069:			targ->use( targ, inflictor, attacker );
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CALLV
pop
line 3070
;3070:		}
line 3071
;3071:		return;
ADDRGP4 $1063
JUMPV
LABELV $1091
line 3075
;3072:	}
;3073:	// reduce damage by the attacker's handicap value
;3074:	// unless they are rocket jumping
;3075:	if ( attacker->client && attacker != targ ) {
ADDRLP4 84
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1095
ADDRLP4 84
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $1095
line 3076
;3076:		max = attacker->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 36
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 3077
;3077:		damage = damage * max / 100;
ADDRFP4 20
ADDRFP4 20
INDIRI4
ADDRLP4 36
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 3078
;3078:	}
LABELV $1095
line 3080
;3079:
;3080:	client = targ->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 3082
;3081:
;3082:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1097
line 3083
;3083:		if ( client->noclip ) {
ADDRLP4 0
INDIRP4
CNSTI4 1764
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1099
line 3084
;3084:			return;
ADDRGP4 $1063
JUMPV
LABELV $1099
line 3086
;3085:		}
;3086:	}
LABELV $1097
line 3088
;3087:
;3088:	if ( !dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1101
line 3089
;3089:		dflags |= DAMAGE_NO_KNOCKBACK;
ADDRFP4 24
ADDRFP4 24
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 3090
;3090:	} else {
ADDRGP4 $1102
JUMPV
LABELV $1101
line 3091
;3091:		VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3092
;3092:	}
LABELV $1102
line 3094
;3093:
;3094:	knockback = damage;
ADDRLP4 8
ADDRFP4 20
INDIRI4
ASGNI4
line 3095
;3095:	if ( knockback > 200 ) {
ADDRLP4 8
INDIRI4
CNSTI4 200
LEI4 $1103
line 3096
;3096:		knockback = 200;
ADDRLP4 8
CNSTI4 200
ASGNI4
line 3097
;3097:	}
LABELV $1103
line 3098
;3098:	if ( targ->flags & FL_NO_KNOCKBACK ) {
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $1105
line 3099
;3099:		knockback = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3100
;3100:	}
LABELV $1105
line 3101
;3101:	if ( dflags & DAMAGE_NO_KNOCKBACK ) {
ADDRFP4 24
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1107
line 3102
;3102:		knockback = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3103
;3103:	}
LABELV $1107
line 3105
;3104:
;3105:	if (targ && targ->client && targ->client->ps.usingATST)
ADDRLP4 88
ADDRFP4 0
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
EQU4 $1109
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
EQU4 $1109
ADDRLP4 96
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1109
line 3106
;3106:	{
line 3107
;3107:		knockback = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3108
;3108:	}
LABELV $1109
line 3111
;3109:
;3110:	// figure momentum add, even if the damage won't be taken
;3111:	if ( knockback && targ->client ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1111
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1111
line 3115
;3112:		vec3_t	kvel;
;3113:		float	mass;
;3114:
;3115:		mass = 200;
ADDRLP4 112
CNSTF4 1128792064
ASGNF4
line 3117
;3116:
;3117:		if (mod == MOD_SABER)
ADDRFP4 28
INDIRI4
CNSTI4 3
NEI4 $1113
line 3118
;3118:		{
line 3119
;3119:			VectorScale (dir, (g_knockback.value * (float)knockback / mass)*g_saberDmgVelocityScale.integer, kvel);
ADDRLP4 116
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 120
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 124
ADDRLP4 112
INDIRF4
ASGNF4
ADDRLP4 100
ADDRLP4 116
INDIRP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 120
INDIRF4
MULF4
ADDRLP4 124
INDIRF4
DIVF4
ADDRGP4 g_saberDmgVelocityScale+12
INDIRI4
CVIF4 4
MULF4
MULF4
ASGNF4
ADDRLP4 100+4
ADDRLP4 116
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 120
INDIRF4
MULF4
ADDRLP4 124
INDIRF4
DIVF4
ADDRGP4 g_saberDmgVelocityScale+12
INDIRI4
CVIF4 4
MULF4
MULF4
ASGNF4
ADDRLP4 100+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
ADDRLP4 112
INDIRF4
DIVF4
ADDRGP4 g_saberDmgVelocityScale+12
INDIRI4
CVIF4 4
MULF4
MULF4
ASGNF4
line 3120
;3120:		}
ADDRGP4 $1114
JUMPV
LABELV $1113
line 3122
;3121:		else
;3122:		{
line 3123
;3123:			VectorScale (dir, g_knockback.value * (float)knockback / mass, kvel);
ADDRLP4 116
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 120
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 124
ADDRLP4 112
INDIRF4
ASGNF4
ADDRLP4 100
ADDRLP4 116
INDIRP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 120
INDIRF4
MULF4
ADDRLP4 124
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 100+4
ADDRLP4 116
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 120
INDIRF4
MULF4
ADDRLP4 124
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 100+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
ADDRLP4 112
INDIRF4
DIVF4
MULF4
ASGNF4
line 3124
;3124:		}
LABELV $1114
line 3125
;3125:		VectorAdd (targ->client->ps.velocity, kvel, targ->client->ps.velocity);
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRF4
ADDRLP4 100
INDIRF4
ADDF4
ASGNF4
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRF4
ADDRLP4 100+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRF4
ADDRLP4 100+8
INDIRF4
ADDF4
ASGNF4
line 3127
;3126:
;3127:		if (attacker && attacker->client && attacker != targ)
ADDRLP4 128
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 132
ADDRLP4 128
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 136
CNSTU4 0
ASGNU4
ADDRLP4 132
INDIRU4
ADDRLP4 136
INDIRU4
EQU4 $1130
ADDRLP4 128
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 136
INDIRU4
EQU4 $1130
ADDRLP4 132
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $1130
line 3128
;3128:		{
line 3129
;3129:			targ->client->ps.otherKiller = attacker->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 760
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 3130
;3130:			targ->client->ps.otherKillerTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 764
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 3131
;3131:			targ->client->ps.otherKillerDebounceTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 3132
;3132:		}
LABELV $1130
line 3135
;3133:		// set the timer so that the other client can't cancel
;3134:		// out the movement immediately
;3135:		if ( !targ->client->ps.pm_time && (g_saberDmgVelocityScale.integer || mod != MOD_SABER) ) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
NEI4 $1134
ADDRGP4 g_saberDmgVelocityScale+12
INDIRI4
ADDRLP4 140
INDIRI4
NEI4 $1137
ADDRFP4 28
INDIRI4
CNSTI4 3
EQI4 $1134
LABELV $1137
line 3138
;3136:			int		t;
;3137:
;3138:			t = knockback * 2;
ADDRLP4 144
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 3139
;3139:			if ( t < 50 ) {
ADDRLP4 144
INDIRI4
CNSTI4 50
GEI4 $1138
line 3140
;3140:				t = 50;
ADDRLP4 144
CNSTI4 50
ASGNI4
line 3141
;3141:			}
LABELV $1138
line 3142
;3142:			if ( t > 200 ) {
ADDRLP4 144
INDIRI4
CNSTI4 200
LEI4 $1140
line 3143
;3143:				t = 200;
ADDRLP4 144
CNSTI4 200
ASGNI4
line 3144
;3144:			}
LABELV $1140
line 3145
;3145:			targ->client->ps.pm_time = t;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 144
INDIRI4
ASGNI4
line 3146
;3146:			targ->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 148
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 3147
;3147:		}
LABELV $1134
line 3148
;3148:	}
LABELV $1111
line 3151
;3149:
;3150:	
;3151:	if ( g_trueJedi.integer && client )
ADDRGP4 g_trueJedi+12
INDIRI4
CNSTI4 0
EQI4 $1142
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1142
line 3152
;3152:	{//less explosive damage for jedi, more saber damage for non-jedi
line 3153
;3153:		if ( client->ps.trueJedi )
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1145
line 3154
;3154:		{//if the target is a trueJedi, reduce splash and explosive damage to 1/2
line 3155
;3155:			switch ( mod )
ADDRLP4 100
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 12
LTI4 $1146
ADDRLP4 100
INDIRI4
CNSTI4 26
GTI4 $1146
ADDRLP4 100
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1150-48
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1150
address $1149
address $1149
address $1146
address $1149
address $1146
address $1149
address $1149
address $1149
address $1149
address $1149
address $1149
address $1149
address $1149
address $1149
address $1149
code
line 3156
;3156:			{
LABELV $1149
line 3170
;3157:			case MOD_REPEATER_ALT:
;3158:			case MOD_REPEATER_ALT_SPLASH:
;3159:			case MOD_DEMP2_ALT:
;3160:			case MOD_FLECHETTE_ALT_SPLASH:
;3161:			case MOD_ROCKET:
;3162:			case MOD_ROCKET_SPLASH:
;3163:			case MOD_ROCKET_HOMING:
;3164:			case MOD_ROCKET_HOMING_SPLASH:
;3165:			case MOD_THERMAL:
;3166:			case MOD_THERMAL_SPLASH:
;3167:			case MOD_TRIP_MINE_SPLASH:
;3168:			case MOD_TIMED_MINE_SPLASH:
;3169:			case MOD_DET_PACK_SPLASH:
;3170:				damage *= 0.75;
ADDRFP4 20
CNSTF4 1061158912
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 3171
;3171:				break;
line 3173
;3172:			}
;3173:		}
ADDRGP4 $1146
JUMPV
LABELV $1145
line 3174
;3174:		else if ( client->ps.trueNonJedi && mod == MOD_SABER )
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1152
ADDRFP4 28
INDIRI4
CNSTI4 3
NEI4 $1152
line 3175
;3175:		{//if the target is a trueNonJedi, take more saber damage... combined with the 1.5 in the w_saber stuff, this is 6 times damage!
line 3176
;3176:			if ( damage < 100 )
ADDRFP4 20
INDIRI4
CNSTI4 100
GEI4 $1154
line 3177
;3177:			{
line 3178
;3178:				damage *= 4;
ADDRFP4 20
ADDRFP4 20
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
line 3179
;3179:				if ( damage > 100 )
ADDRFP4 20
INDIRI4
CNSTI4 100
LEI4 $1156
line 3180
;3180:				{
line 3181
;3181:					damage = 100;
ADDRFP4 20
CNSTI4 100
ASGNI4
line 3182
;3182:				}
LABELV $1156
line 3183
;3183:			}
LABELV $1154
line 3184
;3184:		}
LABELV $1152
LABELV $1146
line 3185
;3185:	}
LABELV $1142
line 3188
;3186:
;3187:	// check for completely getting out of the damage
;3188:	if ( !(dflags & DAMAGE_NO_PROTECTION) ) {
ADDRFP4 24
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $1158
line 3192
;3189:
;3190:		// if TF_NO_FRIENDLY_FIRE is set, don't do damage to the target
;3191:		// if the attacker was on the same team
;3192:		if ( targ != attacker && OnSameTeam (targ, attacker)  ) {
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CVPU4 4
ADDRLP4 104
INDIRP4
CVPU4 4
EQU4 $1160
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $1160
line 3193
;3193:			if ( !g_friendlyFire.integer ) {
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $1162
line 3194
;3194:				return;
ADDRGP4 $1063
JUMPV
LABELV $1162
line 3196
;3195:			}
;3196:		}
LABELV $1160
line 3198
;3197:
;3198:		if (g_gametype.integer == GT_JEDIMASTER && !g_friendlyFire.integer &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $1165
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRGP4 g_friendlyFire+12
INDIRI4
ADDRLP4 112
INDIRI4
NEI4 $1165
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
ADDRLP4 116
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 124
CNSTU4 0
ASGNU4
ADDRLP4 120
INDIRU4
ADDRLP4 124
INDIRU4
EQU4 $1165
ADDRLP4 128
CNSTI4 408
ASGNI4
ADDRLP4 132
ADDRLP4 116
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CVPU4 4
ADDRLP4 124
INDIRU4
EQU4 $1165
ADDRLP4 136
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 136
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 140
INDIRU4
ADDRLP4 124
INDIRU4
EQU4 $1165
ADDRLP4 144
ADDRLP4 136
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CVPU4 4
ADDRLP4 124
INDIRU4
EQU4 $1165
ADDRLP4 120
INDIRU4
ADDRLP4 140
INDIRU4
EQU4 $1165
ADDRLP4 148
CNSTI4 604
ASGNI4
ADDRLP4 132
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
NEI4 $1165
ADDRLP4 144
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
NEI4 $1165
ADDRLP4 152
ADDRGP4 G_ThereIsAMaster
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $1165
line 3202
;3199:			targ && targ->client && attacker && attacker->client &&
;3200:			targ != attacker && !targ->client->ps.isJediMaster && !attacker->client->ps.isJediMaster &&
;3201:			G_ThereIsAMaster())
;3202:		{
line 3203
;3203:			return;
ADDRGP4 $1063
JUMPV
LABELV $1165
line 3206
;3204:		}
;3205:
;3206:		if (targ->client && targ->s.shouldtarget && targ->s.teamowner &&
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
CNSTI4 408
ASGNI4
ADDRLP4 164
CNSTU4 0
ASGNU4
ADDRLP4 156
INDIRP4
ADDRLP4 160
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 164
INDIRU4
EQU4 $1169
ADDRLP4 168
CNSTI4 0
ASGNI4
ADDRLP4 156
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
EQI4 $1169
ADDRLP4 156
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
EQI4 $1169
ADDRLP4 172
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
CVPU4 4
ADDRLP4 164
INDIRU4
EQU4 $1169
ADDRLP4 172
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
EQI4 $1169
ADDRLP4 172
INDIRP4
ADDRLP4 160
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 164
INDIRU4
EQU4 $1169
ADDRLP4 176
ADDRLP4 156
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
ASGNI4
ADDRLP4 176
INDIRI4
ADDRLP4 168
INDIRI4
LTI4 $1169
ADDRLP4 176
INDIRI4
CNSTI4 32
GEI4 $1169
line 3208
;3207:			attacker && attacker->inuse && attacker->client && targ->s.owner >= 0 && targ->s.owner < MAX_CLIENTS)
;3208:		{
line 3209
;3209:			gentity_t *targown = &g_entities[targ->s.owner];
ADDRLP4 180
CNSTI4 852
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3211
;3210:
;3211:			if (targown && targown->inuse && targown->client && OnSameTeam(targown, attacker))
ADDRLP4 184
ADDRLP4 180
INDIRP4
ASGNP4
ADDRLP4 188
CNSTU4 0
ASGNU4
ADDRLP4 184
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1171
ADDRLP4 184
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1171
ADDRLP4 184
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1171
ADDRLP4 184
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
EQI4 $1171
line 3212
;3212:			{
line 3213
;3213:				if (!g_friendlyFire.integer)
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $1173
line 3214
;3214:				{
line 3215
;3215:					return;
ADDRGP4 $1063
JUMPV
LABELV $1173
line 3217
;3216:				}
;3217:			}
LABELV $1171
line 3218
;3218:		}
LABELV $1169
line 3221
;3219:
;3220:		// check for godmode
;3221:		if ( targ->flags & FL_GODMODE ) {
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1176
line 3222
;3222:			return;
ADDRGP4 $1063
JUMPV
LABELV $1176
line 3225
;3223:		}
;3224:
;3225:		if (targ && targ->client && (targ->client->ps.eFlags & EF_INVULNERABLE) &&
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 184
ADDRLP4 180
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 188
CNSTU4 0
ASGNU4
ADDRLP4 184
INDIRU4
ADDRLP4 188
INDIRU4
EQU4 $1178
ADDRLP4 192
CNSTI4 408
ASGNI4
ADDRLP4 196
ADDRLP4 180
INDIRP4
ADDRLP4 192
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1178
ADDRLP4 196
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 67108864
BANDI4
CNSTI4 0
EQI4 $1178
ADDRLP4 200
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 204
ADDRLP4 200
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 204
INDIRU4
ADDRLP4 188
INDIRU4
EQU4 $1178
ADDRLP4 200
INDIRP4
ADDRLP4 192
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1178
ADDRLP4 184
INDIRU4
ADDRLP4 204
INDIRU4
EQU4 $1178
line 3227
;3226:			attacker && attacker->client && targ != attacker)
;3227:		{
line 3228
;3228:			if (targ->client->invulnerableTimer <= level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1752
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GTI4 $1063
line 3229
;3229:			{
line 3230
;3230:				targ->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 208
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 208
INDIRP4
ADDRLP4 208
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 3231
;3231:			}
line 3233
;3232:			else
;3233:			{
line 3234
;3234:				return;
LABELV $1181
line 3236
;3235:			}
;3236:		}
LABELV $1178
line 3237
;3237:	}
LABELV $1158
line 3239
;3238:
;3239:	if (attacker && attacker->client)
ADDRLP4 100
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 104
CNSTU4 0
ASGNU4
ADDRLP4 100
INDIRP4
CVPU4 4
ADDRLP4 104
INDIRU4
EQU4 $1183
ADDRLP4 100
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 104
INDIRU4
EQU4 $1183
line 3240
;3240:	{
line 3241
;3241:		if (targ->teamnodmg &&
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ASGNI4
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 108
INDIRI4
ADDRLP4 112
INDIRI4
EQI4 $1185
ADDRLP4 108
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
NEI4 $1185
ADDRGP4 g_ff_objectives+12
INDIRI4
ADDRLP4 112
INDIRI4
NEI4 $1185
line 3244
;3242:			targ->teamnodmg == attacker->client->sess.sessionTeam &&
;3243:			!g_ff_objectives.integer)
;3244:		{
line 3245
;3245:			return;
ADDRGP4 $1063
JUMPV
LABELV $1185
line 3247
;3246:		}
;3247:	}
LABELV $1183
line 3251
;3248:
;3249:	// battlesuit protects from all radius damage (but takes knockback)
;3250:	// and protects 50% against all damage
;3251:	if ( client && client->ps.powerups[PW_BATTLESUIT] ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1188
ADDRLP4 0
INDIRP4
CNSTI4 352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1188
line 3252
;3252:		G_AddEvent( targ, EV_POWERUP_BATTLESUIT, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 83
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 3253
;3253:		if ( ( dflags & DAMAGE_RADIUS ) || ( mod == MOD_FALLING ) ) {
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $1192
ADDRFP4 28
INDIRI4
CNSTI4 34
NEI4 $1190
LABELV $1192
line 3254
;3254:			return;
ADDRGP4 $1063
JUMPV
LABELV $1190
line 3256
;3255:		}
;3256:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 3257
;3257:	}
LABELV $1188
line 3260
;3258:
;3259:	// add to the attacker's hit counter (if the target isn't a general entity like a prox mine)
;3260:	if ( attacker->client && targ != attacker && targ->health > 0
ADDRLP4 112
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 116
CNSTU4 0
ASGNU4
ADDRLP4 112
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 116
INDIRU4
EQU4 $1193
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CVPU4 4
ADDRLP4 112
INDIRP4
CVPU4 4
EQU4 $1193
ADDRLP4 124
CNSTI4 0
ASGNI4
ADDRLP4 120
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 124
INDIRI4
LEI4 $1193
ADDRLP4 128
ADDRLP4 120
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 3
EQI4 $1193
ADDRLP4 128
INDIRI4
ADDRLP4 124
INDIRI4
EQI4 $1193
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 116
INDIRU4
EQU4 $1193
line 3263
;3261:			&& targ->s.eType != ET_MISSILE
;3262:			&& targ->s.eType != ET_GENERAL
;3263:			&& client) {
line 3264
;3264:		if ( OnSameTeam( targ, attacker ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $1195
line 3265
;3265:			attacker->client->ps.persistant[PERS_HITS]--;
ADDRLP4 136
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3266
;3266:		} else {
ADDRGP4 $1196
JUMPV
LABELV $1195
line 3267
;3267:			attacker->client->ps.persistant[PERS_HITS]++;
ADDRLP4 136
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3268
;3268:		}
LABELV $1196
line 3269
;3269:		attacker->client->ps.persistant[PERS_ATTACKEE_ARMOR] = (targ->health<<8)|(client->ps.stats[STAT_ARMOR]);
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 308
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 8
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
BORI4
ASGNI4
line 3270
;3270:	}
LABELV $1193
line 3274
;3271:
;3272:	// always give half damage if hurting self
;3273:	// calculated after knockback, so rocket jumping works
;3274:	if ( targ == attacker) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
NEU4 $1197
line 3275
;3275:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 3276
;3276:	}
LABELV $1197
line 3278
;3277:
;3278:	if ( damage < 1 ) {
ADDRFP4 20
INDIRI4
CNSTI4 1
GEI4 $1199
line 3279
;3279:		damage = 1;
ADDRFP4 20
CNSTI4 1
ASGNI4
line 3280
;3280:	}
LABELV $1199
line 3281
;3281:	take = damage;
ADDRLP4 4
ADDRFP4 20
INDIRI4
ASGNI4
line 3282
;3282:	save = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 3285
;3283:
;3284:	// save some from armor
;3285:	asave = CheckArmor (targ, take, dflags);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 CheckArmor
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 132
INDIRI4
ASGNI4
line 3287
;3286:
;3287:	if (asave)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1201
line 3288
;3288:	{
line 3289
;3289:		shieldAbsorbed = asave;
ADDRLP4 16
ADDRLP4 12
INDIRI4
CVIF4 4
ASGNF4
line 3290
;3290:	}
LABELV $1201
line 3292
;3291:
;3292:	take -= asave;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 3294
;3293:
;3294:	if (mod == MOD_DEMP2 || mod == MOD_DEMP2_ALT)
ADDRLP4 136
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 14
EQI4 $1205
ADDRLP4 136
INDIRI4
CNSTI4 15
NEI4 $1203
LABELV $1205
line 3295
;3295:	{ //demp2 does full damage to shields, but only 1/3 normal damage to health
line 3296
;3296:		if (take > 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $1206
line 3297
;3297:		{
line 3298
;3298:			take /= 3;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 3
DIVI4
ASGNI4
line 3299
;3299:			if (take < 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $1208
line 3300
;3300:			{
line 3301
;3301:				take = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 3302
;3302:			}
LABELV $1208
line 3303
;3303:		}
LABELV $1206
line 3304
;3304:	}
LABELV $1203
line 3306
;3305:
;3306:	if ( g_debugDamage.integer ) {
ADDRGP4 g_debugDamage+12
INDIRI4
CNSTI4 0
EQI4 $1210
line 3307
;3307:		G_Printf( "%i: client:%i health:%i damage:%i armor:%i\n", level.time, targ->s.number,
ADDRGP4 $1213
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
INDIRI4
ARGI4
ADDRLP4 140
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 3309
;3308:			targ->health, take, asave );
;3309:	}
LABELV $1210
line 3314
;3310:
;3311:	// add to the damage inflicted on a player this frame
;3312:	// the total will be turned into screen blends and view angle kicks
;3313:	// at the end of the frame
;3314:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1215
line 3315
;3315:		if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1217
line 3316
;3316:			client->ps.persistant[PERS_ATTACKER] = attacker->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 3317
;3317:		} else {
ADDRGP4 $1218
JUMPV
LABELV $1217
line 3318
;3318:			client->ps.persistant[PERS_ATTACKER] = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 1022
ASGNI4
line 3319
;3319:		}
LABELV $1218
line 3320
;3320:		client->damage_armor += asave;
ADDRLP4 140
ADDRLP4 0
INDIRP4
CNSTI4 1796
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 3321
;3321:		client->damage_blood += take;
ADDRLP4 144
ADDRLP4 0
INDIRP4
CNSTI4 1800
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 3322
;3322:		client->damage_knockback += knockback;
ADDRLP4 148
ADDRLP4 0
INDIRP4
CNSTI4 1804
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 3323
;3323:		if ( dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1219
line 3324
;3324:			VectorCopy ( dir, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 1808
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 3325
;3325:			client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 1820
ADDP4
CNSTI4 0
ASGNI4
line 3326
;3326:		} else {
ADDRGP4 $1220
JUMPV
LABELV $1219
line 3327
;3327:			VectorCopy ( targ->r.currentOrigin, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 1808
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 3328
;3328:			client->damage_fromWorld = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1820
ADDP4
CNSTI4 1
ASGNI4
line 3329
;3329:		}
LABELV $1220
line 3331
;3330:
;3331:		if (attacker && attacker->client)
ADDRLP4 152
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 156
CNSTU4 0
ASGNU4
ADDRLP4 152
INDIRP4
CVPU4 4
ADDRLP4 156
INDIRU4
EQU4 $1221
ADDRLP4 152
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 156
INDIRU4
EQU4 $1221
line 3332
;3332:		{
line 3333
;3333:			BotDamageNotification(client, attacker);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 BotDamageNotification
CALLV
pop
line 3334
;3334:		}
ADDRGP4 $1222
JUMPV
LABELV $1221
line 3335
;3335:		else if (inflictor && inflictor->client)
ADDRLP4 160
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 164
CNSTU4 0
ASGNU4
ADDRLP4 160
INDIRP4
CVPU4 4
ADDRLP4 164
INDIRU4
EQU4 $1223
ADDRLP4 160
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 164
INDIRU4
EQU4 $1223
line 3336
;3336:		{
line 3337
;3337:			BotDamageNotification(client, inflictor);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotDamageNotification
CALLV
pop
line 3338
;3338:		}
LABELV $1223
LABELV $1222
line 3339
;3339:	}
LABELV $1215
line 3342
;3340:
;3341:	// See if it's the player hurting the emeny flag carrier
;3342:	if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $1229
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $1225
LABELV $1229
line 3343
;3343:		Team_CheckHurtCarrier(targ, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Team_CheckHurtCarrier
CALLV
pop
line 3344
;3344:	}
LABELV $1225
line 3346
;3345:
;3346:	if (targ->client) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1230
line 3348
;3347:		// set the last client who damaged the target
;3348:		targ->client->lasthurt_client = attacker->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1852
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 3349
;3349:		targ->client->lasthurt_mod = mod;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1856
ADDP4
ADDRFP4 28
INDIRI4
ASGNI4
line 3350
;3350:	}
LABELV $1230
line 3352
;3351:
;3352:	if (take && targ->client && (targ->client->ps.fd.forcePowersActive & (1 << FP_PROTECT)))
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 140
INDIRI4
EQI4 $1232
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1232
ADDRLP4 144
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 512
BANDI4
ADDRLP4 140
INDIRI4
EQI4 $1232
line 3353
;3353:	{
line 3354
;3354:		if (targ->client->ps.fd.forcePower)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1234
line 3355
;3355:		{
line 3356
;3356:			int maxtake = take;
ADDRLP4 148
ADDRLP4 4
INDIRI4
ASGNI4
line 3359
;3357:
;3358:			//G_Sound(targ, CHAN_AUTO, protectHitSound);
;3359:			if (targ->client->forcePowerSoundDebounce < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 3004
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1236
line 3360
;3360:			{
line 3361
;3361:				G_PreDefSound(targ->client->ps.origin, PDSOUND_PROTECTHIT);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_PreDefSound
CALLP4
pop
line 3362
;3362:				targ->client->forcePowerSoundDebounce = level.time + 400;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 3004
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 400
ADDI4
ASGNI4
line 3363
;3363:			}
LABELV $1236
line 3365
;3364:
;3365:			if (targ->client->ps.fd.forcePowerLevel[FP_PROTECT] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1240
line 3366
;3366:			{
line 3367
;3367:				famt = 1;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 3368
;3368:				hamt = 0.40;
ADDRLP4 28
CNSTF4 1053609165
ASGNF4
line 3370
;3369:
;3370:				if (maxtake > 100)
ADDRLP4 148
INDIRI4
CNSTI4 100
LEI4 $1241
line 3371
;3371:				{
line 3372
;3372:					maxtake = 100;
ADDRLP4 148
CNSTI4 100
ASGNI4
line 3373
;3373:				}
line 3374
;3374:			}
ADDRGP4 $1241
JUMPV
LABELV $1240
line 3375
;3375:			else if (targ->client->ps.fd.forcePowerLevel[FP_PROTECT] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1244
line 3376
;3376:			{
line 3377
;3377:				famt = 0.5;
ADDRLP4 24
CNSTF4 1056964608
ASGNF4
line 3378
;3378:				hamt = 0.60;
ADDRLP4 28
CNSTF4 1058642330
ASGNF4
line 3380
;3379:
;3380:				if (maxtake > 200)
ADDRLP4 148
INDIRI4
CNSTI4 200
LEI4 $1245
line 3381
;3381:				{
line 3382
;3382:					maxtake = 200;
ADDRLP4 148
CNSTI4 200
ASGNI4
line 3383
;3383:				}
line 3384
;3384:			}
ADDRGP4 $1245
JUMPV
LABELV $1244
line 3385
;3385:			else if (targ->client->ps.fd.forcePowerLevel[FP_PROTECT] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1248
line 3386
;3386:			{
line 3387
;3387:				famt = 0.25;
ADDRLP4 24
CNSTF4 1048576000
ASGNF4
line 3388
;3388:				hamt = 0.80;
ADDRLP4 28
CNSTF4 1061997773
ASGNF4
line 3390
;3389:
;3390:				if (maxtake > 400)
ADDRLP4 148
INDIRI4
CNSTI4 400
LEI4 $1250
line 3391
;3391:				{
line 3392
;3392:					maxtake = 400;
ADDRLP4 148
CNSTI4 400
ASGNI4
line 3393
;3393:				}
LABELV $1250
line 3394
;3394:			}
LABELV $1248
LABELV $1245
LABELV $1241
line 3396
;3395:
;3396:			if (!targ->client->ps.powerups[PW_FORCE_BOON])
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 400
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1252
line 3397
;3397:			{
line 3398
;3398:				targ->client->ps.fd.forcePower -= maxtake*famt;
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
CVIF4 4
ADDRLP4 148
INDIRI4
CVIF4 4
ADDRLP4 24
INDIRF4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 3399
;3399:			}
ADDRGP4 $1253
JUMPV
LABELV $1252
line 3401
;3400:			else
;3401:			{
line 3402
;3402:				targ->client->ps.fd.forcePower -= (maxtake*famt)/2;
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
CVIF4 4
ADDRLP4 148
INDIRI4
CVIF4 4
ADDRLP4 24
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
SUBF4
CVFI4 4
ASGNI4
line 3403
;3403:			}
LABELV $1253
line 3404
;3404:			subamt = (maxtake*hamt)+(take-maxtake);
ADDRLP4 152
ADDRLP4 148
INDIRI4
ASGNI4
ADDRLP4 20
ADDRLP4 152
INDIRI4
CVIF4 4
ADDRLP4 28
INDIRF4
MULF4
ADDRLP4 4
INDIRI4
ADDRLP4 152
INDIRI4
SUBI4
CVIF4 4
ADDF4
CVFI4 4
ASGNI4
line 3405
;3405:			if (targ->client->ps.fd.forcePower < 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1254
line 3406
;3406:			{
line 3407
;3407:				subamt += targ->client->ps.fd.forcePower;
ADDRLP4 20
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
ADDI4
ASGNI4
line 3408
;3408:				targ->client->ps.fd.forcePower = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
CNSTI4 0
ASGNI4
line 3409
;3409:			}
LABELV $1254
line 3410
;3410:			if (subamt)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1256
line 3411
;3411:			{
line 3412
;3412:				take -= subamt;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 3414
;3413:
;3414:				if (take < 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1258
line 3415
;3415:				{
line 3416
;3416:					take = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3417
;3417:				}
LABELV $1258
line 3418
;3418:			}
LABELV $1256
line 3419
;3419:		}
LABELV $1234
line 3420
;3420:	}
LABELV $1232
line 3422
;3421:
;3422:	if (shieldAbsorbed)
ADDRLP4 16
INDIRF4
CNSTF4 0
EQF4 $1260
line 3423
;3423:	{
line 3427
;3424:		gentity_t	*evEnt;
;3425:
;3426:		// Send off an event to show a shield shell on the player, pointing in the right direction.
;3427:		evEnt = G_TempEntity(vec3_origin, EV_SHIELD_HIT);
ADDRGP4 vec3_origin
ARGP4
CNSTI4 97
ARGI4
ADDRLP4 152
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 148
ADDRLP4 152
INDIRP4
ASGNP4
line 3428
;3428:		evEnt->s.otherEntityNum = targ->s.number;
ADDRLP4 148
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 3429
;3429:		evEnt->s.eventParm = DirToByte(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 148
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 3430
;3430:		evEnt->s.time2=shieldAbsorbed;
ADDRLP4 148
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 3452
;3431:/*
;3432:		shieldAbsorbed *= 20;
;3433:
;3434:		if (shieldAbsorbed > 1500)
;3435:		{
;3436:			shieldAbsorbed = 1500;
;3437:		}
;3438:		if (shieldAbsorbed < 200)
;3439:		{
;3440:			shieldAbsorbed = 200;
;3441:		}
;3442:
;3443:		if (targ->client->ps.powerups[PW_SHIELDHIT] < (level.time + shieldAbsorbed))
;3444:		{
;3445:			targ->client->ps.powerups[PW_SHIELDHIT] = level.time + shieldAbsorbed;
;3446:		}
;3447:		//flicker for as many ms as damage was absorbed (*20)
;3448:		//therefore 10 damage causes 1/5 of a seond of flickering, whereas
;3449:		//a full 100 causes 2 seconds (but is reduced to 1.5 seconds due to the max)
;3450:
;3451:*/
;3452:	}
LABELV $1260
line 3455
;3453:
;3454:	// do the damage
;3455:	if (take) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1262
line 3456
;3456:		if (targ->client && (targ->client->ps.fd.forcePowersActive & (1 << FP_RAGE)) && (inflictor->client || attacker->client))
ADDRLP4 148
CNSTI4 408
ASGNI4
ADDRLP4 152
ADDRFP4 0
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 156
CNSTU4 0
ASGNU4
ADDRLP4 152
INDIRP4
CVPU4 4
ADDRLP4 156
INDIRU4
EQU4 $1264
ADDRLP4 152
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1264
ADDRFP4 4
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 156
INDIRU4
NEU4 $1266
ADDRFP4 8
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 156
INDIRU4
EQU4 $1264
LABELV $1266
line 3457
;3457:		{
line 3458
;3458:			take /= (targ->client->ps.fd.forcePowerLevel[FP_RAGE]+1);
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 976
ADDP4
INDIRI4
CNSTI4 1
ADDI4
DIVI4
ASGNI4
line 3459
;3459:		}
LABELV $1264
line 3460
;3460:		targ->health = targ->health - take;
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 3461
;3461:		if ( targ->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1267
line 3462
;3462:			targ->client->ps.stats[STAT_HEALTH] = targ->health;
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 164
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ASGNI4
line 3463
;3463:		}
LABELV $1267
line 3465
;3464:
;3465:		if (targ->client && (targ->client->ps.fd.forcePowersActive & (1 << FP_RAGE)) && (inflictor->client || attacker->client))
ADDRLP4 164
CNSTI4 408
ASGNI4
ADDRLP4 168
ADDRFP4 0
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 172
CNSTU4 0
ASGNU4
ADDRLP4 168
INDIRP4
CVPU4 4
ADDRLP4 172
INDIRU4
EQU4 $1269
ADDRLP4 168
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1269
ADDRFP4 4
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 172
INDIRU4
NEU4 $1271
ADDRFP4 8
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 172
INDIRU4
EQU4 $1269
LABELV $1271
line 3466
;3466:		{
line 3467
;3467:			if (targ->health <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1272
line 3468
;3468:			{
line 3469
;3469:				targ->health = 1;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 1
ASGNI4
line 3470
;3470:			}
LABELV $1272
line 3471
;3471:			if (targ->client->ps.stats[STAT_HEALTH] <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1274
line 3472
;3472:			{
line 3473
;3473:				targ->client->ps.stats[STAT_HEALTH] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 1
ASGNI4
line 3474
;3474:			}
LABELV $1274
line 3475
;3475:		}
LABELV $1269
line 3477
;3476:	
;3477:		if ( targ->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1276
line 3478
;3478:			if ( client )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1278
line 3479
;3479:			{
line 3480
;3480:				targ->flags |= FL_NO_KNOCKBACK;
ADDRLP4 176
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 3482
;3481:
;3482:				if (point)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1280
line 3483
;3483:				{
line 3484
;3484:					VectorCopy( point, targ->pos1 );
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRFP4 16
INDIRP4
INDIRB
ASGNB 12
line 3485
;3485:				}
ADDRGP4 $1279
JUMPV
LABELV $1280
line 3487
;3486:				else
;3487:				{
line 3488
;3488:					VectorCopy(targ->client->ps.origin, targ->pos1);
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 180
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 180
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3489
;3489:				}
line 3490
;3490:			}
ADDRGP4 $1279
JUMPV
LABELV $1278
line 3491
;3491:			else if (targ->s.eType == ET_GRAPPLE)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1282
line 3492
;3492:			{ //g2animent
line 3493
;3493:				VectorCopy(point, targ->pos1);
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRFP4 16
INDIRP4
INDIRB
ASGNB 12
line 3494
;3494:			}
LABELV $1282
LABELV $1279
line 3496
;3495:
;3496:			if (targ->health < -999)
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 -999
GEI4 $1284
line 3497
;3497:				targ->health = -999;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 -999
ASGNI4
LABELV $1284
line 3500
;3498:
;3499:			// If we are a breaking glass brush, store the damage point so we can do cool things with it.
;3500:			if ( targ->r.svFlags & SVF_GLASS_BRUSH )
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 134217728
BANDI4
CNSTI4 0
EQI4 $1286
line 3501
;3501:			{
line 3502
;3502:				VectorCopy( point, targ->pos1 );
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRFP4 16
INDIRP4
INDIRB
ASGNB 12
line 3503
;3503:				VectorCopy( dir, targ->pos2 );
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 3504
;3504:			}
LABELV $1286
line 3506
;3505:
;3506:			targ->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 3507
;3507:			targ->die (targ, inflictor, attacker, take, mod);
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 176
INDIRP4
CNSTI4 660
ADDP4
INDIRP4
CALLV
pop
line 3508
;3508:			return;
ADDRGP4 $1063
JUMPV
LABELV $1276
line 3509
;3509:		} else if ( targ->pain ) {
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1288
line 3510
;3510:			targ->pain (targ, attacker, take);
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 176
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CALLV
pop
line 3511
;3511:		}
LABELV $1288
line 3513
;3512:
;3513:		G_LogWeaponDamage(attacker->s.number, mod, take);
ADDRFP4 8
INDIRP4
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_LogWeaponDamage
CALLV
pop
line 3514
;3514:	}
LABELV $1262
line 3516
;3515:
;3516:}
LABELV $1063
endproc G_Damage 212 32
export CanDamage
proc CanDamage 1136 28
line 3527
;3517:
;3518:
;3519:/*
;3520:============
;3521:CanDamage
;3522:
;3523:Returns qtrue if the inflictor can directly damage the target.  Used for
;3524:explosions and melee attacks.
;3525:============
;3526:*/
;3527:qboolean CanDamage (gentity_t *targ, vec3_t origin) {
line 3534
;3528:	vec3_t	dest;
;3529:	trace_t	tr;
;3530:	vec3_t	midpoint;
;3531:
;3532:	// use the midpoint of the bounds instead of the origin, because
;3533:	// bmodels may have their origin is 0,0,0
;3534:	VectorAdd (targ->r.absmin, targ->r.absmax, midpoint);
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 1104
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDRLP4 1104
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 1104
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDRLP4 1104
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 1108
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDRLP4 1108
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDF4
ASGNF4
line 3535
;3535:	VectorScale (midpoint, 0.5, midpoint);
ADDRLP4 1112
CNSTF4 1056964608
ASGNF4
ADDRLP4 12
ADDRLP4 1112
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 1112
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+8
CNSTF4 1056964608
ADDRLP4 12+8
INDIRF4
MULF4
ASGNF4
line 3537
;3536:
;3537:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 3538
;3538:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1116
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 3539
;3539:	if (tr.fraction == 1.0 || tr.entityNum == targ->s.number)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
EQF4 $1301
ADDRLP4 24+52
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $1297
LABELV $1301
line 3540
;3540:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1290
JUMPV
LABELV $1297
line 3544
;3541:
;3542:	// this should probably check in the plane of projection, 
;3543:	// rather than in world coordinate, and also include Z
;3544:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 3545
;3545:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 3546
;3546:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 3547
;3547:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1120
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 3548
;3548:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $1303
line 3549
;3549:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1290
JUMPV
LABELV $1303
line 3551
;3550:
;3551:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 3552
;3552:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 3553
;3553:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 3554
;3554:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1124
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 3555
;3555:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $1307
line 3556
;3556:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1290
JUMPV
LABELV $1307
line 3558
;3557:
;3558:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 3559
;3559:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 3560
;3560:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 3561
;3561:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1128
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 3562
;3562:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $1311
line 3563
;3563:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1290
JUMPV
LABELV $1311
line 3565
;3564:
;3565:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 3566
;3566:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 3567
;3567:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 3568
;3568:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1132
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 3569
;3569:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $1315
line 3570
;3570:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1290
JUMPV
LABELV $1315
line 3573
;3571:
;3572:
;3573:	return qfalse;
CNSTI4 0
RETI4
LABELV $1290
endproc CanDamage 1136 28
export G_RadiusDamage
proc G_RadiusDamage 4196 32
line 3583
;3574:}
;3575:
;3576:
;3577:/*
;3578:============
;3579:G_RadiusDamage
;3580:============
;3581:*/
;3582:qboolean G_RadiusDamage ( vec3_t origin, gentity_t *attacker, float damage, float radius,
;3583:					 gentity_t *ignore, int mod) {
line 3592
;3584:	float		points, dist;
;3585:	gentity_t	*ent;
;3586:	int			entityList[MAX_GENTITIES];
;3587:	int			numListedEntities;
;3588:	vec3_t		mins, maxs;
;3589:	vec3_t		v;
;3590:	vec3_t		dir;
;3591:	int			i, e;
;3592:	qboolean	hitClient = qfalse;
ADDRLP4 4168
CNSTI4 0
ASGNI4
line 3594
;3593:
;3594:	if ( radius < 1 ) {
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $1319
line 3595
;3595:		radius = 1;
ADDRFP4 12
CNSTF4 1065353216
ASGNF4
line 3596
;3596:	}
LABELV $1319
line 3598
;3597:
;3598:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1321
line 3599
;3599:		mins[i] = origin[i] - radius;
ADDRLP4 4172
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4172
INDIRI4
ADDRLP4 4144
ADDP4
ADDRLP4 4172
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
SUBF4
ASGNF4
line 3600
;3600:		maxs[i] = origin[i] + radius;
ADDRLP4 4176
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4176
INDIRI4
ADDRLP4 4156
ADDP4
ADDRLP4 4176
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ASGNF4
line 3601
;3601:	}
LABELV $1322
line 3598
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1321
line 3603
;3602:
;3603:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
ADDRLP4 4144
ARGP4
ADDRLP4 4156
ARGP4
ADDRLP4 44
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4172
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4140
ADDRLP4 4172
INDIRI4
ASGNI4
line 3605
;3604:
;3605:	for ( e = 0 ; e < numListedEntities ; e++ ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $1328
JUMPV
LABELV $1325
line 3606
;3606:		ent = &g_entities[entityList[ e ]];
ADDRLP4 4
CNSTI4 852
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 44
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3608
;3607:
;3608:		if (ent == ignore)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 16
INDIRP4
CVPU4 4
NEU4 $1329
line 3609
;3609:			continue;
ADDRGP4 $1326
JUMPV
LABELV $1329
line 3610
;3610:		if (!ent->takedamage)
ADDRLP4 4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1331
line 3611
;3611:			continue;
ADDRGP4 $1326
JUMPV
LABELV $1331
line 3614
;3612:
;3613:		// find the distance from the edge of the bounding box
;3614:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1333
line 3615
;3615:			if ( origin[i] < ent->r.absmin[i] ) {
ADDRLP4 4176
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4176
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
GEF4 $1337
line 3616
;3616:				v[i] = ent->r.absmin[i] - origin[i];
ADDRLP4 4180
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4180
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
ADDRLP4 4180
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3617
;3617:			} else if ( origin[i] > ent->r.absmax[i] ) {
ADDRGP4 $1338
JUMPV
LABELV $1337
ADDRLP4 4180
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4180
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
LEF4 $1339
line 3618
;3618:				v[i] = origin[i] - ent->r.absmax[i];
ADDRLP4 4184
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4184
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4184
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4184
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3619
;3619:			} else {
ADDRGP4 $1340
JUMPV
LABELV $1339
line 3620
;3620:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 3621
;3621:			}
LABELV $1340
LABELV $1338
line 3622
;3622:		}
LABELV $1334
line 3614
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1333
line 3624
;3623:
;3624:		dist = VectorLength( v );
ADDRLP4 8
ARGP4
ADDRLP4 4176
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 4176
INDIRF4
ASGNF4
line 3625
;3625:		if ( dist >= radius ) {
ADDRLP4 24
INDIRF4
ADDRFP4 12
INDIRF4
LTF4 $1341
line 3626
;3626:			continue;
ADDRGP4 $1326
JUMPV
LABELV $1341
line 3629
;3627:		}
;3628:
;3629:		points = damage * ( 1.0 - dist / radius );
ADDRLP4 40
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
ADDRLP4 24
INDIRF4
ADDRFP4 12
INDIRF4
DIVF4
SUBF4
MULF4
ASGNF4
line 3631
;3630:
;3631:		if( CanDamage (ent, origin) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4180
ADDRGP4 CanDamage
CALLI4
ASGNI4
ADDRLP4 4180
INDIRI4
CNSTI4 0
EQI4 $1343
line 3632
;3632:			if( LogAccuracyHit( ent, attacker ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4184
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 4184
INDIRI4
CNSTI4 0
EQI4 $1345
line 3633
;3633:				hitClient = qtrue;
ADDRLP4 4168
CNSTI4 1
ASGNI4
line 3634
;3634:			}
LABELV $1345
line 3635
;3635:			VectorSubtract (ent->r.currentOrigin, origin, dir);
ADDRLP4 4192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 4
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 4192
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 4
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 4192
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+8
ADDRLP4 4
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3638
;3636:			// push the center of mass higher than the origin so players
;3637:			// get knocked into the air more
;3638:			dir[2] += 24;
ADDRLP4 28+8
ADDRLP4 28+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 3639
;3639:			G_Damage (ent, NULL, attacker, dir, origin, (int)points, DAMAGE_RADIUS, mod);
ADDRLP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRF4
CVFI4 4
ARGI4
CNSTI4 1
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 3640
;3640:		}
LABELV $1343
line 3641
;3641:	}
LABELV $1326
line 3605
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1328
ADDRLP4 20
INDIRI4
ADDRLP4 4140
INDIRI4
LTI4 $1325
line 3643
;3642:
;3643:	return hitClient;
ADDRLP4 4168
INDIRI4
RETI4
LABELV $1318
endproc G_RadiusDamage 4196 32
import G_G2PlayerAngles
import animTable
import ThrowSaberToAttacker
import BotDamageNotification
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
import TossClientCubes
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
LABELV $1213
char 1 37
char 1 105
char 1 58
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 58
char 1 37
char 1 105
char 1 32
char 1 104
char 1 101
char 1 97
char 1 108
char 1 116
char 1 104
char 1 58
char 1 37
char 1 105
char 1 32
char 1 100
char 1 97
char 1 109
char 1 97
char 1 103
char 1 101
char 1 58
char 1 37
char 1 105
char 1 32
char 1 97
char 1 114
char 1 109
char 1 111
char 1 114
char 1 58
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $1056
char 1 68
char 1 117
char 1 101
char 1 108
char 1 32
char 1 68
char 1 105
char 1 115
char 1 109
char 1 101
char 1 109
char 1 98
char 1 101
char 1 114
char 1 109
char 1 101
char 1 110
char 1 116
char 1 58
char 1 32
char 1 37
char 1 115
char 1 32
char 1 100
char 1 105
char 1 115
char 1 109
char 1 101
char 1 109
char 1 98
char 1 101
char 1 114
char 1 101
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
LABELV $952
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 108
char 1 105
char 1 109
char 1 98
char 1 0
align 1
LABELV $916
char 1 114
char 1 104
char 1 97
char 1 110
char 1 100
char 1 0
align 1
LABELV $871
char 1 103
char 1 101
char 1 110
char 1 101
char 1 114
char 1 105
char 1 99
char 1 54
char 1 0
align 1
LABELV $870
char 1 103
char 1 101
char 1 110
char 1 101
char 1 114
char 1 105
char 1 99
char 1 53
char 1 0
align 1
LABELV $869
char 1 103
char 1 101
char 1 110
char 1 101
char 1 114
char 1 105
char 1 99
char 1 52
char 1 0
align 1
LABELV $868
char 1 103
char 1 101
char 1 110
char 1 101
char 1 114
char 1 105
char 1 99
char 1 51
char 1 0
align 1
LABELV $867
char 1 103
char 1 101
char 1 110
char 1 101
char 1 114
char 1 105
char 1 99
char 1 50
char 1 0
align 1
LABELV $866
char 1 103
char 1 101
char 1 110
char 1 101
char 1 114
char 1 105
char 1 99
char 1 49
char 1 0
align 1
LABELV $865
char 1 104
char 1 101
char 1 97
char 1 100
char 1 0
align 1
LABELV $864
char 1 108
char 1 101
char 1 102
char 1 116
char 1 32
char 1 104
char 1 97
char 1 110
char 1 100
char 1 0
align 1
LABELV $863
char 1 114
char 1 105
char 1 103
char 1 104
char 1 116
char 1 32
char 1 104
char 1 97
char 1 110
char 1 100
char 1 0
align 1
LABELV $862
char 1 108
char 1 101
char 1 102
char 1 116
char 1 32
char 1 97
char 1 114
char 1 109
char 1 0
align 1
LABELV $861
char 1 114
char 1 105
char 1 103
char 1 104
char 1 116
char 1 32
char 1 97
char 1 114
char 1 109
char 1 0
align 1
LABELV $860
char 1 99
char 1 104
char 1 101
char 1 115
char 1 116
char 1 0
align 1
LABELV $859
char 1 102
char 1 114
char 1 111
char 1 110
char 1 116
char 1 32
char 1 108
char 1 101
char 1 102
char 1 116
char 1 32
char 1 115
char 1 104
char 1 111
char 1 117
char 1 108
char 1 100
char 1 101
char 1 114
char 1 0
align 1
LABELV $858
char 1 102
char 1 114
char 1 111
char 1 110
char 1 116
char 1 32
char 1 114
char 1 105
char 1 103
char 1 104
char 1 116
char 1 32
char 1 115
char 1 104
char 1 111
char 1 117
char 1 108
char 1 101
char 1 114
char 1 0
align 1
LABELV $857
char 1 98
char 1 97
char 1 99
char 1 107
char 1 0
align 1
LABELV $856
char 1 98
char 1 97
char 1 99
char 1 107
char 1 32
char 1 108
char 1 101
char 1 102
char 1 116
char 1 32
char 1 115
char 1 104
char 1 111
char 1 117
char 1 108
char 1 100
char 1 101
char 1 114
char 1 0
align 1
LABELV $855
char 1 98
char 1 97
char 1 99
char 1 107
char 1 32
char 1 114
char 1 105
char 1 103
char 1 104
char 1 116
char 1 32
char 1 115
char 1 104
char 1 111
char 1 117
char 1 108
char 1 100
char 1 101
char 1 114
char 1 0
align 1
LABELV $854
char 1 119
char 1 97
char 1 105
char 1 115
char 1 116
char 1 0
align 1
LABELV $853
char 1 108
char 1 101
char 1 102
char 1 116
char 1 32
char 1 108
char 1 101
char 1 103
char 1 0
align 1
LABELV $852
char 1 114
char 1 105
char 1 103
char 1 104
char 1 116
char 1 32
char 1 108
char 1 101
char 1 103
char 1 0
align 1
LABELV $851
char 1 108
char 1 101
char 1 102
char 1 116
char 1 32
char 1 102
char 1 111
char 1 111
char 1 116
char 1 0
align 1
LABELV $850
char 1 114
char 1 105
char 1 103
char 1 104
char 1 116
char 1 32
char 1 102
char 1 111
char 1 111
char 1 116
char 1 0
align 1
LABELV $849
char 1 110
char 1 111
char 1 110
char 1 101
char 1 0
align 1
LABELV $667
char 1 107
char 1 105
char 1 108
char 1 108
char 1 101
char 1 114
char 1 32
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 32
char 1 115
char 1 116
char 1 121
char 1 108
char 1 101
char 1 58
char 1 32
char 1 37
char 1 100
char 1 44
char 1 32
char 1 107
char 1 105
char 1 108
char 1 108
char 1 101
char 1 114
char 1 32
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 32
char 1 97
char 1 110
char 1 105
char 1 109
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $664
char 1 107
char 1 105
char 1 108
char 1 108
char 1 101
char 1 114
char 1 58
char 1 32
char 1 37
char 1 115
char 1 44
char 1 32
char 1 104
char 1 105
char 1 116
char 1 115
char 1 32
char 1 111
char 1 110
char 1 32
char 1 101
char 1 110
char 1 101
char 1 109
char 1 121
char 1 32
char 1 37
char 1 100
char 1 44
char 1 32
char 1 104
char 1 101
char 1 97
char 1 108
char 1 116
char 1 104
char 1 58
char 1 32
char 1 37
char 1 100
char 1 10
char 1 0
align 1
LABELV $661
char 1 118
char 1 105
char 1 99
char 1 116
char 1 105
char 1 109
char 1 58
char 1 32
char 1 37
char 1 115
char 1 44
char 1 32
char 1 104
char 1 105
char 1 116
char 1 115
char 1 32
char 1 111
char 1 110
char 1 32
char 1 101
char 1 110
char 1 101
char 1 109
char 1 121
char 1 32
char 1 37
char 1 100
char 1 10
char 1 0
align 1
LABELV $659
char 1 75
char 1 105
char 1 108
char 1 108
char 1 32
char 1 84
char 1 105
char 1 109
char 1 101
char 1 58
char 1 32
char 1 37
char 1 100
char 1 10
char 1 0
align 1
LABELV $658
char 1 68
char 1 117
char 1 101
char 1 108
char 1 32
char 1 75
char 1 105
char 1 108
char 1 108
char 1 32
char 1 68
char 1 101
char 1 116
char 1 97
char 1 105
char 1 108
char 1 115
char 1 58
char 1 10
char 1 0
align 1
LABELV $643
char 1 75
char 1 105
char 1 108
char 1 108
char 1 58
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 58
char 1 32
char 1 37
char 1 115
char 1 32
char 1 107
char 1 105
char 1 108
char 1 108
char 1 101
char 1 100
char 1 32
char 1 37
char 1 115
char 1 32
char 1 98
char 1 121
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $642
char 1 60
char 1 98
char 1 97
char 1 100
char 1 32
char 1 111
char 1 98
char 1 105
char 1 116
char 1 117
char 1 97
char 1 114
char 1 121
char 1 62
char 1 0
align 1
LABELV $635
char 1 60
char 1 119
char 1 111
char 1 114
char 1 108
char 1 100
char 1 62
char 1 0
align 1
LABELV $634
char 1 60
char 1 110
char 1 111
char 1 110
char 1 45
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 62
char 1 0
align 1
LABELV $311
char 1 77
char 1 79
char 1 68
char 1 95
char 1 84
char 1 82
char 1 73
char 1 71
char 1 71
char 1 69
char 1 82
char 1 95
char 1 72
char 1 85
char 1 82
char 1 84
char 1 0
align 1
LABELV $310
char 1 77
char 1 79
char 1 68
char 1 95
char 1 84
char 1 65
char 1 82
char 1 71
char 1 69
char 1 84
char 1 95
char 1 76
char 1 65
char 1 83
char 1 69
char 1 82
char 1 0
align 1
LABELV $309
char 1 77
char 1 79
char 1 68
char 1 95
char 1 83
char 1 85
char 1 73
char 1 67
char 1 73
char 1 68
char 1 69
char 1 0
align 1
LABELV $308
char 1 77
char 1 79
char 1 68
char 1 95
char 1 70
char 1 65
char 1 76
char 1 76
char 1 73
char 1 78
char 1 71
char 1 0
align 1
LABELV $307
char 1 77
char 1 79
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
LABELV $306
char 1 77
char 1 79
char 1 68
char 1 95
char 1 67
char 1 82
char 1 85
char 1 83
char 1 72
char 1 0
align 1
LABELV $305
char 1 77
char 1 79
char 1 68
char 1 95
char 1 76
char 1 65
char 1 86
char 1 65
char 1 0
align 1
LABELV $304
char 1 77
char 1 79
char 1 68
char 1 95
char 1 83
char 1 76
char 1 73
char 1 77
char 1 69
char 1 0
align 1
LABELV $303
char 1 77
char 1 79
char 1 68
char 1 95
char 1 87
char 1 65
char 1 84
char 1 69
char 1 82
char 1 0
align 1
LABELV $302
char 1 77
char 1 79
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
LABELV $301
char 1 77
char 1 79
char 1 68
char 1 95
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 95
char 1 68
char 1 65
char 1 82
char 1 75
char 1 0
align 1
LABELV $300
char 1 77
char 1 79
char 1 68
char 1 95
char 1 68
char 1 69
char 1 84
char 1 95
char 1 80
char 1 65
char 1 67
char 1 75
char 1 95
char 1 83
char 1 80
char 1 76
char 1 65
char 1 83
char 1 72
char 1 0
align 1
LABELV $299
char 1 77
char 1 79
char 1 68
char 1 95
char 1 84
char 1 73
char 1 77
char 1 69
char 1 68
char 1 95
char 1 77
char 1 73
char 1 78
char 1 69
char 1 95
char 1 83
char 1 80
char 1 76
char 1 65
char 1 83
char 1 72
char 1 0
align 1
LABELV $298
char 1 77
char 1 79
char 1 68
char 1 95
char 1 84
char 1 82
char 1 73
char 1 80
char 1 95
char 1 77
char 1 73
char 1 78
char 1 69
char 1 95
char 1 83
char 1 80
char 1 76
char 1 65
char 1 83
char 1 72
char 1 0
align 1
LABELV $297
char 1 77
char 1 79
char 1 68
char 1 95
char 1 84
char 1 72
char 1 69
char 1 82
char 1 77
char 1 65
char 1 76
char 1 95
char 1 83
char 1 80
char 1 76
char 1 65
char 1 83
char 1 72
char 1 0
align 1
LABELV $296
char 1 77
char 1 79
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
LABELV $295
char 1 77
char 1 79
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
char 1 95
char 1 83
char 1 80
char 1 76
char 1 65
char 1 83
char 1 72
char 1 0
align 1
LABELV $294
char 1 77
char 1 79
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
LABELV $293
char 1 77
char 1 79
char 1 68
char 1 95
char 1 82
char 1 79
char 1 67
char 1 75
char 1 69
char 1 84
char 1 95
char 1 83
char 1 80
char 1 76
char 1 65
char 1 83
char 1 72
char 1 0
align 1
LABELV $292
char 1 77
char 1 79
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
LABELV $291
char 1 77
char 1 79
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
char 1 65
char 1 76
char 1 84
char 1 95
char 1 83
char 1 80
char 1 76
char 1 65
char 1 83
char 1 72
char 1 0
align 1
LABELV $290
char 1 77
char 1 79
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
LABELV $289
char 1 77
char 1 79
char 1 68
char 1 95
char 1 68
char 1 69
char 1 77
char 1 80
char 1 50
char 1 95
char 1 65
char 1 76
char 1 84
char 1 0
align 1
LABELV $288
char 1 77
char 1 79
char 1 68
char 1 95
char 1 68
char 1 69
char 1 77
char 1 80
char 1 50
char 1 0
align 1
LABELV $287
char 1 77
char 1 79
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
char 1 95
char 1 65
char 1 76
char 1 84
char 1 95
char 1 83
char 1 80
char 1 76
char 1 65
char 1 83
char 1 72
char 1 0
align 1
LABELV $286
char 1 77
char 1 79
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
char 1 95
char 1 65
char 1 76
char 1 84
char 1 0
align 1
LABELV $285
char 1 77
char 1 79
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
LABELV $284
char 1 77
char 1 79
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
LABELV $283
char 1 77
char 1 79
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
char 1 95
char 1 83
char 1 78
char 1 73
char 1 80
char 1 69
char 1 82
char 1 0
align 1
LABELV $282
char 1 77
char 1 79
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
char 1 95
char 1 83
char 1 80
char 1 76
char 1 65
char 1 83
char 1 72
char 1 0
align 1
LABELV $281
char 1 77
char 1 79
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
LABELV $280
char 1 77
char 1 79
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
LABELV $279
char 1 77
char 1 79
char 1 68
char 1 95
char 1 66
char 1 82
char 1 89
char 1 65
char 1 82
char 1 95
char 1 80
char 1 73
char 1 83
char 1 84
char 1 79
char 1 76
char 1 95
char 1 65
char 1 76
char 1 84
char 1 0
align 1
LABELV $278
char 1 77
char 1 79
char 1 68
char 1 95
char 1 66
char 1 82
char 1 89
char 1 65
char 1 82
char 1 95
char 1 80
char 1 73
char 1 83
char 1 84
char 1 79
char 1 76
char 1 0
align 1
LABELV $277
char 1 77
char 1 79
char 1 68
char 1 95
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 0
align 1
LABELV $276
char 1 77
char 1 79
char 1 68
char 1 95
char 1 77
char 1 69
char 1 76
char 1 69
char 1 69
char 1 0
align 1
LABELV $275
char 1 77
char 1 79
char 1 68
char 1 95
char 1 83
char 1 84
char 1 85
char 1 78
char 1 95
char 1 66
char 1 65
char 1 84
char 1 79
char 1 78
char 1 0
align 1
LABELV $274
char 1 77
char 1 79
char 1 68
char 1 95
char 1 85
char 1 78
char 1 75
char 1 78
char 1 79
char 1 87
char 1 78
char 1 0
