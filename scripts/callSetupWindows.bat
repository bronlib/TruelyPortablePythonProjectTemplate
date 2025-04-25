@echo OFF

:: state the python version you wish to use
set target_version=3.13.2

:: directories that are to be added to PYTHONPATH. Same level as Python
set source_dirs=source\src source\tests

:: The rest is standard.....

set STARTDIR="%~dp0"

set target_pythondir="%~dp0..\..\win_Python%target_version%"

::the pyenv that will be used:
set pyenv_gi_url="https://github.com/pyenv-win/pyenv-win/archive/refs/heads/master.zip"
set pyenv_git_name=pyenv-win-master.zip
set pyenv_dir=%startdir%\pyenv

set PYENV=%startdir%\pyenv\pyenv-win
set PYENV_ROOT=%startdir%\pyenv\pyenv-win
set PYENV_HOME=%startdir%\pyenv\pyenv-win
set PATH=%startdir%\pyenv\pyenv-win\bin;%PATH%



IF EXIST %target_pythondir% call:create_update

IF EXIST %pyenv_dir% call:pyenv_exists

IF EXIST  %pyenv_git_name%  call :pyenv_unzip

REM  curl to download the file
curl -L  %pyenv_gi_url% --output %pyenv_git_name%

:: Check if the download was successful
if exist %pyenv_git_name% (
    echo Download of pyenv successful!	
) else (
    echo Download of pyenv failed!
	goto END
)

:pyenv_unzip

tar -xf %pyenv_git_name%

rename pyenv-win-master pyenv

:pyenv_exists

call pyenv\pyenv-win\bin\pyenv install  %target_version%


IF EXIST "%~dp0\pyenv\pyenv-win\versions\%target_version%" call:MOVING
echo "Failed to get %target_version% Please look at errors to correct"
EXIT /b
:MOVING

move "%~dp0\pyenv\pyenv-win\versions\%target_version%"  %target_pythondir%


:create_update
REM Clean up unneeded directories if they exist
IF EXIST "%~dp0\pyenv" RMDIR /S /Q "%~dp0\pyenv" 
IF EXIST  %pyenv_git_name%   del %pyenv_git_name%

echo Creating Update

FOR %%a IN (%source_dirs%) DO (
IF NOT EXIST "%~dp0..\..\%%a" (mkdir "%~dp0..\..\%%a" )
)


%target_pythondir%\python.exe  "%~dp0\updatescriptfiles.py"

:END
CMD.EXE /k
