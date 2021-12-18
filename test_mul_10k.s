	section .text
        global  _start
        extern  print_eax_hex       ;別ファイルのラベル
_start:
	mov	eax, 123

	call	print_eax_hex

	mov	eax, 1
	int	0x80


