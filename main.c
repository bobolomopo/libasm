/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jandre <ajuln@hotmail.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/15 14:34:17 by jandre            #+#    #+#             */
/*   Updated: 2021/03/02 12:04:34 by jandre           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include "libasm.h"

int			main(int argc, char **argv)
{
	char	dest[100];
	int		fd;
	int		fd2;

	fd = open("test.txt", O_RDONLY);
	fd2 = open("testcpy.txt", O_RDONLY);
	printf("mon strlen  : |%ld|\n", ft_strlen(argv[1]));
	printf("vrai strlen : |%ld|\n", strlen(argv[1]));
	printf("mon strcpy  : |%s|\n", ft_strcpy(dest, argv[1]));
	printf("vrai strlen : |%s|\n", strcpy(dest, argv[1]));
	printf("mon strcmp  : |%d|\n", ft_strcmp(argv[1], argv[2]));
	printf("vrai strcmp : |%d|\n", strcmp(argv[1], argv[2]));
	printf("\nmon write   : |%ld|\n", ft_write(1, argv[1], 10));
	printf("\nvrai write  : |%ld|\n", write(1, argv[1], 10));
	printf("mon read    : |%ld|\n", ft_read(fd, dest, 10));
	printf("vrai read   : |%ld|\n", read(fd2, dest, 10));
	printf("mon strdup  : |%s|\n", ft_strdup(argv[1]));
	printf("vrai strdup : |%s|\n", strdup(argv[1]));
	close(fd);
	close(fd2);
	return (1);
}
