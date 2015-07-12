"""""""""""""""
" Vundle settings
"""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'

" vim-misc is required for installing vim-easytags
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

Plugin 'majutsushi/tagbar'
Plugin 'elzr/vim-json'
Plugin 'digitaltoad/vim-jade'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""
" vim-airline settings
""""""""""""""
set laststatus=2
"set timeoutlen=50 " this is conflicting with emmet-vim
let g:airline_theme='dark'

let g:airline#extensions#tabline#enabled = 1
" " tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" " tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'
" " tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1

"""""""""""""""
" Nerd Tree settings
"""""""""""""""
let g:NERDTreeMapOpenInTabSilent = '<2-LeftMouse>'

let NERDTreeWinSize=31

" next 2 lines open NERDTree automatically when vim starts if no files
" specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * set nu " add line number to NERDTree directory
autocmd VimEnter * wincmd p " auto focus on document after opening

" close vim if the only window left is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"""""""""""""""
" Syntax settings
""""""""""""""
syntax enable
set ruler
set number
set softtabstop=4
set background=dark
set backspace=2 "Fix the backspace problem in vim 7.4

let g:solarized_termcolors=256
colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" Automatically inserts indentation in some cases
set smartindent

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set incsearch " use increment search by default
set hlsearch " highlight the search by default

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
set scrolloff=10 " always keep 10 lines of context around the cursor when scrolling

""""""""""""""
" Key mappings
""""""""""""""
" nmap T :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

""""""""""""""
" Misc
""""""""""""""
set mouse=a " enable use of mouse in vim
:command FormatJSON %!python -m json.tool " Define a command for formatting JSON
:command Fold :setlocal foldmethod=syntax
":command SyntaxFold :setlocal foldmethod=syntax<CR>
autocmd BufWritePre * :%s/\s\+$//e " Automatically remove trailing whitespaces when :w

set nobackup "no backup files
set nowritebackup " don't want a backup file while editing
set noswapfile
set conceallevel=0  " show vertical bars for hyperlinks in manual
