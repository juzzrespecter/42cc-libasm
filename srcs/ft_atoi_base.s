	section	.text

	global	_ft_atoi_base
_ft_strchr:

_ft_atoi_base:
	;; int ft_atoi_base(char *str, char *base);
	;; rdi - puntero a cadena str
	;; rsi - puntero a cadena base

	section	.data
invchars:	db "+- ",0x0a
