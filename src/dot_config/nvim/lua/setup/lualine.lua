require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
		disabled_filetypes = { 'packer', 'NvimTree', 'term' },
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
			'branch', 
			'diff', 
			{
				'diagnostics',
				symbols = {
					error = ' ',
					warn = ' ',
					info = ' ',
					hint = ' '
				},
				update_in_insert = true
			}
		},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {
		'toggleterm',
		'nvim-tree'
	}
}
