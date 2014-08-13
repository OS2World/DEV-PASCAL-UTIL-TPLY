@echo off
rem **********************
rem   .CMD file to compile Lex/Yacc with Virtual Pascal for OS/2
rem   Output is a 32-bit protected mode OS/2 program.
rem   Assumes fPrint's VP command-line compiler 'vpc' is in %VP2BASE%
rem **********************

rem A quick hack by Antony T Curtis

if "%VP2BASE%"=="" SET VP2BASE=\VP20

SET PFLAGS=-co -m -$R- -$Q- -$S- -$I- -$M65536 -U%VP2BASE%\UNITS.OS2 -L%VP2BASE%\LIB.OS2

%VP2BASE%\BIN.OS2\vpc %PFLAGS% lex
%VP2BASE%\BIN.OS2\vpc %PFLAGS% lexlib
%VP2BASE%\BIN.OS2\vpc %PFLAGS% yacc

