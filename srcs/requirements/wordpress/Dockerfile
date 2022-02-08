FROM alpine:3.14.3

RUN apk update && apk upgrade
RUN apk add --no-cache curl php7 php-fpm php-pdo php-gd php-cli php-mbstring php-phar php-json bash

COPY tools/install.sh ./
COPY ./tools/wp-config.php /var/www/html/wordpress
RUN bash install.sh

EXPOSE 9000

CMD ["php", "-g", "daemon off;"]
