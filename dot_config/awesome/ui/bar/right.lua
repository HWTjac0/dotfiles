local wibox = require("wibox")
local awful = require("awful")

local clock = require("widgets.clock")
local date = require("widgets.date")
local battery = require("widgets.battery")
local systray = wibox.widget.systray

return wibox.widget {
 layout = wibox.layout.fixed.horizontal,
 spacing = 5,
 systray,
 battery,
 awful.widget.keyboardlayout(),
 date,
 clock
}
