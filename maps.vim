""" LEADER
let mapleader = " "

""" TAB CONTROL
nnoremap <leader>e :tabedit<Space>
nnoremap <leader>c :tabclose<cr>
nnoremap gtf <C-w>gf

""" BUFFERS CONTROL
nnoremap <leader>T :enew<cr> :e 
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>
nnoremap <leader>bq :w<cr>:bp <BAR> bd #<cr>

""" WINDOW CONTROL
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h

""" TELECOSPE
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <C-p> :lua require('telescope.builtin').buffers()<CR>
nnoremap <C-f> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>fp :lua require('telescope.builtin').live_grep()<CR>

""" LSP MAPS
nmap <silent> gd :lua vim.lsp.buf.definition()<CR>
nmap <silent> gi :lua vim.lsp.buf.implementation()<CR>
nmap <silent> gr :lua vim.lsp.buf.references()<CR>
nmap <leader>do :lua vim.lsp.buf.code_action()<CR>
nmap <leader>bf :Neoformat<CR>

""" NERDTREE
nnoremap <leader>nt :vs.<CR>

""" EASYMOTION
nmap <leader>s <Plug>(easymotion-s2)
