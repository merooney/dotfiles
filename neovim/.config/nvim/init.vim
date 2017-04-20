""" Plugin settings and leader
call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
" Using fugitive causes vim to search for tags file in .git directories
Plug 'tpope/vim-fugitive'
call plug#end()

""" FZF settings
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

"""Miscellaneous
syntax enable
" Set grepprg to be ripgrep
set grepprg=rg\ --vimgrep
set tags=./tags;,tags;
set path+=**
set sidescroll=1
set visualbell
set noerrorbells
set backspace=indent,eol,start
set hidden
set gdefault
set virtualedit=all

""" Spaces & Tabs
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
filetype indent on
filetype plugin on
set autoindent

""" UI Layout
set number
set splitbelow
set splitright
set showcmd
set cursorline
set wildmenu
set wildignore+=*.bmp,*.gif,*.jpg,*.png,*.ico,*.pdf,*.psd
set showmatch
set ruler
set list
set listchars=tab:>.,extends:#

""" Searching
nnoremap <esc> :noh<return><esc>
set ignorecase
set smartcase
set magic
set incsearch

""" Folding
set foldmethod=indent
set foldnestmax=10
set foldenable
nnoremap <space> za
set foldlevelstart=10

""" Movement Shortcuts
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/\{<CR>
map [] k$][%?}<CR>
nnoremap / /\v
vnoremap / /\v
nnoremap \ ;
nnoremap ; ,
nnoremap k gk
"XXX These two overwrite
nnoremap B ^
nnoremap E $
"XXX Still testing this bind out
inoremap jk <esc>

""" General Shortcuts
" Don't lose visual selection on indent/dedent
xnoremap < <gv
xnoremap > >gv
" Visually select most recently pasted code
nnoremap gV `[v`]
" Easy expansion of the active file directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" Trick to save a file that requires sudo when not opened with sudo
cmap w!! w !sudo tee % >/dev/null
imap <c-x><c-o> <plug>(fzf-complete-line)
" Move to end of line on yank/paste
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" Saner command-line-mode history
cnoremap <c-n> <down>
cnoremap <c-p> <up>
" Super screen clear
nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

""" Leader Shortcuts
let mapleader=","
" There are fzf specific fuzzy finding categories
map <leader>b :Buffers<CR>
map <leader>f :Files<CR>
map <leader>g :GFiles<CR>
map <leader>t :Tags<CR>
" Quickly edit a macro
nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
" Easier window traversal
tnoremap <leader>h <C-\><C-n><C-w>h
tnoremap <leader>j <C-\><C-n><C-w>j
tnoremap <leader>k <C-\><C-n><C-w>k
tnoremap <leader>l <C-\><C-n><C-w>l
tnoremap <leader>w <C-\><C-n>:bw!<CR>
tnoremap <leader>q <C-\><C-n>
nnoremap <leader>z :pc!<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
" Enable yanking to and pasting from system register
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
" Create a new file in the cwd
nnoremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <Leader>cd :lcd %:p:h<CR>:pwd<CR>
nnoremap <silent> <leader>a :bp<CR>
nnoremap <silent> <leader>d :bn<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>s :%s/
nnoremap <silent> <leader>vs :source $MYNVIMRC<CR>
nnoremap <silent> <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>q :call ToggleNumber()<CR>
nnoremap <leader>cw <C-w>c
map <leader>` :sp<CR>:terminal<CR>

""" Backups and History
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
set history=1000
set undolevels=1000
if exists('*mkdir') && !isdirectory($HOME.'/.vim-tmp')
  call mkdir($HOME.'/.vim-tmp')
endif

""" Custom Functions
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" Makes * and # work on visual mode too.
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
" Recursively vimgrep for word under cursor or selection if you hit leader-star
nmap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
vmap <leader>* :<C-u>call <SID>VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>

""" Personal autocmds
" Restore cursor position when opening a file
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" Easy switching between C source and header files with file marks
autocmd BufLeave *.{c,cpp} mark C
autocmd BufLeave *.h       mark H
" Smarter cursorline
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
" Remove automatic inclusion of comment leader on <CR>
autocmd FileType * set fo-=r
