-- Pull wezterm api
local wezterm = require "wezterm"
local config = {}

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font "JetBrains Mono"
config.window_background_opacity = .9
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"

return config
