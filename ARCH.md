# Arch Install Instructions

```
fdisk /dev/nvme0n1
(deletes existing stuff)
  n (makes the new)
  Enter 1 for the disk number (default)
  Default Block
  +512M size (this is the EFI partition)
  t (option 1 - Make it an EFI System format)
  n again, allocate the rest of the remaining
  w to write
mkfs.fat -F32 /dev/nvme0n1p1
mkfs.ext4 /dev/nvme0n1p2
wifi-menu time
pacman -Syy
pacman -S reflector
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector -c "US" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
mount /dev/nvme0n1p2 /mnt
pacstrap /mnt base linux linux-firmware vim
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
timedatectl set-timezone America/New_York
uncomment your language of choice in /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo summer > /etc/hostname
vim /etc/hosts
  `
  127.0.0.1  localhost
  ::1    localhost
  127.0.1.1  myarch
  `
passwd
pacman -S grub efibootmgr
mkdir /boot/efi
mount /dev/nvme0n1p1 /boot/efi
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S xorg
pacman -S gnome
systemctl enable gdm.service
systemctl enable NetworkManager.service
exit
shutdown now

pacman -S openssh
systemctl start sshd
systemctl enable sshd.service
pacman -S sudo
export editor="/usr/bin/vim"
visudo                          # uncomment out the Wheel group
pacman -S zsh
useradd -m -g users -G wheel -s /usr/bin/zsh
pacman -S ntp
systemctl start ntpd
systemctl enable ntpd
pacman -S --needed base-devel
pacman -S wget which

Login as chuck
sudo pacman -S bluez bluez-utils
lsmod | grep btusb
systemctl enable bluetooth.service
systemctl start bluetooth.service
ssh-keygen -t rsa -b 4096 -C "chuck.danielsson@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
sudo pacman -S gnome-tweak-tools
pyenv
rbenv
nvm (replace)
linux brew
vim plug
pacman -S tmux
```
