#!/bin/bash

# 1/ Télécharger  wp-cli

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# 2/ Rendre l'application exécutable

chmod +x wp-cli.phar

# 3/ Déplacez-le dans /usr/local/bin/wp

mv wp-cli.phar /usr/local/bin/wp

# Vérifier si l'installation a fonctionné

wp --info

# # Téléchargez un exemple de docker-compose pour WordPress
# git clone https://github.com/kassambara/wordpress-docker-compose
# cd wordpress-docker-compose
# # Installation automatique de wordpress
# make autoinstall

# wp user update --display_name=$USER --user_pass=$PASS

mkdir wp-test && cd wp-test
wp core download
wp core config --dbuser=$USER --dbpass=$PASS --dbhost=localhost
