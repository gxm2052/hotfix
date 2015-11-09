#!/local/bin/ruby -w
git diff v1.0..v1.2 --name-only | xargs zip ~/Desktop/hotfix/update_1.0-1.2.zip
git diff v1.1..v1.2 --name-only | xargs zip ~/Desktop/hotfix/update_1.1-1.2.zip
