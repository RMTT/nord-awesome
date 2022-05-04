local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local module = {}

function module.create()
    local hour = wibox.widget {
        widget = wibox.widget.textclock,
        format = "%H",
        align = "center",
        font = beautiful.textclock_font
    }

    local minute = wibox.widget {
        widget = wibox.widget.textclock,
        format = "%M",
        align = "center",
        font = beautiful.textclock_font
    }
    local clock = wibox.widget {
        layout = wibox.layout.fixed.vertical,
        hour,
        minute
    }

    return clock
end

return module
