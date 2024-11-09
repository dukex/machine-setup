# path, the 0 in the filename causes this to load first
path=(
  $HOME/code/.asdf/shims
  $HOME/code/.asdf/bin
  /opt/homebrew/bin
  /opt/homebrew/sbin
  $path
  $HOME/bin
  $HOME/.local/bin
  $HOME/.cargo/bin
  $HOME/code/.npm/bin
  $HOME/code/android-studio/bin
  $HOME/code/flutter/bin
  $HOME/.deno/bin
  $HOME/neovim/bin
  /usr/bin
  /usr/local/{bin,sbin}
  ~/Library/Application Support/Coursier/bin
)
