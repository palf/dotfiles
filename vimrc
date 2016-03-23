set nocompatible

execute pathogen#infect()
call pathogen#helptags()

let mapleader=","

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
set cursorline

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set visualbell
set noerrorbells

set nobackup
set noswapfile

let g:airline_powerline_fonts = 1
set background=dark
colorscheme jellybeans

set laststatus=2
set noshowmode
set list
set listchars=trail:·,precedes:«,extends:»,tab:\|\ 
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

nnoremap th :tabfirst<CR>
nnoremap tj :tabprev<CR>
nnoremap tk :tabnext<CR>
nnoremap tl :tablast<CR>
nnoremap tt :tabnew<CR>
nnoremap te :tabedit<Space>
nnoremap tm :tabmove<Space>
nnoremap tq :tabclose<CR>

nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprev<CR>

" centering search results
set scrolloff=5
nnoremap n nzz
nnoremap N Nzz

nmap <leader>w :w!<cr>
nmap <leader>q :q<CR>

syntax enable
filetype plugin indent on
autocmd StdinReadPre * let s:std_in=1

let g:gitgutter_sign_column_always = 1
let g:gitgutter_highlight_lines = 0
highlight clear SignColumn
highlight GitGutterAdd guibg=green
highlight GitGutterChange guibg=yellow
highlight GitGutterDelete guibg=red
highlight GitGutterChangeDelete guibg=yellow

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_filetype_map = { 'html.handlebars': 'handlebars' }

set rtp+=/usr/local/opt/fzf
map <C-p> :FZF<CR>
map <leader>f :FZF<CR>
map <leader>r :MRU<CR>
map <leader>l :Limelight!!<CR>
let g:ackprg = 'ag --nogroup --nocolor --column'

set ts=4
set sw=4
set noexpandtab
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2

let g:mustache_abbreviations = 1
let g:syntastic_haskell_hdevtools_args = '-g-isrc -g-Wall'
let g:syntastic_javascript_checkers = ['eslint']
let g:airline_extensions = ['branch', 'tabline', 'tmuxline']
let g:airline#extensions#tabline#fnamemod = ':t'

set colorcolumn=140
set foldmethod=syntax

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" hi! link Folded Ignore
