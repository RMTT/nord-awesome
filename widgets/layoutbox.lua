local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")

local module = {}

function module.create(config)
    local box = awful.widget.layoutbox {
        screen = config.screen,
        buttons = {
            awful.button({}, 1, function() awful.layout.inc(1) end),
            awful.button({}, 3, function() awful.layout.inc(-1) end),
            awful.button({}, 4, function() awful.layout.inc(1) end),
            awful.button({}, 5, function() awful.layout.inc(-1) end),
        }
    }

    return box
end

return module
