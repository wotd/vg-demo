#!/bin/bash

apt-get update

#To jest po to, zeby nie podawać hasla roota przy instalacji mysql
echo "mysql-server-5.1 mysql-server/root_password password p@ssw0rd" | debconf-set-selections
echo "mysql-server-5.1 mysql-server/root_password_again password p@ssw0rd" | debconf-set-selections

#Instalacja wymaganych pakietow
apt-get -y install apache2 php5 php5-mysql php5-gd unzip  mysql-server

#Pobranie aplikacji
wget https://github.com/RandomStorm/DVWA/archive/v1.9.zip
unzip v1.9.zip

#Kopiowanie plikow konfiguracyjnych
cp -avr DVWA-1.9/* /var/www/html
cp /etc/php5/apache2/php.ini /etc/php5/apache2/php.ini_old
cp /vagrant/php.ini /etc/php5/apache2/
cp /vagrant/config.inc.php /var/www/html/config/
cp /vagrant/.htaccess /var/www/html/

#Pozbycie sie domyslnego index.html i ustawienie uprawnien
mv /var/www/html/index.html /var/www/html/index_old.html
chown -R www-data:www-data /var/www/html
find /var/www/html/ -type f -exec chmod 644 {} \;
find /var/www/html/ -type d -exec chmod 755 {} \;

#Restart apache
/etc/init.d/apache2 stop
/etc/init.d/apache2 start
