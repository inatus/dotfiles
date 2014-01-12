set nocompatible
filetype off            " for vundle

" Golang setting
if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
  exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
  set completeopt=menu,preview
endif

if has("vim_starting")
  set rtp+=$HOME/.vim/neobundle.vim/
  call neobundle#rc(expand('~/.vim/neobundle'))
endif

" NeoBundle
NeoBundle 'http://github.com/Shougo/neocomplcache.git'
NeoBundle 'http://github.com/Shougo/unite.vim.git'
NeoBundle 'http://github.com/altercation/vim-colors-solarized.git'
NeoBundle 'http://github.com/thinca/vim-quickrun.git'
NeoBundle 'http://github.com/glidenote/memolist.vim.git'
NeoBundle 'http://github.com/tyru/open-browser.vim.git'
NeoBundle 'pentie/VimRepress'
NeoBundle 'JavaScript-syntax'
NeoBundle 'pangloss/vim-javascript'

syntax enable
set background=dark
colorscheme solarized

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
set spell
set spelllang=en_us,cjk

set showtabline=2
set guioptions-=T
set antialias
set tabstop=4
set shiftwidth=4
set number
set nobackup
set visualbell t_vb=
set textwidth=0

" memolist.vim config
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>

" .vimrc .gvimrc edit
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>

" Set augroup.
augroup MyAutoCmd
    autocmd!
augroup END

if !has('gui_running') && !(has('win32') || has('win64'))
    " Change colors even when .vimrc is reloaded
    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
else
    " Change colors even when .vimrc is reloaded
    autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC |
                \if has('gui_running') | source $MYGVIMRC
    autocmd MyAutoCmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
endif

let g:quickrun_config = {
\   "_" : {
\       "outputter/buffer/split" : ":botright 6sp",
\       "outputter/buffer/close_on_empty" : 1,
\   },
\}

let g:quickrun_config['markdown'] = {
      \ 'outputter': 'browser'
      \ }

" toggle <sp>ell
nnoremap <silent> <Space>sp :<C-u>setlocal spell! spelllang=en_us,cjk<CR>:setlocal spell?<CR>



" -----------------------------------------
" Read .vimrc.local if any
" This must be described at the last line
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
