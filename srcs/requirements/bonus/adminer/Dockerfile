FROM debian:bullseye

RUN apt update && apt install -y apache2 libapache2-mod-php wget php7.4 php7.4-mysql

RUN a2enmod php7.4

RUN wget https://www.adminer.org/latest.php -O /var/www/html/adminer.php

CMD apache2 -DFOREGROUND
