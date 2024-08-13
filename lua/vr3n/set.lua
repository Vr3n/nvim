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

require("exrc").setup({
    files = {
        ".nvimrc.lua",
        ".nvimrc",
        ".exrc.lua",
        ".exrc",
    },
})

require("Comment").setup({
    opleader = {
        -- line-comment keymap
        line = "gc",
        -- block comment keymap.
        block = "gb",
    },
})


require("nvim-tree").setup({
    view = {
        adaptive_size = true,
    },
    git = {
        ignore = false,
    },
})

require("ibl").setup({})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function() vim.highlight.on_yank() end,
})
