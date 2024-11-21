vim.g.mapleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.incsearch = true

vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 10
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.list = true
vim.opt.listchars:append("eol:↴")

vim.opt.updatetime = 250
vim.opt.signcolumn = 'yes'

vim.cmd([[
    set splitbelow
    set splitright
]])

