return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		init = function()
			local is_inside_work_tree = {}

			vim.keymap.set("n", "<leader>ff", function()
				local opts = { hidden = true, show_untracked = true }

				local cwd = vim.fn.getcwd()
				if is_inside_work_tree[cwd] == nil then
					vim.fn.system("git rev-parse --is-inside-work-tree")
					is_inside_work_tree[cwd] = vim.v.shell_error == 0
				end

				if is_inside_work_tree[cwd] then
					require("fzf-lua").git_files(opts)
				else
					require("fzf-lua").files(opts)
				end
			end, { desc = "Telescope find files (git or all)" })
			vim.keymap.set("n", "<leader>ft", "<CMD> FzfLua<CR>", { desc = "Telescope" })
			vim.keymap.set("n", "<leader>fg", function()
				local cwd = vim.fn.getcwd()
				if is_inside_work_tree[cwd] == nil then
					vim.fn.system("git rev-parse --is-inside-work-tree")
					is_inside_work_tree[cwd] = vim.v.shell_error == 0
				end

				local opts = {}
				if is_inside_work_tree[cwd] then
					opts = { cmd = "git grep --line-number --column --color=always" }
				end
				require("fzf-lua").live_grep(opts)
			end, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", "<CMD> FzfLua grep_curbuf<CR>", { desc = "Telescope current buffer ff" })
		end,
	},
}
