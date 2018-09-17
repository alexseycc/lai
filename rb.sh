os=`cat /etc/issue | cut -d" " -f1 | sed -n 1p | tr [:upper:] [:lower:]`

case $os in
centos)
sudo yum install ruby ruby-irb -y
#visualruby
;;
ubuntu)
sudo apt-get install ruby-full -y
#visualruby
;;
esac