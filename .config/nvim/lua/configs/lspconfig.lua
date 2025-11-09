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

