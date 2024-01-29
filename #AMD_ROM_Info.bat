@echo off
title ATIFlash info batch
pushd %~dp0
::TODO 
echo;
echo ------------- Display info using ATIFlash -------------
echo;
echo;
echo ------------ Drop VBIOS file on this .bat -------------
echo;
echo;

:req
if NOT exist #ROM_Info\AMD\amdvbflash.exe (
	echo;
	echo #ROM_Info\AMD\amdvbflash.exe not found! Add it to the current folder.
	echo;
	pause
	exit
)


rem Admin rights from https://stackoverflow.com/questions/7044985/how-can-i-auto-elevate-my-batch-file-so-that-it-requests-from-uac-administrator

setlocal EnableDelayedExpansion

NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto START ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' ( goto START )

set "batchPath=%~f0"
set "batchArgs=ELEV"

::Add quotes to the batch path, if needed
set "script=%0"
set script=%script:"=%
IF '%0'=='!script!' ( GOTO PathQuotesDone )
    set "batchPath=""%batchPath%"""
:PathQuotesDone

::Add quotes to the arguments, if needed.
:ArgLoop
IF '%1'=='' ( GOTO EndArgLoop ) else ( GOTO AddArg )
    :AddArg
    set "arg=%1"
    set arg=%arg:"=%
    IF '%1'=='!arg!' ( GOTO NoQuotes )
        set "batchArgs=%batchArgs% "%1""
        GOTO QuotesDone
        :NoQuotes
        set "batchArgs=%batchArgs% %1"
    :QuotesDone
    shift
    GOTO ArgLoop
:EndArgLoop

::Create and run the vb script to elevate the batch file
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
ECHO UAC.ShellExecute "cmd", "/c ""!batchPath! !batchArgs!""", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%temp%\OEgetPrivileges.vbs"
if exist "%temp%\OEgetPrivileges.vbs" del "%temp%\OEgetPrivileges.vbs" >nul
exit /B

:START
::Remove the elevation tag and set the correct working directory
if '%1'=='ELEV' SHIFT /1
cd /d %~dp0

setlocal DisableDelayedExpansion


:catch
for %%i in (%*) do (
	set name=%%~ni
	set ext=%%~xi
	set vbios=%%~nxi
	set vbios_path=%%~dpnxi
	if NOT "%%i" == "ELEV" call :loop_main
	cls
)

exit

:loop_main

rem set var_test=%vbios_path:~-5%
rem if "%var_test%" == "\ELEV" exit /b

echo Dumping info from = %vbios% && echo; && echo;
#ROM_Info\AMD\amdvbflash.exe -biosfileinfo "%vbios_path%"
rem #ROM_Info\AMD\GopInfoX.exe "%vbios_path%"
echo; && echo;


:input
set /p inq=Do you want to install/uninstall the AMD FlashDriver? Press y for yes, any key for exit: 
if not defined inq exit /b
if /I "%inq%"=="y" (
echo;
#ROM_Info\AMD\AMDVBFlashDriverInstaller.exe
echo;
echo;
pause
)

exit