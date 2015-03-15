source plugins
set autoindent
set smartindent

filetype plugin indent on     " required!

" color schema block
colorscheme dante
map <F2> :COLOR<CR>

" TODO sort it 
set termencoding=utf-8
set fileencodings=utf-8
set encoding=utf-8 
set shiftwidth=4
set ts=4
set smarttab
set et 
set wrap
set cin
set ai

highlight ColorColumn ctermbg=7
set cc=81

set number

"-----------Searching------------
set showmatch
set hlsearch "highlight search results
set incsearch "incremantal searching
set ignorecase "case insensitive search

" TagList
let Tlist_WinWidth = 50
map <C-Left_MouseClick> C-]


fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" remove trailing spaces after save
autocmd BufWritePre *.php,*.js,*.css,*.cpp,*.c,*.txt,*.html,*.json,*.coffee,*.thrift,*.md,*.py,*.feature,*.tex :call <SID>StripTrailingWhitespaces()

au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/syntax/thrift.vim

" json stuff
autocmd BufNewFile,BufRead *.json set ft=javascript

syntax on

noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

nnoremap ; :
" nnoremap : ;
nnoremap ! :!

inoremap jk <Esc>

autocmd BufEnter * :syntax sync fromstart
autocmd InsertLeave * if expand('%') != '' | update | endif


" https://github.com/paulmillr/chokidar/issues/35#issuecomment-18881511
:set backupcopy=yes


" persist (g)undo tree between sessions
set undofile
set history=100
set undolevels=100

" backup/persistence settings
set undodir=~/.vim/tmp/undo//

nnoremap <F5> :GundoToggle<CR>

let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_normal=1

au BufNewFile,BufRead *.ejs set filetype=javascript
let g:tmux_navigator_save_on_switch = 1

" tabs navigation
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
