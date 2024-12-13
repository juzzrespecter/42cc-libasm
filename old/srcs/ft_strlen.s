	section .text

	global _ft_strlen
_ft_strlen:
	push	rdi
	xor	rax, rax	; clean count
while:
	cmp	byte [rdi], 0	; check if str end
	je	end		; end of loop
	inc	rax		; inc count
	inc	rdi		; move to next str char
	jmp	while		; loop
end:
	pop	rdi
	ret			; return to main
