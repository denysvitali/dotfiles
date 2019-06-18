""
"" Janus setup
""

let g:janus_custom_path = expand("~/.janus")
let g:janus_path = escape(expand("~/.vim/janus/vim"), ' ')
let g:janus_vim_path = escape(expand("~/.vim/janus/vim"), ' ')

" Source janus's core
exe 'source ' . g:janus_vim_path . '/core/before/plugin/janus.vim'

" You should note that groups will be processed by Pathogen in reverse
" order they were added.
"call janus#add_group("tools")
"call janus#add_group("langs")
call janus#add_group("colors")

""
"" Vundle
""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plug 'VundleVim/Vundle.vim'

""
"" Customisations
""

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif


"" Disable plugins prior to loading pathogen
exe 'source ' . g:janus_vim_path . '/core/plugins.vim'
"
"""
""" Pathogen setup
"""
"
"" Load all groups, custom dir, and janus core
call janus#load_pathogen()

execute pathogen#infect()

" .vimrc.after is loaded after the plugins have loaded

""
""  Syntastic
""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_rust_checkers = ['cargo']
let g:rustfmt_autosave = 1

""
""  UTF-8
""
set encoding=UTF-8
set fileencoding=utf-8  " The encoding written to file.

""
"" Plugins
""

"" RUST
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'


Plug 'airblade/vim-gitgutter'

Plug 'valloric/YouCompleteMe'
Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'enricobacis/vim-airline-clock'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ayu-theme/ayu-vim'
Plug 'chrisbra/unicode.vim'
Plug 'davidhalter/jedi-vim'
Plug 'rhysd/vim-crystal'
""Plug 'sheerun/vim-polyglot'


""
""  Airline Theme
""
let g:airline_theme='solarized'

""
""  Airline Clock
""

let g:airline#extensions#clock#format = '%H:%M:%S'
let g:airline#extensions#clock#updatetime = 1000


""
""  VIM Theme
""
"syntax enable
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256

set termguicolors
let ayucolor="mirage"
colorscheme ayu

" IndentLine {{
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}

""
""  NERDTree
""
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"autocmd vimenter * NERDTree


"" File Highliter
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

""
""  Shortcuts
""

"" Toggle NERDTree
map <C-d> :NERDTreeToggle<CR>

"" Fuzzy Search
map <C-a> :FZF<CR>

""
""  Rust
""
set hidden
let g:racer_cmd = "/usr/bin/racer"

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)



""
""  UltiSnips
""
" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" YouCompleteMe Fix
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Disable Background Color Erase
if $TERM == "xterm-kitty"
  let &t_ut=''
  set termguicolors
            let &t_8f = "\e[38;2;%lu;%lu;%lum"
            let &t_8b = "\e[48;2;%lu;%lu;%lum"
    hi Normal guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
    let &t_ti = &t_ti . "\033]10;#f6f3e8\007\033]11;#242424\007"
    let &t_te = &t_te . "\033]110\007\033]111\007"
endif
