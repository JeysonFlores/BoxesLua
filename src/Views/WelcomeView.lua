--package.path = package.path .. ";/app/bin/boxes/?.lua;/app/share/lua/5.1/?.lua"
--package.cpath = package.cpath .. ";/app/lib/lua/5.1/?.so"

local lgi = require 'lgi'
local Gtk = lgi.require('Gtk')
local Handy = lgi.require('Handy')
local Gio = lgi.require('Gio')

welcome_view = Gtk.Grid {
    expand = true,
    orientation = Gtk.Orientation.HORIZONTAL 
}

-- TitlePanel
titlepanel = Gtk.Grid{
    expand = true,
    orientation = Gtk.Orientation.VERTICAL
}

welcome_label = Gtk.Label {
    label = "Welcome to Boxes"
}
welcome_label:get_style_context():add_class("h1")

subwelcome_label = Gtk.Label {
    label = "Select a box and start developing"
}
subwelcome_label:get_style_context():add_class("h2")

description_label = Gtk.Label {
    label = "Currently <b>Boxes</b> offers templates to different programming languages. Such as <b>Python</b>, <b>Vala</b>, <b>Lua</b> and <b>Crystal</b>. And hopefully, more languages soon!",
    use_markup = true
}
description_label:set_line_wrap(true)

setup_button = Gtk.Button {
    label = "Setup",
    can_focus = false
}
setup_button:get_style_context():add_class("suggested-action")


image = Gtk.Image {
    file = "/home/jeyson/Proyectos/Lua/Boxes/data/assets/icons/128/com.github.jeysonflores.boxes.svg"
}

titlepanel:add(image)
titlepanel:add(welcome_label)
titlepanel:add(subwelcome_label)
titlepanel:add(description_label)
titlepanel:add(setup_button)

welcome_view:add(titlepanel)