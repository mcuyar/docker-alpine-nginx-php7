#!/usr/bin/with-contenv bash

conf=/etc/php7/php-fpm.d/www.conf

if [ ! -z ${PM} ]; then
    sed -i "s/.*pm =.*/pm = \"${PM}\"/g" ${conf}
fi

if [ ! -z ${PM_MAX_CHILDREN} ]; then
    sed -i "s/.*pm.max_children =.*/pm.max_children = \"${PM_MAX_CHILDREN}\"/g" ${conf}
fi

if [ ! -z ${PM_START_SERVERS} ]; then
    sed -i "s/.*pm.start_servers =.*/pm.start_servers = \"${PM_START_SERVERS}\"/g" ${conf}
fi

if [ ! -z ${PM_MIN_SPARE_SERVERS} ]; then
    sed -i "s/.*pm.min_spare_servers =.*/pm.min_spare_servers = \"${PM_MIN_SPARE_SERVERS}\"/g" ${conf}
fi

if [ ! -z ${PM_MAX_SPARE_SERVERS} ]; then
    sed -i "s/.*pm.max_spare_servers =.*/pm.max_spare_servers = \"${PM_MAX_SPARE_SERVERS}\"/g" ${conf}
fi

if [ ! -z ${PM_MAX_REQUESTS} ]; then
    sed -i "s/.*pm.max_requests =.*/pm.max_requests = \"${PM_MAX_REQUESTS}\"/g" ${conf}
fi