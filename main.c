/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jandre <jandre@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/15 14:34:17 by jandre            #+#    #+#             */
/*   Updated: 2021/02/15 14:49:18 by jandre           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>

size_t	ft_strlen(const char *);
char	*ft_strcpy(char *dest, const char *src);
int 	ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);

int     main()
{
    char *src = "parcimonieux";
    char dst[20];

	ft_strcpy(dst, src);
    printf("ft_strlen : %zu\n", ft_strlen("123456789"));
    printf("ft_strcpy : (|%s|, |%s|)\n", src, dst);
    printf("ft_strcmp : %d\n", ft_strcmp("d", ""));
    printf("strcmp    : %d\n", strcmp("d", ""));
    printf("%ld\n", ft_write(3, "|papaoutes|\n", 16));
    write(3, "|papaoutes|\n", 16);



    return (errno);
}