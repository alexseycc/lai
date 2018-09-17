apt-get update -y
apt-get -f 
sudo apt-get install libjson-glib-1.0-0 -y
apt-get -y install build-essential libglib2.0-dev libssl-dev libcurl4-openssl-dev
wget -c https://megatools.megous.com/builds/megatools-1.10.2.tar.gz
tar -zxf megatools-1.10.2.tar.gz
cd megatools-1.10./
#apt-get install asciidoc -y
apt-get --no-install-recommends install asciidoc -y
sed s/^'CC = gcc'/'CC = gcc -std=c99'/g Makefile > test
./configure --prefix=$HOME/.local
#make -j4
make
make install
#sudo dpkg --configure -a

echo "
[Login]
Username=
Password=
" > ~/.megarc
: '
vim makefile,"set number,cc = -std=c99
'