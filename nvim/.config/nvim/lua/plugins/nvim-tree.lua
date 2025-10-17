return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		hijack_netrw = false,
		update_focused_file = {
			enable = true,
		},
		filters = {
			custom = {
				"^\\.git$",
			},
		},
		view = { width = { min = "25%", max = "25%" } },
	},
	keys = {
		{
			"<leader>e",
			":NvimTreeFocus<CR>",
			mode = "n",
			desc = "Focus NvimTree",
		},
		{
			"<leader>h",
			":NvimTreeToggle<CR>",
			mode = "n",
			desc = "Toogle NvimTree",
		},
	},
}
