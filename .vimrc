" =============================================================================
" .vimrc
" Cobbled together over the years. Credit due to Travis Beck for much borrowed
" vimrc usefulness!
" =============================================================================

" general
set encoding=utf8
set mousehide
set ruler
syntax on                 " turn on syntax highlighting
filetype indent plugin on " set indentation rules based on file type and enable filetype plugins
set t_Co=256              " use 256 colors

" editing
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
set copyindent                 " copy indenting style of the line above
set whichwrap=b,s,h,l,<,>,[,]  " allow the cursor to wrap on anything
set backspace=2                " fully enable backspace to delete anything in insert mode
let loaded_matchparen = 1      " don't show matching parens in vim 7+

" filetypes
autocmd BufNewFile,BufRead *.t              set filetype=perl
autocmd BufNewFile,BufRead *.md,*.mh,*.html set filetype=mason
autocmd BufNewFile,BufRead *.yaml,*.yml     set filetype=yaml

" in text files, always limit the width of text to 78 characters
autocmd BufNewFile,BufRead *.txt            set tw=78

" for Mason files, tabs are 2 spaces wide
autocmd FileType mason set tabstop=2 shiftwidth=2

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
set diffopt+=iwhite       " ignore whitespace in diffmode

" set up statusline
set statusline=%f\ %y%r%m%=col\ %c\ line\ %1*%l%*/%L " show file, read-only, modified, file type, and line number
set laststatus=2                                     " always show the status line

" force the foreground color to black on sections which differ
hi DiffText cterm=bold ctermbg=9 ctermfg=16

" highlight long lines
highlight LongLines ctermbg=cyan guibg=cyan
autocmd BufNewFile,BufRead * call HighlightLongLines()

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

" =============================================================================
" Custom key mappings
" =============================================================================

" use ,f to vsplit and open file under cursor
" from http://vim.wikia.com/wiki/Open_file_under_cursor
map ,f :vertical wincmd f<CR>

" run unit tests with prove using ,t (from perl hacks)
" let current_file=expand("%:t")
autocmd FileType perl map ,t <Esc>:!prove t/% -v<CR>

" compile perl with ,c
autocmd FileType perl map ,c <Esc>:!perl -c %<CR>

" =============================================================================
" Functions (and corresponding mappings)
" =============================================================================

" toggle a comment at the beginning of the line
" see http://www.perlmonks.org/?node_id=561215 for more info
function ToggleComment()
    let comment_start = '#'
    let comment_end   = ''

    if &filetype == 'sql'
        let comment_start = '--'
    endif
    if &filetype == 'vim'
        let comment_start = '"'
    endif
    if &filetype == 'css'
        let comment_start = '\/\* '
        let comment_end   = ' \*\/'
    endif

    if getline('.') =~ ('^' . comment_start)
        execute 's/^' . comment_start . '//'
        execute 's/' . comment_end . '$//'
    else
        s/^/\=comment_start/
        s/$/\=comment_end/
    endif
endfunction
map <silent> X :call ToggleComment()<cr>

" remove leading whitespace
function RemoveLeadingWhiteSpace()
    if getline('.') =~ ('^\s\+')
        s/^\s\+//
    endif
endfunction
map <silent> W :call RemoveLeadingWhiteSpace()<cr>

" easy tab indenting
function Indent()
    let indent_char = "\t"
    s/^/\=indent_char/
endfunction
map <silent> <tab> :call Indent()<cr>

" just like above, but remove tabs at start of line
function UnIndent()
    let indent_char = "\t"
    if getline('.') =~ ('^' . indent_char)
        execute 's/^' . indent_char . '//'
    endif
endfunction
map <silent> <s-tab> :call UnIndent()<cr>

" Highlight lines > 100 characters
function HighlightLongLines()
    match LongLines '\%>100v.\+'
endfunction
