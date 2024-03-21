FROM debian:bullseye

RUN apt update && apt install -y nginx openssl

RUN openssl req -x509 -nodes -keyout ochouikh.42.fr.key -out ochouikh.42.fr.crt -subj "/C=MO/ST=KHOURIBGA/L=KH/O=1337/CN=ochouikh.42.fr" && mv ochouikh.42.fr.key /etc/nginx && mv ochouikh.42.fr.crt /etc/nginx

COPY conf/default /etc/nginx/sites-available/default

CMD nginx -g "daemon off;"
