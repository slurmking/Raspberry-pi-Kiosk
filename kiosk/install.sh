#!/bin/bash
yes | sudo apt update
yes | sudo apt full-upgrade
yes | sudo apt install ufw
yes | sudo ufw enable
yes | sudo ufw allow 22
yes | sudo ufw allow ssh
yes | yes | sudo apt install fail2ban
yes | sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
yes | sudo apt install unattended-upgrades
yes | sudo apt-get install unclutter

echo 'Unattended-Upgrade::Origins-Pattern {
//      Fix missing Rasbian sources.
        "origin=Debian,codename=${distro_codename},label=Debian";
        "origin=Debian,codename=${distro_codename},label=Debian-Security";
        "origin=Raspbian,codename=${distro_codename},label=Raspbian";
        "origin=Raspberry Pi Foundation,codename=${distro_codename},label=Raspberry Pi Foundation";
};' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-raspbian

sudo cp videokiosk.service /etc/systemd/system/videokiosk.service
sudo cp webkiosk.service /etc/systemd/system/webkiosk.service
yes | sudo systemctl daemon-reload
sudo cp config.txt /boot/config.txt
sudo cp autostart /etc/xdg/lxsession/LXDE-pi/autostart
sudo cp desktop-items-0.conf /home/pi/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
sudo chmod +x chromium.sh
sudo apt --fix-broken install
yes |sudo apt install default-jdk
yes | sudo rm /etc/xdg/autostart/piwiz.desktop
yes | sudo rm -rf ~/.config/chromium/Singleton*
yes | sudo reboot
