require "nvchad.options"

-- add yours here!

local o = vim.o
local g = vim.g
o.cursorlineopt = "both"
o.wildmode = "longest,list,full"
o.wildmenu = true
o.relativenumber = true
g.editorconfig = true

if g.neovide then
  g.neovide_fullscreen = false
  o.guifont = "Mononoki Nerd Font:h13"
  -- o.linespace = 12

  g.neovide_floating_blur_amount_x = 2.0
  g.neovide_floating_blur_amount_y = 2.0

  g.neovide_floating_shadow = true
  g.neovide_floating_z_height = 10
  g.neovide_light_angle_degrees = 45
  g.neovide_light_radius = 5

  g.neovide_floating_corner_radius = 2.0

  g.neovide_scroll_animation_length = 0.2
  g.neovide_cursor_animation_length = 0.05
end
