local ensure_installed = {
  "json", "sql", "javascript", "typescript", "dockerfile",
  "yaml", "make", "cmake", "html", "bash", "powershell",
  "rust", "go", "cpp", "python", "c", "java", "lua",
  "vim", "vimdoc", "query", "markdown", "markdown_inline",
}

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    local installed = {}
    for _, lang in ipairs(require("nvim-treesitter").get_installed()) do
      installed[lang] = true
    end
    local missing = vim.tbl_filter(function(lang) return not installed[lang] end, ensure_installed)
    if #missing > 0 then
      require("nvim-treesitter").install(missing)
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
    if ok and stats and stats.size > 100 * 1024 then return end
    pcall(vim.treesitter.start, ev.buf)
  end,
})
