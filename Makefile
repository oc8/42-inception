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

build:
	sudo docker-compose $(PATH_DOCKER) up -d --build

clean:
	sudo docker-compose $(PATH_DOCKER) down

fclean: clean
	sudo docker-compose $(PATH_DOCKER) rm -fsv
	sudo docker rmi -f inception_wordpress inception_sql inception_nginx
	sudo rm -rf $(VOLUMES_HOST)

re: fclean all

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
