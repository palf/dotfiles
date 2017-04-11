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

" FZF {{{
set rtp+=~/.fzf
" }}}

" Ag {{{
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" }}}

" Syntastic {{{
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_filetype_map = { 'html.handlebars': 'handlebars' }
let g:syntastic_haskell_hdevtools_args = '-g-isrc -g-Wall'
let g:syntastic_haskell_hlint_args = "-c=never"
let g:syntastic_haskell_checkers = ['hlint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = { 'mode': 'passive' }
" }}}

" Git gutter {{{
let g:gitgutter_sign_column_always = 1
let g:gitgutter_highlight_lines = 0
highlight clear SignColumn
highlight GitGutterAdd guibg=green
highlight GitGutterChange guibg=yellow
highlight GitGutterDelete guibg=red
highlight GitGutterChangeDelete guibg=yellow
" }}}

" Limelight {{{
let g:limelight_conceal_ctermfg = 0
" }}}

" Goyo {{{
let g:goyo_width = '85%'
let g:goyo_height = '85%'
" }}}

" JavaScript {{{
let g:jsx_ext_required = 0
" }}}

" Mustache {{{
let g:mustache_abbreviations = 1
" }}}

" GHC-Mod {{{
nnoremap <silent> tw :GhcModTypeInsert<CR>
nnoremap <silent> ts :GhcModSplitFunCase<CR>
nnoremap <silent> tq :GhcModType<CR>
nnoremap <silent> te :GhcModTypeClear<CR>
" }}}
" }}}

" Key Bindings {{{

" Center search results {{{
set scrolloff=5
nnoremap n nzz
nnoremap N Nzz
" }}}

" Cursor behaviour {{{
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap <up> zk
nnoremap <down> zj
nnoremap <left> zc
nnoremap <right> zo

nnoremap <C-h> :tabprev<CR>
nnoremap <C-j> :bprev<CR>
nnoremap <C-k> :bnext<CR>
nnoremap <C-l> :tabnext<CR>
" }}}

" Window movement {{{
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" }}}

" Plugin bindings {{{
noremap <C-p> :FZF -m --reverse --preview="head -\$LINES {}"<CR>
noremap <leader>a /\<<C-R><C-W>\><CR>:Ack "\b<C-R><C-W>\b"<CR>
noremap <leader>t :Tags<CR>
noremap <leader>n :NERDTreeToggle<CR>
noremap <leader>f :NERDTreeFind<CR>
noremap <leader>r :MRU<CR>
noremap <leader>s :SyntasticCheck<CR>
noremap <leader>l :Limelight!!<CR>
noremap <leader>g :Goyo<CR>
" }}}

" Editor commands {{{
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q<CR>
" }}}

" {{{ Folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" }}}

" Display highlight group {{{
noremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}
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
" Vimscript {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Ruby {{{
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2
" }}}
" }}}

" Colorscheme {{{
let g:solarized_termcolors=256
set background=dark
colorscheme jellybeans
let g:jellybeans_use_term_background_color=0

hi link haskellType Type
hi link xmlAttrib htmlSpecialChar
hi link jsFuncCall Question
" }}}

" Functions {{{

function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R')
  endif

  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v -a ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Tab> :call fzf#run({
\   'source':  <sid>buflist(),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m --reverse',
\   'down':    '40%'
\ })<CR>

" }}}
