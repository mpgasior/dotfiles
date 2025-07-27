return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		branch = "0.1.x",
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
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})

			require("telescope").load_extension("fzf")

			local is_inside_work_tree = {}
			local is_wsl = os.getenv("WSL_DISTRO_NAME") ~= nil

			vim.keymap.set("n", "<leader>ff", function()
				local cwd = vim.fn.getcwd()
				if is_inside_work_tree[cwd] == nil then
					vim.fn.system("git rev-parse --is-inside-work-tree")
					is_inside_work_tree[cwd] = vim.v.shell_error == 0
				end

				local opts = { hidden = true, show_untracked = true }

				if is_inside_work_tree[cwd] and not is_wsl then
					require("telescope.builtin").git_files(opts)
				else
					require("telescope.builtin").find_files(opts)
				end
			end, { desc = "Telescope find files (git or all)" })
			vim.keymap.set("n", "<leader>ft", "<CMD> Telescope<CR>", { desc = "Telescope" })
			vim.keymap.set(
				"n",
				"<leader>fg",
				"<CMD> Telescope live_grep hidden=true<CR>",
				{ desc = "Telescope live grep" }
			)
			vim.keymap.set(
				"n",
				"<leader>fb",
				"<CMD> Telescope current_buffer_fuzzy_find<CR>",
				{ desc = "Telescope current buffer ff" }
			)
			vim.keymap.set(
				"n",
				"<leader>fd",
				"<CMD> Telescope diagnostics bufnr=0<CR>",
				{ desc = "Telescope current buffer diagnostics" }
			)
		end,
	},
}
