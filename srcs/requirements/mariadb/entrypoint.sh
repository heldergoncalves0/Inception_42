#!bin/bash

# Start MariaDB
service mysql start

# Database initialization if it's the first time
if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
	echo "Creating database..."
	mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
	mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_ADMIN_USER'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';"
	mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_ADMIN_USER'@'%';"
	mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
	mysql -u root -e "FLUSH PRIVILEGES;"
	echo "Database created."
else
	echo "MariaDB already intialized."
fi

# Keep the container running
exec mysqld_safe