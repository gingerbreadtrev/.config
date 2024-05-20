local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- FONT
config.font = wezterm.font_with_fallback {
  "JetBrainsMono Nerd Font",
  "VictorMono NF"
}
config.font_size = 14.0

-- THEME
config.color_scheme = 'Catppuccin Mocha'
config.colors ={
  tab_bar = {
    active_tab = {
      bg_color = 'a6e3a1',
      fg_color = '11111b'
    }
  }
}

-- TABS
config.use_fancy_tab_bar = false
config.show_tabs_in_tab_bar = true
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = false
-- config.hide_tab_bar_if_only_one_tab = true
--config.status_update_interval = 1000
config.tab_max_width = 60

-- Panes
config.inactive_pane_hsb = {
  saturation = 0.4,
  brightness = 0.5
}

-- TERMINFO
config.term = "wezterm"

-- STATUS BAR 
wezterm.on('update-right-status', function(window, pane)
  local date = wezterm.strftime '%a %b %-d %H:%M '
  local bat = ''
  for _, b in ipairs(wezterm.battery_info()) do
    bat = string.format('%.0f%%', b.state_of_charge * 100)
  end
  window:set_right_status(wezterm.format ({
    { Foreground = { Color = "f9e2af" } },
    { Text = wezterm.nerdfonts.md_laptop .. "  " .. wezterm.hostname() },
    { Text = " | " },
    { Text = wezterm.nerdfonts.fa_battery_full .. "  " .. bat },
    { Text = " | " },
    { Text = wezterm.nerdfonts.md_calendar_clock .. "  " .. date },
    { Text = "  "},
    "ResetAttributes",
  }))
end)

-- WINDOW
config.window_background_opacity = 0.95
config.window_decorations = "RESIZE" -- removes close, minimize and so on
config.window_close_confirmation = "AlwaysPrompt"
config.window_padding = {
  top = 5,
  right = 5,
  bottom = 0,
  left = 5,
}

-- panes
config.inactive_pane_hsb = {
  saturation = 0.4,
  brightness = 0.5
}

return config
