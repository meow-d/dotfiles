-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "blossom_light",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  hl_add = {
    RenderMarkdownH1Bg = {
      bg = "#eeeeee",
    },
    RenderMarkdownH2Bg = {
      bg = "#eeeeee",
    },
    RenderMarkdownH3Bg = {
      bg = "#eeeeee",
    },
    RenderMarkdownH4Bg = {
      bg = "#eeeeee",
    },
    RenderMarkdownH5Bg = {
      bg = "#eeeeee",
    },
    RenderMarkdownH6Bg = {
      bg = "#eeeeee",
    },
  },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
