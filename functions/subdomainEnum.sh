#!/bin/bash

# Colores
endColour="\033[0m\e[0m"
greenColour="\e[0;32m\033[1m"
redColour="\e[0;31m\033[1m"
yellowColour="\e[0;33m\033[1m"
whiteColour="\e[0;37m\033[1m"

function getAlive() {
  subdomainList="$1"
  echo -e "${yellowColour}[+]${endColour} ${whiteColour}Get Alive${endColour}"
  cat ${subdomainList} | httpx -silent -status-code -tech-detect > ./alive.txt
  echo -e "${yellowColour}[+]${endColour} ${whiteColour}End Alive${endColour}"
}

function checkTakeOver() {
  echo -e "${yellowColour}[+]${endColour} ${whiteColour}Check Subdomain Takeover${endColour}"
  subzy -targets ./alive.txt | tee $./subdomainTakeOver.txt
  echo -e "${yellowColour}[+]${endColour} ${whiteColour}End Subdomain Takeover Check${endColour}"
}

getSubdomains() {
  domainList="$1"
  for domain in $(cat "$domainList"); do
    echo -e "${yellowColour}[+]${endColour} ${whiteColour}Enumerating subdomains for ${domain}${endColour}"
    subfinder -d "${domain}" >> ./subdomains.txt
    assetfinder --subs-only "${domain}" >> ./subdomains.txt
    findomain --quiet -t "${domain}" >> ./subdomains.txt
  done
  sort -u ./subdomains.txt -o ./subdomains.txt
  getAlive() "./subdomains.txt"
}

subdomainEnumeration() {
  getSubdomains()
}