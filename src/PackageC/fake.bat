@echo off

Set currentPath=%cd%

%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File .\fake.ps1 build.fsx  %*
if errorlevel 1 GOTO ERROR
GOTO END

:ERROR
echo "F E H L E R: Build nicht erfolgreich"
PAUSE

:END
echo ...Done

cd %currentPath%
