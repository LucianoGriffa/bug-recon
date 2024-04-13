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

function startRecon() {
  tput civis
  
  platformName="$1"
  companyName="$2"
  
  dir_path="./${platformName}/${companyName}"
  
  echo -e "\t${greenColour}Bug Bounty Platform: ${endColour}${whiteColour}$platformName${endColour}"
  echo -e "\t${greenColour}Target Company: ${endColour}${whiteColour}$companyName${endColour}"
  
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
    echo -e "\n\t${yellowColour}Creating folders and files...${endColour}"
    if [ ! -d "$dir_path" ]; then
      mkdir -p "$dir_path"
      echo "Company Name: ${companyName}" >> "$dir_path/general-info.txt"
      echo -e "Bug Program: https://hackerone.com/$companyName\n" >> "$dir_path/general-info.txt"
      echo -e "Acquisitions and Company History:" >> "$dir_path/general-info.txt"
      echo "https://en.wikipedia.org/wiki/$companyName" >> "$dir_path/general-info.txt"
      echo "https://www.crunchbase.com/organization/$companyName" >> "$dir_path/general-info.txt"
      echo "https://www.google.com/search?q=$companyName" >> "$dir_path/general-info.txt"
      bat "$dir_path/general-info.txt"
      tput cnorm
    else
      echo -e "\n\t${yellowColour}The directory already exists.${endColour}\n"
      bat "$dir_path/general-info.txt"
      tput cnorm
    fi
  fi
  tput cnorm
}