# NAME			= inception
# PATH			= --project-directory srcs/
# # SRCS_DIR		= srcs
# # RM				= rm -rf
# # MKDIR			= mkdir -p

# $(NAME):
# 		sudo docker-compose $(PATH) up -d
# 		# echo "$(BOLD)$(GREEN)$(ERASE)--> $(NAME) generated <--$(END)"

# all:	$(NAME)

# build:
# 		sudo docker-compose $(PATH) up -d --build
# 		# echo "$(BOLD)$(GREEN)$(ERASE)--> $(NAME) build <--$(END)"

# test:
# 		echo couou

# clean:
# 		sudo docker-compose $(PATH) down

# fclean:
# 		sudo docker-compose $(PATH) down
# 		sudo docker-compose $(PATH) rm -fsv
# 		sudo docker rmi -f inception_wordpress inception_db inception_nginx
# # printf "$(ERASE)$(YELLOW)$(BOLD)--> $(NAME) CLEAN <--$(END)\n"

# # re:				fclean all

# .PHONY: 		clean fclean all re $(NAME) build
# # .SILENT:		clean fclean all re $(NAME) build


PATH_DOCKER = -f srcs/docker-compose.yml
VOLUMES_HOST = /home/odroz-ba/data/html /home/odroz-ba/data/mysql

all: $(VOLUMES_HOST)
	docker-compose $(PATH_DOCKER) up -d

$(VOLUMES_HOST):
	sudo mkdir -p $@

build: $(VOLUMES_HOST)
	sudo docker-compose $(PATH_DOCKER) up -d --build
# sudo docker-compose $(PATH_DOCKER) up --build

clean:
	sudo docker-compose $(PATH_DOCKER) down --remove-orphans
	docker images prune

fclean: clean
	docker volume rm $$(docker volume ls -q)
	sudo rm -rf /home/odroz-ba/data
	docker network prune --force
	docker rmi inception_nginx inception_mariadb inception_wordpress

status:
	@echo "\033[32mCONTAINERS\033[0m"
	@docker ps -a
	@echo "\n\033[32mIMAGES\033[0m"
	@docker images
	@echo "\n\033[32mVOLUMES\033[0m"
	@docker volume ls
	@echo "\n\033[32mNETWORKS\033[0m"
	@docker network ls

re: fclean all

nt:
	docker container exec -ti nginx bash

mt:
	docker container exec -ti mariadb bash
wt:
	docker container exec -ti wordpress bash
test:
	docker build -t image_test /home/odroz-ba/Bureau/42-inception/srcs/requirements/mariadb/.
	docker run -ti --rm --name test image_test bash

emptycache:
	sudo docker system prune -a

.PHONY: 	all build clean fclean re emptycache $(NAME)
# .SILENT:	clean fclean all re $(NAME) build emptycache

ERASE		= \033[2K\r
GREY		= \033[30m
RED		= \033[31m
GREEN		= \033[32m
YELLOW	= \033[33m
BLUE		= \033[34m
PINK		= \033[35m
CYAN		= \033[36m
WHITE		= \033[37m
END		= \033[0m
BOLD		= \033[1m
UNDER		= \033[4m
SUR		= \033[7m
