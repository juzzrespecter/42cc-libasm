	;; void ft_list_push_front(t_list **begin_list, void *data);

	section	.text
	global	_ft_list_push_front
	extern	_malloc

_ft_list_push_front:
	mov	rax, [rdi]
	cmp	rax, 0
	je	push_elem
	mov	rdi, [rdi]
while:
	mov	rax, [rdi + 8]
	cmp	rax, 0
	je	push_elem
	mov	rdi, [rax]
	jmp	while

push_elem:
	push	rdi
	mov	rdi, 16
	call	_malloc
	pop	rdi
	mov	[rax], rsi
	mov	[rax + 8], 0
	mov	[rdi], rax
	ret
