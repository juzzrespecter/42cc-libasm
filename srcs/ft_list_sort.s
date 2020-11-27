	;; void ft_list_sort(t_list **begin_list, int (*cmp)())

	section	.text
	global	_ft_list_sort
	extern	_ft_list_size

_ft_list_sort:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16

	mov	qword [rbp - 8], rsi ; cmp
	mov	qword [rbp - 16], 0
	mov	rbx, rdi
	cmp	qword [rbx], 0
	je	end
	mov	rdi, qword [rbx]
	call	_ft_list_size
	dec	rax
	mov	qword [rbp - 16], rax
while:
	mov	rax, qword [rbp - 16]
	cmp	rax, 0
	je	end
	dec	rax
	mov	qword [rbp - 16], rax
	mov	rcx, [rbx]
	mov	rdx, [rcx + 8]
round:
	cmp	rdx, 0
	je	while
	mov	rdi, [rcx]
	mov	rsi, [rdx]
	mov	rax, qword [rbp - 8]
	call	rax
	cmp	rax, 0
	jg	sort
	jmp	next
sort:
	push	rbx
	mov	rax, qword [rcx]
	mov	rbx, qword [rdx]
	mov	qword [rdx], rax
	mov	qword [rcx], rbx
	pop	rbx
	jmp	next
next:
	mov	rcx, qword [rcx + 8]
	mov	rdx, qword [rdx + 8]
	jmp	round

end:
	pop	rbp
	ret
