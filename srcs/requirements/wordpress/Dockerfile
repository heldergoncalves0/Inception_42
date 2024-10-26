FROM debian:bullseye

# Install necessary packages
RUN apt-get update -y &&  \
    apt-get install -y php7.4-fpm php-mysql curl mariadb-client less

# Copy the initialization script
COPY ./script.sh /

# Ensure the script is executable
RUN chmod +x /script.sh

# Start the script
CMD ["bash", "/script.sh"]

