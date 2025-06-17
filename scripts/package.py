import package_handler

# Currently there is no way to do sync functionality like nix os 
# Maybe later (if I have time to do it)

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
    "tree-sitter",
    "ripgrep",
    "fd",
    # necessary package for hyprland
    "hyprland",
    "hyprpaper",
    "dunst",
    "waybar",
    "rofi",
    "xdg-desktop-portal-hyprland",
    "hyprpolkitagent",
    "qt5-wayland",
    "qt6-wayland",
    "hyprland-qt-support",
    "brightnessctl",
    "bc",
    "grim",
    "slurp",
    "obs-studio",
    "v4l2loopback-dkms"
)

# Flatpak package to install
FLATPAK_PACKAGES = (
    "com.discordapp.Discord",
    "com.mattjakeman.ExtensionManager",
    "org.onlyoffice.desktopeditors",
    "com.google.Chrome",
    "com.brave.Browser",
    "one.ablaze.floorp",
    "com.usebottles.bottles",
)

# run all install function
package_handler.pacman_update()
package_handler.pacman_install(PACMAN_PACKAGES)
package_handler.flatpak_update()
package_handler.flatpak_install(FLATPAK_PACKAGES)
package_handler.fnm_install()
