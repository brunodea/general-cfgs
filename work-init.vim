"Do not forget to call :PlugInstall
call plug#begin()
Plug 'mhartington/oceanic-next'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
Plug 'udalov/kotlin-vim'
Plug 'vhdirk/vim-cmake'
Plug 'skywind3000/asyncrun.vim'
"Plug 'rust-lang/rust.vim'
"Plug 'racer-rust/vim-racer'
"Plug 'vim-syntastic/syntastic'
"Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
"commented below because it fails saying it requires py >= 2.7 or py3
"perhaps it's something related to how neo vim was installed.
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
"Plug 'KabbAmine/zeavim.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'https://github.com/Shougo/denite.nvim'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
"Plug 'w0rp/ale'
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'https://github.com/jremmen/vim-ripgrep'
"Plug 'https://github.com/rhysd/vim-clang-format'
"Plug 'https://github.com/kana/vim-operator-user'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'michaeljsmith/vim-indent-object'
call plug#end()

let g:python_host_prog = '/usr/local/bin/python3'

" Theme
syntax enable
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
set background=dark
colorscheme OceanicNext

if (has("termguicolors"))
 set termguicolors
endif

" Open NERDTree on startup
"autocmd VimEnter * NERDTree 
" Go to previous (last accessed) window.
"autocmd VimEnter * wincmd p

nmap <C-d> :NERDTreeToggle<CR>
nmap <C-s> :NERDTreeFind<CR>
"nmap <C-q> :TagbarToggle<CR>
nmap <C-_> :Denite file/rec -start_filter=1<CR>
nmap <C-;> :Denite buffer<CR>
nnoremap <C-]> :<C-u>Denite grep:. -no-empty<CR>
nnoremap <C-\> :<C-u>DeniteCursorWord grep:.<CR>
" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'source_names': 'short',
\ 'prompt': 'λ:',
\ 'statusline': 0,
\ 'highlight_matched_char': 'WildMenu',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'highlight_prompt': 'StatusLine',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}
" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)

" Syntastic default settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

let g:rustfmt_autosave = 1
set hidden
let g:racer_cmd = "/home/bruno/.rust/cargo/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

"let g:airline_theme='oceanicnext'
"To enable airline (it only starts working after the window is split
"set laststatus=2
"needs devicons
"let g:airline_powerline_fonts = 1

set number relativenumber

"nmap <leader>z <Plug>Zeavim
"vmap <leader>z <Plug>ZVVisSelection
"nmap gz <Plug>ZVOperator
"nmap <leader><leader>z <Plug>ZVKeyDocset

"As per :help 'expandtab
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

"Toggle line number style
"let g:NumberToggleTrigger="<F2>"

set hlsearch
set cursorline
"removes trailing spaces by pressing F5
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Tab navigation like Firefox.
nnoremap <C-S-g> :tabprevious<CR>
nnoremap <C-g>   :tabNext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-g> <Esc>:tabprevious<CR>i
inoremap <C-g>   <Esc>:tabNext<CR>i
inoremap <C-t> <Esc>:tabnew<CR>

" Kill the capslock when leaving insert mode.
"autocmd InsertLeave * set iminsert=0
" Quit VIM if only NERDTree is open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Set incremental search
set is

"let g:UltiSnipsExpandTrigger="<C-Space>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Auto enable auto formatting
"autocmd FileType c,cpp,h,hpp ClangFormatAutoEnable
"set hidden
"let g:racer_cmd = "/Users/brunor/.cargo/bin/racer"
"let g:racer_experimental_completer = 1

" For VIM Wiki
set nocompatible
filetype plugin on
syntax on

"let g:ycm_extra_conf_globlist = ['~/Documents/work/*', '~/Documents/prj/*']
"nnoremap <C-h> :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:NERDTreeIgnore=['gen_build']

" For coc.nvim:
"set nobackup
"set nowritebackup
"
"set cmdheight=2
"set updatetime=300
"set shortmess+=c
"set signcolumn=yes
"
"" Use tab for trigger completion with characters ahead and navigate.
"" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
"" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)
"
"" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap for do codeAction of current line
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Fix autofix problem of current line
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Create mappings for function text object, requires document symbols feature of
"" languageserver.
"xmap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap if <Plug>(coc-funcobj-i)
"omap af <Plug>(coc-funcobj-a)
"
"
"" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
"
"" Use `:Format` to format current buffer
"command! -nargs=0 Format :call CocAction('format')
"
"" Use `:Fold` to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" use `:OR` for organize import of current buffer
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
"" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
"" Using CocList
"" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"autocmd FileType json syntax match Comment +\/\/.\+$+

let g:cmake_build_type = 'Release'
let g:cmake_project_generator = 'Ninja'
let g:cmake_export_compile_commands = 'OFF'

" doesn't work
" command! -nargs=0 CMake CMake BUILD_TESTING=OFF
command! -nargs=? Build copen | AsyncRun cd build && ninja <args>
nmap <F9> :Build<cr>
nmap <F8> :cd build<cr> <bar> :cn<cr> <bar> :cd -<cr>
nmap <F7> :cd build<cr> <bar> :cp<cr> <bar> :cd -<cr>
nmap <F12> :source $MYVIMRC<cr>
