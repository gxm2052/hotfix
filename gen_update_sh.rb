#!/usr/local/bin/ruby -w

# git diff v1.0..v1.2 --name-only | xargs zip ~/Desktop/hotfix/update_1.0-1.2.zip

curr_version = ARGV[0].to_i
str_curr_version = curr_version.to_s


f = File.new('gen_git_zip.sh','wt')
f.puts('#!/local/bin/ruby -w')

CMD = 'git diff v1.BEGIN..v1.END --name-only | xargs zip ~/Desktop/hotfix/update_1.BEGIN-1.END.zip'
for i in 0..(curr_version-1)
    str = CMD
    str = str.gsub(/BEGIN/,i.to_s )
    str = str.gsub(/END/, str_curr_version )
    puts str
    f.puts(str)
end

f.close


f2 = File.new('gen_update_zip.sh','wt')
f2.puts('#!/local/bin/ruby -w')

CMD2 = '
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
unzip update_DELTA.zip
cd output
rm *
cd ..
mv res output/res
./compile.sh
cd output
zip ../DELTA.zip -r res src
cd ..
ls -al

'
for i in 0..(curr_version-1)
  str = CMD2
  str_delta = '1.'+i.to_s + '-1.' + str_curr_version
  str = str.gsub(/DELTA/,str_delta)
  f2.puts(str)
end

f2.close












