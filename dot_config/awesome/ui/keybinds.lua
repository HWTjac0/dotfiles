local awful = require("awful")
local naughty = require("naughty")
local gears = require("gears")

return gears.table.join( 
  awful.key({}, 'XF86MonBrightnessUp', function () awful.util.spawn("brightnessctl s 5%+") end),
  awful.key({}, 'XF86MonBrightnessDown', function () awful.util.spawn("brightnessctl s 5%-") end),
  awful.key({}, 'XF86AudioMute', function () awful.util.spawn("amixer set Master toggle") end)
)

