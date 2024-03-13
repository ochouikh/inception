all:
	docker-compose -f src/docker-compose.yml up --build

clean:
	sudo rm -rf /home/ochouikh/data/mariadb/* && sudo rm -rf /home/ochouikh/data/wordpress/* && docker-compose -f src/docker-compose.yml down -v

fclean:
	sudo rm -rf /home/ochouikh/data/mariadb/* && sudo rm -rf /home/ochouikh/data/wordpress/* && (echo y | docker system prune -a --force) && docker volume rm mariadb wordpress

re: fclean all
