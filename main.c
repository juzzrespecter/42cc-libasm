#include "libasm.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main()
{
	char *s1;
	char *s2;
	int i = 0;

	s1 = ft_strdup("test str.");
	s2 = strdup("test str.");
	printf("str (%s).\nft_s (%s).\n", s2, s1);
	printf("test zeroterminado:::\n\n\n\n");
	while (s1[i])
		{
			printf("(%c)\n", s1[i]);
		 i++;
		}
	printf("a okk\n");
	return (0);
}
