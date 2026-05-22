## Direct download (the Quick Way)

1. Download the Debian Virtual Machine at : https://github.com/KaisarSec/DebianVM

2. clone this repository :
```
git clone https://github.com/KaisarSec/Operation1-Lab-Files.git ~/Operation1-Lab-Files.git
```
> The repository will be in your home directory

3. Inside the cloned repository, run the installation script :
```
bash setup.sh
```


## Manual Setup (if you prefer that)
  - Set up a VM of choice (of the one provided)
  - Update it
  - Install curl and ansible
    ###### Download the playbook
    wget URL/build_lab_op1.yml    
    ###### Run it
    sudo ansible-playbook -i "localhost," -c local build_lab_op1.yml

    ##### Download the lab reset script
    wget URL/lab-reset.sh
