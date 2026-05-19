vim.lsp.enable({ "luals", "gopls", "rust_analyzer", "pyright", "clangd", "cmake", "jdtls" })

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})
