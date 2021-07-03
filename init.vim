" basic settings
syntax enable 
set title
set number relativenumber
set nowrap
set smartindent
set incsearch

" bar settings
set showcmd
set showmode
set ruler

" undofile
set undofile
set undodir=~/.config/nvim/undo/

" configuring leader key
noremap <SPACE> <Nop>
let mapleader = " "
" jumping windows
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>wc :wincmd c<CR>
nnoremap <leader>wv :wincmd v<CR>
nnoremap <leader>ws :wincmd s<CR>
nnoremap <leader>wo :wincmd o<CR>
nnoremap <leader>n :FZF<CR>
nnoremap <leader>e :Explore<CR>

" fzf
nnoremap <leader>f :FZF<CR>
" file explorer
nnoremap <leader>e :Explore<CR>
" jump to last opened file
nnoremap <leader><Tab> :e #<CR>

" fugitive mappings
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gu :Git push<cr>
nnoremap <leader>gp :Git pull<cr>
nnoremap <leader>gs :Git<CR>

" vim rooter configuration
let g:rooter_patterns = ['.git']

" latex
let g:tex_flavor = 'latex'

" strip trailing whitespace on save: https://howchoo.com/vim/vim-how-to-remove-trailing-whitespace-on-save
autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!

map <C-n> :NERDTreeToggle<CR>

" imap ii <Esc> 
map <C-s> :w <CR>
map <C-n> :NERDTreeToggle<CR>

call plug#begin("~/.config/nvim/plugged")

" Plug 'arcticicestudio/nord-vim'
" Plug 'neoclide/coc.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'vifm/vifm.vim'
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'preservim/nerdtree'
Plug 'lervag/vimtex'
Plug 'LnL7/vim-nix'
" Plug 'mattn/emmet-vim'
" Plug 'rust-lang/rust.vim'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'thosakwe/vim-flutter'
" Plug 'mattn/emmet-vim'
" Plug 'lervag/vimtex'
" Plug 'rust-lang/rust.vim'
" Plug 'itchyny/lightline.vim'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'thosakwe/vim-flutter'

call plug#end()
