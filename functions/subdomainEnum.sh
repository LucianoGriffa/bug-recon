#!/bin/bash

# Colores
endColour="\033[0m\e[0m"
greenColour="\e[0;32m\033[1m"
redColour="\e[0;31m\033[1m"
yellowColour="\e[0;33m\033[1m"
whiteColour="\e[0;37m\033[1m"

function getAlive() {
  companyFolder="$1"
  subdomainRoute="${companyFolder}/subdomains.txt"
  aliveRoute="${companyFolder}/alive.txt"
  echo -e "${yellowColour}[+]${endColour} ${whiteColour}Get Alives Subdomains${endColour}"
  cat ${subdomainRoute} | httpx -silent -status-code -tech-detect > "${aliveRoute}"
  echo -e "${yellowColour}[+]${endColour} ${whiteColour}End "Get Alive Subdomains"${endColour}"
}

function checkTakeOver() {
  companyFolder="$1"
  subdomainRoute="${companyFolder}/subdomains.txt"
  echo -e "${yellowColour}[+]${endColour} ${whiteColour}Check Subdomain Takeover${endColour}"
  subzy run --targets ${subdomainRoute} > ${companyFolder}/checkSubTakeOver.txt
  cat ${companyFolder}/checkSubTakeOver.txt
  echo -e "${yellowColour}[+]${endColour} ${whiteColour}End Check Subdomain Takeover${endColour}"
}

function subdomainEnum() {
  if [ -z "$2" ]; then
    echo -e "${redColour}[Error]${endColour} ${whiteColour}You must provide a company name argument.${endColour}"
  else
    urlTelgram="$1"
    companyName="$2"
    companyFolder="$HOME/BugBounty/${companyName}"
    if [ ! -d "$companyFolder" ]; then
      echo -e "${redColour}[Error]${endColour} ${whiteColour}Company folder not found: $companyFolder${endColour}"
    else
      echo -e "${yellowColour}[+]${endColour} ${whiteColour}Get Subdomains${endColour}"
      for domain in $(cat "${companyFolder}/domains.txt"); do
        echo -e "${yellowColour}[+]${endColour} ${whiteColour}Enumerating subdomains for ${domain}${endColour}"
        subfinder -d "${domain}" -recursive -o "${companyFolder}/subdomains.txt" &>/dev/null
      done
      sort -u "${companyFolder}/subdomains.txt" -o "${companyFolder}/subdomains.txt"
      echo -e "${yellowColour}[+]${endColour} ${whiteColour}End "Get Subdomains"${endColour}"
      sleep 1
      getAlive "$companyFolder"
      sleep 1
      checkTakeOver "$companyFolder"
      sleep 1
      echo -e "${greenColour}[Complete]${endColour} ${whiteColour}Subdomain Enumeration${endColour}"
      message="[ ! ] Finished subdomain enumeration
        Company: ${companyFolder}
        Main Folder: ${companyFolder}
      "
      curl --silent --output /dev/null -F chat_id="$CHAT_ID" -F "text=$message" $urlTelgram -X POST
    fi
  fi
}