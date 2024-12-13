#include "libasm.h"
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

int main(int argc, char **argv)
{
	char *dst_test;
	char *ft_dst_test;
	int fd_read;
	int	fd_write;
	int rd_buff = 200;
	char *rd_str;
	char *newstr;
	char *ft_newstr;

	if (argc == 3 && !(strcmp(argv[1], "ft_strlen")))
		{
			printf("\n\n############ STRLEN ############\nstr: (%s)\n -->   len: (%zu)\n -->ft_len: (%zu)\n############        ############\n\n", argv[2], strlen(argv[2]), ft_strlen(argv[2]));
		}
	if (argc == 3 && !(strcmp(argv[1], "ft_strcpy")))
		{
			dst_test = malloc(sizeof(char) * ft_strlen(argv[2]));
			ft_dst_test = malloc(sizeof(char) * ft_strlen(argv[2]));
			printf("\n\n############ STRCPY ############\nsrc: (%s)\n -->   cpy: (%s)\n -->ft_cpy: (%s)\n############        ############\n\n", argv[2], strcpy(dst_test, argv[2]), ft_strcpy(ft_dst_test, argv[2]));
			free(dst_test);
			free(ft_dst_test);
		}
	if (argc == 4 && !(strcmp(argv[1], "ft_strcmp")))
		{
			printf("\n\n############ STRCMP ############\ns1: (%s), s2: (%s)\n -->   cmp: (%d)\n -->ft_cmp: (%d)\n#############        ############\n\n", argv[2], argv[3], strcmp(argv[2], argv[3]), ft_strcmp(argv[2], argv[3]));
		}
	if (argc == 4 && !(strcmp(argv[1], "ft_write")))
		{
			fd_write = atoi(argv[2]);
			printf("\n\n############ WRITE ############\n -->   wr: (%zd) with errno (%d) (%s)\n -->ft_wr: (%zd) with errno (%d) (%s)\n############       ############\n\n",	\
						 write(fd_write, argv[3], strlen(argv[3])), errno, strerror(errno), ft_write(fd_write, argv[3], ft_strlen(argv[3])), errno, strerror(errno));
		}
	if (argc == 3 && !(strcmp(argv[1], "ft_read")))
		{
			fd_read = atoi(argv[2]);
			rd_str = malloc(sizeof(char) * rd_buff);
			printf("\n\n############ READ ############\n -->rd_out: (%zd) with errno (%d) (%s)\n --> ft_rd: (%zd) with errno (%d) (%s)\n############      ############\n\n", \
						 read(fd_read, rd_str, rd_buff), errno, strerror(errno), ft_read(fd_read, rd_str, rd_buff), errno, strerror(errno));
			//	if (!errno)
			//	free(rd_str);
		}
	if (argc == 3 && !(strcmp(argv[1], "ft_strdup")))
		{
			newstr = strdup(argv[2]);
			ft_newstr = ft_strdup(argv[2]);
			printf("\n\n############ STRDUP ############\nstr: (%s)\n -->strdup: (%s)\n -->ft_str: (%s)\n############        ############\n\n", argv[2], newstr, ft_newstr);
			free(newstr);
			free(ft_newstr);
		}
	return (0);
}
