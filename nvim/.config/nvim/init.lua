-- General UI and Behavior
vim.opt.number = true
--vim.opt.winborder = "rounded"

vim.opt.undofile = true -- Enable persistent undo history
local undodir = vim.fn.stdpath("data") .. "/undo"

if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

vim.opt.undodir = undodir

-- Indentation & Formatting
vim.opt.tabstop = 2        -- Number of spaces a tab character counts for
vim.opt.shiftwidth = 2     -- Number of spaces for (auto)indentation
vim.opt.expandtab = true   -- Convert typed tabs into spaces
vim.opt.autoindent = true  -- Copy indent from previous line
vim.opt.smartindent = true -- Smart auto-indent for C-like languages
vim.opt.wrap = false       -- Disable text wrapping (lines extend horizontally)
vim.opt.textwidth = 0      -- No automatic line breaks (related to 'wrap')
vim.opt.laststatus = 2     -- Always show the status line
vim.opt.showtabline = 2    -- Always show the tab line
vim.opt.list = true        -- Show invisible characters (like tabs, trailing spaces, newlines)
vim.opt.scrolloff = 8

-- Splits & Windows
vim.opt.splitright = true -- New vertical splits open to the right
vim.opt.splitbelow = true -- New horizontal splits open below

-- Performance & Responsiveness
vim.opt.updatetime = 300 -- Faster update for CursorHold, diagnostics etc. (in ms)
vim.opt.timeoutlen = 500 -- Time to wait for a key sequence to complete (e.g., leader key)
vim.opt.ttimeoutlen = 0  -- No timeout for terminal key codes (e.g., function keys)

-- Disabling netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Diagnostics
vim.diagnostic.config({
  virtual_text = true,
  --virtual_lines = true,
  virtual_lines = { current_line = true },
})

-- Search
vim.opt.ignorecase = true -- Case insensitive search...
vim.opt.smartcase = true  -- ...unless I use a capital letter
--vim.opt.hlsearch = false  -- Set to false or use a toggle to stop the 'yellow glow' after searching

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
  { src = "https://github.com/mikavilpas/yazi.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/neanias/everforest-nvim" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/saghen/blink.cmp",              version = "v1.10.2" },
})

require('which-key').setup({})
require('fzf-lua').setup({})
vim.keymap.set("n", "<leader>ft", "<CMD> FzfLua<CR>", { desc = "FzfLua" })

require('yazi').setup({
  open_for_directories = true,
  keymaps = {
    change_working_directory = "<C-]>",
  },
  integrations = {
    grep_in_selected_files = "fzf-lua",
    grep_in_directory = "fzf-lua",
  },
})
vim.keymap.set("n", "<leader>-", "<CMD> Yazi<CR>", { desc = "Open yazi at current file" })

require('nvim-tree').setup({
  hijack_netrw = false,
  update_focused_file = { enable = true, },
  filters = { custom = { "^\\.git$" }, },
  view = { width = { min = "25%", max = "25%" } },
})

vim.keymap.set("n", "<leader>e", "<CMD> NvimTreeFocus<CR>", { desc = "Focus NvimTree" })
vim.keymap.set("n", "<leader>h", "<CMD> NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

require('blink.cmp').setup({
  keymap = { preset = "default" },
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = { documentation = { auto_show = true }, ghost_text = { enabled = true } },
  signature = { enabled = true },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
  cmdline = {
    keymap = { preset = "inherit" },
    completion = { menu = { auto_show = true } },
  },
})

vim.lsp.config('*', {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})

require('mason').setup({})
require('mason-lspconfig').setup({
  automatic_enable = true,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- Keymaps
    vim.keymap.set("n", "grd", vim.lsp.buf.definition, {
      buffer = bufnr, silent = true, desc = "LSP: Go to Definition" })
    vim.keymap.set("n", "grD", vim.lsp.buf.declaration, {
      buffer = bufnr, silent = true, desc = "LSP: Go to Declaration" })

    -- Format on Save
    if client and client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = false })
        end,
      })
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    -- Map 'dd' to a function that deletes the current line from the list
    vim.keymap.set("n", "dd", function()
      local qf_list = vim.fn.getqflist()
      local cur_line = vim.fn.line(".")

      -- Remove the item from the table
      table.remove(qf_list, cur_line)

      -- Update the quickfix list with the new table ('r' means replace)
      vim.fn.setqflist(qf_list, 'r')

      -- Keep the cursor on the same line number
      vim.api.nvim_win_set_cursor(0, { cur_line, 0 })
    end, { buffer = true, desc = "Remove item from Quickfix" })
  end,
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        }
      },
      telemetry = { enable = false }
    },
  },
})

--vim.cmd([[colorscheme tokyonight]])
require('everforest').setup({
  spell_foreground = true,
})

vim.cmd([[colorscheme everforest]])
