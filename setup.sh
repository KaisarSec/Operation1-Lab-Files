# Privilege check
if [ $EUID -eq 0 ];
then
	echo "
Don't run the script as root, use : bash $0"
	exit 1
fi

# System update
echo "[*] Setting up lab environment : op1-investigation"
echo "[*] Updating the system, please wait"
sudo apt-get update &>/dev/null || echo "[x] Could not update, please check your interent connection, make sure the VM is using NAT"


# Checking and downloading missing dependencies
which git ansible &>/dev/null || echo "[*] Installing missing dependencies, please wait" & sudo apt-get install -y ansible git &>/dev/null|| echo "[X] Error: Could not install dependencies"


# Pulling the github repository and running the playbook
echo "[*] Downloading and configuring the lab"
lab_name="op1.yml"
ansible-pull -U https://github.com/KaisarSec/Operation1-Lab-Files.git $lab_name &>/dev/null || { echo "[X] Could not download lab files, you can manually download the lab file named 'op1.yml' at http://github.com/KaisarSec/Operation1-Lab-Files"; exit 1; }




# OK if setup is successful 
echo "[OK] Lab Setup Complete"




# Adding a little bash script for quick resets in case something broke
lab_location='~/.ansible/pull/$HOSTNAME/op1.yml'
reset_script='lab-reset'
sudo echo "ansible-playbook $lab_location &>/dev/null && echo '[OK] Lab has been reset' || echo '[x] There was a problem resetting the lab'" > $reset_script
chmod u+x $reset_script
sudo mv $reset_script /usr/bin/

echo "If at any moment you wanted to reset the lab, run this command : lab-reset"
exit 0
