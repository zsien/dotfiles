HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space

eval $(dircolors)

if [[ $UID != 0 ]]; then
  path=(
    $HOME/.local/bin
    $HOME/.cargo/bin
    $HOME/go/bin
    $HOME/go/bins
    $path
  )

fi

if [ $(command -v rustc >> /dev/null) ]; then
  fpath=(
    $(rustc --print sysroot)/share/zsh/site-functions
    $fpath
  )
fi

fpath=(
  /usr/local/share/zsh-pure
  /usr/local/share/zsh-users/zsh-completions/src
  $fpath
)

bindkey "^[[1;5C" forward-word  # Ctrl + 左方向鍵移動到上一個詞前
bindkey "^[[1;5D" backward-word # Ctrl + 右方向鍵移動到下一個詞前

# pure prompt
autoload -U promptinit && promptinit
prompt pure
prompt_newline='%666v'
PROMPT=' %(?.%F{$prompt_pure_colors[prompt:success]}.%F{$prompt_pure_colors[prompt:error]})${prompt_pure_state[prompt]}%f '

if [[ $UID == 0 || $EUID == 0 ]]; then
  # root
  PURE_PROMPT_SYMBOL="#"
fi


# completions
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
autoload -U compinit && compinit

source /usr/local/share/zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-users/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

export EDITOR=vim
export VISUAL=vim

alias ls='ls --group-directories-first --color=auto'
alias rm='rm -i'
