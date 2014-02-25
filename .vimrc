" =============================================================================
" .vimrc
" Cobbled together over the years. Credit due to Travis Beck for much borrowed
" vimrc usefulness!
" =============================================================================

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" general
set encoding=utf8
set mousehide
set ruler
set nu
set nowrap
syntax on                 " turn on syntax highlighting
filetype indent plugin on " set indentation rules based on file type and enable filetype plugins
set t_Co=256              " use 256 colors
colorscheme jellybeans
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

let g:Powerline_symbols = 'fancy'

" filetypes
autocmd BufNewFile,BufRead *.t              set filetype=perl
autocmd BufNewFile,BufRead *.yaml,*.yml     set filetype=yaml

" in text files, always limit the width of text to 78 characters
autocmd BufNewFile,BufRead *.txt            set tw=78

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

" map ctrl-hjkl for easy window movement
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" =============================================================================
" Plugin specific
" =============================================================================

" nerdcommenter
" =============
map <leader>/ <plug>NERDCommenterToggle<CR>
imap <leader>/ <Esc><plug>NERDCommenterToggle<CR>i

" nerdtree
" ========
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']

" Default mapping, <leader>n
map <leader>n :NERDTreeToggle<CR>

" ctrlp
" =====
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|\~)$',
  \ }

let g:ctrlp_extensions = ['tag']

" taglist.vim
" ===========
map <leader>t :TlistToggle<CR>

" golden-ratio
" ============
let g:loaded_golden_ratio = 1

" vroom.vim
" =========

" Mappings to run tests with old 'spec' command

command! -nargs=0 VroomRunTestFileWithOldSpec call vroom#RunTestFile({'runner': 'spec'})
command! -nargs=0 VroomRunNearestTestWithOldSpec call vroom#RunNearestTest({'runner': 'spec'})

silent! map <unique> <Leader>s :VroomRunTestFileWithOldSpec<CR>
silent! map <unique> <Leader>S :VroomRunNearestTestWithOldSpec<CR>

command! -nargs=0 VroomRunTestFileWithCucumber call vroom#RunTestFile({'runner': 'bundle exec cucumber'})
command! -nargs=0 VroomRunNearestTestWithCucumber call vroom#RunNearestTest({'runner': 'bundle exec cucumber'})

silent! map <unique> <Leader>c :VroomRunTestFileWithCucumber<CR>
silent! map <unique> <Leader>C :VroomRunNearestTestWithCucumber<CR>

" syntastic
" =========

" Don't complain about angular attributes
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

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
