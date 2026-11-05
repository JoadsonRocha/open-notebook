@echo off
setlocal
echo Parando servicos do Open Notebook...

taskkill /f /im surreal.exe >nul 2>&1
taskkill /f /im surreal-commands-worker.exe >nul 2>&1
taskkill /f /im python.exe /fi "WINDOWTITLE eq OpenNotebook*" >nul 2>&1
taskkill /f /im cmd.exe /fi "WINDOWTITLE eq OpenNotebook*" >nul 2>&1

echo Servicos encerrados com sucesso!
pause
