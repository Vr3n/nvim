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
vim.opt.scrolloff = 8
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

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
})

require("indent_blankline").setup({
	show_current_context = true,
	show_current_context_start = true,
	show_end_of_line = true,
	space_char_blankline = " ",
})
