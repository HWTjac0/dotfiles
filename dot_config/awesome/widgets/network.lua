local wibox = require("wibox")
local nm = require("lgi").NM

local client = nm.Client.new()
local devs = client:get_devices()

function get_ssid(ap)
  local ssid = ap:get_ssid()
  return nm.utils_ssid_to_utf8(ssid:get_data())
end

ssid = ""
for _, dev in pairs(devs) do
  if dev:get_device_type() == "WIFI" then
    ap = dev:get_active_access_point()
    ssid = get_ssid(ap)
  end
end

return wibox.widget {
  widget = wibox.widget.textbox,
  text = ssid
}
