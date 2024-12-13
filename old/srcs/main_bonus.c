#include "libasm_bonus.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

t_list *create_list()
{
	t_list *aux;
	t_list *aux_2;

	aux = malloc(sizeof(t_list));
	aux_2 = aux;
	aux->data = ft_strdup("2o elemento");
	aux->next = malloc(sizeof(t_list));
	aux = aux->next;
	aux->data = ft_strdup("3er elemento");
	aux->next = malloc(sizeof(t_list));
	aux = aux->next;
	aux->data = ft_strdup("4o elemento");
	aux->next = malloc(sizeof(t_list));
	aux = aux->next;
	aux->data = ft_strdup("1er elemento");
	aux->next = 0;
	return (aux_2);
}

void print_list_data(t_list *alist)
{
	int i = 0;
	t_list *aux = alist;

	printf("=================== list ===================\n\n");
	while (aux)
		{
			printf("element (%d), data (%s)\n", i, aux->data);
			i++;
			aux = aux->next;
		}
	printf("============================================\n\n");
}

void free_fct(void *data)
{
	memset(data, 0, ft_strlen((char *)data));
	free(data);
}

int main(int argc, char **argv)
{
	int atoi;
	t_list *alist;
	t_list **begin_list;
	char *data_front = "1231";
	int list_size;
	char *data_ref = "1231";
	int count = 0;

	if (argc == 4 && !(strcmp("atoi_base", argv[1])))
		{
			printf("atoi_base: array: (%s), base: (%s).\nresult: (%d)\n", argv[2], argv[3], ft_atoi_base(argv[2], argv[3]));
		}

	if (argc >= 3 && !(strcmp("list", argv[1])))
		{
						alist = create_list();
						//alist = NULL;
			begin_list = &alist;
			print_list_data(alist);
			if (!(strcmp("size", argv[2])))
				{
					printf("[...] Testing list_size\n\n");
					list_size = ft_list_size(*begin_list);
					printf("size list (should be 4): (%d).\n", list_size);
				}
			if (argc >= 4 && !(strcmp("push", argv[2])))
				{
					printf("[...] Testing list_push_front\n\n");
					while (count + 3 < argc)
						{
							ft_list_push_front(begin_list, strdup(argv[3 + count]));
							count++;
						}
					print_list_data(alist);
				}
			if (!(strcmp("sort", argv[2])))
				{
					printf("[...] Testing list_sort\n\n");
					ft_list_sort(begin_list, &ft_strcmp);
					print_list_data(*begin_list);
				}
			if (argc >= 4 && !(strcmp("remove", argv[2])))
				{
					printf("[...] Testing list_remove_if\n\n");
					ft_list_remove_if(begin_list, argv[3], &ft_strcmp, &free_fct);
					print_list_data(*begin_list);
				}
		}
}
