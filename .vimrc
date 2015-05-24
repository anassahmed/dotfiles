set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree.git'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic.git'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/taglist.vim'
Bundle 'rstacruz/sparkup'
Plugin 'tComment'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-powerline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'michalliu/sourcebeautify.vim'
" Plugin 'klen/python-mode'
Plugin 'vim-scripts/Efficient-python-folding'
Plugin 'davidhalter/jedi-vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'joonty/vim-phpqa.git'
Plugin 'StanAngeloff/php.vim'
" Plugin 'effkay/argonaut.vim'

" Powerline
set rtp+=~/.powerline/powerline/bindings/vim

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Anass Modifications <anass.1430@gmail.com>
" Enable mouse in VIM
set mouse=a

" Enable Clipboard
" you should use +clipboard or +xterm_clipboard enabled VIM (GVIM for example).
set clipboard=unnamedplus

" Reselect visual block after indent/outdent 
vnoremap < <gv
vnoremap > >gv

" Easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Force saving files which require root permission
cmap w!! %!sudo tee > /dev/null %

" automatically reload vimrc when it's saved
au BufWritePost .vimrc source ~/.vimrc

" Remap <leader> key
let mapleader = ","

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e   :quit<CR> " Quit current window
noremap <Leader>E   :qa<CR>   " Quit all windows

" Quick Tab Moviing
map <Leader>n   <esc>:tabprevious<CR>
map <Leader>m   <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s  :sort<CR>

" Show whitespace
" MUST be inserted before the colorescheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Undo History
set history=700
set undolevels=700

" Undo works after restarting vim
if exists("+undofile")
	" undofile - This allows you to use undos after exiting and restarting
	" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
	" :help undo-persistence
	" This is only present in 7.3+
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif

	set undodir=./.vim-undo//
	set undodir+=~/.vim/undo//
	set undofile
endif

" Turn off arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Set Numbers
set number

" Highlight text
syntax on

filetype plugin indent on

" Set default tab width and behavior
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set smarttab
set expandtab
set smartindent

" Set default text width in screen then take a new line
set textwidth=119

" View the line number, column number and relative position as percentage
" In the right side of status line
set ruler

" Make line numbers relative to the current line
" set relativenumber

" Scroll through terminal lines faster
set ttyfast

" Automatically re-read the file if it's changed outside VIM
set autoread

" more-like listing per page
set more

" Highlight current line
set cursorline!

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Make Search ignore case-sensitive and smart
set ignorecase
set smartcase

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2
set laststatus=2

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "normal! g`\"" |
\ endif
" Remember info about open buffers on close
set viminfo^=%

set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*node_modules*
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*.pyc,*.pyo

" Detect JSON
au BufRead,BufNewFile *.json setf json

" ======================================
" Third Party Plugins Settings
" ======================================

" YouCompleteMe Settings
" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<CR>']
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_collect_identifiers_from_tags_files = 1


" Trigger configuration of UltiSnips. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<f5>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Solarized custom options
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
" colorscheme argonaut

" Syntastic Recommended Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checker_args = '--max-line-length=119'
" let g:syntastic_python_checkers = ['pep8', 'pylint', 'python']
" PYTHON 3 PATH - Switch when you work on it
" let g:syntastic_python_python_exec = '/usr/bin/python3'

" ================================================
" Python Specific Plugin Settings
" ================================================

" Pyhton Mode Settings
" map <Leader>g   :call RopoGotoDefinition()<CR>
" let ropevim_enable_shortcuts = 1
" let g:pymode_rope_goto_def_newein = "vnew"
" let g:pymode_rope_extended_complete = 1
" let g:pymode_breakpoint = 0
" let g:pymode_syntax = 1
" let g:pymode_syntax_builtin_objs = 0
" let g:pymode_syntax_builtin_funcs = 0
" let g:pymode_virtualenv = 1
" let g:pymode_motion = 1
" map <Leader>b   Oimport ipdb; ipdb.set_trace() #BREAKPOINT<C-c>

" Virtualenv Integration
if has("python") && !empty($VIRTUAL_ENV)
    python << EOF
import os
import sys
a = os.environ['VIRTUAL_ENV'] + '/bin/activate_this.py'
execfile(a, dict(__file__ = a))
if 'PYTHONPATH' not in os.environ:
    os.environ['PYTHONPATH'] = ''
    os.environ['PYTHONPATH'] += ":"+os.getcwd()
    os.environ['PYTHONPATH'] += ":".join(sys.path)
EOF
endif

" Settings for jedi-vim
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Python Folding
set nofoldenable
