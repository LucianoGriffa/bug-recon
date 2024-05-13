#!/bin/bash

# Colores
endColour="\033[0m\e[0m"
greenColour="\e[0;32m\033[1m"
redColour="\e[0;31m\033[1m"
yellowColour="\e[0;33m\033[1m"
whiteColour="\e[0;37m\033[1m"

function startRecon() {
  tput civis
    if [ -z "$2" ] || [ -z "$3" ]; then
      echo "Error: You must provide both a company name and a bug program name as arguments."
    else
      urlTelgram="$1"
      companyName="$2"
      platformName="$3"
      mkdir ~/BugBounty/${companyName} && touch ~/BugBounty/${companyName}/domains.txt
      message="[ ! ] ¡NEW RECON INIT!
      Company: ${companyName}
      Bug Program: ${platformName}
      Link Bug Program: https://${platformName,,}.com/${companyName}
      Main Folder: ~/BugBounty/${companyName}
      "
      curl --silent --output /dev/null -F chat_id="$CHAT_ID" -F "text=$message" $urlTelgram -X POST
      sleep 1
    fi
  tput cnorm
}