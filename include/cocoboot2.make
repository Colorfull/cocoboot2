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


#
# Set this variable to CoCoBoot2's top-level src dir
#

CCBHOME = /home/beretta/C/cocoboot2

#
# Set this variable to the desired build directory
#

BUILDDIR = $(CCBHOME)/build

 
#
# Set this variable to the HDBDOS src dir
#

HDBDIR = /home/beretta/C/toolshed/hdbdos


#
# Set this variable to the command needed to run lwasm
#

LWASM = lwasm


#
# STUFF BELOW SHOULDN'T NEED TOUCHED
#



MKDIR = mkdir -p

BFC = $(BUILDDIR)/tools/bfc
IDIFF = $(BUILDDIR)/tools/idiff
ROFS = $(BUILDDIR)/tools/rofs
SLZ = $(BUILDDIR)/tools/slz
IMAGES = $(BUILDDIR)/images
LISTINGS = $(BUILDDIR)/listings

export 

# CCBHOME BUILDDIR LWASM MKDIR BFC IDIFF ROFS SLZ HDBDIR IMAGES