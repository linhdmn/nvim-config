vim.opt.guicursor = ""
-- vim.opt.rnu = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.wo.number = true

local opt = vim.opt
opt.colorcolumn = "120"
opt.autoindent = true
opt.showtabline = 2
opt.smarttab = true
opt.softtabstop = 4
opt.tabstop = 4
opt.wrap = false
opt.signcolumn = "yes"
opt.showmode = false
opt.smartindent = true
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undodir = "./undodir"
opt.undofile = true
opt.hlsearch = false
opt.incsearch = true
opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.updatetime = 50

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting


