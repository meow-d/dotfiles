local wezterm = require 'wezterm'
local config = {


  -- appearance
  font = wezterm.font('SauceCodePro Nerd Font Mono', {weight = "DemiBold"}),
  font_size = 13.0,
  freetype_load_target = "Light", -- normal font hinting breaks the rendering for some reason

  color_scheme = 'Monokai Dark (Gogh)',
  default_cursor_style = 'BlinkingUnderline',


  -- window
  window_background_opacity = 0.95,
  initial_cols = 110,
  initial_rows = 26,
  integrated_title_button_style = "Gnome",


  -- keybindings
  keys = {
  {
    key = 't',
    mods = 'CTRL',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
},


  -- config
  automatically_reload_config = true,
}


-- bell
wezterm.on('bell', function(window, pane)
  os.execute("notify-send '🔔 Terminal bell' 'Check your terminal!' --icon=utilities-terminal")
end)


return config
