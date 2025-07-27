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
		init = function()
			-- Autocmd for when an LSP client attaches to a buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
					vim.notify("[LSP] Attached: " .. client.name)
				end,
			})

			-- LSP
			-- Helper function to check if LSP is attached to the current buffer
			local function lsp_attached()
				return vim.lsp.buf_is_attached(0, nil)
			end

			-- Go to Definition
			vim.keymap.set("n", "grd", function()
				if lsp_attached() then
					vim.lsp.buf.definition()
				end
			end, { desc = "vim.lsp.buf.definition()" })

			-- Go to Declaration
			vim.keymap.set("n", "grD", function()
				if lsp_attached() then
					vim.lsp.buf.declaration()
				end
			end, { desc = "LSP: Go to Declaration" })
		end,
	},
}
