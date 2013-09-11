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

export VERMAJ = 0
export VERMIN = 1


include include/cocoboot2.make

RELNAM = cocoboot2-$(VERMAJ).$(VERMIN)


ALL: all

release: all
	$(MKDIR) $(BUILDDIR)/$(RELNAM)
	cd $(BUILDDIR); cp cocoboot.dsk dw2dsk.cas dw2dsk.wav $(RELNAM)/
	cd $(BUILDDIR); zip -r $(RELNAM).zip $(RELNAM)
	cd $(BUILDDIR); rm -rf $(RELNAM)

all:
	$(MKDIR) $(BUILDDIR)
	$(MKDIR) $(BUILDDIR)/tools
	$(MKDIR) $(BUILDDIR)/images
	$(MKDIR) $(BUILDDIR)/listings
	cd tools; $(MAKE)
	cd images; $(MAKE)
	cd src; $(MAKE)

clean:
	cd tools; $(MAKE) clean
	cd images; $(MAKE) clean
	cd src; $(MAKE) clean


