" VimPlug
call plug#begin('~/.vim/plugged')

Plug 'elmcast/elm-vim'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'elixir-lang/vim-elixir'
Plug 'fatih/vim-go'
"Plug 'garbas/vim-snipmate'
Plug 'garyburd/go-explorer'
Plug 'gmarik/Vundle.vim'
Plug 'junegunn/gv.vim'
Plug 'justincampbell/vim-eighties'
Plug 'kien/ctrlp.vim'
Plug 'Konfekt/FastFold'
Plug 'majutsushi/tagbar'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mbbill/undotree'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/vimproc.vim'
Plug 'SirVer/ultisnips'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'jodosha/vim-godebug'


call plug#end()
filetype plugin indent on

" basic settings
set nocompatible
set autoindent " always set autoindenting on
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set copyindent " copy the previous indentation on autoindenting
set updatetime=300
" set encoding=utf-8
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
" Status bar
set noshowmode
set laststatus=2
" Mouse
if has('mouse') | set mouse=a | endif

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


" Autocmds
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

autocmd FileType ruby       set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType coffee     set tabstop=2|set shiftwidth=2
autocmd FileType javascript set tabstop=2|set shiftwidth=2
autocmd FileType php        set shiftwidth=4|set expandtab
autocmd FileType go         set tabstop=8|set shiftwidth=8|set noexpandtab
autocmd FileType erlang     set tabstop=2 shiftwidth=2 expandtab
autocmd FileType yaml       set tabstop=2 shiftwidth=2 expandtab

" folding
set foldlevel=1
set foldmethod=indent
set foldnestmax=10
set nofoldenable

" Persisteng undo
if has('persistent_undo')
    set undolevels=5000
    set undodir=$HOME/.VIM_UNDO_FILES
    set undofile
endif

" maps
nnoremap <CR> :set nohlsearch!<CR>
nnoremap <F8> :TagbarToggle<CR>

" -> buffers
noremap <S-C-CR> :BufExplorerHorizontalSplit<CR>

" misc
cmap w!! w !sudo tee % >/dev/null " w!! for saving as root

" Text Bubbling
" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Snip config
" Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" CtrlP {{{
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)|vendor|node_modules$'
" }}}

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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" colors and cursor
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

set list
set listchars=tab:┊\ ,
hi SpecialKey ctermfg=235 ctermbg=bg

set cursorline
hi clear CursorLine
hi CursorLineNR cterm=bold

" vim-go
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
let g:go_term_enabled = 1
let g:go_fmt_fail_silently = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:syntastic_go_checkers = ['go']
let g:go_list_type = "quickfix"

" Deoplete
"let g:deoplete#enable_at_startup = 1
"call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])