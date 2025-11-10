-- load defaults
require("nvchad.configs.lspconfig").defaults()
local nvlsp = require "nvchad.configs.lspconfig"
local util = require "lspconfig.util"

-- default servers
local servers = {
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
vim.lsp.config("px_to_vw_lsp", {
  -- cmd = { "px-to-vw-lsp", "--log-level=debug" },
  cmd = { "px-to-vw-lsp" },
  filetypes = { "css", "scss", "less" },
  root_dir = vim.fn.getcwd(),
  workspace_required = false,
  name = "px_to_vw_lsp",
})
vim.lsp.enable "px_to_vw_lsp"

-- tailwindcss lsp
vim.lsp.config("tailwindcss", {
  cmd = { "tailwindcss-language-server", "--stdio" },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = {
    "html",
    "css",
    "scss",
    "less",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
    "blade",
    "php",
  },
  root_dir = util.root_pattern(
    "tailwind.config.js",
    "tailwind.config.cjs",
    "tailwind.config.ts",
    "postcss.config.js",
    ".git"
  ),
})
vim.lsp.enable "tailwindcss"

-- debug
-- vim.lsp.set_log_level("trace")
-- vim.lsp.log.set_format_func(vim.inspect)

