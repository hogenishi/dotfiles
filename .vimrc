" NeoBundle
set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))
endif

"" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'itchyny/lightline.vim'
"NeoBundle 'nanotech/jellybeans.vim'
"NeoBundle 'w0ng/vim-hybrid'
"NeoBundle 'tomasr/molokai'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'scrooloose/nerdtree'

""" neocomplcache
"""" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
"""" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
"""" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
"""" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"""" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }
"""" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
"""" Recommended key-mappings.
"""" <CR>: close popup and save indent.
noremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
"""" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"""" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

""" NERD Tree
map <C-n> :NERDTreeToggle<CR>
"""" 隠しファイルを表示する。
let NERDTreeShowHidden = 1 
"""" 引数なしで実行したとき、NERDTreeを実行する
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * execute 'NERDTree ./'
endif

""" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"\u2b64":""}',
      \ },
      \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
      \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
      \ }

" others
filetype plugin indent on
filetype indent on
syntax on


" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

