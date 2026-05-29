# Neovim Keybinding Cheat Sheet

**Leader key**: `Space`

---

## Core

| Mode | Keys | Action |
|------|------|--------|
| `n` | `<leader>w` | Save file |
| `n` | `<leader>q` | Quit |
| `n` | `<leader>b` | Switch to previous buffer |
| `n` | `<Esc>` | Clear search highlighting |

---

## Navigation

| Mode | Keys | Action |
|------|------|--------|
| `n` | `<C-d>` | Scroll down half page (centered) |
| `n` | `<C-u>` | Scroll up half page (centered) |
| `n` | `n` | Next search result (centered) |
| `n` | `N` | Previous search result (centered) |
| `n` | `j` | Down (respects visual/wrapped lines) |
| `n` | `k` | Up (respects visual/wrapped lines) |

---

## Window Management

| Mode | Keys | Action |
|------|------|--------|
| `n` | `<C-h>` | Move to left window |
| `n` | `<C-j>` | Move to bottom window |
| `n` | `<C-k>` | Move to top window |
| `n` | `<C-l>` | Move to right window |

---

## Editing

| Mode | Keys | Action |
|------|------|--------|
| `v` | `J` | Move selected lines down |
| `v` | `K` | Move selected lines up |
| `v` | `>` | Indent and stay in visual mode |
| `v` | `<` | Dedent and stay in visual mode |
| `x` | `<leader>p` | Paste over selection without overwriting register |

---

## Insert Mode — Auto-Pairs

| Keys | Action |
|------|--------|
| `{` | Insert `{}` and place cursor inside |
| `"` | Insert `""` and place cursor inside |
| `'` | Insert `''` and place cursor inside |
| `<BS>` | Smart delete matching pair |
| `<CR>` | Expand pair onto new line |

---

## LSP & Diagnostics

| Mode | Keys | Action |
|------|------|--------|
| `n` | `gd` | Go to definition |
| `n` | `gb` | Go back (jumplist) |
| `n` | `<leader>e` | Open diagnostic float |

---

## Telescope (Fuzzy Finder)

| Mode | Keys | Action |
|------|------|--------|
| `n` | `<leader>ff` | Find files |
| `n` | `<leader>fg` | Live grep |
| `n` | `<leader>fb` | Find open buffers |
| `n` | `<leader>fh` | Search help tags |
| `n` | `<leader>fr` | Recent files |
| `n` | `<leader>fc` | Browse commands |

---

## Oil (File Explorer)

| Mode | Keys | Action |
|------|------|--------|
| `n` | `-` | Open parent directory in Oil |

**Inside Oil buffer:**

| Keys | Action |
|------|--------|
| `<CR>` | Open file/directory |
| `-` | Go to parent directory |
| `_` | Open current working directory |
| `gs` | Change sort order |
| `gx` | Open with external app |
| `g.` | Toggle hidden files |
| `?` | Show help |

---

## Conform (Formatting)

| Mode | Keys | Action |
|------|------|--------|
| `n` | `<leader>cf` | Format file |

---

## Blink (Completion)

| Mode | Keys | Action |
|------|------|--------|
| Completion menu | `<Tab>` | Accept completion suggestion |
