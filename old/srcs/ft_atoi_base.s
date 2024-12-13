	section	.text
	global	_ft_atoi_base


_ft_strchr:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32

	mov	qword [rbp - 8], rdi 		; str
	mov	qword [rbp - 16], 0		; return ptr
	mov	dword [rbp - 20], esi		; char
	mov	rax, qword [rbp - 8]
	mov	qword [rbp - 16], rax
strchr_while:
	mov	rax, qword [rbp - 16]
	mov	al, byte [rax]
	cmp	al, 0
	je	strchr_no
	cmp	al, byte [rbp - 20]
	je	strchr_ret
	mov	rax, qword [rbp - 16]
	inc	rax
	mov	qword [rbp - 16], rax
	jmp	strchr_while
strchr_no:
	mov	rax, 0
	mov	qword [rbp - 16], rax
strchr_ret:
	mov	rax, qword [rbp - 16]

	mov	rsp, rbp
	pop	rbp
	ret

_ft_strlen:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16

	mov	qword [rbp - 8], rdi ;str
	mov	dword [rbp - 12], 0  ;ret
strlen_while:
	mov	rax, qword [rbp - 8]
	mov	al, byte [rax]
	cmp	al, 0
	je	strlen_ret
	mov	eax, dword [rbp - 12]
	inc	eax
	mov	dword [rbp - 12], eax
	mov	rax, qword [rbp - 8]
	inc	rax
	mov	qword [rbp - 8], rax
	jmp	strlen_while
strlen_ret:
	mov	eax, dword [rbp - 12]

	mov	rsp, rbp
	pop	rbp
	ret

_check_base:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16

	mov	qword [rbp - 8], rdi 		; base
	mov	dword [rbp - 12], 1		; ret val
base_while:
	mov	rax, qword [rbp - 8]
	mov	al, byte [rax]
	cmp	al, 0
	je	base_ret
	mov	rdi, qword [rbp - 8]
	inc	rdi
	mov	rax, qword [rbp - 8]
	mov	al, byte [rax]
	xor	rdx, rdx
	add	dl, al
	mov	esi, edx
	call	_ft_strchr
	cmp	rax, 0
	jne	base_no
	mov	rdi, wr
	call	_ft_strchr
	cmp	rax, 0
	jne	base_no
	mov	rax, qword [rbp - 8]
	inc	rax
	mov	qword [rbp - 8], rax
	jmp	base_while
base_no:
	mov	eax, 0
	mov	dword [rbp - 12], eax
base_ret:
	mov	eax, dword [rbp - 12]

	mov	rsp, rbp
	pop	rbp
	ret

_translate:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16

	mov	qword [rbp - 8], rdi 		; base
	mov	dword [rbp - 12], 0		; ret
translate_while:
	mov	rax, qword [rbp - 8]
	mov	al, byte [rax]
	cmp	al, 0
	je	translate_ret
	xor	rdx, rdx
	add	dl, al
	cmp	edx, esi
	je	translate_ret
	mov	eax, dword [rbp - 12]
	inc	eax
	mov	dword [rbp - 12], eax
	mov	rax, qword [rbp - 8]
	inc	rax
	mov	qword [rbp - 8], rax
	jmp	translate_while
translate_ret:
	mov	eax, dword [rbp - 12]

	mov	rsp, rbp
	pop	rbp
	ret

_ft_atoi_base:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32

	mov	qword [rbp - 8], rdi		; str
	mov	qword [rbp - 16], rsi		; base
	mov	dword [rbp - 20], 0		; ret
	mov	dword [rbp - 24], 0		; base_len
	mov	dword [rbp - 28], 0		; neg control

	mov	rdi, qword [rbp - 16]
	call	_ft_strlen
	cmp	eax, 2
	jl	atoi_ret
	mov	dword [rbp - 24], eax
	mov	rdi, qword [rbp - 16]
	call	_check_base
	cmp	eax, 0
	je	atoi_ret
	mov	rax, qword [rbp - 8] ; !!
	mov	al, byte [rax]
	cmp	al, 32
	jne	atoi_sign
atoi_spaces:
	mov	rax, qword [rbp - 8]
	inc	rax
	mov	qword [rbp - 8], rax
	mov	al, byte [rax]
	cmp	al, 32
	je	atoi_spaces
atoi_sign:
	mov	rax, qword [rbp - 8]
	mov	al, byte [rax]
	cmp	al, 45
	je	atoi_neg
	cmp	al, 43
	je	atoi_pos
	jmp	atoi_loop
atoi_neg:
	mov	eax, 1
	mov	dword [rbp - 28], eax
atoi_pos:
	mov	rax, qword [rbp - 8]
	inc	rax
	mov	qword [rbp - 8], rax
atoi_loop:
	mov	rax, qword [rbp - 8]
	xor	rdx, rdx
	mov	dl, byte [rax]
	mov	esi, edx
	cmp	esi, 0
	je	atoi_isneg
	mov	rdi, qword [rbp - 16]
	call	_ft_strchr
	cmp	eax, 0
	je	atoi_isneg
	mov	eax, dword [rbp - 20]
	mov	edx, dword [rbp - 24]
	mul	edx
	mov	dword [rbp - 20], eax
	mov	rdi, qword [rbp - 16]
	mov	rax, qword [rbp - 8]
	xor	rdx, rdx
	mov	dl, byte [rax]
	mov	esi, edx		; checa bytecmp
	call	_translate
	mov	edx, dword [rbp - 20]
	add	eax, edx
	mov	dword [rbp - 20], eax
	mov	rax, qword [rbp - 8]
	inc	rax
	mov	qword [rbp - 8], rax
	jmp	atoi_loop
atoi_isneg:
	mov	eax, dword [rbp - 28]
	cmp	eax, 0
	je	atoi_ret
	xor	eax, eax
	sub	eax, dword [rbp - 20]
	mov	dword [rbp - 20], eax
atoi_ret:
	mov	eax, dword [rbp - 20]

	mov	rsp, rbp
	pop	rbp
	ret

	section	.data
	wr	db	"-+ ",0
