local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.window_decorations = "RESIZE"
config.keys = {
  {
    key = 'C',
    mods = 'CTRL|SHIFT',
    action = act.Multiple {
      act.CopyTo 'Clipboard',
      act.EmitEvent 'show-status-toast',
    },
  },
}

wezterm.on('show-status-toast', function(window, _)
  -- Set the status to the message
  window:set_left_status(wezterm.format({
    { Text = ' 📋 Copied to clipboard! ' },
  }))

  -- Clear it after 2 seconds
  wezterm.time.call_after(2.0, function()
    window:set_left_status('')
  end)
end)

config.mouse_bindings = {
  -- This disables the paste action on middle click
  {
    event = { Down = { streak = 1, button = 'Middle' } },
    mods = 'NONE',
    action = wezterm.action.Nop,
  },
}

return config
