FROM debian:bullseye

RUN apt update && apt install -y curl && apt install -y mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN apt update && apt install -y php7.4

RUN apt update && apt install -y php-fpm php-mysql

RUN apt install -y php-redis

EXPOSE 9000

COPY tools/script.sh .

CMD ["bash", "script.sh"]
