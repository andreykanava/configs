local M = {}

M.options = {
  nvchad_branch = "v2.0",
}

M.ui = {
  ------------------------------- base46 -------------------------------------
  -- hl = highlights
  hl_add = {},
  hl_override = {},
  changed_themes = {},
  theme_toggle = { "onedark", "one_light" },
  theme = "onedark", -- default theme
  transparency = false,
  lsp_semantic_tokens = false, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens

  -- https://github.com/NvChad/base46/tree/v2.0/lua/base46/extended_integrations
  extended_integrations = {}, -- these aren't compiled by default, ex: "alpha", "notify"

  -- cmp themeing
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },

  telescope = { style = "borderless" }, -- borderless / bordered

  ------------------------------- nvchad_ui modules -----------------------------
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    overriden_modules = nil,
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = true,
    overriden_modules = nil,
  },

  -- nvdash (dashboard)
  nvdash = {
    load_on_startup = true,
    header = {
    "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒",
    "▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░║░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒",
    "▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░║░╬▒▒▒▒▒▒▒▒▒▒▒▒▒▒",
    "▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▓░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒",
    "▒▒▒▒▒▒▒▒▒▒▒▒▒╬░░▓░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒",
    "▒▒▒▒▒▒▒▒▒▒▒▒▒░░▐▓▌░░▒▒▒▒▒▒▒▒▒▒▒▒▒",
    "▒▒▒▒▒▒▒▒▒▒▒▒▒░░▐▓▌░░▒▒▒▒▒▒▒▒▒▒▒▒▒",
    "▒▒▒▒▒▒▒▒▒▒▒▒▒░░▐▓▌░░▒▒▒▒▒▒▒▒▒▒▒▒▒",
    "▒▒▒▒▒▒▒▒▒░░░░░░▄▓▄░░░╬░░▒▒▒▒▒▒▒▒▒",
    "▒▒▒▒▒╬░░░░░░▄▄█████▄▄░░░░░░░▒▒▒▒▒",
    "▒▒▒▒░░▄▄▄███████████████▄▄▄░░▒▒▒▒",
    "▒▒▒▒░░▐░░░▀▓▓▒▓▓▒▓▓▒▓▓▀░░░▌░░▒▒▒▒",
    "▒▒▒▒░░░░░▄█████████████▄░░░╬░▒▒▒▒",
    "▒▒▒░░▄▄███████████████████▄▄░░▒▒▒",
    "▒▒▒░░▐░░░▀▓▓▒▓▓▓▒▓▓▓▒▓▓▀░░░▌░░▒▒▒",
    "▒▒▒▒░░░▒░░▓▓▓▓▓▓▓▓▓▓▓▓▓░░▒░░░▒▒▒▒",
    "▒▒▒░╬░░░▄███████████████▄░░░░░▒▒▒",
    "▒▒░░▄▄█████████████████████▄▄░░▒▒",
    "▒▒░░▐░░░▀▓▓▒▓▓▓▓▓▒▓▓▓▓▒▓▓▀░░░▌░░▒",
    "▒▒▒░░░▒░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░▒░░░▒▒",
    "▒▒░░░░░▄█████████████████▄░░░░╬▒▒",
    "▒░░▄▄███████████████████████▄▄░░▒",
    "▒░░▐░░░▀▓▓▒▓▓▓▓▓▓▒▓▓▓▓▓▒▓▓▀░░░▌░░",
    "▒▒░░▄▄███████████████████████▄▄░░",
    "▒▒▒░░░▓║║▓║║▓║║▓█▓█▓║║▓║║▓║║▓░░░╬",
    "▒╬░░▄▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▄░░▒▒",
    "░░▄██████████▓▄▄▄▄▄▓██████████▄░░",
    "▄████████████▓▄▄▄▄▄▓████████████▄",

    },

    buttons = {
      { "  Restore Session", "", function() require('session_manager').load_session() end },

     {
      "  Browse Projects",
      "",
      function()
        local scan = require("plenary.scandir")
        local pickers = require("telescope.pickers")
        local finders = require("telescope.finders")
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")
        local conf = require("telescope.config").values

        local directories = {}
        local base_path = vim.fn.expand("~/neoprojects/")

        -- Scan ~/neoprojects and filter directories
        scan.scan_dir(base_path, {
          hidden = false,
          only_dirs = true,
          depth = 1, -- Limit to immediate subdirectories
          on_insert = function(dir)
            table.insert(directories, dir)
          end,
        })

        -- Open a Telescope picker
        pickers.new({}, {
          prompt_title = "Browse Projects",
          finder = finders.new_table({
            results = directories,
            entry_maker = function(entry)
              return {
                value = entry,
                display = vim.fn.fnamemodify(entry, ":t"), -- Show only directory name
                ordinal = entry,
              }
            end,
          }),
          sorter = conf.generic_sorter({}),
          attach_mappings = function(prompt_bufnr, map)
            -- Action to change directory
            map("i", "<CR>", function()
              local selection = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              vim.cmd("cd " .. selection.value)
              print("Changed directory to: " .. selection.value)
              vim.cmd("edit " .. selection.value)
            end)
            map("n", "<CR>", function()
              local selection = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              vim.cmd("cd " .. selection.value)
              print("Changed directory to: " .. selection.value)
              vim.cmd("edit " .. selection.value)
            end)
            return true
          end,
        }):find()
      end,
    },


      { "  File Browser", "", function() vim.cmd("cd ~") vim.cmd("NvimTreeToggle") end },
      { "  New Directory", "", function()
         local input = vim.fn.input("Enter new directory name: ", "", "file")
          if input and input ~= "" then
            local path = vim.fn.expand("~/neoprojects/") .. input
            local success = vim.fn.mkdir(path, "p")
            if success == 1 then
              print("Directory created: " .. path)
              vim.cmd("cd " .. path) -- Change directory to the newly created one
              vim.cmd("edit " .. path .. "No name")
            else
              print("Failed to create directory: " .. path)
            end
          else
            print("Cancelled or invalid name.")
          end
        end },
      { "  Edit Config", "", ":cd ~/.config/nvim | e lua/custom/chadrc.lua" },
      { "󰺶  Gamify", "", "Gamify"},
      { "  Themes", "", "Telescope themes" },
      { "  Mappings", "", "NvCheatsheet" },
      { "  Quit", "", ":qa" },
    }
  },

  cheatsheet = { theme = "grid" }, -- simple/grid

  lsp = {
    -- show function signatures i.e args as you type
    signature = {
      disabled = false,
      silent = true, -- silences 'no signature help available' message from appearing
    },
  },
}

M.plugins = "" -- path i.e "custom.plugins", so make custom/plugins.lua file

M.lazy_nvim = require "plugins.configs.lazy_nvim" -- config for lazy.nvim startup options

M.mappings = require "core.mappings"

return M

