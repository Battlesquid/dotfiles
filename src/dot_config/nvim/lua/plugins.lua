vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd [[packadd packer.nvim]]
end

vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath

local function setup(name)
	return string.format('require("setup.%s")', name)
end

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' 

	use 'famiu/nvim-reload' 

	use 'tpope/vim-surround'

	use 'preservim/nerdcommenter'

	use {
		"akinsho/toggleterm.nvim", 
		tag = 'v2.*', 
		config = setup("toggleterm")
	}
	
	use { 
		'folke/tokyonight.nvim',
		branch = 'main'
	}

	use { 'ryanoasis/vim-devicons' }

	use {
		'nvim-lualine/lualine.nvim',
		config = setup("lualine"),
		requires = {
			'kyazdani42/nvim-web-devicons',
			{
				'kyazdani42/nvim-tree.lua',
				config = setup("nvimtree")
			},
			{
				'romgrk/barbar.nvim',
				config = setup("barbar")
			}
		}
	}

	use {
		'nvim-telescope/telescope.nvim', 
		tag = '0.1.0',
		config = setup("telescope"),
		requires = { 'nvim-lua/plenary.nvim' }
	}

	use {
		'airblade/vim-gitgutter',
		branch = 'main'
	}

	use {
		'lukas-reineke/indent-blankline.nvim',
		config = setup("indent-blankline")
	}

	use {
		'neovim/nvim-lspconfig',
		config = setup("lspconfig")
	}

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use {
		'hrsh7th/nvim-cmp',
		config = setup("nvim-cmp")
	}

	use {
		'L3MON4D3/LuaSnip',
		config = setup("luasnip")
	}
	use "rafamadriz/friendly-snippets"

	use { 
		'nvim-treesitter/nvim-treesitter', 
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
		config = setup("treesitter")
	}

	use { 
		'elkowar/yuck.vim',
		requires =  {
			{
				'eraserhd/parinfer-rust',
				run = "cargo build --release && cargo install"
			} 
		}
	}

	use { 
		'andweeb/presence.nvim',
		config = setup("discord_presence")
	}

	use {
		'NvChad/nvim-colorizer.lua',
		config = setup("colorizer")
	}

	use {
		'ahmedkhalf/project.nvim',
		config = setup("projectnvim")
	}

	use 'mfussenegger/nvim-jdtls'

	use { 
		'folke/trouble.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	}
end)
