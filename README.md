# update_syno
Update Synology Configuration file to disable/enable drive compatibility check configuration. 

How to use this script
1. Create the file:
    vi update_syno.sh
2. Paste the code above into the editor. "Remember to save and exit (:wq)"
3. Make it executable:
    chmod +x update_syno.sh
4. Run with sudo:
  Since you are editing a system file in /etc.defaults/, you must run it with root privileges:
  sudo ./update_syno.sh

A reboot is needed. You can simply select "y" or "N" and reboot in Synology. 

sed -i: This command performs an "in-place" edit. It finds the line starting with your field name and replaces the entire line with the new value.
grep: We use this to pull the current value so the user knows exactly what the file looks like before they change anything.
Safety: If you choose option 3 (Manual Edit), the script hands control over to vi. Once you save and exit vi (:wq), the script resumes and asks you about the reboot.

Note: This manipulates your Synology configuration file. You are responsible for the negative impacts of changes. 
