#!/bin/bash

#Colours
endColour="\033[0m\e[0m"
greenColour="\e[0;32m\033[1m"
yellowColour="\e[0;33m\033[1m"
whiteColour="\e[0;37m\033[1m"

function helpPanel(){
	echo -e "\n${yellowColour}[*]${endColour}${whiteColour} Use: ./bug-recon.sh${endColour}"
	echo -e "\n\t${greenColour}-h ->${endColour}${whiteColour} Show this help panel${endColour}"
	echo -e "\t${greenColour}-i ->${endColour}${whiteColour} Install requirements${endColour}"
	echo -e "\n\t${greenColour}-s \"Bounty Platform\" \"Company Name\" \"Domain Targets (One or More)\" ->${endColour}${whiteColour} Starting RECON config${endColour}"
	echo -e "\n\t${greenColour}-a \"Company Name\" ->${endColour}${whiteColour} Get Subdomains and verification live status (http/https)${endColour}"
	exit 1
}