Задача 1

Для зпуска контейнера с именем mysql_1 в фоновом режиме со следующими параметрами:
    использовать версию MySQL 8.4.0
    задать пароль very_secret для суперпользователя root
    создать базу данных с именем demo
    для БД demo создать пользователя user с паролем test
    для хранения данных сервера использовать том с именем dbdata
	
Для среды linux:
```
docker run -d \
  --name mysql_1 \
  -e MYSQL_ROOT_PASSWORD=test1234 \
  -e MYSQL_DATABASE=demo \
  -e MYSQL_USER=user \
  -e MYSQL_PASSWORD=test \
  -v dbdata:/var/lib/mysql \
  mysql:8.4.0
```

# 1. Остановить работающий контейнер
docker stop mysql_1

# 2. Удалить контейнер
docker rm mysql_1

# 3. Удалить именованный том с данными
docker volume rm dbdata

Задача 2

Для среды linux:
```
docker run -d \
  --name mysql_1 \
  -e MYSQL_ROOT_PASSWORD=test1234 \
  -e MYSQL_DATABASE=demo \
  -e MYSQL_USER=user \
  -e MYSQL_PASSWORD=test \
  -v dbdata:/var/lib/mysql \
  -v $(pwd)/init.sql:/docker-entrypoint-initdb.d/init.sql \
  mysql:8.4.0
```

я выполнил команды и получил:
pvn@asusA17:~/Lesson/5$ docker ps
CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS          PORTS                 NAMES
5f44fdfd0154   mysql:8.4.0   "docker-entrypoint.s…"   14 seconds ago   Up 13 seconds   3306/tcp, 33060/tcp   mysql_1
pvn@asusA17:~/Lesson/5$ docker logs mysql_1
2026-01-07 11:57:55+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.4.0-1.el9 started.
2026-01-07 11:57:55+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
2026-01-07 11:57:55+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.4.0-1.el9 started.
2026-01-07 11:57:56+00:00 [Note] [Entrypoint]: Initializing database files
2026-01-07T11:57:56.020592Z 0 [System] [MY-015017] [Server] MySQL Server Initialization - start.
2026-01-07T11:57:56.021769Z 0 [System] [MY-013169] [Server] /usr/sbin/mysqld (mysqld 8.4.0) initializing of server in progress as process 80
2026-01-07T11:57:56.033384Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
2026-01-07T11:57:56.274475Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
2026-01-07T11:57:57.668178Z 6 [Warning] [MY-010453] [Server] root@localhost is created with an empty password ! Please consider switching off the --initialize-insecure option.
2026-01-07T11:58:00.016892Z 0 [System] [MY-015018] [Server] MySQL Server Initialization - end.
2026-01-07 11:58:00+00:00 [Note] [Entrypoint]: Database files initialized
2026-01-07 11:58:00+00:00 [Note] [Entrypoint]: Starting temporary server
2026-01-07T11:58:00.089989Z 0 [System] [MY-015015] [Server] MySQL Server - start.
2026-01-07T11:58:00.387411Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.4.0) starting as process 125
2026-01-07T11:58:00.406352Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
2026-01-07T11:58:00.676015Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
2026-01-07T11:58:00.966010Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
2026-01-07T11:58:00.966053Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
2026-01-07T11:58:00.969131Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
2026-01-07T11:58:00.989685Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.4.0'  socket: '/var/run/mysqld/mysqld.sock'  port: 0  MySQL Community Server - GPL.
2026-01-07 11:58:01+00:00 [Note] [Entrypoint]: Temporary server started.
'/var/lib/mysql/mysql.sock' -> '/var/run/mysqld/mysqld.sock'
2026-01-07T11:58:01.243904Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Socket: /var/run/mysqld/mysqlx.sock
Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/leap-seconds.list' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/leapseconds' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/tzdata.zi' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.
2026-01-07 11:58:03+00:00 [Note] [Entrypoint]: Creating database demo
2026-01-07 11:58:03+00:00 [Note] [Entrypoint]: Creating user user
2026-01-07 11:58:03+00:00 [Note] [Entrypoint]: Giving user user access to schema demo

2026-01-07 11:58:03+00:00 [Note] [Entrypoint]: /usr/local/bin/docker-entrypoint.sh: running /docker-entrypoint-initdb.d/init.sql


2026-01-07 11:58:03+00:00 [Note] [Entrypoint]: Stopping temporary server
2026-01-07T11:58:03.173915Z 15 [System] [MY-013172] [Server] Received SHUTDOWN from user root. Shutting down mysqld (Version: 8.4.0).
2026-01-07T11:58:04.327433Z 0 [System] [MY-010910] [Server] /usr/sbin/mysqld: Shutdown complete (mysqld 8.4.0)  MySQL Community Server - GPL.
2026-01-07T11:58:04.327479Z 0 [System] [MY-015016] [Server] MySQL Server - end.
2026-01-07 11:58:05+00:00 [Note] [Entrypoint]: Temporary server stopped

2026-01-07 11:58:05+00:00 [Note] [Entrypoint]: MySQL init process done. Ready for start up.

2026-01-07T11:58:05.201089Z 0 [System] [MY-015015] [Server] MySQL Server - start.
2026-01-07T11:58:05.553107Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.4.0) starting as process 1
2026-01-07T11:58:05.560624Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
2026-01-07T11:58:05.831399Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
2026-01-07T11:58:06.079201Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
2026-01-07T11:58:06.079247Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
2026-01-07T11:58:06.082311Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
2026-01-07T11:58:06.100861Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.4.0'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server - GPL.
2026-01-07T11:58:06.418312Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Bind-address: '::' port: 33060, socket: /var/run/mysqld/mysqlx.sock

судя по логая все прошло успешно.
Далее через команду docker проверил таблицы:

pvn@asusA17:~/Lesson/5$ docker exec mysql_1 mysql -u user -ptest demo -e "SHOW TABLES;"
mysql: [Warning] Using a password on the command line interface can be insecure.
Tables_in_demo
task