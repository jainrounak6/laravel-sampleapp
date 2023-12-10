#!/bin/bash

# if [ ! -f .env ];
# then
#     echo ".env file does not exist!"
#     cp .env.example .env
#     php artisan key:generate
#     echo "Please enter the database details in .env file and then run the below command to run the migration\n php /var/www/html/artisan migrate:fresh --seed"
# else
#     echo ".env file already exist!"
#     php /var/www/html/artisan migrate
# fi

chmod 777 -R storage

if [ -d "vendor" ]; then
    echo "Composer Packages already exists...."
else
    composer install
fi

if [ -d "node_modules" ]; then
    echo "Node Modules already exists...."
else
    npm install
    npm run build
fi

/usr/bin/supervisord -n -c /etc/supervisor/conf.d/app-queue.conf

# exit 0
