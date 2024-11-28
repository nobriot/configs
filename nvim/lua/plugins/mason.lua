return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- python
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
