# !/bin/bash


# launch mariadb server in background

# create one user and one database
cat > create_user.sql << EOF
CREATE DATABASE IF NOT EXISTS \`$MARIADB_DATABASE\`
DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE $MARIADB_DATABASE;
CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWD';
GRANT ALL PRIVILEGES ON *.* TO '$MARIADB_USER'@'%' WITH GRANT OPTION;
EOF

if [ $INSTALL -eq 1 ]
then
    # install mariadb
    /usr/bin/mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
    /usr/bin/mysqld --user=root &
    sleep 2
    mysql < create_user.sql
    pkill mysqld
fi

/usr/bin/mysqld --user=$MARIADB_USER