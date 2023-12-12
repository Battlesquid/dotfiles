require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = false,
	},
	respect_buf_cwd = true,
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = false,
		full_name = false,
		highlight_opened_files = "none",
		root_folder_modifier = ":~",
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				none = " ",
			},
		}
	}
})

local nvim_tree_events = require('nvim-tree.events')
local barbar_api = require('barbar.api')

local function get_tree_size()
	return require'nvim-tree.view'.View.width + 1
end

nvim_tree_events.subscribe('TreeOpen', function()
	barbar_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function(cols)
	barbar_api.set_offset(cols + 1)
end)

nvim_tree_events.subscribe('TreeClose', function()
	barbar_api.set_offset(0)
end)
