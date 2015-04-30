@echo off
setlocal enableextensions
goto start
:showhelp
echo ******************************************************************************
echo ** Description: Batch file to start the ant script and execute the designer
echo ** Usage: initProject.bat "Project Name" "start"
echo **  "Project Name" - the name of the project to be created
echo **  "start"        - optional, if present BW Designer will be started
echo ** Example: initProject.bat MyProject start
echo ** Example: initProject.bat MyProject
echo ** Author: Hannes Lehmann
echo ******************************************************************************
goto end


:start
REM ----------- modify these values according to your setup --------------
set DESIGNER_PATH=E:\tib_homes\as_test\designer\5.9\bin
set DESIGNER_EXEC=designer.exe
set ANT_HOME=E:\programme\ant

set script_path=%CD%
set ANT_BIN=%ANT_HOME%\bin
set ANT_OPTS=-Xmx256M
set PATH=%PATH%;%ANT_BIN%
set BWPROJECT=%1
set STARTDESIGNER=%2

cd /d "%~dp0"

if "%BWPROJECT%" == "/?" (
    goto showhelp
)


call ant init -q
echo Project created

if "%STARTDESIGNER%" == "start" (
    cd /d %DESIGNER_PATH%
    echo starting designer....
	call %DESIGNER_EXEC% %script_path%\%BWPROJECT%
)

:end

