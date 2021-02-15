# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jandre <jandre@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/15 14:00:17 by jandre            #+#    #+#              #
#    Updated: 2021/02/15 14:03:55 by jandre           ###   ########.fr        #
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

SRC = 
OBJ = $(SRC:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(LIB) $(NAME) $(OBJ)

%.o: %.s
	$(NASM) $(NASMFLAGS) -o $@ $<

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all bonus clean fclean re