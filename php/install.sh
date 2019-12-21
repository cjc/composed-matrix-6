#!/bin/bash

FILE=/app/data/private/system/.ssh/matrix_ssh_key.pub
if [ -f "$FILE" ]; then
  echo 'Matrix already installed, skipping'
else 
  echo "$FILE does not exist"
  echo 'Copying Matrix source to volume'
  cp -R /src/* /app/

  echo 'Installing';
  php /app/install/step_01.php /app

  chown -R www-data:www-data /app
  cp /db.inc /app/data/private/conf/

  sudo -u www-data php /app/install/step_02.php /app/
  sudo -u www-data php /app/install/step_03.php /app/
fi

php-fpm --nodaemonize
