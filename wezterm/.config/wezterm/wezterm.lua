local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.window_decorations = "RESIZE"

config.mouse_bindings = {
  -- This disables the paste action on middle click
  {
    event = { Down = { streak = 1, button = 'Middle' } },
    mods = 'NONE',
    action = wezterm.action.Nop,
  },
}

return config
