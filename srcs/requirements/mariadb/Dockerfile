FROM debian:buster
RUN apt update -y \
&& apt install mariadb-server -y \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/install.sh ./
COPY tools/script.sql /tmp/
#ajout de commande sed pour remplacer les variables

RUN bash install.sh
# RUN /etc/init.d/mysql start && mysql -uroot --password="root" -e "source /tmp/script.sql"
CMD ["mysqld_safe"]
