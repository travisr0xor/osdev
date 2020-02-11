[BITS 16]
[ORG 0x7c00]

; reset drive
reset_drive:
	mov ah, 0
	int 13h
	or ah, ah
	jnz reset_drive

; read two sectors to 0x1000
	mov ax, 0
	mov es, ax
	mov bx, 0x1000

	mov ah, 02h
	mov al, 02h
	mov ch, 0
	mov cl, 02h
	mov dh, 0
	int 13h
	or ah, ah
	jnz reset_drive

here:
	jmp here

times 510-($-$$) db 0
dw 0xAA55



