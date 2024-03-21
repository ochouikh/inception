FROM debian:bullseye

RUN apt update && apt install -y nginx

COPY tools/* /var/www/html/

CMD nginx -g "daemon off;"
