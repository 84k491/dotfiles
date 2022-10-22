set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kshenoy/vim-signature'
Plugin 'morhetz/gruvbox'
Plugin 'https://github.com/mhinz/vim-startify.git'
Plugin 'https://github.com/altercation/vim-colors-solarized.git'
Plugin 'https://github.com/easymotion/vim-easymotion'
Plugin 'unblevable/quick-scope'
Plugin 'vim-scripts/commentToggle'
Plugin 'https://github.com/eugen0329/vim-esearch.git'
Plugin 'https://github.com/machakann/vim-highlightedyank.git'
Plugin 'prabirshrestha/async.vim'
Plugin 'https://github.com/vim-scripts/a.vim'
Plugin 'neoclide/coc.nvim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
" Plugin 'https://github.com/rhysd/vim-clang-format'
Plugin 'https://github.com/tpope/vim-surround'
call vundle#end()

let g:esearch = {}
let g:esearch.root_markers = []                                 
let g:clang_format#detect_style_file = 1                        
                                                                
" set autochdir                                                 
                                                                
" coc.nvim ================================                     
" Give more space for displaying messages.                      
" set cmdheight=2                                               


" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable  
" delays and poor user experience.                                         
set updatetime=300                                                         
                                                                           
" Always show the signcolumn, otherwise it would shift the text each time  
" diagnostics appear/become resolved.                                      
if has("nvim-0.5.0") || has("patch-8.1.1564")                              
  " Recently vim can merge signcolumn and number column into one           
  set signcolumn=number                                                    
else                                                                       
  set signcolumn=yes                                                       
endif                                                                      
                                                                           
" Use tab for trigger completion with characters ahead and navigate.       
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.                       
inoremap <silent><expr> <TAB>                                              
      \ pumvisible() ? "\<C-n>" :                                          
      \ <SID>check_back_space() ? "\<TAB>" :                               
      \ coc#refresh()                                                      
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"                  
                                                                           
function! s:check_back_space() abort                                       
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>k  <Plug>(coc-format-selected)
" nmap <leader>k  <Plug>(coc-format-selected)
" coc.nvim end ================================

" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index', '--logs=verbose']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

" nmap gd <plug>(lsp-definition)
" nmap gr <plug>(lsp-references)
nmap <silent> gd <Plug>(coc-definition)
" nmap U <plug>(lsp-peek-definition)

" stop CoC by default (but Coc is enabled)
let g:coc_start_at_startup=1
" manually start CoC
nmap <leader>cc :<C-u>CocRestart<CR>

"coc.preferences.formatOnSaveFiletypes": [
  "dart"
" ],

set tags=./tags;/

set is
set hlsearch
set smartcase

hi link EasyMotionTarget2First ErrorMsg
hi link EasyMotionTarget2Second ErrorMsg

syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme gruvbox

set colorcolumn=110
highlight ColorColumn ctermbg=lightgrey

map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

set cursorline
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>
set relativenumber
noremap <F3> :set relativenumber!<CR>
inoremap <F3> <C-o>:set relativenumber!<CR>
cnoremap <F3> <C-c>:set relativenumber!<CR>
map <F2> :NERDTreeToggle<CR>
nmap <F6> <plug>(QuickScopeToggle)
xmap <F6> <plug>(QuickScopeToggle)
" map <S-K> v:ClangFormat<CR>
map <leader>e :Files<CR>
map <leader>a :Ag<CR>
map <leader>b :Buffers<CR>
map <leader>/ :Lines<CR>
xmap <S-K> <Plug>(coc-format-selected)
nmap <S-K> <Plug>(coc-format-selected)

noremap <C-K> :tabnew<cr>
noremap <C-H> :tabp<cr>
noremap <C-L> :tabn<cr>
noremap <C-X> :q<cr>
noremap <S-q> :CocCommand flutter.run<cr>
noremap <C-q> :A<cr>
noremap <leader>k :CocCommand flutter.dev.debugPaintSizeEnabled<cr>
noremap <C-t> :noh<cr>

nmap <space> <plug>(easymotion-f)
nmap <space><space> <plug>(easymotion-F)
                                                      
set scrolloff=0
set tabstop=4
set shiftwidth=4
set expandtab
                                                      
set nocindent
set nosmartindent
set noautoindent
set indentexpr=
filetype indent off
filetype plugin indent off

set showcmd

" air-line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

