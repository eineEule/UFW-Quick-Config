#!/bin/bash
#UFW quick setup

#check UFW Status and Install
echo "***Checking for UFW***"
dpkg -s ufw > /var/log/ufwconf/ufwstatus.txt
line=$(sed '2q;d' /var/log/ufwstatus.txt)
status="Status: install ok installed"
if [ "$line" != "$status" ]; then
	apt-get install ufw -y
fi

#Config UFW
echo "Configuring UFW"
echo "Allowing HTTPS"
	ufw allow https
echo "Allow HTTP"
	ufw allow http
echo "Allow SSH"
	ufw allow ssh
echo "Quick Configuration Finished"

echo "###Note: Remember to change SSH port in shd_config. Type ufw --help for more options###" 
