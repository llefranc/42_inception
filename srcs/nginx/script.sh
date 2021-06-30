# !/bin/sh

mv /var/lib/nginx/html/index.html /usr/share/webapp/index.html

# starting nginx
nginx -g "daemon off;"

while true
do
    sleep 1;
done