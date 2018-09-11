if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

function! DoRemote(arg)
	UpdateRemotePlugins
endfunction

" make sure plug is installed
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Start plug
call plug#begin()
Plug 'trusktr/seti.vim'
Plug 'tomasr/molokai'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'nazo/pt.vim'
Plug 'airblade/vim-gitgutter'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'mustache/vim-mustache-handlebars'
Plug 'sickill/vim-pasta'
Plug 'regedarek/ZoomWin'
Plug 'tomtom/tcomment_vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jaawerth/nrun.vim'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'puppetlabs/puppet-syntax-vim'
Plug 'sjl/splice.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'bogado/file-line'
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'tweekmonster/startuptime.vim'
Plug 'w0rp/ale'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
call plug#end()

colorscheme molokai
" Set background color of molokai to gray
let g:molokai_original = 1

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

let g:deoplete#enable_at_startup = 1

set spell
