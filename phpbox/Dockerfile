FROM tutum/apache-php

RUN apt-get update                             \
 && apt-get install -y mysql-server phpmyadmin \
 && apt-get clean                              \
 && rm -rf /var/lib/{apt,dpkg,cache,log}/

ENV ENVIRONMENT development

ADD run.sh /run.sh
RUN chmod +x /run.sh \
 && sed -i '/.*\/\/.*AllowNoPass/s/\/\///' /etc/phpmyadmin/config.inc.php \
 && sed -i '/upload_max_filesize/s/[0-9]\+/512/' /etc/php5/apache2/php.ini \
 && sed -i '/post_max_size/s/[0-9]\+/512/' /etc/php5/apache2/php.ini \
 && echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf

VOLUME /app