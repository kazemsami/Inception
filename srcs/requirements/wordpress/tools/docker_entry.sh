#!/usr/bin/env bash

mkdir -p /var/www/html/wordpress

cd /var/www/html/wordpress

sed -i 's/define( 'DB_NAME', 'wordpress' );/define( 'DB_NAME', '$DB_NAME' );/g' input.txt
sed -i 's/define( 'DB_PASSWORD', 'hello123' );/define( 'DB_PASSWORD', '$DB_PASS' );/g' input.txt
sed -i 's/define( 'DB_USER', 'kabusitt' );/define( 'DB_USER', '$DB_USER' );/g' input.txt

cp /tmp/wp-config.php .

wp core download --force --allow-root

wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --allow-root

wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASS --allow-root

php-fpm7.3 -F