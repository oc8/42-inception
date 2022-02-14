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

wp core download  --locale=fr_FR --skip-content --user=wp --path=/var/www/html/wordpress/
cd /var/www/html/wordpress

# wp config create --dbname=wp --dbuser=user_name --prompt=user_pass

# mkdir wp-test && cd wp-test
# wp core download
wp core config --dbuser=$USER --dbpass=$PASS --dbhost=localhost
# mv ../wp-config.php ./

# wp db create
# wp core install --url=$1.localhost --title="Wp / $1" --admin_user=dev --admin_password=pass --admin_email=dev@example.net --skip-email
# wp theme install --activate https://github.com/RoneoOrg/wp-bootstrap-starter/archive/refs/heads/master.zip
# wp server
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
/usr/sbin/php-fpm7 -F -R
