#         _
# _______| |__
#|_  / __| '_ \
# / /\__ \ | | |
#/___|___/_| |_|
#
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[yellow]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
stty stop undef
alias ls='lsd'
export LS_COLORS='di=4;39:fi=0:ln=1;39:pi=0:so=0:bd=0:cd=0:or=1;31:mi=0:ex=92:*.c=34:*.h=34:*.py=93:*.cpp=34:*.go=36'
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
#export LS_COLORS
#zsh plugin
#zsh-syntax-highlighting
#zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# the detailed meaning of the below three variable can be found in `man zshparam`.
export HISTFILE=~/.histfile
export HISTSIZE=100000 
export SAVEHIST=100000
export EDITOR=nvim
setopt share_history
alias drugs='timeout 30s cmatrix | lolcat -tif; clear'
#alias bt='bluetoothctl connect 5C:FB:7C:67:11:45'
alias image_f='sxiv -r ~/pictures'
alias xi='sxiv'
alias redon='redshift -l 45.464:9.189 &'
alias redoff='redshift -x'
alias findkey='xev'
alias al-cd='cd "$(cat "${HOME}/.config/alfonso/where")"'
alias vkey='setxkbmap -layout us -option ctrl:swapcaps; xinput disable 14' 
alias nkey='setxkbmap -layout it; xinput enable 14'
alias nv='nvim'
alias hx='helix'

#alfonso
al() {
    alfonso "$@"
    cd "$(cat "${HOME}/.config/alfonso/where")"
}

#. "$HOME/.cargo/env"

[ -f "/home/luca/.ghcup/env" ] && source "/home/luca/.ghcup/env" # ghcup-env

source /home/luca/.config/broot/launcher/bash/br

