local wibox = require("wibox")
local awful = require("awful")
local upower = require("lgi").require("UPowerGlib")
local gears = require("gears")

local clock = require("widgets.clock")
local date = require("widgets.date")
local systray = wibox.widget.systray
local network = require("widgets.network")

local right_bar = wibox.widget {
 layout = wibox.layout.fixed.horizontal,
 spacing = 5,
 systray,
 awful.widget.keyboardlayout(),
 network,
 date,
 clock
}


return right_bar
