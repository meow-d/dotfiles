return {
  -- ide stuff
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

  -- { "mfussenegger/nvim-dap" },

  -- editing
  {
    "echasnovski/mini.surround",
    lazy = false,
    config = function()
      require("mini.surround").setup()
    end,
  },

  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    lazy = false,
    config = function()
      require("multicursor-nvim").setup()
    end,
  },

  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          local cwd = vim.fn.getcwd()
          if cwd:match("^" .. vim.fn.expand "~/nerd-stuff/notes") then
            vim.g.copilot_enabled = 0
          else
            vim.g.copilot_enabled = 1
          end
        end,
      })
    end,
  },

  -- navigation
  {
    "nvim-telescope/telescope-frecency.nvim",
    version = "*",
    config = function()
      require("telescope").load_extension "frecency"
    end,
  },

  -- markdown related
  {
    "MeandeingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
    ft = { "markdown" },
    opts = {
      render_modes = true,
      file_types = { "markdown" },
      heading = {
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
}
