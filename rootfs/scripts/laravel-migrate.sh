#!/usr/bin/with-contenv bash

source /opt/envars.sh

php /var/www/artisan migrate --force
echo "Running Laravel Migration"