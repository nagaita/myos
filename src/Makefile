
# デフォルト動作

default: img

# ファイル生成規則

ipl.bin : ipl.nas Makefile
	../z_tools/nask.exe ipl.nas ipl.bin ipl.lst

helloos.img : ipl.bin Makefile
	../z_tools/edimg.exe   imgin:../z_tools/fdimg0at.tek \
		wbinimg src:ipl.bin len:512 from:0 to:0   imgout:helloos.img

# コマンド
.PHONY: asm
asm: ipl.bin

.PHONY: img
img: helloos.img

.PHONY: run
run: img
	qemu-system-i386 -drive file=helloos.img,format=raw,index=0,media=disk

.PHONY: clean
clean:
	rm -f ipl.bin ipl.lst helloos.img
