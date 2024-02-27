#!/bin/bash

service mysql start;
mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;";
mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PSSWD}';";
mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PSSWD}';";
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';";
mysql -e "FLUSH PRIVILEGES;";
mysqladmin -u root -p$DB_ROOT_PASSWORD shutdown;
mysqld_safe;
