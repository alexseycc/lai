wget -c http://nodejs.org/dist/v0.12.4/node-v0.12.4.tar.gz
#nm=`echo 'http://www.test.com/abc/def/efg/file.jar ' | rev | cut -d '/' -f 1 | rev`
tar -xf `echo 'http://www.test.com/abc/def/efg/file.jar ' | rev | cut -d '/' -f 1 | rev`
