autocmd BufWritePost $MYVIMRC source $MYVIMRC

set background=dark
colorscheme desert

filetype on
filetype indent on
filetype plugin on

syntax on

set number
set relativenumber

set laststatus=2
set statusline=%F                       " Full path to the file
set statusline+=%y                      " File type
set statusline+=%m                      " Modified flag (+ if modified)
set statusline+=\ [%{&fileformat}]      " Show if file is LF or CRLF
set statusline+=\ [%{&fileencoding}]    " Show file encoding (utf-8, etc.)
set statusline+=\ [Ln\ %l,\ Col\ %c]    " Show current line number and column
" set statusline+=\ [%p%%]                " Show percentage through the file
set statusline+=%F\ %y\ [%l/%L]\ %p%%    " Show file path, type, current/total lines, and position percentage

" Markdown
let vim_markdown_folding_disabled = 1

" C-specific settings
augroup CSettings
  autocmd!
  autocmd FileType c,cpp setlocal tabstop=4 shiftwidth=4 expandtab autoindent smartindent cindent
  autocmd FileType c,cpp setlocal foldmethod=syntax foldlevel=1
  autocmd FileType c,cpp nnoremap <buffer> <leader>c :!gcc % -o %< && ./ %<<CR>
  autocmd FileType c,cpp nnoremap <buffer> <leader>n :cnext<CR>
  autocmd FileType c,cpp nnoremap <buffer> <leader>p :cprev<CR>
  autocmd FileType c,cpp au BufWritePre *.c,*.h :silent! :%!clang-format
augroup END

" Python
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>
au FileType python inoremap <buffer> $c <c-o>^# <esc>A
au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def

