-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

-- list of servers with default configs
local servers = {
  "superhtml",
  "html",
  "cssls",
  "ts_ls",
  "pyright",
  "svelte",
  "gopls",
  "clangd",
  "jsonls",
  "phpactor",
}

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })

  vim.lsp.enable(lsp)
end

-- px to vw lsp
-- define config
vim.lsp.config("px_to_vw_lsp", {
  cmd = { "px-to-vw-lsp", "--log-level=debug" },
  filetypes = { "css", "scss", "less" },
  root_dir = vim.fn.getcwd(),
  workspace_required = false,
  name = "px_to_vw_lsp",
})

vim.lsp.enable "px_to_vw_lsp"

-- debug
-- vim.lsp.set_log_level("trace")
-- vim.lsp.log.set_format_func(vim.inspect)
