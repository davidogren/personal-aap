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
if [ "$EUID" -ne 0 ]; then
    echo "Error: This script must be run as root or with sudo." >&2
    exit 1
fi
subscription-manager unregister
subscription-manager clean
subscription-manager register --user dogren_admin 
dnf install -y ansible-core cifs-utils git
mount -t cifs -o username=ogren,vers=2.0 //192.168.0.98/sync /mnt/sync

