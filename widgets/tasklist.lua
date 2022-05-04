local awful = require("awful")
local wibox = require("wibox")

local module = {}


function module.create(config)
    local tasklist = awful.widget.tasklist {
        screen          = config.screen,
        filter          = awful.widget.tasklist.filter.currenttags,
        layout          = {
            spacing = 5,
            layout = wibox.layout.fixed.vertical,
        },
        widget_template = {
            {
                {
                    id     = "icon_role",
                    resize = true,
                    widget = wibox.widget.imagebox,
                },
                margins = 5,
                widget  = wibox.container.margin,
            },
            id     = "background_role",
            widget = wibox.container.background,
        },
        buttons         = {
            awful.button({}, 1, function(c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end),
            awful.button({}, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
            awful.button({}, 4, function() awful.client.focus.byidx(-1) end),
            awful.button({}, 5, function() awful.client.focus.byidx(1) end),
        }
    }

    return tasklist
end

return module
