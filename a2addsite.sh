#!/bin/bash
loc_frp="/home/gary/frp"
loc_html="/var/www"
loc_a2site="/etc/apache2/sites-available"
website_domain=$1

if [ -d "$loc_html/$1" ]
then
	echo "aleady have"
fi
