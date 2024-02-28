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
  -- webdev
  eslint, -- Use ESLint or tsserver based on the condition
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
