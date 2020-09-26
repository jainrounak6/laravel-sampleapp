#!/bin/bash

# Update nginx to match worker_processes to no. of cpu's
#procs=$(cat /proc/cpuinfo | grep processor | wc -l)
#sed -i -e "s/worker_processes  1/worker_processes $procs/" /etc/nginx/nginx.conf

# Start supervisord and services
MYSQL_PASSWORD=test123
MYSQL_USER=testuser
MYSQL_DATABASE=testdb

docker-entrypoint.sh
service mysql start
mysql -e "CREATE DATABASE $MYSQL_DATABASE;CREATE USER $MYSQL_USER@localhost identified by '$MYSQL_PASSWORD';GRANT ALL ON $MYSQL_DATABASE.* to $MYSQL_USER@localhost WITH GRANT OPTION; FLUSH PRIVILEGES;"
php artisan key:generate
php artisan storage:link
/usr/local/bin/supervisord -n -c /etc/supervisord.conf
