local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Theme
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 15.0

-- Window
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = false

-- Padding
config.window_padding = {left = 10, right = 10, top = 10, bottom = 10}

-- Transparency
config.window_background_opacity = 0.92
config.text_background_opacity = 1.0

-- Performance
config.animation_fps = 60
config.max_fps = 120

-- Cursor
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 700

-- Transparency
config.window_background_opacity = 0.92
config.text_background_opacity = 1.0

return config
