FROM alpine:3.14

# Install php packages
# Install dumb-init program to correctly handle signals    
# Install wp-cli for auto-install of wordpress 
RUN apk update && \
    apk add vim php7-fpm php7-opcache php7-common php7-iconv php7-json php7-gd \
    php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc \
    php7-posix php7-session php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-curl \
    php7-xml php7-mbstring php7-cli php7-phar mariadb-client && \
    wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 && \
    chmod +x /usr/bin/dumb-init && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    mv wp-cli.phar /usr/bin/wp-cli && \
    chmod 755 /usr/bin/wp-cli && \
    rm /etc/php7/php-fpm.d/www.conf && \
    mkdir -p /run/php

COPY wp-config.php /wp-config.php
COPY www.conf /etc/php7/php-fpm.d/www.conf
COPY script.sh /home/script/script.sh
COPY create_user_wp.sql /home/script/create_user_wp.sql

# giving rights for execution
RUN chmod 777 /home/script/script.sh

EXPOSE 9000

# Allow to handle correctly signals and dispatch them to other programs running
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["sh", "-c", "/home/script/script.sh"]