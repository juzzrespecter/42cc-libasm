	;; int ft_list_size(t_list *begin_list);
	section	.text
	global	_ft_list_size

_ft_list_size:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 8

	mov	qword [rsp - 8], rdi
	xor	rax, rax
while:
	inc	rax
	mov	rdi, [rdi + 8]
	cmp	rdi, 0
	jne	while
	mov	rdi, qword [rsp - 8]
	pop	rbp
	ret
