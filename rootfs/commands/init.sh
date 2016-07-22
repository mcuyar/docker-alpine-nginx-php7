#!/bin/bash

dir=/etc/cont-init.d

# Run the default init script
cp /scripts/init.sh ${dir}/001_init.sh

# Set the environment variables
cp /scripts/envars.sh ${dir}/002_envars.sh

# Set laravel file permissions
cp /scripts/laravel-file-permissions.sh ${dir}/003_permissions.sh
