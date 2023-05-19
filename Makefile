# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: fholwerd <fholwerd@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2022/11/08 15:59:07 by fholwerd      #+#    #+#                  #
#    Updated: 2023/05/19 12:11:00 by fholwerd      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME	= cub3D
SRC		= src/stop.c \
			src/raycaster/minimap.c \
			src/raycaster/movement.c \
			src/raycaster/raycaster.c \
			src/raycaster/utils/correct_color.c \
			src/raycaster/utils/deg_to_rad.c \
			src/raycaster/utils/draw_line.c \
			src/raycaster/utils/draw_rectangle.c \
			src/raycaster/utils/fix_ang.c \
			src/raycaster/utils/point.c \
			src/raycaster/utils/put_pixel.c \
			src/raycaster/utils/rectangle.c
OBJ		= $(SRC:.c=.o)
INCLUDE	= -I include \
		  -I include/parser \
		  -I include/raycaster \
		  -I include/raycaster/utils \
		  -I MLX42/include/MLX42
LINKS	= 
CFLAGS	= #-Wall -Wextra -Werror #-g -fsanitize=address
MLXFLAGS = -lglfw -L$(shell brew --prefix glfw)/lib -framework Cocoa -framework OpenGL -framework IOKit
MLXDIR = MLX42/
MLXLIB = $(MLXDIR)build/libmlx42.a
CC		= gcc

all: $(MLXLIB) $(NAME)

%.o: %.c
	@$(CC) $(CFLAGS) $(INCLUDE) -c -o $@ $<

$(NAME): $(OBJ)
	@echo "Compiling executable."
	@$(CC) $(MLXLIB) $(MLXFLAGS) $(CFLAGS) $(OBJ) $(LINKS) -o $(NAME)

$(MLXLIB):
	@echo "Compiling MLX library."
	@make -C $(MLXDIR)build

clean:
	@echo "Cleaning files."
	@rm -f $(OBJ)
	@rm -f $(ALEX_SRC:.c=.o)
	@rm -f $(FRANS_SRC:.c=.o)

fclean: clean
	@make -C $(MLXDIR)build clean
	@echo "Cleaning executable."
	@rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
