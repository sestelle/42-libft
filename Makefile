.PHONY: all clean fclean re

CC = gcc
RM = rm

GREEN = \033[0;32m
BLUE = \033[0;34m
RED = \033[0;31m

NAME=libft.a

SRCDIR	=	sources/
SRC		=	$(addprefix $(SRCDIR), ft_memset.c ft_bzero.c ft_memcpy.c ft_memccpy.c ft_memmove.c ft_memchr.c \
			ft_memcmp.c ft_strlen.c ft_strlcpy.c ft_strlcat.c ft_strchr.c ft_strrchr.c \
			ft_strnstr.c ft_strncmp.c ft_atoi.c ft_isalpha.c ft_isdigit.c ft_isalnum.c \
			ft_isascii.c ft_isprint.c ft_toupper.c ft_tolower.c ft_strdup.c ft_calloc.c \
			ft_substr.c ft_strjoin.c ft_strtrim.c ft_putchar_fd.c ft_putstr_fd.c \
			ft_putendl_fd.c ft_putnbr_fd.c ft_strmapi.c ft_split.c ft_itoa.c \
			ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c ft_lstadd_back.c \
			ft_lstdelone.c ft_lstclear.c ft_lstiter.c ft_lstmap.c get_next_line.c \
			ft_isspace.c)

OBJ_DIR = objects
OBJ = $(patsubst $(SRCDIR)%.c, $(OBJ_DIR)/%.o, $(SRC))

CFLAGS = -Wall -Wextra -Werror

INCLUDES = includes/
HEADER = $(INCLUDES)libft.h

all: $(OBJ_DIR) $(NAME)

$(NAME): $(HEADER) $(SRC) $(OBJ) Makefile
	@ar -rcs $(NAME) $(OBJ)
	@printf "$(GREEN) ✓ Building $(NAME)\n"

$(OBJ_DIR)/%.o: $(SRCDIR)/%.c
	@$(CC) $(CFLAGS) -I $(INCLUDES) -c $< -o $@
	@printf "$(GREEN) ✓ Building $@\n"

clean:
	@if [ -e $(OBJ_DIR) ]; \
	then \
		$(RM) -rf $(OBJ_DIR); \
		printf "$(BLUE) ✗ Deletion of object files\n"; \
	fi;

fclean: clean
	@if [ -e $(NAME) ]; \
	then \
		$(RM) -f $(NAME); \
		printf "$(RED) ✗ Deletion of $(NAME)\n"; \
	fi;

re: fclean all

$(OBJ_DIR):
	@mkdir $(OBJ_DIR)
	@printf "$(GREEN) ✓ Creating $(OBJ_DIR) dir\n"
