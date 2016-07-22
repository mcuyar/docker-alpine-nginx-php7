#!/bin/bash

mkdir -p /var/log/cron
crontab "/var/www/cron.conf"