path=(
  $HOME/bin
  /usr/local/{bin,sbin}
  /usr/{bin,sbin}
  /{bin,sbin}
  $path
)

# deduplication
typeset -aU path

fpath=(
  /usr/local/share/zsh-pure
  /usr/local/share/zsh-users/zsh-completions/src
  $fpath
)
