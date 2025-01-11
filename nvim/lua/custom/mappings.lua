
local M = {}

M.general = {
  v = {
    ["<BS>"] = { '"_d', "Delete without yanking" },
    ["<C-c>"] = { '"+y', "Copy to clipboard" },
    ["<C-v>"] = { '"+p', "Paste from clipboard" },
    ["<Tab>"] = { '>gv', "Indent selected lines" },
    ["<S-Tab>"] = { '<gv', "Un-indent selected lines" },
    ["<C-z>"] = { 'u', "Undo" },
    ["<C-S-z>"] = { '<C-r>', "Redo" },
    ["<C-a>"] = { 'ggVG', "Select all text" }, -- Map Ctrl+a to select all
  },
  n = {
    ["<C-v>"] = { '"+p', "Paste from clipboard" },
    ["<C-z>"] = { 'u', "Undo" },
    ["<C-S-z>"] = { '<C-r>', "Redo" },
    ["<C-a>"] = { ':normal ggVG<CR>', "Select all text in normal mode" }, -- Select all text
    ["<leader>db"] = { ':Nvdash<CR>', "Return to dashboard" },
  },
  i = {
    ["<C-c>"] = { '<Esc>"+y', "Copy to clipboard" },
    ["<C-v>"] = { '<Esc>"+p', "Paste from clipboard" },
    ["<C-z>"] = { '<C-o>u', "Undo" },
    ["<C-S-z>"] = { '<C-o><C-r>', "Redo" },
    ["<C-a>"] = { '<Esc>ggVG', "Select all text" }, -- Map Ctrl+a to select all in insert mode
  },
}

return M
