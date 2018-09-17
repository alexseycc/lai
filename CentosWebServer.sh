#service name start
#which name
#script alxsy mostovik...(github)

. ./dep.sh
Up_centos
#instalaro apche
yum install httpd -y

#inicie o serviço
/etc/init.d/httpd start

#verificar se está rodando 
service httpd status

#liberar porta 80 no firewall
/sbin/iptables -I INPUT -p tcp --dport 80 -j ACCEPT
/etc/rc.d/init.d/iptables save


#iniciar automaticxamente nos runs 2,3,5
#2,ñ configurs rede nem emuladores
#3,inicia o sistema normalmente
#5,o sistema não arrancou com nenhum outro runlevel 
chkconfig --levels 235 httpd on


#instalar o mnysql
yum install mysql mysql-server –y

#inicia automaticamente aquando do arranque do sistema.
/etc/init.d/mysqld start
#service mysqlid start
chkconfig --levels 235 mysqld on

#instalação segura do mysql
/usr/bin/mysql_secure_installation -y

#instalar php,----9)
yum install php php-mysql –y

#instalar bibnlioteca php
yum -y install php-mcrypt.x86_64
yum -y install php-mbstring.x86_64
#yum -y install fpm.x86_64


# rodar automaticamente server (php  automaticatico  Apache iniciar):
#sudo chkconfig httpd on
#sudo chkconfig mysqld on

#chmod 777 -R /var/www/
#ln -s /var/www /home/cabox/workspace
#sudo nano /var/www/html/info.php

echo "<?php
phpinfo();
?>
" > info.php

#mudar local padrão do apache /var/www/html
sed s/"DocumentRoot \"\/var\/www\/html\""/"DocumentRoot \"\/home\/cabox\/workspace\""/g -i /etc/httpd/conf/httpd.conf



#reinicia o apache
sudo service httpd restart

#reinicia o apache
#/etc/init.d/httpd restart


#9)
#MySQL tenha suporte para PHP
#yum install php-mysql –y
