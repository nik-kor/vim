"-------------------------------------------------------------------------------
" Utils 
"-------------------------------------------------------------------------------

" returns the absolute dirname of a path
" @param string path
" @return string
function! sf:GetAbsoluteDirname(path)
  let l:path = a:path
  " gets the dirname
  if !isdirectory(l:path)
    let l:path = strpart(l:path, 0, strridx(l:path, '/'))
  endif

  " makes it absolute
  if match(l:path, '/') != 0
    let l:path = getcwd().'/'.l:path
  endif

  return l:path
endfunction

" cd to the given path if not empty
" @param string path
" @return bool
function! sf:CdIfNotEmpty(path)
  if strlen(a:path) != 0
    execute 'cd '.a:path
    return 1
  endif
  return 0
endfunction
