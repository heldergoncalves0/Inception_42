FROM debian:11

# Install necessary packages
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y php-fpm php-mysql curl mariadb-client less

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Ensure the PHP-FPM service is installed and set up correctly
RUN apt-get install -y php-fpm

# Copy the initialization script
COPY ./script.sh /

# Start the script
CMD ["bash", "/script.sh"]
