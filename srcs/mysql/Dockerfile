FROM alpine:latest

RUN apk update && apk add mariadb mariadb-client vim

# script that will create an user for mariadb
COPY create_user.sql /home/docker/script/create_user.sql

# Install dumb-init program to correctly handle signals
RUN wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64
RUN chmod +x /usr/bin/dumb-init

# creating path for mysql daemon socket and storage
RUN mkdir -p /run/mysqld /var/lib/mysql
# giving right to mysql user for install
RUN chown mysql /var/lib/mysql

# config file for mariadb-server
RUN rm /etc/my.cnf.d/mariadb-server.cnf
COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

# copying script for infinite loop to prevent exit
COPY script.sh /home/script/script.sh
# giving rights for execution
RUN chmod 777 /home/script/script.sh

# mysql port
EXPOSE 3306

# Allow to handle correctly signals and dispatch them to other programs running
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["sh", "-c", "/home/script/script.sh"]