# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zyunusov <zyunusov@student.42wolfsburg.de> +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/12 11:54:56 by zyunusov          #+#    #+#              #
#    Updated: 2023/02/16 17:06:00 by zyunusov         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Target output
NAME = cub3d
#Compiler opt
CC		:= cc
CFLAGS	:= -Wall -Werror -Wextra -I./mlx -g #-fsanitize=address
MLX_FLAGS :=  -L./mlx -lmlx -framework OpenGL -framework AppKit
#Sources
SRC_ROOT		:= src/
SRC_SUBDIRS		:= main parsing errors utils game
SRC_DIR			:= $(addprefix $(SRC_ROOT), $(SRC_SUBDIRS))
SRCS			:= $(foreach subdir, $(SRC_DIR), $(wildcard $(subdir)/*.c))
#Libft library
LIBFT		:= libft.a
LIBFT_PATH	:= libft/
LIBFT_FULL	:= $(addprefix $(LIBFT_PATH), $(LIBFT))
#GNL
GNL = get_next_line.a
GNL_PATH	:= get_next_line/
GNL_FULL	:= $(addprefix $(GNL_PATH), $(GNL))
#Object to compile
OBJ_DIR	:= obj/
OBJS	:= $(patsubst %.c, %.o, $(notdir $(SRCS)))
OBJS	:= $(addprefix $(OBJ_DIR), $(OBJS))
# Look for (.c) files in the following directories if not found elsewhere
vpath %.c $(SRC_DIR)

# Make desired target
all: directories $(NAME)
	
# Make the target executable
$(NAME): $(OBJS) $(LIBFT_FULL) $(GNL_FULL)
	$(CC) $(CFLAGS) $< $(filter-out $<, $^) -o $@ $(LIBFT_FULL) $(GNL_FULL) $(MLX_FLAGS)
#-lmlx -framework OpenGL -framework AppKit

directories: $(OBJ_DIR)
#Make obj files
$(addprefix $(OBJ_DIR), %.o): %.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $^ -o $@
#Create obj dir
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)
# Make library archive
$(LIBFT_FULL): $(LIBFT_PATH)
	make -sC libft/
	make -sC ./mlx
$(GNL_FULL): $(GNL_PATH)
	make -sC get_next_line/

clean:
	make clean -sC ./libft
	make clean -sC ./get_next_line
	make clean -sC ./mlx
	rm -rf $(OBJ_DIR)

fclean: clean
	make fclean -sC ./libft
	make fclean -sC ./get_next_line
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re