TOOLPATH = ../z_tools/
NASK     = $(TOOLPATH)nask.exe
EDIMG    = $(TOOLPATH)edimg.exe

default: img

#
# rule
#
ipl.bin : ipl.nas Makefile
	$(NASK) ipl.nas ipl.bin ipl.lst

helloos.img : ipl.bin Makefile
	$(EDIMG) imgin:../z_tools/fdimg0at.tek \
		wbinimg src:ipl.bin len:512 from:0 to:0   imgout:helloos.img

#
# commands
#
.PHONY: asm
asm: ipl.bin

.PHONY: img
img: helloos.img

.PHONY: run
run: img
	qemu-system-i386 -boot a -drive file=helloos.img,format=raw,if=floppy

.PHONY: clean
clean:
	rm -f ipl.bin ipl.lst helloos.img
