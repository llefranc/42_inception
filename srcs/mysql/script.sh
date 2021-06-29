# !/bin/sh

# install mariadb
/usr/bin/mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# launch mariadb server in background
/usr/bin/mysqld --user=root