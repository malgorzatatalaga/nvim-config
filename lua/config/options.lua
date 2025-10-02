-- Options are automatically loaded before lazy.nvim startup

vim.cmd("let g:netrw_liststyle = 3")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- split windows
opt.splitright = true
opt.splitbelow = true
