#!/bin/bash
# My first script
# Reset
Color_Off='\033[0m'       # Text Reset

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

clear

echo -e "\n${BGreen}"
echo -e "                                           .__       .__   "
echo -e "   _____   ___________   ____  __ _________|__|____  |  |  "
echo -e "  /     \_/ __ \_  __ \_/ ___\|  |  \_  __ \  \__  \ |  |  "
echo -e " |  Y Y  \  ___/|  | \/\  \___|  |  /|  | \/  |/ __ \|  |__"
echo -e " |__|_|  /\___  >__|    \___  >____/ |__|  |__(____  /____/"
echo -e "       \/     \/            \/                     \/      "
echo -e "${Color_Off}\n"

if [[ $EUID -ne 0 ]]; then
   echo -e "\n${BCyan}  This script must be run as root.${Color_Off}\n" 
   exit 1
fi

echo -e "\n ${BGreen}1. Refreshing packages and updating system${Color_Off} \n"
apt --fix-broken install && apt update && apt -y upgrade && apt -y dist-upgrade && apt -y autoremove

echo -e "\n ${BGreen}2. Installing Important Stuff${Color_Off} \n"

echo -e "\n ${BCyan}2.1 Installing Drivers${Color_Off} \n"

apt -y install firmware-linux-nonfree firmware-realtek firmware-misc-nonfree firmware-iwlwifi firmware-netxen pciutils 

echo -e "\n ${BCyan}2.2 Installing important applications${Color_Off} \n"

apt -y install vim compton timeshift redshift redshift-gtk synaptic apt-xapian-index gparted ntfs-3g shotwell vlc vlc-plugin-bittorrent libav-tools terminator caja-open-terminal htop usbutils tree qbittorrent locate p7zip p7zip-full unrar-free unzip git ncdu gnuplot mc neofetch 

#(OPTIONAL) 
apt -y install texmaker mate-desktop-environment-extras devscripts build-essential software-properties-common

echo -e "\n ${BGreen}3. Installing Printer Stuff${Color_Off} \n"
#apt -y install hplip hplip-data hplip-doc hpijs-ppds hplip-gui  printer-driver-hpcups printer-driver-hpijs printer-driver-pxljr
apt -y install skanlite cups cups-client cups-filters system-config-printer printer-driver-cups-pdf

echo -e "\n ${BGreen} All Set! Thank you.${Color_Off}\n"

#echo -e "\n${BCyan}"
#echo -e "\n Currently I am not able to take following step : "
#echo -e "\n 1. Installing Google Chrome."
#echo -e "\n 2. Installing Mercurial theme."
#echo -e "${Color_Off}\n"

