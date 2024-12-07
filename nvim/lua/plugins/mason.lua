return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "ruff-lsp",
        "pyright",
        "black",

        -- lua
        "lua-language-server",
        "stylua",

        -- shell
        "shellcheck",
        "shfmt",

        -- docker
        "dockerfile-language-server",

        -- PHP / HTML
        "html-lsp",
        "phpactor",

        -- JSON
        "jq",

        -- javascript/typescript
        "prettierd",
        "typescript-language-server",
        "eslint-lsp",

        -- rust
        "rustfmt",
        "rust-analyzer",
      },
    },
  },
}
