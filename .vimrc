set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set autoindent
set smartindent

Bundle 'gmarik/vundle'

" TODO sort it!
Bundle 'tpope/vim-fugitive'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'scrooloose/syntastic'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nvie/vim-flake8'
Bundle 'airblade/vim-gitgutter'
Bundle 'digitaltoad/vim-jade'
Bundle 'groenewege/vim-less'
Bundle 'matze/vim-move'
Bundle 'goldfeld/vim-seek'
Bundle 'mhinz/vim-tmuxify'
Bundle 'corntrace/bufexplorer'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'vim-scripts/mru.vim'
Bundle 'tpope/vim-commentary'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/ScrollColors'
" Bundle 'msanders/snipmate.vim'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/taglist.vim'
Bundle 'stephpy/vim-phpdoc'
Bundle 'taxilian/VimDebugger'
Bundle 'vim-scripts/Colour-Sampler-Pack'
Bundle 'rking/ag.vim'
Bundle 'SirVer/ultisnips'
Bundle 'tobyS/vmustache'
Bundle 'tobyS/pdv'

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
:imap <C-O> <Esc>:exe PhpDocSingle()<CR>

"-----------Searching------------
set showmatch
set hlsearch "highlight search results
set incsearch "incremantal searching
set ignorecase "case insensitive search


"-----------Tabs-----------------
:map <C-z> :tabprevious<CR>
:map <C-x> :tabnext<CR>


nmap <C-p> :1po<CR>
nmap <C-n> :1ta<CR>

" TagList
map <F4> :TlistToggle<CR>
let Tlist_WinWidth = 50
map <C-S-F5> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <C-Left_MouseClick> C-]



fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" remove trailing spaces after save
autocmd BufWritePre *.php,*.js,*.css,*.cpp,*.c,*.txt,*.html,*.json,*.coffee,*.thrift,*.md,*.py,*.feature :call <SID>StripTrailingWhitespaces()


au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/syntax/thrift.vim


" json stuff
autocmd BufNewFile,BufRead *.json set ft=javascript

syntax on
filetype plugin indent on


" DEBUGGER

map <C-F11> :DbgStepInto<CR>
map <C-F10> :DbgStepOver<CR>
map <S-F11> :DbgStepOut<CR>
map <C-F5> :DbgRun<CR>
map <S-F5> :DbgDetach<CR>
map <C-F8> :DbgToggleBreakpoint<CR>

nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>

noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h


autocmd BufEnter * :syntax sync fromstart

let g:syntastic_php_checkers = []


" https://github.com/paulmillr/chokidar/issues/35#issuecomment-18881511
:set backupcopy=yes

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>
