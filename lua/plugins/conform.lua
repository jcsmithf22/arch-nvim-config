return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- ruby = { "rufo" },
      eruby = { "herb_format" },
    },
    formatters = {
      herb_format = {
        command = "herb-format",
        args = { "-" },
      },
      rufo = {
        command = "rufo",
        args = { "--filename", "$FILENAME", "--simple-exit" },
      },
    },
  },
}
