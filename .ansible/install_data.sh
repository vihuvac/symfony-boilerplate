#!/usr/bin/env bash

if [ -f /vagrant/project/bin/load_data.php ]
then
	cd /vagrant/project && php bin/load_data.php
else
	echo "This is not a Symfony project so the file 'bin/load_data.php' does not exist."
fi

curl -s -H "Host: dev.symfony-boilerplate" http://192.168.33.11/app_dev.php | grep 3e9fda56df2cdd3b039f189693ab7844fbb2d4f6

echo ""
echo "Congratulation!!!"
echo "You have installed a virtual machine for the Project."
echo ""
echo "You need to :"
echo "    - add dev.symfony-boilerplate to point 192.168.33.11 in your hosts file."
echo "    - start hacking around ;)"
echo ""
