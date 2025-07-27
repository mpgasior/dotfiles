-- General UI and Behavior
vim.o.number = true
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.opt.winborder = "rounded"

vim.opt.undofile = true -- Enable persistent undo history
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undo" -- Directory for undo files

-- Indentation & Formatting
vim.opt.tabstop = 4 -- Number of spaces a tab character counts for
vim.opt.shiftwidth = 4 -- Number of spaces for (auto)indentation
vim.opt.expandtab = true -- Convert typed tabs into spaces
vim.opt.autoindent = true -- Copy indent from previous line
vim.opt.smartindent = true -- Smart auto-indent for C-like languages
vim.opt.wrap = false -- Disable text wrapping (lines extend horizontally)
vim.opt.textwidth = 0 -- No automatic line breaks (related to 'wrap')
vim.opt.laststatus = 2 -- Always show the status line
vim.opt.showtabline = 2 -- Always show the tab line
vim.opt.list = true -- Show invisible characters (like tabs, trailing spaces, newlines)

-- Splits & Windows
vim.opt.splitright = true -- New vertical splits open to the right
vim.opt.splitbelow = true -- New horizontal splits open below

-- Performance & Responsiveness
vim.opt.updatetime = 300 -- Faster update for CursorHold, diagnostics etc. (in ms)
vim.opt.timeoutlen = 500 -- Time to wait for a key sequence to complete (e.g., leader key)
vim.opt.ttimeoutlen = 0 -- No timeout for terminal key codes (e.g., function keys)

-- Disabling netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Diagnostics
vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = true,
})

-- Copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = {
	["*"] = false,
}
