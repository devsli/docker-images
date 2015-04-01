#!/bin/bash

VOLUME_HOME="/var/lib/mysql"
APACHE_PID_FILE="/var/run/apache2/apache2.pid"

sed -ri -e "s/^upload_max_filesize.*/upload_max_filesize = ${PHP_UPLOAD_MAX_FILESIZE}/" \
    -e "s/^post_max_size.*/post_max_size = ${PHP_POST_MAX_SIZE}/" /etc/php5/apache2/php.ini

if [[ ! -d $VOLUME_HOME/mysql ]]; then
    echo "=> An empty or uninitialized MySQL volume is detected in $VOLUME_HOME"
    echo "=> Installing MySQL ..."
    mysql_install_db > /dev/null 2>&1
    echo "=> Done!"  
    /create_mysql_admin_user.sh

    cp /usr/share/doc/phpmyadmin/examples/create_tables.sql.gz /tmp/
    gunzip /tmp/create_tables.sql.gz
    sed -i"" 's/pma__/pma_/' /tmp/create_tables.sql
    mysql -u root < /tmp/create_tables.sql
    rm /tmp/create_tables.sql
else
    echo "=> Using an existing volume of MySQL"
fi

chown www-data:www-data /app -R
source /etc/apache2/envvars

if [[ -f $APACHE_PID_FILE ]]; then
    rm $APACHE_PID_FILE
fi

if [[ -f /app/composer.json ]]; then
    HOME=/root composer -d"/app" install
fi

exec supervisord -n