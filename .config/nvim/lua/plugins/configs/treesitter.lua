local options = {
  ensure_installed = {
    -- defaults
    "vim",
    "lua",

    -- web dev
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "json",
    -- "vue", "svelte",

    -- low level
    "c",
    "zig",

    -- rust
    "rust",

    -- go
    "go",

    -- misc
    "markdown",
    "markdown_inline",

    -- python
    "python",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options
