local awful = require("awful")
local naughty = require("naughty")
local gears = require("gears")
local os = require("os")

return gears.table.join( 
  awful.key({}, 'XF86MonBrightnessUp', function () awful.util.spawn("brightnessctl s 5%+") end),
  awful.key({}, 'XF86MonBrightnessDown', function () awful.util.spawn("brightnessctl s 5%-") end),
  awful.key({}, 'XF86AudioMute', function () awful.util.spawn("amixer set Master toggle") end),

  awful.key({}, 'Print', function (c)
    awful.screenshot {
      auto_save_delay = 0,
      interactive = true,
      client = c,
      file_path = "/home/kuba/Pictures" .. os.date() .. ".png"
    }
  end)
)

