#!/bin/bash
#       app for grab a color from everywhere.
#       
#       Copyleft 2011 Átila Camurça <camurca.home@gmail.com>
#       
#       This program is free software; you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation; either version 2 of the License, or
#       (at your option) any later version.
#       
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#       GNU General Public License for more details.
#       
#       You should have received a copy of the GNU General Public License
#       along with this program; if not, write to the Free Software
#       Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#       MA 02110-1301, USA.

# test if zenity exists
ZENITY="/usr/bin/zenity"
command -v $ZENITY >/dev/null && continue || { echo "zenity not found. Try install: sudo apt-get install zenity"; exit 1; }

# test version greater equal 2.32
VERSION=`$ZENITY --version | cut -c 1-4`
REQUIRED_VERSION=2.32
if [ "$(echo $VERSION '<' $REQUIRED_VERSION | bc)" -eq 1 ]; then
	$ZENITY --error --text "Color-grab needs zenity 2.32 or greater." --title "Color-grab: Error"
	echo "Color-grab needs zenity 2.32 or greater."; exit 1
fi

ICON="/usr/share/icons/color-grab.png"
COLOR=$($ZENITY --color-selection --title "Color-grab: Color Selection" --show-palette --window-icon $ICON)
if [ -z $COLOR ]; then
	echo "Cancel was pressed. Good-bye."; exit 1
fi
RGB="$(echo $COLOR | cut -c 2-3)$(echo $COLOR | cut -c 6-7)$(echo $COLOR | cut -c 10-11)"
$ZENITY --info --title "Color-grab" --text "Selected color: #$(echo $RGB | awk '{print toupper($0)}')" --window-icon $ICON
exit 0
