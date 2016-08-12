#!/bin/bash

mkdir -p /var/log/cron
file=/var/www/cron.conf
echo '' >> ${file}
crontab ${file}