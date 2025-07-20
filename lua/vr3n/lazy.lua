-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

local plugins = {

	-- Color Scheme Tokyo night
	"folke/tokyonight.nvim",

	-- Color Scheme AYU
	{ "Shatur/neovim-ayu" },

	-- color scheme Vscode
	{ "Mofiqul/vscode.nvim" },

	"navarasu/onedark.nvim",

	{
		"windwp/nvim-autopairs",
	},

	{
		"windwp/nvim-ts-autotag",
	},

	-- Telescope Navigation
	{ "nvim-telescope/telescope.nvim", dependencies = { { "nvim-lua/plenary.nvim" } } },
	{ "BurntSushi/ripgrep" },
	"ThePrimeagen/harpoon",
	"mbbill/undotree",

	{ "kyazdani42/nvim-web-devicons" },

	-- lualine
	{
		"nvim-lualine/lualine.nvim",
	},

	-- Nvim Treesitter
	{ "nvim-treesitter/nvim-treesitter" },
	{ "nvim-treesitter/playground" },

	-- nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- lazyional, for file icons
		},
	},

	"neovim/nvim-lspconfig",

	-- mason For lsp server installations
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	-- nvim dap.
	{ "nvim-neotest/nvim-nio" },
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui" },
	{ "theHamsta/nvim-dap-virtual-text" },
	{ "nvim-telescope/telescope-dap.nvim" },
	"mfussenegger/nvim-dap-python",

	-- nvim - cmp
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },

	-- lua snip
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{ "saadparwaiz1/cmp_luasnip" },
	-- friendly snippets.
	"rafamadriz/friendly-snippets",

	-- lspkind
	{ "onsails/lspkind.nvim" },

	-- comment
	{ "numToStr/Comment.nvim" },

	-- java lsp
	{ "mfussenegger/nvim-jdtls" },

	-- Adds extra functionality over rust analyzer
	"simrat39/rust-tools.nvim",

	-- vim surround
	{ "tpope/vim-surround" },

	-- git fugitive
	{ "tpope/vim-fugitive" },

	-- Easy motion.
	{ "easymotion/vim-easymotion" },

	-- Signify
	{ "mhinz/vim-signify" },

	-- toggleterm
	{ "akinsho/toggleterm.nvim", version = "*" },

	-- versionbar
	{ "preservim/tagbar" },

	-- nvim-linter
	{ "nvimtools/none-ls.nvim" },
	{ "jayp0521/mason-null-ls.nvim" },

	-- nvim exrc
	"MunifTanjim/exrc.nvim",

	-- vim-prisma
	"prisma/vim-prisma",

	-- notify
	"rcarriga/nvim-notify",

	-- magma python.
	{ "dccsillag/magma-nvim", build = ":UpdateRemotePlugins" },

	"lukas-reineke/indent-blankline.nvim",

	"ray-x/go.nvim",
	"ray-x/guihua.lua", -- recommended if need floating window support

	"nvim-neotest/nvim-nio",

	{ "christoomey/vim-tmux-navigator", lazy = false },
}

opts = {
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
}

-- Setup lazy.nvim
require("lazy").setup(plugins, opts)
