#!/bin/bash

#Colours
endColour="\033[0m\e[0m"
greenColour="\e[0;32m\033[1m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
whiteColour="\e[0;37m\033[1m"

function helpPanel(){
	echo -e "\n${yellowColour}[*]${endColour}${whiteColour} Use: ./bug-recon.sh${endColour}"
	echo -e "\n\t${greenColour}-h or --help${endColour}${whiteColour} Show this help panel${endColour}\n"
	echo -e "\n\t${greenColour}-i or --install${endColour}${whiteColour} Install requirements${endColour}\n"
	echo -e "\t${greenColour}-a or --history${endColour}${whiteColour} Acquisitions and Company History${endColour}"
	echo -e "\t${greenColour}-t or --tech${endColour}${whiteColour} Analytics and Technology${endColour}"
	echo -e "\t${greenColour}-s or --subdomain${endColour}${whiteColour} Subdomain Enumeration${endColour}"
  echo -e "\t${greenColour}-u or --stakeover${endColour}${whiteColour} Subdomain Takeover${endColour}"
	echo -e "\t${greenColour}-c or --cdiscovery${endColour}${whiteColour} Content Discovery${endColour}"
  echo -e "\t${greenColour}-p or --pscanning${endColour}${whiteColour} Port Scanning${endColour}"
	exit 0
}