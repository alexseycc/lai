sudo apt-get install oracle-java7-installer
#sudo apt-get install openjdk-7-jdk
#sudo apt-get install default-jdk


<<InstallJdk8
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
InstallJdk8

: '
just virtual machine change jdk to jre
'


nano /etc/environment
JAVA_HOME="YOUR_PATH"