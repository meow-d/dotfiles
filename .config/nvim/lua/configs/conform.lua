local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format"  },
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
