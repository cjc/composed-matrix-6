FROM nkahoang/docker-v8js-php:php7.3-fpm-v8js7.9

COPY www.conf /usr/local/etc/php-fpm.d/www.conf

WORKDIR /app


#Install Matrix prereqs https://matrix.squiz.net/resources/requirements
RUN apt update
RUN apt install -y libxslt1-dev libpq-dev libpng-dev libpspell-dev libldap2-dev sudo ssh uuid-dev

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql
RUN docker-php-ext-install xsl gd pspell intl ldap soap

RUN pecl install -o -f redis \
&&  rm -rf /tmp/pear \
&&  echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini

RUN pecl install -o -f uuid \
&&  rm -rf /tmp/pear \
&&  echo "extension=uuid.so" > /usr/local/etc/php/conf.d/uuid.ini

RUN docker-php-ext-install pcntl

#Copy matrix source into webroot
COPY src /src

COPY public /public

#Copy preconfigured db config file and install script
COPY install.sh /install.sh
COPY db.inc /db.inc
COPY initialise.php /initialise.php

#CMD ["php-fpm", "--nodaemonize"]
ENTRYPOINT ["/install.sh"]
