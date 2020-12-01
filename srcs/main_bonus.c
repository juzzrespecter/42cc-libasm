#include "libasm_bonus.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

t_list *create_list()
{
	char *data_1 = "1235";
	char *data_2 = "1234";
	char *data_3 = "1237";
	char *data_4 = "1236";
	t_list *aux;
	t_list *aux_2;

	aux = malloc(sizeof(t_list));
	aux_2 = aux;
	aux->data = data_1;
	aux->next = malloc(sizeof(t_list));
	aux = aux->next;
	aux->data = data_2;
	aux->next = malloc(sizeof(t_list));
	aux = aux->next;
	aux->data = data_3;
	aux->next = malloc(sizeof(t_list));
	aux = aux->next;
	aux->data = data_4;
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
	memset(data, 0 , strlen(data));
}

int main()
{
	int atoi;
 char *str = "    -abc456";
	char *base = "0abcdefgjk";
	t_list *alist;
	t_list **begin_list;
	char *data_front = "1231";
	int list_size;
	char *data_ref = "1236";
	int (*cmp)(char *, char *) = &strcmp;
	void (*free_fct)(void *) = free_fct;

	printf("atoi_base: a: (%s), b: (%s), i: (%d)\n", str, base, ft_atoi_base(str, base));
	alist = create_list();
	begin_list = &alist;
	print_list_data(alist);
	printf("[...] Testing list_size\n\n");
	list_size = ft_list_size(*begin_list);
	printf("size list (should be 4): (%d).\n", list_size);
	printf("[...] Testing list_push_front\n\n");
	ft_list_push_front(begin_list, strdup(data_front));
	ft_list_push_front(begin_list, strdup(data_front));
	print_list_data(alist);
	printf("[...] Testing list_sort\n\n");
	ft_list_sort(begin_list, cmp);
	print_list_data(*begin_list);
	printf("[...] Testing list_remove_if\n\n");
	ft_list_remove_if(begin_list, data_ref, cmp, free_fct);
	printf("...\n");
	print_list_data(*begin_list);
}
