-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "eruby" },
  callback = function(args)
    vim.keymap.set("i", "<C-z>", function()
      vim.snippet.expand("<%= ${1} %>")
    end, { buffer = args.buf, silent = true, desc = "Insert render block snippet" })
    vim.keymap.set("i", "<C-x>", function()
      vim.snippet.expand("<% ${1} %>")
    end, { buffer = args.buf, silent = true, desc = "Insert exec block snippet" })
  end,
})
