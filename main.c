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
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>


size_t	ft_strlen(const char *);
char	*ft_strcpy(char *dest, const char *src);
int 	ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char *ft_strdup(const char *s);

int     main()
{
   // char *src = "parcimonieux";
  //  char dst[20];
  /*  int fd = open("test.txt", O_RDONLY); */
  //  char buffer[51];
    char *dest;
    char *dest2;
    char *str = "pazoejpazjdoiazjdoiazjdiojaziodjazoidjioazjdoiajzdoijazoidjazoidjoiazjdioazndjznvjcrevjberjvzoenvoizeoinzeoidjiozejd";

   // buffer[50] = '\0';
	//ft_strcpy(dst, src);
   // printf("ft_strlen : %zu\n", ft_strlen("123456789"));
   // printf("ft_strcpy : (|%s|, |%s|)\n", src, dst);
   // printf("ft_strcmp : %d\n", ft_strcmp("d", ""));
   // printf("strcmp    : %d\n", strcmp("d", ""));
   // ft_write(1, "|papaoutes|\n", 12);
   // write(1, "|papaoutes|\n", 12);
   // while (read(fd, buffer, 50) > 0)
    //    printf("%s\n", buffer);
   // close(fd);
    dest = ft_strdup(str);
    dest2 = strdup(str);
    printf("%s\n", dest);
    printf("%s\n", dest2);
    free(dest);



    return (errno);
}