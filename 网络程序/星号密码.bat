@echo off
set /p=����������,��a����:<nul
:loop
choice /C abcdefghijklmnopqrstuvwxyz /N >nul
if %ERRORLEVEL% equ 1 goto :out
set /p=*<nul
goto :loop


:out
echo ok!
pause>nul