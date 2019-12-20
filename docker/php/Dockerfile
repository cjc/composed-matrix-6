#FROM php:7.2.13-fpm-alpine3.8
FROM gytist/php-fpm-v8js

COPY www.conf /usr/local/etc/php-fpm.d/www.conf

WORKDIR /app

CMD ["php-fpm", "--nodaemonize"]
