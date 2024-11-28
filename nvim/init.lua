-- leader is the space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.env.FZF_DEFAULT_OPTS = "--layout=reverse"

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
