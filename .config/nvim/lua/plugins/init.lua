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

  -- completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = { "hrsh7th/cmp-cmdline" },

    opts = require "configs.cmp",

    config = function(_, opts)
      local cmp = require "cmp"

      -- regular setup
      cmp.setup(opts)

      -- `/` cmdline config
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "nvim_lsp_document_symbol" },
        }, {
          { name = "buffer" },
        }),
      })

      -- `:` cmdline setup
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })
    end,
  },

  {
    "hrsh7th/cmp-nvim-lsp-document-symbol",
  },

  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
  },

  -- dap
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    -- from https://www.johntobin.ie/blog/debugging_in_neovim_with_nvim-dap/
    keys = {
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },

      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },

      {
        "<leader>dC",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },

      {
        "<leader>dT",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
    },
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    ---@type MasonNvimDapSettings
    opts = {
      handlers = {},
      automatic_installation = {
        exclude = {
          -- "delve",
          -- "python",
        },
      },
      ensure_installed = {
        "python",
      },
    },
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    event = "VeryLazy",
    config = true,
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle()
        end,
        desc = "Dap UI",
      },
    },
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
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
    "meow-d/Comment.nvim",
    -- forked from:
    -- "numToStr/Comment.nvim",
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

  { "ku1ik/vim-pasta", lazy = false },

  -- navigation
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      -- translucent window
      defaults = { winblend = 30 },
      extensions = {
        smart_open = {
          match_algorithm = "fzf",
        },
      },
    },
  },

  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    config = function()
      require("telescope").load_extension "smart_open"
    end,
    dependencies = {
      "kkharji/sqlite.lua",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
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
      code = {
        border = "thin",
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

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-treesitter/nvim-treesitter",
    },

    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      -- weird defaults
      legacy_commands = false,
      frontmatter = { enabled = false },
      checkbox = {
        create_new = false,
        order = { " ", "x" },
      },

      -- workspace configs
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

      -- others
      ui = { enable = false },
      footer = {
        separator = "",
        format = "({{backlinks}} backlinks)",
      },
    },
  },
}
