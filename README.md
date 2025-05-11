# DOTFILES
## DESCRIPTION
This dot is made only for my convenience, PC configuration and needs, I do not take responsibility for the non-working configuration or software

## MY LAPTOP CONFIG
- [Arch Linux](https://archlinux.org)
- [Hyprland](https://github.com/hyprwm/Hyprland)
- CPU -> Intel 13TH Gen
- GPU -> RTX 3050 6GB
- RAM -> 16GB
- SSD -> 512GB
- Monitor -> 1920x1080 "15.6" 144Hz

## FIREFOX THEME/EXTENSIONS
- [Catppuccin Mocha Flamingo](https://addons.mozilla.org/en-US/firefox/addon/catppuccin-mocha-flamingo-git/)
- [Vimium](https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/)

## DEPENDENCIES
All necessary dependencies and software are located in the [file](scripts/packages.py)

## PREVIEW
<div align="center">
<img src="preview/desktop.png" width="550">
<img src="preview/just-screenshot.png" width="550">
<img src="preview/file-manager.png" width="550">
<img src="preview/notification.png" width="550">
<img src="preview/notification-2.png" width="550">
<img src="preview/notification-center.png" width="550">
<img src="preview/lockscreen.png" width="550">
<img src="preview/app-launcher.png" width="550">
<img src="preview/powermenu.png" width="550">
<img src="preview/wifi-connector.png" width="550">
<img src="preview/windows(TAB).png" width="550">
<img src="preview/wallpaper-select.png" width="550">
<img src="preview/ai-request.png" width="550">
<img src="preview/ai-response.png" width="550">
<img src="preview/terminal.png" width="550">
<img src="preview/lunar-vim.png" width="550">
<img src="preview/firefox.png" width="550">
<img src="preview/vesktop.png" width="550">
<img src="preview/login-manager.png" width="550">
</div>
<br /><br />

# SDDM
dependencies
```bash
sudo pacman -S qt5-declarative qt5-quickcontrols2 qt5-graphicaleffects xdg-desktop-portal xdg-desktop-portal-gtk
```

copy sddm theme
```bash
sudo cp -r .system/sddm/themes/catppuccin-mocha /usr/share/sddm/themes/
sudo mkdir -p /etc/sddm.conf.d
sudo cp .system/sddm/sddm.conf.d/theme.conf.user /etc/sddm.conf.d
```

preview sddm
```bash
sddm-greeter --test-mode --theme /usr/share/sddm/themes/catppuccin-mocha/
```
