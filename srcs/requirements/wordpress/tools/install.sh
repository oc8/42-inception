#!/bin/bash

# 1/ Télécharger  wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# 2/ Rendre l'application exécutable
chmod +x wp-cli.phar

# 3/ Déplacez-le dans /usr/local/bin/wp
mv wp-cli.phar /usr/bin/wp

# Vérifier si l'installation a fonctionné
wp --info

# # Téléchargez un exemple de docker-compose pour WordPress
# git clone https://github.com/kassambara/wordpress-docker-compose
# cd wordpress-docker-compose
# # Installation automatique de wordpress
# make autoinstall

# wp user update --display_name=$USER --user_pass=$PASS

wp core download  --locale=fr_FR --skip-content --user=$WP_ROOT --path=$WP_PATH
cd $WP_PATH

wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --path=$WP_PATH

wp db create
wp core install --url=$1.$DOMAIN_NAME --title="Inception" --admin_user=$WP_ROOT --admin_password=$WP_ROOT_PASS --admin_email=dev@example.net --skip-email
# wp theme install --activate https://github.com/RoneoOrg/wp-bootstrap-starter/archive/refs/heads/master.zip
# wp theme install ultrabootstrap --activate
# wp theme install rock-star --activate --path=$WP_PATH
# wp language theme install rock-star fr_FR --path=$WP_PATH
# wp language core update --path=$WP_PATH
exec /usr/sbin/php-fpm7 -F -R
