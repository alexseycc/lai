#arch
#getconf LONG_BIT
#lsb_release

os=`cat /etc/issue | cut -d' ' -f1 | sed -n 1p | tr [:upper:] [:lower:]`
bits=`getconf LONG_BIT`

case $os in 
centos)
if [ $bits -eq 32 ]; then
echo "#x32
#
#
#
[mongodb]
name=MongoDB Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/i686/
gpgcheck=0
enabled=1" >> /etc/yum.repos.d/mongodb.repo

else
echo "#x64
[mongodb]
name=MongoDB Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
gpgcheck=0
enabled=1" >> /etc/yum.repos.d/mongodb.repo
fi
yum install mongo-10gen mongo-10gen-server
sed -i /dbpath=/asmallfiles=true /etc/mongod.conf
chkconfig mongod on 
;;
ubuntu)
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
#sh atualizador.sh
sudo apt-get install -y mongodb-org
service mongod start 
service mongod enable
;;
esac







