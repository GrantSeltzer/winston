default: build

build: build/winston.iso

build/winston.iso: build/kernel.bin grub.cfg
	mkdir -p build/isofiles/boot/grub
	cp grub.cfg build/isofiles/boot/grub
	cp build/kernel.bin build/isofiles/boot/
	grub2-mkrescue -o build/winston.iso build/isofiles

build/multiboot_header.o: multiboot_header.asm
	mkdir -p build
	nasm -f elf64 multiboot_header.asm -o build/multiboot_header.o

build/boot.o: boot.asm
	mkdir -p build
	nasm -f elf64 boot.asm -o build/boot.o

build/kernel.bin: build/multiboot_header.o build/boot.o linker.ld
	ld -n -o build/kernel.bin -T linker.ld build/multiboot_header.o build/boot.o

run: build/winston.iso
	qemu-system-x86_64 -cdrom build/winston.iso

.PHONY: clean
clean:
	rm -rf build
