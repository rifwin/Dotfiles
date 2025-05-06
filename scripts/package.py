import subprocess 
from utils import text_red, text_green, text_yellow, text_blue

# TODO: implement automatic uninstall if the file is not on the list
# TODO: fnm installer still doing duplicate append on .bashrc init script
#       so try to find out how to fix it

# Pacman package to install
PACMAN_PACKAGES = (
    "noto-fonts",
    "noto-fonts-cjk",
    "noto-fonts-emoji",
    "ttf-noto-nerd",
    "otf-firamono-nerd",
    "ttf-go-nerd",
    "intel-media-driver",
    "nvidia-prime",
    "flatpak",
    "pacman-contrib",
    "man-db",
    "man-pages",
    "wl-clipboard",
    "neovim",
    "bluez",
    "bluez-utils",
    "bluetui",
    "gst-libav",
    "gst-plugins-bad",
    "gst-plugins-base",
    "gst-plugins-good",
    "gst-plugins-ugly",
    "vlc",
    "btop",
    "fastfetch",
    "inkscape",
    "gimp",
    "github-cli"
)

# Flatpak package to install
FLATPAK_PACKAGES = (
    "com.brave.Browser",
    "com.discordapp.Discord",
    "com.google.Chrome",
    "com.mattjakeman.ExtensionManager",
    "org.kde.kdenlive",
    "org.mozilla.firefox",
    "org.onlyoffice.desktopeditors",
)

# this one for installing nodejs version manager (fnm)
def fnm_install():
    print(text_blue("Trying to install nodejs version manager (fnm):\n"))
    try:
        run_curl = subprocess.run(
            ["curl", "-fsSL", "https://fnm.vercel.app/install"],
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        run_bash = subprocess.run(
            ["bash"],
            input=run_curl.stdout,  # Pipe curl output into bash
            check=True,
            text=True
        )
        print(run_bash.stdout)
    except subprocess.CalledProcessError as e:
        print(text_red("Failed to install packages:\n"), e.stderr)

# install pacman packages
def pacman_install(packages): 
    print(text_blue("Trying to install pacman packages:\n"))
    print(f"{", ".join(PACMAN_PACKAGES)}\n")
    try:
        cmd = [
            "sudo",
            "pacman",
            "-S",
            "--noconfirm",
            "--needed"
        ] + list(packages)
        result = subprocess.run(
            cmd,
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        print(result.stdout)
    except subprocess.CalledProcessError as e:
        print(text_red("Failed to install packages:\n"), e.stderr)

# install flatpak packages
def flatpak_install(packages):
    print(text_blue("Trying to install flatpak packages:\n"))
    print(f"{", ".join(FLATPAK_PACKAGES)}\n")
    try:
        cmd = [
            "flatpak",
            "install",
            "--assumeyes",
        ] + list(packages)
        result = subprocess.run(
            cmd,
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        print(result.stdout)
    except subprocess.CalledProcessError as e:
        print(text_red("Failed to install packages:\n"), e.stderr)

# run all install function
pacman_install(PACMAN_PACKAGES)
flatpak_install(FLATPAK_PACKAGES)
fnm_install()
