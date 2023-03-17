path=(
  $HOME/bin
  $HOME/.cargo/bin
  $HOME/.local/flutter/bin
  /usr/local/{bin,sbin}
  /usr/{bin,sbin}
  /{bin,sbin}
  $path
)

# deduplication
typeset -aU path

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      emulate sh -c ". $i"
    fi
  done
  unset i
fi
