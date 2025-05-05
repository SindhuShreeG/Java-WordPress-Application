#!/bin/bash

sudo apt update -y
sudo apt install php php-common php-mysql php-mbstring php-gd firewalld apache2
sudo curl -O https://wordpress.org/latest.tar.gz
tar zxvf latest.tar.gz
sudo cp -rf wordpress/* /var/www/html/
cd wordpress/
sudo mv * /var/www/html/
cd /var/www/html/
sudo rm -rf index.html
sudo cp -r wp-config-sample.php wp-config.php
sudo sed -i "s/'database_name_here'/'wordpress'/g" wp-config.php
sudo sed -i "s/'username_here'/'admin'/g" wp-config.php
sudo sed -i "s/'password_here'/'password'/g" wp-config.php
sudo sed -i "s/'localhost'/'innovative.cr3y72ybxjad.ap-south-1.rds.amazonaws.com'/g" wp-config.php
#sudo chown -R apache:apache /var/www/ --> If error for this command try the next command 
sudo chown -R www-data:www-data /var/www/
sudo systemctl restart apache2
sudo apt install firewalld -y
sudo systemctl start firewalld
sudo firewall-cmd --add-port=80/tcp --permanent
