local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Color Scheme (Tokyo night)
	use("folke/tokyonight.nvim")

	-- Color Scheme (AYU)
	use({ "Shatur/neovim-ayu" })

	-- color scheme (Vscode)
	use({ "Mofiqul/vscode.nvim" })

	use("navarasu/onedark.nvim")

	use({
		"windwp/nvim-autopairs",
	})

	use({
		"windwp/nvim-ts-autotag",
	})

	-- Telescope (Navigation)
	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
	use({ "BurntSushi/ripgrep" })
	use("ThePrimeagen/harpoon")
	use("mbbill/undotree")

	use({ "kyazdani42/nvim-web-devicons" })

	-- lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Nvim Treesitter
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "nvim-treesitter/playground" })

	-- nvim-tree
	use({ "nvim-tree/nvim-web-devicons" })
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- lsp config
	use("neovim/nvim-lspconfig")

	-- mason (For lsp server installations)
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })

	-- nvim dap.
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui" })
	use({ "theHamsta/nvim-dap-virtual-text" })
	use({ "nvim-telescope/telescope-dap.nvim" })
	use("mfussenegger/nvim-dap-python")

	-- nvim - cmp
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/nvim-cmp" })

	-- lua snip
	use({
		"L3MON4D3/LuaSnip",
		tag = "v2.*",
		run = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
	})
	use({ "saadparwaiz1/cmp_luasnip" })
	-- friendly snippets.
	use("rafamadriz/friendly-snippets")

	-- lspkind
	use({ "onsails/lspkind.nvim" })

	-- comment
	use({ "numToStr/Comment.nvim" })

	-- java lsp
	use({ "mfussenegger/nvim-jdtls" })

	-- Adds extra functionality over rust analyzer
	use("simrat39/rust-tools.nvim")

	-- vim surround
	use({ "tpope/vim-surround" })

	-- git fugitive
	use({ "tpope/vim-fugitive" })

	-- Easy motion.
	use({ "easymotion/vim-easymotion" })

	-- Signify
	use({ "mhinz/vim-signify" })

	-- toggleterm
	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- tagbar
	use({ "preservim/tagbar" })

	-- nvim-linter
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "jayp0521/mason-null-ls.nvim" })

	-- nvim exrc
	use("MunifTanjim/exrc.nvim")

	-- vim-prisma
	use("prisma/vim-prisma")

	-- notify
	use("rcarriga/nvim-notify")

	-- magma python.
	use({ "dccsillag/magma-nvim", run = ":UpdateRemotePlugins" })

	use("lukas-reineke/indent-blankline.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
