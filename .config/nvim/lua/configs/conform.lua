local cwd = vim.loop.cwd() or ""
local disabled_paths = {
  "/var/home/meow_d/nerd-stuff/2-shared/DSTRassignment",
}

local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black", "ruff" },
    -- css = { "prettier" },
    html = { "prettier" },
    jsp = { "prettier" },
    -- javascript = { "prettier" },
    -- javascriptreact = { "prettier" },
    -- typesrcipt = { "prettier" },
    -- typescriptreact = { "prettier" },
    go = { "gofmt" },
    cpp = { "clang-format" },
  },

  format_on_save = false,
}

return options
