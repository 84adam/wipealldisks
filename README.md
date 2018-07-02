## wipealldisks.sh
**Bash script to delete all partitions and wipe all data from disks in Linux**

Do not use this unless you want to start from scratch and re-install your OS.

Particularly helpful in cases where md RAID or ZFS partition metadata remains on drives during re-installation attempts.

To install, run:

`git clone https://github.com/84adam/wipealldisks.git ; cd wipealldisks ; chmod +x wipealldisks.sh`

Then run as root (or sudo):

* `# ./wipealldisks.sh`
* or
* `$ sudo ./wipealldisks.sh`

Type `'Y/y/YES/yes'` only if you are *absolutely* sure you want to delete everything on all disks.
