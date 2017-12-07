#!/usr/bin/env bash

# Update Repositories
apt-get update -y


# Determine Ubuntu Version.
. /etc/lsb-release


# Setting the DEBIAN_FRONTEND variable to noninteractive in order to prevent the warning:
# dpkg-preconfigure: unable to re-open stdin: No such file or directory.
export DEBIAN_FRONTEND=noninteractive


# Decide on package to install for `add-apt-repository` command
#
# USE_COMMON=1 when using a distribution over 12.04
# USE_COMMON=0 when using a distribution at 12.04 or older
USE_COMMON=$(echo "$DISTRIB_RELEASE > 12.04" | bc)

if [ "$USE_COMMON" -eq "1" ];
then
    apt-get install -y software-properties-common
else
    apt-get install -y python-software-properties
fi


# Installing Java.
apt-get install -y default-jre default-jdk


echo "Updating packages ..."
# Add Ansible Repository & Install Ansible
sudo add-apt-repository -y ppa:ansible/ansible
apt-get update
apt-get install -y ansible


# Setup Ansible for Local Use and Run
cp /vagrant/.ansible/inventories/dev /etc/ansible/hosts -f
chmod 666 /etc/ansible/hosts
cat /vagrant/.ansible/files/ssh/authorized_keys >> /home/vagrant/.ssh/authorized_keys


echo "Starting ansible playbook ..."
sudo ansible-playbook /vagrant/.ansible/playbook.yml -e hostname=$1 --connection=local


echo "Installing necessary packages after the playbook was registered ..."
# Installing Composer.
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

# Installing Node.js.
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && apt-get install -y nodejs

# Installing NPM Modules.
sudo npm install -g less bower uglify-js uglifycss


# Set fish customs
echo "Setting fish as default shell ..."
sudo chsh -s /usr/bin/fish root && sudo chsh -s /usr/bin/fish vagrant

echo "Adding customs for fish shell ..."
if [ ! -d /home/vagrant/.config ]
then
	mkdir /home/vagrant/.config
    mkdir /home/vagrant/.config/fish
    sudo chown -R vagrant:vagrant /home/vagrant/.config/
    sudo chown -R vagrant:vagrant /home/vagrant/.config/fish/
else
    sudo chown -R vagrant:vagrant /home/vagrant/.config/
    sudo chown -R vagrant:vagrant /home/vagrant/.config/fish/
fi
cp /vagrant/.ansible/files/fish/config.fish /home/vagrant/.config/fish/config.fish


# Set vim customs
echo "Adding customs for vim editor ..."
cp /vagrant/.ansible/files/vim/vimrc /home/vagrant/.vimrc
cp -r /vagrant/.ansible/files/vim/vim /home/vagrant/.vim


# Set default ownership
echo "SAdding customs for composer ..."
if [ ! -d /home/vagrant/.composer ]
then
    mkdir /home/vagrant/.composer
    sudo chown -R vagrant:vagrant /home/vagrant/.composer/
else
    sudo chown -R vagrant:vagrant /home/vagrant/.composer/
fi
cp /vagrant/.ansible/files/composer/auth.json /home/vagrant/.composer/auth.json
sudo chown vagrant:vagrant /home/vagrant/.composer/**


# Set default ownership
echo "Setting vagrant as default owner of hidden directories and files ..."
sudo chown -R vagrant:vagrant /home/vagrant/.cache/** /home/vagrant/.vim/**
sudo chown vagrant:vagrant /home/vagrant/.vimrc
sudo chown vagrant:vagrant /usr/local/bin/composer


# Set necessary swap memory for composer update process
echo "Updating swap memory ..."
sudo dd if=/dev/zero of=/swapfile bs=1M count=4096
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo 'echo "/swapfile  none  swap  defaults  0  0" >> /etc/fstab' | sudo sh


# Project Settings
if [ ! -f /vagrant/project/app/config/parameters.yml ]
then
    cp /vagrant/project/app/config/parameters.yml.dist /vagrant/project/app/config/parameters.yml
fi

if [ ! -d /vagrant/project/vendor ]
then
    composer install
fi
