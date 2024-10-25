FROM debian:11

# Install necessary packages
RUN apt-get update -y &&  \
    apt-get install -y php7.4-fpm php-mysql curl mariadb-client less

#RUN which php-fpm

# Copy the initialization script
COPY ./script.sh /

# Ensure the script is executable
RUN chmod +x /script.sh

# Start the script
CMD ["bash", "/script.sh"]

