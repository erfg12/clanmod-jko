#
# Linux Makefile for GCC (x86) for Jedi Outcast SDK
#


# === Variables ===

# Compiler - GCC
CC = gcc

# Compiler Flags
# -D<name> ( Used to make a define like #define mydefine )
# -w ( disable warnings )
# -I<include path>  used to include headers
# -fPIC ( this flag is necessary to build shared libraries )
CFLAGS = -I../qcommon -I../server -I../icarus -I../ghoul2 -fPIC -DFINAL_BUILD -DMISSION_PACK -DQAGAME -D_JK2 -D__linux__ -D__GCC__ -w -DCMAKE_CXX_FLAGS=-m32 -DCMAKE_C_FLAGS=-m32 -DCMAKE_SHARED_LINKER_FLAGS=-m32 -DCMAKE_SIZEOF_VOID_P=4 -DSQLITE_THREADSAFE=0

# Target file
TARGET = jk2mpgamex86.so

# Object Files
OFILES = ai_main.o ai_util.o ai_wpnav.o bg_g2_utils.o bg_misc.o bg_panimate.o \
	   bg_pmove.o bg_saber.o bg_slidemove.o bg_weapons.o \
	   g_active.o g_arenas.o g_bot.o g_client.o g_cmds.o \
	   g_combat.o g_items.o g_log.o g_main.o g_mem.o g_misc.o \
         g_missile.o g_mover.o g_object.o g_saga.o g_session.o g_spawn.o \
         g_svcmds.o g_syscalls.o g_target.o g_team.o g_trigger.o \
         g_utils.o g_weapon.o q_math.o q_shared.o w_force.o w_saber.o

$(TARGET): $(OFILES)
	$(CC) -shared -o $(TARGET) $(OFILES) -lm -pthread
	strip $(TARGET)

.c.o:
	$(CC) $(CFLAGS) -c $*.c -o $*.o

clean:
	rm -f $(OFILES)
	rm -f $(TARGET)
