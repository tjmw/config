" =============================================================================
" .vimrc
" Cobbled together over the years. Credit due to Travis Beck for much borrowed
" vimrc usefulness!
" =============================================================================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ElmCast/elm-vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'Shougo/deoplete.nvim'
Plugin 'Yggdroot/indentLine'
Plugin 'ajf/puppet-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'alx741/vim-hindent'
Plugin 'benmills/vimux'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'derekwyatt/vim-scala'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'elixir-lang/vim-elixir'
Plugin 'ervandew/supertab'
Plugin 'fatih/vim-go'
Plugin 'fgsch/vim-varnish'
Plugin 'honza/vim-snippets'
Plugin 'ianks/vim-tsx'
Plugin 'janko-m/vim-test'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'jnwhiteh/vim-golang'
Plugin 'jparise/vim-graphql'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'juvenn/mustache.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'leafgarland/typescript-vim'
Plugin 'kristijanhusak/vim-carbon-now-sh'
Plugin 'mileszs/ack.vim'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'ngmy/vim-rubocop'
Plugin 'posva/vim-vue'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'skalnik/vim-vroom'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/taglist.vim'
"Plugin 'vim-scripts/tlib'
Plugin 'vim-scripts/vcscommand.vim'
Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" general
set encoding=utf8
set mousehide
set ruler
set nu
set nowrap
syntax enable             " turn on syntax highlighting
filetype indent plugin on " set indentation rules based on file type and enable filetype plugins
set t_Co=256              " use 256 colors
colorscheme solarized
set background=dark
set relativenumber
" editing
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround
set copyindent                 " copy indenting style of the line above
set whichwrap=b,s,h,l,<,>,[,]  " allow the cursor to wrap on anything
set backspace=2                " fully enable backspace to delete anything in insert mode
set clipboard=unnamed
set tags+=.tags
let loaded_matchparen = 1      " don't show matching parens in vim 7+

let g:airline_powerline_fonts = 1

" filetypes
autocmd BufNewFile,BufRead *.t              set filetype=perl
autocmd BufNewFile,BufRead *.yaml,*.yml     set filetype=yaml

" in text files, always limit the width of text to 78 characters
autocmd BufNewFile,BufRead *.txt            set tw=78

autocmd FileType php,ruby,eruby,yaml,javascript,sass set colorcolumn=80,100

" set filename in the screen status line when using screen
" see http://www.vim.org/tips/tip.php?tip_id=1126
autocmd BufEnter * let &titlestring = expand("%:t")

" searching
set ignorecase
set wrapscan " searched wrap around the end of the file

" bells
set noerrorbells
set visualbell   " turn on error beep/flash
set t_vb=        " turn off terminal's visual bell

set completeopt+=longest  " insert any common text for insert completion
set wildmode=longest,list " in ex mode, complete longest common string, then list alternatives (like bash)
set diffopt+=iwhite,vertical " ignore whitespace in diffmode

set laststatus=2 " always show the status line

" force the foreground color to black on sections which differ
hi DiffText cterm=bold ctermbg=9 ctermfg=16

" highlight long lines
" highlight LongLines ctermbg=cyan guibg=cyan
" autocmd BufNewFile,BufRead * call HighlightLongLines()

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

imap § <Esc>

" fix indenting issues from other applications (toggle using F2)
" from http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O><F2>
set pastetoggle=<F2>

if &term == "screen" || &term == "screen-bce"
    set t_ts=k
    set t_fs=\
endif

if &term == "screen" || &term == "xterm" || &term == "screen-bce"
    set title
endif

function! ResetTitle()
    " disable vim's ability to set the title
    exec "set title t_ts='' t_fs=''"
    " and restore it to 'bash'
    exec ":!echo -e '\033kbash\033\\'\<CR>"
endfunction

au VimLeave * silent call ResetTitle()

" =============================================================================
" Custom key mappings
" =============================================================================

" use ,f to vsplit and open file under cursor
" from http://vim.wikia.com/wiki/Open_file_under_cursor
map ,f :vertical wincmd f<CR>

map <leader>b :VCSBlame<CR>
map <leader>d :VCSVimDiff<CR>
map <leader>el :RExtractLet<CR>
map <leader>em :RExtractMethod<CR>
map <leader>nf :NERDTreeFind<CR>
map <Leader>rs :RVunittest<CR>
map <Leader>sc :vs db/schema.rb<CR>
map <Leader>av :AV<CR>
map <Leader>vsa :vert sba<CR>
map <Leader>g :Ag<CR>
map <Leader>y :ALENext<CR>

" =============================================================================
" Plugin specific
" =============================================================================

" ack.vim
" =======
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack

" bind K to grep word under cursor
nnoremap K :Ack "\b<C-R><C-W>\b"<CR>:cw<CR>

" ALE
" ===

set nocompatible
filetype off

let &runtimepath.=',~/.vim/bundle/ale'

filetype plugin on
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
\   'html': [],
\   'javascript': ['eslint', 'flow'],
\   'typescript': ['tsserver'],
\   'vue': ['eslint']
\}
"\   'haskell': ['hlint', 'hdevtools', 'hfmt'],
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'typescript': ['eslint'],
\    'vue': ['eslint'],
\    'scss': ['prettier'],
\    'html': ['prettier'],
\    'scala': ['scalafmt']
\}

call ale#Set('javascript_flow_executable', 'yarn flow')

" deoplete
" ========

"let g:deoplete#enable_at_startup = 1

" elm-vim
" =======

let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 0

" fzf
" ===
set rtp+=/usr/local/opt/fzf
noremap <C-p> :Files<CR>

" nerdcommenter
" =============
map <leader>/ <plug>NERDCommenterToggle<CR>
imap <leader>/ <Esc><plug>NERDCommenterToggle<CR>i

" nerdtree
" ========
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']

" Default mapping, <leader>n
map <leader>n :NERDTreeToggle<CR>

" indentLin
" =========
let g:indentLine_char = '│'

" Testing
" =======
nmap <silent> <leader>n :TestNearest<CR>
nmap <silent> <leader>f :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>

" =============================================================================
" Functions (and corresponding mappings)
" =============================================================================

" remove leading whitespace
function RemoveLeadingWhiteSpace()
    if getline('.') =~ ('^\s\+')
        s/^\s\+//
    endif
endfunction
map <silent> W :call RemoveLeadingWhiteSpace()<cr>j

" Highlight lines > 100 characters
function HighlightLongLines()
    match LongLines '\%>100v.\+'
endfunction
