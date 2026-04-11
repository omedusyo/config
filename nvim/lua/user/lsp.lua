
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local metals = require("metals")
-- vim.lsp.set_log_level('debug')

---- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local function on_attach(client, bufnr)

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local buf = vim.lsp.buf
  local diag = vim.diagnostic

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local function keymap(mode, key, command)
    vim.keymap.set(mode, key, command, bufopts)
  end


  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions

  -- TODO: When you press `t` over an Elm expression, you get a hover thing with the type computed.
  --       But when you move the cursor, the popup disappears.
  --       Is it possible to open it in a new buffer so the type can persist?
  --
  --       When using rename, can you automatically save every changed file?
  --       Or maybe have a y/n way of changing the name?
  --       To save all unsaved buffers, execute `:writeall`

  -- CORE LSP NAV
  keymap("n", "gd", buf.definition)
  keymap("n", "gD", buf.declaration)
  keymap("n", "gi", buf.implementation)
  keymap("n", "<LocalLeader>D", buf.type_definition)

  -- HOVER / RENAME / REFS / ACTIONS
  keymap("n", "t", buf.hover)
  keymap("n", "<LocalLeader>rn", buf.rename)
  -- TODO: Would be nice to have a way to cycle through the references with one keypress
  keymap("n", "gr", buf.references)
  keymap("n", "<LocalLeader>ca", buf.code_action) -- This can be used to name a subexpression and declare it in a var

  -- DIAGNOSTICS
  keymap("n", "]d", diag.goto_next)
  keymap("n", "[d", diag.goto_prev)
  keymap("n", "ge", diag.open_float)
  keymap("n", "<LocalLeader>e", diag.setloclist)

  keymap("n", "<C-k>", buf.signature_help)
  keymap("n", "<LocalLeader>wa", buf.add_workspace_folder)
  keymap("n", "<LocalLeader>wr", buf.remove_workspace_folder)

  -- TODO: Would be nice to automatically save the current buffer after the format
  keymap("n", "<LocalLeader>f", buf.format)

  keymap("n", "<LocalLeader>wl", function ()
    print(vim.inspect(buf.list_workspace_folders()))
  end)
end

-- Elm
lspconfig.elmls.setup {
  on_attach = on_attach,
}

-- Rust
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
}

-- Typescript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
}

-- C++
lspconfig.clangd.setup{
  on_attach = on_attach,
}

---- ReScript
lspconfig.rescriptls.setup {
  on_attach = on_attach,
}

---- Scala
-- Don't enable the below. Look at the `nvim-metals` plugin.
-- lspconfig.metals.setup {
--   on_attach = on_attach,
--   -- TODO: How to actually configure this?
--   showInferredType = true,
--   showImplicitArguments = true,
-- }

local metals_config = metals.bare_config()
metals_config.on_attach = on_attach
metals_config.settings = {
  showImplicitArguments = true,
  showInferredType = true,
}
-- Autocmd to start or attach Metals when you open Scala/SBT/Java
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    metals.initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})

-- To shut up stupid metals popups saying project was recompiled.
local old = vim.notify
vim.notify = function(msg, level, opts)
  if type(msg) == "string" and msg:match("LSP%[metals%]%[Info%] Compiled") then
    return
  end
  old(msg, level, opts)
end

---- Lua
--lspconfig.sumneko_lua.setup {
--  on_attach = on_attach,
--}

lspconfig.purescriptls.setup {
  on_attach = on_attach,
  settings = {
      purescript = {
        addSpagoSources = true
      }
    },
}

-- Gleam
lspconfig.gleam.setup {
  on_attach = on_attach,
}

-- F#
lspconfig.fsautocomplete.setup {
  on_attach = on_attach,
}

-- Racket
-- lspconfig.racket_langserver.setup {
--   on_attach = on_attach,
-- }
