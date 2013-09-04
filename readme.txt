------------------------------------------------------------------------
CoCoBoot - A Modern way to boot your Tandy Color Computer
Copyright(C) 2013 Brett M. Gordon beretta42@gmail.com

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
------------------------------------------------------------------------



REQUIREMENTS TO BUILD

lwtools   
make	  
toolshed source  
Nitros9 LWASM source
dd
makewav


CoCoBoot2 creates a standard 35 track RSDOS floppy image, suitable for
DriveWire, HDB-DOS, or a real floppy.  The toolshed project source is
required for the make system and tools to build and include compressed
HDB ROM images onto the boot disk.  The Nitros9 source is required for
much the same reason: to include Nitros9 boot drivers; However these
boot driver's source is patched to allow more modular behaviour.


TO BUILD:

* Modify include/cocoboot2.make paths to point to correct locations of
  cocoboot's build dir, src dir, HDBDOS's src dir, and lwasm's command
  path/name.

* make: cocoboot2$ make


TO INSTALL:

* Load up cocoboot.dsk as drive 0 in DriveWire, emulator, etc.  
  If you have DriveWire but no burnt HDB ROM, you can use the
  dw2dsk.wav cassette/wav file to disk copy a DriveWire disk to a
  DSKCON disk (floppy,HDB, etc...)

* Turn on your coco. If HDB is installed then this disk will
  autoboot; If not, then issue the "DOS" command in BASIC to boot.


ON FIRST BOOT:

* CoCoBoot will recognize an unconfigured boot disk and go directly into
  it's setup menu system for further setup.

AFTER FIRST BOOT:

* CoCoBoot will load up your selected profile.



Boot Sequence:

1. Mount RO filesystem on HDB drive 0.  
2. If a key is pressed or disk is unconfigured then load setup program
3. Wait for a keypress for configured timeout. If a key is pressed
then display boot menu, else boot the default profile.







