set nocompatible

execute pathogen#infect()
call pathogen#helptags()

let mapleader=","

" Basic configuration {{{
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

set laststatus=2
set noshowmode
set list
set listchars=trail:·,precedes:«,extends:»,tab:\|\
set pastetoggle=<F12>

set tabstop=2
set shiftwidth=2
set expandtab

set colorcolumn=81
set foldmethod=syntax
" }}}

" Plugin configuration {{{
syntax enable
filetype plugin indent on
autocmd StdinReadPre * let s:std_in=1

" FZF
set rtp+=~/.fzf

" Ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Syntastic
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_filetype_map = { 'html.handlebars': 'handlebars' }
let g:syntastic_haskell_hdevtools_args = '-g-isrc -g-Wall'
let g:syntastic_haskell_hlint_args = "-c=never"
let g:syntastic_haskell_checkers = ['hlint', 'hdevtools', 'ghc-mod']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = { 'mode': 'passive' }

" Git gutter
set signcolumn=yes
let g:gitgutter_highlight_lines = 0
highlight clear SignColumn
highlight GitGutterAdd guibg=green
highlight GitGutterChange guibg=yellow
highlight GitGutterDelete guibg=red
highlight GitGutterChangeDelete guibg=yellow

" Limelight
" let g:limelight_conceal_ctermfg = 0

" Goyo
let g:goyo_width = '85%'
let g:goyo_height = '85%'

" JavaScript
let g:jsx_ext_required = 0

" Mustache
let g:mustache_abbreviations = 1

" Tagbar
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

nmap <F8> :TagbarToggle<CR>

" GHC-Mod
nnoremap <silent> tw :GhcModTypeInsert<CR>
nnoremap <silent> ts :GhcModSplitFunCase<CR>
nnoremap <silent> tq :GhcModType<CR>
nnoremap <silent> te :GhcModTypeClear<CR>
" }}}

" Key Bindings {{{

" Center search results
set scrolloff=5
nnoremap n nzz
nnoremap N Nzz

" Cursor behaviour
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap <up> zk
nnoremap <down> zj
nnoremap <left> zc
nnoremap <right> zo

" Window movement
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Plugin bindings
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-p> :Files<CR>
" noremap <silent> <C-p> :FZF --reverse<CR>
nnoremap <leader>a :call fzf#vim#ag(expand('<cword>'), {'options': '--exact --select-1 '})<CR>
nnoremap <leader>d :call fzf#vim#tags(expand('<cword>') . " ", {'options': '--exact --select-1 --exit-0'})<CR>
nnoremap <leader>f :NERDTreeFind<CR>

nnoremap <leader>g :Goyo<CR>
nnoremap <leader>l :Limelight!!<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>r :MRU<CR>
nnoremap <leader>s :SyntasticCheck<CR>
nnoremap <leader>t :Tags<CR>

nnoremap <silent> <leader>cc :silent! call ToggleConcealQualified()<cr>

" Editor commands
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q<CR>

" Folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Display highlight group
noremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}

" Spelling corrections {{{
set iskeyword+=-
set iskeyword-=$

iabbrev fucntion function
iabbrev funciton function
iabbrev fuction function
iabbrev reutrn return
iabbrev retrun return
iabbrev Moand Monad
" }}}

" Filetype overrides {{{
" Vimscript
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" Ruby
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2
" }}}

" Color scheme {{{
let g:solarized_termcolors=256
let g:jellybeans_use_term_background_color=0
let g:seoul256_background = 234
let g:seoul256_srgb = 1

set background=dark
colorscheme seoul256

hi hs_declareFunction ctermfg=red
" }}}

" Functions {{{

autocmd BufWritePre * %s/\s\+$//e

function! ToggleConcealQualified()
  if (matchdelete(99) == -1)
    call matchadd('Conceal', '\(qualified\|import\|as\)\@<![^a-zA-Z0-9\.]\zs\([A-Z]\w*\.\)\+', 100, 99)
  endif
endfunction

" }}}

" autocmd! InsertEnter * :set conceallevel=0
" autocmd! InsertLeave * :set conceallevel=2
set conceallevel=1

