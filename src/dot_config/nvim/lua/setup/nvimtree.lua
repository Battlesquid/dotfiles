require("nvim-tree").setup({
	sort_by = "case_sensitive",
	open_on_tab = true,
	open_on_setup = true,
	open_on_setup_file = true,
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
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
local bufferline_state = require('bufferline.state')

local function get_tree_size()
	return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
	bufferline_state.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
	bufferline_state.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
	bufferline_state.set_offset(0)
end)
