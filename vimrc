" just in case
if has('nvim')
	finish
endif

if has('win32')
  " https://github.com/junegunn/vim-plug/issues/852#issuecomment-696431055
  set shell=cmd.exe
endif

" auto-install plug in case is needed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin()
" appearance
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'drsooch/gruber-darker-vim'
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" sets
syntax enable
set encoding=utf-8
set fileencoding=utf-8

set shell=zsh

set number
set relativenumber
set showtabline=0
set termguicolors

set novisualbell
set noerrorbells
set mouse=a
set scrolloff=8
set nowrap
set hlsearch
set ignorecase
set shortmess+=c
set path+=**
set noswapfile
set nobackup
set hidden
set cmdheight=2
set updatetime=50
set signcolumn=number

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smartindent

set formatoptions+=r

set nocompatible

set undofile
set undodir=~/.vim/tmp/undo//

" Maps
let mapleader = " "

" hmm
nnoremap <Tab> <C-i>
nnoremap <S-Tab> <C-o>

" buffers
nnoremap <leader>bq :w<cr>:bp <BAR> bd #<cr>
nnoremap <leader>bd :bd<cr>

" netrw
nnoremap <leader>nt :Ex<cr>

" quickfix
nnoremap <leader>cc :cclose<cr>
nnoremap <C-n> :cnext<cr>
nnoremap <C-p> :cprev<cr>

" misc
inoremap <C-c> <ESC>
" tnoremap <ESC> <C-\\><C-n>
nnoremap <leader>tt :terminal<cr>
nnoremap <leader>vs :vs<cr>

" appearance
colorscheme GruberDarker
hi Normal ctermbg=NONE guibg=NONE
hi LineNr ctermbg=NONE guibg=NONE

" coc
inoremap <silent><expr> <C-n>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ coc#refresh()
inoremap <expr><C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap gd <Plug>(coc-definition)
nnoremap gi <Plug>(coc-implementation)
nnoremap gr <Plug>(coc-rename)
nnoremap ge <Plug>(coc-references)
nnoremap ga <Plug>(coc-codeaction-cursor)
nnoremap gj <Plug>(coc-diagnostic-prev)
nnoremap gk <Plug>(coc-diagnostic-next)
nnoremap K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
command! -nargs=0 Format :call CocActionAsync('format')
nnoremap <leader>bf :Format<CR>

" fzf
nnoremap <leader>ff :Files<CR>
nnoremap <C-e> :Buffers<CR>
nnoremap <leader>fp :RG<CR>
nnoremap <leader>fc :History:<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fp :BLines<CR>
