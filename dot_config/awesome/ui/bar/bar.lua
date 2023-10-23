local awful = require("awful")
local gears = require("gears")
local layout_box = require("widgets.layout_box")
local tasklist = require("widgets.tasklist")
local taglist = require("widgets.taglist")
local battery = require("widgets.battery")

local right = require("ui.bar.right")
local left = require("ui.bar.left")
local wibox = require("wibox")

awful.screen.connect_for_each_screen(function (s)
  s.mtasklist = awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,

  }
  bar = awful.wibar({
    position = "top",
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
      left(s),
      tasklist(s),
      right
    }
  } 
end)
