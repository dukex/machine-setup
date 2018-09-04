let mapleader = ","

" config netw

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netw_winzie = 25
let g:rspec_command = "Dispatch bundle exec rspec {spec}"

nnoremap <Leader>e :Vexplore<Enter>

call plug#begin('~/.config/nvim/plugged')

" Plugins

Plug 'dracula/vim', { 'as': 'dracula' }

"" Fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'

"" asynchronously run file checker
Plug 'neomake/neomake'
Plug 'rainerborene/vim-reek'
Plug 'kagux/vim-rubocop-autocorrect'
Plug 'szw/vim-maximizer'

"" Completation
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Ctags
" Plug 'ludovicchabant/vim-gutentags'

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'thoughtbot/vim-rspec'

" Elixir
Plug 'slashmili/alchemist.vim'

call plug#end()

set termguicolors
set background=light

" RSpec.vim mappings
map <Leader>rc :call RunCurrentSpecFile()<CR>
map <Leader>re :call RunNearestSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" Deploy
map <Leader>d :Dispatch! bin/deploy<CR>

" Reload config
map <Leader>rr :source ~/.config/nvim/init.vim<CR>

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

" enable deoplete
let g:deoplete#enable_at_startup = 1

let $FZF_DEFAULT_COMMAND = 'ag -g ""'


" Run a given vim command on the results of alt from a given path.
" See usage below.
function! AltCommand(path, vim_command)
  let l:alternate = system("alt " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

" Find the alternate file for the current path and open it
nnoremap <leader>. :w<cr>:call AltCommand(expand('%'), ':vsplit')<cr>

vnoremap <C-c> :norm i
map <C-n> :norm x<CR>

" fold
set foldcolumn=0    " visual representation of folds
set foldmethod=syntax
set nofoldenable

nnoremap <silent><leader>z :MaximizerToggle<CR>
vnoremap <silent><leader>z :MaximizerToggle<CR>gv
inoremap <silent><leader>z <C-o>:MaximizerToggle<CR>

