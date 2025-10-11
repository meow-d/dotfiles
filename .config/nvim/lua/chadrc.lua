-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "pastelDark",
  transparency = true,
  -- "#2e2c2f"

  hl_override = {
    Comment = { italic = true, fg = "#888888" },
    ["@comment"] = { italic = true, fg = "#888888" },
  },
  hl_add = {
    RenderMarkdownH1Bg = { bg = "#555555" },
    RenderMarkdownH2Bg = { bg = "#555555" },
    RenderMarkdownH3Bg = { bg = "#555555" },
    RenderMarkdownH4Bg = { bg = "#555555" },
    RenderMarkdownH5Bg = { bg = "#555555" },
    RenderMarkdownH6Bg = { bg = "#555555" },
  },
}

M.ui = {
  tabufline = {
    -- enabled = false
  },

  statusline = {
    theme = "vscode_colored"
  }
}

return M
