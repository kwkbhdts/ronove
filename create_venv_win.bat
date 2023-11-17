@echo off
echo ---- Start ----

set PYTHON_VERSION=
if "%~1"=="" (
    echo Input the python version to use. ^(e.g. 3.11^)
    set /P PYTHON_VERSION="> "
) else (
    set PYTHON_VERSION=%~1
)

echo ---- Checking python version ----
py -%PYTHON_VERSION% -V
if %ERRORLEVEL% neq 0 (
  echo Error occurred!
  exit /b
)

echo Creating venv ...
cd /d %~dp0
py -%PYTHON_VERSION% -m venv venv

echo ---- Creating activate_venv.bat ----
(
    echo cd /d %%~dp0
    echo cmd /k venv\Scripts\activate.bat
) > activate_venv.bat

echo ---- End ----
pause

@echo on
