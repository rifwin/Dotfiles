import package_handler

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
    "github-cli",
    "ruff",
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

# run all install function
package_handler.pacman_update()
package_handler.pacman_install(PACMAN_PACKAGES)
package_handler.flatpak_update()
package_handler.flatpak_install(FLATPAK_PACKAGES)
package_handler.fnm_install()

