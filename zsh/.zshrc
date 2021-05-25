platform='unknown'
unamestr=$(uname)
if [ "$unamestr" = 'Linux' ]; then
  platform='linux'
elif [ "$unamestr" = 'FreeBSD' ]; then
  platform='freebsd'
elif [ "$unamestr" = 'Darwin' ]; then
  platform='darwin'
fi

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt EXTENDED_HISTORY       # record timestamp of command in HISTFILE
setopt HIST_EXPIRE_DUPS_FIRST # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt HIST_IGNORE_DUPS       # ignore duplication command history list
setopt HIST_IGNORE_SPACE      # ignore commands that start with space
setopt INC_APPEND_HISTORY     # immediately append to the history file

if [ $(command -v dircolors >> /dev/null) ]; then
  eval $(dircolors)
else
  LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'
  export LS_COLORS
fi

bindkey "^[[1;5C" forward-word  # Ctrl + 左方向鍵移動到上一個詞前
bindkey "^[[1;5D" backward-word # Ctrl + 右方向鍵移動到下一個詞前

# pure prompt
autoload -U promptinit && promptinit
prompt pure
prompt_newline='%666v'
PROMPT=" $PROMPT"

if [[ $UID == 0 || $EUID == 0 ]]; then
  # root
  PURE_PROMPT_SYMBOL="#"
fi

# turn on git stash status
zstyle :prompt:pure:git:stash show yes

# completions
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

if [ "$platform" = 'linux' ]; then
  zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,%cpu,tty,cputime,command -w'
else
  zstyle ':completion:*:*:*:*:processes' command 'ps -x -o pid,%cpu,tty,cputime,command -w'
fi

autoload -U compinit && compinit

source /usr/local/share/zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-users/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

export EDITOR=vim
export VISUAL=vim

if [ "$platform" = 'linux' ]; then
  alias ls='ls --group-directories-first --color=auto'
elif [ "$platform" = 'freebsd' -o "$platform" = 'darwin' ]; then
  alias ls='ls -G'
fi

alias rm='rm -i'
