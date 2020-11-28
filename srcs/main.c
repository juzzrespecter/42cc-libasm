#include "libasm.h"
#include <string.h>

int main()
{
	char *len_test = "cambiame";
	char *src_test = "cambiame";
	char *dst_test = malloc(sizeof(char) * ft_strlen(src_test));
	char *ft_dst_test = malloc(sizeof(char) * ft_strlen(src_test));
	char *s1 = "cambiame";
	char *s2 = "cambiame";
	char *writeme = "cambiame";
	int	fd_write = 0; // cambiame
	int fd_read = 0; // cambiame

	printf("############ STRLEN ############\nstr: (%s)\n -->len: (%d)\n -->ft_len: (%d)\n############        ############\n\n\n", len_test, strlen(len_test), ft_strlen(len_test));
	printf("############ STRCPY ############\nsrc: (%s)\n -->cpy: (%s)\n -->ft_cpy: (%s)\n############        ############\n\n\n", src_test, strcpy(dst_test, src_test), ft_strcpy(ft_dst_test, src_test));
	free(dst_test);
	free(ft_dst_test);
	printf("############ STRCMP ############\ns1: (%s), s2: (%s)\n -->cmp: (%d)\n -->ft_cmp (%d)\n#############        ############\n\n\n", s1, s2, strcmp(s1, s2), ft_strcmp(s1, s2));
	printf("############ WRITE ############\nstr: (%s)\n")

	return (0);
}
