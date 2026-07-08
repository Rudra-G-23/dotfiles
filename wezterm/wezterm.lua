local wezterm = require("wezterm")

local config = wezterm.config_builder()

--------------------------------------------------------------------------------
-- Appearance
--------------------------------------------------------------------------------

config.color_scheme = "Catppuccin Mocha"

-- config.font = wezterm.font('JetBrains Mono Nerd Font')
-- config.font_size = 12.0

config.line_height = 1.2

--------------------------------------------------------------------------------
-- Window
--------------------------------------------------------------------------------

config.window_decorations = "RESIZE"

config.hide_tab_bar_if_only_one_tab = true

config.enable_scroll_bar = false

config.window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
}

--------------------------------------------------------------------------------
-- Transparency
--------------------------------------------------------------------------------

config.window_background_opacity = 0.92

config.text_background_opacity = 1.0

--------------------------------------------------------------------------------
-- Performance
--------------------------------------------------------------------------------

config.animation_fps = 60

config.max_fps = 120

--------------------------------------------------------------------------------
-- Cursor
--------------------------------------------------------------------------------

config.default_cursor_style = "BlinkingBar"

config.cursor_blink_rate = 700

--------------------------------------------------------------------------------
-- Default Shell
--------------------------------------------------------------------------------

-- Launch Ubuntu WSL directly

config.default_prog = {
    "wsl.exe",
    "-d",
    "Ubuntu",
    "--cd",
    "~",
}

--------------------------------------------------------------------------------
-- Keyboard Shortcuts
--------------------------------------------------------------------------------

config.keys = {

    --------------------------------------------------------------------------
    -- Word Navigation
    --------------------------------------------------------------------------

    {
        key = "LeftArrow",
        mods = "CTRL",
        action = wezterm.action.SendString("\x1bb"),
    },

    {
        key = "RightArrow",
        mods = "CTRL",
        action = wezterm.action.SendString("\x1bf"),
    },

    --------------------------------------------------------------------------
    -- Delete Previous Word
    --------------------------------------------------------------------------

    {
        key = "Backspace",
        mods = "CTRL",
        action = wezterm.action.SendString("\x17"),
    },

    --------------------------------------------------------------------------
    -- Delete Next Word
    --------------------------------------------------------------------------

    {
        key = "Delete",
        mods = "CTRL",
        action = wezterm.action.SendString("\x1bd"),
    },

    --------------------------------------------------------------------------
    -- Reload Config
    --------------------------------------------------------------------------

    {
        key = "R",
        mods = "CTRL|SHIFT",
        action = wezterm.action.ReloadConfiguration,
    },
}

return config