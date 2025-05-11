import symlink_handler
from pathlib import Path

# TODO: write an automated symlinking script


LINK_DATA = (
    ("$HOME/Dotfiles/ghostty", "$HOME/.config"),
    ("$HOME/Dotfiles/ghostty", "$HOME/.config"),
)

symlink_handler.create_symlink(LINK_DATA, True)
