#!/bin/bash
echo "Password:"
read -s  pass
echo $pass | sudo -S nginx &
echo "Nginx started"
memcached -d 
echo "Memcached started"
echo $pass | sudo -S php-fpm -D
echo "php-fpm started"
mongod &
echo "mongod started"
mysql.server start
exit 0
