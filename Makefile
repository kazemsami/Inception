all: inception

inception:
	rm -rf /Users/k/data/mariadb
	rm -rf /Users/k/data/wordpress
	mkdir -p /Users/k/data/mariadb
	mkdir -p /Users/k/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up --build -d

clean:
	docker compose -f ./srcs/docker-compose.yml down --rmi all -v --remove-orphans 2>/dev/null || true
	docker compose -f ./srcs/docker-compose-bonus.yml down --rmi all -v --remove-orphans 2>/dev/null  || true

fclean: clean
	rm -rf /Users/k/data/*
	docker rmi -f $$(docker images -a -q) 2> /dev/null || true
	docker volume prune -f

re: clean all

bonus:
	rm -rf /Users/k/data/mariadb
	rm -rf /Users/k/data/wordpress
	mkdir -p /Users/k/data/mariadb
	mkdir -p /Users/k/data/wordpress
	docker compose -f ./srcs/docker-compose-bonus.yml up --build -d
