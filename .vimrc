" put this line first in ~/.vimrc
set nocompatible | filetype indent plugin on | syn on

fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'

  " Force your ~/.vim/after directory to be last in &rtp always:
  " let g:vim_addon_manager.rtp_list_hook = 'vam#ForceUsersAfterDirectoriesToBeLast'

  " most used options you may want to use:
  " let c.log_to_buf = 1
  " let c.auto_install = 0
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
        \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif

  " This provides the VAMActivate command, you could be passing plugin names, too
  call vam#ActivateAddons([], {})
endfun
call SetupVAM()

VAMActivate github:mhartington/oceanic-next
VAMActivate github:Yggdroot/indentLine
VAMActivate github:scrooloose/nerdtree.git
VAMActivate github:rust-lang/rust.vim.git
" no need of vim-racer because of YCM?
" Navigate to YouCompleteMe/third_party/ycmd/third_party/racerd
" and run cargo build --release.
" VAMActivate github:racer-rust/vim-racer
VAMActivate github:honza/vim-snippets
VAMActivate github:sirver/ultisnips
VAMActivate github:vim-airline/vim-airline
" Cool but perhaps make VIM slower?
"VAMActivate github:Shougo/denite.nvim
"VAMActivate github:Chiel92/vim-autoformat
"VAMActivate github:Shougo/vimproc.vim
VAMActivate github:ryanoasis/vim-devicons
VAMActivate github:tpope/vim-fugitive
VAMActivate github:jeffkreeftmeijer/vim-numbertoggle
VAMActivate github:rdnetto/YCM-Generator
VAMActivate github:Valloric/YouCompleteMe
VAMActivate github:KabbAmine/zeavim.vim
VAMActivate github:vim-syntastic/syntastic

syntax enable

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
" to show complete function definition
let g:racer_experimental_completer = 1

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

"YcmCompleter remaps
nnoremap gd :YcmCompleter GoToDefinition<CR>
let g:ycm_rust_src_path = $RUST_SRC_PATH

"Window options
set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
set guioptions-=r "remove right-hand scroll bar

" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

" Set incremental search
set is

" Syntastic default settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ["rust", "python", "shell"]

let g:rustfmt_autosave = 1

" Should not use <tab> for triggering snippets because of YCM.
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Folding based on syntax
set fdm=syntax
