#!/bin/bash

# Author: G3kSec - ¡Happy RECON!

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
whiteColour="\e[0;37m\033[1m"

# Banner
echo -e $yellow"
                  _                 
 ███████████                                 ███████████                                        
░░███░░░░░███                               ░░███░░░░░███                                       
 ░███    ░███ █████ ████  ███████            ░███    ░███   ██████   ██████   ██████  ████████  
 ░██████████ ░░███ ░███  ███░░███ ██████████ ░██████████   ███░░███ ███░░███ ███░░███░░███░░███ 
 ░███░░░░░███ ░███ ░███ ░███ ░███░░░░░░░░░░  ░███░░░░░███ ░███████ ░███ ░░░ ░███ ░███ ░███ ░███ 
 ░███    ░███ ░███ ░███ ░███ ░███            ░███    ░███ ░███░░░  ░███  ███░███ ░███ ░███ ░███ 
 ███████████  ░░████████░░███████            █████   █████░░██████ ░░██████ ░░██████  ████ █████
░░░░░░░░░░░    ░░░░░░░░  ░░░░░███           ░░░░░   ░░░░░  ░░░░░░   ░░░░░░   ░░░░░░  ░░░░ ░░░░░ 
                         ███ ░███                                                               
                        ░░██████                                                                
                         ░░░░░░                                                                 
By_G3kSec | {v1.0}
@G3kSec
"$end

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n${yellowColour}[*]${endColour}${grayColour}Exit...${endColour}"
	tput cnorm;
  exit 0
}

function helpPanel(){
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} Uso: ./bug-recon.sh${endColour}"
	echo -e "\t${greenColour}a)${endColour}${whiteColour} Analytics and Technology${endColour}"
	echo -e "\n${greenColour}s)${endColour}${whiteColour} Subdomain Enumeration${endColour}"
	echo -e "\t${greenColour}h)${endColour}${whiteColour} Mostrar este panel de ayuda${endColour}\n"
	exit 0
}

if [ "$(id -u)" == "0" ]; then
	declare -i parameter_counter=0; while getopts "h:" arg; do
		case $arg in
			h) helpPanel;;
		esac
	done
	if [ $parameter_counter -ne 2 ]; then
		helpPanel
	else
		tput cnorm;
	fi
else
	echo -e "\n${redColour}[*] No soy root${endColour}\n"
fi