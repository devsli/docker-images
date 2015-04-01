FROM tutum/lamp

RUN apt-get update                     \
 && apt-get install -y phpmyadmin curl \
 && apt-get clean                      \
 && rm -rf /var/lib/{apt,dpkg,cache,log}/

ENV ENVIRONMENT development

ADD run.sh /run.sh
RUN chmod +x /run.sh \
 && sed -i 's/AllowOverride FileInfo/AllowOverride All/' /etc/apache2/sites-available/000-default.conf \
 && sed -i '/.*\/\/.*AllowNoPass/s/\/\///' /etc/phpmyadmin/config.inc.php \
 && sed -i '/dbuser/s/phpmyadmin/root/' /etc/phpmyadmin/config-db.php \
 && sed -i "/dbpass/s/'.*'/''/" /etc/phpmyadmin/config-db.php \
 && echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf
 
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/tmp/ \
 && mv /tmp/composer.phar /usr/local/bin/composer

ADD create_phpmyadmin_tables.sh /create_phpmyadmin_tables.sh

WORKDIR /app
VOLUME /app
