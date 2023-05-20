/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   ft_substr.c                                        :+:    :+:            */
/*                                                     +:+                    */
/*   By: ahorling <ahorling@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2023/05/19 15:31:36 by ahorling      #+#    #+#                 */
/*   Updated: 2023/05/20 17:43:01 by ahorling      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include "errors.h"
#include "ft_strlen.h"

char	*ft_substr(char *s, int start, int len)
{
	int		i;
	char	*substr;
	char	*string;

	i = 0;
	string = (char *)s;
	if (s == NULL)
		return (NULL);
	if (ft_strlen(string) < start)
		len = 0;
	else if ((ft_strlen(string) + start) < len)
		len = ft_strlen(string) + start;
	substr = (char *)malloc((len + 1) * sizeof(char));
	if (substr == NULL)
		malloc_error("ft_substr");
	while (i < len)
	{
		substr[i] = string[i + start];
		i++;
	}
	substr[i] = '\0';
	return (substr);
}