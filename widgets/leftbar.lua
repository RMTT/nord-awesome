local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")

local module = {}

local taglist = require("widgets.taglist")
local layoutbox = require("widgets.layoutbox")
local textclock = require("widgets.textclock")
local tasklist = require("widgets.tasklist")

function module.create(config)
    local bar = awful.wibar {
        position = "left",
        screen = config.screen,
        stretched = true,
        type = "dock",
        width = 74,
        ontop = false,
        widget = {
            layout = wibox.layout.align.vertical,
            {
                widget = wibox.container.margin,
                margins = 14,
                {
                    layout = wibox.layout.fixed.vertical,
                    spacing = 14,
                    {
                        widget = wibox.widget.imagebox,
                        image = beautiful.leftbar_launcher_icon,
                        resize = true,
                    },
                    taglist.create { screen = config.screen }
                },
            },
            {
                widget = wibox.container.margin,
                margins = 14,
                tasklist.create { screen = config.screen }
            },
            {
                widget = wibox.container.margin,
                margins = 14,
                {
                    layout = wibox.layout.fixed.vertical,
                    spacing = 14,
                    {
                        widget = wibox.widget.systray,
                        screen = awful.screen.primary,
                        horizontal = false
                    },
                    textclock.create(),
                    layoutbox.create { screen = config.screen }
                }
            }
        }
    }

    return bar
end

return module
