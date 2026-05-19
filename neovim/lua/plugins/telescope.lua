local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
    layout_strategy = "horizontal",
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
    },
  },
})

vim.keymap.set("n", "<leader>ff", builtin.find_files,  { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep,   { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers,     { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags,   { desc = "Help tags" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles,    { desc = "Recent files" })
vim.keymap.set("n", "<leader>fc", builtin.commands,    { desc = "Commands" })
