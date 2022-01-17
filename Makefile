NAME			= inception

LST_SRCS		= docker-compose.yml
SRCS_DIR		= srcs
RM				= rm -rf
MKDIR			= mkdir -p

$(NAME):
				docker run --name some-nginx -d -p 8080:80 some-content-nginx
				echo "$(BOLD)$(GREEN)$(ERASE)--> $(NAME) generated <--$(END)"

clean:

fclean:		clean
				printf "$(ERASE)$(YELLOW)$(BOLD)--> $(NAME) CLEAN <--$(END)\n"

re:				fclean all

.PHONY: 		clean fclean all re
.SILENT:		clean fclean all re $(NAME)

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
