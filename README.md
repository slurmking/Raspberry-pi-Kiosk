
# Raspberry Pi Kiosk  
  
## Requirements  
* Raspberry pi 4 or greater  
* Raspian OS  
  
  
 
Steps  
### Install SD image
* In Raspi Imager install raspian 32bit  
* Press CTRL+X to access advanced settings   
* Enable SSH  
* Rename Pi to TV-ASSET  
* Add wifi info  
* Change locale to US and Denver timezone  

### Install 
* Find the IP of the raspberry pi by typing `ip a` command 
* Use a program like Filezilla to FTP all the files in this repo to the home/pi folder
* SSH into the pi with `ssh pi@IPADDRESS` from your windows host
* Change directory to the kiosk folder `cd kiosk`
* Enable execute instructions on the install script `sudo chmod +x install.sh`
* Run the installer `sudo .\install.sh`
* Wait for the install to finish and the pi to reboot
   
The install script will do the following   
  
* Update the OS   
* Configure automatic upgrades  
* Install firewall and fail2ban  
* configure firewall to accept SSH  
* Create a videokisok and webkiosk service  
* Configure OS to hide unnecessary OS elements  
* Add intercap logo to splash screen  
* Install Connectwise Screen Connect  

### Pick Kiosk Type
You can now choose your kiosk type below
  
**Note** only one service can be enabled at a time. Services auto reload every hour to prevent failure

## video config  
The video kiosk runs VLC and loads videos from the /home/pi/kiosk/playlist folder. Add any file to the playlist folder to add it to the video queue  
  
To enable run   
sudo systemctl enable videokisok.service  
  
## web config  
The web kiosk runs off of the chromium.sh script. Update the url to change the webpage loaded  
  
To enable run   
sudo systemctl enable webkiosk.service