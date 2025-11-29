vim.o.updatetime = 250  -- How long to wait before showing info (ms)

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})
