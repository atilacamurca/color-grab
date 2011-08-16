#!/usr/bin/env ruby
#
# 		color-grab.rb
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

require 'libglade2'

class ColorSelectionWindow
  include GetText

  attr :glade
  attr_reader :main_window
  
  def initialize(path_or_data, root = nil, domain = nil, localedir = nil, flag = GladeXML::FILE)
    bindtextdomain(domain, localedir, nil, "UTF-8")
    @glade = GladeXML.new(path_or_data, root, domain, localedir, flag) {|handler| method(handler)}
    @main_window = @glade.get_widget("main_window")
    @aboutdialog = @glade.get_widget("about_dialog")
  end

  def on_close_button_clicked(widget)
    Gtk.main_quit
  end

  def on_main_window_destroy(widget)
    Gtk.main_quit
  end

  def on_about_button_clicked(widget)
    @aboutdialog.run
    @aboutdialog.hide
  end
end

if __FILE__ == $0
  PROG_NAME = "color-grab-rb"
  color_selection = ColorSelectionWindow.new("gui/color-selection-window.glade", nil, PROG_NAME)
  color_selection.main_window.show_all
  Gtk.main
end
