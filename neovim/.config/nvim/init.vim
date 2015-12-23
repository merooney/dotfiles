" Plugin settings and leader {{{
call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'freeo/vim-kalisi'
Plug 'Valloric/YouCompleteMe'
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-fugitive'
call plug#end()
let mapleader=","
" }}}
" CtrlP Settings {{{
let g:ctrlp_max_files=0
let g:ctrlp_match_window = 'results:100,max:25' " overcome limit imposed by max height
let g:ctrlp_use_caching = 0
let g:ctrlp_by_filename = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif
" }}}
" Python Setting {{{
" Can call pep8 and flake8 by hitting <F7>
autocmd BufWritePost *.py call Flake8()
" }}}
" Colors {{{
syntax enable           " enable syntax processing
colorscheme kalisi
set background=dark
" }}}
" Misc {{{
set visualbell
set noerrorbells
set backspace=indent,eol,start
set hidden
" Make it so the trailing g can be left off of substitutions
set gdefault
" pastetoggle is unnecessary if yanking/pasting from system register "+
set pastetoggle=<F2>
" makes * and # work on visual mode too.
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" recursively vimgrep for word under cursor or selection if you hit leader-star
nmap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
vmap <leader>* :<C-u>call <SID>VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>
" }}}
" Spaces & Tabs {{{
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set autoindent
" }}}
" UI Layout {{{
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif
set splitbelow
set splitright
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu
set showmatch           " higlight matching parenthesis
set ruler
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set smartcase           " don't ignore case if query has capital
set magic               " extended regex
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}
" Folding {{{
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10    " start with fold level of 1
" }}}
" Line Shortcuts {{{
nnoremap / /\v
vnoremap / /\v
nnoremap \ ;
nnoremap ; ,
nnoremap k gk
nnoremap gV `[v`]
inoremap ii <esc>
vnoremap ii <esc>
" }}}
" General Shortcuts {{{
" Easy expansion of the active file directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" }}}
" Leader Shortcuts {{{
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
" create a new file in the cwd
nnoremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>a :bp<CR>
nnoremap <silent> <leader>d :bn<CR>
nnoremap <leader>w :wq!<CR>
nnoremap <Leader>o :CtrlP<CR>
" bind <leader>s to grep word under cursor
nnoremap <leader>s :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <silent> <leader>/ :nohlsearch<CR>
nnoremap <silent> <leader>sv :source $MYNVIMRC<CR>
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>q :call ToggleNumber()<CR>
map <leader>t :sp<CR>:terminal<CR>
" }}}
" Backups and History {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
set history=1000
set undolevels=1000
" }}}
" Custom Functions {{{
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
" }}}

" vim:foldmethod=marker:foldlevel=0
