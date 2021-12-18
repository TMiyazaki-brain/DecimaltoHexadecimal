ndigit: equ      8         ; 出力する桁数の最大
	section .text
        global  print_eax_hex
print_eax_hex:
	push 	eax		  ;表示する数
	push	ecx		  ;戻り番地		  
	push	esi		  ;戻り番地
	push	edi		  ;戻り番地
	push	edx		  ;戻り番地
	push	ebx		  ;戻り番地
	
        mov     ecx, buf + ndigit ;作業領域の末尾の次の番地
	mov	edi, 0		;カウント

        ; 領域 buf に "" を書き込む
loop0:
	push	eax		;値の退避
	and	eax, 0x000f	;マスク処理(下位4ビット)
	dec     ecx             ;次の書き込み先
	cmp	eax, 9
	jg	loop1

	mov	bl, '0'		;blを0にする
	add	bl, al		;数を入力
	jmp	loop2
	
loop1:
	sub	eax, 10		;16進数表記にするために10引く
	mov	bl, 'a'		;blをaにする
	add	bl, al		;数を入力
	jmp	loop2
	
loop2:
	pop	eax		;復元
	shr	eax, 4		;4ビットずらす
	inc	edi		;カウント
	mov     [ecx], bl       ;作業領域に1文字書き込む
	cmp  	edi, ndigit	;終了条件
	je	endif		;終わりに飛ぶ
	jmp	loop0		;割り算に戻る

endif:
	add	edi, 1
	; writeシステムコールを呼び出す
        mov     eax, 4          ; writeのシステムコール番号
        mov     ebx, 1          ; 出力先番号 (1=標準出力)
        mov     edx, edi	; 改行を含めた長さ
        int     0x80

	pop	ebx
	pop	edx
	pop	edi
	pop	esi
	pop	ecx
	pop	eax
	
	ret
	
	section .data

	
buf:    times ndigit db 0       ; ndigit文字分の領域
	db      0x0a            
