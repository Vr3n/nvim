vim.o.background = "dark"
vim.g.transparent_background = true

local c = require("vscode.colors")
require("vscode").setup({
	-- Enable transparent background
	transparent = true,

	-- Enable italic comment
	italic_comments = true,

	-- Disable nvim-tree background color
	disable_nvimtree_bg = true,

	-- Override highlight groups (see ./lua/vscode/theme.lua)
	group_overrides = {
		-- this supports the same val table as vim.api.nvim_set_hl
		-- use colors from this colorscheme by requiring vscode.colors!
		Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
	},
})

require("lualine").setup({
	options = { theme = "vscode" },
})

-- Signify ColorScheme changes.
vim.cmd([[
    highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
    highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
    highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE
]])

-- Vim indent colors
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])

require("indent_blankline").setup({
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	},
})
