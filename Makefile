all: bootloader

current_dir = $(shell pwd)

boot.o: boot.s
	as -o boot.o -mx86-used-note=no boot.s

bootloader: boot.o
	ld -o boot.bin --oformat binary -Ttext 0x7c00 -n -e init boot.o

clean:
	rm -f boot.o boot.bin

run:
	qemu-system-x86_64 boot.bin

debug:
	qemu-system-i386 -s -S boot.bin & gdb -x $(current_dir)/gdbinit boot.o
