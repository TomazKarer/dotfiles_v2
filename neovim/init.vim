lua << EOF
  require('init')
EOF

let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" VimWiki hack: when opening new diary file, use template
au BufNewFile ~/zapiski/vimwiki_md/diary/*.md : 0r !~/.vim/bin/generate-vimwiki-diary-template '%'

