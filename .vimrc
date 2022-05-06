set nocompatible              " be iMproved, required
filetype off                  " required
call plug#begin('~/.vim/plugged')
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'flazz/vim-colorschemes'
"Plug 'ayu-theme/ayu-vim'
Plug 'itchyny/lightline.vim'
call plug#end()

filetype plugin indent on    " required

let loaded_netrwPlugin = 1 " to disable netrw

" Colors and Terminal "
"""""""""""""""""""""""
syntax enable
"set term=xterm-256color
set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme


"colorscheme ayu
"colorscheme babymate256
"colorscheme gruvbox
colorscheme jellybeans
set bg=dark
"set bg=light

" Various settings "
""""""""""""""""""""

" General settings
set nocompatible 	" Do not use the vi-compatibility mode
set autoread 		" Auto read when a file is changed from the outside
set nolazyredraw 	" Don't redraw while executing macros
set history=700 	" Sets how many lines of history VIM has to remember
set autowriteall  	" Automatically save changes in some cases
set vb t_vb= 		" Do not beep
set magic 		" Set magic on, for regular expressions
set hidden 		" buffers stay open when abandoned
set nocp                " forget about backward compatibility
set nofoldenable        " disable folding
set backspace=2         " backspace behavior
set autochdir           " auto change current dir to open file
set encoding=utf-8
set clipboard=unnamed   " share clipboard with the system
syntax on

" Layout
set cmdheight=2 	" The command bar height
set shortmess=a         " Skip the intro
set modeline 		" Enable mode line
set ruler 		" Show ruler
"set cul       		" Highlight current line (only in gui)
set showcmd 		" show partial commands in status line and

" Wrapping
set wrap 		" wrap long lines
set textwidth=68 	" wrapping at 75
set linebreak		" do break long lines

" Search(like)
set showmatch 		" Show matching brackets
set smartcase
set smartindent 	" More indent-related stuff
set ignorecase 		" Ignore case when searching
set incsearch 		" Search incrementally
" set hlsearch 		" Highlight search things

" Spelling
set spell 		" Check speeelling
hi clear SpellBad 
hi SpellBad gui = underline 

" Indents, tabs, etc.
set ai 			" Auto indent
set shiftwidth=4 	" More tab settings
set tabstop=8 		" Tab settings
set sw=2 		" Some indentation
set softtabstop=4
set expandtab

"Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" bash like auto-completion
set wildmenu
set wildmode=list:longest
set wildignore=*.log,*.aux,*.dvi,*.blg,*.bbl,*.ilg,*.ind,*.toc,*.idx
set wildignore+=*_latexmk,*.nav,*.out,*.snm,*.ego,*.glo,*.tex~
set wildignore+=*.pdf,*.thm,*.project.vim,*._aux,*.synctex.gz

"Automatically load edited .vimrc
autocmd! bufwritepost .vimrc source $MYVIMRC

" Python
""""""""""

let python_highlight_all=1


" Other "
"""""""""
" various shortcuts
nmap gq vapgq
inoremap kj <Esc>
inoremap Kj <Esc>
inoremap KJ <Esc>
nmap gn <Esc>:noh<Esc>


" matching braces
"inoremap {} {}<left>

" no need to stretch your pinky
nnoremap <silent> k gk
nnoremap <silent> j gj

" Misspellings
:command! W w
:command! Q q


"switch @ and ^
nnoremap @ ^
inoremap @ ^
inoremap ^ @
nnoremap ^ @

" Pull word under cursor into lhs of a substitute:
nmap gS :%s/<c-r>=expand("<cword>")<cr>//gc<left><left><left>
map gs :%s//gc<left><left><left>

map gB %x``x
map gE /\\edit<Enter>dwdwgB

" switching buffers
nmap <Tab> kj:bnext!<CR>
augroup qf " remove Quickfix from rotation
    autocmd!
    autocmd FileTyPe qf set nobuflisted
augroup END



" The leader
let mapleader=";"
let maplocalleader=";"


let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<c-j>"
let g:ultisnips_python_style="google"

 
autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
 

