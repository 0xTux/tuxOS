local wezterm = require 'wezterm'
local config = {}

config.window_close_confirmation = 'NeverPrompt'
config.color_scheme = 'Poimandres'
config.colors = {
  background = "#000"
}
config.enable_tab_bar = false
config.font = wezterm.font_with_fallback {
  'FiraCode Nerd Font',
}
config.font_size = 16.0
config.window_background_opacity = 1
config.window_padding = {
  left = '20px',
  right = '20px',
  top = '20px',
  bottom = '20px',
}

return config
