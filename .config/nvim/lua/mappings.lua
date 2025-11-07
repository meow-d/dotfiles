require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- old: :Telescope frecency workspace=CWD <CR>
map("n", "<leader>ff", ":Telescope smart_open cwd_only=true <CR>")
map("n", "<c-p>", ":Telescope smart_open cwd_only=true <CR>")
map("n", "<s-u>", "<c-r>", { desc = "redo" })
map("i", "<c-s>", "<c-o>:w<cr>", { desc = "save file (even in insert mode)" })
map({'n', 'i'}, '<C-a>', 'ggVG', { noremap = true })

-- adjust indentation after pasting
-- map("n", "p", "p`[v`]=", { noremap = true, silent = true })
-- map("n", "P", "P`[v`]=", { noremap = true, silent = true })
-- normal paste under <leader>
map("n", "<leader>p", "p", { noremap = true, silent = true })
map("n", "<leader>P", "P", { noremap = true, silent = true })

-- multicursor
local mc = require "multicursor-nvim"

map({ "n", "x" }, "<c-s-k>", function()
  mc.lineAddCursor(-1)
end)

map({ "n", "x" }, "<c-s-j>", function()
  mc.lineAddCursor(1)
end)

map({ "n", "x" }, "<leader>n", function()
  mc.matchAddCursor(1)
end)

map({ "n", "x" }, "<c-d>", function()
  mc.matchAddCursor(1)
end)

map({ "n", "x" }, "<c-s-l>", mc.matchAllAddCursors)

map("n", "<Esc>", function()
  if mc.cursorsEnabled() then
    mc.clearCursors()
  end

  if vim.v.hlsearch == 1 then
    vim.cmd "nohlsearch"
  end
end, { silent = true })

-- bullets.vim
map({ "n", "v", "i" }, "<A-c>", "<Plug>(bullets-toggle-checkbox)")
