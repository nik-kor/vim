" doesn't work well over sshfs
" noremap <silent> <F4> :call ExecuteTask('')<CR>
" noremap <silent> <F5> :call ExecuteTask('cc')<CR>
" noremap <silent> <F6> :call ExecuteTask('doctrine:build-all-reload --no-confirmation')<CR>
noremap <silent> <F3> :call sf:SwitchFile('config/app.yml')<CR>
noremap <silent> <F2> :call sf:SwitchFile('config/doctrine/schema.yml')<CR>
noremap <silent> <F5> :call sf:SwitchFileForCurrentApp('config/app.yml')<CR>
noremap <silent> <F6> :call sf:SwitchFileForCurrentApp('config/routing.yml')<CR>
noremap <silent> <F9> :call sf:EditInDirectoryList(sf:FindCurrentModulePath().'/actions/')<CR>
noremap <silent> <F10> :call sf:EditInDirectoryList(sf:FindCurrentModulePath().'/templates/')<CR>
command! -nargs=* Sf :call sf:ExecuteTask(<q-args>)

noremap <silent> <S-c> :call sf:ExecuteTask('cc')<CR>

let ctags_command = 'ctags -R --exclude=.svn --languages=php'
