pcall(require, "luarocks.loader")

local gears = require("gears")
require("awful.autofocus")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar_util = require("menubar.utils")
local cairo = require("lgi").cairo

naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops, an error happened" .. (startup and " during startup!" or "!"),
        message = message
    }
end)

-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_xdg_config_home() .. "awesome/themes/theme.lua")

local leftbar = require("widgets.leftbar")

screen.connect_signal("request::desktop_decoration", function(s)
    s.leftbar = leftbar.create { screen = s }
end)

require("keys")
require("buttons")
require("tags")
require("wallpaper")
require("rules")
require("widgets.hotkeys_popup")
require("widgets.spad")

naughty.connect_signal("request::display", function(n)
    naughty.layout.box { notification = n }
end)

-- start applications
require("autostart")

-- set default app icon
client.connect_signal("manage", function(c)
    if c.icon then
        return
    end

    local icon = menubar_util.lookup_icon(c.name)

    if not icon then
        icon = beautiful.default_app_icon
    end

    local s = gears.surface(icon)
    local img = cairo.ImageSurface.create(cairo.Format.ARGB32, s:get_width(), s:get_height())
    local cr = cairo.Context(img)
    cr:set_source_surface(s, 0, 0)
    cr:paint()
    c.icon = img._native
end)
