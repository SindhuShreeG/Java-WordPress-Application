#!/bin/bash

sudo apt update
sudo apt install mariadb-server -y
sudo systemctl start mariadb
sudo mysql_secure_installation
#sudo apt install firewalld
#sudo systemctl start firewalld
#sudo firewall-cmd --add-port=3306/tcp --permanent
#sudo firewall-cmd --reload
mysql -u root -p
(inside sql commands)
CREATE DATABASE wordpress; (creates database)
GRANT ALL ON wordpress.* TO 'admin'@'%' IDENTIFIED BY 'password'; (For anywhere)
#DROP USER 'admin'@'%'; (deleting user)
SELECT user FROM mysql.user; (quering users)
show databases; (display databases)
#GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'localhost' IDENTIFIED BY 'password'; (for localhost)
FLUSH PRIVILEGES; (reloads the changes)
exit
(After this open sqlecton and test the connection, If connections is not working follow next steps)

cd /etc/mysql/mariadb.conf.d/
grep -r 'bind-address' - If there is a problem connecting from remote machine. Then follow the step and find bind-address and 
sudo vim 50-server.cnf --> inside this file look for bind-address and change 127.0.0.1 to 0.0.0.0 save and exit 
sudo systemctl restart mariadb
