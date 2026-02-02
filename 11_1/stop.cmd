@echo off

echo [STOP] Stopping and removing containers...
docker compose down
echo [SUCCESS] Project stopped.

pause