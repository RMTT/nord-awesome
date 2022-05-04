local awful = require("awful")
local bling = require("modules.bling")
local rubato = require("modules.rubato") -- Totally optional, only required if you are using animations.

-- These are example rubato tables. You can use one for just y, just x, or both.
-- The duration and easing is up to you. Please check out the rubato docs to learn more.
local anim_y = rubato.timed {
    pos = 1090,
    rate = 60,
    easing = rubato.quadratic,
    intro = 0.1,
    duration = 0.3,
    awestore_compat = true -- This option must be set to true.
}

local anim_x = rubato.timed {
    pos = -970,
    rate = 60,
    easing = rubato.quadratic,
    intro = 0.1,
    duration = 0.3,
    awestore_compat = true -- This option must be set to true.
}

local term_scratch = bling.module.scratchpad {
    command = "alacritty --class spad",
    rule = { instance = "spad" },
    sticky = true,
    autoclose = true,
    floating = true,
    geometry = {x=360, y=90, height=900, width=1200},
    reapply = true,
    dont_focus_before_close  = false,
    rubato = {x = anim_x, y = anim_y}
}

awful.keyboard.append_global_keybindings({
    awful.key({ modkey, }, "`", function() term_scratch:toggle() end,
        { description = "toggle a dropdown terminall", group = "launcher" }),
})
