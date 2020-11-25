	section	.text

	global	_ft_strdup
	extern	_malloc
	extern	_ft_strlen
	extern	_ft_strcpy
_ft_strdup:
				;; en rdi - puntero a cadena
	call	_ft_strlen	; en rax - tamanyo de la cadena
	push	rdi		; guardamos cadena antigua
	mov	rdi, rax	; en rdi - tam cadena (para enviar a malloc)
	call	_malloc		; en rax - puntero con mem reservada
	mov	rdi, rax	; en rdi - np
	pop	rsi
	call	_ft_strcpy	; en rdi - dest (np), en rsi - src (op)
	mov	rax, rdi	; pasa np a rax
	ret
