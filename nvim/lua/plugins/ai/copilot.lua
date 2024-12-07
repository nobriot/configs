return {
  "github/copilot.vim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<leader>cp", "<cmd>Copilot panel<cr>", desc = "Copilot Panel" },
  },
}

-- return {
--   "zbirenbaum/copilot.lua",
--   cmd = "Copilot",
--   build = ":Copilot auth",
--   event = "InsertEnter",
--   opts = {
--     suggestion = {
--       enabled = not vim.g.ai_cmp,
--       auto_trigger = true,
--       keymap = {
--         jump_prev = "<C-p>",
--         jump_next = "<C-n>",
--         accept = "<CR>",
--         refresh = "gr",
--         open = "<C-CR>",
--       },
--       layout = {
--         position = "bottom", -- | top | left | right | horizontal | vertical
--         ratio = 0.4,
--       },
--     },
--     panel = { enabled = false },
--     filetypes = {
--       markdown = true,
--       help = true,
--       ["*"] = true,
--     },
--   },
-- }
