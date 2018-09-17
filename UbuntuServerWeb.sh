#escrito por alexy mostovik
	#atualizar packote
. ./os.sh
. ./dep.sh

infophp(){
sed s/"DocumentRoot \/var\/www\/html"/"DocumentRoot \/home\/cabox\/workspace"/g -i /etc/apache2/sites-enabled/000-default.conf
sed s/"Directory \/var\/www\/"/"Directory \/home\/cabox\/workspace"/g -i /etc/apache2/apache2.conf
echo "<?php
phpinfo();
?>
" > info.php
}

key=1
case $key in 
1)##CT
Up
#install apache2
apt-get install apache2 -y

#install php
apt-get install php5 php5-mcryp libapache2-mod-php5 php5-pdo php5-fpm -y 

#resiniciar apache2
service apache2 restart

#instalar mysql
apt-get install mysql-server -y 

#instalar phpmyadmin
apt-get install php5-mysql phpmyadmin libapache2-mod-auth-mysql -y

#link phpmyadmin apache2
#ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

#chmod 777 -R /var/www/
#ln -s /var/www/ .

#mudando o padrão apache2
infophp

service apache2 restart
;;
#xampp ubuntu BT
2)
#sudo apt-cache search xampp
#sudo add-apt-repository ppa:upubuntu-com/web -y
Up

#apt-get install xampp -y
#wget https://www.apachefriends.org/xampp-files/5.6.15/xampp-linux-x64-5.6.15-1-installer.run
wget https://www.apachefriends.org/xampp-files/7.0.2/xampp-linux-x64-7.0.2-1-installer.run && sudo chmod +x xampp-linux-x64-7.0.2-1-installer.run && sudo ./xampp-linux-x64-7.0.2-1-installer.run
chmod 755 xampp-linux-*-installer.run
sudo ./xampp-linux-*-installer.run
infophp
sudo /opt/lampp/lampp start
#/opt/lamp/htdocs,------------------------------padrao /www/var
;;
#instalando lamp,BT
3)
Up
apt-get install lamp-server^ phpmyadmin -y
infophp
service apache2 restart
;;
*)
echo "Script servidor linux 
escrito por alexsy mostovik"
;;
esac