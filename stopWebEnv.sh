#!/bin/bash
echo "Password:"
read -s pass
echo $pass | sudo -S nginx -s stop
echo "Nginx stopped"
echo $pass | sudo -S killall php-fpm 
echo "php-fpm stopped"
mysql.server stop
echo "mysql server stopped"
killall memcached 
echo "memcached stopped"
killall mongod
exit 0
