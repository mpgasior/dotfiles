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
				mappings = {
					i = {
						["<C-l>"] = false,
					},
				},
			},
		})

		local is_inside_work_tree = {}

		vim.keymap.set("n", "<leader>ff", function()
			local cwd = vim.fn.getcwd()
			if is_inside_work_tree[cwd] == nil then
				vim.fn.system("git rev-parse --is-inside-work-tree")
				is_inside_work_tree[cwd] = vim.v.shell_error == 0
			end

			if is_inside_work_tree[cwd] then
				require("telescope.builtin").git_files(opts)
			else
				require("telescope.builtin").find_files(opts)
			end
		end, { desc = "Telescope find files (git or all)" })
		vim.keymap.set("n", "<leader>fg", "<CMD> Telescope live_grep hidden=true<CR>", { desc = "Telescope live grep" })
		vim.keymap.set(
			"n",
			"<leader>fb",
			"<CMD> Telescope current_buffer_fuzzy_find<CR>",
			{ desc = "Telescope current buffer ff" }
		)
	end,
}
