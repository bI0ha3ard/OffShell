@echo off

if "%~1"=="" (
    goto ShellG
) else (
    echo Start App Without Arguments!
    exit /b
)

:ShellG
cls
set /p sessionold= < "Session.ini"
set /a sessionnew=%sessionold%+1
echo %sessionnew% > "Session.ini"
set /p sessionneww= < "Session.ini"
title OffShell SessionID=%sessionneww%
Cmdmenusel.exe FBFB "Command Prompt" "PowerShell"
if "%errorlevel%"=="1" goto ShellCMDG
if "%errorlevel%"=="2" goto ShellPWSH
goto ShellG

:ShellPWSH
cls
chcp 65001
cls
color 65
goto Shell2
:Shell2
set /p command="%cd%> "
if /i "%command%" equ "cd.." goto Shell3
if /i "%command%" equ "cd" goto Shell4
powershell %command%
goto Shell2

:Shell3
cd..
goto Shell2

:Shell4
set /p drric="Directory Name> "
@cd %drric% > nul
goto Shell2

:ShellCMDG
cls
chcp 65001
cls
color 65
goto ShellCMD

:ShellCMD
set /p command="%cd%> "
cmd /k "%command%"
goto ShellCMD