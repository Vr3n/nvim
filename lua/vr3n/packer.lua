return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Color Scheme (Tokyo night)
  use 'folke/tokyonight.nvim'

  -- Color scheme (vscode)
  use 'Mofiqul/vscode.nvim'

  -- Telescope (Navigation)
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } }
  use { 'BurntSushi/ripgrep' }

  use { 'kyazdani42/nvim-web-devicons' }

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Nvim Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate", }

  -- nvim-tree
  use { 'nvim-tree/nvim-web-devicons' }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- lsp config
  use 'neovim/nvim-lspconfig'

  -- mason (For lsp server installations)
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }

  -- nvim - cmp
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { "hrsh7th/nvim-cmp" }

  -- lua snip
  use {"L3MON4D3/LuaSnip"}
  use { 'saadparwaiz1/cmp_luasnip' }
  -- friendly snippets.
  use "rafamadriz/friendly-snippets"


  -- lspkind
  use { "onsails/lspkind.nvim" }

  -- comment
  use { "numToStr/Comment.nvim" }

  -- java lsp
  use { 'mfussenegger/nvim-jdtls' }

end)