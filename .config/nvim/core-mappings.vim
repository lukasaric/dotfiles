let mapleader=" "
let g:user_emmet_leader_key='<C-z>'

syntax enable
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
set termguicolors
set background=dark
set scrolloff=8
set number
set relativenumber
set expandtab
set tabstop=2
set shiftwidth=2
set undofile
set undodir=~/.vim/undodir
set nowritebackup
set nobackup
set noswapfile
set shortmess+=c
set updatetime=100
set smartcase
set smartindent
set modifiable
set clipboard=unnamedplus
set signcolumn=yes
set wildignore=*/node_modules/*
set lazyredraw

if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=9
endif

noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
nnoremap <c-s> :w<cr>
nnoremap <silent> <space><space> :nohlsearch<Bar>:echo<CR>
nnoremap [e :<C-u>execute 'move -1-'. v:count1<CR>
nnoremap ]e :<C-u>execute 'move +'. v:count1<CR>
nnoremap <C-p> :Files<CR>
nnoremap <leader>x :silent !chmod +x %<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>tn  :tabnew<Space>
nnoremap <leader>tc  :tabclose<CR>
nnoremap <leader>rg  :Rg<CR>
nnoremap <leader>pf :e#<CR>

nmap <leader>sp :call <SID>SynStack()<CR>

function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


