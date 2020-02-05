#!/bin/bash

FILE=/app/data/private/system/.ssh/matrix_ssh_key.pub
if [ -f "$FILE" ]; then
  echo 'Matrix already installed, skipping'
else 
  echo "$FILE does not exist"
  echo "Waiting 5 seconds to give postgres a chance to come up because docker-compose healthcheck appears to not actually work"
  sleep 5
  echo 'Copying Matrix source to volume'
  tar -xzf /src/matrix*.tgz -C /app/
  find /src/packages/*.tgz -exec tar -xzf {} -C /app/ \;

  echo 'Installing';
  php /app/install/step_01.php /app

  chown -R www-data:www-data /app
  cp /db.inc /app/data/private/conf/

  cp /initialise.php /app/initialise.php

  sudo -u www-data php /app/initialise.php $MATRIX_URL

  sudo -u www-data php /app/install/step_02.php /app/
  sudo -u www-data php /app/install/step_03.php /app/

  grep "SQ_CONF_SYSTEM_ROOT_URLS" /app/data/private/conf/main.inc

fi

php-fpm --nodaemonize
