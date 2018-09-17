. ./dep.sh

nm=asp
case $nm in
"asp")
Up
apt-get install mono-xsp4 mono-apache-server4 libapache2-mod-mono mono-gmcs mono-utils -y
apt-get install apache2 apache2-dev -y

sed s/"var\/www\/html"/"home\/cabox\/workspace"/g -i /etc/apache2/apache2.conf
sed s/"var\/www\/html"/"home\/cabox\/workspace"/g -i /etc/apache2/sites-enabled/000-default.conf

service apache2 restart
a2enmod mod_mono_auto
service apache2 restart
;;
"c")
Up
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
sudo apt install mono-mcs -y
;;
*)
echo "
AspxWebServer
Escript por alxsy mostovik
";;
esac