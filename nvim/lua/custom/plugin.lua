local plugins = {
  { "nvzone/volt" , lazy = true },
  { "nvzone/menu" , lazy = true },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "ruff",
        "pyright",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },


  {
    "tpope/vim-fugitive",
    lazy = false,
    event = "User InGitRepo",
    config = function()
      require("custom.configs.fugitive")
    end,
  },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "openai"
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
           -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

  {
    'Shatur/neovim-session-manager',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local Path = require('plenary.path')
      require('session_manager').setup({
        sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- Where sessions will be stored
        autoload_mode = require('session_manager.config').AutoloadMode.Disabled, -- Autoload options
      })
    end
  },

 {
    'grzegorzszczepanek/gamify.nvim',
    lazy = false,
    config = function()
      require('gamify')
    end,
  },

  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    lazy = false,
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },

  {
    'rgroli/other.nvim',
    lazy = false,
    config = function ()
      require("other-nvim").setup({
      mappings = {
          -- builtin mappings
          "livewire",
          "angular",
          "laravel",
          "rails",
          "golang",
          "python",
          "react",
          "rust",
          -- custom mapping
          -- {
          --     pattern = "/path/to/file/src/app/(.*)/.*.ext$",
          --     target = "/path/to/file/src/view/%1/",
          --     transformer = "lowercase"
          -- }
      },
      transformers = {
          -- defining a custom transformer
          lowercase = function (inputString)
              return inputString:lower()
          end
      },
      style = {
          -- How the plugin paints its window borders
          -- Allowed values are none, single, double, rounded, solid and shadow
          border = "solid",

          -- Column seperator for the window
          seperator = "|",

    -- width of the window in percent. e.g. 0.5 is 50%, 1.0 is 100%
    width = 0.7,

    -- min height in rows.
    -- when more columns are needed this value is extended automatically
    minHeight = 2
      },
  })
    end
  }

}

return plugins

