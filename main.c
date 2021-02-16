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

size_t	ft_strlen(const char *);
char	*ft_strcpy(char *dest, const char *src);

int     main()
{
    char *src = "parcimonieux";
    char dst[20];

	ft_strcpy(dst, src);
    printf("ft_strlen : %zu\n", ft_strlen("123456789"));
    printf("ft_strcpy : (|%s|, |%s|)\n", src, dst);
    
    return (0);
}