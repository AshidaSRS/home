#!/bin/zsh

#Fondo de pantalla
#feh --bg-scale /home/ashida/Imágenes/Rotate/cascos.jpg
while true; do
	feh --randomize --bg-scale ~/Imágenes/Rotate/*
	sleep 30s
done &
#conky
(sleep 5s && conky | dzen2 -x '550' -e '' -fg '#E0E0E0' -bg '#000000' -h '15' -ta r -fn '-*-terminus-medium-r-*-*-10-*-*-*-*-*-*-*' -p) &

#Teclado en español
setxkbmap es

#Reproductor de musica
mpd ~/.mpd/mpd.conf 

#Iniciamos guake
guake &

#Ejecutamos dwm
exec dwm
