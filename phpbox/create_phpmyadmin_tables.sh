#!/bin/bash

/usr/bin/mysqld_safe > /dev/null 2>&1 &

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MySQL service startup"
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

cp /usr/share/doc/phpmyadmin/examples/create_tables.sql.gz /tmp/
gunzip /tmp/create_tables.sql.gz
sed -i"" 's/pma__/pma_/' /tmp/create_tables.sql
mysql -u root < /tmp/create_tables.sql
rm /tmp/create_tables.sql

mysqladmin -uroot shutdown