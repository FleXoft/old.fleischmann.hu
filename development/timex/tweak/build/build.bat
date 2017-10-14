@ECHO OFF

REM ********************************************************************
REM *
REM * M851 PERIODIC TASK BUILDER
REM * Timex Corporation 2002 All Rights Reserved
REM * July 2002
REM *
REM * Periodic Task: Tweak
REM *
REM ********************************************************************

rem ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
rem ; Clean up wristapp build directory
rem ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

cd c:\m851\app\tweak\build

del *.sre
del *.bin
del *.lst
del *.obj
del *.out
del *.err
del *.lnl
del *.cal
del *.bak
del *.ers
del *.elk
del *.elc

rem ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
rem ; Build all Sections
rem ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

rem Build second Handler
c:\c88\bin\as88.exe second.asm -fascmd.cmd
c:\c88\bin\lk88.exe second.obj -o second.out -flkcmd.cmd
c:\c88\bin\lc88.exe second.out -o second.sre -flccmd.cmd

rem Build minute Handler
c:\c88\bin\as88.exe minute.asm -fascmd.cmd
c:\c88\bin\lk88.exe minute.obj -o minute.out -flkcmd.cmd
c:\c88\bin\lc88.exe minute.out -o minute.sre -flccmd.cmd

rem Build hour Handler
c:\c88\bin\as88.exe hour.asm -fascmd.cmd
c:\c88\bin\lk88.exe hour.obj -o hour.out -flkcmd.cmd
c:\c88\bin\lc88.exe hour.out -o hour.sre -flccmd.cmd

rem Build daily Handler
c:\c88\bin\as88.exe daily.asm -fascmd.cmd
c:\c88\bin\lk88.exe daily.obj -o daily.out -flkcmd.cmd
c:\c88\bin\lc88.exe daily.out -o daily.sre -flccmd.cmd


rem ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
rem ; Delete temporary files
rem ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

del *.out
del *.sy
del *.tmp
del *.lnl
del *.cal
