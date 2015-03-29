#!/bin/bash

service mysql start

chown www-data:www-data /app -R
source /etc/apache2/envvars
HOME=/root composer -d"/app" install
rm /var/run/apache2/apache2.pid
exec apache2 -D FOREGROUND
