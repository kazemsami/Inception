#!/usr/bin/env bash

mkdir -p /var/www/html/wordpress

cd /var/www/html/wordpress

cp /tmp/wp-config.php .

wp core download --force --allow-root

wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --allow-root

wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASS --allow-root

php-fpm7.3 -F