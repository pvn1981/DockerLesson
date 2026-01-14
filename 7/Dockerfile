# 1. Объявляем переменную до первого FROM
ARG NODE_VERSION=node:24-bookworm-slim

# Этап 1 - development
FROM ${NODE_VERSION} AS development

# Указываем рабочую директорию
WORKDIR /app
RUN chown node:node /app

USER node

# Копируем package.json из папки app (на хосте) в текущую директорию /app (в контейнере)
COPY --chown=node:node package*.json ./
RUN npm install

# Копируем остальные исходники
COPY --chown=node:node . .

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host"]


# Этап 2 - build
FROM development AS build
# Здесь файлы лежат в /app, команда создаст /app/dist
RUN npm run build


# Этап 3 - production
FROM ${NODE_VERSION} AS production

WORKDIR /var/www

RUN npm install -g serve

# ИСПРАВЛЕНО: Копируем из /app/dist, так как WORKDIR на этапе build был /app
COPY --from=build /app/dist .

RUN chown -R node:node /var/www

USER node

EXPOSE 5173

CMD ["serve", "-s", "-p", "5173", "."]
