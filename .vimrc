""""""""""""""""""""""""""""
" Main section
""""""""""""""""""""""""""""
set nocompatible
" enables loading the plugin files for specific file types
filetype plugin on
" enables syntax highlighting 
syntax on
" color more:
:color desert



""""""""""""""""""""""""""""
" Main section
""""""""""""""""""""""""""""
let mapleader=","

" remaps jk to Escape
inoremap jk <esc>

" highlight all search matches
set hlsearch

" sets incremental search ("progressive")
set incsearch

" Shows relative row number
set relativenumber

" With current row also displayed
set number

" map F2 to paste/nopaste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" sets auto indentation for yamls at 2 spaces
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set foldmethod=indent
set nofoldenable

autocmd FileType json set foldmethod=syntax

" set autochdir

""""""""""""""""""""""""""""
" VimWiki section
""""""""""""""""""""""""""""
" VimWiki settings:
let wiki_markdown = {}
let wiki_markdown.path = '~/zapiski/vimwiki_md/'
let wiki_markdown.syntax = 'markdown'
let wiki_markdown.ext = '.md'

" VimWiki remaps Forward (Ctrl-i), this is a workaround for restoring it
nmap <Leader>wn <Plug>VimwikiNextLink

let g:vimwiki_list = [wiki_markdown]

" VimWiki hack: when opening new diary file, use template
au BufNewFile ~/zapiski/vimwiki_md/diary/*.md : 0r !~/.vim/bin/generate-vimwiki-diary-template '%'


""""""""""""""""""""""""""""
" Plug section
""""""""""""""""""""""""""""
" Plug plugins
call plug#begin('~/.vim/plugged')
  " FZF 
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  " Nerd tree
  Plug 'preservim/nerdtree'
  " FZF vim
  Plug 'junegunn/fzf.vim'
  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Fugitive
  Plug 'tpope/vim-fugitive'
  " COC
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " COC extensions
  let g:coc_global_extensions = [
   \ 'coc-tsserver',
   \ 'coc-pyright',
   \ 'coc-java',
   \ 'coc-java-debug',
   \ 'coc-sh',
   \ 'coc-yaml',
   \ ]
  " Vimspector
  Plug 'puremourning/vimspector'
  " Markdown preview
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()


""""""""""""""""""""""""""""
" NERDTree section
""""""""""""""""""""""""""""
" remaps Leader(,)-n for Nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>

" autocmd BufEnter * lcd %:p:h

" Check if NERDTree is open or active
" function! IsNERDTreeOpen()        
"   return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" endfunction
" 
" " Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" " file, and we're not in vimdiff
" function! SyncTree()
"   if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"     NERDTreeFind
"     wincmd p
"   endif
" endfunction
" 
" " Highlight currently open buffer in NERDTree
" autocmd BufRead * call SyncTree()
" 

""""""""""""""""""""""""""""
" WSL2 section
""""""""""""""""""""""""""""
" yank support: this copies to windows clipboard on WSL2
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif


""""""""""""""""""""""""""""
" COC section
""""""""""""""""""""""""""""

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


""""""""""""""""""""""""""""
" Vimspector section
""""""""""""""""""""""""""""

let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-java-debug' ] ", 'debugger-for-chrome' ]

" :VimspectorInstall! --verbose debugpy --no-check-certificate
" :VimspectorInstall! --verbose vscode-node-debug2 --no-check-certificate

" Airline:
set t_Co=256

" Vzajemna:
" ker so templati za stacke .template, a so v resnici yamli:
au BufNewFile,BufRead /home/tkarer/gitcheckouts/Digital/apps/*/*.template setlocal ft=yaml
