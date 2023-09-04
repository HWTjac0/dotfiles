local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font 'Fira Code'
config.default_prog = { '/usr/bin/fish', '-l' }

config.use_fancy_tab_bar = false

config.color_scheme = 'Catppuccin Mocha'


return config
