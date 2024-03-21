sleep 5

wp core download --allow-root --path=/var/www/html

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

wp config set SERVER_PORT 3306 --allow-root --path=/var/www/html
wp config set DB_HOST 'mariadb:3306' --allow-root --path=/var/www/html
wp config set DB_NAME $DB_NAME --allow-root --path=/var/www/html
wp config set DB_USER $DB_USER --allow-root --path=/var/www/html
wp config set DB_PASSWORD $DB_PSSWD --allow-root --path=/var/www/html

wp core install --url=$DOMAIN_NAME --title=HOME --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --allow-root --path=/var/www/html
wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASSWORD --allow-root --path=/var/www/html

wp plugin install redis-cache --activate --allow-root --path=/var/www/html

wp config set WP_REDIS_HOST 'redis' --allow-root --path=/var/www/html
wp config set WP_REDIS_PORT '6379' --allow-root --path=/var/www/html

wp redis enable --allow-root --path=/var/www/html

sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/7.4/fpm/pool.d/www.conf

mkdir -p /run/php/

/usr/sbin/php-fpm7.4 -F
