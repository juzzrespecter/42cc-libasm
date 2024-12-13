	;; int ft_list_size(t_list *begin_list);
	section	.text
	global	_ft_list_size

_ft_list_size:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16

	mov	qword [rbp - 8], rdi
	xor	rax, rax
size_while:
	inc	rax
	mov	rdi, qword [rdi + 8]
	cmp	rdi, 0
	jne	size_while
	mov	rdi, qword [rbp - 8]

	mov	rsp, rbp
	pop	rbp
	ret
