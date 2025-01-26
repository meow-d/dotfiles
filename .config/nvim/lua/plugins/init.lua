return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre',
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    opts = {
      render_modes = true,
      file_types = {"markdown"},
      heading = {
        render_modes = false,
        border = true
      }
    },
    ft = {"markdown"}
  },

  {
    'renerocksai/telekasten.nvim',
    dependencies = {'nvim-telescope/telescope.nvim'}
  },
}
