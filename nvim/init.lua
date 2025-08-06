vim.g.node_host_prog = vim.fn.expand('~/.local/share/fnm/node-versions/v22.16.0/installation/bin/node')

-- These two work without plugins
require "user.options"
require "user.keymaps"

require "user.plugins"
require "user.colorscheme"
require "user.completion"
require "user.file-explorer"
require "user.treesitter"
require "user.lsp"
require "user.ai"

-- myElmStuff = require "user.my-elm-stuff"
