require("conform").setup({
  formatters_by_ft = {
    lua        = { "stylua" },
    python     = { "isort", "black" },
    rust       = { "rustfmt", lsp_format = "fallback" },
    go         = { "gofmt" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    c          = { "clang_format" },
    cpp        = { "clang_format" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})

vim.keymap.set("n", "<leader>cf", function()
  require("conform").format({ async = true })
end, { desc = "Format file" })
