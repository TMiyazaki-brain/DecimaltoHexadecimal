	section	.text
	global	mul_10k
mul_10k:
	push 	ebx		;戻り番地
	push	ecx		;戻り番地
	push	edx		;戻り番地
	push	edi		;戻り番地
	push	esi		;戻り番地

	push	eax		;値の退避
	shl	eax, 4		;eax*16
	mov	ebx, eax	;ebxに保存
	pop	eax		;値の復元

	push	eax		;値の退避
	shl	eax, 8		;eax*256
	mov	ecx, eax	;ecxに保存
	pop	eax		;値の復元

	push	eax		;値の退避
	shl	eax, 9		;eax*512
	mov	edx, eax	;edxに保存
	pop	eax		;値の復元

	push	eax		;値の退避
	shl	eax, 10		;eax*1024
	mov	edi, eax	;ediに保存
	pop	eax		;値の復元

	push	eax		;値の退避
	shl	eax, 13		;eax*8192
	mov	esi, eax	;esiに保存
	pop	eax		;値の復元

	mov	eax, 0		;eaxの準備
	add	eax, ebx	;加算
	add	eax, ecx	;加算
	add	eax, edx	;加算
	add	eax, edi	;加算
	add	eax, esi	;加算

	pop	esi
	pop	edi
	pop	edx
	pop	ecx
	pop	ebx

	ret
