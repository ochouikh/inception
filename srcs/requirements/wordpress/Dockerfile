FROM debian:bullseye

RUN apt update && apt install -y curl mariadb-client php7.4 php-fpm php-mysql php-redis

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY tools/script.sh .

CMD ["bash", "script.sh"]
