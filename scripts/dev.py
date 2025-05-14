from runner import run_command, yay_install, pacman_install

PACMAN_PACKAGES = [
    "docker",
    "docker-compose",
    "elixir",
]

YAY_PACKAGES = [
    "python311",
]


OTHER_SCRIPTS = [
    "bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/master/utils/installer/install.sh)",
]

NVIM_INSTALL = [
    "wget https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz",
    "tar -xvf nvim-linux64.tar.gz",
    "sudo mv nvim-linux64 /opt/",
    "sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim",
]

def install(yay_packages: bool = False, neovim: bool = False, lunarvim: bool = False) -> None:
    print("Installing dev packages...")
    pacman_install(PACMAN_PACKAGES)
    if yay_packages:
        yay_install(YAY_PACKAGES)
    if neovim:
        run_command(NVIM_INSTALL, shell=True)
    if lunarvim:
        run_command(OTHER_SCRIPTS, shell=True)
