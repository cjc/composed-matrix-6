#FROM php:7.2.13-fpm-alpine3.8
FROM gytist/php-fpm-v8js

COPY www.conf /usr/local/etc/php-fpm.d/www.conf

WORKDIR /app


#Install Matrix prereqs https://matrix.squiz.net/resources/requirements
RUN apt update
RUN apt install -y libxslt1-dev libpq-dev libpng-dev libpspell-dev libldap2-dev sudo ssh

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql
RUN docker-php-ext-install xsl gd pspell intl ldap soap

RUN pecl install -o -f redis \
&&  rm -rf /tmp/pear \
&&  echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini

RUN docker-php-ext-install pcntl

#Copy matrix source into webroot
COPY src /src


#Copy preconfigured db config file and install script
COPY install.sh /install.sh
COPY db.inc /db.inc
COPY initialise.php /initialise.php

#CMD ["php-fpm", "--nodaemonize"]
ENTRYPOINT ["/install.sh"]
