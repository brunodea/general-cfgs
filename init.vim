"Do not forget to call :PlugInstall
call plug#begin()
Plug 'mhartington/oceanic-next'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Yggdroot/indentLine'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'vim-syntastic/syntastic'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
"commented below because it fails saying it requires py >= 2.7 or py3
"perhaps it's something related to how neo vim was installed.
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'KabbAmine/zeavim.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/denite.vim'
call plug#end()

" Theme
syntax enable
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
set background=dark

if (has("termguicolors"))
 set termguicolors
endif

map <C-d> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Syntastic default settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:rustfmt_autosave = 1
set hidden
let g:racer_cmd = "/home/bruno/.cargo/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

let g:airline_theme='oceanicnext'
"To enable airline (it only starts working after the window is split
set laststatus=2
"needs devicons
let g:airline_powerline_fonts = 1

set number relativenumber

nmap <leader>z <Plug>Zeavim
vmap <leader>z <Plug>ZVVisSelection
nmap gz <Plug>ZVOperator
nmap <leader><leader>z <Plug>ZVKeyDocset

"As per :help 'expandtab
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

"Toggle line number style
let g:NumberToggleTrigger="<F2>"

set hlsearch
"removes trailing spaces by pressing F5
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t> <Esc>:tabnew<CR>

" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

" Set incremental search
set is

"let g:UltiSnipsExpandTrigger="<C-Space>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
