from runner import run_command, yay_install, pacman_install, home


PACMAN_PACKAGES = [
    "waybar",
    "wofi",
    "kitty",
    "fish",
    "fastfetch",
    "git",
    "firefox",
    "cava",
    "pavucontrol",
    "chromium",
    "hyprlock",
    "hypridle",
    "swww",
    "dunst",
    "swaync",
    "wl-clipboard",
    "brightnessctl",
    "cliphist",
    "papirus-icon-theme",
    "libnotify",
    "gobject-introspection",
    "glow",
    "less",
    "ninja",
    "curl",
    "base-devel",

    # file viewer/editor
    "imagemagick",
    "unzip",
    "p7zip",
    "tar",
    "libreoffice-fresh",
    "evince",
    "gimp",
    "mpv",
    "imv",

    "qt5-declarative",
    "qt5-quickcontrols2",
    "qt5-graphicaleffects",
    "xdg-desktop-portal",
    "xdg-desktop-portal-gtk",
]

YAY_PACKAGES = [
    "hyprshot",
    "catppuccin-gtk-theme-mocha",
    "bibata-cursor-theme",
    "walker",
    "appimagelauncher"
]


FONTS = [
    "ttf-jetbrains-mono",
    "ttf-jetbrains-mono-nerd",
    "noto-fonts-cjk",
    "noto-fonts",
    "noto-fonts-extra",
    "noto-fonts-emoji",
]



OTHER_SCRIPTS = [
    "curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/bin",
]


AUR_SCRIPTS = [
    f"git clone https://aur.archlinux.org/yay.git {home}/yay",
    f"cd {home}/yay",
    "makepkg -si",
    "cd",
    f"rm -rf {home}/yay",
]

def install(yay: bool = False, yay_packages: bool = False, oh_my_posh: bool = False) -> None:
    print("Installing main packages...")
    pacman_install(PACMAN_PACKAGES)
    pacman_install(FONTS)
    if yay:
        run_command(AUR_SCRIPTS, shell=True)
    if yay_packages:
        yay_install(YAY_PACKAGES)
    if oh_my_posh:
        run_command(OTHER_SCRIPTS, shell=True)
