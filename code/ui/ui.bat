@set include=
@set savedpath=%path%
@set path=%path%;..\..\..\bin

del /q vm
if not exist vm\nul mkdir vm
cd vm

..\..\..\bin\lcc -DQ3_VM -DUI_EXPORTS -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\ui %1 ../ui_main.c
@if errorlevel 1 goto quit
..\..\..\bin\lcc -DQ3_VM -DUI_EXPORTS -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\ui %1 ../../game/bg_misc.c
@if errorlevel 1 goto quit
..\..\..\bin\lcc -DQ3_VM -DUI_EXPORTS -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\ui %1 ../../game/bg_weapons.c
@if errorlevel 1 goto quit
..\..\..\bin\lcc -DQ3_VM -DUI_EXPORTS -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\ui %1 ../../game/bg_lib.c
@if errorlevel 1 goto quit
..\..\..\bin\lcc -DQ3_VM -DUI_EXPORTS -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\ui %1 ../../game/q_math.c
@if errorlevel 1 goto quit
..\..\..\bin\lcc -DQ3_VM -DUI_EXPORTS -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\ui %1 ../../game/q_shared.c
@if errorlevel 1 goto quit
..\..\..\bin\lcc -DQ3_VM -DUI_EXPORTS -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\ui %1 ../ui_atoms.c
@if errorlevel 1 goto quit
..\..\..\bin\lcc -DQ3_VM -DUI_EXPORTS -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\ui %1 ../ui_force.c
@if errorlevel 1 goto quit
..\..\..\bin\lcc -DQ3_VM -DUI_EXPORTS -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\ui %1 ../ui_shared.c
@if errorlevel 1 goto quit
..\..\..\bin\lcc -DQ3_VM -DUI_EXPORTS -S -Wf-target=bytecode -Wf-g -I..\..\cgame -I..\..\game -I..\..\ui %1 ../ui_gameinfo.c
@if errorlevel 1 goto quit

..\..\..\bin\q3asm -f ../ui
@if errorlevel 1 goto quit

:quit
@set path=%savedpath%
@set savedpath=

cd ..
