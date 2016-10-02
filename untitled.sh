# Arch Installation Guide by glins

# setting up keyboard layout
1. loadkeys br-abnt2

# check disk distribution
2. lsblk

# partition drives
3. cfdisk /dev/sdb

# format drive
4. mkfs.ext4 /dev/sdb2

# mount drive
5. mount /dev/sdb2 /mnt
   mkswap /dev/sdb1
   swapon /dev/sdb1
   swapon -s #should receive status message

# install base system
6. pacstrap /mnt base base-devel

# configure installation
7. arch-chroot /mnt

# new root password
8. passwd

# location stuf
9. nano /etc/locale.gen
   # uncomment pt_BR lines
   9.1 locale-gen
   9.2 ln -s /usr/share/zoneinfo/Brazil/East /etc/localtime

# set hostname
10. echo desired_username > /etc/hostname

# download and install bootloader
11. pacman -S grub-bios
	1.1 grub-install /dev/sdb

# create init file - hardware specific
12. mkinitcpio -p linux

# create grub configuration file
13. grub-mkconfig -o /boot/grub/grub.cfg

# exit chroot
14. exit
   # generate fstab file
   14.1 genfstab /mnt >> /mnt/etc/fstab

# unmount drive
15. umount /mnt

# reboot system
16. reboot

--

# login to root
17. input root and root password


# setup ethernet
18. ip link
   # get ethernet drive name
   18.1 systemctl enable dhcpcd@ethernet_drive_name (in my case, enp2s0)
   18.2 systemctl start dhcpcd@ethernet_drive_name (in my case, enp2s0)



   
   

