local null_ls = require "null-ls"

local b = null_ls.builtins

-- Define ESLint formatting source
local eslint = b.formatting.eslint_d.with {
  condition = function(utils)
    -- Check if ESLint configuration file exists in the current directory
    local eslint_exists = utils.root_has_file ".eslintrc.json"
      or utils.root_has_file ".eslintrc.js"
      or utils.root_has_file ".eslint.json"
      or utils.root_has_file ".eslint.js"

    -- Check if tsconfig.json exists in the current directory
    local tsconfig_exists = utils.root_has_file "tsconfig.json"

    -- Use ESLint if available
    if eslint_exists then
      return true
    else
      -- Use tsserver if no ESLint configuration file exists and tsconfig.json exists
      return tsconfig_exists
    end
  end,
}

local sources = {
  eslint,
  -- b.formatting.deno_fmt,
  b.formatting.rome.with {
    command = "biome",
    filetypes = {
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
