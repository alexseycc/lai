os=`cat /etc/issue | cut -d' ' -f1 | sed -n 1p | tr [:upper:] [:lower:]`
#echo $os