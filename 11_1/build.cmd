@echo off

echo [BUILD] Checking configuration and pulling images...
docker compose config -q
if %errorlevel% neq 0 (
    echo [ERROR] Config check failed!
    pause
    exit /b %errorlevel%
)
docker compose pull
echo [SUCCESS] Images are ready.

pause
