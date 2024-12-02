<div align="center">
<h3 align="center"><b>i3 WM</b> - Dotfiles for Arch Linux (ThinkPad X230i)</h3>
</div>

## Getting Started

1. Install Starter Packages

```bash
sudo pacman -S vim ranger kitty sddm xorg firefox rofi polybar dunst
```

2. Install Paru

```bash
git clone https://aur.archlinux.org/org
```

```bash
cd paru
```

```bash
makepkg -si
```

3. Install Fonts

```bash
sudo pacman -S sudo pacman -S noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra ttf-cascadia-code ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-jetbrains-mono ttf-jetbrains-mono-nerd
```

4. Thunar File Manager Packages

```bash
paru -S thunar thunar-volman tumbler ffmpegthumbnailer file-roller thunar-archive-plugin gvfs gvfs-mtp android-tools android-udev
```

5. SDDM Dependencies

```bash
paru -S qt6-svg qt6-declarative qt5-quickcontrols2
```

6. Screenshot Dependencies

```bash
paru -S maim xorg-xrandr xclip
```

7. Edit TLP

```bash
su vim /etc/tlp.conf
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

## Screenshots

<img src="./1.png" />
<img src="./2.png" />
<img src="./3.png" />
<img src="./4.png" />
<img src="./5.png" />
<img src="./6.png" />
