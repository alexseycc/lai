#escrito por alexsy mostovik
AtualizacaoPckgs(){
apt-get update -y          ##Atualizacao de pacotes e upgrades
apt-get upgrade -y         ##updts and upgds packs
apt-get install nano -y
}

#mudar camimnho padräo dos servidor web /conf/webapps/ROOT
MudarCaminhoTomCat(){
echo "<Context path='' docBase='/home/cabox/workspace'>     

  <!-- Default set of monitored resources -->
  <WatchedResource>WEB-INF/web.xml</WatchedResource>

</Context>
" >> /opt/apache-tomcat-7.0.85/conf/server.xml
}

#add variavel no mash file
AddVarBash(){
echo "
#variaável tomcat catalina e java
#export CATALINA_HOME=/opt/apache-tomcat-7.0.85
#export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
#sh /opt/apache-tomcat-7.0.85/bin/startup.sh
" >> ~/.bashrc
}

#adcionar variaveis ao sistema no inicio,reinicio,runlevel
AddVarInicializacao(){
echo "
#variaável tomcat catalina e java
export CATALINA_HOME=/opt/apache-tomcat-7.0.85
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
sh /opt/apache-tomcat-7.0.85/bin/startup.sh
" > /etc/init.d/tom
chmod +x /etc/init.d/tom
ln -s /etc/init.d/tom /etc/rc2.d/S99tom
}

#criar funcao global para iniciar,reiniciar tomcat 
AddfuncGlobal(){
echo "
#restartando tomcat 
rt(){
sh /opt/apache-tomcat-7.0.85/bin/shutdown.sh
sh /opt/apache-tomcat-7.0.85/bin/startup.sh
}" >> /etc/bash.bashrc
}


case $1 in
1)
#executa a funcao
AtualizacaoPckgs

#download tomcat7
wget http://mirror.nbtelecom.com.br/apache/tomcat/tomcat-7/v7.0.85/bin/apache-tomcat-7.0.85.zip

mv apache-tomcat-7.0.85.zip /opt
cd /opt && unzip /opt/apache-tomcat-7.0.85.zip
chmod 777 -R /opt/apache-tomcat-7.0.85

#pagina teste jsp
echo"<!DOCTYPE html>
<html lang=en>
<head>
  <meta charset=UTF-8>
  <title>Document</title>
</head>
<body>
<%
  out.println('script TEST por alxsy mostovik');
 %>
  <%=
  '<br>TOM CAT'
  %>
 
</body>
</html>"> index.jsp


#configurando senha no tomcat
cd /opt/apache-tomcat-7.0.85/conf/
sed s/"<\/tomcat-users>"/"<role rolename='manager-gui'\/><user username='admin' password='admin' roles='manager-gui'\/><\/tomcat-users>"/g -i tomcat-users.xml

#mudando /conf/webapps/root padrão server
MudarCaminhoTomCat



#instalar java
	#sudo apt-get install default-jdk
#sudo apt-get install default-jre
#sudo apt-get install openjdk-7-jre 

sudo apt-get install openjdk-7-jdk -y

AddVarBash

AddVarInicializacao

AddfuncGlobal

#desligando e ligando tomcat
. /etc/bash.bashrc && rt 
;;
2) ##alternativa tomcat7 terminal
AtualizacaoPckgs
#sudo apt-get update -y
sudo apt-get install tomcat7 tomcat7-admin -y
#sed s/"JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC""/"JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC"/g
sudo apt-get install default-jdk -y
#sudo apt-get install default-jre
#sed s/"<\/tomcat-users>"/"<role rolename='manager-gui'\/><user username='admin' password='admin' roles='manager-gui'\/><\/tomcat-users>"/g -i /etc/tomcat7/tomcat-users.xml

#MudarCaminhoTomCat
AddVarBash
#AddVarInicializacao
#AddfuncGlobal

sudo service tomcat7 restart
;;
3)
sudo apt-get install python-software-properties -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update -y
sudo apt-get install oracle-java7-installer -y
sudo apt-get install tomcat7 tomcat7-admin -y
#sed s/"JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC""/"JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC"/g
#sed s/"<\/tomcat-users>"/"<role rolename='manager-gui'\/><user username='admin' password='admin' roles='manager-gui'\/><\/tomcat-users>"/g -i /etc/tomcat7/tomcat-users.xml
#MudarCaminhoTomCat
AddVarBash
#AddVarInicializacao
#AddfuncGlobal

sudo service tomcat7 restart
;;
*)
echo "Script instalador TomCat\nEscrito por Alexsei Rebouças";
;;
esac