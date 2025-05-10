PACMAN_PACKAGES = [
    "waybar",
    "wofi",
    "docker",
    "kitty",
    "fish",
    "fastfetch",
    "neovim",
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
    "thunar",
    "wl-clipboard",
    "brightnessctl",
    "cliphist",
    "papirus-icon-theme",
    "libnotify",
    "gobject-introspection",
    "glow",
    "less",

    # file viewer/editor
    "imagemagick",
    "unzip",
    "p7zip",
    "tar",
    # "libreoffice-fresh", # optional
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
    "python311",
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
    "bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/master/utils/installer/install.sh)",
    "curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/bin",
]

print("Here are the packages you need to install:")
print("\n".join(PACMAN_PACKAGES))
print("\n".join(YAY_PACKAGES))
print("\n".join(FONTS))
print("\n".join(OTHER_SCRIPTS))
