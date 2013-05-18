set nocompatible
filetype off            " for vundle

if has("vim_starting")
set rtp+=$HOME/.vim/neobundle.vim/
call neobundle#rc(expand('~/.vim/neobundle'))
endif

" NeoBundle
NeoBundle 'http://github.com/Shougo/neocomplcache.git'
NeoBundle 'http://github.com/Shougo/unite.vim.git'
NeoBundle 'http://github.com/altercation/vim-colors-solarized.git'

syntax enable
set background=dark
colorscheme solarized

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
set spell

set showtabline=2
set guioptions-=T
set antialias
set tabstop=4
set shiftwidth=4
set number
set nobackup
set visualbell t_vb=
set textwidth=0