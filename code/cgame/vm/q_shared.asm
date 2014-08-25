export GetIDForString
code
proc GetIDForString 8 8
file "../../game/q_shared.c"
line 14
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// q_shared.c -- stateless support routines that are included in each code dll
;4:#include "q_shared.h"
;5:
;6:/*
;7:-------------------------
;8:GetIDForString 
;9:-------------------------
;10:*/
;11:
;12:
;13:int GetIDForString ( stringID_table_t *table, const char *string )
;14:{
line 15
;15:	int	index = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $38
JUMPV
LABELV $37
line 19
;16:
;17:	while ( ( table[index].name != NULL ) &&
;18:			( table[index].name[0] != 0 ) )
;19:	{
line 20
;20:		if ( !Q_stricmp( table[index].name, string ) )
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $40
line 21
;21:			return table[index].id;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
RETI4
ADDRGP4 $36
JUMPV
LABELV $40
line 23
;22:
;23:		index++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 24
;24:	}
LABELV $38
line 17
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $42
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $37
LABELV $42
line 26
;25:
;26:	return -1;
CNSTI4 -1
RETI4
LABELV $36
endproc GetIDForString 8 8
export GetStringForID
proc GetStringForID 8 0
line 36
;27:}
;28:
;29:/*
;30:-------------------------
;31:GetStringForID
;32:-------------------------
;33:*/
;34:
;35:const char *GetStringForID( stringID_table_t *table, int id )
;36:{
line 37
;37:	int	index = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $45
JUMPV
LABELV $44
line 41
;38:
;39:	while ( ( table[index].name != NULL ) &&
;40:			( table[index].name[0] != 0 ) )
;41:	{
line 42
;42:		if ( table[index].id == id )
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $47
line 43
;43:			return table[index].name;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $43
JUMPV
LABELV $47
line 45
;44:
;45:		index++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 46
;46:	}
LABELV $45
line 39
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $49
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $44
LABELV $49
line 48
;47:
;48:	return NULL;
CNSTP4 0
RETP4
LABELV $43
endproc GetStringForID 8 0
export Com_Clamp
proc Com_Clamp 0 0
line 52
;49:}
;50:
;51:
;52:float Com_Clamp( float min, float max, float value ) {
line 53
;53:	if ( value < min ) {
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRF4
GEF4 $51
line 54
;54:		return min;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $50
JUMPV
LABELV $51
line 56
;55:	}
;56:	if ( value > max ) {
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $53
line 57
;57:		return max;
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $50
JUMPV
LABELV $53
line 59
;58:	}
;59:	return value;
ADDRFP4 8
INDIRF4
RETF4
LABELV $50
endproc Com_Clamp 0 0
export Q_stristr
proc Q_stristr 36 12
line 63
;60:}
;61:
;62://cm ClanTag Check
;63:char *Q_stristr(const char *s, const char *find) {
line 67
;64:	char c, sc;
;65:	size_t len;
;66:
;67:	if ((c = *find++) != 0)
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 1
ADDRLP4 12
INDIRI1
ASGNI1
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $56
line 68
;68:	{
line 69
;69:		if (c >= 'a' && c <= 'z')
ADDRLP4 16
ADDRLP4 1
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 97
LTI4 $58
ADDRLP4 16
INDIRI4
CNSTI4 122
GTI4 $58
line 70
;70:		{
line 71
;71:			c -= ('a' - 'A');
ADDRLP4 1
ADDRLP4 1
INDIRI1
CVII4 1
CNSTI4 32
SUBI4
CVII1 4
ASGNI1
line 72
;72:		}
LABELV $58
line 73
;73:		len = strlen(find);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
LABELV $60
line 75
;74:		do
;75:		{
LABELV $63
line 77
;76:			do
;77:			{
line 78
;78:				if ((sc = *s++) == 0)
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 0
ADDRLP4 28
INDIRI1
ASGNI1
ADDRLP4 28
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $66
line 79
;79:					return NULL;
CNSTP4 0
RETP4
ADDRGP4 $55
JUMPV
LABELV $66
line 80
;80:				if (sc >= 'a' && sc <= 'z')
ADDRLP4 32
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 97
LTI4 $68
ADDRLP4 32
INDIRI4
CNSTI4 122
GTI4 $68
line 81
;81:				{
line 82
;82:					sc -= ('a' - 'A');
ADDRLP4 0
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
SUBI4
CVII1 4
ASGNI1
line 83
;83:				}
LABELV $68
line 84
;84:			} while (sc != c);
LABELV $64
ADDRLP4 0
INDIRI1
CVII4 1
ADDRLP4 1
INDIRI1
CVII4 1
NEI4 $63
line 85
;85:		} while (Q_stricmpn(s, find, len) != 0);
LABELV $61
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $60
line 86
;86:		s--;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
line 87
;87:	}
LABELV $56
line 88
;88:	return (char *)s;
ADDRFP4 0
INDIRP4
RETP4
LABELV $55
endproc Q_stristr 36 12
export COM_SkipPath
proc COM_SkipPath 4 0
line 98
;89:}
;90:
;91:
;92:/*
;93:============
;94:COM_SkipPath
;95:============
;96:*/
;97:char *COM_SkipPath (char *pathname)
;98:{
line 101
;99:	char	*last;
;100:	
;101:	last = pathname;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $72
JUMPV
LABELV $71
line 103
;102:	while (*pathname)
;103:	{
line 104
;104:		if (*pathname=='/')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $74
line 105
;105:			last = pathname+1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $74
line 106
;106:		pathname++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 107
;107:	}
LABELV $72
line 102
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $71
line 108
;108:	return last;
ADDRLP4 0
INDIRP4
RETP4
LABELV $70
endproc COM_SkipPath 4 0
export COM_StripExtension
proc COM_StripExtension 12 0
line 116
;109:}
;110:
;111:/*
;112:============
;113:COM_StripExtension
;114:============
;115:*/
;116:void COM_StripExtension( const char *in, char *out ) {
ADDRGP4 $78
JUMPV
LABELV $77
line 117
;117:	while ( *in && *in != '.' ) {
line 118
;118:		*out++ = *in++;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI1
ASGNI1
line 119
;119:	}
LABELV $78
line 117
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $80
ADDRLP4 0
INDIRI4
CNSTI4 46
NEI4 $77
LABELV $80
line 120
;120:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 121
;121:}
LABELV $76
endproc COM_StripExtension 12 0
export COM_DefaultExtension
proc COM_DefaultExtension 76 20
line 129
;122:
;123:
;124:/*
;125:==================
;126:COM_DefaultExtension
;127:==================
;128:*/
;129:void COM_DefaultExtension (char *path, int maxSize, const char *extension ) {
line 137
;130:	char	oldPath[MAX_QPATH];
;131:	char    *src;
;132:
;133://
;134:// if path doesn't have a .EXT, append extension
;135:// (extension should include the .)
;136://
;137:	src = path + strlen(path) - 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 68
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 -1
ADDP4
ASGNP4
ADDRGP4 $83
JUMPV
LABELV $82
line 139
;138:
;139:	while (*src != '/' && src != path) {
line 140
;140:		if ( *src == '.' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $85
line 141
;141:			return;                 // it has an extension
ADDRGP4 $81
JUMPV
LABELV $85
line 143
;142:		}
;143:		src--;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
line 144
;144:	}
LABELV $83
line 139
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
EQI4 $87
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $82
LABELV $87
line 146
;145:
;146:	Q_strncpyz( oldPath, path, sizeof( oldPath ) );
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 147
;147:	Com_sprintf( path, maxSize, "%s%s", oldPath, extension );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $88
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 148
;148:}
LABELV $81
endproc COM_DefaultExtension 76 20
export ShortSwap
proc ShortSwap 2 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 180
;149:
;150:/*
;151:============================================================================
;152:
;153:					BYTE ORDER FUNCTIONS
;154:
;155:============================================================================
;156:*/
;157:/*
;158:// can't just use function pointers, or dll linkage can
;159:// mess up when qcommon is included in multiple places
;160:static short	(*_BigShort) (short l);
;161:static short	(*_LittleShort) (short l);
;162:static int		(*_BigLong) (int l);
;163:static int		(*_LittleLong) (int l);
;164:static qint64	(*_BigLong64) (qint64 l);
;165:static qint64	(*_LittleLong64) (qint64 l);
;166:static float	(*_BigFloat) (const float *l);
;167:static float	(*_LittleFloat) (const float *l);
;168:
;169:short	BigShort(short l){return _BigShort(l);}
;170:short	LittleShort(short l) {return _LittleShort(l);}
;171:int		BigLong (int l) {return _BigLong(l);}
;172:int		LittleLong (int l) {return _LittleLong(l);}
;173:qint64 	BigLong64 (qint64 l) {return _BigLong64(l);}
;174:qint64 	LittleLong64 (qint64 l) {return _LittleLong64(l);}
;175:float	BigFloat (const float *l) {return _BigFloat(l);}
;176:float	LittleFloat (const float *l) {return _LittleFloat(l);}
;177:*/
;178:
;179:short   ShortSwap (short l)
;180:{
line 183
;181:	byte    b1,b2;
;182:
;183:	b1 = l&255;
ADDRLP4 0
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 184
;184:	b2 = (l>>8)&255;
ADDRLP4 1
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 186
;185:
;186:	return (b1<<8) + b2;
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 8
LSHI4
ADDRLP4 1
INDIRU1
CVUI4 1
ADDI4
CVII2 4
CVII4 2
RETI4
LABELV $89
endproc ShortSwap 2 0
export ShortNoSwap
proc ShortNoSwap 0 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 190
;187:}
;188:
;189:short	ShortNoSwap (short l)
;190:{
line 191
;191:	return l;
ADDRFP4 0
INDIRI2
CVII4 2
RETI4
LABELV $90
endproc ShortNoSwap 0 0
export LongSwap
proc LongSwap 4 0
line 195
;192:}
;193:
;194:int    LongSwap (int l)
;195:{
line 198
;196:	byte    b1,b2,b3,b4;
;197:
;198:	b1 = l&255;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 199
;199:	b2 = (l>>8)&255;
ADDRLP4 1
ADDRFP4 0
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 200
;200:	b3 = (l>>16)&255;
ADDRLP4 2
ADDRFP4 0
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 201
;201:	b4 = (l>>24)&255;
ADDRLP4 3
ADDRFP4 0
INDIRI4
CNSTI4 24
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 203
;202:
;203:	return ((int)b1<<24) + ((int)b2<<16) + ((int)b3<<8) + b4;
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 24
LSHI4
ADDRLP4 1
INDIRU1
CVUI4 1
CNSTI4 16
LSHI4
ADDI4
ADDRLP4 2
INDIRU1
CVUI4 1
CNSTI4 8
LSHI4
ADDI4
ADDRLP4 3
INDIRU1
CVUI4 1
ADDI4
RETI4
LABELV $91
endproc LongSwap 4 0
export LongNoSwap
proc LongNoSwap 0 0
line 207
;204:}
;205:
;206:int	LongNoSwap (int l)
;207:{
line 208
;208:	return l;
ADDRFP4 0
INDIRI4
RETI4
LABELV $92
endproc LongNoSwap 0 0
export Long64Swap
proc Long64Swap 8 0
line 212
;209:}
;210:
;211:qint64 Long64Swap (qint64 ll)
;212:{
line 215
;213:	qint64	result;
;214:
;215:	result.b0 = ll.b7;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 7
ADDP4
INDIRU1
ASGNU1
line 216
;216:	result.b1 = ll.b6;
ADDRLP4 0+1
ADDRFP4 4
INDIRP4
CNSTI4 6
ADDP4
INDIRU1
ASGNU1
line 217
;217:	result.b2 = ll.b5;
ADDRLP4 0+2
ADDRFP4 4
INDIRP4
CNSTI4 5
ADDP4
INDIRU1
ASGNU1
line 218
;218:	result.b3 = ll.b4;
ADDRLP4 0+3
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRU1
ASGNU1
line 219
;219:	result.b4 = ll.b3;
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 3
ADDP4
INDIRU1
ASGNU1
line 220
;220:	result.b5 = ll.b2;
ADDRLP4 0+5
ADDRFP4 4
INDIRP4
CNSTI4 2
ADDP4
INDIRU1
ASGNU1
line 221
;221:	result.b6 = ll.b1;
ADDRLP4 0+6
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
ASGNU1
line 222
;222:	result.b7 = ll.b0;
ADDRLP4 0+7
ADDRFP4 4
INDIRP4
INDIRU1
ASGNU1
line 224
;223:
;224:	return result;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 8
LABELV $93
endproc Long64Swap 8 0
export Long64NoSwap
proc Long64NoSwap 0 0
line 228
;225:}
;226:
;227:qint64 Long64NoSwap (qint64 ll)
;228:{
line 229
;229:	return ll;
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 8
LABELV $102
endproc Long64NoSwap 0 0
export FloatSwap
proc FloatSwap 12 4
line 237
;230:}
;231:
;232:typedef union {
;233:    float	f;
;234:    unsigned int i;
;235:} _FloatByteUnion;
;236:
;237:float FloatSwap (const float *f) {
line 241
;238:	const _FloatByteUnion *in;
;239:	_FloatByteUnion out;
;240:
;241:	in = (_FloatByteUnion *)f;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 242
;242:	out.i = LongSwap(in->i);
ADDRLP4 0
INDIRP4
INDIRU4
CVUI4 4
ARGI4
ADDRLP4 8
ADDRGP4 LongSwap
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
CVIU4 4
ASGNU4
line 244
;243:
;244:	return out.f;
ADDRLP4 4
INDIRF4
RETF4
LABELV $105
endproc FloatSwap 12 4
export FloatNoSwap
proc FloatNoSwap 0 0
line 248
;245:}
;246:
;247:float FloatNoSwap (const float *f)
;248:{
line 249
;249:	return *f;
ADDRFP4 0
INDIRP4
INDIRF4
RETF4
LABELV $106
endproc FloatNoSwap 0 0
export COM_BeginParseSession
proc COM_BeginParseSession 0 16
line 302
;250:}
;251:
;252:/*
;253:================
;254:Swap_Init
;255:================
;256:*/
;257:/*
;258:void Swap_Init (void)
;259:{
;260:	byte	swaptest[2] = {1,0};
;261:
;262:// set the byte swapping variables in a portable manner	
;263:	if ( *(short *)swaptest == 1)
;264:	{
;265:		_BigShort = ShortSwap;
;266:		_LittleShort = ShortNoSwap;
;267:		_BigLong = LongSwap;
;268:		_LittleLong = LongNoSwap;
;269:		_BigLong64 = Long64Swap;
;270:		_LittleLong64 = Long64NoSwap;
;271:		_BigFloat = FloatSwap;
;272:		_LittleFloat = FloatNoSwap;
;273:	}
;274:	else
;275:	{
;276:		_BigShort = ShortNoSwap;
;277:		_LittleShort = ShortSwap;
;278:		_BigLong = LongNoSwap;
;279:		_LittleLong = LongSwap;
;280:		_BigLong64 = Long64NoSwap;
;281:		_LittleLong64 = Long64Swap;
;282:		_BigFloat = FloatNoSwap;
;283:		_LittleFloat = FloatSwap;
;284:	}
;285:
;286:}
;287:*/
;288:
;289:/*
;290:============================================================================
;291:
;292:PARSING
;293:
;294:============================================================================
;295:*/
;296:
;297:static	char	com_token[MAX_TOKEN_CHARS];
;298:static	char	com_parsename[MAX_TOKEN_CHARS];
;299:static	int		com_lines;
;300:
;301:void COM_BeginParseSession( const char *name )
;302:{
line 303
;303:	com_lines = 0;
ADDRGP4 com_lines
CNSTI4 0
ASGNI4
line 304
;304:	Com_sprintf(com_parsename, sizeof(com_parsename), "%s", name);
ADDRGP4 com_parsename
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $108
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 305
;305:}
LABELV $107
endproc COM_BeginParseSession 0 16
export COM_GetCurrentParseLine
proc COM_GetCurrentParseLine 0 0
line 308
;306:
;307:int COM_GetCurrentParseLine( void )
;308:{
line 309
;309:	return com_lines;
ADDRGP4 com_lines
INDIRI4
RETI4
LABELV $109
endproc COM_GetCurrentParseLine 0 0
export COM_Parse
proc COM_Parse 4 8
line 313
;310:}
;311:
;312:char *COM_Parse( const char **data_p )
;313:{
line 314
;314:	return COM_ParseExt( data_p, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $110
endproc COM_Parse 4 8
bss
align 1
LABELV $112
skip 4096
export COM_ParseError
code
proc COM_ParseError 4 16
line 318
;315:}
;316:
;317:void COM_ParseError( char *format, ... )
;318:{
line 322
;319:	va_list argptr;
;320:	static char string[4096];
;321:
;322:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 323
;323:	vsprintf (string, format, argptr);
ADDRGP4 $112
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 324
;324:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 326
;325:
;326:	Com_Printf("ERROR: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $114
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $112
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 327
;327:}
LABELV $111
endproc COM_ParseError 4 16
bss
align 1
LABELV $116
skip 4096
export COM_ParseWarning
code
proc COM_ParseWarning 4 16
line 330
;328:
;329:void COM_ParseWarning( char *format, ... )
;330:{
line 334
;331:	va_list argptr;
;332:	static char string[4096];
;333:
;334:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 335
;335:	vsprintf (string, format, argptr);
ADDRGP4 $116
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 336
;336:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 338
;337:
;338:	Com_Printf("WARNING: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $118
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $116
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 339
;339:}
LABELV $115
endproc COM_ParseWarning 4 16
export SkipWhitespace
proc SkipWhitespace 8 0
line 353
;340:
;341:/*
;342:==============
;343:COM_Parse
;344:
;345:Parse a token out of a string
;346:Will never return NULL, just empty strings
;347:
;348:If "allowLineBreaks" is qtrue then an empty
;349:string will be returned if the next token is
;350:a newline.
;351:==============
;352:*/
;353:const char *SkipWhitespace( const char *data, qboolean *hasNewLines ) {
ADDRGP4 $121
JUMPV
LABELV $120
line 356
;354:	int c;
;355:
;356:	while( (c = *data) <= ' ') {
line 357
;357:		if( !c ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $123
line 358
;358:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $119
JUMPV
LABELV $123
line 360
;359:		}
;360:		if( c == '\n' ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $125
line 361
;361:			com_lines++;
ADDRLP4 4
ADDRGP4 com_lines
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 362
;362:			*hasNewLines = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 363
;363:		}
LABELV $125
line 364
;364:		data++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 365
;365:	}
LABELV $121
line 356
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 32
LEI4 $120
line 367
;366:
;367:	return data;
ADDRFP4 0
INDIRP4
RETP4
LABELV $119
endproc SkipWhitespace 8 0
export COM_Compress
proc COM_Compress 48 0
line 370
;368:}
;369:
;370:int COM_Compress( char *data_p ) {
line 373
;371:	char *in, *out;
;372:	int c;
;373:	qboolean newline = qfalse, whitespace = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
line 375
;374:	
;375:	in = out = data_p;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 376
;376:	if (in) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $128
ADDRGP4 $131
JUMPV
LABELV $130
line 377
;377:		while ((c = *in) != 0) {
line 379
;378:			// skip double slash comments
;379:			if ( c == '/' && in[1] == '/' ) {
ADDRLP4 24
CNSTI4 47
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $133
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
NEI4 $133
ADDRGP4 $136
JUMPV
LABELV $135
line 380
;380:				while (*in && *in != '\n') {
line 381
;381:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 382
;382:				}
LABELV $136
line 380
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $138
ADDRLP4 28
INDIRI4
CNSTI4 10
NEI4 $135
LABELV $138
line 384
;383:				// skip /* */ comments
;384:			} else if ( c == '/' && in[1] == '*' ) {
ADDRGP4 $134
JUMPV
LABELV $133
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $139
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $139
ADDRGP4 $142
JUMPV
LABELV $141
line 386
;385:				while ( *in && ( *in != '*' || in[1] != '/' ) ) 
;386:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $142
line 385
ADDRLP4 32
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $144
ADDRLP4 32
INDIRI4
CNSTI4 42
NEI4 $141
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $141
LABELV $144
line 387
;387:				if ( *in ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $140
line 388
;388:					in += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 390
;389:				// record when we hit a newline
;390:			} else if ( c == '\n' || c == '\r' ) {
ADDRGP4 $140
JUMPV
LABELV $139
ADDRLP4 4
INDIRI4
CNSTI4 10
EQI4 $149
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $147
LABELV $149
line 391
;391:				newline = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 392
;392:				in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 394
;393:				// record when we hit whitespace
;394:			} else if ( c == ' ' || c == '\t') {
ADDRGP4 $148
JUMPV
LABELV $147
ADDRLP4 4
INDIRI4
CNSTI4 32
EQI4 $152
ADDRLP4 4
INDIRI4
CNSTI4 9
NEI4 $150
LABELV $152
line 395
;395:				whitespace = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 396
;396:				in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 398
;397:				// an actual token
;398:			} else {
ADDRGP4 $151
JUMPV
LABELV $150
line 400
;399:				// if we have a pending newline, emit it (and it counts as whitespace)
;400:				if (newline) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $153
line 401
;401:					*out++ = '\n';
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI1 10
ASGNI1
line 402
;402:					newline = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 403
;403:					whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 404
;404:				} if (whitespace) {
LABELV $153
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $155
line 405
;405:					*out++ = ' ';
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI1 32
ASGNI1
line 406
;406:					whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 407
;407:				}
LABELV $155
line 410
;408:				
;409:				// copy quoted strings unmolested
;410:				if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $157
line 411
;411:					*out++ = c;
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 412
;412:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $160
JUMPV
LABELV $159
line 413
;413:					while (1) {
line 414
;414:						c = *in;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 415
;415:						if (c && c != '"') {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $161
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $161
line 416
;416:							*out++ = c;
ADDRLP4 44
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 417
;417:							in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 418
;418:						} else {
line 419
;419:							break;
LABELV $163
line 421
;420:						}
;421:					}
LABELV $160
line 413
ADDRGP4 $159
JUMPV
LABELV $161
line 422
;422:					if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $158
line 423
;423:						*out++ = c;
ADDRLP4 40
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 40
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 424
;424:						in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 425
;425:					}
line 426
;426:				} else {
ADDRGP4 $158
JUMPV
LABELV $157
line 427
;427:					*out = c;
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 428
;428:					out++;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 429
;429:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 430
;430:				}
LABELV $158
line 431
;431:			}
LABELV $151
LABELV $148
LABELV $140
LABELV $134
line 432
;432:		}
LABELV $131
line 377
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $130
line 433
;433:	}
LABELV $128
line 434
;434:	*out = 0;
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 435
;435:	return out - data_p;
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
RETI4
LABELV $127
endproc COM_Compress 48 0
export COM_ParseExt
proc COM_ParseExt 36 8
line 439
;436:}
;437:
;438:char *COM_ParseExt( const char **data_p, qboolean allowLineBreaks )
;439:{
line 440
;440:	int c = 0, len;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 441
;441:	qboolean hasNewLines = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 444
;442:	const char *data;
;443:
;444:	data = *data_p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 445
;445:	len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 446
;446:	com_token[0] = 0;
ADDRGP4 com_token
CNSTI1 0
ASGNI1
line 449
;447:
;448:	// make sure incoming data is valid
;449:	if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $170
line 450
;450:	{
line 451
;451:		*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 452
;452:		return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $166
JUMPV
LABELV $169
line 456
;453:	}
;454:
;455:	while ( 1 )
;456:	{
line 458
;457:		// skip whitespace
;458:		data = SkipWhitespace( data, &hasNewLines );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ADDRGP4 SkipWhitespace
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 459
;459:		if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $172
line 460
;460:		{
line 461
;461:			*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 462
;462:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $166
JUMPV
LABELV $172
line 464
;463:		}
;464:		if ( hasNewLines && !allowLineBreaks )
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $174
ADDRFP4 4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $174
line 465
;465:		{
line 466
;466:			*data_p = data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 467
;467:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $166
JUMPV
LABELV $174
line 470
;468:		}
;469:
;470:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 473
;471:
;472:		// skip double slash comments
;473:		if ( c == '/' && data[1] == '/' )
ADDRLP4 24
CNSTI4 47
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $176
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
NEI4 $176
line 474
;474:		{
line 475
;475:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $179
JUMPV
LABELV $178
line 476
;476:			while (*data && *data != '\n') {
line 477
;477:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 478
;478:			}
LABELV $179
line 476
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $181
ADDRLP4 28
INDIRI4
CNSTI4 10
NEI4 $178
LABELV $181
line 479
;479:		}
ADDRGP4 $177
JUMPV
LABELV $176
line 481
;480:		// skip /* */ comments
;481:		else if ( c=='/' && data[1] == '*' ) 
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $171
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $171
line 482
;482:		{
line 483
;483:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $185
JUMPV
LABELV $184
line 485
;484:			while ( *data && ( *data != '*' || data[1] != '/' ) ) 
;485:			{
line 486
;486:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 487
;487:			}
LABELV $185
line 484
ADDRLP4 32
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $187
ADDRLP4 32
INDIRI4
CNSTI4 42
NEI4 $184
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $184
LABELV $187
line 488
;488:			if ( *data ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $183
line 489
;489:			{
line 490
;490:				data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 491
;491:			}
line 492
;492:		}
line 494
;493:		else
;494:		{
line 495
;495:			break;
LABELV $183
LABELV $177
line 497
;496:		}
;497:	}
LABELV $170
line 455
ADDRGP4 $169
JUMPV
LABELV $171
line 500
;498:
;499:	// handle quoted strings
;500:	if (c == '\"')
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $190
line 501
;501:	{
line 502
;502:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $193
JUMPV
LABELV $192
line 504
;503:		while (1)
;504:		{
line 505
;505:			c = *data++;
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 506
;506:			if (c=='\"' || !c)
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $197
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $195
LABELV $197
line 507
;507:			{
line 508
;508:				com_token[len] = 0;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 509
;509:				*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 510
;510:				return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $166
JUMPV
LABELV $195
line 512
;511:			}
;512:			if (len < MAX_TOKEN_CHARS)
ADDRLP4 8
INDIRI4
CNSTI4 1024
GEI4 $198
line 513
;513:			{
line 514
;514:				com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 515
;515:				len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 516
;516:			}
LABELV $198
line 517
;517:		}
LABELV $193
line 503
ADDRGP4 $192
JUMPV
line 518
;518:	}
LABELV $190
LABELV $200
line 522
;519:
;520:	// parse a regular word
;521:	do
;522:	{
line 523
;523:		if (len < MAX_TOKEN_CHARS)
ADDRLP4 8
INDIRI4
CNSTI4 1024
GEI4 $203
line 524
;524:		{
line 525
;525:			com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 526
;526:			len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 527
;527:		}
LABELV $203
line 528
;528:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 529
;529:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 530
;530:		if ( c == '\n' )
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $205
line 531
;531:			com_lines++;
ADDRLP4 16
ADDRGP4 com_lines
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $205
line 532
;532:	} while (c>32);
LABELV $201
ADDRLP4 4
INDIRI4
CNSTI4 32
GTI4 $200
line 534
;533:
;534:	if (len == MAX_TOKEN_CHARS)
ADDRLP4 8
INDIRI4
CNSTI4 1024
NEI4 $207
line 535
;535:	{
line 537
;536://		Com_Printf ("Token exceeded %i chars, discarded.\n", MAX_TOKEN_CHARS);
;537:		len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 538
;538:	}
LABELV $207
line 539
;539:	com_token[len] = 0;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 541
;540:
;541:	*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 542
;542:	return com_token;
ADDRGP4 com_token
RETP4
LABELV $166
endproc COM_ParseExt 36 8
export COM_ParseString
proc COM_ParseString 4 8
line 606
;543:}
;544:
;545:
;546:#if 0
;547:// no longer used
;548:/*
;549:===============
;550:COM_ParseInfos
;551:===============
;552:*/
;553:int COM_ParseInfos( char *buf, int max, char infos[][MAX_INFO_STRING] ) {
;554:	char	*token;
;555:	int		count;
;556:	char	key[MAX_TOKEN_CHARS];
;557:
;558:	count = 0;
;559:
;560:	while ( 1 ) {
;561:		token = COM_Parse( &buf );
;562:		if ( !token[0] ) {
;563:			break;
;564:		}
;565:		if ( strcmp( token, "{" ) ) {
;566:			Com_Printf( "Missing { in info file\n" );
;567:			break;
;568:		}
;569:
;570:		if ( count == max ) {
;571:			Com_Printf( "Max infos exceeded\n" );
;572:			break;
;573:		}
;574:
;575:		infos[count][0] = 0;
;576:		while ( 1 ) {
;577:			token = COM_ParseExt( &buf, qtrue );
;578:			if ( !token[0] ) {
;579:				Com_Printf( "Unexpected end of info file\n" );
;580:				break;
;581:			}
;582:			if ( !strcmp( token, "}" ) ) {
;583:				break;
;584:			}
;585:			Q_strncpyz( key, token, sizeof( key ) );
;586:
;587:			token = COM_ParseExt( &buf, qfalse );
;588:			if ( !token[0] ) {
;589:				strcpy( token, "<NULL>" );
;590:			}
;591:			Info_SetValueForKey( infos[count], key, token );
;592:		}
;593:		count++;
;594:	}
;595:
;596:	return count;
;597:}
;598:#endif
;599:
;600:/*
;601:===============
;602:COM_ParseString
;603:===============
;604:*/
;605:qboolean COM_ParseString( const char **data, const char **s ) 
;606:{
line 608
;607://	*s = COM_ParseExt( data, qtrue );
;608:	*s = COM_ParseExt( data, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 609
;609:	if ( s[0] == 0 ) 
ADDRFP4 4
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $210
line 610
;610:	{
line 611
;611:		Com_Printf("unexpected EOF\n");
ADDRGP4 $212
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 612
;612:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $209
JUMPV
LABELV $210
line 614
;613:	}
;614:	return qfalse;
CNSTI4 0
RETI4
LABELV $209
endproc COM_ParseString 4 8
export COM_ParseInt
proc COM_ParseInt 12 8
line 623
;615:}
;616:
;617:/*
;618:===============
;619:COM_ParseInt
;620:===============
;621:*/
;622:qboolean COM_ParseInt( const char **data, int *i ) 
;623:{
line 626
;624:	const char	*token;
;625:
;626:	token = COM_ParseExt( data, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 627
;627:	if ( token[0] == 0 ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $214
line 628
;628:	{
line 629
;629:		Com_Printf( "unexpected EOF\n" );
ADDRGP4 $212
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 630
;630:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $213
JUMPV
LABELV $214
line 633
;631:	}
;632:
;633:	*i = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 634
;634:	return qfalse;
CNSTI4 0
RETI4
LABELV $213
endproc COM_ParseInt 12 8
export COM_ParseFloat
proc COM_ParseFloat 12 8
line 643
;635:}
;636:
;637:/*
;638:===============
;639:COM_ParseFloat
;640:===============
;641:*/
;642:qboolean COM_ParseFloat( const char **data, float *f ) 
;643:{
line 646
;644:	const char	*token;
;645:
;646:	token = COM_ParseExt( data, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 647
;647:	if ( token[0] == 0 ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $217
line 648
;648:	{
line 649
;649:		Com_Printf( "unexpected EOF\n" );
ADDRGP4 $212
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 650
;650:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $216
JUMPV
LABELV $217
line 653
;651:	}
;652:
;653:	*f = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRF4
ASGNF4
line 654
;654:	return qfalse;
CNSTI4 0
RETI4
LABELV $216
endproc COM_ParseFloat 12 8
export COM_ParseVec4
proc COM_ParseVec4 12 8
line 663
;655:}
;656:
;657:/*
;658:===============
;659:COM_ParseVec4
;660:===============
;661:*/
;662:qboolean COM_ParseVec4( const char **buffer, vec4_t *c) 
;663:{
line 667
;664:	int i;
;665:	float f;
;666:
;667:	for (i = 0; i < 4; i++) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $220
line 668
;668:	{
line 669
;669:		if (COM_ParseFloat(buffer, &f)) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 COM_ParseFloat
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $224
line 670
;670:		{
line 671
;671:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $219
JUMPV
LABELV $224
line 673
;672:		}
;673:		(*c)[i] = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 674
;674:	}
LABELV $221
line 667
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $220
line 675
;675:	return qfalse;
CNSTI4 0
RETI4
LABELV $219
endproc COM_ParseVec4 12 8
export COM_MatchToken
proc COM_MatchToken 12 16
line 683
;676:}
;677:
;678:/*
;679:==================
;680:COM_MatchToken
;681:==================
;682:*/
;683:void COM_MatchToken( const char **buf_p, char *match ) {
line 686
;684:	char	*token;
;685:
;686:	token = COM_Parse( buf_p );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 687
;687:	if ( strcmp( token, match ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $227
line 688
;688:		Com_Error( ERR_DROP, "MatchToken: %s != %s", token, match );
CNSTI4 1
ARGI4
ADDRGP4 $229
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 689
;689:	}
LABELV $227
line 690
;690:}
LABELV $226
endproc COM_MatchToken 12 16
export SkipBracedSection
proc SkipBracedSection 12 8
line 702
;691:
;692:
;693:/*
;694:=================
;695:SkipBracedSection
;696:
;697:The next token should be an open brace.
;698:Skips until a matching close brace is found.
;699:Internal brace depths are properly skipped.
;700:=================
;701:*/
;702:void SkipBracedSection (const char **program) {
line 706
;703:	char			*token;
;704:	int				depth;
;705:
;706:	depth = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $231
line 707
;707:	do {
line 708
;708:		token = COM_ParseExt( program, qtrue );
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
line 709
;709:		if( token[1] == 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $234
line 710
;710:			if( token[0] == '{' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $236
line 711
;711:				depth++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 712
;712:			}
ADDRGP4 $237
JUMPV
LABELV $236
line 713
;713:			else if( token[0] == '}' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $238
line 714
;714:				depth--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 715
;715:			}
LABELV $238
LABELV $237
line 716
;716:		}
LABELV $234
line 717
;717:	} while( depth && *program );
LABELV $232
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $240
ADDRFP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $231
LABELV $240
line 718
;718:}
LABELV $230
endproc SkipBracedSection 12 8
export SkipRestOfLine
proc SkipRestOfLine 16 0
line 725
;719:
;720:/*
;721:=================
;722:SkipRestOfLine
;723:=================
;724:*/
;725:void SkipRestOfLine ( const char **data ) {
line 729
;726:	const char	*p;
;727:	int		c;
;728:
;729:	p = *data;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRGP4 $243
JUMPV
LABELV $242
line 730
;730:	while ( (c = *p++) != 0 ) {
line 731
;731:		if ( c == '\n' ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $245
line 732
;732:			com_lines++;
ADDRLP4 8
ADDRGP4 com_lines
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 733
;733:			break;
ADDRGP4 $244
JUMPV
LABELV $245
line 735
;734:		}
;735:	}
LABELV $243
line 730
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $242
LABELV $244
line 737
;736:
;737:	*data = p;
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRP4
ASGNP4
line 738
;738:}
LABELV $241
endproc SkipRestOfLine 16 0
export Parse1DMatrix
proc Parse1DMatrix 16 8
line 741
;739:
;740:
;741:void Parse1DMatrix (const char **buf_p, int x, float *m) {
line 745
;742:	char	*token;
;743:	int		i;
;744:
;745:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $248
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 747
;746:
;747:	for (i = 0 ; i < x ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $252
JUMPV
LABELV $249
line 748
;748:		token = COM_Parse(buf_p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 749
;749:		m[i] = atof(token);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 750
;750:	}
LABELV $250
line 747
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $252
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $249
line 752
;751:
;752:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $253
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 753
;753:}
LABELV $247
endproc Parse1DMatrix 16 8
export Parse2DMatrix
proc Parse2DMatrix 8 12
line 755
;754:
;755:void Parse2DMatrix (const char **buf_p, int y, int x, float *m) {
line 758
;756:	int		i;
;757:
;758:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $248
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 760
;759:
;760:	for (i = 0 ; i < y ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $258
JUMPV
LABELV $255
line 761
;761:		Parse1DMatrix (buf_p, x, m + i * x);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 12
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse1DMatrix
CALLV
pop
line 762
;762:	}
LABELV $256
line 760
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $258
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $255
line 764
;763:
;764:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $253
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 765
;765:}
LABELV $254
endproc Parse2DMatrix 8 12
export Parse3DMatrix
proc Parse3DMatrix 12 16
line 767
;766:
;767:void Parse3DMatrix (const char **buf_p, int z, int y, int x, float *m) {
line 770
;768:	int		i;
;769:
;770:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $248
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 772
;771:
;772:	for (i = 0 ; i < z ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $263
JUMPV
LABELV $260
line 773
;773:		Parse2DMatrix (buf_p, y, x, m + i * x*y);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse2DMatrix
CALLV
pop
line 774
;774:	}
LABELV $261
line 772
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $263
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $260
line 776
;775:
;776:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $253
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 777
;777:}
LABELV $259
endproc Parse3DMatrix 12 16
export Q_isprint
proc Q_isprint 4 0
line 789
;778:
;779:
;780:/*
;781:============================================================================
;782:
;783:					LIBRARY REPLACEMENT FUNCTIONS
;784:
;785:============================================================================
;786:*/
;787:
;788:int Q_isprint( int c )
;789:{
line 790
;790:	if ( c >= 0x20 && c <= 0x7E )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $265
ADDRLP4 0
INDIRI4
CNSTI4 126
GTI4 $265
line 791
;791:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $265
line 792
;792:	return ( 0 );
CNSTI4 0
RETI4
LABELV $264
endproc Q_isprint 4 0
export Q_islower
proc Q_islower 4 0
line 796
;793:}
;794:
;795:int Q_islower( int c )
;796:{
line 797
;797:	if (c >= 'a' && c <= 'z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $268
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $268
line 798
;798:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $267
JUMPV
LABELV $268
line 799
;799:	return ( 0 );
CNSTI4 0
RETI4
LABELV $267
endproc Q_islower 4 0
export Q_isupper
proc Q_isupper 4 0
line 803
;800:}
;801:
;802:int Q_isupper( int c )
;803:{
line 804
;804:	if (c >= 'A' && c <= 'Z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $271
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $271
line 805
;805:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $270
JUMPV
LABELV $271
line 806
;806:	return ( 0 );
CNSTI4 0
RETI4
LABELV $270
endproc Q_isupper 4 0
export Q_isalpha
proc Q_isalpha 8 0
line 810
;807:}
;808:
;809:int Q_isalpha( int c )
;810:{
line 811
;811:	if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $277
ADDRLP4 0
INDIRI4
CNSTI4 122
LEI4 $276
LABELV $277
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 65
LTI4 $274
ADDRLP4 4
INDIRI4
CNSTI4 90
GTI4 $274
LABELV $276
line 812
;812:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $273
JUMPV
LABELV $274
line 813
;813:	return ( 0 );
CNSTI4 0
RETI4
LABELV $273
endproc Q_isalpha 8 0
export Q_strrchr
proc Q_strrchr 12 0
line 817
;814:}
;815:
;816:char* Q_strrchr( const char* string, int c )
;817:{
line 818
;818:	char cc = c;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
line 820
;819:	char *s;
;820:	char *sp=(char *)0;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 822
;821:
;822:	s = (char*)string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $280
JUMPV
LABELV $279
line 825
;823:
;824:	while (*s)
;825:	{
line 826
;826:		if (*s == cc)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI1
CVII4 1
NEI4 $282
line 827
;827:			sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $282
line 828
;828:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 829
;829:	}
LABELV $280
line 824
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $279
line 830
;830:	if (cc == 0)
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $284
line 831
;831:		sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $284
line 833
;832:
;833:	return sp;
ADDRLP4 8
INDIRP4
RETP4
LABELV $278
endproc Q_strrchr 12 0
export Q_strncpyz
proc Q_strncpyz 0 12
line 843
;834:}
;835:
;836:/*
;837:=============
;838:Q_strncpyz
;839: 
;840:Safe strncpy that ensures a trailing zero
;841:=============
;842:*/
;843:void Q_strncpyz( char *dest, const char *src, int destsize ) {
line 845
;844:  // bk001129 - also NULL dest
;845:  if ( !dest ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $287
line 846
;846:    Com_Error( ERR_FATAL, "Q_strncpyz: NULL dest" );
CNSTI4 0
ARGI4
ADDRGP4 $289
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 847
;847:  }
LABELV $287
line 848
;848:	if ( !src ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $290
line 849
;849:		Com_Error( ERR_FATAL, "Q_strncpyz: NULL src" );
CNSTI4 0
ARGI4
ADDRGP4 $292
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 850
;850:	}
LABELV $290
line 851
;851:	if ( destsize < 1 ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $293
line 852
;852:		Com_Error(ERR_FATAL,"Q_strncpyz: destsize < 1" ); 
CNSTI4 0
ARGI4
ADDRGP4 $295
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 853
;853:	}
LABELV $293
line 855
;854:
;855:	strncpy( dest, src, destsize-1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 856
;856:  dest[destsize-1] = 0;
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 857
;857:}
LABELV $286
endproc Q_strncpyz 0 12
export Q_stricmpn
proc Q_stricmpn 32 0
line 859
;858:                 
;859:int Q_stricmpn (const char *s1, const char *s2, int n) {
line 863
;860:	int		c1, c2;
;861:
;862:	// bk001129 - moved in 1.17 fix not in id codebase
;863:        if ( s1 == NULL ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $297
line 864
;864:           if ( s2 == NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $299
line 865
;865:             return 0;
CNSTI4 0
RETI4
ADDRGP4 $296
JUMPV
LABELV $299
line 867
;866:           else
;867:             return -1;
CNSTI4 -1
RETI4
ADDRGP4 $296
JUMPV
LABELV $297
line 869
;868:        }
;869:        else if ( s2==NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $301
line 870
;870:          return 1;
CNSTI4 1
RETI4
ADDRGP4 $296
JUMPV
LABELV $301
LABELV $303
line 874
;871:
;872:
;873:	
;874:	do {
line 875
;875:		c1 = *s1++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 876
;876:		c2 = *s2++;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 878
;877:
;878:		if (!n--) {
ADDRLP4 16
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $306
line 879
;879:			return 0;		// strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $296
JUMPV
LABELV $306
line 882
;880:		}
;881:		
;882:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $308
line 883
;883:			if (c1 >= 'a' && c1 <= 'z') {
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $310
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $310
line 884
;884:				c1 -= ('a' - 'A');
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 885
;885:			}
LABELV $310
line 886
;886:			if (c2 >= 'a' && c2 <= 'z') {
ADDRLP4 4
INDIRI4
CNSTI4 97
LTI4 $312
ADDRLP4 4
INDIRI4
CNSTI4 122
GTI4 $312
line 887
;887:				c2 -= ('a' - 'A');
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 888
;888:			}
LABELV $312
line 889
;889:			if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $314
line 890
;890:				return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $317
ADDRLP4 28
CNSTI4 -1
ASGNI4
ADDRGP4 $318
JUMPV
LABELV $317
ADDRLP4 28
CNSTI4 1
ASGNI4
LABELV $318
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $296
JUMPV
LABELV $314
line 892
;891:			}
;892:		}
LABELV $308
line 893
;893:	} while (c1);
LABELV $304
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $303
line 895
;894:	
;895:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $296
endproc Q_stricmpn 32 0
export Q_strncmp
proc Q_strncmp 24 0
line 898
;896:}
;897:
;898:int Q_strncmp (const char *s1, const char *s2, int n) {
LABELV $320
line 901
;899:	int		c1, c2;
;900:	
;901:	do {
line 902
;902:		c1 = *s1++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 903
;903:		c2 = *s2++;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 905
;904:
;905:		if (!n--) {
ADDRLP4 16
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $323
line 906
;906:			return 0;		// strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $319
JUMPV
LABELV $323
line 909
;907:		}
;908:		
;909:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $325
line 910
;910:			return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $328
ADDRLP4 20
CNSTI4 -1
ASGNI4
ADDRGP4 $329
JUMPV
LABELV $328
ADDRLP4 20
CNSTI4 1
ASGNI4
LABELV $329
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $319
JUMPV
LABELV $325
line 912
;911:		}
;912:	} while (c1);
LABELV $321
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $320
line 914
;913:	
;914:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $319
endproc Q_strncmp 24 0
export Q_stricmp
proc Q_stricmp 12 12
line 917
;915:}
;916:
;917:int Q_stricmp (const char *s1, const char *s2) {
line 918
;918:	return (s1 && s2) ? Q_stricmpn (s1, s2, 99999) : -1;
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $332
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $332
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 99999
ARGI4
ADDRLP4 8
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $333
JUMPV
LABELV $332
ADDRLP4 0
CNSTI4 -1
ASGNI4
LABELV $333
ADDRLP4 0
INDIRI4
RETI4
LABELV $330
endproc Q_stricmp 12 12
export Q_strlwr
proc Q_strlwr 12 4
line 922
;919:}
;920:
;921:
;922:char *Q_strlwr( char *s1 ) {
line 925
;923:    char	*s;
;924:
;925:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $336
JUMPV
LABELV $335
line 926
;926:	while ( *s ) {
line 927
;927:		*s = tolower(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 928
;928:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 929
;929:	}
LABELV $336
line 926
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $335
line 930
;930:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $334
endproc Q_strlwr 12 4
export Q_strupr
proc Q_strupr 12 4
line 933
;931:}
;932:
;933:char *Q_strupr( char *s1 ) {
line 936
;934:    char	*s;
;935:
;936:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $340
JUMPV
LABELV $339
line 937
;937:	while ( *s ) {
line 938
;938:		*s = toupper(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 939
;939:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 940
;940:	}
LABELV $340
line 937
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $339
line 941
;941:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $338
endproc Q_strupr 12 4
export Q_strcat
proc Q_strcat 12 12
line 946
;942:}
;943:
;944:
;945:// never goes past bounds or leaves without a terminating 0
;946:void Q_strcat( char *dest, int size, const char *src ) {
line 949
;947:	int		l1;
;948:
;949:	l1 = strlen( dest );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 950
;950:	if ( l1 >= size ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $343
line 951
;951:		Com_Error( ERR_FATAL, "Q_strcat: already overflowed" );
CNSTI4 0
ARGI4
ADDRGP4 $345
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 952
;952:	}
LABELV $343
line 953
;953:	Q_strncpyz( dest + l1, src, size - l1 );
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 954
;954:}
LABELV $342
endproc Q_strcat 12 12
export Q_PrintStrlen
proc Q_PrintStrlen 20 0
line 957
;955:
;956:
;957:int Q_PrintStrlen( const char *string ) {
line 961
;958:	int			len;
;959:	const char	*p;
;960:
;961:	if( !string ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $347
line 962
;962:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $346
JUMPV
LABELV $347
line 965
;963:	}
;964:
;965:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 966
;966:	p = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $350
JUMPV
LABELV $349
line 967
;967:	while( *p ) {
line 968
;968:		if( Q_IsColorString( p ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $352
ADDRLP4 12
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
NEI4 $352
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $352
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $352
ADDRLP4 16
INDIRI4
CNSTI4 55
GTI4 $352
ADDRLP4 16
INDIRI4
CNSTI4 48
LTI4 $352
line 969
;969:			p += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 970
;970:			continue;
ADDRGP4 $350
JUMPV
LABELV $352
line 972
;971:		}
;972:		p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 973
;973:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 974
;974:	}
LABELV $350
line 967
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $349
line 976
;975:
;976:	return len;
ADDRLP4 4
INDIRI4
RETI4
LABELV $346
endproc Q_PrintStrlen 20 0
export Q_CleanStr
proc Q_CleanStr 32 0
line 980
;977:}
;978:
;979:
;980:char *Q_CleanStr( char *string ) {
line 985
;981:	char*	d;
;982:	char*	s;
;983:	int		c;
;984:
;985:	s = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 986
;986:	d = string;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $356
JUMPV
LABELV $355
line 987
;987:	while ((c = *s) != 0 ) {
line 988
;988:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $358
ADDRLP4 16
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 16
INDIRI4
NEI4 $358
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $358
ADDRLP4 20
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $358
ADDRLP4 20
INDIRI4
CNSTI4 55
GTI4 $358
ADDRLP4 20
INDIRI4
CNSTI4 48
LTI4 $358
line 989
;989:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 990
;990:		}		
ADDRGP4 $359
JUMPV
LABELV $358
line 991
;991:		else if ( c >= 0x20 && c <= 0x7E ) {
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $360
ADDRLP4 4
INDIRI4
CNSTI4 126
GTI4 $360
line 992
;992:			*d++ = c;
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
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 993
;993:		}
LABELV $360
LABELV $359
line 994
;994:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 995
;995:	}
LABELV $356
line 987
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $355
line 996
;996:	*d = '\0';
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 998
;997:
;998:	return string;
ADDRFP4 0
INDIRP4
RETP4
LABELV $354
endproc Q_CleanStr 32 0
export Com_sprintf
proc Com_sprintf 32012 12
line 1002
;999:}
;1000:
;1001:
;1002:void QDECL Com_sprintf( char *dest, int size, const char *fmt, ...) {
line 1007
;1003:	int		len;
;1004:	va_list		argptr;
;1005:	char	bigbuffer[32000];	// big, but small enough to fit in PPC stack
;1006:
;1007:	va_start (argptr,fmt);
ADDRLP4 4
ADDRFP4 8+4
ASGNP4
line 1008
;1008:	len = vsprintf (bigbuffer,fmt,argptr);
ADDRLP4 8
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 32008
ADDRGP4 vsprintf
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 32008
INDIRI4
ASGNI4
line 1009
;1009:	va_end (argptr);
ADDRLP4 4
CNSTP4 0
ASGNP4
line 1010
;1010:	if ( len >= sizeof( bigbuffer ) ) {
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 32000
LTU4 $364
line 1011
;1011:		Com_Error( ERR_FATAL, "Com_sprintf: overflowed bigbuffer" );
CNSTI4 0
ARGI4
ADDRGP4 $366
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1012
;1012:	}
LABELV $364
line 1013
;1013:	if (len >= size) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $367
line 1014
;1014:		Com_Printf ("Com_sprintf: overflow of %i in %i\n", len, size);
ADDRGP4 $369
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1020
;1015:#ifdef	_DEBUG
;1016:		__asm {
;1017:			int 3;
;1018:		}
;1019:#endif
;1020:	}
LABELV $367
line 1021
;1021:	Q_strncpyz (dest, bigbuffer, size );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1022
;1022:}
LABELV $362
endproc Com_sprintf 32012 12
bss
align 1
LABELV $371
skip 64000
data
align 4
LABELV $372
byte 4 0
export va
code
proc va 12 12
line 1034
;1023:
;1024:
;1025:/*
;1026:============
;1027:va
;1028:
;1029:does a varargs printf into a temp buffer, so I don't need to have
;1030:varargs versions of all text functions.
;1031:FIXME: make this buffer size safe someday
;1032:============
;1033:*/
;1034:char	* QDECL va( const char *format, ... ) {
line 1040
;1035:	va_list		argptr;
;1036:	static char		string[2][32000];	// in case va is called by nested functions
;1037:	static int		index = 0;
;1038:	char	*buf;
;1039:
;1040:	buf = string[index & 1];
ADDRLP4 4
CNSTI4 32000
ADDRGP4 $372
INDIRI4
CNSTI4 1
BANDI4
MULI4
ADDRGP4 $371
ADDP4
ASGNP4
line 1041
;1041:	index++;
ADDRLP4 8
ADDRGP4 $372
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1043
;1042:
;1043:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 1044
;1044:	vsprintf (buf, format,argptr);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 1045
;1045:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1047
;1046:
;1047:	return buf;
ADDRLP4 4
INDIRP4
RETP4
LABELV $370
endproc va 12 12
bss
align 1
LABELV $375
skip 16384
data
align 4
LABELV $376
byte 4 0
export Info_ValueForKey
code
proc Info_ValueForKey 8220 8
line 1068
;1048:}
;1049:
;1050:
;1051:/*
;1052:=====================================================================
;1053:
;1054:  INFO STRINGS
;1055:
;1056:=====================================================================
;1057:*/
;1058:
;1059:/*
;1060:===============
;1061:Info_ValueForKey
;1062:
;1063:Searches the string for the given
;1064:key and returns the associated value, or an empty string.
;1065:FIXME: overflow check?
;1066:===============
;1067:*/
;1068:char *Info_ValueForKey( const char *s, const char *key ) {
line 1075
;1069:	char	pkey[BIG_INFO_KEY];
;1070:	static	char value[2][BIG_INFO_VALUE];	// use two buffers so compares
;1071:											// work without stomping on each other
;1072:	static	int	valueindex = 0;
;1073:	char	*o;
;1074:	
;1075:	if ( !s || !key ) {
ADDRLP4 8196
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8196
INDIRU4
EQU4 $379
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 8196
INDIRU4
NEU4 $377
LABELV $379
line 1076
;1076:		return "";
ADDRGP4 $380
RETP4
ADDRGP4 $374
JUMPV
LABELV $377
line 1079
;1077:	}
;1078:
;1079:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8200
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8200
INDIRI4
CNSTI4 8192
LTI4 $381
line 1080
;1080:		Com_Error( ERR_DROP, "Info_ValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $383
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1081
;1081:	}
LABELV $381
line 1083
;1082:
;1083:	valueindex ^= 1;
ADDRLP4 8204
ADDRGP4 $376
ASGNP4
ADDRLP4 8204
INDIRP4
ADDRLP4 8204
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 1084
;1084:	if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $387
line 1085
;1085:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $387
JUMPV
LABELV $386
line 1087
;1086:	while (1)
;1087:	{
line 1088
;1088:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $390
JUMPV
LABELV $389
line 1090
;1089:		while (*s != '\\')
;1090:		{
line 1091
;1091:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $392
line 1092
;1092:				return "";
ADDRGP4 $380
RETP4
ADDRGP4 $374
JUMPV
LABELV $392
line 1093
;1093:			*o++ = *s++;
ADDRLP4 8208
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8216
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 8208
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8212
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8208
INDIRP4
ADDRLP4 8212
INDIRP4
INDIRI1
ASGNI1
line 1094
;1094:		}
LABELV $390
line 1089
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $389
line 1095
;1095:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1096
;1096:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1098
;1097:
;1098:		o = value[valueindex];
ADDRLP4 0
ADDRGP4 $376
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $375
ADDP4
ASGNP4
ADDRGP4 $395
JUMPV
LABELV $394
line 1101
;1099:
;1100:		while (*s != '\\' && *s)
;1101:		{
line 1102
;1102:			*o++ = *s++;
ADDRLP4 8208
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8216
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 8208
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8212
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8208
INDIRP4
ADDRLP4 8212
INDIRP4
INDIRI1
ASGNI1
line 1103
;1103:		}
LABELV $395
line 1100
ADDRLP4 8208
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8208
INDIRI4
CNSTI4 92
EQI4 $397
ADDRLP4 8208
INDIRI4
CNSTI4 0
NEI4 $394
LABELV $397
line 1104
;1104:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1106
;1105:
;1106:		if (!Q_stricmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8212
INDIRI4
CNSTI4 0
NEI4 $398
line 1107
;1107:			return value[valueindex];
ADDRGP4 $376
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $375
ADDP4
RETP4
ADDRGP4 $374
JUMPV
LABELV $398
line 1109
;1108:
;1109:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $400
line 1110
;1110:			break;
ADDRGP4 $388
JUMPV
LABELV $400
line 1111
;1111:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1112
;1112:	}
LABELV $387
line 1086
ADDRGP4 $386
JUMPV
LABELV $388
line 1114
;1113:
;1114:	return "";
ADDRGP4 $380
RETP4
LABELV $374
endproc Info_ValueForKey 8220 8
export Info_NextPair
proc Info_NextPair 20 0
line 1125
;1115:}
;1116:
;1117:
;1118:/*
;1119:===================
;1120:Info_NextPair
;1121:
;1122:Used to itterate through all the key/value pairs in an info string
;1123:===================
;1124:*/
;1125:void Info_NextPair( const char **head, char *key, char *value ) {
line 1129
;1126:	char	*o;
;1127:	const char	*s;
;1128:
;1129:	s = *head;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 1131
;1130:
;1131:	if ( *s == '\\' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $403
line 1132
;1132:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1133
;1133:	}
LABELV $403
line 1134
;1134:	key[0] = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1135
;1135:	value[0] = 0;
ADDRFP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 1137
;1136:
;1137:	o = key;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRGP4 $406
JUMPV
LABELV $405
line 1138
;1138:	while ( *s != '\\' ) {
line 1139
;1139:		if ( !*s ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $408
line 1140
;1140:			*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1141
;1141:			*head = s;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1142
;1142:			return;
ADDRGP4 $402
JUMPV
LABELV $408
line 1144
;1143:		}
;1144:		*o++ = *s++;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI1
ASGNI1
line 1145
;1145:	}
LABELV $406
line 1138
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $405
line 1146
;1146:	*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1147
;1147:	s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1149
;1148:
;1149:	o = value;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $411
JUMPV
LABELV $410
line 1150
;1150:	while ( *s != '\\' && *s ) {
line 1151
;1151:		*o++ = *s++;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI1
ASGNI1
line 1152
;1152:	}
LABELV $411
line 1150
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 92
EQI4 $413
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $410
LABELV $413
line 1153
;1153:	*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1155
;1154:
;1155:	*head = s;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1156
;1156:}
LABELV $402
endproc Info_NextPair 20 0
export Info_RemoveKey
proc Info_RemoveKey 2076 8
line 1164
;1157:
;1158:
;1159:/*
;1160:===================
;1161:Info_RemoveKey
;1162:===================
;1163:*/
;1164:void Info_RemoveKey( char *s, const char *key ) {
line 1170
;1165:	char	*start;
;1166:	char	pkey[MAX_INFO_KEY];
;1167:	char	value[MAX_INFO_VALUE];
;1168:	char	*o;
;1169:
;1170:	if ( strlen( s ) >= MAX_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 1024
LTI4 $415
line 1171
;1171:		Com_Error( ERR_DROP, "Info_RemoveKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $417
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1172
;1172:	}
LABELV $415
line 1174
;1173:
;1174:	if (strchr (key, '\\')) {
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 2060
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2060
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $421
line 1175
;1175:		return;
ADDRGP4 $414
JUMPV
LABELV $420
line 1179
;1176:	}
;1177:
;1178:	while (1)
;1179:	{
line 1180
;1180:		start = s;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
line 1181
;1181:		if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $423
line 1182
;1182:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $423
line 1183
;1183:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $426
JUMPV
LABELV $425
line 1185
;1184:		while (*s != '\\')
;1185:		{
line 1186
;1186:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $428
line 1187
;1187:				return;
ADDRGP4 $414
JUMPV
LABELV $428
line 1188
;1188:			*o++ = *s++;
ADDRLP4 2064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 2072
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 2068
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2064
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI1
ASGNI1
line 1189
;1189:		}
LABELV $426
line 1184
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $425
line 1190
;1190:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1191
;1191:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1193
;1192:
;1193:		o = value;
ADDRLP4 0
ADDRLP4 1032
ASGNP4
ADDRGP4 $431
JUMPV
LABELV $430
line 1195
;1194:		while (*s != '\\' && *s)
;1195:		{
line 1196
;1196:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $433
line 1197
;1197:				return;
ADDRGP4 $414
JUMPV
LABELV $433
line 1198
;1198:			*o++ = *s++;
ADDRLP4 2064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 2072
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 2068
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2064
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI1
ASGNI1
line 1199
;1199:		}
LABELV $431
line 1194
ADDRLP4 2064
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 92
EQI4 $435
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $430
LABELV $435
line 1200
;1200:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1202
;1201:
;1202:		if (!strcmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2068
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $436
line 1203
;1203:		{
line 1204
;1204:			strcpy (start, s);	// remove this part
ADDRLP4 1028
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1205
;1205:			return;
ADDRGP4 $414
JUMPV
LABELV $436
line 1208
;1206:		}
;1207:
;1208:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $438
line 1209
;1209:			return;
ADDRGP4 $414
JUMPV
LABELV $438
line 1210
;1210:	}
LABELV $421
line 1178
ADDRGP4 $420
JUMPV
line 1212
;1211:
;1212:}
LABELV $414
endproc Info_RemoveKey 2076 8
export Info_RemoveKey_Big
proc Info_RemoveKey_Big 16412 8
line 1219
;1213:
;1214:/*
;1215:===================
;1216:Info_RemoveKey_Big
;1217:===================
;1218:*/
;1219:void Info_RemoveKey_Big( char *s, const char *key ) {
line 1225
;1220:	char	*start;
;1221:	char	pkey[BIG_INFO_KEY];
;1222:	char	value[BIG_INFO_VALUE];
;1223:	char	*o;
;1224:
;1225:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16392
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16392
INDIRI4
CNSTI4 8192
LTI4 $441
line 1226
;1226:		Com_Error( ERR_DROP, "Info_RemoveKey_Big: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $443
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1227
;1227:	}
LABELV $441
line 1229
;1228:
;1229:	if (strchr (key, '\\')) {
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 16396
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 16396
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $447
line 1230
;1230:		return;
ADDRGP4 $440
JUMPV
LABELV $446
line 1234
;1231:	}
;1232:
;1233:	while (1)
;1234:	{
line 1235
;1235:		start = s;
ADDRLP4 8196
ADDRFP4 0
INDIRP4
ASGNP4
line 1236
;1236:		if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $449
line 1237
;1237:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $449
line 1238
;1238:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $452
JUMPV
LABELV $451
line 1240
;1239:		while (*s != '\\')
;1240:		{
line 1241
;1241:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $454
line 1242
;1242:				return;
ADDRGP4 $440
JUMPV
LABELV $454
line 1243
;1243:			*o++ = *s++;
ADDRLP4 16400
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16408
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 16400
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 16404
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16400
INDIRP4
ADDRLP4 16404
INDIRP4
INDIRI1
ASGNI1
line 1244
;1244:		}
LABELV $452
line 1239
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $451
line 1245
;1245:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1246
;1246:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1248
;1247:
;1248:		o = value;
ADDRLP4 0
ADDRLP4 8200
ASGNP4
ADDRGP4 $457
JUMPV
LABELV $456
line 1250
;1249:		while (*s != '\\' && *s)
;1250:		{
line 1251
;1251:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $459
line 1252
;1252:				return;
ADDRGP4 $440
JUMPV
LABELV $459
line 1253
;1253:			*o++ = *s++;
ADDRLP4 16400
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16408
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 16400
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 16404
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16400
INDIRP4
ADDRLP4 16404
INDIRP4
INDIRI1
ASGNI1
line 1254
;1254:		}
LABELV $457
line 1249
ADDRLP4 16400
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16400
INDIRI4
CNSTI4 92
EQI4 $461
ADDRLP4 16400
INDIRI4
CNSTI4 0
NEI4 $456
LABELV $461
line 1255
;1255:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1257
;1256:
;1257:		if (!strcmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 16404
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16404
INDIRI4
CNSTI4 0
NEI4 $462
line 1258
;1258:		{
line 1259
;1259:			strcpy (start, s);	// remove this part
ADDRLP4 8196
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1260
;1260:			return;
ADDRGP4 $440
JUMPV
LABELV $462
line 1263
;1261:		}
;1262:
;1263:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $464
line 1264
;1264:			return;
ADDRGP4 $440
JUMPV
LABELV $464
line 1265
;1265:	}
LABELV $447
line 1233
ADDRGP4 $446
JUMPV
line 1267
;1266:
;1267:}
LABELV $440
endproc Info_RemoveKey_Big 16412 8
export Info_Validate
proc Info_Validate 8 8
line 1280
;1268:
;1269:
;1270:
;1271:
;1272:/*
;1273:==================
;1274:Info_Validate
;1275:
;1276:Some characters are illegal in info strings because they
;1277:can mess up the server's parsing
;1278:==================
;1279:*/
;1280:qboolean Info_Validate( const char *s ) {
line 1281
;1281:	if ( strchr( s, '\"' ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 0
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $467
line 1282
;1282:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $466
JUMPV
LABELV $467
line 1284
;1283:	}
;1284:	if ( strchr( s, ';' ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 4
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $469
line 1285
;1285:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $466
JUMPV
LABELV $469
line 1287
;1286:	}
;1287:	return qtrue;
CNSTI4 1
RETI4
LABELV $466
endproc Info_Validate 8 8
export Info_SetValueForKey
proc Info_SetValueForKey 1068 20
line 1297
;1288:}
;1289:
;1290:/*
;1291:==================
;1292:Info_SetValueForKey
;1293:
;1294:Changes or adds a key/value pair
;1295:==================
;1296:*/
;1297:void Info_SetValueForKey( char *s, const char *key, const char *value ) {
line 1300
;1298:	char	newi[MAX_INFO_STRING];
;1299:
;1300:	if ( strlen( s ) >= MAX_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 1024
LTI4 $472
line 1301
;1301:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $474
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1302
;1302:	}
LABELV $472
line 1304
;1303:
;1304:	if (strchr (key, '\\') || strchr (value, '\\'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 1028
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $477
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 1032
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $475
LABELV $477
line 1305
;1305:	{
line 1306
;1306:		Com_Printf ("Can't use keys or values with a \\\n");
ADDRGP4 $478
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1307
;1307:		return;
ADDRGP4 $471
JUMPV
LABELV $475
line 1310
;1308:	}
;1309:
;1310:	if (strchr (key, ';') || strchr (value, ';'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 1036
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $481
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 1040
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $479
LABELV $481
line 1311
;1311:	{
line 1312
;1312:		Com_Printf ("Can't use keys or values with a semicolon\n");
ADDRGP4 $482
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1313
;1313:		return;
ADDRGP4 $471
JUMPV
LABELV $479
line 1316
;1314:	}
;1315:
;1316:	if (strchr (key, '\"') || strchr (value, '\"'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1044
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $485
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1048
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1048
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $483
LABELV $485
line 1317
;1317:	{
line 1318
;1318:		Com_Printf ("Can't use keys or values with a \"\n");
ADDRGP4 $486
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1319
;1319:		return;
ADDRGP4 $471
JUMPV
LABELV $483
line 1322
;1320:	}
;1321:
;1322:	Info_RemoveKey (s, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Info_RemoveKey
CALLV
pop
line 1323
;1323:	if (!value || !strlen(value))
ADDRLP4 1052
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $489
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $487
LABELV $489
line 1324
;1324:		return;
ADDRGP4 $471
JUMPV
LABELV $487
line 1326
;1325:
;1326:	Com_sprintf (newi, sizeof(newi), "\\%s\\%s", key, value);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $490
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1328
;1327:
;1328:	if (strlen(newi) + strlen(s) > MAX_INFO_STRING)
ADDRLP4 0
ARGP4
ADDRLP4 1060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
ADDRLP4 1064
INDIRI4
ADDI4
CNSTI4 1024
LEI4 $491
line 1329
;1329:	{
line 1330
;1330:		Com_Printf ("Info string length exceeded\n");
ADDRGP4 $493
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1331
;1331:		return;
ADDRGP4 $471
JUMPV
LABELV $491
line 1334
;1332:	}
;1333:
;1334:	strcat (newi, s);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1335
;1335:	strcpy (s, newi);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1336
;1336:}
LABELV $471
endproc Info_SetValueForKey 1068 20
export Info_SetValueForKey_Big
proc Info_SetValueForKey_Big 8236 20
line 1345
;1337:
;1338:/*
;1339:==================
;1340:Info_SetValueForKey_Big
;1341:
;1342:Changes or adds a key/value pair
;1343:==================
;1344:*/
;1345:void Info_SetValueForKey_Big( char *s, const char *key, const char *value ) {
line 1348
;1346:	char	newi[BIG_INFO_STRING];
;1347:
;1348:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8192
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8192
INDIRI4
CNSTI4 8192
LTI4 $495
line 1349
;1349:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $474
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1350
;1350:	}
LABELV $495
line 1352
;1351:
;1352:	if (strchr (key, '\\') || strchr (value, '\\'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 8196
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8196
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $499
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 8200
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8200
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $497
LABELV $499
line 1353
;1353:	{
line 1354
;1354:		Com_Printf ("Can't use keys or values with a \\\n");
ADDRGP4 $478
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1355
;1355:		return;
ADDRGP4 $494
JUMPV
LABELV $497
line 1358
;1356:	}
;1357:
;1358:	if (strchr (key, ';') || strchr (value, ';'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 8204
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $502
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 8208
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8208
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $500
LABELV $502
line 1359
;1359:	{
line 1360
;1360:		Com_Printf ("Can't use keys or values with a semicolon\n");
ADDRGP4 $482
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1361
;1361:		return;
ADDRGP4 $494
JUMPV
LABELV $500
line 1364
;1362:	}
;1363:
;1364:	if (strchr (key, '\"') || strchr (value, '\"'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 8212
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8212
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $505
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 8216
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8216
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $503
LABELV $505
line 1365
;1365:	{
line 1366
;1366:		Com_Printf ("Can't use keys or values with a \"\n");
ADDRGP4 $486
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1367
;1367:		return;
ADDRGP4 $494
JUMPV
LABELV $503
line 1370
;1368:	}
;1369:
;1370:	Info_RemoveKey_Big (s, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Info_RemoveKey_Big
CALLV
pop
line 1371
;1371:	if (!value || !strlen(value))
ADDRLP4 8220
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8220
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $508
ADDRLP4 8220
INDIRP4
ARGP4
ADDRLP4 8224
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8224
INDIRI4
CNSTI4 0
NEI4 $506
LABELV $508
line 1372
;1372:		return;
ADDRGP4 $494
JUMPV
LABELV $506
line 1374
;1373:
;1374:	Com_sprintf (newi, sizeof(newi), "\\%s\\%s", key, value);
ADDRLP4 0
ARGP4
CNSTI4 8192
ARGI4
ADDRGP4 $490
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1376
;1375:
;1376:	if (strlen(newi) + strlen(s) > BIG_INFO_STRING)
ADDRLP4 0
ARGP4
ADDRLP4 8228
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8232
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8228
INDIRI4
ADDRLP4 8232
INDIRI4
ADDI4
CNSTI4 8192
LEI4 $509
line 1377
;1377:	{
line 1378
;1378:		Com_Printf ("BIG Info string length exceeded\n");
ADDRGP4 $511
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1379
;1379:		return;
ADDRGP4 $494
JUMPV
LABELV $509
line 1382
;1380:	}
;1381:
;1382:	strcat (s, newi);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1383
;1383:}
LABELV $494
endproc Info_SetValueForKey_Big 8236 20
export Q_irand
proc Q_irand 8 0
line 1388
;1384:
;1385:
;1386://rww - convience function..
;1387:int Q_irand(int value1, int value2)
;1388:{
line 1391
;1389:	int r;
;1390:
;1391:	r = rand()%value2;
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
MODI4
ASGNI4
line 1392
;1392:	r += value1;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 1394
;1393:	
;1394:	return r;
ADDRLP4 0
INDIRI4
RETI4
LABELV $512
endproc Q_irand 8 0
bss
align 4
LABELV com_lines
skip 4
align 1
LABELV com_parsename
skip 1024
align 1
LABELV com_token
skip 1024
import irand
import flrand
import Rand_Init
import Com_Printf
import Com_Error
import Info_RemoveKey_big
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
LABELV $511
char 1 66
char 1 73
char 1 71
char 1 32
char 1 73
char 1 110
char 1 102
char 1 111
char 1 32
char 1 115
char 1 116
char 1 114
char 1 105
char 1 110
char 1 103
char 1 32
char 1 108
char 1 101
char 1 110
char 1 103
char 1 116
char 1 104
char 1 32
char 1 101
char 1 120
char 1 99
char 1 101
char 1 101
char 1 100
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $493
char 1 73
char 1 110
char 1 102
char 1 111
char 1 32
char 1 115
char 1 116
char 1 114
char 1 105
char 1 110
char 1 103
char 1 32
char 1 108
char 1 101
char 1 110
char 1 103
char 1 116
char 1 104
char 1 32
char 1 101
char 1 120
char 1 99
char 1 101
char 1 101
char 1 100
char 1 101
char 1 100
char 1 10
char 1 0
align 1
LABELV $490
char 1 92
char 1 37
char 1 115
char 1 92
char 1 37
char 1 115
char 1 0
align 1
LABELV $486
char 1 67
char 1 97
char 1 110
char 1 39
char 1 116
char 1 32
char 1 117
char 1 115
char 1 101
char 1 32
char 1 107
char 1 101
char 1 121
char 1 115
char 1 32
char 1 111
char 1 114
char 1 32
char 1 118
char 1 97
char 1 108
char 1 117
char 1 101
char 1 115
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 32
char 1 97
char 1 32
char 1 34
char 1 10
char 1 0
align 1
LABELV $482
char 1 67
char 1 97
char 1 110
char 1 39
char 1 116
char 1 32
char 1 117
char 1 115
char 1 101
char 1 32
char 1 107
char 1 101
char 1 121
char 1 115
char 1 32
char 1 111
char 1 114
char 1 32
char 1 118
char 1 97
char 1 108
char 1 117
char 1 101
char 1 115
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 32
char 1 97
char 1 32
char 1 115
char 1 101
char 1 109
char 1 105
char 1 99
char 1 111
char 1 108
char 1 111
char 1 110
char 1 10
char 1 0
align 1
LABELV $478
char 1 67
char 1 97
char 1 110
char 1 39
char 1 116
char 1 32
char 1 117
char 1 115
char 1 101
char 1 32
char 1 107
char 1 101
char 1 121
char 1 115
char 1 32
char 1 111
char 1 114
char 1 32
char 1 118
char 1 97
char 1 108
char 1 117
char 1 101
char 1 115
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 32
char 1 97
char 1 32
char 1 92
char 1 10
char 1 0
align 1
LABELV $474
char 1 73
char 1 110
char 1 102
char 1 111
char 1 95
char 1 83
char 1 101
char 1 116
char 1 86
char 1 97
char 1 108
char 1 117
char 1 101
char 1 70
char 1 111
char 1 114
char 1 75
char 1 101
char 1 121
char 1 58
char 1 32
char 1 111
char 1 118
char 1 101
char 1 114
char 1 115
char 1 105
char 1 122
char 1 101
char 1 32
char 1 105
char 1 110
char 1 102
char 1 111
char 1 115
char 1 116
char 1 114
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $443
char 1 73
char 1 110
char 1 102
char 1 111
char 1 95
char 1 82
char 1 101
char 1 109
char 1 111
char 1 118
char 1 101
char 1 75
char 1 101
char 1 121
char 1 95
char 1 66
char 1 105
char 1 103
char 1 58
char 1 32
char 1 111
char 1 118
char 1 101
char 1 114
char 1 115
char 1 105
char 1 122
char 1 101
char 1 32
char 1 105
char 1 110
char 1 102
char 1 111
char 1 115
char 1 116
char 1 114
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $417
char 1 73
char 1 110
char 1 102
char 1 111
char 1 95
char 1 82
char 1 101
char 1 109
char 1 111
char 1 118
char 1 101
char 1 75
char 1 101
char 1 121
char 1 58
char 1 32
char 1 111
char 1 118
char 1 101
char 1 114
char 1 115
char 1 105
char 1 122
char 1 101
char 1 32
char 1 105
char 1 110
char 1 102
char 1 111
char 1 115
char 1 116
char 1 114
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $383
char 1 73
char 1 110
char 1 102
char 1 111
char 1 95
char 1 86
char 1 97
char 1 108
char 1 117
char 1 101
char 1 70
char 1 111
char 1 114
char 1 75
char 1 101
char 1 121
char 1 58
char 1 32
char 1 111
char 1 118
char 1 101
char 1 114
char 1 115
char 1 105
char 1 122
char 1 101
char 1 32
char 1 105
char 1 110
char 1 102
char 1 111
char 1 115
char 1 116
char 1 114
char 1 105
char 1 110
char 1 103
char 1 0
align 1
LABELV $380
char 1 0
align 1
LABELV $369
char 1 67
char 1 111
char 1 109
char 1 95
char 1 115
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 102
char 1 58
char 1 32
char 1 111
char 1 118
char 1 101
char 1 114
char 1 102
char 1 108
char 1 111
char 1 119
char 1 32
char 1 111
char 1 102
char 1 32
char 1 37
char 1 105
char 1 32
char 1 105
char 1 110
char 1 32
char 1 37
char 1 105
char 1 10
char 1 0
align 1
LABELV $366
char 1 67
char 1 111
char 1 109
char 1 95
char 1 115
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 102
char 1 58
char 1 32
char 1 111
char 1 118
char 1 101
char 1 114
char 1 102
char 1 108
char 1 111
char 1 119
char 1 101
char 1 100
char 1 32
char 1 98
char 1 105
char 1 103
char 1 98
char 1 117
char 1 102
char 1 102
char 1 101
char 1 114
char 1 0
align 1
LABELV $345
char 1 81
char 1 95
char 1 115
char 1 116
char 1 114
char 1 99
char 1 97
char 1 116
char 1 58
char 1 32
char 1 97
char 1 108
char 1 114
char 1 101
char 1 97
char 1 100
char 1 121
char 1 32
char 1 111
char 1 118
char 1 101
char 1 114
char 1 102
char 1 108
char 1 111
char 1 119
char 1 101
char 1 100
char 1 0
align 1
LABELV $295
char 1 81
char 1 95
char 1 115
char 1 116
char 1 114
char 1 110
char 1 99
char 1 112
char 1 121
char 1 122
char 1 58
char 1 32
char 1 100
char 1 101
char 1 115
char 1 116
char 1 115
char 1 105
char 1 122
char 1 101
char 1 32
char 1 60
char 1 32
char 1 49
char 1 0
align 1
LABELV $292
char 1 81
char 1 95
char 1 115
char 1 116
char 1 114
char 1 110
char 1 99
char 1 112
char 1 121
char 1 122
char 1 58
char 1 32
char 1 78
char 1 85
char 1 76
char 1 76
char 1 32
char 1 115
char 1 114
char 1 99
char 1 0
align 1
LABELV $289
char 1 81
char 1 95
char 1 115
char 1 116
char 1 114
char 1 110
char 1 99
char 1 112
char 1 121
char 1 122
char 1 58
char 1 32
char 1 78
char 1 85
char 1 76
char 1 76
char 1 32
char 1 100
char 1 101
char 1 115
char 1 116
char 1 0
align 1
LABELV $253
char 1 41
char 1 0
align 1
LABELV $248
char 1 40
char 1 0
align 1
LABELV $229
char 1 77
char 1 97
char 1 116
char 1 99
char 1 104
char 1 84
char 1 111
char 1 107
char 1 101
char 1 110
char 1 58
char 1 32
char 1 37
char 1 115
char 1 32
char 1 33
char 1 61
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $212
char 1 117
char 1 110
char 1 101
char 1 120
char 1 112
char 1 101
char 1 99
char 1 116
char 1 101
char 1 100
char 1 32
char 1 69
char 1 79
char 1 70
char 1 10
char 1 0
align 1
LABELV $118
char 1 87
char 1 65
char 1 82
char 1 78
char 1 73
char 1 78
char 1 71
char 1 58
char 1 32
char 1 37
char 1 115
char 1 44
char 1 32
char 1 108
char 1 105
char 1 110
char 1 101
char 1 32
char 1 37
char 1 100
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $114
char 1 69
char 1 82
char 1 82
char 1 79
char 1 82
char 1 58
char 1 32
char 1 37
char 1 115
char 1 44
char 1 32
char 1 108
char 1 105
char 1 110
char 1 101
char 1 32
char 1 37
char 1 100
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $108
char 1 37
char 1 115
char 1 0
align 1
LABELV $88
char 1 37
char 1 115
char 1 37
char 1 115
char 1 0
