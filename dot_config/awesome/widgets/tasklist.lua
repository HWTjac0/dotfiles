local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local naughty = require("naughty")

local task_buttons = gears.table.join(
  awful.button(nil, 1, function(c)
    if c == client.focus then
      c.minimized = true
    else
      c.minimized = false
    end
  end)
)

function split(str, delimeter)
  local splitted = {}
  for token in string.gmatch(str, "%a+") do
    table.insert(splitted, token)
  end
  return splitted
end

return function(s)
  return awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = task_buttons,
    widget_template = {
      {
        {
          {
            {
              {
                id     = 'clienticon',
                widget = awful.widget.clienticon,
              },
              {
                id     = "clientname",
                widget = wibox.widget.textbox,
              },
              spacing = 5,
              layout = wibox.layout.fixed.horizontal,
            },
            margins = 2,
            widget  = wibox.container.margin,
          },
          layout = wibox.layout.fixed.horizontal,
        },
        left   = 5,
        right  = 5,
        widget = wibox.container.margin
      },
      bg = "#59699e",
      fg = "#ffffff",
      widget = wibox.container.background,
      id = "clientbackground",
      shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, 5)
      end,
      create_callback = function(self, c, index, objects)
        local name_tokens = split(c.class)
        local name = name_tokens[#name_tokens]
        self:get_children_by_id("clientname")[1].text = name:sub(1, 1):upper() .. name:sub(2)
        self:get_children_by_id("clienticon")[1].client = c
      end,
      update_callback = function(self, c, index, objects)
        if c == client.focus then
          self.bg = "#59699e"
        else
          self.bg = "#313244"
        end
      end
    },
    layout = {
      spacing = 5,
      layout  = wibox.layout.flex.horizontal
    }
  }
end
