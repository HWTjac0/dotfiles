local gears = require("gears")
local wibox = require("wibox")
local naughty = require("naughty")
local awful = require("awful")

local date_widget = wibox.widget {
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
local calendar_popup = awful.popup {
  widget = {
    {
      {
        {
          spacing = 10,
          widget = wibox.widget.calendar.month(os.date('*t')),
          fn_embed = function (widget, flag, date)
            if flag == "normal" then
              return widget
            end
            return widget
          end
        },
        margins = 10,
        widget = wibox.container.margin,
      },
      bg = "#1f1f1f",
      widget = wibox.widget.background,
      shape = gears.shape.rounded_rect,
      shape_border_color = "#89b4fa",
      shape_border_width = 2
    },
    margins = 5,
    widget = wibox.container.margin
  },
  visible = false,
  ontop = true,
  placement = function (c)
    awful.placement.align(c,
    { position = "top_right", margins = {right = 100, top = 39 }})
  end,
  shape = gears.shape.rounded_rect
} 

date_widget:connect_signal("button::press", function ()
  awesome.emit_signal("calendar::toggle")
end)

awesome.connect_signal("calendar::toggle", function ()
  calendar_popup.visible = not calendar_popup.visible
end)

return date_widget
