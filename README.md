<div align="center">
<h1 align="center"><b>i3 WM</b> - Dotfiles for Arch Linux (ThinkPad X230i)</h1>
</div>

## Getting Started

## Packages Needed for My System

1. Pacstrap

```bash
pacstrap -K /mnt base linux-firmware linux-lts (or linux-zen) base-devel git grub sudo nano intel-ucode thermald tlp networkmanager
```

2. Enable multilib for 32bit Support

```bash
nano /etc/pacman.conf
```

Uncomment multilib section.

3. Enabling NetworkManager, ThermalD and TLP

```bash
systemctl enable NetworkManager
```

```bash
systemctl enable thermald
```

```bash
systemctl enable tlp
```

## After Minimal Install

1. Install Paru

```bash
git clone https://aur.archlinux.org/paru.git
```

```bash
cd paru
```

```bash
makepkg -si
```

2. Execute Install Script

Change to clone directory.

```bash
chmod +x install-script.sh
```

```bash
./install-script.sh
```

3. Execute After Install Script

Change to clone directory.

```bash
chmod +x after-install.sh
```

```bash
./after-install.sh
```

4. MPC, MPD and NCMPCPP Setup

```bash
mkdir ~/.mpd
```

```bash
cd ~/.mpd
```

```bash
touch mpd.db mpd.log mpd.pid
```

```bash
mpd
```

```bash
systemctl start mpd
```

```bash
systemctl enable mpd
```

```bash
systemctl --user enable mpd
```

5. Edit TLP

```bash
su
```

```bash
vim /etc/tlp.conf
```

Change and uncomment battery and AC mode.

```bash
CPU_SCALING_GOVERNOR_ON_BAT=powersave
CPU_SCALING_GOVERNOR_ON_AC=performance
```

Restart TLP

```bash
systemctl restart tlp
```

6. Change Folder Icons

```bash
papirus-folders -t Papirus -C cat-mocha-pink
```

## Screenshots

![image](https://github.com/user-attachments/assets/d9c92151-c8af-4962-84f2-cd795c4e36fb)
