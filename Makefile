NAME =		pipex

CC =		cc
CFLAGS =	-g -Wall -Wextra -Werror

LIBFT =		libft/libft.a

FILES =		printargs.c

all: $(LIBFT) printargs.c

$(LIBFT):
	@git submodule update --init --recursive --remote
	@make -C $(@D)

printargs: printargs.c
	$(CC) $(CFLAGS) -o printenv printenv.c -Llibft -lft