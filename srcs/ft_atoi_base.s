	section	.text

	global	_ft_atoi_base
	extern	_ft_strlen
_ft_strchr:


_ft_isprint:

_ft_atoi_base:
	xor	rbx, rbx
	push	rsi
	push	rdi
	mov	rdi, rsi
	;; int ft_atoi_base(char *str, char *base);
	;; char *strchr(const char *s, int c);
	;; rdi - puntero a cadena str
	;; rsi - puntero a cadena base
	call	_ft_strlen
	cmp	rax, 1
	jle	error
loop1:
	mov	rsi, byte [rdi]
	cmp	rsi, 0
	je	endloop1
	jmp	_ft_strchr
	cmp	rax, 0
	jne	error
	mov	rdi, invchars
	call	_ft_strchr
	cmp	rax, 0
	jne	error
	mov	rdi, rsi
	call	_ft_isprint
	cmp	rax, 0
	je	error
endloop1:


error:
	xor	rax, rax
	ret

	section	.data
invchars:	db "+- ",0x0
