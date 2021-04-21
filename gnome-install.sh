#!/usr/bin/env bash
#
# Gnome Desktop and Packages installation on fresh Arch Linux
# by MM <elkrien@gmail.com>
# License: GNU GPLv3
#

##### FUNCTIONS #####

# Pacman Installation function
func_install_pacman() {
	if pacman -Qi $1 &> /dev/null; then
		tput setaf 2
  		echo
		echo " 		  Package "$1" is already installed"
		tput sgr0
	else
    		tput setaf 3
    		echo
    		tput sgr0
    		sudo pacman -S --noconfirm --needed $1
    	fi
}

# AUR installation function (from AUR)
func_install_aur() {
	if paru -Qi $1 &> /dev/null; then
		tput setaf 2
		echo
  		echo " 		  Package "$1" is already installed"
		tput sgr0
	else
    		tput setaf 3
    		echo
    		tput sgr0
    		paru -S --noconfirm --needed $1
    	fi
}

# Installation of AUR helper (paru)
aurhelperinstallation() {
	cd /tmp
	sudo rm -rf /tmp/paru*
	sudo curl -sO https://aur.archlinux.org/cgit/aur.git/snapshot/paru-bin.tar.gz &&
	tar -xvf paru-bin.tar.gz && cd paru-bin &&
	makepkg --noconfirm -si
	cd /tmp
}

##### LIST OF PACKAGES #####

# Pacman list
list_pacman=(
git							# the fast distributed version control system
xorg						# X.org group - display server
gnome						# GNOME desktop
xf86-video-amdgpu			# X.org AMD video drivers
gnome-tweaks				# GNOME graphical interface for advanced settings (Tweak Tool)
nautilus-sendto				# GNOME Nautilus plugin to easily send files via mail
gnome-nettool				# GNOME graphical interface for various networking tools
gnome-usage					# GNOME application to view information about use of system resources
adwaita-icon-theme			# GNOME standard icons
chrome-gnome-shell			# GNOME native browser connector for integration with extensions.gnome.org
gdm							# GNOME display manager and login screen
ktouch						# Touch Typing Tutor
reflector					# a module and script to retrieve and filter the latest Pacman mirror list
xdg-user-dirs-gtk			# creates user dirs and asks to relocalize them
cups						# CUPS Printing System - daemon package
system-config-printer		# a CUPS printer configuration tool and status applet
samba						# SMB Fileserver and AD Domain server
ffmpegthumbs				# FFmpeg-based thumbnail creator for video files
gstreamer					# multimedia graph framework - core		
gst-libav					# multimedia graph framework - libav plugin
gst-plugins-bad				# multimedia graph framework - bad plugins
gst-plugins-base			# multimedia graph framework - base plugins	
gst-plugins-good			# multimedia graph framework - good plugins
gst-plugins-ugly			# multimedia graph framework - ugly plugins
pulseaudio					# a featureful, general-purpose sound server
pulseaudio-alsa				# ALSA Configuration for PulseAudio
pavucontrol					# PulseAudio Volume Control
alsa-firmware				# firmware binaries for loader programs in alsa-tools and hotplug firmware loader
alsa-lib					# an alternative implementation of Linux sound support
alsa-plugins				# additional ALSA plugins
alsa-utils					# ALSA utilities
playerctl					# mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others
libcups						# client libraries and headers for CUPS
nss-mdns					# glibc plugin providing host name resolution via mDNS (for wireless printer)
avahi						# Service Discovery for Linux using mDNS/DNS-SD (for wireless printer)
openssh						# premier connectivity tool for remote login with the SSH protocol
ghostscript					# an interpreter for the PostScript language
gsfonts						# (URW)++ Core Font Set [Level 2]
gutenprint					# top quality printer drivers for POSIX systems
system-config-printer 		# CUPS printer configuration tool and status applet
gvfs-smb					# virtual filesystem implementation for GIO (SMB/CIFS backend; Windows client)
ttf-roboto					# Google's signature family of fonts
ttf-roboto-mono				# a monospaced addition to the Roboto type family
noto-fonts					# Google Noto TTF fonts
ttf-fira-code 				# a monospaced fonts with programming ligatures
ttf-jetbrains-mono			# typeface fonts for developers, by JetBrains
ttf-ubuntu-font-family		# Ubuntu font family
ttf-nerd-fonts-symbols		# High number of extra glyphs from popular iconic fonts
awesome-terminal-fonts		# fonts/icons for powerlines
calibre						# ebook management application
simplescreenrecorder		# a feature-rich screen recorder that supports X11 and OpenGL
gimp						# GNU Image Manipulation Program"
thunderbird					# standalone mail and news reader from mozilla.org
thunderbird-i18n-pl			# Polish language pack for Thunderbird
firefox						# web browser
firefox-i18n-pl				# web browser language pack
starship					# the cross-shell prompt for astronauts
alacritty					# a cross-platform, GPU-accelerated terminal emulator
htop						# interactive process viewer
neofetch					# a CLI system information tool written in BASH that supports displaying images
grub-customizer				# a graphical grub2 settings manager
fish						# smart and user friendly shell intended mostly for interactive use
libreoffice-fresh			# LibreOffice branch which contains new features and program enhancements
libreoffice-fresh-pl		# Polish language pack for LibreOffice Fresh
hunspell-pl					# Polish dictionary for Hunspell
gufw						# uncomplicated way to manage your Linux firewall
discord						# all-in-one voice and text chat for gamers that's free and secure
amd-ucode					# Microcode update files for Intel CPUs
xclip						# command line interface to the X11 clipboard
wget						# network utility to retrieve files from the Web
ranger						# simple, vim-like file manager in terminal
ncdu						# disk usage analyzer with an ncurses interface
micro						# a modern and intuitive terminal-based text editor
bat							# cat clone with syntax highlighting and git integration
exa							# it is a ls command replacement
lolcat						# a command line tool to output rainbow of colors in Terminal
signal-desktop				# Signal Private Messenger for Linux
fd							# a simple, fast and user-friendly alternative to find
imagescan 					# EPSON Image Scan v3 front-end for scanners and all-in-ones
bpytop						# a resource monitor that shows usage and stats for processor, memory, disks, network and processes
gnome-keyring				# stores passwords and encryption keys
papirus-icon-theme			# Papirus Icon Theme
#clamav						# Anti-virus toolkit for Unix
#clamtk						# easy to use, light-weight, on-demand virus scanner for Linux systems - GUI for ClamAV
pulseaudio-bluetooth 		# Bluetooth support for PulseAudio
bluez 						# daemons for the bluetooth protocol stack
bluez-libs 					# deprecated libraries for the bluetooth protocol stack
bluez-utils 				# Development and debugging utilities for the bluetooth protocol stack
blueberry					# Bluetooth configuration tool
gparted						# a Partition Magic clone, frontend to GNU Parted
meld						# compare files, directories and working copies
unzip						# for extracting and viewing files in .zip archives
pragha						# a lightweight GTK+ music manager - fork of Consonance Music Manager
rofi						# a window switcher, application launcher and dmenu replacement
)

# AUR list
list_aur=(
bitwarden-bin				# a secure and free password manager for all of your devices
teams						# a Microsoft Teams for Linux
zoom						# Video Conferencing and Web Conferencing Service
skypeforlinux-stable-bin	# Skype for Linux
brave-bin					# Web browser that blocks ads and trackers by default
duf-bin						# Disk Usage/Free Utility (df replacement)
etcher-bin					# flash OS images to SD cards & USB drives, safely and easily
pamac-aur					# a Gtk3 frontend, Package Manager based on libalpm with AUR and Appstream support
spotify						# a proprietary music streaming service
typora						# MD editor
zoxide-bin					# cd replacement
papirus-folders				# Allows to change the color of folders
bibata-cursor-theme-bin		# mouse cursor theme
ttf-ms-fonts				# core TTF fonts from Microsoft"
visual-studio-code-bin		# official binary version of Visual Studio Code (vscode)
dracula-grub-theme-git		# Dracula theme for GRUB
epson-inkjet-printer-escpr	# Epson printers drivers
simplenote-electron-bin		# the simplest way to keep notes
ytop-bin					# a TUI system monitor written in Rust
nautilus-compare 			# context menu file comparison extension for Nautilus
nautilus-open-any-terminal	# context-menu entry for opening other terminal in Nautilus
nautilus-admin-git 			# extension for Nautilus to do administrative operations
ant-dracula-gtk-theme		# Ant Dracula Theme for GTK 3.x
)


##### MAIN SCRIPT #####

# Welcome message
clear
tput setaf 5
echo
echo "###############################################################################"
echo
echo " 	       INSTALLATION OF PLASMA DESKTOP AND APPLICATIONS"
echo 
echo "###############################################################################"
echo
echo
tput sgr0

# Setting fastest mirrors
tput setaf 3
echo
echo "### Finding fastest mirrors - please wait..."
tput sgr0
sudo pacman -S --needed --noconfirm reflector
sudo reflector -c Poland -a 12 --sort rate --save /etc/pacman.d/mirrorlist

# installation of needed tools
tput setaf 3
echo
echo "### Installation packages needed to run the rest of the script..."
tput sgr0
sudo pacman -S --noconfirm --needed base-devel git

# make pacman and paru colorful
grep -q "^Color" /etc/pacman.conf || sudo sed -i "s/^#Color$/Color/" /etc/pacman.conf						
grep -q "ILoveCandy" /etc/pacman.conf || sudo sed -i "/#VerbosePkgLists/a ILoveCandy" /etc/pacman.conf

# Installation of AUR helper
tput setaf 3
echo
echo "### Installation of AUR helper..."
tput sgr0
aurhelperinstallation

# Installation of packages
count=0

for name in "${list_pacman[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "### Installation of package:  "$name;tput sgr0;
	func_install_pacman $name
	echo
done

for name in "${list_aur[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "### Installation of package:  "$name;tput sgr0;
	func_install_aur $name
	echo
done

# services activation and some system settings
tput setaf 5;echo
echo
echo "###############################################################################"
echo
echo "			Enabling services (greeter, printers, etc.)"
echo 
echo;tput sgr0
sudo systemctl enable gdm																						# KDE greeter
#sudo systemctl enable tlp.service																				# TLP - laptop power management
sudo systemctl enable cups.service 																				# printers
sudo sed -i 's/files mymachines myhostname/files mymachines/g' /etc/nsswitch.conf 								# nsswitch - first part
sudo sed -i 's/\[\!UNAVAIL=return\] dns/\[\!UNAVAIL=return\] mdns dns wins myhostname/g' /etc/nsswitch.conf 	# nsswitch - last part
sudo systemctl disable systemd-resolved.service 																# disable systemd-resolved (not working with avahi)
sudo systemctl enable avahi-daemon.service 																		# enable avahi (for wireless printer)
sudo systemctl enable fstrim.timer 																				# fstrim (sdd)
sudo systemctl enable bluetooth.service																			# bluetooth - enable service
sudo sed -i 's/'#AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf								# bluetooth settings
sudo touch /etc/sysctl.d/99-swappiness.conf 																	# set swappiness part 1
sudo bash -c 'echo "vm.swappiness=10" >> /etc/sysctl.d/99-swappiness.conf' 										# set swappiness part 2
sudo sed -i 's/^# --country France,Germany/--country Poland/' /etc/xdg/reflector/reflector.conf 				# reflector setting
sudo systemctl enable reflector.timer 																			# enabling reflector timer
echo /usr/local/bin/fish | sudo tee -a /etc/shells 																# change shell to fish - part 1
chsh -s /bin/fish																								# change shell to fish - part 2
papirus-folders -C violet --theme Papirus-Dark																	# change folders colors for Papirus Icon Theme
#sudo systemctl enable sshd.service																				# enable OpenSSH daemon - for SSH server
#sudo freshclam																									# update ClamAV signatures
#sudo systemctl enable clamav-freshclam.service																	# enable ClamAV services
#sudo systemctl enable clamav-daemon.service																	# enable ClamAV services

# setting themes in GNOME:
gsettings set org.gnome.desktop.interface gtk-theme "Ant-Dracula"												
gsettings set org.gnome.desktop.wm.preferences theme "Ant-Dracula"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.interface cursor-theme "Bibata-Original-Amber"
gsettings set org.gnome.desktop.interface document-font-name "Ubuntu 11"
gsettings set org.gnome.desktop.interface font-name "Ubuntu 11"
gsettings set org.gnome.desktop.interface monospace-font-name "Roboto Mono 11"
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Ubuntu Bold 11"
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal alacritty


# Finish information
tput setaf 5
echo
echo "###############################################################################"
echo
echo "		     GNOME AND ALL APLICATIONS HAVE BEEN INSTALLED"
echo
echo " 		    restart computer and start to rice Your new system :)"
echo
echo "###############################################################################"
echo;tput sgr0
