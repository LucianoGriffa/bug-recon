#!/bin/bash

#Colours
endColour="\033[0m\e[0m"
greenColour="\e[0;32m\033[1m"
redColour="\e[0;31m\033[1m"
yellowColour="\e[0;33m\033[1m"
whiteColour="\e[0;37m\033[1m"

function getAlive() {
  url="$1"
  path="$2"
  company="$3"
  echo -e "${yellowColour}[+]${endColour} ${whiteColour}Get Alive${endColour}"
  cat ${path}/domains.txt | fhc -t 50 --timeout 3000 > ${path}/alive-subdomains.txt
  cat ${path}/alive-subdomains.txt | python -c "import sys; import json; print (json.dumps({'domains':list(sys.stdin)}))" > ${path}/alive-subdomains.json
  result="cat ${path}/alive-subdomains.txt"
  message="[ + ] Subdomain Enumeration:
[ --> ] alive-subdomains.txt for: ${company}.
[ --> ] Path: ${path}
$(eval ${result})"
  curl --silent --output /dev/null -F chat_id="${CHAT_ID}" -F "text=${message}" ${urlTelgram} -X POST
  echo -e "${yellowColour}[+]${endColour} ${whiteColour}End Alive Domains${endColour}"
  tput cnorm
}

function getSubdomains() {
  urlTelgram="$1"
  companyName="$2"
  companySyntax=$(echo ${companyName} | sed 's/ //g')
  dir_path=$(find . -type d -iname "${companySyntax}")
  echo -e "${yellowColour}[+]${endColour} ${whiteColour}Get Subdomains${endColour}"
  if [ -n "${dir_path}" ]; then
    for domain in $(cat "$dir_path/domains.txt"); do
      subfinder -d "${domain}" >> all-subdomains-get.txt
      assetfinder -subs-only "${domain}" >> all-subdomains-get.txt
      findomain -q -f "${domain}" -r >> all-subdomains-get.txt
    done
    sort all-subdomains-get.txt | uniq > all-subdomains.txt
    rm all-subdomains-get.txt
    getAlive() "${urlTelgram}" "${dir_path}/domains.txt" "${companyName}"
    echo -e "${yellowColour}[+]${endColour} ${whiteColour}End Subdomains Enumerations${endColour}"
    tput cnorm
  else
    echo "No se encontró ningún directorio para la empresa \"${companyName}\"."
    echo "Debes iniciar el RECON [ -s ]"
    tput cnorm
  fi
}