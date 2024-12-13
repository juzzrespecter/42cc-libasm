	section .text

	global	_ft_strcpy
_ft_strcpy:
	push	rdi
	push	rsi
while:
	cmp	byte [rsi], 0		; check if end of src string
	je	end			; return if true
	mov	dl, byte [rsi]
	mov	byte [rdi], dl		; copy char from src to dest
	inc	rdi			; move to next byte in dest
	inc	rsi			; move to next char in src
	jmp	while			; loop
end:
	mov	byte [rdi], 0		; zero-terminate dest
	pop	rsi
	pop	rdi
	mov	rax, rdi		; move dest pointer to ret val
	ret				; return
