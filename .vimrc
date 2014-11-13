set nocompatible

filetype indent plugin on " Intelligent auto-indenting by determining Type of file based on name and content
syntax on


" ### ### ### ### ### SETTINGS  ### ### ### ### ###

set encoding=utf8
set backspace=indent,eol,start
set nrformats= " Sets Vims Numberformat to Decimal instead of ocal to ignore leading zeros
set hidden

set number " Display line numbers on the left
set scrolloff=5

set foldmethod=manual    "fold based on indent
set foldnestmax=10       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set hlsearch
" set incsearch " Incremental search during input
set nomodeline
set wildmenu " Better command-line completion

set laststatus=2
set noshowmode " Dont show commandline
set showcmd " Show partial commands in the last line of the screen

set nobackup
set noswapfile
set nowb
set wildignore=*.swp,*.bak,*.pcy,*.class,*.png,*.jpg,*.gif

set splitbelow
set splitright

set ignorecase
set smartcase
set autoindent
set nostartofline
set history=1000 " Store lots of :cmdline history

set confirm " Enable dialog asking if you wish to save changed files

set visualbell
set t_vb=

set mouse=a " Enable mouse in all modes

set notimeout ttimeout ttimeoutlen=200 " Quickly time out on keycodes, but never time out on mappings

set shiftwidth=2
set softtabstop=2
set expandtab
set ai   " Auto indent
set si   " Smart indent
set wrap " Wrap lines

set clipboard=unnamedplus

set showmatch " Show matching brackets when text indicator is over them
set linebreak " Wrap lines at convenient points

set matchpairs+=<:>


" ### ### ### ### ### MAPPINGS  ### ### ### ### ###

let mapleader = ","

map Y y$ " Change behaviour of Y. Yank to the end of the current line

" Resume editing at last position if reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
  endif

" Better switching between open splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Swap Lines with arrow keys
no <down> ddp 
no <up> ddkP

" Simplify quotes
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

" Better moving of code blocks
vnoremap < <gv
vnoremap > >gv

nnoremap <silent> <C-l> :nohl<CR><C-l> " Redraws the screen and disables highlight search
nnoremap <leader>rm :call delete(expand('%')) \| bdelete!<CR> " Deletes the current file


" ### ### ### ### ### PLUGINS ### ### ### ### ###

" Pathogen
execute pathogen#infect()

" Colortheme
let base16colorspace=256
set background=dark
colorscheme base16-ocean
" colorscheme luna-term
" colorscheme Tomorrow-Night

" Airline 
let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{getcwd()}'
let g:airline_section_c = '%t'
let g:airline_section_x = ''
let g:airline_section_y = ''
" let g:airline_section_y = '%{strftime("%H:%M %a%e.%m.%Y")}' " Show Time
let g:airline_section_warning = ''
let g:bufferline_echo = 0
" autocmd VimEnter * AirlineTheme luna-term
" autocmd VimEnter * AirlineTheme base16

let g:tmuxline_preset = {
  \'a' : '#S',
  \'win' : '#I #W',
  \'cwin' : '#I #W',
  \'y' : '%H:%M %a%e.%m.%Y',
  \'z' : '#h'}
"\'y' : '%{strftime("%H:%M %a%e.%m.%Y")}',

" NERDTree
" autocmd vimenter * if !argc() | NERDTree | endif " Open NERDTree if no other file is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " Close vim if NERDTree is last open windows
autocmd BufEnter * lcd %:p:h " Open NERDTree in current directory path

map <C-b> :NERDTreeToggle<CR> " Map Ctrl+b to toogle NERDTree

" Todo
" Change ruler format - Display on the most right side
" EmmetVim
