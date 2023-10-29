local naughty = require("naughty")
local wibox = require("wibox")
local upower = require("lgi").require("UPowerGlib")
local floor = require("math").floor
battery_widget = {}

battery_widget.status = {
  [upower.DeviceState.CHARGING] = "Charging",
  [upower.DeviceState.DISCHARGING] = "Discharging",
}

local function update(widget, device) 
    widget:get_children_by_id("battery_charge_role")[1].text = floor(device.percentage) .. "%"
end

local function new() 
  local widget = wibox.widget {
    {
      {
        id = "battery_charge_role",
        widget = wibox.widget.textbox,
        text = ""
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
  device.on_notify = function ()
    update(widget, device)
  end
  update(widget, device)
  return widget
end

return setmetatable(battery_widget, {
  __call = function (_, ...)
    return new(...)
  end,
}) 
