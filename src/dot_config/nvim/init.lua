local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug ('ryanoasis/vim-devicons')
Plug ('kyazdani42/nvim-web-devicons')

Plug ('nvim-lua/plenary.nvim')
Plug ('nvim-telescope/telescope.nvim')
Plug ('ms-jpq/chadtree', {
	branch = 'chad', 
	['do'] = function()
		vim.cmd('python3 -m chadtree deps')
	end
})
Plug ('airblade/vim-gitgutter')
Plug ('folke/tokyonight.nvim', { branch = 'main' })
Plug ('nvim-lualine/lualine.nvim')
Plug ('romgrk/barbar.nvim')

Plug ('eraserhd/parinfer-rust', { ['do'] = function()
		vim.cmd('cargo build --release')
	end
})
Plug ('elkowar/yuck.vim')

vim.call('plug#end')

vim.g.tokyonight_style = "night"

vim.opt.cursorline = true
vim.cmd [[
	colorscheme tokyonight 
	set number
	set mouse+=a
]]

require('statusline')
require('barbar-keybinds')
