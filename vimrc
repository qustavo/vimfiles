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

colorscheme pablo
if &t_Co > 2 || has("gui_running")
  colorscheme moria

   " switch syntax highlighting on, when the terminal has colors
  syntax on
  set background=dark
  set t_Co=256 " 256 color mode
  set cursorline " highlight current line
  highlight CursorLine guibg=#003853 ctermbg=24 gui=none cterm=none " switch syntax highlighting on, when the terminal has colors

  set colorcolumn=81
  highlight ColorColumn guibg=#202020
  set showtabline=2 "always show tab bar
endif

" editing behaviour
" set list
" set listchars=tab:▸\ ,extends:❯,precedes:❮

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

" NERDTree
"
" Q. How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd vimenter * if !argc() | NERDTree | endif
" Q. How can I map a specific key or shortcut to open NERDTree?
map <C-n> :NERDTreeToggle<CR> " Ctrl-n
" Q. How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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

" Vundle
" ---
" Vundle Requirements
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" My Vundles
Plugin 'airblade/vim-gitgutter'
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
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/vimproc.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on