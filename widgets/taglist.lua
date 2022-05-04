local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

local module = {}

function module.create(config)
    local icon = gears.surface.load_uncached(beautiful.taglist_icon)
    local icon_empty = gears.color.recolor_image(icon, beautiful.taglist_fg_empty)
    local icon_focus = gears.color.recolor_image(icon, beautiful.taglist_fg_focus)
    local icon_urgent = gears.color.recolor_image(icon, beautiful.taglist_fg_urgent)

    local update_icon = function(widget, t)
        local which_icon = icon_empty

        if t.selected then
            which_icon = icon_focus
        end

        widget:get_children_by_id('icon')[1].image = which_icon
    end

    local taglist = awful.widget.taglist {
        screen = config.screen,
        filter = awful.widget.taglist.filter.all,
        layout = {
            layout = wibox.layout.fixed.vertical
        },
        widget_template = {
            id              = "background_role",
            widget          = wibox.container.background,
            create_callback = function(self, t, index, objects)
                update_icon(self, t)

                t:connect_signal("property::urgent", function(t)
                end)
            end,
            update_callback = function(self, t, index, objects)
                update_icon(self, t)
            end,
            {
                widget  = wibox.container.margin,
                margins = 4,
                {
                    widget = wibox.container.place,
                    halign = "center",
                    valign = "center",
                    {
                        id            = "icon",
                        resize        = true,
                        widget        = wibox.widget.imagebox,
                        forced_height = 24,
                        forced_width  = 24
                    },
                }
            }
        },
        buttons = {
            awful.button({}, 1, function(t) t:view_only() end),
            awful.button({ modkey }, 1, function(t)
                if client.focus then
                    client.focus:move_to_tag(t)
                end
            end),
            awful.button({}, 3, awful.tag.viewtoggle),
            awful.button({ modkey }, 3, function(t)
                if client.focus then
                    client.focus:toggle_tag(t)
                end
            end),
            awful.button({}, 4, function(t) awful.tag.viewprev(t.screen) end),
            awful.button({}, 5, function(t) awful.tag.viewnext(t.screen) end),
        }

    }

    return taglist
end

return module
