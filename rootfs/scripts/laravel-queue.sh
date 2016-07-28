#!/bin/bash

# Create a queue to run within runit
dir=/etc/services.d/queue
file=${dir}/run

mkdir -p ${dir}
touch ${file} && chmod +x ${file}

cat << EOF > ${file}
#!/usr/bin/with-contenv bash
source /opt/envars.sh
php /var/www/artisan queue:listen --sleep=5
EOF
