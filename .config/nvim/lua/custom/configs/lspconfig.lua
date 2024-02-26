local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "tsserver", "clangd", "pyright", "tailwindcss" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Golang LSP setup
lspconfig.gopls.setup {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
}

-- TypeScript LSP setup
lspconfig.tsserver.setup {
  settings = {
    ["typescript"] = {
      compilerOptions = {
        strict = true,
        noImplicitAny = true,
        strictNullChecks = true,
        strictFunctionTypes = true,
        strictPropertyInitialization = true,
        noImplicitThis = true,
        alwaysStrict = true,
      },
    },
    ["typescript.tsx"] = {
      compilerOptions = {
        jsx = "react",
      },
    },
  },
}
