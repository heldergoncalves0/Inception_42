DATA_PATH = /home/helferna/data

all: setup up

setup:
	# Add or replace localhost entry with your domain in /etc/hosts
	@grep -qxF '127.0.0.1	helferna.42.fr' /etc/hosts || sudo sed -i "s/127.0.0.1\s\+localhost/127.0.0.1\thelferna.42.fr/" /etc/hosts
	# Create required directories
	@sudo mkdir -p $(DATA_PATH)/wordpress
	@sudo mkdir -p $(DATA_PATH)/mariadb

up: 
	docker-compose -f srcs/docker-compose.yml up -d

build:
	docker-compose -f srcs/docker-compose.yml build

down:
	docker-compose -f srcs/docker-compose.yml down

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all --volumes

remove-setup:
	# Remove the added entry from /etc/hosts
	@sudo sed -i '/127.0.0.1\s\+helferna.42.fr/d' /etc/hosts
	# Remove created directories
	@sudo rm -rf $(DATA_PATH)/wordpress $(DATA_PATH)/mariadb

# Prevent make from thinking "PHONY" is a file target
.PHONY: all up build down setup clean
