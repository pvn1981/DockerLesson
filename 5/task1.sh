docker run -d \
  --name mysql_1 \
  -e MYSQL_ROOT_PASSWORD=test1234 \
  -e MYSQL_DATABASE=demo \
  -e MYSQL_USER=user \
  -e MYSQL_PASSWORD=test \
  -v dbdata:/var/lib/mysql \
  mysql:8.4.0

