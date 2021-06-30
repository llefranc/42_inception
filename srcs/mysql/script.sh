# !/bin/bash

# install mariadb
/usr/bin/mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# launch mariadb server in background
/usr/bin/mysqld --user=root &

# create one user and one database
sleep 2

cat > create_user.sql << EOF
CREATE DATABASE IF NOT EXISTS \`$MARIADB_DATABASE\`
DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE $MARIADB_DATABASE;
CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWD';
GRANT ALL PRIVILEGES ON *.* TO '$MARIADB_USER'@'%' WITH GRANT OPTION;
EOF

if [ $INSTALL -eq 1 ]
then
    mysql < create_user.sql
fi

rm create_user.sql

while true
do
	sleep 1;
done