vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

	-- Packer
	use 'wbthomason/packer.nvim'

	-- gc to comment stuff
	use "tpope/vim-commentary"

	-- Auto pairs () {} []
	use "jiangmiao/auto-pairs"

	-- auto-completion engine
	use "neovim/nvim-lspconfig"
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
			-- "SirVer/ultisnips", "quangnguyen30192/cmp-nvim-ultisnips",
			"hrsh7th/cmp-vsnip", "hrsh7th/vim-vsnip",
			'hrsh7th/cmp-nvim-lua','octaltree/cmp-look',
			'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
			'f3fora/cmp-spell', 'hrsh7th/cmp-emoji'
		}
	}

	-- Status bar
	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	-- Highlight search +
	use {'kevinhwang91/nvim-hlslens'}

	-- Fuzzy search
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Theme
	use({"lifepillar/vim-gruvbox8", opt = true})
	-- jj to escape without delays
	use {'jdhao/better-escape.vim', event = 'InsertEnter'}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use { 'phaazon/hop.nvim' }

	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		}
	}

	use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

	use "Pocco81/TrueZen.nvim"

	use "rafamadriz/friendly-snippets"

	-- Git stuff
	use {
		'lewis6991/gitsigns.nvim',
	}

	use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

	-- Code action stuff
	use {
		'jose-elias-alvarez/null-ls.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

end)
