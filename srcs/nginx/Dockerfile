FROM alpine:3.14

# install nginx and openssl for https connexion
RUN apk update && apk add nginx vim openssl

# Install dumb-init program to correctly handle signals
RUN wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64
RUN chmod +x /usr/bin/dumb-init

# needed to launch nginx
RUN mkdir -p /run/nginx /usr/share/webapp

# replace default nginx conf with ours
RUN rm /etc/nginx/http.d/default.conf
COPY my_nginx.conf /etc/nginx/http.d/my_nginx.conf

# Creating directory for TLS config
RUN mkdir /etc/nginx/tls

# Creating TLS certificate
RUN openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/tls/nginx.crt \
		-keyout /etc/nginx/tls/nginx.key -subj '/CN=localhost'

# copying script for starting nginx and infinite loop to prevent exit
COPY script.sh /home/script/script.sh
# giving rights for execution
RUN chmod 777 /home/script/script.sh

# Allow to handle correctly signals and dispatch them to other programs running
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["sh", "-c", "/home/script/script.sh"]