sleep 10;

while [ $(mariadb -u $DB_USER -p$DB_PSSWD -h mariadb -e "show databases;" | grep -c $DB_NAME) -eq 0  ];
do echo "wait";
done;

wp core download --allow-root --path=/var/www/html;

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php;

wp config set SERVER_PORT 3306 --allow-root --path=/var/www/html;
wp config set DB_HOST 'mariadb:3306' --allow-root --path=/var/www/html;
wp config set DB_NAME $DB_NAME --allow-root --path=/var/www/html;
wp config set DB_USER $DB_USER --allow-root --path=/var/www/html;
wp config set DB_PASSWORD $DB_PSSWD --allow-root --path=/var/www/html;

wp core install --url=$DOMAIN_NAME --title=INCEPTION --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root --path=/var/www/html;
wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root --path=/var/www/html;

wp plugin install redis-cache --activate --allow-root --path=/var/www/html;

wp config set WP_REDIS_HOST 'redis' --allow-root --path=/var/www/html;
wp config set WP_REDIS_PORT '6379' --allow-root --path=/var/www/html;
wp config set WP_REDIS_TIMEOUT '1' --allow-root --path=/var/www/html;
wp config set WP_REDIS_DATABASE '0' --allow-root --path=/var/www/html;

wp redis enable --allow-root --path=/var/www/html;

sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/7.4/fpm/pool.d/www.conf;

mkdir -p /run/php/

/usr/sbin/php-fpm7.4 -F;
