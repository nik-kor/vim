function! s:doSomething()
    echo 'Iam doing something'
endfunction

command DoSomething :call <SID>doSomething()
nmap k :DoSomething<CR>
