#!/bin/bash

echo "running file permissions"

chown -R nginx:nginx /var/www

# Laravel 4
if [ -d /var/www/app/storage ]; then
    chmod -R 0777 /var/www/app/storage
# Laravel 5
elif [ -d /var/www/storage ]; then
    chmod -R 0777 /var/www/storage
fi
