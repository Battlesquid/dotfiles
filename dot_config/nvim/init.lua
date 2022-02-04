local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug ('ryanoasis/vim-devicons')
Plug ('nvim-lua/plenary.nvim')
Plug ('nvim-telescope/telescope.nvim')
Plug ('glepnir/dashboard-nvim')
Plug ('ms-jpq/chadtree', {
	branch = 'chad', 
	['do'] = function()
		vim.cmd('python3 -m chadtree deps')
	end
})
Plug ('glepnir/galaxyline.nvim')
Plug ('airblade/vim-gitgutter')
Plug ('kvrohit/substrata.nvim')
Plug ('karb94/neoscroll.nvim')
Plug ('Xuyuanp/scrollbar.nvim')
Plug ('wfxr/minimap.vim')

Plug ('rebelot/kanagawa.nvim')
vim.call('plug#end')

vim.opt.cursorline = true
vim.cmd [[
	colorscheme substrata
	set number
]]

require('statusline')
