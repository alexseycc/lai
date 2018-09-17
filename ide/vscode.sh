file=`basename https://download.microsoft.com/download/3/7/1/37189942-C91D-46E9-907B-CF2B2DE584C7/dotnet-sdk-2.1.200-linux-x64.tar.gz`
. ./os.sh
version=`cat /etc/issue | cut -d" " -f2 | sed -n 1p | tr [:upper:]  [:lower:]`

CoreSdk(){
wget -q packages-microsoft-prod.deb https://packages.microsoft.com/config/ubuntu/$version/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-2.0.0
}

VsCode(){
wget -O vscode-amd64.deb "https://go.microsoft.com/fwlink/?LinkID=760868"
sudo dpkg -i vscode-amd64.deb
sudo apt-get install -f
}

CoreSdkTar(){
wget https://download.microsoft.com/download/3/7/1/37189942-C91D-46E9-907B-CF2B2DE584C7/dotnet-sdk-2.1.200-linux-x64.tar.gz
tar xvf $file
}

VsCodeTar(){
wget -O vscode.tar.gz https://go.microsoft.com/fwlink/?LinkID=620884
tar xvf vscode.tar.gz
sudo apt-get install gnome-panel 
sudo gnome-desktop-item-edit /usr/share/applications/ --create-new
}

InstallCode(){
case $os in 
ubuntu)
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c "echo 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main' > /etc/apt/sources.list.d/vscode.list"
wget -q packages-microsoft-prod.deb https://packages.microsoft.com/config/ubuntu/14.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get install apt-transport-https
sudo apt-get install dotnet-sdk-2.1.105
sudo apt-get install code # or code-insiders
sudo apt-get install libunwind libicu compat-openssl10
sudo apt-get install dotnet-sdk-2.0.0
;;
centos)
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

yum check-update
sudo yum install code
;;
esac
}







if [ -z $1]
  echo entre com o tipo de pacote a ser baixado(rpm,deb,tar.gz)
else
  sh atualizador.sh
   case $1 in 
    deb)
: '
wget https://go.microsoft.com/fwlink/?LinkID=760680
dpkg -i code*.deb
'   
VsCode
CoreSdk

: '      
wget -O code_1.23.1-1525968397_i386.deb https://az764295.vo.msecnd.net/stable/d0182c3417d225529c6d5ad24b7572815d0de9ac/code_1.23.1-1525968397_i386.deb
sudo dpkg -i code_1.23.1-1525968397_i386.deb
'   
;;
    rpm)
      wget https://go.microsoft.com/fwlink/?LinkID=760867
      rpm -i code*.rpm
      ;;
    tar|gz)
      VsCodeTar
      CoreSdkTar
    
    <<InstalacaoPackoteDotNet
    sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet/ trusty main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
sudo apt-get -y update
sudo apt-get -y install dotnet-dev-1.0.0-preview2-003121
InstalacaoPackoteDotNet

:'
 sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
 ' 
  
      ;;
    esac
fi