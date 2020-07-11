""" General configurations
set nocompatible
set t_Co=256
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format.
Plugin 'gmarik/Vundle.vim'

" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site,
" e.g. Plugin 'Buffergator'

""" My Plugins
" Colorschemes
Plugin 'nanotech/jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-vividchalk'
Plugin 'fxn/vim-monochrome'
Plugin 'vyshane/vydark-vim-color'

" Syntax and PL related stuff
" Plugin 'scrooloose/syntastic'             " Syntax checker.
Plugin 'jelera/vim-javascript-syntax'     " Enhanced JavaScript syntax.
Plugin 'mattn/emmet-vim.git'              " HTML and CSS speed coding.
Plugin 'othree/html5-syntax.vim'          " HTML5 syntax.
" Plugin 'adimit/prolog.vim'                " Prolog syntax.
Plugin 'Jinja'                            " Flask template engine syntax.
Plugin 'idris-hackers/idris-vim'          " Idris syntax highlighting.
Plugin 'derekelkins/agda-vim'             " Agda syntax highlighting.
" Erlang plugins
Plugin 'jimenezrick/vimerl'               " Indenting, autocomplete and more for Erlang.
Plugin 'elixir-lang/vim-elixir'           " Elixir support for vim.
" LaTeX
Plugin 'LaTeX-Box-Team/LaTeX-Box'         " Lightweight toolbox for LaTeX.


" COOL plugins
Plugin 'vim-scripts/cool.vim'

Plugin 'kien/ctrlp.vim'                   " Fuzzy search for files.
Plugin 'scrooloose/nerdtree'              " Enables tree like view of your filesystem.
" Plugin 'sjl/gundo.vim'                    " Visualizes the undo tree.
Plugin 'mikewest/vimroom'                 " Makes for better writing experience (<LEADER>V).

Plugin 'tpope/vim-commentary'             " You can comment stuff out with this (gcc).
" Plugin 'tpope/vim-endwise'                " Automatic ending of structures (only for a few languages).
Plugin 'tpope/vim-surround'               " Easy surrounds and so on.
Plugin 'Lokaltog/vim-easymotion'          " Adds additional simple motions.

call vundle#end() 

syntax enable      " Enables syntax highlighting.
filetype plugin indent on

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

set number         " Shows line numbers.
set relativenumber
set cursorline     " Highlights current line.
set showmatch      " Shows bracket matches.
set encoding=utf-8
" set vb             " Enables visual bell (disables audio bell).
set wildmenu       " Enables bash style tab completion.
set lazyredraw     " redraw only when we need to.

" Tabs functionality
set expandtab     " Insers spaces instead of tabs.
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Indentation functionality
set nowrap
set autoindent " Copies indentation from previous line.

" Search
set hlsearch   " Highlights searches.
set ignorecase " Ignores case while searching.
set smartcase  " Ignore 'ignorecase' if search contains uppercase letters.
set incsearch  " Highlights dynamically as you start to search.

set ttimeoutlen=100 " Solves the problem with delayed O.

""" Key Bindings
let mapleader   = "\<Space>"
let localleader = ","

" Tabs
noremap <C-l> :tabnext<CR>
inoremap <C-l> <Esc>:tabnext<CR>

noremap <C-h> :tabprevious<CR>
inoremap <C-h> <Esc>:tabprevious<CR>

noremap <C-t> :tabedit<CR>
inoremap <C-t> <Esc>:tabedit<CR>


"" Selections
nnoremap <leader>h :nohlsearch<CR>

"" Save & Quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

"" Copy & Paste
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

"" Modifications

" Sources ~/.vimrc.
noremap <leader>s :source $MYVIMRC<CR>

" Open ~/.vimrc in a new tab
nnoremap <leader>v :tabedit $MYVIMRC<CR>

" ctag
nnoremap <f5> :!ctags -R<CR>
nnoremap <leader>] <C-]>
nnoremap <leader>[ :pop<CR>

" Emmet
let g:user_emmet_leader_key=',,'


" NERDD Tree
noremap <C-n> :NERDTreeToggle<CR>

" Gundo
nnoremap <leader>u :GundoToggle<CR>

" Syntastic
" let g:syntastic_php_checkers = ['php']

""" Abbriviations
" iabbrev @@    yuriy.dupyn@gmail.com
" iabbrev ccopy Copyright 2014 Jura Dupyn, all rights reserved


""" Adding comment syntax for unfamiliar languages
autocmd FileType apache set commentstring=%\ %s   " Prolog comments
autocmd FileType lhaskell set commentstring=>\ %s " Haskell comments
autocmd FileType sml set commentstring=(*\ %s*)   " ML comments

" Python tabs
autocmd Filetype python set expandtab tabstop=2 softtabstop=2 shiftwidth=2

" Changing comment color.
" highlight Comment ctermfg=lightblue
highlight Comment ctermfg=lightyellow 

nohlsearch

