import symlink_handler

# "May your symlinks always point in the right direction"

# This 2D tuple stores symlink pairs.
# Each tuple contains:
#  - Column 1: Source path (where the original file/config exists)
#  - Column 2: Target path (where the symlink will be created)
#  - Column 3: Boolean flag (True = replace existing target, False = keep it untouched)
# Essentially, column 3 answers: "Should the target path be replaced if it already exists?"
# "trash-cli" package is required for replacing the target file or directory
LINK_PAIRS = (
    ("$HOME/Dotfiles/dunst", "$HOME/.config/dunst", False),
    ("$HOME/Dotfiles/ghostty", "$HOME/.config/ghostty", False),
    ("$HOME/Dotfiles/hypr", "$HOME/.config/hypr", False),
    ("$HOME/Dotfiles/nvim", "$HOME/.config/nvim", False),
    ("$HOME/Dotfiles/rofi", "$HOME/.config/rofi", False),
    ("$HOME/Dotfiles/waybar", "$HOME/.config/waybar", False),
    ("$HOME/Dotfiles/yazi", "$HOME/.config/yazi", False),
)

# pass the LINK_PAIRS variable to this function to start creating symlink
symlink_handler.create(LINK_PAIRS)
