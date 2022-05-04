local beautiful = require("beautiful")
local awful = require("awful")

local default_tag = "Chore"

local tags = {
    {
        name = "Chore",
    },
    {
        name = "Browser",
    },
    {
        name = "Code",
    },
    {
        name = "Document",
    },
    {
        name = "Game",
    }
}

screen.connect_signal("request::desktop_decoration", function(s)
    for _, t in ipairs(tags) do
        local selected = false
        if t.name == default_tag then
            selected = true
        end

        awful.tag.add(t.name, {
            selected          = selected,
            gap_single_client = true,
            gap               = 10,
            screen            = s,
        })
    end
end)

-- [[ Tag layout
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.floating,
        awful.layout.suit.tile,
        awful.layout.suit.tile.left,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top,
        awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal,
        awful.layout.suit.spiral,
        awful.layout.suit.spiral.dwindle,
        awful.layout.suit.max,
        awful.layout.suit.max.fullscreen,
        awful.layout.suit.magnifier,
        awful.layout.suit.corner.nw,
    })
end)
-- ]]
