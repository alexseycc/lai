so=`cat /etc/issue | cut -d' ' -f1 | head -n1 | tr [:upper:] [:lower:]`
case $so in
debian|ubuntu)
echo "
#atualizacso sw
up(){
apt-get update -y
}

dep(){
apt-get install -f -y

}
#permission denied
x(){ 
chmod 777 -R /home/cabox/workspace
}

#sw  instalation
app(){ 
apt-get install \$* -y | tee ./pckgLinux/\$*.txt
##apt-get install \$* -y | tee ./pckgLinux/\$*.txt
#apt-get install \$* -y 2>&1 | tee ./pckgLinux/\$*.txt
}

`cat /etc/bash.bashrc`" > /etc/bash.bashrc





source /etc/bash.bashrc
;;
centos)
echo "
#atualizacso sw
up(){
yum update -y
}

dep(){
yum install -f -y

}
#permission denied
x(){ 
chmod 777 -R /home/cabox/workspace
}

#sw  instalation
app(){ 
#yum install \$* -y | tee ./pckgLinux/\$*.txt
#yum install \$* -y | tee ./pckgLinux/\$*.txt
yum install \$* -y 2>&1 | tee ./pckgLinux/\$*.txt
}

`cat /etc/bashrc`" > /etc/bashrc
. /etc/bashrc
;;
*)
echo "nothing no(esqueceu parametro)"
;;
esac

if [ ! -d pckgLinux ]; then
mkdir ./pckgLinux/
else
echo diretório pckgLinux já existe 
fi
#sudo yum install java-1.7.0-openjdk.x86_64 
