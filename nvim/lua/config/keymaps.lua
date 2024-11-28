-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Some keymaps
vim.api.nvim_set_keymap("n", "<F2>", ':echo "hello"<cr>', { noremap = true })

-- I do not like macros, I like visual blocks instead
vim.keymap.set("n", "q", "<C-Q>")
vim.keymap.set("n", "<C-Q>", "q")
vim.keymap.set("n", "*", "*zz", { desc = "Search and center screen" })
vim.keymap.set("n", "<Leader>w", ":write<CR>")

-- Navigation
vim.keymap.set("", "H", "^")
vim.keymap.set("", "L", "$")

vim.keymap.set("n", "<left>", ":bp<cr>")
vim.keymap.set("n", "<right>", ":bn<cr>")

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Enter makes new lines
vim.keymap.set("n", "<CR>", "o<Esc>", { noremap = true })

-- Quick global substitution
vim.keymap.set("n", "S", "ggVG:s/", { noremap = true })
