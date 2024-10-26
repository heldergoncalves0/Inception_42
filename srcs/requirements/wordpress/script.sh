#!/bin/bash

while ! mariadb -h$WORDPRESS_DB_HOST -u$WORDPRESS_DB_USER -p$WORDPRESS_DB_PASSWORD $WORDPRESS_DB_NAME &>/dev/null ; do
	echo "Waiting for MariaDB to start..."
	sleep 1
done

# Ensure the directory for WordPress exists
if [ ! -d /var/www/html ]; then
    mkdir -p /var/www/html
fi

cd /var/www/html

rm -rf *

# Download and install WP-CLI
if [ ! -f /usr/local/bin/wp ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

# Download and configure WordPress
wp core download --allow-root

# Create wp-config.php file
wp config create --dbname="$WORDPRESS_DB_NAME" --dbuser="$WORDPRESS_DB_USER" --dbpass="$WORDPRESS_DB_PASSWORD" --dbhost="$WORDPRESS_DB_HOST" --allow-root

# Install WordPress
wp core install --url="https://helferna.42.fr" --title="$WORDPRESS_TITLE" --admin_user="$WORDPRESS_DB_USER" --admin_password="$WORDPRESS_DB_PASSWORD" --admin_email="$WORDPRESS_DB_EMAIL" --allow-root

# Create a new user
wp user create "$WORDPRESS_USER_ONE" "$WORDPRESS_USER_ONE_EMAIL" --role=author --user_pass="$WORDPRESS_USER_ONE_PASSWORD" --allow-root

# Install the WordPress theme
wp theme install twentynineteen --activate --allow-root

# allow PHP-FPM to listen on port 9000
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php

# Start PHP-FPM (adjust this to the correct version installed in the container)
/usr/sbin/php-fpm7.4 -F
