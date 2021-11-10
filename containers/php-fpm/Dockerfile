
FROM php:8.0-fpm-alpine

ARG gd=0
ARG imagick=0
ARG xdebug=0

RUN apk add --update --no-cache \
  autoconf \
  freetype \
  freetype-dev \
  g++ \
  icu-dev \
  imagemagick \
  imagemagick-dev \
  jpeg-dev \
  libjpeg-turbo \
  libjpeg-turbo-dev \
  libpng \
  libpng-dev \
  libtool \
  libzip-dev \
  make \
  pcre-dev \
  zip 

RUN docker-php-ext-install -j$(nproc) \
  exif \
  pdo \
  pdo_mysql \
  sockets \
  zip

RUN docker-php-ext-configure intl && docker-php-ext-install intl

RUN if [ $gd = 1 ] ; then \
  docker-php-ext-configure gd --with-jpeg \
  && docker-php-ext-install gd; \
fi;

RUN if [ $imagick = 1 ] ; then \
  pecl install imagick \
  && docker-php-ext-enable imagick; \
fi;

RUN if [ $xdebug = 1 ] ; then \
    pecl install -f xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.start_with_request=trigger" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_handler=dbgp" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.client_port=9003" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.client_host=172.17.0.1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.idekey='PHPSTORM'" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    docker-php-ext-enable xdebug; \
fi;

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# RUN composer install
# RUN php artisan key:generate
# RUN cat server.php
