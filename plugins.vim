call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/ScrollColors'
Plug 'tpope/vim-commentary'
Plug 'chriskempson/base16-vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }
Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'eagletmt/neco-ghc'

Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'miyakogi/conoline.vim'
Plug 'ervandew/supertab'

Plug 'garbas/vim-snipmate'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'

Plug 'itchyny/lightline.vim'
Plug 'elmcast/elm-vim'
Plug 'jxnblk/vim-mdx-js'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

call plug#end()
