vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
-- vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit file" })
-- vim.keymap.set("n", "<leader>x", ":x<CR>", { desc = "Exit file" })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "nzzzv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("n", " ", "<Nop>", { desc = "Ignore space", silent = true })

vim.keymap.set('n', '<C-v>', '<Nop>', { noremap = true })

vim.keymap.set("n", "<leader>b", ":e#<CR>", { desc = "Switch to previous file" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = '[E]xpand diagnostic message' })
