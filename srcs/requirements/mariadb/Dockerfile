FROM debian:11

# Install MariaDB
RUN apt-get update -y && apt-get install -y mariadb-server

# Modify the configuration file to allow remote connections
RUN sed -i 's/# bind-address = 127.0.0.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the script to create the database and configure the database
COPY ./srcs/requirements/mariadb/entrypoint.sh /entrypoint.sh

#Expose the port
EXPOSE 3306

#Run the service
CMD ["sh", "entrypoint.sh"]
