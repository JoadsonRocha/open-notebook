@echo off
setlocal
cd /d "%~dp0"

echo ========================================================
echo           Iniciando Open Notebook Local
echo ========================================================
echo.

tasklist /fi "imagename eq surreal.exe" 2>nul | find /i "surreal.exe" >nul
if errorlevel 1 (
    echo [1/4] Iniciando SurrealDB...
    start "SurrealDB" /min .venv\Scripts\surreal.exe start --bind 127.0.0.1:8000 --user root --pass root surrealkv://data/surreal_data/database.db
    timeout /t 2 /nobreak >nul
) else (
    echo [1/4] SurrealDB ja esta em execucao.
)

tasklist /fi "imagename eq python.exe" 2>nul | find /i "python.exe" >nul
if errorlevel 1 (
    echo [2/4] Iniciando API Backend...
    start "OpenNotebook_API" /min .venv\Scripts\python.exe run_api.py
    timeout /t 3 /nobreak >nul
) else (
    echo [2/4] API Backend ja esta em execucao.
)

tasklist /fi "imagename eq surreal-commands-worker.exe" 2>nul | find /i "surreal-commands-worker.exe" >nul
if errorlevel 1 (
    echo [3/4] Iniciando Background Worker...
    start "OpenNotebook_Worker" /min .venv\Scripts\surreal-commands-worker.exe --import-modules commands --max-tasks 5
    timeout /t 2 /nobreak >nul
) else (
    echo [3/4] Background Worker ja esta em execucao.
)

tasklist /fi "imagename eq node.exe" 2>nul | find /i "node.exe" >nul
if errorlevel 1 (
    echo [4/4] Iniciando Frontend Next.js...
    start "OpenNotebook_Frontend" /min cmd /c "cd frontend && npm run dev"
    timeout /t 4 /nobreak >nul
) else (
    echo [4/4] Frontend Next.js ja esta em execucao.
)

echo.
echo ========================================================
echo   Open Notebook pronto!
echo   Abrindo http://localhost:3000 no navegador...
echo ========================================================
echo.

start http://localhost:3000

timeout /t 3 /nobreak >nul
