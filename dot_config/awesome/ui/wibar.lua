local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

awful.screen.connect_for_each_screen(function(s)
	
	layoutbox = wibox({
		bg = "#1fae1a",
		shape = gears.shape.rounded_rect
	})
	layoutbox:setup {
		layout = wibox.layout.flex.horizontal,
		widget = wibox.container.margin,
		margins = 1,
		{
		}
	}

	s.bar = awful.wibar({ 
		position = "bottom",
		screen = s,
		height = 30
	})
	
	s.bar:setup{
		layout = wibox.layout.align.horizontal,
		color = "#a1a1a1",
		margins = 5,
		widget = wibox.container.margin,
		{
			layout = wibox.layout.fixed.horizontal,
			layoutbox
		}
	}

end)
