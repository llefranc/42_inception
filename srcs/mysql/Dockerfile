FROM alpine:3.14

# Install mariaDB packages
# Install dumb-init program to correctly handle signals
# Create path for mysql daemon socket and storage
# Giving right to mysql user for install
RUN apk update && \
    apk add mariadb mariadb-client vim && \
    wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 && \
    chmod +x /usr/bin/dumb-init && \
    mkdir -p /run/mysqld /var/lib/mysql && \
    chown mysql /var/lib/mysql && \
    rm /etc/my.cnf.d/mariadb-server.cnf

COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY create_user.sql /home/docker/script/create_user.sql
COPY script.sh /home/script/script.sh
RUN chmod 777 /home/script/script.sh

EXPOSE 3306

# Allow to handle correctly signals and dispatch them to other programs running
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["sh", "-c", "/home/script/script.sh"]