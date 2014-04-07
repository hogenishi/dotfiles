" NeoBundle
set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))
endif

" vim plugins

filetype plugin indent on
filetype indent on
syntax on

