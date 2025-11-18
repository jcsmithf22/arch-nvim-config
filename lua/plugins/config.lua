return {
  {
    "folke/snacks.nvim",
    opts = {
      indent = {
        enabled = false,
      },
      picker = {
        layout = {
          -- preview = "main",
          preset = "vscode",
          -- layout = {
          --   position = "bottom",
          -- },
        },
      },
      dashboard = {
        -- your dashboard configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        sections = {
          { section = "header" },
          { section = "keys", gap = 0, padding = 1 },
        },
      },
    },
  },

  {
    dir = "/home/siah/developer/lua/dracula_pro",
    name = "dracula_pro",
    lazy = false, -- Load immediately
    priority = 1000,
    opts = {
      flavour = "default",
    },
  },

  -- { "nuvic/flexoki-nvim", name = "flexoki" },
  -- { "kepano/flexoki-neovim", name = "flexoki" },
  -- {
  --   "cpplain/flexoki.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  -- },

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "dracula-pro",
      colorscheme = "tokyonight-night",
    },
  },

  {
    "ninetyfive-gg/ninetyfive.nvim",
    enabled = false,
    opts = {
      -- Prints useful logs about what events are triggered, and reasons actions are executed
      debug = false,

      -- When `true`, enables the plugin on NeoVim startup
      enable_on_startup = true,

      -- Update server URI, mostly for debugging
      server = "wss://api.ninetyfive.gg",

      -- Key mappings configuration
      mappings = {
        -- When `true`, creates all the mappings set
        enabled = true,
        -- Sets a global mapping to accept a suggestion
        accept = "<Tab>",
        -- Sets a global mapping to accept a suggestion and edit
        accept_edit = "<C-g>",
        -- Sets a global mapping to reject a suggestion
        reject = "<C-w>",
      },

      -- Code indexing configuration for better completions
      indexing = {
        -- Possible values: "ask" | "on" | "off"
        -- "ask" - prompt user for permission to index code
        -- "on" - automatically index code
        -- "off" - disable code indexing
        mode = "ask",
        -- Whether to cache the user's answer per project
        cache_consent = true,
      },
    },
  },

  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        providers = {
          snippets = {
            opts = {
              friendly_snippets = true, -- default

              extended_filetypes = {
                ruby = { "rails" },
              },
            },
          },
        },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        phptools = {
          init_options = {
            ["0"] = "BEA6372325zpNTJjU4xJXjVYrFTD9xaQPM", --optional premium license validation from https://www.devsense.com/purchase/validation
          },
        },
      },
    },
  },
}
