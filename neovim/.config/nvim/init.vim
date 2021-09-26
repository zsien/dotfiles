"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

let s:path = '~/.local/share/dein'

" Required:
if dein#load_state(s:path)
  let s:dein_toml = '~/.config/nvim/dein.toml'
  let s:dein_lazy_toml = '~/.config/nvim/dein-lazy.toml'
  
  call dein#begin(s:path, [
      \ expand('<sfile>'), s:dein_toml, s:dein_lazy_toml
      \ ])
  
  call dein#load_toml(s:dein_toml, {'lazy': 0})
  call dein#load_toml(s:dein_lazy_toml, {'lazy' : 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
