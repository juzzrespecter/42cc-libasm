	;; void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

	section	.text
	global	_ft_list_remove_if
	extern	_free

_ft_list_remove_if:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48

	mov	qword [rbp - 8], rdi	; list ptr
	mov	qword [rbp - 16], rsi	; data_ref
	mov	qword [rbp - 24], rdx	; cmp func
	mov	qword [rbp - 32], rcx	; free_fct func
	mov	qword [rbp - 40], 0	; tmp -1 pointer reference
	mov	rax, qword [rbp - 8]
	cmp	rax, 0
	je	remove_end
	mov	rax, qword [rax]
	mov	qword [rbp - 8], rax
remove_while:
	mov	rax, qword [rbp - 8] ; save reference here
	cmp	rax, 0
	je	remove_end
	mov	rdi, qword [rax]
	mov	rsi, qword [rbp - 16]
	call	rax
	cmp	eax, 0
	je	remove
	mov	rax, qword [rax + 8]
	mov	qword [rbp - 8], rax
	jmp	remove_while
remove:
	mov	rax, qword [rbp - 24]
	mov	rdx, qword [rbp - 8]
	mov	rdi, qword [rdx]
	call	rax
	mov	rdi,		; check this!!
	call	_free
	mov	rcx, rdx
	jmp	remove_while
remove_end:
	mov	rsp, rbp
	pop	rbp
	ret
