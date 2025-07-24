return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {},
	keys = {
		--{
		--	"<leader>e",
		--	":NvimTreeToggle<CR>",
		--	mode = "n",
		--	desc = "Toggle NvimTree",
		--},
		{
			"<leader>e",
			":NvimTreeFocus<CR>",
			mode = "n",
			desc = "Focus NvimTree",
		},
	},
}
