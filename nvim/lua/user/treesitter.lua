local configs = require("nvim-treesitter.configs")
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.moonbit = {
  install_info = {
    url = "https://github.com/moonbitlang/tree-sitter-moonbit",
    files = { "src/parser.c", "src/scanner.c" },
    branch = "main",
  },
  filetype = "moonbit",
}

configs.setup {
  ensure_installed = {
    "markdown",
    "markdown_inline",
    "c",
    "gleam",
    "lua",
    "rescript",
    "rust",
    "typescript",
    "javascript",
    "moonbit",
    "zig",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
