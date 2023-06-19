NAME =		printargs

CC =		cc
CFLAGS =	-g -Wall -Wextra -Werror

LIBFT =		libft/libft.a

FILES =		printargs.c

INSTALL_DIR = $(HOME)/.local/bin

all: $(LIBFT) $(NAME)

$(LIBFT):
	@git submodule update --init --recursive
	@make -C $(@D)

$(NAME): printargs.c
	$(CC) $(CFLAGS) -o $(NAME) printargs.c -Llibft -lft

clean:
	make -C libft clean

fclean: clean
	make -C libft fclean
	/bin/rm -rf $(NAME)

re:	fclean all

install: all
	@cp $(NAME) $(INSTALL_DIR)
	@echo successfully installed $(NAME) to $(INSTALL_DIR)

uninstall:
	@rm -f $(INSTALL_DIR)/$(NAME)
	@echo successfully uninstalled $(NAME) from $(INSTALL_DIR)
