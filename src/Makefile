#------------------------------------------------------------------------
# CoCoBoot - A Modern way to boot your Tandy Color Computer
# Copyright(C) 2013 Brett M. Gordon beretta42@gmail.com
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# ------------------------------------------------------------------------


AS = $(LWASM) -I . -I $(IMAGES) -9o 
VPATH=$(IMAGES)


# These are the HDBDOS overlay images
DIFS= hdbchs.dif     	\
      hdbdw3bc3.dif  	\
      hdbdw3cc3.dif	\
      hdbdw4cc3.dif	\
      hdbtc3.dif	\
      hdbd4n1.dif	\
      hdbdw3bck.dif	\
      hdbdw3jc2.dif	\
      hdbkenton.dif	\
      hdbdhdii.dif	\
      hdbdw3cc1.dif	\
      hdbdw3jc3.dif	\
      hdblba.dif	\
      hdbdw3arduino.dif	\
      hdbdw3cc2.dif	\
      hdbdw4cc2.dif	\
      hdblrtech.dif


ALL: cocoboot.dsk Makefile dw2dsk.wav dw2dsk.cas

cocoboot.dsk: boot.img bpb.img setup.fi decb.rom $(DIFS) hdbutil.fi os9.fi
	$(ROFS) -x "COCOBOOT BOOT DISK" -f -b $(BUILDDIR)/images/boot.img \
$(BUILDDIR)/cocoboot.dsk			\
$(BUILDDIR)/images/bpb.img			\
$(BUILDDIR)/images/setup.fi 			\
$(BUILDDIR)/images/decb.rom 			\
$(BUILDDIR)/images/hdbchs.dif     		\
$(BUILDDIR)/images/hdbdw3bc3.dif  		\
$(BUILDDIR)/images/hdbdw3cc3.dif		\
$(BUILDDIR)/images/hdbdw4cc3.dif		\
$(BUILDDIR)/images/hdbtc3.dif			\
$(BUILDDIR)/images/hdbd4n1.dif			\
$(BUILDDIR)/images/hdbdw3bck.dif		\
$(BUILDDIR)/images/hdbdw3jc2.dif		\
$(BUILDDIR)/images/hdbkenton.dif		\
$(BUILDDIR)/images/hdbdhdii.dif			\
$(BUILDDIR)/images/hdbdw3cc1.dif		\
$(BUILDDIR)/images/hdbdw3jc3.dif		\
$(BUILDDIR)/images/hdblba.dif			\
$(BUILDDIR)/images/hdbdw3arduino.dif		\
$(BUILDDIR)/images/hdbdw3cc2.dif		\
$(BUILDDIR)/images/hdbdw4cc2.dif		\
$(BUILDDIR)/images/hdblrtech.dif		\
$(BUILDDIR)/images/hdbutil.fi			\
$(BUILDDIR)/images/os9.fi			\
$(BUILDDIR)/images/boot_ide512.mod


setup.fi: *.fs
	$(BFC) -c -o $(IMAGES)/setup.fi cocoboot.fs setup.fs

hdbutil.fi: *.fs
	$(BFC) -c -o $(IMAGES)/hdbutil.fi cocoboot.fs hdbutil.fs

os9.fi: *.fs
	$(BFC) -c -o $(IMAGES)/os9.fi cocoboot.fs os9.fs

bpb.img: 
	cat /dev/zero | dd bs=256 count=1 of=$(IMAGES)/bpb.img	

boot.img: base.img forth.slz
	cat $(IMAGES)/base.img $(IMAGES)/forth.slz /dev/zero | dd bs=256 count=18 conv=sync of=$(IMAGES)/boot.img

base.img: cocoboot.def slz.asm run.slz rel.asm
	$(AS) $(IMAGES)/base.img -r rel.asm -s -l$(LISTINGS)/CCB.ls

run.slz: run.img
	$(SLZ) P $(IMAGES)/run.img $(IMAGES)/run.slz

run.img: start.asm ../include/legs16.asm 
	$(AS) $(IMAGES)/run.img -D RAW -D VERMAJ=$(VERMAJ) -D VERMIN=$(VERMIN) -r start.asm -s -l$(LISTINGS)/run.ls

forth.slz: forth.img
	$(SLZ) P $(IMAGES)/forth.img $(IMAGES)/forth.slz

forth.img: *.fs 
	$(BFC) -c -o $(IMAGES)/forth.img cocoboot.fs

dw2dsk.cas: dw2dsk.img
	makewav -r -k -nDW2DSK -d0x2600 -e0x2602 -o$(IMAGES)/dw2dsk.cas $(IMAGES)/dw2dsk.img

dw2dsk.wav: dw2dsk.img
	makewav -r -nDW2DSK -d0x2600 -e0x2602 -o$(IMAGES)/dw2dsk.wav $(IMAGES)/dw2dsk.img

dw2dsk.img: base.img dw2dsk.slz 
	cat $(IMAGES)/base.img $(IMAGES)/dw2dsk.slz > $(IMAGES)/dw2dsk.img

dw2dsk.slz: dw2dsk.fi
	$(SLZ) P $(IMAGES)/dw2dsk.fi $(IMAGES)/dw2dsk.slz

dw2dsk.fi: *.fs
	$(BFC) -c -o $(IMAGES)/dw2dsk.fi dw2dsk.fs

clean:
	cd $(IMAGES); rm -f base.img boot.img bpb.img dw2dsk.cas dw2dsk.fi dw2dsk.img dw2dsk.slz dw2dsk.wav forth.img forth.slz hdbutil.fi os9.fi run.img run.slz setup.fi
	cd $(LISTINGS); rm -f *.ls
	rm -f $(BUILDDIR)/cocoboot.dsk
