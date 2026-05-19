require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ["<Tab>"] = { "accept", "fallback" },
  },
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = {
    documentation = { auto_show = true },
    list = {
      selection = { preselect = true },
    },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  -- Rust binary not available with plain git clone; Lua fallback is fully functional
  fuzzy = { implementation = "lua" },
})
