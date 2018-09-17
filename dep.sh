Up(){
#apt-get install -f
sudo apt-get update
#sudo apt-get upgrade
	}
	
	
	
	
	
add_repos(){
sudo apt-get install python-software-properties
sudo apt-get install software-properties-common
sudo apt-get install software-propeties-common
sudo apt-get install build-essential
}

conf_app(){
echo "Dpkg::Options {
--force-confnew
#--force-confold
#--force-confdef
}
" > /etc/apt/apt.conf.d/local
}



Up_centos(){
	yum install update -y
#yum install upgrade -y
#yum install nano -y

	}


