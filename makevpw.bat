@echo off
rem **********************
rem   .BAT file to compile Lex/Yacc with Virtual Pascal for Win32
rem   Output is a 32-bit protected mode Windows program.
rem   Assumes fPrint's VP command-line compiler 'vpc' is in %VP2BASE%
rem **********************

rem A quick hack by Antony T Curtis

if "%VP2BASE%"=="" SET VP2BASE=\VP20

SET PFLAGS=-co -m -$R- -$Q- -$S- -$I- -$M65536 -U%VP2BASE%\UNITS.W32 -L%VP2BASE%\LIB.W32

%VP2BASE%\BIN.W32\vpc %PFLAGS% lex
%VP2BASE%\BIN.W32\vpc %PFLAGS% lexlib
%VP2BASE%\BIN.W32\vpc %PFLAGS% yacc

