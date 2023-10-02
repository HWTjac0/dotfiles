local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local task_buttons = gears.table.join(
  awful.button(nil, 1, function (c)
    if c == client.focus then
      c.minimized = true
    else
      c.minimized = false
    end
  end)
)

return function (s)
  return awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = task_buttons,
    widget_template = {
			{
				{
					{
						{
							id     = 'icon_role',
							widget = wibox.widget.imagebox,
						},
						margins = 2,
						widget  = wibox.container.margin,
					},
					layout = wibox.layout.fixed.horizontal,
				},
				left  = 5,
				right = 5,
				widget = wibox.container.margin
			},
      bg = "#59699e",
			widget = wibox.container.background,
      shape = function (cr, width, height)
        gears.shape.rounded_rect(cr, width, height, 5)
      end
    }

  }
end
