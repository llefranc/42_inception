# !/bin/sh
sleep 3

if [ $INSTALL -eq 1 ]
then
	# autoinstall of wordpress with wp-cli
	wp-cli --allow-root core download --path=/usr/share/webapp
	
	cp /wp-config.php /usr/share/webapp/wp-config.php
	chmod 755 /usr/share/webapp/wp-config.php

	wp-cli --allow-root core install --path=/usr/share/webapp --url=https://localhost/ \
	--title="site_inception" --admin_user=$MARIADB_USER --admin_password=$MARIADB_PASSWD --admin_email=xxx@xxx.fr

	# creating 2 wordpress users
	mysql -u $MARIADB_USER -p$MARIADB_PASSWD -h mysql_cont -D $MARIADB_DATABASE -P 3306 < /home/script/create_user_wp.sql
fi

rm /wp-config.php

php-fpm7 -F