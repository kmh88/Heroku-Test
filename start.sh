#!/bin/bash
git clone https://github.com/developeranaz/Jdownloader-2-Rclone-Heroku
ren /Jdownloader-2-Rclone-Heroku /Heroku-Test
chmod +x /Heroku-Test/scripts/ENV_VPS
bash  /Heroku-Test/scripts/ENV_VPS
cp /Heroku-Test/jd.sh /jd.sh
chmod +x /jd.sh
cp /Heroku-Test/serve.sh /serve.sh
chmod +x /serve.sh
cp /Heroku-Test/scripts/rclone.sh /rclone.sh
chmod +x /rclone.sh
cat /Heroku-Test/cr.json |sed "s|THEJDUSERPASSWORD|$JD_USER_PASSWORD|g" |sed "s|THEJDUSEREMAIL|$JD_USER_EMAIL|g" >"/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json"
supervisord -c /Heroku-Test/supervisord.conf
