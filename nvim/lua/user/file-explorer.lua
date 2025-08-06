
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- -- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

-- -- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    width = 40,
    number = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  git = {
    ignore = false,
  },
  on_attach = function (bufnr)
    local api = require "nvim-tree.api"

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)    

    -- vim.keymap.set("n", "?",     api.tree.toggle_help)
    -- TODO: This is fucking stupid. I want these keybindings only in the nvim-tree buffer. Jesus.
    -- vim.keymap.set("n", "h",     api.node.navigate.parent_close)
    -- vim.keymap.set("n", "l",     api.node.open.edit)
  end,
})
