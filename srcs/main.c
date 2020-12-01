#include "libasm.h"
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

int main()
{
	char *len_test = "test";
	char *src_test = "test";
	char *dst_test = malloc(sizeof(char) * ft_strlen(src_test));
	char *ft_dst_test = malloc(sizeof(char) * ft_strlen(src_test));
	char *s1 = "test";
	char *s2 = "tesu";
	char *writeme = "test\n";
	int	fd_write = 0; // cambiame
	int fd_read = 0; // cambiame
	int rd_buff = 200;
	char *rd_str = malloc(sizeof(char) * rd_buff);
	char *strdup_str = "test";
	char *newstr;
	char *ft_newstr;

	printf("############ STRLEN ############\nstr: (%s)\n -->len: (%zu)\n -->ft_len: (%zu)\n############        ############\n\n\n", len_test, strlen(len_test), ft_strlen(len_test));
	printf("############ STRCPY ############\nsrc: (%s)\n -->cpy: (%s)\n -->ft_cpy: (%s)\n############        ############\n\n\n", src_test, strcpy(dst_test, src_test), ft_strcpy(ft_dst_test, src_test));
	free(dst_test);
	free(ft_dst_test);
	printf("############ STRCMP ############\ns1: (%s), s2: (%s)\n -->cmp: (%d)\n -->ft_cmp (%d)\n#############        ############\n\n\n", s1, s2, strcmp(s1, s2), ft_strcmp(s1, s2));
	printf("############ WRITE ############\n -->wr_out: (%zd) with errno (%d) (%s)\n -->ft_wr: (%zd) with errno (%d) (%s)\n############       ############\n\n\n", write(fd_write, writeme, strlen(writeme)), errno, strerror(errno), ft_write(fd_write, writeme, ft_strlen(writeme)), errno, strerror(errno));
	printf("############ READ ############\n -->rd_out: (%zd) with errno (%d) (%s)\n --> ft_rd: (%zd) with errno (%d) (%s)\n############      ############\n\n\n", read(fd_read, rd_str, rd_buff), errno, strerror(errno), ft_read(fd_read, rd_str, rd_buff), errno, strerror(errno));
	free(rd_str);
	newstr = strdup(strdup_str);
	ft_newstr = ft_strdup(strdup_str);
	printf("############ STRDUP ############\nstr: (%s)\n -->strdup: (%s)\n -->ft_str: (%s)\n############        ############\n\n\n", strdup_str, newstr, ft_newstr);

	return (0);
}
