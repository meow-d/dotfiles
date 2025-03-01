local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff", "black" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typesrcipt = { "prettier" },
    typescriptreact = { "prettier" },
    go = { "gofmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
  },
}

return options
