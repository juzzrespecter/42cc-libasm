#include "libasm.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <fcntl.h>

int main()
{
	int buffer = 45;
	char *s = malloc(buffer + 1);
	int x;
	int fd = open("test.txt", O_RDONLY);

	printf("b: error n: (%d) with descr: (%s).\n", errno, strerror(errno));
	x = ft_read(0, s, buffer);
	printf("a:ret: (%d) error n: (%d) with descr: (%s).\n",x,  errno, strerror(errno));
	close(fd);
	return (0);
}
