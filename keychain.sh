#http://archive.ubuntu.com/ubuntu/pool/universe/k/keychain/keychain_2.7.1-1_all.deb
#nn=`cat /etc/issue | cut -d' ' -f1,2`
#if [ "$nn" == "Ubuntu 14.04.5" ]; then 
#dpkg -i pckg/keychain_2.7.1-1_1404all.deb
#else
#dpkg -i pckg/keychain_2.7.1-1_1204all.deb
#fi
nn=`cat /etc/issue | cut -d' ' -f1,2`
case  $nn in
"Ubuntu 14.04.5")
wget http://archive.ubuntu.com/ubuntu/pool/universe/k/keychain/keychain_2.7.1-1_all.deb
    dpkg -i keychain_2.7.1-1_all.deb
    #dpkg -i pckg/keychain_2.7.1-1_1404all.deb
#echo pckg/keychain_2.7.1-1_1404all.deb
   ;;
"Ubuntu 12.04.5")
wget http://archive.ubuntu.com/ubuntu/pool/universe/k/keychain/keychain_2.7.1-1_all.deb
    dpkg -i keychain_2.7.1-1_all.deb
    #dpkg -i pckg/keychain_2.7.1-1_1204all.deb
#echo pckg/keychain_2.7.1-1_1404all.deb
;;
*)
    echo nada
    ;;
esac
