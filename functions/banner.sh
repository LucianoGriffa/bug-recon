#!/bin/bash

#Colours
endColour="\033[0m\e[0m"
blueColour="\e[0;34m\033[1m"
grayColour="\e[0;37m\033[1m"

function banner() {
  echo -e "\n${blueColour}
    ░██████████                                 ███████████                                        
    ░███░░░░░███                               ░░███░░░░░███                                       
    ░███    ░███ █████ ████  ███████            ░███    ░███   ██████   ██████   ██████  ████████  
    ░██████████ ░░███ ░███  ███░░███ ██████████ ░██████████   ███░░███ ███░░███ ███░░███░░███░░███ 
    ░███░░░░░███ ░███ ░███ ░███ ░███░░░░░░░░░░  ░███░░░░░███ ░███████ ░███ ░░░ ░███ ░███ ░███ ░███ 
    ░███    ░███ ░███ ░███ ░███ ░███            ░███    ░███ ░███░░░  ░███  ███░███ ░███ ░███ ░███ 
    ░██████████  ░████████░░████████            █████   █████░██████ ░░███████░░░██████ ░█████ ████
    ░░░░░░░░░░░    ░░░░░░░░ ░░░░░███           ░░░░░   ░░░░░  ░░░░░░   ░░░░░░   ░░░░░░  ░░░░ ░░░░░ 
                            ███ ░███                                                               
                            ░░██████                                                                
                            ░░░░░░         
    ${endColour}   
    ${grayColour}                                                     
    By_G3kSec | {v1.0}
    @G3kSec  
    ${endColour}   
  "
}