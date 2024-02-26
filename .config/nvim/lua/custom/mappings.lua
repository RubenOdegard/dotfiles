---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    -- ["<leader>bf"] = { ":silent !biome format --write %<CR>", "run Biome formatter and write changes" },
    -- Make current file executeable
    ["<leader>zx"] = {
      "<cmd>!chmod +x %<CR>",
      silent = true,
    },
  },
  v = {
    [">"] = { ">gv", "indent" },

    ["<C-j>"] = { "<cmd> :m '>+1<CR>gv=gv<CR>", "move selection down" },
    ["<C-k>"] = { "<cmd> :m '<-2<CR>gv=gv<CR>", "move selection up" },
  },
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  },
}

-- enable format on save for all filetypes
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- enable format on save for go
vim.cmd [[
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
]]

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
augroup END
]]

-- adjust scroll height to 1/3, not a 1/2
vim.cmd [[
augroup set_scroll
      au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scroll=winheight(win_getid())/3
augroup END
]]
return M
