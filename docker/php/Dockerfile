#FROM php:7.2.13-fpm-alpine3.8
FROM gytist/php-fpm-v8js

COPY www.conf /usr/local/etc/php-fpm.d/www.conf

WORKDIR /app

COPY startup.sh /startup.sh
COPY db.inc /db.inc

#Install Matrix prereqs https://matrix.squiz.net/resources/requirements
RUN apt update
RUN apt install -y libxslt1-dev libpq-dev libpng-dev libpspell-dev libldap2-dev sudo ssh

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql
RUN docker-php-ext-install xsl gd pspell intl ldap soap

CMD ["php-fpm", "--nodaemonize"]
#ENTRYPOINT ["/startup.sh"]
