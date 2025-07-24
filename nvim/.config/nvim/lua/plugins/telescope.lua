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
			"<leader>pf",
			"<CMD> Telescope find_files hidden=true<CR>",
			{ desc = "Telescope find files" }
		)
		vim.keymap.set("n", "<leader>pg", "<CMD> Telescope live_grep hidden=true<CR>", { desc = "Telescope live grep" })
	end,
}
