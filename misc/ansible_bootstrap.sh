#/bin/bash
#
# This script is designed to do the things I want to do before
# I even have ansible-core up and running. That is:
#
# * Getting the system subscription (otherwise I can't install ansible)
# * Installing the absolute bare minimum of packages needed to do other tasks
# * Connecting to my fileshare (otherwise I can't copy over my playbooks)
#
# The reality is that since the above isn't done yet, I'm likely just to copy
# and paste these commands rather than run them as a full fledged script
# 
#Run as root
sudo subscription-manager unregister
sudo subscription-manager clean
sudo subscription-manager register --user dogren_admin 
sudo dnf install -y ansible-core cifs-utils git

git config --global user.name "David Ogren"
git config --global user.email "dogren@fastmail.fm"
#Commenting until I can make this idempotent
#git clone git@github.com:davidogren/personal-aap.git
mount -t cifs -o username=ogren,vers=2.0 //192.168.0.98/sync /mnt/sync
#Leaving one manual step here, add ogren user to sudo as passwordless,
# make sure to add any NOPASSWD after the wheel ALL or it might get overridden
#  (or whoever we are using to run these)
