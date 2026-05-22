## Direct download (The Quick Way)

1. Download the Debian Virtual Machine at : https://github.com/KaisarSec/DebianVM

2. Clone the repository to the VM :
```
git clone https://github.com/KaisarSec/Operation1-Lab-Files.git ~/Operation1-Lab-Files.git
```
> The repository will be in your home directory

4. Inside the cloned repository, run the installation script :
```
bash setup.sh
```

## Manual Setup (if you prefer it)

1. Download a Virtual Machine of choice, or you can use this simple Debian VM : https://github.com/KaisarSec/DebianVM

2. Install git on the Virtual Machine

3. Install Ansible

4. Clone the github repository

5. Inside the repo, run the op1.yml playbook to configure the machine :
```
# You can also run this same command if you want to reset the lab
ansible-playbook op1.yml
```
