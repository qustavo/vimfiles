" basic settings
set nocompatible
set autoindent " always set autoindenting on
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set copyindent " copy the previous indentation on autoindenting
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set hidden " hide buffer instead of closing them.
set history=1000 " remember more commands and search history
set hlsearch " highlight search terms
set ignorecase " ignore case when searching
set incsearch " show search matches as you type
set nobackup
set noswapfile
set nowrap " don't wrap lines
set number
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=4 " number of spaces to use for autoindenting
set showmatch " set show matching parenthesis
set smartcase " ignore case if search pattern is all lowercase,
" case-sensitive otherwise
set smarttab " insert tabs on the start of a line according to
" shiftwidth, not tabstop
set tabstop=4 " a tab is four spaces
set title " change the terminal's title
set undolevels=1000 " use many muchos levels of undo
set expandtab
set binary
set noeol
set tags=.tags
" splits
set splitbelow
set splitright

" Wildmenu completion {{{
set wildmenu
set wildmode=list:longest,full

set wildignore+=.hg,.git,.svn " Version control
set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl " compiled spelling word lists
set wildignore+=*.sw? " Vim swap files
set wildignore+=*.DS_Store " OSX bullshit
set wildignore+=*.luac " Lua byte code
set wildignore+=migrations " Django migrations
set wildignore+=*.pyc " Python byte code
set wildignorecase " ignore case for searching files
" }}}

" CtrlP {{{
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)|vendor|node_modules$'
" }}}

" Save when losing focus
au FocusLost * :wa

""
" folding
set foldlevel=1
set foldmethod=indent
set foldnestmax=10
set nofoldenable

" maps
nnoremap <CR> :set nohlsearch!<CR>
nnoremap <F8> :TagbarToggle<CR>
" -> tabs
"noremap <S-C-Left> :tabprevious<CR>
"noremap <S-C-Right> :tabnext<CR>
"noremap <S-C-CR> :tabnew<SPACE>
"inoremap <S-C-Left> <Esc>:tabprevious<CR><Insert>
"inoremap <S-C-Right> <Esc>:tabnext<CR><Insert>

" -> buffers
noremap <S-C-CR> :BufExplorerHorizontalSplit<CR>

" misc
cmap w!! w !sudo tee % >/dev/null " w!! for saving as root

" Custom settings depending on FileType
autocmd FileType ruby       set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType coffee     set tabstop=2|set shiftwidth=2
autocmd FileType javascript set tabstop=2|set shiftwidth=2
autocmd FileType javascript map <buffer> <Leader>R :w<CR>:!/usr/bin/env node % <CR>
autocmd FileType php        set shiftwidth=4|set expandtab
autocmd FileType go         set tabstop=8|set shiftwidth=8|set noexpandtab

" Text Bubbling
" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Status bar
set noshowmode
set laststatus=2

" Airline
" Need  aur/powerline-fonts-git installed to run nice icons
set laststatus=2
set noshowmode
let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#syntastic#enabled = 1
if has('gui_running')
    let g:airline_powerline_fonts = 1
else
    let g:airline_powerline_fonts = 0
    let g:airline_left_sep=''
    let g:airline_right_sep=''
endif

" Tomato
let g:tomato#show_clock = 1
let g:tomato#show_count_down = 1
let g:tomato#remind = "☻"
let g:tomato#restinfo = "☺"

" Syntastic

" When set to 1 the error window will be automatically opened when errors are
" detected, and closed when none are detected.
let g:syntastic_auto_loc_list=1

" vim-go
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
let g:go_fmt_command = "goimports"
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Vundle
" ---
" Vundle Requirements
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" My Vundles
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'fatih/vim-go'
Plugin 'garbas/vim-snipmate'
Plugin 'gmarik/Vundle.vim'
Plugin 'honza/vim-snippets'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'joonty/vdebug.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'mbbill/undotree'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/vimproc.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'Zuckonit/vim-airline-tomato'

call vundle#end()
filetype plugin indent on

" colors
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized