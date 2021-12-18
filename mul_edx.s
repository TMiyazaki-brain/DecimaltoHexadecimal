	section .text
	global mul_edx
mul_edx:
	push 	ebx		;戻り番地
	push	ecx		;戻り番地
	push	edx		;戻り番地
	push	edi		;戻り番地
	push	esi		;戻り番地
	mov	ebx, 0		;結果
	mov	esi, 1		;比較
	mov	edi, 0		;カウント

cmp:
	cmp	edi, 32		;終了条件
	je	endif		;終了

	push	edx		;保持
	test	edx, esi	;比較
	jnz	mul		;飛ぶ
 
	shl	esi, 1		;左に1ビット
	shl	eax, 1		;左に1ビット
	pop	edx		;復元
	inc	edi		;カウント
	jmp	cmp		;戻る
mul:
	add	ebx, eax	;加算
	shl	eax, 1		;左に1ビット
	shl	esi, 1		;左に1ビット
	pop	edx		;復元
	inc	edi		;カウント
	jmp	cmp		;戻る

endif:
	mov	eax, ebx	;答えの格納

	pop	esi
	pop	edi
	pop	edx
	pop	ecx
	pop	ebx

	ret
