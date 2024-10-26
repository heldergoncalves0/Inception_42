DATA_PATH = /home/helferna/data

all: setup up

setup:
	@if ! grep -q "127.0.0.1 helferna.42.fr" /etc/hosts; then \
	    echo "Adding host to /etc/hosts"; \
	    echo "127.0.0.1 helferna.42.fr" >> /etc/hosts; \
	else \
	    echo "Host entry already exists. Skipping..."; \
	fi
	@sudo mkdir -p $(DATA_PATH)/wordpress
	@sudo mkdir -p $(DATA_PATH)/mariadb

up: 
	@docker-compose -f srcs/docker-compose.yml up -d

build:
	docker-compose -f srcs/docker-compose.yml build

down:
	docker-compose -f srcs/docker-compose.yml down

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all --volumes

remove-setup:
	@sudo sed -i '/127.0.0.1\s\+helferna.42.fr/d' /etc/hosts
	@sudo rm -rf $(DATA_PATH)/wordpress $(DATA_PATH)/mariadb

fclean: remove-setup clean

re: fclean all

.PHONY: all up build down setup clean remove-setup fclean
