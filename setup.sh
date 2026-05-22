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
which ansible &>/dev/null|| echo "[*] Installing Ansible, please wait" & sudo apt-get install -y ansible &>/dev/null|| echo "[X] Error: Could not install Ansible"


echo "[*] Configuring the lab"
lab_file='op1.yml'
if [ -f $lab_file ];
then
	ansible-playbook $lab_file &>/dev/null
else
	echo "[*] Something went wrong when configuring the lab"
	exit 1
fi


# OK if setup is successful 
echo "[OK] Lab Setup Complete"


# Adding a little bash script for quick resets in case something broke
reset_script='lab-reset'
lab_location="$PWD/op1.yml"
sudo echo "ansible-playbook $lab_location &>/dev/null && echo '[OK] Lab has been reset' || echo '[x] There was a problem resetting the lab'" > $reset_script
chmod u+x $reset_script
sudo mv $reset_script /usr/bin/

echo "
Note : If at any moment you wanted to reset the lab, run this command : lab-reset"
exit 0
