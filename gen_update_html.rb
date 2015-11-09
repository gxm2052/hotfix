#!/usr/local/bin/ruby -w

curr_version = ARGV[0].to_i
str_curr_version = curr_version.to_s

# 用于生成 update_1_1_x.html
# {"v":"VERSION","path":"http:\/\/192.168.1.10:7788\/poker\/ios\/package\/","sz":[SIZE]}
UPDATE_STR = '{"version":"VERSION","path":"http:\/\/192.168.1.10:7788\/poker\/ios\/package\/","size":[SIZE]}'

f3 = File.new('update_1_1_x.html','wt')
version = '1.' + str_curr_version
size = []

for i in 0..(curr_version-1)
  filename = '1.'+i.to_s + '-1.' + str_curr_version + '.zip'
  filesize = File.size(filename)
  size[i] = filesize
end

str = UPDATE_STR
str = str.gsub(/VERSION/, version)
str = str.gsub(/SIZE/,size.join(','))
f3.write(str)
f3.close