# 42_inception

> [Here is the subject][5]

This project was an introduction to system administration by using Docker.  

We had to **virtualize several Docker images for different services**, and to deploy them using **docker-compose**.  

We had to setup the following things:

- ➡️ A Docker container that contains NGINX with TLS
- ➡️ A Docker container that contains WordPress + php-fpm
- ➡️ A Docker container that contains MariaDB 
- ➡️ A volume that contains the WordPress database
- ➡️ A second volume that contains your WordPress website files
- ➡️ A docker-network that establishes the connection between the containers

## Sources

[How to config a HTTPS server][2]  
[Create a TLS certificate][1]  
[Looping in a shell script until until a process die][3]  
[Start php-fpm in foreground][4]  

[1]:https://www.linode.com/docs/guides/create-a-self-signed-tls-certificate/
[2]:http://nginx.org/en/docs/http/configuring_https_servers.html
[3]:https://stackoverflow.com/questions/38666191/while-loop-in-bash-that-uses-pgrep-to-check-if-service-exists
[4]:https://stackoverflow.com/questions/37313780/how-can-i-start-php-fpm-in-a-docker-container-by-default/44409813
[5]:https://github.com/llefranc/42_inception/blob/main/inception.en.subject.pdf
