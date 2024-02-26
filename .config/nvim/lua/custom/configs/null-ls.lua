local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {
  -- webdev
  b.formatting.deno_fmt,
  b.formatting.prettier.with {
    filetypes = {
      "html",
      "markdown",
      "css",
      "json",
      "scss",
      "less",
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "json",
      "jsonc",
      "typescript",
      "typescript.tsx",
      "typescriptreact",
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
