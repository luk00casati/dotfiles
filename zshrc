#         _
# _______| |__
#|_  / __| '_ \
# / /\__ \ | | |
#/___|___/_| |_|
#
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[yellow]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
alias ls='ls --color'
LS_COLORS='di=4;39:fi=0:ln=1;39:pi=0:so=0:bd=0:cd=0:or=1;31:mi=0:ex=92:*.c=34:*.h=34:*.py=93:*.cpp=34:*.go=36'
export LS_COLORS
#zsh plugin
#zsh-autocomlete
#zsh-syntax-highlighting
#zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# the detailed meaning of the below three variable can be found in `man zshparam`.
export HISTFILE=~/.histfile
export HISTSIZE=100000 
export SAVEHIST=100000
setopt share_history
alias drugs='timeout 30s cmatrix | lolcat -tif; clear'
#alias bt='bluetoothctl connect 5C:FB:7C:67:11:45'
#alias bt='bluez connect 5C:FB:7C:67:11:45'
alias image_f='sxiv -r ~/pictures'
alias xi='sxiv'
alias redon='redshift -l 45.464:9.189 &'
alias redoff='redshift -x'
alias findkey='xev'
alias tl='tree | less'
alias fv='${HOME}/script/fv.sh'
alias al-cd='cd "$(cat "${HOME}/.config/alfonso/where")"'
alias vkey='setxkbmap -layout us -option ctrl:swapcaps; xinput disable 14' 
alias nkey='setxkbmap -layout it; xinput enable 14'
#alias h='tac $HISTFILE | awk -F "[;]" "{print \$2}" | uniq | fzf | zsh'
#alias ls='lsd'
#dbus-update-activation-environment --all #solution github-desktop
alias nv='nvim'
alias hx='helix'
alias books='${HOME}/script/choose_book'
alias backup-usb='rsync -ruvP --delete --exclude=.cache --exclude=.ghcup /home/luca /mnt/media/usb'
alias ride='dex /usr/share/applications/ride-bin.desktop &'

#alfonso
al() {
    alfonso "$@"
    cd "$(cat "${HOME}/.config/alfonso/where")"
}

. "$HOME/.cargo/env"

[ -f "/home/luca/.ghcup/env" ] && source "/home/luca/.ghcup/env" # ghcup-env

