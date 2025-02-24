return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
    ft = { "markdown" },
    opts = {
      render_modes = true,
      file_types = { "markdown" },
      heading = {
        -- border = true,
        sign = true,
      },
    },
  },

  {
    "epwalsh/obsidian.nvim",
    version = "*",
    ft = "markdown",
    cond = vim.fn.getcwd() == vim.fn.expand "~/nerd-stuff/notes",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      ui = { enable = false },
      disable_frontmatter = true,
      workspaces = {
        {
          name = "notes",
          path = "~/nerd-stuff/notes",
        },
      },
      daily_notes = {
        folder = "./journal",
      },
    },
  },

  {
    "tpope/vim-surround",
    lazy = false,
  },

  {
    "nvim-telescope/telescope-frecency.nvim",
    -- install the latest stable version
    version = "*",
    config = function()
      require("telescope").load_extension "frecency"
    end,
  },
}
