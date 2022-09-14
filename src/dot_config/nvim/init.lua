require('plugins')

vim.g.tokyonight_style = "night"

vim.opt.cursorline = true
vim.cmd [[
	colorscheme tokyonight
	set number
	set mouse+=a
	set ts=2 sw=2
]]
-- require'lspconfig'.pyright.setup{}
