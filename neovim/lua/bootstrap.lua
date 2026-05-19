local pack_dir = vim.fn.stdpath("config") .. "/pack/plugins/start"

local plugins = {
  { "rose-pine/neovim",               "rose-pine" },
  { "nvim-lua/plenary.nvim",          "plenary.nvim" },
  { "nvim-telescope/telescope.nvim",  "telescope.nvim" },
  { "stevearc/oil.nvim",              "oil.nvim" },
  { "nvim-treesitter/nvim-treesitter", "nvim-treesitter" },
  { "stevearc/conform.nvim",          "conform.nvim" },
  { "saghen/blink.lib",               "blink.lib" },
  { "saghen/blink.cmp",               "blink.cmp" },
  { "rafamadriz/friendly-snippets",   "friendly-snippets" },
}

local function clone(repo, dir)
  local dest = pack_dir .. "/" .. dir
  if vim.fn.isdirectory(dest) == 0 then
    vim.notify("Bootstrapping " .. dir .. "...", vim.log.levels.INFO)
    vim.fn.system({ "git", "clone", "--depth=1", "https://github.com/" .. repo, dest })
  end
  vim.opt.runtimepath:append(dest)
end

for _, p in ipairs(plugins) do
  clone(p[1], p[2])
end

vim.cmd("packloadall")
vim.cmd("helptags ALL")
