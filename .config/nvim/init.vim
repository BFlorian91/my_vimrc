"************ PLUGINS ***************"
call plug#begin('~/.vim/plugged')
" Divers
Plug 'scrooloose/nerdcommenter'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Visual
Plug 'itchyny/lightline.vim'
Plug 'pbondoer/vim-42header'

" Theme
"Plug 'drewtempelmeyer/palenight.vim'
Plug 'joshdick/onedark.vim'

" Web
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'mattn/emmet-vim'

" Testing
"Plug 'sheerun/vim-polyglot'

" Debug
Plug 'vim-syntastic/syntastic'

call plug#end()

" ================= Web =========================
let g:user_emmet_leader_key=','

" ===============================================

"***********************************************************************"
autocmd FileType javascript	setlocal shiftwidth=2 tabstop=2 noexpandtab
autocmd FileType php		setlocal shiftwidth=2 tabstop=2 noexpandtab
autocmd FileType html		setlocal shiftwidth=2 tabstop=2 noexpandtab
autocmd FileType css		setlocal shiftwidth=4 softtabstop=4 noexpandtab
autocmd FileType c			setlocal shiftwidth=4 softtabstop=4 noexpandtab
autocmd FileType Makefile	setlocal shiftwidth=4 softtabstop=4 noexpandtab
autocmd FileType shell		setlocal shiftwidth=4 softtabstop=4 noexpandtab

set number
syntax on
set noswapfile
set tabstop=4
set softtabstop=0
set shiftwidth=4
set nopaste
set mouse=a


au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%81v.\+', -1)

"******** THEME *********"
colorscheme onedark 
let g:onedark_termcolors=256
set termguicolors

if (has("termguicolors"))
	set termguicolors
endif

let g:lightline = {
			\ 'colorscheme': 'onedark',
			\ }
"*******************************"

"********** NERDTREE ***********"
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.o$', '\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=0
let g:nerdtree_tabs_focus_on_files=1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p

"********************************"

"********** TERMINAL ************"

map <F2> :vsp term://zsh<CR>
" MEMO <bar> is like | in shell and <CR> is for enter.
tnoremap <ESC> <C-\><C-n><bar>:q<CR>
autocmd TermOpen * startinsert

"*********************************


"************** SPLIT ****************"
set splitright

"*************************************"

"*********** AUTO COMMENT *************"
noremap c :call NERDComment(0,"toggle")<CR>
vnoremap c :call NERDComment(0,"toggle")<CR>

"**************************************"

" *********** AUTOCLOSE ***************"
inoremap " ""<left>
inoremap "; "";<left>
inoremap '' ''<left>
inoremap ';' '';<left>

inoremap ( ()<left>
inoremap (; ();<left>
inoremap (<CR> (<CR>)<ESC>O
inoremap (;<CR> (<CR>);<ESC>O

inoremap [ []<left>
inoremap [; [];<left>
inoremap [<CR> [<CR>]<ESC>O
inoremap [;<CR> [<CR>];<ESC>O

inoremap { {}<left>
inoremap {; {};<left>
inoremap {<CR> {<CR>}<ESC>O<TAB>
inoremap {;<CR> {<CR>};<ESC>O<TAB>

inoremap <?<CR> <?php<CR>?><ESC>O<TAB>

" *************************************"
