local autostart = require("modules.autostart")

-- run desktop entry?
-- desktop entries under XDG_AUTOSTART
local desktop = true

-- commands need autostart
local commands = {
    "setxkbmap -option caps:escape",
    "blueman-applet",
    "picom --experimental-backends",
    "xautolock -time 15 -locker 'i3lock-fancy -np -- scrot -z -o' -detectsleep"
}

autostart.run(desktop, commands)
