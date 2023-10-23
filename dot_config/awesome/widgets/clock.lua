local wibox = require("wibox")

return wibox.widget {
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
      format = "<b>%R</b>",
    }
  }
}
