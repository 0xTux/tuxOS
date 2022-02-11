#!/bin/bash

set -e -u
sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen
ln -sf /usr/share/zoneinfo/UTC /etc/localtime
usermod -s /usr/bin/bash root
cp -aT /etc/skel/ /root/

#Create Liveuser
useradd -m -p "" -g users -G "adm,audio,floppy,log,network,rfkill,scanner,storage,optical,power,wheel" -s /bin/bash liveuser
#chmod 700 /root
chown -R liveuser:users /home/liveuser

#Load Appletneo Configuration
#cd /usr/bin
#dconf load / < desktop.dconf
#cd -

#tuxOS Name
sed -i.bak 's/Arch Linux/tux OS/g' /usr/lib/os-release
sed -i.bak 's/ID=arch/ID=tux/g' /usr/lib/os-release
sed -i.bak 's/ID_LIKE=archlinux/ID_LIKE=tuxlinux/g' /usr/lib/os-release
sed -i.bak 's/www.archlinux.org/www.appletneo.com/g' /usr/lib/os-release
sed -i.bak 's/bbs.archlinux.org/www.appletneo.com/g' /usr/lib/os-release
sed -i.bak 's/bugs.archlinux.org/www.appletneo.com/g' /usr/lib/os-release
#cp /usr/lib/os-release /etc/os-release

sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

#systemctl enable pacman-init.service choose-mirror.service
systemctl set-default multi-user.target
