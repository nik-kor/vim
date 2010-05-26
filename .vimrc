"-----------Encoding------------
set termencoding=utf-8
set fileencodings=utf8,cp1251
"WARNING 09.10.2009[morning] change encoding from cp1251 to utf-8. a little scared
set encoding=utf-8 "кодировка, в которой вим хранит все данные, т.е. текст буфферов, строки
                    "в выражениях, содержимое регистров и т.д.

"-----------Editing------------
set shiftwidth=4
set ts=4
set smarttab
set et "автозамена по умолчанию
set wrap "перенос длинных строк
set cin "отступы в стиле C
set ai "при наличии новой строки отступ копируется с предыдующей


"-----------Misc------------
filetype plugin on "Включаем filetype плагины.
set number "нумерация строк
:imap <C-O> <Esc>:exe PhpDocSingle()<CR>

"-----------Searching------------
set showmatch
set hlsearch "highlight search results
set incsearch "incremantal searching
set ignorecase "case insensitive search

"set smartcase "If you have a string with at least one uppercase character, however, the search becomes
              "case sensitive.


"-----------Tabs-----------------
:nmap <C-t> :tabnew<CR>
:imap <C-t> <Esc>:tabnew<CR>
:map <C-z> :tabprevious<CR>
:map <C-x> :tabnext<CR>

"-----------Backups------------
set backup " включить сохранение резервных копий
" сохранять умные резервные копии ежедневно
function! BackupDir()
	" определим каталог для сохранения резервной копии
	let l:backupdir=$HOME.'/.vim/backup/'.
			\substitute(expand('%:p:h'), '^'.$HOME, '~', '')

	" если каталог не существует, создадим его рекурсивно
	if !isdirectory(l:backupdir)
		call mkdir(l:backupdir, 'p', 0700)
	endif

	" переопределим каталог для резервных копий
	let &backupdir=l:backupdir

	" переопределим расширение файла резервной копии
	let &backupext=strftime('~%Y-%m-%d~')
endfunction

" выполним перед записью буффера на диск
autocmd! bufwritepre * call BackupDir()



" HEX EDITING

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction


" autocmds to automatically enter hex mode and handle file writes properly
if has("autocmd")
  " vim -b : edit binary using xxd-format!
  augroup Binary
    au!
    au BufReadPre *.bin,*.jpg,*.jpeg,*.gif,*.png setlocal binary
    au BufReadPost *
          \ if &binary | Hexmode | endif
    au BufWritePre *
          \ if exists("b:editHex") && b:editHex && &binary |
          \  let oldro=&ro | let &ro=0 |
          \  let oldma=&ma | let &ma=1 |
          \  exe "%!xxd -r" |
          \  let &ma=oldma | let &ro=oldro |
          \  unlet oldma | unlet oldro |
          \ endif
    au BufWritePost *
          \ if exists("b:editHex") && b:editHex && &binary |
          \  let oldro=&ro | let &ro=0 |
          \  let oldma=&ma | let &ma=1 |
          \  exe "%!xxd" |
          \  exe "set nomod" |
          \  let &ma=oldma | let &ro=oldro |
          \  unlet oldma | unlet oldro |
          \ endif
  augroup END
endif

" some options on open/close file
au BufWinLeave * mkview
au BufWinEnter * silent loadview
