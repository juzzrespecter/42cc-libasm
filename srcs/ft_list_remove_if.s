	;; void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

	section	.text
	global	_ft_list_remove_if
	extern	_free

_ft_list_remove_if:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 24

	mov	qword [rbp - 8], rsi	; data_ref
	mov	qword [rbp - 16], rdx	; cmp func
	mov	qword [rbp - 24], rcx	; free_fct func
	mov	rcx, rdi
while:
	cmp	rcx, 0
	je	end
	mov	rdx, qword [rcx + 8]
	mov	rax, qword [rbp - 16]
	mov	rdi, qword [rcx]
	mov	rsi, qword [rbp - 8]
	call	rax
	cmp	rax, 0
	je	rm
	mov	rcx, rdx
	jmp	while
rm:
	mov	rax, qword [rbp - 24]
	call	rax
	mov	rdi, rcx
	call	_free
	mov	rcx, rdx
	jmp	while
end:
	pop	rbp
	ret
