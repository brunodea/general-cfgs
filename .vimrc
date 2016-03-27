execute pathogen#infect()
syntax enable
filetype plugin indent on

"As per :help 'expandtab
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

"Set vim color theme
set t_Co=256
colorscheme OceanicNext
set background=dark

"View line numbers
set number

"Toggle line number style
let g:NumberToggleTrigger="<F2>"

"Toggle NERDTree window with ctrl+w
map <C-d> :NERDTreeToggle<CR>

"To enable airline (it only starts working after the window is split
set laststatus=2
"needs devicons
let g:airline_powerline_fonts = 1

"devicons config
set encoding=utf8
set guifont=DrodSansMonoForPowerlineFontMono\ 11

"rust auto complete
set hidden
let g:racer_cmd = "/usr/bin/racer"
let $RUST_SRC_PATH="/usr/src/rust/src/"

"zeal commands (for documentation)
nmap gzz <Plug>Zeavim           " <leader>z (NORMAL mode)
vmap gzz <Plug>ZVVisSelection   " <leader>z (VISUAL mode)
nmap gz <Plug>ZVMotion         " gz{motion} (NORMAL mode)
nmap gZ <Plug>ZVKeyDocset      " <leader><leader>z

"highlight search
set hlsearch
"removes trailing spaces by pressing F5
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"set default font
set guifont=Courier\ 10

"configure unite
"file searching
nnoremap <C-p> :Unite file_rec/async<cr>
"content searching
nnoremap <space>/ :Unite grep:.<cr>
"yank history
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>
"buffer switching
nnoremap <space>s :Unite -quick-match buffer<cr>

"autoformat
nnoremap <F3> :Autoformat<CR>

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
