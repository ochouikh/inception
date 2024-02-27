FROM debian:bullseye

RUN apt update && apt install -y nginx

RUN apt update && apt install -y openssl

RUN openssl req -x509 -nodes -keyout ochouikh.42.fr.key -out ochouikh.42.fr.crt -subj "/C=MO/ST=KHOURIBGA/L=KH/O=1337/CN=ochouikh.42.fr"

RUN mv ochouikh.42.fr.key /etc/nginx && mv ochouikh.42.fr.crt /etc/nginx

COPY conf/default /etc/nginx/sites-available/default

RUN chmod 755 /var/www/html

# RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD nginx -g daemon off
