# 1. Базовый образ
FROM node:20.12-bookworm-slim

# 2. Рабочая директория
WORKDIR /var/www

# 3. Установка веб-сервера
RUN npm install -g serve

# 4. Копирование файлов (из локальной папки www в /var/www образа)
COPY www .

# 5. Указание порта
EXPOSE 3000

# 6. Переключение на пользователя node
USER node

# 7. Команда запуска
CMD ["serve", "-s", "-p", "3000", "."]
