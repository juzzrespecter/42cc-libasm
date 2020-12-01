	;; void ft_list_sort(t_list **begin_list, int (*cmp)())

	section	.text
	global	_ft_list_sort
	extern	_ft_list_size

_ft_list_sort:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32

	mov	qword [rbp - 8], rdi	; **begin_list
	mov	qword [rbp - 16], rsi	; fct (*cmp)
	mov	qword [rbp - 24], 0	; puntero a elemento de lista
	mov	dword [rbp - 28], 0	; size list
	mov	rax, qword [rbp - 8]
	cmp	qword [rax], 0
	je	sort_end
	mov	rdi, qword [rax]
	call	_ft_list_size
	dec	rax
	mov	dword [rbp - 28], eax
sort_while:
	mov	rax, qword [rbp - 8]
	mov	rax, qword [rax]
	mov	qword [rbp - 24], rax
	mov	eax, dword [rbp - 28]
	cmp	eax, 0
	je	sort_end
	dec	eax
	mov	dword [rbp - 28], eax
sort_round:
	mov	rax, qword [rbp - 24]
	mov	rdx, [rax + 8]
	cmp	rdx, 0
	je	sort_while
	mov	rdi, [rax]
	mov	rsi, [rdx]
	mov	rax, qword [rbp - 16]
	call	rax
	cmp	eax, 0
	jg	sort_move
sort_next:
	mov	rax, qword [rbp - 24]
	mov	rax, qword [rax + 8]
	mov	qword [rbp - 24], rax
	jmp	sort_round
sort_move:
	mov	rax, qword [rbp - 24]
	mov	rdx, qword [rax + 8]
	mov	rbx, qword [rax]
	mov	rcx, qword [rdx]
	mov	qword [rax], rcx
	mov	qword [rdx], rbx
	jmp	sort_next
sort_end:
	mov	rsp, rbp
	pop	rbp
	ret
