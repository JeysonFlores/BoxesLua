--package.path = package.path .. ";/app/bin/boxes/?.lua;/app/share/lua/5.1/?.lua"
--package.cpath = package.cpath .. ";/app/lib/lua/5.1/?.so"

local lgi = require 'lgi'
local Gtk = lgi.require('Gtk')
local Handy = lgi.require('Handy')
local Gio = lgi.require('Gio')
require "src.Views.WelcomeView"

Handy:init()

MainWindow = {}

function MainWindow.new()

    main_window = Handy.Window {}

    local settings = Gio.Settings {
        schema_id = "com.github.jeysonflores.boxes"
    }

    sidebar_header = Handy.HeaderBar{
        decoration_layout = "close:",
        has_subtitle = false,
        show_close_button = true,
        hexpand = true
    }
    sidebar_header:get_style_context():add_class(Gtk.STYLE_CLASS_FLAT);

    grid = Gtk.Grid{
        expand = true,
        orientation = Gtk.Orientation.VERTICAL
    }

    grid:add(sidebar_header)

    if settings:get_int("first-launch") == 1 then
        grid:add(welcome_view)
        --settings:set_int("first-launch", 0)
    else 
        grid:add(Gtk.Label {label="It's not first launch"})
    
    end

    main_window:add(grid)

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






