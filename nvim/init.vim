" neovim only

" must have {{{
set nocompatible
set encoding=utf8
set shell=/bin/bash
" }}}

" dein {{{
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

    " essentials {{{
    " solorized colorscheme
    call dein#add('altercation/vim-colors-solarized')
    call dein#add('iCyMind/NeoSolarized')
    " fancy start screen with recent files
    call dein#add('mhinz/vim-startify')
    " buff tabs
    call dein#add('ap/vim-buftabline')
    " fuzzy finder
    call dein#add('junegunn/fzf')
    call dein#add('junegunn/fzf.vim', {
                \ 'build' : './install --all',
                \ })
    " clever-f
    call dein#add('rhysd/clever-f.vim')
    " easymotion
    call dein#add('easymotion/vim-easymotion')
    " git
    call dein#add('mhinz/vim-signify')
    call dein#add('tpope/vim-fugitive')
    " undo history
    call dein#add('sjl/gundo.vim')
    " . support for a bunch of plugins
    call dein#add('tpope/vim-repeat')
    " simple status bar
    call dein#add('itchyny/lightline.vim')
    " advanced commenting
    call dein#add('tpope/vim-commentary')
    " changing surround symbols
    call dein#add('tpope/vim-surround')
    " code quality tools
    call dein#add('neomake/neomake')
    " list of class methods, variables etc
    call dein#add('majutsushi/tagbar')
    " autoclosing pair symbols
    call dein#add('Townk/vim-autoclose')
    " snippet manager
    call dein#add('Shougo/neosnippet.vim')
    " editorconfig support
    call dein#add('editorconfig/editorconfig-vim')
    " }}}

    " json {{{
    call dein#add('elzr/vim-json', { 'on_ft' : 'json' })
    " }}}

    " js {{{
    call dein#add('ternjs/tern_for_vim', {
                \ 'on_ft' : 'js',
                \ 'build' : 'npm i',
                \ })
    " }}}

    " go {{{
    call dein#add('fatih/vim-go', {
                \ 'on_ft' : 'go',
                \ 'build' : ':GoUpdateBinaries' })
    " }}}

    " lua {{{
    " call dein#add('tbastos/vim-lua', { 'on_ft' : 'lua' })
    call dein#add('xolox/vim-misc', { 'on_ft' : 'lua' })
    call dein#add('xolox/vim-lua-ftplugin', { 'on_ft' : 'lua' })
    " }}}

    " autocomplete {{{
    " deoplete
    call dein#add('Shougo/deoplete.nvim', {
                \ 'build' : ':UpdateRemotePlugins',
                \ })
    " python
    call dein#add('zchee/deoplete-jedi')
    " js
    call dein#add('carlitux/deoplete-ternjs', {
                \ 'build' : 'npm i -g tern',
                \ })
    " go
    call dein#add('zchee/deoplete-go', { 
                \ 'on_ft' : 'go',
                \ 'build' : 'make' })
    " emojis, yeah!
    call dein#add('fszymanski/deoplete-emoji')
    " }}}

    " misc {{{
    " }}}

    call dein#end()
    call dein#save_state()
endif

" on nvim startup check that all packages installed
if dein#check_install()
    call dein#install()
endif
" }}}

" netrw {{{
let g:netrw_banner       = 0
let g:netrw_keepdir      = 0
let g:netrw_liststyle    = 1
let g:netrw_sort_options = 'i'
" }}}

" nvim config {{{
let mapleader="\<Space>"
let $VIMDIR=expand('<sfile>:p:h')
set ruler
set hidden
set noshowmode
set backspace=indent,eol,start
set cursorline
set signcolumn=yes

" fuzzy find
set path+=**
set wildmenu

" fancy searching
set ignorecase
set hlsearch
set incsearch
set lazyredraw

" brackets
set showmatch

" no errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" backups
if isdirectory($HOME . '/.cache/nvim/backup') == 0
    call mkdir($HOME.'/.cache/nvim/backup', 'p')
endif
set backupdir-=.
set backupdir-=~/
set backupdir^=~/.cache/nvim/backup/
set backup

" swap
if isdirectory($HOME . '/.cache/nvim/swap') == 0
    call mkdir($HOME.'/.cache/nvim/swap', 'p')
endif
set directory+=~/.cache/nvim/swap//
set directory+=~/tmp//
set directory+=.

if exists('+shada')
    set shada+=n~/.nvim/shada
else
    set viminfo+=n~/.nvim/viminfo
endif

" undo
if exists('+undofile')
    if isdirectory($HOME . '/.cache/nvim/undo') == 0
        call mkdir($HOME.'/.cache/nvim/undo', 'p')
    endif
    set undodir+=~/.cache/nvim/undo//
    set undofile
endif

" tabs
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" indent
set autoindent
set smartindent
set copyindent
set cindent

" splits
set splitbelow
set splitright

" status line
set laststatus=2

" colorscheme
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
set t_Co=256
set background=dark

" lightline fix
colorscheme solarized
colorscheme NeoSolarized
" }}}

" plugins config {{{
" lightline
let g:lightline = {
            \ 'colorscheme' : 'solarized',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'readonly', 'filename', 'modified', 'gitbranch' ] ],
            \   'right': [ [ 'lineinfo' ],
            \              [ 'percent' ] ]
            \ },
            \ }

" startify
let g:startify_change_to_vcs_root = 1
let g:startify_custom_header = ['']
let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [
            \ '~/.config/nvim/init.vim',
            \ '~/.config/vifm/vifmrc',
            \ '~/.config/fish/config.fish',
            \ ]

" easyclip
set clipboard=unnamed

" clever-f
let g:clever_f_across_no_line = 1
let g:clever_f_smart_case = 1

" easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

" signify
let g:signify_realtime = 1
let g:signify_sign_show_test = 0
let g:signify_vcs_list = [ 'git' ]

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.lua = ['omni']

" neosnippet
let g:neosnippet#disable_runtime_snippets = {
            \   '_' : 1,
            \ }
let g:neosnippet#snippets_directory = '~/.config/nvim/snippets'

" neomake {{{
call neomake#configure#automake('nrwi')
let g:neomake_highlight_lines = 1
let g:neomake_open_list = 0

let g:neomake_fish_enabled_makers = []

" symbols
let g:neomake_error_sign = {
            \ 'text': 'E',
            \ }
let g:neomake_warning_sign = {
            \ 'text': 'W',
            \ }
let g:neomake_info_sign = {
            \ 'text': 'I',
            \ }
let g:neomake_message_sign = {
            \ 'text': 'M',
            \ }
" }}}

" fzf
let g:fzf_command_prefix = 'Fzf'

" ternjs deoplete
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" go deoplete
let g:deoplete#sources#go#gocode_binary = 'gocode'
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" helpers {{{

" tmux cursor fix
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}

" keybindings {{{

" misc
nnoremap j gj
nnoremap k gk
inoremap jj <esc>
nnoremap B ^
nnoremap E $

" centering on next n
nnoremap <silent> n :norm! nzz<CR>
nnoremap <silent> N :norm! Nzz<CR>
vnoremap <silent> n :norm! nzz<CR>
vnoremap <silent> N :norm! Nzz<CR>

" centering on navigation
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-f> <C-f>zz
vnoremap <C-b> <C-b>zz

"
xnoremap <  <gv
xnoremap >  >gv

" netrw
nnoremap <silent> <leader>n :Explore<CR>

" buffers
nnoremap <silent> q :bd<CR>
nnoremap <silent> Q :q<CR>
nnoremap <silent> <Tab> :bnext<CR> 
nnoremap <silent> <S-Tab> :bprev<CR>

" split
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" easymotion
nmap <silent> <leader>jj <Plug>(easymotion-overwin-f)

" neosnippet
nnoremap <silent> <leader>ne :NeoSnippetEdit -split<CR>

" common
nnoremap <silent> <leader>lt :TagbarToggle<CR>

" indent
nnoremap <silent> g= mzgg=G`z

" fzf
nnoremap <silent> <leader>ff :FzfFiles<CR>
nnoremap <silent> <leader>fb :FzfBuffers<CR>
nnoremap <silent> <leader>fa :FzfAg<CR>
nnoremap <silent> <leader>ft :FzfTags<CR>
nnoremap <silent> <leader>fu :FzfSnippets<CR>
nnoremap <silent> <leader>fc :FzfCommits<CR>
nnoremap <silent> <leader>fh :FzfHistory<CR>

" snippets
imap <silent> <C-k> <Plug>(neosnippet_expand_or_jump)
smap <silent> <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <silent> <C-k> <Plug>(neosnippet_expand_target)

" gundo
nnoremap <silent> <leader>u :GundoToggle<CR>

" terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l

" vim config
nnoremap <silent> <leader>vc :e $MYVIMRC<CR>
nnoremap <silent> <leader>vr :so $MYVIMRC<CR>

" disabling unneeded keys 
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <bs> <nop>
nnoremap <delete> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <Space> <nop>
inoremap <F1> <nop>
nnoremap <F1> <nop>
inoremap <esc> <nop>
nnoremap $ <nop>
nnoremap ^ <nop>

" restoring settings
syntax enable
filetype plugin indent on

