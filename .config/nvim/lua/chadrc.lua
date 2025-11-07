-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "pastelDark",
  transparency = true,

  hl_add = {
    RenderMarkdownH1Bg = { bg = "#744955" },
    RenderMarkdownH2Bg = { bg = "#744955" },
    RenderMarkdownH3Bg = { bg = "#744955" },
    RenderMarkdownH4Bg = { bg = "#744955" },
    RenderMarkdownH5Bg = { bg = "#744955" },
    RenderMarkdownH6Bg = { bg = "#744955" },
  },

  ---@diagnostic disable
  changed_themes = {
    pastelDark = {
      base_16 = {
        base02 = "#733B4B",
      },
      base_30 = {
        grey = "#575E66",
        grey_fg = "#888888",
        light_grey = "#888888",
        line = "#575E66",
      },
    },
  },
  ---@diagnostic disable
}

M.ui = {
  -- tabufline = { enabled = false },
  -- statusline = { theme = "vscode_colored" },
  cmp = { style = "default" },
}

return M
