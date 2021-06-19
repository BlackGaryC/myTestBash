#!/bin/bash
echo "creating $1.conf for apache2"
echo -e "\tdefault apache2 site path is /etc/apache2/sites-available"
echo """
<VirtualHost *:80>
        ServerName $1
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/$1
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
""" > /etc/apache2/sites-available/$1.conf
echo "create successed"
a2ensite $1.conf
systemctl reload apache2
echo "reloaded apache2 service"


filename=`echo $1 | sed 's/\./_/g'`.conf
echo "creating $filename"
echo """
[common]
server_addr = v2ry.top
server_port = 8888
token = MIIEZTCCA02gAwIBAgIQQAF1BIMUpMghjISpDBbN3zANBgkqhkiG9w0BAQsFADA
""" > /root/frp/enabled/$filename
echo """
[http_$1]
type = http
local_ip = 127.0.0.1
local_port = 80
use_encryption = false
custom_domains = $1
host_header_rewrite = $1
[https_$1]
type = https
custom_domains = $1
plugin = https2http
plugin_local_addr = 127.0.0.1:80
plugin_crt_path = /home/gary/frp/_.v2ry.top/full_chain.pem
plugin_key_path = /home/gary/frp/_.v2ry.top/private.key
plugin_host_header_rewrite = $1
plugin_header_X-From-Where = frp
""" >> /root/frp/enabled/$filename
echo "create completed"
echo "you need to run ./start in /root/frp"
