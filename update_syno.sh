#!/bin/sh

FILE="/etc.defaults/synoinfo.conf"
FIELD="support_disk_compatibility"

# 1. Check if file exists
if [ ! -f "$FILE" ]; then
    echo "Error: $FILE not found."
    exit 1
fi

# 2. Show current status
CURRENT_VAL=$(grep "^$FIELD=" "$FILE" | cut -d'"' -f2)
echo "------------------------------------------"
echo "Current Setting: $FIELD=\"$CURRENT_VAL\""
echo "------------------------------------------"

# 3. User Menu
echo "What would you like to do?"
echo "1) Change to \"yes\""
echo "2) Change to \"no\""
echo "3) Manual Edit (opens vi)"
echo "4) Cancel"
read -p "Select an option [1-4]: " choice

case $choice in
    1)
        sed -i "s/^$FIELD=.*/$FIELD=\"yes\"/" "$FILE"
        echo "Updated to yes."
        ;;
    2)
        sed -i "s/^$FIELD=.*/$FIELD=\"no\"/" "$FILE"
        echo "Updated to no."
        ;;
    3)
        vi "$FILE"
        ;;
    4)
        echo "Operation cancelled."
        exit 0
        ;;
    *)
        echo "Invalid selection."
        exit 1
        ;;
esac

# 4. Reboot Prompt
echo ""
read -p "A reboot is required for changes to take effect. Reboot now? [y/N]: " reboot_choice
if [ "$reboot_choice" = "y" ] || [ "$reboot_choice" = "Y" ]; then
    echo "Rebooting..."
    reboot
else
    echo "Please remember to reboot later for changes to apply."
fi
