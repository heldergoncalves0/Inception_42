#!/bin/bash

# Check if the database directory is initialized
if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
    echo "Initializing database..."
    # Initialize the database
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql

    # Start the MariaDB server in the background
    mysqld_safe --datadir=/var/lib/mysql &

	sleep 5

    # Create database and users
    mariadb -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
    mariadb -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_ADMIN_USER'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';"
    mariadb -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_ADMIN_USER'@'%';"
    mariadb -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    mariadb -u root -e "FLUSH PRIVILEGES;"
    echo "Database created."
else
    echo "MariaDB already initialized."
fi

# Keep the container running
exec mysqld_safe
