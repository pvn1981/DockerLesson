@echo off

echo [RUN] Starting Wordpress project...
docker compose up -d
echo [INFO] Waiting for containers to initialize...
echo [SUCCESS] Project is running at http://127.0.0.1

pause