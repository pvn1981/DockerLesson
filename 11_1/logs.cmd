@echo off

echo [LOGS] Attaching to container logs (Press Ctrl+C to exit)...

rem Общий поток: docker compose logs собирает логи со всех трех сервисов сразу, помечая их разными цветами. 
rem запросы к Nginx, и ошибки PHP (если они будут), и процесс инициализации базы данных.
docker compose logs -f