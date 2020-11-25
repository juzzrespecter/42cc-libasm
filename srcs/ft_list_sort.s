	;; void ft_list_sort(t_list **begin_list, int (*cmp)())

	section	.text
	global	_ft_list_sort
	extern	_ft_list_size

_ft_list_sort:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16

	mov	qword [rbp - 16], rdi
	mov	rdi, qword [rdi]
	call	_ft_list_size
	mov	rdi, [rbp - 16]
	mov	dword [rbp - 8], rax
	mov	dword [rbp - 4], 0

	mov	rcx, qword [rbx + 8]
	mov	rdx, rsi
	jmp	while
while:
	sub	dword [rbp - 8]
	cmp	dword [rbp - 8], 0
	je	end
	mov	rax, qword [rbp - 16]
	mov	rbx, [rax]
	jmp	pass
pass:
	inc	dword [rbp - 4]
	mov	rdi, [rbx]
	mov	rcx, [rbx + 8]
	mov	rsi, [rcx]
	push	rax
	call	rsp
	mov	rax, rdx
	pop	rax
	cmp	rdx, 0
	jg	sort
	cmp	dword [rbp - 8], dword [rbp - 4]
	je	while
	mov	rax, qword [rax + 8]
	mov	rbx, qword [rax + 8]
	jmp	pass

sort:
	mov	rcx, qword [rbx + 8]
	mov	qword [rbx + 8], qword [rax]
	mov	[rax], rcx
	jmp	while






end:
	pop	rbp
	ret
