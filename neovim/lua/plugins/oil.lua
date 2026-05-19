require("oil").setup({
  default_file_explorer = true,
  view_options = {
    show_hidden = true,
  },
  keymaps = {
    ["<CR>"] = "actions.select",
    ["-"]    = "actions.parent",
    ["_"]    = "actions.open_cwd",
    ["gs"]   = "actions.change_sort",
    ["gx"]   = "actions.open_external",
    ["g."]   = "actions.toggle_hidden",
    ["?"]    = "actions.show_help",
  },
  use_default_keymaps = false,
})

vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
