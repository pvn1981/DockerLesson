FROM debian:bookworm-slim

# Установка необходимых пакетов и очистка кэша
RUN apt-get update && apt-get install -y \
    icecast2 \
    media-types \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Перенаправление логов в stdout и stderr (Docker Way)
RUN ln -sf /dev/stdout /var/log/icecast2/access.log \
    && ln -sf /dev/stderr /var/log/icecast2/error.log

# Работа от пользователя icecast2
USER icecast2

# Команда запуска с указанием конфига
CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]