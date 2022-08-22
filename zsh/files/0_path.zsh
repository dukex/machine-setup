# path, the 0 in the filename causes this to load first
path=(
  /usr/bin
  /usr/local/{bin,sbin}
  $path
  $HOME/bin
  $HOME/.local/bin
  $HOME/.cargo/bin
)
