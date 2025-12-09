return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    init = function()
      vim.keymap.set("n", "<leader>faf", "<CMD> FzfLua files<CR>", { desc = "FzfLua files" })
      vim.keymap.set("n", "<leader>fgf", "<CMD> FzfLua git_files<CR>", { desc = "FzfLua git_files" })
      vim.keymap.set("n", "<leader>fd", "<CMD> FzfLua diagnostics_document<CR>", { desc = "FzfLua diagnostics_document" })
      vim.keymap.set("n", "<leader>ft", "<CMD> FzfLua<CR>", { desc = "FzfLua" })
      vim.keymap.set("n", "<leader>flg", function()
        require("fzf-lua").live_grep()
      end, { desc = "FzfLua live grep" })
      vim.keymap.set("n", "<leader>fb", "<CMD> FzfLua grep_curbuf<CR>", { desc = "FzfLua current buffer ff" })
    end,
  },
}
