vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt
opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.autoindent = true

opt.wrap = true

-- search
opt.ignorecase = true
opt.smartcase = true
