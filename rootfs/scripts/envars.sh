#!/bin/bash

#----------------------------------------------------------
# Add the container environment variables to bash sessions
#----------------------------------------------------------

pattern='if [ -f /opt/envars.sh ]; then source /opt/envars.sh; fi'
source=/opt/envars.sh

if [ ! -f ${source} ]; then
    touch ${source} && chmod 0644 ${source}
fi

echo "#!/bin/bash" > ${source}

if [ ! -f /root/.bashrc ]; then
    touch /root/.bashrc
fi

if ! grep -Fxq '$pattern' /root/.bashrc ; then
    echo -e "${pattern}" >> /root/.bashrc
fi

#----------------------------------------------------------
# Generate the php-fpm config file
#----------------------------------------------------------

conf=/etc/php7/php-fpm.d/envars.conf

if [ ! -f ${conf} ]; then
    touch ${conf} && chmod 0644 ${conf}
fi

# Clear and set the file for environment variables
echo "[www]" > ${conf}

#----------------------------------------------------------
# Generate the php-cli ini file
#----------------------------------------------------------

ini=/etc/php7/conf.d/envars.ini

if [ ! -f ${ini} ]; then
    touch ${ini} && chmod 0644 ${ini}
fi

# Empty the ini file
echo "" > ${ini}

#----------------------------------------------------------
# Generate a Laravel 5 Environment file
#----------------------------------------------------------

lfiveenv="/var/www/.env"

if [ ! -f ${lfiveenv} ]; then
    touch ${lfiveenv}
fi

echo "" > ${lfiveenv}

#----------------------------------------------------------
# Generate a laravel 4.2 Environment file
#----------------------------------------------------------

envname=""
if [ ! "$ENVIRONMENT" == "production" ]; then
    envname=".$ENVIRONMENT"
fi

lfourenv="/var/www/.env${envname}.php"

if [ ! -f ${lfourenv} ]; then
    touch ${lfourenv}
fi

echo "<?php return [" > ${lfourenv}

#----------------------------------------------------------
# Add the container environment variables to all files
#----------------------------------------------------------

echo "Generating Environment Variables"

cd /var/run/s6/container_environment

for f in *; do
  if [ -n "$( cat $f )" ]; then
    name=${f}
    value=`cat ${f}`
    echo "export ${name}='${value}'" >> ${source}
    echo "env[${name}] = '${value}'" >> ${conf}
    echo "env[${name}] = '${value}'" >> ${ini}
    echo "'${name}' => '${value}'," >> ${lfourenv}
    echo "${name}='${value}'" >> ${lfiveenv}
  fi
done

#----------------------------------------------------------
# Close the laravel 4.2 Environment file
#----------------------------------------------------------

echo "];" >> ${lfourenv}