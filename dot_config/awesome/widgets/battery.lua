local naughty = require("naughty")
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local upower = require("lgi").require("UPowerGlib")
local floor = require("math").floor
battery_widget = {}

battery_widget.status = {
  [upower.DeviceState.CHARGING] = "Charging",
  [upower.DeviceState.DISCHARGING] = "Discharging",
}

local function getBatteryIcon(device)
  local percentage = device.percentage
  local image = ""
  if percentage >= 75 then
    image = "/home/jac/Pictures/wm_assets/batteryFull.png"
  elseif percentage >= 50 then
    image = "/home/jac/Pictures/wm_assets/batteryAlmostFull.png"
  elseif percentage >= 25 then
    image = "/home/jac/Pictures/wm_assets/batteryHalf.png"
  else
    image = "/home/jac/Pictures/wm_assets/batteryAlmostEmpty.png"
  end

  return image
end

local function update(widget, device)
  widget:get_children_by_id("battery_charge_role")[1].image = getBatteryIcon(device)
  -- widget:get_children_by_id("battery_charge_role")[1].markup = floor(device.percentage) .. "%"
end

local function new()
  local popup = awful.popup {
    widget = {
      {
        {
          widget = wibox.widget.textbox,
          text = "asdsad"
        },
        widget = wibox.container.background,
        bg = "#1f1f1f"
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
  local widget = wibox.widget {
    {
      {
        id = "battery_charge_role",
        widget = wibox.widget.imagebox,
        image = ""
      },
      {
        id = "battery_charge_state",
        widget = wibox.widget.textbox,
        text = ""
      },
      layout = wibox.layout.fixed.horizontal,
      spacing = 5,
    },
    widget = wibox.container.background,
    fg = "#ffffff",
  }
  local device = upower.Client():get_display_device()
  device.on_notify = function()
    update(widget, device)
  end

  local tooltip = awful.tooltip {
    objects = { widget },
    timer_function = function()
      return floor(device.percentage) .. "%"
    end
  }

  widget:connect_signal("button::press", function()
    awesome.emit_signal("battery::toggle")
  end)

  awesome.connect_signal("battery::toggle", function()
    popup.visible = not popup.visible
  end)

  update(widget, device)
  return widget
end

return setmetatable(battery_widget, {
  __call = function(_, ...)
    return new(...)
  end,
})
