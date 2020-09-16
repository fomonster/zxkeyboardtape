echo on
rem ..\snasm -map -subtype=tap %1 %~n1.tap
.\dev\sjasmplus.exe %1
if ERRORLEVEL 1 goto doexit

rem ..\CSpect.exe  -s14 -w3 -cur -brk -map=%~n1.tap.map -zxnext -mmc=.\ %~n1.tap
.\dev\emul\Speccy.exe .\%~n1.tap

:doexit

