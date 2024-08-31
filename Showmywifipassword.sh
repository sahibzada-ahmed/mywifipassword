#!/bin/bash

# Colors
colors=("\e[31m" "\e[32m" "\e[33m" "\e[34m" "\e[35m" "\e[36m")
random_color=${colors[$RANDOM % ${#colors[@]}]}
reset_color="\e[0m"

# Banner
clear
echo -e "${random_color}"
echo "######################################################"
echo "#          Made by Cyber Vigilance PK and Faraz Ahmed#"
echo "#  Use only for Ethical Hacking and Educational Purposes #"
echo "######################################################"
echo -e "${reset_color}"

# Main Menu
echo -e "${random_color}Wi-Fi Password Finder${reset_color}"
echo -e "${random_color}1) Show Password for Connected Wi-Fi${reset_color}"
echo -e "${random_color}2) Exit${reset_color}"
read -p "Enter your choice: " choice

# Function to show Wi-Fi password for connected network
show_wifi_password() {
    # Try to find the Wi-Fi configuration file locations
    config_files=("/etc/NetworkManager/system-connections/*" "/etc/wpa_supplicant/*")
    
    found=0
    for file in ${config_files[@]}; do
        if [ -f "$file" ]; then
            echo -e "${random_color}Searching in $file...${reset_color}"
            grep -i "psk=" "$file" 2>/dev/null
            if [ $? -eq 0 ]; then
                found=1
            fi
        fi
    done
    
    if [ $found -eq 0 ]; then
        echo -e "${random_color}No password found in configuration files.${reset_color}"
    fi
}

# Execute user's choice
case $choice in
    1) show_wifi_password ;;
    2) echo -e "${random_color}Exiting...${reset_color}" ;;
    *) echo -e "${random_color}Invalid choice! Exiting...${reset_color}" ;;
esac

echo -e "${random_color}Thank you for using the Wi-Fi Password Finder!${reset_color}" 
