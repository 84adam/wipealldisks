#!/bin/bash

# Running this script as root on your system will destroy or render inacessible all data on all disks.
# Proceed at your own risk.

if [ ! "`whoami`" = "root" ]
then
    echo "This script must be run as root. Exiting..."
    exit 1
fi

DISK=$(lsblk | awk '/^sd.*/ {print $1}')

echo "WARNING: This will permantently erase or render inaccessible all data on all disks! This includes: `for i in DISK ; do echo "/dev/$DISK" ; done`."
echo "Are you sure you wish to continue? Yes/No "

read input
if ! [[ `echo $input |egrep -i '^y$|^yes$'` ]]; then
    echo "Action cancelled. Exiting..."
    exit
fi

for i in $DISK; do
    echo "Wiping: /dev/$DISK..."
    parted -s /dev/$DISK mklabel msdos
    dd if=/dev/zero of=/dev/$DISK bs=512 count=100000 &> /dev/null
    blkcount=`blockdev --getsz /dev/$DISK`
    end=`expr $blkcount - 100000`
    dd if=/dev/zero of=/dev/$DISK bs=512 seek=$end count=100000 &> /dev/null
    echo "WipeAllDisks successfully erased: /dev/$DISK."
done
