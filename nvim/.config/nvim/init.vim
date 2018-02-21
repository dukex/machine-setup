let mapleader = ","

" config netw

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netw_winzie = 25
nnoremap <Leader>e :Vexplore<Enter>

call plug#begin('~/.config/nvim/plugged')

" Plugins

"" Fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'

" run tests from vim
Plug 'janko-m/vim-test'

"" netw improve
Plug 'tpope/vim-vinegar'

"" asynchronously run plograms
Plug 'neomake/neomake'

call plug#end()

"" setup vim-test
let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'neovim',
  \ 'suite':   'neovim',
  \}

""" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g


"" using ,t to fuzzy find
nnoremap <Leader>t :FZF<CR>

"" auto check file using neomake
autocmd! BufWritePost,BufEnter * Neomake

"" softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Numbers
set number
set numberwidth=4

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

" natural split opening
set splitbelow
set splitright

" Strip trailing whitespace
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
