""" COLORSCHEME
if (has("termguicolors"))
  set termguicolors
endif

colorscheme ayu
hi Normal ctermbg=NONE guibg=NONE
hi LineNr ctermbg=NONE guibg=NONE

""" LIGHTLINE
let g:lightline = { 'colorscheme': 'simpleblack' }

let g:lightline#bufferline#show_number  = 0
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#clickable    = 1

let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline.component_raw    = {'buffers': 1}

""" TREE SITTER
lua require'nvim-treesitter.configs'.setup { indent = { enable = true }, highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

""" TELESCOPE
lua require('telescope').setup{ defaults = { file_ignore_patterns = { "node_modules" } }, pickers = { find_files = { hidden = true } } }

""" LSP 
lua require('language')
lua require('nvimpairs')

""" NEOFORMAT
let g:neoformat_try_node_exe = 1

""" NETRW
let g:netrw_winsize = 10
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_keepdir = 0

""" SYNTAX 
autocmd BufRead,BufNewFile *.xtx,*.tex set filetype=tex
