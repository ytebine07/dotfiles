#/bin/sh

clear
esc="\e["
for fore in 30 31 32 33 34 35 36 37; do
	line0="${fore}  "
	line1=";1  "
	line4=";4  "
	line5=";5  "
	line7=";7  "
	line8=";8  "

	for back in 40 41 42 43 44 45 46 47; do
		line0="${line0}${esc}${back};${fore}m Normal    ${esc}m"
		line1="${line1}${esc}${back};${fore};1m Bold      ${esc}m"
		line4="${line4}${esc}${back};${fore};4m Under bar ${esc}m"
		line5="${line5}${esc}${back};${fore};5m Blink     ${esc}m"
		line7="${line7}${esc}${back};${fore};7m Reverse   ${esc}m"
		line8="${line8}${esc}${back};${fore};8m Concealed ${esc}m"
	done

	echo "     40         41         42         43         44         45         46         47"
	echo -e "${line0}"
	echo -e "${line1}"
	echo -e "${line4}"
	echo -e "${line5}"
#	echo -e "${line7}"
#	echo -e "${line8}"
done

