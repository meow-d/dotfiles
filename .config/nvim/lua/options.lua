require "nvchad.options"

local o = vim.o
local g = vim.g

o.cursorlineopt = "both"
o.wildmode = "longest,list,full"
o.wildmenu = true
o.relativenumber = true
o.scrolloff = 5
o.linebreak = true
g.editorconfig = true
o.breakindent = true
o.autowriteall = true
o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'
o.foldenable = false

-- WHY do i need to do this?????
g.markdown_recommended_style = 0

-- bullets.vim
g.bullets_checkbox_markers = " -x"
g.bullets_outline_levels = { "std-" }
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

-- luasnip exit session on exiting insert mode
-- this has haunted me for so long
vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = '*',
  callback = function()
    if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
      and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require('luasnip').session.jump_active
    then
      require('luasnip').unlink_current()
    end
  end
})

-- neovide
if g.neovide then
  o.guifont = "Monofoki Nerd Font:h13"

  g.neovide_opacity = 0.8
  g.neovide_frame = "none"

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
