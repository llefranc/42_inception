# !/bin/sh

# Creating TLS certificate
openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/tls/nginx.crt \
		-keyout /etc/nginx/tls/nginx.key -subj '/CN=localhost'

# Then starting nginx
nginx -g "daemon off;"

# Looping while nginx process exist. If nginx is killed, the script exit and so the
# container will exit too as this script was the entrypoint.
# STATUS=1
# while [ $STATUS -ne 0 ]; do
#     echo $STATUS
#     sleep 1
#     STATUS=$(/usr/bin/pgrep nginx | wc -l)
# done