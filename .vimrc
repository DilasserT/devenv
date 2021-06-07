" set default 'runtimepath' (without ~/.vim folders)
let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)

" what is the name of the directory containing this file?
let s:portable = expand('<sfile>:p:h')

" add the directory to 'runtimepath'
let &runtimepath = printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)

silent! call plug#begin(s:portable)

" file navigation
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf'

" edition features
Plug 'tmsvg/pear-tree'
Plug 'preservim/nerdcommenter'
" need vim 8
if v:version >= 800
  Plug 'mg979/vim-visual-multi'
end

" git diff integration
Plug 'airblade/vim-gitgutter'

" linting/autocomplete
" need vim 8
" quite heavy python support
" vim needs to be compiled with +python3 support or won't work
" mainly for autocompletion
if v:version >= 800
  "Plug 'python-mode/python-mode'
  " easy linting for lots of languages
  Plug 'dense-analysis/ale'
end
"Plug 'xolox/vim-easytags'
"Plug 'ycm-core/YouCompleteMe'

" eyecandy
Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'itchyny/vim-cursorword'
" Some different backgrounds
"Plug 'joshdick/onedark.vim'
"Plug 'morhetz/gruvbox'
"Plug 'rakr/vim-one'
"Plug 'altercation/vim-colors-solarized'
call plug#end()


" onedark background
"syntax on
"colorscheme onedark

" Palenight background
set background=dark
colorscheme palenight

" gruvbox background
"set background=dark
"colorscheme gruvbox
"
" one background
"set background=dark
"colorscheme one
"
" solarized background
"syntax enable
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized

" add line numbers on the left
set number

" add grey cursor line
set cursorline

"lightline configuration
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ }

" default is \ but since its azerty keyboard behaviour is weird
let mapleader = "_"
" nerdcommenter
filetype plugin on

" nerdtree
" Start NERDTree and leave the cursor in it.
"autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
nmap <silent> <C-L> :NERDTreeToggle<CR>

" base dir fzf on ctrl p
nmap <C-P> :FZF<CR>

" backspace always working
set backspace=indent,eol,start

" spawn a terminal on the right in a split
if v:version >= 800
  nmap <C-A> :rightb vert term<CR>
end

" set different prompt for vim bash
let &shell="/bin/bash\ --rcfile\ " . s:portable . "/.bashrc"

set hlsearch "Highlights search terms"
set incsearch "Highlights search terms as you type them"
set showmatch "Highlights matching parentheses"
set smartcase "Unless you put some caps in your search term"
"Ignores case when searching"
"set ignorecase 

let g:rainbow_active = 1

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
