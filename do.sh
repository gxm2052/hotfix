#!/bin/sh 

rm res
rm src
ls -al 
unzip update.zip
cd output
rm *
cd ..
mv res output/res
./compile.sh
cd output
zip ../update2.zip -r res src
cd ..
