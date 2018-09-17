Up(){
echo "Dpkg::Options {
--force-confnew
#--force-confold
#--force-confdef
}
" > /etc/apt/apt.conf.d/local
apt-get update -y
#apt-get upgrade -y
sudo apt-get dist-upgrade -y
apt-get install nano -y
}

Up
apt-get install apache2 -y
apt-get install php5 php5-mcryp libapache2-mod-php5 -y 
service apache2 restart
apt-get install mysql-server -y 
apt-get install php5-mysql phpmyadmin libapache2-mod-auth-mysql -y
#link phpmyadmin apache2
#ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
chmod 777 -R /var/www/
#ln -s /var/www/ .
service apache2 restart


# openssal
#mbstring
#pdo
#tokenizer
#xml
#php -m | egrep -w "openss"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

php composer.phar global require "laravel/installer"

php composer.phar create-project --prefer-dist laravel/laravel PrjLrvl

php PrjLrvl/artisan serve
sudo chmod 777 -R ./PrjLrvl