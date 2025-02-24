return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",

    opts = {
      overrides = {
        -- ["@lsp.type.method"] = { bg = "#ff9900" },
        ["@comment.lua"] = { bg = "#000000", undercurl = true },
      },
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
