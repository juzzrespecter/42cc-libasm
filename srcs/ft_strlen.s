	section .text

	global _ft_strlen
_ft_strlen:
	xor	rax, rax	; clean count
while:
	cmp	byte [rdi], 0	; check if str end
	je	whileend	; end of loop
	inc	rax		; inc count
	inc	rdi		; move to next str char
	jmp	while		; loop
endwhile:
	ret			;return to main
