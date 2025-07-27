-- Terminal Mode
vim.keymap.set("t", "<ESC>", "<C-\\><C-N>", { desc = "Escape Terminal Mode" })

-- Move in Insert Mode
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move <Left> in Insert Mode" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move <Down> in Insert Mode" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move <Up> in Insert Mode" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move <Right> in Insert Mode" })

-- Save / Update
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<C-o>:w<CR>", { noremap = true, silent = true })

-- LSP
-- Helper function to check if LSP is attached to the current buffer
local function lsp_attached()
	return vim.lsp.buf_is_attached(0)
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
