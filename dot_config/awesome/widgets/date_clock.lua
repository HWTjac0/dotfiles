local wibox = require("wibox")
local gears = require("gears")

return wibox.widget {
  layout = wibox.layout.fixed.horizontal,
  widget = wibox.container.margin,
  margins = 5,
  left = 5,
  right = 5,
  {
    widget = wibox.container.background,
    visible = true,
    {  
      layout = wibox.layout.fixed.horizontal,
      spacing = 6,
      {
        widget = wibox.container.background,
        bg = "#7369bf",
        fg = "#1d1d1d",
        shape = function (cr, width, height)
          gears.shape.rounded_rect(cr, width, height, 4)
        end,
        {
          widget = wibox.container.margin,
          margins = 2,
          left = 7,
          right = 7,
          {
            widget = wibox.widget.textclock,
            format = "<b>%a, %b %d</b>"
          }
        } 
      },
      {
        widget = wibox.container.background, 
        bg = "#4271bd",
        fg = "#1d1d1d",
        shape = function (cr, width, height)
          gears.shape.rounded_rect(cr, width, height, 4)
        end,
        {
          widget = wibox.container.margin,
          margins = 2,
          left = 7,
          right = 7,
          {
            widget = wibox.widget.textclock,
            format = "<b>%R</b>",
          }
        }
      }
    }
  }
}
