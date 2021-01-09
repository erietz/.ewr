" Vim Wiki
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [
  \{'path': '~/GD_IU/library/notes/',
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
  \ 'path_html': '~/GD_IU/library/notes/formatted/html',
  \ 'custom_wiki2html': '$HOME/github/python/utilities/convert_vimwiki.py',},
  \{'path': '~/GD_EWR/notes/',
  \ 'syntax': 'markdown',
  \ 'ext': '.md'}]

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end
let g:vimwiki_table_mappings = 0
"let g:vimwiki_markdown_link_ext = 1
"

