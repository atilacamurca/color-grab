#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#       color-grab.py
#       
#       Copyright 2011 Átila Camurça <camurca.home@gmail.com>
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
#       

import pygtk
pygtk.require("2.0")
import gtk, gtk.glade

class ColorSelectionWindow:
	
	def __init__(self):
		APP_NAME= 'color-grab-py'
		glade = gtk.glade.XML('gui/color-selection-window.glade', None, APP_NAME)
		glade.signal_autoconnect(self)
		
		self.main_window = glade.get_widget("main_window")
		self.about_dialog = glade.get_widget("about_dialog")
		
	def on_main_window_destroy(self, widget):
		gtk.main_quit()

	def on_about_button_clicked(self, widget):
		self.about_dialog.run()
		self.about_dialog.hide()
		
	def on_close_button_clicked(self, widget):
		gtk.main_quit()

if __name__ == '__main__':
	color_selection = ColorSelectionWindow()
	color_selection.main_window.show_all()
	gtk.main()
