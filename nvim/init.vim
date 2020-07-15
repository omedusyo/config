
""" Don't forget to run :checkhealth

" PLUGINS
" Check out https://github.com/junegunn/vim-plug for initialization
call plug#begin(stdpath('data') . '/plugged')
""" My Plugins

" Colorschemes
Plug 'nanotech/jellybeans.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-vividchalk'
Plug 'fxn/vim-monochrome'
Plug 'vyshane/vydark-vim-color'

Plug 'jiangmiao/auto-pairs'             " Insert or delete brackets, parens, quotes in pair. !!! Could cause problems

Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense. Tries to make your Vim/Neovim as smart as VSCode.
                                                " Seems to require nodejs
" Shortcuts
" gr : finds all the locations of an identifier
" shift-k : gives help

Plug 'sheerun/vim-polyglot'             " A collection of language packs.

Plug 'itchyny/lightline.vim'            " Statusline/tabline plugin .

Plug 'mhinz/vim-startify'               " Start screen.

Plug 'junegunn/goyo.vim'                " Distraction-free writing.

Plug 'preservim/nerdtree'               " Enables tree like view of your filesystem.

Plug 'LaTeX-Box-Team/LaTeX-Box'         " Lightweight toolbox for LaTeX.

" Send stuff to REPL 
Plug 'jpalardy/vim-slime'

" Initialize plugin system
call plug#end()

source $HOME/.config/nvim/my_coc.vim

" BASIC CONFIGURATION

" Colorscheme configurations

" solarized light
" set background=light
" let g:solarized_termcolors=256
" colorscheme solarized

" solarized dark
set background=dark
colorscheme solarized

" colorscheme jellybeans
" colorscheme vydark
" colorscheme monochrome
" colorscheme vividchalk


set encoding=utf-8

" Line Numbers
set number         " Shows line numbers.
" set relativenumber
set cursorline     " Highlights current line.

" Mouse
set mouse=a

" Tabs functionality
set expandtab     " Insers spaces instead of tabs.
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Indentation functionality
set nowrap
" set autoindent " Copies indentation from previous line. " TODO: FIND OUT IF THIS IS USELESS

" Search
set ignorecase " Ignores case while searching.
set smartcase  " Ignore 'ignorecase' if search contains uppercase letters.
set incsearch  " Highlights dynamically as you start to search.



""" Key Bindings
let mapleader   = "\<Space>"
let localleader = ","

"" Selections
nnoremap <leader>h :nohlsearch<CR>

"" Save & Quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Sources init.vim (i.e. .vimrc).
noremap <leader>s :source $MYVIMRC<CR>

" Open ~/.vimrc in a new tab
nnoremap <leader>v :tabedit $MYVIMRC<CR>

" Tabs
noremap <C-l> :tabnext<CR>
inoremap <C-l> <Esc>:tabnext<CR>

noremap <C-l> :tabnext<CR>

noremap <C-h> :tabprevious<CR>
inoremap <C-h> <Esc>:tabprevious<CR>

noremap <C-t> :tabedit<CR>
inoremap <C-t> <Esc>:tabedit<CR>

" Resizing panes
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Splitting panes
"nmap <leader>\|   :leftabove  vsplit<CR>
nmap <leader>\| :rightbelow vsplit<CR>
"nmap <leader>_  :leftabove  split<CR>
"nmap <leader>-  :leftabove  split<CR>
nmap <leader>_  :rightbelow split<CR>
nmap <leader>-  :rightbelow split<CR>

"" Copy & Paste
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

" BetterIndentation
vnoremap < <gv
vnoremap > >gv

 
""" Adding comment syntax for unfamiliar languages
autocmd FileType apache set commentstring=%\ %s   " Prolog comments
autocmd FileType lhaskell set commentstring=>\ %s " Haskell comments
autocmd FileType sml set commentstring=(*\ %s*)   " ML comments
autocmd FileType ocaml set commentstring=(*\ %s*) " OCaml comments

" NERDD Tree
" noremap <C-n> :NERDTreeToggle<CR>

" Light Line
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
set noshowmode

" Goyo
nmap <leader>V :Goyo<CR>

" Startify
nmap <leader>m :Startify<CR>


" Vim Slime
let g:slime_target = "tmux"
" Makes the default tmux target plane: current.2
let g:slime_default_config = {"socket_name": "default", "target_pane": ":.2"}
let g:slime_dont_ask_default = 1


nohlsearch

