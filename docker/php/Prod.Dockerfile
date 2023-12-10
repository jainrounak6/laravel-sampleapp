ARG PHP_VERSION="latest"
FROM php:${PHP_VERSION}-fpm

LABEL maintainer="ROUNAK JAIN"

ARG NODE_VERSION="latest"

#Node configuration
RUN curl -SLO https://deb.nodesource.com/nsolid_setup_deb.sh && \
    chmod 500 nsolid_setup_deb.sh && \
    ./nsolid_setup_deb.sh $NODE_VERSION

# Install dependencies
RUN apt-get update && apt-get install -y -o 'Acquire::Retries=3' \
    build-essential \
    libc-client-dev \
    libonig-dev \
    libcurl4-gnutls-dev \
    libicu-dev \
    libzip-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libmcrypt-dev \
    libmemcached-dev \
    libsnmp-dev \
    libssl-dev  \
    libtasn1-6-dev \
    libtidy-dev \
    locales \
    jpegoptim optipng pngquant gifsicle \
    git \
    zip \
    unzip \
    vim \
    curl \
    cron \
    nodejs \
    supervisor

# Add docker php ext repo
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/


#  Install php extensions
RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions zip gd pdo_mysql exif memcached mysqli opcache curl intl imap mcrypt memcache pspell imagick redis sockets mbstring
# imagick

# Supervisor configuration
RUN mkdir -p /var/log/supervisor
COPY ./docker/php/app-queue.conf /etc/supervisor/conf.d/app-queue.conf

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose port 9000 and start php-fpm server
EXPOSE 9000

# Set working directory
WORKDIR /var/www/html

COPY . /var/www/html/

RUN composer install --no-dev && \
    npm ci && \
    npm run build

# EntryPoint
ENTRYPOINT ["./docker/php/start.sh"]

# CMD ["php-fpm"]
# CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/app-queue.conf"]
