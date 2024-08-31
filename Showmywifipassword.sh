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
    # Retrieve the name of the connected Wi-Fi network
    ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)
    if [ -z "$ssid" ]; then
        echo -e "${random_color}No connected Wi-Fi network found.${reset_color}"
        return
    fi

    # Show the Wi-Fi password
    echo -e "${random_color}Retrieving password for SSID: $ssid...${reset_color}"
    # Replace `nmcli` with `wpa_supplicant` if applicable
    nmcli -s -g 802-11-wireless-security.psk connection show "$ssid" 2>/dev/null || echo -e "${random_color}Unable to retrieve the password.${reset_color}"
}

# Execute user's choice
case $choice in
    1) show_wifi_password ;;
    2) echo -e "${random_color}Exiting...${reset_color}" ;;
    *) echo -e "${random_color}Invalid choice! Exiting...${reset_color}" ;;
esac

echo -e "${random_color}Thank you for using the Wi-Fi Password Finder!${reset_color}"
