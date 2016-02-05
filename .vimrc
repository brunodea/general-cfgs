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
