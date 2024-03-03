FROM debian:bullseye

RUN sleep 10

RUN apt update && apt install -y curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN apt update && apt install -y php7.4

WORKDIR /var/www/html

RUN wp core download --allow-root

RUN mv wp-config-sample.php wp-config.php

RUN apt update && apt install -y php-fpm php-mysql

EXPOSE 9000

WORKDIR /

COPY tools/script.sh .

CMD ["bash", "script.sh"]
