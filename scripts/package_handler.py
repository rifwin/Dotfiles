import os
import subprocess
from utils import text_red, text_blue

# TODO: implement automatic uninstall if the file is not on the list


# pacman packages utilities
def pacman_update():
    print(text_blue("Trying to update pacman packages:\n"))
    try:
        cmd = ["sudo", "pacman", "-Syu", "--noconfirm"]
        result = subprocess.run(
            cmd, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True
        )
        print(result.stdout)
    except subprocess.CalledProcessError as e:
        print(text_red("Failed to install packages:\n"), e.stderr)


def pacman_install(packages):
    print(text_blue("Trying to install pacman packages:\n"))
    print(f"{', '.join(packages)}\n")
    try:
        cmd = ["sudo", "pacman", "-S", "--noconfirm", "--needed"] + list(packages)
        result = subprocess.run(
            cmd, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True
        )
        print(result.stdout)
    except subprocess.CalledProcessError as e:
        print(text_red("Failed to install packages:\n"), e.stderr)


# flatpak packages utilities
def flatpak_update():
    print(text_blue("Trying to update flatpak packages:\n"))
    try:
        cmd = ["flatpak", "update", "--assumeyes"]
        result = subprocess.run(
            cmd, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True
        )
        print(result.stdout)
    except subprocess.CalledProcessError as e:
        print(text_red("Failed to install packages:\n"), e.stderr)


def flatpak_install(packages):
    print(text_blue("Trying to install flatpak packages:\n"))
    print(f"{', '.join(packages)}\n")
    try:
        cmd = [
            "flatpak",
            "install",
            "--assumeyes",
        ] + list(packages)
        result = subprocess.run(
            cmd, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True
        )
        print(result.stdout)
    except subprocess.CalledProcessError as e:
        print(text_red("Failed to install packages:\n"), e.stderr)


# this one for installing nodejs version manager (fnm)
# current fix for fnm appending multiple init script on .bashrc
# by skipping install fnm if its already installed
# TODO: implement uninstall script for fnm
def fnm_install():
    print(text_blue("Trying to install nodejs version manager (fnm):\n"))

    def install():
        try:
            run_curl = subprocess.run(
                ["curl", "-fsSL", "https://fnm.vercel.app/install"],
                check=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
            )
            run_bash = subprocess.run(
                ["bash"], input=run_curl.stdout, check=True, text=True
            )
            print(run_bash.stdout)
        except subprocess.CalledProcessError as e:
            print(text_red("Failed to install packages:\n"), e.stderr)

    fnm_dir = os.getenv("FNM_DIR")
    if fnm_dir:
        print(f"skipping fnm install, already installed on '{fnm_dir}'")
    else:
        install()
