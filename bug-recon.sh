#!/bin/bash

# Author: G3kSec - ¡Happy RECON!

#Import functions 
source functions/banner.sh
source functions/helpPanel.sh
source functions/start-recon.sh
source functions/getSubdomains.sh

#Colours
endColour="\033[0m\e[0m"
greenColour="\e[0;32m\033[1m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
whiteColour="\e[0;37m\033[1m"

# Bot Telegram
url="https://api.telegram.org/bot$BOT_TELEGRAM/sendMessage"

function ctrl_c() {
  echo -e "\n\n${yellowColour}[!]${endColour}${grayColour} Exit...${endColour}\n"
  tput cnorm && exit 1
}

trap ctrl_c INT

declare -i parameter_counter=0

banner

while getopts "s:a:h" arg; do
  case $arg in
    s) platformName="$OPTARG"; companyName="$3"; targets="$4"; let parameter_counter+=1;;
    a) companyName="$OPTARG"; let parameter_counter+=2;;
    h) ;;
  esac
done

if [ $parameter_counter -eq 1 ]; then
  startRecon "$url" "$platformName" "$companyName" "$targets"
elif [ $parameter_counter -eq 2 ]; then
  getSubdomains "$url" "$companyName"
#   searchOs $os
# elif [ $chivato_difficulty -eq 1 ] && [ $chivato_os -eq 1 ]; then
#   searchOsAndDiff $difficulty $os
# elif [ $parameter_counter -eq 7 ]; then
#   searchSkill "$skill"
else
  helpPanel
fi