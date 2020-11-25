	;; void ft_list_push_front(t_list **begin_list, void *data);

	section	.text
	global	_ft_list_push_front
	extern	_malloc

_ft_list_push_front:
	push	rdi
	mov	rax, qword [rdi]
	cmp	rax, 0
	je	push_elem
	mov	rdi, qword [rdi]
while:
	mov	rax, qword [rdi + 8]
	cmp	rax, 0
	je	push_elem
	mov	rdi, qword [rax]
	jmp	while

push_elem:
	push	rdi
	mov	rdi, 16
	call	_malloc
	pop	rdi
	mov	qword [rax], rsi
	mov	qword [rax + 8], 0
	mov	qword [rdi], rax
	pop	rdi
	ret
