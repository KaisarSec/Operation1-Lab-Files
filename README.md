## Direct download (the Quick Way)
1. Click on Debian-VM.zip to download it, unzip the machine and open it in VMware
2. Inside the VM, click on setup.sh to download it, run it using :
```
bash setup.sh
```
> There will be a link for this github repository pinned in the Firefox browser of the Virtual Machine


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
