	;; void ft_list_push_front(t_list **begin_list, void *data);

	section	.text
	global	_ft_list_push_front
	extern	_malloc

_ft_list_push_front:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16

	mov	qword [rbp - 8], rdi	; puntero a inicio de lista
	mov	qword [rbp - 16], rsi	; nuevo data
	mov	rax, qword [rbp - 8]
	cmp	rax, 0
	je	push_ret
	cmp	qword [rax], 0
	je	push_first_elem
	mov	rax, qword [rax]
	mov	qword [rbp - 8], rax
push_while:
	mov	rax, qword [rbp - 8]
	mov	rax, qword [rax + 8]
	cmp	rax, 0
	je	push_elem
	mov	qword [rbp - 8], rax
	jmp	push_while
push_first_elem:
	mov	rdi, 16
	call	_malloc
	cmp	rax, 0
	je	push_ret
	mov	rdx, qword [rbp - 16]
	mov	qword [rax], rdx
	mov	rdx, 0
	mov	qword [rax + 8], rdx
	mov	rdx, qword [rbp - 8]
	mov	qword [rdx], rax
	jmp	push_ret
push_elem:
	mov	rdi, 16
	call	_malloc
	cmp	rax, 0
	je	push_ret
	mov	rdx, qword [rbp - 16]
	mov	qword [rax], rdx
	mov	rdx, 0
	mov	qword [rax + 8], rdx
	mov	rdx, qword [rbp - 8]
	mov	qword [rdx + 8], rax
push_ret:
	mov	rsp, rbp
	pop	rbp
	ret
