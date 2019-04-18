TOOLPATH = ../z_tools/
NASK     = $(TOOLPATH)nask.exe
EDIMG    = $(TOOLPATH)edimg.exe

default: img

#
# rule
#
ipl.bin: ipl10.nas Makefile
	$(NASK) ipl10.nas ipl.bin ipl.lst

haribote.sys: haribote.nas Makefile
	$(NASK) haribote.nas haribote.sys haribote.lst

haribote.img: ipl.bin haribote.sys Makefile
	$(EDIMG)   imgin:../z_tools/fdimg0at.tek \
		wbinimg src:ipl.bin len:512 from:0 to:0 \
		copy from:haribote.sys to:@: \
		imgout:haribote.img

#
# commands
#
.PHONY: asm
asm: ipl.bin

.PHONY: img
img: haribote.img

.PHONY: run
run: img
	qemu-system-i386 -boot a -drive file=haribote.img,format=raw,if=floppy

.PHONY: clean
clean:
	rm -f ipl.bin *.lst *.img *.sys
