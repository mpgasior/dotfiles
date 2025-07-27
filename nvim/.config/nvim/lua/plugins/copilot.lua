return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{
				"github/copilot.vim",
				config = function()
					vim.g.copilot_no_tab_map = true
				end,
			},
			{ "nvim-lua/plenary.nvim" },
		},
		build = "make tiktoken",
		opts = {},
	},
}
