function create_layoutbox_widget(widget)
	box = wibox({
		bg = "#1fae1a",
		shape = gears.shape.rounded_rect({
			radius = 2
		})
	})
	box:setup{
		layout = aweful.layout.flex.horizontal
		widget = wibox.container.margin
		margins = 2
		{
			widget = box
		}
	}
	return box
end
