	;; int ft_list_size(t_list *begin_list);
	section	.text
	global	_ft_list_size

_ft_list_size:
	xor	rax, rax
while:
	inc	rax
	mov	rdi, [rdi + 8]
	cmp	rdi, 0
	jne	while
	ret
