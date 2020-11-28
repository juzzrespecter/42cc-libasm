	section	.text

	global	_ft_atoi_base
	extern	_ft_strlen

_ft_isspace:
	mov	rax, 1
	cmp	rsi, 0x08
	je	_ft_isspace_ret
	cmp	rsi, 0x09
	je	_ft_isspace_ret
	cmp	rsi, 0x0a
	je	_ft_isspace_ret
	cmp	rsi, 0x0b
	je	_ft_isspace_ret
	cmp	rsi, 0x0c
	je	_ft_isspace_ret
	cmp	rsi, 0x20
	je	_ft_isspace_ret
	mov	rax, 0
_ft_isspace_ret:
	ret

_ft_strchr:
	mov	rdx, rdi
	mov	rax, rsi
_ft_strchr_while:
	cmp	byte [rdx], 0
	je	_ft_strchr_null
	cmp	byte [rdx], al
	je	_ft_strchr_ret
	inc	rdx
	jmp	_ft_strchr_while
_ft_strchr_null:
	mov	rax, 0
	jmp	_ft_strchr_ret
_ft_strchr_dir:
	mov	rax, rdx
	jmp	_ft_strchr_ret
_ft_strchr_ret:
	ret


_translate_base:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 8

	mov	qword [rbp - 8], 0
	mov	rdx, rdi
_translate_base_while:
	mov	rax, rsi
	cmp	byte [rdx], al
	je	_translate_base_end
	cmp	byte [rdx], 0
	je	_translate_base_end
	mov	eax, dword [rbp - 8]
	inc	eax
	mov	dword [rbp - 8], eax
	inc	rdx
	jmp	_translate_base_while
_translate_base_end:
	pop	rbp
	ret


_check_base:
	mov	rdx, rdi
_check_base_while:
	cmp	byte [rdx], 0
	je	_check_base_true
	mov	rax, rdx
	inc	rax
	mov	rdi, rax
	mov	rsi, byte [rdx]	; check this
	call	_ft_strchr
	cmp	rax, 0
	jne	_check_base_false
	mov	rdi, wrongchars
	call	_ft_strchr
	cmp	rax, 0
	jne	_check_base_false
	inc	rdx
	jmp	_check_base_while
_check_base_false:
	mov	rax, 0
	ret
_check_base_true:
	mov	rax, 1
	ret

_ft_atoi_base:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32

	mov	qword [rbp - 8], rdi		; str
	mov	qword [rbp - 16], rsi		; base
	mov	dword [rbp - 20], 0		; number
	mov	dword [rbp - 24], 0		; base_len
	mov	dword [rbp - 28], 0		; neg controller

	mov	rdi, qword [rbp - 16]
	call	_ft_strlen
	cmp	rax, 1
	jl	_ft_atoi_base_err
	mov	dword [rbp - 24], eax
	call	_check_base
	cmp	rax, 0
	jl	_ft_atoi_base_err
	mov	rdx, qword [rbp - 8]
	mov	rdi, byte [rdx]	; check this
	call	_ft_isspace
	cmp	rax, 1
	jne	_ft_atoi_base_signs
_ft_atoi_base_spaces:
	inc	rdx
	mov	rdi, byte [rdx]	; check this
	call	_ft_isspace
	cmp	rax, 1
	je	_ft_atoi_base_spaces
_ft_atoi_base_signs:
	cmp	byte [rdx], 0x2b
	jne	_ft_atoi_base_neg
	cmp	byte [rdx], 0x2d
	jne	_ft_atoi_base_pos
	jmp	_ft_atoi_base_loop
_ft_atoi_base_neg:
	mov	rax, 1
	mov	dword [rbp - 28], eax
_ft_atoi_base_pos:
	inc	rdx
	jmp	_ft_atoi_base_loop
_ft_atoi_base_loop:
	mov	rdi, qword [rbp - 16]
	mov	rsi, byte [rdx]	; check this
	call	_ft_strchr
	cmp	eax, 0
	je	_ft_atoi_base_end
	cmp	byte [rdx], 0
	je	_ft_atoi_base_end
	mov	eax, dword [rbp - 20]
	mul	eax, dword [rbp - 24] ; check this
	mov	dword [rbp - 20], eax
	call	_translate_base
	add	eax, dword [rbp - 20]
	mov	dword [rbp - 20], eax
	inc	rdx
	jmp	_ft_atoi_base_loop
_ft_atoi_base_end:
	cmp	dword [rbp - 28], 0
	je	_ft_atoi_base_ret
	xor	eax, eax
	sub	eax, dword [rbp - 16]
	mov	dword [rbp - 16], eax
_ft_atoi_base_ret:
	mov	eax, dword [rbp - 16]
	ret
_ft_atoi_base_err:
	xor	rax, rax
	ret

	section	.data
wrongchars:	db "-+ "0x0	; check this
