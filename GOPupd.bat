@echo off
title GOP Updater
pushd %~dp0

:extra_args
:: Use ROMSCAN=1 for displaying ROM container and structure.
:: Use ISBN=1 for extracting certificate.
:: Use DEBUG=1 for displaying Nvidia certificate container and structure.
:: Use PATCHED=1 for using AMD patched GOP.
set ISBN=0
set DEBUG=0
set ROMSCAN=0
set PATCHED=0
if "%DEBUG%" == "1" (set DEBUG=-DEBUG) else set DEBUG=
if "%ROMSCAN%" == "1" (set ROMSCAN=-ROMSCAN) else set ROMSCAN=
if "%ISBN%" == "1" (set ISBN=-ISBN) else set ISBN=
if "%PATCHED%" == "1" (set PATCHED=-PATCHED) else set PATCHED=

:req
if NOT exist UEFIRomExtract.exe (
	echo;
	echo UEFIRomExtract.exe not found! Add it to the current folder.
	echo;
	pause
	exit
)
if NOT exist cecho.exe (
	echo;
	echo cecho.exe not found! Add it to the current folder.
	echo;
	pause
	exit
)


rem Admin rights from https://stackoverflow.com/questions/7044985/how-can-i-auto-elevate-my-batch-file-so-that-it-requests-from-uac-administrator

setlocal EnableDelayedExpansion

NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto START ) else ( goto getPrivileges )

:getPrivileges
rem echo All args before elev = %* && pause
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
rem echo All args after elev = %* && pause
if '%1'=='ELEV' SHIFT /1
rem echo First arg after shift = %1 && pause
rem echo All args after shift = %* && pause
cd /d %~dp0

setlocal DisableDelayedExpansion


:header
echo;
cecho {lime}************************* GOPupd 1.9.6.5.k mod v0.5 ************************* {default}{\n}
echo;
echo;
cecho {lime}************************ Drop VBIOS file on this .bat *********************** {default}{\n}
echo;
echo;

:Python_EXE
rem Use exec=Python or exec=GOPupd
set exec=GOPupd
rem Set to Python3 path or leave empty for automated select.
set py_exe=
rem No exe, no script, no choice
if NOT exist GOPupd.exe set exec=Python
rem Get Python3 path
if "%exec%" == "Python" if "%py_exe%" == "" if exist C:\Python38\ (set py_exe=C:\Python38\python.exe)
if "%exec%" == "Python" if "%py_exe%" == "" if exist C:\Python37\ (set py_exe=C:\Python37\python.exe)
if "%exec%" == "Python" if "%py_exe%" == "" if exist C:\Python36\ (set py_exe=C:\Python36\python.exe)
if "%exec%" == "Python" if "%py_exe%" == "" if exist %LocalAppData%\Programs\Python\Python38\ (set py_exe=%LocalAppData%\Programs\Python\Python38\python.exe)
if "%exec%" == "Python" if "%py_exe%" == "" if exist %LocalAppData%\Programs\Python\Python37\ (set py_exe=%LocalAppData%\Programs\Python\Python37\python.exe)
if "%exec%" == "Python" if "%py_exe%" == "" if exist %LocalAppData%\Programs\Python\Python36\ (set py_exe=%LocalAppData%\Programs\Python\Python36\python.exe)
if "%exec%" == "Python" if "%py_exe%" == "" for /F "delims=" %%D in ('dir /B /A:D /O:N "C:\Python3*"') do (set py_exe=C:\%%~D\python.exe)
if "%exec%" == "Python" if "%py_exe%" == "" for /F "delims=" %%D in ('dir /B /A:D /O:N "%LocalAppData%\Programs\Python\Python3*"') do (set py_exe=%LocalAppData%\Programs\Python\%%~D\python.exe)
if "%exec%" == "Python" if "%py_exe%" == "" for %%X in (python.exe) do (set py_exe=%%~$PATH:X)
rem Select between GOPupd.py and GOPupd.exe
if NOT "%py_exe%" == "" (set gop_script="%py_exe%" GOPupd.py) else set gop_script=GOPupd.exe
if NOT "%py_exe%" == "" cecho {lime}Using python from %py_exe%{default}{\n} && echo;
if "%gop_script%" == "GOPupd.exe" set exec=GOPupd
if "%gop_script%" == "GOPupd.exe" cecho {lime}Using python from %exec%{default}{\n} && echo;


:catch
set first_arg=%~1
if "%first_arg%" == "" cecho {yellow}Drop the files on this bat, DON'T run it! Browsing for file...{default}{\n} && echo; && pause && echo; && goto select_file
for %%i in (%*) do (
	set name=%%~ni
	set ext=%%~xi
	set vbios=%%~nxi
	set vbios_path=%%~dpnxi
	if NOT "%%i" == "ELEV" call :loop_main && cls
)
exit

:select_file
rem Function taken from UBU - http://www.win-raid.com/t154f16-Tool-Guide-News-quot-UEFI-BIOS-Updater-quot-UBU.html
setlocal
for /f "usebackq delims=" %%i in (
	`@"%systemroot%\system32\mshta.exe" "about:<FORM><INPUT type='file' name='qq'></FORM><script>document.forms[0].elements[0].click();var F=document.forms[0].elements[0].value;try {new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).Write(F)};catch (e){};close();</script>" ^
	1^|more`
) do (set name=%%~ni) && (set ext=%%~xi) && (set vbios=%%~nxi) && set vbios_path=%%~dpnxi
if "%vbios_path%" == "" cecho {yellow}No file was selected. Drop the files or launch and select a file...{default}{\n} && echo; && pause && exit
endlocal && (set name=%name%) && (set ext=%ext%) && (set vbios=%vbios%) && set vbios_path=%vbios_path%
call :loop_main
exit

:loop_main

cecho {aqua}Dumping info from = {gray}%vbios% {default}{\n} && echo; && echo;

:extefirom
if not exist "%vbios%"_temp\ mkdir "%vbios%"_temp
if exist "%vbios%"_newGOP\ rmdir /s /q "%vbios%"_newGOP\
if exist "%vbios%"_temp\\"%name%"_compr.efirom del "%vbios%"_temp\\"%name%"_compr.efirom >nul
if exist "%vbios%"_temp\\"%name%"_dump.efi del "%vbios%"_temp\\"%name%"_dump.efi >nul
%gop_script% "%vbios_path%" ext_efirom


:dumpinfo
if not exist "%vbios%"_temp\\"%name%"_compr.efirom goto gopupdate
echo;
cecho {olive}*************************************************************** {default}{\n}
cecho {olive}***         Extracting with UEFIRomExtract by AndyV         *** {default}{\n}
cecho {olive}*************************************************************** {default}{\n}
echo;
UEFIRomExtract.exe "%vbios%"_temp\\"%name%"_compr.efirom "%vbios%"_temp\\"%name%"_dump.efi
set efi_nr=2
:multi_efi
rem for %%i in ("%vbios%_temp\\%name%_compr_nr*.efirom") do echo %%i && UEFIRomExtract.exe %%i "%vbios%"_temp\\"%name%"_dump_nr%efi_nr%.efi && set /a efi_nr+=1&& goto multi_efi
if exist "%vbios%"_temp\\"%name%"_compr_nr%efi_nr%.efirom UEFIRomExtract.exe "%vbios%"_temp\\"%name%"_compr_nr%efi_nr%.efirom "%vbios%"_temp\\"%name%"_dump_nr%efi_nr%.efi && set /a efi_nr+=1&& goto multi_efi
echo;
cecho {maroon}--------------------------------------------------------------- {default}{\n}
echo;


:gopupdate
if not exist "%vbios%"_temp\\"%name%"_dump.efi cecho {red}No EFI ROM found or error on decompression !!! {default}{\n} && echo;
if exist "%vbios%"_temp\\"%name%"_compr.efirom if not exist "%vbios%"_temp\\"%name%"_dump.efi ren "%vbios%"_temp "%vbios%"_error
rem echo;
cecho {green}*************************************************************** {default}{\n}
cecho {green}***                Extracting with %exec%...                *** {default}{\n}
cecho {green}*************************************************************** {default}{\n}
echo;
%gop_script% "%vbios_path%" gop_upd %PATCHED% %ROMSCAN% %ISBN% %DEBUG%
echo;
cecho {maroon}--------------------------------------------------------------- {default}{\n}

goto exit_gop

if "%ISBN%" == "0" goto exit_gop

:isbn_info
echo;
cecho {green}*************************************************************** {default}{\n}
cecho {green}***                Processing ISBN signature                *** {default}{\n}
cecho {green}*************************************************************** {default}{\n}
echo;
%gop_script% "%vbios_path%" -ISBN %DEBUG%
echo;
cecho {maroon}--------------------------------------------------------------- {default}{\n}

:exit_gop
echo; && echo; && echo Press any key to exit.. && pause>nul
if exist "%vbios%"_temp\ rmdir /s /q "%vbios%"_temp\
exit /b