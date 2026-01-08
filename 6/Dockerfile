# Этап 1: development
FROM node:20.12-bookworm-slim AS development
WORKDIR /app

# Меняем владельца папки приложения для пользователя node
RUN chown node:node /app

USER node

COPY --chown=node:node package*.json ./

RUN npm install

COPY --chown=node:node . .

# Открываем порт 5173
EXPOSE 5173

# Запуск с флагом --host для доступа извне (0.0.0.0)
CMD ["npm", "run", "dev", "--", "--host"]


# Этап 2: build
FROM development AS build

RUN npm run build


# Этап 3: production (с использованием Nginx)
FROM nginx:alpine AS production-nginx

# Скопируйте ваш nginx.conf файл из хост-машины в контейнер
COPY virtual_host.conf /etc/nginx/conf.d/default.conf

# Скопируйте собранное приложение из этапа build 
# Теперь мы знаем, что оно будет в /app/dist благодаря измененному package.json
COPY --from=build /app/dist /var/www

# Открываем порт 80
EXPOSE 80
