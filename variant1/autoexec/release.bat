echo off
.\dev\snasm -map %1 %~n1.sna
if ERRORLEVEL 1 goto doexit


:doexit

