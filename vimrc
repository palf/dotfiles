set nocompatible

execute pathogen#infect()
call pathogen#helptags()

let mapleader=","

set hidden
set nowrap
set backspace=indent,eol,start
set autoindent
set copyindent
set number
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

set background=dark
colorscheme jellybeans
let g:jellybeans_use_term_background_color=1

set laststatus=2
set noshowmode
set list
set listchars=trail:·,precedes:«,extends:»,tab:\|\ 
set pastetoggle=<F12>

nnoremap ; :

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap th :tabfirst<CR>
nnoremap tj :tabprev<CR>
nnoremap tk :tabnext<CR>
nnoremap tl :tablast<CR>
nnoremap tt :tabnew<CR>
nnoremap te :tabedit<Space>
nnoremap tm :tabmove<Space>
nnoremap tq :tabclose<CR>

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>

" centering search results
set scrolloff=5
nnoremap n nzz
nnoremap N Nzz

nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q<CR>

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
let g:limelight_conceal_ctermfg = 0

set rtp+=~/.fzf
noremap <C-p> :FZF<CR>
noremap <leader>n :NERDTreeToggle<CR>
noremap <leader>f :NERDTreeFind<CR>
noremap <leader>r :MRU<CR>
noremap <leader>s :SyntasticCheck<CR>
noremap <leader>l :Limelight!!<CR>
noremap <leader>g :Goyo<CR>
noremap <leader>t :Toc<CR>
let g:ackprg = 'ag --nogroup --nocolor --column'

set tabstop=2
set shiftwidth=2
set expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2

let g:mustache_abbreviations = 1
let g:syntastic_haskell_hdevtools_args = '-g-isrc -g-Wall'
let g:syntastic_haskell_hlint_args = "-c=never"
let g:syntastic_haskell_checkers = ['hlint']
let g:syntastic_javascript_checkers = ['eslint']
let g:jsx_ext_required = 0
let g:goyo_width = '85%'
let g:goyo_height = '85%'
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['branch', 'tabline']
let g:airline#extensions#tabline#fnamemod = ':t'

set colorcolumn=80
set foldmethod=syntax

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

noremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"Spelling corrections ------------------------ {{{
iabbrev fucntion function
iabbrev fuction function
iabbrev reutrn return
" }}}

"Vimscript file settings --------------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

"Color overrides ----------------------------- {{{
hi! link Folded Ignore
hi link haskellType Type
" }}}

let g:jsx_ext_required = 0
