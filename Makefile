all: inception

inception:
	rm -rf /Users/k/data/mariadb
	docker compose -f ./srcs/docker-compose.yml up --build -d

clean:
	rm -rf /Users/k/data/*
	docker rmi -f $$(docker images -a -q) 2> /dev/null || true
	docker volume prune -f

fclean: clean
	docker compose -f ./srcs/docker-compose.yml down --rmi all -v --remove-orphans

re: clean all