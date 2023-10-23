local wibox = require("wibox")

local layout = require("widgets.layout_box")
local taglist = require("widgets.taglist")

return function (s) 
  return wibox.widget {
   layout = wibox.layout.fixed.horizontal,
   spacing = 5,
   widget = wibox.container.background,
   layout(s),
   taglist(s)
  }
end
