syntax enable " enable syntax processing
colorscheme badwolf

set autoindent
set smartindent
set tabstop=4 " number of visual spaces per TAB
set shiftwidth=4 " indent with 4 spaces
set expandtab " expand tabs to spaces
set wrap
set backspace=indent,eol,start
set list " show whitespace

set number " show line numbers
set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when we need to
set showmatch " highlight matching [{()}]
set textwidth=80 " max length of line. Point at which to wrap text
set colorcolumn=+1 " show bar for max line length

" Enable folding
set foldmethod=indent
set foldlevel=20
set foldnestmax=2
" Enable folding with the spacebar
nnoremap <space> za

set incsearch " search as characters are entered
set hlsearch " highlight matches
" turn off search highlight
nnoremap ,<space> :noh<CR>

" Easier split navigation (ctrl-h, etc)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" netrw explorer settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
" Have netrw explorer already open when vim opens
"augroup ProjectDrawer
"      autocmd!
"        autocmd VimEnter * :Vexplore
"    augroup END

" autocomplete brackets, etc
"inoremap ' ''<left>
"inoremap \" \""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
"use CTRL + j to jump out of auto closed pair
inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a

" allow mouse scroll in iTerm
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

" indent for python files
if has("autocmd")
    filetype plugin indent on
endif

" Set scripts to be executable from the shell
 au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent execute "!chmod u+x <afile>" | endif | endif
" au Filetype * set fo+=t " add auto-wrap text using textwidth to formatoptions
