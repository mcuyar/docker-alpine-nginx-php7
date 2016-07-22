#!/usr/bin/with-contenv bash

php /var/www/artisan migrate --force
echo "Running Laravel Migration"