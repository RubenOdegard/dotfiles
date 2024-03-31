local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {
  b.formatting.deno_fmt,
  b.formatting.rome.with {
    command = "biome",
    filetypes = {
      "html",
      "markdown",
      "css",
      "json",
      "scss",
      "less",
      "json",
      "jsonc",
      "typescript",
      "typescript.tsx",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      "javascript.jsx",
    },
  },
  b.formatting.prettier.with {
    filetypes = {
      "html",
      "markdown",
      "css",
      "json",
      "scss",
      "less",
      "json",
      "jsonc",
      -- "typescript",
      -- "typescript.tsx",
      -- "typescriptreact",
      -- "javascript",
      -- "javascriptreact",
      -- "javascript.jsx",
    },
  },
  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- python
  b.formatting.black,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
