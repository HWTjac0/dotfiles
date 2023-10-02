local awful = require("awful")
local gears = require("gears")
local layout_box = require("widgets.layout_box")
local clock = require("widgets.date_clock")
local tasklist = require("widgets.tasklist")
local taglist = require("widgets.taglist")
local wibox = require("wibox")

awful.screen.connect_for_each_screen(function (s)
  s.mtasklist = awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,

  }
  bar = awful.wibar({
    position = "bottom",
    screen = s,
    height = 35,
    bg = "#11141a"
  })
  bar : setup {
    widget = wibox.container.margin,
    margins = 5,
    {
      layout = wibox.layout.align.horizontal,
      expand = "none",
      spacing = 5,
      {
        layout = wibox.layout.fixed.horizontal,
        layout_box(s),
        taglist(s)
      },
      tasklist(s),
      {
        widget = wibox.container.background,
        bg = "#242938",
        shape = function (cr, width, height)
          gears.shape.rounded_rect(cr, width, height, 6)
        end,
        {
          widget = wibox.container.margin,
          margins = 3,
          left = 6,
          right = 6,
          {
            layout = wibox.layout.fixed.horizontal,
            clock
          }
        }
      }
    }
  } 
end)
