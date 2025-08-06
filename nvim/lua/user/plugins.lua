local fn = vim.fn

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
-- ====Install your plugins here====
local plugins = {

  -- ===My plugins here===
  "nvim-lua/popup.nvim",    -- An implementation of the Popup API from vim in Neovim.
  "nvim-lua/plenary.nvim",  -- Useful lua functions used by lots of plugins.
  "stevearc/dressing.nvim", -- Improves default vim.ui interfaces.
  "MunifTanjim/nui.nvim", -- UI component library for vim.
  -- Improved viewing of .md
  --{
  --  'MeanderingProgrammer/render-markdown.nvim',
  --  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  --  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  --  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  --  ---@module 'render-markdown'
  --  ---@type render.md.UserConfig
  --  opts = {
  --    file_types = { 'markdown', 'vimwiki', 'codecompanion' },
  --  },
  --},

  -- colorschemes
  "nanotech/jellybeans.vim",
  "altercation/vim-colors-solarized",
  -- "tpope/vim-vividchalk",
  -- "fxn/vim-monochrome",
  -- "vyshane/vydark-vim-color",

  -- fonts
  "ryanoasis/vim-devicons",

  -- Send stuff to REPL 
  "jpalardy/vim-slime",

  "kyazdani42/nvim-web-devicons", -- optional, for file icons

  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },

  -- completion plugins
  -- "hrsh7th/nvim-cmp", -- The completion plugin
  -- "hrsh7th/cmp-buffer", -- buffer completions
  -- "hrsh7th/cmp-path", -- path completions
  -- "hrsh7th/cmp-cmdline", -- cmdline completions
  -- "saadparwaiz1/cmp_luasnip", -- snippet completions
  -- "hrsh7th/cmp-nvim-lsp", -- LSP completion
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      signature = { enabled = true },
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      -- keymap = { preset = 'default' },
      keymap = {
        preset = 'default',

        ['<C-t>'] = { 'show_signature', 'hide_signature', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-j>'] = { 'select_next', 'fallback_to_mappings' },
        -- ['<Enter>'] = { 'select_and_accept' },
        ['<Tab>'] = {
          function(cmp)
            if cmp.snippet_active() then return cmp.accept()
            else return cmp.select_and_accept() end
          end,
          'snippet_forward',
          'fallback'
        },
        -- ['<CR>'] = {
        --   function(cmp)
        --     if cmp.snippet_active() then return cmp.accept()
        --     else return cmp.select_and_accept() end
        --   end,
        --   'snippet_forward',
        --   'fallback'
        -- },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = false } },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'codecompanion' },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },

  -- snippets
  -- "L3MON4D3/LuaSnip", --snippet engine
  -- "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  -- Language Server Protocol
  -- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  -- enable LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },

    -- example using `opts` for defining servers
    opts = { servers = { lua_ls = {} } },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end

   -- -- example calling setup directly for each LSP
   --  config = function()
   --    local capabilities = require('blink.cmp').get_lsp_capabilities()
   --    local lspconfig = require('lspconfig')

   --    lspconfig['lua_ls'].setup({ capabilities = capabilities })
   --  end
  },

  -- TODO: Maybe remove?
  -- this is for scala (compatible with `nvim-lspconfig`)
  -- {
  --   -- see https://github.com/scalameta/nvim-metals
  --   "scalameta/nvim-metals",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  -- },

  -- File explorer
  "nvim-tree/nvim-tree.lua",

  -- Git diff UI
  "sindrets/diffview.nvim",


  -- Comments
  "tpope/vim-commentary", -- Easy comments (gcc). This is used in combination with the `nvim-ts-context-commentstring` plugin

  -- Tree-sitter
  -- TODO: Don't forget to run `:TSInstall all` after installation of the plugin
  "nvim-treesitter/nvim-treesitter", -- This is configured in `./treesitter.lua`

  -- Fuzzy Finder
  "nvim-telescope/telescope.nvim",

  -- statsline/tabline
  "itchyny/lightline.vim",

  -- Start screen
  {
   "goolord/alpha-nvim",
   dependencies = { "kyazdani42/nvim-web-devicons" },
   config = function ()
       require("alpha").setup(require("alpha.themes.startify").config)
   end
  },

  -- HTML/CSS
  "mattn/emmet-vim", -- HTML and CSS speed coding.

  -- LaTeX
  "LaTeX-Box-Team/LaTeX-Box", -- Lightweight toolbox for LaTeX.

  -- Markdown rendering server
  --  Run :LivedownPreview (to kill it :LivedownKill)
  --  or :LivedownToggle
  --  TODO: Don't forget ot `npm install -g livedown`
  "shime/vim-livedown",

  -- Viewing binaries
  "fidian/hexmode", -- hex/binary viewer. Just write :Hexmode

  -- Harpoon
  "ThePrimeagen/harpoon",

  -- Tagbar
  -- You need to install Universal ctag
  -- See options.lua `tagbar_ctags_bin` for the path of the binary.
  -- Seems to hijack <C-i>
  -- use "preservim/tagbar"

  "iamcco/markdown-preview.nvim",

  -- grammar checker
  -- :GrammarousCheck
  "rhysd/vim-grammarous",

  -- Signature (for displaying marks in a file)
  "kshenoy/vim-signature",

  -- PureScript
  "purescript-contrib/purescript-vim",

  -- Janet
  'bakpakin/janet.vim', -- janet lang syntax highlighting

  -- Idris2
  'edwinb/idris2-vim',

  -- Haskell
  'rbgrouleff/bclose.vim',
  'hasufell/ghcup.vim',

  -- Rust
  'rust-lang/rust.vim',

  -- Coq
  -- 'whonore/Coqtail',

  -- Agda
  'derekelkins/agda-vim',

  -- Racket
  'wlangstroth/vim-racket',

  -- Racket Pollen
  'otherjoel/vim-pollen',

  -- ===Ai===
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- Required for Job and HTTP requests
    },
    build = "npm install -g mcp-hub@latest",
  },

  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            show_result_in_chat = true,  -- Show mcp tool results in chat
            make_vars = true,            -- Convert resources to #variables
            make_slash_commands = true,  -- Add prompts as /slash commands
          }
        }
      }
    },
  },

  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   version = false, -- Never set this value to "*"! Never!
  --   opts = {
  --     -- add any opts here
  --     -- for example
  --     provider = "gemini", -- openai, gemini
  --     -- openai = {
  --     --   -- endpoint = "https://api.openai.com/v1",
  --     --   model = "gpt-4o-mini", -- your desired model (or use gpt-4o, etc.)
  --     --   -- timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
  --     --   -- temperature = 0,
  --     --   -- max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
  --     --   --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
  --     -- },
  --     gemini = {
  --       model = "gemini-2.0-flash"
  --     },
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "echasnovski/mini.pick", -- for file_selector provider mini.pick
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --     "ibhagwan/fzf-lua", -- for file_selector provider fzf
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- }
}

require("lazy").setup(plugins, {})
