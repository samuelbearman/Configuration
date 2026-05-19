-- nvim-treesitter manages parser installation (TSInstall, TSUpdate).
-- Highlighting uses Neovim's built-in vim.treesitter — no configs.setup() needed.

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
    if ok and stats and stats.size > 100 * 1024 then return end
    pcall(vim.treesitter.start, ev.buf)
  end,
})
