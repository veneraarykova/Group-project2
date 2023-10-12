#!/bin/bash
apt-get update -y
apt-get install -y apache2 mysql-client php libapache2-mod-php php-mysql
# MySQL root password
MYSQL_ROOT_PASSWORD="kaizen123"
debconf-set-selections <<< "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD"
apt-get install -y mysql-server
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE wordpress;"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE USER 'wordpress'@'%' IDENTIFIED BY 'kaizen123';"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%';"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
# WordPress installation
wget https://wordpress.org/latest.tar.gz -P /tmp
tar -zxvf /tmp/latest.tar.gz -C /var/www/html
cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sed -i 's/database_name_here/wordpress/g' /var/www/html/wordpress/wp-config.php
sed -i 's/username_here/wordpress/g' /var/www/html/wordpress/wp-config.php
sed -i 's/password_here/kaizen123/g' /var/www/html/wordpress/wp-config.php
chown -R www-data:www-data /var/www/html/wordpress
sudo rm -rf /var/www/html/index.html
sudo mv /var/www/html/wordpress/* /var/www/html
service apache2 restart




















# sudo apt update -y
#  sudo apt install php libapache2-mod-php php-mysql php-redis -y
#  sudo apt install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
#  sudo apt install apache2 -y
#  sudo apt install mysql-server -y
#  sudo systemctl enable apache2 mysql
#  wget -c http://wordpress.org/latest.tar.gz
#  tar -xzvf latest.tar.gz
#  ls /var/www/html/
#  sudo cp -R wordpress /var/www/html
#  ls /var/www/html/
#  sudo rm -rf /var/www/html/index.html
#  sudo mv /var/www/html/wordpress/* /var/www/html/
#  ls /var/www/html/
#  sudo chown -R www-data:www-data /var/www/html
#  sudo chmod -R 775 /var/www/html
#  sudo systemctl restart apache2
#  sudo systemctl enable apache2
 



# # Define the path to wp-config.php. Adjust this if needed.
# CONFIG_PATH=“/var/www/html/wp-config.php"
# # Check if the file exists.
# if [ ! -f “$CONFIG_PATH" ]; then
#     echo “Error: File $CONFIG_PATH not found!"
#     exit 1
# fi
# # Replace the values using sed.
# sed -i “s/define('DB_NAME', ‘.*');/define(‘DB_NAME', ‘wordpress');/" $CONFIG_PATH
# sed -i “s/define(‘DB_USER', ‘.*');/define(‘DB_USER', ‘Venera');/" $CONFIG_PATH
# sed -i “s/define(‘DB_PASSWORD’, ‘.*’);/define(‘DB_PASSWORD’, ‘kaizen123’);/" $CONFIG_PATH
# sed -i “s/define(‘DB_HOST’, ‘.*’);/define(‘DB_HOST’, ‘RDS-endpoint-url’);/" $CONFIG_PATH
# sudo chown -R www-data:www-data /var/www/html
# sudo chmod -R 775 /var/www/html
# sudo systemctl restart httpd
# sudo systemctl restart apache2 








