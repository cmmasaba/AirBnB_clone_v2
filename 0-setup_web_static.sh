#!/usr/bin/env bash
# a script to configure my nginx server with the required folders and files

apt-get -y update
apt-get install -y nginx
service nginx start
mkdir -p /data/web_static/releases/test/
mkdir -p /data/web_static/shared/
echo "
<html>
<head>
</head>
<body>
Landing page
</body>
</html>" > /data/web_static/releases/test/index.html
ln -sF /data/web_static/releases/test/ /data/web_static/current
chown -R ubuntu:ubuntu /data/
sed -i '38i\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t\tautoindex off;\n\t}\n' /etc/nginx/sites-available/default
service nginx restart
exit 0
