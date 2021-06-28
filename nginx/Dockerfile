FROM alpine:3.14

# install nginx and openssl for https connexion
RUN apk update && apk add nginx vim openssl

# needed to launch nginx
RUN mkdir -p /run/nginx

RUN mkdir /usr/share/webapp
RUN mv /var/lib/nginx/html/index.html /usr/share/webapp/index.html

# replace default nginx conf with ours
RUN rm /etc/nginx/http.d/default.conf
COPY my_nginx.conf /etc/nginx/http.d/my_nginx.conf

# Creating directory for TLS config
RUN mkdir /etc/nginx/tls

# copying script for starting nginx and infinite loop to prevent exit
COPY script.sh /home/script/script.sh
# giving rights for execution
RUN chmod 777 /home/script/script.sh

# container will start on this script
ENTRYPOINT /home/script/script.sh

# docker run --name nginx_cont -d -p 443:443 nginx_img