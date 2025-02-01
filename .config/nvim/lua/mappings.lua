require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<C-p>", ":Telescope frecency workspace=CWDa <CR>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
