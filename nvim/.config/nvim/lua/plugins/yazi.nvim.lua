---@type LazySpec
return {
	"mikavilpas/yazi.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		{
			"<leader>-",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			-- Open in the current working directory
			"<leader>cw",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in nvim's working directory",
		},
		{
			"<c-up>",
			"<cmd>Yazi toggle<cr>",
			desc = "Resume the last yazi session",
		},
	},
	---@type YaziConfig | {}
	opts = {
		--change_neovim_cwd_on_close = true,
		open_for_directories = true,
		keymaps = {
			change_working_directory = "<C-]>",
		},
		integrations = {
			grep_in_selected_files = "fzf-lua",
			grep_in_directory = "fzf-lua",
		},
	},
	init = function()
		vim.g.loaded_netrwPlugin = 1
	end,
}
