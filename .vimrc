set nocompatible

execute pathogen#infect()
call pathogen#helptags()

let mapleader=","
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set hidden
set nowrap
set tabstop=4
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftwidth=4
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set incsearch
set hlsearch

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set visualbell
set noerrorbells

set nobackup
set noswapfile

let g:airline_theme='pencil'
let g:airline_powerline_fonts = 1
set background=dark
colorscheme pencil
let g:pencil_higher_contrast_ui = 1   " 0=low (def), 1=high

set laststatus=2
set noshowmode
set list
set listchars=trail:·,precedes:«,extends:»,tab:▸·
set pastetoggle=<F12>

nnoremap ; :

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

nmap <Tab> :b#<CR>
nmap <leader>w :w!<cr>
nmap <leader>q :q<CR>
map <F2> :colorscheme solarized<CR>:set background=light<CR>
map <F3> :colorscheme solarized<CR>:set background=dark<CR>

syntax enable
syntax on
filetype plugin indent on
autocmd StdinReadPre * let s:std_in=1

map <C-n> :NERDTreeToggle<CR>
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:gitgutter_sign_column_always = 1
let g:gitgutter_highlight_lines = 0
highlight clear SignColumn
highlight GitGutterAdd guibg=green
highlight GitGutterChange guibg=yellow
highlight GitGutterDelete guibg=red
highlight GitGutterChangeDelete guibg=yellow

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_filetype_map = { 'html.handlebars': 'handlebars' }

set rtp+=~/.fzf
map <C-p> :FZF<CR>
let g:ackprg = 'ag --nogroup --nocolor --column'

set ts=2
set sw=2
set expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
autocmd FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

let g:mustache_abbreviations = 1
let g:syntastic_haskell_hdevtools_args = '-g-isrc -g-Wall'

