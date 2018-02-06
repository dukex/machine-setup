" Make it beautiful - colors and fonts

if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256
  let base16colorspace=256

  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  " For some reason this doesn't work as a regular set command,
  " (the numbers don't show up) so I made it a VimEnter event
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

  set lines=60
  set columns=190

  " set guifont=Menlo\ 15
  set guifont=Fira\ Code\ 23
  set macligatures
else
  let g:CSApprox_loaded = 1
endif

colorscheme base16-tomorrow-night


