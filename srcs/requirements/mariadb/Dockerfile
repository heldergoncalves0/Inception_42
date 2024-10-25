FROM debian:bullseye

# Install MariaDB
RUN apt-get update -y && apt-get install -y mariadb-server

# Install VIM
RUN apt-get install -y vim 

# Modify the configuration file to allow remote connections
RUN sed -i 's/# bind-address = 127.0.0.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the entrypoint script
COPY ./entrypoint.sh /entrypoint.sh

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/

# Set permissions for the entrypoint script
RUN chmod +x /entrypoint.sh

# Expose the port
EXPOSE 3306

# Start the entrypoint script
CMD ["/entrypoint.sh"]