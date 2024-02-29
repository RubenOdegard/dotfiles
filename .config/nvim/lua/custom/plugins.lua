local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    {
      "windwp/nvim-ts-autotag",
      dependencies = "nvim-treesitter/nvim-treesitter",
      config = function()
        require("nvim-ts-autotag").setup {
          -- your config
        }
      end,
      lazy = true,
      event = "VeryLazy",
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
  },

  -- Trouble, better error and linting - projectwide
  -- Github: https://github.com/folke/trouble.nvim
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  -- Better-escape, escape insert mode quicker
  -- Github: https://github.com/max397574/better-escape.nvim
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- Easier edits on words, surround with tags.
  -- Github: https://github.com/kylechui/nvim-surround
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    ft = { "markdown", "lua", "javascript", "typescript", "typescriptreact", "javascriptreact", "html", "css", "astro" },
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  -- Markdown preview, opens a live view preview of markdown files
  -- Github: https://github.com/iamcco/markdown-preview.nvim
  {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    run = "cd app && pnpm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  -- Zen mode, get rid of distactions and isolate code
  -- Github: https://github.com/folke/zen-mode.nvim
  {
    "folke/zen-mode.nvim",
    lazy = false,
    opts = {
      plugins = {
        twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
      },
    },
  },

  -- Twilight, dims part of the screen thats not in use with Zen Mode.
  -- Github: https://github.com/folke/twilight.nvim
  {
    "folke/twilight.nvim",
    opts = {
      dimming = {
        alpha = 0.05, -- amount of dimming
        -- we try to get the foreground from the highlight groups or fallback color
        color = { "Normal", "#ffffff" },
        term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
        inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
      },
      context = 20, -- amount of lines we will try to show around the current line
      treesitter = true, -- use treesitter when available for the filetype
      -- treesitter is used to automatically expand the visible text,
      -- but you can further control the types of nodes that should always be fully expanded
      expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
        "function",
        "method",
        "table",
        "if_statement",
      },
      exclude = {}, -- exclude these filetypes
    },
  },

  -- Ts-context-commentstring, enabled comments in typescript files
  -- Works together with comment.nvim
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
    config = function()
      require("ts_context_commentstring").setup {
        enable_autocmd = false,
      }
    end,
  },

  -- Tailwindcss-colors, shows the actual color of the tailwind color presets
  -- Github: https://github.com/themaxmarchuk/tailwindcss-colors.nvim
  {
    "themaxmarchuk/tailwindcss-colors.nvim",
    dependencies = "neovim/nvim-lspconfig",
    ft = {
      "aspnetcorerazor",
      "astro",
      "astro-markdown",
      "blade",
      "clojure",
      "django-html",
      "htmldjango",
      "edge",
      "eelixir",
      "elixir",
      "ejs",
      "erb",
      "eruby",
      "gohtml",
      "haml",
      "handlebars",
      "hbs",
      "html",
      "html-eex",
      "heex",
      "jade",
      "leaf",
      "liquid",
      "markdown",
      "mdx",
      "mustache",
      "njk",
      "nunjucks",
      "php",
      "razor",
      "slim",
      "twig",
      "css",
      "less",
      "postcss",
      "sass",
      "scss",
      "stylus",
      "sugarss",
      "javascript",
      "javascriptreact",
      "reason",
      "rescript",
      "typescript",
      "typescriptreact",
      "vue",
      "svelte",
    },
  },

  -- Tailwind-sorter, Auto sorts tailwind css tags
  -- Github: https://github.com/laytan/tailwind-sorter.nvim
  {
    "laytan/tailwind-sorter.nvim",
    lazy = false,
    opts = {
      on_save_enabled = true,
      on_save_pattern = { "*.html", "*.js", "*.jsx", "*.tsx", "*.twig", "*.hbs", "*.php", "*.heex", "*.astro" },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
    build = "cd formatter && npm i && npm run build",
    config = true,
  },

  -- Codeium, Ai code generation - free alternative to Github Copilot
  -- Github: https://github.com/Exafunction/codeium.vim
  {
    "Exafunction/codeium.vim",
    lazy = false,
    codeium_enabled = false,
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, silent = true })
    end,
  },

  -- Todo-comments - Adds todo comments
  -- Github: https://github.com/folke/todo-comments.nvim
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
