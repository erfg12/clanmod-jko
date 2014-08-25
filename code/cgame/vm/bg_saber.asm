export PM_irand_timesync
code
proc PM_irand_timesync 8 4
file "../../game/bg_saber.c"
line 6
;1:#include "q_shared.h"
;2:#include "bg_public.h"
;3:#include "bg_local.h"
;4:
;5:int PM_irand_timesync(int val1, int val2)
;6:{
line 9
;7:	int i;
;8:
;9:	i = (val1-1) + (Q_random( &pm->cmd.serverTime )*(val2 - val1)) + 1;
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1
SUBI4
CVIF4 4
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
CVIF4 4
MULF4
ADDF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 10
;10:	if (i < val1)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
GEI4 $66
line 11
;11:	{
line 12
;12:		i = val1;
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
line 13
;13:	}
LABELV $66
line 14
;14:	if (i > val2)
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LEI4 $68
line 15
;15:	{
line 16
;16:		i = val2;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 17
;17:	}
LABELV $68
line 19
;18:
;19:	return i;
ADDRLP4 0
INDIRI4
RETI4
LABELV $65
endproc PM_irand_timesync 8 4
export BG_ForcePowerDrain
proc BG_ForcePowerDrain 12 0
line 23
;20:}
;21:
;22:void BG_ForcePowerDrain( playerState_t *ps, forcePowers_t forcePower, int overrideAmt )
;23:{
line 25
;24:	//take away the power
;25:	int	drain = overrideAmt;
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
line 35
;26:
;27:	/*
;28:	if (ps->powerups[PW_FORCE_BOON])
;29:	{
;30:		return;
;31:	}
;32:	*/
;33:	//No longer grant infinite force with boon.
;34:
;35:	if ( !drain )
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $71
line 36
;36:	{
line 37
;37:		drain = forcePowerNeeded[ps->fd.forcePowerLevel[forcePower]][forcePower];
ADDRLP4 4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 72
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
ADDP4
ADDP4
INDIRI4
ASGNI4
line 38
;38:	}
LABELV $71
line 39
;39:	if ( !drain )
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $73
line 40
;40:	{
line 41
;41:		return;
ADDRGP4 $70
JUMPV
LABELV $73
line 44
;42:	}
;43:
;44:	if (forcePower == FP_LEVITATION)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $75
line 45
;45:	{ //special case
line 46
;46:		int jumpDrain = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 48
;47:
;48:		if (ps->velocity[2] > 250)
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1132068864
LEF4 $77
line 49
;49:		{
line 50
;50:			jumpDrain = 20;
ADDRLP4 4
CNSTI4 20
ASGNI4
line 51
;51:		}
ADDRGP4 $78
JUMPV
LABELV $77
line 52
;52:		else if (ps->velocity[2] > 200)
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1128792064
LEF4 $79
line 53
;53:		{
line 54
;54:			jumpDrain = 16;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 55
;55:		}
ADDRGP4 $80
JUMPV
LABELV $79
line 56
;56:		else if (ps->velocity[2] > 150)
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1125515264
LEF4 $81
line 57
;57:		{
line 58
;58:			jumpDrain = 12;
ADDRLP4 4
CNSTI4 12
ASGNI4
line 59
;59:		}
ADDRGP4 $82
JUMPV
LABELV $81
line 60
;60:		else if (ps->velocity[2] > 100)
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1120403456
LEF4 $83
line 61
;61:		{
line 62
;62:			jumpDrain = 8;
ADDRLP4 4
CNSTI4 8
ASGNI4
line 63
;63:		}
ADDRGP4 $84
JUMPV
LABELV $83
line 64
;64:		else if (ps->velocity[2] > 50)
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1112014848
LEF4 $85
line 65
;65:		{
line 66
;66:			jumpDrain = 6;
ADDRLP4 4
CNSTI4 6
ASGNI4
line 67
;67:		}
ADDRGP4 $86
JUMPV
LABELV $85
line 68
;68:		else if (ps->velocity[2] > 0)
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
LEF4 $87
line 69
;69:		{
line 70
;70:			jumpDrain = 4;
ADDRLP4 4
CNSTI4 4
ASGNI4
line 71
;71:		}
LABELV $87
LABELV $86
LABELV $84
LABELV $82
LABELV $80
LABELV $78
line 73
;72:
;73:		if (jumpDrain)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $89
line 74
;74:		{
line 75
;75:			jumpDrain /= ps->fd.forcePowerLevel[FP_LEVITATION];
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
DIVI4
ASGNI4
line 76
;76:		}
LABELV $89
line 78
;77:
;78:		ps->fd.forcePower -= jumpDrain;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 79
;79:		if ( ps->fd.forcePower < 0 )
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 0
GEI4 $70
line 80
;80:		{
line 81
;81:			ps->fd.forcePower = 0;
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
CNSTI4 0
ASGNI4
line 82
;82:		}
line 84
;83:
;84:		return;
ADDRGP4 $70
JUMPV
LABELV $75
line 87
;85:	}
;86:
;87:	ps->fd.forcePower -= drain;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 88
;88:	if ( ps->fd.forcePower < 0 )
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 0
GEI4 $93
line 89
;89:	{
line 90
;90:		ps->fd.forcePower = 0;
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
CNSTI4 0
ASGNI4
line 91
;91:	}
LABELV $93
line 92
;92:}
LABELV $70
endproc BG_ForcePowerDrain 12 0
data
export saberMoveData
align 4
LABELV saberMoveData
address $95
byte 4 571
byte 4 1
byte 4 1
byte 4 0
byte 4 350
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $96
byte 4 573
byte 4 1
byte 4 1
byte 4 0
byte 4 350
byte 4 2
byte 4 1
byte 4 22
byte 4 0
address $97
byte 4 587
byte 4 1
byte 4 1
byte 4 2
byte 4 350
byte 4 0
byte 4 1
byte 4 22
byte 4 0
address $98
byte 4 588
byte 4 1
byte 4 1
byte 4 2
byte 4 350
byte 4 0
byte 4 1
byte 4 22
byte 4 0
address $99
byte 4 141
byte 4 4
byte 4 0
byte 4 10
byte 4 100
byte 4 1
byte 4 25
byte 4 25
byte 4 200
address $100
byte 4 139
byte 4 5
byte 4 1
byte 4 10
byte 4 100
byte 4 1
byte 4 26
byte 4 26
byte 4 200
address $101
byte 4 143
byte 4 6
byte 4 2
byte 4 10
byte 4 50
byte 4 1
byte 4 27
byte 4 27
byte 4 200
address $102
byte 4 142
byte 4 0
byte 4 4
byte 4 10
byte 4 100
byte 4 1
byte 4 28
byte 4 28
byte 4 200
address $103
byte 4 140
byte 4 1
byte 4 5
byte 4 10
byte 4 100
byte 4 1
byte 4 29
byte 4 29
byte 4 200
address $104
byte 4 144
byte 4 2
byte 4 6
byte 4 10
byte 4 100
byte 4 1
byte 4 30
byte 4 30
byte 4 200
address $105
byte 4 138
byte 4 3
byte 4 7
byte 4 10
byte 4 100
byte 4 1
byte 4 31
byte 4 31
byte 4 200
address $106
byte 4 564
byte 4 1
byte 4 1
byte 4 10
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $107
byte 4 565
byte 4 1
byte 4 1
byte 4 10
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $108
byte 4 570
byte 4 1
byte 4 1
byte 4 10
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $109
byte 4 569
byte 4 7
byte 4 3
byte 4 10
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $110
byte 4 568
byte 4 3
byte 4 7
byte 4 10
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $111
byte 4 567
byte 4 1
byte 4 3
byte 4 10
byte 4 100
byte 4 1
byte 4 1
byte 4 51
byte 4 200
address $112
byte 4 566
byte 4 5
byte 4 1
byte 4 10
byte 4 100
byte 4 1
byte 4 1
byte 4 40
byte 4 200
address $113
byte 4 190
byte 4 1
byte 4 4
byte 4 10
byte 4 100
byte 4 1
byte 4 4
byte 4 4
byte 4 200
address $114
byte 4 188
byte 4 1
byte 4 5
byte 4 10
byte 4 100
byte 4 1
byte 4 5
byte 4 5
byte 4 200
address $115
byte 4 192
byte 4 1
byte 4 6
byte 4 10
byte 4 100
byte 4 1
byte 4 6
byte 4 6
byte 4 200
address $116
byte 4 191
byte 4 1
byte 4 0
byte 4 10
byte 4 100
byte 4 1
byte 4 7
byte 4 7
byte 4 200
address $117
byte 4 189
byte 4 1
byte 4 1
byte 4 10
byte 4 100
byte 4 1
byte 4 8
byte 4 8
byte 4 200
address $118
byte 4 193
byte 4 1
byte 4 2
byte 4 10
byte 4 100
byte 4 1
byte 4 9
byte 4 9
byte 4 200
address $119
byte 4 187
byte 4 1
byte 4 3
byte 4 10
byte 4 100
byte 4 1
byte 4 10
byte 4 10
byte 4 200
address $120
byte 4 198
byte 4 0
byte 4 1
byte 4 2
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $121
byte 4 196
byte 4 1
byte 4 1
byte 4 2
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $122
byte 4 200
byte 4 2
byte 4 1
byte 4 2
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $123
byte 4 197
byte 4 4
byte 4 1
byte 4 2
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $124
byte 4 195
byte 4 5
byte 4 1
byte 4 2
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $125
byte 4 199
byte 4 6
byte 4 1
byte 4 2
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $126
byte 4 194
byte 4 7
byte 4 1
byte 4 2
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $127
byte 4 145
byte 4 0
byte 4 1
byte 4 10
byte 4 100
byte 4 0
byte 4 26
byte 4 8
byte 4 150
address $128
byte 4 172
byte 4 0
byte 4 2
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 9
byte 4 150
address $129
byte 4 173
byte 4 0
byte 4 3
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 10
byte 4 150
address $130
byte 4 146
byte 4 0
byte 4 4
byte 4 10
byte 4 100
byte 4 0
byte 4 28
byte 4 4
byte 4 150
address $131
byte 4 147
byte 4 0
byte 4 5
byte 4 10
byte 4 100
byte 4 0
byte 4 29
byte 4 5
byte 4 150
address $132
byte 4 148
byte 4 0
byte 4 6
byte 4 10
byte 4 100
byte 4 0
byte 4 30
byte 4 6
byte 4 150
address $133
byte 4 174
byte 4 1
byte 4 0
byte 4 10
byte 4 100
byte 4 0
byte 4 25
byte 4 7
byte 4 150
address $134
byte 4 149
byte 4 1
byte 4 2
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 9
byte 4 150
address $135
byte 4 175
byte 4 1
byte 4 3
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 10
byte 4 150
address $136
byte 4 150
byte 4 1
byte 4 4
byte 4 10
byte 4 100
byte 4 0
byte 4 28
byte 4 4
byte 4 150
address $137
byte 4 151
byte 4 1
byte 4 5
byte 4 10
byte 4 100
byte 4 0
byte 4 29
byte 4 5
byte 4 150
address $138
byte 4 152
byte 4 1
byte 4 6
byte 4 10
byte 4 100
byte 4 0
byte 4 30
byte 4 6
byte 4 150
address $139
byte 4 153
byte 4 2
byte 4 0
byte 4 10
byte 4 100
byte 4 0
byte 4 25
byte 4 7
byte 4 150
address $140
byte 4 176
byte 4 2
byte 4 1
byte 4 10
byte 4 100
byte 4 0
byte 4 26
byte 4 8
byte 4 150
address $141
byte 4 177
byte 4 2
byte 4 3
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 10
byte 4 150
address $142
byte 4 154
byte 4 2
byte 4 4
byte 4 10
byte 4 100
byte 4 0
byte 4 28
byte 4 4
byte 4 150
address $143
byte 4 155
byte 4 2
byte 4 5
byte 4 10
byte 4 100
byte 4 0
byte 4 29
byte 4 5
byte 4 150
address $144
byte 4 156
byte 4 2
byte 4 6
byte 4 10
byte 4 100
byte 4 0
byte 4 30
byte 4 6
byte 4 150
address $145
byte 4 157
byte 4 3
byte 4 0
byte 4 10
byte 4 100
byte 4 0
byte 4 25
byte 4 7
byte 4 150
address $146
byte 4 158
byte 4 3
byte 4 1
byte 4 10
byte 4 100
byte 4 0
byte 4 26
byte 4 8
byte 4 150
address $147
byte 4 159
byte 4 3
byte 4 2
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 9
byte 4 150
address $148
byte 4 160
byte 4 3
byte 4 4
byte 4 10
byte 4 100
byte 4 0
byte 4 28
byte 4 4
byte 4 150
address $149
byte 4 161
byte 4 3
byte 4 5
byte 4 10
byte 4 100
byte 4 0
byte 4 29
byte 4 5
byte 4 150
address $150
byte 4 162
byte 4 3
byte 4 6
byte 4 10
byte 4 100
byte 4 0
byte 4 30
byte 4 6
byte 4 150
address $151
byte 4 163
byte 4 4
byte 4 0
byte 4 10
byte 4 100
byte 4 0
byte 4 25
byte 4 7
byte 4 150
address $152
byte 4 178
byte 4 4
byte 4 1
byte 4 10
byte 4 100
byte 4 0
byte 4 26
byte 4 8
byte 4 150
address $153
byte 4 179
byte 4 4
byte 4 2
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 9
byte 4 150
address $154
byte 4 180
byte 4 4
byte 4 3
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 10
byte 4 150
address $155
byte 4 181
byte 4 4
byte 4 5
byte 4 10
byte 4 100
byte 4 0
byte 4 29
byte 4 5
byte 4 150
address $156
byte 4 164
byte 4 4
byte 4 6
byte 4 10
byte 4 100
byte 4 0
byte 4 30
byte 4 6
byte 4 150
address $157
byte 4 165
byte 4 5
byte 4 0
byte 4 10
byte 4 100
byte 4 0
byte 4 25
byte 4 7
byte 4 150
address $158
byte 4 166
byte 4 5
byte 4 1
byte 4 10
byte 4 100
byte 4 0
byte 4 26
byte 4 8
byte 4 150
address $159
byte 4 182
byte 4 5
byte 4 2
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 9
byte 4 150
address $160
byte 4 183
byte 4 5
byte 4 3
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 10
byte 4 150
address $161
byte 4 167
byte 4 5
byte 4 4
byte 4 10
byte 4 100
byte 4 0
byte 4 28
byte 4 4
byte 4 150
address $162
byte 4 184
byte 4 5
byte 4 6
byte 4 10
byte 4 100
byte 4 0
byte 4 30
byte 4 6
byte 4 150
address $163
byte 4 168
byte 4 6
byte 4 0
byte 4 10
byte 4 100
byte 4 0
byte 4 25
byte 4 7
byte 4 150
address $164
byte 4 169
byte 4 6
byte 4 1
byte 4 10
byte 4 100
byte 4 0
byte 4 26
byte 4 8
byte 4 150
address $165
byte 4 170
byte 4 6
byte 4 2
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 9
byte 4 150
address $166
byte 4 185
byte 4 6
byte 4 3
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 10
byte 4 150
address $167
byte 4 186
byte 4 6
byte 4 4
byte 4 10
byte 4 100
byte 4 0
byte 4 28
byte 4 4
byte 4 150
address $168
byte 4 171
byte 4 6
byte 4 5
byte 4 10
byte 4 100
byte 4 0
byte 4 29
byte 4 5
byte 4 150
address $169
byte 4 201
byte 4 0
byte 4 0
byte 4 10
byte 4 100
byte 4 0
byte 4 25
byte 4 33
byte 4 150
address $170
byte 4 202
byte 4 1
byte 4 1
byte 4 10
byte 4 100
byte 4 0
byte 4 26
byte 4 42
byte 4 150
address $171
byte 4 203
byte 4 2
byte 4 2
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 47
byte 4 150
address $172
byte 4 204
byte 4 3
byte 4 3
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 55
byte 4 150
address $173
byte 4 205
byte 4 4
byte 4 4
byte 4 10
byte 4 100
byte 4 0
byte 4 28
byte 4 58
byte 4 150
address $174
byte 4 206
byte 4 5
byte 4 5
byte 4 10
byte 4 100
byte 4 0
byte 4 29
byte 4 63
byte 4 150
address $175
byte 4 207
byte 4 6
byte 4 6
byte 4 10
byte 4 100
byte 4 0
byte 4 30
byte 4 70
byte 4 150
address $176
byte 4 208
byte 4 0
byte 4 0
byte 4 10
byte 4 100
byte 4 0
byte 4 25
byte 4 33
byte 4 150
address $177
byte 4 209
byte 4 1
byte 4 1
byte 4 10
byte 4 100
byte 4 0
byte 4 26
byte 4 42
byte 4 150
address $178
byte 4 210
byte 4 2
byte 4 2
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 47
byte 4 150
address $179
byte 4 204
byte 4 3
byte 4 3
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 55
byte 4 150
address $180
byte 4 211
byte 4 4
byte 4 4
byte 4 10
byte 4 100
byte 4 0
byte 4 28
byte 4 58
byte 4 150
address $181
byte 4 212
byte 4 5
byte 4 5
byte 4 10
byte 4 100
byte 4 0
byte 4 29
byte 4 63
byte 4 150
address $182
byte 4 213
byte 4 6
byte 4 6
byte 4 10
byte 4 100
byte 4 0
byte 4 30
byte 4 70
byte 4 150
address $183
byte 4 214
byte 4 7
byte 4 7
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 55
byte 4 150
address $184
byte 4 534
byte 4 0
byte 4 0
byte 4 10
byte 4 100
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $185
byte 4 535
byte 4 1
byte 4 1
byte 4 10
byte 4 100
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $186
byte 4 536
byte 4 2
byte 4 2
byte 4 10
byte 4 100
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $187
byte 4 537
byte 4 3
byte 4 3
byte 4 10
byte 4 100
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $188
byte 4 538
byte 4 4
byte 4 4
byte 4 10
byte 4 100
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $189
byte 4 539
byte 4 5
byte 4 5
byte 4 10
byte 4 100
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $190
byte 4 540
byte 4 6
byte 4 6
byte 4 10
byte 4 100
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $191
byte 4 541
byte 4 7
byte 4 7
byte 4 10
byte 4 100
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $192
byte 4 542
byte 4 3
byte 4 7
byte 4 10
byte 4 50
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $193
byte 4 543
byte 4 2
byte 4 6
byte 4 10
byte 4 50
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $194
byte 4 544
byte 4 4
byte 4 0
byte 4 10
byte 4 50
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $195
byte 4 545
byte 4 6
byte 4 2
byte 4 10
byte 4 50
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $196
byte 4 546
byte 4 7
byte 4 3
byte 4 10
byte 4 50
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $197
byte 4 547
byte 4 0
byte 4 4
byte 4 10
byte 4 50
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $198
byte 4 528
byte 4 1
byte 4 3
byte 4 10
byte 4 50
byte 4 2
byte 4 27
byte 4 50
byte 4 150
address $199
byte 4 529
byte 4 1
byte 4 2
byte 4 10
byte 4 50
byte 4 2
byte 4 27
byte 4 45
byte 4 150
address $200
byte 4 530
byte 4 1
byte 4 4
byte 4 10
byte 4 50
byte 4 2
byte 4 28
byte 4 60
byte 4 150
address $201
byte 4 531
byte 4 1
byte 4 6
byte 4 10
byte 4 50
byte 4 2
byte 4 25
byte 4 72
byte 4 150
address $202
byte 4 533
byte 4 1
byte 4 0
byte 4 10
byte 4 50
byte 4 2
byte 4 30
byte 4 33
byte 4 150
address $203
byte 4 523
byte 4 1
byte 4 3
byte 4 10
byte 4 50
byte 4 2
byte 4 27
byte 4 10
byte 4 150
address $204
byte 4 524
byte 4 1
byte 4 4
byte 4 10
byte 4 50
byte 4 2
byte 4 27
byte 4 9
byte 4 150
address $205
byte 4 525
byte 4 1
byte 4 2
byte 4 10
byte 4 50
byte 4 2
byte 4 28
byte 4 4
byte 4 150
address $206
byte 4 526
byte 4 1
byte 4 0
byte 4 10
byte 4 50
byte 4 2
byte 4 25
byte 4 7
byte 4 150
address $207
byte 4 527
byte 4 1
byte 4 6
byte 4 10
byte 4 50
byte 4 2
byte 4 30
byte 4 6
byte 4 150
address $208
byte 4 523
byte 4 1
byte 4 3
byte 4 10
byte 4 50
byte 4 2
byte 4 27
byte 4 10
byte 4 300
address $209
byte 4 525
byte 4 1
byte 4 2
byte 4 10
byte 4 50
byte 4 2
byte 4 28
byte 4 4
byte 4 300
address $210
byte 4 524
byte 4 1
byte 4 4
byte 4 10
byte 4 50
byte 4 2
byte 4 27
byte 4 9
byte 4 300
address $211
byte 4 527
byte 4 1
byte 4 6
byte 4 10
byte 4 50
byte 4 2
byte 4 30
byte 4 6
byte 4 300
address $212
byte 4 526
byte 4 1
byte 4 0
byte 4 10
byte 4 50
byte 4 2
byte 4 25
byte 4 7
byte 4 300
export transitionMove
align 4
LABELV transitionMove
byte 4 0
byte 4 32
byte 4 33
byte 4 34
byte 4 35
byte 4 36
byte 4 37
byte 4 0
byte 4 38
byte 4 0
byte 4 39
byte 4 40
byte 4 41
byte 4 42
byte 4 43
byte 4 0
byte 4 44
byte 4 45
byte 4 0
byte 4 46
byte 4 47
byte 4 48
byte 4 49
byte 4 0
byte 4 50
byte 4 51
byte 4 52
byte 4 0
byte 4 53
byte 4 54
byte 4 55
byte 4 0
byte 4 56
byte 4 57
byte 4 58
byte 4 59
byte 4 0
byte 4 60
byte 4 61
byte 4 0
byte 4 62
byte 4 63
byte 4 64
byte 4 65
byte 4 66
byte 4 0
byte 4 67
byte 4 0
byte 4 68
byte 4 69
byte 4 70
byte 4 71
byte 4 72
byte 4 73
byte 4 0
byte 4 0
byte 4 68
byte 4 32
byte 4 33
byte 4 34
byte 4 35
byte 4 36
byte 4 37
byte 4 0
export PM_AttackMoveForQuad
code
proc PM_AttackMoveForQuad 4 0
line 324
;93:
;94:// Silly, but I'm replacing these macros so they are shorter!
;95:#define AFLAG_IDLE	(SETANIM_FLAG_NORMAL)
;96:#define AFLAG_ACTIVE (/*SETANIM_FLAG_OVERRIDE | */SETANIM_FLAG_HOLD | SETANIM_FLAG_HOLDLESS)
;97:#define AFLAG_WAIT (SETANIM_FLAG_HOLD | SETANIM_FLAG_HOLDLESS)
;98:#define AFLAG_FINISH (SETANIM_FLAG_HOLD)
;99:
;100:saberMoveData_t	saberMoveData[LS_MOVE_MAX] = {//							NB:randomized
;101:	// name			anim				startQ	endQ	setanimflag		blend,	blocking	chain_idle		chain_attack	trailLen
;102:	{"None",		BOTH_STAND1,		Q_R,	Q_R,	AFLAG_IDLE,		350,	BLK_NO,		LS_NONE,		LS_NONE,		0	},	// LS_NONE		= 0,
;103:
;104:	// General movements with saber
;105:	{"Ready",		BOTH_STAND2,		Q_R,	Q_R,	AFLAG_IDLE,		350,	BLK_WIDE,	LS_READY,		LS_S_R2L,		0	},	// LS_READY,
;106:	{"Draw",		BOTH_STAND1TO2,		Q_R,	Q_R,	AFLAG_FINISH,	350,	BLK_NO,		LS_READY,		LS_S_R2L,		0	},	// LS_DRAW,
;107:	{"Putaway",		BOTH_STAND2TO1,		Q_R,	Q_R,	AFLAG_FINISH,	350,	BLK_NO,		LS_READY,		LS_S_R2L,		0	},	// LS_PUTAWAY,
;108:
;109:	// Attacks
;110:	//UL2LR
;111:	{"TL2BR Att",	BOTH_A1_TL_BR,		Q_TL,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_R_TL2BR,		LS_R_TL2BR,		200	},	// LS_A_TL2BR
;112:	//SLASH LEFT
;113:	{"L2R Att",		BOTH_A1__L__R,		Q_L,	Q_R,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_R_L2R,		LS_R_L2R,		200 },	// LS_A_L2R
;114:	//LL2UR
;115:	{"BL2TR Att",	BOTH_A1_BL_TR,		Q_BL,	Q_TR,	AFLAG_ACTIVE,	50,		BLK_TIGHT,	LS_R_BL2TR,		LS_R_BL2TR,		200	},	// LS_A_BL2TR
;116:	//LR2UL
;117:	{"BR2TL Att",	BOTH_A1_BR_TL,		Q_BR,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_R_BR2TL,		LS_R_BR2TL,		200	},	// LS_A_BR2TL
;118:	//SLASH RIGHT
;119:	{"R2L Att",		BOTH_A1__R__L,		Q_R,	Q_L,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_R_R2L,		LS_R_R2L,		200 },// LS_A_R2L
;120:	//UR2LL
;121:	{"TR2BL Att",	BOTH_A1_TR_BL,		Q_TR,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_R_TR2BL,		LS_R_TR2BL,		200	},	// LS_A_TR2BL
;122:	//SLASH DOWN
;123:	{"T2B Att",		BOTH_A1_T__B_,		Q_T,	Q_B,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_R_T2B,		LS_R_T2B,		200	},	// LS_A_T2B
;124:	//special attacks
;125:	{"Back Stab",	BOTH_A2_STABBACK1,	Q_R,	Q_R,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_A_BACKSTAB
;126:	{"Back Att",	BOTH_ATTACK_BACK,	Q_R,	Q_R,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_A_BACK
;127:	{"CR Back Att",	BOTH_CROUCHATTACKBACK1,Q_R,	Q_R,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_A_BACK_CR
;128:	{"Lunge Att",	BOTH_LUNGE2_B__T_,	Q_B,	Q_T,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_A_LUNGE
;129:	{"Jump Att",	BOTH_FORCELEAP2_T__B_,Q_T,	Q_B,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_A_JUMP_T__B_
;130:	{"Flip Stab",	BOTH_JUMPFLIPSTABDOWN,Q_R,	Q_T,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_READY,		LS_T1_T___R,	200	},	// LS_A_FLIP_STAB
;131:	{"Flip Slash",	BOTH_JUMPFLIPSLASHDOWN1,Q_L,Q_R,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_READY,		LS_T1__R_T_,	200	},	// LS_A_FLIP_SLASH
;132:
;133:	//starts
;134:	{"TL2BR St",	BOTH_S1_S1_TL,		Q_R,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_A_TL2BR,		LS_A_TL2BR,		200	},	// LS_S_TL2BR
;135:	{"L2R St",		BOTH_S1_S1__L,		Q_R,	Q_L,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_A_L2R,		LS_A_L2R,		200	},	// LS_S_L2R
;136:	{"BL2TR St",	BOTH_S1_S1_BL,		Q_R,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_A_BL2TR,		LS_A_BL2TR,		200	},	// LS_S_BL2TR
;137:	{"BR2TL St",	BOTH_S1_S1_BR,		Q_R,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_A_BR2TL,		LS_A_BR2TL,		200	},	// LS_S_BR2TL
;138:	{"R2L St",		BOTH_S1_S1__R,		Q_R,	Q_R,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_A_R2L,		LS_A_R2L,		200	},	// LS_S_R2L
;139:	{"TR2BL St",	BOTH_S1_S1_TR,		Q_R,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_A_TR2BL,		LS_A_TR2BL,		200	},	// LS_S_TR2BL
;140:	{"T2B St",		BOTH_S1_S1_T_,		Q_R,	Q_T,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_A_T2B,		LS_A_T2B,		200	},	// LS_S_T2B
;141:	
;142:	//returns
;143:	{"TL2BR Ret",	BOTH_R1_BR_S1,		Q_BR,	Q_R,	AFLAG_FINISH,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_R_TL2BR
;144:	{"L2R Ret",		BOTH_R1__R_S1,		Q_R,	Q_R,	AFLAG_FINISH,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_R_L2R
;145:	{"BL2TR Ret",	BOTH_R1_TR_S1,		Q_TR,	Q_R,	AFLAG_FINISH,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_R_BL2TR
;146:	{"BR2TL Ret",	BOTH_R1_TL_S1,		Q_TL,	Q_R,	AFLAG_FINISH,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_R_BR2TL
;147:	{"R2L Ret",		BOTH_R1__L_S1,		Q_L,	Q_R,	AFLAG_FINISH,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_R_R2L
;148:	{"TR2BL Ret",	BOTH_R1_BL_S1,		Q_BL,	Q_R,	AFLAG_FINISH,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_R_TR2BL
;149:	{"T2B Ret",		BOTH_R1_B__S1,		Q_B,	Q_R,	AFLAG_FINISH,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_R_T2B
;150:
;151:	//Transitions
;152:	{"BR2R Trans",	BOTH_T1_BR__R,		Q_BR,	Q_R,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_L2R,		LS_A_R2L,		150	},	//# Fast arc bottom right to right
;153:	{"BR2TR Trans",	BOTH_T1_BR_TR,		Q_BR,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_TR2BL,		150	},	//# Fast arc bottom right to top right		(use: BOTH_T1_TR_BR)
;154:	{"BR2T Trans",	BOTH_T1_BR_T_,		Q_BR,	Q_T,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_T2B,		150	},	//# Fast arc bottom right to top			(use: BOTH_T1_T__BR)
;155:	{"BR2TL Trans",	BOTH_T1_BR_TL,		Q_BR,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BR2TL,		LS_A_TL2BR,		150	},	//# Fast weak spin bottom right to top left
;156:	{"BR2L Trans",	BOTH_T1_BR__L,		Q_BR,	Q_L,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_R2L,		LS_A_L2R,		150	},	//# Fast weak spin bottom right to left
;157:	{"BR2BL Trans",	BOTH_T1_BR_BL,		Q_BR,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TR2BL,		LS_A_BL2TR,		150	},	//# Fast weak spin bottom right to bottom left
;158:	{"R2BR Trans",	BOTH_T1__R_BR,		Q_R,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TL2BR,		LS_A_BR2TL,		150	},	//# Fast arc right to bottom right			(use: BOTH_T1_BR__R)
;159:	{"R2TR Trans",	BOTH_T1__R_TR,		Q_R,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_TR2BL,		150	},	//# Fast arc right to top right
;160:	{"R2T Trans",	BOTH_T1__R_T_,		Q_R,	Q_T,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_T2B,		150	},	//# Fast ar right to top				(use: BOTH_T1_T___R)
;161:	{"R2TL Trans",	BOTH_T1__R_TL,		Q_R,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BR2TL,		LS_A_TL2BR,		150	},	//# Fast arc right to top left
;162:	{"R2L Trans",	BOTH_T1__R__L,		Q_R,	Q_L,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_R2L,		LS_A_L2R,		150	},	//# Fast weak spin right to left
;163:	{"R2BL Trans",	BOTH_T1__R_BL,		Q_R,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TR2BL,		LS_A_BL2TR,		150	},	//# Fast weak spin right to bottom left
;164:	{"TR2BR Trans",	BOTH_T1_TR_BR,		Q_TR,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TL2BR,		LS_A_BR2TL,		150	},	//# Fast arc top right to bottom right
;165:	{"TR2R Trans",	BOTH_T1_TR__R,		Q_TR,	Q_R,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_L2R,		LS_A_R2L,		150	},	//# Fast arc top right to right			(use: BOTH_T1__R_TR)
;166:	{"TR2T Trans",	BOTH_T1_TR_T_,		Q_TR,	Q_T,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_T2B,		150	},	//# Fast arc top right to top				(use: BOTH_T1_T__TR)
;167:	{"TR2TL Trans",	BOTH_T1_TR_TL,		Q_TR,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BR2TL,		LS_A_TL2BR,		150	},	//# Fast arc top right to top left
;168:	{"TR2L Trans",	BOTH_T1_TR__L,		Q_TR,	Q_L,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_R2L,		LS_A_L2R,		150	},	//# Fast arc top right to left
;169:	{"TR2BL Trans",	BOTH_T1_TR_BL,		Q_TR,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TR2BL,		LS_A_BL2TR,		150	},	//# Fast weak spin top right to bottom left
;170:	{"T2BR Trans",	BOTH_T1_T__BR,		Q_T,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TL2BR,		LS_A_BR2TL,		150	},	//# Fast arc top to bottom right
;171:	{"T2R Trans",	BOTH_T1_T___R,		Q_T,	Q_R,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_L2R,		LS_A_R2L,		150	},	//# Fast arc top to right
;172:	{"T2TR Trans",	BOTH_T1_T__TR,		Q_T,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_TR2BL,		150	},	//# Fast arc top to top right
;173:	{"T2TL Trans",	BOTH_T1_T__TL,		Q_T,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BR2TL,		LS_A_TL2BR,		150	},	//# Fast arc top to top left
;174:	{"T2L Trans",	BOTH_T1_T___L,		Q_T,	Q_L,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_R2L,		LS_A_L2R,		150	},	//# Fast arc top to left
;175:	{"T2BL Trans",	BOTH_T1_T__BL,		Q_T,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TR2BL,		LS_A_BL2TR,		150	},	//# Fast arc top to bottom left
;176:	{"TL2BR Trans",	BOTH_T1_TL_BR,		Q_TL,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TL2BR,		LS_A_BR2TL,		150	},	//# Fast weak spin top left to bottom right
;177:	{"TL2R Trans",	BOTH_T1_TL__R,		Q_TL,	Q_R,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_L2R,		LS_A_R2L,		150	},	//# Fast arc top left to right			(use: BOTH_T1__R_TL)
;178:	{"TL2TR Trans",	BOTH_T1_TL_TR,		Q_TL,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_TR2BL,		150	},	//# Fast arc top left to top right			(use: BOTH_T1_TR_TL)
;179:	{"TL2T Trans",	BOTH_T1_TL_T_,		Q_TL,	Q_T,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_T2B,		150	},	//# Fast arc top left to top				(use: BOTH_T1_T__TL)
;180:	{"TL2L Trans",	BOTH_T1_TL__L,		Q_TL,	Q_L,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_R2L,		LS_A_L2R,		150	},	//# Fast arc top left to left				(use: BOTH_T1__L_TL)
;181:	{"TL2BL Trans",	BOTH_T1_TL_BL,		Q_TL,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TR2BL,		LS_A_BL2TR,		150	},	//# Fast arc top left to bottom left
;182:	{"L2BR Trans",	BOTH_T1__L_BR,		Q_L,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TL2BR,		LS_A_BR2TL,		150	},	//# Fast weak spin left to bottom right
;183:	{"L2R Trans",	BOTH_T1__L__R,		Q_L,	Q_R,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_L2R,		LS_A_R2L,		150	},	//# Fast weak spin left to right
;184:	{"L2TR Trans",	BOTH_T1__L_TR,		Q_L,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_TR2BL,		150	},	//# Fast arc left to top right			(use: BOTH_T1_TR__L)
;185:	{"L2T Trans",	BOTH_T1__L_T_,		Q_L,	Q_T,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_T2B,		150	},	//# Fast arc left to top				(use: BOTH_T1_T___L)
;186:	{"L2TL Trans",	BOTH_T1__L_TL,		Q_L,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BR2TL,		LS_A_TL2BR,		150	},	//# Fast arc left to top left
;187:	{"L2BL Trans",	BOTH_T1__L_BL,		Q_L,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TR2BL,		LS_A_BL2TR,		150	},	//# Fast arc left to bottom left			(use: BOTH_T1_BL__L)
;188:	{"BL2BR Trans",	BOTH_T1_BL_BR,		Q_BL,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TL2BR,		LS_A_BR2TL,		150	},	//# Fast weak spin bottom left to bottom right
;189:	{"BL2R Trans",	BOTH_T1_BL__R,		Q_BL,	Q_R,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_L2R,		LS_A_R2L,		150	},	//# Fast weak spin bottom left to right
;190:	{"BL2TR Trans",	BOTH_T1_BL_TR,		Q_BL,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_TR2BL,		150	},	//# Fast weak spin bottom left to top right
;191:	{"BL2T Trans",	BOTH_T1_BL_T_,		Q_BL,	Q_T,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_T2B,		150	},	//# Fast arc bottom left to top			(use: BOTH_T1_T__BL)
;192:	{"BL2TL Trans",	BOTH_T1_BL_TL,		Q_BL,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BR2TL,		LS_A_TL2BR,		150	},	//# Fast arc bottom left to top left		(use: BOTH_T1_TL_BL)
;193:	{"BL2L Trans",	BOTH_T1_BL__L,		Q_BL,	Q_L,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_R2L,		LS_A_L2R,		150	},	//# Fast arc bottom left to left
;194:
;195:	//Bounces
;196:	{"Bounce BR",	BOTH_B1_BR___,		Q_BR,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TL2BR,		LS_T1_BR_TR,	150	},	
;197:	{"Bounce R",	BOTH_B1__R___,		Q_R,	Q_R,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_L2R,		LS_T1__R__L,	150	},	
;198:	{"Bounce TR",	BOTH_B1_TR___,		Q_TR,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_T1_TR_TL,	150	},	
;199:	{"Bounce T",	BOTH_B1_T____,		Q_T,	Q_T,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_T1_T__BL,	150	},	
;200:	{"Bounce TL",	BOTH_B1_TL___,		Q_TL,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BR2TL,		LS_T1_TL_TR,	150	},	
;201:	{"Bounce L",	BOTH_B1__L___,		Q_L,	Q_L,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_R2L,		LS_T1__L__R,	150	},	
;202:	{"Bounce BL",	BOTH_B1_BL___,		Q_BL,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TR2BL,		LS_T1_BL_TR,	150	},	
;203:
;204:	//Deflected attacks (like bounces, but slide off enemy saber, not straight back)
;205:	{"Deflect BR",	BOTH_D1_BR___,		Q_BR,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TL2BR,		LS_T1_BR_TR,	150	},	
;206:	{"Deflect R",	BOTH_D1__R___,		Q_R,	Q_R,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_L2R,		LS_T1__R__L,	150	},	
;207:	{"Deflect TR",	BOTH_D1_TR___,		Q_TR,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_T1_TR_TL,	150	},	
;208:	{"Deflect T",	BOTH_B1_T____,		Q_T,	Q_T,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_T1_T__BL,	150	},	
;209:	{"Deflect TL",	BOTH_D1_TL___,		Q_TL,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BR2TL,		LS_T1_TL_TR,	150	},	
;210:	{"Deflect L",	BOTH_D1__L___,		Q_L,	Q_L,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_R2L,		LS_T1__L__R,	150	},	
;211:	{"Deflect BL",	BOTH_D1_BL___,		Q_BL,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TR2BL,		LS_T1_BL_TR,	150	},	
;212:	{"Deflect B",	BOTH_D1_B____,		Q_B,	Q_B,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_T1_T__BL,	150	},	
;213:
;214:	//Reflected attacks
;215:	{"Reflected BR",BOTH_V1_BR_S1,		Q_BR,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_READY,		LS_READY,	150	},//	LS_V1_BR
;216:	{"Reflected R",	BOTH_V1__R_S1,		Q_R,	Q_R,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_READY,		LS_READY,	150	},//	LS_V1__R
;217:	{"Reflected TR",BOTH_V1_TR_S1,		Q_TR,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_READY,		LS_READY,	150	},//	LS_V1_TR
;218:	{"Reflected T",	BOTH_V1_T__S1,		Q_T,	Q_T,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_READY,		LS_READY,	150	},//	LS_V1_T_
;219:	{"Reflected TL",BOTH_V1_TL_S1,		Q_TL,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_READY,		LS_READY,	150	},//	LS_V1_TL
;220:	{"Reflected L",	BOTH_V1__L_S1,		Q_L,	Q_L,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_READY,		LS_READY,	150	},//	LS_V1__L
;221:	{"Reflected BL",BOTH_V1_BL_S1,		Q_BL,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_READY,		LS_READY,	150	},//	LS_V1_BL
;222:	{"Reflected B",	BOTH_V1_B__S1,		Q_B,	Q_B,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_READY,		LS_READY,	150	},//	LS_V1_B_
;223:
;224:	// Broken parries
;225:	{"BParry Top",	BOTH_H1_S1_T_,		Q_T,	Q_B,	AFLAG_ACTIVE,	50,		BLK_NO,	LS_READY,		LS_READY,		150	},	// LS_PARRY_UP,
;226:	{"BParry UR",	BOTH_H1_S1_TR,		Q_TR,	Q_BL,	AFLAG_ACTIVE,	50,		BLK_NO,	LS_READY,		LS_READY,		150	},	// LS_PARRY_UR,
;227:	{"BParry UL",	BOTH_H1_S1_TL,		Q_TL,	Q_BR,	AFLAG_ACTIVE,	50,		BLK_NO,	LS_READY,		LS_READY,		150	},	// LS_PARRY_UL,
;228:	{"BParry LR",	BOTH_H1_S1_BL,		Q_BL,	Q_TR,	AFLAG_ACTIVE,	50,		BLK_NO,	LS_READY,		LS_READY,		150	},	// LS_PARRY_LR,
;229:	{"BParry Bot",	BOTH_H1_S1_B_,		Q_B,	Q_T,	AFLAG_ACTIVE,	50,		BLK_NO,	LS_READY,		LS_READY,		150	},	// LS_PARRY_LL
;230:	{"BParry LL",	BOTH_H1_S1_BR,		Q_BR,	Q_TL,	AFLAG_ACTIVE,	50,		BLK_NO,	LS_READY,		LS_READY,		150	},	// LS_PARRY_LL
;231:
;232:	// Knockaways
;233:	{"Knock Top",	BOTH_K1_S1_T_,		Q_R,	Q_T,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_BL2TR,		LS_T1_T__BR,		150	},	// LS_PARRY_UP,
;234:	{"Knock UR",	BOTH_K1_S1_TR,		Q_R,	Q_TR,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_BL2TR,		LS_T1_TR__R,		150	},	// LS_PARRY_UR,
;235:	{"Knock UL",	BOTH_K1_S1_TL,		Q_R,	Q_TL,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_BR2TL,		LS_T1_TL__L,		150	},	// LS_PARRY_UL,
;236:	{"Knock LR",	BOTH_K1_S1_BL,		Q_R,	Q_BL,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_TL2BR,		LS_T1_BL_TL,		150	},	// LS_PARRY_LR,
;237:	{"Knock LL",	BOTH_K1_S1_BR,		Q_R,	Q_BR,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_TR2BL,		LS_T1_BR_TR,		150	},	// LS_PARRY_LL
;238:
;239:	// Parry
;240:	{"Parry Top",	BOTH_P1_S1_T_,		Q_R,	Q_T,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_BL2TR,		LS_A_T2B,		150	},	// LS_PARRY_UP,
;241:	{"Parry UR",	BOTH_P1_S1_TR,		Q_R,	Q_TL,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_BL2TR,		LS_A_TR2BL,		150	},	// LS_PARRY_UR,
;242:	{"Parry UL",	BOTH_P1_S1_TL,		Q_R,	Q_TR,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_BR2TL,		LS_A_TL2BR,		150	},	// LS_PARRY_UL,
;243:	{"Parry LR",	BOTH_P1_S1_BL,		Q_R,	Q_BR,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_TL2BR,		LS_A_BR2TL,		150	},	// LS_PARRY_LR,
;244:	{"Parry LL",	BOTH_P1_S1_BR,		Q_R,	Q_BL,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_TR2BL,		LS_A_BL2TR,		150	},	// LS_PARRY_LL
;245:
;246:	// Reflecting a missile
;247:	{"Reflect Top",	BOTH_P1_S1_T_,		Q_R,	Q_T,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_BL2TR,		LS_A_T2B,		300	},	// LS_PARRY_UP,
;248:	{"Reflect UR",	BOTH_P1_S1_TL,		Q_R,	Q_TR,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_BR2TL,		LS_A_TL2BR,		300	},	// LS_PARRY_UR,
;249:	{"Reflect UL",	BOTH_P1_S1_TR,		Q_R,	Q_TL,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_BL2TR,		LS_A_TR2BL,		300	},	// LS_PARRY_UL,
;250:	{"Reflect LR",	BOTH_P1_S1_BR,		Q_R,	Q_BL,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_TR2BL,		LS_A_BL2TR,		300	},	// LS_PARRY_LR
;251:	{"Reflect LL",	BOTH_P1_S1_BL,		Q_R,	Q_BR,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_TL2BR,		LS_A_BR2TL,		300	},	// LS_PARRY_LL,
;252:};
;253:
;254:
;255:int transitionMove[Q_NUM_QUADS][Q_NUM_QUADS] = 
;256:{
;257:	LS_NONE,	//Can't transition to same pos!
;258:	LS_T1_BR__R,//40
;259:	LS_T1_BR_TR,
;260:	LS_T1_BR_T_,
;261:	LS_T1_BR_TL,
;262:	LS_T1_BR__L,
;263:	LS_T1_BR_BL,
;264:	LS_NONE,	//No transitions to bottom, and no anims start there, so shouldn't need any
;265:	LS_T1__R_BR,//46
;266:	LS_NONE,	//Can't transition to same pos!
;267:	LS_T1__R_TR,
;268:	LS_T1__R_T_,
;269:	LS_T1__R_TL,
;270:	LS_T1__R__L,
;271:	LS_T1__R_BL,
;272:	LS_NONE,	//No transitions to bottom, and no anims start there, so shouldn't need any
;273:	LS_T1_TR_BR,//52
;274:	LS_T1_TR__R,
;275:	LS_NONE,	//Can't transition to same pos!
;276:	LS_T1_TR_T_,
;277:	LS_T1_TR_TL,
;278:	LS_T1_TR__L,
;279:	LS_T1_TR_BL,
;280:	LS_NONE,	//No transitions to bottom, and no anims start there, so shouldn't need any
;281:	LS_T1_T__BR,//58
;282:	LS_T1_T___R,
;283:	LS_T1_T__TR,
;284:	LS_NONE,	//Can't transition to same pos!
;285:	LS_T1_T__TL,
;286:	LS_T1_T___L,
;287:	LS_T1_T__BL,
;288:	LS_NONE,	//No transitions to bottom, and no anims start there, so shouldn't need any
;289:	LS_T1_TL_BR,//64
;290:	LS_T1_TL__R,
;291:	LS_T1_TL_TR,
;292:	LS_T1_TL_T_,
;293:	LS_NONE,	//Can't transition to same pos!
;294:	LS_T1_TL__L,
;295:	LS_T1_TL_BL,
;296:	LS_NONE,	//No transitions to bottom, and no anims start there, so shouldn't need any
;297:	LS_T1__L_BR,//70
;298:	LS_T1__L__R,
;299:	LS_T1__L_TR,
;300:	LS_T1__L_T_,
;301:	LS_T1__L_TL,
;302:	LS_NONE,	//Can't transition to same pos!
;303:	LS_T1__L_BL,
;304:	LS_NONE,	//No transitions to bottom, and no anims start there, so shouldn't need any
;305:	LS_T1_BL_BR,//76
;306:	LS_T1_BL__R,
;307:	LS_T1_BL_TR,
;308:	LS_T1_BL_T_,
;309:	LS_T1_BL_TL,
;310:	LS_T1_BL__L,
;311:	LS_NONE,	//Can't transition to same pos!
;312:	LS_NONE,	//No transitions to bottom, and no anims start there, so shouldn't need any
;313:	LS_T1_BL_BR,//NOTE: there are no transitions from bottom, so re-use the bottom right transitions
;314:	LS_T1_BR__R,
;315:	LS_T1_BR_TR,
;316:	LS_T1_BR_T_,
;317:	LS_T1_BR_TL,
;318:	LS_T1_BR__L,
;319:	LS_T1_BR_BL,
;320:	LS_NONE		//No transitions to bottom, and no anims start there, so shouldn't need any
;321:};
;322:
;323:saberMoveName_t PM_AttackMoveForQuad( int quad )
;324:{
line 325
;325:	switch ( quad )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $214
ADDRLP4 0
INDIRI4
CNSTI4 7
GTI4 $214
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $223
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $223
address $216
address $217
address $218
address $219
address $220
address $221
address $222
address $216
code
line 326
;326:	{
LABELV $216
line 329
;327:	case Q_B:
;328:	case Q_BR:
;329:		return LS_A_BR2TL;
CNSTI4 7
RETI4
ADDRGP4 $213
JUMPV
line 330
;330:		break;
LABELV $217
line 332
;331:	case Q_R:
;332:		return LS_A_R2L;
CNSTI4 8
RETI4
ADDRGP4 $213
JUMPV
line 333
;333:		break;
LABELV $218
line 335
;334:	case Q_TR:
;335:		return LS_A_TR2BL;
CNSTI4 9
RETI4
ADDRGP4 $213
JUMPV
line 336
;336:		break;
LABELV $219
line 338
;337:	case Q_T:
;338:		return LS_A_T2B;
CNSTI4 10
RETI4
ADDRGP4 $213
JUMPV
line 339
;339:		break;
LABELV $220
line 341
;340:	case Q_TL:
;341:		return LS_A_TL2BR;
CNSTI4 4
RETI4
ADDRGP4 $213
JUMPV
line 342
;342:		break;
LABELV $221
line 344
;343:	case Q_L:
;344:		return LS_A_L2R;
CNSTI4 5
RETI4
ADDRGP4 $213
JUMPV
line 345
;345:		break;
LABELV $222
line 347
;346:	case Q_BL:
;347:		return LS_A_BL2TR;
CNSTI4 6
RETI4
ADDRGP4 $213
JUMPV
line 348
;348:		break;
LABELV $214
line 350
;349:	}
;350:	return LS_NONE;
CNSTI4 0
RETI4
LABELV $213
endproc PM_AttackMoveForQuad 4 0
export PM_SaberAnimTransitionAnim
proc PM_SaberAnimTransitionAnim 32 8
line 356
;351:}
;352:
;353:qboolean PM_SaberKataDone(int curmove, int newmove);
;354:
;355:int PM_SaberAnimTransitionAnim( int curmove, int newmove )
;356:{
line 357
;357:	int retmove = newmove;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 358
;358:	if ( curmove == LS_READY )
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $225
line 359
;359:	{//just standing there
line 360
;360:		switch ( newmove )
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
LTI4 $226
ADDRLP4 4
INDIRI4
CNSTI4 10
GTI4 $226
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $230-16
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $230
address $229
address $229
address $229
address $229
address $229
address $229
address $229
code
line 361
;361:		{
LABELV $229
line 370
;362:		case LS_A_TL2BR:
;363:		case LS_A_L2R:
;364:		case LS_A_BL2TR:
;365:		case LS_A_BR2TL:
;366:		case LS_A_R2L:
;367:		case LS_A_TR2BL:
;368:		case LS_A_T2B:
;369:			//transition is the start
;370:			retmove = LS_S_TL2BR + (newmove-LS_A_TL2BR);
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 4
SUBI4
CNSTI4 18
ADDI4
ASGNI4
line 371
;371:			break;
line 373
;372:		}
;373:	}
ADDRGP4 $226
JUMPV
LABELV $225
line 375
;374:	else
;375:	{
line 376
;376:		switch ( newmove )
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $232
ADDRLP4 4
INDIRI4
CNSTI4 10
GTI4 $232
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $264-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $264
address $234
address $232
address $232
address $240
address $240
address $240
address $240
address $240
address $240
address $240
code
line 377
;377:		{
LABELV $234
line 380
;378:		//transitioning to ready pose
;379:		case LS_READY:
;380:			switch ( curmove )
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 4
LTI4 $233
ADDRLP4 8
INDIRI4
CNSTI4 10
GTI4 $233
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $238-16
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $238
address $237
address $237
address $237
address $237
address $237
address $237
address $237
code
line 381
;381:			{
LABELV $237
line 391
;382:			//transitioning from an attack
;383:			case LS_A_TL2BR:
;384:			case LS_A_L2R:
;385:			case LS_A_BL2TR:
;386:			case LS_A_BR2TL:
;387:			case LS_A_R2L:
;388:			case LS_A_TR2BL:
;389:			case LS_A_T2B:
;390:				//transition is the return
;391:				retmove = LS_R_TL2BR + (newmove-LS_A_TL2BR);
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 4
SUBI4
CNSTI4 25
ADDI4
ASGNI4
line 392
;392:				break;
line 394
;393:			}
;394:			break;
ADDRGP4 $233
JUMPV
LABELV $240
line 403
;395:		//transitioning to an attack
;396:		case LS_A_TL2BR:
;397:		case LS_A_L2R:
;398:		case LS_A_BL2TR:
;399:		case LS_A_BR2TL:
;400:		case LS_A_R2L:
;401:		case LS_A_TR2BL:
;402:		case LS_A_T2B:
;403:			if ( newmove == curmove )
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $241
line 404
;404:			{
line 406
;405:				//going into an attack
;406:				if ( PM_SaberKataDone( curmove, newmove ) )
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 PM_SaberKataDone
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $243
line 407
;407:				{//done with this kata, must return to ready before attack again
line 408
;408:					retmove = LS_R_TL2BR + (newmove-LS_A_TL2BR);
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 4
SUBI4
CNSTI4 25
ADDI4
ASGNI4
line 409
;409:				}
ADDRGP4 $233
JUMPV
LABELV $243
line 411
;410:				else
;411:				{//okay to chain to another attack
line 412
;412:					retmove = transitionMove[saberMoveData[curmove].endQuad][saberMoveData[newmove].startQuad];
ADDRLP4 16
CNSTI4 40
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRI4
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 saberMoveData+12
ADDP4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 transitionMove
ADDP4
ADDP4
INDIRI4
ASGNI4
line 413
;413:				}
line 414
;414:			}
ADDRGP4 $233
JUMPV
LABELV $241
line 415
;415:			else if ( saberMoveData[curmove].endQuad == saberMoveData[newmove].startQuad )
ADDRLP4 12
CNSTI4 40
ASGNI4
ADDRLP4 12
INDIRI4
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 saberMoveData+12
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
NEI4 $247
line 416
;416:			{//new move starts from same quadrant
line 417
;417:				retmove = newmove;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 418
;418:			}
ADDRGP4 $233
JUMPV
LABELV $247
line 420
;419:			else
;420:			{
line 421
;421:				switch ( curmove )
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 4
LTI4 $233
ADDRLP4 16
INDIRI4
CNSTI4 31
GTI4 $259
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $260-16
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $260
address $253
address $253
address $253
address $253
address $253
address $253
address $253
address $233
address $233
address $233
address $233
address $233
address $233
address $233
address $233
address $233
address $233
address $233
address $233
address $233
address $233
address $256
address $256
address $256
address $256
address $256
address $256
address $256
code
LABELV $259
ADDRLP4 20
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 81
LTI4 $233
ADDRLP4 20
INDIRI4
CNSTI4 117
GTI4 $233
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $262-324
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $262
address $253
address $253
address $253
address $253
address $253
address $253
address $253
address $253
address $256
address $256
address $256
address $256
address $256
address $256
address $256
address $256
address $256
address $256
address $256
address $256
address $233
address $256
address $256
address $256
address $256
address $256
address $256
address $256
address $256
address $256
address $256
address $256
address $256
address $256
address $256
address $256
address $256
code
line 422
;422:				{
LABELV $253
line 439
;423:				//transitioning from an attack
;424:				case LS_A_TL2BR:
;425:				case LS_A_L2R:
;426:				case LS_A_BL2TR:
;427:				case LS_A_BR2TL:
;428:				case LS_A_R2L:
;429:				case LS_A_TR2BL:
;430:				case LS_A_T2B:
;431:				case LS_D1_BR:
;432:				case LS_D1__R:
;433:				case LS_D1_TR:
;434:				case LS_D1_T_:
;435:				case LS_D1_TL:
;436:				case LS_D1__L:
;437:				case LS_D1_BL:
;438:				case LS_D1_B_:
;439:					retmove = transitionMove[saberMoveData[curmove].endQuad][saberMoveData[newmove].startQuad];
ADDRLP4 24
CNSTI4 40
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRI4
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 saberMoveData+12
ADDP4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 transitionMove
ADDP4
ADDP4
INDIRI4
ASGNI4
line 440
;440:					break;
ADDRGP4 $233
JUMPV
LABELV $256
line 496
;441:				//transitioning from a return
;442:				case LS_R_TL2BR:
;443:				case LS_R_L2R:
;444:				case LS_R_BL2TR:
;445:				case LS_R_BR2TL:
;446:				case LS_R_R2L:
;447:				case LS_R_TR2BL:
;448:				case LS_R_T2B:
;449:				//transitioning from a bounce
;450:				/*
;451:				case LS_BOUNCE_UL2LL:
;452:				case LS_BOUNCE_LL2UL:
;453:				case LS_BOUNCE_L2LL:
;454:				case LS_BOUNCE_L2UL:
;455:				case LS_BOUNCE_UR2LR:
;456:				case LS_BOUNCE_LR2UR:
;457:				case LS_BOUNCE_R2LR:
;458:				case LS_BOUNCE_R2UR:
;459:				case LS_BOUNCE_TOP:
;460:				case LS_OVER_UR2UL:
;461:				case LS_OVER_UL2UR:
;462:				case LS_BOUNCE_UR:
;463:				case LS_BOUNCE_UL:
;464:				case LS_BOUNCE_LR:
;465:				case LS_BOUNCE_LL:
;466:				*/
;467:				//transitioning from a parry/reflection/knockaway/broken parry
;468:				case LS_PARRY_UP:
;469:				case LS_PARRY_UR:
;470:				case LS_PARRY_UL:
;471:				case LS_PARRY_LR:
;472:				case LS_PARRY_LL:
;473:				case LS_REFLECT_UP:
;474:				case LS_REFLECT_UR:
;475:				case LS_REFLECT_UL:
;476:				case LS_REFLECT_LR:
;477:				case LS_REFLECT_LL:
;478:				case LS_K1_T_:
;479:				case LS_K1_TR:
;480:				case LS_K1_TL:
;481:				case LS_K1_BR:
;482:				case LS_K1_BL:
;483:				case LS_V1_BR:
;484:				case LS_V1__R:
;485:				case LS_V1_TR:
;486:				case LS_V1_T_:
;487:				case LS_V1_TL:
;488:				case LS_V1__L:
;489:				case LS_V1_BL:
;490:				case LS_V1_B_:
;491:				case LS_H1_T_:
;492:				case LS_H1_TR:
;493:				case LS_H1_TL:
;494:				case LS_H1_BR:
;495:				case LS_H1_BL:
;496:					retmove = transitionMove[saberMoveData[curmove].endQuad][saberMoveData[newmove].startQuad];
ADDRLP4 28
CNSTI4 40
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
INDIRI4
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 saberMoveData+12
ADDP4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 transitionMove
ADDP4
ADDP4
INDIRI4
ASGNI4
line 497
;497:					break;
line 500
;498:				//NB: transitioning from transitions is fine
;499:				}
;500:			}
line 501
;501:			break;
LABELV $232
LABELV $233
line 504
;502:		//transitioning to any other anim is not supported
;503:		}
;504:	}
LABELV $226
line 506
;505:
;506:	if ( retmove == LS_NONE )
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $266
line 507
;507:	{
line 508
;508:		return newmove;
ADDRFP4 4
INDIRI4
RETI4
ADDRGP4 $224
JUMPV
LABELV $266
line 511
;509:	}
;510:
;511:	return retmove;
ADDRLP4 0
INDIRI4
RETI4
LABELV $224
endproc PM_SaberAnimTransitionAnim 32 8
export PM_SaberMoveQuadrantForMovement
proc PM_SaberMoveQuadrantForMovement 0 0
line 515
;512:}
;513:
;514:int PM_SaberMoveQuadrantForMovement( usercmd_t *ucmd )
;515:{
line 516
;516:	if ( ucmd->rightmove > 0 )
ADDRFP4 0
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $269
line 517
;517:	{//moving right
line 518
;518:		if ( ucmd->forwardmove > 0 )
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $271
line 519
;519:		{//forward right = TL2BR slash
line 520
;520:			return Q_TL;
CNSTI4 4
RETI4
ADDRGP4 $268
JUMPV
LABELV $271
line 522
;521:		}
;522:		else if ( ucmd->forwardmove < 0 )
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $273
line 523
;523:		{//backward right = BL2TR uppercut
line 524
;524:			return Q_BL;
CNSTI4 6
RETI4
ADDRGP4 $268
JUMPV
LABELV $273
line 527
;525:		}
;526:		else
;527:		{//just right is a left slice
line 528
;528:			return Q_L;
CNSTI4 5
RETI4
ADDRGP4 $268
JUMPV
LABELV $269
line 531
;529:		}
;530:	}
;531:	else if ( ucmd->rightmove < 0 )
ADDRFP4 0
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $275
line 532
;532:	{//moving left
line 533
;533:		if ( ucmd->forwardmove > 0 )
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $277
line 534
;534:		{//forward left = TR2BL slash
line 535
;535:			return Q_TR;
CNSTI4 2
RETI4
ADDRGP4 $268
JUMPV
LABELV $277
line 537
;536:		}
;537:		else if ( ucmd->forwardmove < 0 )
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $279
line 538
;538:		{//backward left = BR2TL uppercut
line 539
;539:			return Q_BR;
CNSTI4 0
RETI4
ADDRGP4 $268
JUMPV
LABELV $279
line 542
;540:		}
;541:		else
;542:		{//just left is a right slice
line 543
;543:			return Q_R;
CNSTI4 1
RETI4
ADDRGP4 $268
JUMPV
LABELV $275
line 547
;544:		}
;545:	}
;546:	else
;547:	{//not moving left or right
line 548
;548:		if ( ucmd->forwardmove > 0 )
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $281
line 549
;549:		{//forward= T2B slash
line 550
;550:			return Q_T;
CNSTI4 3
RETI4
ADDRGP4 $268
JUMPV
LABELV $281
line 552
;551:		}
;552:		else if ( ucmd->forwardmove < 0 )
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $283
line 553
;553:		{//backward= T2B slash	//or B2T uppercut?
line 554
;554:			return Q_T;
CNSTI4 3
RETI4
ADDRGP4 $268
JUMPV
LABELV $283
line 557
;555:		}
;556:		else
;557:		{//Not moving at all
line 558
;558:			return Q_R;
CNSTI4 1
RETI4
LABELV $268
endproc PM_SaberMoveQuadrantForMovement 0 0
export PM_SaberInBounce
proc PM_SaberInBounce 8 0
line 565
;559:		}
;560:	}
;561:}
;562:
;563://===================================================================
;564:qboolean PM_SaberInBounce( int move )
;565:{
line 566
;566:	if ( move >= LS_B1_BR && move <= LS_B1_BL )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 74
LTI4 $286
ADDRLP4 0
INDIRI4
CNSTI4 80
GTI4 $286
line 567
;567:	{
line 568
;568:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $285
JUMPV
LABELV $286
line 570
;569:	}
;570:	if ( move >= LS_D1_BR && move <= LS_D1_BL )
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 81
LTI4 $288
ADDRLP4 4
INDIRI4
CNSTI4 87
GTI4 $288
line 571
;571:	{
line 572
;572:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $285
JUMPV
LABELV $288
line 574
;573:	}
;574:	return qfalse;
CNSTI4 0
RETI4
LABELV $285
endproc PM_SaberInBounce 8 0
export PM_SaberInTransition
proc PM_SaberInTransition 4 0
line 578
;575:}
;576:
;577:qboolean PM_SaberInTransition( int move )
;578:{
line 579
;579:	if ( move >= LS_T1_BR__R && move <= LS_T1_BL__L )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $291
ADDRLP4 0
INDIRI4
CNSTI4 73
GTI4 $291
line 580
;580:	{
line 581
;581:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $290
JUMPV
LABELV $291
line 583
;582:	}
;583:	return qfalse;
CNSTI4 0
RETI4
LABELV $290
endproc PM_SaberInTransition 4 0
data
export saberMoveTransitionAngle
align 4
LABELV saberMoveTransitionAngle
byte 4 0
byte 4 45
byte 4 90
byte 4 135
byte 4 180
byte 4 215
byte 4 270
byte 4 45
byte 4 45
byte 4 0
byte 4 45
byte 4 90
byte 4 135
byte 4 180
byte 4 215
byte 4 90
byte 4 90
byte 4 45
byte 4 0
byte 4 45
byte 4 90
byte 4 135
byte 4 180
byte 4 135
byte 4 135
byte 4 90
byte 4 45
byte 4 0
byte 4 45
byte 4 90
byte 4 135
byte 4 180
byte 4 180
byte 4 135
byte 4 90
byte 4 45
byte 4 0
byte 4 45
byte 4 90
byte 4 135
byte 4 215
byte 4 180
byte 4 135
byte 4 90
byte 4 45
byte 4 0
byte 4 45
byte 4 90
byte 4 270
byte 4 215
byte 4 180
byte 4 135
byte 4 90
byte 4 45
byte 4 0
byte 4 45
byte 4 45
byte 4 90
byte 4 135
byte 4 180
byte 4 135
byte 4 90
byte 4 45
byte 4 0
export PM_SaberAttackChainAngle
code
proc PM_SaberAttackChainAngle 8 0
line 655
;584:}
;585:
;586:int saberMoveTransitionAngle[Q_NUM_QUADS][Q_NUM_QUADS] = 
;587:{
;588:	0,//Q_BR,Q_BR,
;589:	45,//Q_BR,Q_R,
;590:	90,//Q_BR,Q_TR,
;591:	135,//Q_BR,Q_T,
;592:	180,//Q_BR,Q_TL,
;593:	215,//Q_BR,Q_L,
;594:	270,//Q_BR,Q_BL,
;595:	45,//Q_BR,Q_B,
;596:	45,//Q_R,Q_BR,
;597:	0,//Q_R,Q_R,
;598:	45,//Q_R,Q_TR,
;599:	90,//Q_R,Q_T,
;600:	135,//Q_R,Q_TL,
;601:	180,//Q_R,Q_L,
;602:	215,//Q_R,Q_BL,
;603:	90,//Q_R,Q_B,
;604:	90,//Q_TR,Q_BR,
;605:	45,//Q_TR,Q_R,
;606:	0,//Q_TR,Q_TR,
;607:	45,//Q_TR,Q_T,
;608:	90,//Q_TR,Q_TL,
;609:	135,//Q_TR,Q_L,
;610:	180,//Q_TR,Q_BL,
;611:	135,//Q_TR,Q_B,
;612:	135,//Q_T,Q_BR,
;613:	90,//Q_T,Q_R,
;614:	45,//Q_T,Q_TR,
;615:	0,//Q_T,Q_T,
;616:	45,//Q_T,Q_TL,
;617:	90,//Q_T,Q_L,
;618:	135,//Q_T,Q_BL,
;619:	180,//Q_T,Q_B,
;620:	180,//Q_TL,Q_BR,
;621:	135,//Q_TL,Q_R,
;622:	90,//Q_TL,Q_TR,
;623:	45,//Q_TL,Q_T,
;624:	0,//Q_TL,Q_TL,
;625:	45,//Q_TL,Q_L,
;626:	90,//Q_TL,Q_BL,
;627:	135,//Q_TL,Q_B,
;628:	215,//Q_L,Q_BR,
;629:	180,//Q_L,Q_R,
;630:	135,//Q_L,Q_TR,
;631:	90,//Q_L,Q_T,
;632:	45,//Q_L,Q_TL,
;633:	0,//Q_L,Q_L,
;634:	45,//Q_L,Q_BL,
;635:	90,//Q_L,Q_B,
;636:	270,//Q_BL,Q_BR,
;637:	215,//Q_BL,Q_R,
;638:	180,//Q_BL,Q_TR,
;639:	135,//Q_BL,Q_T,
;640:	90,//Q_BL,Q_TL,
;641:	45,//Q_BL,Q_L,
;642:	0,//Q_BL,Q_BL,
;643:	45,//Q_BL,Q_B,
;644:	45,//Q_B,Q_BR,
;645:	90,//Q_B,Q_R,
;646:	135,//Q_B,Q_TR,
;647:	180,//Q_B,Q_T,
;648:	135,//Q_B,Q_TL,
;649:	90,//Q_B,Q_L,
;650:	45,//Q_B,Q_BL,
;651:	0//Q_B,Q_B,
;652:};
;653:
;654:int PM_SaberAttackChainAngle( int move1, int move2 )
;655:{
line 656
;656:	if ( move1 == -1 || move2 == -1 )
ADDRLP4 0
CNSTI4 -1
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $296
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $294
LABELV $296
line 657
;657:	{
line 658
;658:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $293
JUMPV
LABELV $294
line 660
;659:	}
;660:	return saberMoveTransitionAngle[saberMoveData[move1].endQuad][saberMoveData[move2].startQuad];
ADDRLP4 4
CNSTI4 40
ASGNI4
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 saberMoveData+12
ADDP4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 saberMoveTransitionAngle
ADDP4
ADDP4
INDIRI4
RETI4
LABELV $293
endproc PM_SaberAttackChainAngle 8 0
export PM_SaberKataDone
proc PM_SaberKataDone 20 8
line 664
;661:}
;662:
;663:qboolean PM_SaberKataDone(int curmove, int newmove)
;664:{
line 665
;665:	if ( pm->ps->fd.saberAnimLevel == FORCE_LEVEL_3 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
NEI4 $300
line 666
;666:	{
line 667
;667:		if ( curmove == LS_NONE || newmove == LS_NONE )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $304
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $302
LABELV $304
line 668
;668:		{
line 669
;669:			if ( pm->ps->fd.saberAnimLevel >= FORCE_LEVEL_3 && pm->ps->saberAttackChainCount > PM_irand_timesync( 0, 1 ) )
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
LTI4 $301
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 1308
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $301
line 670
;670:			{
line 671
;671:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $299
JUMPV
line 673
;672:			}
;673:		}
LABELV $302
line 674
;674:		else if ( pm->ps->saberAttackChainCount > PM_irand_timesync( 2, 3 ) )
CNSTI4 2
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 4
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1308
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $307
line 675
;675:		{
line 676
;676:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $299
JUMPV
LABELV $307
line 678
;677:		}
;678:		else if ( pm->ps->saberAttackChainCount > 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1308
ADDP4
INDIRI4
CNSTI4 0
LEI4 $301
line 679
;679:		{
line 680
;680:			int chainAngle = PM_SaberAttackChainAngle( curmove, newmove );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 PM_SaberAttackChainAngle
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 681
;681:			if ( chainAngle < 135 || chainAngle > 215 )
ADDRLP4 16
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 135
LTI4 $313
ADDRLP4 16
INDIRI4
CNSTI4 215
LEI4 $311
LABELV $313
line 682
;682:			{//if trying to chain to a move that doesn't continue the momentum
line 683
;683:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $299
JUMPV
LABELV $311
line 685
;684:			}
;685:			else if ( chainAngle == 180 )
ADDRLP4 8
INDIRI4
CNSTI4 180
NEI4 $314
line 686
;686:			{//continues the momentum perfectly, allow it to chain 66% of the time
line 687
;687:				if ( pm->ps->saberAttackChainCount > 1 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1308
ADDP4
INDIRI4
CNSTI4 1
LEI4 $301
line 688
;688:				{
line 689
;689:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $299
JUMPV
line 691
;690:				}
;691:			}
LABELV $314
line 693
;692:			else
;693:			{//would continue the movement somewhat, 50% chance of continuing
line 694
;694:				if ( pm->ps->saberAttackChainCount > 2 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1308
ADDP4
INDIRI4
CNSTI4 2
LEI4 $301
line 695
;695:				{
line 696
;696:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $299
JUMPV
line 698
;697:				}
;698:			}
line 699
;699:		}
line 700
;700:	}
LABELV $300
line 702
;701:	else 
;702:	{//Perhaps have chainAngle influence fast and medium chains as well? For now, just do level 3.
line 703
;703:		if (newmove == LS_A_TL2BR ||
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
EQI4 $326
ADDRLP4 0
INDIRI4
CNSTI4 5
EQI4 $326
ADDRLP4 0
INDIRI4
CNSTI4 6
EQI4 $326
ADDRLP4 0
INDIRI4
CNSTI4 7
EQI4 $326
ADDRLP4 0
INDIRI4
CNSTI4 8
EQI4 $326
ADDRLP4 0
INDIRI4
CNSTI4 9
NEI4 $320
LABELV $326
line 709
;704:			newmove == LS_A_L2R ||
;705:			newmove == LS_A_BL2TR ||
;706:			newmove == LS_A_BR2TL ||
;707:			newmove == LS_A_R2L ||
;708:			newmove == LS_A_TR2BL )
;709:		{ //lower chaining tolerance for spinning saber anims
line 712
;710:			int chainTolerance;
;711:
;712:			if (pm->ps->fd.saberAnimLevel == FORCE_LEVEL_1)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 1
NEI4 $327
line 713
;713:			{
line 714
;714:				chainTolerance = 5;
ADDRLP4 4
CNSTI4 5
ASGNI4
line 715
;715:			}
ADDRGP4 $328
JUMPV
LABELV $327
line 717
;716:			else
;717:			{
line 718
;718:				chainTolerance = 3;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 719
;719:			}
LABELV $328
line 721
;720:
;721:			if (pm->ps->saberAttackChainCount >= chainTolerance && PM_irand_timesync(1, pm->ps->saberAttackChainCount) > chainTolerance)
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1308
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $329
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $329
line 722
;722:			{
line 723
;723:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $299
JUMPV
LABELV $329
line 725
;724:			}
;725:		}
LABELV $320
line 726
;726:		if ( pm->ps->fd.saberAnimLevel == FORCE_LEVEL_2 && pm->ps->saberAttackChainCount > PM_irand_timesync( 2, 5 ) )
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 2
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $331
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 12
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 1308
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $331
line 727
;727:		{
line 728
;728:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $299
JUMPV
LABELV $331
line 730
;729:		}
;730:	}
LABELV $301
line 731
;731:	return qfalse;
CNSTI4 0
RETI4
LABELV $299
endproc PM_SaberKataDone 20 8
export PM_SetAnimFrame
proc PM_SetAnimFrame 0 0
line 735
;732:}
;733:
;734:void PM_SetAnimFrame( playerState_t *gent, int frame, qboolean torso, qboolean legs )
;735:{
line 736
;736:	gent->saberLockFrame = frame;
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 737
;737:}
LABELV $333
endproc PM_SetAnimFrame 0 0
export PM_SaberLockBreak
proc PM_SaberLockBreak 88 16
line 740
;738:
;739:void PM_SaberLockBreak( playerState_t *genemy, qboolean victory )
;740:{
line 741
;741:	int	winAnim = BOTH_STAND1, loseAnim = BOTH_STAND1;
ADDRLP4 0
CNSTI4 571
ASGNI4
ADDRLP4 8
CNSTI4 571
ASGNI4
line 742
;742:	qboolean punishLoser = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 744
;743:
;744:	switch ( (pm->ps->torsoAnim&~ANIM_TOGGLEBIT) )
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 20
CNSTI4 550
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $338
ADDRLP4 12
INDIRI4
CNSTI4 553
EQI4 $341
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $335
LABELV $350
ADDRLP4 12
INDIRI4
CNSTI4 560
EQI4 $344
ADDRLP4 12
INDIRI4
CNSTI4 561
EQI4 $347
ADDRGP4 $335
JUMPV
line 745
;745:	{
LABELV $338
line 747
;746:	case BOTH_BF2LOCK:
;747:		pm->ps->saberMove = LS_A_T2B;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 10
ASGNI4
line 748
;748:		winAnim = BOTH_A3_T__B_;
ADDRLP4 0
CNSTI4 292
ASGNI4
line 749
;749:		if ( !victory )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $339
line 750
;750:		{//no-one won
line 751
;751:			genemy->saberMove = LS_A_T2B;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 10
ASGNI4
line 752
;752:			loseAnim = winAnim;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 753
;753:		}
ADDRGP4 $336
JUMPV
LABELV $339
line 755
;754:		else
;755:		{
line 756
;756:			punishLoser = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 757
;757:		}
line 758
;758:		break;
ADDRGP4 $336
JUMPV
LABELV $341
line 760
;759:	case BOTH_BF1LOCK:
;760:		pm->ps->saberMove = LS_K1_T_;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 103
ASGNI4
line 761
;761:		winAnim = BOTH_K1_S1_T_;
ADDRLP4 0
CNSTI4 528
ASGNI4
line 762
;762:		if ( !victory )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $342
line 763
;763:		{//no-one won
line 764
;764:			genemy->saberMove = LS_K1_T_;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 103
ASGNI4
line 765
;765:			loseAnim = winAnim;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 766
;766:		}
ADDRGP4 $336
JUMPV
LABELV $342
line 768
;767:		else
;768:		{
line 769
;769:			punishLoser = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 770
;770:		}
line 771
;771:		break;
ADDRGP4 $336
JUMPV
LABELV $344
line 773
;772:	case BOTH_CWCIRCLELOCK:
;773:		winAnim = BOTH_CWCIRCLEBREAK;
ADDRLP4 0
CNSTI4 558
ASGNI4
line 774
;774:		if ( !victory )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $345
line 775
;775:		{//no-one won
line 776
;776:			loseAnim = winAnim;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 777
;777:		}
ADDRGP4 $336
JUMPV
LABELV $345
line 779
;778:		else
;779:		{
line 780
;780:			genemy->saberMove = LS_H1_BL;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 102
ASGNI4
line 781
;781:			genemy->saberBlocked = BLOCKED_PARRY_BROKEN;
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 2
ASGNI4
line 782
;782:			punishLoser = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 783
;783:		}
line 784
;784:		break;
ADDRGP4 $336
JUMPV
LABELV $347
line 786
;785:	case BOTH_CCWCIRCLELOCK:
;786:		winAnim = BOTH_CCWCIRCLEBREAK;
ADDRLP4 0
CNSTI4 559
ASGNI4
line 787
;787:		if ( !victory )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $348
line 788
;788:		{//no-one won
line 789
;789:			loseAnim = winAnim;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 790
;790:		}
ADDRGP4 $336
JUMPV
LABELV $348
line 792
;791:		else
;792:		{
line 793
;793:			genemy->saberMove = LS_H1_BR;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 100
ASGNI4
line 794
;794:			genemy->saberBlocked = BLOCKED_PARRY_BROKEN;
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 2
ASGNI4
line 795
;795:			punishLoser = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 796
;796:		}
line 797
;797:		break;
LABELV $335
LABELV $336
line 799
;798:	}
;799:	PM_SetAnim( SETANIM_BOTH, winAnim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, -1 );
ADDRLP4 28
CNSTI4 3
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 801
;800:
;801:	if (punishLoser)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $351
line 802
;802:	{ //someone lost the lock, so punish them by knocking them down
line 805
;803:		vec3_t oppDir;
;804:
;805:		int strength = 8;
ADDRLP4 44
CNSTI4 8
ASGNI4
line 807
;806:
;807:		VectorSubtract(genemy->origin, pm->ps->origin, oppDir);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
CNSTI4 20
ASGNI4
ADDRLP4 56
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 48
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 60
CNSTI4 24
ASGNI4
ADDRLP4 32+4
ADDRLP4 48
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64
CNSTI4 28
ASGNI4
ADDRLP4 32+8
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 808
;808:		VectorNormalize(oppDir);
ADDRLP4 32
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 810
;809:
;810:		genemy->forceHandExtend = HANDEXTEND_KNOCKDOWN;
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 8
ASGNI4
line 811
;811:		genemy->forceHandExtendTime = pm->cmd.serverTime + 1100;
ADDRFP4 0
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1100
ADDI4
ASGNI4
line 812
;812:		genemy->forceDodgeAnim = 0; //this toggles between 1 and 0, when it's 1 we should play the get up anim
ADDRFP4 0
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 0
ASGNI4
line 814
;813:
;814:		genemy->otherKiller = pm->ps->clientNum;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 815
;815:		genemy->otherKillerTime = pm->cmd.serverTime + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 816
;816:		genemy->otherKillerDebounceTime = pm->cmd.serverTime + 100;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 818
;817:
;818:		genemy->velocity[0] = oppDir[0]*(strength*40);
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 32
INDIRF4
CNSTI4 40
ADDRLP4 44
INDIRI4
MULI4
CVIF4 4
MULF4
ASGNF4
line 819
;819:		genemy->velocity[1] = oppDir[1]*(strength*40);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 32+4
INDIRF4
CNSTI4 40
ADDRLP4 44
INDIRI4
MULI4
CVIF4 4
MULF4
ASGNF4
line 820
;820:		genemy->velocity[2] = 100;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1120403456
ASGNF4
line 822
;821:
;822:		pm->checkDuelLoss = genemy->clientNum+1;
ADDRGP4 pm
INDIRP4
CNSTI4 376
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 823
;823:	}
ADDRGP4 $352
JUMPV
LABELV $351
line 825
;824:	else
;825:	{ //If no one lost, then shove each player away from the other
line 828
;826:		vec3_t oppDir;
;827:
;828:		int strength = 4;
ADDRLP4 44
CNSTI4 4
ASGNI4
line 830
;829:
;830:		VectorSubtract(genemy->origin, pm->ps->origin, oppDir);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
CNSTI4 20
ASGNI4
ADDRLP4 56
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 48
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 60
CNSTI4 24
ASGNI4
ADDRLP4 32+4
ADDRLP4 48
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64
CNSTI4 28
ASGNI4
ADDRLP4 32+8
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 831
;831:		VectorNormalize(oppDir);
ADDRLP4 32
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 832
;832:		genemy->velocity[0] = oppDir[0]*(strength*40);
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 32
INDIRF4
CNSTI4 40
ADDRLP4 44
INDIRI4
MULI4
CVIF4 4
MULF4
ASGNF4
line 833
;833:		genemy->velocity[1] = oppDir[1]*(strength*40);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 32+4
INDIRF4
CNSTI4 40
ADDRLP4 44
INDIRI4
MULI4
CVIF4 4
MULF4
ASGNF4
line 834
;834:		genemy->velocity[2] = 150;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1125515264
ASGNF4
line 836
;835:
;836:		VectorSubtract(pm->ps->origin, genemy->origin, oppDir);
ADDRLP4 68
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 72
CNSTI4 20
ASGNI4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 68
INDIRP4
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 80
CNSTI4 24
ASGNI4
ADDRLP4 32+4
ADDRLP4 68
INDIRP4
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 84
CNSTI4 28
ASGNI4
ADDRLP4 32+8
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 837
;837:		VectorNormalize(oppDir);
ADDRLP4 32
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 838
;838:		pm->ps->velocity[0] = oppDir[0]*(strength*40);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 32
INDIRF4
CNSTI4 40
ADDRLP4 44
INDIRI4
MULI4
CVIF4 4
MULF4
ASGNF4
line 839
;839:		pm->ps->velocity[1] = oppDir[1]*(strength*40);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 32+4
INDIRF4
CNSTI4 40
ADDRLP4 44
INDIRI4
MULI4
CVIF4 4
MULF4
ASGNF4
line 840
;840:		pm->ps->velocity[2] = 150;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1125515264
ASGNF4
line 842
;841:
;842:		genemy->forceHandExtend = HANDEXTEND_WEAPONREADY;
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 6
ASGNI4
line 843
;843:	}
LABELV $352
line 845
;844:
;845:	pm->ps->weaponTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 846
;846:	genemy->weaponTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 848
;847:
;848:	pm->ps->saberLockTime = genemy->saberLockTime = 0;
ADDRLP4 32
CNSTI4 524
ASGNI4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 849
;849:	pm->ps->saberLockFrame = genemy->saberLockFrame = 0;
ADDRLP4 40
CNSTI4 532
ASGNI4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 850
;850:	pm->ps->saberLockEnemy = genemy->saberLockEnemy = 0;
ADDRLP4 48
CNSTI4 528
ASGNI4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 852
;851:
;852:	pm->ps->forceHandExtend = HANDEXTEND_WEAPONREADY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 6
ASGNI4
line 854
;853:
;854:	PM_AddEvent( EV_JUMP );
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 855
;855:	if ( !victory )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $362
line 856
;856:	{//no-one won
line 857
;857:		BG_AddPredictableEventToPlayerstate(EV_JUMP, 0, genemy);
CNSTI4 14
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 858
;858:	}
ADDRGP4 $363
JUMPV
LABELV $362
line 860
;859:	else
;860:	{
line 861
;861:		if ( PM_irand_timesync( 0, 1 ) )
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 56
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $364
line 862
;862:		{
line 863
;863:			BG_AddPredictableEventToPlayerstate(EV_JUMP, PM_irand_timesync( 0, 75 ), genemy);
CNSTI4 0
ARGI4
CNSTI4 75
ARGI4
ADDRLP4 60
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
CNSTI4 14
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 864
;864:		}
LABELV $364
line 865
;865:	}
LABELV $363
line 866
;866:}
LABELV $334
endproc PM_SaberLockBreak 88 16
export PM_SaberLocked
proc PM_SaberLocked 88 16
line 870
;867:
;868:extern qboolean ValidAnimFileIndex ( int index );
;869:void PM_SaberLocked( void )
;870:{
line 871
;871:	int	remaining = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 873
;872:
;873:	playerState_t *genemy = pm->bgClients[pm->ps->saberLockEnemy];
ADDRLP4 8
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRP4
ASGNP4
line 874
;874:	if ( !genemy )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $367
line 875
;875:	{
line 876
;876:		return;
ADDRGP4 $366
JUMPV
LABELV $367
line 878
;877:	}
;878:	if ( ( (pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_BF2LOCK ||
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 550
EQI4 $373
ADDRLP4 12
INDIRI4
CNSTI4 553
EQI4 $373
ADDRLP4 12
INDIRI4
CNSTI4 560
EQI4 $373
ADDRLP4 12
INDIRI4
CNSTI4 561
NEI4 $369
LABELV $373
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 550
EQI4 $376
ADDRLP4 16
INDIRI4
CNSTI4 553
EQI4 $376
ADDRLP4 16
INDIRI4
CNSTI4 560
EQI4 $376
ADDRLP4 16
INDIRI4
CNSTI4 561
NEI4 $369
LABELV $376
line 887
;879:			(pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_BF1LOCK ||
;880:			(pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_CWCIRCLELOCK ||
;881:			(pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_CCWCIRCLELOCK )
;882:		&& ( (genemy->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_BF2LOCK ||
;883:			(genemy->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_BF1LOCK ||
;884:			(genemy->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_CWCIRCLELOCK ||
;885:			(genemy->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_CCWCIRCLELOCK )
;886:		)
;887:	{
line 888
;888:		float dist = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
line 890
;889:
;890:		pm->ps->torsoTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 0
ASGNI4
line 891
;891:		pm->ps->weaponTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 892
;892:		genemy->torsoTimer = 0;
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 0
ASGNI4
line 893
;893:		genemy->weaponTime = 0;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 895
;894:
;895:		dist = DistanceSquared(pm->ps->origin,genemy->origin);
ADDRLP4 24
CNSTI4 20
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 DistanceSquared
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 28
INDIRF4
ASGNF4
line 896
;896:		if ( dist < 64 || dist > 6400 )
ADDRLP4 32
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 1115684864
LTF4 $379
ADDRLP4 32
INDIRF4
CNSTF4 1170735104
LEF4 $377
LABELV $379
line 897
;897:		{//between 8 and 80 from each other
line 898
;898:			PM_SaberLockBreak( genemy, qfalse );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 PM_SaberLockBreak
CALLV
pop
line 899
;899:			return;
ADDRGP4 $366
JUMPV
LABELV $377
line 901
;900:		}
;901:		if ( (pm->cmd.buttons & BUTTON_ATTACK) || pm->ps->saberLockAdvance )
ADDRLP4 36
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 40
INDIRI4
NEI4 $382
ADDRLP4 36
INDIRP4
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $370
LABELV $382
line 902
;902:		{//holding attack
line 905
;903:			animation_t *anim;
;904:
;905:			if (pm->ps->saberLockAdvance)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
CNSTI4 0
EQI4 $366
line 906
;906:			{//tapping
line 910
;907:				animation_t *anim;
;908:				float		currentFrame;
;909:				int			curFrame;
;910:				int			strength = 1;
ADDRLP4 48
CNSTI4 1
ASGNI4
line 912
;911:
;912:				pm->ps->saberLockAdvance = qfalse;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 0
ASGNI4
line 914
;913:
;914:				anim = &pm->animations[pm->ps->torsoAnim&~ANIM_TOGGLEBIT];
ADDRLP4 64
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 52
CNSTI4 28
ADDRLP4 64
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ADDRLP4 64
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
ADDP4
ASGNP4
line 916
;915:	
;916:				currentFrame = pm->ps->saberLockFrame;
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 918
;917:
;918:				strength = pm->ps->fd.forcePowerLevel[FP_SABERATTACK]+1;
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 920
;919:
;920:				if ( (pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_CCWCIRCLELOCK ||
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 561
EQI4 $387
ADDRLP4 68
INDIRI4
CNSTI4 550
NEI4 $385
LABELV $387
line 922
;921:					(pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_BF2LOCK )
;922:				{
line 923
;923:					curFrame = floor( currentFrame )-strength;
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 floor
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 72
INDIRF4
ADDRLP4 48
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
line 925
;924:					//drop my frame one
;925:					if ( curFrame <= anim->firstFrame )
ADDRLP4 56
INDIRI4
ADDRLP4 52
INDIRP4
INDIRI4
GTI4 $388
line 926
;926:					{//I won!  Break out
line 927
;927:						PM_SaberLockBreak( genemy, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 PM_SaberLockBreak
CALLV
pop
line 928
;928:						return;
ADDRGP4 $366
JUMPV
LABELV $388
line 931
;929:					}
;930:					else
;931:					{
line 932
;932:						PM_SetAnimFrame( pm->ps, curFrame, qtrue, qtrue );
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 76
CNSTI4 1
ASGNI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 PM_SetAnimFrame
CALLV
pop
line 933
;933:						remaining = curFrame-anim->firstFrame;
ADDRLP4 4
ADDRLP4 56
INDIRI4
ADDRLP4 52
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 934
;934:					}
line 935
;935:				}
ADDRGP4 $386
JUMPV
LABELV $385
line 937
;936:				else
;937:				{
line 938
;938:					curFrame = ceil( currentFrame )+strength;
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 ceil
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 72
INDIRF4
ADDRLP4 48
INDIRI4
CVIF4 4
ADDF4
CVFI4 4
ASGNI4
line 940
;939:					//advance my frame one
;940:					if ( curFrame >= anim->firstFrame+anim->numFrames )
ADDRLP4 76
ADDRLP4 52
INDIRP4
ASGNP4
ADDRLP4 56
INDIRI4
ADDRLP4 76
INDIRP4
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
LTI4 $390
line 941
;941:					{//I won!  Break out
line 942
;942:						PM_SaberLockBreak( genemy, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 PM_SaberLockBreak
CALLV
pop
line 943
;943:						return;
ADDRGP4 $366
JUMPV
LABELV $390
line 946
;944:					}
;945:					else
;946:					{
line 947
;947:						PM_SetAnimFrame( pm->ps, curFrame, qtrue, qtrue );
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 80
CNSTI4 1
ASGNI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 PM_SetAnimFrame
CALLV
pop
line 948
;948:						remaining = anim->firstFrame+anim->numFrames-curFrame;
ADDRLP4 84
ADDRLP4 52
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 84
INDIRP4
INDIRI4
ADDRLP4 84
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ADDRLP4 56
INDIRI4
SUBI4
ASGNI4
line 949
;949:					}
line 950
;950:				}
LABELV $386
line 951
;951:				if ( !PM_irand_timesync( 0, 2 ) )
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 72
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $384
line 952
;952:				{
line 953
;953:					PM_AddEvent( EV_JUMP );
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 954
;954:				}
line 955
;955:			}
line 957
;956:			else
;957:			{
line 958
;958:				return;
LABELV $384
line 961
;959:			}
;960:
;961:			anim = &pm->animations[(genemy->torsoAnim&~ANIM_TOGGLEBIT)];
ADDRLP4 44
CNSTI4 28
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ADDRGP4 pm
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
ADDP4
ASGNP4
line 963
;962:
;963:			if ( (genemy->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_CWCIRCLELOCK ||
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 560
EQI4 $396
ADDRLP4 48
INDIRI4
CNSTI4 553
NEI4 $394
LABELV $396
line 965
;964:				(genemy->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_BF1LOCK )
;965:			{
line 966
;966:				if ( !PM_irand_timesync( 0, 2 ) )
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 52
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $397
line 967
;967:				{
line 968
;968:					BG_AddPredictableEventToPlayerstate(EV_PAIN, floor((float)80/100*100.0f), genemy);
CNSTF4 1117782016
ARGF4
ADDRLP4 56
ADDRGP4 floor
CALLF4
ASGNF4
CNSTI4 77
ARGI4
ADDRLP4 56
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 969
;969:				}
LABELV $397
line 970
;970:				PM_SetAnimFrame( genemy, anim->firstFrame+remaining, qtrue, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ARGI4
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 PM_SetAnimFrame
CALLV
pop
line 971
;971:			}
ADDRGP4 $370
JUMPV
LABELV $394
line 973
;972:			else
;973:			{
line 974
;974:				PM_SetAnimFrame( genemy, anim->firstFrame+anim->numFrames-remaining, qtrue, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRLP4 44
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ADDRLP4 4
INDIRI4
SUBI4
ARGI4
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 PM_SetAnimFrame
CALLV
pop
line 975
;975:			}
line 976
;976:		}
line 977
;977:	}
ADDRGP4 $370
JUMPV
LABELV $369
line 979
;978:	else
;979:	{//something broke us out of it
line 980
;980:		PM_SaberLockBreak( genemy, qfalse );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 PM_SaberLockBreak
CALLV
pop
line 981
;981:	}
LABELV $370
line 982
;982:}
LABELV $366
endproc PM_SaberLocked 88 16
export PM_SaberInBrokenParry
proc PM_SaberInBrokenParry 8 0
line 985
;983:
;984:qboolean PM_SaberInBrokenParry( int move )
;985:{
line 986
;986:	if ( move >= LS_V1_BR && move <= LS_V1_B_ )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 89
LTI4 $400
ADDRLP4 0
INDIRI4
CNSTI4 96
GTI4 $400
line 987
;987:	{
line 988
;988:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $399
JUMPV
LABELV $400
line 990
;989:	}
;990:	if ( move >= LS_H1_T_ && move <= LS_H1_BL )
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 97
LTI4 $402
ADDRLP4 4
INDIRI4
CNSTI4 102
GTI4 $402
line 991
;991:	{
line 992
;992:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $399
JUMPV
LABELV $402
line 994
;993:	}
;994:	return qfalse;
CNSTI4 0
RETI4
LABELV $399
endproc PM_SaberInBrokenParry 8 0
export PM_BrokenParryForParry
proc PM_BrokenParryForParry 12 0
line 999
;995:}
;996:
;997:
;998:int PM_BrokenParryForParry( int move )
;999:{
line 1000
;1000:	switch ( move )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $412
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $405
LABELV $413
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 108
LTI4 $405
ADDRLP4 8
INDIRI4
CNSTI4 112
GTI4 $405
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $414-432
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $414
address $407
address $408
address $409
address $410
address $411
code
line 1001
;1001:	{
LABELV $407
line 1003
;1002:	case LS_PARRY_UP:
;1003:		return LS_H1_T_;
CNSTI4 97
RETI4
ADDRGP4 $404
JUMPV
line 1004
;1004:		break;
LABELV $408
line 1006
;1005:	case LS_PARRY_UR:
;1006:		return LS_H1_TR;
CNSTI4 98
RETI4
ADDRGP4 $404
JUMPV
line 1007
;1007:		break;
LABELV $409
line 1009
;1008:	case LS_PARRY_UL:
;1009:		return LS_H1_TL;
CNSTI4 99
RETI4
ADDRGP4 $404
JUMPV
line 1010
;1010:		break;
LABELV $410
line 1012
;1011:	case LS_PARRY_LR:
;1012:		return LS_H1_BL;
CNSTI4 102
RETI4
ADDRGP4 $404
JUMPV
line 1013
;1013:		break;
LABELV $411
line 1015
;1014:	case LS_PARRY_LL:
;1015:		return LS_H1_BR;
CNSTI4 100
RETI4
ADDRGP4 $404
JUMPV
line 1016
;1016:		break;
LABELV $412
line 1018
;1017:	case LS_READY:
;1018:		return LS_H1_B_;
CNSTI4 101
RETI4
ADDRGP4 $404
JUMPV
line 1019
;1019:		break;
LABELV $405
line 1021
;1020:	}
;1021:	return LS_NONE;
CNSTI4 0
RETI4
LABELV $404
endproc PM_BrokenParryForParry 12 0
lit
align 4
LABELV $417
byte 4 3245342720
byte 4 3245342720
byte 4 3238002688
align 4
LABELV $418
byte 4 1097859072
byte 4 1097859072
byte 4 1090519040
export PM_CanBackstab
code
proc PM_CanBackstab 1152 28
line 1027
;1022:}
;1023:
;1024:#define BACK_STAB_DISTANCE 128
;1025:
;1026:qboolean PM_CanBackstab(void)
;1027:{
line 1031
;1028:	trace_t tr;
;1029:	vec3_t flatAng;
;1030:	vec3_t fwd, back;
;1031:	vec3_t trmins = {-15, -15, -8};
ADDRLP4 1116
ADDRGP4 $417
INDIRB
ASGNB 12
line 1032
;1032:	vec3_t trmaxs = {15, 15, 8};
ADDRLP4 1128
ADDRGP4 $418
INDIRB
ASGNB 12
line 1034
;1033:
;1034:	VectorCopy(pm->ps->viewangles, flatAng);
ADDRLP4 1104
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 1035
;1035:	flatAng[PITCH] = 0;
ADDRLP4 1104
CNSTF4 0
ASGNF4
line 1037
;1036:
;1037:	AngleVectors(flatAng, fwd, 0, 0);
ADDRLP4 1104
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1140
CNSTP4 0
ASGNP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1039
;1038:
;1039:	back[0] = pm->ps->origin[0] - fwd[0]*BACK_STAB_DISTANCE;
ADDRLP4 1092
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 1124073472
ADDRLP4 1080
INDIRF4
MULF4
SUBF4
ASGNF4
line 1040
;1040:	back[1] = pm->ps->origin[1] - fwd[1]*BACK_STAB_DISTANCE;
ADDRLP4 1092+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 1124073472
ADDRLP4 1080+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 1041
;1041:	back[2] = pm->ps->origin[2] - fwd[2]*BACK_STAB_DISTANCE;
ADDRLP4 1092+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1124073472
ADDRLP4 1080+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 1043
;1042:
;1043:	pm->trace(&tr, pm->ps->origin, trmins, trmaxs, back, pm->ps->clientNum, MASK_PLAYERSOLID);
ADDRLP4 0
ARGP4
ADDRLP4 1144
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1148
ADDRLP4 1144
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1148
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1128
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1148
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRLP4 1144
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
CALLV
pop
line 1045
;1044:
;1045:	if (tr.fraction != 1.0 && tr.entityNum >= 0 && tr.entityNum < MAX_CLIENTS)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $423
ADDRLP4 0+52
INDIRI4
CNSTI4 0
LTI4 $423
ADDRLP4 0+52
INDIRI4
CNSTI4 32
GEI4 $423
line 1046
;1046:	{ //We don't have real entity access here so we can't do an indepth check. But if it's a client and it's behind us, I guess that's reason enough to stab backward
line 1047
;1047:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $416
JUMPV
LABELV $423
line 1050
;1048:	}
;1049:
;1050:	return qfalse;
CNSTI4 0
RETI4
LABELV $416
endproc PM_CanBackstab 1152 28
export PM_SaberFlipOverAttackMove
proc PM_SaberFlipOverAttackMove 48 16
line 1054
;1051:}
;1052:
;1053:saberMoveName_t PM_SaberFlipOverAttackMove(trace_t *tr)
;1054:{
line 1056
;1055:	vec3_t fwdAngles, jumpFwd;
;1056:	float zDiff = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 1059
;1057:	playerState_t *psData;
;1058:
;1059:	VectorCopy( pm->ps->viewangles, fwdAngles );
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 1060
;1060:	fwdAngles[PITCH] = fwdAngles[ROLL] = 0;
ADDRLP4 32
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 32
INDIRF4
ASGNF4
line 1061
;1061:	AngleVectors( fwdAngles, jumpFwd, NULL, NULL );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
CNSTP4 0
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1062
;1062:	VectorScale( jumpFwd, 50, pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1112014848
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1112014848
ADDRLP4 12+4
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1112014848
ADDRLP4 12+8
INDIRF4
MULF4
ASGNF4
line 1063
;1063:	pm->ps->velocity[2] = 400;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1137180672
ASGNF4
line 1065
;1064:
;1065:	psData = pm->bgClients[tr->entityNum];
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRP4
ASGNP4
line 1068
;1066:
;1067:	//go higher for enemies higher than you, lower for those lower than you
;1068:	if (psData)
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $432
line 1069
;1069:	{
line 1070
;1070:		zDiff = psData->origin[2] - pm->ps->origin[2];
ADDRLP4 40
CNSTI4 28
ASGNI4
ADDRLP4 24
ADDRLP4 28
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1071
;1071:	}
ADDRGP4 $433
JUMPV
LABELV $432
line 1073
;1072:	else
;1073:	{
line 1074
;1074:		zDiff = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 1075
;1075:	}
LABELV $433
line 1076
;1076:	pm->ps->velocity[2] += (zDiff)*1.5f;
ADDRLP4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
CNSTF4 1069547520
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 1079
;1077:
;1078:	//clamp to decent-looking values
;1079:	if ( zDiff <= 0 && pm->ps->velocity[2] < 200 )
ADDRLP4 24
INDIRF4
CNSTF4 0
GTF4 $434
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1128792064
GEF4 $434
line 1080
;1080:	{//if we're on same level, don't let me jump so low, I clip into the ground
line 1081
;1081:		pm->ps->velocity[2] = 200;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1128792064
ASGNF4
line 1082
;1082:	}
ADDRGP4 $435
JUMPV
LABELV $434
line 1083
;1083:	else if ( pm->ps->velocity[2] < 100 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1120403456
GEF4 $436
line 1084
;1084:	{
line 1085
;1085:		pm->ps->velocity[2] = 100;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1120403456
ASGNF4
line 1086
;1086:	}
ADDRGP4 $437
JUMPV
LABELV $436
line 1087
;1087:	else if ( pm->ps->velocity[2] > 400 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1137180672
LEF4 $438
line 1088
;1088:	{
line 1089
;1089:		pm->ps->velocity[2] = 400;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1137180672
ASGNF4
line 1090
;1090:	}
LABELV $438
LABELV $437
LABELV $435
line 1092
;1091:
;1092:	PM_SetForceJumpZStart(pm->ps->origin[2]);//so we don't take damage if we land at same height
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRGP4 PM_SetForceJumpZStart
CALLV
pop
line 1094
;1093:
;1094:	PM_AddEvent( EV_JUMP );
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1095
;1095:	pm->ps->fd.forceJumpSound = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1100
ADDP4
CNSTI4 1
ASGNI4
line 1096
;1096:	pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 1098
;1097:
;1098:	if ( PM_irand_timesync( 0, 1 ) )
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 44
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $440
line 1099
;1099:	{
line 1100
;1100:		return LS_A_FLIP_STAB;
CNSTI4 16
RETI4
ADDRGP4 $428
JUMPV
LABELV $440
line 1103
;1101:	}
;1102:	else
;1103:	{
line 1104
;1104:		return LS_A_FLIP_SLASH;
CNSTI4 17
RETI4
LABELV $428
endproc PM_SaberFlipOverAttackMove 48 16
lit
align 4
LABELV $443
byte 4 3245342720
byte 4 3245342720
byte 4 3238002688
align 4
LABELV $444
byte 4 1097859072
byte 4 1097859072
byte 4 1090519040
export PM_SomeoneInFront
code
proc PM_SomeoneInFront 80 28
line 1111
;1105:	}
;1106:}
;1107:
;1108:#define FLIPHACK_DISTANCE 200
;1109:
;1110:qboolean PM_SomeoneInFront(trace_t *tr)
;1111:{ //Also a very simplified version of the sp counterpart
line 1114
;1112:	vec3_t flatAng;
;1113:	vec3_t fwd, back;
;1114:	vec3_t trmins = {-15, -15, -8};
ADDRLP4 36
ADDRGP4 $443
INDIRB
ASGNB 12
line 1115
;1115:	vec3_t trmaxs = {15, 15, 8};
ADDRLP4 48
ADDRGP4 $444
INDIRB
ASGNB 12
line 1117
;1116:
;1117:	VectorCopy(pm->ps->viewangles, flatAng);
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 1118
;1118:	flatAng[PITCH] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 1120
;1119:
;1120:	AngleVectors(flatAng, fwd, 0, 0);
ADDRLP4 24
ARGP4
ADDRLP4 0
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
line 1122
;1121:
;1122:	back[0] = pm->ps->origin[0] + fwd[0]*FLIPHACK_DISTANCE;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 1128792064
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 1123
;1123:	back[1] = pm->ps->origin[1] + fwd[1]*FLIPHACK_DISTANCE;
ADDRLP4 12+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 1128792064
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1124
;1124:	back[2] = pm->ps->origin[2] + fwd[2]*FLIPHACK_DISTANCE;
ADDRLP4 12+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1128792064
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1126
;1125:
;1126:	pm->trace(tr, pm->ps->origin, trmins, trmaxs, back, pm->ps->clientNum, MASK_PLAYERSOLID);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 64
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRLP4 64
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
CALLV
pop
line 1128
;1127:
;1128:	if (tr->fraction != 1.0 && tr->entityNum >= 0 && tr->entityNum < MAX_CLIENTS)
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1065353216
EQF4 $449
ADDRLP4 76
ADDRLP4 72
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
LTI4 $449
ADDRLP4 76
INDIRI4
CNSTI4 32
GEI4 $449
line 1129
;1129:	{
line 1130
;1130:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $442
JUMPV
LABELV $449
line 1133
;1131:	}
;1132:
;1133:	return qfalse;
CNSTI4 0
RETI4
LABELV $442
endproc PM_SomeoneInFront 80 28
export PM_SaberLungeAttackMove
proc PM_SaberLungeAttackMove 32 16
line 1137
;1134:}
;1135:
;1136:saberMoveName_t PM_SaberLungeAttackMove( void )
;1137:{
line 1140
;1138:	vec3_t fwdAngles, jumpFwd;
;1139:
;1140:	VectorCopy( pm->ps->viewangles, fwdAngles );
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 1141
;1141:	fwdAngles[PITCH] = fwdAngles[ROLL] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 24
INDIRF4
ASGNF4
line 1143
;1142:	//do the lunge
;1143:	AngleVectors( fwdAngles, jumpFwd, NULL, NULL );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 28
CNSTP4 0
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1144
;1144:	VectorScale( jumpFwd, 150, pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1125515264
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1125515264
ADDRLP4 12+4
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1125515264
ADDRLP4 12+8
INDIRF4
MULF4
ASGNF4
line 1145
;1145:	PM_AddEvent( EV_JUMP );
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1147
;1146:
;1147:	return LS_A_LUNGE;
CNSTI4 14
RETI4
LABELV $451
endproc PM_SaberLungeAttackMove 32 16
export PM_SaberJumpAttackMove
proc PM_SaberJumpAttackMove 32 16
line 1151
;1148:}
;1149:
;1150:saberMoveName_t PM_SaberJumpAttackMove( void )
;1151:{
line 1154
;1152:	vec3_t fwdAngles, jumpFwd;
;1153:
;1154:	VectorCopy( pm->ps->viewangles, fwdAngles );
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 1155
;1155:	fwdAngles[PITCH] = fwdAngles[ROLL] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 24
INDIRF4
ASGNF4
line 1156
;1156:	AngleVectors( fwdAngles, jumpFwd, NULL, NULL );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 28
CNSTP4 0
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1157
;1157:	VectorScale( jumpFwd, 300, pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1133903872
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1133903872
ADDRLP4 12+4
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1133903872
ADDRLP4 12+8
INDIRF4
MULF4
ASGNF4
line 1158
;1158:	pm->ps->velocity[2] = 280;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1133248512
ASGNF4
line 1159
;1159:	PM_SetForceJumpZStart(pm->ps->origin[2]);//so we don't take damage if we land at same height
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRGP4 PM_SetForceJumpZStart
CALLV
pop
line 1161
;1160:
;1161:	PM_AddEvent( EV_JUMP );
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1162
;1162:	pm->ps->fd.forceJumpSound = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1100
ADDP4
CNSTI4 1
ASGNI4
line 1163
;1163:	pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 1165
;1164:
;1165:	return LS_A_JUMP_T__B_;
CNSTI4 15
RETI4
LABELV $455
endproc PM_SaberJumpAttackMove 32 16
export PM_GroundDistance
proc PM_GroundDistance 1108 28
line 1169
;1166:}
;1167:
;1168:float PM_GroundDistance(void)
;1169:{
line 1173
;1170:	trace_t tr;
;1171:	vec3_t down;
;1172:
;1173:	VectorCopy(pm->ps->origin, down);
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1175
;1174:
;1175:	down[2] -= 4096;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 1177
;1176:
;1177:	pm->trace(&tr, pm->ps->origin, pm->mins, pm->maxs, down, pm->ps->clientNum, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRLP4 1092
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1096
ADDRLP4 1092
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1092
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 1092
INDIRP4
CNSTI4 200
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 1092
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
CALLV
pop
line 1179
;1178:
;1179:	VectorSubtract(pm->ps->origin, tr.endpos, down);
ADDRLP4 1100
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1100
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 12+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 1100
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 12+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 12+12+8
INDIRF4
SUBF4
ASGNF4
line 1181
;1180:
;1181:	return VectorLength(down);
ADDRLP4 0
ARGP4
ADDRLP4 1104
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1104
INDIRF4
RETF4
LABELV $459
endproc PM_GroundDistance 1108 28
export PM_SaberAttackForMovement
proc PM_SaberAttackForMovement 1108 8
line 1185
;1182:}
;1183:
;1184:saberMoveName_t PM_SaberAttackForMovement(saberMoveName_t curmove)
;1185:{
line 1186
;1186:	saberMoveName_t newmove = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 1188
;1187:
;1188:	if ( pm->cmd.rightmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $469
line 1189
;1189:	{//moving right
line 1190
;1190:		if ( pm->cmd.forwardmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $471
line 1191
;1191:		{//forward right = TL2BR slash
line 1192
;1192:			newmove = LS_A_TL2BR;
ADDRLP4 0
CNSTI4 4
ASGNI4
line 1193
;1193:		}
ADDRGP4 $470
JUMPV
LABELV $471
line 1194
;1194:		else if ( pm->cmd.forwardmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $473
line 1195
;1195:		{//backward right = BL2TR uppercut
line 1196
;1196:			newmove = LS_A_BL2TR;
ADDRLP4 0
CNSTI4 6
ASGNI4
line 1197
;1197:		}
ADDRGP4 $470
JUMPV
LABELV $473
line 1199
;1198:		else
;1199:		{//just right is a left slice
line 1200
;1200:			newmove = LS_A_L2R;
ADDRLP4 0
CNSTI4 5
ASGNI4
line 1201
;1201:		}
line 1202
;1202:	}
ADDRGP4 $470
JUMPV
LABELV $469
line 1203
;1203:	else if ( pm->cmd.rightmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $475
line 1204
;1204:	{//moving left
line 1205
;1205:		if ( pm->cmd.forwardmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $477
line 1206
;1206:		{//forward left = TR2BL slash
line 1207
;1207:			newmove = LS_A_TR2BL;
ADDRLP4 0
CNSTI4 9
ASGNI4
line 1208
;1208:		}
ADDRGP4 $476
JUMPV
LABELV $477
line 1209
;1209:		else if ( pm->cmd.forwardmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $479
line 1210
;1210:		{//backward left = BR2TL uppercut
line 1211
;1211:			newmove = LS_A_BR2TL;
ADDRLP4 0
CNSTI4 7
ASGNI4
line 1212
;1212:		}
ADDRGP4 $476
JUMPV
LABELV $479
line 1214
;1213:		else
;1214:		{//just left is a right slice
line 1215
;1215:			newmove = LS_A_R2L;
ADDRLP4 0
CNSTI4 8
ASGNI4
line 1216
;1216:		}
line 1217
;1217:	}
ADDRGP4 $476
JUMPV
LABELV $475
line 1219
;1218:	else
;1219:	{//not moving left or right
line 1220
;1220:		if ( pm->cmd.forwardmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $481
line 1221
;1221:		{//forward= T2B slash
line 1222
;1222:			if (pm->ps->fd.saberAnimLevel == FORCE_LEVEL_2 &&
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 2
NEI4 $483
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1120403456
LEF4 $483
ADDRLP4 8
ADDRGP4 PM_GroundDistance
CALLF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 1107296256
GEF4 $483
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $483
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $483
line 1227
;1223:				pm->ps->velocity[2] > 100 &&
;1224:				PM_GroundDistance() < 32 &&
;1225:				!BG_InSpecialJump(pm->ps->legsAnim) &&
;1226:				!BG_SaberInSpecialAttack(pm->ps->torsoAnim))
;1227:			{ //FLIP AND DOWNWARD ATTACK
line 1230
;1228:				trace_t tr;
;1229:
;1230:				if (PM_SomeoneInFront(&tr))
ADDRLP4 20
ARGP4
ADDRLP4 1100
ADDRGP4 PM_SomeoneInFront
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
EQI4 $482
line 1231
;1231:				{
line 1232
;1232:					newmove = PM_SaberFlipOverAttackMove(&tr);
ADDRLP4 20
ARGP4
ADDRLP4 1104
ADDRGP4 PM_SaberFlipOverAttackMove
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1104
INDIRI4
ASGNI4
line 1233
;1233:				}
line 1234
;1234:			}
ADDRGP4 $482
JUMPV
LABELV $483
line 1235
;1235:			else if (pm->ps->fd.saberAnimLevel == FORCE_LEVEL_1 &&
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $487
ADDRLP4 20
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $487
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
BANDI4
ADDRLP4 28
INDIRI4
EQI4 $487
ADDRLP4 20
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
GTI4 $487
ADDRLP4 20
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $487
line 1240
;1236:				pm->ps->groundEntityNum != ENTITYNUM_NONE &&
;1237:				(pm->ps->pm_flags & PMF_DUCKED) &&
;1238:				pm->ps->weaponTime <= 0 &&
;1239:				!BG_SaberInSpecialAttack(pm->ps->torsoAnim))
;1240:			{ //LUNGE (weak)
line 1241
;1241:				newmove = PM_SaberLungeAttackMove();
ADDRLP4 36
ADDRGP4 PM_SaberLungeAttackMove
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 36
INDIRI4
ASGNI4
line 1242
;1242:			}
ADDRGP4 $482
JUMPV
LABELV $487
line 1244
;1243:			else
;1244:			{
line 1245
;1245:				newmove = LS_A_T2B;
ADDRLP4 0
CNSTI4 10
ASGNI4
line 1246
;1246:			}
line 1247
;1247:		}
ADDRGP4 $482
JUMPV
LABELV $481
line 1248
;1248:		else if ( pm->cmd.forwardmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $489
line 1249
;1249:		{//backward= T2B slash//B2T uppercut?
line 1250
;1250:			if (PM_CanBackstab() && !BG_SaberInSpecialAttack(pm->ps->torsoAnim))
ADDRLP4 4
ADDRGP4 PM_CanBackstab
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $491
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $491
line 1251
;1251:			{ //BACKSTAB (attack varies by level)
line 1252
;1252:				if (pm->ps->fd.saberAnimLevel >= FORCE_LEVEL_2)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 2
LTI4 $493
line 1253
;1253:				{//medium and higher attacks
line 1254
;1254:					if ( (pm->ps->pm_flags&PMF_DUCKED) || pm->cmd.upmove < 0 )
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 16
INDIRI4
NEI4 $497
ADDRLP4 12
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
ADDRLP4 16
INDIRI4
GEI4 $495
LABELV $497
line 1255
;1255:					{
line 1256
;1256:						newmove = LS_A_BACK_CR;
ADDRLP4 0
CNSTI4 13
ASGNI4
line 1257
;1257:					}
ADDRGP4 $490
JUMPV
LABELV $495
line 1259
;1258:					else
;1259:					{
line 1260
;1260:						newmove = LS_A_BACK;
ADDRLP4 0
CNSTI4 12
ASGNI4
line 1261
;1261:					}
line 1262
;1262:				}
ADDRGP4 $490
JUMPV
LABELV $493
line 1264
;1263:				else
;1264:				{ //weak attack
line 1265
;1265:					newmove = LS_A_BACKSTAB;
ADDRLP4 0
CNSTI4 11
ASGNI4
line 1266
;1266:				}
line 1267
;1267:			}
ADDRGP4 $490
JUMPV
LABELV $491
line 1269
;1268:			else
;1269:			{
line 1270
;1270:				newmove = LS_A_T2B;
ADDRLP4 0
CNSTI4 10
ASGNI4
line 1271
;1271:			}
line 1272
;1272:		}
ADDRGP4 $490
JUMPV
LABELV $489
line 1273
;1273:		else if ( PM_SaberInBounce( curmove ) )
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $498
line 1274
;1274:		{//bounces should go to their default attack if you don't specify a direction but are attacking
line 1275
;1275:			newmove = saberMoveData[curmove].chain_attack;
ADDRLP4 0
CNSTI4 40
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 saberMoveData+32
ADDP4
INDIRI4
ASGNI4
line 1277
;1276:
;1277:			if ( PM_SaberKataDone(curmove, newmove) )
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 PM_SaberKataDone
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $501
line 1278
;1278:			{
line 1279
;1279:				newmove = saberMoveData[curmove].chain_idle;
ADDRLP4 0
CNSTI4 40
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 saberMoveData+28
ADDP4
INDIRI4
ASGNI4
line 1280
;1280:			}
ADDRGP4 $499
JUMPV
LABELV $501
line 1282
;1281:			else
;1282:			{
line 1283
;1283:				newmove = saberMoveData[curmove].chain_attack;
ADDRLP4 0
CNSTI4 40
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 saberMoveData+32
ADDP4
INDIRI4
ASGNI4
line 1284
;1284:			}
line 1285
;1285:		}
ADDRGP4 $499
JUMPV
LABELV $498
line 1286
;1286:		else if ( curmove == LS_READY )
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $505
line 1287
;1287:		{//Not moving at all, shouldn't have gotten here...?
line 1294
;1288:			//for now, just pick a random attack
;1289:			//newmove = Q_irand( LS_A_TL2BR, LS_A_T2B );
;1290:			//rww - If we don't seed with a "common" value, the client and server will get mismatched
;1291:			//prediction values. Under laggy conditions this will cause the appearance of rapid swing
;1292:			//sequence changes.
;1293:
;1294:			newmove = LS_A_T2B; //decided we don't like random attacks when idle, use an overhead instead.
ADDRLP4 0
CNSTI4 10
ASGNI4
line 1295
;1295:		}
LABELV $505
LABELV $499
LABELV $490
LABELV $482
line 1296
;1296:	}
LABELV $476
LABELV $470
line 1298
;1297:
;1298:	return newmove;
ADDRLP4 0
INDIRI4
RETI4
LABELV $468
endproc PM_SaberAttackForMovement 1108 8
export PM_WeaponLightsaber
proc PM_WeaponLightsaber 120 16
line 1311
;1299:}
;1300:/*
;1301:=================
;1302:PM_WeaponLightsaber
;1303:
;1304:Consults a chart to choose what to do with the lightsaber.
;1305:While this is a little different than the Quake 3 code, there is no clean way of using the Q3 code for this kind of thing.
;1306:=================
;1307:*/
;1308:// Ultimate goal is to set the sabermove to the proper next location
;1309:// Note that if the resultant animation is NONE, then the animation is essentially "idle", and is set in WP_TorsoAnim
;1310:void PM_WeaponLightsaber(void)
;1311:{
line 1313
;1312:	int			addTime,amount;
;1313:	qboolean	delayed_fire = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 1314
;1314:	int			anim=-1, curmove, newmove=LS_NONE;
ADDRLP4 12
CNSTI4 -1
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1316
;1315:
;1316:	qboolean saberInAir = qtrue;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 1317
;1317:	qboolean checkOnlyWeap = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1319
;1318:
;1319: 	if ( pm->ps->saberLockTime > pm->cmd.serverTime )
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LEI4 $508
line 1320
;1320:	{
line 1321
;1321:		pm->ps->saberMove = LS_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 1322
;1322:		PM_SaberLocked();
ADDRGP4 PM_SaberLocked
CALLV
pop
line 1323
;1323:		return;
ADDRGP4 $507
JUMPV
LABELV $508
line 1326
;1324:	}
;1325:	else
;1326:	{
line 1327
;1327:		if ( ( (pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_BF2LOCK ||
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 550
EQI4 $515
ADDRLP4 40
INDIRI4
CNSTI4 553
EQI4 $515
ADDRLP4 40
INDIRI4
CNSTI4 560
EQI4 $515
ADDRLP4 40
INDIRI4
CNSTI4 561
EQI4 $515
ADDRLP4 36
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
EQI4 $510
LABELV $515
line 1333
;1328:				(pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_BF1LOCK ||
;1329:				(pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_CWCIRCLELOCK ||
;1330:				(pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_CCWCIRCLELOCK ||
;1331:				pm->ps->saberLockFrame )
;1332:			)
;1333:		{
line 1334
;1334:			if (pm->ps->saberLockEnemy < ENTITYNUM_NONE &&
ADDRLP4 44
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 1023
GEI4 $516
ADDRLP4 44
INDIRI4
CNSTI4 0
LTI4 $516
line 1336
;1335:				pm->ps->saberLockEnemy >= 0)
;1336:			{
line 1339
;1337:				playerState_t *en;
;1338:
;1339:				en = pm->bgClients[pm->ps->saberLockEnemy];
ADDRLP4 52
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 52
INDIRP4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 52
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRP4
ASGNP4
line 1341
;1340:
;1341:				if (en)
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $518
line 1342
;1342:				{
line 1343
;1343:					PM_SaberLockBreak(en, qfalse);
ADDRLP4 48
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 PM_SaberLockBreak
CALLV
pop
line 1344
;1344:					return;
ADDRGP4 $507
JUMPV
LABELV $518
line 1346
;1345:				}
;1346:			}
LABELV $516
line 1348
;1347:
;1348:			if ( ( (pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_BF2LOCK ||
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 48
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 550
EQI4 $525
ADDRLP4 52
INDIRI4
CNSTI4 553
EQI4 $525
ADDRLP4 52
INDIRI4
CNSTI4 560
EQI4 $525
ADDRLP4 52
INDIRI4
CNSTI4 561
EQI4 $525
ADDRLP4 48
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
EQI4 $520
LABELV $525
line 1354
;1349:					(pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_BF1LOCK ||
;1350:					(pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_CWCIRCLELOCK ||
;1351:					(pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_CCWCIRCLELOCK ||
;1352:					pm->ps->saberLockFrame )
;1353:				)
;1354:			{
line 1355
;1355:				pm->ps->torsoTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 0
ASGNI4
line 1356
;1356:				PM_SetAnim(SETANIM_TORSO,BOTH_STAND1,SETANIM_FLAG_OVERRIDE, 100);
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRLP4 56
INDIRI4
ARGI4
CNSTI4 571
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1357
;1357:				pm->ps->saberLockFrame = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 0
ASGNI4
line 1358
;1358:			}
LABELV $520
line 1359
;1359:		}
LABELV $510
line 1360
;1360:	}
line 1362
;1361:
;1362:	if (pm->ps->saberHolstered)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
CNSTI4 0
EQI4 $526
line 1363
;1363:	{
line 1364
;1364:		if (pm->ps->saberMove != LS_READY)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 1
EQI4 $528
line 1365
;1365:		{
line 1366
;1366:			PM_SetSaberMove( LS_READY );
CNSTI4 1
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1367
;1367:		}
LABELV $528
line 1369
;1368:
;1369:		if ((pm->ps->legsAnim & ~ANIM_TOGGLEBIT) != (pm->ps->torsoAnim & ~ANIM_TOGGLEBIT))
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTI4 -2049
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
BANDI4
ADDRLP4 36
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
BANDI4
EQI4 $530
line 1370
;1370:		{
line 1371
;1371:			PM_SetAnim(SETANIM_TORSO,(pm->ps->legsAnim & ~ANIM_TOGGLEBIT),SETANIM_FLAG_OVERRIDE, 100);
ADDRLP4 44
CNSTI4 1
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1372
;1372:		}
LABELV $530
line 1374
;1373:
;1374:		if (BG_InSaberStandAnim(pm->ps->torsoAnim))
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BG_InSaberStandAnim
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $532
line 1375
;1375:		{
line 1376
;1376:			PM_SetAnim(SETANIM_TORSO,BOTH_STAND1,SETANIM_FLAG_OVERRIDE, 100);
ADDRLP4 48
CNSTI4 1
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
CNSTI4 571
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1377
;1377:		}
LABELV $532
line 1379
;1378:
;1379:		if (pm->ps->weaponTime < 1 && ((pm->cmd.buttons & BUTTON_ALT_ATTACK) || (pm->cmd.buttons & BUTTON_ATTACK)))
ADDRLP4 48
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 52
CNSTI4 1
ASGNI4
ADDRLP4 48
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
GEI4 $534
ADDRLP4 56
ADDRLP4 48
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 60
INDIRI4
NEI4 $536
ADDRLP4 56
INDIRI4
ADDRLP4 52
INDIRI4
BANDI4
ADDRLP4 60
INDIRI4
EQI4 $534
LABELV $536
line 1380
;1380:		{
line 1381
;1381:			if (pm->ps->duelTime < pm->cmd.serverTime)
ADDRLP4 64
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $537
line 1382
;1382:			{
line 1383
;1383:				pm->ps->saberHolstered = qfalse;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1312
ADDP4
CNSTI4 0
ASGNI4
line 1384
;1384:				PM_AddEvent(EV_SABER_UNHOLSTER);
CNSTI4 29
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1385
;1385:			}
LABELV $537
line 1386
;1386:		}
LABELV $534
line 1388
;1387:
;1388:		if ( pm->ps->weaponTime > 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $539
line 1389
;1389:		{
line 1390
;1390:			pm->ps->weaponTime -= pml.msec;
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 1391
;1391:		}
LABELV $539
line 1393
;1392:
;1393:		checkOnlyWeap = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 1394
;1394:		goto weapChecks;
ADDRGP4 $542
JUMPV
LABELV $526
line 1397
;1395:	}
;1396:
;1397:	if ((pm->cmd.buttons & BUTTON_ALT_ATTACK) &&
ADDRLP4 36
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 40
INDIRI4
EQI4 $543
ADDRLP4 44
ADDRLP4 36
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 1
GEI4 $543
ADDRLP4 44
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $543
ADDRLP4 44
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 44
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+68
ADDP4
INDIRI4
LTI4 $543
ADDRLP4 36
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $543
ADDRLP4 52
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
CNSTI4 17
ARGI4
ADDRLP4 56
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $543
line 1404
;1398:		pm->ps->weaponTime < 1 &&
;1399:		pm->ps->saberCanThrow &&
;1400:		pm->ps->fd.forcePower >= forcePowerNeeded[pm->ps->fd.forcePowerLevel[FP_SABERTHROW]][FP_SABERTHROW] &&
;1401:		!BG_HasYsalamiri(pm->gametype, pm->ps) &&
;1402:		BG_CanUseFPNow(pm->gametype, pm->ps, pm->cmd.serverTime, FP_SABERTHROW)
;1403:		)
;1404:	{ //might as well just check for a saber throw right here
line 1406
;1405:		//This will get set to false again once the saber makes it back to its owner game-side
;1406:		if (!pm->ps->saberInFlight)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
NEI4 $546
line 1407
;1407:		{
line 1408
;1408:			pm->ps->fd.forcePower -= forcePowerNeeded[pm->ps->fd.forcePowerLevel[FP_SABERTHROW]][FP_SABERTHROW];
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 72
ADDRLP4 60
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded+68
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1409
;1409:		}
LABELV $546
line 1411
;1410:
;1411:		pm->ps->saberInFlight = qtrue;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 1412
;1412:	}
LABELV $543
line 1414
;1413:	
;1414:	if ( pm->ps->saberInFlight )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $549
line 1415
;1415:	{//guiding saber
line 1416
;1416:		PM_SetAnim(SETANIM_TORSO, BOTH_SABERPULL, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 100);
CNSTI4 1
ARGI4
CNSTI4 1052
ARGI4
CNSTI4 3
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1417
;1417:		pm->ps->torsoTimer = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 1
ASGNI4
line 1418
;1418:		return;
ADDRGP4 $507
JUMPV
LABELV $549
line 1430
;1419:	}
;1420:
;1421:   // don't allow attack until all buttons are up
;1422:	//This is bad. It freezes the attack state and the animations if you hold the button after respawning, and it looks strange.
;1423:	/*
;1424:	if ( pm->ps->pm_flags & PMF_RESPAWNED ) {
;1425:		return;
;1426:	}
;1427:	*/
;1428:
;1429:	// check for dead player
;1430:	if ( pm->ps->stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $551
line 1431
;1431:		return;
ADDRGP4 $507
JUMPV
LABELV $551
line 1434
;1432:	}
;1433:
;1434:	if (pm->ps->weaponstate == WEAPON_READY ||
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $555
ADDRLP4 60
INDIRI4
CNSTI4 6
NEI4 $553
LABELV $555
line 1436
;1435:		pm->ps->weaponstate == WEAPON_IDLE)
;1436:	{
line 1437
;1437:		if (pm->ps->saberMove != LS_READY && pm->ps->weaponTime <= 0 && !pm->ps->saberBlocked)
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 1
EQI4 $556
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
GTI4 $556
ADDRLP4 64
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
NEI4 $556
line 1438
;1438:		{
line 1439
;1439:			PM_SetSaberMove( LS_READY );
CNSTI4 1
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1440
;1440:		}
LABELV $556
line 1441
;1441:	}
LABELV $553
line 1443
;1442:
;1443:	if( (pm->ps->torsoAnim & ~ANIM_TOGGLEBIT) == BOTH_RUN2 ||
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 836
EQI4 $560
ADDRLP4 64
INDIRI4
CNSTI4 833
NEI4 $558
LABELV $560
line 1445
;1444:		(pm->ps->torsoAnim & ~ANIM_TOGGLEBIT) == BOTH_RUN1 )
;1445:	{
line 1446
;1446:		if ((pm->ps->torsoAnim & ~ANIM_TOGGLEBIT) != (pm->ps->legsAnim & ~ANIM_TOGGLEBIT))
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
CNSTI4 -2049
ASGNI4
ADDRLP4 68
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
BANDI4
ADDRLP4 68
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
BANDI4
EQI4 $561
line 1447
;1447:		{
line 1448
;1448:			PM_SetAnim(SETANIM_TORSO,(pm->ps->legsAnim & ~ANIM_TOGGLEBIT),SETANIM_FLAG_OVERRIDE, 100);
ADDRLP4 76
CNSTI4 1
ASGNI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1449
;1449:		}
LABELV $561
line 1450
;1450:	}
LABELV $558
line 1453
;1451:
;1452:	// make weapon function
;1453:	if ( pm->ps->weaponTime > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $563
line 1454
;1454:		pm->ps->weaponTime -= pml.msec;
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 1456
;1455:
;1456:		if (pm->ps->saberBlocked && pm->ps->torsoAnim != saberMoveData[pm->ps->saberMove].animToUse)
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $564
ADDRLP4 72
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 40
ADDRLP4 72
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
EQI4 $564
line 1457
;1457:		{ //rww - keep him in the blocking pose until he can attack again
line 1458
;1458:			PM_SetAnim(SETANIM_TORSO,saberMoveData[pm->ps->saberMove].animToUse,saberMoveData[pm->ps->saberMove].animSetFlags|SETANIM_FLAG_HOLD, saberMoveData[pm->ps->saberMove].blendTime);
CNSTI4 1
ARGI4
ADDRLP4 76
CNSTI4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 76
INDIRI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
INDIRI4
ADDRGP4 saberMoveData+16
ADDP4
INDIRU4
CNSTU4 2
BORU4
CVUI4 4
ARGI4
ADDRLP4 76
INDIRI4
ADDRGP4 saberMoveData+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1459
;1459:			return;
ADDRGP4 $507
JUMPV
line 1461
;1460:		}
;1461:	}
LABELV $563
line 1463
;1462:	else
;1463:	{
line 1464
;1464:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 1465
;1465:	}
LABELV $564
line 1468
;1466:
;1467:	// Now we react to a block action by the player's lightsaber.
;1468:	if ( pm->ps->saberBlocked )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $572
line 1469
;1469:	{
line 1470
;1470:		int firstSet = 0;
ADDRLP4 68
CNSTI4 0
ASGNI4
line 1472
;1471:
;1472:		if (!pm->ps->weaponTime)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
NEI4 $574
line 1473
;1473:		{
line 1474
;1474:			firstSet = 1;
ADDRLP4 68
CNSTI4 1
ASGNI4
line 1475
;1475:		}
LABELV $574
line 1477
;1476:
;1477:		switch ( pm->ps->saberBlocked )
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 1
LTI4 $576
ADDRLP4 72
INDIRI4
CNSTI4 13
GTI4 $576
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $615-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $615
address $579
address $580
address $587
address $605
address $607
address $609
address $611
address $613
address $606
address $608
address $610
address $612
address $614
code
line 1478
;1478:		{
LABELV $579
line 1480
;1479:			case BLOCKED_BOUNCE_MOVE:
;1480:				{ //act as a bounceMove and reset the saberMove instead of using a seperate value for it
line 1481
;1481:					PM_SetSaberMove( pm->ps->saberMove );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CVII2 4
CVII4 2
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1482
;1482:					pm->ps->weaponTime = pm->ps->torsoTimer;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
line 1483
;1483:					pm->ps->saberBlocked = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1484
;1484:				}
line 1485
;1485:				break;
ADDRGP4 $577
JUMPV
LABELV $580
line 1488
;1486:			case BLOCKED_PARRY_BROKEN:
;1487:				//whatever parry we were is in now broken, play the appropriate knocked-away anim
;1488:				{
line 1491
;1489:					int nextMove;
;1490:
;1491:					if ( PM_SaberInBrokenParry( pm->ps->saberMove ) )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $581
line 1492
;1492:					{//already have one...?
line 1493
;1493:						nextMove = pm->ps->saberMove;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 1494
;1494:					}
ADDRGP4 $582
JUMPV
LABELV $581
line 1496
;1495:					else
;1496:					{
line 1497
;1497:						nextMove = PM_BrokenParryForParry( pm->ps->saberMove );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 PM_BrokenParryForParry
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 88
INDIRI4
ASGNI4
line 1498
;1498:					}
LABELV $582
line 1499
;1499:					if ( nextMove != LS_NONE )
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $583
line 1500
;1500:					{
line 1501
;1501:						PM_SetSaberMove( nextMove );
ADDRLP4 80
INDIRI4
CVII2 4
CVII4 2
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1502
;1502:						pm->ps->weaponTime = pm->ps->torsoTimer;
ADDRLP4 88
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
line 1503
;1503:					}
ADDRGP4 $577
JUMPV
LABELV $583
line 1505
;1504:					else
;1505:					{//Maybe in a knockaway?
line 1506
;1506:						if (pm->ps->weaponTime <= 0)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $577
line 1507
;1507:						{
line 1508
;1508:							pm->ps->saberBlocked = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1509
;1509:						}
line 1510
;1510:					}
line 1511
;1511:				}
line 1512
;1512:				break;
ADDRGP4 $577
JUMPV
LABELV $587
line 1516
;1513:			case BLOCKED_ATK_BOUNCE:
;1514:				// If there is absolutely no blocked move in the chart, don't even mess with the animation.
;1515:				// OR if we are already in a block or parry.
;1516:				if (pm->ps->saberMove >= LS_T1_BR__R)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 32
LTI4 $588
line 1517
;1517:				{//an actual bounce?  Other bounces before this are actually transitions?
line 1518
;1518:					pm->ps->saberBlocked = BLOCKED_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1519
;1519:				}
ADDRGP4 $577
JUMPV
LABELV $588
line 1521
;1520:				else
;1521:				{
line 1524
;1522:					int bounceMove;
;1523:
;1524:					if ( pm->cmd.buttons & BUTTON_ATTACK )
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $590
line 1525
;1525:					{//transition to a new attack
line 1526
;1526:						int newQuad = PM_SaberMoveQuadrantForMovement( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 88
ADDRGP4 PM_SaberMoveQuadrantForMovement
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 88
INDIRI4
ASGNI4
ADDRGP4 $593
JUMPV
LABELV $592
line 1528
;1527:						while ( newQuad == saberMoveData[pm->ps->saberMove].startQuad )
;1528:						{//player is still in same attack quad, don't repeat that attack because it looks bad, 
line 1531
;1529:							//FIXME: try to pick one that might look cool?
;1530:							//newQuad = Q_irand( Q_BR, Q_BL );
;1531:							newQuad = PM_irand_timesync( Q_BR, Q_BL );
CNSTI4 0
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 92
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 92
INDIRI4
ASGNI4
line 1533
;1532:							//FIXME: sanity check, just in case?
;1533:						}//else player is switching up anyway, take the new attack dir
LABELV $593
line 1527
ADDRLP4 84
INDIRI4
CNSTI4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
EQI4 $592
line 1534
;1534:						bounceMove = transitionMove[saberMoveData[pm->ps->saberMove].startQuad][newQuad];
ADDRLP4 80
ADDRLP4 84
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 transitionMove
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1535
;1535:					}
ADDRGP4 $591
JUMPV
LABELV $590
line 1537
;1536:					else
;1537:					{//return to ready
line 1538
;1538:						if ( saberMoveData[pm->ps->saberMove].startQuad == Q_T )
CNSTI4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
CNSTI4 3
NEI4 $597
line 1539
;1539:						{
line 1540
;1540:							bounceMove = LS_R_BL2TR;
ADDRLP4 80
CNSTI4 27
ASGNI4
line 1541
;1541:						}
ADDRGP4 $598
JUMPV
LABELV $597
line 1542
;1542:						else if ( saberMoveData[pm->ps->saberMove].startQuad < Q_T )
CNSTI4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
CNSTI4 3
GEI4 $600
line 1543
;1543:						{
line 1544
;1544:							bounceMove = LS_R_TL2BR+saberMoveData[pm->ps->saberMove].startQuad-Q_BR;
ADDRLP4 80
CNSTI4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
line 1545
;1545:						}
ADDRGP4 $601
JUMPV
LABELV $600
line 1547
;1546:						else// if ( saberMoveData[pm->ps->saberMove].startQuad > Q_T )
;1547:						{
line 1548
;1548:							bounceMove = LS_R_BR2TL+saberMoveData[pm->ps->saberMove].startQuad-Q_TL;
ADDRLP4 80
CNSTI4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
CNSTI4 28
ADDI4
CNSTI4 4
SUBI4
ASGNI4
line 1549
;1549:						}
LABELV $601
LABELV $598
line 1550
;1550:					}
LABELV $591
line 1551
;1551:					PM_SetSaberMove( bounceMove );
ADDRLP4 80
INDIRI4
CVII2 4
CVII4 2
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1553
;1552:
;1553:					pm->ps->weaponTime = pm->ps->torsoTimer;//+saberMoveData[bounceMove].blendTime+SABER_BLOCK_DUR;
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
line 1555
;1554:
;1555:				}
line 1556
;1556:				break;
ADDRGP4 $577
JUMPV
LABELV $605
line 1558
;1557:			case BLOCKED_UPPER_RIGHT:
;1558:				PM_SetSaberMove( LS_PARRY_UR );
CNSTI4 109
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1559
;1559:				break;
ADDRGP4 $577
JUMPV
LABELV $606
line 1561
;1560:			case BLOCKED_UPPER_RIGHT_PROJ:
;1561:				PM_SetSaberMove( LS_REFLECT_UR );
CNSTI4 114
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1562
;1562:				break;
ADDRGP4 $577
JUMPV
LABELV $607
line 1564
;1563:			case BLOCKED_UPPER_LEFT:
;1564:				PM_SetSaberMove( LS_PARRY_UL );
CNSTI4 110
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1565
;1565:				break;
ADDRGP4 $577
JUMPV
LABELV $608
line 1567
;1566:			case BLOCKED_UPPER_LEFT_PROJ:
;1567:				PM_SetSaberMove( LS_REFLECT_UL );
CNSTI4 115
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1568
;1568:				break;
ADDRGP4 $577
JUMPV
LABELV $609
line 1570
;1569:			case BLOCKED_LOWER_RIGHT:
;1570:				PM_SetSaberMove( LS_PARRY_LR );
CNSTI4 111
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1571
;1571:				break;
ADDRGP4 $577
JUMPV
LABELV $610
line 1573
;1572:			case BLOCKED_LOWER_RIGHT_PROJ:
;1573:				PM_SetSaberMove( LS_REFLECT_LR );
CNSTI4 116
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1574
;1574:				break;
ADDRGP4 $577
JUMPV
LABELV $611
line 1576
;1575:			case BLOCKED_LOWER_LEFT:
;1576:				PM_SetSaberMove( LS_PARRY_LL );
CNSTI4 112
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1577
;1577:				break;
ADDRGP4 $577
JUMPV
LABELV $612
line 1579
;1578:			case BLOCKED_LOWER_LEFT_PROJ:
;1579:				PM_SetSaberMove( LS_REFLECT_LL);
CNSTI4 117
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1580
;1580:				break;
ADDRGP4 $577
JUMPV
LABELV $613
line 1582
;1581:			case BLOCKED_TOP:
;1582:				PM_SetSaberMove( LS_PARRY_UP );
CNSTI4 108
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1583
;1583:				break;
ADDRGP4 $577
JUMPV
LABELV $614
line 1585
;1584:			case BLOCKED_TOP_PROJ:
;1585:				PM_SetSaberMove( LS_REFLECT_UP );
CNSTI4 113
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1586
;1586:				break;
ADDRGP4 $577
JUMPV
LABELV $576
line 1588
;1587:			default:
;1588:				pm->ps->saberBlocked = BLOCKED_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1589
;1589:				break;
LABELV $577
line 1592
;1590:		}
;1591:
;1592:		if (pm->ps->saberBlocked != BLOCKED_ATK_BOUNCE && pm->ps->saberBlocked != BLOCKED_PARRY_BROKEN && pm->ps->weaponTime < 1)
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
ADDRLP4 80
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 3
EQI4 $617
ADDRLP4 84
INDIRI4
CNSTI4 2
EQI4 $617
ADDRLP4 80
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 1
GEI4 $617
line 1593
;1593:		{
line 1594
;1594:			pm->ps->torsoTimer = SABER_BLOCK_DUR;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 150
ASGNI4
line 1595
;1595:			pm->ps->weaponTime = pm->ps->torsoTimer;
ADDRLP4 88
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
line 1596
;1596:		}
LABELV $617
line 1598
;1597:
;1598:		if (firstSet)
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $619
line 1599
;1599:		{
line 1600
;1600:			return;
ADDRGP4 $507
JUMPV
LABELV $619
line 1604
;1601:		}
;1602:
;1603:		// Charging is like a lead-up before attacking again.  This is an appropriate use, or we can create a new weaponstate for blocking
;1604:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 1607
;1605:
;1606:		// Done with block, so stop these active weapon branches.
;1607:		return;
ADDRGP4 $507
JUMPV
LABELV $572
LABELV $542
line 1613
;1608:	}
;1609:
;1610:weapChecks:
;1611:	// check for weapon change
;1612:	// can't change if weapon is firing, but can change again if lowering or raising
;1613:	if ( pm->ps->weaponTime <= 0 || pm->ps->weaponstate != WEAPON_FIRING ) {
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $623
ADDRLP4 68
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 3
EQI4 $621
LABELV $623
line 1614
;1614:		if ( pm->ps->weapon != pm->cmd.weapon ) {
ADDRLP4 72
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 72
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
EQI4 $624
line 1615
;1615:			PM_BeginWeaponChange( pm->cmd.weapon );
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRGP4 PM_BeginWeaponChange
CALLV
pop
line 1616
;1616:		}
LABELV $624
line 1617
;1617:	}
LABELV $621
line 1619
;1618:
;1619:	if ( pm->ps->weaponTime > 0 ) 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $626
line 1620
;1620:	{
line 1621
;1621:		return;
ADDRGP4 $507
JUMPV
LABELV $626
line 1629
;1622:	}
;1623:
;1624:	// *********************************************************
;1625:	// WEAPON_DROPPING
;1626:	// *********************************************************
;1627:
;1628:	// change weapon if time
;1629:	if ( pm->ps->weaponstate == WEAPON_DROPPING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 2
NEI4 $628
line 1630
;1630:		PM_FinishWeaponChange();
ADDRGP4 PM_FinishWeaponChange
CALLV
pop
line 1631
;1631:		return;
ADDRGP4 $507
JUMPV
LABELV $628
line 1638
;1632:	}
;1633:
;1634:	// *********************************************************
;1635:	// WEAPON_RAISING
;1636:	// *********************************************************
;1637:
;1638:	if ( pm->ps->weaponstate == WEAPON_RAISING ) 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 1
NEI4 $630
line 1639
;1639:	{//Just selected the weapon
line 1640
;1640:		pm->ps->weaponstate = WEAPON_IDLE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 6
ASGNI4
line 1641
;1641:		if((pm->ps->legsAnim & ~ANIM_TOGGLEBIT) == BOTH_WALK1 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 822
NEI4 $632
line 1642
;1642:		{
line 1643
;1643:			PM_SetAnim(SETANIM_TORSO,BOTH_WALK1,SETANIM_FLAG_NORMAL, 100);
CNSTI4 1
ARGI4
CNSTI4 822
ARGI4
CNSTI4 0
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1644
;1644:		}
ADDRGP4 $633
JUMPV
LABELV $632
line 1645
;1645:		else if((pm->ps->legsAnim & ~ANIM_TOGGLEBIT) == BOTH_RUN2 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 836
NEI4 $634
line 1646
;1646:		{
line 1647
;1647:			PM_SetAnim(SETANIM_TORSO,BOTH_RUN2,SETANIM_FLAG_NORMAL, 100);
CNSTI4 1
ARGI4
CNSTI4 836
ARGI4
CNSTI4 0
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1648
;1648:		}
ADDRGP4 $635
JUMPV
LABELV $634
line 1649
;1649:		else if((pm->ps->legsAnim & ~ANIM_TOGGLEBIT) == BOTH_WALK2 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 823
NEI4 $636
line 1650
;1650:		{
line 1651
;1651:			PM_SetAnim(SETANIM_TORSO,BOTH_WALK2,SETANIM_FLAG_NORMAL, 100);
CNSTI4 1
ARGI4
CNSTI4 823
ARGI4
CNSTI4 0
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1652
;1652:		}
ADDRGP4 $637
JUMPV
LABELV $636
line 1654
;1653:		else
;1654:		{
line 1655
;1655:			PM_SetAnim(SETANIM_TORSO,PM_GetSaberStance(),SETANIM_FLAG_NORMAL, 100);
ADDRLP4 72
ADDRGP4 PM_GetSaberStance
CALLI4
ASGNI4
CNSTI4 1
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1656
;1656:		}
LABELV $637
LABELV $635
LABELV $633
line 1658
;1657:
;1658:		if (pm->ps->weaponstate == WEAPON_RAISING)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 1
NEI4 $638
line 1659
;1659:		{
line 1660
;1660:			return;
ADDRGP4 $507
JUMPV
LABELV $638
line 1663
;1661:		}
;1662:
;1663:	}
LABELV $630
line 1665
;1664:
;1665:	if (checkOnlyWeap)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $640
line 1666
;1666:	{
line 1667
;1667:		return;
ADDRGP4 $507
JUMPV
LABELV $640
line 1674
;1668:	}
;1669:
;1670:	// *********************************************************
;1671:	// Check for WEAPON ATTACK
;1672:	// *********************************************************
;1673:
;1674:	if(!delayed_fire)
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $642
line 1675
;1675:	{
line 1677
;1676:		// Start with the current move, and cross index it with the current control states.
;1677:		if ( pm->ps->saberMove > LS_NONE && pm->ps->saberMove < LS_MOVE_MAX )
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
LEI4 $644
ADDRLP4 72
INDIRI4
CNSTI4 118
GEI4 $644
line 1678
;1678:		{
line 1679
;1679:			curmove = pm->ps->saberMove;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 1680
;1680:		}
ADDRGP4 $645
JUMPV
LABELV $644
line 1682
;1681:		else
;1682:		{
line 1683
;1683:			curmove = LS_READY;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1684
;1684:		}
LABELV $645
line 1686
;1685:		// check for fire
;1686:		if ( !(pm->cmd.buttons & (BUTTON_ATTACK)) )
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $646
line 1687
;1687:		{
line 1688
;1688:			if (pm->ps->weaponTime != 0)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
EQI4 $648
line 1689
;1689:			{//Still firing
line 1690
;1690:				pm->ps->weaponstate = WEAPON_FIRING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 3
ASGNI4
line 1691
;1691:			}
ADDRGP4 $649
JUMPV
LABELV $648
line 1692
;1692:			else if ( pm->ps->weaponstate != WEAPON_READY )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 0
EQI4 $650
line 1693
;1693:			{
line 1694
;1694:				pm->ps->weaponstate = WEAPON_IDLE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 6
ASGNI4
line 1695
;1695:			}
LABELV $650
LABELV $649
line 1697
;1696:			//Check for finishing an anim if necc.
;1697:			if ( curmove >= LS_S_TL2BR && curmove <= LS_S_T2B )
ADDRLP4 76
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 18
LTI4 $652
ADDRLP4 76
INDIRI4
CNSTI4 24
GTI4 $652
line 1698
;1698:			{//started a swing, must continue from here
line 1699
;1699:				newmove = LS_A_TL2BR + (curmove-LS_S_TL2BR);
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 18
SUBI4
CNSTI4 4
ADDI4
ASGNI4
line 1700
;1700:			}
ADDRGP4 $653
JUMPV
LABELV $652
line 1701
;1701:			else if ( curmove >= LS_A_TL2BR && curmove <= LS_A_T2B )
ADDRLP4 80
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 4
LTI4 $654
ADDRLP4 80
INDIRI4
CNSTI4 10
GTI4 $654
line 1702
;1702:			{//finished an attack, must continue from here
line 1703
;1703:				newmove = LS_R_TL2BR + (curmove-LS_A_TL2BR);
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 4
SUBI4
CNSTI4 25
ADDI4
ASGNI4
line 1704
;1704:			}
ADDRGP4 $655
JUMPV
LABELV $654
line 1705
;1705:			else if ( PM_SaberInTransition( curmove ) )
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 PM_SaberInTransition
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $656
line 1706
;1706:			{//in a transition, must play sequential attack
line 1707
;1707:				newmove = saberMoveData[curmove].chain_attack;
ADDRLP4 8
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+32
ADDP4
INDIRI4
ASGNI4
line 1708
;1708:			}
ADDRGP4 $657
JUMPV
LABELV $656
line 1709
;1709:			else if ( PM_SaberInBounce( curmove ) )
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $659
line 1710
;1710:			{//in a bounce
line 1711
;1711:				newmove = saberMoveData[curmove].chain_idle;//oops, not attacking, so don't chain
ADDRLP4 8
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+28
ADDP4
INDIRI4
ASGNI4
line 1712
;1712:			}
ADDRGP4 $660
JUMPV
LABELV $659
line 1714
;1713:			else
;1714:			{//FIXME: what about returning from a parry?
line 1715
;1715:				PM_SetSaberMove( LS_READY );
CNSTI4 1
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1716
;1716:				return;
ADDRGP4 $507
JUMPV
LABELV $660
LABELV $657
LABELV $655
LABELV $653
line 1718
;1717:			}
;1718:		}
LABELV $646
line 1723
;1719:
;1720:		// ***************************************************
;1721:		// Pressing attack, so we must look up the proper attack move.
;1722:
;1723:		saberInAir = qtrue;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 1725
;1724:
;1725:		if ( pm->ps->weaponTime > 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $662
line 1726
;1726:		{	// Last attack is not yet complete.
line 1727
;1727:			pm->ps->weaponstate = WEAPON_FIRING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 3
ASGNI4
line 1728
;1728:			return;
ADDRGP4 $507
JUMPV
LABELV $662
line 1731
;1729:		}
;1730:		else
;1731:		{
line 1732
;1732:			int	both = qfalse;
ADDRLP4 76
CNSTI4 0
ASGNI4
line 1734
;1733:
;1734:			if ( curmove >= LS_PARRY_UP && curmove <= LS_REFLECT_LL )
ADDRLP4 80
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 108
LTI4 $664
ADDRLP4 80
INDIRI4
CNSTI4 117
GTI4 $664
line 1735
;1735:			{//from a parry or deflection, can go directly into an attack (?)
line 1736
;1736:				switch ( saberMoveData[curmove].endQuad )
ADDRLP4 84
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+12
ADDP4
INDIRI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
LTI4 $666
ADDRLP4 84
INDIRI4
CNSTI4 6
GTI4 $666
ADDRLP4 84
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $675
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $675
address $673
address $666
address $671
address $670
address $672
address $666
address $674
code
line 1737
;1737:				{
LABELV $670
line 1739
;1738:				case Q_T:
;1739:					newmove = LS_A_T2B;
ADDRLP4 8
CNSTI4 10
ASGNI4
line 1740
;1740:					break;
ADDRGP4 $667
JUMPV
LABELV $671
line 1742
;1741:				case Q_TR:
;1742:					newmove = LS_A_TL2BR;
ADDRLP4 8
CNSTI4 4
ASGNI4
line 1743
;1743:					break;
ADDRGP4 $667
JUMPV
LABELV $672
line 1745
;1744:				case Q_TL:
;1745:					newmove = LS_A_TR2BL;
ADDRLP4 8
CNSTI4 9
ASGNI4
line 1746
;1746:					break;
ADDRGP4 $667
JUMPV
LABELV $673
line 1748
;1747:				case Q_BR:
;1748:					newmove = LS_A_BR2TL;
ADDRLP4 8
CNSTI4 7
ASGNI4
line 1749
;1749:					break;
ADDRGP4 $667
JUMPV
LABELV $674
line 1751
;1750:				case Q_BL:
;1751:					newmove = LS_A_BL2TR;
ADDRLP4 8
CNSTI4 6
ASGNI4
line 1752
;1752:					break;
LABELV $666
LABELV $667
line 1755
;1753:				//shouldn't be a parry that ends at L, R or B
;1754:				}
;1755:			}
LABELV $664
line 1757
;1756:
;1757:			if ( newmove != LS_NONE )
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $676
line 1758
;1758:			{//have a valid, final LS_ move picked, so skip findingt he transition move and just get the anim
line 1759
;1759:				anim = saberMoveData[newmove].animToUse;
ADDRLP4 12
CNSTI4 40
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ASGNI4
line 1760
;1760:			}
LABELV $676
line 1763
;1761:
;1762:			//FIXME: diagonal dirs use the figure-eight attacks from ready pose?
;1763:			if ( anim == -1 )
ADDRLP4 12
INDIRI4
CNSTI4 -1
NEI4 $679
line 1764
;1764:			{
line 1766
;1765:				//FIXME: take FP_SABER_OFFENSE into account here somehow?
;1766:				if ( PM_SaberInTransition( curmove ) )
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 PM_SaberInTransition
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $681
line 1767
;1767:				{//in a transition, must play sequential attack
line 1768
;1768:					newmove = saberMoveData[curmove].chain_attack;
ADDRLP4 8
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+32
ADDP4
INDIRI4
ASGNI4
line 1769
;1769:				}
ADDRGP4 $682
JUMPV
LABELV $681
line 1770
;1770:				else if ( curmove >= LS_S_TL2BR && curmove <= LS_S_T2B )
ADDRLP4 88
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 18
LTI4 $684
ADDRLP4 88
INDIRI4
CNSTI4 24
GTI4 $684
line 1771
;1771:				{//started a swing, must continue from here
line 1772
;1772:					newmove = LS_A_TL2BR + (curmove-LS_S_TL2BR);
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 18
SUBI4
CNSTI4 4
ADDI4
ASGNI4
line 1773
;1773:				}
ADDRGP4 $685
JUMPV
LABELV $684
line 1774
;1774:				else if ( PM_SaberInBrokenParry( curmove ) )
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $686
line 1775
;1775:				{//broken parries must always return to ready
line 1776
;1776:					newmove = LS_READY;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1777
;1777:				}
ADDRGP4 $687
JUMPV
LABELV $686
line 1779
;1778:				else//if ( pm->cmd.buttons&BUTTON_ATTACK && !(pm->ps->pm_flags&PMF_ATTACK_HELD) )//only do this if just pressed attack button?
;1779:				{//get attack move from movement command
line 1780
;1780:					saberMoveName_t checkMove = PM_SaberAttackForMovement(curmove);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 PM_SaberAttackForMovement
CALLI4
ASGNI4
ADDRLP4 96
ADDRLP4 100
INDIRI4
ASGNI4
line 1781
;1781:					if (checkMove != -1)
ADDRLP4 96
INDIRI4
CNSTI4 -1
EQI4 $688
line 1782
;1782:					{
line 1783
;1783:						newmove = checkMove;
ADDRLP4 8
ADDRLP4 96
INDIRI4
ASGNI4
line 1784
;1784:					}
LABELV $688
line 1786
;1785:
;1786:					if ( (PM_SaberInBounce( curmove )||PM_SaberInBrokenParry( curmove ))
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $694
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $690
LABELV $694
ADDRLP4 112
CNSTI4 40
ASGNI4
ADDRLP4 112
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+12
ADDP4
INDIRI4
NEI4 $690
line 1788
;1787:						&& saberMoveData[newmove].startQuad == saberMoveData[curmove].endQuad )
;1788:					{//this attack would be a repeat of the last (which was blocked), so don't actually use it, use the default chain attack for this bounce
line 1789
;1789:						newmove = saberMoveData[curmove].chain_attack;
ADDRLP4 8
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+32
ADDP4
INDIRI4
ASGNI4
line 1790
;1790:					}
LABELV $690
line 1792
;1791:
;1792:					if ( PM_SaberKataDone(curmove, newmove) )
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 116
ADDRGP4 PM_SaberKataDone
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $696
line 1793
;1793:					{//we came from a bounce and cannot chain to another attack because our kata is done
line 1794
;1794:						newmove = saberMoveData[curmove].chain_idle;
ADDRLP4 8
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+28
ADDP4
INDIRI4
ASGNI4
line 1795
;1795:					}
LABELV $696
line 1796
;1796:				}
LABELV $687
LABELV $685
LABELV $682
line 1798
;1797:
;1798:				if ( newmove != LS_NONE )
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $699
line 1799
;1799:				{
line 1801
;1800:					//Now get the proper transition move
;1801:					newmove = PM_SaberAnimTransitionAnim( curmove, newmove );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 PM_SaberAnimTransitionAnim
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 96
INDIRI4
ASGNI4
line 1803
;1802:
;1803:					assert(	bgGlobalAnimations[saberMoveData[newmove].animToUse].firstFrame != 0 || 
line 1806
;1804:							bgGlobalAnimations[saberMoveData[newmove].animToUse].numFrames != 0);
;1805:
;1806:					anim = saberMoveData[newmove].animToUse;
ADDRLP4 12
CNSTI4 40
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ASGNI4
line 1807
;1807:				}
LABELV $699
line 1808
;1808:			}
LABELV $679
line 1810
;1809:
;1810:			if (anim == -1)
ADDRLP4 12
INDIRI4
CNSTI4 -1
NEI4 $702
line 1811
;1811:			{//not side-stepping, pick neutral anim
line 1813
;1812:				// Add randomness for prototype?
;1813:				newmove = saberMoveData[curmove].chain_attack;
ADDRLP4 8
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+32
ADDP4
INDIRI4
ASGNI4
line 1815
;1814:
;1815:				anim= saberMoveData[newmove].animToUse;
ADDRLP4 12
CNSTI4 40
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ASGNI4
line 1817
;1816:
;1817:				if ( !pm->cmd.forwardmove && !pm->cmd.rightmove && pm->cmd.upmove >= 0 && pm->ps->groundEntityNum != ENTITYNUM_NONE )
ADDRLP4 84
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRLP4 84
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 88
INDIRI4
NEI4 $706
ADDRLP4 84
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 88
INDIRI4
NEI4 $706
ADDRLP4 84
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
ADDRLP4 88
INDIRI4
LTI4 $706
ADDRLP4 84
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $706
line 1818
;1818:				{//not moving at all, so set the anim on entire body
line 1819
;1819:					both = qtrue;
ADDRLP4 76
CNSTI4 1
ASGNI4
line 1820
;1820:				}
LABELV $706
line 1822
;1821:			
;1822:			}
LABELV $702
line 1824
;1823:
;1824:			if ( anim == -1)
ADDRLP4 12
INDIRI4
CNSTI4 -1
NEI4 $708
line 1825
;1825:			{
line 1826
;1826:				if((pm->ps->legsAnim & ~ANIM_TOGGLEBIT) == BOTH_WALK1 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 822
NEI4 $710
line 1827
;1827:				{
line 1828
;1828:					anim = BOTH_WALK1;
ADDRLP4 12
CNSTI4 822
ASGNI4
line 1829
;1829:				}
ADDRGP4 $711
JUMPV
LABELV $710
line 1830
;1830:				else if((pm->ps->legsAnim & ~ANIM_TOGGLEBIT) == BOTH_RUN2 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 836
NEI4 $712
line 1831
;1831:				{
line 1832
;1832:					anim = BOTH_RUN2;
ADDRLP4 12
CNSTI4 836
ASGNI4
line 1833
;1833:				}
ADDRGP4 $713
JUMPV
LABELV $712
line 1834
;1834:				else if((pm->ps->legsAnim & ~ANIM_TOGGLEBIT) == BOTH_WALK2 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 823
NEI4 $714
line 1835
;1835:				{
line 1836
;1836:					anim = BOTH_WALK2;
ADDRLP4 12
CNSTI4 823
ASGNI4
line 1837
;1837:				}
ADDRGP4 $715
JUMPV
LABELV $714
line 1839
;1838:				else
;1839:				{
line 1840
;1840:					anim = PM_GetSaberStance();
ADDRLP4 84
ADDRGP4 PM_GetSaberStance
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 84
INDIRI4
ASGNI4
line 1841
;1841:				}
LABELV $715
LABELV $713
LABELV $711
line 1843
;1842:
;1843:				if (anim == BOTH_RUN2 && !pm->cmd.forwardmove && !pm->cmd.rightmove)
ADDRLP4 12
INDIRI4
CNSTI4 836
NEI4 $716
ADDRLP4 84
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRLP4 84
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 88
INDIRI4
NEI4 $716
ADDRLP4 84
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 88
INDIRI4
NEI4 $716
line 1844
;1844:				{ //semi-hacky (if not moving on x-y and still playing the running anim, force the player out of it)
line 1845
;1845:					anim = PM_GetSaberStance();
ADDRLP4 92
ADDRGP4 PM_GetSaberStance
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 92
INDIRI4
ASGNI4
line 1846
;1846:				}
LABELV $716
line 1847
;1847:				newmove = LS_READY;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1848
;1848:			}
LABELV $708
line 1850
;1849:
;1850:			if ( !pm->ps->saberActive )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
CNSTI4 0
NEI4 $718
line 1851
;1851:			{//turn on the saber if it's not on
line 1852
;1852:				pm->ps->saberActive = qtrue;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 1
ASGNI4
line 1853
;1853:			}
LABELV $718
line 1855
;1854:
;1855:			PM_SetSaberMove( newmove );
ADDRLP4 8
INDIRI4
CVII2 4
CVII4 2
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1857
;1856:
;1857:			if ( both )
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $720
line 1858
;1858:			{
line 1859
;1859:				PM_SetAnim(SETANIM_LEGS,anim,SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 100);
CNSTI4 2
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1860
;1860:			}
LABELV $720
line 1863
;1861:
;1862:			//don't fire again until anim is done
;1863:			pm->ps->weaponTime = pm->ps->torsoTimer;
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
line 1864
;1864:		}
line 1865
;1865:	}
LABELV $642
line 1871
;1866:
;1867:	// *********************************************************
;1868:	// WEAPON_FIRING
;1869:	// *********************************************************
;1870:
;1871:	pm->ps->weaponstate = WEAPON_FIRING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 3
ASGNI4
line 1873
;1872:
;1873:	amount = weaponData[pm->ps->weapon].energyPerShot;
ADDRLP4 28
CNSTI4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData+8
ADDP4
INDIRI4
ASGNI4
line 1875
;1874:
;1875:	addTime = pm->ps->weaponTime;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
line 1877
;1876:
;1877:	pm->ps->saberAttackSequence = pm->ps->torsoAnim;
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 744
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
line 1878
;1878:	if ( !addTime )
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $723
line 1879
;1879:	{
line 1880
;1880:		addTime = weaponData[pm->ps->weapon].fireTime;
ADDRLP4 0
CNSTI4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData+12
ADDP4
INDIRI4
ASGNI4
line 1881
;1881:	}
LABELV $723
line 1882
;1882:	pm->ps->weaponTime = addTime;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1883
;1883:}
LABELV $507
endproc PM_WeaponLightsaber 120 16
export PM_SetSaberMove
proc PM_SetSaberMove 100 16
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 1886
;1884:
;1885:void PM_SetSaberMove(short newMove)
;1886:{
line 1887
;1887:	unsigned int setflags = saberMoveData[newMove].animSetFlags;
ADDRLP4 8
CNSTI4 40
ADDRFP4 0
INDIRI2
CVII4 2
MULI4
ADDRGP4 saberMoveData+16
ADDP4
INDIRU4
ASGNU4
line 1888
;1888:	int	anim = saberMoveData[newMove].animToUse;
ADDRLP4 0
CNSTI4 40
ADDRFP4 0
INDIRI2
CVII4 2
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ASGNI4
line 1889
;1889:	int parts = SETANIM_TORSO;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1891
;1890:	
;1891:	if ( newMove == LS_READY || newMove == LS_A_FLIP_STAB || newMove == LS_A_FLIP_SLASH )
ADDRLP4 12
ADDRFP4 0
INDIRI2
CVII4 2
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $732
ADDRLP4 12
INDIRI4
CNSTI4 16
EQI4 $732
ADDRLP4 12
INDIRI4
CNSTI4 17
NEI4 $729
LABELV $732
line 1892
;1892:	{//finished with a kata (or in a special move) reset attack counter
line 1893
;1893:		pm->ps->saberAttackChainCount = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1308
ADDP4
CNSTI4 0
ASGNI4
line 1894
;1894:	}
ADDRGP4 $730
JUMPV
LABELV $729
line 1895
;1895:	else if ( BG_SaberInAttack( newMove ) )
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 16
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $733
line 1896
;1896:	{//continuing with a kata, increment attack counter
line 1897
;1897:		pm->ps->saberAttackChainCount++;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1308
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1898
;1898:	}
LABELV $733
LABELV $730
line 1900
;1899:
;1900:	if (pm->ps->saberAttackChainCount > 16)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1308
ADDP4
INDIRI4
CNSTI4 16
LEI4 $735
line 1901
;1901:	{ //for the sake of being able to send the value over the net within a reasonable bit count
line 1902
;1902:		pm->ps->saberAttackChainCount = 16;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1308
ADDP4
CNSTI4 16
ASGNI4
line 1903
;1903:	}
LABELV $735
line 1905
;1904:
;1905:	if ( pm->ps->fd.saberAnimLevel > FORCE_LEVEL_1 &&
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 1
LEI4 $737
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 20
ADDRGP4 BG_SaberInIdle
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $737
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 24
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $737
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 28
ADDRGP4 PM_SaberInKnockaway
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $737
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 32
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $737
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 36
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $737
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 40
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $737
line 1907
;1906:		 !BG_SaberInIdle( newMove ) && !PM_SaberInParry( newMove ) && !PM_SaberInKnockaway( newMove ) && !PM_SaberInBrokenParry( newMove ) && !PM_SaberInReflect( newMove ) && !BG_SaberInSpecial(newMove))
;1907:	{//readies, parries and reflections have only 1 level 
line 1909
;1908:		//increment the anim to the next level of saber anims
;1909:		anim += (pm->ps->fd.saberAnimLevel-FORCE_LEVEL_1) * SABER_ANIM_GROUP_SIZE;
ADDRLP4 44
CNSTI4 77
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 44
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
MULI4
ADDRLP4 44
INDIRI4
SUBI4
ADDI4
ASGNI4
line 1910
;1910:	}
LABELV $737
line 1913
;1911:
;1912:	// If the move does the same animation as the last one, we need to force a restart...
;1913:	if ( saberMoveData[pm->ps->saberMove].animToUse == anim && newMove > LS_PUTAWAY)
CNSTI4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $739
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 3
LEI4 $739
line 1914
;1914:	{
line 1915
;1915:		setflags |= SETANIM_FLAG_RESTART;
ADDRLP4 8
ADDRLP4 8
INDIRU4
CNSTU4 4
BORU4
ASGNU4
line 1916
;1916:	}
LABELV $739
line 1919
;1917:
;1918:	//saber torso anims should always be highest priority (4/12/02 - for special anims only)
;1919:	if ( newMove == LS_A_LUNGE 
ADDRLP4 44
ADDRFP4 0
INDIRI2
CVII4 2
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 14
EQI4 $749
ADDRLP4 44
INDIRI4
CNSTI4 15
EQI4 $749
ADDRLP4 44
INDIRI4
CNSTI4 11
EQI4 $749
ADDRLP4 44
INDIRI4
CNSTI4 12
EQI4 $749
ADDRLP4 44
INDIRI4
CNSTI4 13
EQI4 $749
ADDRLP4 44
INDIRI4
CNSTI4 16
EQI4 $749
ADDRLP4 44
INDIRI4
CNSTI4 17
NEI4 $742
LABELV $749
line 1926
;1920:		|| newMove == LS_A_JUMP_T__B_ 
;1921:		|| newMove == LS_A_BACKSTAB
;1922:		|| newMove == LS_A_BACK
;1923:		|| newMove == LS_A_BACK_CR
;1924:		|| newMove == LS_A_FLIP_STAB
;1925:		|| newMove == LS_A_FLIP_SLASH )
;1926:	{
line 1927
;1927:		setflags |= SETANIM_FLAG_OVERRIDE;
ADDRLP4 8
ADDRLP4 8
INDIRU4
CNSTU4 1
BORU4
ASGNU4
line 1928
;1928:	}
LABELV $742
line 1930
;1929:
;1930:	if ( BG_InSaberStandAnim(anim) || anim == BOTH_STAND1 )
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 BG_InSaberStandAnim
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $752
ADDRLP4 0
INDIRI4
CNSTI4 571
NEI4 $750
LABELV $752
line 1931
;1931:	{
line 1932
;1932:		anim = (pm->ps->legsAnim & ~ANIM_TOGGLEBIT);
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 1934
;1933:
;1934:		if ((anim >= BOTH_STAND1 && anim <= BOTH_STAND4TOATTACK2) ||
ADDRLP4 0
INDIRI4
CNSTI4 571
LTI4 $756
ADDRLP4 0
INDIRI4
CNSTI4 592
LEI4 $755
LABELV $756
ADDRLP4 0
INDIRI4
CNSTI4 1091
LTI4 $753
ADDRLP4 0
INDIRI4
CNSTI4 1122
GTI4 $753
LABELV $755
line 1936
;1935:			(anim >= TORSO_DROPWEAP1 && anim <= TORSO_WEAPONIDLE12))
;1936:		{ //If standing then use the special saber stand anim
line 1937
;1937:			anim = PM_GetSaberStance();
ADDRLP4 60
ADDRGP4 PM_GetSaberStance
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 60
INDIRI4
ASGNI4
line 1938
;1938:		}
LABELV $753
line 1940
;1939:
;1940:		if (pm->ps->pm_flags & PMF_DUCKED)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $757
line 1941
;1941:		{ //Playing torso walk anims while crouched makes you look like a monkey
line 1942
;1942:			anim = PM_GetSaberStance();
ADDRLP4 60
ADDRGP4 PM_GetSaberStance
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 60
INDIRI4
ASGNI4
line 1943
;1943:		}
LABELV $757
line 1945
;1944:
;1945:		if (anim == BOTH_WALKBACK1 || anim == BOTH_WALKBACK2)
ADDRLP4 0
INDIRI4
CNSTI4 852
EQI4 $761
ADDRLP4 0
INDIRI4
CNSTI4 853
NEI4 $759
LABELV $761
line 1946
;1946:		{ //normal stance when walking backward so saber doesn't look like it's cutting through leg
line 1947
;1947:			anim = PM_GetSaberStance();
ADDRLP4 64
ADDRGP4 PM_GetSaberStance
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 64
INDIRI4
ASGNI4
line 1948
;1948:		}
LABELV $759
line 1950
;1949:
;1950:		parts = SETANIM_TORSO;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1951
;1951:	}
LABELV $750
line 1953
;1952:
;1953:	if ( newMove == LS_A_LUNGE 
ADDRLP4 52
ADDRFP4 0
INDIRI2
CVII4 2
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 14
EQI4 $769
ADDRLP4 52
INDIRI4
CNSTI4 15
EQI4 $769
ADDRLP4 52
INDIRI4
CNSTI4 11
EQI4 $769
ADDRLP4 52
INDIRI4
CNSTI4 12
EQI4 $769
ADDRLP4 52
INDIRI4
CNSTI4 13
EQI4 $769
ADDRLP4 52
INDIRI4
CNSTI4 16
EQI4 $769
ADDRLP4 52
INDIRI4
CNSTI4 17
NEI4 $762
LABELV $769
line 1960
;1954:		|| newMove == LS_A_JUMP_T__B_ 
;1955:		|| newMove == LS_A_BACKSTAB
;1956:		|| newMove == LS_A_BACK
;1957:		|| newMove == LS_A_BACK_CR
;1958:		|| newMove == LS_A_FLIP_STAB
;1959:		|| newMove == LS_A_FLIP_SLASH )
;1960:	{
line 1961
;1961:		parts = SETANIM_BOTH;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 1962
;1962:	}
ADDRGP4 $763
JUMPV
LABELV $762
line 1963
;1963:	else if ( BG_SpinningSaberAnim( anim ) )
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $770
line 1964
;1964:	{//spins must be played on entire body
line 1965
;1965:		parts = SETANIM_BOTH;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 1966
;1966:	}
ADDRGP4 $771
JUMPV
LABELV $770
line 1967
;1967:	else if ( (!pm->cmd.forwardmove&&!pm->cmd.rightmove&&!pm->cmd.upmove))
ADDRLP4 60
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 64
INDIRI4
NEI4 $772
ADDRLP4 60
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 64
INDIRI4
NEI4 $772
ADDRLP4 60
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
ADDRLP4 64
INDIRI4
NEI4 $772
line 1968
;1968:	{//not trying to run, duck or jump
line 1969
;1969:		if ( !BG_FlippingAnim( pm->ps->legsAnim ) && 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $774
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $774
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 PM_InKnockDown
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $774
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 PM_JumpingAnim
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $774
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $774
ADDRLP4 92
ADDRGP4 PM_GetSaberStance
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $774
ADDRLP4 96
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $774
ADDRLP4 96
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $774
line 1977
;1970:			!BG_InRoll( pm->ps, pm->ps->legsAnim ) && 
;1971:			!PM_InKnockDown( pm->ps ) && 
;1972:			!PM_JumpingAnim( pm->ps->legsAnim ) &&
;1973:			!BG_InSpecialJump( pm->ps->legsAnim ) &&
;1974:			anim != PM_GetSaberStance() &&
;1975:			pm->ps->groundEntityNum != ENTITYNUM_NONE &&
;1976:			!(pm->ps->pm_flags & PMF_DUCKED))
;1977:		{
line 1978
;1978:			parts = SETANIM_BOTH;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 1979
;1979:		}
LABELV $774
line 1980
;1980:	}
LABELV $772
LABELV $771
LABELV $763
line 1982
;1981:
;1982:	PM_SetAnim(parts, anim, setflags, saberMoveData[newMove].blendTime);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRU4
CVUI4 4
ARGI4
CNSTI4 40
ADDRFP4 0
INDIRI2
CVII4 2
MULI4
ADDRGP4 saberMoveData+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1984
;1983:
;1984:	if ( (pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == anim )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ADDRLP4 0
INDIRI4
NEI4 $777
line 1985
;1985:	{//successfully changed anims
line 1988
;1986:	//special check for *starting* a saber swing
;1987:		//playing at attack
;1988:		if ( BG_SaberInAttack( newMove ) || BG_SaberInSpecialAttack( anim ) )
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 68
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $781
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $779
LABELV $781
line 1989
;1989:		{
line 1990
;1990:			if ( pm->ps->saberMove != newMove )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ADDRFP4 0
INDIRI2
CVII4 2
EQI4 $782
line 1991
;1991:			{//wasn't playing that attack before
line 1992
;1992:				PM_AddEvent(EV_SABER_ATTACK);
CNSTI4 26
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1993
;1993:			}
LABELV $782
line 1994
;1994:		}
LABELV $779
line 1996
;1995:
;1996:		pm->ps->saberMove = newMove;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRI2
CVII4 2
ASGNI4
line 1997
;1997:		pm->ps->saberBlocking = saberMoveData[newMove].blocking;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 40
ADDRFP4 0
INDIRI2
CVII4 2
MULI4
ADDRGP4 saberMoveData+24
ADDP4
INDIRI4
ASGNI4
line 1999
;1998:
;1999:		pm->ps->torsoAnim = anim;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2001
;2000:
;2001:		if (pm->ps->weaponTime <= 0)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $785
line 2002
;2002:		{
line 2003
;2003:			pm->ps->saberBlocked = BLOCKED_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 2004
;2004:		}
LABELV $785
line 2005
;2005:	}
LABELV $777
line 2006
;2006:}
LABELV $726
endproc PM_SetSaberMove 100 16
import ValidAnimFileIndex
import PM_SetForceJumpZStart
import PM_SetAnim
import PM_FinishWeaponChange
import PM_BeginWeaponChange
import PM_ForceLegsAnim
import PM_ContinueLegsAnim
import PM_StartTorsoAnim
import BG_CycleInven
import PM_StepSlideMove
import PM_SlideMove
import PM_AddEvent
import PM_AddTouchEnt
import PM_ClipVelocity
import PM_GetSaberStance
import PM_AnimLength
import PM_InRollComplete
import PM_InOnGroundAnim
import PM_SpinningAnim
import PM_LandingAnim
import PM_JumpingAnim
import PM_PainAnim
import PM_InKnockDown
import PM_InSaberAnim
import PM_SaberInStart
import PM_SaberInReflect
import PM_SaberInKnockaway
import PM_SaberInParry
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import forcePowerNeeded
import c_pmove
import pm_flightfriction
import pm_waterfriction
import pm_friction
import pm_flyaccelerate
import pm_wateraccelerate
import pm_airaccelerate
import pm_accelerate
import pm_wadeScale
import pm_swimScale
import pm_duckScale
import pm_stopspeed
import pml
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
LABELV $212
char 1 82
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 32
char 1 76
char 1 76
char 1 0
align 1
LABELV $211
char 1 82
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 32
char 1 76
char 1 82
char 1 0
align 1
LABELV $210
char 1 82
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 32
char 1 85
char 1 76
char 1 0
align 1
LABELV $209
char 1 82
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 32
char 1 85
char 1 82
char 1 0
align 1
LABELV $208
char 1 82
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 32
char 1 84
char 1 111
char 1 112
char 1 0
align 1
LABELV $207
char 1 80
char 1 97
char 1 114
char 1 114
char 1 121
char 1 32
char 1 76
char 1 76
char 1 0
align 1
LABELV $206
char 1 80
char 1 97
char 1 114
char 1 114
char 1 121
char 1 32
char 1 76
char 1 82
char 1 0
align 1
LABELV $205
char 1 80
char 1 97
char 1 114
char 1 114
char 1 121
char 1 32
char 1 85
char 1 76
char 1 0
align 1
LABELV $204
char 1 80
char 1 97
char 1 114
char 1 114
char 1 121
char 1 32
char 1 85
char 1 82
char 1 0
align 1
LABELV $203
char 1 80
char 1 97
char 1 114
char 1 114
char 1 121
char 1 32
char 1 84
char 1 111
char 1 112
char 1 0
align 1
LABELV $202
char 1 75
char 1 110
char 1 111
char 1 99
char 1 107
char 1 32
char 1 76
char 1 76
char 1 0
align 1
LABELV $201
char 1 75
char 1 110
char 1 111
char 1 99
char 1 107
char 1 32
char 1 76
char 1 82
char 1 0
align 1
LABELV $200
char 1 75
char 1 110
char 1 111
char 1 99
char 1 107
char 1 32
char 1 85
char 1 76
char 1 0
align 1
LABELV $199
char 1 75
char 1 110
char 1 111
char 1 99
char 1 107
char 1 32
char 1 85
char 1 82
char 1 0
align 1
LABELV $198
char 1 75
char 1 110
char 1 111
char 1 99
char 1 107
char 1 32
char 1 84
char 1 111
char 1 112
char 1 0
align 1
LABELV $197
char 1 66
char 1 80
char 1 97
char 1 114
char 1 114
char 1 121
char 1 32
char 1 76
char 1 76
char 1 0
align 1
LABELV $196
char 1 66
char 1 80
char 1 97
char 1 114
char 1 114
char 1 121
char 1 32
char 1 66
char 1 111
char 1 116
char 1 0
align 1
LABELV $195
char 1 66
char 1 80
char 1 97
char 1 114
char 1 114
char 1 121
char 1 32
char 1 76
char 1 82
char 1 0
align 1
LABELV $194
char 1 66
char 1 80
char 1 97
char 1 114
char 1 114
char 1 121
char 1 32
char 1 85
char 1 76
char 1 0
align 1
LABELV $193
char 1 66
char 1 80
char 1 97
char 1 114
char 1 114
char 1 121
char 1 32
char 1 85
char 1 82
char 1 0
align 1
LABELV $192
char 1 66
char 1 80
char 1 97
char 1 114
char 1 114
char 1 121
char 1 32
char 1 84
char 1 111
char 1 112
char 1 0
align 1
LABELV $191
char 1 82
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 32
char 1 66
char 1 0
align 1
LABELV $190
char 1 82
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 32
char 1 66
char 1 76
char 1 0
align 1
LABELV $189
char 1 82
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 32
char 1 76
char 1 0
align 1
LABELV $188
char 1 82
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 32
char 1 84
char 1 76
char 1 0
align 1
LABELV $187
char 1 82
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 32
char 1 84
char 1 0
align 1
LABELV $186
char 1 82
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 32
char 1 84
char 1 82
char 1 0
align 1
LABELV $185
char 1 82
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 32
char 1 82
char 1 0
align 1
LABELV $184
char 1 82
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 32
char 1 66
char 1 82
char 1 0
align 1
LABELV $183
char 1 68
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 32
char 1 66
char 1 0
align 1
LABELV $182
char 1 68
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 32
char 1 66
char 1 76
char 1 0
align 1
LABELV $181
char 1 68
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 32
char 1 76
char 1 0
align 1
LABELV $180
char 1 68
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 32
char 1 84
char 1 76
char 1 0
align 1
LABELV $179
char 1 68
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 32
char 1 84
char 1 0
align 1
LABELV $178
char 1 68
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 32
char 1 84
char 1 82
char 1 0
align 1
LABELV $177
char 1 68
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 32
char 1 82
char 1 0
align 1
LABELV $176
char 1 68
char 1 101
char 1 102
char 1 108
char 1 101
char 1 99
char 1 116
char 1 32
char 1 66
char 1 82
char 1 0
align 1
LABELV $175
char 1 66
char 1 111
char 1 117
char 1 110
char 1 99
char 1 101
char 1 32
char 1 66
char 1 76
char 1 0
align 1
LABELV $174
char 1 66
char 1 111
char 1 117
char 1 110
char 1 99
char 1 101
char 1 32
char 1 76
char 1 0
align 1
LABELV $173
char 1 66
char 1 111
char 1 117
char 1 110
char 1 99
char 1 101
char 1 32
char 1 84
char 1 76
char 1 0
align 1
LABELV $172
char 1 66
char 1 111
char 1 117
char 1 110
char 1 99
char 1 101
char 1 32
char 1 84
char 1 0
align 1
LABELV $171
char 1 66
char 1 111
char 1 117
char 1 110
char 1 99
char 1 101
char 1 32
char 1 84
char 1 82
char 1 0
align 1
LABELV $170
char 1 66
char 1 111
char 1 117
char 1 110
char 1 99
char 1 101
char 1 32
char 1 82
char 1 0
align 1
LABELV $169
char 1 66
char 1 111
char 1 117
char 1 110
char 1 99
char 1 101
char 1 32
char 1 66
char 1 82
char 1 0
align 1
LABELV $168
char 1 66
char 1 76
char 1 50
char 1 76
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $167
char 1 66
char 1 76
char 1 50
char 1 84
char 1 76
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $166
char 1 66
char 1 76
char 1 50
char 1 84
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $165
char 1 66
char 1 76
char 1 50
char 1 84
char 1 82
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $164
char 1 66
char 1 76
char 1 50
char 1 82
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $163
char 1 66
char 1 76
char 1 50
char 1 66
char 1 82
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $162
char 1 76
char 1 50
char 1 66
char 1 76
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $161
char 1 76
char 1 50
char 1 84
char 1 76
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $160
char 1 76
char 1 50
char 1 84
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $159
char 1 76
char 1 50
char 1 84
char 1 82
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $158
char 1 76
char 1 50
char 1 82
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $157
char 1 76
char 1 50
char 1 66
char 1 82
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $156
char 1 84
char 1 76
char 1 50
char 1 66
char 1 76
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $155
char 1 84
char 1 76
char 1 50
char 1 76
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $154
char 1 84
char 1 76
char 1 50
char 1 84
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $153
char 1 84
char 1 76
char 1 50
char 1 84
char 1 82
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $152
char 1 84
char 1 76
char 1 50
char 1 82
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $151
char 1 84
char 1 76
char 1 50
char 1 66
char 1 82
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $150
char 1 84
char 1 50
char 1 66
char 1 76
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $149
char 1 84
char 1 50
char 1 76
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $148
char 1 84
char 1 50
char 1 84
char 1 76
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $147
char 1 84
char 1 50
char 1 84
char 1 82
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $146
char 1 84
char 1 50
char 1 82
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $145
char 1 84
char 1 50
char 1 66
char 1 82
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $144
char 1 84
char 1 82
char 1 50
char 1 66
char 1 76
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $143
char 1 84
char 1 82
char 1 50
char 1 76
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $142
char 1 84
char 1 82
char 1 50
char 1 84
char 1 76
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $141
char 1 84
char 1 82
char 1 50
char 1 84
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $140
char 1 84
char 1 82
char 1 50
char 1 82
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $139
char 1 84
char 1 82
char 1 50
char 1 66
char 1 82
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $138
char 1 82
char 1 50
char 1 66
char 1 76
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $137
char 1 82
char 1 50
char 1 76
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $136
char 1 82
char 1 50
char 1 84
char 1 76
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $135
char 1 82
char 1 50
char 1 84
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $134
char 1 82
char 1 50
char 1 84
char 1 82
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $133
char 1 82
char 1 50
char 1 66
char 1 82
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $132
char 1 66
char 1 82
char 1 50
char 1 66
char 1 76
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $131
char 1 66
char 1 82
char 1 50
char 1 76
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $130
char 1 66
char 1 82
char 1 50
char 1 84
char 1 76
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $129
char 1 66
char 1 82
char 1 50
char 1 84
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $128
char 1 66
char 1 82
char 1 50
char 1 84
char 1 82
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $127
char 1 66
char 1 82
char 1 50
char 1 82
char 1 32
char 1 84
char 1 114
char 1 97
char 1 110
char 1 115
char 1 0
align 1
LABELV $126
char 1 84
char 1 50
char 1 66
char 1 32
char 1 82
char 1 101
char 1 116
char 1 0
align 1
LABELV $125
char 1 84
char 1 82
char 1 50
char 1 66
char 1 76
char 1 32
char 1 82
char 1 101
char 1 116
char 1 0
align 1
LABELV $124
char 1 82
char 1 50
char 1 76
char 1 32
char 1 82
char 1 101
char 1 116
char 1 0
align 1
LABELV $123
char 1 66
char 1 82
char 1 50
char 1 84
char 1 76
char 1 32
char 1 82
char 1 101
char 1 116
char 1 0
align 1
LABELV $122
char 1 66
char 1 76
char 1 50
char 1 84
char 1 82
char 1 32
char 1 82
char 1 101
char 1 116
char 1 0
align 1
LABELV $121
char 1 76
char 1 50
char 1 82
char 1 32
char 1 82
char 1 101
char 1 116
char 1 0
align 1
LABELV $120
char 1 84
char 1 76
char 1 50
char 1 66
char 1 82
char 1 32
char 1 82
char 1 101
char 1 116
char 1 0
align 1
LABELV $119
char 1 84
char 1 50
char 1 66
char 1 32
char 1 83
char 1 116
char 1 0
align 1
LABELV $118
char 1 84
char 1 82
char 1 50
char 1 66
char 1 76
char 1 32
char 1 83
char 1 116
char 1 0
align 1
LABELV $117
char 1 82
char 1 50
char 1 76
char 1 32
char 1 83
char 1 116
char 1 0
align 1
LABELV $116
char 1 66
char 1 82
char 1 50
char 1 84
char 1 76
char 1 32
char 1 83
char 1 116
char 1 0
align 1
LABELV $115
char 1 66
char 1 76
char 1 50
char 1 84
char 1 82
char 1 32
char 1 83
char 1 116
char 1 0
align 1
LABELV $114
char 1 76
char 1 50
char 1 82
char 1 32
char 1 83
char 1 116
char 1 0
align 1
LABELV $113
char 1 84
char 1 76
char 1 50
char 1 66
char 1 82
char 1 32
char 1 83
char 1 116
char 1 0
align 1
LABELV $112
char 1 70
char 1 108
char 1 105
char 1 112
char 1 32
char 1 83
char 1 108
char 1 97
char 1 115
char 1 104
char 1 0
align 1
LABELV $111
char 1 70
char 1 108
char 1 105
char 1 112
char 1 32
char 1 83
char 1 116
char 1 97
char 1 98
char 1 0
align 1
LABELV $110
char 1 74
char 1 117
char 1 109
char 1 112
char 1 32
char 1 65
char 1 116
char 1 116
char 1 0
align 1
LABELV $109
char 1 76
char 1 117
char 1 110
char 1 103
char 1 101
char 1 32
char 1 65
char 1 116
char 1 116
char 1 0
align 1
LABELV $108
char 1 67
char 1 82
char 1 32
char 1 66
char 1 97
char 1 99
char 1 107
char 1 32
char 1 65
char 1 116
char 1 116
char 1 0
align 1
LABELV $107
char 1 66
char 1 97
char 1 99
char 1 107
char 1 32
char 1 65
char 1 116
char 1 116
char 1 0
align 1
LABELV $106
char 1 66
char 1 97
char 1 99
char 1 107
char 1 32
char 1 83
char 1 116
char 1 97
char 1 98
char 1 0
align 1
LABELV $105
char 1 84
char 1 50
char 1 66
char 1 32
char 1 65
char 1 116
char 1 116
char 1 0
align 1
LABELV $104
char 1 84
char 1 82
char 1 50
char 1 66
char 1 76
char 1 32
char 1 65
char 1 116
char 1 116
char 1 0
align 1
LABELV $103
char 1 82
char 1 50
char 1 76
char 1 32
char 1 65
char 1 116
char 1 116
char 1 0
align 1
LABELV $102
char 1 66
char 1 82
char 1 50
char 1 84
char 1 76
char 1 32
char 1 65
char 1 116
char 1 116
char 1 0
align 1
LABELV $101
char 1 66
char 1 76
char 1 50
char 1 84
char 1 82
char 1 32
char 1 65
char 1 116
char 1 116
char 1 0
align 1
LABELV $100
char 1 76
char 1 50
char 1 82
char 1 32
char 1 65
char 1 116
char 1 116
char 1 0
align 1
LABELV $99
char 1 84
char 1 76
char 1 50
char 1 66
char 1 82
char 1 32
char 1 65
char 1 116
char 1 116
char 1 0
align 1
LABELV $98
char 1 80
char 1 117
char 1 116
char 1 97
char 1 119
char 1 97
char 1 121
char 1 0
align 1
LABELV $97
char 1 68
char 1 114
char 1 97
char 1 119
char 1 0
align 1
LABELV $96
char 1 82
char 1 101
char 1 97
char 1 100
char 1 121
char 1 0
align 1
LABELV $95
char 1 78
char 1 111
char 1 110
char 1 101
char 1 0
