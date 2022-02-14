# FROM wordpress:php7.3-fpm-alpine

FROM alpine:3.14.3

RUN apk update && apk upgrade
# RUN apk add --no-cache curl php7 php-fpm php-pdo php-gd php-cli php-mbstring php-phar php-json bash
# RUN apk add --no-cache curl php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip php-phar php-json bash
# php7.3 php7.3-mysql
# RUN apk add --no-cache php7 php7-openssl php7-xml php7-pdo php7-mcrypt php7-session php7-mysqli php7-zlib su-exec bash curl
RUN apk add --update php7-fpm php7-json php7-zlib php7-xml php7-xmlwriter php7-simplexml php7-pdo php7-phar php7-openssl \
    php7-pdo_mysql php7-mysqli php7-session \
    php7-gd php7-iconv php7-mcrypt php7-gmp php7-zip \
    php7-curl php7-opcache php7-ctype php7-apcu \
    php7-intl php7-bcmath php7-dom php7-mbstring php7-xmlreader bash tar curl wget mysql-client mysql openrc util-linux git make

COPY tools/install.sh ./
COPY tools/www.conf /etc/php7/php-fpm.d/www.conf
COPY tools/php-fpm.conf /etc/php7/php-fpm.conf
# COPY ./tools/wp-config.php ./

EXPOSE 9000
run chmod -x install.sh
run ls

# CMD ["/bin/bash", "/install.sh"]
# CMD ["/bin/bash", "--init-file", "/install.sh"]
CMD ["tail", "-f"]
