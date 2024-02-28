local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local null_ls = require "null-ls"

-- Function to set up null-ls sources for ESLint and Prettier
local setup_null_ls_sources = function()
  local eslint = require("null-ls").builtins.formatting.eslint_d
  local prettier = require("null-ls").builtins.formatting.prettier

  -- Check if ESLint and Prettier configurations exist in the project
  local eslint_exists = vim.fn.filereadable ".eslintrc.js" == 1
  local prettier_exists = vim.fn.filereadable ".prettierrc" == 1 or vim.fn.filereadable "prettierrc.js" == 1

  local sources = {}

  -- Add ESLint source if ESLint config exists
  if eslint_exists then
    table.insert(sources, eslint)
  end

  -- Add Prettier source if Prettier config exists
  if prettier_exists then
    table.insert(sources, prettier)
  end

  return sources
end

-- Configure null-ls with ESLint and Prettier sources
null_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  sources = setup_null_ls_sources(),
}

-- Configure TSServer directly
lspconfig.tsserver.setup {
  on_attach = function(client)
    -- Disable document formatting provider for TSServer
    -- to prevent it from formatting ts/js files
    client.server_capabilities.documentFormattingProvider = false
    on_attach(client)
  end,
  capabilities = capabilities,
}

-- Other LSP servers setup
local servers = { "html", "cssls", "clangd", "pyright", "tailwindcss" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
