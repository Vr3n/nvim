vim.g.mapleader = " "

vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i:ver80"

if vim.fn.has("win32") == 1 then
	local powershell_executable = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell"

	vim.opt.shell = powershell_executable
	vim.opt.shellcmdflag =
		"-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;$PSStyle.Formatting.Error = '';$PSStyle.Formatting.ErrorAccent = '';$PSStyle.Formatting.Warning = '';$PSStyle.OutputRendering = 'PlainText';"
	vim.opt.shellredir = "2>&1 | Out-File -Encoding utf8 %s; exit $LastExitCode"
	vim.opt.shellpipe = "2>&1 | Out-File -Encoding utf8 %s; exit $LastExitCode"
	vim.opt.shellquote = ""
	vim.opt.shellxquote = ""
end

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
vim.opt.signcolumn = "yes"

vim.cmd([[
    set splitbelow
    set splitright
]])

vim.filetype.add({
	extension = {
		svelte = "svelte",
	},
})
