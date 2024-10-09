# libasm
Part of 42 common-core cursus: first steps into assembly language

This project consists on rewritting a number of functions from the standard c library in x86-64 asm (intel syntax) and build a simple static library with them.
## Rewritten functions
```
size_t ft_strlen(const char *s);
char *ft_strcpy(char *dst, const char *s2);
int ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char *ft_strdup(const char *s);

int ft_atoi_base(char *str, char *base);
void ft_list_push_front(t_list **begin_list, void *data);
int ft_list_size(t_list *begin_list);
void ft_list_sort(t_list **begin_list, int (*cmp)());
void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
```

This project was passed with a 125% mark.
