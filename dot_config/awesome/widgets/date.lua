local wibox = require("wibox")

local widget = wibox.widget {
  widget = wibox.container.background, 
  fg = "#bbbbbb",
  {
    widget = wibox.container.margin,
    left = 7,
    right = 7,
    top = 2,
    bottom = 2,
    {
      widget = wibox.widget.textclock,
      format = "<b>%a, %b %d</b>"
    }
  }
}
