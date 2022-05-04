local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

screen.connect_signal("request::wallpaper", function(s)
    awful.wallpaper {
        screen = s,
        widget = {
            horizontal_fit_policy = "fit",
            vertical_fit_policy   = "fit",
            image                 = beautiful.wallpaper,
            widget                = wibox.widget.imagebox,
        }
    }
end)
