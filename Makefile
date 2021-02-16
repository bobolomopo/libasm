# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jandre <jandre@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/15 14:00:17 by jandre            #+#    #+#              #
#    Updated: 2021/02/15 14:43:22 by jandre           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a
CC = gcc
LIB = ar rcs
FLAGS = -Wall -Wextra -Werror
NASM = nasm
ifeq ($(shell uname),Linux)
	NASMFLAGS = -f elf64 -D__LINUX__=1
else
	NASMFLAGS = -f macho64
endif

SRC = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
OBJ = $(SRC:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	@echo "making library. . ."
	@$(LIB) $(NAME) $(OBJ)
	@echo "done!"

%.o: %.s
	@echo "creating objects. . ."
	@$(NASM) $(NASMFLAGS) -o $@ $<
	@echo "done!"

test: all
	@echo "RESULT\n------"
	@$(CC) main.c $(NAME) && ./a.out

clean:
	@echo "cleaning. . ."
	@rm -f $(OBJ)
	@echo "cleaning done!"

fclean: clean
	echo "deleting lib. . ."
	@rm -f $(NAME)
	echo "done!"

re: fclean all

.PHONY: all bonus clean fclean re test