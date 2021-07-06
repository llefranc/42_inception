# !/bin/sh
sleep 7

cat > create_user_wp.sql << EOF
INSERT INTO \`42_inception\`.\`wp_users\` (\`ID\`, 
\`user_login\`, \`user_pass\`, \`user_nicename\`, \`user_email\`, \`user_status\`, 
\`display_name\`) VALUES ('2', 'user1', MD5('user1'), 'user1', 
'xxx@xxx.com', '0', 'user1');
INSERT INTO \`42_inception\`.\`wp_users\` (\`ID\`, 
\`user_login\`, \`user_pass\`, \`user_nicename\`, \`user_email\`, \`user_status\`, 
\`display_name\`) VALUES ('3', 'user2', MD5('user2'), 'user2', 
'xxx@xxx.com', '0', 'user2');
EOF

if [ $INSTALL -eq 1 ]
then
	# autoinstall of wordpress with wp-cli
	wp-cli --allow-root core download --path=/usr/share/webapp
	
	cp /wp-config.php usr/share/webapp/wp-config.php
	
	wp-cli --allow-root core install --path=/usr/share/webapp --url=https://llefranc.42.fr/ \
	--title="site_inception" --admin_user=$MARIADB_USER --admin_password=$MARIADB_PASSWD --admin_email=xxx@xxx.fr

	# creating 2 wordpress users
	mysql -u $MARIADB_USER -p$MARIADB_PASSWD -h mysql -D $MARIADB_DATABASE -P 3306 < create_user_wp.sql
fi

rm create_user_wp.sql
rm /wp-config.php

php-fpm7 -F