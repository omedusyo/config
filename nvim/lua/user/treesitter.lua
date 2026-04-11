local configs = require("nvim-treesitter.configs")

configs.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
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
    },
  },
}
