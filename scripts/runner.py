import os
import subprocess


home = os.path.expanduser("~")

def run_command(command: list, shell: bool = False) -> None:
    """
    Run a shell command
    """
    subprocess.run(command, shell=shell)

def yay_install(packages: list) -> None:
    """
    Install packages from AUR
    """
    if packages:
        subprocess.run(["yay", "-S", "--noconfirm"] + packages)

def pacman_install(packages: list) -> None:
    """
    Install pacman packages
    """
    if packages:
        subprocess.run(["sudo", "pacman", "-S", "--noconfirm"] + packages)

def configure() -> None:
    for folder in os.listdir(".config"):
        command = [
            "cp",
            "-r",
            f".config/{folder}/*",
            f"{home}/.config/{folder}",
        ]
        run_command(command)

    command_sddm_theme = [
        "sudo",
        "cp",
        "-r",
        ".system/themes/*",
        "/usr/share/themes/",
    ]
    run_command(command_sddm_theme)

    run_command(["sudo", "mkdir", "/etc/sddm.conf.d"])
    command_sddm = [
        "sudo",
        "cp",
        "-r",
        ".system/sddm/sddm.conf.d/*",
        "/etc/sddm.conf.d/",
    ]
    run_command(command_sddm)
    run_command(["chsh", "-s", "/usr/bin/fish"])
