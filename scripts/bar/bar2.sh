#!/bin/bash

STD="#ffb5b2af"
BKG="#33224a"
DBL="#ff4C626D"
LBL="#d0dbf9"
GRN="#81b017"
MAG="#b01781"
RED="#f23535"
YLW="#ffb715"


clk(){
	date '+%a %d %b %H:%M'
}

work(){
	SPACE_NUM=$(xprop -root -notype _NET_CURRENT_DESKTOP | cut -d= -f2);
		case "$SPACE_NUM" in
			" 0")
				WORKSPACE='• ◦ ◦ ◦ ◦ ◦';;
			" 1")
				WORKSPACE='◦ • ◦ ◦ ◦ ◦';;
			" 2")
				WORKSPACE='◦ ◦ • ◦ ◦ ◦';;
			" 3")
				WORKSPACE='◦ ◦ ◦ • ◦ ◦';;
			" 4")
				WORKSPACE='◦ ◦ ◦ ◦ • ◦';;
			" 5")
				WORKSPACE='◦ ◦ ◦ ◦ ◦ •';;

		esac
	echo "$WORKSPACE"
}


#wifi(){
#        WID=$(iwconfig | grep wlp3s0 | cut -d: -f 2 | sed s/'"'//g)
#	echo "⇅ ${WID// /}"
#}

net() {
	ping=`ping 8.8.8.8 -c 1 | awk '/rtt/ {printf("%d\n",$4 + 0.5)}'`

	test -n "${ping}" && echo "x " || echo "%{F$RED}   %{F-} No Connection"
          
	echo 
}

#battery(){
#	BAT=$(acpi --battery | cut -d, -f 2)
#        echo "⭫$BAT"
#}

vol(){
	VOL=$(amixer get Master | grep Mono: | cut -d\[ -f 2 | sed s/"] "//)
	echo "⊲ $VOL"
}

mpd(){
	if [[ $(mpc status | awk 'NR==2 {print $1}') == "[playing]" ]]; then
		TTL=$(mpc current --format "%title%")
		echo "♫ $TTL"
	else
		echo "♫ Paused"
	fi
}


while :; do

	echo "%{l}%{B$YLW}  $(work)  %{l}%{r}%{B$RED}  $(vol)  %{B$YLW}  $(net)  %{B$RED}    $(mpd)  %{B$YLW}  ⭧ $(clk)  %{B$BKG}%{r}"

sleep 1s 
done

