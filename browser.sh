. ./dep.sh
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock
sudo dpkg --configure -a
browser=chrome


case $browser in 
firefox)
Up
sudo add-apt-repository ppa:mozillateam/firefox-stable -y
sudo apt-get install firefox -y
#wget https://ftp.mozilla.org/pub/firefox/releases/41.0/linux-x86_64/pt-BR/firefox-41.0.tar.bz2
#tar -jxvf firefox-41.0.tar.bz2
#cd firefox && ./firefox-bin 
;;
chrome)
Up
echo deb http://dl.google.com/linux/deb/ stable main >> /etc/apt/source.list
sudo apt-get install google-chrome-stable -y
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O chrome.deb
#sudo dpkg -i chrome.deb && sudo apt-get install -f
;;
chromium)
Up
sudo add-apt-repository ppa:a-v-shkop/chromium -y
#sudo add-apt-repository ppa:towolf/crack
#sudo add-apt-repository ppa:a-v-shkop/chromium-dev
sudo apt-get update && sudo apt-get install chromium-browser -y
#apt-get install chromium chromium-l10n
apt-get install pepperflashplugin-nonfree -y
;;
opera)
Up
add-apt-repository 'deb http://deb.opera.com/opera/ stable non-free' -y
wget -qO- http://deb.opera.com/archive.key | sudo apt-key add - -y
apt-get install opera-stable -y
;;
tor)
Up
sudo apt-add-repository ppa:webupd8team/tor-browser -y
sudo apt-get install tor-browser -y
#sudo add-apt-repository ppa:upubuntu-com/tor-bundle -y && sudo apt-get update && sudo apt-get install tor-browser -y
wget https://www.torproject.org/dist/torbrowser/7.5/tor-browser-linux64-7.5_en-US.tar.xz -O tor.tar.xz
tar -xvJf tor.tar.xz
cd tor-browser_en-US/Browser && ./TorBrowser
;;
*)
echo "
Script instalador Browser
Escrito por alexsy mostovik"
esac