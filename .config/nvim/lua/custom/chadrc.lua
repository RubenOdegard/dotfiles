---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "chadracula",
  theme_toggle = { "chadracula", "one_light" },
  telescope = { style = "bordered" }, -- borderless / bordered}
  nvdash = { -- Dashboard
    load_on_startup = true,
  },
  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
  tabufline = {
    lazyload = true,
  },
  statusline = {
    theme = "vscode_colored",
    separator_style = "default",
    overriden_modules = nil,
  },
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "flat_light", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
