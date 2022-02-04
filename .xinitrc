#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

#if [ -d /etc/X11/xinit/xinitrc.d ]; then
#  for f in /etc/X11/xinit/xinitrc.d/*; do
#    [ -x "$f" ] && . "$f"
#  done
#  unset f
#fi

# merge custom x resources
[ -f ~/.Xresources ] && xrdb -merge -I$HOME ~/.Xresources

xset +fp /usr/share/fonts/local &
xset fp rehash &

# Accent comose key
setxkbmap -layout us -variant intl &

#setxkbmap -option "caps:ctrl_modifier" &

nitrogen --restore &

numlockx &

# mpd
mpd ~/.config/mpd/mpd.conf

wal -R

#exec startxfce4 

xsetroot -cursor_name left_ptr &
export PANEL_FIFO=/tmp/panel-fifo
wmname LG3D


xmodmap ~/.Xmodmap 

~/scripts/2bwmbar &
exec dbus-run-session 2bwm 
