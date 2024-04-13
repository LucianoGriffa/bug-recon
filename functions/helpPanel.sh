#!/bin/bash

#Colours
endColour="\033[0m\e[0m"
greenColour="\e[0;32m\033[1m"
yellowColour="\e[0;33m\033[1m"
whiteColour="\e[0;37m\033[1m"

function helpPanel(){
	echo -e "\n${yellowColour}[*]${endColour}${whiteColour} Use: ./bug-recon.sh${endColour}"
	echo -e "\n\t${greenColour}[ -h ] ->${endColour}${whiteColour} Show this help panel${endColour}"
	echo -e "\t${greenColour}[ -i ] ->${endColour}${whiteColour} Install requirements${endColour}\n"
	echo -e "\t${greenColour}[ -a ] ->${endColour}${whiteColour} Acquisitions and Company History${endColour}"
	echo -e "\t${greenColour}[ -t ] ->${endColour}${whiteColour} Analytics and Technology${endColour}"
	echo -e "\t${greenColour}[ -s ] ->${endColour}${whiteColour} Subdomain Enumeration${endColour}"
  echo -e "\t${greenColour}[ -u ] ->${endColour}${whiteColour} Subdomain Takeover${endColour}"
	echo -e "\t${greenColour}[ -c ] ->${endColour}${whiteColour} Content Discovery${endColour}"
  echo -e "\t${greenColour}[ -p ] ->${endColour}${whiteColour} Port Scanning${endColour}"
	exit 0
}