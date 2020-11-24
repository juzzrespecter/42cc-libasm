#include <stdio.h>
#include <stdlib.h>

int main() {
	extern int ft_strlen(char *s);
	int x;

	x = ft_strlen("Hellowordista");
	printf("(%d)\n", x);
	return 0;
}
