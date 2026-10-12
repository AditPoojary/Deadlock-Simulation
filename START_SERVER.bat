@echo off
cd /d "%~dp0"
echo.
echo ============================================
echo   Deadlock Detection Simulator
echo ============================================
echo.
echo   Opening http://localhost:8000 ...
echo   (You can also just double-click index.html)
echo.
echo   Press Ctrl+C to stop the server.
echo ============================================
start http://localhost:8000
python -m http.server 8000
pause
