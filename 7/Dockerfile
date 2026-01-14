# 1. Объявляем переменную до первого FROM
ARG NODE_VERSION=node:24-bookworm-slim

# Этап 1 - development
FROM ${NODE_VERSION} AS development

# Указываем рабочую директорию
WORKDIR /app
RUN chown node:node /app

USER node

COPY --chown=node:node package*.json ./
RUN npm install

# Копируем остальные исходники
COPY --chown=node:node . .

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host"]


# Этап 2 - build
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
