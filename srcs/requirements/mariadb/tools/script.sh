sed -i 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf;

service mariadb start;

sleep 2

echo  "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;" > bin.sql

echo "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PSSWD}';" >> bin.sql

echo "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PSSWD}';" >> bin.sql

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';" >> bin.sql

mariadb < bin.sql

mysqladmin -u root -p$DB_ROOT_PASSWORD shutdown

mysqld_safe
