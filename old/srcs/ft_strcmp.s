	section .text

	global	_ft_strcmp
_ft_strcmp:
	xor	rax, rax	; clear return reg
	xor	rcx, rcx
cmp_while:
	mov	al, byte [rdi]	; move last char of s1 to ret reg
	mov	cl, byte [rsi]	; move last char of s2 to aux reg
	sub	eax, ecx	; save diff between last chars of strings
	cmp	eax, 0		; check if chars are not equal
	jne	cmp_end		; return if not true
	cmp	byte [rdi], 0	; check if s1 ended
	je	cmp_end		; return if true
	cmp	byte [rsi], 0	; check if s2 ended
	je	cmp_end		; return if true
	inc	rdi		; move to next char in s1
	inc	rsi		; move to next char in s2
	jmp	cmp_while		; loop
cmp_end:
	ret			; return the difference
