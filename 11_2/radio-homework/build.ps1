# Останавливаем скрипт при возникновении ошибки
$ErrorActionPreference = "Stop"

Write-Host "--- Начинаем развертывание проекта radio-homework ---" -ForegroundColor Cyan

# 1. Проверка наличия необходимых конфигурационных файлов
$RequiredFiles = @("icecast.xml", "radio.liq", "nginx.conf")
foreach ($file in $RequiredFiles) {
    if (-not (Test-Path $file)) {
        Write-Error "Критическая ошибка: Файл конфигурации '$file' не найден в текущей директории!"
    }
}

# 2. Очистка старых контейнеров (опционально, для чистого запуска)
Write-Host "[1/3] Остановка и удаление старых контейнеров..." -ForegroundColor Yellow
docker compose down --remove-orphans

# 3. Сборка образа Icecast
Write-Host "[2/3] Сборка Docker-образа для Icecast..." -ForegroundColor Yellow
docker compose build icecast

# 4. Запуск всех сервисов в фоновом режиме
Write-Host "[3/3] Запуск сервисов радио..." -ForegroundColor Yellow
docker compose up -d

# 5. Проверка статуса
Write-Host "`nПроверка запущенных сервисов:" -ForegroundColor Cyan
docker compose ps

Write-Host "`n--- Готово! ---" -ForegroundColor Green
Write-Host "Радио должно быть доступно по адресу: http://127.0.0.1" -ForegroundColor White

pause