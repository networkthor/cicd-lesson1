# My first container

FROM ubuntu:22.04
RUN apt update
RUN apt install -y nginx
COPY src/nginx/html /var/www/html/
CMD ["nginx","-g","daemon off;"]