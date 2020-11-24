	section .text

	global	_ft_strcpy
_ft_strcpy:
	cmp	byte [rsi], 0		; check if end of src string
	je	endwhile		; return if true
	mov	byte [rdi], byte [rsi]	; copy char from src to dest
	inc	rdi			; move to next byte in dest
	inc	rsi			; move to next char in src
	jmp	_ft_strcpy		; loop
endwhile:
	mov	byte [rdi], byte [rsi]	; zero-terminate dest
	mov	rax, rdi		; move dest pointer to ret val
	ret				; return
