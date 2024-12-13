	;; void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

	section	.text
	global	_ft_list_remove_if
	extern	_free

_ft_list_remove_if:
	push	rbp
	mov	rbp, rsp

	sub	rsp, 48
	mov	qword [rbp - 8], rdi  ;**begin_list
	mov	qword [rbp - 16], rsi ;data_ref
	mov	qword [rbp - 24], rdx ;(*cmp)
	mov	qword [rbp - 32], rcx ;(*free_fct)
	mov	qword [rbp - 40], 0   ;tmp pointer
	mov	qword [rbp - 48], 0   ;prev pointer

	mov	rax, qword [rbp - 8]
	cmp	rax, 0
	je	remove_end
	mov	rax, qword [rax]
	cmp	rax, 0
	je	remove_end
	mov	qword [rbp - 40], rax
header_loop_remove:
	mov	rax, qword [rbp - 40]
	cmp	rax, 0
	je	remove_end
	mov	rdi, qword [rax]
	mov	rsi, qword [rbp - 16]
	mov	rax, qword [rbp - 24]
	call	rax
	cmp	eax, 0
	jne	main_remove
	mov	rax, qword [rbp - 40]
	mov	rdi, qword [rax]
	mov	rax, qword [rbp - 32]
	call	rax
	mov	rax, qword [rbp - 8]
	mov	rdx, qword [rbp - 40]
	mov	rdx, qword [rdx + 8]
	mov	qword [rax], rdx
	mov	rdi, qword [rbp - 40]
	call	_free
	mov	rax, qword [rbp - 8]
	mov	rax, qword [rax]
	mov	qword [rbp - 40], rax
	jmp	header_loop_remove
main_remove:
	mov	rax, qword [rbp - 40]
	mov	qword [rbp - 48], rax
	mov	rax, qword [rax + 8]
	mov	qword [rbp - 40], rax
main_loop_remove:
	mov	rax, qword [rbp - 40]
	cmp	rax, 0
	je	remove_end
	mov	rdx, qword [rbp - 48]
	mov	rdi, qword [rax]
	mov	rsi, qword [rbp - 16]
	mov	rax, qword [rbp - 24]
	call	rax
	cmp	eax, 0
	jne	next_remove
elem_remove:
	mov	rax, qword [rbp - 40]
	mov	rdi, qword [rax]
	mov	rax, qword [rbp - 32]
	call	rax
	mov	rax, qword [rbp - 40]
	mov	rax, qword [rax + 8]
	mov	rdx, qword [rbp - 48]
	mov	qword [rdx + 8], rax
	mov	rdi, qword [rbp - 40]
	call	_free
	mov	rax, qword [rbp - 48]
	mov	qword [rbp - 40], rax
next_remove:
	mov	rax, qword [rbp - 40]
	mov	qword [rbp - 48], rax
	mov	rax, qword [rax + 8]
	mov	qword [rbp - 40], rax
	jmp	main_loop_remove
remove_end:
	mov	rsp, rbp
	pop	rbp
	ret
