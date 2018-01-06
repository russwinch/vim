" ~/.vimrc -> ~/.vim/vimrc 
" Author: Russ Winch
" -based on material from: Shawn Biddle, Steve Losh, George Kaimakis <---- 
" Source: ~/.vim/...  
" 
" PATHOGEN & Compatability:------------------------------------------------{{{1 
" filetype off 
execute pathogen#infect() 
filetype plugin indent on 
set nocompatible
"
" AIRLINE:-----------------------------------------------------------------{{{1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"
" SYNTASTIC:---------------------------------------------------------------{{{1
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_x = 0
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_mode_map = { "mode": "passive" }
" let g:syntastic_python_checkers = ['pylint']
" let g:syntastic_shell = '/bin/bash'
" let g:syntastic_python_pylint_exec='/Users/Russ/.vim/bundle/syntastic.git/syntax_checkers/python/pylint.vim'
"
" NEOCOMPETE:--------------------------------------------------------------{{{1
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" NERDTree:----------------------------------------------------------------{{{1
nnoremap <leader>ed <ESC>:NERDTreeTabsToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

" Show SYNTAX HIGHLIGHTING GROUP for word under cursor:--------------------{{{1
"
nmap <C-S-P> :call <sid>SynStack()<CR>
function! <sid>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
"
" BASIC SETTNGS:-----------------------------------------------------------{{{1

set t_Co=256
syntax enable
set shortmess+=Iw
set number
colorscheme spacegray
" colorscheme desert
set background=dark
set showmode
set showcmd
set list
set listchars=tab:›\ ,trail:–,extends:»,precedes:«,eol:¬
set showbreak=↳\ 
set hidden
set visualbell
set cursorline
set gdefault
set laststatus=2
set backspace=2
set scrolloff=5
set title
set statusline="sn"
set ruler

highlight colorcolumn ctermbg=darkred
" highlight cursorline ctermbg=none ctermfg=none cterm=BOLD
highlight cursorline ctermbg=236 ctermfg=none
"highlight nontext ctermfg=darkgrey ctermbg=none guifg=4a4a59
"highlight specialkey ctermfg=darkgrey ctermbg=none guifg=4a4a59

" Finding & Autocomplete:----------------------------------------------------{{{1

set path+=**
set wildmenu
set hlsearch
set incsearch
set ignorecase
set smartcase
set highlight=si
set showmatch

" Tabs, Spaces, Wrapping, Re-Mapping:--------------------------------------{{{1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set textwidth=80
set colorcolumn=+1


" remap the Leader key:
let mapleader = ","
let maplocalleader = "\\"

" toggle wrapping:
noremap <silent> <leader>wr <ESC>:set wrap!<CR><ESC>

" remap the arrow keys:
" : in NORMAL mode
noremap <up> <Nop>
" noremap <up> ddkP
noremap <left> <Nop>
noremap <right> <Nop>
noremap <down> <Nop>
" noremap <down> ddp

" : in INSERT mode
inoremap <up> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
inoremap <down> <Nop>

" : in VISUAL mode
vnoremap <up> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>
vnoremap <down> <Nop>

" quick pairs in INSERT mode
inoremap <leader>' ''<ESC>i
inoremap <leader>" ""<ESC>i
inoremap <leader>* **<ESC>i
inoremap <leader>( ()<ESC>i
inoremap <leader>[ []<ESC>i
inoremap <leader>t[ [  ]<ESC>hi
inoremap <leader>{ {}<ESC>i
inoremap <leader>< <><ESC>i
" surround a word with ... pairs
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
nnoremap <leader>< viw<esc>a><esc>hbi<<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel
nnoremap <leader>__ viw<esc>a__<esc>hbi__<esc>lel
" exit pair(s) to end of line:
inoremap <c-l> <ESC>A
" exit nested pair to within parent pair:
inoremap <c-j> <ESC>la
" set up function block:
inoremap <leader>{{ {}<ESC>i<CR><ESC>O

"smash escape
inoremap jk <ESC>

" insert blank row
nnoremap <leader>r o<ESC>
nnoremap <leader>R O<ESC>

" navigating between vim tabs
nnoremap <leader>n <ESC>:tabn<CR>
nnoremap <leader>p <ESC>:tabp<CR>

" use relative numbering
nnoremap <silent> <leader>u <ESC>:set relativenumber!<CR><ESC>
inoremap <silent> <leader>u <ESC>:set relativenumber!<CR><ESC>i

" movement: centering, cursor to page
"nnoremap G Gzz
"nnoremap k kzz
"nnoremap j jzz
"nnoremap H Hzz
"nnoremap M Mzz
"nnoremap L Lzz
"nnoremap } }zz
"nnoremap { {zz

" miscilanious mappings:
" open vimrc in a split for a quick edit
nnoremap <leader>ev :tabe $MYVIMRC<cr>
" source the vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>
" -all-caps & continue in INSERT mode
inoremap <c-u> <esc>viwUea
" -all-caps & continue in NORMAL mode
nnoremap <c-u> viwUea<ESC>
" -add missing ';' to end of statements
nnoremap <leader>; mqA;<ESC>`q
" - search & highlighting
nnoremap <silent> <leader>nh :nohl<cr>
" -useful Fkey mappings:
map <F2> <ESC>i#!/bin/bash<ESC>o<ESC>
map <F3> <ESC>i#!/usr/local/bin/python3<ESC>o<ESC>
map <F4> <ESC>o# This file was created on <ESC>:r!date "+\%x"<ESC>kJ0<ESC>
map <F5> <ESC>o# Author: George Kaimakis - https://github.com/geokai<ESC>o<ESC>

" Folding:-----------------------------------------------------------------{{{1
highlight Foldcolumn ctermfg=Darkgrey ctermbg=0 cterm=BOLD
highlight Folded ctermfg=Darkgrey ctermbg=NONE cterm=none
set foldcolumn=4
set foldmethod=marker
set foldlevelstart=0

function! MyFoldText()  "  {{{2
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  let onetab = strpart('           ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 - len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction  "  2}}}

set foldtext=MyFoldText()

" Crontab safe:------------------------------------------------------------{{{1
" Make vim able to edit crontab files w/o exploding!
set backupskip=/tmp/*,/private/tmp/*"

" Examples:----------------------------------------------------------------{{{1
"void main (arg, arg) {
"	printf ("Hello World");
"}


" steve losh - learn<VIMSCRIPT>thw chapter 29...delete 2 lines, undo one at a
" time
"
" nnoremap <leader>d ddi<C-G>u<ESC>dd
"
" 1}}}

" End of .vimrc file:
