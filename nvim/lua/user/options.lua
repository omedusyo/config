
--   merge(t1: Table, t2: Table)
-- assigns key/value pairs of t2 to t1
local function mergeTables(targetTable, sourceTable)
  for k, v in pairs(sourceTable) do
    targetTable[k] = v
  end
  return targetT
end

local myOptions = {
  backup = false,                     -- creates a backup file
  swapfile = false,                   -- creates a swapfile
  showmode = false,                   -- we don't need to see things like -- INSERT -- anymore
  fileencoding = "utf-8",
  updatetime = 300,                   -- faster completion (4000ms default)
  showmode = false,
  -- termguicolors = true,               -- you may want to disable this for solarized
  backupcopy = "yes",                 -- This is here to make the fucking `parcel --watch` work

  -- Line Numbers
  number = true,                      -- Shows line numbers.
  -- relativenumber = true,
  cursorline = true,                  -- Highlights current line.
  signcolumn = "yes",                 -- always show the sign column, otherwise it would shift the text each time

  -- Mouse
  mouse = "a",

  -- Tabs functionality
  expandtab = true,                   -- Insers spaces instead of tabs.
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,

  -- Indentation functionality
  wrap = false,                       -- display lines as one long line

  -- Search
  ignorecase = true,                  -- Ignores case while searching.
  smartcase = true,                   -- Ignore 'ignorecase' if search contains uppercase letters.
  incsearch = true,                   -- Highlights dynamically as you start to search.
  hlsearch = true,                    -- highlight all matches on previous search pattern


  -- Undo/Redo
  undofile = true,                    -- enable persistent undo

  -- Splits
  splitbelow = true,                  -- force all horizontal splits to go below current window
  splitright = true,                  -- force all vertical splits to go to the right of current window

  -- Font
  guifont = "monospace:h17",          -- the font used in graphical neovim applications


  -- Folding
  -- You have three options: indent, syntax, manual (that's the default)
  foldmethod = "expr",              -- enabled folding with treesitter
  -- foldmethod = "indent",              -- enables folding by indentation
  -- foldmethod = "syntax",              -- enables folding by syntax
  foldenable = false,
}
mergeTables(vim.opt, myOptions)

-- emmet
vim.g.user_emmet_leader_key = ",,"

-- Vim Slime
vim.g.slime_target = "tmux"
-- Makes the default tmux target plane: current.2
vim.g.slime_default_config = { socket_name = "default", target_pane = ":.2", }
vim.g.slime_dont_ask_default = 1

-- Hex patterns
vim.g.hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.wasm'

-- LightLine
vim.g.lightline = { colorscheme = "solarized", }

-- Universal ctags path for tagbar plugin
vim.g.tagbar_ctags_bin = "~/ctags/bin/ctags"

-- See https://github.com/rhysd/vim-grammarous/issues/110#issuecomment-1746071473
vim.g["grammarous#jar_url"] = 'https://www.languagetool.org/download/LanguageTool-5.9.zip'

-- Pollen
-- Set Pollen syntax for files with these extensions:
vim.filetype.add({
  pattern = {
    ['.*%.pm'] = 'pollen',
    ['.*%.pp'] = 'pollen',
    ['.*%.ptree'] = 'pollen',
  },
})

vim.filetype.add({
  pattern = {
    ['.*%.v'] = 'verilog',
  },
})
