test.bin is the boot sector concatenated with block1 and block2.

The boot sector simply loads block1 and block2 into memory at 0x1000.

qemu-system-i386 -s -S -drive file=test.bin,format=raw
