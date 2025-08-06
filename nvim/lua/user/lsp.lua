
local lspconfig = require("lspconfig")

---- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local function on_attach(client, bufnr)

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local buf = vim.lsp.buf
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local function keymap(mode, key, command)
    vim.keymap.set(mode, key, command, bufopts)
  end


  -- Mappings
  -- See `:help vim.lsp.*` for documentation on any of the below functions

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- TODO: When you press `t` over an Elm expression, you get a hover thing with the type computed.
  --       But when you move the cursor, the popup disappears.
  --       Is it possible to open it in a new buffer so the type can persist?
  --
  --       When using rename, can you automatically save every changed file?
  --       Or maybe have a y/n way of changing the name?
  --       To save all unsaved buffers, execute `:writeall`

  keymap("n", "gd", buf.definition)
  keymap("n", "t", buf.hover)
  keymap("n", "<LocalLeader>rn", buf.rename)
  -- TODO: Would be nice to automatically save the current buffer after the format
  keymap("n", "<LocalLeader>f", buf.format)
  -- TODO: Would be nice to have a way to cycle through the references with one keypress
  keymap("n", "gr", buf.references)
  keymap("n", "<LocalLeader>ca", buf.code_action) -- This can be used to name a subexpression and declare it in a var


  keymap("n", "gi", buf.implementation)
  keymap("n", "gD", buf.declaration)
  keymap("n", "<C-k>", buf.signature_help)
  keymap("n", "<LocalLeader>wa", buf.add_workspace_folder)
  keymap("n", "<LocalLeader>wr", buf.remove_workspace_folder)
  keymap("n", "<LocalLeader>D", buf.type_definition)

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


-- lspconfig.elmls.setup {}

---- Scala
--lspconfig.metals.setup {
--  on_attach = on_attach,
--  -- TODO: How to actually configure this?
--  showInferredType = true,
--  showImplicitArguments = true,
--}

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


-- Racket
-- lspconfig.racket_langserver.setup {
--   on_attach = on_attach,
-- }
