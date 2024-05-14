#!/bin/bash

# Author: G3kSec - ¡Happy RECON!

source functions/banner.sh
source functions/helpPanel.sh
source functions/startRecon.sh
source functions/subdomainEnum.sh

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

while getopts "i:s:h" arg; do
  case $arg in
    i) companyName="$OPTARG"; platformName="$3"; let parameter_counter+=1;;
    s) companyName="$OPTARG"; let parameter_counter+=2;;
    h) ;;
  esac
done

if [ $parameter_counter -eq 1 ]; then
  startRecon "$url" "$companyName" "$platformName"
elif [ $parameter_counter -eq 2 ]; then
  subdomainEnum "$url" "$companyName"
# elif [ $parameter_counter -eq 3 ]; then
#   getContentDiscovery "$companyName"
else
  helpPanel
fi