sh atualizador.sh
os=`cat /etc/issue | cut -d" " -f1 | sed -n 1p | tr [:upper:]  [:lower:]`
version=`cat /etc/issue | cut -d" " -f2 | sed -n 1p | tr [:upper:]  [:lower:]`


terminalMono(){
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
sudo apt update -y
sudo apt install mono-mcs -y
}


ideMono(){
case $version in
14.04)
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
sudo apt install apt-transport-https
echo "deb https://download.mono-project.com/repo/ubuntu vs-trusty main" | sudo tee /etc/apt/sources.list.d/mono-official-vs.list
sudo apt update
;;
16.04)
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
sudo apt install apt-transport-https
echo "deb https://download.mono-project.com/repo/ubuntu vs-xenial main" | sudo tee /etc/apt/sources.list.d/mono-official-vs.list
sudo apt update
;;
18.04)
sudo apt install apt-transport-https dirmngr
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu vs-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-vs.list
sudo apt update
;;
esac
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
sudo apt-get install monodevelop
sudo apt-get install mono-complete
#framework
sudo apt-get install referenceassemblies-pcl
#ASP.NET
sudo apt-get install mono-xsp4
#monodevelop-nunit
sudo apt-get install monodevelop-nunit
#controladores
sudo apt-get install monodevelop-versioncontrol
#database
sudo apt-get install monodevelop-database
}



installmono(){
if [ -z $1 ]; then
read -p "dotNet pelo terminal ou ide?
" resp
clear
if [ $resp = terminal ]; then
terminalMono
else
ideMono
fi
else
if [ $1 = terminal ]; then
terminalMono
else
ideMono
fi
fi
}


#instalation by alexsey mostovik(Rebouças),brazilian boy,student from Estacio university in RJ city
installmono


