syntax on
set ttimeoutlen=50
set number
set relativenumber

filetype plugin indent on
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent

set backspace=indent,eol,start

" --- Plugins: ONE block only ---
call plug#begin('~/.vim/plugged')
Plug 'ghifarit53/tokyonight-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-java'
call plug#end()

let g:coc_global_extensions = ['coc-json', 'coc-pyright', 'coc-rust-analyzer', 'coc-go', 'coc-clangd', 'coc-java']

set nobackup
set nowritebackup
set signcolumn=yes
set laststatus=2


" --- True color support ---
if (has("termguicolors"))
  set termguicolors
endif

" --- Tokyo Night config: must be set before colorscheme ---
let g:tokyonight_style = 'night'
let g:tokyonight_transparent_background = 1
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" --- Airline config ---
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tokyonight'

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Trigger completion with Tab and navigate the completion menu
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Diagnostics and code navigation
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" Automatically close brackets, parentheses, and quotes
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

inoremap {<CR> {<CR>}<Esc>O
