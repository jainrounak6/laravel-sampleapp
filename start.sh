#!/bin/bash

# Update nginx to match worker_processes to no. of cpu's
#procs=$(cat /proc/cpuinfo | grep processor | wc -l)
#sed -i -e "s/worker_processes  1/worker_processes $procs/" /etc/nginx/nginx.conf

# Start supervisord and services
MYSQL_USER=testuser
MYSQL_DATA_DIR=/var/lib/mysql
MYSQL_RUN_DIR=/run/mysqld
MYSQL_LOG_DIR=/var/log/mysql
MYSQL_DATABASE=testdb
MYSQL_PASSWORD=test123
MYSQL_ROOT_PASSWORD=test123
php artisan key:generate
docker-entrypoint.sh
service mysql start
/usr/local/bin/supervisord -n -c /etc/supervisord.conf
