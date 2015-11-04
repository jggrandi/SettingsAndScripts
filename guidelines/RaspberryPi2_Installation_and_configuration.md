# Raspberry PI 2 Installation and Configuration

## Installation 
(Copied from http://archlinuxarm.org/platforms/armv7/broadcom/raspberry-pi-2)

Replace sdX in the following instructions with the device name for the SD card as it appears on your computer.  

1. Start fdisk to partition the SD card:  
`fdisk /dev/sdX`  
2. At the fdisk prompt, delete old partitions and create a new one:  
	* Type **o**. This will clear out any partitions on the drive.  
	* Type **p** to list partitions. There should be no partitions left.  
	* Type **n**, then **p** for primary, **1** for the first partition on the drive, press **ENTER** to accept the default first sector, then type **+100M** for the last sector.  
 	* Type **t**, then **c** to set the first partition to type W95 FAT32 (LBA).  
	* Type **n**, then **p** for primary, **2** for the second partition on the drive, and then press **ENTER** twice to accept the default first and last sector.  
	* Write the partition table and exit by typing **w**.  
3. Create and mount the FAT filesystem:  
	```
	mkfs.vfat /dev/sdX1
	mkdir boot
	mount /dev/sdX1 boot
	```

4. Create and mount the ext4 filesystem:  
	```
	mkfs.ext4 /dev/sdX2
	mkdir root
	mount /dev/sdX2 root
	```
5. Download and extract the root filesystem (as root, not via sudo):  
	```
	wget http://archlinuxarm.org/os/ArchLinuxARM-rpi-2-latest.tar.gz  
	bsdtar -xpf ArchLinuxARM-rpi-2-latest.tar.gz -C root  
	sync  
	```
6. Move boot files to the first partition:  
	`mv root/boot/* boot`  
	Unmount the two partitions:  
	`umount boot root`  

7. Insert the SD card into the Raspberry Pi, connect ethernet, and apply 5V power.  
	* Use the serial console or SSH to the IP address given to the board by your router.
	* Login as the default user alarm with the password alarm.
	* The default root password is root.

## Initial configuration

1. Timezone  
	`tzselect`

2. Swap  
	```
	fallocate -l 1024M /swapfile  
	chmod 600 /swapfile  
	mkswap /swapfile  
	swapon /swapfile  
	echo 'vm.swappiness=1' > /etc/sysctl.d/99-sysctl.conf  
	```
	Edit `/etc/fstab`:  
	`/swapfile none swap defaults 0 0`  

3. System Update
	```
	pacman -Sy pacman  
	pacman-key --init  
	pacman -S archlinux-keyring  
	pacman-key --populate archlinux  
	pacman -Syu --ignore filesystem  
	pacman -S filesystem --force  
	reboot  
	```
	Add colors to pacman output:  
	`sed -i 's/#Color/Color/' /etc/pacman.conf`
4. NTP  
	```
	pacman -S ntp  
	systemctl enable ntpd.service  
	systemctl start ntpd.service  
	```

5. Locale  
	* Uncoment locales in `/etc/locale.gen`  
		I use: en_US.UTF-8 and pt_BR.UTF-8  
	* Run `locale-gen`  
	* Create `/etc/locale.conf` and add:  
		```
		LANG=en_US.UTF-8  
		LC_TIME=pt_BR.UTF-8  
		LC_MONETARY=pt_BR.UTF-8  
		```
	
6. Change root password  
	`passwd`  

7. Set hostname   
	`hostnamectl set-hostname your-hostname`  

8. Create user  
	`useradd -m -G wheel -s /bin/bash <username>`

9. Setup sudo  
	```
	pacman -S sudo vim  
	visudo  
	```
	* Uncomment the line:  
	`wheel ALL=(ALL) ALL`  

## Main Packages 

## Misc

1. Change SSH gretting (motd)

	Edit `/etc/motd`

2. Copy the public ssh key to raspberry  

	`ssh-copy-id -i ~/.ssh/id_rsa.pub <user>@<remotemachine -p <port>`

3. Bash Colors
	Edit `/etc/bash.bashrc` or `~/.bash.bashrc` with the configurations presented [here](../systemsettings/arch/)
	 
