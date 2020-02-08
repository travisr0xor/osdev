[BITS 16] ;16 bit real mode
[ORG 0x7C00] ;Offset we'll be loaded into

cli
xor ax, ax
mov ds, ax
lgdt [gdt_desc]

mov eax, cr0
or eax, 1
mov cr0, eax
jmp $+2

db 066h
db 0EAh
dd start_32
dw 08h

gdt_desc:
	dw gdt_end - gdt
	dd gdt

[BITS 32]
start_32:

mov eax, 10h
mov ds, eax
mov ss, eax
mov esp, 090000h
mov BYTE [0B8000h], 'P'
mov BYTE [0B8001h], 1Bh
hang:
   jmp hang


gdt:
gdt_null:
	dq 0
gdt_code:
	dw 0FFFFh
	dw 0
	db 0
	db 10011010b
	db 11001111b
	db 0

gdt_data:
	dw 0FFFFh
	dw 0
	db 0
	db 10010010b
	db 11001111b
	db 0
gdt_end:


times 510-($-$$) db 0 ;make correct size
db 0x55 ;MBR signature
db 0xAA
