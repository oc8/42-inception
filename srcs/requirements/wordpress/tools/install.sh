#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/bin/wp

wp core download  --locale=fr_FR --skip-content --user=$WP_ROOT --path=$WP_PATH
cd $WP_PATH
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --path=$WP_PATH

wp core install --url="https://odroz-ba.42.fr/" --title="inception" --admin_user=$WP_ROOT --admin_password=$WP_ROOT_PASS --admin_email=test@gmail.com --allow-root
wp user create $DB_USER test@gmail.com --user_pass=$DB_PASS --role=editor --allow-root
wp theme install twentyfifteen
wp theme install twentyfifteen --activate
chmod 777 -R /var/www

exec /usr/sbin/php-fpm7 -F
