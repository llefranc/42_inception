FROM alpine:3.14

# Install nginx and openssl for https connexion
# Install dumb-init program to correctly handle signals
# Create TLS certificate
RUN apk update && \
	apk add nginx vim openssl && \
	wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 && \
	chmod +x /usr/bin/dumb-init && \
	mkdir -p /run/nginx /usr/share/webapp && \
	rm /etc/nginx/http.d/default.conf && \
	mkdir /etc/nginx/tls && \
	openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/tls/nginx.crt \
		-keyout /etc/nginx/tls/nginx.key -subj '/CN=localhost'

COPY my_nginx.conf /etc/nginx/http.d/my_nginx.conf

# Allow to handle correctly signals and dispatch them to other programs running
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["nginx", "-g", "daemon off;"]