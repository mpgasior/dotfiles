return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"gopls",
			"lua_ls",
			"prettier",
			"rust-analyzer",
			"shfmt",
			"stylua",
			"vimls",
			"yamlfmt",
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
