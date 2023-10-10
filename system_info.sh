#!/bin/bash

# Function to display system information
display_system_info() {
    echo "System Information"
    echo "------------------"
    echo "Hostname: $(hostname)"
    echo "Kernel Version: $(uname -r)"
    echo "Operating System: $(cat /etc/os-release | grep "PRETTY_NAME" | cut -d'"' -f2)"
    echo "CPU Info: $(lscpu | grep "Model name" | cut -d':' -f2 | xargs)"
    echo "Memory Info: $(free -h | awk '/Mem/{print "Total: " $2, "Used: " $3, "Free: " $4}')"
    echo "Disk Space:"
    df -h | awk '{print $1 "\tSize: " $2 "\tUsed: " $3 "\tAvailable: " $4 "\tUse%: " $5 "\tMounted on: " $6}'
    echo "Logged-in Users:"
    who
}

# Clear the screen and display system information initially
clear
display_system_info

# Main menu loop
while true; do
    echo "------------------"
    echo "1. Refresh System Information"
    echo "2. Exit"
    echo "------------------"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            clear
            display_system_info
            ;;
        2)
            echo "Exiting the System Information Tool."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a valid option."
            ;;
    esac
done

