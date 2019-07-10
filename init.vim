source ~/.config/nvim/plugins.vim

set autoindent
set smartindent

filetype plugin indent on " required!

"" color schema block
colorscheme base16-ocean

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
set cc=121

set relativenumber
""-----------Searching------------
set showmatch
set hlsearch "highlight search results
set incsearch "incremantal searching
set ignorecase "case insensitive search

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

"" json stuff
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.tsx set ft=typescript
autocmd BufNewFile,BufRead *.bemtree,*.bemhtml set ft=javascript

syntax on

let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper'] }
let g:LanguageClient_autoStart = 1

set rtp+=/usr/local/opt/fzf

let g:elm_format_autosave = 1
let g:elm_make_output_file = "main.js"

call deoplete#enable()

map <F2> :COLOR<CR>

nnoremap ; :
nnoremap ! :!

inoremap jk <Esc>

noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" tabs navigation
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

nnoremap <silent> go :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> ga :call LanguageClient#textDocument_codeAction()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> gfd :call LanguageClient#textDocument_formatting()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

nnoremap <silent> E :set cmdheight=8<CR>
nnoremap <silent> H :set cmdheight=1<CR>

" map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
" map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
" map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
" map <Leader>lb :call LanguageClient#textDocument_references()<CR>
" " map la :call LanguageClient#textDocument_codeAction()<CR>
" map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

map so :so ~/.config/nvim/init.vim<CR>

noremap <C-p> :FZF<CR>
