#!/bin/bash

# Ensure the directory for WordPress exists
if [ ! -d /var/www/html ]; then
    mkdir -p /var/www/html
fi

cd /var/www/html

# Download WordPress core using wp-cli
if ! command -v wp &> /dev/null; then
    echo "wp-cli is not installed!"
    exit 1
fi

# Download and configure WordPress
wp core download --allow-root --version=5.8.2 --locale=pt_PT

# Create wp-config.php file
wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_ADMIN_USER} --dbpass=${MYSQL_ADMIN_PASSWORD} --dbhost=${MYSQL_HOST} --allow-root

# Install WordPress
wp core install --url=${DOMAIN_NAME} --title="${WORDPRESS_TITLE}" --admin_user=${MYSQL_ADMIN_USER} --admin_password=${MYSQL_ADMIN_PASSWORD} --admin_email=${WORDPRESS_EMAIL} --allow-root

# Create a new user
wp user create ${WORDPRESS_USER} ${WORDPRESS_EMAIL} --role=author --user_pass=${WORDPRESS_USER_PASSWORD} --allow-root

# Start PHP-FPM (adjust this to the correct version installed in the container)
exec php-fpm8.0 -F -R
