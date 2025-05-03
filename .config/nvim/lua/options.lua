require "nvchad.options"

local o = vim.o
local g = vim.g
o.cursorlineopt = "both"
o.wildmode = "longest,list,full"
o.wildmenu = true
o.relativenumber = true
g.editorconfig = true
o.breakindent = true

-- bullets.vim
g.bullets_checkbox_markers = " -x"
g.bullets_set_mappings = 0
g.bullets_custom_mappings = {
  { "imap", "<cr>", "<Plug>(bullets-newline)" },
  { "inoremap", "<C-cr>", "<cr>" },
  { "nmap", "o", "<Plug>(bullets-newline)" },

  { "nmap", ">>", "<Plug>(bullets-demote)" },
  { "vmap", ">", "<Plug>(bullets-demote)" },
  { "nmap", "<<", "<Plug>(bullets-promote)" },
  { "vmap", "<", "<Plug>(bullets-promote)" },
}

-- neovide
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
