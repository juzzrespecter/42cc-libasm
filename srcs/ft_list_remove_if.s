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
	jmp	while

while:
	mov	rdx, qword [rcx]
	mov	rdi, qword [rdx]
	mov	rsi, qword [rbp - 8]
	mov	rax, qword [rbp - 16]
	call	rax
	cmp	rax, 0
	je	rm
	mov	rax, qword [rdx + 8] ; checkthis
	mov	qword [rcx], rax     ; checkthis
	cmp	qword [rdx + 8], 0
	je	end

rm:
	mov	rax, qword [rbp - 24]
	call	rax
	mov	rdi, rdx
	call	_free
	jmp	while

end:
	ret
