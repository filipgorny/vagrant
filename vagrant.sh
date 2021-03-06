#!/bin/bash

apt-get update

echo "Installing GIT"
apt-get install git -y

echo "Installing PHP"
apt-get install php5 php5-curl -y

if [ ! -f /usr/sbin/composer ]; then
    echo "Installing Composer"
    cd /tmp
    php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
    php -r "if (hash_file('SHA384', 'composer-setup.php') === 'a52be7b8724e47499b039d53415953cc3d5b459b9d9c0308301f867921c19efc623b81dfef8fc2be194a5cf56945d223') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"
    sudo cp ./composer.phar /usr/sbin/composer
fi

while read p; do
  source /var/vagrant/vagrant/modules/$p/install.sh
done </vagrant/modules_enabled
