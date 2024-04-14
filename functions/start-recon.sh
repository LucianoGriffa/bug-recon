#!/bin/bash

#Colours
endColour="\033[0m\e[0m"
greenColour="\e[0;32m\033[1m"
redColour="\e[0;31m\033[1m"
yellowColour="\e[0;33m\033[1m"
whiteColour="\e[0;37m\033[1m"

function startRecon() {
  tput civis
  urlTelgram="$1"
  platformName="$2"
  companyName="$3"
  targets="$4"
  platformSyntax=$(echo $platformName | sed 's/ //g')
  companySyntax=$(echo $companyName | sed 's/ //g')
  dir_path="./${platformSyntax}/${companySyntax}"
  echo -e "\t${greenColour}Bug Bounty Platform: ${endColour}${whiteColour}$platformName${endColour}"
  echo -e "\t${greenColour}Company Name: ${endColour}${whiteColour}$companyName${endColour}"
  echo -e "\t${greenColour}Targets: ${endColour}${whiteColour}$(echo $targets | sed 's/ /, /g')${endColour}"
  confirm=""
  question= echo -e "\n\t${whiteColour}Are these data correct? Enter${endColour} ${greenColour}(y)${endColour}${whiteColour} to continue or ${endColour}${greenColour}(n)${endColour}${whiteColour} to cancel${endColour}"
  read -p $'\n\t'"Response: " confirm
  if [ "$confirm" != "n" ] && [ "$confirm" != "y" ]; then
    echo -e "\n\t${redColour}Error: Invalid response.${endColour}"
    tput cnorm && exit 1
  elif [ "$confirm" = "n" ]; then
    echo -e "\n\t${redColour}The operation was canceled...${endColour}"
    tput cnorm && exit 1
  elif [ "$confirm" = "y" ]; then
    echo -e "\n\t${greenColour}The data is correct...Starting...${endColour}"
    if [ ! -d "$dir_path" ]; then
      echo -e "\n\t${yellowColour}Creating folders and files...${endColour}"
      mkdir -p "$dir_path"
      echo "Company Name: ${companyName}" >> "$dir_path/general-info.txt"
      echo "Bug Program: ${platformName}" >> "$dir_path/general-info.txt"
      echo "Link Bug Program: https://${platformSyntax}.com/$(echo $companySyntax | tr '[:upper:]' '[:lower:]')" >> "$dir_path/general-info.txt"
      echo "Description:" >> "$dir_path/general-info.txt"
      echo -e "\nAcquisitions and Company History:" >> "$dir_path/general-info.txt"
      echo "https://www.crunchbase.com/organization/$(echo $companySyntax | tr '[:upper:]' '[:lower:]')" >> "$dir_path/general-info.txt"
      echo "https://en.wikipedia.org/wiki/$(echo $companySyntax | tr '[:upper:]' '[:lower:]')" >> "$dir_path/general-info.txt"
      echo "https://www.google.com/search?q=$(echo $companySyntax | tr '[:upper:]' '[:lower:]')" >> "$dir_path/general-info.txt"
      echo -e "\nTargets:" >> "$dir_path/general-info.txt"
      echo "$(echo $targets | sed -r 's/ /\n/g')" >> "$dir_path/general-info.txt"
      bat -A "$dir_path/general-info.txt"
      message="[ ! ] ¡NEW RECON INIT!
      Company Name: ${companyName}
      Bug Program: ${platformName}
      Link Bug Program: https://hackerone.com/$(echo $companySyntax | tr '[:upper:]' '[:lower:]')"
      curl --silent --output /dev/null -F chat_id="$CHAT_ID" -F "text=$message" $urlTelgram -X POST
      sleep 1
      tput cnorm
    else
      echo -e "\n\t${yellowColour}The directory already exists.${endColour}\n"
      bat "$dir_path/general-info.txt"
      tput cnorm
    fi
  fi
  tput cnorm
}