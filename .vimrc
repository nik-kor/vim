set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set autoindent
set smartindent

Plugin 'gmarik/vundle'

" TODO sort it!
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'scrooloose/syntastic'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nvie/vim-flake8'
Plugin 'airblade/vim-gitgutter'
Plugin 'digitaltoad/vim-jade'
Plugin 'groenewege/vim-less'
Plugin 'matze/vim-move'
Plugin 'goldfeld/vim-seek'
Plugin 'mhinz/vim-tmuxify'
Plugin 'corntrace/bufexplorer'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'vim-scripts/mru.vim'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-scripts/ScrollColors'
" Plugin 'msanders/snipmate.vim'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/taglist.vim'
Plugin 'stephpy/vim-phpdoc'
Plugin 'taxilian/VimDebugger'
Plugin 'vim-scripts/Colour-Sampler-Pack'
Plugin 'rking/ag.vim'
Plugin 'SirVer/ultisnips'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
Plugin 'benmills/vimux'
Plugin 'derekwyatt/vim-scala'
Plugin 'kien/ctrlp.vim'
Plugin 'evidens/vim-twig'
Plugin 'sjl/gundo.vim'

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


" persist (g)undo tree between sessions
set undofile
set history=100
set undolevels=100

" backup/persistence settings
set undodir=~/.vim/tmp/undo//

nnoremap <F5> :GundoToggle<CR>
