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
	cmp	qword [rax], 0
	je	push_elem
	mov	rax, qword [rax]
	mov	qword [rbp - 8], rax
push_while:
	mov	rax, qword [rbp - 8]
	mov	rax, qword [rax + 8]
	cmp	rax, 0
	je	push_elem
	mov	qword [rbp - 8], rax
	jmp	push_while

push_elem:
	mov	rdi, 16
	call	_malloc
	mov	rdx, qword [rbp - 16]
	mov	qword [rax], rdx
	mov	qword [rax + 8], 0
	mov	rdx, qword [rbp - 8]
	mov	rcx, qword [rdx]
	mov	rcx, [rax]
	mov	qword [rdx + 8], rax
	mov	rcx, qword [rdx + 8]
	mov	rcx, qword [rcx]

	mov	rsp, rbp
	pop	rbp
	ret
