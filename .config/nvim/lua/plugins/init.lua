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

  -- editing
  {
    "echasnovski/mini.surround",
    lazy = false,
    config = function()
      require("mini.surround").setup()
    end,
  },

  {
    -- "numToStr/Comment.nvim",
    -- this is so dumb!!
    "meow-d/Comment.nvim",
    lazy = false,
    opts = {
      mappings = {
        basic = true,
      },

      -- adjust indentation after commenting
      -- it doesn't do that if the line is empty before commenting
      post_hook = function(ctx)
        if ctx.range.srow == ctx.range.erow then
          vim.cmd "normal! =="
        end
      end,
    },
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
    "pocco81/auto-save.nvim",
    lazy = false,
  },

  -- more capable, but sets a map on ">" which breaks other plugins :(
  -- {
  --   "windwp/nvim-ts-autotag",
  --   ft = { "html", "xml", "jsx", "tsx", "markdown", "xml", "php", "liquid" },
  --   opts = {
  --     opts = {
  --       enable_close = true,
  --       enable_rename = true,
  --       enable_close_on_slash = true
  --     }
  --   },
  -- },

  -- {
  --   "tronikelis/ts-autotag.nvim",
  --   ft = { "html", "xml", "jsx", "tsx", "markdown", "xml", "php", "liquid" },
  -- },

  -- {
  --   "github/copilot.vim",
  --   lazy = false,
  --   config = function()
  --     vim.api.nvim_create_autocmd("VimEnter", {
  --       callback = function()
  --         local cwd = vim.fn.getcwd()
  --         local home = vim.loop.os_homedir()
  --         if cwd:match(home .. "/nerd%-stuff/notes") then
  --           vim.g.copilot_enabled = 0
  --         else
  --           vim.g.copilot_enabled = 1
  --         end
  --       end,
  --     })
  --   end,
  -- },

  -- navigation
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        winblend = 30,
      },
    },
  },

  {
    "nvim-telescope/telescope-frecency.nvim",
    version = "*",
    config = function()
      require("telescope").load_extension "frecency"
    end,
  },

  -- markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
    ft = { "markdown" },
    opts = {
      render_modes = true,
      file_types = { "markdown" },
      heading = {
        sign = true,
      },
      pipe_table = {
        style = "normal",
        cell = "raw",
      },
    },
  },

  {
    "bullets-vim/bullets.vim",
    ft = { "markdown" },
    -- see options.lua and mappings.lua for config
  },

  {
    "obsidian-nvim/obsidian.nvim",
    -- version = "*",
    ft = { "markdown" },
    -- cond = vim.fn.getcwd() == vim.fn.expand "~/nerd-stuff/notes",
    -- lazy = false,

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-treesitter/nvim-treesitter",
    },

    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      legacy_commands = false,
      ui = { enable = false },
      workspaces = {
        {
          name = "notes",
          path = "~/nerd-stuff/notes",
        },
      },
      notes_subdir = "notes",
      daily_notes = {
        folder = "./journal",
        template = "daily-note.md",
      },
      templates = {
        folder = "./.obsidian-nvim-templates",
        date_format = "%A, %B %d, %Y",
      },
      -- disable_frontmatter = true,
      frontmatter = {
        enabled = false,
      },
      footer = {
        separator = "",
        format = "({{backlinks}} backlinks)",
      }
    },
  },
}
