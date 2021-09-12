--package.path = package.path .. ";/app/bin/boxes/?.lua;/app/share/lua/5.1/?.lua"
--package.cpath = package.cpath .. ";/app/lib/lua/5.1/?.so"

local lgi = require 'lgi'
local Gtk = lgi.require('Gtk')
local Handy = lgi.require('Handy')
local Gio = lgi.require('Gio')


Handy:init()

MainWindow = {}

function MainWindow.new()

    main_window = Handy.Window {}

    main_window:add(Gtk.Label {
        label = "Hola"
    })

    function main_window:on_delete_event()
    
        local settings = Gio.Settings {
            schema_id = "com.github.jeysonflores.boxes"
        }
    
        local root_x, root_y = main_window:get_position()
        local width, height = main_window:get_size()
    
        settings:set_int("pos-x", root_x)
        settings:set_int("pos-y", root_y)
    
        settings:set_int("window-width", width)
        settings:set_int("window-height", height)
    
        Gtk:main_quit()
    end

    return main_window
end





