FROM debian:buster
RUN apt-get update \
&& apt-get upgrade -y \
&& apt-get install -y nginx openssl \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY tools/default ./etc/nginx/sites-available/default
# COPY tools/auto_index_switch ./etc/nginx/auto_index_switch
# COPY tools/script_auto_index.sh /
COPY tools/index.nginx-debian.html /var/www/html/index.html

RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=France/L=Lyon/O=42/OU=42Lyon/CN=odroz-ba" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;
# RUN chown -R www-data:www-data /var/www/html/
# RUN chmod -R 755 /var/www/html/*

EXPOSE 443
# EXPOSE 80

# STOPSIGNAL SIGQUIT

# COPY tools/install.sh ./
# RUN bash install.sh

CMD ["nginx", "-g", "daemon off;"]

