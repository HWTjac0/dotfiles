local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

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
      format = "<b>%R</b>",
    }
  }
}

local calendar_popup = awful.popup {
  widget = {
    {
      {
        {
          {
            {
              widget = wibox.widget.textclock,
              format = "<b>%d/%m/%Y</b>",
            },
            {
              widget = wibox.widget.textclock,
              format = "<b>%T</b>",
              refresh = 1
            },
            widget = wibox.container.background,
            layout = wibox.layout.fixed.vertical
          },
          margins = 10,
          widget = wibox.container.margin,
        },
        {
          {
            spacing = 10,
            widget = wibox.widget.calendar.month(os.date('*t')),
            fn_embed = function(widget, flag, date)
              if flag == "normal" then
                return widget
              end
              return widget
            end
          },
          margins = 10,
          widget = wibox.container.margin,
        },
        layout = wibox.layout.fixed.vertical,
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
  placement = function(c)
    awful.placement.align(c,
      { position = "top_right", margins = { right = 10, top = 39 } })
  end,
  shape = gears.shape.rounded_rect
}

widget:connect_signal("button::press", function()
  awesome.emit_signal("time::toggle")
end)

awesome.connect_signal("time::toggle", function()
  calendar_popup.visible = not calendar_popup.visible
end)

return widget
