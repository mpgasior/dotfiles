-- Terminal Mode
vim.keymap.set("t", "<ESC>", "<C-\\><C-N>", { desc = "Escape Terminal Mode" })

-- Move in Insert Mode
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move <Left> in Insert Mode" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move <Down> in Insert Mode" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move <Up> in Insert Mode" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move <Right> in Insert Mode" })
