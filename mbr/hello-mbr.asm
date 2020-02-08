org 0x7C00 ;Offset we'll be loaded into
bits 16 ;16 bit real mode

mov sp, 0x7BF0 ;set up stack
mov si, msg
call printString
;jmp $
hlt
ret

printCharacter:
  ;prints character in al
  mov bh, 0x00
  mov bl, 0x00
  mov ah, 0x0E
  int 0x10 ; int 0x10, 0x0E = print character in al
  ret

printString:
  pusha
  .loop:
    lodsb
    test al, al; test if al is null
    jz .end
    call printCharacter
  jmp .loop
  .end:
  popa
  ret

msg db "Hello World!"
times 510-($-$$) db 0 ;make correct size
db 0x55 ;MBR signature
db 0xAA
