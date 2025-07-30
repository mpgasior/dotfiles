return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"vimls",
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim" },
			{ "neovim/nvim-lspconfig" },
		},
	},
}
