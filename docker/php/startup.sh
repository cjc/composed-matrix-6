#!/bin/bash
echo 'Installing';
apt install -y sudo ssh

php install/step_01.php /app

chown -R www-data:www-data /app
cp /db.inc /app/data/private/conf/

sudo -u www-data php install/step_02.php /app/
sudo -u www-data php install/step_03.php /app/

php-fpm --nodaemonize