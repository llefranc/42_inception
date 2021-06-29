# !/bin/sh
nginx
php-fpm7
sleep 3

if [ $INSTALL -eq 1 ]
then
	# autoinstall of wordpress with wp-cli
	wp-cli --allow-root core download --path=/usr/share/webapp
	
	mv /wp-config.php /usr/share/webapp/wp-config.php
	chmod 755 /usr/share/webapp/wp-config.php

	wp-cli --allow-root core install --path=/usr/share/webapp --url=http://localhost:5050/wordpress \
	--title="site_inception" --admin_user=user42 --admin_password=user42 --admin_email=xxx@xxx.fr

	# creating 2 wordpress users
	mysql -u user42 -puser42 -h mysql_cont -D 42_inception -P 3306 < /home/script/create_user_wp.sql
fi

while true
do
	sleep 1;
done