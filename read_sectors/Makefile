bootsector:
	nasm -f bin bootsector.asm

test.bin: bootsector
	cat bootsector block1 block2 > test.bin

