#!/local/bin/ruby -w

rm .gitignore
mkdir res
cd res
rm *
cd..
mkdir src
cd src
rm *
cd ..
ls -al
unzip update_1.0-1.2.zip
cd output
rm *
cd ..
mv res output/res
./compile.sh
cd output
zip ../1.0-1.2.zip -r res src
cd ..
ls -al


rm .gitignore
mkdir res
cd res
rm *
cd..
mkdir src
cd src
rm *
cd ..
ls -al
unzip update_1.1-1.2.zip
cd output
rm *
cd ..
mv res output/res
./compile.sh
cd output
zip ../1.1-1.2.zip -r res src
cd ..
ls -al

