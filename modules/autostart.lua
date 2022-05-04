-- [[ autostart
-- using dex to run desktop entries
-- ]]

local awful = require("awful")

local module = {}

function module.run(desktop, commands)
    if desktop then
        awful.spawn("dex -a")
    end

    for _, cmd in ipairs(commands) do
        awful.spawn(cmd)
    end
end

return module
