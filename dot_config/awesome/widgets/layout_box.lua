local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")

return function (s)
  return wibox.widget {
    screen = s,
    bg = "#fab387",
    widget = wibox.container.background,
    shape = function (cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 3)
    end,
    {
      widget = wibox.container.margin,
      margins = 3,
      {
        awful.widget.layoutbox(s),
        widget = wibox.container.place
      }
    }
  }
  
end
