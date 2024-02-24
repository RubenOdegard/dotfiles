-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
--

-- Enable relative numbers by default
vim.opt.relativenumber = true

-- Set how manu lines to be visible below current line when scrolling
vim.opt.scrolloff = 15

-- Cursorline on normal mode
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    vim.opt.cursorline = true -- true
  end,
})

-- No Cursorline in insert mode
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    vim.opt.cursorline = false
  end,
})

-- Blinking cursor
vim.o.guicursor = table.concat({
  "n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100",
}, ",")
