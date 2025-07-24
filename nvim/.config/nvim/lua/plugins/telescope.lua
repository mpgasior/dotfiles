return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = {
					"%.git/",
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
				},
			},
		})

		vim.keymap.set(
			"n",
			"<leader>ff",
			"<CMD> Telescope find_files hidden=true<CR>",
			{ desc = "Telescope find files" }
		)
		vim.keymap.set("n", "<leader>fg", "<CMD> Telescope live_grep hidden=true<CR>", { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", "<CMD> Telescope buffers <CR>", { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", "<CMD> Telescope help_tags <CR>", { desc = "Telescope help tags" })
	end,
}
