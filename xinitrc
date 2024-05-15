xset s off -dpms
unclutter -idle 3 &
setxkbmap -layout us -option ctrl:swapcaps
xinput disable 14
xwallpaper --zoom $HOME/pictures/trippy-fractal.jpeg
#wmname compiz
#pulseaudio --start
#pulseaudio -D
picom -b
#dmw
slstatus &
exec dbus-launch dwm

#bspwm
#exec dbus-launch bspwm
