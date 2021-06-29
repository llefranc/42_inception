# !/bin/sh

# Creating TLS certificate
openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/tls/nginx.crt \
		-keyout /etc/nginx/tls/nginx.key -subj '/CN=localhost'

# Then starting nginx
nginx -g "daemon off;"