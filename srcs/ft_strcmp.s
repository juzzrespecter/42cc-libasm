	section .text

	global	_ft_strcmp
_ft_strcmp:
	xor	rax, rax	; clear return value
while:
	cmp	byte [rdi], 0	; check if s1 ended
	je	endwhile	; return if true
	cmp	byte [rsi], 0	; check if s2 ended
	je	endwhile	; return if true
	inc	rdi		; move to next char in s1
	inc	rsi		; move to next char in s2
	jmp	while		; loop
endwhile:
	mov	rax, byte [rdi]	; move last char of s1 to ret val
	sub	rax, byte [rsi]	; save diff between last chars of strings
	ret			; return the difference
