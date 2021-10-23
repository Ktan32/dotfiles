" ======================
" ======= Main settings
" ======================
set shell=/bin/zsh

" Colors & theme
set background=dark
set t_co=256
let base16colorspace=256

hi MatchParen cterm=bold ctermbg=none ctermfg=darkred

filetype off
filetype plugin indent on

" ======================
" ======= Plugins
" ======================
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'AndrewRadev/sideways.vim'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-rooter'
Plugin 'chriskempson/base16-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'matze/vim-move'
Plugin 'mhinz/vim-grepper'
Plugin 'mhinz/vim-startify'
Plugin 'mxw/vim-jsx'
Plugin 'nvim-treesitter/nvim-treesitter'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary.git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'w0rp/ale'
Plugin 'wavded/vim-stylus'
Plugin 'wesQ3/vim-windowswap'

" Company specific
if $BOOKINGCOM
    Plugin 'git@gitlab.booking.com:devtools/vim-booking.git'
endif

call vundle#end()

" ======================
" ======= Common remaps
" ======================
" most useful remap
nnoremap ; :
" Leader for my custom commands
let g:mapleader = ","

" Auto indent pasted text.
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" To the blackhole if not specified to copy
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d

" Hide search results
nnoremap <Leader>, :noh<cr>

" replace current selection with default register without yanking it
vnoremap <leader>p "_dP

" Allowing . to work in visual line mode
vnoremap . :normal .<CR>

" Buffers switch hotkey
let c = 1
while c <= 99
    execute "nnoremap " . c . "gb :" . c . "b\<CR>"
        let c += 1
    endwhile

" Better word search
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" ======================
" ======= Plugin options
" ======================
" Base 16 theme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" FZF
nnoremap <C-p> :GFiles<Cr>
let g:fzf_layout = { 'down': '~20%', 'window': '10new' }

" Remap ctrlp implictly because of Yankring
autocmd FileType * nnoremap <c-p> :GFiles<cr>

" Rooter
let g:rooter_silent_chdir = 0
let g:rooter_resolve_links = 1
let g:rooter_patterns = ['.git', '*.sln', 'build/env.sh']

" Grepper
nnoremap <C-f> :Grepper -tool rg<cr>
let g:grepper               = {}
let g:grepper.tools         = ['rg', 'git', 'ag']
let g:grepper.jump          = 0
let g:grepper.next_tool     = '<C-s-f>'
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Nerdtree
map <leader><Tab> :NERDTreeFind<CR>
nnoremap <Leader><t> :tabnew<CR>

let g:NERDTreeWinPos = "right"
let NERDTreeQuitOnOpen = 1
autocmd StdinReadPre * let s:std_in=1

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Yankring
let g:yankring_clipboard_monitor=0
nnoremap <silent> <Leader>p :YRShow<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='minimalist'

" JSON highlighter
set conceallevel=0
" Disable quote concealing in JSON files
let g:vim_json_conceal=0

" ======================
" ======= Other options
" ======================
" timeouts for fast esc and normal mode
set timeoutlen=1000 ttimeoutlen=0

set history=500

" Speedup
set synmaxcol=250 " Don't bother highlighting anything over 200 chars

" Not using gui cursor: default is fine
set guicursor=

set cmdheight=1
set hid

set wildignore+=.git,.hg,.svn,*.o,*.aux,*.png,*.jpg,*.pdf

"When searching try to be smart about cases 
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=1

" Add a bit extra margin to the left
set foldcolumn=0

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase
set smartcase

set nobackup
set nowb
set noswapfile

set expandtab
set smarttab

" Copy current filepath
command! CopyBuffer let @+ = expand('%:p')

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Old regex engine disabled
set re=0

set list listchars=tab:\ \ ,trail:·

set nowrap
set linebreak

" Scrolling
set scrolloff=8
set sidescrolloff=5
set sidescroll=1

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Working with system buffer
if has('clipboard')
    map <F2> "+p
    map <F3> "+y
endif

" Lines
set colorcolumn=120
set cursorline
set synmaxcol=900

" Number lines
set number relativenumber
set numberwidth=2

" Splits
set splitbelow
set splitright

" Ale
" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_completion_enabled = 1
let g:ale_linters = {'javascript': ['eslint'], 'jsx': ['eslint'], 'Stylus': ['stylelint'], 'flow': ['eslint'], 'typescript': ['eslint', 'tsserver'], 'python': ['flake8'], 'perl': ['perl-critic']}
" Booking.com special templates
let g:ale_pattern_options = {
\   '.*\.inc$': {'ale_enabled': 0},
\   '.*\.tmpl$': {'ale_enabled': 0},
\}
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'
let g:ale_set_signs = 1
let g:ale_fixers = ['prettier', 'eslint']
let g:ale_floating_preview = 1
let g:ale_hover_to_floating_preview = 1

" Hotkeys
" Navigating errors
nnoremap <C-k> :ALENext<CR>
nnoremap <C-j> :ALEPrevious<CR>

" Hover
nnoremap m :ALEHover<CR>

highlight ALEError ctermbg=none cterm=underline
highlight ALEWarning ctermbg=none cterm=underline
highlight ALEStyleError ctermfg=darkgrey
highlight ALEStyleWarning ctermfg=darkgrey

"JSX
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.js.flow set filetype=javascript.jsx
augroup END

" Booking perl templates
" Company specific
if $BOOKINGCOM
    augroup FiletypeGroup
        au BufNewFile,BufRead *.inc set filetype=tmpl
    augroup END
    augroup FiletypeGroup
        au BufNewFile,BufRead *.tmpl set filetype=tmpl
    augroup END
endif

" Vim node gf
set path+=.,src
set suffixesadd+=.js,.jsx

" ======================
" ======= Crutches & stuff
" ======================

" Going to English when leaving insert mode
function! SetUsLayout()
    if has('linux')
        silent !gsettings set org.gnome.desktop.input-sources current 0
    endif
endfunction

autocmd InsertLeave * call SetUsLayout()
