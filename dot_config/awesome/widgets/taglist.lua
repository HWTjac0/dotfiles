local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local tag_buttons = gears.table.join(
  awful.button(nil, 1,function (t) 
    t:view_only()
  end)
)
return function (s)
  return awful.widget.taglist({
    screen = s,
    filter = awful.widget.taglist.filter.noempty,
    buttons = tag_buttons,
    update_function = nil,
    style = nil,
    layout = 
    {
      spacing = 5,
      layout  = wibox.layout.fixed.horizontal
    },
    widget_template = 
    {
      widget = wibox.container.margin,
      {
        widget = wibox.container.background,
        bg = "#444444",
        shape = function (cr, width, height)
          gears.shape.rounded_rect(cr, width, height, 3)
        end,
        {
          widget = wibox.container.margin,
          left = 6,
          right = 6,
          bottom = 3,
          {
            layout = wibox.layout.fixed.horizontal,
            {
              id = "text_role",
              widget = wibox.widget.textbox
            }
          }
        }
      },
    },
    wibox.layout.fixed.horizontal() 
  })
end
