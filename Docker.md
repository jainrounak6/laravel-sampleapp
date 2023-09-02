# Laravel Docker Environment Setup

<p align="center">
  <a href="https://laravel.com" target="_blank">
    <img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400">
  </a>
</p>
<p align="center">
  <img src="docker-compose-logo.png?raw=true" alt="Docker Compose Logo">
</p>


This guide provides steps for setting up a Docker environment for Laravel applications. Follow these steps to quickly configure your development or production environment.

## Steps

### Step 1 - Docker environment and version details
1. Copy the `.env.docker.example` file to either `.env.docker.dev` or `.env.docker.prod`.
2. Modify the contents of the chosen `.env.docker` file.

Example `.env.docker.dev` content:

```dotenv
COMPOSE_PROJECT_NAME=myapp
PHP_VERSION=8.2
MYSQL_VERSION=8.0
NODE_VERSION=18
MAILPIT_VERSION=latest

#MySQL
MYSQL_PORT=3306
MYSQL_DATABASE=mydb
MYSQL_USER=mysqluser
MYSQL_PASSWORD=secret
MYSQL_ROOT_PASSWORD=root_secret
MYSQL_ALLOW_EMPTY_PASSWORD=yes

#NGINX
NGINX_PORT=80
NGINX_SSL_PORT=443

#MAILPIT
MAIL_PORT=1025
MAIL_DASHBOARD_PORT=8025

#REDIS
REDIS_PORT=6379
```

### Step 2 - Build image using docker environment file
Run the Laravel application along with the required services/containers using the Docker environment file:

```
docker-compose --env-file .env.docker.dev up --build
```

For Prod environment
```
docker-compose -f docker-compose-prod.yml --env-file .env.docker.prod build
```

### Step 3 - App configuration
Update the database configuration in your Laravel .env file:

```dotenv
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=mydb
DB_USERNAME=mysqluser
DB_PASSWORD=secret
```

### Step 4 - Run commands under docker container
Run the following commands within the Laravel application container:

```dotenv
docker exec -it <container-name> php artisan key:generate
docker exec -it <container-name> php artisan migrate
docker exec -it <container-name> php artisan db:seed
docker exec -it <container-name> php artisan config:cache
```

If your application uses Node.js and Mix, run:
```
docker exec -it <container-name> npm run build
```

Accessing Containers
To access any container, use the following command:

```
docker exec -it <container-name> bash
```

For example:

```
docker exec -it <container-name> bash
```

### Services and Default Ports

| Service       | Default Port |
|---------------|--------------|
| **PHP**       | 9000         |
| **Nginx**     | 80           |
| **Nginx SSL** | 443          |
| **MySQL**     | 3306         |
| **Mailpit**   | 8025 (Dashboard), 1025 (Server) |
| **Redis**     | 6379         |


### Additional Commands

| Command                              | Description                 |
|--------------------------------------|-----------------------------|
| `docker rm -f <container-name>`      | Remove a container          |
| `docker rm -f $(docker ps -aq)`      | Remove all containers       |
| `docker rmi -f <container-name>`     | Remove an image             |



Remember to adjust port configurations if running multiple projects.

# _License & Support_
##### _Developer : [Rounak Jain](mailto:jainrounak1997@outlook.com)_
