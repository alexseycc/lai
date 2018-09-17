scpt=(`ls *.sh`)
echo -e "#$((${#scpt[*]}+1)) scripts importados\n" >> names.sh
for i in `ls *.sh`;do echo . ./$i >> names.sh;done
sort -u names.sh -o names.sh
