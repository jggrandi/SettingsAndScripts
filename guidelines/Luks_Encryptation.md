# Encrypt partition or disk with LUKS  
Based on [Arch dm-crypt](https://wiki.archlinux.org/index.php/Dm-crypt)

## Drive preparation

0. Device partitioning (optional)

1. Wipe on an empty disk or partition
	`cryptsetup open --type plain /dev/sdXY container --key-file /dev/random`  
	* `sdX`: full disk
	* `sdXY`: partition only

2. Check if it exits
	```
	# fdisk -l  
	-----------------------------------------------------
	Disk /dev/mapper/container: 1000 MB, 1000277504 bytes  
	```

3. dd if=/dev/zero of=/dev/mapper/container status=progress

## Partition

1. Setup the LUKS header for the partition
	`cryptsetup <options> luksFormat <device>`
	* Options is not necessary
	* Device is the /dev/sdX (entire disk) or /dev/sdbXY (partition)

2. Gain access to the encrypted partition, unlock it with the device mapper, using:
	`cryptsetup open <device> <name>`
	* Device is the /dev/sdX (entire disk) or /dev/sdbXY (partition)
	* Name is the mapper name (e.g. secret, encrypted... )

3. After unlocking the partition, it will be available at /dev/mapper/name. Now create a file system of your choice with:
	`mkfs.<fstype> /dev/mapper/<name>`

## Manual mounting and unmounting

1. Mount
	```
	cryptsetup --type luks open <device> <name>
	mount -t fstype /dev/mapper/<name> /<mounting_point>

2. Umount
	```
	umount /<mounting_point>
	cryptsetup close <name>
	```


