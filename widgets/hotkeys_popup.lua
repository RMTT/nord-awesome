local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

awful.keyboard.append_global_keybindings({
    awful.key({ modkey, }, "s", function()
        hotkeys_popup.show_help(nil, awful.screen.focused())
    end,
        { description = "show help", group = "awesome" }),
})
