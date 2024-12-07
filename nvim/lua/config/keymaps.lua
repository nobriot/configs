-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<F2>", "i🙂<Esc>", { noremap = true })

-- I do not like macros, I like visual blocks instead
vim.keymap.set("n", "q", "<C-Q>")
vim.keymap.set("n", "Q", "q")
vim.keymap.set("n", "<Leader>ww", ":write<CR>", { silent = true, desc = "Save current buffer" })
vim.keymap.set("n", "<Leader>wa", ":wa<CR>", { silent = true, desc = "Save all buffers" })

-- Search
vim.keymap.set("n", "*", "*zz", { silent = true, desc = "Search current and center screen" })
vim.keymap.set("n", "n", "nzz", { silent = true, desc = "Next match and center screen" })
vim.keymap.set("n", "N", "Nzz", { silent = true, desc = "Previous match center screen" })

-- Quick insertions
vim.keymap.set("n", "æ", "a{}<Esc>", { silent = true, desc = "Insert curlies" })
vim.keymap.set("n", "Æ", "a[]<Esc>", { silent = true, desc = "Insert square brackets" })
vim.keymap.set("n", "ø", "a -> <Esc>", { silent = true, desc = "Insert a return type" })
vim.keymap.set("n", "Å", "{", { silent = true, desc = "Move to next paragraph" })
vim.keymap.set("n", "å", "}", { silent = true, desc = "Move to previous paragraph" })
vim.keymap.set("n", "<leader>a", "A;<Esc>", { silent = true, desc = "Insert ; at the end of the line" })
vim.keymap.set("i", "<C-i>", 'copilot#Accept("\\<cr>")', { expr = true, replace_keycodes = false })

-- Navigation
vim.keymap.set("", "H", "^", { desc = "End of line" })
vim.keymap.set("", "L", "$", { desc = "Start of line" })

vim.keymap.set("n", "<left>", ":bp<cr>", { silent = true })
vim.keymap.set("n", "<right>", ":bn<cr>", { silent = true })

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Yanking
vim.keymap.set("n", "yu", 'yt"', { desc = "Yank til next quotes" })
vim.keymap.set("n", "yU", 'yT"', { desc = "Yank til previous quotes" })

-- Deleting
vim.keymap.set("n", "du", 'dt"', { desc = "Delete til next quotes" })
vim.keymap.set("n", "dU", 'dT"', { desc = "Delete til previous quotes" })

-- Changing
vim.keymap.set("n", "cu", 'ct"', { desc = "Change til next quotes" })
vim.keymap.set("n", "cU", 'ct"', { desc = "Change til previous quotes" })

-- Enter makes new lines
vim.keymap.set("n", "<CR>", "o<Esc>", { noremap = true, desc = "Enter makes new lines" })

-- I can't hit ` on my danish keyboard, remap leader-m to navigate to a marks
vim.keymap.set("n", "<leader>m", "`", { desc = "Go to mark" })

-- Substitutions
vim.keymap.set("v", "u", "~", { noremap = true, desc = "Switch case" })
vim.keymap.set("n", "S", "ggVG:s/", { noremap = true, desc = "Global substitution" })
