-- Bootstrap plugins on first run
require("bootstrap")

-- Options
local opt = vim.opt

opt.number         = true
opt.relativenumber = true
opt.signcolumn     = "yes"
opt.cursorline     = true
opt.termguicolors  = true
opt.scrolloff      = 8

opt.tabstop        = 4
opt.softtabstop    = 4
opt.shiftwidth     = 4
opt.expandtab      = true
opt.smartindent    = true

opt.ignorecase     = true
opt.smartcase      = true
opt.hlsearch       = false
opt.incsearch      = true

opt.wrap           = false
opt.splitright     = true
opt.splitbelow     = true
opt.undofile       = true

opt.updatetime     = 250
opt.timeoutlen     = 300
opt.clipboard      = "unnamedplus"
opt.guicursor      = "n-v-c:block,i-ci:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Leader
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

-- Keymaps
local map = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = true
  vim.keymap.set(mode, lhs, rhs, opts)
end

map("n", " ",          "<Nop>",             { desc = "Ignore space" })
map("n", "<C-v>",      "<Nop>")

map("n", "<leader>w",  "<cmd>write<cr>",    { desc = "Save" })
map("n", "<leader>q",  "<cmd>quit<cr>",     { desc = "Quit" })
map("n", "<leader>b",  "<cmd>e#<cr>",       { desc = "Switch to previous file" })
map("n", "<Esc>",      "<cmd>nohlsearch<cr>")

-- Centered navigation
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n",     "nzzzv")
map("n", "N",     "Nzzzv")

-- Move between windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Better up/down on wrapped lines
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Move lines
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move line up" })

-- Paste over selection without overwriting register
map("x", "<leader>p", "\"_dP")

-- Stay in indent mode
map("v", ">", ">gv")
map("v", "<", "<gv")

-- LSP / diagnostics
map("n", "gd",         vim.lsp.buf.definition,    { desc = "Go to definition" })
map("n", "gb",         "<C-o>",                   { desc = "Go back (jumplist)" })
map("n", "<leader>e",  vim.diagnostic.open_float, { desc = "Expand diagnostic" })

-- Auto-pairs
local pairs_map = { ["{"] = "}", ['"'] = '"', ["'"] = "'" }
for open, close in pairs(pairs_map) do
  vim.keymap.set("i", open, open .. close .. "<Left>")
end
vim.keymap.set("i", "<BS>", function()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local before = line:sub(col, col)
  local after = line:sub(col + 1, col + 1)
  for open, close in pairs(pairs_map) do
    if before == open and after == close then
      return "<Del><BS>"
    end
  end
  return "<BS>"
end, { expr = true })
vim.keymap.set("i", "<CR>", function()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  if line:sub(col, col) == "{" and line:sub(col + 1, col + 1) == "}" then
    return "<CR><Esc>O"
  end
  return "<CR>"
end, { expr = true })

-- Plugins
require("plugins.rose-pine")
require("plugins.telescope")
require("plugins.oil")
require("plugins.blink")
require("plugins.conform")
require("plugins.treesitter")

-- LSP + diagnostics
require("config.lsp")
