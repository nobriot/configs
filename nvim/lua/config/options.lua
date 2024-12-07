-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
vim.api.nvim_create_autocmd("Filetype", { pattern = "rust", command = "set colorcolumn=100" })

--
-- Decrease update time
vim.opt.timeoutlen = 500
vim.opt.updatetime = 200

-- Number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 12

-- Better editor UI
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes:2"
vim.opt.cursorline = true

-- Better editing experience
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.cindent = true
vim.opt.autoindent = true
vim.opt.wrap = true
vim.opt.textwidth = 300
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.softtabstop = -1 -- If negative, shiftwidth value is used
vim.opt.list = true
vim.opt.listchars = "tab:^ ,nbsp:¬,extends:»,precedes:«,trail:•"

-- Makes neovim and host OS clipboard play nicely with each other
vim.opt.clipboard = "unnamedplus"

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Remember 50 items in commandline history
vim.opt.history = 50

-- Better buffer splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preserve view while jumping
vim.opt.jumpoptions = "view"

-- Stable buffer content on window open/close events.
vim.opt.splitkeep = "screen"

-- Improve diff
vim.opt.diffopt:append("linematch:60")

-- Smooth scrolling
vim.opt.smoothscroll = true

-- Supposed to be used to opt out of files types with completion
vim.g.copilot_filetypes = "{ '*': v:true,  'python': v:true  }"
