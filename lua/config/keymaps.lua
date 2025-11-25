-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local snippets = require("utils.snippets")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "eruby" },
  callback = function(args)
    vim.keymap.set("i", "<C-z>", function()
      snippets.expand_snippet("erb", "render")
    end, { buffer = args.buf, silent = true, desc = "Insert render block snippet" })
    vim.keymap.set("i", "<C-x>", function()
      snippets.expand_snippet("erb", "exec")
    end, { buffer = args.buf, silent = true, desc = "Insert exec block snippet" })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "php" },
  callback = function(args)
    vim.keymap.set("i", "<C-z>", function()
      vim.snippet.expand("<?= $1 ?>")
    end, { buffer = args.buf, silent = true, desc = "Insert render block snippet" })
    vim.keymap.set("i", "<C-x>", function()
      vim.snippet.expand("<?php $1 ?>")
    end, { buffer = args.buf, silent = true, desc = "Insert exec block snippet" })
  end,
})
