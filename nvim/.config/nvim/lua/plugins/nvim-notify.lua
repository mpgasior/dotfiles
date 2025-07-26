return {
	"rcarriga/nvim-notify",
	lazy = false,
	config = function()
		require("notify").setup({})
		vim.notify = require("notify")
	end,
}
