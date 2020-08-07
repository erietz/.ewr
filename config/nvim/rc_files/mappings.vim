let mapleader=","
let maplocalleader=";"

" Yank to clipboard
vnoremap <leader>y "*y

" Easier to save 
inoremap ;w :w<Enter>
nnoremap ;w :w<Enter>
	
" Status line
set laststatus=2 			" Always show status line
set statusline=%F 			" Full path to file
"set statusline+=%= 			" Switch to right aligned
"set statusline+=line\ %l\ of\ %L 	" Current line / total lines

" Quickly edit/reload vimrc
nnoremap <silent> <leader>ev :vsplit ~/.vim/vimrc <CR>
nnoremap <silent> <leader>sv :so ~/.vim/vimrc <CR>

" Jump around with tags 
inoremap <leader><Tab> <Esc>/<++><CR>"_c4l
vnoremap <leader><Tab> <Esc>/<++><CR>"_c4l
nnoremap <leader><Tab> <Esc>/<++><CR>"_c4l
inoremap <leader>tag <++>

" Changing window splits
nnoremap <c-h> :wincmd h<CR>
nnoremap <c-j> :wincmd j<CR>
nnoremap <c-k> :wincmd k<CR>
nnoremap <c-l> :wincmd l<CR>
nnoremap <A-l> <C-w>>
nnoremap <A-h> <C-w><
nnoremap <leader>f <C-w>f<C-w>L
	
" Parenthesis and Brackets
"inoremap { {}<Esc>i
"inoremap {{ {
"inoremap ( ()<Esc>i
"inoremap (( (
"inoremap [ []<Esc>i
"inoremap [[ [
"inoremap " ""<Esc>i
"inoremap "" "
"inoremap ' ''<Esc>i
"inoremap '' '
	
" Wrap visual selection in delimiter
vnoremap <leader>{ <Esc>`>a}<Esc>`<i{<Esc>
vnoremap <leader>( <Esc>`>a)<Esc>`<i(<Esc>
vnoremap <leader>[ <Esc>`>a]<Esc>`<i[<Esc>
vnoremap <leader>' <Esc>`>a'<Esc>`<i'<Esc>
vnoremap <leader>" <Esc>`>a"<Esc>`<i"<Esc>
vnoremap <leader>* <Esc>`>a*<Esc>`<i*<Esc>
vnoremap <leader>** <Esc>`>a**<Esc>`<i**<Esc>
vnoremap <leader>$ <Esc>`>a$<Esc>`<i$<Esc>
vnoremap <leader>$$ <Esc>`>a$$<Esc>`<i$$<Esc>
	
" Formatting paragraphs
inoremap <leader>q gqap
nnoremap <leader>q gqap

" Moving of code blocks
vnoremap < <gv  
vnoremap > >gv  

"nnoremap <leader>s :set spell<CR>	" spell checking
"nnoremap <leader>ns :set nospell<CR>	" spell checking

" Adding comments until end of line
nnoremap <leader>- :set ri<cr>80A-<esc>81<bar>d$0:set nori<cr>

" Open URLs with gx mapping ------------------------------
" let g:netrw_browser_viewer='open' " cannot get to work
" This is my workaround 
" First disable the default gx
let g:netrw_nogx = get(g:, 'netrw_nogx', 1)
" Make function to use 'open'
function! Open(url)
  silent execute '!open ' . a:url
  redraw!
endfunction
" Call the function with gx
nnoremap  gx viW"xy \| :call Open(@x)<CR>
"---------------------------------------------------------
"
function! ZoteroCite()
  " pick a format based on the filetype (customize at will)
  let format = &filetype =~ '.*tex' ? 'citep' : 'pandoc'
  let api_call = 'http://127.0.0.1:23119/better-bibtex/cayw?format='.format.'&brackets=1'
  let ref = system('curl -s '.shellescape(api_call))
  return ref
endfunction

noremap <leader>z "=ZoteroCite()<CR>p
inoremap <C-z> <C-r>=ZoteroCite()<CR>

command! CommonFiles call fzf#run({'source': 'cat ~/.vim/rc_files/common_files.txt', 'sink': 'e'})
nnoremap <leader>e :CommonFiles<CR>

nnoremap <leader>r :Run<CR>
vnoremap <leader>r :Run<CR>

nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
