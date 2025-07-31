return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		init = function()
			local is_inside_work_tree = {}

			vim.keymap.set("n", "<leader>ff", function()
				local cwd = vim.fn.getcwd()
				if is_inside_work_tree[cwd] == nil then
					vim.fn.system("git rev-parse --is-inside-work-tree")
					is_inside_work_tree[cwd] = vim.v.shell_error == 0
				end

				if is_inside_work_tree[cwd] then
					require("fzf-lua").git_files()
				else
					require("fzf-lua").files()
				end
			end, { desc = "FzfLua find files (git or all)" })
			vim.keymap.set("n", "<leader>ft", "<CMD> FzfLua<CR>", { desc = "FzfLua" })
			vim.keymap.set("n", "<leader>fg", function()
				require("fzf-lua").live_grep()
			end, { desc = "FzfLua live grep" })
			vim.keymap.set("n", "<leader>fb", "<CMD> FzfLua grep_curbuf<CR>", { desc = "FzfLua current buffer ff" })
		end,
	},
}
