#!/bin/bash

echo "running file permissions"

chown -R nginx:nginx /var/www

# Laravel 5+
if [ -d /var/www/storage ]; then
    chmod -R 0777 /var/www/storage
fi
