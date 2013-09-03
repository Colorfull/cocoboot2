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



CoCoBoot2 creates a standard 35 track RSDOS floppy image, suitable for
DriveWire, HDB-DOS, or a real floppy.  The toolshed project source is
required for the make system and tools to build and include compressed
HDB ROM images onto the boot disk.  The Nitros9 source is required for
much the same reason: to include Nitros9 boot drivers; However these
boot driver's source is patched to allow more modular behaviour.
