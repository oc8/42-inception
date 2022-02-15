#!/bin/bash

service mysql start
# echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
# echo "CREATE USER $USER@'%' identified by '$PASS';" | mysql -u root --skip-password
# echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root');" | mysql -u root --skip-password
# echo "GRANT ALL PRIVILEGES ON wordpress.* TO '$USER'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
# echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
# echo "update mysql.user set plugin='' where user='$USER';" | mysql -u root --skip-password
echo "CREATE DATABASE $DB_NAME;" | mysql -u root --skip-password
echo "CREATE USER IF NOT EXISTS $DB_USER@'%' identified by '$DB_PASS';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
echo "update mysql.user set plugin='' where user='root';" | mysql -u root --skip-password
