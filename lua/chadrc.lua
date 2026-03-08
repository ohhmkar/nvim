---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  transparency = false,
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.ui = {
  cmp = { icons_left = true, style = "flat" },
  telescope = { style = "bordered" },
  statusline = {
    theme = "vscode_colored",
    separator_style = "round",
  },
  tabufline = {
    enabled = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
  },
}

return M
