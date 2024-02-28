local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "jsx",
    "tsx",
    "c",
    "py",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- Lua
    "lua-language-server",
    "stylua",
    -- Web Dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    -- c/cpp
    "clangd",
    "clang-format",
    -- Go
    "gopls",
    "golangci-lint",
    "golines",
    "goimports_reviser",
    -- custom
    "tailwindcss",
    --"biome", -- can be enabled for alternative formatting, check docs.
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.blankline = {
  show_current_context_start = false, -- true
}

return M
