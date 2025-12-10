return {
  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        tools = {
          amp = {
            cmd = { "amp" },
            format = function(text)
              local Text = require("sidekick.text")
              Text.transform(text, function(str)
                return str:find("[^%w/_%.%-]") and ('"' .. str .. '"') or str
              end, "SidekickLocFile")
              local ret = Text.to_string(text)
              -- transform line ranges to a format that amp understands
              ret = ret:gsub("@([^ ]+)%s*:L(%d+):C%d+%-L(%d+):C%d+", "@%1#L%2-%3") -- @file :L5:C20-L6:C8 => @file#L5-6
              ret = ret:gsub("@([^ ]+)%s*:L(%d+):C%d+%-C%d+", "@%1#L%2") -- @file :L5:C9-C29 => @file#L5
              ret = ret:gsub("@([^ ]+)%s*:L(%d+)%-L(%d+)", "@%1#L%2-%3") -- @file :L5-L13 => @file#L5-13
              ret = ret:gsub("@([^ ]+)%s*:L(%d+):C%d+", "@%1#L%2") -- @file :L5:C9 => @file#L5
              ret = ret:gsub("@([^ ]+)%s*:L(%d+)", "@%1#L%2") -- @file :L5 => @file#L5
              return ret
            end,
          },
        },
      },
    },
  },
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
        sections = {
          { section = "header" },
          { section = "keys", gap = 0, padding = 1 },
        },
      },
    },
  },

  {
    dir = "/home/siah/developer/lua/dracula_pro",
    enabled = false,
    name = "dracula_pro",
    lazy = false, -- Load immediately
    priority = 1000,
    opts = {
      flavour = "default",
    },
  },

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
                gotmpl = { "html" },
              },
            },
          },
        },
      },
    },
  },

  {
    "windwp/nvim-ts-autotag",

    opts = {
      aliases = {
        ["gotmpl"] = "html",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        herb_ls = {
          filetypes = { "eruby" },
        },
        vtsls = {
          settings = {
            typescript = {
              preferences = {
                importModuleSpecifier = "non-relative",
              },
            },
          },
        },
        -- phptools = {
        --   init_options = {
        --     ["0"] = "BEA6372325zpNTJjU4xJXjVYrFTD9xaQPM", --optional premium license validation from https://www.devsense.com/purchase/validation
        --   },
        -- },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    enabled = false,
  },
}
